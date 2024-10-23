Return-Path: <linuxppc-dev+bounces-2527-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 423AF9AD795
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2024 00:30:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYkJq52cbz2xpp;
	Thu, 24 Oct 2024 09:30:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::836"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729703684;
	cv=none; b=nV4UteBX1VAu98Z8dVkkJ56ulOoY02NHvFx4/i7wbk3SP/4LCrL3vK8+g5M1CPBLqmGix7/MFM4fz0y/79Ux98T3tzzkH2gdEvkbLzHEPe9BDKRAMIKo4Km6TcYxNQX1JafrnX6nq/l9Nn1NXRV7ldW4rKKtRj4Hu12GdNYkdVNzLw22zrY6nfUkFHVcJvs0OlrNt4RFIMrx66imhLJWxDIhZGHu30IKTlzeCwK6E85u1SIsFNHbHTPC3eMnvY5L7uEPx5kBjQdBQ6HvppLVLLJ29wmzp963mpEeoeZzeoFWKBOlXE8XIeyI6IlaCKm9Enym1FTQ5EqAA2cDnVcx2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729703684; c=relaxed/relaxed;
	bh=Ocy032bdcho2couvO6/QgCKu9IriwGzbqAqGCvUdpMA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I3KX1VKt2JRbgF0mu8CmWgQvC6o4v6N3X5L4vMmIXVGK7zJ0aj0lFBcPpUFsQhQJiWbREc2SD7iUjt/zc5OM0EkFvZPaZTJog9Zg9YlJlJXS277naxe0TCffXj7pnX/l8GTjBAaymdZ/dwEtyidoZGY6GjXO9w8kZMuAo0I4+WGdToBTXgIXdNtUAMXJahJiQ7FDl4CxR3RC88L+5kRc5JyzcC/Bezz4jroudWpi/PG1Agv/jJ1ayBiKzia9ftZEJ30QpztVCHMixGzWKfofWV5r6UYU9IkvkNGes34i+CM+vZtfdi0M3wQ8gnwC+eWG7LRFNyYxvUFwICSmTgI+6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CNkn4e5+; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::836; helo=mail-qt1-x836.google.com; envelope-from=usamaarif642@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CNkn4e5+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::836; helo=mail-qt1-x836.google.com; envelope-from=usamaarif642@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYbJL2St2z2yfj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 04:14:41 +1100 (AEDT)
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4609967ab7eso119251cf.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2024 10:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729703677; x=1730308477; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ocy032bdcho2couvO6/QgCKu9IriwGzbqAqGCvUdpMA=;
        b=CNkn4e5+pU7XGTw105DzIqxQNlu0HSIwtSOmXoc6GoI0yvbih7BNH174H5OSZBRV8r
         L6wFOSyP7QEkQ0C0pQaQwR5YlW90jcA+gT6rH5bWMtL870S/H7AUMFWFFUKFrrPWtwd/
         sAe2ghfill4HfXixB04gsevv4JsHuAE8OnS+dimaPLtrSdMcfat2r45vRHMOXLZuEREN
         GcUMzbISk3O0Ec2cCW8TuIUBuNYTxHS74EaKLERRUTVRswGoqKr5SiMvPkAti39cRGY9
         2mvz55zi4xqSJhTPehhFSXdWsEDZ/xfFmkbL+F0GpGnc52/CtNdLBber3Dum7UeG31MX
         L34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729703677; x=1730308477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ocy032bdcho2couvO6/QgCKu9IriwGzbqAqGCvUdpMA=;
        b=OKKQPknXKq+YROtkDa9mGsfI+0FHl3/zuLEG1ki37N79wIhY9jr7msL5St16EaKlXt
         bOlQaqrEkneZyQLhkGwLFjCX3IX+BhEPecfJoxZTNDZeF86lZxRr/yuk4D57phf8Iq9k
         Jigi2Jy/YrnB7lTFPY0aE2z4n/Upnf+CIP/GdTZ9FuKdCDFxmBuB90MjCsKOFlfDrmyK
         oyGulsN9fLkMW2blOqr76vNxc1B7J+xc2SOKa10In5vTRJTkw17sNDBxE0py+F9J064a
         rD/J9e1lBIjveMzJd5P9wtPOGZ1i4ycjiZ7jppR9/lxs91xWk6ezGP7jzMLoyKzDYHlK
         SOSg==
