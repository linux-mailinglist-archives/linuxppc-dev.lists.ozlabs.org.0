Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5B8892570
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 21:36:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=SuO/o9hH;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=CFzrdsSx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5sd52CXKz3vhM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Mar 2024 07:36:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=SuO/o9hH;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=CFzrdsSx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V5sbW4hdyz3brC
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Mar 2024 07:35:03 +1100 (AEDT)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C36DD5CACF;
	Fri, 29 Mar 2024 20:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1711744499; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5zPhAoJzxNIA+Zyc3rmr96I44yGrbHHtvC/kao9p1aE=;
	b=SuO/o9hHDFaqftV6eI2MO+utLXpa5M51LlMEE/ka1+JY65aMSjaH8l+mhXYN1LzyI8ehHU
	l3zrsO0NpwIzc6+J2xu7Ll5okFEvpYRyqkfHV/uZdikGklfdJnlx2cBZLXMkLSVp1fsXfp
	fAld15I8m5n7cmZldzEBJFN/cF4IxAM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1711744499;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5zPhAoJzxNIA+Zyc3rmr96I44yGrbHHtvC/kao9p1aE=;
	b=CFzrdsSxhUSmaQoySt/OHi2C7T3Mr3nGK4vRoiBbHJIe1ukVeOpu2ckjXSBd+87oJ2dZu7
	/PzLmNyBpir4viCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 024CD13A7E;
	Fri, 29 Mar 2024 20:34:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id eHCCOvIlB2YTPgAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Fri, 29 Mar 2024 20:34:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: arnd@arndb.de,
	sam@ravnborg.org,
	javierm@redhat.com,
	deller@gmx.de,
	sui.jingfeng@linux.dev
Subject: [PATCH v3 2/3] arch: Remove struct fb_info from video helpers
Date: Fri, 29 Mar 2024 21:32:11 +0100
Message-ID: <20240329203450.7824-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240329203450.7824-1-tzimmermann@suse.de>
References: <20240329203450.7824-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C36DD5CACF
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.19)[-0.968];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap2.dmz-prg2.suse.org:rdns,imap2.dmz-prg2.suse.org:helo];
	FREEMAIL_TO(0.00)[arndb.de,ravnborg.org,redhat.com,gmx.de,linux.dev];
	R_DKIM_NA(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmx.de]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Score: -1.80
X-Spam-Level: 
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

The per-architecture video helpers do not depend on struct fb_info
or anything else from fbdev. Remove it from the interface and replace
fb_is_primary_device() with video_is_primary_device(). The new helper
is similar in functionality, but can operate on non-fbdev devices.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
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
 arch/parisc/include/asm/fb.h     |  8 +++++---
 arch/parisc/video/fbdev.c        |  9 +++++----
 arch/sparc/include/asm/fb.h      |  7 ++++---
 arch/sparc/video/fbdev.c         | 17 ++++++++---------
 arch/x86/include/asm/fb.h        |  8 +++++---
 arch/x86/video/fbdev.c           | 18 +++++++-----------
 drivers/video/fbdev/core/fbcon.c |  2 +-
 include/asm-generic/fb.h         | 11 ++++++-----
 8 files changed, 41 insertions(+), 39 deletions(-)

diff --git a/arch/parisc/include/asm/fb.h b/arch/parisc/include/asm/fb.h
index 658a8a7dc5312..ed2a195a3e762 100644
--- a/arch/parisc/include/asm/fb.h
+++ b/arch/parisc/include/asm/fb.h
@@ -2,11 +2,13 @@
 #ifndef _ASM_FB_H_
 #define _ASM_FB_H_
 
-struct fb_info;
+#include <linux/types.h>
+
+struct device;
 
 #if defined(CONFIG_STI_CORE)
-int fb_is_primary_device(struct fb_info *info);
-#define fb_is_primary_device fb_is_primary_device
+bool video_is_primary_device(struct device *dev);
+#define video_is_primary_device video_is_primary_device
 #endif
 
 #include <asm-generic/fb.h>
diff --git a/arch/parisc/video/fbdev.c b/arch/parisc/video/fbdev.c
index e4f8ac99fc9e0..540fa0c919d59 100644
--- a/arch/parisc/video/fbdev.c
+++ b/arch/parisc/video/fbdev.c
@@ -5,12 +5,13 @@
  * Copyright (C) 2001-2002 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  */
 
-#include <linux/fb.h>
 #include <linux/module.h>
 
 #include <video/sticore.h>
 
-int fb_is_primary_device(struct fb_info *info)
+#include <asm/fb.h>
+
+bool video_is_primary_device(struct device *dev)
 {
 	struct sti_struct *sti;
 
@@ -21,6 +22,6 @@ int fb_is_primary_device(struct fb_info *info)
 		return true;
 
 	/* return true if it's the default built-in framebuffer driver */
-	return (sti->dev == info->device);
+	return (sti->dev == dev);
 }
-EXPORT_SYMBOL(fb_is_primary_device);
+EXPORT_SYMBOL(video_is_primary_device);
diff --git a/arch/sparc/include/asm/fb.h b/arch/sparc/include/asm/fb.h
index 24440c0fda490..07f0325d6921c 100644
--- a/arch/sparc/include/asm/fb.h
+++ b/arch/sparc/include/asm/fb.h
@@ -3,10 +3,11 @@
 #define _SPARC_FB_H_
 
 #include <linux/io.h>
+#include <linux/types.h>
 
 #include <asm/page.h>
 
