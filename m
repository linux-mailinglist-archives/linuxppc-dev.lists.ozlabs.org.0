Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3313B3DAA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 09:38:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GB8502qCpz3c9N
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 17:38:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jsVWx4zR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::52e;
 helo=mail-pg1-x52e.google.com; envelope-from=stevensd@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=jsVWx4zR; dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GB83f2Jcxz3bwl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jun 2021 17:37:34 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id h4so6888439pgp.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jun 2021 00:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u4Msfi+S3PkAmckIb45Y4YhfvK0zrfK1v0GQOeKxL8U=;
 b=jsVWx4zRHi5LgbBDABZxQBMVf0I5Pehki/bLP1YEDTCFU+7oqcawuLdQyOF/WTHvrm
 GkAZKMD5IiMtCqrbGlu910q/CyOs+isCAewjZKOhwg59+E7AXomrJ6A2uZ9RqaGcXirk
 lV0SFGaAyCFC4T82D6h/FrcpvKiIknqhpH6yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u4Msfi+S3PkAmckIb45Y4YhfvK0zrfK1v0GQOeKxL8U=;
 b=MUg7BIKB8MTKhE72qF9PWGNIKLgh0eNXBOlgXR1xE44E/2NODhzyOzkgEaVmlyUA6e
 +xRtS7PoS9dR4gQf2l66LO/BXDC9bRcFo3UAZ1Zbn79XhyNIjeBDY7m1RtHUZDS+ilU7
 FqGL4exZJztkZgX+1eJxloZvVyWLhLVDBxEm4HNfBO8xQZvNZDPFH5mY9fYxboXeF4nS
 4U57MBkYbCUeEylKg5IRToUQaDvB4iEXfRK/PRkEZJkSGBdR5Dmic54bg8FuI6QdfgJP
 UGVUBXC4FxLVwY11J3yEzn+dHeCz3PpcaT/04GwhedjKSlEq4nR7RNyYaL2urZUfMSn5
 31/Q==
X-Gm-Message-State: AOAM531chJ79CxRL4uVKxLfaEBTq8J2FB+/VYcBnxrr1g84L6DUB8NE3
 yHDu9rQRmSfmAUMG5iTxJ1aZkw==
X-Google-Smtp-Source: ABdhPJyyESM737HvNDRLo7wsjj7srNzMihvC96O4J3ijX1Pbthrr46lvLTHJ0sjdv2LUYHCcdC3mGQ==
X-Received: by 2002:a05:6a00:238e:b029:2ef:839b:adc7 with SMTP id
 f14-20020a056a00238eb02902ef839badc7mr9115989pfc.54.1624606650766; 
 Fri, 25 Jun 2021 00:37:30 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:1492:9d4f:19fa:df61])
 by smtp.gmail.com with UTF8SMTPSA id j22sm4516344pgb.62.2021.06.25.00.37.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 00:37:30 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
X-Google-Original-From: David Stevens <stevensd@google.com>
To: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Nick Piggin <npiggin@gmail.com>
Subject: [PATCH v2 2/5] KVM: mmu: introduce new gfn_to_pfn_page functions
Date: Fri, 25 Jun 2021 16:36:13 +0900
Message-Id: <20210625073616.2184426-3-stevensd@google.com>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210625073616.2184426-1-stevensd@google.com>
References: <20210625073616.2184426-1-stevensd@google.com>
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
Cc: Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Will Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu,
 Alexandru Elisei <alexandru.elisei@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Zhi Wang <zhi.a.wang@intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 intel-gfx@lists.freedesktop.org, kvm-ppc@vger.kernel.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>, intel-gvt-dev@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>,
 Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org,
 James Morse <james.morse@arm.com>, David Stevens <stevensd@chromium.org>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: David Stevens <stevensd@chromium.org>

Introduce new gfn_to_pfn_page functions that parallel existing
gfn_to_pfn functions. The new functions are identical except they take
an additional out parameter that is used to return the struct page if
the hva was resolved by gup. This allows callers to differentiate the
gup and follow_pte cases, which in turn allows callers to only touch the
page refcount when necessitated by gup.

