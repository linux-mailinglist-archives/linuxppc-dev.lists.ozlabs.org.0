Return-Path: <linuxppc-dev+bounces-12156-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC8FB566CF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Sep 2025 06:38:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cPb5q0v0rz3cZN;
	Sun, 14 Sep 2025 14:38:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757822521;
	cv=none; b=ix/F89JP+I1KWiKK5Kc8vbcG6ethyuuqES98nomEA67dUivhC7GsGWl0tzETs+tPmK18yY9ZO94TG83hSf7QrwbAPUFAVnFiu1JUeJmtDRGilEuN2RHB+WVJXweWCCawFF5VcmeR/t3AgMILiuC+VCsIXRFkB9TBbIarM06kkLA1BlzLglD3D7NR46NePDPlWV8aYjN1D6KrwX7dkmNhgsCxid9ltGEJ1zSSE+0Vrld3F36zV6Pn8IyTNiF7D947R0xOmxzKvFWc6WnYLRw1ZOVsjtNuc7OtIfD38VFfdoGZeoJfrtAfOVLmvJDjcjrZjWR8WjGmuKNnTDmS/f7sdw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757822521; c=relaxed/relaxed;
	bh=fGq2rj18j5nvFWvHRh616vM6JteMHLrszS02ds4tBLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ceVlDSFVGBkmTnudfz/RHF6svmWepBabvw/Sl8pfGkOBAVaQzoN6t7N7N27ESghSpxCijZiHQ8auFVNTj8M/w3bkt7pWuZtEInpmAiVgbOhkpreOr+R5+WxX6XAvkGda11C1AfkRzcd0+SlkP71nB6Py5+gQeDRkeBOmZAs88tdytGUSLHAl5WnyxPYUshu/9tSkOYiX7KYnyFnQKiSGYInzXpIqopyM9/XX1xFn1hnRRnxguquZS0CIYCa4WXKLPr4aaNK0rNSRmCAz8KrFWBr7DLtOUADijzT8uxj/MlsI7QBJ3uy1OEo1K/IK7kDqDyzqmfuwNTfXzAs7JylQjg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kz91l2Ui; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kz91l2Ui;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cPZHD2lZsz2yrm
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Sep 2025 14:02:00 +1000 (AEST)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-62f1987d44fso907681a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 21:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822517; x=1758427317; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGq2rj18j5nvFWvHRh616vM6JteMHLrszS02ds4tBLs=;
        b=kz91l2Ui7E7mSZUi76EpaWOciVWvqeeIC/00KofgRh1PTbQuo3cUN30fOLHur9xjes
         NxDd8txoW8LQO1fNykdvyRuefXRrQM0as8TJhQiPqxabNvrmS4ehN/MkWk+ToPPGEN4q
         95jpVdAI/a6XcOEsrfWZKEzIhXiBjUBCngN+5gNhyVDzY97K8dGtseCaZDTmgcxVVhOT
         J99Q408ttdlVBPfu4ILqzedP/k+ZjgrZtSlNJhtWhnhrIpm8pMhueH0BZrWouMaAlw6D
         RY5oB6BxdL/ad7BS1o1O/XQ8ETT2NnGm5fJGavWHxREUyE6zAdHuZ0bsmrDLnMkVRKDH
         A6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822517; x=1758427317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fGq2rj18j5nvFWvHRh616vM6JteMHLrszS02ds4tBLs=;
        b=SoCU8AM8N3b2UyUyIxX6d6enJnigUeLmYalgfPqxHZi3f3BNOFTchpXasCWCH8fBL7
         8XiHNznNPVsqcKDC/F0fI5W2BDkn/0z31Fm2IJev1hKTPTzXrhoA8pfBOvu8bRfK96RW
         YLcXjXv4JWbrXFeHXkIUTJN+BmbZRCSLbe7PFBKKEBXF10B62GCQcn7VT147H44BQkdS
         MytOH693zyCG1kQ5gSe5FdGpD6qPDzwgk2sYJCbum8PL1NvtnrJTY4y+iFXr8mnq1zWx
         UqbDphHhK3IPTRwnLv0NLXjkZHsDYoEG4XFQh7vxuA9CE0L4/ISmq0F6o95rhtXsp/od
         Wi6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXNP4yzZc36xQ0MT87nO1gmI8ThnH2H1+6LxeZy9cEBI06yTC9ZJHa97pK+ZJMhhGmZ8kCoidG5VLScF+c=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz2lNcVgq5TBb/D8thA6lmiIDBfAhSeW5FQ2G1bukSnKTOBHaL3
	XvUyeKUext4EjAsrjn2NYcqrOd4zmJDP2UeHCv7K4A/NzFvTqpP1k1XL
