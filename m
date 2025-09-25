Return-Path: <linuxppc-dev+bounces-12577-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CFCB9F741
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Sep 2025 15:12:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cXYzT6pDlz2ytg;
	Thu, 25 Sep 2025 23:12:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::432"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758805957;
	cv=none; b=dWkr62bOIdAF+KMbf/5cpeOjXuZQ6ro8DmfC7Qos1fBHYTEIXGqFkPze2QnWi6SHucdD0n6Hzckoei69TTV5z21XaBZJ4dLSKhRZbzmHCOXeQiH7bCyiKjHc5l2OmBJ6yJmQ8srSclD8poYd6Vu2bl1nLybmWZSfkU+BEPSk1lFMt4cBiX7NoeleKIrsFZ2Mtno/WHVSGMAkJNui1K2tExz5RWfeY4SyoRJI9SGYgg2SSQU4NPB2f0VU6/5IqOlTEl6kdUZPGbElz9d5DVVDC40Sf+34v2p4n6k6qRG7NqmUmvjxjB09sc+9COEKawyCWkUjLytEwd4v7+fGLsUmPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758805957; c=relaxed/relaxed;
	bh=NfJVwYFcsQ06QJkEnurciWiF3KgCM9rgqn4VVbABEtQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JA4vsTGAhEIIPJ3u4qXE7XrzMZ6yonpeOOzXjGhl8z7R2Tx7Lsa7omYsxux0QKHh7cs9il+D0enUd6LEe0nvJV62x+jWKZQwZAwNlEXMeezqM3WKVB2mKEV36pLbHMdPLOjTy3prAqRxrcWjr5aFy+kuJbcHPdt3fZ+LVt0twAcOUpX6oJtAazgGdkrZc8EIqMswfiQb+ebtLDJQA3+Xc8a5CtT8nfJMS9Vb3FKWZ9UfiuMCbysKps+TmaWcQjSnq0Uixcj4igZwbn1Rnrs7fWNd+gnQtVUtFuAxYNNrV72MyNpDdOW4BNEsbhGTCcaUUaJh0rCahuoPexSbNfuRpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=freebox.fr; dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=XXldpj3M; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=nschichan@freebox.fr; receiver=lists.ozlabs.org) smtp.mailfrom=freebox.fr
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=XXldpj3M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=freebox.fr (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=nschichan@freebox.fr; receiver=lists.ozlabs.org)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cXYzQ6q3Jz2yrP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Sep 2025 23:12:33 +1000 (AEST)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3ecde0be34eso1232682f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Sep 2025 06:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1758805948; x=1759410748; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NfJVwYFcsQ06QJkEnurciWiF3KgCM9rgqn4VVbABEtQ=;
        b=XXldpj3M52VegpQNAmJc9N1HhwVSqdav4ITwoW7JBS8Odlpr7ongkEVRCWyXv4Peap
         w+35O24KxR8U+X6Cw1p0FnyAJnLVajeeaKfPz6GJQprSIOreL4oVOdMM+aa1xpd15aCo
         i159ijp4/qCwkpqo3s11u07OxMlGLPSLKwy869bLb+DtQPM6WcR+Y2ICfv/kUgN+AoSt
         TY1Z5ODByPo22Iyh7XpNkL7qbGDXD9Lc0HtBiBnPo3YhCqs/kKOU/NBlsMOr/3lR+5qE
         HgmHNVkFFCCQTRToyETeE6BYJIFHcn2ZwcNl/tsNRgmI7FEf2zhsf0iNiUCN4G4T5dis
         eqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758805948; x=1759410748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NfJVwYFcsQ06QJkEnurciWiF3KgCM9rgqn4VVbABEtQ=;
        b=CRvCcIIrtwNQ1sKYiD4HhuXx/dAxVaZtqyLDRvRvHPB7WhNj6ZXv3o+G98OuXEBK+/
         ltukINMN+MyYnQeR7mEq0F1uKY2btkie28pfRCcX1HhAnB350rT3zzk92GHeRJzRuJ78
         MnJGrD5J7IJ+xKqlDJ9TpQf+1CrsBlgeEWl31PLb9LpdOQxatWkZfRq4DAI2Uh3j5dtO
         cqMQHGFQR15OpDeFLUDruKhwis51IbreUMyP9aHuSJlxN5b1y/NceA/q6WFawwDXsKo7
         l2bk860D99I838H8koFQ9h7wc5BzSL99Pn49TwPHfO1aOLE+2yUTKTRNvbtB3U3bR0ZQ
         H+vw==
