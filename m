Return-Path: <linuxppc-dev+bounces-12112-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0728B55DF9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Sep 2025 05:15:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNxJG6RxPz3clB;
	Sat, 13 Sep 2025 13:15:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757725644;
	cv=none; b=ZMcA++CphFx5P5HWeYL45nbDGVNSRpo08Eu36hMnWbXH4i9GMUXySI4imvXKVJaVLQL8XwmSEhTWTzd7IzXh0j1bCWXykhL848uahWeSjtOMiv0bIVsomEjdcA1ER6qVtYgwyKKvkkQ/lUx2H5RpqS7oOWwvDqac1sI+yVhmCGzhtJhDt53MZw1aem4+83+9EgPRFNIC+Rbx0Y6l/p1Vbt2xFIwGpd1/BnD0u669/j6SKS/cCy9b856fD8yl7r/+g8+llguZhjcEg0EyTnYyKeGYILiJ9YCJf9fpi3LTUIF4A0VNoJ3bbcuLKcgC/nIclDE0hz1HdgSWehMRmRVDww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757725644; c=relaxed/relaxed;
	bh=6TddlkftgluMc/5OOjsTCfHjiuASJR5DkmoxCxqoFSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mv8UQ+rtvu+uwJfx/kRkFJRI/FdsW53o2uKxSYvHOlxtt3Xh1PUhz22M027GRhpIxC9yhZeXw8NNoBxzD9fRxzS5Z57aSDvkcaH7SMf+K/uiyaviBb0/SODecsYqya/S0DR9vqJcrqhSzQuEtQ9jfkh9mV+iyM+mkwT54BoZhr3yM/1lp/lHhxM174CIfiSwVS5VkNq0dHp+d9bgO2m1y2XqjPPnhHdqNaZ2xbkUmThpTdBPnDJGdAb7p5F2UW+CqbAZrDb/0qrH5b54jtLSG+G6IYDr1wpnzjocFhNBZjYo+hk7AHZ7L9PkksAPUjiOGHV/u40449xPXINjJc76EA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TIQ5ZxH7; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TIQ5ZxH7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNtSD00j9z2yrN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 11:07:23 +1000 (AEST)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b043a33b060so375371366b.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 18:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725640; x=1758330440; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6TddlkftgluMc/5OOjsTCfHjiuASJR5DkmoxCxqoFSk=;
        b=TIQ5ZxH7fXY1UYwTCsITXqaXUkSiHebLnUIbS5in3exJC8mSYTx7QlxrLL0JmY8PFl
         gEBCC5bVM3btWqU8PiSacooJNzdUZrWhDeXutZFWLVKFeKvjTYZsXr7X9G650Ja5oSFY
         k/zK+ADYuyxnLAb3d/NkFOKTdAs/YwWj1oNs+mWblnJpqjecwCntE3iTTvVQ5yL1d+Z3
         p2ym+uzaxwP99xbzT5uqYC8z76hpW3oK+7KWkjpfvBPC11yyy8ktgcwlhXqPp78tqlub
         S+zmEB5OTROUZ8a/FDAmFLlBhMOX9JEytIl89dSpEstmpwbhKw+n5RKu5lwzuLFVjXhq
         kiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725640; x=1758330440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6TddlkftgluMc/5OOjsTCfHjiuASJR5DkmoxCxqoFSk=;
        b=dZ5QDpth5QpB4Ap9i8pIOylbPSLg8OflgkgSeHxmcKucukboXsE/KfxYz/4XfsiZj9
         buTSWJZnISj+Gqsf2+XkorTUNwOhavAAaiPLPN7fLc4AD+Ja0ZYnIuCmlqfCsCMbEoTA
         T0l9p54tjBJZ8evi/EJ6e90KbvQx5ul7n84pnJi36NY2bjB9E32RTT5vv6piwO0XTyoA
         GoqXEBSUObMx0mS/CgNZlPLLw7j8//BovXVe8fADYOS7wA465Qs8G9Z/nWWJ9+8YNUD1
         aP85xQpPpl5jajtk/LXIEiST/nNq7wvtrwWD9aUMkvSxhZlt2tlXxytee55e4ygj0xMy
         0MBg==
X-Forwarded-Encrypted: i=1; AJvYcCV8AUikK8JN3Tvv9Ybd8ZKS16yXPFmJwxWED2keeL6Lm8ZHV6xCgq6BGX1HzAhsRsDG8xxCMjZYsHTKGx8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxa1QfQADo8Y19gMTrVbRXlJgvU5RspFuLLRwOPQatkBuhtMf4C
	SL5cp8hfm0zMvr6oKIu95T7AXIqE2gt3zvrY79Nh8jqIoOtiyarht7cg
