Return-Path: <linuxppc-dev+bounces-12122-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10410B55E04
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Sep 2025 05:17:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNxL96chhz3cgV;
	Sat, 13 Sep 2025 13:17:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::536"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757724988;
	cv=none; b=P8h75k4C/H+0NzyMFL8OE9yzZuMM6hK9PXONBuXgVNVpq+UDnSDKd/ji+wHTEzc7wYNE0UCxm3Apl9U12Z64PVoVCYXl0uw92qf6YHqbAGanOlhCL9WrFyixOvo4sWVr/jcu3WHb1YSIqjqpd9V9N7sw4gj80ApJmG5Wnc///oZszSRjIgo6iLl1yK31HY82f5xO19eCKab60JO5oT+CKRNgkdhm9RWVlYc1KS1CGhcr1/s9Znfmt3F1KwCH3YgfGyc1Rc0jQGv+p1ttL1YLisBoltI5A4sD4lY/pRF+eDAydoS37qjAk5SxduCTdT8dNlF04RwYab/jeYuEMgxAyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757724988; c=relaxed/relaxed;
	bh=57Y6Vt+tKEG1ezrQxMY6sE7xxEuIy1GPZf6G9mOPdfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EkcHEJ8YkA0V3DFEiyfzsp7zA1lcfsHekVIhqfw56OlhUV+IH8+hbhxhUrVSF9TXL4336ZffhMOM7Or1JaDQpCmkBbulsB0nGyRI0gfZOPh94LMOisdA+Kpl9ZaynQ1Xnz+6lL9Lo+H+iKCYD3J2r86GfCF0qW+wm0AUNYFmZP+ac7UM04XWpLpPiLtv9hD6vMxBLtD79quEeSXurXvlijnFGdJf5R30mlzQ0473TCZWF4/GyKVy78NNchdkmaG64vBlsvLbwvUoH1zyeAUNk8SV0Ub4Op9ktKk8TcrSak5CtpGlhrSYMgRRoxS7oW/Y+kKFXdb0tXQe3/Gj8sCm3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y5F723Yt; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y5F723Yt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNtCb5c0Nz2yrN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 10:56:26 +1000 (AEST)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-61d7b2ec241so3039645a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 17:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757724984; x=1758329784; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=57Y6Vt+tKEG1ezrQxMY6sE7xxEuIy1GPZf6G9mOPdfs=;
        b=Y5F723YtQqHYzn8QooLoTXhKARMYqNdMMlx/BTDN957r06K94m+IPrkbC2BN1NzOkq
         rR7LrBpkqYWo+5L838waKhoVa3PHu9Qq+Am7eGt0VKr+KuMjKCjTaqWKHaZmuUT+gzHm
         tQ16UbRJow2KI+D1Yw0L5GQ9hkIg3cbXwujPJnEuY3ejDtuYUq7jIZ+lrajvJkHRe/Se
         0u61GKEEE8e5rDB73j2kK0/ABOiiAD1qavj161VAHaUZVr0fHXWPWA4ONmejDxze+luh
         ZMXwTcFCy41vDms7XfMQR0wm+PlyAzXkhyEauLVOiGD9CMlkx7TWqJMZUh7JK3OSAsUm
         kTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757724984; x=1758329784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=57Y6Vt+tKEG1ezrQxMY6sE7xxEuIy1GPZf6G9mOPdfs=;
        b=Q4Yp+X4ES1Zey6mejZwzsBdfF9vGIrpL+GODkS/wPMAnlfJP2bDS0SxSl6EJosOglK
         hEHXsPT/QfzQXk2N1TL6RD/pZO3Tbt4jlyF14nl7/clOsO93gWUaVA+HCXNo2R6b5Wd4
         YwsYBi+wzW1yNFOaZK8JReTy44O0/DVXTzBXnRNUFTIihu8jhBg9RWNwPA3gvqe3G1o6
         i0SJpMzXLk+qKplXepxTOXbtvxv6EJATUxodInRB3fc2/E3/Sjn290I1bdtqh+RujVHe
         ybsgYEobsCSyTUnP1GblgZqL5eTLfgjEOpxx3wn8yJBLSYSHceBqhH6O3GMBPragFrmx
         GGgg==
