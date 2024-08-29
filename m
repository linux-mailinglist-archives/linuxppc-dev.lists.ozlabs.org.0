Return-Path: <linuxppc-dev+bounces-761-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB333964B50
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 18:16:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wvmbk33wqz301N;
	Fri, 30 Aug 2024 02:15:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::224"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724948146;
	cv=none; b=TlitIDTlKB+DChnLXq0ug+qHfb18i1XluoJ+wv8gIVC3XuAdRzGgjsxIObp+OVXnwqXDH9nYBuB1sNy8URdhOlSmcZlr49F9MV5wq06snuXws5p59mOvdVqiFWYnidgoST3ox5IMwyR80z6vDfgqajM5iZtPEK36G1mtZTSRwdZVBIdW5EcUalYr1BuIp7f1OdfHlTUZHbdeYyAIJkCv96wZz3wxT5AwoCJYCZ41IB66l2SixOYuwEhj1+Zt4f6GxbTEE6LWiJfcWgrdoIw2x7qwpCkPYD0km9PD6rj+XUPMNeiPcemDKodPp+ejShlrPikXRDsPCZIHlnSKNQXd1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724948146; c=relaxed/relaxed;
	bh=SIsPTyrxGgw/Zac0/0z0TI/VToGqrLc2BdFxemVNJ2A=;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-GND-Sasl; b=fZkaXObkeCdDIXQ9ir46L/VT39Ci57874Bfay4e1V5yhqVTVFPUVMNyp9jnZk8NNqWYsHfD+DpYJ+HePv+VxgIHD/9uKed45bAWFLAqgC5zZ2sI51qPliaoc1HTZrUB+hfsZZEdBgZYB4KqPUAbdKmKWXHSmhhPyYJ0ZJAMg8U9Vb51cdx5dz0HvNp4xtuAIcpYqw9RK10pE/hG8WvaViyd0mQeWSmc4hVmIxgfb8k6rkpgQgE0U5we0Rv5/X6g2PMAhzH5hI4x7jstoRRtQpG4cjSKsca7zxmN+CnuitCTuDcTVlyskxL1N+6r8Qb7lQ/2rQD4NrIavDwYkkaEQyQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=NsaGGPmx; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::224; helo=relay4-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=NsaGGPmx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::224; helo=relay4-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wvmbj6BRjz2yyx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 02:15:45 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D8F9E0006;
	Thu, 29 Aug 2024 16:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724948138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SIsPTyrxGgw/Zac0/0z0TI/VToGqrLc2BdFxemVNJ2A=;
	b=NsaGGPmxG3Ickd/pWRrm8GNa4IFdZgVRXGADqN63R2ECTw+/30GXlJsMjPZwXQ+PU8NZrN
	PdUtRFw4lp7N636fFYAyHJiwKU53mmKJ4gl2gFrlvLUfWczmxSXnY6V4JpMpu3xKdzn73h
	Xw+OM0F0dn7UuSA8ISb01LSrg+YsWqB3/aT8WSq4bonjeVBLSplEaSpYs3qtuuYSnl+DwW
	PSGL+Pgb5mI52PkJiQOYSKootnlmx+FDixoekrRc4fyRb1r/PvMmKVg44JNNSUT+Q6z5K2
	5rv7purr/62dMBblNw/cHTjf+B23qKu3RWPUjkqb+rSk7WGqNs+og9NJ3Kx2Hw==
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
	Simon Horman <horms@kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH net-next v2 4/7] net: ethernet: fs_enet: drop unused phy_info and mii_if_info
Date: Thu, 29 Aug 2024 18:15:27 +0200
Message-ID: <20240829161531.610874-5-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240829161531.610874-1-maxime.chevallier@bootlin.com>
References: <20240829161531.610874-1-maxime.chevallier@bootlin.com>
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

Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/freescale/fs_enet/fs_enet.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet.h b/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
index abe4dc97e52a..781f506c933c 100644
--- a/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
+++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
@@ -92,14 +92,6 @@ struct fs_ops {
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
@@ -153,10 +145,7 @@ struct fs_enet_private {
 	cbd_t __iomem *cur_rx;
 	cbd_t __iomem *cur_tx;
 	int tx_free;
-	const struct phy_info *phy;
 	u32 msg_enable;
-	struct mii_if_info mii_if;
-	unsigned int last_mii_status;
 	int interrupt;
 
 	int oldduplex, oldspeed, oldlink;	/* current settings */
-- 
2.45.2


