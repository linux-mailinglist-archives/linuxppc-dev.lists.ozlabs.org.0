Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF5E6D812A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 17:11:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ps7Q74Ymsz3fXq
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 01:11:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=a+wU+LVq;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=sIpTkBX4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=a+wU+LVq;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=sIpTkBX4;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ps7Hf4Yxtz3cKn
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 01:06:06 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AA94122928;
	Wed,  5 Apr 2023 15:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1680707163; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MGwV+C2zhRavo4V9t/lCv4GV6nwBEOvq18lFk5ZhtVo=;
	b=a+wU+LVqsagcS1piEEmYcVYGFgVuoaA9NqKogh+pJC58CCXt+j09yOAlEAU/m6BKssOekt
	PCct5nD5rOLwcVA0WooNC8SFnkF/3niZCO3xUy8W+//2p409HrjRHC2RwMRKyETvTsMAs7
	GzbJ//Du9iXnFUJbojkkkTSBz1yaqHc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1680707163;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MGwV+C2zhRavo4V9t/lCv4GV6nwBEOvq18lFk5ZhtVo=;
	b=sIpTkBX4oIzLnz2RKx8r1vZ+bxqQC219fma1Ea7uOPfJSU8nmtCzBe7PDoBI1fVi9NPmBK
	3NBnXsjjTcvyv6CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4CFBD13A92;
	Wed,  5 Apr 2023 15:06:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id wBwHEluOLWTPIAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Wed, 05 Apr 2023 15:06:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: arnd@arndb.de,
	daniel.vetter@ffwll.ch,
	deller@gmx.de,
	javierm@redhat.com,
	gregkh@linuxfoundation.org
Subject: [PATCH 13/18] arch/parisc: Implement <asm/fb.h> with generic helpers
Date: Wed,  5 Apr 2023 17:05:49 +0200
Message-Id: <20230405150554.30540-14-tzimmermann@suse.de>
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

Replace the architecture's fb_is_primary_device() with the generic
one from <asm-generic/fb.h> on systems without CONFIG_STI_CORE. No
functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
---
 arch/parisc/include/asm/fb.h | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/parisc/include/asm/fb.h b/arch/parisc/include/asm/fb.h
index 0b9a38ced5c8..66bb401c0cda 100644
--- a/arch/parisc/include/asm/fb.h
+++ b/arch/parisc/include/asm/fb.h
@@ -2,23 +2,24 @@
 #ifndef _ASM_FB_H_
 #define _ASM_FB_H_
 
-#include <linux/fb.h>
-#include <linux/fs.h>
 #include <asm/page.h>
+#include <asm/pgtable.h>
+
+struct fb_info;
+struct file;
 
 static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
 				unsigned long off)
 {
 	pgprot_val(vma->vm_page_prot) |= _PAGE_NO_CACHE;
 }
+#define fb_pgprotect fb_pgprotect
 
 #if defined(CONFIG_STI_CORE)
 int fb_is_primary_device(struct fb_info *info);
-#else
-static inline int fb_is_primary_device(struct fb_info *info)
-{
-	return 0;
-}
+#define fb_is_primary_device fb_is_primary_device
 #endif
 
+#include <asm-generic/fb.h>
+
 #endif /* _ASM_FB_H_ */
-- 
2.40.0

