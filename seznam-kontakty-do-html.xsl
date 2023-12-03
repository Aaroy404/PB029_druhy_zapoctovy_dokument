<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" encoding="UTF-8" indent="yes" doctype-public="-//W3C//DTD HTML 4.01//EN" doctype-system="http://www.w3.org/TR/html4/strict.dtd"/>
  
	<xsl:template match="/contacts">
		<html>
			<head>
				<meta http-equiv="Content-Language" content="cs"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta name="description" content="Seznam lidí s jejich kontaktními údaji."/>
				<meta name="keywords" content="seznam,kontakty,email,telefon,adresa,odkazy,poznámka"/>
				<style type="text/css">
					<![CDATA[
						body {
							min-width: 39em;
							margin: auto;
							padding: 0em 2em;
							background-color: #FFCC7F;
							font-family: sans-serif, serif;
							color: #000000;
						}
						#zahlavi {
							position: relative;
							top: 0em;
							min-width: 35em;
							max-width: 50em;
							height: 5em;
							margin: 0em auto;
							padding: 1em;
							background-color: #000000;
							color: #FFFFFF;
						}
						#obsah {
							position: relative;
							min-width: 35em;
							max-width: 52em;
							margin: 0em auto;
							padding: 1em 0em;
							background-color: #FFF3E0;
							color: #000000;
						}
						#text {
							padding: 0em 1em;
						}
						a {
							color: #807340;
						}
						a:hover {
							color: #FF6600;
						}
						h3 {
							margin: 0.5em 0em 0em 0em;
						}
                        .contact-background h3 {
							background-color: #FFF3E0;
							color: #000000;
						}
						.contact-name {
							background-color: #E6E1CF;
							color: #000000;
						}
                        .contact-background {
							margin: 0;
							padding: 0.5em 0.3em 0.3em 2em;
							list-style: none;
							background-color: #E6E1CF;
							color: #000000;
						}
						div.value {
							text-indent: 1.5em;
						}
						.label {
							font-style: italic;
						}
                        .email-type {
                            margin-left: 1em;
                        }
                        .email {
                            text-indent: 1em;
                        }
					]]>
				</style>
				<title>
					<xsl:value-of select="@title"/>
				</title>
			</head>
			<body>
				<div id="zahlavi">
					<h1>
						<xsl:value-of select="@title"/>
					</h1>
				</div>
				<div id="obsah">
					<div id="text">
                        <!-- Sort contacts by first name and last name -->
                        <xsl:apply-templates select="contact">
                            <xsl:sort select="first-name" order="ascending"/>
                            <xsl:sort select="last-name" order="ascending"/>
                        </xsl:apply-templates>
                    </div>
				</div>
			</body>
		</html>
	</xsl:template>
  
    <xsl:template match="contact">
        <div class="contact-background">
            <div>
                <strong>Name: </strong>
                <xsl:apply-templates select="first-name"/>
                <xsl:text> </xsl:text>
                <xsl:apply-templates select="last-name"/>
            </div>
            <ul>
                <li>
                    <Strong>Email: </Strong><br/>
                    <div class="email-type">
                        <xsl:if test="email[@type='work']">
                            <strong>Work:</strong>
                            <span class="email">
                                <xsl:apply-templates select="email[@type='work']"/>
                            </span>
                        </xsl:if>
                        <xsl:if test="email[@type='personal']">
                            <strong>Personal:</strong>
                            <span class="email">
                                <xsl:apply-templates select="email[@type='personal']"/>
                            </span>
                        </xsl:if>
                        <xsl:if test="email[@type='other']">
                            <strong>Other:</strong>
                            <span class="email">
                                <xsl:apply-templates select="email[@type='other']"/>
                            </span>
                        </xsl:if>
                        <xsl:if test="email[not(@type)]">
                            <strong>Unspecified:</strong>
                            <span class="email">
                                <xsl:apply-templates select="email[not(@type)]"/>
                            </span>
                        </xsl:if>
                    </div>
                </li>
                <li>
                    <strong>Phone: </strong> <br/>
                    <xsl:apply-templates select="phone"/>
                </li>
                <li>
                    <strong>Address: </strong> <br/>
                    <xsl:apply-templates select="address"/>
                </li>
                <li>
                    <strong>Note: </strong> <br/>
                    <xsl:apply-templates select="note"/>
                </li>
            </ul>
        </div>
    </xsl:template>
    <xsl:template match="first-name">
        <span class="contact-name">
            <xsl:value-of select="text()"/>
        </span>
    </xsl:template>
    <xsl:template match="last-name">
        <span class="contact-name">
            <xsl:value-of select="text()"/>
        </span>
    </xsl:template>
    <xsl:template match="email">
        <div>
            <xsl:value-of select="text()"/>
        </div>
    </xsl:template>
</xsl:transform>