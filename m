Return-Path: <linuxppc-dev+bounces-1003-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 664B596C526
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 19:18:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzTjP0Cx4z2ymr;
	Thu,  5 Sep 2024 03:18:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.183.201
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725470312;
	cv=none; b=YJoBgUtKSVnBiFkXOufCvgPZlykBGtgaCTb8vDjFfs7iYgb6aBAVho+lyXq5+TI4AFpWCcNO5Qd48jflryNq6lC4qsPKXgWI+9vt9K/luZm5RIhfoKxisM9pU/zsblLg5g+oX6yn4298qSGQ6EX+AlS6LgnFE2dVBHzu8g+RkXEA7jDn3pJHh86uomtcWVg7EaSJ11bsUcIq9EOUpQ+QPjaoRxoeU6HLFxkS1IuljLGM1JOcJWb1nwxPcZRoKemePMkSuhq4auf2GHFC7vcneBVh/AH0EnGaFMtEWFZcE5qp7TS3wjS3cw3Hv5aRrlPzRqkdQS6tmeVbipSlvKixmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725470312; c=relaxed/relaxed;
	bh=i1v2wNrojZNwAx2VQ+X6lX7XOCpRJVlU3xdY4cZSmMA=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version; b=X5HnK8kusIHkzzQcMgv7jNF5Ho4hkJW0i7vtODGRfjbGaWobmv8Y3ALxXJ/KQqT899MUZXWKQkUB5Kw2rHb+fq/RmTZQYN8xytFX0/1nDHg8sKjz9TfcAZYQNo/d1ARLPiWH5XzzKQGan5yX5emjVLWmZUq8pziTJjDO4fgAQB/j8Iwc6Ro/wrBkZKAQZ+nTFgbRMf4z/eM8k/aWXUKQAfOTl4cQ495/7iHdo4EBBOmoCu4L+Sucu+hxxlDZmDzpJBsAFJt7gNiUtew1zXjbf2Bu/NAOcWAsn9KfqWsfi0XuBOSZh2ENik99rDm2be4vu9I2X/dE1P2lNJflKlcV3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ks76icyj; dkim-atps=neutral; spf=pass (client-ip=217.70.183.201; helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ks76icyj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.201; helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzTjN1lV3z2yfm
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 03:18:31 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF8EF1BF204;
	Wed,  4 Sep 2024 17:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725470309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i1v2wNrojZNwAx2VQ+X6lX7XOCpRJVlU3xdY4cZSmMA=;
	b=ks76icyjTpyd6Beh6Lqvvre1JXbuLRbkm5QpB08LMoxxqOFE9PVZksvA3OgIcRNYPRQ1aS
	dFTpKG991urCmud0vUml46D4iYLa/AbX4uoeAiuJK7ttNhTbwpppGACBPvhwCeWuCaFZly
	Jg7gf2gPg6u1b4mHwXvrY/Q8gwGA2riTyjSWQ9jyxmzNahyzTLu7spfKGWaXVowFXAHZxQ
	ZbvG57TnAmpag93JvAcRABqDaEips/6GsUGYOQGHWFQ3T1MUmQ74GDoQOcAQaB04F+L46z
	oJZkGP6wY8Jv0SMyFS0smTl9J8Ta8U9WwleZg8r8bZHp4R5JVdbJddOGfMLf8w==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net,
	Pantelis Antoniou <pantelis.antoniou@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	Herve Codina <herve.codina@bootlin.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH net-next v3 5/8] net: ethernet: fs_enet: drop unused phy_info and mii_if_info
Date: Wed,  4 Sep 2024 19:18:18 +0200
Message-ID: <20240904171822.64652-6-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240904171822.64652-1-maxime.chevallier@bootlin.com>
References: <20240904171822.64652-1-maxime.chevallier@bootlin.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com

There's no user of the struct phy_info, the 'phy' field and the
mii_if_info in the fs_enet driver, probably dating back when phylib
wasn't as widely used.  Drop these from the driver code.

As the definition for struct mii_if_info is no longer required, drop the
include for linux/mii.h altogether in the driver.

Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 .../net/ethernet/freescale/fs_enet/fs_enet-main.c    |  1 -
 drivers/net/ethernet/freescale/fs_enet/fs_enet.h     | 12 ------------
 drivers/net/ethernet/freescale/fs_enet/mac-fcc.c     |  1 -
 drivers/net/ethernet/freescale/fs_enet/mac-fec.c     |  1 -
 drivers/net/ethernet/freescale/fs_enet/mac-scc.c     |  1 -
 5 files changed, 16 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
index b320e55dcb81..c96a6b9e1445 100644
--- a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
+++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
@@ -26,7 +26,6 @@
 #include <linux/etherdevice.h>
 #include <linux/skbuff.h>
 #include <linux/spinlock.h>
-#include <linux/mii.h>
 #include <linux/ethtool.h>
 #include <linux/bitops.h>
 #include <linux/fs.h>
diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet.h b/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
index abe4dc97e52a..ee49749a3202 100644
--- a/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
+++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
@@ -3,7 +3,6 @@
 #define FS_ENET_H
 
 #include <linux/clk.h>
-#include <linux/mii.h>
 #include <linux/netdevice.h>
 #include <linux/types.h>
 #include <linux/list.h>
@@ -92,14 +91,6 @@ struct fs_ops {
 	void (*tx_restart)(struct net_device *dev);
 };
 
-struct phy_info {
-	unsigned int id;
-	const char *name;
-	void (*startup) (struct net_device * dev);
-	void (*shutdown) (struct net_device * dev);
-	void (*ack_int) (struct net_device * dev);
-};
-
 /* The FEC stores dest/src/type, data, and checksum for receive packets.
  */
 #define MAX_MTU 1508		/* Allow fullsized pppoe packets over VLAN */
@@ -153,10 +144,7 @@ struct fs_enet_private {
 	cbd_t __iomem *cur_rx;
 	cbd_t __iomem *cur_tx;
 	int tx_free;
-	const struct phy_info *phy;
 	u32 msg_enable;
-	struct mii_if_info mii_if;
-	unsigned int last_mii_status;
 	int interrupt;
 
 	int oldduplex, oldspeed, oldlink;	/* current settings */
diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c b/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
index add062928d99..159a384813b3 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
@@ -22,7 +22,6 @@
 #include <linux/etherdevice.h>
 #include <linux/skbuff.h>
 #include <linux/spinlock.h>
-#include <linux/mii.h>
 #include <linux/ethtool.h>
 #include <linux/bitops.h>
 #include <linux/fs.h>
diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-fec.c b/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
index f75acb3b358f..cf4c49e884ba 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
@@ -23,7 +23,6 @@
 #include <linux/etherdevice.h>
 #include <linux/skbuff.h>
 #include <linux/spinlock.h>
-#include <linux/mii.h>
 #include <linux/ethtool.h>
 #include <linux/bitops.h>
 #include <linux/fs.h>
diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-scc.c b/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
index 29ba0048396b..6edc9f66ae83 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
@@ -22,7 +22,6 @@
 #include <linux/etherdevice.h>
 #include <linux/skbuff.h>
 #include <linux/spinlock.h>
-#include <linux/mii.h>
 #include <linux/ethtool.h>
 #include <linux/bitops.h>
 #include <linux/fs.h>
-- 
2.46.0


