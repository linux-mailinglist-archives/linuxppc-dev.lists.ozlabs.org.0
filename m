Return-Path: <linuxppc-dev+bounces-3227-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D22C9C8E4C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 16:36:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq44l6d3Nz30J8;
	Fri, 15 Nov 2024 02:36:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::228"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731598583;
	cv=none; b=ocf1DDvDmQEt4opHjhUY3Lqxp9YQCepBdf4bC4zKolif0qXINbGQ+yq7k/SiOQA+Un1KDKWf1NauoIa9u0GD8NpwgDqMzR546fFsONlwisC/gsdSg0FM+B23bGSB35Kyt2lw1ek3gclGFo9pweFGexHFopHhGEVimfW83qvLFcOIU8AlRRDm3RI2+hOL70q4+imYkldCuPQqjYT0vzSZu3zD+bUBV3WI8TNEBsnNIGzNqjitnA1x0ote9ej61NQoLF7eaZ/C2xgkfUwwi4lxVvTm9GBM5fT1yuI4CiW99hS2oD5LQZys40QTuc0962/PbSKwmt3bM2/uo4XGiDxL7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731598583; c=relaxed/relaxed;
	bh=unLNMvXwm+4Ey2QBvMpwyWlJW/nP417xwtjjmRzD8A0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jwyd4h0oL1hltEmh0qT0MKoPm5nNtdJrJtu5TNyX9GiBUNLBpL+Bp3KPj5718Dnl7jIo9h/hqpR9TSfvUH9HSPX4WdF0t5S5blpPNsFQvkbxv0G3mo3XBDdR3Qiat7pg33WBfquupk5FcE0yqhxinuulQdfQGWnR5/hDBSz9o6Sxxfco4YMCvi9cUBHlObEk86wzVLJh3Eh6Q/a1lIaPZKPZftq57cVSDw9BmivCcXfl0jysHbu1q98LSqYBCygIVHVfmeU798AE+V+sgF6lO+8LW/c9qT6lkLvl5FiDStQzhLZNqdmGaR62Q1N841HvWwtIRGClnmE4RM5pvYjh1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=dYQZoJ8G; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=dYQZoJ8G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq44g6BlLz303d
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 02:36:19 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 522F21BF20C;
	Thu, 14 Nov 2024 15:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731598571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=unLNMvXwm+4Ey2QBvMpwyWlJW/nP417xwtjjmRzD8A0=;
	b=dYQZoJ8GizsCRQNeeh7mP0iuOKIpX2vWhjKhzP9R6JubF51/zwWoT/X8B5NRZJexKLoB63
	oR1xrOQgwS+A8Y3E1kzfk0LfZV1CWj/r6OVHE6e/LCMo6QxstbMcjUR93kJx9FJ053kQh8
	9ti8pcUIhV8NKnr2+3gHNjSPEBFt5oe/DX3iqnfjUuFn+57hrfrsx4R+bl1p6wBkJbACFi
	STgplV/jJP5uQkweqQIqtt0tU3tuc8QlnHn5dQbMIPLebL8kx9qkii0cBqjqURksVIpggF
	28RjUYmWhPoivm+a42rka9XyXE44yRJxVgp7bok3hAcS77xFQrEJHpcB0ku0Kw==
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
Subject: [PATCH net-next v2 06/10] net: freescale: ucc_geth: Simplify frame length check
Date: Thu, 14 Nov 2024 16:35:57 +0100
Message-ID: <20241114153603.307872-7-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114153603.307872-1-maxime.chevallier@bootlin.com>
References: <20241114153603.307872-1-maxime.chevallier@bootlin.com>
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
V2: No changes

 drivers/net/ethernet/freescale/ucc_geth.c | 21 +++------------------
 drivers/net/ethernet/freescale/ucc_geth.h |  1 -
 2 files changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
index 42254ee64a35..7db575a1e710 100644
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


