Return-Path: <linuxppc-dev+bounces-2997-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3719C0C99
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 18:10:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkpV72p9Yz3bnV;
	Fri,  8 Nov 2024 04:10:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.178.240
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730999407;
	cv=none; b=ohxsMFdByLt3QEXtau4YcHHCfCsaaSaGWEXcXr1Frr70c7yKuLE256ZNGWpPlkqhhfe2ll+ajUVpWBBBn+oMy0HKmDexsigW+GvZtL7b8LCGoDZsBl5H/C/3tsbaTHjQTq6cVdOnaxs0z8dNXCa9404i19e24YBTWN3/lTwfgBiwXO5P01IKiTk0yeWi1ZkSeiPubuUD4cAUTyX659PW/UtNEtTyjCkqQRwDwdan3nzVFqFBomHoakbzM6LMl6/vKO3nqnRI6GPZ1c4GqToPqrjMcuiMBuHl0d9r2utzxv9DvCPAoNUctld+fWauFZUkbhSQehRo00ESmodlosispg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730999407; c=relaxed/relaxed;
	bh=LcmFNs2UjHF2seWXnbhiKrx6T4lA+AWcoBvcBEDQo4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZfeglA4ti29gbNxJIxxlOFyyBXoKqo9GG6uRgiWGJcRA5aSBNlNdRIGbUursnzRVjCZtgPAVqmZlqkNvN2rlcz+GygT0wfT7BYdva9hdyG9m4Rx8zblmKIYwJYVsDd0SfYTwZSp0Ed8uznmW4AbIHekyoAsgxNLDXuONAO4jHql1MB85SGPWiHjIHnLvmq+ixNE3kZF8I3ZL2E/i1V2hoDzql7sGnMu6vIQ+1Y+wm2BcptVd6LXpHsuE9oGhqt7kZ1PrYXOzysmfHoo7RV0jWEp7/L4aLutmcfUmmTjfifGJAJcjluae947rqF+4EAxxPDCzqv1tTZKKAsBqydIhPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=gL7HIIkf; dkim-atps=neutral; spf=pass (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=gL7HIIkf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkpV55vNsz3brd
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 04:10:05 +1100 (AEDT)
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id A7EF1C38F4
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 17:03:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AA182240006;
	Thu,  7 Nov 2024 17:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730998989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LcmFNs2UjHF2seWXnbhiKrx6T4lA+AWcoBvcBEDQo4w=;
	b=gL7HIIkf64DmSq12+2fZFwZNq2BuXb2hWXy3wfx626EcLpbIHw2+ffkNpb6lrLaAA46qtN
	Cf88txgGVeSsJvPXfh+obTv5d7Zre8jDI99hzOzQDAVqoyz3efyAhRxnmtYKDFv5Cd4p4J
	aAmnGxxD5FSTCDTPENFiPIN8JyO2sM+wiRG+/b+qFknMj1BeyC0kZyS6UthuDm3j642vMz
	lEplHQtL7cISPkSx9K8IaLhlGe8Uv5ECbC3xa2GZP4Z+cVuSJCp87Eg2+DgVobbbCneQrP
	HhPDX+9JxyXsU8TWvIhrDZimjelafml3mAatiRIW4YYP0A5LvyBLHrf6u8RmLA==
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
Subject: [PATCH net-next 6/7] net: freescale: ucc_geth: Hardcode the preamble length to 7 bytes
Date: Thu,  7 Nov 2024 18:02:53 +0100
Message-ID: <20241107170255.1058124-7-maxime.chevallier@bootlin.com>
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

The preamble length can be configured in ucc_geth, however it just
ends-up always being configured to 7 bytes, as nothing ever changes the
default value of 7.

Make that value the default value when the MACCFG2 register gets
initialized, and remove the code to configure that value altogether.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/freescale/ucc_geth.c | 21 ---------------------
 drivers/net/ethernet/freescale/ucc_geth.h |  4 ++--
 2 files changed, 2 insertions(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
index 052f06d6f312..0ec4ea95ad6d 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.c
+++ b/drivers/net/ethernet/freescale/ucc_geth.c
@@ -132,7 +132,6 @@ static const struct ucc_geth_info ugeth_primary_info = {
 	.transmitFlowControl = 1,
 	.maxGroupAddrInHash = 4,
 	.maxIndAddrInHash = 4,
-	.prel = 7,
 	.maxFrameLength = 1518+16, /* Add extra bytes for VLANs etc. */
 	.minFrameLength = 64,
 	.maxD1Length = 1520+16, /* Add extra bytes for VLANs etc. */
@@ -1205,18 +1204,6 @@ static int init_mac_station_addr_regs(u8 address_byte_0,
 	return 0;
 }
 
-static int init_preamble_length(u8 preamble_length,
-				u32 __iomem *maccfg2_register)
-{
-	if ((preamble_length < 3) || (preamble_length > 7))
-		return -EINVAL;
-
-	clrsetbits_be32(maccfg2_register, MACCFG2_PREL_MASK,
-			preamble_length << MACCFG2_PREL_SHIFT);
-
-	return 0;
-}
-
 static int init_rx_parameters(int reject_broadcast,
 			      int receive_short_frames,
 			      int promiscuous, u32 __iomem *upsmr_register)
@@ -1276,7 +1263,6 @@ static int adjust_enet_interface(struct ucc_geth_private *ugeth)
 	struct ucc_geth_info *ug_info;
 	struct ucc_geth __iomem *ug_regs;
 	struct ucc_fast __iomem *uf_regs;
-	int ret_val;
 	u32 upsmr, maccfg2;
 	u16 value;
 
@@ -1352,13 +1338,6 @@ static int adjust_enet_interface(struct ucc_geth_private *ugeth)
 		put_device(&tbiphy->mdio.dev);
 	}
 
-	ret_val = init_preamble_length(ug_info->prel, &ug_regs->maccfg2);
-	if (ret_val != 0) {
-		if (netif_msg_probe(ugeth))
-			pr_err("Preamble length must be between 3 and 7 inclusive\n");
-		return ret_val;
-	}
-
 	return 0;
 }
 
diff --git a/drivers/net/ethernet/freescale/ucc_geth.h b/drivers/net/ethernet/freescale/ucc_geth.h
index 11e490398f18..42fbbdf14ff2 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.h
+++ b/drivers/net/ethernet/freescale/ucc_geth.h
@@ -921,7 +921,8 @@ struct ucc_geth_hardware_statistics {
 #define UCC_GETH_UPSMR_INIT                     UCC_GETH_UPSMR_RES1
 
 #define UCC_GETH_MACCFG1_INIT                   0
-#define UCC_GETH_MACCFG2_INIT                   (MACCFG2_RESERVED_1)
+#define UCC_GETH_MACCFG2_INIT                   (MACCFG2_RESERVED_1 | \
+						 (7 << MACCFG2_PREL_SHIFT))
 
 /* Ethernet Address Type. */
 enum enet_addr_type {
@@ -1113,7 +1114,6 @@ struct ucc_geth_info {
 	int transmitFlowControl;
 	u8 maxGroupAddrInHash;
 	u8 maxIndAddrInHash;
-	u8 prel;
 	u16 maxFrameLength;
 	u16 minFrameLength;
 	u16 maxD1Length;
-- 
2.47.0


