Return-Path: <linuxppc-dev+bounces-2001-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C4E998FFE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:26:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdV12hxQz3btP;
	Fri, 11 Oct 2024 05:25:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::449"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584729;
	cv=none; b=hEnDgfcIiPjMApOXKRdxCuDZG0FECfyuuADrSIO6EcsQDC3v3bO2rTla5btGWpQiU7BXJYm2Wsulc34P8rbnHmmt5EZlqAz4h31wv1/531EVPlC9U/VCKnpHEbfGXhASbhcipWIIoIWkC/HLRfcNS+0pEgn6JITAMjg3NoUt5Kn394jBDe2W0NM7m302THm3KRWmW7QfCqiT0lVo+qs6l7c2+vafo/aDu2Aw4SEqIJ9x7ndUf9/EfwmsIVxxNOhjYvQxXJafHp5ycpa5LN2CWdxdiBgn5T8aNNytdEefDxhF4Sb13vaTh9e5caN6BKHNdLqV0PtiaaWzzOOsg5dimA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584729; c=relaxed/relaxed;
	bh=H+RZpPtsk3Pe/RqqhWN1oE7ZGzOesPmt7slwmkU09yw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=go0BQ+aPl2TdmVgCb0Np8ePWELqV28ecqXpby9JkdAq/c0P+QouznCV4vnhoMcQYL+VQSkG7JzYoXy2k92Yy5bmEp8DSpCRx5GqzZZ99mfp68PKiTWrLYy7s7fjBVpKWaOEQ30UtegcjaeTVOyzON/2DKSczqWByg/lm/n90IbNDnWmzxAJeZj63Cu/jmCg2bE6eb8m9AYIh/oAKE2Kvek5zyZL6dQRwCHUi3lYFp0ZSq3+8tv+t1shItHZQvh9rT65P2ETfJQZgzTk3lZ0UvTJzqrB7RR7jV/fahqlBCfhObjlLoAd4rZRGJN4x2pOfg0QYDsYX0ZU4HipVJABCjw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=T/aySeA7; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3frwizwykdkweqmzvosaasxq.oayxuzgjbbo-pqhxuefe.alxmne.ads@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=T/aySeA7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3frwizwykdkweqmzvosaasxq.oayxuzgjbbo-pqhxuefe.alxmne.ads@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdV03wZyz3brt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:25:28 +1100 (AEDT)
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-71df2163e82so1662135b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584726; x=1729189526; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+RZpPtsk3Pe/RqqhWN1oE7ZGzOesPmt7slwmkU09yw=;
        b=T/aySeA7ZBSdGcydqSbE80hEVNuXFqGx3hOTuMBQAHTw+VXvdYPnx5bUI1+3gmYMLC
         ORVNLhf4X2t6MeIEqxJgh8PEgedHxINB8FnzWJH5jBMoJYwoejf1PoRZkghAk2JM2NOg
         gicV8lZRU59a2/DokxggfcJ48Iw5jkmflWkftY/4aiVnxhBRox0im5lBJ1HBginC9JCR
         qZk+KgOvuFIk2c/NodIqdfhQv5kC2vYEJvXq36VaWEWps6ALOVTPFnmvJTLu/Hu1bWrd
         EKk0VP56+1BykoqvGghSrxF1QOeyONErwarvK6ALUax+R2a29YFXLgNDznif91gyxFf5
         HQbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584726; x=1729189526;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H+RZpPtsk3Pe/RqqhWN1oE7ZGzOesPmt7slwmkU09yw=;
        b=BQh8+Aq7C7MOjAGus/JMibd0HET9mEWPIRaFnbrzZNAdYI1hTWexi4qhzFLf/+mqh9
         q2DzHY2bBh+oQFwNRozPuXuF4TnwRVZoID6W/Hq89C8o1x8CTrs/3Hdt/6zqTT9fo8BY
         gSPvbjzKqscNO7LcwsAAL2TPLoLXjx6zhtbTWuLet2jnSeZP1NOLW572AE+XFQxoFGjx
         qC6ybmqFYq9ENadnW4AyCsmV0jt8qDF+XPkhiMC/nuaoguZj89zTUA1/r2V4W4BlVain
         AXycW7zd1KbAfax0opEbIymnWxoAkLw3AMHmwhjI3HFbUzCpMFaoCULAled64YXlhgru
         vlNA==
X-Forwarded-Encrypted: i=1; AJvYcCUJ2Uiv1rc+/FxrmhMFzdNAgc53NznxXYDXf3FEQ3UelpNbyBNvTgVD4BPfIppa5Ddp3kGXOGbsUJwGoXA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx14YA2+GPtJD584BUJYuUpRp1tJ1oTUZohNdywYTS96bXxPrR6
	tP6jZ+ypYDR5kX0n1rAgzTQa++HSWC/TJBXOv+WuXQbaJAfhTQ7pUU73Blp2qVxUFl07LD1OqHh
	Vhg==
