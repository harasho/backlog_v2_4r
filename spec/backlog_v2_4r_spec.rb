require 'spec_helper'

describe BacklogV24r do
  it 'has a version number' do
    expect(BacklogV24r::VERSION).not_to be nil
  end

  let(:ba) { BacklogApi.new(api_key: ENV["API_KEY"]) }

  describe "#space" do
    subject { ba.space }
    it "get space data" do
      expect(subject.key?("spaceKey")).to be_truthy
    end
  end

  describe "#projects" do
    subject { ba.projects }
    it "get projects data" do
      expect(subject[0].key?("id")).to be_truthy
      expect(subject[0].key?("projectKey")).to be_truthy
    end
  end

  describe "#issues" do
    context "simple searching" do
      let(:params) do
        id = ba.projects[0]["id"]
        { "projectId[]" => id, "count" => 2 }
      end

      subject { ba.issues(params) }
      it "get projects data" do
        expect(subject.size).to eq 2
        expect(subject[0].key?("id")).to be_truthy
        expect(subject[0].key?("issueKey")).to be_truthy
      end
    end

    context "with milestone ids" do
      let(:params2) do
        id = ba.projects[0]["id"]
        milestone_ids = [ ba.versions(id.to_s)[0]["id"], ba.versions(id.to_s)[1]["id"] ]
        { "projectId[]" => id, "milestoneId[]" => milestone_ids, "sort" => "created", "order" => "asc" }
      end
      subject { ba.issues(params2) }
      it "get projects data" do
        expect(subject[0].key?("id")).to be_truthy
        expect(subject[0].key?("issueKey")).to be_truthy
      end
    end

  end

  describe "#versions" do
    let(:id) do
      id = ba.projects[0]["id"]
    end
    subject { ba.versions(id.to_s) }
    it "get projects data" do
      expect(subject[0].key?("id")).to be_truthy
      expect(subject[0].key?("name")).to be_truthy
    end
  end
end
