Return-Path: <linuxppc-dev+bounces-12159-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CCBB566D3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Sep 2025 06:39:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cPb6j3sTKz3cdg;
	Sun, 14 Sep 2025 14:39:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757822411;
	cv=none; b=S02TKnxeTI6eJE/eius6tKzAE8m/Q8SxH/e6FZlb69wJYu65Rv847mGwa6871kevseNxQGFQnijxordPO9Ryxcx9ZqOeXHMqd8nypyEscFPJ8ZHxoRiWNt4pbaBMd/tYLrJnJ07DxJbEs8xa0WLHuznfXg3aQVRgZMq4aWRx0Ym3VJ02XvrWCmITfpOm85sLHBlQOswrYOUUWYFkfWyMCtxl/t8XJKWMUDVgEc5gZvGUlqto58iucs3Ld+YiI4Ka/yDehYK/bzCTN5faDYkbvI0BSBaNGYYkpoMDWW3pIQt6pAAhi1ivV/zV9xD7g6ke2b+O+69dRrFBIeqZPd6LiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757822411; c=relaxed/relaxed;
	bh=sPu72pvE4Wbo60re69UImAF/YSQlNTTbxtv7CBRvcjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZCcknTcvkHpgIKtgP9U0cbp/7VW8nkkzS5XSZ/8fwPmW/sU0hMHIYKdP4fW+jNpDHW+E61al7Vmf9TyHUGnEnOZG64jgJCkEM9fvq5JLSsdnNt++aHgBadbD2Ow+xQ0hBRlD5VOylncj9sY7hQP35pqXHxQ96K8XHcL9iGgLONIwncSC3eJozOQa3WgQZZASnPxOkFHUiXWXsvzyBRuTmVtdzdaBRdMF2RcbwmhHON+RQaqUndp5bgH02bwsxOkR/NiJbTMU7yMJufC/ooQQilBOmiAKqG2HlNqLYkO76nifvgnbkUydA6mJ5wMDqnE+FZJgr5fNUTRNrpmQieK4UA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ftp29IP9; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ftp29IP9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cPZF62pCgz2yyx
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Sep 2025 14:00:10 +1000 (AEST)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6228de280a4so5039177a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 21:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822408; x=1758427208; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sPu72pvE4Wbo60re69UImAF/YSQlNTTbxtv7CBRvcjs=;
        b=ftp29IP92r2SGtT3o/+JTqwqmi2W8WL52yY6NHALQecPkhKc6gtnAUWOFtWMYc57nQ
         zUDMH33S8OHevxCJJMXkA10rtu03GwdTK7D2k8ruH+13InTNOVCQ/0O4hKhEKMNZ8wuW
         W1x9R1/QJf/Lw78UgsmnACHtBcvgMeYYK35eEdAGp7MFFyJCS/aLGH5mZq0UjIMXli3u
         NgOCJPzjSCmA4/3CPeTJ/NfT4g7EaJ57wejTF0apD35YeL40uFfqg0BM1l4ansZ+WowB
         jdaY+YjaIM5tIFiI7fqfQlz/PnGvO9V02LnW2cVJmv/R/m6zZyLmgwrAbavqYdB7HEtS
         bU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822408; x=1758427208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sPu72pvE4Wbo60re69UImAF/YSQlNTTbxtv7CBRvcjs=;
        b=utWChA2zg2a5gKKn4jAh9ivdrf+tpkIUkbH9JaGz906XPpcJwIzH9QOk4PY3oYlHGl
         noUoyYlSzNrpdJphBEhCXA8jevmt/mdPQhCeyAyz63z2MvrY9wCy79bFjylwwXLYwSEe
         QaOd3rimh4FJ3zt2jdfnCNHd5KsXTj1+eTY9m0WszZxdY4xnqvAnDFGg6XbcIJqksgpF
         nawKS3DAOe5IiTWd/ZfnclhHgIZVZOeoIYh7Za6YYEl+3ull4qZ0ntFKJ6Tx88uZx6Nw
         tFdydw0s3mtvH09OY8ADHvdGY1gZcNfwE5AwWMOt6YRfjUR0Nph2UiMaLt2p2Z3TVBTK
         sCGg==
