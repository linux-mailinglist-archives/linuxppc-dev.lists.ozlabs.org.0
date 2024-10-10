Return-Path: <linuxppc-dev+bounces-2004-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC65999004
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:27:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdV813mfz3btX;
	Fri, 11 Oct 2024 05:25:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1149"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584736;
	cv=none; b=UIj5wgN/nJrOhXsaJcn74Cl8KZIEVk/rVPkle21CFbOeJ3HvMH2EjG5c/RWZDUSfWU70PMq1ZwRRi6nKVcAgtJO2cAm/IkLXhdC+H9u0xluZXdpNMUZBt34TiIsodgszdPMIT1UizWMgfJKq74L5sLfu2wNZ0LcToENW+sXDE+fr3FmrRvF8qi8DEm6rlnPrdlFvA2K+sl2rzoNbO7iWj78ypwAs1Ht0JJX/ILgJRu7adhzZDbIdj1K4XJE0oWCgQ/9NBj9Poc3dhcFF8PQ182chxwEFmihOvJs29cHUknegtT4xhGraojY9lRLC1anLNQf/IhGci93aLCP51vt1GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584736; c=relaxed/relaxed;
	bh=GUnoK8hes+aZNWzzso7nvh51KinEVhA6U4mspQ9USyg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lxqmnNZz021xLzwXW/isYk20sSNgO+prMMf0LXNVCWwDbNWo0CIGW//WXyskOJJmsUnru1PScKysBWxs+S/dmqONah1f2vlxeffr3mzNrl20JkeVFKfLBrClTdR59ODKFTWR9H9Kc4KDpxzGhPeLt8P83BU0SH05jdU15QSTyrGDSFtFbtkihiAGjriv9CTtDC9/AhVOhgoDtCGdsHTAP0R5ANnFP+zRLXwXGTzLmVmcksBByxMVWHZ1RilbuiM2A+O3+iLgBZSE4+wBQqsnbtsiPtJkvgb85026sWB0vVhOOL7EeZvZHJT+9xgNCUX5r4BEFfQcaviNYPAcSyncCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Dd1TYurV; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3hrwizwykdlqmyuhdwaiiafy.wigfchorjjw-xypfcmnm.itfuvm.ila@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Dd1TYurV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3hrwizwykdlqmyuhdwaiiafy.wigfchorjjw-xypfcmnm.itfuvm.ila@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdV70fK5z3blc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:25:35 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e0082c1dd0so24638537b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584733; x=1729189533; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUnoK8hes+aZNWzzso7nvh51KinEVhA6U4mspQ9USyg=;
        b=Dd1TYurVW0r2SS3UsYJXzTEytVSR8j4bBpyiNLAOLMHakVp7oCZ2JGdquTm2cxD46m
         8LNirqMf5tMywO9g+ru4vdd3zFL8ropxUoU9BZIk5q015lZVMArt8fJSmWevU2QT1xfD
         hhu3Gg5IXDtA4iwYh4Ll5QzKRzFvzF0rQQSCGU8rahCA8Uq6JEUSWawt9y2SO2ZfFyha
         EoklB8dKRm7Bfge2sz4tlR1IOTNR/r1NG4m3jwh8bQxBZ+VrznE+gKwpSzASO19ONGea
         QurAWvpc5M+UojI/VNvFk1vni2OEv1LwEIzJRvIyAvMRCiL6en43GRhuElbV5tmT/tGV
         S5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584733; x=1729189533;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GUnoK8hes+aZNWzzso7nvh51KinEVhA6U4mspQ9USyg=;
        b=ksi23l2MxT/d1W3uclvGw1QBI8cV5oxA3L67gU1lr1Dky055YquH8cbg1vY+fkJgiF
         mQVhCCxEkUTi5JPfpjCpKG/4PUmL8Eu9QY2VMuvxMjZiz9D6fUJhOdTqT0Lq/w/wlagG
         gG6myGtenj4pCHDzWh0tgXCJcxkrair/bBhZJXgEDUW8mLAZWoKJavz8GsFZxJ7MkLO3
         TYWGG/DNbtPyXw6zIvcTBPu1Cnn6iOzRFr24Lsl0rCW2Y5RsvmkxuphIec+OMx79Y2tP
         QR7mh530CkenjBKzn1kkcfjia2YEyitTJXQOyoiPrBmYL0hDAEwzL9EhC2C3EhVH+XrI
         KV6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWjaexFmUHZ93tpXX+vTm4Uo6UAuC8+ekBLYT3a9GiCI7WWxILxZ1G3T9tkHoaQEjAwHFGyv71OzCyEtjU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwcBuMwz6PEbVcdLnPXdLtSvx3b1aIBg+rgdQdcYuOn9fikMAEV
	nxFRItd917qxnQhlLE5Vz0zzjOMvBy+9VvKZKpxYWBCCu1YnWBOoYWuvsVGxE0HPQzq+86rYljc
	VKw==
