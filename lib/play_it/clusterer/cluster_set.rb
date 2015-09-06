module PlayIt
  module Clusterer
    class ClusterSet
      attr_reader :clusters

      ##
      # Creates a new set of clusters.
      #
      def initialize
        @clusters = []
      end

      ##
      # Adds the new cluster +cluster+ to the set.
      #
      # @param [Cluster] the new cluster that will be added.
      #
      def add(cluster)
        fail(ArgumentError) unless cluster.is_a? Cluster
        @clusters << cluster
      end

      ##
      # Returns the cluster at +index+.
      #
      # @param [Integer] the index of the cluster.
      #
      # @return [Cluster] the cluster of the given +index+ or nil.
      def get_cluster(index)
        clusters[index]
      end

      ##
      # Returns the number of elements of this cluster set.
      #
      # @return [Integer] the number of elements.
      def size
        clusters.size
      end
    end
  end
end
