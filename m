Return-Path: <linuxppc-dev+bounces-12176-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A27B566FC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Sep 2025 07:32:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cPcHD3LWYz3chy;
	Sun, 14 Sep 2025 15:32:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757822087;
	cv=none; b=bzyDW11kW7OZirAm0b99Ip/Cb4FkS345p30xfcUGF7sNcykHlDgeQaJFfcaReEsw4oRMncdRyQDX6lzeaLpwdFbBAlqCFHyu2IuKvreRoW7PDNXuNOP1eg8yeNpGLFWzt+H6CQR4l5XODfmJenEn9lZ37YuAlxy/rRsJQA44S1/vmTGSMWKRYTWRAXwHBJZc8xhr3cWCKVKz2xtw6iAtw3vvThF4k7A48M35T0OJQAzPvW5PWPcJHdXDQdoNmdSkQfE3ux7O9EJg+mLNrFTiUC7/mWc/h820MBGwVSxXJfILwQ+s1tDZh0dgysbtvylf2OOL15bxG+0mZtatKKL49g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757822087; c=relaxed/relaxed;
	bh=pjKVSjXysip/b5UNUwgMX+OIg9u3DNn6e0+I8Cmpn0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G2VkSqg7fhtLmCpgN/wNR2hEgL+ESYRw806n4nkbOvp3d5//Y2fAzZiNOgQfWpgdJEZdWQSMHMIRJPtRURGgT9vhDxFkpq5Z9LnYPeK/b8KZqFM4daZ+yK8GMCoEvCudWmWL+kd1b3M+deHtUaDXqvuAkxtUpLGygrIiBGCdf940U8NTfFkGrstq43OIuxNlKLiUe5q4iBIq0EA5tZLVko19ASkN712fMQNqlUcBlIc6TbC8TU1240X1bHIiUfo1EpgB0JkDeqgEA4b5inNgHwHApwDsk6zFP68raxwZaL+4jQkG1ZCrTK5ZaQB6UsZ528uTztTGlUtd7CpSI2DRcw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y/l5KDl2; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y/l5KDl2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cPZ6t3nVQz2yrg
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Sep 2025 13:54:46 +1000 (AEST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b07e3a77b72so134360666b.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 20:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822083; x=1758426883; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjKVSjXysip/b5UNUwgMX+OIg9u3DNn6e0+I8Cmpn0k=;
        b=Y/l5KDl26H+TPzyVcYZ3i5MU7nWM41amgtB8uYQZgPhoh68wZXwK5SciHTo0BzolSh
         yIKNjm4yNRSEthFqjOxqn0noFpyxm9t0RsPEDizJZ7UHfVjUGWH6O29drrcfI8xIjbVW
         q0xEkM7nHeK22Xlnl/UlR6MEBMMuYOjR94mUvmp6sUfOLiD7nNybWRZJT8DqERltv+Cc
         qsa14Q+pXqFYDJWluAD7ahA94i9NjuUuwEgLjC8NPHx8bYfaY8mH1fpWVuTo/1M23+ar
         RB4biG7z+eaZnJlmKla5S66cOTbG2+qQy5wFm+4wai8kiurWNYMRprFeRWhyXFlRtkR6
         Di4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822083; x=1758426883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pjKVSjXysip/b5UNUwgMX+OIg9u3DNn6e0+I8Cmpn0k=;
        b=EkzSxnH90q7ZapdVy0cLe1/1gdzN7bol75iO95QOnxmg98dFK5bJMCA/tfVB0J0VSJ
         ZIb8ZBFhm4uy9uprr/kQje5gZeJBBSBS1sQ9P/5MKceaELBa3v/7WzKyeeilsFGxXMm2
         0DvevzcWNKB9YYrUbQwTD7TT+vYW4ws8QtS8HuFFgt8IUbieBBzCdJ3MdAsW51oqDMxr
         SB7yPdS5ZQBgsZd2v+3Ua81avuAQ1m+Qtg3nWhiFJ42psaFWe6QpWFRYAgcUee/Mn/pG
         J+Q69qkXXvVrwjMn/JctRHQYNDtSE6ihsXcyHX3kQCV0m///o1FW4TCzVx8BKjzBKBre
         gY+g==
X-Forwarded-Encrypted: i=1; AJvYcCUn6it9wmTgHanysX+8N2n3QmVolBrb96TfIsg4vNRjlwjB+KHYxoBJhL6MqLBfN5+ynwk3s2QiQpdTDsM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzn7pzz8Gpf5ZiLtoauPNK54a2rcwYn5XfQs6Z33fo598DPc808
	HbvnC3VOMlz2hHVn5moCm0FjwjMAr1V/1eBvXN5r2b5R1T1fVAGIKeAm
X-Gm-Gg: ASbGncvZKqxtNgWodjo8X1iu9ftgiCIMJItTLpsamC5B9eQDBIWg8g9P1P1LubO0dZ7
	uf+ggrbiMVtr/vsRiBb05OlN//ZQXbAbmefD1K5ynTrwW1MVIm7VpzoJAhLhLFORDQ6niRswdWp
	LBv6YFu9tqTaaln96ESXQ/9WWNSt40rjpUrTre84H+2UlsU3j+K1h+kj3eXZYDAT0Aj7PZlyguT
	geTkP3ET7RMQqLsmbtEAjXRlSqkHRrDgbLmq+CUq6ZmRRdTlcZdlqPFAOQdpgRJYCLNjgXfCcZi
	eUdZRLg3wu7cA5rjulTkjvEGEaTVh3Uq7Zr2s6Zzp50XZ5nYgEUnDmSU9dzrCGgvLRwF0vWjUWS
	jQ4xH2xwiCLaOfGxyHYupRUqgC53S9A==
X-Google-Smtp-Source: AGHT+IFpMpCVJeNrUipt0dZC4eBHRTy08fiFy9cwywIocPIoMawoMDT0bJrFyHi72vkPeUNRc3Oodg==
X-Received: by 2002:a17:906:114e:b0:b0b:35d8:248e with SMTP id a640c23a62f3a-b0b35d8267fmr237998166b.18.1757822083468;
        Sat, 13 Sep 2025 20:54:43 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b32dd5a9sm665619166b.57.2025.09.13.20.54.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:54:43 -0700 (PDT)
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
Subject: [PATCH RESEND 45/62] doc: kernel-parameters: replace [RAM] with [INITRAMFS]
Date: Sun, 14 Sep 2025 06:54:38 +0300
Message-ID: <20250914035438.3682240-1-safinaskar@gmail.com>
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

Also, do other initramfs-related edits, while we are here

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 .../admin-guide/kernel-parameters.rst         |  4 ++--
 .../admin-guide/kernel-parameters.txt         | 20 +++++++++----------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.rst b/Documentation/admin-guide/kernel-parameters.rst
index 39d0e7ff0965..22af6bbffc35 100644
--- a/Documentation/admin-guide/kernel-parameters.rst
+++ b/Documentation/admin-guide/kernel-parameters.rst
@@ -123,7 +123,7 @@ is applicable::
 	CMA	Contiguous Memory Area support is enabled.
 	DRM	Direct Rendering Management support is enabled.
 	DYNAMIC_DEBUG Build in debug messages and enable them at runtime
-	EARLY	Parameter processed too early to be embedded in initrd.
+	EARLY	Parameter processed too early to be embedded in initramfs.
 	EDD	BIOS Enhanced Disk Drive Services (EDD) is enabled
 	EFI	EFI Partitioning (GPT) is enabled
 	EVM	Extended Verification Module
@@ -134,6 +134,7 @@ is applicable::
 	HW	Appropriate hardware is enabled.
 	HYPER_V HYPERV support is enabled.
 	IMA     Integrity measurement architecture is enabled.
+	INITRAMFS Initramfs support is enabled.
 	IP_PNP	IP DHCP, BOOTP, or RARP is enabled.
 	IPV6	IPv6 support is enabled.
 	ISAPNP	ISA PnP code is enabled.
@@ -167,7 +168,6 @@ is applicable::
 	PPT	Parallel port support is enabled.
 	PS2	Appropriate PS/2 support is enabled.
 	PV_OPS	A paravirtualized kernel is enabled.
-	RAM	RAM disk support is enabled.
 	RDT	Intel Resource Director Technology.
 	RISCV	RISCV architecture is enabled.
 	S390	S390 architecture is enabled.
diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0805d3ebc75a..8e10abac4cc7 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -565,7 +565,7 @@
 			Format: integer
 
 	bootconfig	[KNL,EARLY]
-			Extended command line options can be added to an initrd
+			Extended command line options can be added to an initramfs
 			and this will cause the kernel to look for it.
 
 			See Documentation/admin-guide/bootconfig.rst
@@ -1005,7 +1005,7 @@
 			may be missing from the dump.
 
 			A standard crashkernel reservation, as described above,
-			is still needed to hold the crash kernel and initrd.
+			is still needed to hold the crash kernel and initramfs.
 
 			This option increases the risk of a kdump failure: DMA
 			transfers configured by the first kernel may end up
@@ -2298,7 +2298,7 @@
 			initcall functions.  Useful for debugging built-in
 			modules and initcalls.
 
-	initramfs_async= [KNL]
+	initramfs_async= [INITRAMFS,KNL]
 			Format: <bool>
 			Default: 1
 			This parameter controls whether the initramfs
@@ -2310,10 +2310,10 @@
 			unpacking being completed before device_ and
 			late_ initcalls.
 
-	initrd=		[BOOT,EARLY] Specify the location of the initial ramdisk
+	initrd=		[BOOT,EARLY,INITRAMFS,KNL] Same as initrdmem=
 
-	initrdmem=	[KNL,EARLY] Specify a physical address and size from which to
-			load the initrd. If an initrd is compiled in or
+	initrdmem=	[BOOT,EARLY,INITRAMFS,KNL] Specify a physical address and size from which to
+			load initramfs. If initramfs is compiled in or
 			specified in the bootparams, it takes priority over this
 			setting.
 			Format: ss[KMG],nn[KMG]
@@ -2749,7 +2749,7 @@
 			between unregistering the boot console and initializing
 			the real console.
 
-	keepinitrd	[HW,ARM] See retain_initrd.
+	keepinitrd	[HW,ARM,INITRAMFS] See retain_initrd.
 
 	kernelcore=	[KNL,X86,PPC,EARLY]
 			Format: nn[KMGTPE] | nn% | "mirror"
@@ -6129,8 +6129,8 @@
 
 	rdinit=		[KNL]
 			Format: <full_path>
-			Run specified binary instead of /init from the ramdisk,
-			used for early userspace startup. See initrd.
+			Run specified binary instead of /init from initramfs,
+			used for early userspace startup.
 
 	rdrand=		[X86,EARLY]
 			force - Override the decision by the kernel to hide the
@@ -6324,7 +6324,7 @@
 			Useful for devices that are detected asynchronously
 			(e.g. USB and MMC devices).
 
-	retain_initrd	[RAM] Keep initrd memory after extraction. After boot, it will
+	retain_initrd	[INITRAMFS] Keep initramfs memory after extraction. After boot, it will
 			be accessible via /sys/firmware/initrd.
 
 	retbleed=	[X86] Control mitigation of RETBleed (Arbitrary
-- 
2.47.2