The old gfn_to_pfn functions are depreciated, and all callers should be
migrated to the new gfn_to_pfn_page functions. In the interim, the
gfn_to_pfn functions are reimplemented as wrappers of the corresponding
gfn_to_pfn_page functions. The wrappers take a reference to the pfn's
page that had previously been taken in hva_to_pfn_remapped.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 include/linux/kvm_host.h |  17 ++++
 virt/kvm/kvm_main.c      | 186 ++++++++++++++++++++++++++++-----------
 2 files changed, 152 insertions(+), 51 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index ae7735b490b4..2f828edd7278 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -820,6 +820,19 @@ kvm_pfn_t __gfn_to_pfn_memslot(struct kvm_memory_slot *slot, gfn_t gfn,
 			       bool atomic, bool *async, bool write_fault,
 			       bool *writable, hva_t *hva);
 
+kvm_pfn_t gfn_to_pfn_page(struct kvm *kvm, gfn_t gfn, struct page **page);
+kvm_pfn_t gfn_to_pfn_page_prot(struct kvm *kvm, gfn_t gfn,
+			       bool write_fault, bool *writable,
+			       struct page **page);
+kvm_pfn_t gfn_to_pfn_page_memslot(struct kvm_memory_slot *slot,
+				  gfn_t gfn, struct page **page);
+kvm_pfn_t gfn_to_pfn_page_memslot_atomic(struct kvm_memory_slot *slot,
+					 gfn_t gfn, struct page **page);
+kvm_pfn_t __gfn_to_pfn_page_memslot(struct kvm_memory_slot *slot,
+				    gfn_t gfn, bool atomic, bool *async,
+				    bool write_fault, bool *writable,
+				    hva_t *hva, struct page **page);
+
 void kvm_release_pfn_clean(kvm_pfn_t pfn);
 void kvm_release_pfn_dirty(kvm_pfn_t pfn);
 void kvm_set_pfn_dirty(kvm_pfn_t pfn);
@@ -901,6 +914,10 @@ struct kvm_memslots *kvm_vcpu_memslots(struct kvm_vcpu *vcpu);
 struct kvm_memory_slot *kvm_vcpu_gfn_to_memslot(struct kvm_vcpu *vcpu, gfn_t gfn);
 kvm_pfn_t kvm_vcpu_gfn_to_pfn_atomic(struct kvm_vcpu *vcpu, gfn_t gfn);
 kvm_pfn_t kvm_vcpu_gfn_to_pfn(struct kvm_vcpu *vcpu, gfn_t gfn);
