Return-Path: <linuxppc-dev+bounces-3224-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7139C8E47
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 16:36:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq44j5ZNjz307f;
	Fri, 15 Nov 2024 02:36:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::228"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731598581;
	cv=none; b=jt8EYDWMd+u9TYQ6cLV3wk943jmsArv3j3Iypdy88I8xIogB8ZVXPBq0YBjojFdDU85hYh2p115MYwnYwIj7/wTBX7zptma/e1v46n7ZK+imyCCOSrY8hweME5iHyFqhzSOnoU+mgCy9yaaZgWuTbO9sOVqaiFqweL+6sBXw5Bjon2Aay6KqzttzlnNtEG7FYF1CrsTCzis8O3nPY7CNHEjDtKsLuGFYc1FDx/YXbY7cYs8qYpf1RP7KxtZSsSbaI/5CsjhSrNyK8QHRIFH5DvOJorfMdYgsp6jop/p9GC6AkXm7Qjgvwc3VB1gSIvk0v64R1xY/MU3EEuEdmiYfbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731598581; c=relaxed/relaxed;
	bh=vOe5I5RV009/ewvKsTnVJ8v2QKmxpVyy8K9Vn3nWYhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QtqrA3uwlIAacSjm0aCJ51LwPPB4C8K70QioBbN/v5I3XZEbxjQcmsMGCTNmVYMalF2Kag27eQEjJX/OqLu21IvgvNNYFv+ZIJraxZl+UeRD4pbam8S4z80SJ3A2EwPxTuqq5UYjpvUC4TelZrk0R8kkgby7RVcEYA04v+2sQFWQ54soptbN9LIE7ZDtrkcKyvFVljBbHw8VIUj5rQfZmYiWNQLnLXoWCBvs3zp/QJBp0WiaRMJcDRg8vAu769BLTLH0ImBr99SZSs34bFtmzNLdKEV0LJyvsrKgk0CNzhDlwX2Ac0h+A1yzTTv3BVBL/mLijvHuueIdVKbtY6T0Ow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=FhIZd88T; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=FhIZd88T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq44g67q7z2yxY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 02:36:19 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A8F971BF210;
	Thu, 14 Nov 2024 15:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731598569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vOe5I5RV009/ewvKsTnVJ8v2QKmxpVyy8K9Vn3nWYhQ=;
	b=FhIZd88TTOZcqjc0guKQCBJMu2N4P6TeOLSV0DXGYcjgtbVGT7jfK3B49OveA0CQdnbVlF
	Btjvo5r+wgNRn45asVSf8II6FMlqDNNcsGiEqCen5vYvXLUhbGUMimV+ZOSe5Rdw5r+wdB
	lG3x66GXT373VkmtNgU7O//RjSYHxaHoJjckcLtnyQzwovz5UVEQFj4aGRNIjjrHoP0PWb
	+BMe6H44oXDl4r8nfQ6ky4YzSRTfq0wXH96DmfqqxyGokLEQmldFhirtMUrW9GX61XCtmj
	Q7qKbJDiWwDfxz4NXId9R7+aR5Yxcy3Fo5ozQaDIxzodB7yOlZjUZ2CWyL2x+A==
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
Subject: [PATCH net-next v2 04/10] net: freescale: ucc_geth: Fix WOL configuration
Date: Thu, 14 Nov 2024 16:35:55 +0100
Message-ID: <20241114153603.307872-5-maxime.chevallier@bootlin.com>
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

The get/set_wol ethtool ops rely on querying the PHY for its WoL
capabilities, checking for the presence of a PHY and a PHY interrupts
isn't enough. Address that by cleaning up the WoL configuration
sequence.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
V2: Reworked the whole configuration sequence, and introduced an
internal attribute to store the PHY wol capabilities

 drivers/net/ethernet/freescale/ucc_geth.c     |  4 +--
 drivers/net/ethernet/freescale/ucc_geth.h     |  1 +
 .../net/ethernet/freescale/ucc_geth_ethtool.c | 36 +++++++++++++++----
 3 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
index 13b8f8401c81..42254ee64a35 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.c
+++ b/drivers/net/ethernet/freescale/ucc_geth.c
@@ -3413,11 +3413,11 @@ static int ucc_geth_suspend(struct platform_device *ofdev, pm_message_t state)
 	 */
 	ugeth_disable(ugeth, COMM_DIR_RX_AND_TX);
 
-	if (ugeth->wol_en & WAKE_MAGIC) {
+	if (ugeth->wol_en & WAKE_MAGIC && !ugeth->phy_wol_en) {
 		setbits32(ugeth->uccf->p_uccm, UCC_GETH_UCCE_MPD);
 		setbits32(&ugeth->ug_regs->maccfg2, MACCFG2_MPE);
 		ucc_fast_enable(ugeth->uccf, COMM_DIR_RX_AND_TX);
-	} else if (!(ugeth->wol_en & WAKE_PHY)) {
+	} else if (!ugeth->phy_wol_en) {
 		phy_stop(ndev->phydev);
 	}
 
diff --git a/drivers/net/ethernet/freescale/ucc_geth.h b/drivers/net/ethernet/freescale/ucc_geth.h
index c08a56b7c9fe..e08cfc8d8904 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.h
+++ b/drivers/net/ethernet/freescale/ucc_geth.h
@@ -1217,6 +1217,7 @@ struct ucc_geth_private {
 	int oldduplex;
 	int oldlink;
 	int wol_en;
+	u32 phy_wol_en;
 
 	struct device_node *node;
 };
diff --git a/drivers/net/ethernet/freescale/ucc_geth_ethtool.c b/drivers/net/ethernet/freescale/ucc_geth_ethtool.c
index fb5254d7d1ba..89b323ef8145 100644
--- a/drivers/net/ethernet/freescale/ucc_geth_ethtool.c
+++ b/drivers/net/ethernet/freescale/ucc_geth_ethtool.c
@@ -346,26 +346,48 @@ static void uec_get_wol(struct net_device *netdev, struct ethtool_wolinfo *wol)
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
 
-	if (wol->wolopts & ~(WAKE_PHY | WAKE_MAGIC))
-		return -EINVAL;
-	else if (wol->wolopts & WAKE_PHY && (!phydev || !phydev->irq))
+	if (phydev) {
+		ret = phy_ethtool_set_wol(phydev, wol);
+		if (ret == -EOPNOTSUPP) {
+			ugeth->phy_wol_en = 0;
+		} else if (ret) {
+			return ret;
+		} else {
+			ugeth->phy_wol_en = wol->wolopts;
+			goto out;
+		}
+	}
+
+	/* If the PHY isn't handling the WoL and the MAC is asked to more than
+	 * WAKE_MAGIC, error-out
+	 */
+	if (!ugeth->phy_wol_en &&
+	    wol->wolopts & ~WAKE_MAGIC)
 		return -EINVAL;
-	else if (wol->wolopts & WAKE_MAGIC && !qe_alive_during_sleep())
+
+	if (wol->wolopts & WAKE_MAGIC &&
+	    !qe_alive_during_sleep())
 		return -EINVAL;
 
+out:
 	ugeth->wol_en = wol->wolopts;
 	device_set_wakeup_enable(&netdev->dev, ugeth->wol_en);
 
-- 
2.47.0