X-Gm-Gg: ASbGnctyu9dbuVfUfQCibha3UGZe7NR/kY1DnzsqnPH39HLhW74zNtICx+sCNrj4MTc
	dI5H3TXvlDOxPqf+7qR2AMAOg8XYb5vzp9QD3Zd4J4qFtrE10usKRzrbWLGWVMzJ8XVo/EfdyW8
	LhQgvwjjKMcE1de3nGZhiZj6Woya2W6CaukCq3pFStIRq0uNbSCMIN9w3jV0nQqKFItZeAdZU5Q
	93MzfWu1wo26iPSluu7TmfnKWPk9uHl3aN0aGftz73j9QQMJ0SExDCY+gDCQ+ngLB9WwskmMz0W
	fT1CXRtRmpLF99BPnh3TRF3OcPiQdfYETVdZm73RSCJ3m68tsCZ7TYyAVy/dFXgiuL2uubSf8Kk
	2EBrqNUStKZD632ZDuxY=
X-Google-Smtp-Source: AGHT+IHGppk9Eg00mRFWKY3oyWZDORImAaUMiStm5q/vVvxsBauDUIDKfxmQ2agdiwYo6nbnpX+hpA==
X-Received: by 2002:a05:6402:3587:b0:62f:2ac2:af41 with SMTP id 4fb4d7f45d1cf-62f2ac2b11amr1102107a12.38.1757822517371;
        Sat, 13 Sep 2025 21:01:57 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62ec2e661a5sm6322050a12.0.2025.09.13.21.01.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 21:01:56 -0700 (PDT)
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
Subject: [PATCH RESEND 57/62] init: rename CONFIG_RD_BZIP2 to CONFIG_INITRAMFS_DECOMPRESS_BZIP2
Date: Sun, 14 Sep 2025 07:01:51 +0300
Message-ID: <20250914040151.3805905-1-safinaskar@gmail.com>
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

Initrd support was removed,
and CONFIG_RD_BZIP2 has nothing to do with ramdisks.

Update your configs

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 arch/arm/configs/aspeed_g4_defconfig       | 2 +-
 arch/arm/configs/aspeed_g5_defconfig       | 2 +-
 arch/arm/configs/lpc18xx_defconfig         | 2 +-
 arch/arm/configs/sp7021_defconfig          | 2 +-
 arch/arm/configs/vf610m4_defconfig         | 2 +-
 arch/mips/configs/ath25_defconfig          | 2 +-
 arch/mips/configs/bmips_stb_defconfig      | 2 +-
 arch/openrisc/configs/simple_smp_defconfig | 2 +-
 arch/powerpc/configs/skiroot_defconfig     | 2 +-
 arch/riscv/configs/nommu_k210_defconfig    | 2 +-
 arch/riscv/configs/nommu_virt_defconfig    | 2 +-
 arch/sh/configs/sdk7786_defconfig          | 2 +-
 arch/xtensa/configs/cadence_csp_defconfig  | 2 +-
 arch/xtensa/configs/nommu_kc705_defconfig  | 2 +-
 usr/Kconfig                                | 4 ++--
 15 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm/configs/aspeed_g4_defconfig b/arch/arm/configs/aspeed_g4_defconfig
index f2abada5036a..af891a2b2d6c 100644
--- a/arch/arm/configs/aspeed_g4_defconfig
+++ b/arch/arm/configs/aspeed_g4_defconfig
@@ -9,7 +9,7 @@ CONFIG_LOG_BUF_SHIFT=16
 CONFIG_CGROUPS=y
 CONFIG_NAMESPACES=y
 CONFIG_INITRAMFS=y
-# CONFIG_RD_BZIP2 is not set
+# CONFIG_INITRAMFS_DECOMPRESS_BZIP2 is not set
 # CONFIG_RD_LZO is not set
 # CONFIG_RD_LZ4 is not set
 CONFIG_EXPERT=y
diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index 7098a09fefb8..a16aed0abcaa 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -9,7 +9,7 @@ CONFIG_LOG_BUF_SHIFT=16
 CONFIG_CGROUPS=y
 CONFIG_NAMESPACES=y
 CONFIG_INITRAMFS=y
