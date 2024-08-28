Return-Path: <linuxppc-dev+bounces-675-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A8B9624D5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 12:25:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv0t526Xmz2yhr;
	Wed, 28 Aug 2024 20:25:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.178.240
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724839853;
	cv=none; b=XCkSj/CPTafNKUFXIiyPa96BvQAdVupv0cCKoVxwiPwvPWbfDZcs7hO/+JKA6tTgjNC2XP3bM6dzWMUO/LiaC/UqMCnnqXoRq9gv8inVY9nkzNppou79m4hopwgNYmjgNSAOP26kaVcErePzyyue1XvPKEag+/RKsbhHCmNJXfrVgGDgMMRzvCuT+KpFVuWFWGTDVcqmoKCb5HAH11Gimr/i63SkOap74mIJZCK8S7SNb+g4fXDhRehObEW6mRqu1OSGYJnFlNtK24VgJ6zmQMrNRS0dh7rnFdxqAhIiEBuDo38oc/fPKNJtoFnLElyge8W5c3eIGyswWKtQWxsUeg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724839853; c=relaxed/relaxed;
	bh=AOqxHOunZthc42y0BkXMB3O7jdtqqFooDociJletkPA=;
	h=Received:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-GND-Sasl; b=irgQoKhSy3ZC94pbSKzgz0vp40MXYNKYo68Nuv/qLrR4XMcFNn3Kb4dyb2GCx1U+D+fHLk/sXAmIgmrgacPRkXOqaY3zZn7THgH6/YvuI2ykwxj5mx9M4wqlnsCCjrTRe+kRtplpH9+RQGO6SnZtJRVLEAUOJPDyrBG2ClH996PZ/qUhO49QYejkVNN3E3HWbjFbDAd5WS99s1N83KfhCl8UkTcJn95zkGTyFyLVvvpRlxrxjigBVf7isL62jx9XjGy/hx5CbpVVCN6kfTOgCxZyHoC6qJ+fOqFHR5XQ/7c9Kk5GJKilzqq95lbAS8KxiWRWFyU4nKsEv4r2VdHnfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Np/rB1hR; dkim-atps=neutral; spf=pass (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Np/rB1hR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wv0Y86s7Zz2xdX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 20:10:51 +1000 (AEST)
Received: from relay5-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::225])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 68A26C80D3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 09:51:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E78A81C000A;
	Wed, 28 Aug 2024 09:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724838671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AOqxHOunZthc42y0BkXMB3O7jdtqqFooDociJletkPA=;
	b=Np/rB1hRLIMhEltBoJZCPFzIpIC655en36TGn0Y80SOoPNYAGvBVCsZMel8EaB6icKoZ4K
	IVqy6JAXDDzfulksg/dO6N7lro1FLXwZCPRcilIUEULHwwXMk/H3Rs63AceLmLMKkDUwSs
	DL0ZTzCPNxOOlIImBjDNOxPp9ZiYoe0JFm+B01OWIhcTZ7VYk3FbdfVcshp2di1yn1rUAM
	40bOxRWLZpZDgclrXBZYDbJFyhJIHBM+KHk4ZQ/7yZTH/KLEoaq/QTZ0LECYl9tXeLOXVc
	QFs3ttkmUc4IlIFHGCVoB/mkOcNmBB/kM8VOqQOfdkmWR86yH1KHdswBd/KJWA==
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
Subject: [PATCH net-next 4/6] net: ethernet: fs_enet: drop unused phy_info and mii_if_info
Date: Wed, 28 Aug 2024 11:51:00 +0200
Message-ID: <20240828095103.132625-5-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240828095103.132625-1-maxime.chevallier@bootlin.com>
References: <20240828095103.132625-1-maxime.chevallier@bootlin.com>
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