X-Forwarded-Encrypted: i=1; AJvYcCUo1MQ5AtBO2sx2kVpr7L1usGz0G037flpsZ3SSHX0YcFTBESCraSQ1A/XugMPBBs4DPFSd6Pev+FKaDAQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwjHrRK7582ZkN8znspjVXI8kotegXL8TzAwHnH0Brdkq6Cs2fv
	nTihviS1UGQmvZRFOV4qhVfMHdlsE6PjIh5uI2zRsicEtFkw67DWOHud
X-Gm-Gg: ASbGncuS3QMyaeojcfAxkMuJUuk88fGHzqr5zkpfw9U3GEpJdvddxRa8s8/3qO0Ra+W
	9keRtHl6rPAwcUQgak2NXpxJi/pMUZSEFkeNHJregND7W89eNOCwu6zWA1UnqckMsDPRtR0stqU
	aX7mIa4HehkzktDnBhvXr1CKKYYGzQxmonJwZhlKD9kdIGcEGSLoxBlUB+xvSkdW79Pnka5+5ML
	i+zSXDQ2jqqOTEzN5SJQ4KfCSuLdKaTrJPYD+HDvkRg0z5aDOf5jhsDXNmCucXHoB+luV+O5wFs
	af8GwDAI9G5TwKDEAZ1+EkHxDUQIkYjjxovn6r4k0xMnwCxl/8OSyD6oxBVoN+nCRTgGwprvi1G
	Wln3n3STdcJYaBy3WUYo=
X-Google-Smtp-Source: AGHT+IEl+TZwxB50+bcUbtwQ17obwnzKEwTqhOZYOAPQC+b9EZK3iFYtQ6uoMv0unkK0mvoXQKHChg==
X-Received: by 2002:a17:907:3e1e:b0:afe:35d:fd5d with SMTP id a640c23a62f3a-b07c3475927mr787189666b.1.1757822407322;
        Sat, 13 Sep 2025 21:00:07 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b32ef574sm682456966b.73.2025.09.13.21.00.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 21:00:06 -0700 (PDT)
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
Subject: [PATCH RESEND 54/62] init: arm, x86: deal with some references to initrd
Date: Sun, 14 Sep 2025 07:00:01 +0300
Message-ID: <20250914040002.3779907-1-safinaskar@gmail.com>
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

...in comments and printk

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 arch/arm/mm/init.c      |  2 +-
 arch/x86/kernel/setup.c | 10 +++++-----
 arch/x86/mm/init.c      |  2 +-
 init/initramfs.c        | 18 +++++++++---------
 init/main.c             | 12 ++++++------
 5 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
index ae5921db626e..04ba9b385e24 100644
--- a/arch/arm/mm/init.c
+++ b/arch/arm/mm/init.c
@@ -445,7 +445,7 @@ void free_initramfs_mem(unsigned long start, unsigned long end)
 		end = round_up(end, PAGE_SIZE);
 
 	poison_init_mem((void *)start, PAGE_ALIGN(end) - start);
-	free_reserved_area((void *)start, (void *)end, -1, "initrd");
+	free_reserved_area((void *)start, (void *)end, -1, "initramfs");
 }
 #endif
 
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 3b88d156ed39..65670e0f59c0 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -325,19 +325,19 @@ static void __init relocate_initrd(void)
 	u64 relocated_ramdisk = memblock_phys_alloc_range(area_size, PAGE_SIZE, 0,
 						      PFN_PHYS(max_pfn_mapped));
 	if (!relocated_ramdisk)
