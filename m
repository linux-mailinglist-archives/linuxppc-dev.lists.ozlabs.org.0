Return-Path: <linuxppc-dev+bounces-12120-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F578B55E02
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Sep 2025 05:17:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNxKx3LfQz3cg1;
	Sat, 13 Sep 2025 13:17:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::532"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757725118;
	cv=none; b=db6f1qHwjwxlQB9vJw4PXa3ecRf6p6T4f6cWRglDc63si68O3YBKReqj0otNLeJ3OaH0EKlnbditEACIQuBY3vd8CI6LZTOss6g6wAv9uwuv9+g3HvWQVI9px/B9AMku5w1b+3DQJSJos+2P2C9400m+1mtlIBkA8GaEcacnA6LGMASZ9hJ2TCsRUu0TM4dR4O0eJSpgiyc8jlHDfpciu4fTivmKrggG9x7el2Y+vKQsQcW9QTISoi0SBNZoJKyfYcbzHwgqJLoDROzBkYv8BNeaffKvAtgJ2X46MledbmCtz55ncZc5zgO9+dXEe2Yx1G00KnZmqXjKhwsfrHy6mw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757725118; c=relaxed/relaxed;
	bh=2BXXMTZbWkKZqT8QgJ9Z777RqiFOaP2Wc1It8eJXku8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IzF6BtKgilzAHwYaOAgLMNJ8nJOOo2aVa/SQSa2A8lqTGbhSev5XJcWMH2zYJkKMkijHrBLyf1an3xaSHQ6vBA4NXxoISe6AcC7qUUV/suhyFAT2oMFStahGhu53nsGF18CNyIRXFfSLlTkxSi88bgQX7jlOp2sMQudqNhaItV3sNYHQ0X/+x32fDz/z2ZT9BQISsMpDz56OJ4Wp9WwzrSwv5FCvImMOmm/jp1ns/TidWVCBDP4iJ6SU7QeIj2+wIZF5l3p0WQ4/j9xvmErDRvf+Fxcx7ZfGW6ot7xSTrNpe9y64XFu9NX9VJm4GtukTVQnKVbsOk2Z7gJap9t7IXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Lg4Y6Y/L; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Lg4Y6Y/L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNtG55Bszz2yrN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 10:58:37 +1000 (AEST)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-625e1ef08eeso4228793a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 17:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725115; x=1758329915; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BXXMTZbWkKZqT8QgJ9Z777RqiFOaP2Wc1It8eJXku8=;
        b=Lg4Y6Y/Lfle9loXsFzniF+k1cx8+zAkKFXhW5a0ZTpdL8TODz65DvUhaAY39/FiuXL
         Sa/WSsK0M7Yxb5XvWcu5ZQ77kQxTci2Kg9yNCC2N+sJIxdIDCIjRgcYToP9G8UaVmBGq
         n0DKhct4wfL6tm2VfH30DaedFj4unSw6YSWdvrKaltch7+EpcatuXX5XOj99bvmvmO/G
         Vg2VlQtSHQ1Rg3OOXEVLG7Qd5Xw8x/Z7cIpsAuhWCfLCBJpVC2iCgPOn3B64SJ/dj7P6
         yQK2jDGCULQiIlKvEg5BCVtAPmfDL9ZjSxyZYhKHBMQsb9NsZsg+JvKR0AEpEl9eDz6E
         3p2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725115; x=1758329915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2BXXMTZbWkKZqT8QgJ9Z777RqiFOaP2Wc1It8eJXku8=;
        b=a2LF7IR+JOu0rSJTU7RBCwtufTq7J368XdY8LYU1iYtYbFTvz7YYOMK9FAaWK0FrwE
         zKYDEjQ7YNbirbBHeJ13lbjd+RQWqVUTOfMQ9MhaXbFazLwGWVTJzua5t98U62uqsbOJ
         lRxIzZuZR8Dv10xl0bQwVZqrFBU1BixtkoruFt6rwHqmBsr8zio7znidbjiVpYTXhuSl
         BYXeZVlDZAdaloOoTEmXEdU5RmSI4zibOqjty6DqV4Fwf47wxEu2OTZOrtqbAKOwaSqO
         yOedcy36PGEGDZzj2P4gZwr106iL+nOBqU3XRiOquskziyulwmQVWJPg1EwUTM4mtN6G
         +/nw==
X-Forwarded-Encrypted: i=1; AJvYcCXvkqFnllYhuQmC8wY4d1d1ySpSS7dL88Mz91nAd7CSur7CLTNbrEU313Lfo5QRyqJT8Ol6NHj2puFm1uk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw9foyvXH2L4vUdmQc5HNwaoiKFrM+Qj5I7oQq/UIgqjppeaCM+
	lbKk3UxwSlrolmnqcIDpsqA8RmO26QqD0elG9Dvf4vd4nXVyvwSHBrvf
