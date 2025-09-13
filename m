Return-Path: <linuxppc-dev+bounces-12114-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D87FBB55DFB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Sep 2025 05:16:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNxJX41bzz3cZy;
	Sat, 13 Sep 2025 13:15:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::632"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757725513;
	cv=none; b=cL/gC9QC1yMNZFyb5Vbh+DrSFpfbRCy84o/CEXVzoAEBE2uUJC4ExIK+duQXxZyjpeXLd9CrwL1Sj6HSO9L0VoH2EK9PSYLKBEiSLj7fvXNvg1sXRGRmv+MU6ylmQiKRZLEMB/3t3bmksBBfWHAQPWyJCBmjgDp40VVmlhP5vVw79LroMJEb8wwEJVlvoMzsnpOpGidTCCGOuS2dT/uL2srtmM/Y+dCd9CiV50GIdcrsvNCtNS9hCrJWnptcFBug4NBWiLlJI4c7sSDinUMr31iVte6YV+7eXlAXn5HBcDH7YjyzJC3VJn6cBIrHBelukk/SjXdnzR47c/MWVcO25w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757725513; c=relaxed/relaxed;
	bh=5agMVhmWz9D3tLYyZnqIaP8gTBBboQ75Wn3D7w2vh+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HyIUndZAEMbvwFx8wtHqxZJ7GRxRpJjt1oDuMz1aBPTlm+2sfuTtWq6H0nJF/Ab6z0KuO6KWd6/9S4Wk5kKEjvc1wM+7emoJ4TlN+1a0L1txf0s3fFDExzx45Ez4LjrjCO1pSIohWNFft5YIiNt+EHL+5Sm0htrD6Ynsv98bO7hHC+YlsIRjEXsD1mJKch/Rdoamfs9jq/iEkYKN3R5eNmbK2lhdP0cYa3XoGlwsUF4V4rAE+0uK4RyUauSwi+LvziESFLAWlW/3e4DEgUEQdSP2PBvlcqchIOOrfuL5sFMXl7JRwP4MaCUFYtflEmBZuvB7zQq71+VPOCyO9pSMuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WGd4yoxo; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WGd4yoxo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNtPh3Zzlz2yrN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 11:05:12 +1000 (AEST)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b078aabeb9fso396828366b.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 18:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725509; x=1758330309; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5agMVhmWz9D3tLYyZnqIaP8gTBBboQ75Wn3D7w2vh+Q=;
        b=WGd4yoxonYn2TllTjFCPsBkMM2Frb4JmQ2ALsZTyHXqeSsu3r7E00lsry8LeR0mIQb
         LFln2Mth1JOl9Joc29TBY++k5HskLv3Oziab/FvxUFLIseHfDA9NfUxchdsA+qapiABc
         YBo5mMqBWOEY1xP0pjsTjjPLA0u64SrF0lj9BuEk5au/R2Y8qEyX55IhP9NvRuBa3h/P
         ENghd6wL/sf4F3IfHOz1GNQVrVwJELLIRtGqnvBdM2R2+W3W19/zP7jQBGmS3PgR4P8X
         P8lXXx8ZK8pZJZu3e6aLrGRVQx5HGss8isGTxlxrk/Rgh6lrpbAjXinayDiTTYSwHxpE
         bZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725509; x=1758330309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5agMVhmWz9D3tLYyZnqIaP8gTBBboQ75Wn3D7w2vh+Q=;
        b=FXwWTzh4151Ea/QwHIcHycsH4qEc64gb06mJ8aBoFz+Kuh3CYs9S3HbHz1/bAu/FVH
         8eaihGHMGuAo+grQXT1IRlIeWnQJ9cPxUTInSkVZ7iZVgAutNDMAoD9kxtKzbwG72V/9
         9j4Gm4PJbAWO3T4lSHStv8sAM1C0IjXAxZ3kAWNdoK76J7oG6k/PZ+ysy+vsZyHXwgmH
         xZAhrdTfj1RegdfRnL6mp42rxRx0u40f/KPLBcSgpq368Ua93lBfEUeT4b/u4TK2b5vK
         V+GzeZ4wwQ8kZCP32cWpBsYZmhVmOqEZZjHh0ZYD5ErLTUbilKwP8Pg3Se8fDJcXIt2h
         P74w==
