require 'game'

describe Game do
  it 'word for guess if won' do
    game = Game.new('загадка')

    expect(game.status).to eq :in_progress

    game.next_step('з')
    game.next_step('а')
    game.next_step('г')
    game.next_step('д')
    game.next_step('к')

    expect(game.errors).to eq 0
    expect(game.status).to eq :won
  end

  it 'word for guess if lost' do
    game = Game.new('загадка')

    expect(game.status).to eq :in_progress

    game.next_step('щ')
    game.next_step('л')
    game.next_step('ж')
    game.next_step('с')
    game.next_step('ф')
    game.next_step('й')
    game.next_step('м')
    game.next_step('р')
    game.next_step('н')

    expect(game.errors).to eq 7
    expect(game.status).to eq :lost
  end
end