X-Forwarded-Encrypted: i=1; AJvYcCX8gkzPAWBn1xFe8YzXYHlgO4WY/015+hotZe+WA7vSh2v56g54C661wGYjSbIUJA6HK/nddSbEgoRejkE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyGSd6vYdc2FTGLevrzmsg1592tS1evsSyMpYjWtbVM8aML+cjO
	yol6pP9ksaYq8U7ier2XzOpp9Ix+BPF3aArNi5uFm60IjEnyZ8pmrVHL
X-Gm-Gg: ASbGncsmeyKx+bFo/dFmN2v3wqbL0DyfxzJPdbPW/H0o1FGtPgPWCf4ZLQcg7jfA8kG
	RByZD9d/siO5kt7or4PkpDnBSDX9P35U0hcX6Nav9Z37v0Rfm8ux/oXr9zaiqa88kM26mxg2FNS
	41VNNoatMPPaHCJxR8OZksgTdRTUSeWtklzPCzD3hzttxF/AMy97tEq48oC8NFR5c2QQm+kx6o9
	2SCzN06qALXZtipmr5cH00Y/bRevfOyQDQKC2Gp9UApSaxNLSjwVjrDbSap/k8i5pDHU5KzOWfr
	CXNw9Pu88xdCL8pOVFcE68Hzm/oAJMjlGv+eBzJc2uEI2BYTrq/M8IMzMSWZlML9VsbtkYpQDrl
	XrDXg3Aj+8kYdLj+VFbJsqJZZD0d0HA==
X-Google-Smtp-Source: AGHT+IG1YYL4kFwbVvTnXfTe3odNA00ZLAAz2mLJaF8vV1UmquQWKJyitdN/Fum9NwuVLBLjujgrow==
X-Received: by 2002:a17:907:3fa1:b0:b07:88aa:255b with SMTP id a640c23a62f3a-b07c354ed12mr458973666b.11.1757724983824;
        Fri, 12 Sep 2025 17:56:23 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b33478besm484760966b.99.2025.09.12.17.56.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:56:23 -0700 (PDT)
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
Subject: [PATCH RESEND 15/62] doc: modernize Documentation/admin-guide/blockdev/ramdisk.rst
Date: Sat, 13 Sep 2025 00:37:54 +0000
Message-ID: <20250913003842.41944-16-safinaskar@gmail.com>
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

Update it to reflect initrd removal

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 .../admin-guide/blockdev/ramdisk.rst          | 103 ++----------------
 1 file changed, 7 insertions(+), 96 deletions(-)

diff --git a/Documentation/admin-guide/blockdev/ramdisk.rst b/Documentation/admin-guide/blockdev/ramdisk.rst
index e57c61108dbc..6289e085f18f 100644
--- a/Documentation/admin-guide/blockdev/ramdisk.rst
+++ b/Documentation/admin-guide/blockdev/ramdisk.rst
@@ -5,18 +5,14 @@ Using the RAM disk block device with Linux
 .. Contents:
 
 	1) Overview
-	2) Kernel Command Line Parameters
-	3) Using "rdev"
-	4) An Example of Creating a Compressed RAM Disk
+	2) Module parameters
 
 
 1) Overview
 -----------
 
-The RAM disk driver is a way to use main system memory as a block device.  It
-is required for initrd, an initial filesystem used if you need to load modules
-in order to access the root filesystem (see Documentation/admin-guide/initrd.rst).  It can
-also be used for a temporary filesystem for crypto work, since the contents
+The RAM disk driver is a way to use main system memory as a block device.
+It can also be used for a temporary filesystem for crypto work, since the contents
 are erased on reboot.
 
 The RAM disk dynamically grows as more space is required. It does this by using
@@ -30,109 +26,24 @@ and (re)build the kernel.
 
 To use RAM disk support with your system, run './MAKEDEV ram' from the /dev
 directory.  RAM disks are all major number 1, and start with minor number 0