-# CONFIG_RD_BZIP2 is not set
+# CONFIG_INITRAMFS_DECOMPRESS_BZIP2 is not set
 # CONFIG_RD_LZO is not set
 # CONFIG_RD_LZ4 is not set
 CONFIG_EXPERT=y
diff --git a/arch/arm/configs/lpc18xx_defconfig b/arch/arm/configs/lpc18xx_defconfig
index c8f7fa140225..abde171f1742 100644
--- a/arch/arm/configs/lpc18xx_defconfig
+++ b/arch/arm/configs/lpc18xx_defconfig
@@ -1,7 +1,7 @@
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
 CONFIG_INITRAMFS=y
-# CONFIG_RD_BZIP2 is not set
+# CONFIG_INITRAMFS_DECOMPRESS_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_XZ is not set
 # CONFIG_RD_LZO is not set
diff --git a/arch/arm/configs/sp7021_defconfig b/arch/arm/configs/sp7021_defconfig
index 30cfafc49ec9..4f5cd0d0511d 100644
--- a/arch/arm/configs/sp7021_defconfig
+++ b/arch/arm/configs/sp7021_defconfig
@@ -6,7 +6,7 @@ CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
-# CONFIG_RD_BZIP2 is not set
+# CONFIG_INITRAMFS_DECOMPRESS_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_XZ is not set
 # CONFIG_RD_LZO is not set
diff --git a/arch/arm/configs/vf610m4_defconfig b/arch/arm/configs/vf610m4_defconfig
index b253d76e0d40..9e6175467998 100644
--- a/arch/arm/configs/vf610m4_defconfig
+++ b/arch/arm/configs/vf610m4_defconfig
@@ -1,6 +1,6 @@
 CONFIG_NAMESPACES=y
 CONFIG_INITRAMFS=y
-# CONFIG_RD_BZIP2 is not set
+# CONFIG_INITRAMFS_DECOMPRESS_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_XZ is not set
 # CONFIG_RD_LZ4 is not set
diff --git a/arch/mips/configs/ath25_defconfig b/arch/mips/configs/ath25_defconfig
index 58ae5f9726a0..7c1ec18b0eeb 100644
--- a/arch/mips/configs/ath25_defconfig
+++ b/arch/mips/configs/ath25_defconfig
@@ -4,7 +4,7 @@ CONFIG_SYSVIPC=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_INITRAMFS=y
 # CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
-# CONFIG_RD_BZIP2 is not set
+# CONFIG_INITRAMFS_DECOMPRESS_BZIP2 is not set
 # CONFIG_RD_XZ is not set
 # CONFIG_RD_LZO is not set
 # CONFIG_RD_LZ4 is not set
diff --git a/arch/mips/configs/bmips_stb_defconfig b/arch/mips/configs/bmips_stb_defconfig
index 2217a3ca5b72..6ccb53279345 100644
--- a/arch/mips/configs/bmips_stb_defconfig
+++ b/arch/mips/configs/bmips_stb_defconfig
@@ -15,7 +15,7 @@ CONFIG_NR_CPUS=4
 # CONFIG_SECCOMP is not set
 CONFIG_MIPS_O32_FP64_SUPPORT=y
 # CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
-# CONFIG_RD_BZIP2 is not set
+# CONFIG_INITRAMFS_DECOMPRESS_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 CONFIG_RD_XZ=y
 # CONFIG_RD_LZO is not set
diff --git a/arch/openrisc/configs/simple_smp_defconfig b/arch/openrisc/configs/simple_smp_defconfig
index e4aaaeaec7a8..ba6f06c29fed 100644
--- a/arch/openrisc/configs/simple_smp_defconfig
+++ b/arch/openrisc/configs/simple_smp_defconfig
@@ -3,7 +3,7 @@ CONFIG_NO_HZ=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_INITRAMFS=y
 # CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
-# CONFIG_RD_BZIP2 is not set
+# CONFIG_INITRAMFS_DECOMPRESS_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_XZ is not set
 # CONFIG_RD_LZO is not set
diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
index 9a6ef1d8ca44..a5b30aba9ac1 100644
--- a/arch/powerpc/configs/skiroot_defconfig
+++ b/arch/powerpc/configs/skiroot_defconfig
@@ -11,7 +11,7 @@ CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=20
 CONFIG_INITRAMFS=y
 # CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
-# CONFIG_RD_BZIP2 is not set
+# CONFIG_INITRAMFS_DECOMPRESS_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_LZO is not set
 # CONFIG_RD_LZ4 is not set
diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
index a1fa77563bb8..bc0df803ecaa 100644
--- a/arch/riscv/configs/nommu_k210_defconfig
+++ b/arch/riscv/configs/nommu_k210_defconfig
@@ -2,7 +2,7 @@
 CONFIG_LOG_BUF_SHIFT=13
 CONFIG_INITRAMFS=y
 # CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
-# CONFIG_RD_BZIP2 is not set
+# CONFIG_INITRAMFS_DECOMPRESS_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_XZ is not set
 # CONFIG_RD_LZO is not set
diff --git a/arch/riscv/configs/nommu_virt_defconfig b/arch/riscv/configs/nommu_virt_defconfig
index d777e4a774bd..1291e21b7ce5 100644
--- a/arch/riscv/configs/nommu_virt_defconfig
+++ b/arch/riscv/configs/nommu_virt_defconfig
@@ -1,7 +1,7 @@
 # CONFIG_CPU_ISOLATION is not set
 CONFIG_LOG_BUF_SHIFT=16
 CONFIG_INITRAMFS=y
-# CONFIG_RD_BZIP2 is not set
+# CONFIG_INITRAMFS_DECOMPRESS_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_XZ is not set
 # CONFIG_RD_LZO is not set
diff --git a/arch/sh/configs/sdk7786_defconfig b/arch/sh/configs/sdk7786_defconfig
index dd0ef63a0064..2c339b2111fe 100644
--- a/arch/sh/configs/sdk7786_defconfig
+++ b/arch/sh/configs/sdk7786_defconfig
@@ -27,7 +27,7 @@ CONFIG_USER_NS=y
 CONFIG_PID_NS=y
 CONFIG_NET_NS=y
 CONFIG_INITRAMFS=y
-CONFIG_RD_BZIP2=y
+CONFIG_INITRAMFS_DECOMPRESS_BZIP2=y
 CONFIG_RD_LZMA=y
 CONFIG_RD_LZO=y
 # CONFIG_COMPAT_BRK is not set
diff --git a/arch/xtensa/configs/cadence_csp_defconfig b/arch/xtensa/configs/cadence_csp_defconfig
index 788274247b03..06d82e725e64 100644
--- a/arch/xtensa/configs/cadence_csp_defconfig
+++ b/arch/xtensa/configs/cadence_csp_defconfig
@@ -14,7 +14,7 @@ CONFIG_SCHED_AUTOGROUP=y
 CONFIG_RELAY=y
 CONFIG_INITRAMFS=y
 CONFIG_INITRAMFS_SOURCE="$$KERNEL_INITRAMFS_SOURCE"
-# CONFIG_RD_BZIP2 is not set
+# CONFIG_INITRAMFS_DECOMPRESS_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_XZ is not set
 # CONFIG_RD_LZO is not set
diff --git a/arch/xtensa/configs/nommu_kc705_defconfig b/arch/xtensa/configs/nommu_kc705_defconfig
index 5050b3e5e1be..cde2ae3ca4b1 100644
--- a/arch/xtensa/configs/nommu_kc705_defconfig
+++ b/arch/xtensa/configs/nommu_kc705_defconfig
@@ -15,7 +15,7 @@ CONFIG_NAMESPACES=y
 CONFIG_SCHED_AUTOGROUP=y
 CONFIG_RELAY=y
 CONFIG_INITRAMFS=y
-# CONFIG_RD_BZIP2 is not set
+# CONFIG_INITRAMFS_DECOMPRESS_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_XZ is not set
 # CONFIG_RD_LZO is not set
diff --git a/usr/Kconfig b/usr/Kconfig
index cf3c7539e3dc..325c2d95eb74 100644
--- a/usr/Kconfig
+++ b/usr/Kconfig
@@ -60,7 +60,7 @@ config INITRAMFS_DECOMPRESS_GZIP
 	  Support loading of a gzip encoded initial ramfs.
 	  If unsure, say Y.
 
-config RD_BZIP2
+config INITRAMFS_DECOMPRESS_BZIP2
 	bool "Support initial ramfs compressed using bzip2"
 	default y
 	select DECOMPRESS_BZIP2
@@ -144,7 +144,7 @@ config INITRAMFS_COMPRESSION_GZIP
 
 config INITRAMFS_COMPRESSION_BZIP2
 	bool "Bzip2"
-	depends on RD_BZIP2
+	depends on INITRAMFS_DECOMPRESS_BZIP2
 	help
 	  It's compression ratio and speed is intermediate. Decompression speed
 	  is slowest among the choices. The initramfs size is about 10% smaller
-- 
2.47.2


