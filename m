Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6B26D9A6C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 16:32:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PskVk3c5Wz3fSG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Apr 2023 00:32:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ELZbBCFG;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hBIBxlKr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ELZbBCFG;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hBIBxlKr;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PskS12yDCz3f7K
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Apr 2023 00:30:24 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D3F9422591;
	Thu,  6 Apr 2023 14:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1680791421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lm4tB/qBx4Xl9gLv3tvzFp8gznBLvt7Ce6BUC7qY1PU=;
	b=ELZbBCFGsxjsM5z83YlFc2d5Yul8exK2LYWxEFUAwwbTozT9CYMUIyIdNQ27RFNpYoEolu
	CkGR/6aqkpLC61JwIgiwn6YSNaQNooEVmQ2rh4XD59bfW57bnCtp8JV/8/fuLH4jRrVgzG
	mIqmtgFcDaouDL9ieXaxdWmvzF4/xUE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1680791421;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lm4tB/qBx4Xl9gLv3tvzFp8gznBLvt7Ce6BUC7qY1PU=;
	b=hBIBxlKrsXljHVJEgdBNSo/HiM/JPqzuP43nSlwibirDu7CMLMMyXyL6ElXVCuZKfxi5u6
	b1qGLFxgU9kyF6CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 76D5913A1D;
	Thu,  6 Apr 2023 14:30:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id iNocHH3XLmS4LgAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 06 Apr 2023 14:30:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: arnd@arndb.de,
	daniel.vetter@ffwll.ch,
	deller@gmx.de,
	javierm@redhat.com,
	gregkh@linuxfoundation.org
Subject: [PATCH v2 01/19] fbdev: Prepare generic architecture helpers
Date: Thu,  6 Apr 2023 16:30:01 +0200
Message-Id: <20230406143019.6709-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230406143019.6709-1-tzimmermann@suse.de>
References: <20230406143019.6709-1-tzimmermann@suse.de>
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Generic implementations of fb_pgprotect() and fb_is_primary_device()
have been in the source code for a long time. Prepare the header file
to make use of them.

Improve the code by using an inline function for fb_pgprotect()
and by removing include statements. The default mode set by
fb_pgprotect() is now writecombine, which is what most platforms
want.

Symbols are protected by preprocessor guards. Architectures that
provide a symbol need to define a preprocessor token of the same
name and value. Otherwise the header file will provide a generic
implementation. This pattern has been taken from <asm/io.h>.

v2:
	*  use writecombine mappings by default (Arnd)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/asm-generic/fb.h | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/fb.h b/include/asm-generic/fb.h
index f9f18101ed36..631d97c507ca 100644
--- a/include/asm-generic/fb.h
+++ b/include/asm-generic/fb.h
@@ -1,13 +1,32 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+
 #ifndef __ASM_GENERIC_FB_H_
 #define __ASM_GENERIC_FB_H_
-#include <linux/fb.h>
 
-#define fb_pgprotect(...) do {} while (0)
+/*
+ * Only include this header file from your architecture's <asm/fb.h>.
+ */
+
+#include <asm/page.h>
+
+struct fb_info;
+struct file;
+
+#ifndef fb_pgprotect
+#define fb_pgprotect fb_pgprotect
+static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
+				unsigned long off)
+{
+	vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
+}
+#endif
 
+#ifndef fb_is_primary_device
+#define fb_is_primary_device fb_is_primary_device
 static inline int fb_is_primary_device(struct fb_info *info)
 {
 	return 0;
 }
+#endif
 
 #endif /* __ASM_GENERIC_FB_H_ */
-- 
2.40.0