X-Google-Smtp-Source: AGHT+IEgY3dn5eo0Xr6pp3rAg0uVd1WuwbDag/Dk23UVvT7MMuxyKVAtWc2T42TlMp1H8D9GJ1Oltmo921o=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:8c17:b0:71d:f452:ee99 with SMTP id
 d2e1a72fcca58-71e1dbcac44mr6866b3a.3.1728584725637; Thu, 10 Oct 2024 11:25:25
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:18 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-17-seanjc@google.com>
Subject: [PATCH v13 16/85] KVM: Replace "async" pointer in gfn=>pfn with
 "no_wait" and error code
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: David Stevens <stevensd@chromium.org>

Add a pfn error code to communicate that hva_to_pfn() failed because I/O
was needed and disallowed, and convert @async to a constant @no_wait
boolean.  This will allow eliminating the @no_wait param by having callers
pass in FOLL_NOWAIT along with other FOLL_* flags.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: David Stevens <stevensd@chromium.org>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c   | 18 +++++++++++-------
 include/linux/kvm_host.h |  3 ++-
 virt/kvm/kvm_main.c      | 27 ++++++++++++++-------------
 virt/kvm/kvm_mm.h        |  2 +-
 virt/kvm/pfncache.c      |  4 ++--
 5 files changed, 30 insertions(+), 24 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 0e235f276ee5..fa8f3fb7c14b 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4374,17 +4374,21 @@ static int kvm_faultin_pfn_private(struct kvm_vcpu =
*vcpu,
=20
 static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault =
*fault)
 {
-	bool async;
-
 	if (fault->is_private)
 		return kvm_faultin_pfn_private(vcpu, fault);
=20
-	async =3D false;
-	fault->pfn =3D __gfn_to_pfn_memslot(fault->slot, fault->gfn, false, &asyn=
c,
+	fault->pfn =3D __gfn_to_pfn_memslot(fault->slot, fault->gfn, false, true,
 					  fault->write, &fault->map_writable,
 					  &fault->hva);
-	if (!async)
-		return RET_PF_CONTINUE; /* *pfn has correct page already */
+
+	/*
+	 * If resolving the page failed because I/O is needed to fault-in the
+	 * page, then either set up an asynchronous #PF to do the I/O, or if
+	 * doing an async #PF isn't possible, retry with I/O allowed.  All
+	 * other failures are terminal, i.e. retrying won't help.
+	 */
+	if (fault->pfn !=3D KVM_PFN_ERR_NEEDS_IO)
+		return RET_PF_CONTINUE;
=20
 	if (!fault->prefetch && kvm_can_do_async_pf(vcpu)) {
 		trace_kvm_try_async_get_page(fault->addr, fault->gfn);
@@ -4402,7 +4406,7 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, s=
truct kvm_page_fault *fault
 	 * to wait for IO.  Note, gup always bails if it is unable to quickly
 	 * get a page and a fatal signal, i.e. SIGKILL, is pending.
 	 */
-	fault->pfn =3D __gfn_to_pfn_memslot(fault->slot, fault->gfn, true, NULL,
+	fault->pfn =3D __gfn_to_pfn_memslot(fault->slot, fault->gfn, true, true,
 					  fault->write, &fault->map_writable,
 					  &fault->hva);
 	return RET_PF_CONTINUE;
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 2faafc7a56ae..071a0a1f1c60 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -97,6 +97,7 @@
 #define KVM_PFN_ERR_HWPOISON	(KVM_PFN_ERR_MASK + 1)
 #define KVM_PFN_ERR_RO_FAULT	(KVM_PFN_ERR_MASK + 2)
 #define KVM_PFN_ERR_SIGPENDING	(KVM_PFN_ERR_MASK + 3)
+#define KVM_PFN_ERR_NEEDS_IO	(KVM_PFN_ERR_MASK + 4)
=20
 /*
  * error pfns indicate that the gfn is in slot but faild to
@@ -1233,7 +1234,7 @@ kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn,=
 bool write_fault,
 		      bool *writable);
 kvm_pfn_t gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn=
);
 kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t g=
fn,
-			       bool interruptible, bool *async,
+			       bool interruptible, bool no_wait,
 			       bool write_fault, bool *writable, hva_t *hva);
=20
 void kvm_release_pfn_clean(kvm_pfn_t pfn);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 87f81e74cbc0..dd5839abef6c 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2778,7 +2778,7 @@ static bool hva_to_pfn_fast(unsigned long addr, bool =
write_fault,
  * The slow path to get the pfn of the specified host virtual address,
  * 1 indicates success, -errno is returned if error is detected.
  */
-static int hva_to_pfn_slow(unsigned long addr, bool *async, bool write_fau=
lt,
+static int hva_to_pfn_slow(unsigned long addr, bool no_wait, bool write_fa=
ult,
 			   bool interruptible, bool *writable, kvm_pfn_t *pfn)
 {
 	/*
@@ -2801,7 +2801,7 @@ static int hva_to_pfn_slow(unsigned long addr, bool *=
async, bool write_fault,
=20
 	if (write_fault)
 		flags |=3D FOLL_WRITE;
-	if (async)
+	if (no_wait)
 		flags |=3D FOLL_NOWAIT;
 	if (interruptible)
 		flags |=3D FOLL_INTERRUPTIBLE;
@@ -2912,8 +2912,8 @@ static int hva_to_pfn_remapped(struct vm_area_struct =
*vma,
  * Pin guest page in memory and return its pfn.
  * @addr: host virtual address which maps memory to the guest
  * @interruptible: whether the process can be interrupted by non-fatal sig=
nals
- * @async: whether this function need to wait IO complete if the
- *         host page is not in the memory
+ * @no_wait: whether or not this function need to wait IO complete if the
+ *	     host page is not in the memory
  * @write_fault: whether we should get a writable host page
  * @writable: whether it allows to map a writable host page for !@write_fa=
ult
  *
@@ -2922,7 +2922,7 @@ static int hva_to_pfn_remapped(struct vm_area_struct =
*vma,
  * 2): @write_fault =3D false && @writable, @writable will tell the caller
  *     whether the mapping is writable.
  */
-kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool *async,
+kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool no_wait,
 		     bool write_fault, bool *writable)
 {
 	struct vm_area_struct *vma;
@@ -2934,7 +2934,7 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool interru=
ptible, bool *async,
 	if (hva_to_pfn_fast(addr, write_fault, writable, &pfn))
 		return pfn;
=20
-	npages =3D hva_to_pfn_slow(addr, async, write_fault, interruptible,
+	npages =3D hva_to_pfn_slow(addr, no_wait, write_fault, interruptible,
 				 writable, &pfn);
 	if (npages =3D=3D 1)
 		return pfn;
@@ -2956,16 +2956,17 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool inter=
ruptible, bool *async,
 		if (r < 0)
 			pfn =3D KVM_PFN_ERR_FAULT;
 	} else {
-		if (async && vma_is_valid(vma, write_fault))
-			*async =3D true;
-		pfn =3D KVM_PFN_ERR_FAULT;
+		if (no_wait && vma_is_valid(vma, write_fault))
+			pfn =3D KVM_PFN_ERR_NEEDS_IO;
+		else
+			pfn =3D KVM_PFN_ERR_FAULT;
 	}
 	mmap_read_unlock(current->mm);
 	return pfn;
 }
=20
 kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t g=
fn,
-			       bool interruptible, bool *async,
+			       bool interruptible, bool no_wait,
 			       bool write_fault, bool *writable, hva_t *hva)
 {
 	unsigned long addr =3D __gfn_to_hva_many(slot, gfn, NULL, write_fault);
@@ -2987,21 +2988,21 @@ kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_mem=
ory_slot *slot, gfn_t gfn,
 		writable =3D NULL;
 	}
=20
-	return hva_to_pfn(addr, interruptible, async, write_fault, writable);
+	return hva_to_pfn(addr, interruptible, no_wait, write_fault, writable);
 }
 EXPORT_SYMBOL_GPL(__gfn_to_pfn_memslot);
=20
 kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
 		      bool *writable)
 {
-	return __gfn_to_pfn_memslot(gfn_to_memslot(kvm, gfn), gfn, false, NULL,
+	return __gfn_to_pfn_memslot(gfn_to_memslot(kvm, gfn), gfn, false, false,
 				    write_fault, writable, NULL);
 }
 EXPORT_SYMBOL_GPL(gfn_to_pfn_prot);
=20
 kvm_pfn_t gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn=
)
 {
-	return __gfn_to_pfn_memslot(slot, gfn, false, NULL, true, NULL, NULL);
+	return __gfn_to_pfn_memslot(slot, gfn, false, false, true, NULL, NULL);
 }
 EXPORT_SYMBOL_GPL(gfn_to_pfn_memslot);
=20
diff --git a/virt/kvm/kvm_mm.h b/virt/kvm/kvm_mm.h
index a3fa86f60d6c..51f3fee4ca3f 100644
--- a/virt/kvm/kvm_mm.h
+++ b/virt/kvm/kvm_mm.h
@@ -20,7 +20,7 @@
 #define KVM_MMU_UNLOCK(kvm)		spin_unlock(&(kvm)->mmu_lock)
 #endif /* KVM_HAVE_MMU_RWLOCK */
=20
-kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool *async,
+kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool no_wait,
 		     bool write_fault, bool *writable);
=20
 #ifdef CONFIG_HAVE_KVM_PFNCACHE
diff --git a/virt/kvm/pfncache.c b/virt/kvm/pfncache.c
index 58c706a610e5..32dc61f48c81 100644
--- a/virt/kvm/pfncache.c
+++ b/virt/kvm/pfncache.c
@@ -197,8 +197,8 @@ static kvm_pfn_t hva_to_pfn_retry(struct gfn_to_pfn_cac=
he *gpc)
 			cond_resched();
 		}
=20
-		/* We always request a writeable mapping */
-		new_pfn =3D hva_to_pfn(gpc->uhva, false, NULL, true, NULL);
+		/* We always request a writable mapping */
+		new_pfn =3D hva_to_pfn(gpc->uhva, false, false, true, NULL);
 		if (is_error_noslot_pfn(new_pfn))
 			goto out_error;
=20
--=20
2.47.0.rc1.288.g06298d1525-goog


