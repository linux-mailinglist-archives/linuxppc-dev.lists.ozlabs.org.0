Return-Path: <linuxppc-dev+bounces-12135-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 745EEB55E11
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Sep 2025 05:19:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNxN3496Qz3dXZ;
	Sat, 13 Sep 2025 13:18:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757724136;
	cv=none; b=diGotLtSpGRCE0ThcsupThMxlPPyZfG7W0z91+IUBM3DM7SXAtSxZae169YTd+uScLth6J992OZU+fTYWZ0SzcE2LN1qQUecc5zsItQ9VB5j1aVcPT93/wUWqqsVals7IjnDYQU6NWyHeKaOJRBME/7dL5aPO6Zy5Ay3jnr8AVf7kOqrT1G5KZG5GzgxwXMZGymtMzMsRjm1EE8AERawngPtAthK6Gp3K47nB9EkgozxuBF8w4WOzahiZp2MwyDM/xGsqwSchWXlnuyLg4FqOFs1AFaDgIfq9hp3EHWAzMB0/JTm/n8QpqHhm4Rf4NA0jnFBEkChR/1xQZrCK5YqqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757724136; c=relaxed/relaxed;
	bh=Iq4EBZrV1lfKd4Zb7NXCMDMChiW0nY1yh2iMeYqfP7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CBIRoQ/gfhBevOSG78EvFS6xXGREJ6GFWwg+lCTS2k+T5BMK3lG6An08Qi4j5bEI8beC/o6hMeI5t8bkwBYPjUvoJVm6AKr1xXLZRxNMxhNsf7F1lNBofCs8pfuZptcwaifuIpNGKJ1wZieoQm+VBvDW29tgER+sMm66mlEC2+daFYFPd/Kee641bO+kS3n+B9ahuVaUdMiSUHC79bzu2hatgPIMAAW8VACLpabCf9USgLKjd6/n/qiCQB4Uur1zS7Kw73fpon+baEvfr60bJVt0UH2aOl4U+lyTusk7Z8/wU/D6hUtNUQNEyeaHkZAy+3cRTEZUORf6AMVz1KB3cw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WiMfR2ne; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WiMfR2ne;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNsvC3Zzpz2yrN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 10:42:15 +1000 (AEST)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-620724883e6so4832126a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 17:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757724133; x=1758328933; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iq4EBZrV1lfKd4Zb7NXCMDMChiW0nY1yh2iMeYqfP7Y=;
        b=WiMfR2necxK/RZg7uHFx6KcG9MoVDyoW0Q+z2eyAOMDjmdahzgOfUGuFt/+7lz0mfP
         SovFwXCaF+4TYTHv4Xc1lCdtjIGYwmFHrFZXepazXgd0ILY/ZuKANASS3B7z5wcI5zKX
         MlAEDgungH+2EyRwKVDCSRq7Ums1PS16qzoUn4w8u31LvJBJRX35oJiBXR/XdyF02eXh
         Od6SWcKgsIHRd006zzz6WYMpuq5xHrFc7kRgy3bDJfMzswdE+Hf421tA+dD879Vwi5h/
         T0wOjpEBo0RabHIxIQwMhsJ/pjTb/18G4qdvzz+k1uAUzqFlhsluSDcGBaco34qJ0FVU
         K2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757724133; x=1758328933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iq4EBZrV1lfKd4Zb7NXCMDMChiW0nY1yh2iMeYqfP7Y=;
        b=rpi6LjWR3VjzWAqCK3iX1mnudRT1Vf8pToKnsMILzOGD9UEGCnUzX+aYHK5g6GDCre
         abpwDmzM2q/tlpmifBId7yBW3XGKH8QucMZQxj+9XRjnxLlwzFyCVjUW9r6qlpVKvwfu
         avosjdfzgucEz1GSzLKTlPkWgH5CJ1I2ym+XpVPUqTC+NDIpryg0KAmK5Ci++GOJtep3
         vxhRmWVKooImRRpQYkOUkZ6fiJUC7ylknrvB69LMrWO4FGPoGDLNYwKxq/7tKP/Wq05l
         GLoATy6TW9uCH3RlCNYFT3pFgbDPvYeAixytngmcI9xUygorRF/p2nlkTW4FCCIIZK91
         62mg==
X-Forwarded-Encrypted: i=1; AJvYcCXyNhwWJdHSJ1qahsOvofUp6WFFRVtwDLkoQCe2/jZMFr9fXMCHt3EmJ0joe4SXIzzuynbL6rzf6gU3Kr4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwPpXKvWKDfOvsT2Yxfckm+dten1/lbgS3tWSyqF+Lii7SWlsCj
	b0HoQWEX8U5stWcBrcJZXuVUbtPRrNBY/T6RoAw4L0dk636rMNuhGHQk
