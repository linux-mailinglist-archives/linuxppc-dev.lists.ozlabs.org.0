Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A95F2746B2F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 09:54:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=C5eJsCM3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QwFRj4B0Nz3c1t
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 17:54:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=C5eJsCM3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=stevensd@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QwFNv24r5z3bWr
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jul 2023 17:51:43 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6686708c986so4321705b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jul 2023 00:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688457100; x=1691049100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhMJfBWbFBVskOmdPpb6QsvpJIZB+NhjXawVV5ccjk8=;
        b=C5eJsCM3//4H7q4GdB8q7Jw/ggVKydzf/yCl9ryFMjxgSxXhd+KSgsv4+3LDNy3EZR
         k5cN0Co79rLPcrRK7BMlML+fQihKEmBpDqyUdU9a4aZoE6LORgTEtTtexhTc0vSAUaTU
         gtsdKzLeQ7ZJZfiCJ65ya1c2m2IfX/FaYtyFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688457100; x=1691049100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vhMJfBWbFBVskOmdPpb6QsvpJIZB+NhjXawVV5ccjk8=;
        b=PGBBR2/OtTH6XcypOAQk3+4Q/Q2HZKfypYXE/i+NnTMwosGJfoUNPTIqfmz2ZrRoFu
         M0UF9KslxTbZ1GKwfPFflCAtlweFNZ9Y1LKvBmqyMTE4y6kEJRhYRu6sFdZhWrLL8faR
         4x57U4JLBZzGHeJuNpvd81qX3KybYdjuNuAhB9aq6n5LmcAPv0A90xxezJi6mALykXh+
         8Ujli6AcRP6vjm17raU/ErZ1+0Gjv62I51y+80lfnfzQjsv6a475gWO9sgqQCgU175yZ
         HnHVPehrHrV4EfCH+I/BtL6joRaseN8/gOAOCiPOjhkqs4HJaf45aCmmcflQ8bNa8EtN
         0ncA==
X-Gm-Message-State: ABy/qLbQ8ksZsDGej+7bq6GmwGLsntWrbDsbM0PG8wEg1UOKUxa6OiPQ
	4fiYQetDel7Ou/GkaQVJk2oBig==
X-Google-Smtp-Source: APBJJlHQ933xhSivCiYmXA92EoYmb1T9BWhWfLcILly+w2hMEM2jc0rk5hy65iOUb64pVHHdqCZHZQ==
X-Received: by 2002:a05:6a20:8e1f:b0:12a:82a0:687e with SMTP id y31-20020a056a208e1f00b0012a82a0687emr16344817pzj.60.1688457100152;
        Tue, 04 Jul 2023 00:51:40 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:a11b:bff7:d8ae:bb0])
        by smtp.gmail.com with UTF8SMTPSA id x16-20020a056a00271000b0067459e92801sm13696386pfv.64.2023.07.04.00.51.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 00:51:39 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
X-Google-Original-From: David Stevens <stevensd@google.com>
To: Sean Christopherson <seanjc@google.com>
Subject: [PATCH v7 2/8] KVM: Introduce __kvm_follow_pfn function
Date: Tue,  4 Jul 2023 16:50:47 +0900
Message-ID: <20230704075054.3344915-3-stevensd@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
In-Reply-To: <20230704075054.3344915-1-stevensd@google.com>
References: <20230704075054.3344915-1-stevensd@google.com>
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
Cc: kvm@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, David Stevens <stevensd@chromium.org>, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: David Stevens <stevensd@chromium.org>

Introduce __kvm_follow_pfn, which will replace __gfn_to_pfn_memslot.
__kvm_follow_pfn refactors the old API's arguments into a struct and,
where possible, combines the boolean arguments into a single flags
argument.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 include/linux/kvm_host.h |  16 ++++
 virt/kvm/kvm_main.c      | 171 ++++++++++++++++++++++-----------------
 virt/kvm/kvm_mm.h        |   3 +-
 virt/kvm/pfncache.c      |   8 +-
 4 files changed, 122 insertions(+), 76 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 9d3ac7720da9..ef2763c2b12e 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -97,6 +97,7 @@
 #define KVM_PFN_ERR_HWPOISON	(KVM_PFN_ERR_MASK + 1)
 #define KVM_PFN_ERR_RO_FAULT	(KVM_PFN_ERR_MASK + 2)
 #define KVM_PFN_ERR_SIGPENDING	(KVM_PFN_ERR_MASK + 3)
