Return-Path: <linuxppc-dev+bounces-3228-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8959C8E4D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 16:36:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq44m1C89z305n;
	Fri, 15 Nov 2024 02:36:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::228"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731598583;
	cv=none; b=RY6KqJIo5i5mrJYmj6v2YvyJ0X0dwHyMsxV4+maMZxN92eFaWkjLMeuy3KfGEnJtsNucpLGErAW8k6O/rVdrx+TLJ8kamzzMQojAx3PnBn6zeg7Rl2T/l2nvowKgpZJGSZYHT74gM+bGYZkZ7NxFkg5Gvhk8p4Zr4vb4nzVnAnATMOngREuTPPSD5CM+z0MfULVt/0957SnrPsZis/kddSqJe4ZWtwZV8yIzOf5nCpqLbJiFfAIuoYSoUnKZcX4k0zP0es2gri7JFI6uqDG0sCvuw0cke+I94Shg5hF+GyvQPLEi/MxgH04WaUg9FKP2KgB5960zlihrpVxXltwo7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731598583; c=relaxed/relaxed;
	bh=hnkEJJ7E36CR1k2VcdbDWHeTGRVqK5i6Dg1xeARjpMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hs3lRHsLnVW5PCjGfkHguM3T0gGXsEdKH54skHdPM0qEp7nC9AaVQp2h0DqEnRM4OFgFS7ke3vcXb8pPKfRCYZitJ0rpe8Yp1gyk7JlZTiR8cDFJCO5GzgEeOauf3UJDbOABX97T8Zd6sng6V6FdVD72Qi4zsbnfG0Tq+VdToOa4w21BBPwMH+w2LvaKKPLuSyu+Pspf/1xELnGI8wUu/Q9FxOrTN3ZgcUMCc1Hfe5PXEDKxyh26hCvQRdwc27Yuk5m68wB5kBRL8jZpDmd8lyV0yxaFXXUcoO51EaEufSmjBVi4l6Fi6O4fZX/ZZTUMY0aHyUUxSFgfrZYBqmyncg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=XF77Mkcy; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=XF77Mkcy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq44g6WHGz306S
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 02:36:19 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 415461BF204;
	Thu, 14 Nov 2024 15:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731598571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hnkEJJ7E36CR1k2VcdbDWHeTGRVqK5i6Dg1xeARjpMk=;
	b=XF77MkcyE+O5SW14/VffO1uGKkBCM2cVfa2ZSbZNWVs6X0tMeVCW/4uVrf3hl5m6RXoF5u
	+5N8xqvuThwyr4upKMrjnSUqL73ToBGuARWiBqhG4/gOHqYZC+AF2zwVxR/9IO28TkIKrM
	oTfXlnyAoQDBQ7G8sbrXX/rii5ASYirBUL2BRM1w+/K9Vpf3sGHzdB9QEpzFfwZ1LkyZIH
	NWA8bgoVC4kzXNfZ3m0q83d7L/wiw0aMBAKp23how4uQiUF73nSOyDSRsBOhtYYO8HiNFi
	Rl3SGQ34BkFGmw0p7ofczjzKSzSLXtfWxJ0eW9KQaD/VU4zcYrZHcaoBEH8G9Q==
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
Subject: [PATCH net-next v2 07/10] net: freescale: ucc_geth: Hardcode the preamble length to 7 bytes
Date: Thu, 14 Nov 2024 16:35:58 +0100
Message-ID: <20241114153603.307872-8-maxime.chevallier@bootlin.com>
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

The preamble length can be configured in ucc_geth, however it just
ends-up always being configured to 7 bytes, as nothing ever changes the
default value of 7.

Make that value the default value when the MACCFG2 register gets
initialized, and remove the code to configure that value altogether.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
V2: No changes

 drivers/net/ethernet/freescale/ucc_geth.c | 21 ---------------------
 drivers/net/ethernet/freescale/ucc_geth.h |  4 ++--
 2 files changed, 2 insertions(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
index 7db575a1e710..57e8f0718dc7 100644
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
index 2365b61c743a..dfb727327093 100644
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


