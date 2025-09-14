Return-Path: <linuxppc-dev+bounces-12167-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9982B566DD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Sep 2025 06:41:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cPb8R4NYcz3cgy;
	Sun, 14 Sep 2025 14:41:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757822123;
	cv=none; b=CqiWoiLU0Q3CRaeD/BTCpVy4Y74kF9/era1pBRsodvzLnhePzYlmyaUDGYtiAoyGlDDgIIzwzPpA9iEMBtOlI2QRB+KksynP8eIOVeg0ZFnshPAmkDLssKcklF+FuYdlAZWDuLL1ypQi/sX0UtisXA/k06oN4BdYXCveAz1oXapix2HP5lUN6x4gE59XrzrqMUVmtNkfFyn6HEm8WX4/pxNinMEQEYE2OFIxYwZa0t83357PQ/zvb3psIvUMqIjpFpFNnfJmlQ5/NTSDTZnu2zug23nfIrM+Y1/0pI8FPBnZ5gEMOo4c33FlxlC6+KNOgUxCyxp72Pc8Ja+99hOWPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757822123; c=relaxed/relaxed;
	bh=wOmwD5NF6m1DAFdekL887975d4wKOOnVQzHmGUBheo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fGOJcwmh0voTFjoqxQd0ESSXd1DRClz527DeEoXKxtUi5SL0EPiUpYZwjobdOtoPd2IOP0XOaDo3nP2qMzdCGgnyZtymWPiwPt3/VffOzCHg/cczTGbNepvJiTd77YZenQz9JfkXv25Na+xW5L1sL/nnz+bDBK3uST1QeqaQVRcdcc2WQ1ctFWpc3Eol7VRtNecAznOXmNB2VyQEGFiGP1kyJQ9hm7r/PYY8UphE1+V1fdyFGqpf38R/CrM/D4xobn9zE7np39a5BKHNcOQU2zGOdWTc+luJVufz+uC7tu7mYFfi5IINtCQ/f9KMl+9bG5+bQ39kz7kwPcV7viXoMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=COvUC2hM; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=COvUC2hM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cPZ7Z6Jm9z2yrg
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Sep 2025 13:55:22 +1000 (AEST)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-62f2b27a751so347633a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 20:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822120; x=1758426920; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wOmwD5NF6m1DAFdekL887975d4wKOOnVQzHmGUBheo0=;
        b=COvUC2hM7VfyHbKu3OCBettMBmuZNp6owUB39JQHGzfTHCjf2fK9luXitt/OHfoWOk
         y8XyBaxOgBWjmoVM4N37Mj5Cd3bA/bB+ce8D47N14QSHlP9xNfvPWV8JUYmfADj6w/pc
         vJxgoev+eV9QtQGI6tcNeCY8KGAAoJNdxQfGe+DkA9wIDNOiIoBr6Go36sgYdfgG/pPB
         4zMJ9x/nw63MVoprQMK06m8WKPjqGWg97MH28f25oDFY32pwsaNTfTk5/0xSHCE2/YpH
         wg3XRzbDwy6fF7SgFJdY87ntBk0r5gFvL7wV7Px8gRJt2Tm/Ht4MQQy+bsNvEkj9zxeE
         uNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822120; x=1758426920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wOmwD5NF6m1DAFdekL887975d4wKOOnVQzHmGUBheo0=;
        b=W9ho1HEHPsQRe6In0JMdKaPgPn564k2lad2kcWh320042c2dIPxmEvL1okOCnmL0IJ
         kSyW8hqVVCSoKM+R8IRvvvJmxY4DCiMIQun853hlHhdI99rnE4Lc0vGBbUaPm73yyxWq
         beavy4+hOrInt0B5weAXh/vwZ5UegcpmI5LX3Egisr6zWtVnxbarT2xqVs1ATAEj9Inp
         JDsCo0oNmLDfztQ4RBgTeWVuzibGmeeTCJbKEHAYrn+rSj2mPCIRq6n/9H+F3+b8JAG5
         YrukErrAM3TzwSJZHMTLECNRXGaGdrIQvWp5a8MuIokX25T8JFEow4lDt8NS6y8kf6l1
         iB4A==
