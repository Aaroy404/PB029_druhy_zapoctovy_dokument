<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" encoding="UTF-8" indent="yes" doctype-public="-//W3C//DTD HTML 4.01//EN" doctype-system="http://www.w3.org/TR/html4/strict.dtd"/>
  
	<xsl:template match="/contacts">
		<html>
			<head>
				<meta http-equiv="Content-Language" content="cs"/>
				<meta name="description" content="Seznam lidí s jejich kontaktními údaji."/>
				<meta name="keywords" content="seznam,kontakty,email,telefon,adresa,odkazy,poznámka"/>
				<style type="text/css">
					<![CDATA[
						body {
							min-width: 39em;
							margin: auto;
							padding: 0em 2em;
							background-color: #3F3BBA;
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
							background-color: #1DA5E5;
							color: #000000;
						}
						#text {
							padding: 0em 1em;
						}
						a {
							color: #2A5BE8;
						}
						a:hover {
							color: #FF6600;
						}
						.contact-name {
							background-color: #3AAFE6;
							color: #000000;
                            font-size: 1.2em;
                            font-weight: bold;
						}
                        .contact-background {
							margin: 0;
							padding: 0.5em 0.3em 0.3em 2em;
							list-style: none;
							background-color: #E0F9FA;
							color: #000000;
                            border: 3px solid #000;
                            border-bottom: 0px;
						}
                        .contact-background:last-child {
                            border-bottom: 3px solid #000;
                        }
						div.value {
							text-indent: 1.5em;
						}
						.label {
							font-style: italic;
						}
                        .basic-contact-header {
                            margin-left: 1em;
                        }
                        .basic-contact {
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
                        <xsl:choose>
                            <xsl:when test="contact">
                                <!-- Sort contacts by first name and last name -->
                                <xsl:apply-templates select="contact">
                                    <xsl:sort select="last-name" order="ascending"/>
                                    <xsl:sort select="first-name" order="ascending"/>
                                </xsl:apply-templates>
                            </xsl:when>
                            <xsl:otherwise>
                                <p>
                                    <strong>List is empty.</strong>
                                </p>
                            </xsl:otherwise>
                        </xsl:choose>
                    </div>
				</div>
			</body>
		</html>
	</xsl:template>
  
    <xsl:template match="contact">
        <div class="contact-background">
            <div>
                <span class="contact-name">
                    <xsl:apply-templates select="first-name"/>
                    <xsl:text> </xsl:text>
                    <xsl:apply-templates select="last-name"/>
                </span>
            </div>
            <ul>
                <xsl:if test="email">
                    <li>
                        <Strong>Email: </Strong><br/>
                        <div class="basic-contact-header">
                            <xsl:if test="email[@type='work']">
                                <strong>Work:</strong>
                                <span class="basic-contact">
                                    <xsl:apply-templates select="email[@type='work']"/>
                                </span>
                            </xsl:if>
                            <xsl:if test="email[@type='personal']">
                                <strong>Personal:</strong>
                                <span class="basic-contact">
                                    <xsl:apply-templates select="email[@type='personal']"/>
                                </span>
                            </xsl:if>
                            <xsl:if test="email[@type='other']">
                                <strong>Other:</strong>
                                <span class="basic-contact">
                                    <xsl:apply-templates select="email[@type='other']"/>
                                </span>
                            </xsl:if>
                            <xsl:if test="email[not(@type)]">
                                <strong>Unspecified:</strong>
                                <span class="basic-contact">
                                    <xsl:apply-templates select="email[not(@type)]"/>
                                </span>
                            </xsl:if>
                        </div>
                    </li>
                </xsl:if>
                <xsl:if test="phone">
                    <li>
                        <strong>Phone: </strong> <br/>
                        <div class="basic-contact-header">
                            <xsl:if test="phone[@type='work']">
                                <strong>Work:</strong>
                                <span class="basic-contact">
                                    <xsl:apply-templates select="phone[@type='work']"/>
                                </span>
                            </xsl:if>
                            <xsl:if test="phone[@type='personal']">
                                <strong>Personal:</strong>
                                <span class="basic-contact">
                                    <xsl:apply-templates select="phone[@type='personal']"/>
                                </span>
                            </xsl:if>
                            <xsl:if test="phone[@type='other']">
                                <strong>Other:</strong>
                                <span class="basic-contact">
                                    <xsl:apply-templates select="phone[@type='other']"/>
                                </span>
                            </xsl:if>
                            <xsl:if test="phone[not(@type)]">
                                <strong>Unspecified:</strong>
                                <span class="basic-contact">
                                    <xsl:apply-templates select="phone[not(@type)]"/>
                                </span>
                            </xsl:if>
                        </div>
                    </li>
                </xsl:if>
                <xsl:if test="url">
                    <li>
                        <strong>Url: </strong> <br/>
                        <div class="basic-contact-header">
                            <xsl:if test="url[@type='work']">
                                <strong>Work:</strong>
                                <span class="basic-contact">
                                    <xsl:apply-templates select="url[@type='work']"/>
                                </span>
                            </xsl:if>
                            <xsl:if test="url[@type='personal']">
                                <strong>Personal:</strong>
                                <span class="basic-contact">
                                    <xsl:apply-templates select="url[@type='personal']"/>
                                </span>
                            </xsl:if>
                            <xsl:if test="url[@type='other']">
                                <strong>Other:</strong>
                                <span class="basic-contact">
                                    <xsl:apply-templates select="url[@type='other']"/>
                                </span>
                            </xsl:if>
                            <xsl:if test="url[not(@type)]">
                                <strong>Unspecified:</strong>
                                <span class="basic-contact">
                                    <xsl:apply-templates select="url[not(@type)]"/>
                                </span>
                            </xsl:if>
                        </div>
                    </li>
                </xsl:if>
                <xsl:if test="other">
                    <li>
                        <strong>Other contacts: </strong>
                        <span class="basic-contact">
                            <xsl:apply-templates select="other"/>
                        </span>
                    </li>
                </xsl:if>
                <xsl:if test="address">
                    <li>
                        <strong>Address: </strong> <br/>
                        <span class="basic-contact">
                            <xsl:apply-templates select="address"/>
                        </span>
                    </li>
                </xsl:if>
                <xsl:if test="note">
                    <li>
                        <strong>Note: </strong> <br/>
                        <span class="basic-contact">
                            <xsl:apply-templates select="note"/>
                        </span>
                    </li>
                </xsl:if>
            </ul>
        </div>
    </xsl:template>
    <xsl:template match="first-name">
        <span>
            <xsl:value-of select="text()"/>
        </span>
    </xsl:template>
    <xsl:template match="last-name">
        <span>
            <xsl:value-of select="text()"/>
        </span>
    </xsl:template>
    <xsl:template match="email">
        <div>
            <a href="{mailto:text()}">
                <xsl:value-of select="text()"/>
            </a>
        </div>
    </xsl:template>
    <xsl:template match="phone">
        <div>
            <a href="tel:text()">
                <xsl:phone select="text()"/>
            </a>
        </div>
    </xsl:template>
    <xsl:template match="url">
        <div>
            <a href="{text()}">
                <xsl:value-of select="text()"/>
            </a>
        </div>
    </xsl:template>
    <xsl:template match="other">
        <div>
            <xsl:value-of select="service"/>
            <xsl:text>: </xsl:text>
            <xsl:value-of select="ID"/>
        </div>
    </xsl:template>
    <xsl:template match="address">
        <a href="https://maps.google.com/maps?q={street/text()},+{house-number/text()},+{city/text()},+{zip/text()}">
            <div>
                <xsl:value-of select="street/text()"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of select="house-number/text()"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of select="city/text()"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of select="zip/text()"/>
            </div>
        </a>
    </xsl:template>
    <xsl:template match="note">
        <div>
            <xsl:apply-templates select="line"/>
        </div>
    </xsl:template>
    <xsl:template match="line">
        <div>
            <xsl:value-of select="text()"/>
        </div>
    </xsl:template>
</xsl:transform>