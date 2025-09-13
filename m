Return-Path: <linuxppc-dev+bounces-12121-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3DCB55E03
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Sep 2025 05:17:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNxL46jfTz3cgQ;
	Sat, 13 Sep 2025 13:17:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757725053;
	cv=none; b=NGaVAlfEzfWVLD4rvRsmQCMFHdXrWP7XgFapYXPNibGFfa5K9dEispWXaDSPOTmTLfBLGfpcpP2yLbW6vczq78wzCNaBuNbCo2yB5fMIpTC/cQlVNBbUwpOwwv5G5WYwhkF9RR/CJRTlAhpFu5YYrAp5AUZWVqVbECWcVab7mkcq3rQ3mXX9n/h4PiEoHqruXGcEzQtc8UmomvsKIhdk6qY+8yvLj+FnCU5y3FctTLm05AzOgbm3nLbjAC2xEfnDcFGK1xunnNw7BO/dD8o3tLczD51XAhLDpOgJI4mfDslGh8Bqmutk+Op1afZGaiu+T3WpzrWOlLBweV/3XeVfZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757725053; c=relaxed/relaxed;
	bh=ezI+jX/C/Y112e/n5Rz3xR2Z7MqtqGJhurNzHRBUkc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zd0SXIkfW0fUXkV28ILvOwV0LcCIeqqOKkq6LDsJuwhk72WFG9XF2KNIMfgmz90j9cSdZk+rN0gdwJuafXUAo8FyEqbXaXnL6cQx3r2dEN7vtR8j2KKlzAVJKrZo8Vl8q+u8eea/3/tSv5Dr4mSItQe5vlQq98RlPmkAh/M5/MX0RDgJRH7n6WhFndg8xo4ZP3QMEROEGhoh5YlUR92YbbG10a1dcI7NZBuf8Pm5Ws79FI6oPpuo9+w4vAbeY3IknUBy1Y+g0DO9/CGBnn/ayMSWa7u0By35lKaHJXe3ymb6K4FzNpkiyuKgy70g6XM39qnKT3PfrRImK/RrDRurzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=k7e68TCb; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=k7e68TCb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNtDr52z8z2yrN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 10:57:32 +1000 (AEST)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b042cc39551so392319066b.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 17:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725050; x=1758329850; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezI+jX/C/Y112e/n5Rz3xR2Z7MqtqGJhurNzHRBUkc4=;
        b=k7e68TCb2jfu0p1O2mw4czALlN8L2NeN6DlpiQwhTCuD4Wa73sBhpPfBDp3yrR70CC
         D7ojJ9JMSrV2L67fIMzcz7kTJZ9hkxhT7zrmLFdR7+jfuJh516pBlzCbYPMg8BZ+5QBX
         spDnYkl1hrjMbIzkQH0lGmKbDbdfdCMHEPIrs8bFjf3oOYgV2RlObMYXMLdGwk00MIKa
         NZVEW0ou3H1KNIZFxsa++PIcLJvhBU8rdGFXfwEzePsUKTQGgwIFQ89tZy46pMEwtyk6
         PammDGJDxRQE4HYI5JwPUYWnkohsxVKTBGNL+sK05XOEo4Sy63aKE/shzQAbxVCVHsEP
         6UYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725050; x=1758329850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ezI+jX/C/Y112e/n5Rz3xR2Z7MqtqGJhurNzHRBUkc4=;
        b=Zy3hD5MwMKMd+FB1i1UIR0y/1YJE0w1uUVqVehm9/A1US3Xoeuco5elfI3czMxsjti
         5OqaRPNqeZuA+Qz/u7IlTUqPw3CcCox3wjKZ10+Nr9tzZww+IMoI7SgYY4gGjb3EtWCw
         4QZon+D8C1dAy8f512cYNja4Qn3MSl3uWuFh3ZeQ44f7v6wY5pob5t7+tkp2bLJULhw+
         OfCLbx1pGRwKtaBuUeu8CrmLNwXO3TT+96ZMPspoLOZC7k52BfNKI0TmZk74/4NxO+18
         TEusmmoO4MuC/0WXcQLC76cjWXwDezPs1DzKAQk5L2mbG5tfapTd7THnsaAp2MnmTow4
         jYVw==
X-Forwarded-Encrypted: i=1; AJvYcCUwyCV00KZOEzzeY7EWJD6T41P6ceswY96LSmiXWVtX8Ma9QwqFZo9YplkQkMCIACKlOdvRTI2V7zjbKZg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzgApZdDI6zERC0doUGtiByBjZbRIzJAbY71ZufKZrekJDcTezx
	zNR73TAidPxSSC0yNTSf9AeAasj/HsxT/CQaaQAKP16hhbkYSC2XAnLK
