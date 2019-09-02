Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 83261A5ADD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 17:55:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MZRm5rM3zDqVT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 01:55:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cSllMBgo"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MYxT19lczDqd3
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 01:32:43 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id s12so2159046pfe.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Sep 2019 08:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rb66OYZoSHjM70lDfb6cl+HcgjE0ImA64HLB7s+BLpk=;
 b=cSllMBgosLYE15ao3VfFbC+X2cegyxURvkigkguSDNIxLLYL9JkTpahd5oI6g03mOn
 s5LoQgtzgzIL24EhO+5lWKwmZsmxJUKdNb70VEAZghN/wfUxbl76krugSiKYRF21qGQL
 ywSjlVgefc0jYt1EhD+laOkFFkuOA49Yoxza6xn33gdk1aJRg20fQlNYHt1b4h29YkUE
 Zd9sGm23CG0SveLZV6zsnrPq6OkgSW0mHUsdaJ/m0r0r2Wx36+L9T9Wm2dDsQ4c31jZ+
 EBB5H2uurl4w+q8GcP0I1z1MvUpJq/XIxjwlzIqV6727sP8tZ6wKHsNEoRmCnRz9j62X
 NN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rb66OYZoSHjM70lDfb6cl+HcgjE0ImA64HLB7s+BLpk=;
 b=Kdq8p5sApFk209WyiaY7sE5SVhZyy6DwJrYxfAmUs/G+BoGRjti0Td3Xk8HhPqCUHY
 Sc+UW8xj+S8gLemnFdczfJXpV9s/6j53cmuLDwGHlYiVsBkR608JFG25sqxDXtyqietA
 5TYvp8mg58ntiOG56qvx5bypKpjfCIRSkMeGmEHMaeqFMF7IfgqucSYFA+s0jaqDoRwD
 t4vvpSyp49VdpzuS/h3VR3mMMH8NNB9gPfblrLgFS7LXYCAb9gij4jIPDVG3yxhi9uEL
 NUtLelEgx5lLqSSmgxGwDOt7SPvoKh+sgZtPEXykuVv94ahBUPcWPS0owpKEwN76jTrN
 XbsQ==
X-Gm-Message-State: APjAAAUzn3uJsi9FuZpT/qHzcjSzJgy1tLkbOX3IwXBsO1eaPeNHC9rJ
 lVl1JRjq87XF+SA35CWe7pWB2bns2Cs=
X-Google-Smtp-Source: APXvYqwsNHral64lr7SroT11FvTZG61NH/+O7dHAkvdJPJb+4Lldw+WS/Ssp3651PiGinRqaEIYY+A==
X-Received: by 2002:a63:fa11:: with SMTP id y17mr25868463pgh.267.1567438361015; 
 Mon, 02 Sep 2019 08:32:41 -0700 (PDT)
Received: from bobo.local0.net ([61.68.187.15])
 by smtp.gmail.com with ESMTPSA id b14sm15966033pfo.15.2019.09.02.08.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 08:32:40 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/6] powerpc/64s: remove unnecessary translation cache flushes
 at boot
Date: Tue,  3 Sep 2019 01:29:30 +1000
Message-Id: <20190902152931.17840-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190902152931.17840-1-npiggin@gmail.com>
References: <20190902152931.17840-1-npiggin@gmail.com>
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

The various translation structure invalidations performed in early boot
when the MMU is off are not required, because everything is invalidated
immediately before a CPU first enables its MMU (see early_init_mmu
and early_init_mmu_secondary).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c    | 2 +-
 arch/powerpc/mm/book3s64/pgtable.c       | 5 +++++
 arch/powerpc/mm/book3s64/radix_pgtable.c | 8 +-------
 arch/powerpc/platforms/pseries/lpar.c    | 5 -----
 4 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index b73d08b54d12..7684a596158b 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -825,7 +825,7 @@ static void __init hash_init_partition_table(phys_addr_t hash_table,
 	 * For now, UPRT is 0 and we have no segment table.
 	 */
 	htab_size =  __ilog2(htab_size) - 18;
-	mmu_partition_table_set_entry(0, hash_table | htab_size, 0, true);
+	mmu_partition_table_set_entry(0, hash_table | htab_size, 0, false);
 	pr_info("Partition table %p\n", partition_tb);
 }
 
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 6fab9c0bbbaf..351eb78eed55 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -252,6 +252,11 @@ void mmu_partition_table_set_entry(unsigned int lpid, unsigned long dw0,
 		pr_info("PATE registered by ultravisor: dw0 = 0x%lx, dw1 = 0x%lx\n",
 			dw0, dw1);
 	} else if (flush) {
+		/*
+		 * Boot does not need to flush, because MMU is off and each
+		 * CPU does a tlbiel_all() before switching them on, which
+		 * flushes everything.
+		 */
 		flush_partition(lpid, (old & PATB_HR));
 	}
 }
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index e1e711c4704a..0d1107fb34c1 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -396,13 +396,7 @@ static void __init radix_init_partition_table(void)
 	rts_field = radix__get_tree_size();
 	dw0 = rts_field | __pa(init_mm.pgd) | RADIX_PGD_INDEX_SIZE | PATB_HR;
 	dw1 = __pa(process_tb) | (PRTB_SIZE_SHIFT - 12) | PATB_GR;
-	mmu_partition_table_set_entry(0, dw0, dw1, true);
-
-	asm volatile("ptesync" : : : "memory");
-	asm volatile(PPC_TLBIE_5(%0,%1,2,1,1) : :
-		     "r" (TLBIEL_INVAL_SET_LPID), "r" (0));
-	asm volatile("eieio; tlbsync; ptesync" : : : "memory");
-	trace_tlbie(0, 0, TLBIEL_INVAL_SET_LPID, 0, 2, 1, 1);
+	mmu_partition_table_set_entry(0, dw0, dw1, false);
 
 	pr_info("Initializing Radix MMU\n");
 	pr_info("Partition table %p\n", partition_tb);
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index b3205a6c950c..36b846f6e74e 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -1549,11 +1549,6 @@ void radix_init_pseries(void)
 
 	pseries_lpar_register_process_table(__pa(process_tb),
 						0, PRTB_SIZE_SHIFT - 12);
-	asm volatile("ptesync" : : : "memory");
-	asm volatile(PPC_TLBIE_5(%0,%1,2,1,1) : :
-		     "r" (TLBIEL_INVAL_SET_LPID), "r" (0));
-	asm volatile("eieio; tlbsync; ptesync" : : : "memory");
-	trace_tlbie(0, 0, TLBIEL_INVAL_SET_LPID, 0, 2, 1, 1);
 }
 
 #ifdef CONFIG_PPC_SMLPAR
-- 
2.22.0

