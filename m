Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE9F477FD5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 23:07:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFR7Z45tSz3f2c
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 09:07:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pWHMxAfw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2f;
 helo=mail-qv1-xf2f.google.com; envelope-from=nnac123@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=pWHMxAfw; dkim-atps=neutral
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFQzc15Lsz3bg8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 09:01:00 +1100 (AEDT)
Received: by mail-qv1-xf2f.google.com with SMTP id eq6so601900qvb.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 14:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SvfoRwarlMgvIvYa/P8Nf27AItm8tKqxGHfWo32PUKU=;
 b=pWHMxAfwY4UkA/Kya+MxfSPGFIyLtHL9PhCjG92XNdkIrr05nR7ebNMG6rKofJev5d
 FeZhb2obhNYh/VZYgrGTB4/9ExM/gbHqP9keGZp7/xt3veijQCZKRla1SIOvUDSFHJvv
 IKoj5EUaNcCK++OZkrFXapPrs38QE+VoDsyF9nA8cFS1rGLZ1NGnbaoSIhRXJ2JdefzS
 ViPlF5dNXmnTc7udA6EbdUujUqrcs+I4tt+nVu0QMDHZc0h5kNrwTkRQ+1tceTRDvdZl
 ayWgW+CK2WyAxLebcISCk5eDftUl9gNc8YuCX7SQlIDVckQAGhwyNQDCMvFe8grsH2zE
 alUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SvfoRwarlMgvIvYa/P8Nf27AItm8tKqxGHfWo32PUKU=;
 b=WaeqtirM3igAfA8OJoXjqCW3VvdQq+qq3VHDvuMOKAcbIaecddnsbXMuu0ikuyYCw8
 Mj65aZs8Ols1fHIBZCJfNwgTKgwoYgs68yTpq1gxhRFJJs153OHm2oeaPKxAdPNxhEpW
 YldCpPj1Tmq+ENK0c1/JXsbkjSovFT8m+a31JnV2NqM7krppvqj+fQxxpf7sXw+06fpY
 RokSdUVaXBrkY9EnBPpl/0TyGRz47htLdCr1ztTf7aJ7QXKN7LMi+ucbUyCNMw4MJeyM
 FKxIE6qQIxH5t+K3e7IqM2SAyMewD+0WHmj48rI/JnRyDRfqe5vGNQhBjqZf0y0e6Cck
 96Ww==
X-Gm-Message-State: AOAM532nA365roQUcXioKsHn2ZvxQBJptewErQ1uo6GbYtrdw09dnwgO
 nPi49UJzxi0XqcrnA1kec4Lko6BfAnY=
X-Google-Smtp-Source: ABdhPJy9kotmBSTOfagXxCp+u759tPPT2kx2+3tADv7eTe6dD5W1/0/APSEaAZnSaOIfphf7uk8jMA==
X-Received: by 2002:ad4:596d:: with SMTP id eq13mr18283651qvb.91.1639692057194; 
 Thu, 16 Dec 2021 14:00:57 -0800 (PST)
Received: from starship-12.hsd1.fl.comcast.net
 ([2601:589:4a00:1ed0:dce6:135:603d:e519])
 by smtp.gmail.com with ESMTPSA id y21sm5478483qtw.10.2021.12.16.14.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 14:00:56 -0800 (PST)
From: Nick Child <nnac123@gmail.com>
X-Google-Original-From: Nick Child <nick.child@ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 10/20] powerpc/powermac: Add __init attribute to eligible
 functions
Date: Thu, 16 Dec 2021 17:00:25 -0500
Message-Id: <20211216220035.605465-11-nick.child@ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211216220035.605465-1-nick.child@ibm.com>
References: <20211216220035.605465-1-nick.child@ibm.com>
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
Cc: Nick Child <nick.child@ibm.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some functions defined in 'arch/powerpc/platforms/powermac` are only
called by other initialization functions and therefore should inherit
the attribute.
Also, change function declarations in header files to include `__init`.

Signed-off-by: Nick Child <nick.child@ibm.com>
---
 arch/powerpc/include/asm/smu.h               | 2 +-
 arch/powerpc/include/asm/udbg.h              | 2 +-
 arch/powerpc/platforms/powermac/feature.c    | 2 +-
 arch/powerpc/platforms/powermac/nvram.c      | 2 +-
 arch/powerpc/platforms/powermac/pfunc_base.c | 6 +++---
 arch/powerpc/platforms/powermac/setup.c      | 2 +-
 arch/powerpc/platforms/powermac/smp.c        | 4 ++--
 arch/powerpc/platforms/powermac/udbg_scc.c   | 2 +-
 8 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/smu.h b/arch/powerpc/include/asm/smu.h
index 4b30a0205c93..2ac6ab903023 100644
--- a/arch/powerpc/include/asm/smu.h
+++ b/arch/powerpc/include/asm/smu.h
@@ -456,7 +456,7 @@ extern void smu_poll(void);
 /*
  * Init routine, presence check....
  */
-extern int smu_init(void);
+int __init smu_init(void);
 extern int smu_present(void);
 struct platform_device;
 extern struct platform_device *smu_get_ofdev(void);
diff --git a/arch/powerpc/include/asm/udbg.h b/arch/powerpc/include/asm/udbg.h
index 5aec53f2dae0..b4aa0d88ce2c 100644
--- a/arch/powerpc/include/asm/udbg.h
+++ b/arch/powerpc/include/asm/udbg.h
@@ -30,7 +30,7 @@ void __init udbg_uart_setup(unsigned int speed, unsigned int clock);
 unsigned int __init udbg_probe_uart_speed(unsigned int clock);
 
 struct device_node;
