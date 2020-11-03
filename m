Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABE82A3B8C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 05:53:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQHVP5RnWzDqVr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 15:53:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=O2y5lvzn; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQH665pzyzDqSh
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 15:35:58 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id t6so7959756plq.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Nov 2020 20:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ppYNoquUFvSDgQ0kDzqxFcaBErf141d6C668dXHzNKM=;
 b=O2y5lvznkjkeft3eqwo7/wRUV0zEWzjCRHCnPESMEdoKEDGAE/ISioy1T5a8oDfB5H
 sc/bhX33zdMpuBK6Qh+r034knq3rSYqgCeKwKiurdiEhYFFSWE3uQba3zBnZnaksj7H7
 pScuOWwD+liyRypM/eZJ2b31edDZWe6ZDeOwtxUnwzWORCa0O3Br1Begrkd/bHoKBBnE
 OHiIW+Kgj+YmvD3k+OkA3L7PYAdZjG0jaRJ2zGMo70QWkPiMegoZ6upUw9FGBlrxThdw
 9dSmFHw2PZP1XsukankcyEOT1RYdgW2QKsoPLkIBj/P7HMHV9rj4Czn2tkU8NYSCRtAP
 Jswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ppYNoquUFvSDgQ0kDzqxFcaBErf141d6C668dXHzNKM=;
 b=ktNrs0+CFM84Z0wa8fpkY8nUrgHplkxoLrf9VJXEoVEygaGs7woMp1LvIJm8ZvPIqB
 o0lT3sUvIp8H+BeKn4dbcl3HE+gBCBwEmSdSH4fYxCjY7AueVxQIMeiijqBIJbRIdOPk
 tZuKlm9O1b6IB1drhVX1WYdr4OxE60y2L5LdaGkisBaH3nCPQqflvzaMr8hWK5AGbzEx
 QrucHUdQXbqmBWvBlp7ZILNiYAnFcGGOlJ6RXh2cgz4icTPSQb/AnF1vmMw6wN8NiRCd
 DyJs9T5V2wlTiZHiD9deyl63loo35IlA0mv3elspGQue8hB1ls3Bxoo6+WTtI/y6O/A3
 rxag==
X-Gm-Message-State: AOAM530TDrUvB4d00BdNEvtxfZZOY/7/oUmOGY1vdQ5UjRCEkhw25tEw
 TbfiWjEpsh5TQ9p5Yy2QHGJ1a9J1pBk=
X-Google-Smtp-Source: ABdhPJzlhhnfW7ELcL2w6oLceZcIQEEGdTsBNZPgb+P3mEdliP70rR3iv+wNjW8fkYCoaHNurRc+ZQ==
X-Received: by 2002:a17:902:a5c5:b029:d5:dc92:49e7 with SMTP id
 t5-20020a170902a5c5b02900d5dc9249e7mr24335788plq.25.1604378154467; 
 Mon, 02 Nov 2020 20:35:54 -0800 (PST)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com
 (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
 by smtp.gmail.com with ESMTPSA id o16sm2579116pgn.66.2020.11.02.20.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 20:35:54 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 10/18] powerpc/83xx: Move PHB discovery
Date: Tue,  3 Nov 2020 15:35:15 +1100
Message-Id: <20201103043523.916109-10-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201103043523.916109-1-oohall@gmail.com>
References: <20201103043523.916109-1-oohall@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
compile tested with mpc83xx_defconfig
---
 arch/powerpc/platforms/83xx/asp834x.c     | 1 +
 arch/powerpc/platforms/83xx/km83xx.c      | 1 +
 arch/powerpc/platforms/83xx/misc.c        | 2 --
 arch/powerpc/platforms/83xx/mpc830x_rdb.c | 1 +
 arch/powerpc/platforms/83xx/mpc831x_rdb.c | 1 +
 arch/powerpc/platforms/83xx/mpc832x_mds.c | 1 +
 arch/powerpc/platforms/83xx/mpc832x_rdb.c | 1 +
 arch/powerpc/platforms/83xx/mpc834x_itx.c | 1 +
 arch/powerpc/platforms/83xx/mpc834x_mds.c | 1 +
 arch/powerpc/platforms/83xx/mpc836x_mds.c | 1 +
 arch/powerpc/platforms/83xx/mpc836x_rdk.c | 1 +
 arch/powerpc/platforms/83xx/mpc837x_mds.c | 1 +
 arch/powerpc/platforms/83xx/mpc837x_rdb.c | 1 +
 13 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/83xx/asp834x.c b/arch/powerpc/platforms/83xx/asp834x.c
