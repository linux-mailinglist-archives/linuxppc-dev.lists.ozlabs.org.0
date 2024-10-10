Return-Path: <linuxppc-dev+bounces-2024-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD66599902F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:29:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdVv6t4jz3cFq;
	Fri, 11 Oct 2024 05:26:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::64a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584775;
	cv=none; b=Dv5Lg4HKXsWKAetZEa+OVBXbq+VLskHDxGEt/mpiop/hB9GxV9Esg2nocGCDeC2UNnWb8UkmbTWbaTmHgaFoHjhVZYtFBP+g338bUEkRW/d4FAHp/rgPl72zJraT3PRP34aWmV7YqNu2v6id7nRJ5g1idfKsL/dlfAoqPL4dYVrAtc7Cca2oA6r63t9dbvjpivoJ6G6+jD2ucxuzb2oTLKPx7LgkzDLAEHMj6Xv3Zl9iUkDHNpsQ6gbs4LYUogqirj/5gSmmYl2K7awkPwEuUJobmhm47jICh8qbjGNgzWRE+v0q6tbnNhmGAmp4Y5b7EbTdHUJgLhpJoZpB7NkPLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584775; c=relaxed/relaxed;
	bh=bLMllFEXz5NbCB79T5EDeXxXCOdT0E/lPN9LlBgR2FM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PH9JcjAvPR8lkQ6MzpnBJDzOzJAosOP9GcVwrqc5QDSjzSmy4vf3BcWB1QWwplmMoiYG5MX3OrvbqoHOtQZzMp5B+uP3hGi28AqbQ4mZE4IdRfbWsXX7J4urSjJ2Y/6QCBpus6fvCI7SSwABg88fiZwYYmtDmUmArjEmpE8wPzLr+YjrFP0DfV7OKUvyFWKxRsRU9L6QolxBS0RatFSTwrukeWzQ9F62jPTFWzneb+38ongGjFdYfN8NCGYF9TViihmm1N35m9d+kXvNF/hDKG05P/7xRMgzjb5iHpxj5XDZkS8EST2Z/pGPIWx03g76+L1xPH7BpSX8ur6GqC77Jg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Lw+dQIrZ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3rrwizwykdnwqc8lhaemmejc.amkjglsvnna-bctjgqrq.mxj89q.mpe@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Lw+dQIrZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3rrwizwykdnwqc8lhaemmejc.amkjglsvnna-bctjgqrq.mxj89q.mpe@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdVv1zGSz3bkL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:26:15 +1100 (AEDT)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-20c3d9a0eb2so16543085ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584774; x=1729189574; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLMllFEXz5NbCB79T5EDeXxXCOdT0E/lPN9LlBgR2FM=;
        b=Lw+dQIrZddAcDnTUmessJMQ7kq63wV0+rgDZFkXp6/0LbRnS2PWmc3bDvCNX3QmG9G
         432fPQGf+9QtRR6sRSjV+WMnnDBVdCVHO0UtNeW6CR2+pQYk4PRSTZeXDnrIS/ColmFw
         PFZ1aA5Osw0M+cMxi0zsqivda4uSyC4v0TvivJG0tAgiOVcKwNg3gKFSLYsJ2f6P02hE
         fIe7KiRPS6QEWbUIN1PKAespI7M0uvynZ3MccqFYmoH+2syueKvarMPIIQ9koFcyE2IZ
         DThjV8w+/WoOS2kaLsxFG+8EkMbaYtL+jywdh5slaTjlcAzvni/meg9nEqy58eI/n7Xt
         Blrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584774; x=1729189574;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bLMllFEXz5NbCB79T5EDeXxXCOdT0E/lPN9LlBgR2FM=;
        b=phMaTXvDgHHj889xAC2IaXFBWdRp9QfBnbpezbB6MU2ACJDfMjDbRhHsqSxJY6+OqC
         ZytrW5tWHzoXgYtjzlw124hc5hEWbgTJoqbOWcSDtdOS6l2P1gKcaPEefni8MrnnWbm2
         Sc9dtjPp1vblMY4gRg8lZDEJBqGyaH3tok67e0L76hHQ+BmNewVqJxtrzQKNGxHTt/Eu
         14vhVzqiv5SrEMkMG1v499BpnBKCnaqJrqGHO2iDL8VZ0Qed+xIEeRNI6lrvT0RqZxL5
         SurjCpYX/hcocXaXTdNbp8OCTnP+ioyxkyQpN+GCQ5UJ6RHxOZ6xUt3o6d+37dR5VmiQ
         H2cw==
X-Forwarded-Encrypted: i=1; AJvYcCWQKW6zU0A/R6DU99qAxja/qB6po2p++Z2zsIJcXMGmCplYGT0ejiFiCAyN5O0S75jFRtVeA//drLQyJik=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzeLNeZ3MhUE0jqHqJX/6fmhIjvpyN2KgqjSVm/3agiA7WS4JH1
	P8Do35Esgr/5+fdvBTwvxFi9lXRSRxRmeW1sJ4vhEh2U+oXXsQ7Z+v54TKP1L/C+kJ+ZAwTa9e9
	SgQ==