X-Forwarded-Encrypted: i=1; AJvYcCUMNC61epSLeYQcOnf1hYlWPcdyZ4o2l1mgqSIAohZLJ1/4AybMcNQ0a2nHTnSn5It/F2jJjejGJySmik0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YybDP/S66D31bFfBzg+TQNl5ARaW2i6XpFK4NsMm+3Koem0thNj
	qq5bBB+E2Q5vdr2zgFDV5Xe5mhJSMFAFyJ3E0pqflxkOAikhbkh3yfF87L9sSJrek0A=
X-Gm-Gg: ASbGncsTzYl5zPF4VtXoNWO/TFlYus9xYJ/N3U1zHCWgs6DdXXs1mblAtvSJcrK0EtT
	ixL3jItN+s+SMQdyZ+19gqT4h/OjTwKjw/+VtbEB9/akY5/osrdham/XGQ7Nabj8wKxfl6d2XOV
	M2wjqAn7Cw2r5HOGN176ztUfv346t3NOnuZTc53MMGnvEjM9GUHiNi+/GyRn2EsSuFU9hmXVy84
	tmzszCe2r/1UeOOYkM9vYfdE2CDgyTcpjhZSjrSsC4ajEUwTjjGYeMFHCgTeEBkWv3LAouC46c4
	KKOervh9Jsqw2d4NM5sANFuOMgxj4OSDOn8x329om2Mcx6j0usLSA+nBijVMAdTzswiNJkjYxq3
	IoLEkUVjH+v6Uvss7VcrSNjoCdNkngYnDGbrpwjej9nYRqAl6cg==
X-Google-Smtp-Source: AGHT+IGfEDsgYy1Y3V7mn/9vw12xwbotyOf9S0qvgxiLF/dTs1GE6jSNXI03j1w/2hgZi5tVGzAx+Q==
X-Received: by 2002:a05:6000:290e:b0:3fc:cbfc:fbee with SMTP id ffacd0b85a97d-40f65bbb807mr2115268f8f.19.1758805948078;
        Thu, 25 Sep 2025 06:12:28 -0700 (PDT)
Received: from daria.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e33bef4b4sm32929635e9.20.2025.09.25.06.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 06:12:27 -0700 (PDT)
From: nschichan@freebox.fr
To: nschichan@freebox.fr
Cc: akpm@linux-foundation.org,
	andy.shevchenko@gmail.com,
	axboe@kernel.dk,
	brauner@kernel.org,
	cyphar@cyphar.com,
	devicetree@vger.kernel.org,
	ecurtin@redhat.com,
	email2tema@gmail.com,
	graf@amazon.com,
	gregkh@linuxfoundation.org,
	hca@linux.ibm.com,
	hch@lst.de,
	hsiangkao@linux.alibaba.com,
	initramfs@vger.kernel.org,
	jack@suse.cz,
	julian.stecklina@cyberus-technology.de,
	kees@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	mcgrof@kernel.org,
	mingo@redhat.com,
	monstr@monstr.eu,
	mzxreary@0pointer.de,
	patches@lists.linux.dev,
	rob@landley.net,
	safinaskar@gmail.com,
	sparclinux@vger.kernel.org,
	thomas.weissschuh@linutronix.de,
	thorsten.blum@linux.dev,
	torvalds@linux-foundation.org,
	tytso@mit.edu,
	viro@zeniv.linux.org.uk,
	x86@kernel.org
