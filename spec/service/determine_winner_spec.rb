require 'rails_helper'

describe DetermineWinner do
  subject(:winner) { described_class.call(player_tool:, curb_tool:) }

  let(:rock) { create(:rock) }
  let(:paper) { create(:paper) }
  let(:scissors) { create(:scissors) }

  before do
    rock.update!(tools_that_this_can_beat: [scissors])
    paper.update!(tools_that_this_can_beat: [rock])
    scissors.update!(tools_that_this_can_beat: [paper])
  end

  context 'when the player chooses rock' do
    let(:player_tool) { rock }
    context 'when curb chooses rock' do
      let(:curb_tool) { rock }

      it 'is a tie' do
        expect(winner).to eq('tie')
      end
    end
    context 'when curb chooses paper' do
      let(:curb_tool) { paper }

      it 'curb wins' do
        expect(winner).to eq('curb')
      end
    end
    context 'when curb chooses scissors' do
      let(:curb_tool) { scissors }

      it 'player wins' do
        expect(winner).to eq('player')
      end
    end
  end

  context 'when the player chooses paper' do
    let(:player_tool) { paper }
    context 'when curb chooses rock' do
      let(:curb_tool) { rock }

      it 'player wins' do
        expect(winner).to eq('player')
      end
    end
    context 'when curb chooses paper' do
      let(:curb_tool) { paper }

      it 'is a tie' do
        expect(winner).to eq('tie')
      end
    end
    context 'when curb chooses scissors' do
      let(:curb_tool) { scissors }

      it 'curb wins' do
        expect(winner).to eq('curb')
      end
    end
  end

  context 'when the player chooses scissors' do
    let(:player_tool) { scissors }
    context 'when curb chooses rock' do
      let(:curb_tool) { rock }

      it 'curb wins' do
        expect(winner).to eq('curb')
      end
    end
    context 'when curb chooses paper' do
      let(:curb_tool) { paper }

      it 'player wins' do
        expect(winner).to eq('player')
      end
    end
    context 'when curb chooses scissors' do
      let(:curb_tool) { scissors }

      it 'is a tie' do
        expect(winner).to eq('tie')
      end
    end
  end
end