+#define KVM_PFN_ERR_NEEDS_IO	(KVM_PFN_ERR_MASK + 4)
 
 /*
  * error pfns indicate that the gfn is in slot but faild to
@@ -1156,6 +1157,21 @@ unsigned long gfn_to_hva_memslot_prot(struct kvm_memory_slot *slot, gfn_t gfn,
 void kvm_release_page_clean(struct page *page);
 void kvm_release_page_dirty(struct page *page);
 
+struct kvm_follow_pfn {
+	const struct kvm_memory_slot *slot;
+	gfn_t gfn;
+	unsigned int flags;
+	bool atomic;
+	/* Allow a read fault to create a writeable mapping. */
+	bool allow_write_mapping;
+
+	/* Outputs of __kvm_follow_pfn */
+	hva_t hva;
+	bool writable;
+};
+
+kvm_pfn_t __kvm_follow_pfn(struct kvm_follow_pfn *foll);
+
 kvm_pfn_t gfn_to_pfn(struct kvm *kvm, gfn_t gfn);
 kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
 		      bool *writable);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 371bd783ff2b..b13f22861d2f 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2486,24 +2486,22 @@ static inline int check_user_page_hwpoison(unsigned long addr)
  * true indicates success, otherwise false is returned.  It's also the
  * only part that runs if we can in atomic context.
  */