X-Forwarded-Encrypted: i=1; AJvYcCXVfqedxOmUx4k1jrIOHWY/rviZsCHqzd+r6hXvIT1+lZwRnrxtVgY/66BP8xkwIjBT7kVu35/fwHNhUkw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YySuhm8dFv3vobr9sffVDqBBLcctUMBnP6smc0sN9oI5fCnRtgc
	Dt6F/E27TzCQJ48o+c143uMeM71MnUL7oOZbAHhZCiatvy9+Par3c1Vl
X-Gm-Gg: ASbGncuPJzZLR7AqAblupM1lq+ahvpdpGeb+8OpdhLLR6Td97nkmLKQ7fzSFLD9EkqF
	x7r50WrrCSuF6ltF69Frm4ppmgAp1cCf4kkJpxchSLsH1HaA+uHAWNgxtQNrC7a3dEgjz1a2Qmg
	TzBCHe+8dy/AMtGfqiB2RpnB/l9CCDWIgTq0K72ggHUHVRCv9sb+pszL2OTb5soCY+mH5DgFxuZ
	PH5EXy2hGNcInobpQ5jB0bKw4A3gsyIELk1dPMLvtpcnSFhl5xl4jug2WO1rQ/9EQhy/2hL1qWS
	c52eOJ6T+LjxmijSZhkFLqZGPXO+R9lqNxIA28Df1vi4sC9Mu9ygV+5rIx9j+VDLSE0BxP6SplI
	kP5lux64ar/QsTe6z6Uw=
X-Google-Smtp-Source: AGHT+IFVXahsOiekrkN9a/Uz4eTnqleIeXBA7XQN4UsGQJ/USlX1vtxhVK0N6asLg1FonCbVUR1qZQ==
X-Received: by 2002:a05:6402:44d2:b0:61b:ff85:398b with SMTP id 4fb4d7f45d1cf-62ed80ee786mr6900890a12.14.1757822119812;
        Sat, 13 Sep 2025 20:55:19 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62ec2e661a5sm6313404a12.0.2025.09.13.20.55.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:55:18 -0700 (PDT)
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
Subject: [PATCH RESEND 46/62] init: edit docs for initramfs-related configs
Date: Sun, 14 Sep 2025 06:55:13 +0300
Message-ID: <20250914035513.3694090-1-safinaskar@gmail.com>
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

This is cleanup after initrd removal

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 drivers/block/Kconfig |  7 ++-----
 init/Kconfig          | 18 +++++++-----------
 usr/Kconfig           | 42 +++++++++++++++++++++---------------------
 3 files changed, 30 insertions(+), 37 deletions(-)

diff --git a/drivers/block/Kconfig b/drivers/block/Kconfig
index 8cf06e40f61c..a268ac3dd304 100644
--- a/drivers/block/Kconfig
+++ b/drivers/block/Kconfig
@@ -225,9 +225,7 @@ config BLK_DEV_RAM
 	  Saying Y here will allow you to use a portion of your RAM memory as
 	  a block device, so that you can make file systems on it, read and
 	  write to it and do all the other things that you can do with normal
-	  block devices (such as hard drives). It is usually used to load and
-	  store a copy of a minimal root file system off of a floppy into RAM
-	  during the initial install of Linux.
+	  block devices (such as hard drives).
 
 	  For details, read <file:Documentation/admin-guide/blockdev/ramdisk.rst>.
 
@@ -244,8 +242,7 @@ config BLK_DEV_RAM_COUNT
 	depends on BLK_DEV_RAM
 	help
 	  The default value is 16 RAM disks. Change this if you know what you
-	  are doing. If you boot from a filesystem that needs to be extracted
-	  in memory, you will need at least one RAM disk (e.g. root on cramfs).
+	  are doing.
 
 config BLK_DEV_RAM_SIZE
 	int "Default RAM disk size (kbytes)"
