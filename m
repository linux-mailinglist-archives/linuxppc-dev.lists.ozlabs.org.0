Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF62B429AD3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 03:14:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSyPl3TjKz2yxx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 12:14:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=e9b+HF2v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=e9b+HF2v; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HSyP20spgz2xr1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Oct 2021 12:14:13 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so1264398pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Oct 2021 18:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=utrzWVO0hGP4H8SndNrG1vloicTmgmliN+ZiIfp9fnw=;
 b=e9b+HF2v3xZHlMafSt50P8q59zttsovpCGh3pLwNvh3DIAEw15p0PZCVzb6cDfxX+x
 hi40hz9rfnJogGw+nAEX/e/YXZpbjDZB/7hqU55O4sLejWsa86OrcA3P/lOwHge8tKZO
 60B/C3SxX4NOsGxIry13XM9FhTu5eeWlDc9Zn9jGHG+FZvKK0RlcjWlQEu6fD4yc8mxn
 6U/H8kwXkDxc563RWZjIIkRYCWOFBlcmMS7iQAAHWYs0fXYyr7o7sj6E254boinqW+td
 OxLZxSEPDUqG/hoHkoFEsnEYcSDQ5dk9zB7OcVfyZwsztLZrDoUGvHYjJOz2NKU9IsUZ
 SP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=utrzWVO0hGP4H8SndNrG1vloicTmgmliN+ZiIfp9fnw=;
 b=QVSuy1hrkMR30u1V7V8dGgz1a5v6oeGW3NwJ5tc8kesnPwTvi2RnNcT5AMQ0Vv8sfW
 iwZV31aKlIXJKFFNCkl61AA3L7imBxkKcK8m8FsyE1d/G2V1WBk3/wps1jjHIJIHUoho
 XFpaGWD1V4ofJxO3fNLANMt/lR+UuwDyU/4sCdva/bJcBbZFAe5XWdkC026ePl9WfSHZ
 to1Dfst66MqDAsmdTVBTeuICgsT9mRzpAr2nb5Py4N992Y0VgI22OqI1rwW0Q8i/T3sE
 c87YwB/2m+0ypAHCNNIyAZ/7P+6MZIOVW6R8kQiQuj/OW6RmfqqQjNJCGp9Mtz57Eq8Q
 psng==
X-Gm-Message-State: AOAM532AskGNfTn82e63+cnOgK9WqR0Ago3j8dhZ11pzOBUJFW2rdJtB
 KGtpgry6k+HDqduuFZZ+DBU=
X-Google-Smtp-Source: ABdhPJwIBf0O3rtGPYy1unRKMSzqUYRhGZGRbWukcFceDxzMLssRJ38u/9+6Nad0e8zahm5C34zN+A==
X-Received: by 2002:a17:90b:17c9:: with SMTP id
 me9mr2668263pjb.197.1634001248842; 
 Mon, 11 Oct 2021 18:14:08 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.19])
 by smtp.gmail.com with ESMTPSA id 184sm9031470pfw.49.2021.10.11.18.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 18:14:07 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: [PATCH] powerpc/s64: Clarify that radix lacks DEBUG_PAGEALLOC
Date: Tue, 12 Oct 2021 11:43:50 +1030
Message-Id: <20211012011350.395767-1-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The page_alloc.c code will call into __kernel_map_pages when
DEBUG_PAGEALLOC is configured and enabled.

As the implementation assumes hash, this should crash spectacularly if
not for a bit of luck in __kernel_map_pages. In this function
linear_map_hash_count is always zero, the for loop exits without doing
any damage.

There are no other platforms that determine if they support
debug_pagealloc at runtime. Instead of adding code to mm/page_alloc.c to
do that, this change turns the map/unmap into a noop when in radix
mode and prints a warning once.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
I noticed this when I was looking at adding kfence support a while back.
I've put that work aside and jpn has since gotten further than me, but I
think this is a fix worth considering.

 arch/powerpc/include/asm/book3s/64/hash.h |  2 ++
 arch/powerpc/mm/book3s64/hash_utils.c     |  2 +-
 arch/powerpc/mm/book3s64/pgtable.c        | 12 ++++++++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/book3s/64/hash.h b/arch/powerpc/include/asm/book3s/64/hash.h
index d959b0195ad9..674fe0e890dc 100644
--- a/arch/powerpc/include/asm/book3s/64/hash.h
+++ b/arch/powerpc/include/asm/book3s/64/hash.h
@@ -255,6 +255,8 @@ int hash__create_section_mapping(unsigned long start, unsigned long end,
 				 int nid, pgprot_t prot);
 int hash__remove_section_mapping(unsigned long start, unsigned long end);
 
+void hash__kernel_map_pages(struct page *page, int numpages, int enable);
+
 #endif /* !__ASSEMBLY__ */
 #endif /* __KERNEL__ */
 #endif /* _ASM_POWERPC_BOOK3S_64_HASH_H */
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index c145776d3ae5..cfd45245d009 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1988,7 +1988,7 @@ static void kernel_unmap_linear_page(unsigned long vaddr, unsigned long lmi)
 				     mmu_kernel_ssize, 0);
 }
 
-void __kernel_map_pages(struct page *page, int numpages, int enable)
+void hash__kernel_map_pages(struct page *page, int numpages, int enable)
 {
 	unsigned long flags, vaddr, lmi;
 	int i;
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 9e16c7b1a6c5..0aefc272cd03 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -526,3 +526,15 @@ static int __init pgtable_debugfs_setup(void)
 	return 0;
 }
 arch_initcall(pgtable_debugfs_setup);
+
+#ifdef CONFIG_DEBUG_PAGEALLOC
+void __kernel_map_pages(struct page *page, int numpages, int enable)
+{
+	if (radix_enabled()) {
+		pr_warn_once("DEBUG_PAGEALLOC not supported in radix mode\n");
+		return;
+	}
+
+	hash__kernel_map_pages(page, numpages, enable);
+}
+#endif
-- 
2.33.0

