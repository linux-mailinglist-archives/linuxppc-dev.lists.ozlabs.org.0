Return-Path: <linuxppc-dev+bounces-12126-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE529B55E08
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Sep 2025 05:17:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNxLg6Wj4z3dRS;
	Sat, 13 Sep 2025 13:17:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757724726;
	cv=none; b=OkAorz6B5HZW+cf31DHdMqt2Tq0va8NI4dpMoj+UyC6HrndFjdHnNVedbrh33aRxBE+6ivV0LrqZg/5w0EVwMmI7L32zeoTv/XFBrke9r2SC+i6EkrkyMndngdb3Qk4d6Oj4IsXLMo6NywjY/otLBaa/ftnElGMrifjs2dHtTxGZWiAHvKn19NgUsWjySusvtHHDDgrQh+6KdtGkMA6dqZxIULLu7T9IKtn7JaKO1xT2fwlEfth2gxJOQpm4qKbg7FyEqosoIjpMfGcLdPjf01eivfZP/mow0frLPbqtebelJ+yphM786jyH2A0Mbd2BxXcjWlpmUvQ1vkihLWt0LA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757724726; c=relaxed/relaxed;
	bh=MdGbmKxqlcMl0rLfzu7p7wshkZ7f+lqXVhPxNRPgNLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vn7wp+sCWOFGQ5232VLcDtKA8Us54ihx2xEXpJpbc5cn5Rm5PHIACH1h7PND+gb2KhxrwDWF1mAVJN2IAZ9lR0j3uGSP+Gkdp1wL4f2gTadH25JtSOjRvX91K0BoanNNZdcAipPx4BeSY66f+eFwz19XRAZtuwvoSokgcvzSn84zzuJtKRBaQiwPzWTH7k8X2Gc1AwX69XF2oCZ0Bhst7XPA2XVwmV9IUUBOr29Il1n2Buc+38HrC4XtGV38SzkNAg2CgIIeYnqs3kzorGKIWW8199ksTwwAog4OUc8hQcezhhJ+wCACLOH9LCjhkk056YOfcLROtygkUfKl5brN+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WhIwfk4Z; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WhIwfk4Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNt6Y6kfgz2yrN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 10:52:05 +1000 (AEST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b07d01fd4fbso149516466b.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 17:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757724723; x=1758329523; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdGbmKxqlcMl0rLfzu7p7wshkZ7f+lqXVhPxNRPgNLM=;
        b=WhIwfk4Zi/ME5PAyA+1MV/56O0kpCl/wk69zs9o5nLr5NTQp0WJ24DXb1WdlLNxxms
         1AW1R+3XNe1hw68AknsPLsu4ih23Z2LO+YRUMT9v/XtZ4oRn9ZlKy7SFjIqW0sdBw8OP
         xhDcYWdG8RJ39zBJFzorBgU+qSSgAGiNSotExeT9BZWN4F9ZsIw5HmOeIFzJbOpnwbSm
         IByKrfNiHtbRGS2NRhZEiIjHWaZ6uPahuBg7IVrj61MMbzwsN3FE04cq/2P+vr00oAQb
         EWrMN9IVnPbyqT+kcF34AF5Zv4Z5CiOiRKSz6Twc3uAG8nt4UcpNr+eL/0Wtd3EsZq6i
         8kaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757724723; x=1758329523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MdGbmKxqlcMl0rLfzu7p7wshkZ7f+lqXVhPxNRPgNLM=;
        b=hPLarB/BRtH/enUwsr/FNMQd7gTJ60yZg8a7CTNYKuJCISbNeicOK5O5fQCoFBBWpG
         AuC/W8OHL6TrxVDh99Ss2muG3yBZ75qA6jNoWjMSpCKT+O1gi8uNsc6NQ3jMZiRKZZmf
         5ibOdCe/3XO8YJwYRjNFtDIX/51kdIHKaDLke070ommILAMDGkYrRuTb2gaj7XmF7CoT
         2hZwbU6uQtJ/SkAynzzV2UeJqFQNhC7muQTIVBlPhKLUX1JaCJM2JKeUM36q55FC8I3d
         MCtXLUpV5fJ0Hsyepz8SDu8/CQZeUd76/ToLkUw+CDWGu3ZH4RPalOtDMSXF8nYd1dcH
         xyAQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0lob0KDbdzYuVvWB3Y3hQ/VdYTOPoZkNE4fZ5fKfskzhq7qN2i2IL8mQPE8hFQcmm8JCdp8ga1uMpV+I=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy2w88c6cIsR8ikGTjou+9aCth8OK8D6HIxecxq/EKeUqCd9wjS
	rAC9tveOV7VpRlNSFle/YIA/AEcPfdS1iR713p3jSQmdEu5KEjpVUxAt
X-Gm-Gg: ASbGncucHaBxK7Tw1wkP5noXsEV5+k6eHTBxOLKxrlhAJlmmDnfSObEszHB0AkMlxgy
	09Lw6LbbDdcUOQTHzG6V0+daoxwdKdE2iHWkOAnMQlWJuUwLjdeIslvtU94Z0b8REY/uDjVII++
	esPLNe4/Hc5I+yMg0dEmlQX1LdmlupETLKKUi1oTT/x4JvGkEfL1I3Q3vS3KlLRBVys6MH7Dos4
	0PO6zUyQoia3xLu+uDcwG+8aMO1v95Pl5AnvrfF4YV+d44RhzxoidWUQtX0N6HWw6arrGzjYcNa
	c6PhCumrkjsQcbtYuPPZvLBXGzzo2lkxDFRhF3ILk/z08fCyq8niVpmc0ZE6b/Tlgz9aKokq4Nl
	2hHj/bJ5Vbggci3iebe7/aqdyO5EYlA==
X-Google-Smtp-Source: AGHT+IEOxv4u1csoR3Asex+KK1PngLg51+/kQQMoUV5EwO+MoxI2Yose6oae6R3weUM2rN4atBIYiQ==
X-Received: by 2002:a17:907:9801:b0:afe:6c9b:c828 with SMTP id a640c23a62f3a-b07c37b8165mr442852966b.61.1757724722473;
        Fri, 12 Sep 2025 17:52:02 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b08cab32303sm25787366b.72.2025.09.12.17.51.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:52:02 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Aleksa Sarai <cyphar@cyphar.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Julian Stecklina <julian.stecklina@cyberus-technology.de>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Art Nikpal <email2tema@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric Curtin <ecurtin@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	Rob Landley <rob@landley.net>,
	Lennart Poettering <mzxreary@0pointer.de>,
	linux-arch@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	linux-block@vger.kernel.org,
	initramfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	"Theodore Y . Ts'o" <tytso@mit.edu>,
	linux-acpi@vger.kernel.org,
	Michal Simek <monstr@monstr.eu>,
	devicetree@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Heiko Carstens <hca@linux.ibm.com>,
	patches@lists.linux.dev
Subject: [PATCH RESEND 11/62] init, efi: remove "noinitrd" command line parameter
Date: Sat, 13 Sep 2025 00:37:50 +0000
Message-ID: <20250913003842.41944-12-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

It was inconsistent before initrd removal: it mostly
controlled initrd only, but in EFI stub boot mode
it controlled both initrd and initramfs

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 3 ---
 arch/arm/configs/collie_defconfig               | 2 +-
 arch/arm/configs/imx_v6_v7_defconfig            | 2 +-
 arch/arm/configs/neponset_defconfig             | 2 +-
 arch/arm/configs/spitz_defconfig                | 2 +-
 drivers/firmware/efi/libstub/efi-stub-helper.c  | 5 +----
 init/do_mounts_initrd.c                         | 9 ---------
 7 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 07e8878f1e13..ad52e3d26014 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4271,9 +4271,6 @@
 			Note that this argument takes precedence over
 			the CONFIG_RCU_NOCB_CPU_DEFAULT_ALL option.
 
-	noinitrd	[RAM] Tells the kernel not to load any configured
-			initial RAM disk.
-
 	nointremap	[X86-64,Intel-IOMMU,EARLY] Do not enable interrupt
 			remapping.
 			[Deprecated - use intremap=off]
diff --git a/arch/arm/configs/collie_defconfig b/arch/arm/configs/collie_defconfig
index 578c6a4af620..00dc8ae22824 100644
--- a/arch/arm/configs/collie_defconfig
+++ b/arch/arm/configs/collie_defconfig
@@ -9,7 +9,7 @@ CONFIG_ARCH_MULTI_V4=y
 # CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_SA1100=y
 CONFIG_SA1100_COLLIE=y
-CONFIG_CMDLINE="noinitrd root=/dev/mtdblock2 rootfstype=jffs2 fbcon=rotate:1"
+CONFIG_CMDLINE="root=/dev/mtdblock2 rootfstype=jffs2 fbcon=rotate:1"
 CONFIG_FPE_NWFPE=y
 CONFIG_PM=y
 # CONFIG_SWAP is not set
diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 9a57763a8d38..b53ae2c052fc 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -32,7 +32,7 @@ CONFIG_SMP=y
 CONFIG_ARM_PSCI=y
 CONFIG_HIGHMEM=y
 CONFIG_ARCH_FORCE_MAX_ORDER=13
-CONFIG_CMDLINE="noinitrd console=ttymxc0,115200"
+CONFIG_CMDLINE="console=ttymxc0,115200"
 CONFIG_CPU_FREQ=y
 CONFIG_CPU_FREQ_STAT=y
 CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
diff --git a/arch/arm/configs/neponset_defconfig b/arch/arm/configs/neponset_defconfig
index 4d720001c12e..a61eb27373a8 100644
--- a/arch/arm/configs/neponset_defconfig
+++ b/arch/arm/configs/neponset_defconfig
@@ -9,7 +9,7 @@ CONFIG_ASSABET_NEPONSET=y
 CONFIG_ZBOOT_ROM_TEXT=0x80000
 CONFIG_ZBOOT_ROM_BSS=0xc1000000
 CONFIG_ZBOOT_ROM=y
-CONFIG_CMDLINE="console=ttySA0,38400n8 cpufreq=221200 rw root=/dev/mtdblock2 mtdparts=sa1100:512K(boot),1M(kernel),2560K(initrd),4M(root) mem=32M noinitrd initrd=0xc0800000,3M"
+CONFIG_CMDLINE="console=ttySA0,38400n8 cpufreq=221200 rw root=/dev/mtdblock2 mtdparts=sa1100:512K(boot),1M(kernel),2560K(initrd),4M(root) mem=32M initrd=0xc0800000,3M"
 CONFIG_FPE_NWFPE=y
 CONFIG_PM=y
 CONFIG_MODULES=y
diff --git a/arch/arm/configs/spitz_defconfig b/arch/arm/configs/spitz_defconfig
index ac2a0f998c73..8582b6f2cf9d 100644
--- a/arch/arm/configs/spitz_defconfig
+++ b/arch/arm/configs/spitz_defconfig
@@ -10,7 +10,7 @@ CONFIG_ARCH_PXA=y
 CONFIG_PXA_SHARPSL=y
 CONFIG_MACH_AKITA=y
 CONFIG_MACH_BORZOI=y
-CONFIG_CMDLINE="console=ttyS0,115200n8 console=tty1 noinitrd root=/dev/mtdblock2 rootfstype=jffs2   debug"
+CONFIG_CMDLINE="console=ttyS0,115200n8 console=tty1 root=/dev/mtdblock2 rootfstype=jffs2   debug"
 CONFIG_FPE_NWFPE=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
diff --git a/drivers/firmware/efi/libstub/efi-stub-helper.c b/drivers/firmware/efi/libstub/efi-stub-helper.c
index 7aa2f9ad2935..6d89bf941d57 100644
--- a/drivers/firmware/efi/libstub/efi-stub-helper.c
+++ b/drivers/firmware/efi/libstub/efi-stub-helper.c
@@ -21,7 +21,6 @@ bool efi_nochunk;
 bool efi_nokaslr = !IS_ENABLED(CONFIG_RANDOMIZE_BASE);
 bool efi_novamap;
 
-static bool efi_noinitrd;
 static bool efi_nosoftreserve;
 static bool efi_disable_pci_dma = IS_ENABLED(CONFIG_EFI_DISABLE_PCI_DMA);
 
@@ -75,8 +74,6 @@ efi_status_t efi_parse_options(char const *cmdline)
 			efi_nokaslr = true;
 		} else if (!strcmp(param, "quiet")) {
 			efi_loglevel = CONSOLE_LOGLEVEL_QUIET;
-		} else if (!strcmp(param, "noinitrd")) {
-			efi_noinitrd = true;
 		} else if (IS_ENABLED(CONFIG_X86_64) && !strcmp(param, "no5lvl")) {
 			efi_no5lvl = true;
 		} else if (IS_ENABLED(CONFIG_ARCH_HAS_MEM_ENCRYPT) &&
@@ -614,7 +611,7 @@ efi_status_t efi_load_initrd(efi_loaded_image_t *image,
 	efi_status_t status = EFI_SUCCESS;
 	struct linux_efi_initrd initrd, *tbl;
 
-	if (!IS_ENABLED(CONFIG_BLK_DEV_INITRD) || efi_noinitrd)
+	if (!IS_ENABLED(CONFIG_BLK_DEV_INITRD))
 		return EFI_SUCCESS;
 
 	status = efi_load_initrd_dev_path(&initrd, hard_limit);
diff --git a/init/do_mounts_initrd.c b/init/do_mounts_initrd.c
index 308744254c08..bec1c5d684a3 100644
--- a/init/do_mounts_initrd.c
+++ b/init/do_mounts_initrd.c
@@ -15,7 +15,6 @@
 unsigned long initrd_start, initrd_end;
 int initrd_below_start_ok;
 static unsigned int real_root_dev;	/* do_proc_dointvec cannot handle kdev_t */
-static int __initdata mount_initrd = 1;
 
 phys_addr_t phys_initrd_start __initdata;
 unsigned long phys_initrd_size __initdata;
@@ -39,14 +38,6 @@ static __init int kernel_do_mounts_initrd_sysctls_init(void)
 late_initcall(kernel_do_mounts_initrd_sysctls_init);
 #endif /* CONFIG_SYSCTL */
 
-static int __init no_initrd(char *str)
-{
-	mount_initrd = 0;
-	return 1;
-}
-
-__setup("noinitrd", no_initrd);
-
 static int __init early_initrdmem(char *p)
 {
 	phys_addr_t start;
-- 
2.47.2


