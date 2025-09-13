Return-Path: <linuxppc-dev+bounces-12132-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0ABBB55E0E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Sep 2025 05:18:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNxMP1g0mz3dWD;
	Sat, 13 Sep 2025 13:18:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757724333;
	cv=none; b=gE0ELzihRgtCTSiszdhYsiPVeiEFjL/agUpMPWwZCFGJAWRovLIVG7CYyt0mdlppVb3FZQSjIBUS8GkcP0n6ORxwPM7C6bZy0km36uXzELqLu6Rn8He4KvQl5AI/2KEloi4A1GjG50VptD01rtmbuSBDS9aBxheDgYp7/cmuB6QP/mNMxs/UpbrhFzGFg/P9Va9jltueUbQDYUhXuTdbClzWw0BmXm0tgDEVXdtutdPbA+PxZgsvTDNdBwaZ9slr7m4fZzywbxd5F1fiJWa4p0w1MEjF0ib5nZKNhe/ahUiEH/zdxbRnmXEN+84iZCObL+JTZgf9V/1CxVGIli3Vwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757724333; c=relaxed/relaxed;
	bh=fi1FJKwP9nWnSjptSGh11GRsqwR1G48l7l6Ou3g4XAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bp7b00igVWU7M/CRxcNZm8b+xjXCkanuzYESzzWfla38NdUYlwTcxndvjDKeJVdkO2zgw6O1rvkGqDx9FVLzA+fCAcuC5ssdi8TFG6tqEBdJSkiKxf55iOUUD06+9cg7mAbGy1Xej9+ogSRZOft3itBXhK5c7UsJsoAcygUajCI6oQQ8AA7GgO9yOz3FnSQIafco9gCp+GNGdqrOATxrGz/0tardu51KHzGYhdiLsG9Ip7oe3TIzrGzoVWgoO/OAweMzuExI7MYfFkF4YoJTrUeM6NtrSIie9+N+GZjU1R2pDLaDIM/1yhbgbj9nVE8D3gk1mTmmiQCaxjGJ8pgK/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=boXok49S; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=boXok49S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNsz04Zq0z2yrN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 10:45:31 +1000 (AEST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b0787fdb137so377173866b.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 17:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757724329; x=1758329129; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fi1FJKwP9nWnSjptSGh11GRsqwR1G48l7l6Ou3g4XAs=;
        b=boXok49SygH1kzCb6dKnsumC8sMsv0+ae4+KJcDRDyK7PR/J0p6hMC8wObLJBJy/Qm
         /HB07KWgBRQRlDFWzvL/c29djxibjfN+kEoX7mDtlbXOfyGNesJueHqJsiHlIc4T70at
         Gh7ytPkvsreriXSCk5wpXWzdDwKi8wOYihS0m6hi+s4cleGAHnzaWIwy/pZkB1M9nEPW
         bzQ311ypxEMw6QU1HkerILSXqoekPgzP7tR+DzjDKYDZNUZEjmvyYqjKwYGH3bektmrg
         QAwPXsSueLskzRncveaBsz7ujJIg2LB5HXjeJab/p80AutT7tQbDE+rSmzrsMUK+qRm3
         Rlcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757724329; x=1758329129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fi1FJKwP9nWnSjptSGh11GRsqwR1G48l7l6Ou3g4XAs=;
        b=spyyXpjpnn3JG0HPNdZeGIYfmp/amijdKqEkgeIe7dJqn5OSIZGPbsF2bBOgrGEtPO
         WHhcz+c6zyJywpUGIAjUUFFvyWsSKUcv8a8SLh8vnARiXDMoUwrRW1qB4sROJRsElq1K
         0tzKrdwr95xp4BTnCt44op8srdWqUKatlN68bE7dMa2IHRNwodHmct4C+NzvWsf128Z+
         Fjjym8gQ2e5tqBfQOOMbhW/2RzBl+nSU4g/+3IK6r3P8BEWe+LFCvaHRM7BXwJzo8ELe
         kflEueIHYIhFxgCjGuptTpt562SiZqc1tyMCYYWv+B/hYqpmvGUIWpJ5xbztSQhzDGqv
         /z4w==
X-Forwarded-Encrypted: i=1; AJvYcCURz+CMWFOvsFwX7jk+Rb++PxhCV6nHGLeV96DRLYlAAzBJk5FrugtHmsH2BgajNFr9CX1xwzooNpbo9UA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyfuUoj8GysVHwoaXOMqQjzi3sqmVbFlqtsxE573WM9hV09BrKS
	tYe+8I6eGU5hAgecvID+/imRCNFUrNnsLJ8ViY7I4MODmCvB5RSde9c5
X-Gm-Gg: ASbGncsIr3vU7loO4+leY16+K45ShMXZrlBYrP1ByqY2A0/HqEd0JSsvfHaVz0FqnNy
	a3L2f9QvZnpJjK5gFBtNtXkKYWmH2fbIXcUWaALEuoV1xa23T8KCFcqGU6W9xpMbduRb6zrWzTG
	QHB14Ruw8YwUmwMmJCLn5dlsyHcW9z8/Fm6JO7rTZnvDOfY8WWNYcfJNZa+MmsExrUBGhnne2mU
	LkktgdsLDj7pxcu2aTkjHHX3A9z5rAKHkyo0Mt9tf0Vvu80Iea+kkHrht7YiI+WQvyr6NKLC10v
	xOQJhho8RNLEkxg3qy+tVsrTmwhexs62WQAMxeR49StZCJaleddYHy4VGRnnC6wEMkCPYEtA7Pj
	G+19RyuNtrrvZhQNP+Hs=
X-Google-Smtp-Source: AGHT+IEY39yKNpHOwhu+b8E85JfZO5GXoHp0A73FES6zZeZtQwPXvLC0BV0HcFzY55ZLXxqy2VO9oA==
X-Received: by 2002:a17:907:9405:b0:b07:c9b2:dbd with SMTP id a640c23a62f3a-b07c9b20f2cmr456963866b.4.1757724328684;
        Fri, 12 Sep 2025 17:45:28 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b32dd5casm460965366b.68.2025.09.12.17.45.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:45:28 -0700 (PDT)
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
Subject: [PATCH RESEND 05/62] init: remove "ramdisk_start" command line parameter, which controls starting block number of initrd
Date: Sat, 13 Sep 2025 00:37:44 +0000
Message-ID: <20250913003842.41944-6-safinaskar@gmail.com>
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
 Documentation/admin-guide/blockdev/ramdisk.rst  | 3 +--
 Documentation/admin-guide/kernel-parameters.txt | 2 --
 init/do_mounts_rd.c                             | 7 -------
 3 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/Documentation/admin-guide/blockdev/ramdisk.rst b/Documentation/admin-guide/blockdev/ramdisk.rst
index 9ce6101e8dd9..e57c61108dbc 100644
--- a/Documentation/admin-guide/blockdev/ramdisk.rst
+++ b/Documentation/admin-guide/blockdev/ramdisk.rst
@@ -74,12 +74,11 @@ arch/x86/boot/Makefile.
 
 Some of the kernel command line boot options that may apply here are::
 
-  ramdisk_start=N
   ramdisk_size=M
 
 If you make a boot disk that has LILO, then for the above, you would use::
 
-	append = "ramdisk_start=N ramdisk_size=M"
+	append = "ramdisk_size=M"
 
 4) An Example of Creating a Compressed RAM Disk
 -----------------------------------------------
diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index f940c1184912..07e8878f1e13 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5285,8 +5285,6 @@
 	ramdisk_size=	[RAM] Sizes of RAM disks in kilobytes
 			See Documentation/admin-guide/blockdev/ramdisk.rst.
 
-	ramdisk_start=	[RAM] RAM disk image start address
-
 	random.trust_cpu=off
 			[KNL,EARLY] Disable trusting the use of the CPU's
 			random number generator (if available) to
diff --git a/init/do_mounts_rd.c b/init/do_mounts_rd.c
index 8e0a774a9c6f..864fa88d9f89 100644
--- a/init/do_mounts_rd.c
+++ b/init/do_mounts_rd.c
@@ -17,13 +17,6 @@
 static struct file *in_file, *out_file;
 static loff_t in_pos, out_pos;
 
-static int __init ramdisk_start_setup(char *str)
-{
-	/* will be removed in next commit */
-	return 1;
-}
-__setup("ramdisk_start=", ramdisk_start_setup);
-
 static int __init crd_load(decompress_fn deco);
 
 /*
-- 
2.47.2


