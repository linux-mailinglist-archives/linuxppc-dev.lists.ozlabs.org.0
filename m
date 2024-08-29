Return-Path: <linuxppc-dev+bounces-755-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCEB964B3E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 18:15:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wvmbf04h4z2ytV;
	Fri, 30 Aug 2024 02:15:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.183.196
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724948141;
	cv=none; b=EebQKGS1lTaOQZ+Y+LfbJSPPhxFmpEIKTZx0Vs5RXan7JQ/ivGdEnsvVY97xzLyNd4xiALasjJkkuuqPKS5LEesAs1zE9yFxs/Hz9wpDcu4xvhJ8vqCaGZhVdLrZPmhi90DMPG2+kPeim9jsU/mpCHrGypl0gaoGEHgQTzt8yztE/gHJfOzWkin6ReTYy0nusNzbNKtmxDe0tu/ImLomqfR3e+SMRHET2P+PxTEbtAycvkJ6UFi3Pg93wbljzxfCb/1eLkPyTFCg4op0hk2EWkqxBVJq1/cv74rFvNClxHlw7Clbc3U5dPB8705htESJxKTas6eOYMBt0t7XzUptOA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724948141; c=relaxed/relaxed;
	bh=dikhKHIOkEIPXGWcRLGhXSpACwbwEwFF3Ey6JTJR82I=;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-GND-Sasl; b=X672MOWRifSa13cDKqMpNk8jiCxSLlr81u/7o7ldePHw7Voktu48MZyMD05HqbudO0fI3fgzpbDtkwOf4gbaZN/uTCjladPPpo+XzQ2opjh5b5qzp3jGhGAi9rcGbJVne7V9qdj2IEObTrdSNMlrJQKbbpR5jper8nVBq8r2j3yhvC0zoD2dPkzHpQxCElhfTeMa0OIhRcvlUggU1EFjtypHPyGQfFPnlJZgjfBTpVY0s/X6gZ3kd67oGgh6hqG3cUuNsa6++kKX1QwKigHflKkzSoU069bOgjSYxN7mg9pT78Xe65iIVkngX8S2DprwQ5tzqm0hlBcFQEOx8VBw5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=e8VISQ1G; dkim-atps=neutral; spf=pass (client-ip=217.70.183.196; helo=relay4-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=e8VISQ1G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.196; helo=relay4-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wvmbd0dncz2ytJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 02:15:39 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9FAAFE000D;
	Thu, 29 Aug 2024 16:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724948137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dikhKHIOkEIPXGWcRLGhXSpACwbwEwFF3Ey6JTJR82I=;
	b=e8VISQ1GtrSQhVtoN35M4u1mxjTx/5DzcSIu7PiYLZkIiuNG3KSdnNRev4Ret56FRIBufd
	uiqPuyc92XKxrtpIYzqDDeCtkIgApV5rrznf+76RXQoU0NcbmJSKyY9VXIOwGJb9diGchZ
	bmsnSpkH3FYKvJxhPlRUZ3S0OYVPf9AOI6sroQCQGMUYoUdqnzLdCX/Tj3DCSx6o4nckQB
	khtaKznwsIGSSmY/sQWECcGZT+SgMHgkku3Y+mWPkPFN3VXsMNJTT75dFOAxiFxF8rnvOi
	ZaIBAUjYwkIiacSghaNrIEqQcp9posiw91ndY2rJNXLrgmCr+asCNx3aMpGF8g==
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
Subject: [PATCH net-next v2 3/7] net: ethernet: fs_enet: drop the .adjust_link custom fs_ops
Date: Thu, 29 Aug 2024 18:15:26 +0200
Message-ID: <20240829161531.610874-4-maxime.chevallier@bootlin.com>
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

There's no in-tree user for the fs_ops .adjust_link() function, so we
can always use the generic one in fe_enet-main.

Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
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


