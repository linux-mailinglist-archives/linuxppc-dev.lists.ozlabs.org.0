Return-Path: <linuxppc-dev+bounces-5092-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12737A0A815
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Jan 2025 10:56:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YW9kd16Zyz30hj;
	Sun, 12 Jan 2025 20:55:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736675753;
	cv=none; b=BjtJM5Jvbb6slfw07SXAX2GvvoUwYC07HBdbbdGGy0KFLmGegSOFcV9YIVWX2h2X/ajJL8t9wnhZ8IOc3elMsLen9WR7+RErMWoB7EyzuDmTbBAadh0QsS2vLOhPWtkY2OaobZKtHpzDTOYWpMq/6rbu3CXLLvFVQeLiwz0JrzRNnbH/8A+GjjZsuxXxweorIabjhQAb2Kms83xvdHwOQm3Ts7ubUa6sZbUY1ILp48GOuGHQvFi0TOBZD+oXlJ7tx32q6lkDLUxFIkXj/sgRqBPhvaVfSXn5UxK8QKmVUIfi7bBZHK+ATP5Joyv78jm2FAKi7t94sciEWYCw9+VE3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736675753; c=relaxed/relaxed;
	bh=Oz+x9gnVbLji0IqeGhkpb/XHZ9boA09CCOsisxRXiHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=PcYYi2B/U7fJm/bPYsE7JgEJ4DtzBkps6MNt6HM20wMLxtvL6+Mlovi74Eg7O9tdHLIPADMQIVOeTeWupQohHN1GoakRetL5bBXg3v2W/2hkfhLVcIeDRPcJS0kdwk8bHXnmjvSWMa9nHCuTHSptkct2Ew1x92mDIPu+lu3lH4LdeP8Lymf6QM1sLsW2UvFb5l5CkoEZfdc+POviBwcPpV0G6HQGSZuN+ul12hcXrbPEgzDZ7i6vLk8BZSu8nZfyfXEwaxSMrJ9GHHtusCdRzHmOunLVRGqXknZS0hdTtTEB2FdkQT1xmUfx8K+Zc25BnZp20QTmKuTvVpLER+yAEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NRfSvUYa; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Cu5PQt8K; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NRfSvUYa;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Cu5PQt8K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YW9kc269Cz30WF
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jan 2025 20:55:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736675748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oz+x9gnVbLji0IqeGhkpb/XHZ9boA09CCOsisxRXiHY=;
	b=NRfSvUYa+MQHWryKoSPeSRMt+tx/51e44DJkwoaFOlXIVIxoHD620Y+VC9PAT2Ok8g0gSO
	amNgDV2SAhkp3FH+/885LTy0IyUHQI9akJxk6McktlJqujd8L/OEU3MAt+Hf47ts3BxR1j
	OsE/DakdX8q/YUCFmJ8FtUNEkAU40p8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736675749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oz+x9gnVbLji0IqeGhkpb/XHZ9boA09CCOsisxRXiHY=;
	b=Cu5PQt8Kof++lF3wTeelwKuGZLXq8NRAq/7K9Ll4ro2b9viGxpXnfGVPzOeYbeoGKDvMQa
	4D06EbSNgSGBdkFa8vRxlXIrbpF8yYt7wflFa4I2c83ZATUkDIYf5cOW9RpAJCxODnmYCM
	gVJAWs0JUBtKkBPqUjM2523bVY3f+r8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-540-fSsHudNkNZmceCq-egbc-w-1; Sun, 12 Jan 2025 04:55:47 -0500
