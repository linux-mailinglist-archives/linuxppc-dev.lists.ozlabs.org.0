Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA056D8170
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 17:17:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ps7Xf0vm9z3fG7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 01:17:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=NHsGWbfu;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=gj3pQeHr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=NHsGWbfu;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=gj3pQeHr;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ps7Hh6MBJz3cdt
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 01:06:08 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6146222925;
	Wed,  5 Apr 2023 15:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1680707161; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XbMo3vTzToV+AWbGx2Dtk5bvok2FxXyPAOociH6amPI=;
	b=NHsGWbfu/eax+uhQRmFEISmq13GQcjQxgBTth9K3svol/82IFPkmizZVrW3pW+mxkXqAZL
	Et/Eua7M+URyYUadSg/0wKxW+2athNaYMoPTtUFVcA97lHyWsV5yDK108/GiBtObeOOJCj
	1ZzloVRHuhTtryfr2bBOhpOVWxfeN8M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1680707161;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XbMo3vTzToV+AWbGx2Dtk5bvok2FxXyPAOociH6amPI=;
	b=gj3pQeHrWZaUevpElwhow9npzUIwo40faql0uX2OgAkqes4uZfhZPKYAcPb5b3Ycc8qA8l
	q/8Mh9tc4V7R+UAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 01BDB13A10;
	Wed,  5 Apr 2023 15:06:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id aJQxO1iOLWTPIAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Wed, 05 Apr 2023 15:06:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: arnd@arndb.de,
	daniel.vetter@ffwll.ch,
	deller@gmx.de,
	javierm@redhat.com,
	gregkh@linuxfoundation.org
Subject: [PATCH 08/18] arch/mips: Implement <asm/fb.h> with generic helpers
Date: Wed,  5 Apr 2023 17:05:44 +0200
Message-Id: <20230405150554.30540-9-tzimmermann@suse.de>
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-ia64@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replace the architecture's fb_is_primary_device() with the generic
one from <asm-generic/fb.h>. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/include/asm/fb.h | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/mips/include/asm/fb.h b/arch/mips/include/asm/fb.h
index bd3f68c9ddfc..6bda0a81d8ca 100644
--- a/arch/mips/include/asm/fb.h
+++ b/arch/mips/include/asm/fb.h
@@ -1,19 +1,17 @@
 #ifndef _ASM_FB_H_
 #define _ASM_FB_H_
 
-#include <linux/fb.h>
-#include <linux/fs.h>
 #include <asm/page.h>
 
+struct file;
+
 static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
 				unsigned long off)
 {
 	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
 }
+#define fb_pgprotect fb_pgprotect
 
-static inline int fb_is_primary_device(struct fb_info *info)
-{
-	return 0;
-}
+#include <asm-generic/fb.h>
 
 #endif /* _ASM_FB_H_ */
-- 
2.40.0

