Return-Path: <linuxppc-dev+bounces-680-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 543F09624DF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 12:27:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv0vp1hsPz2yhG;
	Wed, 28 Aug 2024 20:27:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.178.240
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724840044;
	cv=none; b=Ld6bCr+decQG+G4+H21+oZSg1/v/erdYHAtvDC7HaO25B9cq5uQF+1Hu1Op6HHaPECMZC43zcQHFvNZeXA7e2JjHPOgW33tGl6llHgf7a4fpEehV2bC1ZA84PgCNhD+HRPf1y6rw368fOq5pJm/4joGMujOnM3CWIMm7DsH1QyA7kRtes4SMeE4WRNK8Jp/UdetpsvQBFMa3Wyi1+CcyajR7KnRsRpsW7mK0TZ7CVfdFFA9OLEr3gsQUB/Wy2eiJaT753tuPcGJR8qFg4z60OPYsQnUL3pAZpW311BZKWQ/GhdZjECv6tIXDntlXJTIcW5nJZujzhs5hDBlrRRDzWA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724840044; c=relaxed/relaxed;
	bh=e0hzvG0hZsY1WlPlvceV3QEtbLRs4+O1bK+FGJ2ZLwI=;
	h=Received:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-GND-Sasl; b=e9higxVJkT3ZLRCEx1Hjlf4HmGjTTPrW5/oFh4D6IAxRnCXk30v/J33UZSerxcynh47e5anNryv2SD3v/M+vUFzpsHsb8qxnttFAA8vvRXIwRQJUevZU+WdM7sWKMNyMVN2gWCV7VvYV/0Cj64xr9CLhF2GBGwfIQ6Xy+MVy23PvBch8BpdBgzFed6TeiNYjF8FaWQZuEKQW6I20fmsWZT0C3YS/wZsHOXIr42HlJ8WxeHYR+su+KNx6jAyFNX5s/tUuiGX1GkfeRvwttEhnRG8jYJ7C65asufdl/agMSJ6nMlnYIQdPtxtx6kzus2quHasnxKlT0srv0IZLB0Lasg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=JEl7GRvj; dkim-atps=neutral; spf=pass (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=JEl7GRvj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wv0cq6RVcz2y83
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 20:14:03 +1000 (AEST)
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 38553C80D2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 09:51:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ED1BA1C000C;
	Wed, 28 Aug 2024 09:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724838668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e0hzvG0hZsY1WlPlvceV3QEtbLRs4+O1bK+FGJ2ZLwI=;
	b=JEl7GRvjUa6PAT9bOWi3WscuC5JkXQnnLHtPr8TQdtIO0tYY3ZAU0Q4B63Uws4vCGZVgq5
	4LsnJjPGv+dZFrchzehXUHV9/H4O9qdEEBXpDtKf92HC5s+COTlIJrXLu9/bDEPweIahh0
	dBZ2jSFOtjGlbbSi/+5JObsohrcSvW8jA4WZy5xrBy9sHyVcUWHMRYiv2TQm/2CmI4715p
	F2tw7aZVJqtGCwb8ItRCH8CwDevUCq3OlXHB9Sl62x1f/8YF1GZumHejxmEI6cb0jUrYk/
	gt2RMs1nBsBlg6Makm5F+LZ5X0Qn5cdXjcT7Z28yGy0r2JVLA8xp2AjXJPa+Iw==
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
Subject: [PATCH net-next 1/6] net: ethernet: fs_enet: convert to SPDX
Date: Wed, 28 Aug 2024 11:50:57 +0200
Message-ID: <20240828095103.132625-2-maxime.chevallier@bootlin.com>
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

The ENET driver has SPDX tags in the header files, but they were missing
in the C files. Change the licence information to SPDX format.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c | 5 +----
 drivers/net/ethernet/freescale/fs_enet/mac-fcc.c      | 5 +----
 drivers/net/ethernet/freescale/fs_enet/mac-fec.c      | 5 +----
 drivers/net/ethernet/freescale/fs_enet/mac-scc.c      | 5 +----
 drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c  | 5 +----
 drivers/net/ethernet/freescale/fs_enet/mii-fec.c      | 5 +----
 6 files changed, 6 insertions(+), 24 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
index cf392faa6105..5bfdd43ffdeb 100644
--- a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
+++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Combined Ethernet driver for Motorola MPC8xx and MPC82xx.
  *
@@ -9,10 +10,6 @@
  *
  * Heavily based on original FEC driver by Dan Malek <dan@embeddededge.com>
  * and modifications by Joakim Tjernlund <joakim.tjernlund@lumentis.se>
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2. This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
  */
 
 #include <linux/module.h>
diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c b/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
index e2ffac9eb2ad..add062928d99 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * FCC driver for Motorola MPC82xx (PQ2).
  *
@@ -6,10 +7,6 @@
  *
  * 2005 (c) MontaVista Software, Inc.
  * Vitaly Bordug <vbordug@ru.mvista.com>
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2. This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
  */
 
 #include <linux/module.h>
diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-fec.c b/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
index cdc89d83cf07..f75acb3b358f 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Freescale Ethernet controllers
  *
@@ -6,10 +7,6 @@
  *
  * 2005 (c) MontaVista Software, Inc.
  * Vitaly Bordug <vbordug@ru.mvista.com>
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2. This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
  */
 
 #include <linux/module.h>
diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-scc.c b/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
index 9e89ac2b6ce3..29ba0048396b 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Ethernet on Serial Communications Controller (SCC) driver for Motorola MPC8xx and MPC82xx.
  *
@@ -6,10 +7,6 @@
  *
  * 2005 (c) MontaVista Software, Inc.
  * Vitaly Bordug <vbordug@ru.mvista.com>
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2. This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
  */
 
 #include <linux/module.h>
diff --git a/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c b/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c
index f965a2329055..2e210a003558 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Combined Ethernet driver for Motorola MPC8xx and MPC82xx.
  *
@@ -6,10 +7,6 @@
  *
  * 2005 (c) MontaVista Software, Inc.
  * Vitaly Bordug <vbordug@ru.mvista.com>
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2. This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
  */
 
 #include <linux/module.h>
diff --git a/drivers/net/ethernet/freescale/fs_enet/mii-fec.c b/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
index 7bb69727952a..93d91e8ad0de 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Combined Ethernet driver for Motorola MPC8xx and MPC82xx.
  *
@@ -6,10 +7,6 @@
  *
  * 2005 (c) MontaVista Software, Inc.
  * Vitaly Bordug <vbordug@ru.mvista.com>
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2. This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
  */
 
 #include <linux/module.h>
-- 
2.45.2


