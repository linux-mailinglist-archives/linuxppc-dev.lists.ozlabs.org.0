Return-Path: <linuxppc-dev+bounces-2993-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBD59C0C8D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 18:10:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkpV418rnz3br2;
	Fri,  8 Nov 2024 04:10:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.178.240
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730999404;
	cv=none; b=Sea0hPy/BWz1AtCehGc0zH8W4xY7KOVm+cKc/DXCuKe7B18oXuuxiLCQifOK3e3agh/WLnwVqxF5/iW5lwXquFPt43EvsGgDAv8HbxbDs7Kr9xci/vgPHuXOViElH2WDrkedBcbfKXmLfSWfNOJ0TH09Hwdz+8oLNxFXFyPlJPAwUNM0SKZ1bQk2BgE5q8YjpeqeSe7XBHzdlnFAgUbSGlJp6XWLDu8Ra8woh+Q6H3PKSv1Nl7UDD5QTA6tnooZjRN5AgbKV/6TRh+Aykw+4oE1XIR0rRMmJKuokl+2WPpMqTHiWL3xRq6OnvE/ZD0FZdWnDPKtFYha7cE1CS9b+Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730999404; c=relaxed/relaxed;
	bh=ieXv3A9kxi1oiDoWVCrTOD/LdxKXt/5GSXMVPC2fY/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o12bQlzI6dAP5R12NWXiIZ+roAB1G1nHW3P5I3JsozKQLJsmjInYuVZTbaiwoOoJNMsOxzoB8SmSNe7OWi2Owu/C/F3wgmUGloe17Yqk9+lF4LDi4XZ4yMIxOrvW7Tuennwte46ciQt9pl9oVQI5OjcKsCPMQrTH/N8EY3YNSTlu4ngamcVqXspmtOyQXC2VyZH+GWQVTxlFlA52oygBvOfqF9qXxXjmkXdNr3pv73LH1SUsQdtMQCEoQ687e4MGSuYmcLc7H3kh9gbq3EIrfDB5EW5lA8vJPXFMp5pZ8Ey5feqspndvi2b4eY38Zl2gY48pSPOhTGUE2q6dfaD0xA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=onUeVimL; dkim-atps=neutral; spf=pass (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=onUeVimL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkpTz04Ygz3bpG
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 04:09:57 +1100 (AEDT)
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 05A8FC3284
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 17:03:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DA5CF24000F;
	Thu,  7 Nov 2024 17:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730998988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ieXv3A9kxi1oiDoWVCrTOD/LdxKXt/5GSXMVPC2fY/Q=;
	b=onUeVimLn8ullBgTFXI7baXvAnAAGSkhEmAY8tektIzmNlAMO6JAFQz8uGqrO0bRCTRgAZ
	j6MMuSTh2LjyYUcgPV8IlUorg2+tnJ3uP2CL6PKmhG8zuG2Jw1Wuvp9NObSlQP/5fjZE82
	INPQvnNlWZ0eEW2mfK2aiBdtCln1iol5W03mZ1cyQgQaiKLp56I1KfHTzMapyopiKqFjfG
	Joyy0vdhg7bebRqKGEFzYdUgwLBBle+cMMe9GtTsIvkLw7flwkBe7xtMdfSKT1gqoBrlaW
	BY7n1tYhqm+Z0MpR5L079xYvA/g8YtnKvrrV8+m0066lKzt9ZbWX3/+HtqMg/A==
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
Subject: [PATCH net-next 5/7] net: freescale: ucc_geth: Simplify frame length check
Date: Thu,  7 Nov 2024 18:02:52 +0100
Message-ID: <20241107170255.1058124-6-maxime.chevallier@bootlin.com>
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

The frame length check is configured when the phy interface is setup.
However, it's configured according to an internal flag that is always
false. So, just make so that we disable the relevant bit in the MACCFG2
register upon accessing it for other MAC configuration operations.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/freescale/ucc_geth.c | 21 +++------------------
 drivers/net/ethernet/freescale/ucc_geth.h |  1 -
 2 files changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
index 13b8f8401c81..052f06d6f312 100644
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
index c08a56b7c9fe..11e490398f18 100644
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


