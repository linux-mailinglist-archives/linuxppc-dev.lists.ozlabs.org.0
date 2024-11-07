Return-Path: <linuxppc-dev+bounces-2995-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A949C0C95
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 18:10:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkpV51btHz3bnc;
	Fri,  8 Nov 2024 04:10:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.178.240
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730999405;
	cv=none; b=XDpSuR4JHaEiyLjIKTPKrNk/V08lzLSyiqN7eUv/FNXXWMoWqHkUTkyOTeQo6LfDmngFYFev/VgrFWoiUQ7Wy0QGxi9BCVxjyaNGLVHmBLwScbd68Nm1TetbOVOZhoh2KXluEMOYbtKKXCHYByC3zHD67wrGDIc5oM9RK4+vKR9GrcqhH9GsK+U5wvoZG3UYpgSasmp33VsUvlQbnx7CkL95n0EiYLSIu9HVeUD1NDJEWKy9tgAwz75JnkYrTftnOtE4iZYOxmfZAcc27aOt8r5dYRsePLnWt3pu01ZCDMSgjv8zviMro1NReq2LpDHge9aeioiQiBOxYIz7dxF0Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730999405; c=relaxed/relaxed;
	bh=uXjeOGEfwlZxyQoPcMkiNsCpu7ZxRvk/qfDkU5pXhUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n8XqHI9iHpshOtvNhK8DuR0vjpgTuPynMxLFr+PFSiOITRWTGOtVHKBDnNCq+x2d06Br/q93V2IVgPwBcdJvjvnfv2q/Glx3ofmV/gGFOV7jeVqldj3rs07KDmbwRNx77K1M7942C99il9/Qya8EyJ5oonA0FCehO3Co1GZ3TkDbxktwyvcA2NWc448AqwCgUkmNTgPN+RUvdFI54YCRF5wH2Ca0rJPzMksB2g3NebsFZ9q0vFsMJdwwZgGXLij1l0WSBrwFafVGWE5LiZakKr0GwDbcZ/X1Acshre6Sb5J/uj5ChgwTgEBJq65b3wEN+0tK2WCAlb/Qu6MsXTT/lg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ao6//r6v; dkim-atps=neutral; spf=pass (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ao6//r6v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkpV35VDnz3bqp
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 04:10:03 +1100 (AEDT)
Received: from relay1-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::221])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 0D0ABC38F1
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 17:03:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1CF86240004;
	Thu,  7 Nov 2024 17:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730998987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uXjeOGEfwlZxyQoPcMkiNsCpu7ZxRvk/qfDkU5pXhUU=;
	b=ao6//r6v97GKdpzLtdyw8Zbvh+05CE/S7S5u+jnoF7tbqoCmSKw4K5XP7a/Ax5Z88NNXRp
	SBzNk3p4U1gpuAdz5q8/IaSDREbaL0ocKxJHtZvcQEyDb42R1L3av/Ch2E+UAIlxsAELMW
	K4WE6T5yxgtB/Z+9ToZeLrlQwYmeJy61td/WzOM/3fFE2FZlLuKxzyOc8IAxTC5SIxV+1I
	pOZQ65S40Ac0Bj+DkDJKvWxI+eOhlTnKCSLMKNwahfskwJX3EN8+k4T1ejQraPyvptzy8a
	boZWSIPfQ/2F57N6rzvrLgA6Yjyl7YX6l6KxDJVi5+vchMp2SqqlkUX3XHa8yw==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	Herve Codina <herve.codina@bootlin.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH net-next 4/7] net: freescale: ucc_geth: Fix WOL configuration
Date: Thu,  7 Nov 2024 18:02:51 +0100
Message-ID: <20241107170255.1058124-5-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241107170255.1058124-1-maxime.chevallier@bootlin.com>
References: <20241107170255.1058124-1-maxime.chevallier@bootlin.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The get/set_wol ethtool ops rely on querying the PHY for its WoL
capabilities, checking for the presence of a PHY and a PHY interrupts
isn't enough. Address that by cleaning up the WoL configuration
sequence.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 .../net/ethernet/freescale/ucc_geth_ethtool.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/freescale/ucc_geth_ethtool.c b/drivers/net/ethernet/freescale/ucc_geth_ethtool.c
index fb5254d7d1ba..2a085f8f34b2 100644
--- a/drivers/net/ethernet/freescale/ucc_geth_ethtool.c
+++ b/drivers/net/ethernet/freescale/ucc_geth_ethtool.c
@@ -346,26 +346,37 @@ static void uec_get_wol(struct net_device *netdev, struct ethtool_wolinfo *wol)
 	struct ucc_geth_private *ugeth = netdev_priv(netdev);
 	struct phy_device *phydev = netdev->phydev;
 
-	if (phydev && phydev->irq)
-		wol->supported |= WAKE_PHY;
+	wol->supported = 0;
+	wol->wolopts = 0;
+
+	if (phydev)
+		phy_ethtool_get_wol(phydev, wol);
+
 	if (qe_alive_during_sleep())
 		wol->supported |= WAKE_MAGIC;
 
-	wol->wolopts = ugeth->wol_en;
+	wol->wolopts |= ugeth->wol_en;
 }
 
 static int uec_set_wol(struct net_device *netdev, struct ethtool_wolinfo *wol)
 {
 	struct ucc_geth_private *ugeth = netdev_priv(netdev);
 	struct phy_device *phydev = netdev->phydev;
+	int ret = 0;
 
 	if (wol->wolopts & ~(WAKE_PHY | WAKE_MAGIC))
 		return -EINVAL;
-	else if (wol->wolopts & WAKE_PHY && (!phydev || !phydev->irq))
+	else if ((wol->wolopts & WAKE_PHY) && !phydev)
 		return -EINVAL;
 	else if (wol->wolopts & WAKE_MAGIC && !qe_alive_during_sleep())
 		return -EINVAL;
 
+	if (wol->wolopts & WAKE_PHY)
+		ret = phy_ethtool_set_wol(phydev, wol);
+
+	if (ret)
+		return ret;
+
 	ugeth->wol_en = wol->wolopts;
 	device_set_wakeup_enable(&netdev->dev, ugeth->wol_en);
 
-- 
2.47.0