-extern void udbg_scc_init(int force_scc);
+void __init udbg_scc_init(int force_scc);
 extern int udbg_adb_init(int force_btext);
 extern void udbg_adb_init_early(void);
 
diff --git a/arch/powerpc/platforms/powermac/feature.c b/arch/powerpc/platforms/powermac/feature.c
index 5c77b9a24c0e..e67c624f35a2 100644
--- a/arch/powerpc/platforms/powermac/feature.c
+++ b/arch/powerpc/platforms/powermac/feature.c
@@ -1530,7 +1530,7 @@ static long g5_reset_cpu(struct device_node *node, long param, long value)
  * This takes the second CPU off the bus on dual CPU machines
  * running UP
  */
-void g5_phy_disable_cpu1(void)
+void __init g5_phy_disable_cpu1(void)
 {
 	if (uninorth_maj == 3)
 		UN_OUT(U3_API_PHY_CONFIG_1, 0);
diff --git a/arch/powerpc/platforms/powermac/nvram.c b/arch/powerpc/platforms/powermac/nvram.c
index 853ccc4480e2..de8fcb607290 100644
--- a/arch/powerpc/platforms/powermac/nvram.c
+++ b/arch/powerpc/platforms/powermac/nvram.c
@@ -258,7 +258,7 @@ static u32 core99_calc_adler(u8 *buffer)
 	return (high << 16) | low;
 }
 
-static u32 core99_check(u8* datas)
+static u32 __init core99_check(u8 *datas)
 {
 	struct core99_header* hdr99 = (struct core99_header*)datas;
 
diff --git a/arch/powerpc/platforms/powermac/pfunc_base.c b/arch/powerpc/platforms/powermac/pfunc_base.c
index f5422506d4b0..9c2947a3edd5 100644
--- a/arch/powerpc/platforms/powermac/pfunc_base.c
+++ b/arch/powerpc/platforms/powermac/pfunc_base.c
@@ -93,7 +93,7 @@ static struct pmf_handlers macio_gpio_handlers = {
 	.delay		= macio_do_delay,
 };
 
-static void macio_gpio_init_one(struct macio_chip *macio)
+static void __init macio_gpio_init_one(struct macio_chip *macio)
 {
 	struct device_node *gparent, *gp;
 
@@ -265,7 +265,7 @@ static struct pmf_handlers macio_mmio_handlers = {
 	.delay			= macio_do_delay,
 };
 
-static void macio_mmio_init_one(struct macio_chip *macio)
+static void __init macio_mmio_init_one(struct macio_chip *macio)
 {
 	DBG("Installing MMIO functions for macio %pOF\n",
 	    macio->of_node);
@@ -294,7 +294,7 @@ static struct pmf_handlers unin_mmio_handlers = {
 	.delay			= macio_do_delay,
 };
 
-static void uninorth_install_pfunc(void)
+static void __init uninorth_install_pfunc(void)
 {
 	struct device_node *np;
 
diff --git a/arch/powerpc/platforms/powermac/setup.c b/arch/powerpc/platforms/powermac/setup.c
index 13e8a8a9841c..f7661b81db18 100644
--- a/arch/powerpc/platforms/powermac/setup.c
+++ b/arch/powerpc/platforms/powermac/setup.c
@@ -194,7 +194,7 @@ int find_via_pmu(void)
 #endif
 
 #ifndef CONFIG_PMAC_SMU
-int smu_init(void)
+int __init smu_init(void)
 {
 	/* should check and warn if SMU is present */
 	return 0;
diff --git a/arch/powerpc/platforms/powermac/smp.c b/arch/powerpc/platforms/powermac/smp.c
index 3256a316e884..da1efdc30d6c 100644
--- a/arch/powerpc/platforms/powermac/smp.c
+++ b/arch/powerpc/platforms/powermac/smp.c
@@ -186,7 +186,7 @@ static const struct irq_domain_ops psurge_host_ops = {
 	.map	= psurge_host_map,
 };
 
-static int psurge_secondary_ipi_init(void)
+static int __init psurge_secondary_ipi_init(void)
 {
 	int rc = -ENOMEM;
 
@@ -875,7 +875,7 @@ static int smp_core99_cpu_online(unsigned int cpu)
 
 static void __init smp_core99_bringup_done(void)
 {
-	extern void g5_phy_disable_cpu1(void);
+	extern void __init g5_phy_disable_cpu1(void);
 
 	/* Close i2c bus if it was used for tb sync */
 	if (pmac_tb_clock_chip_host)
diff --git a/arch/powerpc/platforms/powermac/udbg_scc.c b/arch/powerpc/platforms/powermac/udbg_scc.c
index f286bdfe8346..965827ac2e9c 100644
--- a/arch/powerpc/platforms/powermac/udbg_scc.c
+++ b/arch/powerpc/platforms/powermac/udbg_scc.c
@@ -62,7 +62,7 @@ static unsigned char scc_inittab[] = {
     3,  0xc1,		/* rx enable, 8 bits */
 };
 
-void udbg_scc_init(int force_scc)
+void __init udbg_scc_init(int force_scc)
 {
 	const u32 *reg;
 	unsigned long addr;
-- 
2.25.1

