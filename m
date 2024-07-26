Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2D693DBEE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:10:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=T428VIhI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW4l94Mbrz3fr3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:10:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=T428VIhI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com; envelope-from=3-takzgykddqiuqdzsweewbu.secbydknffs-tulbyiji.epbqri.ehw@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4Mb2Sh3z3d9s
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:53:31 +1000 (AEST)
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-70d19a4137dso1422863b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038010; x=1722642810; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=tUI1d5PvM6nQSFLRYt7w7bGZCStWjtac1YnX2jIYbCg=;
        b=T428VIhILoXiHhGlz2yF6wqKP/ZSIOcBqagLAl1kPJJx1gRofj2YL2XIMfvO0BLG1w
         NZN95iH7wQPL/3xTefjrcrWO0gc/Vj8pNlfFTBTUZ6XXhCv/CpVuzIckhI97u3UGadJZ
         sa1sQoeSbGtcg6B3RZrYcXPLWvOZg+OZpbtxSwN0jHtR3gJaJP0dzRzW0wLnnzeX9rb6
         wtMYROF47+1gx3xnP7Pyzf2kXdETCgeapYb2imdC53qUSlcnQRu0XhV4vwud4zFq5fTZ
         FoXiQsTIuAJpNSOmXU9DEqih0i/l5UUNWt7UHXfRM0Q5HPOovl6p/yvutmYzFO2T30dJ
         6xSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038010; x=1722642810;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tUI1d5PvM6nQSFLRYt7w7bGZCStWjtac1YnX2jIYbCg=;
        b=Q8QE2aURV7j23qx9aZ28T3/tR6h7gc357kJDMO2MO6OqmseCMtVTqiuMBU1uJTX7qh
         WP3ntI/VWz8GoiIsSkslBRBreO0y4+JfbZp0jlW2wFtNBuei5cDQ8aRc4BzlujOcp3hO
         jkucn4y5lj7sdi18jZigRBvOperTldOH1sRp0HM6wtZr9CtGULAiyUM64Vimiu9s46YH
         QfhgBY3GWVVVsUYG84lp+ecfQg5uep+TUA3Mq6mD7XpkTJ4Z4I25dx750pNlRT9Tc5rh
         RWBInGsB0Jxsuq12xZCTvF04R//u0MzwkYWQoJVxUyZFSlc8JREa4jZ5o7xfKb2hei9M
         uNSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsD86FSBucHrLup6C5efWLrNEj8OATQggOlRgUjI2LtKot8yDxkpZlTVIFBPt2IF0aSkuU5HVX52QgMPBGTvT4OTKlXZXYBy/URStVOw==
X-Gm-Message-State: AOJu0YxlOIo7Z39sRmlgJ6cMovgnhRvGaryl3cijU8tSKikmBepn5Aht
	U20OpvGvjUkZ9XnBZf/kZRIO6WTp0mdcqL4isqWtAA1WcsxAxlZ8UqIx0UmAGVb6gX3EHks6GFr
	cVg==
X-Google-Smtp-Source: AGHT+IGIDN5ccGIB3cs8xyjoNBA33aBwY8OuaAQU+QnM7LAxDHF+KLZuhqGJARF7orYR9wXwPpBL0fgCScs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:8593:b0:70d:3466:2f1a with SMTP id
 d2e1a72fcca58-70ece63fd2emr7784b3a.1.1722038009466; Fri, 26 Jul 2024 16:53:29
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:34 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-26-seanjc@google.com>
Subject: [PATCH v12 25/84] KVM: Provide refcounted page as output field in
 struct kvm_follow_pfn
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Reply-To: Sean Christopherson <seanjc@google.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, loongarch@lists.linux.dev, kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add kvm_follow_pfn.refcounted_page as an output for the "to pfn" APIs to
"return" the struct page that is associated with the returned pfn (if KVM
acquired a reference to the page).  This will eventually allow removing
KVM's hacky kvm_pfn_to_refcounted_page() code, which is error prone and
can't detect pfns that are valid, but aren't (currently) refcounted.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 100 +++++++++++++++++++++-----------------------
 virt/kvm/kvm_mm.h   |   9 ++++
 2 files changed, 56 insertions(+), 53 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 8e83d3f043f1..31570c5627e3 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2756,6 +2756,46 @@ static inline int check_user_page_hwpoison(unsigned long addr)
 	return rc == -EHWPOISON;
 }
 
