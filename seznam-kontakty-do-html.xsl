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
							background-color: #72D1FD;
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
                            margin-left: 2em;
                            text-indent: 1em;
                        }
                        h4 {
                            display: block;
                            font-size: 1.2em;
                            font-weight: bold;
                            margin: 0;
                            padding: 0;
                        }
                        h5 {
                            display: block;
                            font-size: 1em;
                            font-weight: bold;
                            margin: 0;
                            padding: 0;
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
                                <h4>Contact list is empty.</h4>
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
                        <h4>Email:</h4>
                        <div class="basic-contact-header">
                            <xsl:if test="email[@type='work']">
                                <h5>Work:</h5>
                                    <xsl:apply-templates select="email[@type='work']"/>
                            </xsl:if>
                            <xsl:if test="email[@type='personal']">
                                <h5>Personal:</h5>
                                    <xsl:apply-templates select="email[@type='personal']"/>
                            </xsl:if>
                            <xsl:if test="email[@type='other']">
                                <h5>Other:</h5>
                                    <xsl:apply-templates select="email[@type='other']"/>
                            </xsl:if>
                            <xsl:if test="email[not(@type)]">
                                <h5>Unspecified:</h5>
                                    <xsl:apply-templates select="email[not(@type)]"/>
                            </xsl:if>
                        </div>
                    </li>
                </xsl:if>
                <xsl:if test="phone">
                    <li>
                        <h4>Phone: </h4>
                        <div class="basic-contact-header">
                            <xsl:if test="phone[@type='work']">
                                <h5>Work:</h5>
                                    <xsl:apply-templates select="phone[@type='work']"/>
                            </xsl:if>
                            <xsl:if test="phone[@type='personal']">
                                <h5>Personal:</h5>
                                    <xsl:apply-templates select="phone[@type='personal']"/>
                            </xsl:if>
                            <xsl:if test="phone[@type='other']">
                                <h5>Other:</h5>
                                    <xsl:apply-templates select="phone[@type='other']"/>
                            </xsl:if>
                            <xsl:if test="phone[not(@type)]">
                                <h5>Unspecified:</h5>
                                    <xsl:apply-templates select="phone[not(@type)]"/>
                            </xsl:if>
                        </div>
                    </li>
                </xsl:if>
                <xsl:if test="url">
                    <li>
                        <h4>Url: </h4>
                        <div class="basic-contact-header">
                            <xsl:if test="url[@type='work']">
                                <h5>Work:</h5>
                                    <xsl:apply-templates select="url[@type='work']"/>
                            </xsl:if>
                            <xsl:if test="url[@type='personal']">
                                <h5>Personal:</h5>
                                    <xsl:apply-templates select="url[@type='personal']"/>
                            </xsl:if>
                            <xsl:if test="url[@type='other']">
                                <h5>Other:</h5>
                                    <xsl:apply-templates select="url[@type='other']"/>
                            </xsl:if>
                            <xsl:if test="url[not(@type)]">
                                <h5>Unspecified:</h5>
                                    <xsl:apply-templates select="url[not(@type)]"/>
                            </xsl:if>
                        </div>
                    </li>
                </xsl:if>
                <xsl:if test="other">
                    <li>
                        <h4>Other contacts: </h4>
                            <xsl:apply-templates select="other"/>
                    </li>
                </xsl:if>
                <xsl:if test="address">
                    <li>
                        <h4>Address: </h4>
                            <xsl:apply-templates select="address"/>
                    </li>
                </xsl:if>
                <xsl:if test="note">
                    <li>
                        <h4>Note: </h4>
                            <xsl:apply-templates select="note"/>
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
        <span class="basic-contact">
            <a href="mailto:{text()}">
                <xsl:value-of select="text()"/>
            </a><br/>
        </span>
    </xsl:template>
    <xsl:template match="phone">
        <span class="basic-contact">
            <a href="tel:{text()}">
                <xsl:value-of select="text()"/>
            </a><br/>
        </span>
    </xsl:template>
    <xsl:template match="url">
        <span class="basic-contact">
            <a href="{text()}">
                <xsl:value-of select="text()"/>
            </a><br/>
        </span>
    </xsl:template>
    <xsl:template match="other">
        <span class="basic-contact">
            <xsl:value-of select="service"/>
            <xsl:text>: </xsl:text>
            <xsl:value-of select="ID"/>
            <br/>
        </span>
    </xsl:template>
    <xsl:template match="address">
        <span class="basic-contact">
            <a href="https://maps.google.com/maps?q={street/text()},+{house-number/text()},+{city/text()},+{zip/text()}">
                    <xsl:value-of select="street/text()"/>
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="house-number/text()"/>
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="city/text()"/>
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="zip/text()"/>
            </a><br/>
        </span>
    </xsl:template>
    <xsl:template match="note">
        <xsl:apply-templates select="line"/>
        <xsl:if test="position() &lt; last()">
            <span class="basic-contact">
                <xsl:text>-----------------------------------</xsl:text>
                <br/>
            </span>
        </xsl:if>
    </xsl:template>
    <xsl:template match="line">
        <span class="basic-contact">
            <xsl:value-of select="text()"/><br/>
        </span>
    </xsl:template>
</xsl:transform>