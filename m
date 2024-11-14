Return-Path: <linuxppc-dev+bounces-3229-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FAC9C8E4E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 16:37:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq44m3Yfnz30Kg;
	Fri, 15 Nov 2024 02:36:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::228"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731598584;
	cv=none; b=FRss2cCfp+6HBHiUy/r0WUJY5r5vhjvbhD9yAq0hToH9Yv5kepV8+FUh9nzidX6MkENkI6Fi66TDfZX6JsKMEhusW4tieKnCh2YItLJ/gVsZAgnTE1j7S5O821RLOj25J9OIGzANDpw9e+msmJNGeOePp3jvFMRW/rCasU/k1D2V7qmMn80aETMaO06V7lUDzjURRNfN1nrBw1Mq4baeOYM0IBDyOUXvQlGtZbgHe1Mlqgr2bRnDRMtXNfj7ndKmk6cqUvYyXe+nYImL5KFSgT+04R28JEOk7unoS4vBSK1uUJ01zVzXdlHNXTMpujFYRU7LGm10/0Td24Y/XR+UtA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731598584; c=relaxed/relaxed;
	bh=RxGGhBtDTqWK4tM+QLuLJgRdIcL+yhd5ZKBES7qfk0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XTzVHRS7vWICKR8j7X2JEylZtnizQKFjlgY2Z0cuepxHJ3yOaesUTENHbfy90Cv7dj2RlIeX39adgzqjlRuexnR/xzzr0sXZO0cgFxs8momlkt0ZqhBh3yB7M/l8bD5TYDz/S5NcDvMARuvnisT+b2SEqiK5oQns/St3Mzk/u/NS5Y933xIBChpAYOb6svZjmGHkAbQUY51aW3ZCgExvaJUMbKzn0DZ7+Bor+Lsj+IL8V9wLeS3XZrkWrIMyMjxn93GlnVk8wnTqt7tPwZNBxVZf27Z4paSB9QlZKQUyWsKD+wXRUY7EVly4/jvCqAEQgkuXk/FifoDUy60MIE5PfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Yf5SpRpd; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Yf5SpRpd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq44g6Qrbz3054
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 02:36:19 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5858D1BF208;
	Thu, 14 Nov 2024 15:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731598567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RxGGhBtDTqWK4tM+QLuLJgRdIcL+yhd5ZKBES7qfk0g=;
	b=Yf5SpRpdOyGccdaHG+TnVqEQWpp7+EpWmrtK8GJLmtxo2XRVCTcpLofML0eq2SxrBg52dc
	M7ZleiUG0N3oT66unHuzKYWKBgThv0ZxCA36QyCpbmC+7xGTMHDNET4MeaD4h0eTy2RUa0
	034pahCjrw+pbF33x4izemJUKBV7yP28rklVo3A+D9VVu3KPnLWIN1ZSrKJrVxXzROe0u1
	c63jL6w8+z+sg1EAmcWGzpmkCE++1qVJwqYfEisiZcnqVRKcyHIi6YYPMezpeEouctPNpU
	M3XpwLKltOpNQMsXjUNozPSv0cCgsJEsuFc0kr0+84/Lubv1n1Zds1zfCadK7A==
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
Subject: [PATCH net-next v2 01/10] net: freescale: ucc_geth: Drop support for the "interface" DT property
Date: Thu, 14 Nov 2024 16:35:52 +0100
Message-ID: <20241114153603.307872-2-maxime.chevallier@bootlin.com>
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

In april 2007, ucc_geth was converted to phylib with :

commit 728de4c927a3 ("ucc_geth: migrate ucc_geth to phylib").

In that commit, the device-tree property "interface", that could be used to
retrieve the PHY interface mode was deprecated.

DTS files that still used that property were converted along the way, in
the following commit, also dating from april 2007 :

commit 0fd8c47cccb1 ("[POWERPC] Replace undocumented interface properties in dts files")

17 years later, there's no users of that property left and I hope it's
safe to say we can remove support from that in the ucc_geth driver,
making the probe() function a bit simpler.

Should there be any users that have a DT that was generated when 2.6.21 was
cutting-edge, print an error message with hints on how to convert the
devicetree if the 'interface' property is found.

With that property gone, we can greatly simplify the parsing of the
phy-interface-mode from the devicetree by using of_get_phy_mode(),
allowing the removal of the open-coded parsing in the driver.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
V2: No changes

 drivers/net/ethernet/freescale/ucc_geth.c | 63 +++++------------------
 1 file changed, 12 insertions(+), 51 deletions(-)

diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
index 6663c1768089..80540c817c4e 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.c
+++ b/drivers/net/ethernet/freescale/ucc_geth.c
@@ -3469,32 +3469,6 @@ static int ucc_geth_resume(struct platform_device *ofdev)
 #define ucc_geth_resume NULL
 #endif
 
