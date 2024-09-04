Return-Path: <linuxppc-dev+bounces-1008-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF2496C52E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 19:19:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzTjV5gFFz2ysc;
	Thu,  5 Sep 2024 03:18:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::228"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725470318;
	cv=none; b=YJVV1iJHiCBYev08At3jT7t0mCRBpJ5abq7u4mAZ4MFc+UZl2AnvJZzqwmVOoLEjiY8Gp3bma6mTndA/BVt11IOJ5cFR6MgLJXPQ+T3Cd5hpYdxVtE0PL6aMXS+Awl5ZHnYeVMbuloSWdwMUAWnjS70tI19WTQGPZvLB7Ta4EodxCLYgE3S4SKG6mV8WLvnYuwcDG2IbdkQEsPaStU40/nfVCVWZlmWXkmHeVlMREwuIeaJukqq+sn2Hb5TKAXC4sdyza1z8I7+L0mCYaf9TQbIPmPSsVu5KzOVJhUPiR7gJCxRjBVE2fxPzxchBbsbWC+qVNQzMO1N8f/x7OkIPlA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725470318; c=relaxed/relaxed;
	bh=Bk1fyWjuAOX2npTkzedEJmStz9C1KpBm4OMnXM/joPg=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version; b=QiCMKkQ7oE6jw6KwnNyP2R402BH36EgND5Ne2fpju+JBXQFqvR/GXwONcJugXuqTgpgxwX563p9Vz7HDHvCLc4QV+mmQt2QSqAWj2iWcTtKumeSbUxzTbLQw+FIx3Rg08W4pmOSeaRVToDHgEDwpnzjZSYTp644VJhzQ+hOvW7DgmhduDAyS6fG787Rl5A6gd0C85X+GQn74w4+VB3fRk8hkydbHw2aIo0c75aJRrZHMIZJLGXiJsCx8ORaVuHVu7ewopQAO453Vmb//N5hWiuqdpLM3xyvYLGMI08tggkBPVrg9w9lpB+aemqwO9XLQAy246TAGGjcV65MA8WNJrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=UPrgz8sc; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=UPrgz8sc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzTjT5qWjz2yps
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 03:18:37 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B62C21BF20B;
	Wed,  4 Sep 2024 17:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725470310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bk1fyWjuAOX2npTkzedEJmStz9C1KpBm4OMnXM/joPg=;
	b=UPrgz8scPZZ2Smhz4tvaFmq9lmaRBnaiCtFYznixbjcrclk00OEMIRmAuOJynduD6jDpFS
	fA4/UFE19QrxEq2ptqwquUmYrjPbdg2tEVjny3K/atMgQOaY2P8qe9bI2j1imN7IyG9TtA
	bNb5tia2Lwce1+Kzr6P+QB1U8UeAQl2liisTzzNaHVgPTvjnHa8HsgDIRHUsDcgZFwtX8w
	32NCg2obaJM2npvOoRTJXAHYx2HZKAbajIOunsfj2bx4UnF6zRIuBK/6UPZMGrIJ9vGpP2
	jyJdOAB5Bvfe7FXoGK4Q2YWEsDX2dllvDmOXtYhUvBH62t7BfRk3o5UVQbNM+w==
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
Subject: [PATCH net-next v3 6/8] net: ethernet: fs_enet: use macros for speed and duplex values
Date: Wed,  4 Sep 2024 19:18:19 +0200
Message-ID: <20240904171822.64652-7-maxime.chevallier@bootlin.com>
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

The PHY speed and duplex should be manipulated using the SPEED_XXX and
DUPLEX_XXX macros available. Use it in the fcc, fec and scc MAC for
fs_enet.

Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/freescale/fs_enet/mac-fcc.c | 4 ++--
 drivers/net/ethernet/freescale/fs_enet/mac-fec.c | 2 +-
 drivers/net/ethernet/freescale/fs_enet/mac-scc.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c b/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
index 159a384813b3..666a54d6e667 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
@@ -360,7 +360,7 @@ static void restart(struct net_device *dev)
 
 	/* adjust to speed (for RMII mode) */
 	if (fpi->use_rmii) {
-		if (dev->phydev->speed == 100)
+		if (dev->phydev->speed == SPEED_100)
 			C8(fcccp, fcc_gfemr, 0x20);
 		else
 			S8(fcccp, fcc_gfemr, 0x20);
@@ -386,7 +386,7 @@ static void restart(struct net_device *dev)
 		S32(fccp, fcc_fpsmr, FCC_PSMR_RMII);
 
 	/* adjust to duplex mode */
-	if (dev->phydev->duplex)
+	if (dev->phydev->duplex == DUPLEX_FULL)
 		S32(fccp, fcc_fpsmr, FCC_PSMR_FDE | FCC_PSMR_LPB);
 	else
 		C32(fccp, fcc_fpsmr, FCC_PSMR_FDE | FCC_PSMR_LPB);
diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-fec.c b/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
index cf4c49e884ba..c1b7877178b9 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
@@ -308,7 +308,7 @@ static void restart(struct net_device *dev)
 	/*
 	 * adjust to duplex mode
 	 */
-	if (dev->phydev->duplex) {
+	if (dev->phydev->duplex == DUPLEX_FULL) {
 		FC(fecp, r_cntrl, FEC_RCNTRL_DRT);
 		FS(fecp, x_cntrl, FEC_TCNTRL_FDEN);	/* FD enable */
 	} else {
diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-scc.c b/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
index 6edc9f66ae83..d061092ced6c 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
@@ -337,7 +337,7 @@ static void restart(struct net_device *dev)
 	W16(sccp, scc_psmr, SCC_PSMR_ENCRC | SCC_PSMR_NIB22);
 
 	/* Set full duplex mode if needed */
-	if (dev->phydev->duplex)
+	if (dev->phydev->duplex == DUPLEX_FULL)
 		S16(sccp, scc_psmr, SCC_PSMR_LPB | SCC_PSMR_FDE);
 
 	/* Restore multicast and promiscuous settings */
-- 
2.46.0


