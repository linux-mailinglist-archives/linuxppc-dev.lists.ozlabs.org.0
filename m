Return-Path: <linuxppc-dev+bounces-1001-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF4296C520
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 19:18:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzTjM20Qdz2yjR;
	Thu,  5 Sep 2024 03:18:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.183.201
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725470311;
	cv=none; b=P2JTQJlTMxh+vY1N5MewHKxduNb2ZRWWhE1OTnwN8hqfhmknr57XN8CQjSXL7LEHuH41Mw/2MsM+/9B8KOkgHxNpF107o1GYRyVBNe0VPeaZMbevnqEilIKF1Ln60R3ODuPSfpcu+xAq23ECEo9b+i3k8bNsxyXLfRd/NBeVsO81pZa4vqA4Y/4iy9E/44YXr2GxSz+s5cD24KB/JIt+QcInFv9WnWf16MK5Oqjef6oBg90GtXp6HrdmJa7Duge15v3wzEDQ/QJaSRn8XdfRTpR++df4UF8ERBXmsMJEeyCTPyD3b1ueViL1LwkHl1fjvbPQXT5IksYSnNJvLT5KVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725470311; c=relaxed/relaxed;
	bh=6FV/qcbVRZQEWQv+cuiJ0FHX/wU1qKcBWUAGNrbhmHk=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version; b=lKkr08R7gWUOY118sHQAYR7rx65d9P+oFlDO6f7UyD3IL3V/SNRflcD4HVmR8s5xOZQC7qEKTR/W+WFZoSo37LBUctFrkCxTLFRSnFzXFc3apBjk82wxtlhHngbbAISR/tWwzhQzsmvjCHqs3Bf7ce59/KXKvNjaFrVAaatPkgNyUCW7aoI467bHcUtAXHbVxQXUqAJRSnguWmyxWh1/Bb8mi/tJ0zqlFUKSx2kFIdefFJO7jXi3bspkzDLcLQA7vNNdtAX40nx06vVYsXcOpz1hblRF6FniOuAf6mBzby++oFCYNuQYrPuaQzHhUO0AdbxVc5Mdn4p//qgwnwofYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=QZCZNZu2; dkim-atps=neutral; spf=pass (client-ip=217.70.183.201; helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=QZCZNZu2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.201; helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzTjL5FKZz2ygB
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 03:18:30 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D34D1BF209;
	Wed,  4 Sep 2024 17:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725470308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6FV/qcbVRZQEWQv+cuiJ0FHX/wU1qKcBWUAGNrbhmHk=;
	b=QZCZNZu2MmQ5+C3IulMS1p8b1ROgFz1XQIY+DtlAhl3mEMB+RZI9LBBoID6o+GIHb8momT
	ozzTfI4m0W9BGsEjt1c+9jcfTXGI+p9dmJPfh9/hh8MnesO3mN/mffUwHV6D5dVVAfBZN1
	jM19DwnCxJvlMxR7u8dBPeoqIh7Tk9KUuzbTnL1NnbANkRCXB2ReeuOwLk5K0p+ALA6PNj
	qQrb7qfUdBFAV3Cwkt6bdCNs4MHdH7kDaWjiPfmkMUlMv1EjzURHfR2eYGvA7uBAcQuEJ6
	lXh5I1N6dNXmkHZ4e70kO0ZsUbkSgXs44pNu7TXCa6pXhX3ZCHGLAIeYT34V/Q==
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
Subject: [PATCH net-next v3 3/8] net: ethernet: fs_enet: drop the .adjust_link custom fs_ops
Date: Wed,  4 Sep 2024 19:18:16 +0200
Message-ID: <20240904171822.64652-4-maxime.chevallier@bootlin.com>
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

There's no in-tree user for the fs_ops .adjust_link() function, so we
can always use the generic one in fe_enet-main.

Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
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
2.46.0