diff --git a/init/Kconfig b/init/Kconfig
index 0263c08960bc..1c371dca7fd4 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1435,18 +1435,14 @@ config RELAY
 	  If unsure, say N.
 
 config BLK_DEV_INITRD
-	bool "Initial RAM filesystem and RAM disk (initramfs/initrd) support"
+	bool "Initial RAM filesystem (initramfs) support"
 	help
-	  The initial RAM filesystem is a ramfs which is loaded by the
-	  boot loader (loadlin or lilo) and that is mounted as root
+	  The initial RAM filesystem is a ramfs or tmpfs which is loaded by the
+	  boot loader and that is mounted as root
 	  before the normal boot procedure. It is typically used to
 	  load modules needed to mount the "real" root file system,
 	  etc. See <file:Documentation/filesystems/ramfs-rootfs-initramfs.rst> for details.
 
-	  If RAM disk support (BLK_DEV_RAM) is also included, this
-	  also enables initial RAM disk (initrd) support and adds
-	  15 Kbytes (more on some other architectures) to the kernel size.
-
 	  If unsure say Y.
 
 if BLK_DEV_INITRD
@@ -1485,8 +1481,8 @@ config BOOT_CONFIG_EMBED
 	depends on BOOT_CONFIG
 	help
 	  Embed a bootconfig file given by BOOT_CONFIG_EMBED_FILE in the
-	  kernel. Usually, the bootconfig file is loaded with the initrd
-	  image. But if the system doesn't support initrd, this option will
+	  kernel. Usually, the bootconfig file is loaded with the initramfs.
+	  But if the system doesn't support initramfs, this option will
 	  help you by embedding a bootconfig file while building the kernel.
 
 	  If unsure, say N.
@@ -1496,8 +1492,8 @@ config BOOT_CONFIG_EMBED_FILE
 	depends on BOOT_CONFIG_EMBED
 	help
 	  Specify a bootconfig file which will be embedded to the kernel.
-	  This bootconfig will be used if there is no initrd or no other
-	  bootconfig in the initrd.
+	  This bootconfig will be used if there is no initramfs or no other
+	  bootconfig in the initramfs.
 
 config INITRAMFS_PRESERVE_MTIME
 	bool "Preserve cpio archive mtimes in initramfs"
diff --git a/usr/Kconfig b/usr/Kconfig
index 9279a2893ab0..8899353bd7d5 100644
--- a/usr/Kconfig
+++ b/usr/Kconfig
@@ -27,7 +27,7 @@ config INITRAMFS_FORCE
 	depends on CMDLINE_EXTEND || CMDLINE_FORCE
 	help
 	  This option causes the kernel to ignore the initramfs image
-	  (or initrd image) passed to it by the bootloader. This is
+	  passed to it by the bootloader. This is
 	  analogous to CMDLINE_FORCE, which is found on some architectures,
 	  and is useful if you cannot or don't want to change the image
 	  your bootloader passes to the kernel.
@@ -53,59 +53,59 @@ config INITRAMFS_ROOT_GID
 	  If you are not sure, leave it set to "0".
 
 config RD_GZIP
-	bool "Support initial ramdisk/ramfs compressed using gzip"
+	bool "Support initial ramfs compressed using gzip"
 	default y
 	select DECOMPRESS_GZIP
 	help
-	  Support loading of a gzip encoded initial ramdisk or cpio buffer.
+	  Support loading of a gzip encoded initial ramfs.
 	  If unsure, say Y.
 
 config RD_BZIP2
-	bool "Support initial ramdisk/ramfs compressed using bzip2"
+	bool "Support initial ramfs compressed using bzip2"
 	default y
 	select DECOMPRESS_BZIP2
 	help
-	  Support loading of a bzip2 encoded initial ramdisk or cpio buffer
+	  Support loading of a bzip2 encoded initial ramfs.
 	  If unsure, say N.
 
 config RD_LZMA
-	bool "Support initial ramdisk/ramfs compressed using LZMA"
+	bool "Support initial ramfs compressed using LZMA"
 	default y
 	select DECOMPRESS_LZMA
 	help
