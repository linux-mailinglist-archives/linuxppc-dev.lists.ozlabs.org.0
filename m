Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 330F86D8156
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 17:14:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ps7Ts0fGZz3fVK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 01:14:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=SCCfYtik;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jD7ude7u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=SCCfYtik;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jD7ude7u;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ps7Hh5ZnVz3cd2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 01:06:08 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 46852228D4;
	Wed,  5 Apr 2023 15:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1680707163; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=clUDjDH/bPWQSIzDszYi3/oWFwNxlrGwwLdQNX68Lw4=;
	b=SCCfYtikyJntIkM9ayKnsR2gc1qIo9MhAAmFAvJeAABjvNkYsTyUuzl1P8Wcu+lw0QoH3n
	bDWOEpiXB6oUD7j4BpqFJSkY1eFEGZAGzWXNdaWMsJfLfFw+PlisVX+Xsvn626hsp7LT//
	dlGL+jnhOIq7igAIgvxF0gNHwVdhq3U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1680707163;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=clUDjDH/bPWQSIzDszYi3/oWFwNxlrGwwLdQNX68Lw4=;
	b=jD7ude7u+DdXewIRm2eoWHZxO2mneTJDmmt/Zt6iSKj9glRQCIoQc24gh8o0lB2uUOEwUk
	pYIhM25CQPBYxzBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CD27A13A10;
	Wed,  5 Apr 2023 15:06:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id WGQwMVqOLWTPIAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Wed, 05 Apr 2023 15:06:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: arnd@arndb.de,
	daniel.vetter@ffwll.ch,
	deller@gmx.de,
	javierm@redhat.com,
	gregkh@linuxfoundation.org
Subject: [PATCH 12/18] arch/parisc: Implement fb_is_primary_device() under arch/parisc
Date: Wed,  5 Apr 2023 17:05:48 +0200
Message-Id: <20230405150554.30540-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230405150554.30540-1-tzimmermann@suse.de>
References: <20230405150554.30540-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move PARISC's implementation of fb_is_primary_device() into the
architecture directory. This the place of the declaration and
where other architectures implement this function. No functional
changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
---
 arch/parisc/Makefile         |  2 ++
 arch/parisc/include/asm/fb.h |  2 +-
 arch/parisc/video/Makefile   |  3 +++
 arch/parisc/video/fbdev.c    | 27 +++++++++++++++++++++++++++
 drivers/video/sticore.c      | 19 -------------------
 include/video/sticore.h      |  2 ++
 6 files changed, 35 insertions(+), 20 deletions(-)
 create mode 100644 arch/parisc/video/Makefile
 create mode 100644 arch/parisc/video/fbdev.c

diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 0d049a6f6a60..968ebe17494c 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -119,6 +119,8 @@ export LIBGCC
 
 libs-y	+= arch/parisc/lib/ $(LIBGCC)
 
+drivers-y += arch/parisc/video/
+
 boot	:= arch/parisc/boot
 
 PALO := $(shell if (which palo 2>&1); then : ; \
diff --git a/arch/parisc/include/asm/fb.h b/arch/parisc/include/asm/fb.h
index 55d29c4f716e..0b9a38ced5c8 100644
--- a/arch/parisc/include/asm/fb.h
+++ b/arch/parisc/include/asm/fb.h
@@ -12,7 +12,7 @@ static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
 	pgprot_val(vma->vm_page_prot) |= _PAGE_NO_CACHE;
 }
 
-#if defined(CONFIG_FB_STI)
+#if defined(CONFIG_STI_CORE)
 int fb_is_primary_device(struct fb_info *info);
 #else
 static inline int fb_is_primary_device(struct fb_info *info)
diff --git a/arch/parisc/video/Makefile b/arch/parisc/video/Makefile
new file mode 100644
index 000000000000..16a73cce4661
--- /dev/null
+++ b/arch/parisc/video/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_STI_CORE) += fbdev.o
diff --git a/arch/parisc/video/fbdev.c b/arch/parisc/video/fbdev.c
new file mode 100644
index 000000000000..4a0ae08fc75b
--- /dev/null
+++ b/arch/parisc/video/fbdev.c
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2000 Philipp Rumpf <prumpf@tux.org>
+ * Copyright (C) 2001-2020 Helge Deller <deller@gmx.de>
+ * Copyright (C) 2001-2002 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
+ */
+
+#include <linux/module.h>
+
+#include <asm/fb.h>
+
+#include <video/sticore.h>
+
+int fb_is_primary_device(struct fb_info *info)
+{
+	struct sti_struct *sti;
+
+	sti = sti_get_rom(0);
+
+	/* if no built-in graphics card found, allow any fb driver as default */
+	if (!sti)
+		return true;
+
+	/* return true if it's the default built-in framebuffer driver */
+	return (sti->info == info);
+}
+EXPORT_SYMBOL(fb_is_primary_device);
diff --git a/drivers/video/sticore.c b/drivers/video/sticore.c
index f8aaedea437d..7eb925f2ba9c 100644
--- a/drivers/video/sticore.c
+++ b/drivers/video/sticore.c
@@ -30,7 +30,6 @@
 #include <asm/pdc.h>
 #include <asm/cacheflush.h>
 #include <asm/grfioctl.h>
-#include <asm/fb.h>
 
 #include <video/sticore.h>
 
@@ -1148,24 +1147,6 @@ int sti_call(const struct sti_struct *sti, unsigned long func,
 	return ret;
 }
 
-#if defined(CONFIG_FB_STI)
-/* check if given fb_info is the primary device */
-int fb_is_primary_device(struct fb_info *info)
-{
-	struct sti_struct *sti;
-
-	sti = sti_get_rom(0);
-
-	/* if no built-in graphics card found, allow any fb driver as default */
-	if (!sti)
-		return true;
-
-	/* return true if it's the default built-in framebuffer driver */
-	return (sti->info == info);
-}
-EXPORT_SYMBOL(fb_is_primary_device);
-#endif
-
 MODULE_AUTHOR("Philipp Rumpf, Helge Deller, Thomas Bogendoerfer");
 MODULE_DESCRIPTION("Core STI driver for HP's NGLE series graphics cards in HP PARISC machines");
 MODULE_LICENSE("GPL v2");
diff --git a/include/video/sticore.h b/include/video/sticore.h
index c0879352cde4..fbb78d7e7565 100644
--- a/include/video/sticore.h
+++ b/include/video/sticore.h
@@ -2,6 +2,8 @@
 #ifndef STICORE_H
 #define STICORE_H
 
+struct fb_info;
+
 /* generic STI structures & functions */
 
 #define MAX_STI_ROMS 4		/* max no. of ROMs which this driver handles */
-- 
2.40.0

