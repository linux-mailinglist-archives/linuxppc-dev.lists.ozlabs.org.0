Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF99B53354B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 04:25:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7FKt5Rzbz3c8B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 12:25:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lYcOVfiN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lYcOVfiN; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7FJ03BT2z300K
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 12:24:16 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id a17so1325341plb.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 19:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UKRHNhzXOhCCAytx+2499bnluNaoNyH6qwooIgwqcVM=;
 b=lYcOVfiNmqMoNDdn42RUKUjvNis3HvYWG2IVJQxJM9aAmMsJQ5PLFakWRpzBfp1WRq
 c867Zw8UBQ1pwGCUU6shU3zYGckFjN20t/o7P3+j+RptZTwKy0by9+Lr3BHSl4eKz4XM
 4GwGnSiAoPQu8InU1PVAws523Ds3T5i/NqgjSSo8rQUgXPB9S/lX1hn0Od+7C47KyMrB
 j/Vq7RnA8SDazg59oI3j/KngZ2wgGXiea4tWaB3NeTvZD5nB1OYtgPg2LGGATpzFy1T8
 jZfm1Mxddpep1EX8pxwGLYkCBe1iYR1A/kpF3Vrp6q7GJvZSRGwMPQo7qkdLxdeihc3q
 3exg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UKRHNhzXOhCCAytx+2499bnluNaoNyH6qwooIgwqcVM=;
 b=s17+oRfXDqmdvWYReDp+yZnOeuCu7f32MU9KFrH0r5tZXJuARqz8jU882h8Xnah2Aw
 EOllDbsoPskaLrHkQB22Kf9iTEPeX+15W0ZhLP4eQ9yY0CYg2HNBVXiAvaENqwQtifuo
 mp4/71B9K6EJrOHLaACjvAMMBWAXc/cbLfTC51ks96AY8/KaZHf8tfSRe5lc8/57mMA7
 ty7J8c96SPG4cb2ibcb2x7wW2k6h1PznAuHhaiQnPBuJW7TBXeLvHv8q/USVAEdTCkCj
 89qzdpP7bdAmkcA+oKgH9sy6bhyI+rO4I2dp5evlYqP2O5VYCy+2iZGYlB0+a2eIy7tg
 fYoA==
X-Gm-Message-State: AOAM531GHkUNJF6CA8QARPCHLu5MPzHY1IMZBVJXzO+t6P8KGIWXMeQz
 cyTWrEfFeh5Q5mrerhsNTEBMgJ/mJ2M=
X-Google-Smtp-Source: ABdhPJyhd4NzPDUChm0/MkFPf1ZuJlfqASJ0M8EMLx3rpLoBoRg2LZqcB0KWLYjBHxeDJZt8d4Yarg==
X-Received: by 2002:a17:90b:1c8e:b0:1dd:24f3:c6f6 with SMTP id
 oo14-20020a17090b1c8e00b001dd24f3c6f6mr7763187pjb.244.1653445455703; 
 Tue, 24 May 2022 19:24:15 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([118.209.250.103])
 by smtp.gmail.com with ESMTPSA id
 p19-20020a1709028a9300b00161a9df4de8sm7884617plo.145.2022.05.24.19.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 19:24:14 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] powerpc/64s: POWER10 nest MMU can upgrade PTE access
 authority without TLB flush
Date: Wed, 25 May 2022 12:23:57 +1000
Message-Id: <20220525022358.780745-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220525022358.780745-1-npiggin@gmail.com>
References: <20220525022358.780745-1-npiggin@gmail.com>
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Haren Myneni <haren@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The nest MMU in POWER9 does not re-fetch the PTE in response to
permission mismatch, contrary to the architecture[*] and unlike the core
MMU. This requires a TLB flush before upgrading permissions of valid
PTEs, for any address space with a coprocessor attached.

Per (non-public) Nest MMU Workbook, POWER10 nest MMU conforms to the
architecture in this regard, so skip the workaround.

[*] See: Power ISA Version 3.1B, 6.10.1.2 Modifying a Translation Table
    Entry, Setting a Reference or Change Bit or Upgrading Access
    Authority (PTE Subject to Atomic Hardware Updates):

      "If the only change being made to a valid PTE that is subject to
       atomic hardware updates is to set the Reference or Change bit to
       1 or to upgrade access authority, a simpler sequence suffices
       because the translation hardware will refetch the PTE if an
       access is attempted for which the only problems were reference
       and/or change bits needing to be set or insufficient access
       authority."

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/radix_hugetlbpage.c | 10 +++---
 arch/powerpc/mm/book3s64/radix_pgtable.c     | 35 ++++++++++++--------
 2 files changed, 28 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_hugetlbpage.c b/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