X-Google-Smtp-Source: AGHT+IHJGx3vYA/ciscOnZoyMGBDqN0A5fNCXYXCqQ4jImN8v4VZ+ud/0qiiFEbLMXTR4U3Rg3+GOt3HIs4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:2c01:b0:6db:d257:b98 with SMTP id
 00721157ae682-6e32215253bmr563917b3.3.1728584733164; Thu, 10 Oct 2024
 11:25:33 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:21 -0700
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
Message-ID: <20241010182427.1434605-20-seanjc@google.com>
Subject: [PATCH v13 19/85] KVM: Introduce kvm_follow_pfn() to eventually
 replace "gfn_to_pfn" APIs
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

Introduce kvm_follow_pfn() to eventually supplant the various "gfn_to_pfn"
APIs, albeit by adding more wrappers.  The primary motivation of the new
helper is to pass a structure instead of an ever changing set of parameters=
,
e.g. so that tweaking the behavior, inputs, and/or outputs of the "to pfn"
helpers doesn't require churning half of KVM.

In the more distant future, the APIs exposed to arch code could also
follow suit, e.g. by adding something akin to x86's "struct kvm_page_fault"
when faulting in guest memory.  But for now, the goal is purely to clean
up KVM's "internal" MMU code.

As part of the conversion, replace the write_fault, interruptible, and
no-wait boolean flags with FOLL_WRITE, FOLL_INTERRUPTIBLE, and FOLL_NOWAIT
respectively.  Collecting the various FOLL_* flags into a single field
will again ease the pain of passing new flags.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: David Stevens <stevensd@chromium.org>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 162 +++++++++++++++++++++++---------------------
 virt/kvm/kvm_mm.h   |  20 +++++-
 virt/kvm/pfncache.c |   9 ++-
 3 files changed, 109 insertions(+), 82 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 10071f31b2ca..52629ac26119 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2750,8 +2750,7 @@ unsigned long kvm_vcpu_gfn_to_hva_prot(struct kvm_vcp=
u *vcpu, gfn_t gfn, bool *w
  * The fast path to get the writable pfn which will be stored in @pfn,
  * true indicates success, otherwise false is returned.
  */
-static bool hva_to_pfn_fast(unsigned long addr, bool write_fault,
-			    bool *writable, kvm_pfn_t *pfn)
+static bool hva_to_pfn_fast(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)
 {
 	struct page *page[1];
=20
@@ -2760,14 +2759,13 @@ static bool hva_to_pfn_fast(unsigned long addr, boo=
l write_fault,
 	 * or the caller allows to map a writable pfn for a read fault
 	 * request.
 	 */
-	if (!(write_fault || writable))
+	if (!((kfp->flags & FOLL_WRITE) || kfp->map_writable))
 		return false;
=20
-	if (get_user_page_fast_only(addr, FOLL_WRITE, page)) {
+	if (get_user_page_fast_only(kfp->hva, FOLL_WRITE, page)) {
 		*pfn =3D page_to_pfn(page[0]);
-
-		if (writable)
-			*writable =3D true;
+		if (kfp->map_writable)
+			*kfp->map_writable =3D true;
 		return true;
 	}
=20
@@ -2778,8 +2776,7 @@ static bool hva_to_pfn_fast(unsigned long addr, bool =
write_fault,
  * The slow path to get the pfn of the specified host virtual address,
  * 1 indicates success, -errno is returned if error is detected.
  */
-static int hva_to_pfn_slow(unsigned long addr, bool no_wait, bool write_fa=
ult,
-			   bool interruptible, bool *writable, kvm_pfn_t *pfn)
+static int hva_to_pfn_slow(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)
 {
 	/*
 	 * When a VCPU accesses a page that is not mapped into the secondary
@@ -2792,34 +2789,30 @@ static int hva_to_pfn_slow(unsigned long addr, bool=
 no_wait, bool write_fault,
 	 * Note that get_user_page_fast_only() and FOLL_WRITE for now
 	 * implicitly honor NUMA hinting faults and don't need this flag.
 	 */
-	unsigned int flags =3D FOLL_HWPOISON | FOLL_HONOR_NUMA_FAULT;
-	struct page *page;
+	unsigned int flags =3D FOLL_HWPOISON | FOLL_HONOR_NUMA_FAULT | kfp->flags=
;
+	struct page *page, *wpage;
 	int npages;
=20
-	if (writable)
-		*writable =3D write_fault;
-
-	if (write_fault)
-		flags |=3D FOLL_WRITE;
-	if (no_wait)
-		flags |=3D FOLL_NOWAIT;
-	if (interruptible)
-		flags |=3D FOLL_INTERRUPTIBLE;
-
-	npages =3D get_user_pages_unlocked(addr, 1, &page, flags);
+	npages =3D get_user_pages_unlocked(kfp->hva, 1, &page, flags);
 	if (npages !=3D 1)
 		return npages;
=20
+	if (!kfp->map_writable)
+		goto out;
+
+	if (kfp->flags & FOLL_WRITE) {
+		*kfp->map_writable =3D true;
+		goto out;
+	}
+
 	/* map read fault as writable if possible */
-	if (unlikely(!write_fault) && writable) {
-		struct page *wpage;
-
-		if (get_user_page_fast_only(addr, FOLL_WRITE, &wpage)) {
-			*writable =3D true;
-			put_page(page);
-			page =3D wpage;
-		}
+	if (get_user_page_fast_only(kfp->hva, FOLL_WRITE, &wpage)) {
+		*kfp->map_writable =3D true;
+		put_page(page);
+		page =3D wpage;
 	}
+
+out:
 	*pfn =3D page_to_pfn(page);
 	return npages;
 }
@@ -2846,10 +2839,10 @@ static int kvm_try_get_pfn(kvm_pfn_t pfn)
 }
=20
 static int hva_to_pfn_remapped(struct vm_area_struct *vma,
-			       unsigned long addr, bool write_fault,
-			       bool *writable, kvm_pfn_t *p_pfn)
+			       struct kvm_follow_pfn *kfp, kvm_pfn_t *p_pfn)
 {
-	struct follow_pfnmap_args args =3D { .vma =3D vma, .address =3D addr };
+	struct follow_pfnmap_args args =3D { .vma =3D vma, .address =3D kfp->hva =
};
+	bool write_fault =3D kfp->flags & FOLL_WRITE;
 	kvm_pfn_t pfn;
 	int r;
=20
@@ -2860,7 +2853,7 @@ static int hva_to_pfn_remapped(struct vm_area_struct =
*vma,
 		 * not call the fault handler, so do it here.
 		 */
 		bool unlocked =3D false;
-		r =3D fixup_user_fault(current->mm, addr,
+		r =3D fixup_user_fault(current->mm, kfp->hva,
 				     (write_fault ? FAULT_FLAG_WRITE : 0),
 				     &unlocked);
 		if (unlocked)
@@ -2878,8 +2871,8 @@ static int hva_to_pfn_remapped(struct vm_area_struct =
*vma,
 		goto out;
 	}
=20
-	if (writable)
-		*writable =3D args.writable;
+	if (kfp->map_writable)
+		*kfp->map_writable =3D args.writable;
 	pfn =3D args.pfn;
=20
 	/*
@@ -2908,22 +2901,7 @@ static int hva_to_pfn_remapped(struct vm_area_struct=
 *vma,
 	return r;
 }
=20
-/*
- * Pin guest page in memory and return its pfn.
- * @addr: host virtual address which maps memory to the guest
- * @interruptible: whether the process can be interrupted by non-fatal sig=
nals
- * @no_wait: whether or not this function need to wait IO complete if the
- *	     host page is not in the memory
- * @write_fault: whether we should get a writable host page
- * @writable: whether it allows to map a writable host page for !@write_fa=
ult
- *
- * The function will map a writable host page for these two cases:
- * 1): @write_fault =3D true
- * 2): @write_fault =3D false && @writable, @writable will tell the caller
- *     whether the mapping is writable.
- */
-kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool no_wait,
-		     bool write_fault, bool *writable)
+kvm_pfn_t hva_to_pfn(struct kvm_follow_pfn *kfp)
 {
 	struct vm_area_struct *vma;
 	kvm_pfn_t pfn;
@@ -2931,11 +2909,10 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool inter=
ruptible, bool no_wait,
=20
 	might_sleep();
=20
-	if (hva_to_pfn_fast(addr, write_fault, writable, &pfn))
+	if (hva_to_pfn_fast(kfp, &pfn))
 		return pfn;
=20
-	npages =3D hva_to_pfn_slow(addr, no_wait, write_fault, interruptible,
-				 writable, &pfn);
+	npages =3D hva_to_pfn_slow(kfp, &pfn);
 	if (npages =3D=3D 1)
 		return pfn;
 	if (npages =3D=3D -EINTR || npages =3D=3D -EAGAIN)
@@ -2945,18 +2922,19 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool inter=
ruptible, bool no_wait,
=20
 	mmap_read_lock(current->mm);
 retry:
-	vma =3D vma_lookup(current->mm, addr);
+	vma =3D vma_lookup(current->mm, kfp->hva);
=20
 	if (vma =3D=3D NULL)
 		pfn =3D KVM_PFN_ERR_FAULT;
 	else if (vma->vm_flags & (VM_IO | VM_PFNMAP)) {
-		r =3D hva_to_pfn_remapped(vma, addr, write_fault, writable, &pfn);
+		r =3D hva_to_pfn_remapped(vma, kfp, &pfn);
 		if (r =3D=3D -EAGAIN)
 			goto retry;
 		if (r < 0)
 			pfn =3D KVM_PFN_ERR_FAULT;
 	} else {
-		if (no_wait && vma_is_valid(vma, write_fault))
+		if ((kfp->flags & FOLL_NOWAIT) &&
+		    vma_is_valid(vma, kfp->flags & FOLL_WRITE))
 			pfn =3D KVM_PFN_ERR_NEEDS_IO;
 		else
 			pfn =3D KVM_PFN_ERR_FAULT;
@@ -2965,41 +2943,69 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool inter=
ruptible, bool no_wait,
 	return pfn;
 }
=20
+static kvm_pfn_t kvm_follow_pfn(struct kvm_follow_pfn *kfp)
+{
+	kfp->hva =3D __gfn_to_hva_many(kfp->slot, kfp->gfn, NULL,
+				     kfp->flags & FOLL_WRITE);
+
+	if (kfp->hva =3D=3D KVM_HVA_ERR_RO_BAD)
+		return KVM_PFN_ERR_RO_FAULT;
+
+	if (kvm_is_error_hva(kfp->hva))
+		return KVM_PFN_NOSLOT;
+
+	if (memslot_is_readonly(kfp->slot) && kfp->map_writable) {
+		*kfp->map_writable =3D false;
+		kfp->map_writable =3D NULL;
+	}
+
+	return hva_to_pfn(kfp);
+}
+
 kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t g=
fn,
 			       bool interruptible, bool no_wait,
 			       bool write_fault, bool *writable)
 {
-	unsigned long addr =3D __gfn_to_hva_many(slot, gfn, NULL, write_fault);
-
-	if (kvm_is_error_hva(addr)) {
-		if (writable)
-			*writable =3D false;
-
-		return addr =3D=3D KVM_HVA_ERR_RO_BAD ? KVM_PFN_ERR_RO_FAULT :
-						    KVM_PFN_NOSLOT;
-	}
-
-	/* Do not map writable pfn in the readonly memslot. */
-	if (writable && memslot_is_readonly(slot)) {
-		*writable =3D false;
-		writable =3D NULL;
-	}
-
-	return hva_to_pfn(addr, interruptible, no_wait, write_fault, writable);
+	struct kvm_follow_pfn kfp =3D {
+		.slot =3D slot,
+		.gfn =3D gfn,
+		.map_writable =3D writable,
+	};
+
+	if (write_fault)
+		kfp.flags |=3D FOLL_WRITE;
+	if (no_wait)
+		kfp.flags |=3D FOLL_NOWAIT;
+	if (interruptible)
+		kfp.flags |=3D FOLL_INTERRUPTIBLE;
+
+	return kvm_follow_pfn(&kfp);
 }
 EXPORT_SYMBOL_GPL(__gfn_to_pfn_memslot);
=20
 kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
 		      bool *writable)
 {
-	return __gfn_to_pfn_memslot(gfn_to_memslot(kvm, gfn), gfn, false, false,
-				    write_fault, writable);
+	struct kvm_follow_pfn kfp =3D {
+		.slot =3D gfn_to_memslot(kvm, gfn),
+		.gfn =3D gfn,
+		.flags =3D write_fault ? FOLL_WRITE : 0,
+		.map_writable =3D writable,
+	};
+
+	return kvm_follow_pfn(&kfp);
 }
 EXPORT_SYMBOL_GPL(gfn_to_pfn_prot);
=20
 kvm_pfn_t gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn=
)
 {
-	return __gfn_to_pfn_memslot(slot, gfn, false, false, true, NULL);
+	struct kvm_follow_pfn kfp =3D {
+		.slot =3D slot,
+		.gfn =3D gfn,
+		.flags =3D FOLL_WRITE,
+	};
+
+	return kvm_follow_pfn(&kfp);
 }
 EXPORT_SYMBOL_GPL(gfn_to_pfn_memslot);
=20
diff --git a/virt/kvm/kvm_mm.h b/virt/kvm/kvm_mm.h
index 51f3fee4ca3f..d5a215958f06 100644
--- a/virt/kvm/kvm_mm.h
+++ b/virt/kvm/kvm_mm.h
@@ -20,8 +20,24 @@
 #define KVM_MMU_UNLOCK(kvm)		spin_unlock(&(kvm)->mmu_lock)
 #endif /* KVM_HAVE_MMU_RWLOCK */
=20
-kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool no_wait,
-		     bool write_fault, bool *writable);
+
+struct kvm_follow_pfn {
+	const struct kvm_memory_slot *slot;
+	const gfn_t gfn;
+
+	unsigned long hva;
+
+	/* FOLL_* flags modifying lookup behavior, e.g. FOLL_WRITE. */
+	unsigned int flags;
+
+	/*
+	 * If non-NULL, try to get a writable mapping even for a read fault.
+	 * Set to true if a writable mapping was obtained.
+	 */
+	bool *map_writable;
+};
+
+kvm_pfn_t hva_to_pfn(struct kvm_follow_pfn *kfp);
=20
 #ifdef CONFIG_HAVE_KVM_PFNCACHE
 void gfn_to_pfn_cache_invalidate_start(struct kvm *kvm,
diff --git a/virt/kvm/pfncache.c b/virt/kvm/pfncache.c
index 32dc61f48c81..067daf9ad6ef 100644
--- a/virt/kvm/pfncache.c
+++ b/virt/kvm/pfncache.c
@@ -159,6 +159,12 @@ static kvm_pfn_t hva_to_pfn_retry(struct gfn_to_pfn_ca=
che *gpc)
 	kvm_pfn_t new_pfn =3D KVM_PFN_ERR_FAULT;
 	void *new_khva =3D NULL;
 	unsigned long mmu_seq;
+	struct kvm_follow_pfn kfp =3D {
+		.slot =3D gpc->memslot,
+		.gfn =3D gpa_to_gfn(gpc->gpa),
+		.flags =3D FOLL_WRITE,
+		.hva =3D gpc->uhva,
+	};
=20
 	lockdep_assert_held(&gpc->refresh_lock);
=20
@@ -197,8 +203,7 @@ static kvm_pfn_t hva_to_pfn_retry(struct gfn_to_pfn_cac=
he *gpc)
 			cond_resched();
 		}
=20
-		/* We always request a writable mapping */
-		new_pfn =3D hva_to_pfn(gpc->uhva, false, false, true, NULL);
+		new_pfn =3D hva_to_pfn(&kfp);
 		if (is_error_noslot_pfn(new_pfn))
 			goto out_error;
=20
--=20
2.47.0.rc1.288.g06298d1525-goog


