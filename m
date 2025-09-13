Return-Path: <linuxppc-dev+bounces-12133-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 028E8B55E0F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Sep 2025 05:18:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNxMW1c28z3dWk;
	Sat, 13 Sep 2025 13:18:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757724267;
	cv=none; b=cy+KZDfXlU4HBVXtvALOikqZS5qGOMr+wJ3t09pio0GGaPcGAzd/BPPLgi45jH8Uumy3AzAqFhVzXMxIs0brcNj/K1p3vLOlmRpcoZ2a1fW5YN38GmlykljXfnPerhMAEMuN8w6xKY14aUcFRqK9ISsmbdwAEEwkiE157RO3efLvYj09OG/TL16TDHrFljKomgxhxDKfpSs4lxFHGDFOI0HTAOZUKxrtGUBgB9L/QhSRkkdj8jRCRJQ8XngcJsQ89kyUDOTXqCOZ4epMrkfWG5TJHhWSeH7E11XkVMcn5NaKnITlu7jUragOibvtjMp6nrlorAmc3WnK3XcWKB9p1g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757724267; c=relaxed/relaxed;
	bh=mS1RU3iN10evrK469i2WiyUlx0z0fCCFudj+RlZ74kg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lCXtP+ZwUTUCQdDTse4516VqxN4ulJW7LTmuUlX/Hp4v1gVf2WNaDuaXTp6PXqzI3KSN0s/DxQ5PxZrHGZmUfzSv5GVcEQRManxFWiDYi4AmtYTGVczx59AnfeVdz3v2Njka1DyToDEAj+nEkZwntMYRiQxcxI/9J0aWIq5AeDcPG7VSCWwSZ+qUhAgYJ0MAQc6EgzICa3tJZ0UIWNcxMUlHpYg8remywE4ndPkTsHoIafjuxHd9YRaNmSzH6StFm12zQw1VZ9Rj2ZXCFxzvvotpLVk0TVUOLr7tJrTgRhax54+e+L6ARqlOH4dbGqBe45x+O/NFrtG9dqAjNijgmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Liqfh/JA; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Liqfh/JA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNsxk4Jvnz2yrN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 10:44:26 +1000 (AEST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b07e081d852so67019066b.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 17:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757724263; x=1758329063; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mS1RU3iN10evrK469i2WiyUlx0z0fCCFudj+RlZ74kg=;
        b=Liqfh/JAVY71h3V/h6MEiN4v72g90SVgPa/S1BWm2GxIAUy9CS9YS6c8LjBnTmQw9V
         7fXDppeblWiDNxw0jQL4FLcrcgVS0BEYpkLxNt/iUHWbBuPxOUZaau9xeIhIC72A1YUs
         pklsJdWYr+FnXeUQaR6mttzEesgzQO+ByrgNPBtny4HP8lEn3zXp0GNrL+3etkqp1Fun
         xPV/tKpnu3dnPPKbQgg58oBn7Rtk/hzr3Ff4Y/fz4D+LDCx+TvIuzlZYC0R2Wo3vmdFp
         vI1gZgaV5l76GengYixexlMccxtSvE6ZVnp6LS3q4NHUpuJlrHVNDTxqIcep9DA9c3ex
         Znzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757724263; x=1758329063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mS1RU3iN10evrK469i2WiyUlx0z0fCCFudj+RlZ74kg=;
        b=Szsb91V9B9l5RaUMrnzrDmOToFdQLU1VyVa+UlPn1gRZmowWFao+xpHFEp2FFb+9Rh
         7cRYhky0MVVQnYbV31wRQvcyE1Ic5OCKPHBXDsJPVLEXC3ROuWKV8+Yt/fqZwC0MAyl7
         IH2H7/SiFBzihibrDNWSyAQj7IT6HIRkF/qu6OYhFmy3dbjJgykiyrZydkLP/CwuWNAr
         gwvYmLYAcxi64a2p2VsF54KzSe7cjSUJ3b3es6vRm5y34+IgOdaznN9JnMYS2owlqu0g
         NCcUNlSABGBXEU8Fmieq2CM3Tg+DF0iufMXxl9cVCvB3c8g/4gpB4ju0HeaM96GrFYx0
         l79Q==
X-Forwarded-Encrypted: i=1; AJvYcCX2LU9MTX8sxxLaCQuzSzvIk6cmZ9+j+MfFbJF/XXhyyTxPs1wFLQRCbIKgF3Ks4+slIe3IwhItnEKQwfM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzGXa75BH3lNmK1btCD8IhTg/FV7PEoqGMhLbgBa5pBBTVPmCHQ
	ko9XslN0V1vB+PD+veCQGYM0PsxmY+CDxQ4dtLerWXrj2g+qvKrlOeCd
X-Gm-Gg: ASbGnctuf9auSW2EY9gR9JfqvbomkIT0ltouHuzxlTGFn8P2mJszpdVSzOcog6MbBPW
	Vd1CZWJed0aTQ0gGhFRBBPmB11ueat67Umaii+EtGWmCRJgdBDWZpe2mplWd+uQ1a8FM2w4NXVI
	uw36Y1IFvOqD8e4gbkypZC8/B/XCUf8BBARrikPFg8zmT+B284ReGD8DbRIrCVJvoUuzjWcVqUV
	ts48YxTt0vArA4MKEDVbxKqPXXZnycfwEKnqwGZR19N9wwN0QrxUHohdUVzHDnwiNbmjFQAqpmW
	OcKPHnm7KDqYc4TFqrYnOAhW2d8rKPG2O5fQJ0LsnpMM2kQZ3RJwQqDxLch5il4yWy72dk/7lze
	UsZzFqx7YQ1isDuaw8sxx7iS3RU8Ut8tj6f+17vrz
X-Google-Smtp-Source: AGHT+IGv+W1CKcLOi4yIcUzFHvekB6fCSOQ02Af5wm0+L59XCtUVRow/cynXcFSqj0NNtuL4eJLrqA==
X-Received: by 2002:a17:906:f587:b0:b04:5a74:b66f with SMTP id a640c23a62f3a-b07c354e930mr489676666b.3.1757724263304;
        Fri, 12 Sep 2025 17:44:23 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b30da327sm475829066b.11.2025.09.12.17.44.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:44:22 -0700 (PDT)
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
Subject: [PATCH RESEND 04/62] init: x86, arm, sh, sparc: remove variable rd_image_start, which controls starting block number of initrd
Date: Sat, 13 Sep 2025 00:37:43 +0000
Message-ID: <20250913003842.41944-5-safinaskar@gmail.com>
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

This is preparation for initrd removal

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 Documentation/arch/x86/boot.rst       | 4 ++--
 arch/arm/kernel/atags_parse.c         | 2 --
 arch/sh/include/asm/setup.h           | 1 -
 arch/sh/kernel/head_32.S              | 2 +-
 arch/sh/kernel/setup.c                | 9 +--------
 arch/sparc/boot/piggyback.c           | 4 ++--
 arch/sparc/kernel/head_32.S           | 4 ++--
 arch/sparc/kernel/head_64.S           | 6 ++++--
 arch/sparc/kernel/setup_32.c          | 5 -----
 arch/sparc/kernel/setup_64.c          | 5 -----
 arch/x86/boot/header.S                | 2 +-
 arch/x86/include/uapi/asm/bootparam.h | 5 +----
 arch/x86/kernel/setup.c               | 5 -----
 include/linux/initrd.h                | 3 ---
 init/do_mounts_rd.c                   | 8 +++-----
 15 files changed, 17 insertions(+), 48 deletions(-)

diff --git a/Documentation/arch/x86/boot.rst b/Documentation/arch/x86/boot.rst
index 77e6163288db..118aa7b69667 100644
--- a/Documentation/arch/x86/boot.rst
+++ b/Documentation/arch/x86/boot.rst
@@ -189,7 +189,7 @@ Offset/Size	Proto		Name			Meaning
 01F1/1		ALL(1)		setup_sects		The size of the setup in sectors
 01F2/2		ALL		root_flags		If set, the root is mounted readonly
 01F4/4		2.04+(2)	syssize			The size of the 32-bit code in 16-byte paras
-01F8/2		ALL		ram_size		DO NOT USE - for bootsect.S use only
+01F8/2		ALL		ram_size		DO NOT USE - for bootsect.S use only - used to control initrd, which was removed from Linux in 2025
 01FA/2		ALL		vid_mode		Video mode control
 01FC/2		ALL		root_dev		Default root device number
 01FE/2		ALL		boot_flag		0xAA55 magic number
@@ -308,7 +308,7 @@ Offset/size:	0x1f8/2
 Protocol:	ALL
 ============	===============
 
-  This field is obsolete.
+  This field is obsolete. Used to control initrd, which was removed from Linux in 2025.
 
 ============	===================
 Field name:	vid_mode
diff --git a/arch/arm/kernel/atags_parse.c b/arch/arm/kernel/atags_parse.c
index 4ec591bde3df..a3f0a4f84e04 100644
--- a/arch/arm/kernel/atags_parse.c
+++ b/arch/arm/kernel/atags_parse.c
@@ -90,8 +90,6 @@ __tagtable(ATAG_VIDEOTEXT, parse_tag_videotext);
 #ifdef CONFIG_BLK_DEV_RAM
 static int __init parse_tag_ramdisk(const struct tag *tag)
 {
-	rd_image_start = tag->u.ramdisk.start;
-
 	if (tag->u.ramdisk.size)
 		rd_size = tag->u.ramdisk.size;
 
diff --git a/arch/sh/include/asm/setup.h b/arch/sh/include/asm/setup.h
index 84bb23a771f3..d1b97c5726e4 100644
--- a/arch/sh/include/asm/setup.h
+++ b/arch/sh/include/asm/setup.h
@@ -10,7 +10,6 @@
 #define PARAM	((unsigned char *)empty_zero_page)
 
 #define MOUNT_ROOT_RDONLY (*(unsigned long *) (PARAM+0x000))
-#define RAMDISK_FLAGS (*(unsigned long *) (PARAM+0x004))
 #define ORIG_ROOT_DEV (*(unsigned long *) (PARAM+0x008))
 #define LOADER_TYPE (*(unsigned long *) (PARAM+0x00c))
 #define INITRD_START (*(unsigned long *) (PARAM+0x010))
diff --git a/arch/sh/kernel/head_32.S b/arch/sh/kernel/head_32.S
index b603b7968b38..4382c0f058c8 100644
--- a/arch/sh/kernel/head_32.S
+++ b/arch/sh/kernel/head_32.S
@@ -28,7 +28,7 @@
 	.section	.empty_zero_page, "aw"
 ENTRY(empty_zero_page)
 	.long	1		/* MOUNT_ROOT_RDONLY */
-	.long	0		/* RAMDISK_FLAGS */
+	.long	0		/* RAMDISK_FLAGS - used to control initrd, which was removed from Linux in 2025 */
 	.long	0x0200		/* ORIG_ROOT_DEV */
 	.long	1		/* LOADER_TYPE */
 	.long	0x00000000	/* INITRD_START */
diff --git a/arch/sh/kernel/setup.c b/arch/sh/kernel/setup.c
index d66f098e9e9f..50f1d39fe34f 100644
--- a/arch/sh/kernel/setup.c
+++ b/arch/sh/kernel/setup.c
@@ -70,8 +70,6 @@ EXPORT_SYMBOL(sh_mv);
 
 extern int root_mountflags;
 
-#define RAMDISK_IMAGE_START_MASK	0x07FF
-
 static char __initdata command_line[COMMAND_LINE_SIZE] = { 0, };
 
 static struct resource code_resource = {
@@ -273,19 +271,14 @@ void __init setup_arch(char **cmdline_p)
 
 	printk(KERN_NOTICE "Boot params:\n"
 			   "... MOUNT_ROOT_RDONLY - %08lx\n"
-			   "... RAMDISK_FLAGS     - %08lx\n"
 			   "... ORIG_ROOT_DEV     - %08lx\n"
 			   "... LOADER_TYPE       - %08lx\n"
 			   "... INITRD_START      - %08lx\n"
 			   "... INITRD_SIZE       - %08lx\n",
-			   MOUNT_ROOT_RDONLY, RAMDISK_FLAGS,
+			   MOUNT_ROOT_RDONLY,
 			   ORIG_ROOT_DEV, LOADER_TYPE,
 			   INITRD_START, INITRD_SIZE);
 
-#ifdef CONFIG_BLK_DEV_RAM
-	rd_image_start = RAMDISK_FLAGS & RAMDISK_IMAGE_START_MASK;
-#endif
-
 	if (!MOUNT_ROOT_RDONLY)
 		root_mountflags &= ~MS_RDONLY;
 	setup_initial_init_mm(_text, _etext, _edata, _end);
diff --git a/arch/sparc/boot/piggyback.c b/arch/sparc/boot/piggyback.c
index 6d74064add0a..a9cc55254ff8 100644
--- a/arch/sparc/boot/piggyback.c
+++ b/arch/sparc/boot/piggyback.c
@@ -220,8 +220,8 @@ int main(int argc,char **argv)
 
 	/*
 	 * root_flags = 0
-	 * root_dev = 1 (RAMDISK_MAJOR)
-	 * ram_flags = 0
+	 * root_dev = 1 (1 used to mean RAMDISK_MAJOR, i. e. initrd, which was removed from Linux)
+	 * ram_flags = 0 (used to control initrd, which was removed from Linux in 2025)
 	 * sparc_ramdisk_image = "PAGE aligned address after _end")
 	 * sparc_ramdisk_size = size of image
 	 */
diff --git a/arch/sparc/kernel/head_32.S b/arch/sparc/kernel/head_32.S
index 38345460d542..46f0e39b9037 100644
--- a/arch/sparc/kernel/head_32.S
+++ b/arch/sparc/kernel/head_32.S
@@ -65,7 +65,7 @@ empty_zero_page:	.skip PAGE_SIZE
 EXPORT_SYMBOL(empty_zero_page)
 
 	.global root_flags
-	.global ram_flags
+	.global ram_flags /* used to control initrd, which was removed from Linux in 2025 */
 	.global root_dev
 	.global sparc_ramdisk_image
 	.global sparc_ramdisk_size
@@ -81,7 +81,7 @@ root_flags:
 	.half	1
 root_dev:
 	.half	0
-ram_flags:
+ram_flags: /* used to control initrd, which was removed from Linux in 2025 */
 	.half	0
 sparc_ramdisk_image:
 	.word	0
diff --git a/arch/sparc/kernel/head_64.S b/arch/sparc/kernel/head_64.S
index cf0549134234..4480c0532fe9 100644
--- a/arch/sparc/kernel/head_64.S
+++ b/arch/sparc/kernel/head_64.S
@@ -52,7 +52,9 @@ stext:
  * Fields should be kept upward compatible and whenever any change is made,
  * HdrS version should be incremented.
  */
-        .global root_flags, ram_flags, root_dev
+        .global root_flags
+        .global ram_flags /* used to control initrd, which was removed from Linux in 2025 */
+        .global root_dev
         .global sparc_ramdisk_image, sparc_ramdisk_size
 	.global sparc_ramdisk_image64
 
@@ -71,7 +73,7 @@ root_flags:
         .half   1
 root_dev:
         .half   0
-ram_flags:
+ram_flags: /* used to control initrd, which was removed from Linux in 2025 */
         .half   0
 sparc_ramdisk_image:
         .word   0
diff --git a/arch/sparc/kernel/setup_32.c b/arch/sparc/kernel/setup_32.c
index eb60be31127f..fb46fb3acf54 100644
--- a/arch/sparc/kernel/setup_32.c
+++ b/arch/sparc/kernel/setup_32.c
@@ -170,8 +170,6 @@ static void __init boot_flags_init(char *commands)
 
 extern unsigned short root_flags;
 extern unsigned short root_dev;
-extern unsigned short ram_flags;
-#define RAMDISK_IMAGE_START_MASK	0x07FF
 
 extern int root_mountflags;
 
@@ -335,9 +333,6 @@ void __init setup_arch(char **cmdline_p)
 	if (!root_flags)
 		root_mountflags &= ~MS_RDONLY;
 	ROOT_DEV = old_decode_dev(root_dev);
-#ifdef CONFIG_BLK_DEV_RAM
-	rd_image_start = ram_flags & RAMDISK_IMAGE_START_MASK;
-#endif
 
 	prom_setsync(prom_sync_me);
 
diff --git a/arch/sparc/kernel/setup_64.c b/arch/sparc/kernel/setup_64.c
index f728f1b00aca..79b56613c6d8 100644
--- a/arch/sparc/kernel/setup_64.c
+++ b/arch/sparc/kernel/setup_64.c
@@ -143,8 +143,6 @@ static void __init boot_flags_init(char *commands)
 
 extern unsigned short root_flags;
 extern unsigned short root_dev;
-extern unsigned short ram_flags;
-#define RAMDISK_IMAGE_START_MASK	0x07FF
 
 extern int root_mountflags;
 
@@ -640,9 +638,6 @@ void __init setup_arch(char **cmdline_p)
 	if (!root_flags)
 		root_mountflags &= ~MS_RDONLY;
 	ROOT_DEV = old_decode_dev(root_dev);
-#ifdef CONFIG_BLK_DEV_RAM
-	rd_image_start = ram_flags & RAMDISK_IMAGE_START_MASK;
-#endif
 
 #ifdef CONFIG_IP_PNP
 	if (!ic_set_manually) {
diff --git a/arch/x86/boot/header.S b/arch/x86/boot/header.S
index 9bea5a1e2c52..0ced2e9f100e 100644
--- a/arch/x86/boot/header.S
+++ b/arch/x86/boot/header.S
@@ -235,7 +235,7 @@ hdr:
 		.byte setup_sects - 1
 root_flags:	.word ROOT_RDONLY
 syssize:	.long ZO__edata / 16
-ram_size:	.word 0			/* Obsolete */
+ram_size:	.word 0			/* Used to control initrd, which was removed from Linux in 2025 */
 vid_mode:	.word SVGA_MODE
 root_dev:	.word 0			/* Default to major/minor 0/0 */
 boot_flag:	.word 0xAA55
diff --git a/arch/x86/include/uapi/asm/bootparam.h b/arch/x86/include/uapi/asm/bootparam.h
index f53dd3f319ba..bf56549f79bb 100644
--- a/arch/x86/include/uapi/asm/bootparam.h
+++ b/arch/x86/include/uapi/asm/bootparam.h
@@ -4,9 +4,6 @@
 
 #include <asm/setup_data.h>
 
-/* ram_size flags */
-#define RAMDISK_IMAGE_START_MASK	0x07FF
-
 /* loadflags */
 #define LOADED_HIGH	(1<<0)
 #define KASLR_FLAG	(1<<1)
@@ -37,7 +34,7 @@ struct setup_header {
 	__u8	setup_sects;
 	__u16	root_flags;
 	__u32	syssize;
-	__u16	ram_size;
+	__u16	ram_size; /* used to control initrd, which was removed from Linux in 2025 */
 	__u16	vid_mode;
 	__u16	root_dev;
 	__u16	boot_flag;
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 6409e766fb17..797c3c9fc75e 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -222,8 +222,6 @@ extern int root_mountflags;
 
 unsigned long saved_video_mode;
 
-#define RAMDISK_IMAGE_START_MASK	0x07FF
-
 static char __initdata command_line[COMMAND_LINE_SIZE];
 #ifdef CONFIG_CMDLINE_BOOL
 char builtin_cmdline[COMMAND_LINE_SIZE] = CONFIG_CMDLINE;
@@ -541,9 +539,6 @@ static void __init parse_boot_params(void)
 	bootloader_version  = bootloader_type & 0xf;
 	bootloader_version |= boot_params.hdr.ext_loader_ver << 4;
 
-#ifdef CONFIG_BLK_DEV_RAM
-	rd_image_start = boot_params.hdr.ram_size & RAMDISK_IMAGE_START_MASK;
-#endif
 #ifdef CONFIG_EFI
 	if (!strncmp((char *)&boot_params.efi_info.efi_loader_signature,
 		     EFI32_LOADER_SIGNATURE, 4)) {
diff --git a/include/linux/initrd.h b/include/linux/initrd.h
index f1a1f4c92ded..6320a9cb6686 100644
--- a/include/linux/initrd.h
+++ b/include/linux/initrd.h
@@ -5,9 +5,6 @@
 
 #define INITRD_MINOR 250 /* shouldn't collide with /dev/ram* too soon ... */
 
-/* starting block # of image */
-extern int rd_image_start;
-
 /* size of a single RAM disk */
 extern unsigned long rd_size;
 
diff --git a/init/do_mounts_rd.c b/init/do_mounts_rd.c
index f7d53bc21e41..8e0a774a9c6f 100644
--- a/init/do_mounts_rd.c
+++ b/init/do_mounts_rd.c
@@ -17,11 +17,9 @@
 static struct file *in_file, *out_file;
 static loff_t in_pos, out_pos;
 
-int __initdata rd_image_start;		/* starting block # of image */
-
 static int __init ramdisk_start_setup(char *str)
 {
-	rd_image_start = simple_strtol(str,NULL,0);
+	/* will be removed in next commit */
 	return 1;
 }
 __setup("ramdisk_start=", ramdisk_start_setup);
@@ -60,7 +58,7 @@ identify_ramdisk_image(struct file *file, loff_t pos,
 	unsigned char *buf;
 	const char *compress_name;
 	unsigned long n;
-	int start_block = rd_image_start;
+	int start_block = 0;
 
 	buf = kmalloc(size, GFP_KERNEL);
 	if (!buf)
@@ -196,7 +194,7 @@ int __init rd_load_image(char *from)
 	if (IS_ERR(in_file))
 		goto noclose_input;
 
-	in_pos = rd_image_start * BLOCK_SIZE;
+	in_pos = 0;
 	nblocks = identify_ramdisk_image(in_file, in_pos, &decompressor);
 	if (nblocks < 0)
 		goto done;
-- 
2.47.2


