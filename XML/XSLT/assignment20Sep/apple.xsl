<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Group products by category -->
  <xsl:template match="/products">
    <xsl:copy>
      <xsl:for-each-group select="product[quantity >= 10]" group-by="category">
        <category>
          <xsl:attribute name="name">
            <xsl:value-of select="current-grouping-key()" />
          </xsl:attribute>
          <!-- Sort products by price in descending order -->
          <xsl:for-each select="current-group()">
            <xsl:sort select="price" order="descending" />
            <product>
              <!-- Transform productname into an attribute -->
              <xsl:attribute name="productname">
                <xsl:value-of select="productname" />
              </xsl:attribute>
              <xsl:copy-of select="category" />
              <xsl:copy-of select="price" />
              <xsl:copy-of select="quantity" />
              <!-- Calculate and add total-price element -->
              <total-price>
                <xsl:value-of select="price * quantity" />
              </total-price>
            </product>
          </xsl:for-each>
        </category>
      </xsl:for-each-group>
    </xsl:copy>
  </xsl:template>

  <!-- Identity template to copy other elements as-is -->
  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()" />
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