+kvm_pfn_t kvm_vcpu_gfn_to_pfn_page_atomic(struct kvm_vcpu *vcpu, gfn_t gfn,
+					  struct page **page);
+kvm_pfn_t kvm_vcpu_gfn_to_pfn_page(struct kvm_vcpu *vcpu, gfn_t gfn,
+				   struct page **page);
 int kvm_vcpu_map(struct kvm_vcpu *vcpu, gpa_t gpa, struct kvm_host_map *map);
 int kvm_map_gfn(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *map,
 		struct gfn_to_pfn_cache *cache, bool atomic);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index f7445c3bcd90..1de8702845ac 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2102,9 +2102,9 @@ static inline int check_user_page_hwpoison(unsigned long addr)
  * only part that runs if we can in atomic context.
  */
 static bool hva_to_pfn_fast(unsigned long addr, bool write_fault,
-			    bool *writable, kvm_pfn_t *pfn)
+			    bool *writable, kvm_pfn_t *pfn,
+			    struct page **page)
 {
-	struct page *page[1];
 
 	/*
 	 * Fast pin a writable pfn only if it is a write fault request
@@ -2115,7 +2115,7 @@ static bool hva_to_pfn_fast(unsigned long addr, bool write_fault,
 		return false;
 
 	if (get_user_page_fast_only(addr, FOLL_WRITE, page)) {
-		*pfn = page_to_pfn(page[0]);
+		*pfn = page_to_pfn(*page);
 
 		if (writable)
 			*writable = true;
@@ -2130,10 +2130,9 @@ static bool hva_to_pfn_fast(unsigned long addr, bool write_fault,
  * 1 indicates success, -errno is returned if error is detected.
  */
 static int hva_to_pfn_slow(unsigned long addr, bool *async, bool write_fault,
-			   bool *writable, kvm_pfn_t *pfn)
+			   bool *writable, kvm_pfn_t *pfn, struct page **page)
 {
 	unsigned int flags = FOLL_HWPOISON;
-	struct page *page;
 	int npages = 0;
 
 	might_sleep();
@@ -2146,7 +2145,7 @@ static int hva_to_pfn_slow(unsigned long addr, bool *async, bool write_fault,
 	if (async)
 		flags |= FOLL_NOWAIT;
 
-	npages = get_user_pages_unlocked(addr, 1, &page, flags);
+	npages = get_user_pages_unlocked(addr, 1, page, flags);
 	if (npages != 1)
 		return npages;
 
@@ -2156,11 +2155,11 @@ static int hva_to_pfn_slow(unsigned long addr, bool *async, bool write_fault,
 
 		if (get_user_page_fast_only(addr, FOLL_WRITE, &wpage)) {
 			*writable = true;
-			put_page(page);
-			page = wpage;
+			put_page(*page);
+			*page = wpage;
 		}
 	}
-	*pfn = page_to_pfn(page);
+	*pfn = page_to_pfn(*page);
 	return npages;
 }
 
@@ -2175,13 +2174,6 @@ static bool vma_is_valid(struct vm_area_struct *vma, bool write_fault)
 	return true;
 }
 
