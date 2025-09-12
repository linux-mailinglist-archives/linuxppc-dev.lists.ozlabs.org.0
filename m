Return-Path: <linuxppc-dev+bounces-12140-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC26B55E16
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Sep 2025 05:21:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNxQx3lv1z3clq;
	Sat, 13 Sep 2025 13:21:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=136.143.188.95 arc.chain=zohomail.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757717015;
	cv=pass; b=kyenCjopFson1NovFodpBixo+KtG3kwX64Mo9e2yL9XARpXvfBF8qZ7CZxSAX0LrsWlVLN6e2IV3W8BlJ6nqF3rvH8EIpKiZk5bOu18gtr1alec+mLRuQEWpe56H5Qhz8eMPwBrC6fsXtbioJn09p6wlu31bP+6lEFhHb+d2WRwMTvN38MZVFoKwqLhQo0xBdJTWH4Z0+91D3rQLvuYf4ql2H4t1YfLIYofBOwqtvd0kySb5s/Ms7cx+0gRf3KfA8i7k8YwV8adj9aZTeUtLm/5WACGTEakpurIBu7uerXAkGRxOL/56Nq7r9byeVjtpDGrLN0d5bmjmQEQtJDx2Uw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757717015; c=relaxed/relaxed;
	bh=SYQdtnldOj5iXBTtfoBoCGBeYnnDL0Qn954gCAYQljw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SDo+DCcUrHAmDVygQKBwzNbDeKwWtrUjfOM7uS8KGCjcAwDUD3FTySAGm7uZaYV2RKzrRSORa6dr5qkrEb+YJQJ97+5lESOItuAtpGHyvTUo+9AYJV9e0V8oRhyDrJ8Eaxo7hOHdKf6V2qq7YcDvsLXrR2/f5D5oRk78rzKmt7XekCpMbUXBAnGMtVyM4KARxszdnhepvWqp0/b7MSn9adje2RC/CGUG4gJs0eYstfGf1qstZ+rNnlxDIcU/p63HTbE0Vb2/FbUnc9wIQChiXzz3kgN3QwgY8TtDAELhs2igeilL+EEaxtz8lO//vla+dCUSpf4LyxpK+mQH2qrqDg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; dkim=pass (1024-bit key; unprotected) header.d=zohomail.com header.i=safinaskar@zohomail.com header.a=rsa-sha256 header.s=zm2022 header.b=A3GYAw/Z; dkim-atps=neutral; spf=pass (client-ip=136.143.188.95; helo=sender4-pp-o95.zoho.com; envelope-from=safinaskar@zohomail.com; receiver=lists.ozlabs.org) smtp.mailfrom=zohomail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zohomail.com header.i=safinaskar@zohomail.com header.a=rsa-sha256 header.s=zm2022 header.b=A3GYAw/Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zohomail.com (client-ip=136.143.188.95; helo=sender4-pp-o95.zoho.com; envelope-from=safinaskar@zohomail.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 80 seconds by postgrey-1.37 at boromir; Sat, 13 Sep 2025 08:43:34 AEST