index 28474876f41b..68061c2a57c1 100644
--- a/arch/powerpc/platforms/83xx/asp834x.c
+++ b/arch/powerpc/platforms/83xx/asp834x.c
@@ -44,6 +44,7 @@ define_machine(asp834x) {
 	.name			= "ASP8347E",
 	.probe			= asp834x_probe,
 	.setup_arch		= asp834x_setup_arch,
+	.discover_phbs		= mpc83xx_setup_pci,
 	.init_IRQ		= mpc83xx_ipic_init_IRQ,
 	.get_irq		= ipic_get_irq,
 	.restart		= mpc83xx_restart,
diff --git a/arch/powerpc/platforms/83xx/km83xx.c b/arch/powerpc/platforms/83xx/km83xx.c
index bcdc2c203ec9..108e1e4d2683 100644
--- a/arch/powerpc/platforms/83xx/km83xx.c
+++ b/arch/powerpc/platforms/83xx/km83xx.c
@@ -180,6 +180,7 @@ define_machine(mpc83xx_km) {
 	.name		= "mpc83xx-km-platform",
 	.probe		= mpc83xx_km_probe,
 	.setup_arch	= mpc83xx_km_setup_arch,
+	.discover_phbs	= mpc83xx_setup_pci,
 	.init_IRQ	= mpc83xx_ipic_init_IRQ,
 	.get_irq	= ipic_get_irq,
 	.restart	= mpc83xx_restart,
diff --git a/arch/powerpc/platforms/83xx/misc.c b/arch/powerpc/platforms/83xx/misc.c
index a952e91db3ee..3285dabcf923 100644
--- a/arch/powerpc/platforms/83xx/misc.c
+++ b/arch/powerpc/platforms/83xx/misc.c
@@ -132,8 +132,6 @@ void __init mpc83xx_setup_arch(void)
 		setbat(-1, va, immrbase, immrsize, PAGE_KERNEL_NCG);
 		update_bats();
 	}
-
-	mpc83xx_setup_pci();
 }
 
 int machine_check_83xx(struct pt_regs *regs)
