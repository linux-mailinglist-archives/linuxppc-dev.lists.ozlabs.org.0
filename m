Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E4D74AE21
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 11:52:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z07rgcHB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qy7xK5Z0Lz3c4X
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 19:52:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z07rgcHB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qy7wP6kjNz3bf6
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 19:52:05 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D650761803;
	Fri,  7 Jul 2023 09:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD0AAC433C7;
	Fri,  7 Jul 2023 09:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688723521;
	bh=yMWBZi7OWijpDNbPPVU11zT7Ofk6CC1w0krvsGmTO/Q=;
	h=From:To:Cc:Subject:Date:From;
	b=Z07rgcHB9zc3yULQo5sHhLIv44yzQod9z2mXK8VAD2ky6t/sKWYV2RwpBSfsckmOs
	 agjSwU4wXzrOoatycsFhpr/tbEEL/fP69Db446Ge2rJz9mePLl3mySa8jKvq+GyiTu
	 4KWv6txOUukHX9wFw6zAalyyt0ZA7Ebj/AVQMqWWhUVheF2F5R/fyMF7TpsVLgmD7X
	 shT+2s00P6kEvLIw1WqbApGnI1TejLDoiQ7J2yAN5K/Ulrz2OokpUU5d5LLVQA/dtl
	 ZJiLtsDua4qi8vlm2W12s8HzAd4X6pykjOz3jsL1fYX2KFgKUbi6PXqdCCzGX7LPBk
	 1qapI2AldOYXw==
From: Arnd Bergmann <arnd@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/3] vgacon: rework screen_info #ifdef checks
Date: Fri,  7 Jul 2023 11:50:38 +0200
Message-Id: <20230707095144.1378789-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org, dri-devel@lists.freedesktop.org, javierm@redhat.com, WANG Xuerui <kernel@xen0n.name>, Ard Biesheuvel <ardb@kernel.org>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

On non-x86 architectures, the screen_info variable is generally only
used for the VGA console where supported, and in some cases the EFI
framebuffer or vga16fb.

Now that we have a definite list of which architectures actually use it
for what, use consistent #ifdef checks so the global variable is only
defined when it is actually used on those architectures.

On powerpc, there is no support for vgacon, but there is support for
vga16fb. Loongarch and riscv have no support for vgacon or vga16fb, but
they support EFI firmware, so only that needs to be checked, and the
initialization can be removed because that is handled by EFI.
IA64 has both vgacon and EFI.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/alpha/kernel/setup.c          |  2 ++
 arch/alpha/kernel/sys_sio.c        |  2 ++
 arch/ia64/kernel/setup.c           |  4 ++++
 arch/loongarch/kernel/setup.c      |  2 ++
 arch/mips/jazz/setup.c             |  2 +-
 arch/mips/kernel/setup.c           |  2 +-
 arch/mips/sibyte/swarm/setup.c     |  2 +-
 arch/mips/sni/setup.c              |  2 +-
 arch/powerpc/kernel/setup-common.c |  2 +-
 arch/riscv/kernel/setup.c          | 11 ++---------
 10 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index b650ff1cb022e..b4d2297765c02 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -131,6 +131,7 @@ static void determine_cpu_caches (unsigned int);
 
 static char __initdata command_line[COMMAND_LINE_SIZE];
 
+#ifdef CONFIG_VGA_CONSOLE
 /*
  * The format of "screen_info" is strange, and due to early
  * i386-setup code. This is just enough to make the console
@@ -147,6 +148,7 @@ struct screen_info screen_info = {
 };
 
 EXPORT_SYMBOL(screen_info);
+#endif
 
 /*
  * The direct map I/O window, if any.  This should be the same
diff --git a/arch/alpha/kernel/sys_sio.c b/arch/alpha/kernel/sys_sio.c
index 7c420d8dac53d..7de8a5d2d2066 100644
--- a/arch/alpha/kernel/sys_sio.c
+++ b/arch/alpha/kernel/sys_sio.c
@@ -57,11 +57,13 @@ sio_init_irq(void)
 static inline void __init
 alphabook1_init_arch(void)
 {
+#ifdef CONFIG_VGA_CONSOLE
 	/* The AlphaBook1 has LCD video fixed at 800x600,
 	   37 rows and 100 cols. */
 	screen_info.orig_y = 37;
 	screen_info.orig_video_cols = 100;
 	screen_info.orig_video_lines = 37;
+#endif
 
 	lca_init_arch();
 }
diff --git a/arch/ia64/kernel/setup.c b/arch/ia64/kernel/setup.c
index 5a55ac82c13a4..0c09ff7fde46b 100644
--- a/arch/ia64/kernel/setup.c
+++ b/arch/ia64/kernel/setup.c
@@ -86,9 +86,11 @@ EXPORT_SYMBOL(local_per_cpu_offset);
 #endif
 unsigned long ia64_cycles_per_usec;
 struct ia64_boot_param *ia64_boot_param;