Received: from sender4-pp-o95.zoho.com (sender4-pp-o95.zoho.com [136.143.188.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNqGG39wgz2xnr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 08:43:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1757716851; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=D/MbJkF6AKfvpv0KL6fUxAFccpOhKdTbd8tMJBVU0KluuFdJoz4DAHQskLiuCD6jemVKBiLyxr7txdQPlkWZPDa0QtvV+d0miqL1m2sAfZFpE9OBTIFjInQdUyiSqAG9spF+KW+IC+0XwaAWfdeOFJt0clbMI6LGdYT8wT0QIQw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757716851; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SYQdtnldOj5iXBTtfoBoCGBeYnnDL0Qn954gCAYQljw=; 
	b=iiaIGMolvqMVa2ZoIN+a0+HOKshhObLXpBRbawH2sXZ+e4hLHYJIjFKNkjVjMy15B297x3UZaXQRUv1GjAxpLGKeFph+jdJoOqUT92ZBEiCPj8zAem55Ab/u6rl/NGy+riwfElUsXLx/pooWVgA/Igjoj8ix+ZQhPrV+d7C6WHI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=safinaskar@zohomail.com;
	dmarc=pass header.from=<safinaskar@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757716851;
	s=zm2022; d=zohomail.com; i=safinaskar@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=SYQdtnldOj5iXBTtfoBoCGBeYnnDL0Qn954gCAYQljw=;
	b=A3GYAw/ZcLeXiPs5c9a4Kkhl99J7rRYEGNqnJyqhr5vDfGmnDpP0pmrxeAG/VPDL
	E/qJq2zYgALVxkA82lIxgCUaNsztP/B+ROtM2apTYe4/NCfVYxJGb0VT5iRYMAEDqY4
	zW4owjqeotGVu4e4gXxuCL736W9X3EQMyrJh/VUw=
Received: by mx.zohomail.com with SMTPS id 1757716849242717.553449294329;
	Fri, 12 Sep 2025 15:40:49 -0700 (PDT)
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
Subject: [PATCH 01/62] init: remove deprecated "load_ramdisk" command line parameter, which does nothing
Date: Fri, 12 Sep 2025 22:38:36 +0000
Message-ID: <20250912223937.3735076-2-safinaskar@zohomail.com>
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
Feedback-ID: rr080112270190de3dd5742b4859dd6fd300005ebcccd4ca6fab5ababf817285cc72b2eaa8b08ebe8935229e:zu0801122760defd381de7d2a61c6dfd0000001473317922e0fc7bf6260a44626f1d9f1d56c51eecea9f9c33:rf0801122c81215cd2ba1d33e7868182610000d14c8fcdc879b9380d9b59a7c5ae3dbfb2890e3fef86e1e712ab0140ed82:ZohoMail
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
 init/do_mounts.c                                | 7 -------
 3 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 747a55abf494..d3b05ce249ff 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3275,8 +3275,6 @@
 			If there are multiple matching configurations changing
 			the same attribute, the last one is used.
 
-	load_ramdisk=	[RAM] [Deprecated]
-
 	lockd.nlm_grace_period=P  [NFS] Assign grace period.
 			Format: <integer>
 
diff --git a/arch/arm/configs/neponset_defconfig b/arch/arm/configs/neponset_defconfig
index 2227f86100ad..16f7300239da 100644
--- a/arch/arm/configs/neponset_defconfig
+++ b/arch/arm/configs/neponset_defconfig
@@ -9,7 +9,7 @@ CONFIG_ASSABET_NEPONSET=y
 CONFIG_ZBOOT_ROM_TEXT=0x80000
 CONFIG_ZBOOT_ROM_BSS=0xc1000000
 CONFIG_ZBOOT_ROM=y
-CONFIG_CMDLINE="console=ttySA0,38400n8 cpufreq=221200 rw root=/dev/mtdblock2 mtdparts=sa1100:512K(boot),1M(kernel),2560K(initrd),4M(root) load_ramdisk=1 prompt_ramdisk=0 mem=32M noinitrd initrd=0xc0800000,3M"
+CONFIG_CMDLINE="console=ttySA0,38400n8 cpufreq=221200 rw root=/dev/mtdblock2 mtdparts=sa1100:512K(boot),1M(kernel),2560K(initrd),4M(root) prompt_ramdisk=0 mem=32M noinitrd initrd=0xc0800000,3M"
 CONFIG_FPE_NWFPE=y
 CONFIG_PM=y
 CONFIG_MODULES=y
diff --git a/init/do_mounts.c b/init/do_mounts.c
index 6af29da8889e..0f2f44e6250c 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -34,13 +34,6 @@ static int root_wait;
 
 dev_t ROOT_DEV;
 
-static int __init load_ramdisk(char *str)
-{
-	pr_warn("ignoring the deprecated load_ramdisk= option\n");
-	return 1;
-}
-__setup("load_ramdisk=", load_ramdisk);
-
 static int __init readonly(char *str)
 {
 	if (*str)
-- 
2.47.2