-static phy_interface_t to_phy_interface(const char *phy_connection_type)
-{
-	if (strcasecmp(phy_connection_type, "mii") == 0)
-		return PHY_INTERFACE_MODE_MII;
-	if (strcasecmp(phy_connection_type, "gmii") == 0)
-		return PHY_INTERFACE_MODE_GMII;
-	if (strcasecmp(phy_connection_type, "tbi") == 0)
-		return PHY_INTERFACE_MODE_TBI;
-	if (strcasecmp(phy_connection_type, "rmii") == 0)
-		return PHY_INTERFACE_MODE_RMII;
-	if (strcasecmp(phy_connection_type, "rgmii") == 0)
-		return PHY_INTERFACE_MODE_RGMII;
-	if (strcasecmp(phy_connection_type, "rgmii-id") == 0)
-		return PHY_INTERFACE_MODE_RGMII_ID;
-	if (strcasecmp(phy_connection_type, "rgmii-txid") == 0)
-		return PHY_INTERFACE_MODE_RGMII_TXID;
-	if (strcasecmp(phy_connection_type, "rgmii-rxid") == 0)
-		return PHY_INTERFACE_MODE_RGMII_RXID;
-	if (strcasecmp(phy_connection_type, "rtbi") == 0)
-		return PHY_INTERFACE_MODE_RTBI;
-	if (strcasecmp(phy_connection_type, "sgmii") == 0)
-		return PHY_INTERFACE_MODE_SGMII;
-
-	return PHY_INTERFACE_MODE_MII;
-}
-
 static int ucc_geth_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
 {
 	struct ucc_geth_private *ugeth = netdev_priv(dev);
@@ -3564,19 +3538,6 @@ static int ucc_geth_probe(struct platform_device* ofdev)
 	int err, ucc_num, max_speed = 0;
 	const unsigned int *prop;
 	phy_interface_t phy_interface;
-	static const int enet_to_speed[] = {
-		SPEED_10, SPEED_10, SPEED_10,
-		SPEED_100, SPEED_100, SPEED_100,
-		SPEED_1000, SPEED_1000, SPEED_1000, SPEED_1000,
-	};
-	static const phy_interface_t enet_to_phy_interface[] = {
-		PHY_INTERFACE_MODE_MII, PHY_INTERFACE_MODE_RMII,
-		PHY_INTERFACE_MODE_RGMII, PHY_INTERFACE_MODE_MII,
-		PHY_INTERFACE_MODE_RMII, PHY_INTERFACE_MODE_RGMII,
-		PHY_INTERFACE_MODE_GMII, PHY_INTERFACE_MODE_RGMII,
-		PHY_INTERFACE_MODE_TBI, PHY_INTERFACE_MODE_RTBI,
-		PHY_INTERFACE_MODE_SGMII,
-	};
 
 	ugeth_vdbg("%s: IN", __func__);
 
@@ -3627,18 +3588,17 @@ static int ucc_geth_probe(struct platform_device* ofdev)
 	/* Find the TBI PHY node.  If it's not there, we don't support SGMII */
 	ug_info->tbi_node = of_parse_phandle(np, "tbi-handle", 0);
 
-	/* get the phy interface type, or default to MII */
-	prop = of_get_property(np, "phy-connection-type", NULL);
-	if (!prop) {
-		/* handle interface property present in old trees */
-		prop = of_get_property(ug_info->phy_node, "interface", NULL);
-		if (prop != NULL) {
-			phy_interface = enet_to_phy_interface[*prop];
-			max_speed = enet_to_speed[*prop];
-		} else
-			phy_interface = PHY_INTERFACE_MODE_MII;
-	} else {
-		phy_interface = to_phy_interface((const char *)prop);
+	prop = of_get_property(ug_info->phy_node, "interface", NULL);
+	if (prop) {
+		dev_err(&ofdev->dev,
+			"Device-tree property 'interface' is no longer supported. Please use 'phy-connection-type' instead.");
+		goto err_put_tbi;
+	}
+
+	err = of_get_phy_mode(np, &phy_interface);
+	if (err) {
+		dev_err(&ofdev->dev, "Invalid phy-connection-type");
+		goto err_put_tbi;
 	}
 
 	/* get speed, or derive from PHY interface */
@@ -3746,6 +3706,7 @@ static int ucc_geth_probe(struct platform_device* ofdev)
 err_deregister_fixed_link:
 	if (of_phy_is_fixed_link(np))
 		of_phy_deregister_fixed_link(np);
+err_put_tbi:
 	of_node_put(ug_info->tbi_node);
 	of_node_put(ug_info->phy_node);
 	return err;
-- 
2.47.0