-for /dev/ram0, etc.  If used, modern kernels use /dev/ram0 for an initrd.
-
-The new RAM disk also has the ability to load compressed RAM disk images,
-allowing one to squeeze more programs onto an average installation or
-rescue floppy disk.
+for /dev/ram0, etc.
 
 
-2) Parameters
----------------------------------
+2) Module parameters
+--------------------
 
-2a) Kernel Command Line Parameters
-
-	ramdisk_size=N
+	rd_size=N
 		Size of the ramdisk.
 
 This parameter tells the RAM disk driver to set up RAM disks of N k size.  The
 default is 4096 (4 MB).
 
-2b) Module parameters
-
 	rd_nr
 		/dev/ramX devices created.
 
 	max_part
 		Maximum partition number.
 
-	rd_size
-		See ramdisk_size.
-
-3) Using "rdev"
----------------
-
-"rdev" is an obsolete, deprecated, antiquated utility that could be used
-to set the boot device in a Linux kernel image.
-
-Instead of using rdev, just place the boot device information on the
-kernel command line and pass it to the kernel from the bootloader.
-
-You can also pass arguments to the kernel by setting FDARGS in
-arch/x86/boot/Makefile and specify in initrd image by setting FDINITRD in
-arch/x86/boot/Makefile.
-
-Some of the kernel command line boot options that may apply here are::
-
-  ramdisk_size=M
-
-If you make a boot disk that has LILO, then for the above, you would use::
-
-	append = "ramdisk_size=M"
-
-4) An Example of Creating a Compressed RAM Disk
------------------------------------------------
-
-To create a RAM disk image, you will need a spare block device to
-construct it on. This can be the RAM disk device itself, or an
-unused disk partition (such as an unmounted swap partition). For this
-example, we will use the RAM disk device, "/dev/ram0".
-
-Note: This technique should not be done on a machine with less than 8 MB
-of RAM. If using a spare disk partition instead of /dev/ram0, then this
-restriction does not apply.
-
-a) Decide on the RAM disk size that you want. Say 2 MB for this example.
-   Create it by writing to the RAM disk device. (This step is not currently
-   required, but may be in the future.) It is wise to zero out the
-   area (esp. for disks) so that maximal compression is achieved for
-   the unused blocks of the image that you are about to create::
-
-	dd if=/dev/zero of=/dev/ram0 bs=1k count=2048
-
-b) Make a filesystem on it. Say ext2fs for this example::
-
-	mke2fs -vm0 /dev/ram0 2048
-
-c) Mount it, copy the files you want to it (eg: /etc/* /dev/* ...)
-   and unmount it again.
-
-d) Compress the contents of the RAM disk. The level of compression
-   will be approximately 50% of the space used by the files. Unused
-   space on the RAM disk will compress to almost nothing::
-
-	dd if=/dev/ram0 bs=1k count=2048 | gzip -v9 > /tmp/ram_image.gz
-
-e) Put the kernel onto the floppy::
-
-	dd if=zImage of=/dev/fd0 bs=1k
-
-f) Put the RAM disk image onto the floppy, after the kernel. Use an offset
-   that is slightly larger than the kernel, so that you can put another
-   (possibly larger) kernel onto the same floppy later without overlapping
-   the RAM disk image. An offset of 400 kB for kernels about 350 kB in
-   size would be reasonable. Make sure offset+size of ram_image.gz is
-   not larger than the total space on your floppy (usually 1440 kB)::
-
-	dd if=/tmp/ram_image.gz of=/dev/fd0 bs=1k seek=400
-
-g) Make sure that you have already specified the boot information in
-   FDARGS and FDINITRD or that you use a bootloader to pass kernel
-   command line boot options to the kernel.
-
-That is it. You now have your boot/root compressed RAM disk floppy. Some
-users may wish to combine steps (d) and (f) by using a pipe.
-
 
 						Paul Gortmaker 12/95
 
-- 
2.47.2


