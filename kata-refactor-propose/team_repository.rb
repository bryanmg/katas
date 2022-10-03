
class TeamRepository
  class << self
    # TEAMS is our fake database values
    TEAMS = {
      "1" => { total_collabs: 10, seniors: 2, mids: 3, juniors: 5},
      "2" => { total_collabs: 20, seniors: 4, mids: 6, juniors: 10}
    }

    def find_all_collaborators(id)
      # Team.find_by(id:).collaborators # Find real info in databse
      Array.new(TEAMS[id][:total_collabs])
    end
    
    def find_all_junior_collaborators(id)
      # Team.find_by(id:).collaborators.where(seniority: "JUNIOR")
      Array.new(TEAMS[id][:juniors])
    end
    
    def find_all_middle_collaborators(id)
      # Team.find_by(id:).collaborators.where(seniority: "MIDDLE")
      Array.new(TEAMS[id][:mids])
    end
    
    def find_all_senior_collaborators(id)
      # Team.find_by(id:).collaborators.where(seniority: "SENIOR")
      Array.new(TEAMS[id][:seniors])
    end
  end
end