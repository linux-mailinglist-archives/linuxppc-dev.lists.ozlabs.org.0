Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD68148FF2D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jan 2022 22:38:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JcT0x3wTvz30LP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 08:38:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=waldekranz-com.20210112.gappssmtp.com header.i=@waldekranz-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=d1ha2+4c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=waldekranz.com (client-ip=2a00:1450:4864:20::32c;
 helo=mail-wm1-x32c.google.com; envelope-from=tobias@waldekranz.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=waldekranz-com.20210112.gappssmtp.com
 header.i=@waldekranz-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=d1ha2+4c; dkim-atps=neutral
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JcSWV1PPvz2xBl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jan 2022 08:16:05 +1100 (AEDT)
Received: by mail-wm1-x32c.google.com with SMTP id
 n19-20020a7bc5d3000000b003466ef16375so19843318wmk.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Jan 2022 13:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=waldekranz-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:organization:content-transfer-encoding;
 bh=PHk1aD/4El+ognxt4Ln9ghxHgBZDWsxupIrwsqWIzL0=;
 b=d1ha2+4cMc+x6oyVstELvpTRB1yu/umWD4RZCIZY/Q4RZhnCSOAcN8GmNAjE72Ajs/
 yFC1jKcFPgXT2ytcbLf7ES1xKcTQEfKIU7NsRa+YZoSjmHqETVezdLkKM6+wPv/9Uymj
 Y8LujmNoBzvlG0xO5xzjCtZNdh4vRy2O/tB+tVnXs1G5Rc8F8lYegJDnSVOYxcvTnNG0
 9hJxypntzwKpFEKCLLCS5rFbf+MxzQtkOGHAgRfW5Kyl9Ibt166bZRhmciq4kh8lIVcp
 /HDnSfUGHGDcChNXrgjH1VmNor/MFm1PQ5UYrhdqQrQ58U70ZyKHDJPQkstAYZi79Jx1
 ZmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:organization:content-transfer-encoding;
 bh=PHk1aD/4El+ognxt4Ln9ghxHgBZDWsxupIrwsqWIzL0=;
 b=tTVJEJbA2YSAMRShQwh26enhjgOQkyXjuJ4JsLJ9j98NcF920f2en5ew+TlkKKjCav
 LbwnGKJV1/XvFd7qQeJu3j+/1So66RR3bdvhrjLMecv1lGokt5Ind+EaWePC5cjNzkPt
 ss3ylDkeea5uJno5Cl16IrASOt9nnVbir1jGrkReDIBcXhvk8Dp20KWxdffa7eHmiA5p
 8d/QT1quDw7j5mBrg9fezNr0Hh+7nqfz/myg2+72HyIPBNTsx5IO8zM10tRsA+J8EgYu
 aLU9vxgNCSfU9fqsTmW4kGtR4GhLleRp+PGEt9me67b5geUG4KV/x5KWgZf4jTjHcpKf
 xhEg==
X-Gm-Message-State: AOAM532SdLEK/EW3x3ZbWHpSoX2OEx/H75j6YHdTIupZNmevQHRF5PJW
 jCaKiaRRMYGDXljebeDRAjkhCA==
X-Google-Smtp-Source: ABdhPJyMNUUF4jYuBp45XsHq3CgLjCrJdCwUWVN/OhCa1VZdb89n+IrValiv5eDAfuzUiaOp4P9c+Q==
X-Received: by 2002:a1c:f70f:: with SMTP id v15mr17157582wmh.117.1642367758317; 
 Sun, 16 Jan 2022 13:15:58 -0800 (PST)
Received: from veiron.westermo.com (static-193-12-47-89.cust.tele2.se.
 [193.12.47.89])
 by smtp.gmail.com with ESMTPSA id l12sm8820445wrz.15.2022.01.16.13.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 13:15:57 -0800 (PST)
From: Tobias Waldekranz <tobias@waldekranz.com>
To: davem@davemloft.net,
	kuba@kernel.org
Subject: [PATCH net 1/4] net/fsl: xgmac_mdio: Add workaround for erratum
 A-009885
Date: Sun, 16 Jan 2022 22:15:26 +0100
Message-Id: <20220116211529.25604-2-tobias@waldekranz.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220116211529.25604-1-tobias@waldekranz.com>
References: <20220116211529.25604-1-tobias@waldekranz.com>
MIME-Version: 1.0
Organization: Westermo
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 17 Jan 2022 08:35:45 +1100
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, madalin.bucur@nxp.com, robh+dt@kernel.org,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Once an MDIO read transaction is initiated, we must read back the data
register within 16 MDC cycles after the transaction completes. Outside
of this window, reads may return corrupt data.

Therefore, disable local interrupts in the critical section, to
maximize the probability that we can satisfy this requirement.

Signed-off-by: Tobias Waldekranz <tobias@waldekranz.com>
---
 drivers/net/ethernet/freescale/xgmac_mdio.c | 25 ++++++++++++++++-----
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/freescale/xgmac_mdio.c b/drivers/net/ethernet/freescale/xgmac_mdio.c
index 5b8b9bcf41a2..bf566ac3195b 100644
--- a/drivers/net/ethernet/freescale/xgmac_mdio.c
+++ b/drivers/net/ethernet/freescale/xgmac_mdio.c
@@ -51,6 +51,7 @@ struct tgec_mdio_controller {
 struct mdio_fsl_priv {
 	struct	tgec_mdio_controller __iomem *mdio_base;
 	bool	is_little_endian;
+	bool	has_a009885;
 	bool	has_a011043;
 };
 
@@ -186,10 +187,10 @@ static int xgmac_mdio_read(struct mii_bus *bus, int phy_id, int regnum)
 {
 	struct mdio_fsl_priv *priv = (struct mdio_fsl_priv *)bus->priv;
 	struct tgec_mdio_controller __iomem *regs = priv->mdio_base;
+	unsigned long flags;
 	uint16_t dev_addr;
 	uint32_t mdio_stat;
 	uint32_t mdio_ctl;
-	uint16_t value;
 	int ret;
 	bool endian = priv->is_little_endian;
 
@@ -221,12 +222,18 @@ static int xgmac_mdio_read(struct mii_bus *bus, int phy_id, int regnum)
 			return ret;
 	}
 
+	if (priv->has_a009885)
+		/* Once the operation completes, i.e. MDIO_STAT_BSY clears, we
+		 * must read back the data register within 16 MDC cycles.
+		 */
+		local_irq_save(flags);
+
 	/* Initiate the read */
 	xgmac_write32(mdio_ctl | MDIO_CTL_READ, &regs->mdio_ctl, endian);
 
 	ret = xgmac_wait_until_done(&bus->dev, regs, endian);
 	if (ret)
-		return ret;
+		goto irq_restore;
 
 	/* Return all Fs if nothing was there */
 	if ((xgmac_read32(&regs->mdio_stat, endian) & MDIO_STAT_RD_ER) &&
@@ -234,13 +241,17 @@ static int xgmac_mdio_read(struct mii_bus *bus, int phy_id, int regnum)
 		dev_dbg(&bus->dev,
 			"Error while reading PHY%d reg at %d.%hhu\n",
 			phy_id, dev_addr, regnum);
-		return 0xffff;
+		ret = 0xffff;
+	} else {
+		ret = xgmac_read32(&regs->mdio_data, endian) & 0xffff;
+		dev_dbg(&bus->dev, "read %04x\n", ret);
 	}
 
-	value = xgmac_read32(&regs->mdio_data, endian) & 0xffff;
-	dev_dbg(&bus->dev, "read %04x\n", value);
+irq_restore:
+	if (priv->has_a009885)
+		local_irq_restore(flags);
 
-	return value;
+	return ret;
 }
 
 static int xgmac_mdio_probe(struct platform_device *pdev)
@@ -287,6 +298,8 @@ static int xgmac_mdio_probe(struct platform_device *pdev)
 	priv->is_little_endian = device_property_read_bool(&pdev->dev,
 							   "little-endian");
 
+	priv->has_a009885 = device_property_read_bool(&pdev->dev,
+						      "fsl,erratum-a009885");
 	priv->has_a011043 = device_property_read_bool(&pdev->dev,
 						      "fsl,erratum-a011043");
 
-- 
2.25.1

