Return-Path: <linuxppc-dev+bounces-12139-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A256B55E15
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Sep 2025 05:21:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNxQb298kz3ckN;
	Sat, 13 Sep 2025 13:21:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=136.143.188.95 arc.chain=zohomail.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757717086;
	cv=pass; b=huKMY7/SQ9JjGLD0AGmf4fkIF2QQ+P46X/VtJIjUbhgcCbrIJa/WxpzmZ26rWN5B8b5lyO1EYnfs0f0FQqNnujKp5G41bE2wWvOvzoLuaU3KqmLIvfc17QuBUxp76YKINH1dL3iwnCZ0IR0atKBKPD4DQA3P1ZP7dvITsjxg2lNuP+d17gKw8cDuLwN7cnYv4QIAyT5rqfO8mQ31a6PcR2o4uugX6Yr0ysxH2czAZPME/3eMNMntxb/0t+RwWJQYBPMJXa03OC83dhr5enJhkETruykkD1LBslvOZoDDJiiI3X0VWQnQo+z4JYeyX3AeBHA2L7ME57NP5ldCZ9e3oQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757717086; c=relaxed/relaxed;
	bh=06D4xOw6vQ3KB42oskAhV5LNczKCiJW3E5jLeODB68E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q304pyKGq9EOcF5ubOHZqA081M3CjFNdFmo5bTRDXSRBfyqEm2FFuTuF26CZey7CW2k0MCCheXbtejZPUDZ1dAEtvQzByHSxDhkxHHTWBvbt8W47TGAQbWxS/nnCLhVzWEJ+ajSitWXNYbOKS7d6ajJQkTnI7ObI5jPf5HVwDI0xiTSYFDpvg4+a4Nu3iXC6B2kiNxvNDzk/ngps7p4soPgH+PVIf6PhUnLvLivsGWqM+yTPaoMsX0r1alLqeocFgV4goif+r+82397/VcLevaMIbbOvbAMkBRHxuadbuHmhTiXZNErlQoI6gHRyOC6VOcX38HXNwpCj39vTg8gLOg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; dkim=pass (1024-bit key; unprotected) header.d=zohomail.com header.i=safinaskar@zohomail.com header.a=rsa-sha256 header.s=zm2022 header.b=H76IZjXx; dkim-atps=neutral; spf=pass (client-ip=136.143.188.95; helo=sender4-pp-o95.zoho.com; envelope-from=safinaskar@zohomail.com; receiver=lists.ozlabs.org) smtp.mailfrom=zohomail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zohomail.com header.i=safinaskar@zohomail.com header.a=rsa-sha256 header.s=zm2022 header.b=H76IZjXx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zohomail.com (client-ip=136.143.188.95; helo=sender4-pp-o95.zoho.com; envelope-from=safinaskar@zohomail.com; receiver=lists.ozlabs.org)
Received: from sender4-pp-o95.zoho.com (sender4-pp-o95.zoho.com [136.143.188.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNqHd1gFlz2xnr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 08:44:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1757716867; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ndn2Z8a3SDSKS+4kTHXRcb3N4/LdylXuGvzx4c28cN4oloBA7/mmBtA/D1g5YLX3tA/x+NzHXLbsg9SpOAFs/mXEppquRpTx5XmXgzZPOpZTLMhT3+WvvMLqeTGdpxuz3ZNGDhL0hxik7zI2HdYKOJsbCelhbdoVCgOhStWsz5w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757716867; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=06D4xOw6vQ3KB42oskAhV5LNczKCiJW3E5jLeODB68E=; 
	b=mH0OdEP+8glg5yz9sALXY3gmTNUTIdUAY8BV7mXW6yswVZwwt9cYiYDo9ESO6I6qEiyj49CiAITMwDVZbaAlqWwp+TjvliYVe4sfEYykV0peW1ZQ34dY36WYLSz3oDe9agLx4fRBKKQvkEwKqsT31gr35VDcGQTtgoRdmoUwI6U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=safinaskar@zohomail.com;
	dmarc=pass header.from=<safinaskar@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757716867;
	s=zm2022; d=zohomail.com; i=safinaskar@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=06D4xOw6vQ3KB42oskAhV5LNczKCiJW3E5jLeODB68E=;
	b=H76IZjXxKzHcaO61MC5mUvXa9vcEm4/KEBvaVdt8amCtKLP09DrEHAXVNO5oNsc3
	7gPoCC7xL41RFYvZ+Ociq2lPhKRUN3F6sHGDPCRxxh3w523SyqqbQQYJLkuVjpIzcbA
	8GEh5pfvxkuBeSHIjwRFF8UuzEdjsqSXC3nmvVgk=
Received: by mx.zohomail.com with SMTPS id 1757716865526674.5594283397235;
	Fri, 12 Sep 2025 15:41:05 -0700 (PDT)
From: Askar Safin <safinaskar@zohomail.com>
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
Subject: [PATCH 02/62] init: remove deprecated "prompt_ramdisk" command line parameter, which does nothing
Date: Fri, 12 Sep 2025 22:38:37 +0000
Message-ID: <20250912223937.3735076-3-safinaskar@zohomail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250912223937.3735076-1-safinaskar@zohomail.com>
References: <20250912223937.3735076-1-safinaskar@zohomail.com>
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
Feedback-ID: rr08011227193e59542dd9f505fa391c9f00000f0706a9cbd22502a3cce0c3d0602ad045b54fc46916c6db2b:zu08011227c1468c513514c5d8768cbcc5000096aaceab903bfdc5a1a7fa3d9acdd3d6733829806c96cd5a3d:rf0801122c37aef85d4cb37fa8db0bf1370000bcf9ac991f815639329c52d47b31d2983fa609b068d95033b55c83eee375:ZohoMail
X-ZohoMailClient: External
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This is preparation for initrd removal

Signed-off-by: Askar Safin <safinaskar@zohomail.com>
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