X-MC-Unique: fSsHudNkNZmceCq-egbc-w-1
X-Mimecast-MFC-AGG-ID: fSsHudNkNZmceCq-egbc-w
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5d3ff30b566so3230309a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jan 2025 01:55:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736675746; x=1737280546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oz+x9gnVbLji0IqeGhkpb/XHZ9boA09CCOsisxRXiHY=;
        b=CYgKi9uDeuFAFEQA5YBBLxWBifQJ84qtQDjbUQur6bYWd+JZZoMGB+TX9EgYkOeYq8
         kZTCOFqcAeBBFRNU8TX72k1Hqdgpq7y2VjlH3Aqm/mDF/cjgY7STb1xnH5s3eWUowBZ9
         wS3QDonpxi44AHzlzPQAesCHwWF+N4t8v/mTwGlBaR3d5ejSMKPsiaJKp6vS/9yX3ISO
         ei5mIAdoNuQwN+W04w0goewL1b63/joEGAWq49zx8441VfmeH5bPBxAScnQRhOoB7xOs
         hyRRCl0RqEZxgmae+uExR4eSByBi5JdvGbXLWlJBaxUdlUudy1JoPcjvDh883RQ21/Cy
         QKsw==
X-Forwarded-Encrypted: i=1; AJvYcCVm0WwZ2DenrOVRyc9EKAHo+UTvJFpF1VHxZQdyGo4dRj8MEcwoQOZFEBTHINGv480OIyf4dNdMADcG6ko=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy8ZJANyENJ1vtSJitF+YMff7M7zO6sCX52AcjGqmKxbYbDJxRx
	WUQ0vcatmr50wP1B0yUvUv+6GW/tbiqEngEFL6w9K2NFkmseGgcuJYF5TxneSoZ0RfqyNePQ/Lq
	EUXnVxEHTjLgAE+6PoNqwAr1ULFbCZlWIyHsU2TvMQBKjPEusFyqzWnhFOkPE1cQ=
X-Gm-Gg: ASbGncsM1I1FhMG/bjjKy46Um4dQzfzZktf/jAp7ea6czF/jmHn10hZSb0H/0N3LQXW
	sC21mDw9pQotyi4OT14Wc97fmXRE/Vu+rWqPrxOx698NjIE91RY6LUB/XEGMbbStNi9BUPCjJkG
	sZ3Cwjyi7MqSRBSQdOGSDpt1tMhOfXOXeLAxvxlHioqWxYkKyK5W5aUL3BvAXZpyUMCaNW5ycVM
	ysT2wdiH3n59XQPl7O2TUVl/81I+p1AAHS2IHmAxJ1eEkc2GEq48Y+2IIk=
X-Received: by 2002:a05:6402:51d0:b0:5d2:7346:3ecb with SMTP id 4fb4d7f45d1cf-5d972e08366mr15294467a12.12.1736675745737;
        Sun, 12 Jan 2025 01:55:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwE26l9isFf3nQZmRGpyTPcP8J8/ysUQYlXL5+4ti/a8bZoN63209mlmD5afvsephqydEaqg==
X-Received: by 2002:a05:6402:51d0:b0:5d2:7346:3ecb with SMTP id 4fb4d7f45d1cf-5d972e08366mr15294450a12.12.1736675745359;
        Sun, 12 Jan 2025 01:55:45 -0800 (PST)
Received: from [192.168.10.3] ([151.62.105.73])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9900c3fccsm3491359a12.21.2025.01.12.01.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 01:55:43 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: seanjc@google.com,
	linuxppc-dev@lists.ozlabs.org,
	regressions@lists.linux.dev,
	Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: [PATCH 5/5] KVM: e500: perform hugepage check after looking up the PFN
Date: Sun, 12 Jan 2025 10:55:27 +0100
Message-ID: <20250112095527.434998-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250112095527.434998-1-pbonzini@redhat.com>
References: <20250112095527.434998-1-pbonzini@redhat.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RxfcL5Oo1Mwa-vy_MAIrqRZptQYMEb82DKc9CUpVuxY_1736675746
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

e500 KVM tries to bypass __kvm_faultin_pfn() in order to map VM_PFNMAP
VMAs as huge pages.  This is a Bad Idea because VM_PFNMAP VMAs could
become noncontiguous as a result of callsto remap_pfn_range().

Instead, use the already existing host PTE lookup to retrieve a
valid host-side mapping level after __kvm_faultin_pfn() has
returned.  Then find the largest size that will satisfy the
guest's request while staying within a single host PTE.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/powerpc/kvm/e500_mmu_host.c | 178 ++++++++++++-------------------
 1 file changed, 69 insertions(+), 109 deletions(-)

diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index b38679e5821b..06caf8bbbe2b 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -326,15 +326,14 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 	struct tlbe_ref *ref)
 {
 	struct kvm_memory_slot *slot;
-	unsigned long pfn = 0; /* silence GCC warning */
+	unsigned int psize;
+	unsigned long pfn;
 	struct page *page = NULL;
 	unsigned long hva;
-	int pfnmap = 0;
 	int tsize = BOOK3E_PAGESZ_4K;
 	int ret = 0;
 	unsigned long mmu_seq;
 	struct kvm *kvm = vcpu_e500->vcpu.kvm;
-	unsigned long tsize_pages = 0;
 	pte_t *ptep;
 	unsigned int wimg = 0;
 	pgd_t *pgdir;
@@ -356,111 +355,12 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 	slot = gfn_to_memslot(vcpu_e500->vcpu.kvm, gfn);
 	hva = gfn_to_hva_memslot(slot, gfn);
 
-	if (tlbsel == 1) {
-		struct vm_area_struct *vma;
-		mmap_read_lock(kvm->mm);
-
-		vma = find_vma(kvm->mm, hva);
-		if (vma && hva >= vma->vm_start &&
-		    (vma->vm_flags & VM_PFNMAP)) {
-			/*
-			 * This VMA is a physically contiguous region (e.g.
-			 * /dev/mem) that bypasses normal Linux page
-			 * management.  Find the overlap between the
-			 * vma and the memslot.
-			 */
-
-			unsigned long start, end;
-			unsigned long slot_start, slot_end;
-
-			pfnmap = 1;
-			writable = vma->vm_flags & VM_WRITE;
-
-			start = vma->vm_pgoff;
-			end = start +
-			      vma_pages(vma);
-
-			pfn = start + ((hva - vma->vm_start) >> PAGE_SHIFT);
-
-			slot_start = pfn - (gfn - slot->base_gfn);
-			slot_end = slot_start + slot->npages;
-
-			if (start < slot_start)
-				start = slot_start;
-			if (end > slot_end)
-				end = slot_end;
-
-			tsize = (gtlbe->mas1 & MAS1_TSIZE_MASK) >>
-				MAS1_TSIZE_SHIFT;
-
-			/*
-			 * e500 doesn't implement the lowest tsize bit,
-			 * or 1K pages.
-			 */
-			tsize = max(BOOK3E_PAGESZ_4K, tsize & ~1);
-
-			/*
-			 * Now find the largest tsize (up to what the guest
-			 * requested) that will cover gfn, stay within the
-			 * range, and for which gfn and pfn are mutually
-			 * aligned.
-			 */
-
-			for (; tsize > BOOK3E_PAGESZ_4K; tsize -= 2) {
-				unsigned long gfn_start, gfn_end;
-				tsize_pages = 1UL << (tsize - 2);
-
-				gfn_start = gfn & ~(tsize_pages - 1);
-				gfn_end = gfn_start + tsize_pages;
-
-				if (gfn_start + pfn - gfn < start)
-					continue;
-				if (gfn_end + pfn - gfn > end)
-					continue;
-				if ((gfn & (tsize_pages - 1)) !=
-				    (pfn & (tsize_pages - 1)))
-					continue;
-
-				gvaddr &= ~((tsize_pages << PAGE_SHIFT) - 1);
-				pfn &= ~(tsize_pages - 1);
-				break;
-			}
-		} else if (vma && hva >= vma->vm_start &&
-			   is_vm_hugetlb_page(vma)) {
-			unsigned long psize = vma_kernel_pagesize(vma);
-
-			tsize = (gtlbe->mas1 & MAS1_TSIZE_MASK) >>
-				MAS1_TSIZE_SHIFT;
-
-			/*
-			 * Take the largest page size that satisfies both host
-			 * and guest mapping
-			 */
-			tsize = min(__ilog2(psize) - 10, tsize);
-
-			/*
-			 * e500 doesn't implement the lowest tsize bit,
-			 * or 1K pages.
-			 */
-			tsize = max(BOOK3E_PAGESZ_4K, tsize & ~1);
-		}
-
-		mmap_read_unlock(kvm->mm);
-	}
-
-	if (likely(!pfnmap)) {
-		tsize_pages = 1UL << (tsize + 10 - PAGE_SHIFT);
-		pfn = __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, &writable, &page);
-		if (is_error_noslot_pfn(pfn)) {
-			if (printk_ratelimit())
-				pr_err("%s: real page not found for gfn %lx\n",
-				       __func__, (long)gfn);
-			return -EINVAL;
-		}
-
-		/* Align guest and physical address to page map boundaries */
-		pfn &= ~(tsize_pages - 1);
-		gvaddr &= ~((tsize_pages << PAGE_SHIFT) - 1);
+	pfn = __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, &writable, &page);
+	if (is_error_noslot_pfn(pfn)) {
+		if (printk_ratelimit())
+			pr_err("%s: real page not found for gfn %lx\n",
+			       __func__, (long)gfn);
+		return -EINVAL;
 	}
 
 	spin_lock(&kvm->mmu_lock);
