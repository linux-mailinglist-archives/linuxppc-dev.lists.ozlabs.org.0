Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A01145DA92
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 13:59:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0Hyf6cpfz3dkK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 23:59:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NRmUX6Y/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=NRmUX6Y/; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0Hmt74V7z3cJl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 23:51:10 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id g28so5170584pgg.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 04:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vr71fDnYlMZ9ZfKvkOy0j8nvyhhNhUQ/BncbTGlahFQ=;
 b=NRmUX6Y/0z1/1ORDos0mxRONBwtJrfwZDdpIVVgbJKY+ceGHBDqHoBtPO0jfY7IYT3
 bBhSZk+v1UFLLmjxdD369o60Mz1JqF9So2MwmAdMaPkws8jZcsg0OFicrIpP5tIHQcZS
 ZUqjMrAFOCoyVHRhuI3684DyaTb72HA1dNjKixN4pSzMc6iMjOKwEdy7xv0CbDxCEp+l
 jmJJYnpMbWK7kNgC0e2jOimdMiya3gKTResLq4r10R3vkrw339CmF3tQyDzCq+lbaDt3
 IEEneB7l9kwdHaKBxqSlf59ofyTTEtcxbh+2a5P53fq6dfjmMt8g9a+rp2Ir0Zzz26C3
 y2Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vr71fDnYlMZ9ZfKvkOy0j8nvyhhNhUQ/BncbTGlahFQ=;
 b=swYce3DV/FyqlsPc8Ij4MDoFad76MtxaTlK9YNzmc0pQjqDt6zKYxiBkvdrjNHfDTO
 HYhDkkvydYgK1xszjhSk/DwdWQd3kPuzZ75KVE0nQGvMc+YhFjIq6vIHGT4aykjLz9Ww
 Tt4ezqsV+EF+UD/4UgFdlMPI9rJvtl7N5dfPaTbLfyA0TrBUFpUqRkKQQmTHibyVMNhZ
 Zpd/oUmpmFIcV8H4K+onoR0nOkjifJ4KpGFCG3fM0BIshh5woRPt/zRuu2L9ZGLX9xA3
 QMNzDcZsje6SYrfoEylMTL6a1XoS3fOzADy32GM0Ylq+INzd8Z0DoX3C39XJovTYCUmZ
 89LA==
X-Gm-Message-State: AOAM533zr4Qfy00uXpl+WigR77QXL+37IDHtJKuQqrg0zIZT7cj5tgz5
 Y+jm5fcTfCHABvTpNuKSeoA4Cz+n+Lw=
X-Google-Smtp-Source: ABdhPJzqge5E0uRjgqYRcOatEtfnCTkC6Xg3pUpODqtRLiPxVw5kWBD82NWOkjb2Oz5eWj8wBzISLw==
X-Received: by 2002:a63:89c1:: with SMTP id v184mr1936248pgd.518.1637844668787; 
 Thu, 25 Nov 2021 04:51:08 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id gc22sm7242851pjb.57.2021.11.25.04.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 04:51:08 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 13/17] powerpc/64e: remove mmu_linear_psize
Date: Thu, 25 Nov 2021 22:50:21 +1000
Message-Id: <20211125125025.1472060-14-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211125125025.1472060-1-npiggin@gmail.com>
References: <20211125125025.1472060-1-npiggin@gmail.com>
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
the correct size of the linear map pages, and is never used anywhere.
Remove it.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/nohash/mmu-book3e.h | 1 -
 arch/powerpc/mm/nohash/tlb.c                 | 9 ---------
 2 files changed, 10 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/mmu-book3e.h b/arch/powerpc/include/asm/nohash/mmu-book3e.h
index e43a418d3ccd..787e6482e299 100644
--- a/arch/powerpc/include/asm/nohash/mmu-book3e.h
+++ b/arch/powerpc/include/asm/nohash/mmu-book3e.h
@@ -284,7 +284,6 @@ static inline unsigned int mmu_psize_to_shift(unsigned int mmu_psize)
 #error Unsupported page size
 #endif
 
-extern int mmu_linear_psize;
 extern int mmu_vmemmap_psize;
 
 struct tlb_core_data {
diff --git a/arch/powerpc/mm/nohash/tlb.c b/arch/powerpc/mm/nohash/tlb.c
index 647bf454a0fa..311281063d48 100644
--- a/arch/powerpc/mm/nohash/tlb.c
+++ b/arch/powerpc/mm/nohash/tlb.c
@@ -150,7 +150,6 @@ static inline int mmu_get_tsize(int psize)
  */
 #ifdef CONFIG_PPC64
 
-int mmu_linear_psize;		/* Page size used for the linear mapping */
 int mmu_pte_psize;		/* Page size used for PTE pages */
 int mmu_vmemmap_psize;		/* Page size used for the virtual mem map */
 int book3e_htw_mode;		/* HW tablewalk?  Value is PPC_HTW_* */
@@ -657,14 +656,6 @@ static void early_init_this_mmu(void)
 
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

