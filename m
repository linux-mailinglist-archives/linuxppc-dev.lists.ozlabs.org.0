Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B92A6E4948
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Apr 2023 15:05:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0S2f2gp0z3fZh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Apr 2023 23:05:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=BBEQa6NU;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Sf+t+o+F;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=BBEQa6NU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Sf+t+o+F;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0RsG1fNWz3cMw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Apr 2023 22:57:05 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7444321A79;
	Mon, 17 Apr 2023 12:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1681736221; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iG0FY3Kl3gPj6CmaqKKFtjB0wM01q0+Cw6A2hhNMH4g=;
	b=BBEQa6NUG7vLr3ul5YZVF3dQYc/iGt5Ytsx51/ik0XKZftZeHvpY8Xr1Ky2r2Riezga1CI
	4s9UWzwmeoLYidXEPd3PiEv4ng0HDcDsUM/mSSlTqF7QPe9EOOeF4+rEa8ixR44VROWWAk
	HkIWt3+A9rO3XJbubEMNB0mFv6D7TB8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681736221;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iG0FY3Kl3gPj6CmaqKKFtjB0wM01q0+Cw6A2hhNMH4g=;
	b=Sf+t+o+Fk/BHIdeJH+iKB4J3syr51ygn2goItN4HoVYlXk2EHVBX4YTaCqbs4dmMjWg0em
	Hszq33oX/i6vfMAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D9AAC1391A;
	Mon, 17 Apr 2023 12:57:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 4A9ZNBxCPWToWwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 17 Apr 2023 12:57:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: arnd@arndb.de,
	daniel.vetter@ffwll.ch,
	deller@gmx.de,
	javierm@redhat.com,
	gregkh@linuxfoundation.org
Subject: [PATCH v3 07/19] arch/m68k: Merge variants of fb_pgprotect() into single function
Date: Mon, 17 Apr 2023 14:56:39 +0200
Message-Id: <20230417125651.25126-8-tzimmermann@suse.de>
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Merge all variants of fb_pgprotect() into a single function body.
There are two different cases for MMU systems. For non-MMU systems,
the function body will be empty. No functional changes, but this
will help with the switch to <asm-generic/fb.h>.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/fb.h | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/m68k/include/asm/fb.h b/arch/m68k/include/asm/fb.h
index b86c6e2e26dd..4f96989922af 100644
--- a/arch/m68k/include/asm/fb.h
+++ b/arch/m68k/include/asm/fb.h
@@ -7,17 +7,13 @@
 #include <asm/page.h>
 #include <asm/setup.h>
 
-#ifdef CONFIG_MMU
-#ifdef CONFIG_SUN3
 static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
 				unsigned long off)
 {
+#ifdef CONFIG_MMU
+#ifdef CONFIG_SUN3
 	pgprot_val(vma->vm_page_prot) |= SUN3_PAGE_NOCACHE;
-}
 #else
-static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
-				unsigned long off)
-{
 	if (CPU_IS_020_OR_030)
 		pgprot_val(vma->vm_page_prot) |= _PAGE_NOCACHE030;
 	if (CPU_IS_040_OR_060) {
@@ -25,11 +21,9 @@ static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
 		/* Use no-cache mode, serialized */
 		pgprot_val(vma->vm_page_prot) |= _PAGE_NOCACHE_S;
 	}
-}
 #endif /* CONFIG_SUN3 */
-#else
-#define fb_pgprotect(...) do {} while (0)
 #endif /* CONFIG_MMU */
+}
 
 static inline int fb_is_primary_device(struct fb_info *info)
 {
-- 
2.40.0

