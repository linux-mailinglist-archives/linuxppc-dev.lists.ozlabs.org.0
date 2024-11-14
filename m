Return-Path: <linuxppc-dev+bounces-3226-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC379C8E49
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 16:36:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq44l2Rn6z304C;
	Fri, 15 Nov 2024 02:36:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::228"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731598583;
	cv=none; b=L35NhEfQgfVl5s5zbVx7N9OiMC1imaY6Mpx3yrr5IRA02Ja061MeQyF8/FGPv9GBUNbCtffa8ZCYX9+59fvFvWnB+zVewZUZ6f7BTj7OUZDvn38macksyprHzRfuI8935nhgqFmXFByI/Y/tBkgiCKm7niVX8uwIM4Iqf8R2FajjXUPOwHCKgZNMyJDow8xVfaNtREiuEuNXSJ9PTh6eD+8lMTgQjDT4yvs50Tq52Quu08uYhpq8I9PPQhGKfz9cKgzDaevKYd1xp/1xFrdZGag1pZjyPZVBJ/Ep8OH6gyRthmLNYJk5t99oOtxLKQ0BB9h5DRTddqb2hZ7xAhG2YA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731598583; c=relaxed/relaxed;
	bh=VD8/1+T7I2KYJ8+l7lEvgJb4z9DYRhu4yhGy99MnF/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KjuXYp1o2ha10T+L3u+ShIQXwrE4sH20dfXWJFJ6auv5jQcJ36MdYPnYoNsEr4Smj8piNTGZFyzOItMibFdkO7pRQFF+QsLidUQFYb1RfkZH39dffomNg/Pi6LbvGuPUKvdhf0u07WMqqyy6GA5TPccW8rFf2uwe5L4UT5eLDWYMCLduNz10ykC4NcrvuXepmUH3AZ3b8KJMKisErUoD79jXue8tYRWAeaiXD2XjhVGZmqQhzB1XRXi11r+AtmWqwqCvTb/PiW3ATpHdkaz9fWFL32wTUcCD2ALzvWIZpp0tcZOHsWdSJ7c/LiWPhenE44smLqd+8SgxJ6wkfsk86Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=W+67YXOF; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=W+67YXOF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq44g6TsTz305n
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 02:36:19 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D47D81BF214;
	Thu, 14 Nov 2024 15:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731598573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VD8/1+T7I2KYJ8+l7lEvgJb4z9DYRhu4yhGy99MnF/0=;
	b=W+67YXOFfNvngolUaEvMFYOYRinl6enMqD5OqOmjXIWHHFOzdBmjrwrUBNQmp7wUJLYcMe
	F5M+Wf3jWW8MMfYQjcXkIS8EkCg0MvR3z/SbGct+UkK/ctnFz3duQeXPvAWcOhhydmiuSq
	DTc0gYfpubMHuJqpvt2ZkdbgLABoUDOzeLkM3Hc3PFJXyeaHTljLX2CpWk7jKeyviKYxzr
	sJouP0/UqDuz9GeM2ReV6PsBpk5o75QQT+gRJSbCW46OHuyj+8YboIecRaVUb0kFfhHJMo
	ORH0CkWRXITnbTEzk9KwX4sht1y4nAFOS9ufbG29hGiLdVDyySx1gWgm3/OTzg==
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
Subject: [PATCH net-next v2 09/10] net: freescale: ucc_geth: Introduce a helper to check Reduced modes
Date: Thu, 14 Nov 2024 16:36:00 +0100
Message-ID: <20241114153603.307872-10-maxime.chevallier@bootlin.com>
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

A number of parallel MII interfaces also exist in a "Reduced" mode,
usually with higher clock rates and fewer data lines, to ease the
hardware design. This is what the 'R' stands for in RGMII, RMII, RTBI,
RXAUI, etc.

The UCC Geth controller has a special configuration bit that needs to be
set when the MII mode is one of the supported reduced modes.

Add a local helper for that.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
V2: New patch

 drivers/net/ethernet/freescale/ucc_geth.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
index 15d05b270b6e..ace332d51aa8 100644
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


