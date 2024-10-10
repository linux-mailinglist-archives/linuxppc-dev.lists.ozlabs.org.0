Return-Path: <linuxppc-dev+bounces-2031-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B270E999040
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:30:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdWC5P6lz3cJ9;
	Fri, 11 Oct 2024 05:26:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::114a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584791;
	cv=none; b=jBX9nDXDSpWrImEKvUl4lksKn8ZajyltQtZKapLbYs2GVZKfba8Vy87RdLHl0wWbFvHV+tMeV4iL/bLz4Xkbk2xYv70C1qahaInCVYoAbk8AMP5HKYfFpcuJNXlUZTuIEBN2FnmMi57y/dFo67A9fdXgxATT9tO+aSC9zSuAPI2GX7IJkoBo/E9RFEXQ3AlpAhHond3xN7G+vZ/T/KMh1XLTuCWzut6l4gkw/RtOHy9Tt3ijSfaCM2TRirR3AdHdyBQBE1/2Hv0nB0cSuPTUy+9Mqzofnl8m0cVsjgGUbwNTBJ4/CIR/t8c94WEUy52uMVCMVi3fQTEYrL8QD+549g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584791; c=relaxed/relaxed;
	bh=/DfuS3cqNKQbdjipc1jp6gNPynmr8H/oDbYVrbrij3Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=n07U7+Lvlh++42/J6Uu53+X91pU9fTH65Ptk02bklDK8NKxSkCG1u33UUa0iOn39WPDlyH9ZaCTcJJGjauFNADj8t/HNccXH1+WxTnUHqXe0HKYHtrYbsir8yBmAUVQ7l3pJ+uFQ0++8XkE3GkQAgAgBqX60t+M7Jh9XyT6uBYDz3y4RzLSkG5GgpnxjFj0vONyyyzuAX8CICQW8xFD0hJEq8JxIXqNonDcZVuA6ojUwEbvXNfp5DnFwYKGFy1L+dx6hDKDCNIZT0bCiT06CJDyBTU5HiBIqipN5xc4EHt08Jv6sxR3cMw6/G0xl9xz87qsQct5ObYRjWgi/XWiqoA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=X9IprL1X; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3vbwizwykdosfrnawptbbtyr.pbzyvahkccp-qriyvfgf.bmynof.bet@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=X9IprL1X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3vbwizwykdosfrnawptbbtyr.pbzyvahkccp-qriyvfgf.bmynof.bet@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdWB5BSKz3cH7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:26:30 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e21dcc7044so22838457b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584789; x=1729189589; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/DfuS3cqNKQbdjipc1jp6gNPynmr8H/oDbYVrbrij3Q=;
        b=X9IprL1XyICK9ASeRHUhaeYlGYdJaqLeEqbbTBjil0BXhWB5c4JKs/84iqBb6R/EHl
         LsyiBbUO4yt8wo5W36Ywl4m0U83hp0pezZaJ12vdph0DNhJsB6NVMq0u9JhEaY7kda5N
         Mhmbkk2w7kujuIt7FG9PLvKgDqP664pyNLLAL9SHzEiVj/HwJNCYWfIVFHPoysUWiC1u
         6G9z3Bu25YHMB0teUbWps1WiR36XU7IQPye64mPDie0+pCmDYWXCQySgdqmUmQX08gbW
         IJciMTq8dS41XRlDaiIczoaC0iJETWvbFC+WmNZTqux3AwDZcVFfRphM2T79UT05fYGG
         +iUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584789; x=1729189589;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/DfuS3cqNKQbdjipc1jp6gNPynmr8H/oDbYVrbrij3Q=;
        b=flalp9nQktpIuDpjCBalBMUnFEOuJYPn2HmeGgIs4BjEmxNN2/5nccmZ3y+yhffszK
         amEdHopohog4vBYMwQRd/nXKpFh6S4qIANsYAhgvmQHlhAofhrixHUULgFTrIr+RXOBC
         5i0UdTfd1pipk962JxO94nSqlubQOLuhTx1mu5MB3/mqOEx01Ch8jofUaAS4QoftGtJt
         vONKTN6TYaZaYoSNQuX3aFuXYBt0qd3/sMCNTsrG+njsvwTBbeiLepaRbrqR5R17AtQG
         /1ZjzikErvGS4pkP1FSy+c5p4N2xVwn7yEVDKSXgjnuVeqVayE0ogxrS1+YMhIP9AIN6
         HDXQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0Qk/gyzJFI8g4LNW4WOppLq794vn4VXkSsiES3BSXEDp50AVXvVDSKuvZK78mOgYKz6obWIK76Dv7Uk0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzSqfI+n+SVzI8c36FlOaF1A4SDyUDua4SQgtgJ5Z3CC1Izuz6x
	/H9p7LVpHZJLUdCBa9tLfDQissX+gb5vcN6+impmDfpGDyQ+rmAEp7qSBGLfc56lrLga8jGpSI/
	6Dw==
X-Google-Smtp-Source: AGHT+IHLQFn8WLOIHu4PHZ3K+TrLKBMF9JlmWl30kTXK43TD90b+TNbg3ZepRFQQdmJeel5bU/EhDzobpdQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:b191:0:b0:e1f:eaf1:2254 with SMTP id
 3f1490d57ef6-e28fe41acaamr82536276.8.1728584788687; Thu, 10 Oct 2024 11:26:28
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:48 -0700
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
Message-ID: <20241010182427.1434605-47-seanjc@google.com>
Subject: [PATCH v13 46/85] KVM: guest_memfd: Provide "struct page" as output
 from kvm_gmem_get_pfn()
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

