Return-Path: <linuxppc-dev+bounces-2018-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD135999024
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:28:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdVg6p1yz3c3w;
	Fri, 11 Oct 2024 05:26:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1149"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584763;
	cv=none; b=AGq6UQOVYirV25SQ9OVUXS6ialZ/dogKBkicATUXRS3NAxa7OvcPB1MqRK7BUbad3/+NEnjQHeENc7p9vMvFg6Ty8KCJzFuTC8wGA0w/xN/n65G0mSkct+aQE8vM8IJKjNL/kNoB+MpxJddrZTI38JGjWvKYAg8Wj/C2OonZK6hULUkMzge1tZi6/QtkAppDzO69gswZn4kthPdfvM1CAMimMwHxT9mDUnCzGHA4DDl2YBWbafe3n0OrUV8WmkM1KCTib6M/KvMY2sTpkQ67uXGOgHhDGQftXjbvYbTM0AGG1cIpfxkCE8XBnRwa2oNfWQTgZ4uQYp8R7+BGDoCDHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584763; c=relaxed/relaxed;
	bh=+DlXoUFYFzJpPJut8ySNZ/avzuJs4Hk+oSmN6VTWgSk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JHIl4XDMmwiF2KOO0c9VGoX5HjR+K3AkB2tCd6Q/LF+e24CRivPqeaI+1Dk/hbent34gdf857ZFeMGFO/Uypg8D8knoBcBlur05oRMfdCe8AnY0kGFpRlTf54QKUsJed4mO6S1k3DtSiOtvqmwdcxhxrIl2IRUMmDE5VEQRaK6jaDSoyj5KGDOCrYdrIWyuf1sraj8JP4+yS3ULMJPli/UI+4ddRf+QOqqpLD7F6k44eTtjVpLJhfCIjCXxgW/pwXvQPetD/WkYN+18nHmlhjfT6rdHfNlXeGHgL7fCHWHHpms4baLHpTOhsi5RP7GidcJTDFbIGE+5IzOqdQORTUQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=XtL1wuRc; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3obwizwykdm8dzv84x19916z.x97638fiaax-yzg63ded.9k6vwd.9c1@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=XtL1wuRc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3obwizwykdm8dzv84x19916z.x97638fiaax-yzg63ded.9k6vwd.9c1@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdVf6W8bz3c4h
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:26:02 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e3204db795so21454167b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584761; x=1729189561; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+DlXoUFYFzJpPJut8ySNZ/avzuJs4Hk+oSmN6VTWgSk=;
        b=XtL1wuRcXLmwXw9AJzFH+LJYxpjA9ZnkZUez4f67/w/kCprdm0FaL3QXcbmIhJ6smB
         zIimp0qBpi7+BB9lvFzyUKD0jycwPjXaL3FN66VTvz0RVKG0e39pBkBuWnBMofJ0NPIy
         f+nR9OICFA/7w4u67QILEcKcPxpIoqnRcxrRZxAnCceSL5Y8N9AeelKtE4OIv07FUzka
         kYgDGmu1Js+PCtalQxaEdvs8TwlrdnBEzVfLSsdWregyEmvHPPjRRpT/JHcPbIdTTnt+
         b6e2D+LTm9+nAPZFROGOiL0YO1DFKJhHsl8s++YFjFOskv9w7VD8KkSu/v5lhyVNFej3
         BmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584761; x=1729189561;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+DlXoUFYFzJpPJut8ySNZ/avzuJs4Hk+oSmN6VTWgSk=;
        b=bP+y8IZKApupoIm9WmwYESxaEmNUIBuORtQwDil4VWWkFCdXaOq2HwYbZAwI55xmiW
         Thrw1C7QU0qIpXPjFcSQWJJnxVYPr0hHxA+yBz2wNh2eWgWEVCRRDWAOyEnC9KS8Lc4r
         XMiM6PFwdoX9CWyX7KqtxoF0yNmC4JDNXeiOeGMk8L2E6fAcZGF1OP/5uxsWNqAhCCLL
         gFJyffvCkAZEzVZ8VbbJ+wBZyT+EfiID85Lnt2671hKrLCvOL/sLtVDnPwOJy6wodozf
         XyFqbCnUGWWUS+53pjjlv9tDkejqeLHMk/m0WRa33Gxt+t4UF1oz70A1DrIZmQnP864X
         oSjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWl68NCANBvN16TFVdhRfpoupBC5AJJYNOgl72goUH5Q+PjLtRD+Wx2P1BWEGTVzixs1jMJGEi6l8vb4WA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw0y0wwmBF9l0bPGOODZeI3RwX1/MGR2EdsL2nCq0fmco8QcxNu
	Z48Ybh54JYWhjut4eLwh7D7fZqOtJsMRJXB881lTHVP2tN1j0SKFSTJacrE8g6gIXHIsltE2EGI
	KGg==