Subject: [PATCH-RFC] init: simplify initrd code (was Re: [PATCH RESEND 00/62] initrd: remove classic initrd support).
Date: Thu, 25 Sep 2025 15:10:56 +0200
Message-Id: <20250925131055.3933381-1-nschichan@freebox.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAHNNwZC7gC7zaZGiSBhobSAb4m2O1BuoZ4r=SQBF-tCQyuAPvw@mail.gmail.com>
References: <CAHNNwZC7gC7zaZGiSBhobSAb4m2O1BuoZ4r=SQBF-tCQyuAPvw@mail.gmail.com>
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
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Nicolas Schichan <nschichan@freebox.fr>

- drop prompt_ramdisk and ramdisk_start kernel parameters
- drop compression support
- drop image autodetection, the whole /initrd.image content is now
  copied into /dev/ram0
- remove rd_load_disk() which doesn't seem to be used anywhere.

There is now no more limitation on the type of initrd filesystem that
can be loaded since the code trying to guess the initrd filesystem
size is gone (the whole /initrd.image file is used).

A few global variables in do_mounts_rd.c are now put as local
variables in rd_load_image() since they do not need to be visible
outside this function.
---

Hello,

Hopefully my email config is now better and reaches gmail users
correctly.

The patch below could probably split in a few patches, but I think
this simplify the code greatly without removing the functionality we
depend on (and this allows now to use EROFS initrd images).

Coupled with keeping the function populate_initrd_image() in
init/initramfs.c, this will keep what we need from the initrd code.

This removes support of loading bzip/gz/xz/... compressed images as
well, not sure if many user depend on this feature anymore.

No signoff because I'm only seeking comments about those changes right
now.

 init/do_mounts.h    |   2 -
 init/do_mounts_rd.c | 243 +-------------------------------------------
 2 files changed, 4 insertions(+), 241 deletions(-)

diff --git a/init/do_mounts.h b/init/do_mounts.h
index 6069ea3eb80d..c0028ee3cff6 100644
--- a/init/do_mounts.h
+++ b/init/do_mounts.h
@@ -24,12 +24,10 @@ static inline __init int create_dev(char *name, dev_t dev)
 
 #ifdef CONFIG_BLK_DEV_RAM
 
-int __init rd_load_disk(int n);
 int __init rd_load_image(char *from);
 
 #else
 
-static inline int rd_load_disk(int n) { return 0; }
 static inline int rd_load_image(char *from) { return 0; }
 
 #endif
diff --git a/init/do_mounts_rd.c b/init/do_mounts_rd.c
index ac021ae6e6fa..5a69ff43f5ee 100644
--- a/init/do_mounts_rd.c
+++ b/init/do_mounts_rd.c
@@ -14,173 +14,9 @@
 
 #include <linux/decompress/generic.h>
 