X-Gm-Gg: ASbGncte9dmHFgpLbNYL5lhMY3d/W3nB3OcMfMwjffvEerOvMZr8e7Vx+QtnlLzYZ4f
	w/YoUkxa3p6qz03A83HNxL5nA2XSOW9dJPs33RNaSBatK5y7ZkduxrZwGS472EnDcsoP3U1WCjt
	GWsAJM58aoC7oMVGH2h2umK0/GX3N4Cx+FX30pv4AieExaTGKeRT97YgGyjUfVIGawyivJRda0h
	sud85UnlNmp4oqKuQgplei5nazAHBYuA3PEUO0q9qb/1T/fxAJ5Z/rMpqBdXB3wNwd5RNCyJUis
	WnqxGA8qQfkyG6XU4aUUxNRJwL7j4k88ZEtxokX0WUWSV6ZdOWSp0sd8wBkkdftXZ0IkF54Y2QW
	P4HgOFhbDbH4aGBCyeiEIolz82n+Nbg==
X-Google-Smtp-Source: AGHT+IF4XezAq8wXNO6voYrJeDnCFhU1tJ+TfyE7OJRqFWOCMlq1YMWoUA8uaJ4xPb3fA3w8qZjP4Q==
X-Received: by 2002:a05:6402:5242:b0:628:a4fb:3b44 with SMTP id 4fb4d7f45d1cf-62ed825998fmr4961876a12.1.1757725114882;
        Fri, 12 Sep 2025 17:58:34 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62ec33f3b16sm4143925a12.24.2025.09.12.17.58.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:58:34 -0700 (PDT)
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
Subject: [PATCH RESEND 17/62] doc: modernize Documentation/filesystems/ramfs-rootfs-initramfs.rst
Date: Sat, 13 Sep 2025 00:37:56 +0000
Message-ID: <20250913003842.41944-18-safinaskar@gmail.com>
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

Update it to reflect initrd removal.

Also I specified that error reports should
go to linux-doc@vger.kernel.org , because
Rob Landley said that he keeps getting
reports about this document and is unable
to fix them

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 .../filesystems/ramfs-rootfs-initramfs.rst    | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/filesystems/ramfs-rootfs-initramfs.rst b/Documentation/filesystems/ramfs-rootfs-initramfs.rst
index fa4f81099cb4..38a9cf11f547 100644
--- a/Documentation/filesystems/ramfs-rootfs-initramfs.rst
+++ b/Documentation/filesystems/ramfs-rootfs-initramfs.rst
@@ -8,6 +8,8 @@ October 17, 2005
 
 :Author: Rob Landley <rob@landley.net>
 
+Report errors in this document to <linux-doc@vger.kernel.org>
+
 What is ramfs?
 --------------
 
@@ -101,9 +103,9 @@ archive is extracted into it, the kernel will fall through to the older code
 to locate and mount a root partition, then exec some variant of /sbin/init
 out of that.
 
-All this differs from the old initrd in several ways:
+All this differs from the old initrd (removed in 2025) in several ways:
 
-  - The old initrd was always a separate file, while the initramfs archive is
+  - The old initrd was always a separate file, while the initramfs archive can be
     linked into the linux kernel image.  (The directory ``linux-*/usr`` is
     devoted to generating this archive during the build.)
 
@@ -137,7 +139,7 @@ Populating initramfs:
 
 The 2.6 kernel build process always creates a gzipped cpio format initramfs
 archive and links it into the resulting kernel binary.  By default, this
-archive is empty (consuming 134 bytes on x86).
+archive is nearly empty (consuming 134 bytes on x86).
 
 The config option CONFIG_INITRAMFS_SOURCE (in General Setup in menuconfig,
 and living in usr/Kconfig) can be used to specify a source for the
@@ -222,15 +224,13 @@ use in place of the above config file::
 External initramfs images:
 --------------------------
 
-If the kernel has initrd support enabled, an external cpio.gz archive can also
-be passed into a 2.6 kernel in place of an initrd.  In this case, the kernel
-will autodetect the type (initramfs, not initrd) and extract the external cpio
+If the kernel has CONFIG_BLK_DEV_INITRD enabled, an external cpio.gz archive can also
+be passed into a 2.6 kernel.  In this case, the kernel will extract the external cpio
 archive into rootfs before trying to run /init.
 
-This has the memory efficiency advantages of initramfs (no ramdisk block
-device) but the separate packaging of initrd (which is nice if you have
+This is nice if you have
 non-GPL code you'd like to run from initramfs, without conflating it with
-the GPL licensed Linux kernel binary).
+the GPL licensed Linux kernel binary.
 
 It can also be used to supplement the kernel's built-in initramfs image.  The
 files in the external archive will overwrite any conflicting files in
@@ -278,7 +278,7 @@ User Mode Linux, like so::
   EOF
   gcc -static hello.c -o init
   echo init | cpio -o -H newc | gzip > test.cpio.gz
-  # Testing external initramfs using the initrd loading mechanism.
+  # Testing external initramfs.
   qemu -kernel /boot/vmlinuz -initrd test.cpio.gz /dev/zero
 
 When debugging a normal root filesystem, it's nice to be able to boot with
-- 
2.47.2


