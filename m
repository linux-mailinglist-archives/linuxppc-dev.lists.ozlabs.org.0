Return-Path: <linuxppc-dev+bounces-3712-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF999E1C73
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 13:43:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2gLg1WtKz309k;
	Tue,  3 Dec 2024 23:43:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::224"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733229819;
	cv=none; b=MLG/i3AYkwzw/vQ5tMC8MWJK0A6nfne32Kmny8yYdgqp/e5BHJ15ag5AeNUGLsqjibYg3rW0iJVr5dV+ctQdvk8neNZxMfloHT6m8MEaSuDxpxAixOwiJemnZXDpcyrOU0KMTX7zdv8rAoATTrrVAdb4SLn6PQEZh4MAr7KeJsfjJ6YoUBYAXsE8oVyg3LcuVwTXijK325uZYK56916wZrHO1ebal0vfFCSgdfc2p2tl4oWtpq3NTgDtmuNYkglBBHZBPzoS0ppTAd1CSbGEaMOdHBhqpPJHTcPUSUNmuZp7kBiMy4rk6Ytqh1wvofE6jdNm/Abk3F25I7CEtKMzUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733229819; c=relaxed/relaxed;
	bh=S4jtv70JZFareVSA2moO66l/3Wmr2zcyshlukvQQ/Ys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HptB/m/VoQarrymrLWIQNEJaAVcWepi+aHTxmb5JtAuCprkn3G5tBYOKh5YHI6t+ZuLDZN2y3W+PweVheGI+6aqvG247P71047XJGCJe59iYy4wPSK7IvumeNWwvb3mcl+1I+k/jaiOyZO8PJ8U3+oTuLybrbhHUlvbgqmo5V0cVkyAnUuDlag7DVpV6vPS1zUhLtPrl0O7M4L4Lx+qE2ye93/a7UzI7NjLfveD4t1cYalKn94j8SaB2f5SsOuTMzJzU4h6jkojwfxrEGHiJs9Xf/X+LB0caRcFwefIE6QNftunmOOxdhkr5XUAdHPm0PJqgoVlyj70wak48MO4bdQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=H5MDgasx; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::224; helo=relay4-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=H5MDgasx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::224; helo=relay4-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2gLc2Vd5z304Z
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 23:43:35 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E6C5E000F;
	Tue,  3 Dec 2024 12:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733229812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S4jtv70JZFareVSA2moO66l/3Wmr2zcyshlukvQQ/Ys=;
	b=H5MDgasxrw8jk3RGKLZus1Tc+kBOTcK7GGRwwyKyEIajs6uUUQevTG3jiY8no6MbCT7vFS
	Ry88CYQxO8wtPsQ9Z+cdsUi/EZ7LlIEOIExhCsjp7TlJHUm8lUKxMToCrbIeluA6DnlzEB
	SgkiwmidSmlljMWDDb3MAjIbLfCgbqXRn/ueXXOcOqXa3jPUC5tkwebHfOn8GT8dHZoiAv
	c7GR/t9Sp1Klea5lPv13cIm/1CB51ojh6eUw40DiGm4pt9yiL1nq5Ku6+uoJzA0s9ScGKB
	FOUhD0PUKk3owfUA9uQarW9mjSDG55IdhFa7p1ktje1J9qBG5Ily21Mk6ao2+A==
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
	Simon Horman <horms@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH net-next v3 06/10] net: freescale: ucc_geth: Simplify frame length check
Date: Tue,  3 Dec 2024 13:43:17 +0100
Message-ID: <20241203124323.155866-7-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241203124323.155866-1-maxime.chevallier@bootlin.com>
References: <20241203124323.155866-1-maxime.chevallier@bootlin.com>
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

The frame length check is configured when the phy interface is setup.
However, it's configured according to an internal flag that is always
false. So, just make so that we disable the relevant bit in the MACCFG2
register upon accessing it for other MAC configuration operations.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
V3: No changes

 drivers/net/ethernet/freescale/ucc_geth.c | 21 +++------------------
 drivers/net/ethernet/freescale/ucc_geth.h |  1 -
 2 files changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
index 587bcbc079da..566f53e24d28 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.c
+++ b/drivers/net/ethernet/freescale/ucc_geth.c
@@ -1205,22 +1205,6 @@ static int init_mac_station_addr_regs(u8 address_byte_0,
 	return 0;
 }
 
-static int init_check_frame_length_mode(int length_check,
-					u32 __iomem *maccfg2_register)
-{
-	u32 value = 0;
-
-	value = in_be32(maccfg2_register);
-
-	if (length_check)
-		value |= MACCFG2_LC;
-	else
-		value &= ~MACCFG2_LC;
-
-	out_be32(maccfg2_register, value);
-	return 0;
-}
-
 static int init_preamble_length(u8 preamble_length,
 				u32 __iomem *maccfg2_register)
 {
@@ -1304,6 +1288,9 @@ static int adjust_enet_interface(struct ucc_geth_private *ugeth)
 
 	/*                    Set MACCFG2                    */
 	maccfg2 = in_be32(&ug_regs->maccfg2);
+
+	/* Disable frame length check */
+	maccfg2 &= ~MACCFG2_LC;
 	maccfg2 &= ~MACCFG2_INTERFACE_MODE_MASK;
 	if ((ugeth->max_speed == SPEED_10) ||
 	    (ugeth->max_speed == SPEED_100))
@@ -1365,8 +1352,6 @@ static int adjust_enet_interface(struct ucc_geth_private *ugeth)
 		put_device(&tbiphy->mdio.dev);
 	}
 
-	init_check_frame_length_mode(ug_info->lengthCheckRx, &ug_regs->maccfg2);
-
 	ret_val = init_preamble_length(ug_info->prel, &ug_regs->maccfg2);
 	if (ret_val != 0) {
 		if (netif_msg_probe(ugeth))
diff --git a/drivers/net/ethernet/freescale/ucc_geth.h b/drivers/net/ethernet/freescale/ucc_geth.h
index 60fd804a616a..2365b61c743a 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.h
+++ b/drivers/net/ethernet/freescale/ucc_geth.h
@@ -1088,7 +1088,6 @@ struct ucc_geth_info {
 	u8 miminumInterFrameGapEnforcement;
 	u8 backToBackInterFrameGap;
 	int ipAddressAlignment;
-	int lengthCheckRx;
 	u32 mblinterval;
 	u16 nortsrbytetime;
 	u8 fracsiz;
-- 
2.47.0


