Return-Path: <linuxppc-dev+bounces-1007-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FAE96C52C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 19:19:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzTjV4jHXz2ysb;
	Thu,  5 Sep 2024 03:18:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::228"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725470318;
	cv=none; b=LvIw1KfQGM72gUTuIt3lkOZ1Hq8gVE1W60eMWKanSvCm9kvfjMMT4Z+zFx7RZIpjnOfZrsi0Kch0KOr2MQ8npZlVPVYibBMoi8hiv901AxlRWTlwbc9bbxRFR7X5DviV3dDfxN1UFv+U0Ic8cc1b1/NynanjFaYR8QQ2jkaEg3+dB3DxPO60PAyrBQGTFAEzOMqeaZbrrbhCF5oP1zEP/DdbablXRnDB50UGrRZ7Ww7Rjle0xRa/cVCQeqrvYjGQ47Ec9pnltKcacAmvuxbzkj8dD2dv24W2unBdkcF//AJFNjNfIdvff4HiylGcg/bAu8wN/r9FICJXsH9K1IVGDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725470318; c=relaxed/relaxed;
	bh=Xi/2j6epi1DgRRp0ubkSToTbKTHn7XZyH1dUXV/WNsI=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version; b=C2OQeV3SdibZyVbNPvqACy3V6bksIpzMkPr4TZjqhIXBFKaspGVNBXCL3bAFoNIgo+XdiWaLBRlnfDboIkE20yLq5PisgTIHiCyyV7SYfXV/8F8l/3M7XyPi5qvN5A6RTt5/a1P580GEcxC6LWrHtFu6v8NsAcK/EzPT8t3ymS1HN6zlq3yc3Da9Hv56fIV3SnPJrBpG0XYZ5MTrWGQ1TTmIYv5IdyydP+UfrRIGGqVMeGLFO93CkSWG5gqSscU7T+fY4AbJws7KoRHTw0kaZZefuN42qofN2G/d8Tz77+Pc6yJhk6dqn8IjZNXoZHolt2PUfB0r6SDCMTvRCS42sA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=FbRiGVxp; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=FbRiGVxp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzTjT5gc4z2ypm
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 03:18:37 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3111A1BF203;
	Wed,  4 Sep 2024 17:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725470308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xi/2j6epi1DgRRp0ubkSToTbKTHn7XZyH1dUXV/WNsI=;
	b=FbRiGVxpjPae3eW0/kOH4zJOBcCMHI5RSz4kVAShkxChU4ba+zclaC9ZxrVOYUWR+4Qb0g
	S7l08fY7T/r/6SpdIbPD0JQVIAISlC3BcquEgGW/6u0Pa9kJyn6cnFPSuXw8gSFlmGl8qX
	G6K1wbwFx8bM8wN9G/BbIOVNEVBzjD/2pn+xFfCnyW8fk4Z4q4M5kuMG9bwznlOq9v594C
	FZBG6+qYSN5ISxStT01N39066J+LXYTfqAOYmzm1b7+dt/T15A/ChWL1a3pI7sTy1Q+7Os
	pgN7keaGwN//FhiRixE4RpnF6VgQboLzk1k1KYVs5nBbNyezdkaVDbAEEY4nUA==
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
Subject: [PATCH net-next v3 4/8] net: ethernet: fs_enet: only protect the .restart() call in .adjust_link
Date: Wed,  4 Sep 2024 19:18:17 +0200
Message-ID: <20240904171822.64652-5-maxime.chevallier@bootlin.com>
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

When .adjust_link() gets called, it runs in thread context, with the
phydev->lock held. We only need to protect the fep->fecp/fccp/sccp
register that are accessed within the .restart() function from
concurrent access from the interrupts.

These registers are being protected by the fep->lock spinlock, so we can
move the spinlock protection around the .restart() call instead of the
entire adjust_link() call. By doing so, we can simplify further the
.adjust_link() callback and avoid the intermediate helper.

Suggested-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 .../ethernet/freescale/fs_enet/fs_enet-main.c  | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
index caca81b3ccb6..b320e55dcb81 100644
--- a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
+++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
@@ -607,10 +607,11 @@ static void fs_timeout(struct net_device *dev, unsigned int txqueue)
 }
 
 /* generic link-change handler - should be sufficient for most cases */
-static void generic_adjust_link(struct  net_device *dev)
+static void fs_adjust_link(struct  net_device *dev)
 {
 	struct fs_enet_private *fep = netdev_priv(dev);
 	struct phy_device *phydev = dev->phydev;
+	unsigned long flags;
 	int new_state = 0;
 
 	if (phydev->link) {
@@ -630,8 +631,11 @@ static void generic_adjust_link(struct  net_device *dev)
 			fep->oldlink = 1;
 		}
 
-		if (new_state)
+		if (new_state) {
+			spin_lock_irqsave(&fep->lock, flags);
 			fep->ops->restart(dev);
+			spin_unlock_irqrestore(&fep->lock, flags);
+		}
 	} else if (fep->oldlink) {
 		new_state = 1;
 		fep->oldlink = 0;
@@ -643,16 +647,6 @@ static void generic_adjust_link(struct  net_device *dev)
 		phy_print_status(phydev);
 }
 
-static void fs_adjust_link(struct net_device *dev)
-{
-	struct fs_enet_private *fep = netdev_priv(dev);
-	unsigned long flags;
-
-	spin_lock_irqsave(&fep->lock, flags);
-	generic_adjust_link(dev);
-	spin_unlock_irqrestore(&fep->lock, flags);
-}
-
 static int fs_init_phy(struct net_device *dev)
 {
 	struct fs_enet_private *fep = netdev_priv(dev);
-- 
2.46.0