X-Gm-Gg: ASbGncssZwlsRjv+388qhLUZxFaZLbxZRtduaETXqolWlUN5u3+BktEVrLqDhiSh4SO
	kN1crlZt7m8p7CkGQZVavNvE/fhEx4WaoLGGtg1vsQLO1sfwvGAyIu0vJzSit2P+3r/dfFJv9PH
	DeOynTarLgO6Et5XE+3AuJWL5zVuxwe11eUvuUiu4UerVAhFvy7GkZ6W3NglAEy9hPWNifKKEir
	qlEUPcVkIRBOVZDxPDR1gxW3u0zn+f02CkD4gLiJkKi9CLuV6Tx3ZHhLiDDAn0OEjVIVOHlocwF
	A4Ig9qNuygo3xOrjAvlrF8iwE/qvzAAOysp1er6Iy/VVbv1eBjeRC5Dbv59jzuczGLetsN25KNc
	UWyrrqqHwQeCB409PT3kpaGQQ4o8Wcg==
X-Google-Smtp-Source: AGHT+IGnRtXHmAlBOGcWImQD5jsKfQTyCdy3QliDqyqREaJdsFoBMJl1utqd/JT9F2sOVlrjQyooHw==
X-Received: by 2002:a17:907:944b:b0:b04:ad1c:59e4 with SMTP id a640c23a62f3a-b07c35328admr535751966b.12.1757725049282;
        Fri, 12 Sep 2025 17:57:29 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b32dd47bsm478662366b.58.2025.09.12.17.57.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:57:28 -0700 (PDT)
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
Subject: [PATCH RESEND 16/62] brd: remove "ramdisk_size" command line parameter
Date: Sat, 13 Sep 2025 00:37:55 +0000
Message-ID: <20250913003842.41944-17-safinaskar@gmail.com>
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

It was used mostly for initrd. It could be used only if
brd is built-in. Use "brd.rd_size" instead

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 .../admin-guide/kernel-parameters.txt         |  3 ---
 Documentation/arch/m68k/kernel-options.rst    | 20 ++-----------------
 arch/arm/configs/s3c6400_defconfig            |  2 +-
 drivers/block/brd.c                           | 10 ----------
 4 files changed, 3 insertions(+), 32 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index ad52e3d26014..e862a7b1d2ec 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5279,9 +5279,6 @@
 	raid=		[HW,RAID]
 			See Documentation/admin-guide/md.rst.
 
-	ramdisk_size=	[RAM] Sizes of RAM disks in kilobytes
-			See Documentation/admin-guide/blockdev/ramdisk.rst.
-
 	random.trust_cpu=off
 			[KNL,EARLY] Disable trusting the use of the CPU's
 			random number generator (if available) to
diff --git a/Documentation/arch/m68k/kernel-options.rst b/Documentation/arch/m68k/kernel-options.rst
index 2008a20b4329..f6469ebeb2c7 100644
--- a/Documentation/arch/m68k/kernel-options.rst
+++ b/Documentation/arch/m68k/kernel-options.rst
@@ -215,27 +215,11 @@ Devices possible for Atari:
            seconds.
 
 
-2.6) ramdisk_size=
-------------------
-
-:Syntax: ramdisk_size=<size>
-
-This option instructs the kernel to set up a ramdisk of the given
-size in KBytes. Do not use this option if the ramdisk contents are
-passed by bootstrap! In this case, the size is selected automatically
-and should not be overwritten.
-
-The only application is for root filesystems on floppy disks, that
-should be loaded into memory. To do that, select the corresponding
-size of the disk as ramdisk size, and set the root device to the disk
-drive (with "root=").
-
-
-2.7) swap=
+2.5) swap=
 
   I can't find any sign of this option in 2.2.6.
 
-2.8) buff=
+2.6) buff=
 -----------
 
   I can't find any sign of this option in 2.2.6.
diff --git a/arch/arm/configs/s3c6400_defconfig b/arch/arm/configs/s3c6400_defconfig
index a37e6ac40825..23635d5b9322 100644
--- a/arch/arm/configs/s3c6400_defconfig
+++ b/arch/arm/configs/s3c6400_defconfig
@@ -4,7 +4,7 @@ CONFIG_ARCH_MULTI_V6=y
 # CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_S3C64XX=y
 CONFIG_MACH_WLF_CRAGG_6410=y
-CONFIG_CMDLINE="console=ttySAC0,115200 root=/dev/ram init=/linuxrc initrd=0x51000000,6M ramdisk_size=6144"
+CONFIG_CMDLINE="console=ttySAC0,115200 root=/dev/ram init=/linuxrc initrd=0x51000000,6M"
 CONFIG_VFP=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
diff --git a/drivers/block/brd.c b/drivers/block/brd.c
index 72f02d2b8a99..05c4325904d2 100644
--- a/drivers/block/brd.c
+++ b/drivers/block/brd.c
@@ -222,16 +222,6 @@ MODULE_LICENSE("GPL");
 MODULE_ALIAS_BLOCKDEV_MAJOR(RAMDISK_MAJOR);
 MODULE_ALIAS("rd");
 
-#ifndef MODULE
-/* Legacy boot options - nonmodular */
-static int __init ramdisk_size(char *str)
-{
-	rd_size = simple_strtol(str, NULL, 0);
-	return 1;
-}
-__setup("ramdisk_size=", ramdisk_size);
-#endif
-
 /*
  * The device scheme is derived from loop.c. Keep them in synch where possible
  * (should share code eventually).
-- 
2.47.2