-static bool hva_to_pfn_fast(unsigned long addr, bool write_fault,
-			    bool *writable, kvm_pfn_t *pfn)
+static bool hva_to_pfn_fast(struct kvm_follow_pfn *foll, kvm_pfn_t *pfn)
 {
 	struct page *page[1];
+	bool write_fault = foll->flags & FOLL_WRITE;
 
 	/*
 	 * Fast pin a writable pfn only if it is a write fault request
 	 * or the caller allows to map a writable pfn for a read fault
 	 * request.
 	 */
-	if (!(write_fault || writable))
+	if (!(write_fault || foll->allow_write_mapping))
 		return false;
 
-	if (get_user_page_fast_only(addr, FOLL_WRITE, page)) {
+	if (get_user_page_fast_only(foll->hva, FOLL_WRITE, page)) {
 		*pfn = page_to_pfn(page[0]);
-
-		if (writable)
-			*writable = true;
+		foll->writable = foll->allow_write_mapping;
 		return true;
 	}
 
@@ -2514,35 +2512,26 @@ static bool hva_to_pfn_fast(unsigned long addr, bool write_fault,
  * The slow path to get the pfn of the specified host virtual address,
  * 1 indicates success, -errno is returned if error is detected.
  */
-static int hva_to_pfn_slow(unsigned long addr, bool *async, bool write_fault,
-			   bool interruptible, bool *writable, kvm_pfn_t *pfn)
+static int hva_to_pfn_slow(struct kvm_follow_pfn *foll, kvm_pfn_t *pfn)
 {
-	unsigned int flags = FOLL_HWPOISON;
+	unsigned int flags = FOLL_HWPOISON | FOLL_GET | foll->flags;
 	struct page *page;
 	int npages;
 
 	might_sleep();
 
-	if (writable)
-		*writable = write_fault;
-
-	if (write_fault)
-		flags |= FOLL_WRITE;
-	if (async)
-		flags |= FOLL_NOWAIT;
-	if (interruptible)
-		flags |= FOLL_INTERRUPTIBLE;
-
-	npages = get_user_pages_unlocked(addr, 1, &page, flags);
+	npages = get_user_pages_unlocked(foll->hva, 1, &page, flags);
 	if (npages != 1)
 		return npages;
 
+	foll->writable = (foll->flags & FOLL_WRITE) && foll->allow_write_mapping;
+
 	/* map read fault as writable if possible */
-	if (unlikely(!write_fault) && writable) {
+	if (unlikely(!foll->writable) && foll->allow_write_mapping) {
 		struct page *wpage;
 
-		if (get_user_page_fast_only(addr, FOLL_WRITE, &wpage)) {
-			*writable = true;
+		if (get_user_page_fast_only(foll->hva, FOLL_WRITE, &wpage)) {
+			foll->writable = true;
 			put_page(page);
 			page = wpage;
 		}
@@ -2572,23 +2561,23 @@ static int kvm_try_get_pfn(kvm_pfn_t pfn)
 	return get_page_unless_zero(page);
 }
 
-static int hva_to_pfn_remapped(struct vm_area_struct *vma,
-			       unsigned long addr, bool write_fault,
-			       bool *writable, kvm_pfn_t *p_pfn)
+static int hva_to_pfn_remapped(struct vm_area_struct *vma, struct kvm_follow_pfn *foll,
+			       kvm_pfn_t *p_pfn)
 {
 	kvm_pfn_t pfn;
 	pte_t *ptep;
 	spinlock_t *ptl;
+	bool write_fault = foll->flags & FOLL_WRITE;
 	int r;
 
-	r = follow_pte(vma->vm_mm, addr, &ptep, &ptl);
+	r = follow_pte(vma->vm_mm, foll->hva, &ptep, &ptl);
 	if (r) {
 		/*
 		 * get_user_pages fails for VM_IO and VM_PFNMAP vmas and does
 		 * not call the fault handler, so do it here.
 		 */
 		bool unlocked = false;
-		r = fixup_user_fault(current->mm, addr,
+		r = fixup_user_fault(current->mm, foll->hva,
 				     (write_fault ? FAULT_FLAG_WRITE : 0),
 				     &unlocked);
 		if (unlocked)
@@ -2596,7 +2585,7 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
 		if (r)
 			return r;
 
-		r = follow_pte(vma->vm_mm, addr, &ptep, &ptl);
+		r = follow_pte(vma->vm_mm, foll->hva, &ptep, &ptl);
 		if (r)
 			return r;
 	}
@@ -2606,8 +2595,7 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
 		goto out;
 	}
 
-	if (writable)
-		*writable = pte_write(*ptep);
+	foll->writable = pte_write(*ptep) && foll->allow_write_mapping;
 	pfn = pte_pfn(*ptep);
 
 	/*
@@ -2652,24 +2640,22 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
  * 2): @write_fault = false && @writable, @writable will tell the caller
  *     whether the mapping is writable.
  */
-kvm_pfn_t hva_to_pfn(unsigned long addr, bool atomic, bool interruptible,
-		     bool *async, bool write_fault, bool *writable)
+kvm_pfn_t hva_to_pfn(struct kvm_follow_pfn *foll)
 {
 	struct vm_area_struct *vma;
 	kvm_pfn_t pfn;
 	int npages, r;
 
 	/* we can do it either atomically or asynchronously, not both */
-	BUG_ON(atomic && async);
+	BUG_ON(foll->atomic && (foll->flags & FOLL_NOWAIT));
 
-	if (hva_to_pfn_fast(addr, write_fault, writable, &pfn))
+	if (hva_to_pfn_fast(foll, &pfn))
 		return pfn;
 
-	if (atomic)
+	if (foll->atomic)
 		return KVM_PFN_ERR_FAULT;
 
-	npages = hva_to_pfn_slow(addr, async, write_fault, interruptible,
-				 writable, &pfn);
+	npages = hva_to_pfn_slow(foll, &pfn);
 	if (npages == 1)
 		return pfn;
 	if (npages == -EINTR)
@@ -2677,83 +2663,122 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool atomic, bool interruptible,
 
 	mmap_read_lock(current->mm);
 	if (npages == -EHWPOISON ||
-	      (!async && check_user_page_hwpoison(addr))) {
+	      (!(foll->flags & FOLL_NOWAIT) && check_user_page_hwpoison(foll->hva))) {
 		pfn = KVM_PFN_ERR_HWPOISON;
 		goto exit;
 	}
 
 retry:
-	vma = vma_lookup(current->mm, addr);
+	vma = vma_lookup(current->mm, foll->hva);
 
 	if (vma == NULL)
 		pfn = KVM_PFN_ERR_FAULT;
 	else if (vma->vm_flags & (VM_IO | VM_PFNMAP)) {
-		r = hva_to_pfn_remapped(vma, addr, write_fault, writable, &pfn);
+		r = hva_to_pfn_remapped(vma, foll, &pfn);
 		if (r == -EAGAIN)
 			goto retry;
 		if (r < 0)
 			pfn = KVM_PFN_ERR_FAULT;
 	} else {
-		if (async && vma_is_valid(vma, write_fault))
-			*async = true;
-		pfn = KVM_PFN_ERR_FAULT;
+		if ((foll->flags & FOLL_NOWAIT) &&
+		    vma_is_valid(vma, foll->flags & FOLL_WRITE))
+			pfn = KVM_PFN_ERR_NEEDS_IO;
+		else
+			pfn = KVM_PFN_ERR_FAULT;
 	}
 exit:
 	mmap_read_unlock(current->mm);
 	return pfn;
 }
 
-kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn,
-			       bool atomic, bool interruptible, bool *async,
-			       bool write_fault, bool *writable, hva_t *hva)
+kvm_pfn_t __kvm_follow_pfn(struct kvm_follow_pfn *foll)
 {
-	unsigned long addr = __gfn_to_hva_many(slot, gfn, NULL, write_fault);
-
-	if (hva)
-		*hva = addr;
+	foll->hva = __gfn_to_hva_many(foll->slot, foll->gfn, NULL,
+				      foll->flags & FOLL_WRITE);
 
-	if (addr == KVM_HVA_ERR_RO_BAD) {
-		if (writable)
-			*writable = false;
+	if (foll->hva == KVM_HVA_ERR_RO_BAD)
 		return KVM_PFN_ERR_RO_FAULT;
-	}
 
-	if (kvm_is_error_hva(addr)) {
-		if (writable)
-			*writable = false;
+	if (kvm_is_error_hva(foll->hva))
 		return KVM_PFN_NOSLOT;
-	}
 
-	/* Do not map writable pfn in the readonly memslot. */
-	if (writable && memslot_is_readonly(slot)) {
-		*writable = false;
-		writable = NULL;
-	}
+	if (memslot_is_readonly(foll->slot))
+		foll->allow_write_mapping = false;
+
+	return hva_to_pfn(foll);
+}
+EXPORT_SYMBOL_GPL(__kvm_follow_pfn);
 
-	return hva_to_pfn(addr, atomic, interruptible, async, write_fault,
-			  writable);
+kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn,
+			       bool atomic, bool interruptible, bool *async,
+			       bool write_fault, bool *writable, hva_t *hva)
+{
+	kvm_pfn_t pfn;
+	struct kvm_follow_pfn foll = {
+		.slot = slot,
+		.gfn = gfn,
+		.flags = 0,
+		.atomic = atomic,
+		.allow_write_mapping = !!writable,
+	};
+
+	if (write_fault)
+		foll.flags |= FOLL_WRITE;
+	if (async)
+		foll.flags |= FOLL_NOWAIT;
+	if (interruptible)
+		foll.flags |= FOLL_INTERRUPTIBLE;
+
+	pfn = __kvm_follow_pfn(&foll);
+	if (pfn == KVM_PFN_ERR_NEEDS_IO) {
+		*async = true;
+		pfn = KVM_PFN_ERR_FAULT;
+	}
+	if (hva)
+		*hva = foll.hva;
+	if (writable)
+		*writable = foll.writable;
+	return pfn;
 }
 EXPORT_SYMBOL_GPL(__gfn_to_pfn_memslot);
 
 kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
 		      bool *writable)
 {
-	return __gfn_to_pfn_memslot(gfn_to_memslot(kvm, gfn), gfn, false, false,
-				    NULL, write_fault, writable, NULL);
+	kvm_pfn_t pfn;
+	struct kvm_follow_pfn foll = {
+		.slot = gfn_to_memslot(kvm, gfn),
+		.gfn = gfn,
+		.flags = write_fault ? FOLL_WRITE : 0,
+		.allow_write_mapping = !!writable,
+	};
+	pfn = __kvm_follow_pfn(&foll);
+	if (writable)
+		*writable = foll.writable;
+	return pfn;
 }
 EXPORT_SYMBOL_GPL(gfn_to_pfn_prot);
 
 kvm_pfn_t gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn)
 {
-	return __gfn_to_pfn_memslot(slot, gfn, false, false, NULL, true,
-				    NULL, NULL);
+	struct kvm_follow_pfn foll = {
+		.slot = slot,
+		.gfn = gfn,
+		.flags = FOLL_WRITE,
+	};
+	return __kvm_follow_pfn(&foll);
 }
 EXPORT_SYMBOL_GPL(gfn_to_pfn_memslot);
 
 kvm_pfn_t gfn_to_pfn_memslot_atomic(const struct kvm_memory_slot *slot, gfn_t gfn)
 {
-	return __gfn_to_pfn_memslot(slot, gfn, true, false, NULL, true,
-				    NULL, NULL);
+	struct kvm_follow_pfn foll = {
+		.slot = slot,
+		.gfn = gfn,
+		.flags = FOLL_WRITE,
+		.atomic = true,
+	};
+	return __kvm_follow_pfn(&foll);
 }
 EXPORT_SYMBOL_GPL(gfn_to_pfn_memslot_atomic);
 
diff --git a/virt/kvm/kvm_mm.h b/virt/kvm/kvm_mm.h
index 180f1a09e6ba..ed896aee5396 100644
--- a/virt/kvm/kvm_mm.h
+++ b/virt/kvm/kvm_mm.h
@@ -20,8 +20,7 @@
 #define KVM_MMU_UNLOCK(kvm)		spin_unlock(&(kvm)->mmu_lock)
 #endif /* KVM_HAVE_MMU_RWLOCK */
 
-kvm_pfn_t hva_to_pfn(unsigned long addr, bool atomic, bool interruptible,
-		     bool *async, bool write_fault, bool *writable);
+kvm_pfn_t hva_to_pfn(struct kvm_follow_pfn *foll);
 
 #ifdef CONFIG_HAVE_KVM_PFNCACHE
 void gfn_to_pfn_cache_invalidate_start(struct kvm *kvm,
diff --git a/virt/kvm/pfncache.c b/virt/kvm/pfncache.c
index 2d6aba677830..e3fefa753a51 100644
--- a/virt/kvm/pfncache.c
+++ b/virt/kvm/pfncache.c
@@ -144,6 +144,12 @@ static kvm_pfn_t hva_to_pfn_retry(struct gfn_to_pfn_cache *gpc)
 	kvm_pfn_t new_pfn = KVM_PFN_ERR_FAULT;
 	void *new_khva = NULL;
 	unsigned long mmu_seq;
+	struct kvm_follow_pfn foll = {
+		.slot = gpc->memslot,
+		.gfn = gpa_to_gfn(gpc->gpa),
+		.flags = FOLL_WRITE,
+		.hva = gpc->uhva,
+	};
 
 	lockdep_assert_held(&gpc->refresh_lock);
 
@@ -183,7 +189,7 @@ static kvm_pfn_t hva_to_pfn_retry(struct gfn_to_pfn_cache *gpc)
 		}
 
 		/* We always request a writeable mapping */
-		new_pfn = hva_to_pfn(gpc->uhva, false, false, NULL, true, NULL);
+		new_pfn = hva_to_pfn(&foll);
 		if (is_error_noslot_pfn(new_pfn))
 			goto out_error;
 
-- 
2.41.0.255.g8b1d071c50-goog