X-Google-Smtp-Source: AGHT+IHYBe/gylmYYB76Y4JbCGQqBxyU7NvKFk8CzbtQRqqOSH0kk5njqmBLFW7wxt+Okx9MKc9CHg/F7Og=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:4349:b0:6e2:1713:bdb5 with SMTP id
 00721157ae682-6e32217cfd3mr118607b3.5.1728584760829; Thu, 10 Oct 2024
 11:26:00 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:35 -0700
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
Message-ID: <20241010182427.1434605-34-seanjc@google.com>
Subject: [PATCH v13 33/85] KVM: Pass in write/dirty to kvm_vcpu_map(), not kvm_vcpu_unmap()
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

Now that all kvm_vcpu_{,un}map() users pass "true" for @dirty, have them
pass "true" as a @writable param to kvm_vcpu_map(), and thus create a
read-only mapping when possible.

Note, creating read-only mappings can be theoretically slower, as they
don't play nice with fast GUP due to the need to break CoW before mapping
the underlying PFN.  But practically speaking, creating a mapping isn't
a super hot path, and getting a writable mapping for reading is weird and
confusing.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/nested.c |  4 ++--
 arch/x86/kvm/svm/sev.c    |  2 +-
 arch/x86/kvm/svm/svm.c    |  8 ++++----
 arch/x86/kvm/vmx/nested.c | 16 ++++++++--------
 include/linux/kvm_host.h  | 20 ++++++++++++++++++--
 virt/kvm/kvm_main.c       | 12 +++++++-----
 6 files changed, 40 insertions(+), 22 deletions(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index d5314cb7dff4..9f9478bdecfc 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -922,7 +922,7 @@ int nested_svm_vmrun(struct kvm_vcpu *vcpu)
 	nested_svm_vmexit(svm);
=20
 out:
-	kvm_vcpu_unmap(vcpu, &map, true);
+	kvm_vcpu_unmap(vcpu, &map);
=20
 	return ret;
 }
@@ -1126,7 +1126,7 @@ int nested_svm_vmexit(struct vcpu_svm *svm)
 				       vmcb12->control.exit_int_info_err,
 				       KVM_ISA_SVM);
=20
-	kvm_vcpu_unmap(vcpu, &map, true);
+	kvm_vcpu_unmap(vcpu, &map);
=20
 	nested_svm_transition_tlb_flush(vcpu);
=20
diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 0b851ef937f2..4557ff3804ae 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -3468,7 +3468,7 @@ void sev_es_unmap_ghcb(struct vcpu_svm *svm)
=20
 	sev_es_sync_to_ghcb(svm);
=20
-	kvm_vcpu_unmap(&svm->vcpu, &svm->sev_es.ghcb_map, true);
+	kvm_vcpu_unmap(&svm->vcpu, &svm->sev_es.ghcb_map);
 	svm->sev_es.ghcb =3D NULL;
 }
=20
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 9df3e1e5ae81..c1e29307826b 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -2299,7 +2299,7 @@ static int vmload_vmsave_interception(struct kvm_vcpu=
 *vcpu, bool vmload)
 		svm_copy_vmloadsave_state(vmcb12, svm->vmcb);
 	}
=20
-	kvm_vcpu_unmap(vcpu, &map, true);
+	kvm_vcpu_unmap(vcpu, &map);
=20
 	return ret;
 }
