Return-Path: <linuxppc-dev+bounces-3720-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 435909E1C85
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 13:44:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2gLm584Wz304Z;
	Tue,  3 Dec 2024 23:43:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::224"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733229824;
	cv=none; b=EfgsJpPWToLmFt913p8LCiF7x8DXBHqMnA4cAG0z0TQvJ+GWa8j0o11mi1EF+Mb7StsqVKiV5a7u8yJk64+zw355FuGPEqhvcDCANKT6OiYjCrm4QGt4j2wEs1ZAtVDASxkLLABLsGqvhMbBR2uH/aUzplTchDgNGaxhMybuApK1FdrfI9XHrgRbuuRMEuHQKW2YldUSFQQPxhT97MO3XRBtP6dObGJnaPTDNmjBjr+VFBBvk3ws0jWlCWrRVqefkeAnhLdcknG+qg9UHP8/DmjP2X/J7u/DEqcmKhbX8hbuJfMOE5/zDcLPcHRUN7bLkMptkKBK3i768JnTsUFT9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733229824; c=relaxed/relaxed;
	bh=youLhIgqVVWm97WdCjhC+2nlqSD1XPFSr1JMUVJC8KQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jnJlQmPrn+YyKSETZOZ1iK4GxSVQttF2x/IguellBnm5TAvdylrEJMza6QUfQ8/DT5WwcCLqlDkrmjP468CXEHHgyJ24dyiAWbVvglTFF+D9cxUmSZWZFZJMRPxXnA4b+ZgG/aDGvWDJQ8GgXJrd3tXve/KVJSo6UhKbneJJimu7ke9ACSfStlx4s6L6YQnXtHM0PyXfOuKVTxOC8+9YQ1tbHUU2wOv2nT3MD5eNdCZkyGkMVRNQqgQgROng5t4dK3eMC1WO/1CzyAZWJgWXj4qRwhbZ3kIHm/VsO5Z3vktChkiKg52VKrlLAIDn00jjBAK8iQ9gSHIGA6XRPCkN4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Xhnea8KK; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::224; helo=relay4-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Xhnea8KK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::224; helo=relay4-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2gLk5YT6z30PF
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 23:43:42 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3FCB4E0015;
	Tue,  3 Dec 2024 12:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733229816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=youLhIgqVVWm97WdCjhC+2nlqSD1XPFSr1JMUVJC8KQ=;
	b=Xhnea8KKsAYC9LqskJbsGK9P5/cBO/Sx3DuSFKSJvSbUVrZ3raABIqPBmfg6tvXeVlkgeN
	db33qTDcapDqez8YWMuCBOiU8gPr8Pw+b/AX1HCGlHN4yay/SkFCU9evAgWme1UC7H0Mk5
	y0v+iQgO7aZwHgjUEaAWhSQi9sVccRQgwAPUivaHGQ7EQZRM+V52LZ4zEuPZna5JlDIbQL
	yK0+K51mAMHJb1rLzEfn7s/DPygEGqQGNfsD66G6xJ3ZPPbGecdHXt2QI3DSdUTPm5ERwb
	GGwoVWDHF2xleX4TXx7nZvhULg6RdHKulWAEvDBTJzFlQebKf/EZa72KklVu2A==
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
Subject: [PATCH net-next v3 09/10] net: freescale: ucc_geth: Introduce a helper to check Reduced modes
Date: Tue,  3 Dec 2024 13:43:20 +0100
Message-ID: <20241203124323.155866-10-maxime.chevallier@bootlin.com>
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

A number of parallel MII interfaces also exist in a "Reduced" mode,
usually with higher clock rates and fewer data lines, to ease the
hardware design. This is what the 'R' stands for in RGMII, RMII, RTBI,
RXAUI, etc.

The UCC Geth controller has a special configuration bit that needs to be
set when the MII mode is one of the supported reduced modes.

Add a local helper for that.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
V3: No changes

 drivers/net/ethernet/freescale/ucc_geth.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
index f6dd36dc03fe..57debcba124c 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.c
+++ b/drivers/net/ethernet/freescale/ucc_geth.c
@@ -1258,6 +1258,13 @@ static int init_min_frame_len(u16 min_frame_length,
 	return 0;
 }
 
+static bool phy_interface_mode_is_reduced(phy_interface_t interface)
+{
+	return phy_interface_mode_is_rgmii(interface) ||
+	       interface == PHY_INTERFACE_MODE_RMII ||
+	       interface == PHY_INTERFACE_MODE_RTBI;
+}
+
 static int adjust_enet_interface(struct ucc_geth_private *ugeth)
 {
 	struct ucc_geth_info *ug_info;
@@ -1290,12 +1297,7 @@ static int adjust_enet_interface(struct ucc_geth_private *ugeth)
 	upsmr = in_be32(&uf_regs->upsmr);
 	upsmr &= ~(UCC_GETH_UPSMR_RPM | UCC_GETH_UPSMR_R10M |
 		   UCC_GETH_UPSMR_TBIM | UCC_GETH_UPSMR_RMM);
-	if ((ugeth->phy_interface == PHY_INTERFACE_MODE_RMII) ||
-	    (ugeth->phy_interface == PHY_INTERFACE_MODE_RGMII) ||
-	    (ugeth->phy_interface == PHY_INTERFACE_MODE_RGMII_ID) ||
-	    (ugeth->phy_interface == PHY_INTERFACE_MODE_RGMII_RXID) ||
-	    (ugeth->phy_interface == PHY_INTERFACE_MODE_RGMII_TXID) ||
-	    (ugeth->phy_interface == PHY_INTERFACE_MODE_RTBI)) {
+	if (phy_interface_mode_is_reduced(ugeth->phy_interface)) {
 		if (ugeth->phy_interface != PHY_INTERFACE_MODE_RMII)
 			upsmr |= UCC_GETH_UPSMR_RPM;
 		switch (ugeth->max_speed) {
@@ -1594,9 +1596,7 @@ static void ugeth_link_up(struct ucc_geth_private *ugeth,
 				    ~(MACCFG2_INTERFACE_MODE_MASK)) |
 				    MACCFG2_INTERFACE_MODE_NIBBLE);
 			/* if reduced mode, re-set UPSMR.R10M */
-			if (interface == PHY_INTERFACE_MODE_RMII ||
-			    phy_interface_mode_is_rgmii(interface) ||
-			    interface == PHY_INTERFACE_MODE_RTBI) {
+			if (phy_interface_mode_is_reduced(interface)) {
 				if (speed == SPEED_10)
 					upsmr |= UCC_GETH_UPSMR_R10M;
 				else
-- 
2.47.0