index 23d3e08911d3..78618c9b618b 100644
--- a/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
+++ b/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
@@ -103,11 +103,13 @@ void radix__huge_ptep_modify_prot_commit(struct vm_area_struct *vma,
 	struct mm_struct *mm = vma->vm_mm;
 
 	/*
-	 * To avoid NMMU hang while relaxing access we need to flush the tlb before
-	 * we set the new value.
+	 * POWER9 NMMU must flush the TLB after clearing the PTE before
+	 * installing a PTE with more relaxed access permissions, see
+	 * radix__ptep_set_access_flags.
 	 */
-	if (is_pte_rw_upgrade(pte_val(old_pte), pte_val(pte)) &&
-	    (atomic_read(&mm->context.copros) > 0))
+	if (!cpu_has_feature(CPU_FTR_ARCH_31) &&
+	    is_pte_rw_upgrade(pte_val(old_pte), pte_val(pte)) &&
+	    atomic_read(&mm->context.copros) > 0)
 		radix__flush_hugetlb_page(vma, addr);
 
 	set_huge_pte_at(vma->vm_mm, addr, ptep, pte);
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index def04631a74d..195719a6c41c 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1018,16 +1018,21 @@ void radix__ptep_set_access_flags(struct vm_area_struct *vma, pte_t *ptep,
 
 	unsigned long change = pte_val(entry) ^ pte_val(*ptep);
 	/*
-	 * To avoid NMMU hang while relaxing access, we need mark
-	 * the pte invalid in between.
+	 * On POWER9, the NMMU is not able to relax PTE access permissions
+	 * for a translation with a TLB. The PTE must be invalidated, TLB
+	 * flushed before the new PTE is installed.
+	 *
+	 * This only needs to be done for radix, because hash translation does
+	 * flush when updating the linux pte (and we don't support NMMU
+	 * accelerators on HPT on POWER9 anyway XXX: do we?).
+	 *
+	 * POWER10 (and P9P) NMMU does behave as per ISA.
 	 */
-	if ((change & _PAGE_RW) && atomic_read(&mm->context.copros) > 0) {
+	if (!cpu_has_feature(CPU_FTR_ARCH_31) && (change & _PAGE_RW) &&
+	    atomic_read(&mm->context.copros) > 0) {
 		unsigned long old_pte, new_pte;
 
 		old_pte = __radix_pte_update(ptep, _PAGE_PRESENT, _PAGE_INVALID);
-		/*
-		 * new value of pte
-		 */
 		new_pte = old_pte | set;
 		radix__flush_tlb_page_psize(mm, address, psize);
 		__radix_pte_update(ptep, _PAGE_INVALID, new_pte);
@@ -1035,9 +1040,12 @@ void radix__ptep_set_access_flags(struct vm_area_struct *vma, pte_t *ptep,
 		__radix_pte_update(ptep, 0, set);
 		/*
 		 * Book3S does not require a TLB flush when relaxing access
-		 * restrictions when the address space is not attached to a
-		 * NMMU, because the core MMU will reload the pte after taking
-		 * an access fault, which is defined by the architecture.
+		 * restrictions when the address space (modulo the POWER9 nest
+		 * MMU issue above) because the MMU will reload the PTE after
+		 * taking an access fault, as defined by the architecture. See
+		 * "Setting a Reference or Change Bit or Upgrading Access
+		 *  Authority (PTE Subject to Atomic Hardware Updates)" in
+		 *  Power ISA Version 3.1B.
 		 */
 	}
 	/* See ptesync comment in radix__set_pte_at */
@@ -1050,11 +1058,12 @@ void radix__ptep_modify_prot_commit(struct vm_area_struct *vma,
 	struct mm_struct *mm = vma->vm_mm;
 
 	/*
-	 * To avoid NMMU hang while relaxing access we need to flush the tlb before
-	 * we set the new value. We need to do this only for radix, because hash
-	 * translation does flush when updating the linux pte.
+	 * POWER9 NMMU must flush the TLB after clearing the PTE before
+	 * installing a PTE with more relaxed access permissions, see
+	 * radix__ptep_set_access_flags.
 	 */
-	if (is_pte_rw_upgrade(pte_val(old_pte), pte_val(pte)) &&
+	if (!cpu_has_feature(CPU_FTR_ARCH_31) &&
+	    is_pte_rw_upgrade(pte_val(old_pte), pte_val(pte)) &&
 	    (atomic_read(&mm->context.copros) > 0))
 		radix__flush_tlb_page(vma, addr);
 
-- 
2.35.1