X-Forwarded-Encrypted: i=1; AJvYcCUrteVyz2SfFJiUd8Kv2xJXgSKCt9qs7+RLFXs3Q9OHG9SkIxfb5YFBrbkgNMKOvR1kkyh+rmw7jigGJdY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwNr2AK+ERBPSDHV/m51VgBBLqQcwIfYD8lZ6szZ26CL2c40Lc+
	dqVE/n623k4JRNAdb1cbDQWPfoz3vXG+asSln1ZaKAhllGVfS9kQjpgq
X-Gm-Gg: ASbGncs/kCfYFJuB15Q/Uskdw2RPpP7ccpH+bxtRUsLKIQC7vAWlVthOqsJuUaGC1ih
	hlpNcXIGL0omky5ZGD/w3Wxy5DMWb7vsLRkEj5aofhVkzn/JQs+p4VOXTx/+AgY3uzSwbKEcl/r
	AKW7KAcO3cDDRYliiAgGgjTSfwv+wvOqn/ZOchlT3XG896ZwWMr4UN9iimLkBv2Pkw/3gTks/Ck
	kADGQ+K9KFuK2AwhT1kxI7b73XqoTZNwh5TGp+wEvozilIS1gGdNuw1hJ0kdtch1JU7BynCtlWG
	ev5q5bK8cEdAb6ytUjmnkEE+sEgqHDxD7BYfTFNVdt9PMDYJH0v7XD051wN66/iGJDF9fj3Bsf9
	RfCYdupJpOR6X62fZLSk=
X-Google-Smtp-Source: AGHT+IHBVL7U9njYQbYDntatJDbtYTvNiZyrYrp6F3Zot8CfKJXHpFfpfQfFxJfdQecWj/pXbevxCg==
X-Received: by 2002:a17:907:980a:b0:b04:7ea3:a10c with SMTP id a640c23a62f3a-b07c3551576mr448691266b.8.1757725509440;
        Fri, 12 Sep 2025 18:05:09 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b31291b0sm475372166b.34.2025.09.12.18.05.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:05:08 -0700 (PDT)
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
Subject: [PATCH RESEND 23/62] init: rename __initramfs_{start,size} to __builtin_initramfs_{start,size}
Date: Sat, 13 Sep 2025 00:38:02 +0000
Message-ID: <20250913003842.41944-24-safinaskar@gmail.com>
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

Rename __initramfs_start to __builtin_initramfs_start and
__initramfs_size to __builtin_initramfs_size .

This is more clear

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 arch/x86/tools/relocs.c           | 2 +-
 drivers/acpi/tables.c             | 4 ++--
 include/asm-generic/vmlinux.lds.h | 6 +++---
 include/linux/initrd.h            | 4 ++--
 init/initramfs.c                  | 4 +---
 usr/initramfs_data.S              | 4 ++--
 6 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/arch/x86/tools/relocs.c b/arch/x86/tools/relocs.c
