Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B91994359B1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 06:02:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZYhv2Zb7z3dc5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 15:02:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KzANHqRv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=KzANHqRv; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZYXC4QPCz30RH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 14:54:51 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id
 t5-20020a17090a4e4500b001a0a284fcc2so2122897pjl.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Oct 2021 20:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7Jo1XkhGiaXGeEQRwsOCK/IybysxO0dpl1jYHnUnpLY=;
 b=KzANHqRvjlHwr5LRPO3DqUeJRqlPWdE2PjZdviq/6VKAr8kP5HdtzRRjRNIkeW1pLa
 BYDJoltsMapzbXNT4gMhP1ZGmwgNQdsXfpleJB9GDw4/xlqqIOZThGrUHBVHOSzcVFeD
 W9vdI80rP80juJ39595vWP4knvkfp5DZ7bgtAVb+lGuDAtvOA1c+OjdS35d0cvbqEHcl
 ypPcWUZzo6So6P39Bn1qGCLxMuYMySwVVr6pN+9v97FA0lFWHm5v1OMPOMRBL1ei3hJz
 C6t4OQQnTzNyJHcdTXpzMmH9DXiV4ttfG+tImjVjMMe1v78BjthD4XcqvwIx6AT1uu5z
 hu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7Jo1XkhGiaXGeEQRwsOCK/IybysxO0dpl1jYHnUnpLY=;
 b=ZiYuMAhpENYw447z4fQ811RIzG2vqBwm5TcDGNgTudJAhNCbN8wc/a2a3po9jGLdt8
 DDiUxfG6cnQEDYTpkWfx5WzeNyFLWGQBE6SZa5VsQ1uZBWKJfrqe/FnkJhnkAy2zcdfw
 DTcamks71uv88XXIe0Z2grgSpr2xJse0ezEaW8YN5lEPC80EVmeHTdvxa5sSAWs1ioBq
 o0w9zeW/rq09s3HM6ojvJkLB3EtNCQZCrhqI6iDwtjTlHhZWeT/vjuvN+pBtvS72N+Ww
 dK73u/cZxbnAKRd7pMEoJn5FGWmb2tm6b+soFzzvYz5AIe4/+lYS/dx05SKuMdzu50lH
 N/kA==
X-Gm-Message-State: AOAM533ViP8x7pCz2AEQkWauADZeAxDYT0C1Jo6lvZMoAXRxhMa04Bt9
 tHHNmStv+LKC++/0hbWmtbPuu2JW3Nc=
X-Google-Smtp-Source: ABdhPJzy+G98lP6ZqmAe8+1LWQ7WA2M7vnqnkQbBiuzlmQlTpU8tkjYsDzC0SGV2el1xO1YrgUZa4Q==
X-Received: by 2002:a17:90a:c70d:: with SMTP id
 o13mr3661464pjt.143.1634788488954; 
 Wed, 20 Oct 2021 20:54:48 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-203-144-177.static.tpgi.com.au.
 [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id t9sm7369249pjm.36.2021.10.20.20.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 20:54:48 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 12/16] powerpc/64e: remove mmu_linear_psize
Date: Thu, 21 Oct 2021 13:54:13 +1000
Message-Id: <20211021035417.2157804-13-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211021035417.2157804-1-npiggin@gmail.com>
References: <20211021035417.2157804-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

mmu_linear_psize is only set at boot once on 64e, is not necessarily
the correct size of the linear map pages, and is never used anywhere
except memremap_compat_align.

Remove mmu_linear_psize and hard code the 1GB value instead in
memremap_compat_align.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/ioremap.c    | 6 +++++-
 arch/powerpc/mm/nohash/tlb.c | 9 ---------
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/mm/ioremap.c b/arch/powerpc/mm/ioremap.c
index 57342154d2b0..730c3bbe4759 100644
--- a/arch/powerpc/mm/ioremap.c
+++ b/arch/powerpc/mm/ioremap.c
@@ -109,12 +109,16 @@ void __iomem *do_ioremap(phys_addr_t pa, phys_addr_t offset, unsigned long size,
 */
 unsigned long memremap_compat_align(void)
 {
+#ifdef CONFIG_PPC_BOOK3E_64
+	// 1GB maximum possible size of the linear mapping.
+	return max(SUBSECTION_SIZE, 1UL << 30);
+#else
 	unsigned int shift = mmu_psize_defs[mmu_linear_psize].shift;
 
 	if (radix_enabled())
 		return SUBSECTION_SIZE;
 	return max(SUBSECTION_SIZE, 1UL << shift);
-
+#endif
 }
 EXPORT_SYMBOL_GPL(memremap_compat_align);
 #endif
diff --git a/arch/powerpc/mm/nohash/tlb.c b/arch/powerpc/mm/nohash/tlb.c
index 5872f69141d5..8c1523ae7f7f 100644
--- a/arch/powerpc/mm/nohash/tlb.c
+++ b/arch/powerpc/mm/nohash/tlb.c
@@ -150,7 +150,6 @@ static inline int mmu_get_tsize(int psize)
  */
 #ifdef CONFIG_PPC64
 
-int mmu_linear_psize;		/* Page size used for the linear mapping */
 int mmu_pte_psize;		/* Page size used for PTE pages */
 int mmu_vmemmap_psize;		/* Page size used for the virtual mem map */
 int book3e_htw_mode;		/* HW tablewalk?  Value is PPC_HTW_* */
@@ -655,14 +654,6 @@ static void early_init_this_mmu(void)
 
 static void __init early_init_mmu_global(void)
 {
-	/* XXX This will have to be decided at runtime, but right
-	 * now our boot and TLB miss code hard wires it. Ideally
-	 * we should find out a suitable page size and patch the
-	 * TLB miss code (either that or use the PACA to store
-	 * the value we want)
-	 */
-	mmu_linear_psize = MMU_PAGE_1G;
-
 	/* XXX This should be decided at runtime based on supported
 	 * page sizes in the TLB, but for now let's assume 16M is
 	 * always there and a good fit (which it probably is)
-- 
2.23.0

