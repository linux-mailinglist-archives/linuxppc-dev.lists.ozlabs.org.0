Return-Path: <linuxppc-dev+bounces-1006-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 558F196C52B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 19:19:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzTjV4QnKz2ysB;
	Thu,  5 Sep 2024 03:18:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::228"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725470318;
	cv=none; b=lpgthE5ErFbU1cC+3dPUDbM0zqrcfD6pGl0o4b+rNCBZa034UvAn/mwsGv5orqir51Mr6c9euK+TJZh/3qU22A0IYZ+ZalcSVIFmVBZCdck8shFyICsMvt/D6otCDIVRuvjUHEn6NUI4JztF67Su7BUVixmOW9B3Z3I10FtdVKZWrV2J5GvHtd0z6qrpK6kHnDgusAK0PfOKRoet1dEUHMTGQ5AISg/Cq8Qx6h7YywDU9DO/EoVKvPqfmhGCtmGku58+fCVdJA9GyhsjrZFc/54LmF+F9teIf4s0NGqQK36qXXhGFHZ7Hp141QNC3ZOyC143q0v2eogNm3LxirP6Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725470318; c=relaxed/relaxed;
	bh=itWlvP5P5XgxiQ6iKEXH6a9ldcid6vjBdW4WsWfjArY=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version; b=c29Yb4Y/isZAGKcX40Sad+VB76DQWaevrzKYbFBeHdzPGXP6PJLRBAbCaHyryE4akEr5Yf7Uk+wQGH0THS1fOd9wRFQDUTBdn7BJE4qvk5xUlYVrZEjg8KhMBpNxrV2RX6aXqprumcX6qbTAowv1sa2AlvQqXllxMb2uNWoPpwIPp6jiTQQ2YaTIuflVxIGgZLcc0o5gYDxqYuf4SaTh14M8/Ke5JjEcxfO23RUqd7aW1vjm9p4Tb12FpsAxrZmsxhnbFO/2zE6rhXgBkksh07MnrPCKVBZr31opPnlM2Ger6ijKvulUnldbMqhuHoqrnJntaVcRM0xYZWERQx8lgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=buReFsYY; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=buReFsYY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzTjT5RGnz2ypj
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 03:18:37 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B74D41BF206;
	Wed,  4 Sep 2024 17:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725470306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=itWlvP5P5XgxiQ6iKEXH6a9ldcid6vjBdW4WsWfjArY=;
	b=buReFsYYQE5lqUkBGnRWK0lIoCrccS34ioCzRcaYWEiPvr92+nD5Yp90tR14QbftUfsji2
	/WGOw4FeVMnZmPXwxDCP7YyTItBN1CggaldEXiryAuoCTTupTXITjTS09hFySOsnH9XhNB
	FXK+ZHC4cIlhmyXSZcIz2Pi6/fgc1whNjitP8XIb/Ux8+DqUQTnCy++Hdbj7pNMZ7QkmjZ
	NlliFLC3GK688vmUaGKF68QMEE41guqIuRabYIWVR/NMkC/fuMifZyQZ9X6Sb3+udQ5jks
	icZ3XNCPzHduCTUddUJFoptYffj8aDjO8ikqkKyyfTFhaaE3FIfb0uNvbk5wNw==
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
Subject: [PATCH net-next v3 1/8] net: ethernet: fs_enet: convert to SPDX
Date: Wed,  4 Sep 2024 19:18:14 +0200
Message-ID: <20240904171822.64652-2-maxime.chevallier@bootlin.com>
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

The ENET driver has SPDX tags in the header files, but they were missing
in the C files. Change the licence information to SPDX format.

Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
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
2.46.0