+static kvm_pfn_t kvm_resolve_pfn(struct kvm_follow_pfn *kfp, struct page *page,
+				 pte_t *pte, bool writable)
+{
+	kvm_pfn_t pfn;
+
+	WARN_ON_ONCE(!!page == !!pte);
+
+	if (kfp->map_writable)
+		*kfp->map_writable = writable;
+
+	/*
+	 * FIXME: Remove this once KVM no longer blindly calls put_page() on
+	 *	  every pfn that points at a struct page.
+	 *
+	 * Get a reference for follow_pte() pfns if they happen to point at a
+	 * struct page, as KVM will ultimately call kvm_release_pfn_clean() on
+	 * the returned pfn, i.e. KVM expects to have a reference.
+	 *
+	 * Certain IO or PFNMAP mappings can be backed with valid struct pages,
+	 * but be allocated without refcounting, e.g. tail pages of
+	 * non-compound higher order allocations.  Grabbing and putting a
+	 * reference to such pages would cause KVM to prematurely free a page
+	 * it doesn't own (KVM gets and puts the one and only reference).
+	 * Don't allow those pages until the FIXME is resolved.
+	 */
+	if (pte) {
+		pfn = pte_pfn(*pte);
+		page = kvm_pfn_to_refcounted_page(pfn);
+		if (page && !get_page_unless_zero(page))
+			return KVM_PFN_ERR_FAULT;
+	} else {
+		pfn = page_to_pfn(page);
+	}
+
+	if (kfp->refcounted_page)
+		*kfp->refcounted_page = page;
+
+	return pfn;
+}
+
 /*
  * The fast path to get the writable pfn which will be stored in @pfn,
  * true indicates success, otherwise false is returned.  It's also the
@@ -2774,9 +2814,7 @@ static bool hva_to_pfn_fast(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)
 		return false;
 
 	if (get_user_page_fast_only(kfp->hva, FOLL_WRITE, &page)) {
-		*pfn = page_to_pfn(page);
-		if (kfp->map_writable)
-			*kfp->map_writable = true;
+		*pfn = kvm_resolve_pfn(kfp, page, NULL, true);
 		return true;
 	}
 
@@ -2808,23 +2846,15 @@ static int hva_to_pfn_slow(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)
 	if (npages != 1)
 		return npages;
 
-	if (!kfp->map_writable)
-		goto out;
-
-	if (kfp->flags & FOLL_WRITE) {
-		*kfp->map_writable = true;
-		goto out;
-	}
-
 	/* map read fault as writable if possible */
-	if (get_user_page_fast_only(kfp->hva, FOLL_WRITE, &wpage)) {
-		*kfp->map_writable = true;
+	if (!(flags & FOLL_WRITE) && kfp->map_writable &&
+	    get_user_page_fast_only(kfp->hva, FOLL_WRITE, &wpage)) {
 		put_page(page);
 		page = wpage;
+		flags |= FOLL_WRITE;
 	}
 
-out:
-	*pfn = page_to_pfn(page);
+	*pfn = kvm_resolve_pfn(kfp, page, NULL, flags & FOLL_WRITE);
 	return npages;
 }
 
@@ -2839,20 +2869,9 @@ static bool vma_is_valid(struct vm_area_struct *vma, bool write_fault)
 	return true;
 }
 
-static int kvm_try_get_pfn(kvm_pfn_t pfn)
-{
-	struct page *page = kvm_pfn_to_refcounted_page(pfn);
-
-	if (!page)
-		return 1;
-
-	return get_page_unless_zero(page);
-}
-
 static int hva_to_pfn_remapped(struct vm_area_struct *vma,
 			       struct kvm_follow_pfn *kfp, kvm_pfn_t *p_pfn)
 {
-	kvm_pfn_t pfn;
 	pte_t *ptep;
 	pte_t pte;
 	spinlock_t *ptl;
@@ -2882,38 +2901,13 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
 	pte = ptep_get(ptep);
 
 	if (write_fault && !pte_write(pte)) {
-		pfn = KVM_PFN_ERR_RO_FAULT;
+		*p_pfn = KVM_PFN_ERR_RO_FAULT;
 		goto out;
 	}
 
-	if (kfp->map_writable)
-		*kfp->map_writable = pte_write(pte);
-	pfn = pte_pfn(pte);
-
-	/*
-	 * Get a reference here because callers of *hva_to_pfn* and
-	 * *gfn_to_pfn* ultimately call kvm_release_pfn_clean on the
-	 * returned pfn.  This is only needed if the VMA has VM_MIXEDMAP
-	 * set, but the kvm_try_get_pfn/kvm_release_pfn_clean pair will
-	 * simply do nothing for reserved pfns.
-	 *
-	 * Whoever called remap_pfn_range is also going to call e.g.
-	 * unmap_mapping_range before the underlying pages are freed,
-	 * causing a call to our MMU notifier.
-	 *
-	 * Certain IO or PFNMAP mappings can be backed with valid
-	 * struct pages, but be allocated without refcounting e.g.,
-	 * tail pages of non-compound higher order allocations, which
-	 * would then underflow the refcount when the caller does the
-	 * required put_page. Don't allow those pages here.
-	 */
-	if (!kvm_try_get_pfn(pfn))
-		r = -EFAULT;
-
+	*p_pfn = kvm_resolve_pfn(kfp, NULL, &pte, pte_write(pte));
 out:
 	pte_unmap_unlock(ptep, ptl);
-	*p_pfn = pfn;
-
 	return r;
 }
 
diff --git a/virt/kvm/kvm_mm.h b/virt/kvm/kvm_mm.h
index d5a215958f06..d3ac1ba8ba66 100644
--- a/virt/kvm/kvm_mm.h
+++ b/virt/kvm/kvm_mm.h
@@ -35,6 +35,15 @@ struct kvm_follow_pfn {
 	 * Set to true if a writable mapping was obtained.
 	 */
 	bool *map_writable;
+
+	/*
+	 * Optional output.  Set to a valid "struct page" if the returned pfn
+	 * is for a refcounted or pinned struct page, NULL if the returned pfn
+	 * has no struct page or if the struct page is not being refcounted
+	 * (e.g. tail pages of non-compound higher order allocations from
+	 * IO/PFNMAP mappings).
+	 */
+	struct page **refcounted_page;
 };
 
 kvm_pfn_t hva_to_pfn(struct kvm_follow_pfn *kfp);
-- 
2.46.0.rc1.232.g9752f9e123-goog

