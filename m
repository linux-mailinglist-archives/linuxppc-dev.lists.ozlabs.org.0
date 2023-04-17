Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC8B6E4968
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Apr 2023 15:08:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0S6Y4Zrdz3frd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Apr 2023 23:08:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=VpHvENwZ;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=BXMcHuKH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=VpHvENwZ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=BXMcHuKH;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0RsJ38R0z3cdx
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Apr 2023 22:57:08 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BC4EA1FE0F;
	Mon, 17 Apr 2023 12:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1681736225; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/rz0KVXgl7eygxSOZmb7rFdY5CLJi8hQKmbruW8U1YU=;
	b=VpHvENwZHnBCyXjOULTtGXZdYAugTWqnh+HTkbLLExQWCyu+/FN1J7BdzAaO6YDeoE7GW4
	HP8VXSA0tIb8XdH7qNsiW6OXkFbCtAecOY7mH5fW7wFCalLfaXTBxPHiiarpzxr3+IYs9w
	vtGN25+04Ttm7vFolaDi1M+V0AQnU3o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681736225;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/rz0KVXgl7eygxSOZmb7rFdY5CLJi8hQKmbruW8U1YU=;
	b=BXMcHuKHts+WrGo+6uxSH+bF2kXeTa35zcDAx3h7WJADV68Zx7N+ICQonVWeTSPJg7atE7
	I9Yhhfsyb2mxfEAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 639721390E;
	Mon, 17 Apr 2023 12:57:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id MO3fFiFCPWToWwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 17 Apr 2023 12:57:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: arnd@arndb.de,
	daniel.vetter@ffwll.ch,
	deller@gmx.de,
	javierm@redhat.com,
	gregkh@linuxfoundation.org
Subject: [PATCH v3 17/19] arch/sparc: Implement fb_is_primary_device() in source file
Date: Mon, 17 Apr 2023 14:56:49 +0200
Message-Id: <20230417125651.25126-18-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230417125651.25126-1-tzimmermann@suse.de>
References: <20230417125651.25126-1-tzimmermann@suse.de>
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Other architectures implment fb_is_primary_device() in a source
file. Do the same on sparc. No functional changes, but allows to
remove several include statement from <asm/fb.h>.

v2:
	* don't include <asm/prom.h> in header file

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: "David S. Miller" <davem@davemloft.net>
---
 arch/sparc/Makefile         |  1 +
 arch/sparc/include/asm/fb.h | 23 +++++------------------
 arch/sparc/video/Makefile   |  3 +++
 arch/sparc/video/fbdev.c    | 24 ++++++++++++++++++++++++
 4 files changed, 33 insertions(+), 18 deletions(-)
 create mode 100644 arch/sparc/video/Makefile
 create mode 100644 arch/sparc/video/fbdev.c

diff --git a/arch/sparc/Makefile b/arch/sparc/Makefile
index a4ea5b05f288..95a9211e48e3 100644
--- a/arch/sparc/Makefile
+++ b/arch/sparc/Makefile
@@ -60,6 +60,7 @@ libs-y                 += arch/sparc/prom/
 libs-y                 += arch/sparc/lib/
 
 drivers-$(CONFIG_PM) += arch/sparc/power/
+drivers-$(CONFIG_FB) += arch/sparc/video/
 
 boot := arch/sparc/boot
 
diff --git a/arch/sparc/include/asm/fb.h b/arch/sparc/include/asm/fb.h
index f699962e9ddf..28609f7a965c 100644
--- a/arch/sparc/include/asm/fb.h
+++ b/arch/sparc/include/asm/fb.h
@@ -1,11 +1,12 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #ifndef _SPARC_FB_H_
 #define _SPARC_FB_H_
-#include <linux/console.h>
-#include <linux/fb.h>
+
 #include <linux/fs.h>
+
 #include <asm/page.h>
-#include <asm/prom.h>
+
+struct fb_info;
 
 static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
 				unsigned long off)
@@ -15,20 +16,6 @@ static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
 #endif
 }
 
-static inline int fb_is_primary_device(struct fb_info *info)
-{
-	struct device *dev = info->device;
-	struct device_node *node;
-
-	if (console_set_on_cmdline)
-		return 0;
-
-	node = dev->of_node;
-	if (node &&
-	    node == of_console_device)
-		return 1;
-
-	return 0;
-}
+int fb_is_primary_device(struct fb_info *info);
 
 #endif /* _SPARC_FB_H_ */
diff --git a/arch/sparc/video/Makefile b/arch/sparc/video/Makefile
new file mode 100644
index 000000000000..6baddbd58e4d
--- /dev/null
+++ b/arch/sparc/video/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_FB) += fbdev.o
diff --git a/arch/sparc/video/fbdev.c b/arch/sparc/video/fbdev.c
new file mode 100644
index 000000000000..dadd5799fbb3
--- /dev/null
+++ b/arch/sparc/video/fbdev.c
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/console.h>
+#include <linux/fb.h>
+#include <linux/module.h>
+
+#include <asm/fb.h>
+#include <asm/prom.h>
+
+int fb_is_primary_device(struct fb_info *info)
+{
+	struct device *dev = info->device;
+	struct device_node *node;
+
+	if (console_set_on_cmdline)
+		return 0;
+
+	node = dev->of_node;
+	if (node && node == of_console_device)
+		return 1;
+
+	return 0;
+}
+EXPORT_SYMBOL(fb_is_primary_device);
-- 
2.40.0