X-Gm-Gg: ASbGncsXN8lp8t1Q1UbaiV2t+DIqzAVG1loe9cCjzpjumsWrXtxMIgIw6ng3FMFIldx
	/4oWr4yrDz9yBQy74w7YNbybra0SlL0L/bigpi4atFlE+w5UmX3Z42odLexBZtj+7e9oMA0UDCX
	T4mdhOUbs9ekUTGAlEA8ioPwVEuZGTZIZzvNno+YHtP3yiuDTb9Hw8TQqx51nbMMdEfrvzYiTSI
	tQcLirf4VHqg1VR7jcMORRWOx/QgqkRGHEDlXFo1hI07gFxt5/h+h7uxNzp9dWhUmoWMIXBj4nB
	x1wr24nNAQX8/Y3fqO3PCe4MogiPDLXKKJ6sSdawh3T/JWI+s17YLS4NjOHT8IomHc8UzbN78/y
	n2La1CtNmQQLznot+4DM=
X-Google-Smtp-Source: AGHT+IF0YGOwgI/SiDLzLobCRbGCMEuk6UiMOqwXQtTxtsbaeH+eIG/iAAo9vQw+zhuCea49+yp7bA==
X-Received: by 2002:a17:907:2d2b:b0:afe:8761:e77a with SMTP id a640c23a62f3a-b07c35833dfmr474345066b.19.1757724132448;
        Fri, 12 Sep 2025 17:42:12 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b3128a5csm466901366b.37.2025.09.12.17.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:42:12 -0700 (PDT)
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
Subject: [PATCH RESEND 02/62] init: remove deprecated "prompt_ramdisk" command line parameter, which does nothing
Date: Sat, 13 Sep 2025 00:37:41 +0000
Message-ID: <20250913003842.41944-3-safinaskar@gmail.com>
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
 Documentation/admin-guide/kernel-parameters.txt | 2 --
 arch/arm/configs/neponset_defconfig             | 2 +-
 init/do_mounts_rd.c                             | 7 -------
 3 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index d3b05ce249ff..f940c1184912 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5229,8 +5229,6 @@
 			Param: <number> - step/bucket size as a power of 2 for
 				statistical time based profiling.
 
-	prompt_ramdisk=	[RAM] [Deprecated]
-
 	prot_virt=	[S390] enable hosting protected virtual machines
 			isolated from the hypervisor (if hardware supports
 			that). If enabled, the default kernel base address
diff --git a/arch/arm/configs/neponset_defconfig b/arch/arm/configs/neponset_defconfig
index 16f7300239da..4d720001c12e 100644
--- a/arch/arm/configs/neponset_defconfig
+++ b/arch/arm/configs/neponset_defconfig
@@ -9,7 +9,7 @@ CONFIG_ASSABET_NEPONSET=y
 CONFIG_ZBOOT_ROM_TEXT=0x80000
 CONFIG_ZBOOT_ROM_BSS=0xc1000000
 CONFIG_ZBOOT_ROM=y
-CONFIG_CMDLINE="console=ttySA0,38400n8 cpufreq=221200 rw root=/dev/mtdblock2 mtdparts=sa1100:512K(boot),1M(kernel),2560K(initrd),4M(root) prompt_ramdisk=0 mem=32M noinitrd initrd=0xc0800000,3M"
+CONFIG_CMDLINE="console=ttySA0,38400n8 cpufreq=221200 rw root=/dev/mtdblock2 mtdparts=sa1100:512K(boot),1M(kernel),2560K(initrd),4M(root) mem=32M noinitrd initrd=0xc0800000,3M"
 CONFIG_FPE_NWFPE=y
 CONFIG_PM=y
 CONFIG_MODULES=y
diff --git a/init/do_mounts_rd.c b/init/do_mounts_rd.c
index ac021ae6e6fa..f7d53bc21e41 100644
--- a/init/do_mounts_rd.c
+++ b/init/do_mounts_rd.c
@@ -17,13 +17,6 @@
 static struct file *in_file, *out_file;
 static loff_t in_pos, out_pos;
 
-static int __init prompt_ramdisk(char *str)
-{
-	pr_warn("ignoring the deprecated prompt_ramdisk= option\n");
-	return 1;
-}
-__setup("prompt_ramdisk=", prompt_ramdisk);
-
 int __initdata rd_image_start;		/* starting block # of image */
 
 static int __init ramdisk_start_setup(char *str)
-- 
2.47.2