-static int kvm_try_get_pfn(kvm_pfn_t pfn)
-{
-	if (kvm_is_reserved_pfn(pfn))
-		return 1;
-	return get_page_unless_zero(pfn_to_page(pfn));
-}
-
 static int hva_to_pfn_remapped(struct vm_area_struct *vma,
 			       unsigned long addr, bool *async,
 			       bool write_fault, bool *writable,
@@ -2221,26 +2213,6 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
 		*writable = pte_write(*ptep);
 	pfn = pte_pfn(*ptep);
 
-	/*
-	 * Get a reference here because callers of *hva_to_pfn* and
-	 * *gfn_to_pfn* ultimately call kvm_release_pfn_clean on the
-	 * returned pfn.  This is only needed if the VMA has VM_MIXEDMAP
-	 * set, but the kvm_get_pfn/kvm_release_pfn_clean pair will
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
 out:
 	pte_unmap_unlock(ptep, ptl);
 	*p_pfn = pfn;
@@ -2262,8 +2234,9 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
  * 2): @write_fault = false && @writable, @writable will tell the caller
  *     whether the mapping is writable.
  */
-static kvm_pfn_t hva_to_pfn(unsigned long addr, bool atomic, bool *async,
-			bool write_fault, bool *writable)
+static kvm_pfn_t hva_to_pfn(unsigned long addr, bool atomic,
+			    bool *async, bool write_fault, bool *writable,
+			    struct page **page)
 {
 	struct vm_area_struct *vma;
 	kvm_pfn_t pfn = 0;
@@ -2272,13 +2245,14 @@ static kvm_pfn_t hva_to_pfn(unsigned long addr, bool atomic, bool *async,
 	/* we can do it either atomically or asynchronously, not both */
 	BUG_ON(atomic && async);
 
-	if (hva_to_pfn_fast(addr, write_fault, writable, &pfn))
+	if (hva_to_pfn_fast(addr, write_fault, writable, &pfn, page))
 		return pfn;
 
 	if (atomic)
 		return KVM_PFN_ERR_FAULT;
 
-	npages = hva_to_pfn_slow(addr, async, write_fault, writable, &pfn);
+	npages = hva_to_pfn_slow(addr, async, write_fault, writable,
+				 &pfn, page);
 	if (npages == 1)
 		return pfn;
 
@@ -2310,12 +2284,14 @@ static kvm_pfn_t hva_to_pfn(unsigned long addr, bool atomic, bool *async,
 	return pfn;
 }
 
-kvm_pfn_t __gfn_to_pfn_memslot(struct kvm_memory_slot *slot, gfn_t gfn,
-			       bool atomic, bool *async, bool write_fault,
-			       bool *writable, hva_t *hva)
+kvm_pfn_t __gfn_to_pfn_page_memslot(struct kvm_memory_slot *slot,
+				    gfn_t gfn, bool atomic, bool *async,
+				    bool write_fault, bool *writable,
+				    hva_t *hva, struct page **page)
 {
 	unsigned long addr = __gfn_to_hva_many(slot, gfn, NULL, write_fault);
 
+	*page = NULL;
 	if (hva)
 		*hva = addr;
 
@@ -2338,45 +2314,153 @@ kvm_pfn_t __gfn_to_pfn_memslot(struct kvm_memory_slot *slot, gfn_t gfn,
 	}
 
 	return hva_to_pfn(addr, atomic, async, write_fault,
-			  writable);
+			  writable, page);
+}
+EXPORT_SYMBOL_GPL(__gfn_to_pfn_page_memslot);
+
+kvm_pfn_t gfn_to_pfn_page_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
+			       bool *writable, struct page **page)
+{
+	return __gfn_to_pfn_page_memslot(gfn_to_memslot(kvm, gfn), gfn, false,
+					 NULL, write_fault, writable, NULL,
+					 page);
+}
+EXPORT_SYMBOL_GPL(gfn_to_pfn_page_prot);
+
+kvm_pfn_t gfn_to_pfn_page_memslot(struct kvm_memory_slot *slot, gfn_t gfn,
+				  struct page **page)
+{
+	return __gfn_to_pfn_page_memslot(slot, gfn, false, NULL, true,
+					 NULL, NULL, page);
+}
+EXPORT_SYMBOL_GPL(gfn_to_pfn_page_memslot);
+
+kvm_pfn_t gfn_to_pfn_page_memslot_atomic(struct kvm_memory_slot *slot,
+					 gfn_t gfn, struct page **page)
+{
+	return __gfn_to_pfn_page_memslot(slot, gfn, true, NULL, true, NULL,
+					 NULL, page);
+}
+EXPORT_SYMBOL_GPL(gfn_to_pfn_page_memslot_atomic);
+
+kvm_pfn_t kvm_vcpu_gfn_to_pfn_page_atomic(struct kvm_vcpu *vcpu, gfn_t gfn,
+					  struct page **page)
+{
+	return gfn_to_pfn_page_memslot_atomic(
+			kvm_vcpu_gfn_to_memslot(vcpu, gfn), gfn, page);
+}
+EXPORT_SYMBOL_GPL(kvm_vcpu_gfn_to_pfn_page_atomic);
+
+kvm_pfn_t gfn_to_pfn_page(struct kvm *kvm, gfn_t gfn, struct page **page)
+{
+	return gfn_to_pfn_page_memslot(gfn_to_memslot(kvm, gfn), gfn, page);
+}
+EXPORT_SYMBOL_GPL(gfn_to_pfn_page);
+
+kvm_pfn_t kvm_vcpu_gfn_to_pfn_page(struct kvm_vcpu *vcpu, gfn_t gfn,
+				   struct page **page)
+{
+	return gfn_to_pfn_page_memslot(kvm_vcpu_gfn_to_memslot(vcpu, gfn),
+				       gfn, page);
+}
+EXPORT_SYMBOL_GPL(kvm_vcpu_gfn_to_pfn_page);
+
+static kvm_pfn_t ensure_pfn_ref(struct page *page, kvm_pfn_t pfn)
+{
+	if (page || is_error_pfn(pfn) || kvm_is_reserved_pfn(pfn))
+		return pfn;
+
+	/*
+	 * Certain IO or PFNMAP mappings can be backed with valid
+	 * struct pages, but be allocated without refcounting e.g.,
+	 * tail pages of non-compound higher order allocations, which
+	 * would then underflow the refcount when the caller does the
+	 * required put_page. Don't allow those pages here.
+	 */
+	if (get_page_unless_zero(pfn_to_page(pfn)))
+		return pfn;
+
+	return KVM_PFN_ERR_FAULT;
+}
+
+kvm_pfn_t __gfn_to_pfn_memslot(struct kvm_memory_slot *slot, gfn_t gfn,
+			       bool atomic, bool *async, bool write_fault,
+			       bool *writable, hva_t *hva)
+{
+	struct page *page;
+	kvm_pfn_t pfn;
+
+	pfn = __gfn_to_pfn_page_memslot(slot, gfn, atomic, async,
+					write_fault, writable, hva, &page);
+
+	return ensure_pfn_ref(page, pfn);
 }
 EXPORT_SYMBOL_GPL(__gfn_to_pfn_memslot);
 
 kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
 		      bool *writable)
 {
-	return __gfn_to_pfn_memslot(gfn_to_memslot(kvm, gfn), gfn, false, NULL,
-				    write_fault, writable, NULL);
+	struct page *page;
+	kvm_pfn_t pfn;
+
+	pfn = gfn_to_pfn_page_prot(kvm, gfn, write_fault, writable, &page);
+
+	return ensure_pfn_ref(page, pfn);
 }
 EXPORT_SYMBOL_GPL(gfn_to_pfn_prot);
 
 kvm_pfn_t gfn_to_pfn_memslot(struct kvm_memory_slot *slot, gfn_t gfn)
 {
-	return __gfn_to_pfn_memslot(slot, gfn, false, NULL, true, NULL, NULL);
+	struct page *page;
+	kvm_pfn_t pfn;
+
+	pfn = gfn_to_pfn_page_memslot(slot, gfn, &page);
+
+	return ensure_pfn_ref(page, pfn);
 }
 EXPORT_SYMBOL_GPL(gfn_to_pfn_memslot);
 
 kvm_pfn_t gfn_to_pfn_memslot_atomic(struct kvm_memory_slot *slot, gfn_t gfn)
 {
-	return __gfn_to_pfn_memslot(slot, gfn, true, NULL, true, NULL, NULL);
+	struct page *page;
+	kvm_pfn_t pfn;
+
+	pfn = gfn_to_pfn_page_memslot_atomic(slot, gfn, &page);
+
+	return ensure_pfn_ref(page, pfn);
 }
 EXPORT_SYMBOL_GPL(gfn_to_pfn_memslot_atomic);
 
 kvm_pfn_t kvm_vcpu_gfn_to_pfn_atomic(struct kvm_vcpu *vcpu, gfn_t gfn)
 {
-	return gfn_to_pfn_memslot_atomic(kvm_vcpu_gfn_to_memslot(vcpu, gfn), gfn);
+	struct page *page;
+	kvm_pfn_t pfn;
+
+	pfn = kvm_vcpu_gfn_to_pfn_page_atomic(vcpu, gfn, &page);
+
+	return ensure_pfn_ref(page, pfn);
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_gfn_to_pfn_atomic);
 
 kvm_pfn_t gfn_to_pfn(struct kvm *kvm, gfn_t gfn)
 {
-	return gfn_to_pfn_memslot(gfn_to_memslot(kvm, gfn), gfn);
+	struct page *page;
+	kvm_pfn_t pfn;
+
+	pfn = gfn_to_pfn_page(kvm, gfn, &page);
+
+	return ensure_pfn_ref(page, pfn);
 }
 EXPORT_SYMBOL_GPL(gfn_to_pfn);
 
 kvm_pfn_t kvm_vcpu_gfn_to_pfn(struct kvm_vcpu *vcpu, gfn_t gfn)
 {
-	return gfn_to_pfn_memslot(kvm_vcpu_gfn_to_memslot(vcpu, gfn), gfn);
+	struct page *page;
+	kvm_pfn_t pfn;
+
+	pfn = kvm_vcpu_gfn_to_pfn_page(vcpu, gfn, &page);
+
+	return ensure_pfn_ref(page, pfn);
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_gfn_to_pfn);
 
-- 
2.32.0.93.g670b81a890-goog

