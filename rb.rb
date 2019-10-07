#not sure why learn is not accepting these. If i run the program, I am
# returning the correct value. Need to compare.

require "pry"

def game_hash
  game_stats = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {player_name: "Alan Anderson",
        number:0,
        shoe:16,
        points:22,
        rebounds:12,
        assists:12,
        steals:3,
        blocks:1,
        slam_dunks:1
        },
        { player_name: "Reggie Evans",
            number:30,
            shoe:14,
            points:12,
            rebounds:12,
            assists:12,
            steals:12,
            blocks:12,
            slam_dunks:7
          },
          {player_name: "Brook Lopez",
              number:11,
              shoe:17,
              points:17,
              rebounds:19,
              assists:10,
              steals:3,
              blocks:1,
              slam_dunks:15
          },
          {player_name: "Mason Plumlee",
                number:1,
                shoe:19,
                points:26,
                rebounds:11,
                assists:6,
                steals:3,
                blocks:8,
                slam_dunks:5
          },
          {player_name: "Jason Terry",
                number:31,
                shoe:15,
                points:19,
                rebounds:2,
                assists:2,
                steals:4,
                blocks:11,
                slam_dunks:1
          }]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [{player_name: "Jeff Adrien",
      number:4,
      shoe:18,
      points:10,
      rebounds:1,
      assists:1,
      steals:2,
      blocks:7,
      slam_dunks:2
      },
      { player_name: "Bismack Biyombo",
          number:0,
          shoe:16,
          points:12,
          rebounds:4,
          assists:7,
          steals:22,
          blocks:15,
          slam_dunks:10
        },
        {player_name: "Desagna Diop",
            number:2,
            shoe:14,
            points:24,
            rebounds:12,
            assists:12,
            steals:4,
            blocks:5,
            slam_dunks:5
        },
        {player_name: "Ben Gordon",
              number:8,
              shoe:15,
              points:33,
              rebounds:3,
              assists:2,
              steals:1,
              blocks:1,
              slam_dunks:0
        },
        {player_name: "Kemba Walker",
              number:33,
              shoe:15,
              points:6,
              rebounds:12,
              assists:12,
              steals:7,
              blocks:5,
              slam_dunks:12
        }]
    }
  }
game_stats
end

game_hash

def home_team_name
  game_hash[:home][:players][1][:player_name]
end

puts home_team_name

def good_practices
  game_hash.each do |location, team_data|
     location # = :home, :away
     team_data # = All the other data
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    team_data.each do |attribute, data|
      attribute # = :team_name, :colors, :players
      data# = > the information inside :team_name, :color, :players
    end
  end
end

good_practices


def num_points_scored(name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      next unless attribute == :players
      data.each do |players|
        return p players[:points] if players[:player_name] == name
      end
    end
  end
end



def shoe_size(name)
  game_hash.each do |team, team_stats|
    team_stats.each do |attributes, data|
      next unless attributes == :players
      data.each do |players|
        return p players[:shoe] if players[:player_name] == name
      end
    end
  end
end




def team_colors(team_name)
  game_hash.each do |team, team_stats|
        return p team_stats[:colors] if team_stats[:team_name] == team_name
    end
end



def team_names
  new_array = []
  game_hash.each do |team, team_stats|
     new_array << team_stats[:team_name]
  end
  return p new_array
end



def player_numbers(teamname)
  jersey_numbers = []
  game_hash.each do |team, team_stats|
    next unless team_stats[:team_name] == teamname
     team_stats.each do |attributes, data|
       next unless attributes == :players
        data.each do |players|
         jersey_numbers << players[:number]
       end
    end
  end
  p jersey_numbers
end



def player_stats(name)
  game_hash.each do |team, team_stats|
    team_stats.each do |attributes, data|
      next unless attributes == :players
      data.each do |players|
        return p players.slice(:number, :shoe, :points, :rebounds, :assists, :steals, :blocks, :slam_dunks) if players[:player_name] == name
      end
    end
  end
end



def big_shoe_rebounds
  max = 0
  max_rebounds = 0
  game_hash.each do |team, team_stats|
   team_stats[:players].each do |players|
      if players[:shoe] > max
        max = players[:shoe]
        max_rebounds = players[:rebounds]
    end
   end
end
p max_rebounds
end






def most_points_scored
  max = 0
  game_hash.each do |team, team_stats|
   team_stats[:players].each do |players|
      players[:points] > max
        max = players[:points]
      end
    end
   end
   p max
end
