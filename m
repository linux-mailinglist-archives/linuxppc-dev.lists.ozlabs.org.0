Return-Path: <linuxppc-dev+bounces-679-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 145019624DD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 12:26:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv0tx0SVkz2ymr;
	Wed, 28 Aug 2024 20:26:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.178.240
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724840012;
	cv=none; b=JaAMdVwyM3uD5EVwksT46+qAwqoqoqQGSM9k1ZRa1886NeOYjHE8+mWduV4G7isuSuO1OlLGXjYyrEpYwzQ/aaAi8fT0Jo+AglrUuj6AbrgYhIMh8KBGeV2CslnLtj1mApGuY2jseHiU0wEqCi8bw//kemgBDEpmz8T4upx52oBtsrI6M/E10Zmt6jMBNklHFHRdGJZsJAIac58mjNrnZ3O2SI2vCUPTJsZUM0gX+ln421mvri23mpeQ5kMDFXMH/V/3YrCeHzPXrYsK2My/F+0mpSGJldrDV61qZ4IIkF/SBhDQcIoxv8xkCl7duORFHHBu+/D1GKJBHhhDYGdsPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724840012; c=relaxed/relaxed;
	bh=DDXRMrWeQ8aU4zb8s3kfP4GpGlT2hUzH6QoOjKPcTqE=;
	h=Received:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-GND-Sasl; b=M0AhwaSz28wJkmtkY79aR9zD6PbclhGgdAKofClOiVtkeztexotuqeIOV1M3GOEvoXonmgcxFGxuHToJEtN1yi+YrLm+GA4k08OsAiL9jAE1wkpusDAHLq5MXELKqvAqWVZRUN/9XFcLKn5H3u1LwNKIXkMnNPidyWb137y92jx3u9tb3bD7MAzDkJ+4tHOKDLkj5yBYRghNUxssIHasURa6eWsOEmJjKrO1D5ie8cOw6s2aHncfTlHMRegv/J7dlsdWeInmsVQw5mIuI8AcwT53DJSGPi1NVsfeWz78yq42sOfThM2gfoIVM20lxAyapvh3XSbUPRrtTNDIDGydsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=D6RG9tFR; dkim-atps=neutral; spf=pass (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=D6RG9tFR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wv0cC2WwVz2yF1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 20:13:31 +1000 (AEST)
Received: from relay5-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::225])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id A7FF1C80EB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 09:51:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E65F21C0005;
	Wed, 28 Aug 2024 09:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724838672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DDXRMrWeQ8aU4zb8s3kfP4GpGlT2hUzH6QoOjKPcTqE=;
	b=D6RG9tFR5E0M9i0cqIRI1ADlaOQ3aobCwSQcYws9WO1z71VuMAfc/yzeGKlz/AJgNw+7D+
	606JZ6tojLqecjEQPxX6bl/UqEJSy9r2qKgMy6l2OkcmVwyFiGlmPOJgOAbv1Y/3FVuZx3
	Kdyx9vzvwJI5S5gGHRphEyUojFUgrJsnkG/D5oKljJ2+APrINXdhtrqIvUlKfi7y4HNtxm
	DG0J4gSyFJnycRlhy/AcHmuSvc7t8ZnaIJ4JD+uaskDNxXqVCuC8z6lswqP6zfVRz1V7gw
	vVYLlxNmiqqUxY62+POHZMlCnwmc31j2oivFl7+mOp3BOi7bnl08CUHha0RZGQ==
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
Subject: [PATCH net-next 5/6] net: ethernet: fs_enet: fcc: use macros for speed and duplex values
Date: Wed, 28 Aug 2024 11:51:01 +0200
Message-ID: <20240828095103.132625-6-maxime.chevallier@bootlin.com>
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

The PHY speed and duplex should be manipulated using the SPEED_XXX and
DUPLEX_XXX macros available. Use it in the fcc, fec and scc MAC for fs_enet.

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