X-Gm-Gg: ASbGnctIr9hGNiBuVNy1AeXD++K/qtKJe7+t/P7FkRWLwqH73ajBdnz/r606/3JTiHG
	surTW0HKyUxn9i/dXWGGlNI1eenSmZiFCoSH7ERisGyDno3zPJBJiXOFqrERhWw/dVf2T3gbEsT
	7JJSEFY+0RARKuxTyyql/DvzMptG2B1CuaxpmK6AfE2iFZuISpCIuzfHSOamNAsIkV49q2S7GJ6
	tLEAsso6pZYCwxyPlAh8gPyRB3LnXwil8KFhLzeHI48aFHFaRUsoddNx6MqN7XjRtUQ/z1J2UcN
	rxyWl78rh8wDCBV2OxAhazcBXq+e6SGHpiZT+qlVzgQxVTyNtNC8Jarb6CUufzRugvFWrWsp/kH
	isMZq5a/9zRDb6YT2zFk=
X-Google-Smtp-Source: AGHT+IEPa147nGJmvgvWkKDBP00lWIElqeQkHe249MsG+HewIQaHxDJ7wNuN9LkOMWVT9BrK9W88lg==
X-Received: by 2002:a17:906:d185:b0:b07:de95:1c70 with SMTP id a640c23a62f3a-b07de9543bdmr137566766b.31.1757725640067;
        Fri, 12 Sep 2025 18:07:20 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b334e720sm472168266b.104.2025.09.12.18.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:07:19 -0700 (PDT)
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
Subject: [PATCH RESEND 25/62] init: rename phys_initrd_{start,size} to phys_external_initramfs_{start,size}
Date: Sat, 13 Sep 2025 00:38:04 +0000
Message-ID: <20250913003842.41944-26-safinaskar@gmail.com>
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

Rename phys_initrd_start to phys_external_initramfs_start and
phys_initrd_size to phys_external_initramfs_size.

They refer to initramfs, not to initrd

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 arch/arc/mm/init.c         |  8 ++++----
 arch/arm/mm/init.c         |  8 ++++----
 arch/arm64/mm/init.c       | 15 ++++++++-------
 arch/x86/kernel/setup.c    |  4 ++--
 drivers/firmware/efi/efi.c |  6 +++---
 drivers/of/fdt.c           |  8 ++++----
 include/linux/initrd.h     |  4 ++--
 init/do_mounts_initrd.c    |  8 ++++----
 init/initramfs.c           | 10 +++++-----
 9 files changed, 36 insertions(+), 35 deletions(-)

diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
index a73cc94f806e..eb8a616a63c6 100644
--- a/arch/arc/mm/init.c
+++ b/arch/arc/mm/init.c
@@ -110,10 +110,10 @@ void __init setup_arch_memory(void)
 			 __pa(_end) - CONFIG_LINUX_LINK_BASE);
 
 #ifdef CONFIG_BLK_DEV_INITRD
-	if (phys_initrd_size) {
-		memblock_reserve(phys_initrd_start, phys_initrd_size);
-		initrd_start = (unsigned long)__va(phys_initrd_start);
-		initrd_end = initrd_start + phys_initrd_size;
+	if (phys_external_initramfs_size) {
+		memblock_reserve(phys_external_initramfs_start, phys_external_initramfs_size);
+		initrd_start = (unsigned long)__va(phys_external_initramfs_start);
+		initrd_end = initrd_start + phys_external_initramfs_size;
 	}
 #endif
 
diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
index 54bdca025c9f..93f8010b9115 100644
--- a/arch/arm/mm/init.c
+++ b/arch/arm/mm/init.c
@@ -55,8 +55,8 @@ static int __init parse_tag_initrd(const struct tag *tag)
 {
 	pr_warn("ATAG_INITRD is deprecated; "
 		"please update your bootloader.\n");
-	phys_initrd_start = __virt_to_phys(tag->u.initrd.start);
-	phys_initrd_size = tag->u.initrd.size;
+	phys_external_initramfs_start = __virt_to_phys(tag->u.initrd.start);
+	phys_external_initramfs_size = tag->u.initrd.size;
 	return 0;
 }
 
@@ -64,8 +64,8 @@ __tagtable(ATAG_INITRD, parse_tag_initrd);
 
 static int __init parse_tag_initrd2(const struct tag *tag)
 {
-	phys_initrd_start = tag->u.initrd.start;
-	phys_initrd_size = tag->u.initrd.size;
+	phys_external_initramfs_start = tag->u.initrd.start;
+	phys_external_initramfs_size = tag->u.initrd.size;
 	return 0;
 }
 
diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index ea84a61ed508..da517edcf824 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -246,14 +246,15 @@ void __init arm64_memblock_init(void)
 		memblock_add(__pa_symbol(_text), (u64)(_end - _text));
 	}
 