-static struct file *in_file, *out_file;
-static loff_t in_pos, out_pos;
-
-static int __init prompt_ramdisk(char *str)
-{
-	pr_warn("ignoring the deprecated prompt_ramdisk= option\n");
-	return 1;
-}
-__setup("prompt_ramdisk=", prompt_ramdisk);
-
-int __initdata rd_image_start;		/* starting block # of image */
-
-static int __init ramdisk_start_setup(char *str)
-{
-	rd_image_start = simple_strtol(str,NULL,0);
-	return 1;
-}
-__setup("ramdisk_start=", ramdisk_start_setup);
-
-static int __init crd_load(decompress_fn deco);
-
-/*
- * This routine tries to find a RAM disk image to load, and returns the
- * number of blocks to read for a non-compressed image, 0 if the image
- * is a compressed image, and -1 if an image with the right magic
- * numbers could not be found.
- *
- * We currently check for the following magic numbers:
- *	minix
- *	ext2
- *	romfs
- *	cramfs
- *	squashfs
- *	gzip
- *	bzip2
- *	lzma
- *	xz
- *	lzo
- *	lz4
- */
-static int __init
-identify_ramdisk_image(struct file *file, loff_t pos,
-		decompress_fn *decompressor)
-{
-	const int size = 512;
-	struct minix_super_block *minixsb;
-	struct romfs_super_block *romfsb;
-	struct cramfs_super *cramfsb;
-	struct squashfs_super_block *squashfsb;
-	int nblocks = -1;
-	unsigned char *buf;
-	const char *compress_name;
-	unsigned long n;
-	int start_block = rd_image_start;
-
-	buf = kmalloc(size, GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
-
-	minixsb = (struct minix_super_block *) buf;
-	romfsb = (struct romfs_super_block *) buf;
-	cramfsb = (struct cramfs_super *) buf;
-	squashfsb = (struct squashfs_super_block *) buf;
-	memset(buf, 0xe5, size);
-
-	/*
-	 * Read block 0 to test for compressed kernel
-	 */
-	pos = start_block * BLOCK_SIZE;
-	kernel_read(file, buf, size, &pos);
-
-	*decompressor = decompress_method(buf, size, &compress_name);
-	if (compress_name) {
-		printk(KERN_NOTICE "RAMDISK: %s image found at block %d\n",
-		       compress_name, start_block);
-		if (!*decompressor)
-			printk(KERN_EMERG
-			       "RAMDISK: %s decompressor not configured!\n",
-			       compress_name);
-		nblocks = 0;
-		goto done;
-	}
-
-	/* romfs is at block zero too */
-	if (romfsb->word0 == ROMSB_WORD0 &&
-	    romfsb->word1 == ROMSB_WORD1) {
-		printk(KERN_NOTICE
-		       "RAMDISK: romfs filesystem found at block %d\n",
-		       start_block);
-		nblocks = (ntohl(romfsb->size)+BLOCK_SIZE-1)>>BLOCK_SIZE_BITS;
-		goto done;
-	}
-
-	if (cramfsb->magic == CRAMFS_MAGIC) {
-		printk(KERN_NOTICE
-		       "RAMDISK: cramfs filesystem found at block %d\n",
-		       start_block);
-		nblocks = (cramfsb->size + BLOCK_SIZE - 1) >> BLOCK_SIZE_BITS;
-		goto done;
-	}
-
-	/* squashfs is at block zero too */
-	if (le32_to_cpu(squashfsb->s_magic) == SQUASHFS_MAGIC) {
-		printk(KERN_NOTICE
-		       "RAMDISK: squashfs filesystem found at block %d\n",
-		       start_block);
-		nblocks = (le64_to_cpu(squashfsb->bytes_used) + BLOCK_SIZE - 1)
-			 >> BLOCK_SIZE_BITS;
-		goto done;
-	}
-
-	/*
-	 * Read 512 bytes further to check if cramfs is padded
-	 */
-	pos = start_block * BLOCK_SIZE + 0x200;
-	kernel_read(file, buf, size, &pos);
-
-	if (cramfsb->magic == CRAMFS_MAGIC) {
-		printk(KERN_NOTICE
-		       "RAMDISK: cramfs filesystem found at block %d\n",
-		       start_block);
-		nblocks = (cramfsb->size + BLOCK_SIZE - 1) >> BLOCK_SIZE_BITS;
-		goto done;
-	}
-
-	/*
-	 * Read block 1 to test for minix and ext2 superblock
-	 */
-	pos = (start_block + 1) * BLOCK_SIZE;
-	kernel_read(file, buf, size, &pos);
-
-	/* Try minix */
-	if (minixsb->s_magic == MINIX_SUPER_MAGIC ||
-	    minixsb->s_magic == MINIX_SUPER_MAGIC2) {
-		printk(KERN_NOTICE
-		       "RAMDISK: Minix filesystem found at block %d\n",
-		       start_block);
-		nblocks = minixsb->s_nzones << minixsb->s_log_zone_size;
-		goto done;
-	}
-
-	/* Try ext2 */
-	n = ext2_image_size(buf);
-	if (n) {
-		printk(KERN_NOTICE
-		       "RAMDISK: ext2 filesystem found at block %d\n",
-		       start_block);
-		nblocks = n;
-		goto done;
-	}
-
-	printk(KERN_NOTICE
-	       "RAMDISK: Couldn't find valid RAM disk image starting at %d.\n",
-	       start_block);
-
-done:
-	kfree(buf);
-	return nblocks;
-}
-
 static unsigned long nr_blocks(struct file *file)
 {
-	struct inode *inode = file->f_mapping->host;
-
-	if (!S_ISBLK(inode->i_mode))
-		return 0;
-	return i_size_read(inode) >> 10;
+	return i_size_read(file->f_mapping->host) >> 10;
 }
 
 int __init rd_load_image(char *from)
@@ -190,10 +26,11 @@ int __init rd_load_image(char *from)
 	int nblocks, i;
 	char *buf = NULL;
 	unsigned short rotate = 0;
-	decompress_fn decompressor = NULL;
 #if !defined(CONFIG_S390)
 	char rotator[4] = { '|' , '/' , '-' , '\\' };
 #endif
+	struct file *in_file, *out_file;
+	loff_t in_pos = 0, out_pos = 0;
 
 	out_file = filp_open("/dev/ram", O_RDWR, 0);
 	if (IS_ERR(out_file))
@@ -203,17 +40,6 @@ int __init rd_load_image(char *from)
 	if (IS_ERR(in_file))
 		goto noclose_input;
 
-	in_pos = rd_image_start * BLOCK_SIZE;
-	nblocks = identify_ramdisk_image(in_file, in_pos, &decompressor);
-	if (nblocks < 0)
-		goto done;
-
-	if (nblocks == 0) {
-		if (crd_load(decompressor) == 0)
-			goto successful_load;
-		goto done;
-	}
-
 	/*
 	 * NOTE NOTE: nblocks is not actually blocks but
 	 * the number of kibibytes of data to load into a ramdisk.
@@ -228,10 +54,7 @@ int __init rd_load_image(char *from)
 	/*
 	 * OK, time to copy in the data
 	 */
-	if (strcmp(from, "/initrd.image") == 0)
-		devblocks = nblocks;
-	else
-		devblocks = nr_blocks(in_file);
+	nblocks = devblocks = nr_blocks(in_file);
 
 	if (devblocks == 0) {
 		printk(KERN_ERR "RAMDISK: could not determine device size\n");
@@ -264,7 +87,6 @@ int __init rd_load_image(char *from)
 	}
 	pr_cont("done.\n");
 
-successful_load:
 	res = 1;
 done:
 	fput(in_file);
@@ -275,60 +97,3 @@ int __init rd_load_image(char *from)
 	init_unlink("/dev/ram");
 	return res;
 }