+#if defined(CONFIG_VGA_CONSOLE) || defined(CONFIG_EFI)
 struct screen_info screen_info;
 unsigned long vga_console_iobase;
 unsigned long vga_console_membase;
+#endif
 
 static struct resource data_resource = {
 	.name	= "Kernel data",
@@ -497,6 +499,7 @@ early_console_setup (char *cmdline)
 static void __init
 screen_info_setup(void)
 {
+#ifdef CONFIG_VGA_CONSOLE
 	unsigned int orig_x, orig_y, num_cols, num_rows, font_height;
 
 	memset(&screen_info, 0, sizeof(screen_info));
@@ -525,6 +528,7 @@ screen_info_setup(void)
 	screen_info.orig_video_mode = 3;	/* XXX fake */
 	screen_info.orig_video_isVGA = 1;	/* XXX fake */
 	screen_info.orig_video_ega_bx = 3;	/* XXX fake */
+#endif
 }
 
 static inline void
diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index 78a00359bde3c..6b3932677f5de 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -57,7 +57,9 @@
 #define SMBIOS_CORE_PACKAGE_OFFSET	0x23
 #define LOONGSON_EFI_ENABLE		(1 << 3)
 
+#ifdef CONFIG_EFI
 struct screen_info screen_info __section(".data");
+#endif
 
 unsigned long fw_arg0, fw_arg1, fw_arg2;
 DEFINE_PER_CPU(unsigned long, kernelsp);
diff --git a/arch/mips/jazz/setup.c b/arch/mips/jazz/setup.c
index ee044261eb223..3c14548353e47 100644
--- a/arch/mips/jazz/setup.c
+++ b/arch/mips/jazz/setup.c
@@ -76,7 +76,7 @@ void __init plat_mem_setup(void)
 
 	_machine_restart = jazz_machine_restart;
 
-#ifdef CONFIG_VT
+#ifdef CONFIG_VGA_CONSOLE
 	screen_info = (struct screen_info) {
 		.orig_video_cols	= 160,
 		.orig_video_lines	= 64,
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index cb871eb784a7c..1aba7dc95132c 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -54,7 +54,7 @@ struct cpuinfo_mips cpu_data[NR_CPUS] __read_mostly;
 
 EXPORT_SYMBOL(cpu_data);
 
-#ifdef CONFIG_VT
+#ifdef CONFIG_VGA_CONSOLE
 struct screen_info screen_info;
 #endif
 
diff --git a/arch/mips/sibyte/swarm/setup.c b/arch/mips/sibyte/swarm/setup.c
index 76683993cdd3a..37df504d3ecbb 100644
--- a/arch/mips/sibyte/swarm/setup.c
+++ b/arch/mips/sibyte/swarm/setup.c
@@ -129,7 +129,7 @@ void __init plat_mem_setup(void)
 	if (m41t81_probe())
 		swarm_rtc_type = RTC_M41T81;
 
-#ifdef CONFIG_VT
+#ifdef CONFIG_VGA_CONSOLE
 	screen_info = (struct screen_info) {
 		.orig_video_page	= 52,
 		.orig_video_mode	= 3,
diff --git a/arch/mips/sni/setup.c b/arch/mips/sni/setup.c
index efad85c8c823b..9984cf91be7d0 100644
--- a/arch/mips/sni/setup.c
+++ b/arch/mips/sni/setup.c
@@ -38,7 +38,7 @@ extern void sni_machine_power_off(void);
 
 static void __init sni_display_setup(void)
 {
-#if defined(CONFIG_VT) && defined(CONFIG_VGA_CONSOLE) && defined(CONFIG_FW_ARC)
+#if defined(CONFIG_VGA_CONSOLE) && defined(CONFIG_FW_ARC)
 	struct screen_info *si = &screen_info;
 	DISPLAY_STATUS *di;
 
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index d2a446216444f..b717875a12a9a 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -98,6 +98,7 @@ int boot_cpu_hwid = -1;
 int dcache_bsize;
 int icache_bsize;
 
+#if IS_ENABLED(CONFIG_FB_VGA16)
 /*
  * This still seems to be needed... -- paulus
  */ 
@@ -109,7 +110,6 @@ struct screen_info screen_info = {
 	.orig_video_isVGA = 1,
 	.orig_video_points = 16
 };
-#if defined(CONFIG_FB_VGA16_MODULE)
 EXPORT_SYMBOL(screen_info);
 #endif
 
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 971fe776e2f8b..a3dbe13f45fb3 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -39,15 +39,8 @@
 
 #include "head.h"
 
-#if defined(CONFIG_DUMMY_CONSOLE) || defined(CONFIG_EFI)
-struct screen_info screen_info __section(".data") = {
-	.orig_video_lines	= 30,
-	.orig_video_cols	= 80,
-	.orig_video_mode	= 0,
-	.orig_video_ega_bx	= 0,
-	.orig_video_isVGA	= 1,
-	.orig_video_points	= 8
-};
+#if defined(CONFIG_EFI)
+struct screen_info screen_info __section(".data");
 #endif
 
 /*
-- 
2.39.2

