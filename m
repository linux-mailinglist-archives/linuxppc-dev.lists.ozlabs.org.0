Return-Path: <linuxppc-dev+bounces-757-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4917E964B43
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 18:15:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wvmbf4CVjz2yxj;
	Fri, 30 Aug 2024 02:15:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.183.196
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724948142;
	cv=none; b=krzrcpF8jyGE/3ZCf1r0PmdU0DptaWIfNlrQgdoH0D6XrwTTcxpn5U+WUkWdMHsNZONRvjDahmU489MGGZKCS/u4XhClOTtK2ZiZ/0Fa8tQOeqvpluXUbyyWT43nnWLbw+jPHi4JISU/7UQzDzrM+/L9/uYRAvba3B2P7KCnORhRiBTR7ZcKX6PHgu4eFyHaPT6vWAU9MdTNWgHdwL8U/ktu1+teLYTNUUk1MByrVCav828ghC9nf9YWkOT23rZ4HJr0RekGrWjBuMJiqFdsvkHCfbQw/FQNQ7cGpU3yIE9rnh2zeXav7Ehyhwwmn4xuvUDGMd6YeiWzWj/9Dgzlew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724948142; c=relaxed/relaxed;
	bh=0vuOt+NHbIh5Cg7TPcqHURwe6Z6pj5J1DJ2kb2OIUYY=;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-GND-Sasl; b=X+ifnCBxcj9mIx3Gz2s8Af5MRa/77Xbd6Wkdk/ZyM2rEImR0MvAA9rlDa1ZyJ5tnmFQ94eDvLdtzUev+OrTAZLCo/ZZ6dN1ZUxBR3/v/H9bt7MwKca/Bp/kLo57VcYIQflY7xIVYxHKPTtyItxb2ZsCMTKNOQr+QpTyWh+4YYzZ3T/DpniCJCKR8LmFxZ944/lH3xJr5ieofAvnj7/HhHio/IPKY55QG4oBqFzHQVnlBxPdZRE8Zke0usPV0eoidzHEthWtNW+0DCLU6yDbOVeljTwqP3oyBMW1J58uPxr9GatDoBVa5ZPEiqdKfpyvlmoksC/oy3183o9eZhygTXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=lbF6uZfV; dkim-atps=neutral; spf=pass (client-ip=217.70.183.196; helo=relay4-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=lbF6uZfV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.196; helo=relay4-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wvmbd5SHSz2ytT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 02:15:38 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D927E0005;
	Thu, 29 Aug 2024 16:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724948135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0vuOt+NHbIh5Cg7TPcqHURwe6Z6pj5J1DJ2kb2OIUYY=;
	b=lbF6uZfVOl4fkrKhGjmJa5FGrAgzwqctj07jStu/Ko3bG1LjAX6f/hfI7ClBisdb/xIlGJ
	l3GD1sI9WoeCU3KqqictYFVzhk55qo40zM5fVtXF07gNAKQrkoJ3R0sPKmpJ5bFo3skC+Z
	MvfuT39CfAao1FQ2wPknVdkmPdwMNXV+TvH/VNS3WIVg7Jcl7W3XGxJZQuEKiFfCwCbE3o
	8LKxAQPc3xNNG7x2FxJtPBfN1HNv6/qnOJax1A/F1EJoP6bHeJU94f961CcMIQ3/9cuQjJ
	6nhux3IRX3fDmfG0ueHzLZv6uv4yh9pEQXjE7497jVQKiHerkzFMgsspz+kJyA==
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
Subject: [PATCH net-next v2 1/7] net: ethernet: fs_enet: convert to SPDX
Date: Thu, 29 Aug 2024 18:15:24 +0200
Message-ID: <20240829161531.610874-2-maxime.chevallier@bootlin.com>
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

The ENET driver has SPDX tags in the header files, but they were missing
in the C files. Change the licence information to SPDX format.

Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
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