@@ -478,7 +378,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 	 * can't run hence pfn won't change.
 	 */
 	local_irq_save(flags);
-	ptep = find_linux_pte(pgdir, hva, NULL, NULL);
+	ptep = find_linux_pte(pgdir, hva, NULL, &psize);
 	if (ptep) {
 		pte_t pte = READ_ONCE(*ptep);
 
@@ -495,6 +395,66 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 	}
 	local_irq_restore(flags);
 
+	if (psize && tlbsel == 1) {
+		unsigned long psize_pages, tsize_pages;
+		unsigned long start, end;
+		unsigned long slot_start, slot_end;
+
+		psize_pages = 1UL << (psize - PAGE_SHIFT);
+		start = pfn & ~(psize_pages - 1);
+		end = start + psize_pages;
+
+		slot_start = pfn - (gfn - slot->base_gfn);
+		slot_end = slot_start + slot->npages;
+
+		if (start < slot_start)
+			start = slot_start;
+		if (end > slot_end)
+			end = slot_end;
+
+		tsize = (gtlbe->mas1 & MAS1_TSIZE_MASK) >>
+			MAS1_TSIZE_SHIFT;
+
+		/*
+		 * Any page size that doesn't satisfy the host mapping
+		 * will fail the start and end tests.
+		 */
+		tsize = min(psize - PAGE_SHIFT + BOOK3E_PAGESZ_4K, tsize);
+
+		/*
+		 * e500 doesn't implement the lowest tsize bit,
+		 * or 1K pages.
+		 */
+		tsize = max(BOOK3E_PAGESZ_4K, tsize & ~1);
+
+		/*
+		 * Now find the largest tsize (up to what the guest
+		 * requested) that will cover gfn, stay within the
+		 * range, and for which gfn and pfn are mutually
+		 * aligned.
+		 */
+
+		for (; tsize > BOOK3E_PAGESZ_4K; tsize -= 2) {
+			unsigned long gfn_start, gfn_end;
+			tsize_pages = 1UL << (tsize - 2);
+
+			gfn_start = gfn & ~(tsize_pages - 1);
+			gfn_end = gfn_start + tsize_pages;
+
+			if (gfn_start + pfn - gfn < start)
+				continue;
+			if (gfn_end + pfn - gfn > end)
+				continue;
+			if ((gfn & (tsize_pages - 1)) !=
+			    (pfn & (tsize_pages - 1)))
+				continue;
+
+			gvaddr &= ~((tsize_pages << PAGE_SHIFT) - 1);
+			pfn &= ~(tsize_pages - 1);
+			break;
+		}
+	}
+
 	kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg, writable);
 	kvmppc_e500_setup_stlbe(&vcpu_e500->vcpu, gtlbe, tsize,
 				ref, gvaddr, stlbe);
-- 
2.47.1