-
-int __init rd_load_disk(int n)
-{
-	create_dev("/dev/root", ROOT_DEV);
-	create_dev("/dev/ram", MKDEV(RAMDISK_MAJOR, n));
-	return rd_load_image("/dev/root");
-}
-
-static int exit_code;
-static int decompress_error;
-
-static long __init compr_fill(void *buf, unsigned long len)
-{
-	long r = kernel_read(in_file, buf, len, &in_pos);
-	if (r < 0)
-		printk(KERN_ERR "RAMDISK: error while reading compressed data");
-	else if (r == 0)
-		printk(KERN_ERR "RAMDISK: EOF while reading compressed data");
-	return r;
-}
-
-static long __init compr_flush(void *window, unsigned long outcnt)
-{
-	long written = kernel_write(out_file, window, outcnt, &out_pos);
-	if (written != outcnt) {
-		if (decompress_error == 0)
-			printk(KERN_ERR
-			       "RAMDISK: incomplete write (%ld != %ld)\n",
-			       written, outcnt);
-		decompress_error = 1;
-		return -1;
-	}
-	return outcnt;
-}
-
-static void __init error(char *x)
-{
-	printk(KERN_ERR "%s\n", x);
-	exit_code = 1;
-	decompress_error = 1;
-}
-
-static int __init crd_load(decompress_fn deco)
-{
-	int result;
-
-	if (!deco) {
-		pr_emerg("Invalid ramdisk decompression routine.  "
-			 "Select appropriate config option.\n");
-		panic("Could not decompress initial ramdisk image.");
-	}
-
-	result = deco(NULL, 0, compr_fill, compr_flush, NULL, NULL, error);
-	if (decompress_error)
-		result = 1;
-	return result;
-}
-- 
2.34.1