diff --git a/arch/powerpc/platforms/83xx/mpc830x_rdb.c b/arch/powerpc/platforms/83xx/mpc830x_rdb.c
index 51426e88ec67..956d4389effa 100644
--- a/arch/powerpc/platforms/83xx/mpc830x_rdb.c
+++ b/arch/powerpc/platforms/83xx/mpc830x_rdb.c
@@ -48,6 +48,7 @@ define_machine(mpc830x_rdb) {
 	.name			= "MPC830x RDB",
 	.probe			= mpc830x_rdb_probe,
 	.setup_arch		= mpc830x_rdb_setup_arch,
+	.discover_phbs		= mpc83xx_setup_pci,
 	.init_IRQ		= mpc83xx_ipic_init_IRQ,
 	.get_irq		= ipic_get_irq,
 	.restart		= mpc83xx_restart,
diff --git a/arch/powerpc/platforms/83xx/mpc831x_rdb.c b/arch/powerpc/platforms/83xx/mpc831x_rdb.c
index 5ccd57a48492..3b578f080e3b 100644
--- a/arch/powerpc/platforms/83xx/mpc831x_rdb.c
+++ b/arch/powerpc/platforms/83xx/mpc831x_rdb.c
@@ -48,6 +48,7 @@ define_machine(mpc831x_rdb) {
 	.name			= "MPC831x RDB",
 	.probe			= mpc831x_rdb_probe,
 	.setup_arch		= mpc831x_rdb_setup_arch,
+	.discover_phbs		= mpc83xx_setup_pci,
 	.init_IRQ		= mpc83xx_ipic_init_IRQ,
 	.get_irq		= ipic_get_irq,
 	.restart		= mpc83xx_restart,
diff --git a/arch/powerpc/platforms/83xx/mpc832x_mds.c b/arch/powerpc/platforms/83xx/mpc832x_mds.c
index 6fa5402ebf20..850d566ef900 100644
--- a/arch/powerpc/platforms/83xx/mpc832x_mds.c
+++ b/arch/powerpc/platforms/83xx/mpc832x_mds.c
@@ -101,6 +101,7 @@ define_machine(mpc832x_mds) {
 	.name 		= "MPC832x MDS",
 	.probe 		= mpc832x_sys_probe,
 	.setup_arch 	= mpc832x_sys_setup_arch,
+	.discover_phbs	= mpc83xx_setup_pci,
 	.init_IRQ	= mpc83xx_ipic_init_IRQ,
 	.get_irq 	= ipic_get_irq,
 	.restart 	= mpc83xx_restart,
diff --git a/arch/powerpc/platforms/83xx/mpc832x_rdb.c b/arch/powerpc/platforms/83xx/mpc832x_rdb.c
index 622c625d5ce4..b6133a237a70 100644
--- a/arch/powerpc/platforms/83xx/mpc832x_rdb.c
+++ b/arch/powerpc/platforms/83xx/mpc832x_rdb.c
@@ -219,6 +219,7 @@ define_machine(mpc832x_rdb) {
 	.name		= "MPC832x RDB",
 	.probe		= mpc832x_rdb_probe,
 	.setup_arch	= mpc832x_rdb_setup_arch,
+	.discover_phbs  = mpc83xx_setup_pci,
 	.init_IRQ	= mpc83xx_ipic_init_IRQ,
 	.get_irq	= ipic_get_irq,
 	.restart	= mpc83xx_restart,
diff --git a/arch/powerpc/platforms/83xx/mpc834x_itx.c b/arch/powerpc/platforms/83xx/mpc834x_itx.c
index ebfd139bca20..9630f3aa4d9c 100644
--- a/arch/powerpc/platforms/83xx/mpc834x_itx.c
+++ b/arch/powerpc/platforms/83xx/mpc834x_itx.c
@@ -70,6 +70,7 @@ define_machine(mpc834x_itx) {
 	.name			= "MPC834x ITX",
 	.probe			= mpc834x_itx_probe,
 	.setup_arch		= mpc834x_itx_setup_arch,
+	.discover_phbs  	= mpc83xx_setup_pci,
 	.init_IRQ		= mpc83xx_ipic_init_IRQ,
 	.get_irq		= ipic_get_irq,
 	.restart		= mpc83xx_restart,
diff --git a/arch/powerpc/platforms/83xx/mpc834x_mds.c b/arch/powerpc/platforms/83xx/mpc834x_mds.c
index 356228e35279..6d91bdce0a18 100644
--- a/arch/powerpc/platforms/83xx/mpc834x_mds.c
+++ b/arch/powerpc/platforms/83xx/mpc834x_mds.c
@@ -91,6 +91,7 @@ define_machine(mpc834x_mds) {
 	.name			= "MPC834x MDS",
 	.probe			= mpc834x_mds_probe,
 	.setup_arch		= mpc834x_mds_setup_arch,
+	.discover_phbs  	= mpc83xx_setup_pci,
 	.init_IRQ		= mpc83xx_ipic_init_IRQ,
 	.get_irq		= ipic_get_irq,
 	.restart		= mpc83xx_restart,
diff --git a/arch/powerpc/platforms/83xx/mpc836x_mds.c b/arch/powerpc/platforms/83xx/mpc836x_mds.c
index 90d9cbfae659..da4cf52cb55b 100644
--- a/arch/powerpc/platforms/83xx/mpc836x_mds.c
+++ b/arch/powerpc/platforms/83xx/mpc836x_mds.c
@@ -201,6 +201,7 @@ define_machine(mpc836x_mds) {
 	.name		= "MPC836x MDS",
 	.probe		= mpc836x_mds_probe,
 	.setup_arch	= mpc836x_mds_setup_arch,
+	.discover_phbs  = mpc83xx_setup_pci,
 	.init_IRQ	= mpc83xx_ipic_init_IRQ,
 	.get_irq	= ipic_get_irq,
 	.restart	= mpc83xx_restart,
diff --git a/arch/powerpc/platforms/83xx/mpc836x_rdk.c b/arch/powerpc/platforms/83xx/mpc836x_rdk.c
index b4aac2cde849..3427ad0d9d38 100644
--- a/arch/powerpc/platforms/83xx/mpc836x_rdk.c
+++ b/arch/powerpc/platforms/83xx/mpc836x_rdk.c
@@ -41,6 +41,7 @@ define_machine(mpc836x_rdk) {
 	.name		= "MPC836x RDK",
 	.probe		= mpc836x_rdk_probe,
 	.setup_arch	= mpc836x_rdk_setup_arch,
+	.discover_phbs  = mpc83xx_setup_pci,
 	.init_IRQ	= mpc83xx_ipic_init_IRQ,
 	.get_irq	= ipic_get_irq,
 	.restart	= mpc83xx_restart,
diff --git a/arch/powerpc/platforms/83xx/mpc837x_mds.c b/arch/powerpc/platforms/83xx/mpc837x_mds.c
index 9d3721c965be..f28d166ea7db 100644
--- a/arch/powerpc/platforms/83xx/mpc837x_mds.c
+++ b/arch/powerpc/platforms/83xx/mpc837x_mds.c
@@ -93,6 +93,7 @@ define_machine(mpc837x_mds) {
 	.name			= "MPC837x MDS",
 	.probe			= mpc837x_mds_probe,
 	.setup_arch		= mpc837x_mds_setup_arch,
+	.discover_phbs  	= mpc83xx_setup_pci,
 	.init_IRQ		= mpc83xx_ipic_init_IRQ,
 	.get_irq		= ipic_get_irq,
 	.restart		= mpc83xx_restart,
diff --git a/arch/powerpc/platforms/83xx/mpc837x_rdb.c b/arch/powerpc/platforms/83xx/mpc837x_rdb.c
index 7c45f7ac2607..7fb7684c256b 100644
--- a/arch/powerpc/platforms/83xx/mpc837x_rdb.c
+++ b/arch/powerpc/platforms/83xx/mpc837x_rdb.c
@@ -73,6 +73,7 @@ define_machine(mpc837x_rdb) {
 	.name			= "MPC837x RDB/WLAN",
 	.probe			= mpc837x_rdb_probe,
 	.setup_arch		= mpc837x_rdb_setup_arch,
+	.discover_phbs  	= mpc83xx_setup_pci,
 	.init_IRQ		= mpc83xx_ipic_init_IRQ,
 	.get_irq		= ipic_get_irq,
 	.restart		= mpc83xx_restart,
-- 
2.26.2

