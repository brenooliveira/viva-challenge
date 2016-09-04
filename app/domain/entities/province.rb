module Entity
  class Province

    def self.find(x, y)
      provinces = []

      provinces << 'Gode' if x.between?(0,600) && y.between?(500,1000)
      provinces << 'Ruja' if x.between?(400,1100) && y.between?(500,1000)
      provinces << 'Jaby' if x.between?(1100,1400) && y.between?(500,1000)
      provinces << 'Scavy' if x.between?(0,600) && y.between?(0,500)
      provinces << 'Groola' if x.between?(600,800) && y.between?(0,500)
      provinces << 'Nova' if x.between?(800,1400) && y.between?(0,500)
      provinces
    end

  end
end
