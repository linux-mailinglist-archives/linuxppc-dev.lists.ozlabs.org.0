Return-Path: <linuxppc-dev+bounces-758-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67056964B48
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 18:16:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wvmbg0qndz2ytT;
	Fri, 30 Aug 2024 02:15:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.183.196
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724948143;
	cv=none; b=Mu+q+623l1n9HtLf8XljoEXdnJbWL8cMHBIUAlkID3WMsVaZlBCs04J+4UqmtKx8vAzNfOkaouJFxf8Rdil3nAzoWejRisuNJJSATdMilOoP4M4Vf4DSw7EFArbYJ3WJyJdUwgCbzyD4DCpehidECwhzUf91RXLnQ5tiPuozvHYUWlm6QPFwUtHJd1uvu3LeUDNo8gQCJ3VptXTq9QuTw/d+ToM8203hI9NQpSOlDpg+ck7evFhDlQow9lqwjqSmMIm+/g9PEq1FAr9dX9SAwQ3zllyE51ZZ2/cXxxT90XCLvm1mAoyM7wUSAB5InfZXUuFfoHh3WZCJ/lneYGXU7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724948143; c=relaxed/relaxed;
	bh=x4t3G7hIliLcFKUfI6WJTwsrtyfTlKVqpI3JWwciKXQ=;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-GND-Sasl; b=UWSVQQLha6ggL+jOE1mCwMh/ZwiYCnKnfHzR7oTv3ikC5X6lmdLx05iPnf1JY0uafaUwP4O+fqJc1+UyNerCxzBe4k6CQMQJg5DcRIZOWCmFJhfKrFoJRc67JD6LZ8mLhxtjxbabHS5OrdrcryfCv8Q4BhKUrVt1/vfTpHaX/DFQLX2n8BQQVIfEultjIIbyyfTX8oYL40iBoBJHedDvOOb2ONfDRXmpUoMeJUFeim0tiirPVyK7JJTui2+bimDmnfKcA1Vj24Jj9vKb/vORcmY5xMxLF1Rc9dXLBeA4uoxpqT65PmZcGioxyyy5bAy9vuXa3ulLO5jhYekgxaPWbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=JBpseYLB; dkim-atps=neutral; spf=pass (client-ip=217.70.183.196; helo=relay4-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=JBpseYLB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.196; helo=relay4-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wvmbf2SGPz2yx5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 02:15:41 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A317BE000C;
	Thu, 29 Aug 2024 16:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724948139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x4t3G7hIliLcFKUfI6WJTwsrtyfTlKVqpI3JWwciKXQ=;
	b=JBpseYLBEggNiAzuSbM83s8rIvadSDAhCzN8BUUqlmdvkkdRAeJPteSY3f0e/iimWnsyOP
	/NpAc3O4Axy324JW+F8l6d80CMfm85D7i8ow/plxDgq9oUyVA8H2AQnQjf4sWdU/fx3Zwp
	N09bgdkwRvR4d8Pq+Xh/iempTyqomfeGG+qDEU59rT/xag1ccAJjdvb+DF7XZs51Zukjuh
	BR+Rybv9X94xcjrKH8zHa4h9khkLlSkXTq661GuwTkIFfuYy3n2pKT+Lv9BYUNt0gI2akB
	RDdUKSAOYI7Xfx9z8hxnPgjWyS+mLXl+zkOQFCJMgEBJ6JeYhUkMT/ymBX2GuA==
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
Subject: [PATCH net-next v2 5/7] net: ethernet: fs_enet: fcc: use macros for speed and duplex values
Date: Thu, 29 Aug 2024 18:15:28 +0200
Message-ID: <20240829161531.610874-6-maxime.chevallier@bootlin.com>
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

The PHY speed and duplex should be manipulated using the SPEED_XXX and
DUPLEX_XXX macros available. Use it in the fcc, fec and scc MAC for fs_enet.

Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/freescale/fs_enet/mac-fcc.c | 4 ++--
 drivers/net/ethernet/freescale/fs_enet/mac-fec.c | 2 +-
 drivers/net/ethernet/freescale/fs_enet/mac-scc.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c b/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
index add062928d99..056909156b4f 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
@@ -361,7 +361,7 @@ static void restart(struct net_device *dev)
 
 	/* adjust to speed (for RMII mode) */
 	if (fpi->use_rmii) {
-		if (dev->phydev->speed == 100)
+		if (dev->phydev->speed == SPEED_100)
 			C8(fcccp, fcc_gfemr, 0x20);
 		else
 			S8(fcccp, fcc_gfemr, 0x20);
@@ -387,7 +387,7 @@ static void restart(struct net_device *dev)
 		S32(fccp, fcc_fpsmr, FCC_PSMR_RMII);
 
 	/* adjust to duplex mode */
-	if (dev->phydev->duplex)
+	if (dev->phydev->duplex == DUPLEX_FULL)
 		S32(fccp, fcc_fpsmr, FCC_PSMR_FDE | FCC_PSMR_LPB);
 	else
 		C32(fccp, fcc_fpsmr, FCC_PSMR_FDE | FCC_PSMR_LPB);
diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-fec.c b/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
index f75acb3b358f..855ee9e3f042 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
@@ -309,7 +309,7 @@ static void restart(struct net_device *dev)
 	/*
 	 * adjust to duplex mode
 	 */
-	if (dev->phydev->duplex) {
+	if (dev->phydev->duplex == DUPLEX_FULL) {
 		FC(fecp, r_cntrl, FEC_RCNTRL_DRT);
 		FS(fecp, x_cntrl, FEC_TCNTRL_FDEN);	/* FD enable */
 	} else {
diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-scc.c b/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
index 29ba0048396b..9e5e29312c27 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
@@ -338,7 +338,7 @@ static void restart(struct net_device *dev)
 	W16(sccp, scc_psmr, SCC_PSMR_ENCRC | SCC_PSMR_NIB22);
 
 	/* Set full duplex mode if needed */
-	if (dev->phydev->duplex)
+	if (dev->phydev->duplex == DUPLEX_FULL)
 		S16(sccp, scc_psmr, SCC_PSMR_LPB | SCC_PSMR_FDE);
 
 	/* Restore multicast and promiscuous settings */
-- 
2.45.2