@@ -4714,7 +4714,7 @@ static int svm_enter_smm(struct kvm_vcpu *vcpu, union=
 kvm_smram *smram)
 	svm_copy_vmrun_state(map_save.hva + 0x400,
 			     &svm->vmcb01.ptr->save);
=20
-	kvm_vcpu_unmap(vcpu, &map_save, true);
+	kvm_vcpu_unmap(vcpu, &map_save);
 	return 0;
 }
=20
@@ -4774,9 +4774,9 @@ static int svm_leave_smm(struct kvm_vcpu *vcpu, const=
 union kvm_smram *smram)
 	svm->nested.nested_run_pending =3D 1;
=20
 unmap_save:
-	kvm_vcpu_unmap(vcpu, &map_save, true);
+	kvm_vcpu_unmap(vcpu, &map_save);
 unmap_map:
-	kvm_vcpu_unmap(vcpu, &map, true);
+	kvm_vcpu_unmap(vcpu, &map);
 	return ret;
 }
=20
diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index ff83b56fe2fa..259fe445e695 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -231,7 +231,7 @@ static inline void nested_release_evmcs(struct kvm_vcpu=
 *vcpu)
 	struct kvm_vcpu_hv *hv_vcpu =3D to_hv_vcpu(vcpu);
 	struct vcpu_vmx *vmx =3D to_vmx(vcpu);
=20
-	kvm_vcpu_unmap(vcpu, &vmx->nested.hv_evmcs_map, true);
+	kvm_vcpu_unmap(vcpu, &vmx->nested.hv_evmcs_map);
 	vmx->nested.hv_evmcs =3D NULL;
 	vmx->nested.hv_evmcs_vmptr =3D EVMPTR_INVALID;
=20
@@ -318,9 +318,9 @@ static void nested_put_vmcs12_pages(struct kvm_vcpu *vc=
pu)
 {
 	struct vcpu_vmx *vmx =3D to_vmx(vcpu);
=20
-	kvm_vcpu_unmap(vcpu, &vmx->nested.apic_access_page_map, true);
-	kvm_vcpu_unmap(vcpu, &vmx->nested.virtual_apic_map, true);
-	kvm_vcpu_unmap(vcpu, &vmx->nested.pi_desc_map, true);
+	kvm_vcpu_unmap(vcpu, &vmx->nested.apic_access_page_map);
+	kvm_vcpu_unmap(vcpu, &vmx->nested.virtual_apic_map);
+	kvm_vcpu_unmap(vcpu, &vmx->nested.pi_desc_map);
 	vmx->nested.pi_desc =3D NULL;
 }