-	  Support loading of a LZMA encoded initial ramdisk or cpio buffer
+	  Support loading of a LZMA encoded initial ramfs.
 	  If unsure, say N.
 
 config RD_XZ
-	bool "Support initial ramdisk/ramfs compressed using XZ"
+	bool "Support initial ramfs compressed using XZ"
 	default y
 	select DECOMPRESS_XZ
 	help
-	  Support loading of a XZ encoded initial ramdisk or cpio buffer.
+	  Support loading of a XZ encoded initial ramfs.
 	  If unsure, say N.
 
 config RD_LZO
-	bool "Support initial ramdisk/ramfs compressed using LZO"
+	bool "Support initial ramfs compressed using LZO"
 	default y
 	select DECOMPRESS_LZO
 	help
-	  Support loading of a LZO encoded initial ramdisk or cpio buffer
+	  Support loading of a LZO encoded initial ramfs.
 	  If unsure, say N.
 
 config RD_LZ4
-	bool "Support initial ramdisk/ramfs compressed using LZ4"
+	bool "Support initial ramfs compressed using LZ4"
 	default y
 	select DECOMPRESS_LZ4
 	help
-	  Support loading of a LZ4 encoded initial ramdisk or cpio buffer
+	  Support loading of a LZ4 encoded initial ramfs.
 	  If unsure, say N.
 
 config RD_ZSTD
-	bool "Support initial ramdisk/ramfs compressed using ZSTD"
+	bool "Support initial ramfs compressed using ZSTD"
 	default y
 	select DECOMPRESS_ZSTD
 	help
-	  Support loading of a ZSTD encoded initial ramdisk or cpio buffer.
+	  Support loading of a ZSTD encoded initial ramfs.
 	  If unsure, say N.
 
 choice
@@ -127,7 +127,7 @@ choice
 	  boot.
 
 	  Keep in mind that your build system needs to provide the appropriate
-	  compression tool to compress the generated initram cpio file for
+	  compression tool to compress the generated initramfs cpio file for
 	  embedding.
 
 	  If in doubt, select 'None'
@@ -153,7 +153,7 @@ config INITRAMFS_COMPRESSION_BZIP2
 	  booting.
 
 	  If you choose this, keep in mind that you need to have the bzip2 tool
-	  available to be able to compress the initram.
+	  available to be able to compress the initramfs.
 
 config INITRAMFS_COMPRESSION_LZMA
 	bool "LZMA"
@@ -166,7 +166,7 @@ config INITRAMFS_COMPRESSION_LZMA
 	  comparison to gzip.
 
 	  If you choose this, keep in mind that you may need to install the xz
-	  or lzma tools to be able to compress the initram.
+	  or lzma tools to be able to compress the initramfs.
 
 config INITRAMFS_COMPRESSION_XZ
 	bool "XZ"
@@ -179,7 +179,7 @@ config INITRAMFS_COMPRESSION_XZ
 	  slow.
 
 	  If you choose this, keep in mind that you may need to install the xz
-	  tool to be able to compress the initram.
+	  tool to be able to compress the initramfs.
 
 config INITRAMFS_COMPRESSION_LZO
 	bool "LZO"
@@ -191,7 +191,7 @@ config INITRAMFS_COMPRESSION_LZO
 	  is quite fast too.
 
 	  If you choose this, keep in mind that you may need to install the lzop
-	  tool to be able to compress the initram.
+	  tool to be able to compress the initramfs.
 
 config INITRAMFS_COMPRESSION_LZ4
 	bool "LZ4"
@@ -213,7 +213,7 @@ config INITRAMFS_COMPRESSION_ZSTD
 	  decompress around the same speed as LZO, but slower than LZ4.
 
 	  If you choose this, keep in mind that you may need to install the zstd
-	  tool to be able to compress the initram.
+	  tool to be able to compress the initramfs.
 
 config INITRAMFS_COMPRESSION_NONE
 	bool "None"
-- 
2.47.2