X-Forwarded-Encrypted: i=1; AJvYcCWnR7cl+Rw6H5OLGB58KmTnR3fmyGd5K3ZHIsffwUIJVwvLJvvWP2nqUp6bWLbWDiiIatsOo6ZNnY8odmg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy7nNlGarN+jRaI0DwpyqrnU6NdlVyZ14/85krIdHEAgVfQGlH+
	0sYYhOBYxzxYF3q6uqPnScZt2KhQh216o/6qR/KjHSCjGv30lVCo
X-Google-Smtp-Source: AGHT+IH4iUuNlJ5a4C6P+CxLaR5teClGbQdmg1jOeGXfO69rKTgzE6VI3Y8w6vkgZ/WvzrJsQJMOEA==
X-Received: by 2002:ac8:7f51:0:b0:460:e593:45aa with SMTP id d75a77b69052e-461146c97admr42391941cf.33.1729703677086;
        Wed, 23 Oct 2024 10:14:37 -0700 (PDT)
Received: from localhost (fwdproxy-ash-007.fbsv.net. [2a03:2880:20ff:7::face:b00c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ce009e5407sm41539416d6.129.2024.10.23.10.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 10:14:36 -0700 (PDT)
From: Usama Arif <usamaarif642@gmail.com>
To: robh@kernel.org,
	mark.rutland@arm.com,
	will@kernel.org
Cc: leitao@debian.org,
	catalin.marinas@arm.com,
	tglx@linutronix.de,
	chris@zankel.net,
	saravanak@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-sh@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-openrisc@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-csky@vger.kernel.org,
	Usama Arif <usamaarif642@gmail.com>
Subject: [PATCH v2] of/fdt: add dt_phys arg to early_init_dt_scan and early_init_dt_verify
Date: Wed, 23 Oct 2024 18:14:26 +0100
Message-ID: <20241023171426.452688-1-usamaarif642@gmail.com>
X-Mailer: git-send-email 2.43.5
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lists.ozlabs.org/pipermail/linuxppc-dev/>,
  <https://lore.kernel.org/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

 __pa() is only intended to be used for linear map addresses and using
it for initial_boot_params which is in fixmap for arm64 will give an
incorrect value. Hence save the physical address when it is known at
boot time when calling early_init_dt_scan for arm64 and use it at kexec
time instead of converting the virtual address using __pa().

Reported-by: Breno Leitao <leitao@debian.org>
Suggested-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Usama Arif <usamaarif642@gmail.com>
Fixes: ac10be5cdbfa ("arm64: Use common of_kexec_alloc_and_setup_fdt()")
---
v1 -> 2:
- pass dt_phys in early_init_dt_scan instead of creating
  anorther arch->dt function (Rob Herring)
---
 arch/arc/kernel/devtree.c              |  2 +-
 arch/arm/kernel/devtree.c              |  2 +-
 arch/arm64/kernel/setup.c              |  6 +++++-
 arch/csky/kernel/setup.c               |  4 ++--
 arch/loongarch/kernel/setup.c          |  2 +-
 arch/microblaze/kernel/prom.c          |  2 +-
 arch/mips/kernel/prom.c                |  2 +-
 arch/mips/kernel/relocate.c            |  2 +-
 arch/nios2/kernel/prom.c               |  4 ++--
 arch/openrisc/kernel/prom.c            |  2 +-
 arch/powerpc/kernel/dt_cpu_ftrs.c      |  2 +-
 arch/powerpc/kernel/prom.c             |  2 +-
 arch/powerpc/platforms/pseries/plpks.c |  2 +-
 arch/riscv/kernel/setup.c              |  2 +-
 arch/sh/kernel/setup.c                 |  2 +-
 arch/um/kernel/dtb.c                   |  2 +-
 arch/x86/kernel/devicetree.c           |  2 +-
 arch/xtensa/kernel/setup.c             |  2 +-
 drivers/of/fdt.c                       | 14 ++++++++------
 drivers/of/kexec.c                     |  2 +-
 include/linux/of_fdt.h                 |  5 +++--
 21 files changed, 36 insertions(+), 29 deletions(-)

diff --git a/arch/arc/kernel/devtree.c b/arch/arc/kernel/devtree.c
index 4c9e61457b2f..cc6ac7d128aa 100644
--- a/arch/arc/kernel/devtree.c
+++ b/arch/arc/kernel/devtree.c
@@ -62,7 +62,7 @@ const struct machine_desc * __init setup_machine_fdt(void *dt)
 	const struct machine_desc *mdesc;
 	unsigned long dt_root;
 
-	if (!early_init_dt_scan(dt))
+	if (!early_init_dt_scan(dt, __pa(dt)))
 		return NULL;
 
 	mdesc = of_flat_dt_match_machine(NULL, arch_get_next_mach);
diff --git a/arch/arm/kernel/devtree.c b/arch/arm/kernel/devtree.c
index fdb74e64206a..3b78966e750a 100644
--- a/arch/arm/kernel/devtree.c
+++ b/arch/arm/kernel/devtree.c
@@ -200,7 +200,7 @@ const struct machine_desc * __init setup_machine_fdt(void *dt_virt)
 
 	mdesc_best = &__mach_desc_GENERIC_DT;
 
-	if (!dt_virt || !early_init_dt_verify(dt_virt))
+	if (!dt_virt || !early_init_dt_verify(dt_virt, __pa(dt_virt)))
 		return NULL;
 
 	mdesc = of_flat_dt_match_machine(mdesc_best, arch_get_next_mach);
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index b22d28ec8028..177262739c49 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -175,7 +175,11 @@ static void __init setup_machine_fdt(phys_addr_t dt_phys)
 	if (dt_virt)
 		memblock_reserve(dt_phys, size);
 
-	if (!dt_virt || !early_init_dt_scan(dt_virt)) {
+	/*
+	 * dt_virt is a fixmap address, hence __pa(dt_virt) can't be used.
+	 * Pass dt_phys directly.
+	 */
+	if (!dt_virt || !early_init_dt_scan(dt_virt, dt_phys)) {
 		pr_crit("\n"
 			"Error: invalid device tree blob at physical address %pa (virtual address 0x%px)\n"
 			"The dtb must be 8-byte aligned and must not exceed 2 MB in size\n"
diff --git a/arch/csky/kernel/setup.c b/arch/csky/kernel/setup.c
index 51012e90780d..fe715b707fd0 100644
--- a/arch/csky/kernel/setup.c
+++ b/arch/csky/kernel/setup.c
@@ -112,9 +112,9 @@ asmlinkage __visible void __init csky_start(unsigned int unused,
 	pre_trap_init();
 
 	if (dtb_start == NULL)
-		early_init_dt_scan(__dtb_start);
+		early_init_dt_scan(__dtb_start, __pa(dtb_start));
 	else
-		early_init_dt_scan(dtb_start);
+		early_init_dt_scan(dtb_start, __pa(dtb_start));
 
 	start_kernel();
 
diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index 00e307203ddb..10d878204018 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -290,7 +290,7 @@ static void __init fdt_setup(void)
 	if (!fdt_pointer || fdt_check_header(fdt_pointer))
 		return;
 
-	early_init_dt_scan(fdt_pointer);
+	early_init_dt_scan(fdt_pointer, __pa(fdt_pointer));
 	early_init_fdt_reserve_self();
 
 	max_low_pfn = PFN_PHYS(memblock_end_of_DRAM());
diff --git a/arch/microblaze/kernel/prom.c b/arch/microblaze/kernel/prom.c
index e424c796e297..76ac4cfdfb42 100644
--- a/arch/microblaze/kernel/prom.c
+++ b/arch/microblaze/kernel/prom.c
@@ -18,7 +18,7 @@ void __init early_init_devtree(void *params)
 {
 	pr_debug(" -> early_init_devtree(%p)\n", params);
 
-	early_init_dt_scan(params);
+	early_init_dt_scan(params, __pa(params));
 	if (!strlen(boot_command_line))
 		strscpy(boot_command_line, cmd_line, COMMAND_LINE_SIZE);
 
diff --git a/arch/mips/kernel/prom.c b/arch/mips/kernel/prom.c
index 6062e6fa589a..4fd6da0a06c3 100644
--- a/arch/mips/kernel/prom.c
+++ b/arch/mips/kernel/prom.c
@@ -41,7 +41,7 @@ char *mips_get_machine_name(void)
 
 void __init __dt_setup_arch(void *bph)
 {
-	if (!early_init_dt_scan(bph))
+	if (!early_init_dt_scan(bph, __pa(bph)))
 		return;
 
 	mips_set_machine_name(of_flat_dt_get_machine_name());
diff --git a/arch/mips/kernel/relocate.c b/arch/mips/kernel/relocate.c
index 7eeeaf1ff95d..cda7983e7c18 100644
--- a/arch/mips/kernel/relocate.c
+++ b/arch/mips/kernel/relocate.c
@@ -337,7 +337,7 @@ void *__init relocate_kernel(void)
 #if defined(CONFIG_USE_OF)
 	/* Deal with the device tree */
 	fdt = plat_get_fdt();
-	early_init_dt_scan(fdt);
+	early_init_dt_scan(fdt, __pa(fdt));
 	if (boot_command_line[0]) {
 		/* Boot command line was passed in device tree */
 		strscpy(arcs_cmdline, boot_command_line, COMMAND_LINE_SIZE);
diff --git a/arch/nios2/kernel/prom.c b/arch/nios2/kernel/prom.c
index 9a8393e6b4a8..db049249766f 100644
--- a/arch/nios2/kernel/prom.c
+++ b/arch/nios2/kernel/prom.c
@@ -27,7 +27,7 @@ void __init early_init_devtree(void *params)
 	if (be32_to_cpup((__be32 *)CONFIG_NIOS2_DTB_PHYS_ADDR) ==
 		 OF_DT_HEADER) {
 		params = (void *)CONFIG_NIOS2_DTB_PHYS_ADDR;
-		early_init_dt_scan(params);
+		early_init_dt_scan(params, __pa(params));
 		return;
 	}
 #endif
@@ -37,5 +37,5 @@ void __init early_init_devtree(void *params)
 		params = (void *)__dtb_start;
 #endif
 
-	early_init_dt_scan(params);
+	early_init_dt_scan(params, __pa(params));
 }
diff --git a/arch/openrisc/kernel/prom.c b/arch/openrisc/kernel/prom.c
index 19e6008bf114..e424e9bd12a7 100644
--- a/arch/openrisc/kernel/prom.c
+++ b/arch/openrisc/kernel/prom.c
@@ -22,6 +22,6 @@
 
 void __init early_init_devtree(void *params)
 {
-	early_init_dt_scan(params);
+	early_init_dt_scan(params, __pa(params));
 	memblock_allow_resize();
 }
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index af4263594eb2..1bee15c013e7 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -867,7 +867,7 @@ bool __init dt_cpu_ftrs_init(void *fdt)
 	using_dt_cpu_ftrs = false;
 
 	/* Setup and verify the FDT, if it fails we just bail */
-	if (!early_init_dt_verify(fdt))
+	if (!early_init_dt_verify(fdt, __pa(fdt)))
 		return false;
 
 	if (!of_scan_flat_dt(fdt_find_cpu_features, NULL))
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 0be07ed407c7..88cbe432cad5 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -791,7 +791,7 @@ void __init early_init_devtree(void *params)
 	DBG(" -> early_init_devtree(%px)\n", params);
 
 	/* Too early to BUG_ON(), do it by hand */
-	if (!early_init_dt_verify(params))
+	if (!early_init_dt_verify(params, __pa(params)))
 		panic("BUG: Failed verifying flat device tree, bad version?");
 
 	of_scan_flat_dt(early_init_dt_scan_model, NULL);
diff --git a/arch/powerpc/platforms/pseries/plpks.c b/arch/powerpc/platforms/pseries/plpks.c
index 4a595493d28a..b1667ed05f98 100644
--- a/arch/powerpc/platforms/pseries/plpks.c
+++ b/arch/powerpc/platforms/pseries/plpks.c
@@ -683,7 +683,7 @@ void __init plpks_early_init_devtree(void)
 out:
 	fdt_nop_property(fdt, chosen_node, "ibm,plpks-pw");
 	// Since we've cleared the password, we must update the FDT checksum
-	early_init_dt_verify(fdt);
+	early_init_dt_verify(fdt, __pa(fdt));
 }
 
 static __init int pseries_plpks_init(void)
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index a2cde65b69e9..26c886db4fb3 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -227,7 +227,7 @@ static void __init init_resources(void)
 static void __init parse_dtb(void)
 {
 	/* Early scan of device tree from init memory */
-	if (early_init_dt_scan(dtb_early_va)) {
+	if (early_init_dt_scan(dtb_early_va, __pa(dtb_early_va))) {
 		const char *name = of_flat_dt_get_machine_name();
 
 		if (name) {
diff --git a/arch/sh/kernel/setup.c b/arch/sh/kernel/setup.c
index 620e5cf8ae1e..f2b6f16a46b8 100644
--- a/arch/sh/kernel/setup.c
+++ b/arch/sh/kernel/setup.c
@@ -255,7 +255,7 @@ void __ref sh_fdt_init(phys_addr_t dt_phys)
 	dt_virt = phys_to_virt(dt_phys);
 #endif
 
-	if (!dt_virt || !early_init_dt_scan(dt_virt)) {
+	if (!dt_virt || !early_init_dt_scan(dt_virt, __pa(dt_virt))) {
 		pr_crit("Error: invalid device tree blob"
 			" at physical address %p\n", (void *)dt_phys);
 
diff --git a/arch/um/kernel/dtb.c b/arch/um/kernel/dtb.c
index 4954188a6a09..8d78ced9e08f 100644
--- a/arch/um/kernel/dtb.c
+++ b/arch/um/kernel/dtb.c
@@ -17,7 +17,7 @@ void uml_dtb_init(void)
 
 	area = uml_load_file(dtb, &size);
 	if (area) {
-		if (!early_init_dt_scan(area)) {
+		if (!early_init_dt_scan(area, __pa(area))) {
 			pr_err("invalid DTB %s\n", dtb);
 			memblock_free(area, size);
 			return;
diff --git a/arch/x86/kernel/devicetree.c b/arch/x86/kernel/devicetree.c
index 64280879c68c..59d23cdf4ed0 100644
--- a/arch/x86/kernel/devicetree.c
+++ b/arch/x86/kernel/devicetree.c
@@ -305,7 +305,7 @@ void __init x86_flattree_get_config(void)
 			map_len = size;
 		}
 
-		early_init_dt_verify(dt);
+		early_init_dt_verify(dt, __pa(dt));
 	}
 
 	unflatten_and_copy_device_tree();
diff --git a/arch/xtensa/kernel/setup.c b/arch/xtensa/kernel/setup.c
index bdec4a773af0..e51f2060e830 100644
--- a/arch/xtensa/kernel/setup.c
+++ b/arch/xtensa/kernel/setup.c
@@ -216,7 +216,7 @@ static int __init xtensa_dt_io_area(unsigned long node, const char *uname,
 
 void __init early_init_devtree(void *params)
 {
-	early_init_dt_scan(params);
+	early_init_dt_scan(params, __pa(params));
 	of_scan_flat_dt(xtensa_dt_io_area, NULL);
 
 	if (!command_line[0])
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 4d528c10df3a..546e76ac407c 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -457,6 +457,7 @@ int __initdata dt_root_addr_cells;
 int __initdata dt_root_size_cells;
 
 void *initial_boot_params __ro_after_init;
+phys_addr_t initial_boot_params_pa __ro_after_init;
 
 #ifdef CONFIG_OF_EARLY_FLATTREE
 
@@ -1136,17 +1137,18 @@ static void * __init early_init_dt_alloc_memory_arch(u64 size, u64 align)
 	return ptr;
 }
 
-bool __init early_init_dt_verify(void *params)
+bool __init early_init_dt_verify(void *dt_virt, phys_addr_t dt_phys)
 {
-	if (!params)
+	if (!dt_virt)
 		return false;
 
 	/* check device tree validity */
-	if (fdt_check_header(params))
+	if (fdt_check_header(dt_virt))
 		return false;
 
 	/* Setup flat device-tree pointer */
-	initial_boot_params = params;
+	initial_boot_params = dt_virt;
+	initial_boot_params_pa = dt_phys;
 	of_fdt_crc32 = crc32_be(~0, initial_boot_params,
 				fdt_totalsize(initial_boot_params));
 
@@ -1173,11 +1175,11 @@ void __init early_init_dt_scan_nodes(void)
 	early_init_dt_check_for_usable_mem_range();
 }
 
-bool __init early_init_dt_scan(void *params)
+bool __init early_init_dt_scan(void *dt_virt, phys_addr_t dt_phys)
 {
 	bool status;
 
-	status = early_init_dt_verify(params);
+	status = early_init_dt_verify(dt_virt, dt_phys);
 	if (!status)
 		return false;
 
diff --git a/drivers/of/kexec.c b/drivers/of/kexec.c
index 9ccde2fd77cb..5b924597a4de 100644
--- a/drivers/of/kexec.c
+++ b/drivers/of/kexec.c
@@ -301,7 +301,7 @@ void *of_kexec_alloc_and_setup_fdt(const struct kimage *image,
 	}
 
 	/* Remove memory reservation for the current device tree. */
-	ret = fdt_find_and_del_mem_rsv(fdt, __pa(initial_boot_params),
+	ret = fdt_find_and_del_mem_rsv(fdt, initial_boot_params_pa,
 				       fdt_totalsize(initial_boot_params));
 	if (ret == -EINVAL) {
 		pr_err("Error removing memory reservation.\n");
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index d69ad5bb1eb1..b8d6c0c20876 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -31,6 +31,7 @@ extern void *of_fdt_unflatten_tree(const unsigned long *blob,
 extern int __initdata dt_root_addr_cells;
 extern int __initdata dt_root_size_cells;
 extern void *initial_boot_params;
+extern phys_addr_t initial_boot_params_pa;
 
 extern char __dtb_start[];
 extern char __dtb_end[];
@@ -70,8 +71,8 @@ extern u64 dt_mem_next_cell(int s, const __be32 **cellp);
 /* Early flat tree scan hooks */
 extern int early_init_dt_scan_root(void);
 
-extern bool early_init_dt_scan(void *params);
-extern bool early_init_dt_verify(void *params);
+extern bool early_init_dt_scan(void *dt_virt, phys_addr_t dt_phys);
+extern bool early_init_dt_verify(void *dt_virt, phys_addr_t dt_phys);
 extern void early_init_dt_scan_nodes(void);
 
 extern const char *of_flat_dt_get_machine_name(void);
-- 
2.43.5


