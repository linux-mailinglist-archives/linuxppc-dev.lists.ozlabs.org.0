Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DED85E2D2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 17:16:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tg1br6mNkz3vbV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 03:16:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tg1Z737ZBz3bn8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 03:14:39 +1100 (AEDT)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A53D42222F;
	Wed, 21 Feb 2024 16:14:34 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 0385813A42;
	Wed, 21 Feb 2024 16:14:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id KMI5O2kh1mVrYwAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Wed, 21 Feb 2024 16:14:33 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: arnd@arndb.de,
	javierm@redhat.com,
	deller@gmx.de,
	suijingfeng@loongson.cn
Subject: [PATCH 1/3] arch: Select fbdev helpers with CONFIG_VIDEO
Date: Wed, 21 Feb 2024 17:05:24 +0100
Message-ID: <20240221161431.8245-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240221161431.8245-1-tzimmermann@suse.de>
References: <20240221161431.8245-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	none
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: A53D42222F
X-Spam-Flag: NO
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Andreas Larsson <andreas@gaisler.com>, linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org, linux-m68k@lists.linux-m68k.org, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Various Kconfig options selected the per-architecture helpers for
fbdev. But none of the contained code depends on fbdev. Standardize
on CONFIG_VIDEO, which will allow to add more general helpers for
video functionality.

CONFIG_VIDEO protects each architecture's video/ directory. This
allows for the use of more fine-grained control for each directory's
files, such as the use of CONFIG_STI_CORE on parisc.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Andreas Larsson <andreas@gaisler.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/parisc/Makefile      | 2 +-
 arch/sparc/Makefile       | 4 ++--
 arch/sparc/video/Makefile | 2 +-
 arch/x86/Makefile         | 2 +-
 arch/x86/video/Makefile   | 3 ++-
 5 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 316f84f1d15c8..21b8166a68839 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -119,7 +119,7 @@ export LIBGCC
 
 libs-y	+= arch/parisc/lib/ $(LIBGCC)
 
-drivers-y += arch/parisc/video/
+drivers-$(CONFIG_VIDEO) += arch/parisc/video/
 
 boot	:= arch/parisc/boot
 
diff --git a/arch/sparc/Makefile b/arch/sparc/Makefile
index 5f60359361312..757451c3ea1df 100644
--- a/arch/sparc/Makefile
+++ b/arch/sparc/Makefile
@@ -59,8 +59,8 @@ endif
 libs-y                 += arch/sparc/prom/
 libs-y                 += arch/sparc/lib/
 
-drivers-$(CONFIG_PM) += arch/sparc/power/
-drivers-$(CONFIG_FB) += arch/sparc/video/
+drivers-$(CONFIG_PM)    += arch/sparc/power/
+drivers-$(CONFIG_VIDEO) += arch/sparc/video/
 
 boot := arch/sparc/boot
 
diff --git a/arch/sparc/video/Makefile b/arch/sparc/video/Makefile
index 6baddbd58e4db..9dd82880a027a 100644
--- a/arch/sparc/video/Makefile
+++ b/arch/sparc/video/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-obj-$(CONFIG_FB) += fbdev.o
+obj-y	+= fbdev.o
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 15a5f4f2ff0aa..c0ea612c62ebe 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -265,7 +265,7 @@ drivers-$(CONFIG_PCI)            += arch/x86/pci/
 # suspend and hibernation support
 drivers-$(CONFIG_PM) += arch/x86/power/
 
-drivers-$(CONFIG_FB_CORE) += arch/x86/video/
+drivers-$(CONFIG_VIDEO) += arch/x86/video/
 
 ####
 # boot loader support. Several targets are kept for legacy purposes
diff --git a/arch/x86/video/Makefile b/arch/x86/video/Makefile
index 5ebe48752ffc4..9dd82880a027a 100644
--- a/arch/x86/video/Makefile
+++ b/arch/x86/video/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_FB_CORE)		+= fbdev.o
+
+obj-y	+= fbdev.o
-- 
2.43.0

