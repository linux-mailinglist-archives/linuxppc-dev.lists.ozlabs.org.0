Return-Path: <linuxppc-dev+bounces-1005-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8FD96C52A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 19:19:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzTjV3rz3z2yqB;
	Thu,  5 Sep 2024 03:18:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::228"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725470318;
	cv=none; b=NDNgwOv+vX4Ytlo9M0jU0fU4qxTgkIR/j5s1nCC4R9N+L/LcwVW4Sa8EtCKsDkGIMTJ29Fh6tzINFY5bQw31xBin3jz5BfrcTZgZxhs3mzLsmMltFYfO2frA+9MSno34J3xxpCH2otrhdc0WH2uviDZ2TR7eG3xKG7kNsSkZeti5UFJn0+oW3gcPJS1vKJHekrYtyvZLBBdZw7vHJLIOqqpSd0ega0aTMsFiek7skhYTlkPsBhMu87GQCR96oHOXa7RSu3kO7IqCBUlExhvgJBrpSeACo/X+R1UQ6KKH9N4l2rfp3xC/hYdtU87rUKv002FCvk432CHIx7BBFCTOaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725470318; c=relaxed/relaxed;
	bh=0kGq3499FtlBClmzbPXpk3ZXJBn56yooNXdhMBe0V80=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version; b=XmjrntcLqhr3rdDX7Cj8Fi57nP8Eed5V1Cj2qHOBfPnC6pfVoJ4giPEl1h1irnNpgyX1N713a46IetQcidQtWLcVZ96bieTX4uCnTalBopd/QftWK1fQJzV1iBGe4vI6FaelzP7BHHDebPRQ3iJD/GeTSsnDiZnY4S84ZnhMx/E3h9rvhtXh7Xvu32a+Z5g/fxXiTd8kwxmIY9t1EoLVK1YPabcd3vO5C1EtaHuh7qHq6epCq/iC0orvH10j0pOaj4yg8vd3neTyTumpuD8NUEGeE8pI4g19IBRldeKLTtAaQ+aJbt7n8z12GKwROov83KOfMUeWVo2lQjmpKBBIAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=H9HXXRE6; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=H9HXXRE6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzTjT4rRcz2yfm
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 03:18:37 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D29B1BF20C;
	Wed,  4 Sep 2024 17:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725470311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0kGq3499FtlBClmzbPXpk3ZXJBn56yooNXdhMBe0V80=;
	b=H9HXXRE6dBQd93wIULJuyRW9j/G4me/9hMba+GAOzBYwVihWR8xecoivAtWhgGx0TP5yMj
	xtHVpqxO8HyXzuFpH+5eWI+Y58RiySnQtF2avwp0aQ3Qy1u1hGFcqyoaS/ljwmX6yCOB2M
	5UqUPYUcBXxi3c2Zs/JwYWw4d/8cyZP4O4mUJlCHABg55So+aKI+HDe62CZ8gZyqW8qxMb
	HTbvHYnAIz1LB1v5vqwbQNX11I38VCMHnW8Q8kF2dcEZaBtm/jbc+/XZdfnfHQ8WWCN6hE
	hQ2I8ryv8BVYng7TCsKZLC5h/mD+93KOweyzgMgk9arBzIaUNpMV6aqTienCmg==
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
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH net-next v3 7/8] net: ethernet: fs_enet: simplify clock handling with devm accessors
Date: Wed,  4 Sep 2024 19:18:20 +0200
Message-ID: <20240904171822.64652-8-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240904171822.64652-1-maxime.chevallier@bootlin.com>
References: <20240904171822.64652-1-maxime.chevallier@bootlin.com>
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

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 .../ethernet/freescale/fs_enet/fs_enet-main.c    | 16 ++++------------
 drivers/net/ethernet/freescale/fs_enet/fs_enet.h |  2 --
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
index c96a6b9e1445..ec43b71c0eba 100644
--- a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
+++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
@@ -900,14 +900,9 @@ static int fs_enet_probe(struct platform_device *ofdev)
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
@@ -917,7 +912,7 @@ static int fs_enet_probe(struct platform_device *ofdev)
 	ndev = alloc_etherdev(privsize);
 	if (!ndev) {
 		ret = -ENOMEM;
-		goto out_put;
+		goto out_deregister_fixed_link;
 	}
 
 	SET_NETDEV_DEV(ndev, &ofdev->dev);
@@ -979,8 +974,6 @@ static int fs_enet_probe(struct platform_device *ofdev)
 	fep->ops->cleanup_data(ndev);
 out_free_dev:
 	free_netdev(ndev);
-out_put:
-	clk_disable_unprepare(fpi->clk_per);
 out_deregister_fixed_link:
 	of_node_put(fpi->phy_node);
 	if (of_phy_is_fixed_link(ofdev->dev.of_node))
@@ -1001,7 +994,6 @@ static void fs_enet_remove(struct platform_device *ofdev)
 	fep->ops->cleanup_data(ndev);
 	dev_set_drvdata(fep->dev, NULL);
 	of_node_put(fep->fpi->phy_node);
-	clk_disable_unprepare(fep->fpi->clk_per);
 	if (of_phy_is_fixed_link(ofdev->dev.of_node))
 		of_phy_deregister_fixed_link(ofdev->dev.of_node);
 	free_netdev(ndev);
diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet.h b/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
index ee49749a3202..6ebb1b4404c7 100644
--- a/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
+++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
@@ -119,8 +119,6 @@ struct fs_platform_info {
 	int napi_weight;	/* NAPI weight			*/
 
 	int use_rmii;		/* use RMII mode		*/
-
-	struct clk *clk_per;	/* 'per' clock for register access */
 };
 
 struct fs_enet_private {
-- 
2.46.0


