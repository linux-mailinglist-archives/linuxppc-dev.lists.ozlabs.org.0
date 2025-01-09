Return-Path: <linuxppc-dev+bounces-4914-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAADA077BC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 14:39:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTQq36Jktz3bxZ;
	Fri, 10 Jan 2025 00:38:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736429919;
	cv=none; b=BFkdaENeLWBc3Jimk4em+bt/Gzz+rxA5cwQy92AXgOIqC1jP0sHSfYgy2znx5qyHLsuFWavcmlDj9tsM/kIOrik0nv0QvNiCP/TzX5LoX1Ei2gn3SWX/KVyrl3mOTSV4mWMa8L/McfFYxlxK20S6ono10At2JF3tc3lPb7KQZoe9jW9p6wQbSBNi194jxyVeXu00t8WOG/Q8p4aCDWucvWFUrhdNLSUZhldGd42udGOtcEvs4YUeMx2JkZ3cK0TUHlNIKe5NzmpR05Rqawl82Bwe8D6HghX1Wmu9VP5BEADJ0JDOD5HCOEs2wLmyruMUmKIhEEyKiTsNU9OF6N8jnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736429919; c=relaxed/relaxed;
	bh=6U5GaYmzSeHIwPHM2TLhTcGPV4HaT+bdvS3rFAmfbSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=GEcVTgYBu8Xw+eE2/zCZ02KGRZJLhGLEIn+K65MvzaHEkWEb3z8XpS5D8t/qDsjSAFELJyobqTsZGVy0Gue8NnlKyVqKelLXBT9nuvY1ffIgSNx71bghXQauMV4GVNQQXeVthmpvWbBXT0A9e3enVt2ZY7B08GFUoU6+nVEEmow7vi0aW21A+8W42SVsORylzusiGkMWhw53IhuzVomZqevJFJPv7yM53nBqDI5XpBKoFzhz0XnYnqpp4cafFkRQY0qeok6R3PwKQKlWThJWyNyDZD9aWxRjJS8OPXFOBkwHf7ZbyVcS2AxD75un48fSh7CPpWkXvoyr9uwy6EAA4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PBK1e7qP; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=deoBHwpR; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PBK1e7qP;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=deoBHwpR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTQq25K6wz3bWf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 00:38:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736429915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6U5GaYmzSeHIwPHM2TLhTcGPV4HaT+bdvS3rFAmfbSs=;
	b=PBK1e7qPRfjQstjzxxBUvbTgE6H/ZSRe009kwpwlbG1qUcjOZ4MTlzcvliQWeZIBEcfBTJ
	5ZjMAUYbA1E4f5FT8ZKCDNvvXm0OI41D77t9AgVggYQBeJmQH+Rzyv+qUhUiFi4ky2SjFi
	I7n3oSfQY1TghGe20RRrLFWI8iqEpxk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736429916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6U5GaYmzSeHIwPHM2TLhTcGPV4HaT+bdvS3rFAmfbSs=;
	b=deoBHwpR2Tl3eU5XeS7nGrHgSfTVW+Oh66attqUmKG8Rv97i7V1/+K6Odih4AmWBwLpQTU
	gmgYx9t8TRoTqJzycM3Csx7mjEl86ITaT/pIYgVA2RxjGt6gjcrQLzOAe7BaJZwOAhkpek
	3M98UY4e7LdAfl05ok0fA2+QK1LTVRs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-TwFyS7wRPga8TRZw8Bg-Iw-1; Thu, 09 Jan 2025 08:38:34 -0500
X-MC-Unique: TwFyS7wRPga8TRZw8Bg-Iw-1
X-Mimecast-MFC-AGG-ID: TwFyS7wRPga8TRZw8Bg-Iw
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5d3eea3b9aaso677836a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jan 2025 05:38:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736429913; x=1737034713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6U5GaYmzSeHIwPHM2TLhTcGPV4HaT+bdvS3rFAmfbSs=;
        b=mk9QwaNCwXyvQnIVToBqkWMWTGxrFwOk1qQ08tZqSh2JldfJ+J/7SXON6rQkU+3g5s
         2Eg0r1EQ4dRLDV5Cj4xtm/p6MlhZ2E0bmQhUXZxQ7qZTfmrmoAhFpJ3DE2V+CiQ5P9W/
         aJ8UOWlKJefOBvQ4xaJPl1wsUisIFegFLOHdsjw9/IV8IV+UvIWmxoDiTfasgMx+4BLH
         iUGl51dTpGEhzpJWpaKAqZQPGXK02JWxfAVJuZI/3y0dCIm7J+xJyXtgGJN7G/i3v5Q8
         S4nrX+xq+8qjS0nZQ0KZNN6n3RhIpylU5nAcgS0jXim76rrJE0BjRYoHkPQYwpUQnE7K
         An3w==