-struct fb_info;
+struct device;
 
 #ifdef CONFIG_SPARC32
 static inline pgprot_t pgprot_framebuffer(pgprot_t prot,
@@ -18,8 +19,8 @@ static inline pgprot_t pgprot_framebuffer(pgprot_t prot,
 #define pgprot_framebuffer pgprot_framebuffer
 #endif
 
-int fb_is_primary_device(struct fb_info *info);
-#define fb_is_primary_device fb_is_primary_device
+bool video_is_primary_device(struct device *dev);
+#define video_is_primary_device video_is_primary_device
 
 static inline void fb_memcpy_fromio(void *to, const volatile void __iomem *from, size_t n)
 {
diff --git a/arch/sparc/video/fbdev.c b/arch/sparc/video/fbdev.c
index bff66dd1909a4..e46f0499c2774 100644
--- a/arch/sparc/video/fbdev.c
+++ b/arch/sparc/video/fbdev.c
@@ -1,26 +1,25 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/console.h>
-#include <linux/fb.h>
+#include <linux/device.h>
 #include <linux/module.h>
 
+#include <asm/fb.h>
 #include <asm/prom.h>
 
-int fb_is_primary_device(struct fb_info *info)
+bool video_is_primary_device(struct device *dev)
 {
-	struct device *dev = info->device;
-	struct device_node *node;
+	struct device_node *node = dev->of_node;
 
 	if (console_set_on_cmdline)
-		return 0;
+		return false;
 
-	node = dev->of_node;
 	if (node && node == of_console_device)
-		return 1;
+		return true;
 
-	return 0;
+	return false;
 }
-EXPORT_SYMBOL(fb_is_primary_device);
+EXPORT_SYMBOL(video_is_primary_device);
 
 MODULE_DESCRIPTION("Sparc fbdev helpers");
 MODULE_LICENSE("GPL");
diff --git a/arch/x86/include/asm/fb.h b/arch/x86/include/asm/fb.h
index c3b9582de7efd..999db33792869 100644
--- a/arch/x86/include/asm/fb.h
+++ b/arch/x86/include/asm/fb.h
@@ -2,17 +2,19 @@
 #ifndef _ASM_X86_FB_H
 #define _ASM_X86_FB_H
 
+#include <linux/types.h>
+
 #include <asm/page.h>
 
-struct fb_info;
+struct device;
 
 pgprot_t pgprot_framebuffer(pgprot_t prot,
 			    unsigned long vm_start, unsigned long vm_end,
 			    unsigned long offset);
 #define pgprot_framebuffer pgprot_framebuffer
 
-int fb_is_primary_device(struct fb_info *info);
-#define fb_is_primary_device fb_is_primary_device
+bool video_is_primary_device(struct device *dev);
+#define video_is_primary_device video_is_primary_device
 
 #include <asm-generic/fb.h>
 
diff --git a/arch/x86/video/fbdev.c b/arch/x86/video/fbdev.c
index 1dd6528cc947c..4d87ce8e257fe 100644
--- a/arch/x86/video/fbdev.c
+++ b/arch/x86/video/fbdev.c
@@ -7,7 +7,6 @@
  *
  */
 
-#include <linux/fb.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/vgaarb.h>
@@ -25,20 +24,17 @@ pgprot_t pgprot_framebuffer(pgprot_t prot,
 }
 EXPORT_SYMBOL(pgprot_framebuffer);
 
-int fb_is_primary_device(struct fb_info *info)
+bool video_is_primary_device(struct device *dev)
 {
-	struct device *device = info->device;
-	struct pci_dev *pci_dev;
+	struct pci_dev *pdev;
 
-	if (!device || !dev_is_pci(device))
-		return 0;
+	if (!dev_is_pci(dev))
+		return false;
 
-	pci_dev = to_pci_dev(device);
+	pdev = to_pci_dev(dev);
 
-	if (pci_dev == vga_default_device())
-		return 1;
-	return 0;
+	return (pdev == vga_default_device());
 }
-EXPORT_SYMBOL(fb_is_primary_device);
+EXPORT_SYMBOL(video_is_primary_device);
 
 MODULE_LICENSE("GPL");
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index fcabc668e9fbe..3f7333dca508c 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2907,7 +2907,7 @@ void fbcon_remap_all(struct fb_info *info)
 static void fbcon_select_primary(struct fb_info *info)
 {
 	if (!map_override && primary_device == -1 &&
-	    fb_is_primary_device(info)) {
+	    video_is_primary_device(info->device)) {
 		int i;
 
 		printk(KERN_INFO "fbcon: %s (fb%i) is primary device\n",
diff --git a/include/asm-generic/fb.h b/include/asm-generic/fb.h
index 6ccabb400aa66..4788c1e1c6bc0 100644
--- a/include/asm-generic/fb.h
+++ b/include/asm-generic/fb.h
@@ -10,8 +10,9 @@
 #include <linux/io.h>
 #include <linux/mm_types.h>
 #include <linux/pgtable.h>
+#include <linux/types.h>
 
-struct fb_info;
+struct device;
 
 #ifndef pgprot_framebuffer
 #define pgprot_framebuffer pgprot_framebuffer
@@ -23,11 +24,11 @@ static inline pgprot_t pgprot_framebuffer(pgprot_t prot,
 }
 #endif
 
-#ifndef fb_is_primary_device
-#define fb_is_primary_device fb_is_primary_device
-static inline int fb_is_primary_device(struct fb_info *info)
+#ifndef video_is_primary_device
+#define video_is_primary_device video_is_primary_device
+static inline bool video_is_primary_device(struct device *dev)
 {
-	return 0;
+	return false;
 }
 #endif
 
-- 
2.44.0