index 5778bc498415..4b4e556f1b52 100644
--- a/arch/x86/tools/relocs.c
+++ b/arch/x86/tools/relocs.c
@@ -87,7 +87,7 @@ static const char * const	sym_regex_kernel[S_NSYMTYPES] = {
 	"__(start|stop)_notes|"
 	"__end_rodata|"
 	"__end_rodata_aligned|"
-	"__initramfs_start|"
+	"__builtin_initramfs_start|"
 	"(jiffies|jiffies_64)|"
 #if ELF_BITS == 64
 	"__end_rodata_hpage_align|"
diff --git a/drivers/acpi/tables.c b/drivers/acpi/tables.c
index fa9bb8c8ce95..3160cb7dca00 100644
--- a/drivers/acpi/tables.c
+++ b/drivers/acpi/tables.c
@@ -429,8 +429,8 @@ void __init acpi_table_upgrade(void)
 	struct cpio_data file;
 
 	if (IS_ENABLED(CONFIG_ACPI_TABLE_OVERRIDE_VIA_BUILTIN_INITRD)) {
-		data = __initramfs_start;
-		size = __initramfs_size;
+		data = __builtin_initramfs_start;
+		size = __builtin_initramfs_size;
 	} else {
 		data = (void *)initrd_start;
 		size = initrd_end - initrd_start;
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index ae2d2359b79e..a6bd2ff46f7e 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -46,8 +46,8 @@
  * [_sdata, _edata] is the data section
  *
  * Some of the included output section have their own set of constants.
- * Examples are: [__initramfs_start, __initramfs_end] for initramfs and
- *               [__nosave_begin, __nosave_end] for the nosave data
+ * Examples are: [__builtin_initramfs_start, __builtin_initramfs_start + __builtin_initramfs_size]
+ * for initramfs and [__nosave_begin, __nosave_end] for the nosave data
  */
 
 #include <asm-generic/codetag.lds.h>
@@ -969,7 +969,7 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
 #ifdef CONFIG_BLK_DEV_INITRD
 #define INIT_RAM_FS							\
 	. = ALIGN(4);							\
-	__initramfs_start = .;						\
+	__builtin_initramfs_start = .;						\
 	KEEP(*(.init.ramfs))						\
 	. = ALIGN(8);							\
 	KEEP(*(.init.ramfs.info))
diff --git a/include/linux/initrd.h b/include/linux/initrd.h
index cc389ef1a738..e49c7166dbb3 100644
--- a/include/linux/initrd.h
+++ b/include/linux/initrd.h
@@ -21,8 +21,8 @@ static inline void wait_for_initramfs(void) {}
 extern phys_addr_t phys_initrd_start;
 extern unsigned long phys_initrd_size;
 
-extern char __initramfs_start[];
-extern unsigned long __initramfs_size;
+extern char __builtin_initramfs_start[];
+extern unsigned long __builtin_initramfs_size;
 
 void console_on_rootfs(void);
 
diff --git a/init/initramfs.c b/init/initramfs.c
index 850cb0de873e..2866d7a0afd7 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -597,8 +597,6 @@ static int __init initramfs_async_setup(char *str)
 }
 __setup("initramfs_async=", initramfs_async_setup);
 
-extern char __initramfs_start[];
-extern unsigned long __initramfs_size;
 #include <linux/initrd.h>
 #include <linux/kexec.h>
 
@@ -695,7 +693,7 @@ static inline bool kexec_free_initrd(void)
 static void __init do_populate_rootfs(void *unused, async_cookie_t cookie)
 {
 	/* Load the built in initramfs */
-	char *err = unpack_to_rootfs(__initramfs_start, __initramfs_size);
+	char *err = unpack_to_rootfs(__builtin_initramfs_start, __builtin_initramfs_size);
 	if (err)
 		panic_show_mem("%s", err); /* Failed to decompress INTERNAL initramfs */
 
diff --git a/usr/initramfs_data.S b/usr/initramfs_data.S
index cd67edc38797..64ca648a80e2 100644
--- a/usr/initramfs_data.S
+++ b/usr/initramfs_data.S
@@ -27,8 +27,8 @@ __irf_start:
 .incbin "usr/initramfs_inc_data"
 __irf_end:
 .section .init.ramfs.info,"a"
-.globl __initramfs_size
-__initramfs_size:
+.globl __builtin_initramfs_size
+__builtin_initramfs_size:
 #ifdef CONFIG_64BIT
 	.quad __irf_end - __irf_start
 #else
-- 
2.47.2