Provide the "struct page" associated with a guest_memfd pfn as an output
from __kvm_gmem_get_pfn() so that KVM guest page fault handlers can
directly put the page instead of having to rely on
kvm_pfn_to_refcounted_page().

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c   |  2 +-
 arch/x86/kvm/svm/sev.c   | 10 ++++++----
 include/linux/kvm_host.h |  6 ++++--
 virt/kvm/guest_memfd.c   |  8 ++++++--
 4 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 2e2076287aaf..a038cde74f0d 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4400,7 +4400,7 @@ static int kvm_mmu_faultin_pfn_private(struct kvm_vcp=
u *vcpu,
 	}
=20
 	r =3D kvm_gmem_get_pfn(vcpu->kvm, fault->slot, fault->gfn, &fault->pfn,
-			     &max_order);
+			     &fault->refcounted_page, &max_order);
 	if (r) {
 		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
 		return r;
diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 4557ff3804ae..c6c852485900 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -3849,6 +3849,7 @@ static int __sev_snp_update_protected_guest_state(str=
uct kvm_vcpu *vcpu)
 	if (VALID_PAGE(svm->sev_es.snp_vmsa_gpa)) {
 		gfn_t gfn =3D gpa_to_gfn(svm->sev_es.snp_vmsa_gpa);
 		struct kvm_memory_slot *slot;
+		struct page *page;
 		kvm_pfn_t pfn;
=20
 		slot =3D gfn_to_memslot(vcpu->kvm, gfn);
@@ -3859,7 +3860,7 @@ static int __sev_snp_update_protected_guest_state(str=
uct kvm_vcpu *vcpu)
 		 * The new VMSA will be private memory guest memory, so
 		 * retrieve the PFN from the gmem backend.
 		 */
-		if (kvm_gmem_get_pfn(vcpu->kvm, slot, gfn, &pfn, NULL))
+		if (kvm_gmem_get_pfn(vcpu->kvm, slot, gfn, &pfn, &page, NULL))
 			return -EINVAL;
=20
 		/*
@@ -3888,7 +3889,7 @@ static int __sev_snp_update_protected_guest_state(str=
uct kvm_vcpu *vcpu)
 		 * changes then care should be taken to ensure
 		 * svm->sev_es.vmsa is pinned through some other means.
 		 */
-		kvm_release_pfn_clean(pfn);
+		kvm_release_page_clean(page);
 	}
=20
 	/*
@@ -4688,6 +4689,7 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_=
t gpa, u64 error_code)
 	struct kvm_memory_slot *slot;
 	struct kvm *kvm =3D vcpu->kvm;
 	int order, rmp_level, ret;
+	struct page *page;
 	bool assigned;
 	kvm_pfn_t pfn;
 	gfn_t gfn;
@@ -4714,7 +4716,7 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_=
t gpa, u64 error_code)
 		return;
 	}
=20
-	ret =3D kvm_gmem_get_pfn(kvm, slot, gfn, &pfn, &order);
+	ret =3D kvm_gmem_get_pfn(kvm, slot, gfn, &pfn, &page, &order);
 	if (ret) {
 		pr_warn_ratelimited("SEV: Unexpected RMP fault, no backing page for priv=
ate GPA 0x%llx\n",
 				    gpa);
@@ -4772,7 +4774,7 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_=
t gpa, u64 error_code)
 out:
 	trace_kvm_rmp_fault(vcpu, gpa, pfn, error_code, rmp_level, ret);
 out_no_trace:
-	put_page(pfn_to_page(pfn));
+	kvm_release_page_unused(page);
 }
=20
 static bool is_pfn_range_shared(kvm_pfn_t start, kvm_pfn_t end)
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3b9afb40e935..504483d35197 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2490,11 +2490,13 @@ static inline bool kvm_mem_is_private(struct kvm *k=
vm, gfn_t gfn)
=20
 #ifdef CONFIG_KVM_PRIVATE_MEM
 int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
-		     gfn_t gfn, kvm_pfn_t *pfn, int *max_order);
+		     gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
+		     int *max_order);
 #else
 static inline int kvm_gmem_get_pfn(struct kvm *kvm,
 				   struct kvm_memory_slot *slot, gfn_t gfn,
-				   kvm_pfn_t *pfn, int *max_order)
+				   kvm_pfn_t *pfn, struct page **page,
+				   int *max_order)
 {
 	KVM_BUG_ON(1, kvm);
 	return -EIO;
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 8a878e57c5d4..47a9f68f7b24 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -594,7 +594,8 @@ static struct folio *__kvm_gmem_get_pfn(struct file *fi=
le,
 }
=20
 int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
-		     gfn_t gfn, kvm_pfn_t *pfn, int *max_order)
+		     gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
+		     int *max_order)
 {
 	pgoff_t index =3D kvm_gmem_get_index(slot, gfn);
 	struct file *file =3D kvm_gmem_get_file(slot);
@@ -615,7 +616,10 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memor=
y_slot *slot,
 		r =3D kvm_gmem_prepare_folio(kvm, slot, gfn, folio);
=20
 	folio_unlock(folio);
-	if (r < 0)
+
+	if (!r)
+		*page =3D folio_file_page(folio, index);
+	else
 		folio_put(folio);
=20
 out:
--=20
2.47.0.rc1.288.g06298d1525-goog