X-Forwarded-Encrypted: i=1; AJvYcCV3+A8N7uJS0gNVmx01TYwxLLjdJl0QrReSzFV6Dx4fzIpCezcKDNjH3qombdzGQhxU0RD8IJnGW3MeJyc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw2neKyH7xuTlXNFwVwo5adPKtlt/pGvQJ/IiBbYy/Xh8KHJQiP
	II0sMFLQSoc1eNSShGk6ZWy49wUoM9gqyR0+HWJ9LXR7dZSpnkKNWzYf0TSrrbptJSPSBM2x4/t
	k8FOAo03X/YVJMUlNdmYd9oFX87d/RlG9wSU4MwR7wKGtJGAaujXFIuPOYZZSxJA=
X-Gm-Gg: ASbGncv42v8tCHRPl5GdM9Z+wdu6T2EpXGkidKGv9ZFCIzxcuNEqhCmkPL/B0TgKmYL
	2valifrYUP1UfktGrHWG2JAO1LZ0gfyuBhox47FLDTf+ui3nb3I+UZW0UKFdA+tJz+dmZKo361h
	JxtH94fDZAyNsDSDVLT3dhQ1QUtX80JuWdeCZtXw5P7ydPnOh21JVSEPsOEVlwD8ibTgPSOG98u
	HKHLc2vifH/7/b7f9mMfYh6o9o/mEypTnvq9CtiP033t4qm8tWO6NJrYVw9
X-Received: by 2002:a05:6402:5251:b0:5d0:bf5e:eb8 with SMTP id 4fb4d7f45d1cf-5d972e63ddfmr13854957a12.23.1736429913101;
        Thu, 09 Jan 2025 05:38:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvrvZyCjR9P8H1XfDQSbpZ1ii019x3nOmgFJfPU4BSjpH27IgNbkbMhVv45gD16B6Iwt+Skw==
X-Received: by 2002:a05:6402:5251:b0:5d0:bf5e:eb8 with SMTP id 4fb4d7f45d1cf-5d972e63ddfmr13854906a12.23.1736429912705;
        Thu, 09 Jan 2025 05:38:32 -0800 (PST)
Received: from [192.168.10.47] ([151.62.105.73])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c90d6a4csm73856966b.71.2025.01.09.05.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 05:38:32 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: oliver.upton@linux.dev,
	Will Deacon <will@kernel.org>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	seanjc@google.com,
	linuxppc-dev@lists.ozlabs.org,
	regressions@lists.linux.dev
Subject: [PATCH 5/5] KVM: e500: perform hugepage check after looking up the PFN
Date: Thu,  9 Jan 2025 14:38:17 +0100
Message-ID: <20250109133817.314401-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250109133817.314401-1-pbonzini@redhat.com>
References: <20250109133817.314401-1-pbonzini@redhat.com>
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
X-Mimecast-MFC-PROC-ID: EWjeGfVayUIgiNtrSJFbSvBQSrITt3jqPM1m57Tksyg_1736429913
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
 arch/powerpc/kvm/e500_mmu_host.c | 180 ++++++++++++-------------------
 1 file changed, 70 insertions(+), 110 deletions(-)

diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index 7752b7f24c51..0457bbc2526f 100644
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
@@ -361,111 +360,12 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 
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
@@ -483,7 +383,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 	 * can't run hence pfn won't change.
 	 */
 	local_irq_save(flags);
-	ptep = find_linux_pte(pgdir, hva, NULL, NULL);
+	ptep = find_linux_pte(pgdir, hva, NULL, &psize);
 	if (ptep) {
 		pte_t pte = READ_ONCE(*ptep);
 
@@ -500,6 +400,66 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 		}
 	}
 
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