=20
@@ -624,7 +624,7 @@ static inline bool nested_vmx_prepare_msr_bitmap(struct=
 kvm_vcpu *vcpu,
 	int msr;
 	unsigned long *msr_bitmap_l1;
 	unsigned long *msr_bitmap_l0 =3D vmx->nested.vmcs02.msr_bitmap;
-	struct kvm_host_map msr_bitmap_map;
+	struct kvm_host_map map;
=20
 	/* Nothing to do if the MSR bitmap is not in use.  */
 	if (!cpu_has_vmx_msr_bitmap() ||
@@ -647,10 +647,10 @@ static inline bool nested_vmx_prepare_msr_bitmap(stru=
ct kvm_vcpu *vcpu,
 			return true;
 	}
=20
-	if (kvm_vcpu_map(vcpu, gpa_to_gfn(vmcs12->msr_bitmap), &msr_bitmap_map))
+	if (kvm_vcpu_map_readonly(vcpu, gpa_to_gfn(vmcs12->msr_bitmap), &map))
 		return false;
=20
-	msr_bitmap_l1 =3D (unsigned long *)msr_bitmap_map.hva;
+	msr_bitmap_l1 =3D (unsigned long *)map.hva;
=20
 	/*
 	 * To keep the control flow simple, pay eight 8-byte writes (sixteen
@@ -714,7 +714,7 @@ static inline bool nested_vmx_prepare_msr_bitmap(struct=
 kvm_vcpu *vcpu,
 	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
 					 MSR_IA32_FLUSH_CMD, MSR_TYPE_W);
=20
-	kvm_vcpu_unmap(vcpu, &msr_bitmap_map, false);
+	kvm_vcpu_unmap(vcpu, &map);
=20
 	vmx->nested.force_msr_bitmap_recalc =3D false;
=20
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 8739b905d85b..9263375d0362 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -285,6 +285,7 @@ struct kvm_host_map {
 	void *hva;
 	kvm_pfn_t pfn;
 	kvm_pfn_t gfn;
+	bool writable;
 };
=20
 /*
@@ -1312,8 +1313,23 @@ void mark_page_dirty(struct kvm *kvm, gfn_t gfn);
 struct kvm_memslots *kvm_vcpu_memslots(struct kvm_vcpu *vcpu);
 struct kvm_memory_slot *kvm_vcpu_gfn_to_memslot(struct kvm_vcpu *vcpu, gfn=
_t gfn);
 kvm_pfn_t kvm_vcpu_gfn_to_pfn(struct kvm_vcpu *vcpu, gfn_t gfn);
-int kvm_vcpu_map(struct kvm_vcpu *vcpu, gpa_t gpa, struct kvm_host_map *ma=
p);
-void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct kvm_host_map *map, bool =
dirty);
+
+int __kvm_vcpu_map(struct kvm_vcpu *vcpu, gpa_t gpa, struct kvm_host_map *=
map,
+		   bool writable);
+void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct kvm_host_map *map);
+
+static inline int kvm_vcpu_map(struct kvm_vcpu *vcpu, gpa_t gpa,
+			       struct kvm_host_map *map)
+{
+	return __kvm_vcpu_map(vcpu, gpa, map, true);
+}
+
+static inline int kvm_vcpu_map_readonly(struct kvm_vcpu *vcpu, gpa_t gpa,
+					struct kvm_host_map *map)
+{
+	return __kvm_vcpu_map(vcpu, gpa, map, false);
+}
+
 unsigned long kvm_vcpu_gfn_to_hva(struct kvm_vcpu *vcpu, gfn_t gfn);
 unsigned long kvm_vcpu_gfn_to_hva_prot(struct kvm_vcpu *vcpu, gfn_t gfn, b=
ool *writable);
 int kvm_vcpu_read_guest_page(struct kvm_vcpu *vcpu, gfn_t gfn, void *data,=
 int offset,
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 40a59526d466..080740f65061 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3116,7 +3116,8 @@ struct page *gfn_to_page(struct kvm *kvm, gfn_t gfn)
 }
 EXPORT_SYMBOL_GPL(gfn_to_page);
=20
-int kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *ma=
p)
+int __kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *=
map,
+		   bool writable)
 {
 	struct kvm_follow_pfn kfp =3D {
 		.slot =3D gfn_to_memslot(vcpu->kvm, gfn),
@@ -3130,6 +3131,7 @@ int kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, st=
ruct kvm_host_map *map)
 	map->page =3D NULL;
 	map->hva =3D NULL;
 	map->gfn =3D gfn;
+	map->writable =3D writable;
=20
 	map->pfn =3D kvm_follow_pfn(&kfp);
 	if (is_error_noslot_pfn(map->pfn))
@@ -3146,9 +3148,9 @@ int kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, st=
ruct kvm_host_map *map)
=20
 	return map->hva ? 0 : -EFAULT;
 }
-EXPORT_SYMBOL_GPL(kvm_vcpu_map);
+EXPORT_SYMBOL_GPL(__kvm_vcpu_map);
=20
-void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct kvm_host_map *map, bool =
dirty)
+void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct kvm_host_map *map)
 {
 	if (!map->hva)
 		return;
@@ -3160,11 +3162,11 @@ void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct k=
vm_host_map *map, bool dirty)
 		memunmap(map->hva);
 #endif
=20
-	if (dirty)
+	if (map->writable)
 		kvm_vcpu_mark_page_dirty(vcpu, map->gfn);
=20
 	if (map->pinned_page) {
-		if (dirty)
+		if (map->writable)
 			kvm_set_page_dirty(map->pinned_page);
 		kvm_set_page_accessed(map->pinned_page);
 		unpin_user_page(map->pinned_page);
--=20
2.47.0.rc1.288.g06298d1525-goog