-	if (IS_ENABLED(CONFIG_BLK_DEV_INITRD) && phys_initrd_size) {
+	if (IS_ENABLED(CONFIG_BLK_DEV_INITRD) && phys_external_initramfs_size) {
 		/*
 		 * Add back the memory we just removed if it results in the
 		 * initrd to become inaccessible via the linear mapping.
 		 * Otherwise, this is a no-op
 		 */
-		u64 base = phys_initrd_start & PAGE_MASK;
-		u64 size = PAGE_ALIGN(phys_initrd_start + phys_initrd_size) - base;
+		u64 base = phys_external_initramfs_start & PAGE_MASK;
+		u64 size = PAGE_ALIGN(phys_external_initramfs_start +
+			phys_external_initramfs_size) - base;
 
 		/*
 		 * We can only add back the initrd memory if we don't end up
@@ -267,7 +268,7 @@ void __init arm64_memblock_init(void)
 			 base + size > memblock_start_of_DRAM() +
 				       linear_region_size,
 			"initrd not fully accessible via the linear mapping -- please check your bootloader ...\n")) {
-			phys_initrd_size = 0;
+			phys_external_initramfs_size = 0;
 		} else {
 			memblock_add(base, size);
 			memblock_clear_nomap(base, size);
@@ -280,10 +281,10 @@ void __init arm64_memblock_init(void)
 	 * pagetables with memblock.
 	 */
 	memblock_reserve(__pa_symbol(_stext), _end - _stext);
-	if (IS_ENABLED(CONFIG_BLK_DEV_INITRD) && phys_initrd_size) {
+	if (IS_ENABLED(CONFIG_BLK_DEV_INITRD) && phys_external_initramfs_size) {
 		/* the generic initrd code expects virtual addresses */
-		initrd_start = __phys_to_virt(phys_initrd_start);
-		initrd_end = initrd_start + phys_initrd_size;
+		initrd_start = __phys_to_virt(phys_external_initramfs_start);
+		initrd_end = initrd_start + phys_external_initramfs_size;
 	}
 
 	early_init_fdt_scan_reserved_mem();
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 797c3c9fc75e..e727c7a7f648 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -297,7 +297,7 @@ static u64 __init get_ramdisk_image(void)
 	ramdisk_image |= (u64)boot_params.ext_ramdisk_image << 32;
 
 	if (ramdisk_image == 0)
-		ramdisk_image = phys_initrd_start;
+		ramdisk_image = phys_external_initramfs_start;
 
 	return ramdisk_image;
 }
@@ -308,7 +308,7 @@ static u64 __init get_ramdisk_size(void)
 	ramdisk_size |= (u64)boot_params.ext_ramdisk_size << 32;
 
 	if (ramdisk_size == 0)
-		ramdisk_size = phys_initrd_size;
+		ramdisk_size = phys_external_initramfs_size;
 
 	return ramdisk_size;
 }
diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
index 1ce428e2ac8a..7cab72da2ea9 100644
--- a/drivers/firmware/efi/efi.c
+++ b/drivers/firmware/efi/efi.c
@@ -808,13 +808,13 @@ int __init efi_config_parse_tables(const efi_config_table_t *config_tables,
 	}
 
 	if (IS_ENABLED(CONFIG_BLK_DEV_INITRD) &&
-	    initrd != EFI_INVALID_TABLE_ADDR && phys_initrd_size == 0) {
+	    initrd != EFI_INVALID_TABLE_ADDR && phys_external_initramfs_size == 0) {
 		struct linux_efi_initrd *tbl;
 
 		tbl = early_memremap(initrd, sizeof(*tbl));
 		if (tbl) {
-			phys_initrd_start = tbl->base;
-			phys_initrd_size = tbl->size;
+			phys_external_initramfs_start = tbl->base;
+			phys_external_initramfs_size = tbl->size;
 			early_memunmap(tbl, sizeof(*tbl));
 		}
 	}
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 0edd639898a6..9c4c9be948c5 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -760,8 +760,8 @@ static void __early_init_dt_declare_initrd(unsigned long start,
 {
 	/*
 	 * __va() is not yet available this early on some platforms. In that
-	 * case, the platform uses phys_initrd_start/phys_initrd_size instead
-	 * and does the VA conversion itself.
+	 * case, the platform uses phys_external_initramfs_start/phys_external_initramfs_size
+	 * instead and does the VA conversion itself.
 	 */
 	if (!IS_ENABLED(CONFIG_ARM64) &&
 	    !(IS_ENABLED(CONFIG_RISCV) && IS_ENABLED(CONFIG_64BIT))) {
@@ -799,8 +799,8 @@ static void __init early_init_dt_check_for_initrd(unsigned long node)
 		return;
 
 	__early_init_dt_declare_initrd(start, end);
-	phys_initrd_start = start;
-	phys_initrd_size = end - start;
+	phys_external_initramfs_start = start;
+	phys_external_initramfs_size = end - start;
 
 	pr_debug("initrd_start=0x%llx  initrd_end=0x%llx\n", start, end);
 }
diff --git a/include/linux/initrd.h b/include/linux/initrd.h
index 4080ba82d4c9..23c08e88234c 100644
--- a/include/linux/initrd.h
+++ b/include/linux/initrd.h
@@ -17,8 +17,8 @@ static inline void __init reserve_initrd_mem(void) {}
 static inline void wait_for_initramfs(void) {}
 #endif
 
-extern phys_addr_t phys_initrd_start;
-extern unsigned long phys_initrd_size;
+extern phys_addr_t phys_external_initramfs_start;
+extern unsigned long phys_external_initramfs_size;
 
 extern char __builtin_initramfs_start[];
 extern unsigned long __builtin_initramfs_size;
diff --git a/init/do_mounts_initrd.c b/init/do_mounts_initrd.c
index d5264e9a52e0..444182a76999 100644
--- a/init/do_mounts_initrd.c
+++ b/init/do_mounts_initrd.c
@@ -15,8 +15,8 @@
 unsigned long initrd_start, initrd_end;
 int initrd_below_start_ok;
 
-phys_addr_t phys_initrd_start __initdata;
-unsigned long phys_initrd_size __initdata;
+phys_addr_t phys_external_initramfs_start __initdata;
+unsigned long phys_external_initramfs_size __initdata;
 
 static int __init early_initrdmem(char *p)
 {
@@ -28,8 +28,8 @@ static int __init early_initrdmem(char *p)
 	if (*endp == ',') {
 		size = memparse(endp + 1, NULL);
 
-		phys_initrd_start = start;
-		phys_initrd_size = size;
+		phys_external_initramfs_start = start;
+		phys_external_initramfs_size = size;
 	}
 	return 0;
 }
diff --git a/init/initramfs.c b/init/initramfs.c
index 2866d7a0afd7..6abe0a3ca4ce 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -610,7 +610,7 @@ void __init reserve_initrd_mem(void)
 	/* Ignore the virtul address computed during device tree parsing */
 	initrd_start = initrd_end = 0;
 
-	if (!phys_initrd_size)
+	if (!phys_external_initramfs_size)
 		return;
 	/*
 	 * Round the memory region to page boundaries as per free_initrd_mem()
@@ -618,8 +618,8 @@ void __init reserve_initrd_mem(void)
 	 * are in use, but more importantly, reserves the entire set of pages
 	 * as we don't want these pages allocated for other purposes.
 	 */
-	start = round_down(phys_initrd_start, PAGE_SIZE);
-	size = phys_initrd_size + (phys_initrd_start - start);
+	start = round_down(phys_external_initramfs_start, PAGE_SIZE);
+	size = phys_external_initramfs_size + (phys_external_initramfs_start - start);
 	size = round_up(size, PAGE_SIZE);
 
 	if (!memblock_is_region_memory(start, size)) {
@@ -636,8 +636,8 @@ void __init reserve_initrd_mem(void)
 
 	memblock_reserve(start, size);
 	/* Now convert initrd to virtual addresses */
-	initrd_start = (unsigned long)__va(phys_initrd_start);
-	initrd_end = initrd_start + phys_initrd_size;
+	initrd_start = (unsigned long)__va(phys_external_initramfs_start);
+	initrd_end = initrd_start + phys_external_initramfs_size;
 	initrd_below_start_ok = 1;
 
 	return;
-- 
2.47.2