X-Google-Smtp-Source: AGHT+IHTeV3dFyfdACUyzit3PmgjtoD4THwZ77SaAB8Cv7KtK6sEvfc4IjBdPT+nDHGdhMcMXcKC7R1qaBw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:903:1c8:b0:20c:716c:5af with SMTP id
 d9443c01a7336-20c716c078dmr946605ad.3.1728584773496; Thu, 10 Oct 2024
 11:26:13 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:41 -0700
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
Message-ID: <20241010182427.1434605-40-seanjc@google.com>
Subject: [PATCH v13 39/85] KVM: x86/mmu: Add common helper to handle
 prefetching SPTEs
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

Deduplicate the prefetching code for indirect and direct MMUs.  The core
logic is the same, the only difference is that indirect MMUs need to
prefetch SPTEs one-at-a-time, as contiguous guest virtual addresses aren't
guaranteed to yield contiguous guest physical addresses.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c         | 40 +++++++++++++++++++++-------------
 arch/x86/kvm/mmu/paging_tmpl.h | 13 +----------
 2 files changed, 26 insertions(+), 27 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 62924f95a398..65d3a602eb2c 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2943,32 +2943,41 @@ static int mmu_set_spte(struct kvm_vcpu *vcpu, stru=
ct kvm_memory_slot *slot,
 	return ret;
 }
=20
-static int direct_pte_prefetch_many(struct kvm_vcpu *vcpu,
-				    struct kvm_mmu_page *sp,
-				    u64 *start, u64 *end)
+static bool kvm_mmu_prefetch_sptes(struct kvm_vcpu *vcpu, gfn_t gfn, u64 *=
sptep,
+				   int nr_pages, unsigned int access)
 {
 	struct page *pages[PTE_PREFETCH_NUM];
 	struct kvm_memory_slot *slot;
-	unsigned int access =3D sp->role.access;
-	int i, ret;
-	gfn_t gfn;
+	int i;
+
+	if (WARN_ON_ONCE(nr_pages > PTE_PREFETCH_NUM))
+		return false;
=20
-	gfn =3D kvm_mmu_page_get_gfn(sp, spte_index(start));
 	slot =3D gfn_to_memslot_dirty_bitmap(vcpu, gfn, access & ACC_WRITE_MASK);
 	if (!slot)
-		return -1;
+		return false;
=20
-	ret =3D kvm_prefetch_pages(slot, gfn, pages, end - start);
-	if (ret <=3D 0)
-		return -1;
+	nr_pages =3D kvm_prefetch_pages(slot, gfn, pages, nr_pages);
+	if (nr_pages <=3D 0)
+		return false;
=20
-	for (i =3D 0; i < ret; i++, gfn++, start++) {
-		mmu_set_spte(vcpu, slot, start, access, gfn,
+	for (i =3D 0; i < nr_pages; i++, gfn++, sptep++) {
+		mmu_set_spte(vcpu, slot, sptep, access, gfn,
 			     page_to_pfn(pages[i]), NULL);
 		kvm_release_page_clean(pages[i]);
 	}
=20
-	return 0;
+	return true;
+}
+
+static bool direct_pte_prefetch_many(struct kvm_vcpu *vcpu,
+				     struct kvm_mmu_page *sp,
+				     u64 *start, u64 *end)
+{
+	gfn_t gfn =3D kvm_mmu_page_get_gfn(sp, spte_index(start));
+	unsigned int access =3D sp->role.access;
+
+	return kvm_mmu_prefetch_sptes(vcpu, gfn, start, end - start, access);
 }
=20
 static void __direct_pte_prefetch(struct kvm_vcpu *vcpu,
@@ -2986,8 +2995,9 @@ static void __direct_pte_prefetch(struct kvm_vcpu *vc=
pu,
 		if (is_shadow_present_pte(*spte) || spte =3D=3D sptep) {
 			if (!start)
 				continue;
-			if (direct_pte_prefetch_many(vcpu, sp, start, spte) < 0)
+			if (!direct_pte_prefetch_many(vcpu, sp, start, spte))
 				return;
+
 			start =3D NULL;
 		} else if (!start)
 			start =3D spte;
diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.=
h
index 9bd3d6f5db91..a476a5428017 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -533,9 +533,7 @@ static bool
 FNAME(prefetch_gpte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
 		     u64 *spte, pt_element_t gpte)
 {
-	struct kvm_memory_slot *slot;
 	unsigned pte_access;
-	struct page *page;
 	gfn_t gfn;
=20
 	if (FNAME(prefetch_invalid_gpte)(vcpu, sp, spte, gpte))
@@ -545,16 +543,7 @@ FNAME(prefetch_gpte)(struct kvm_vcpu *vcpu, struct kvm=
_mmu_page *sp,
 	pte_access =3D sp->role.access & FNAME(gpte_access)(gpte);
 	FNAME(protect_clean_gpte)(vcpu->arch.mmu, &pte_access, gpte);
=20
-	slot =3D gfn_to_memslot_dirty_bitmap(vcpu, gfn, pte_access & ACC_WRITE_MA=
SK);
-	if (!slot)
-		return false;
-
-	if (kvm_prefetch_pages(slot, gfn, &page, 1) !=3D 1)
-		return false;
-
-	mmu_set_spte(vcpu, slot, spte, pte_access, gfn, page_to_pfn(page), NULL);
-	kvm_release_page_clean(page);
-	return true;
+	return kvm_mmu_prefetch_sptes(vcpu, gfn, spte, 1, pte_access);
 }
=20
 static bool FNAME(gpte_changed)(struct kvm_vcpu *vcpu,
--=20
2.47.0.rc1.288.g06298d1525-goog


