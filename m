Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C022769DC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 08:58:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bxm8m2vpKzDqfc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 16:58:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UN3Tepgl; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxlkT1DrDzDqc9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 16:38:57 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id y17so1144530plb.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 23:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ppYNoquUFvSDgQ0kDzqxFcaBErf141d6C668dXHzNKM=;
 b=UN3TepglHmZVFZq8BFChRfOk5OnjNU2T5mkU9KTNtyySof9lexicwjsVVhld9gieId
 VeLJFd7PBpWYa5ZGOSIvabAjVORn2JoJNHVmRT4P6M/S8skbaTrd0o8rlItrv+ogqKcm
 Eko52va3oUXykOfUaWnG42ZR+M11f7CjDk23VNlIPvDssZ+tqy+f61GHPfMh9cYscKy9
 658DztRSaBNP07iDFEl9oEbWLwL7UvVSST6kGKb5nKcL692OHNQp8X82fT32qqGqPRvL
 tNplUmC/CMthzQE55/j7ZaaZZlf1L/o8I1DBawGoe/F4tybk00XKSE8D2iqzpS/w1aJk
 sD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ppYNoquUFvSDgQ0kDzqxFcaBErf141d6C668dXHzNKM=;
 b=dqvBl7foqL0zvfMC8u2p3Wb0CUVIqYKKL/Pbr+X6t7H/AJk0VAZLgw6dudsWYM5mY4
 UZi8NRbfI+MTdmfSWEQ2ZpvQ7TwrO85uYoIVf1StKVKbwykHZqxBgwhsE9m69BszfFiM
 WArZ05KAx5jjnR1sXHgIpBh03oSzSSMIWp5Y6F9fI7kMy/SHxhvbqt1IJHbbwvTdT1D3
 ttHEfGtOpELeUPseTyBhgacUr7pb3TCy1Y2xSItOhbm9oVdxKUA2Q4kBZKQfcxCcYmIB
 r4GPuCUNrlN8PAaDxDjpW7r9Z0Xa9qAZ6TD1RNiTRAymTcMpXwoT/vEJbFP9yJi31ixG
 2SlA==
X-Gm-Message-State: AOAM533r4cmzgfVdckXcMGmHWiG60wx/G+R7G+FwWouH4/dnjKcTqqSL
 1eOLlYgqeCT2n1bZKsRTUGeWn35U2BTCbw==
X-Google-Smtp-Source: ABdhPJw7Nlp3y0rYOum2Vnmo5lUM3NQ7hVnTrTFoxZplbnLZ5ZRZT6O0CL0LU10J7ye5X9b325W8rA==
X-Received: by 2002:a17:902:c3c9:b029:d1:e5e7:bdd9 with SMTP id
 j9-20020a170902c3c9b02900d1e5e7bdd9mr3215123plj.57.1600929534370; 
 Wed, 23 Sep 2020 23:38:54 -0700 (PDT)
Received: from localhost.ibm.com (194-193-34-182.tpgi.com.au. [194.193.34.182])
 by smtp.gmail.com with ESMTPSA id y1sm1662930pgr.3.2020.09.23.23.38.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 23:38:53 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 10/18] powerpc/83xx: Move PHB discovery
Date: Thu, 24 Sep 2020 16:38:11 +1000
Message-Id: <20200924063819.262830-10-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200924063819.262830-1-oohall@gmail.com>
References: <20200924063819.262830-1-oohall@gmail.com>
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