-		panic("Cannot find place for new RAMDISK of size %lld\n",
+		panic("Cannot find place for new INITRAMFS of size %lld\n",
 		      ramdisk_size);
 
 	virt_external_initramfs_start = relocated_ramdisk + PAGE_OFFSET;
 	virt_external_initramfs_end   = virt_external_initramfs_start + ramdisk_size;
-	printk(KERN_INFO "Allocated new RAMDISK: [mem %#010llx-%#010llx]\n",
+	printk(KERN_INFO "Allocated new INITRAMFS: [mem %#010llx-%#010llx]\n",
 	       relocated_ramdisk, relocated_ramdisk + ramdisk_size - 1);
 
 	ret = copy_from_early_mem((void *)virt_external_initramfs_start, ramdisk_image, ramdisk_size);
 	if (ret)
-		panic("Copy RAMDISK failed\n");
+		panic("Copy INITRAMFS failed\n");
 
-	printk(KERN_INFO "Move RAMDISK from [mem %#010llx-%#010llx] to"
+	printk(KERN_INFO "Move INITRAMFS from [mem %#010llx-%#010llx] to"
 		" [mem %#010llx-%#010llx]\n",
 		ramdisk_image, ramdisk_image + ramdisk_size - 1,
 		relocated_ramdisk, relocated_ramdisk + ramdisk_size - 1);
@@ -370,7 +370,7 @@ static void __init reserve_initrd(void)
 
 	virt_external_initramfs_start = 0;
 
-	printk(KERN_INFO "RAMDISK: [mem %#010llx-%#010llx]\n", ramdisk_image,
+	printk(KERN_INFO "INITRAMFS: [mem %#010llx-%#010llx]\n", ramdisk_image,
 			ramdisk_end - 1);
 
 	if (pfn_range_is_mapped(PFN_DOWN(ramdisk_image),
diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index b7c45004f999..51b632f7fd21 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -992,7 +992,7 @@ void __init free_initramfs_mem(unsigned long start, unsigned long end)
 	 *   - relocate_initrd()
 	 * So here We can do PAGE_ALIGN() safely to get partial page to be freed
 	 */
-	free_init_pages("initrd", start, PAGE_ALIGN(end));
+	free_init_pages("initramfs", start, PAGE_ALIGN(end));
 }
 #endif
 
diff --git a/init/initramfs.c b/init/initramfs.c
index d52314b17c25..348cfcc4c95e 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -643,7 +643,7 @@ void __init reserve_initramfs_mem(void)
 		return;
 	/*
 	 * Round the memory region to page boundaries as per free_initramfs_mem()
-	 * This allows us to detect whether the pages overlapping the initrd
+	 * This allows us to detect whether the pages overlapping the initramfs
 	 * are in use, but more importantly, reserves the entire set of pages
 	 * as we don't want these pages allocated for other purposes.
 	 */
@@ -652,26 +652,26 @@ void __init reserve_initramfs_mem(void)
 	size = round_up(size, PAGE_SIZE);
 
 	if (!memblock_is_region_memory(start, size)) {
-		pr_err("INITRD: 0x%08llx+0x%08lx is not a memory region",
+		pr_err("INITRAMFS: 0x%08llx+0x%08lx is not a memory region",
 		       (u64)start, size);
 		goto disable;
 	}
 
 	if (memblock_is_region_reserved(start, size)) {
-		pr_err("INITRD: 0x%08llx+0x%08lx overlaps in-use memory region\n",
+		pr_err("INITRAMFS: 0x%08llx+0x%08lx overlaps in-use memory region\n",
 		       (u64)start, size);
 		goto disable;
 	}
 
 	memblock_reserve(start, size);
-	/* Now convert initrd to virtual addresses */
+	/* Now convert initramfs to virtual addresses */
 	virt_external_initramfs_start = (unsigned long)__va(phys_external_initramfs_start);
 	virt_external_initramfs_end = virt_external_initramfs_start + phys_external_initramfs_size;
 	initramfs_below_start_ok = 1;
 
 	return;
 disable:
-	pr_cont(" - disabling initrd\n");
+	pr_cont(" - disabling initramfs\n");
 	virt_external_initramfs_start = 0;
 	virt_external_initramfs_end = 0;
 }
@@ -686,7 +686,7 @@ void __weak __init free_initramfs_mem(unsigned long start, unsigned long end)
 #endif
 
 	free_reserved_area((void *)start, (void *)end, POISON_FREE_INITMEM,
-			"initrd");
+			"initramfs");
 }
 
 #ifdef CONFIG_CRASH_RESERVE
@@ -696,14 +696,14 @@ static bool __init kexec_free_initramfs(void)
 	unsigned long crashk_end   = (unsigned long)__va(crashk_res.end);
 
 	/*
-	 * If the initrd region is overlapped with crashkernel reserved region,
+	 * If the initramfs region is overlapped with crashkernel reserved region,
 	 * free only memory that is not part of crashkernel region.
 	 */
 	if (virt_external_initramfs_start >= crashk_end || virt_external_initramfs_end <= crashk_start)
 		return false;
 
 	/*
-	 * Initialize initrd memory region since the kexec boot does not do.
+	 * Initialize initramfs memory region since the kexec boot does not do.
 	 */
 	memset((void *)virt_external_initramfs_start, 0, virt_external_initramfs_end - virt_external_initramfs_start);
 	if (virt_external_initramfs_start < crashk_start)
@@ -740,7 +740,7 @@ static void __init do_populate_rootfs(void *unused, async_cookie_t cookie)
 	security_initramfs_populated();
 
 	/*
-	 * If the initrd region is overlapped with crashkernel reserved region,
+	 * If the initramfs region is overlapped with crashkernel reserved region,
 	 * free only memory that is not part of crashkernel region.
 	 */
 	if (!retain_initramfs && virt_external_initramfs_start && !kexec_free_initramfs()) {
diff --git a/init/main.c b/init/main.c
index c535e0613df8..4212efb33e77 100644
--- a/init/main.c
+++ b/init/main.c
@@ -276,7 +276,7 @@ static void * __init get_boot_config_from_initramfs(size_t *_size)
 
 	data = (char *)virt_external_initramfs_end - BOOTCONFIG_MAGIC_LEN;
 	/*
-	 * Since Grub may align the size of initrd to 4, we must
+	 * Since Grub may align the size of initramfs to 4, we must
 	 * check the preceding 3 bytes as well.
 	 */
 	for (i = 0; i < 4; i++) {
@@ -293,7 +293,7 @@ static void * __init get_boot_config_from_initramfs(size_t *_size)
 
 	data = ((void *)hdr) - size;
 	if ((unsigned long)data < virt_external_initramfs_start) {
-		pr_err("bootconfig size %d is greater than initrd size %ld\n",
+		pr_err("bootconfig size %d is greater than initramfs size %ld\n",
 			size, virt_external_initramfs_end - virt_external_initramfs_start);
 		return NULL;
 	}
@@ -303,7 +303,7 @@ static void * __init get_boot_config_from_initramfs(size_t *_size)
 		return NULL;
 	}
 
-	/* Remove bootconfig from initramfs/initrd */
+	/* Remove bootconfig from initramfs */
 	virt_external_initramfs_end = (unsigned long)data;
 	if (_size)
 		*_size = size;
@@ -421,7 +421,7 @@ static void __init setup_boot_config(void)
 
 	/* Cut out the bootconfig data even if we have no bootconfig option */
 	data = get_boot_config_from_initramfs(&size);
-	/* If there is no bootconfig in initrd, try embedded one. */
+	/* If there is no bootconfig in initramfs, try embedded one. */
 	if (!data)
 		data = xbc_get_embedded_bootconfig(&size);
 
@@ -478,7 +478,7 @@ static void __init exit_boot_config(void)
 
 static void __init setup_boot_config(void)
 {
-	/* Remove bootconfig data from initrd */
+	/* Remove bootconfig data from initramfs */
 	get_boot_config_from_initramfs(NULL);
 }
 
@@ -1049,7 +1049,7 @@ void start_kernel(void)
 #ifdef CONFIG_BLK_DEV_INITRD
 	if (virt_external_initramfs_start && !initramfs_below_start_ok &&
 	    page_to_pfn(virt_to_page((void *)virt_external_initramfs_start)) < min_low_pfn) {
-		pr_crit("initrd overwritten (0x%08lx < 0x%08lx) - disabling it.\n",
+		pr_crit("initramfs overwritten (0x%08lx < 0x%08lx) - disabling it.\n",
 		    page_to_pfn(virt_to_page((void *)virt_external_initramfs_start)),
 		    min_low_pfn);
 		virt_external_initramfs_start = 0;
-- 
2.47.2


