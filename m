Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C90793F84
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Sep 2023 16:51:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=TwC2rHXi;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Mc2/HGFn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rglgc1x5Kz3cRJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Sep 2023 00:51:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=TwC2rHXi;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Mc2/HGFn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rglbs3qKCz2xdm
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Sep 2023 00:48:09 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A75D122432;
	Wed,  6 Sep 2023 14:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1694011683; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1WzZFokcrlW6NGGGLWd4i7Dg6KUabGpzZ6FiqlxPoi4=;
	b=TwC2rHXizbdCLcuc98kBNbY1jPzrJH8MUQ4VjQ26oB+ROml5otTq2AfT5GtpArLlOwGnht
	IQy9B+Jfxu2tfWgd4Lw2ZQTYf1zPfGZ597QOFz6AKfgrenZZMsGUIPSHjF0iIRJfqnvV4J
	xMZb5M9XnRlBS4pzz82B3DJdxuiPAlQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694011683;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1WzZFokcrlW6NGGGLWd4i7Dg6KUabGpzZ6FiqlxPoi4=;
	b=Mc2/HGFn9HSuEP4H4Q5LcaFNnrKaCB1DbKsiLnnyglv9zCM0QPDt/cUM+rpbZCweIcrHIS
	PQ8ERS9CmBjknJBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6269613921;
	Wed,  6 Sep 2023 14:48:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id WBgyFyOR+GSNSgAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Wed, 06 Sep 2023 14:48:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	arnd@arndb.de,
	deller@gmx.de
Subject: [PATCH v2 1/5] fbdev: Avoid file argument in fb_pgprotect()
Date: Wed,  6 Sep 2023 16:35:02 +0200
Message-ID: <20230906144801.25297-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230906144801.25297-1-tzimmermann@suse.de>
References: <20230906144801.25297-1-tzimmermann@suse.de>
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org, Thomas Zimmermann <tzimmermann@suse.de>, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Only PowerPC's fb_pgprotect() needs the file argument, although
the implementation does not use it. Pass NULL to the internal
helper in preparation of further updates. A later patch will remove
the file parameter from fb_pgprotect().

While at it, replace the shift operation with PHYS_PFN().

Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 arch/powerpc/include/asm/fb.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/fb.h b/arch/powerpc/include/asm/fb.h
index 5f1a2e5f7654..61e3b8806db6 100644
--- a/arch/powerpc/include/asm/fb.h
+++ b/arch/powerpc/include/asm/fb.h
@@ -9,7 +9,12 @@
 static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
 				unsigned long off)
 {
-	vma->vm_page_prot = phys_mem_access_prot(file, off >> PAGE_SHIFT,
+	/*
+	 * PowerPC's implementation of phys_mem_access_prot() does
+	 * not use the file argument. Set it to NULL in preparation
+	 * of later updates to the interface.
+	 */
+	vma->vm_page_prot = phys_mem_access_prot(NULL, PHYS_PFN(off),
 						 vma->vm_end - vma->vm_start,
 						 vma->vm_page_prot);
 }
-- 
2.42.0

