Return-Path: <linuxppc-dev+bounces-674-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 132069624D4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 12:25:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv0sv6v3jz2ygy;
	Wed, 28 Aug 2024 20:25:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.178.240
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724839782;
	cv=none; b=A7hsrlNeLJB73inGKKjxP2L8ILrHytqNf5obPD1Urx1zofjQDRHFH5iafIkv1BiTh1uvHoO2CS3szW71Q2nOjT/6zgm4MhTkI4WEsP0brFj0gyJrQXn2EM9MddPJCn6kqartK+j4+KpY1CJzESplyqOjBt6+AnpQQiLmjuV/dKLbE/50qHmdYeHaiNZAC36+TkS16YX900B/9oFrfD9GDBVkR35djn3U7Femehvmq5owVv4yLymFeDeEdPespdxlGwFzx6y+E43ZDatPc/gyoqApdLADw/3E/F9boKYH31fLyXdocZ/2+aMjY88mwAmn6d7blQHu5aWbaiJX4JS7Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724839782; c=relaxed/relaxed;
	bh=qoTedf+qbq85B6R54ycng3QOtF9jjEyEe9fgb+aDs7w=;
	h=Received:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-GND-Sasl; b=bVK4u+j+YtbGCerqVKJhtabWqdFdZ8yzQ60T95ax2vz2pFG+b8cOF4dGAaJhzZ6Pk1bU+VNhXZG58xa6EO5a5x7/4pfAxIuiGHCqik7SiiHcWm9g2U+pF/3R1CRzgODpSojZCqQR9Gi6ClXSjQfmcsTbRsD1GEGkpi5LXv2NO2WNsItX8R4SQ8xnwYWx9na6AuI+kyjvPvzMgkdFg3CwMQZX3FQlfGrYCL6xgWCly+ebXfwNDs21OywJRrbaOntC6dKMgZl+4duMhEVfnZ5KLX2iA4pG5uGd4cc4K8FsEcp9Ugi5UJmQ2nXrQNIlK2u2FGCm56WmIh6baHifd5Obbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ObPOlvV3; dkim-atps=neutral; spf=pass (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ObPOlvV3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wv0Wp1tcSz2xWb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 20:09:41 +1000 (AEST)
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 8A375C7D9A
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 09:51:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 072E71C0012;
	Wed, 28 Aug 2024 09:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724838670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qoTedf+qbq85B6R54ycng3QOtF9jjEyEe9fgb+aDs7w=;
	b=ObPOlvV3kyrL4aGUqoBKVCthpeGXw+ZoasYfSa5EgCQZBrihERHdNstQGcNRK5Bn1MpHfv
	ecq4wMez+2eZfXEyrJR6MhAwzpJzDBRpoE2xmP8kRVhrxi2r3PFtt1iANgYT2PsDk67PHv
	0sS1DptofpJ4IzdaDRqA6CSbEGU6nTXeVab2wBcenoO97A0Ie+rd1A//t5lLPg1oZpRoI1
	I1DTtV4JoBKyc4ulQfMmjZr0rIhDcHhjhNf8/R6IYN3GXRholKukfiQzRxAPnwzqbpeLtL
	mdl4uwELoLoQBssg/Cu1hn2lJCoN7uZk0JkIGB7Gi7vyKPZhXYlXmZD4rWC3bw==
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
Subject: [PATCH net-next 3/6] net: ethernet: fs_enet: drop the .adjust_link custom fs_ops
Date: Wed, 28 Aug 2024 11:50:59 +0200
Message-ID: <20240828095103.132625-4-maxime.chevallier@bootlin.com>
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

There's no in-tree user for the fs_ops .adjust_link() function, so we
can always use the generic one in fe_enet-main.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c | 7 +------
 drivers/net/ethernet/freescale/fs_enet/fs_enet.h      | 1 -
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
index 2b48a2a5e32d..caca81b3ccb6 100644
--- a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
+++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
@@ -649,12 +649,7 @@ static void fs_adjust_link(struct net_device *dev)
 	unsigned long flags;
 
 	spin_lock_irqsave(&fep->lock, flags);
-
-	if (fep->ops->adjust_link)
-		fep->ops->adjust_link(dev);
-	else
-		generic_adjust_link(dev);
-
+	generic_adjust_link(dev);
 	spin_unlock_irqrestore(&fep->lock, flags);
 }
 
diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet.h b/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
index 21c07ac05225..abe4dc97e52a 100644
--- a/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
+++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
@@ -77,7 +77,6 @@ struct fs_ops {
 	void (*free_bd)(struct net_device *dev);
 	void (*cleanup_data)(struct net_device *dev);
 	void (*set_multicast_list)(struct net_device *dev);
-	void (*adjust_link)(struct net_device *dev);
 	void (*restart)(struct net_device *dev);
 	void (*stop)(struct net_device *dev);
 	void (*napi_clear_event)(struct net_device *dev);
-- 
2.45.2


