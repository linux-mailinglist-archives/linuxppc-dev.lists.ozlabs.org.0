Return-Path: <linuxppc-dev+bounces-759-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F58964B4A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 18:16:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wvmbh1MxNz2yx5;
	Fri, 30 Aug 2024 02:15:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.183.196
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724948144;
	cv=none; b=jNQQeP3MUEzMTAnsEHkutGfUSmTeQQyyZHve1YvRodEx6W5zdIVdQVF9c54XSL7r7ok0uHlqElw4ZmV5iUV0xWnc91l+FGQz1pEBubJMTdIKfzlnxwN3Lrgayq9uDftemXrAET15Di6FMryFewD7IlPlkEqOaEVW1YKCNYZ/RoPgKk+IZmBm35Owl7cpMx/4ASESs1eDzzQFo9FRrbp2NYkv838jGOznKP3StNaPLKuz/ccnptXTJxz63Tm/Hx7P1b5StzORd+x2tene96jKgFOzrAH7gVBMLQ3ixrJnyywEEv4ju92KDLI7wGvb1F2aZr30uIlxyyNOsGYggOd5vw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724948144; c=relaxed/relaxed;
	bh=8MKEkc5EO/LXIES8/Qm2dEPX2qGucKCXl9cBtclREN4=;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-GND-Sasl; b=V0V3Lzr0PfPKFLHx8LgY+GawVm2VdmVXoG7EyM16klQnSkslH1FnaonQDGL79apdmaexth/tZEScTIqYQoCR1sY0P5yRWPCX2RYZNA8M01ZmSAAmPSddhoL7meGAaOUihVpbPd0kFXLMhr9PKxcOu6m6mIfpupL85AbOWwZtJQ76ZlJ2i7lQX75JyiSG0zdfzS6uYOJwVb5vSaum6txm492t9Dgc4Sa8yhwde/oM0eAhb6S3sprRpNPRCsPVVfohZjJ67eCwazM0Xodk/P8wog86R7ETeoXwCskwk4pYuyZijSYrVbP4GB1FXSEtoutDwPlGcCkzciIixZEG1VXkgg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Ilbs706T; dkim-atps=neutral; spf=pass (client-ip=217.70.183.196; helo=relay4-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Ilbs706T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.196; helo=relay4-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wvmbg2kN4z2yyM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 02:15:42 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AABB3E000F;
	Thu, 29 Aug 2024 16:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724948140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8MKEkc5EO/LXIES8/Qm2dEPX2qGucKCXl9cBtclREN4=;
	b=Ilbs706TzjdYGz6ryznedrCwtoiVftgdSZMr2VwO/ssffUWIeZOLg4cQeabqCYHdc6B+JS
	fRxf/sll3YEvcYJNnQtub8xWqmBwkI9LMs7K2LzWm3Lag1IZ+RwAu8HPz4/3Dwl/UBE2h5
	j64T8H7daWB//xZDUBwvtzBbTyF3F1GNbUbsSjd26IRzEOigrxTwuRyIEcjx83a/3Pmbc7
	I+GML7j5IeU91u5QX3ZPUDoVoSUTCpZ/PfP7p9LGXIWtBkNLJvH3OkK0R2cK7d1txOwAam
	D13kELoxVzbHYbo6xPJee5XkLNmJP9mdlCJo7J4OnVypezbKOwknyHn5VAiyQg==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net,
	Pantelis Antoniou <pantelis.antoniou@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Horman <horms@kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH net-next v2 6/7] net: ethernet: fs_enet: simplify clock handling with devm accessors
Date: Thu, 29 Aug 2024 18:15:29 +0200
Message-ID: <20240829161531.610874-7-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240829161531.610874-1-maxime.chevallier@bootlin.com>
References: <20240829161531.610874-1-maxime.chevallier@bootlin.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com

devm_clock_get_enabled() can be used to simplify clock handling for the
PER register clock.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
- v2: new patch

 .../ethernet/freescale/fs_enet/fs_enet-main.c    | 16 ++++------------
 drivers/net/ethernet/freescale/fs_enet/fs_enet.h |  2 --
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
index caca81b3ccb6..372970326238 100644
--- a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
+++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
@@ -907,14 +907,9 @@ static int fs_enet_probe(struct platform_device *ofdev)
 	 * but require enable to succeed when a clock was specified/found,
 	 * keep a reference to the clock upon successful acquisition
 	 */
-	clk = devm_clk_get(&ofdev->dev, "per");
-	if (!IS_ERR(clk)) {
-		ret = clk_prepare_enable(clk);
-		if (ret)
-			goto out_deregister_fixed_link;
-
-		fpi->clk_per = clk;
-	}
+	clk = devm_clk_get_enabled(&ofdev->dev, "per");
+	if (IS_ERR(clk))
+		goto out_deregister_fixed_link;
 
 	privsize = sizeof(*fep) +
 		   sizeof(struct sk_buff **) *
@@ -924,7 +919,7 @@ static int fs_enet_probe(struct platform_device *ofdev)
 	ndev = alloc_etherdev(privsize);
 	if (!ndev) {
 		ret = -ENOMEM;
-		goto out_put;
+		goto out_deregister_fixed_link;
 	}
 
 	SET_NETDEV_DEV(ndev, &ofdev->dev);
@@ -986,8 +981,6 @@ static int fs_enet_probe(struct platform_device *ofdev)
 	fep->ops->cleanup_data(ndev);
 out_free_dev:
 	free_netdev(ndev);
-out_put:
-	clk_disable_unprepare(fpi->clk_per);
 out_deregister_fixed_link:
 	of_node_put(fpi->phy_node);
 	if (of_phy_is_fixed_link(ofdev->dev.of_node))
@@ -1008,7 +1001,6 @@ static void fs_enet_remove(struct platform_device *ofdev)
 	fep->ops->cleanup_data(ndev);
 	dev_set_drvdata(fep->dev, NULL);
 	of_node_put(fep->fpi->phy_node);
-	clk_disable_unprepare(fep->fpi->clk_per);
 	if (of_phy_is_fixed_link(ofdev->dev.of_node))
 		of_phy_deregister_fixed_link(ofdev->dev.of_node);
 	free_netdev(ndev);
diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet.h b/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
index 781f506c933c..cd2c7d1a7b2a 100644
--- a/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
+++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
@@ -120,8 +120,6 @@ struct fs_platform_info {
 	int napi_weight;	/* NAPI weight			*/
 
 	int use_rmii;		/* use RMII mode		*/
-
-	struct clk *clk_per;	/* 'per' clock for register access */
 };
 
 struct fs_enet_private {
-- 
2.45.2


