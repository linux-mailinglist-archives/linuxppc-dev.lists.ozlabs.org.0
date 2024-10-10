Return-Path: <linuxppc-dev+bounces-2003-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1072999003
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:26:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdV56nm4z3bv8;
	Fri, 11 Oct 2024 05:25:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584733;
	cv=none; b=mxKMo+LM10kf/SetamTqZRcyPya2wtzztA8I1mYQIyNVHG6Pyqz2KFKSU4S6rKJ6blKGsmQPCxQcm8ZKYeWnhqQjiusaCLypo1ejhuxLnAPbPned8MrbAT4Y1RhXdLtN1sJqcAFzpnPX/7imtP4VVTUZDjkO/Zh7zPL67KIvq8CpjhZQAwJB2kXZIFiqrLERPTjrzl8ngsMh1MiT0nBo5Zh/ykvZ4jaEiXxEZbr4hBlH6jiTc9BXKggjTF5Kzuu7kSdtQkV6Sgi8AS8R53wVVgTM5rmpXZe5ynpY/LnkfozURl7/u5aWbhARx5kjbJTSbgrvjhZ/juKUYs6Slhh9Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584733; c=relaxed/relaxed;
	bh=KxFe7qyo4eHIzhTxczhq6OF5aBNVD8CbU/vq6HHGwtQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PQx5BbrOYeblkHmghcHYhJeM5O0FaNhW2euHIk+dP6ctw6WngH4obJra6aTpgzcQwl+/uh3ZTRPLnDkbkRfB0xHsM6zriBlLWPKAmwqvJ5O6pWtjaUAsXeLnZmZRCDEvJUAYrPHyptC0aXV1eba1XB8x/zE4Ns08FkncMfgpgpmABOM9sRH7Nul3rGAma6xdnlETBchhif/oxf5TrAApjf/fxkKDHAJ5yD3JSI+f5QZZhHETwfsj4jTLl1BhdKPxz1aPYseqHnUmXFcOFQmnLX4G691HSmAT29vT79DVksWYWFYOikSGRELvE1CZhsv/L37+/38pWJKvERExxO7nzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Tj4y7KZU; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3grwizwykdlaiuqdzsweewbu.secbydknffs-tulbyiji.epbqri.ehw@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Tj4y7KZU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3grwizwykdlaiuqdzsweewbu.secbydknffs-tulbyiji.epbqri.ehw@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdV470cvz3btX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:25:32 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2e2d3d5fb4eso896235a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584731; x=1729189531; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KxFe7qyo4eHIzhTxczhq6OF5aBNVD8CbU/vq6HHGwtQ=;
        b=Tj4y7KZUiKNPTNRnTYp9lvpBhw7M+usTAryF4wW6FHH6jaI9PnKIGRD6SfuK4p6G37
         FXDxfZ26UcSsGYKFv9TKGpeuIDppvkn+DQQFqdH+6mRBNu+yTxkvdqEPlWcbHWs9kRV2
         eiMs1+GJQkYxFv/MdMOKqNe89bW02QDpFjOwZqz9UlTO1XrdQA2MPsjlCL5wCb6zLn4w
         radXbyx94rqZVoudUg94CXd3ms+Jup3lOtd2woumZdIRtl5bcgG+1dFNnJhNEEZahY7D
         FkKm2aUVn7Cvrns7rnoiLsll+vOx8etVoLlpuI3F0Q3YO/TeRcDGe72Z+t22ptaRrwLJ
         HNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584731; x=1729189531;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KxFe7qyo4eHIzhTxczhq6OF5aBNVD8CbU/vq6HHGwtQ=;
        b=ROyn6W85VZIIHiDLdo8CFwGxCbtiuX3LsVtDQRAB+lBrCWOtcGX9oTHYJhtcBX4T66
         BqPClwtPQwXjU7tOR7vATuPw5OOCukJO/MO/eqvdmgoJn8feDGOxa1PZ3N3L8XJY0BGJ
         XejzOh1P1iP4BbcVucPUb5fqW5KCaXK4LJypVT8PYB1NCyJVvejuFPtUDKv1x3mJ4MnM
         TFr2G2RZry1q4QXIyX1Vot715d0bOl0PlMWi16oPXgXextBAUA/i4mT/PbIE0T0s5saF
         +mjMorRYj16IvcuWpMHNYLmXFfL6YYq9ZPz7tt8dnYk8VgxKvGor7tA96ZdzXVblysbT
         rPHg==
X-Forwarded-Encrypted: i=1; AJvYcCXpDRETVm9p0QjH14jb5EX6RoWsF60MM7y1H0MRJezjHpRQPiarkBJbCTx0kxtHkEvJGwALx+SWqz3FN64=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy54whCdtROH7cc3+ORsbAhY0TT1O9XjCI/DV7LjdD2TYO8tbfG
	Cylpb1JJd55GscKiw9w7lsdX9BTXs37DQv930IiFMqOB6uVxW2/KQmlO8OkrcASmwTAkt23BGxE
	zCQ==
X-Google-Smtp-Source: AGHT+IGFsZ8G+8oqHMXYnd6l/b9oSo3/s957bEBlaeuh+YsQIWv/Tzia2RQhXQw4+rIMPn/3epGKWmgCn2Q=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90a:5107:b0:2e2:ca3e:10fe with SMTP id
 98e67ed59e1d1-2e2f0f88a54mr20a91.8.1728584729847; Thu, 10 Oct 2024 11:25:29
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:20 -0700
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
Message-ID: <20241010182427.1434605-19-seanjc@google.com>
Subject: [PATCH v13 18/85] KVM: Drop unused "hva" pointer from __gfn_to_pfn_memslot()
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

Drop @hva from __gfn_to_pfn_memslot() now that all callers pass NULL.

No functional change intended.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/mmu.c                   | 2 +-
 arch/powerpc/kvm/book3s_64_mmu_hv.c    | 2 +-
 arch/powerpc/kvm/book3s_64_mmu_radix.c | 2 +-
 arch/x86/kvm/mmu/mmu.c                 | 6 ++----
 include/linux/kvm_host.h               | 2 +-
 virt/kvm/kvm_main.c                    | 9 +++------
 6 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index a6e62cc9015c..dd221587fcca 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1570,7 +1570,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys=
_addr_t fault_ipa,
 	mmap_read_unlock(current->mm);
=20
 	pfn =3D __gfn_to_pfn_memslot(memslot, gfn, false, NULL,
-				   write_fault, &writable, NULL);
+				   write_fault, &writable);
 	if (pfn =3D=3D KVM_PFN_ERR_HWPOISON) {
 		kvm_send_hwpoison_signal(hva, vma_shift);
 		return 0;
diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_=
64_mmu_hv.c
index 8cd02ca4b1b8..2f1d58984b41 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -614,7 +614,7 @@ int kvmppc_book3s_hv_page_fault(struct kvm_vcpu *vcpu,
 	} else {
 		/* Call KVM generic code to do the slow-path check */
 		pfn =3D __gfn_to_pfn_memslot(memslot, gfn, false, NULL,
-					   writing, &write_ok, NULL);
+					   writing, &write_ok);
 		if (is_error_noslot_pfn(pfn))
 			return -EFAULT;
 		page =3D NULL;
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book=
3s_64_mmu_radix.c
index 26a969e935e3..8304b6f8fe45 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -853,7 +853,7 @@ int kvmppc_book3s_instantiate_page(struct kvm_vcpu *vcp=
u,
=20
 		/* Call KVM generic code to do the slow-path check */
 		pfn =3D __gfn_to_pfn_memslot(memslot, gfn, false, NULL,
-					   writing, upgrade_p, NULL);
+					   writing, upgrade_p);
 		if (is_error_noslot_pfn(pfn))
 			return -EFAULT;
 		page =3D NULL;
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index c67228b46bd5..28f2b842d6ca 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4377,8 +4377,7 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, s=
truct kvm_page_fault *fault
 		return kvm_faultin_pfn_private(vcpu, fault);
=20
 	fault->pfn =3D __gfn_to_pfn_memslot(fault->slot, fault->gfn, false, true,
-					  fault->write, &fault->map_writable,
-					  NULL);
+					  fault->write, &fault->map_writable);
=20
 	/*
 	 * If resolving the page failed because I/O is needed to fault-in the
@@ -4406,8 +4405,7 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, s=
truct kvm_page_fault *fault
 	 * get a page and a fatal signal, i.e. SIGKILL, is pending.
 	 */
 	fault->pfn =3D __gfn_to_pfn_memslot(fault->slot, fault->gfn, true, true,
-					  fault->write, &fault->map_writable,
-					  NULL);
+					  fault->write, &fault->map_writable);
 	return RET_PF_CONTINUE;
 }
=20
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 071a0a1f1c60..cbc7b9c04c14 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1235,7 +1235,7 @@ kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn,=
 bool write_fault,
 kvm_pfn_t gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn=
);
 kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t g=
fn,
 			       bool interruptible, bool no_wait,
-			       bool write_fault, bool *writable, hva_t *hva);
+			       bool write_fault, bool *writable);
=20
 void kvm_release_pfn_clean(kvm_pfn_t pfn);
 void kvm_release_pfn_dirty(kvm_pfn_t pfn);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index dd5839abef6c..10071f31b2ca 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2967,13 +2967,10 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool inter=
ruptible, bool no_wait,
=20
 kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t g=
fn,
 			       bool interruptible, bool no_wait,
-			       bool write_fault, bool *writable, hva_t *hva)
+			       bool write_fault, bool *writable)
 {
 	unsigned long addr =3D __gfn_to_hva_many(slot, gfn, NULL, write_fault);
=20
-	if (hva)
-		*hva =3D addr;
-
 	if (kvm_is_error_hva(addr)) {
 		if (writable)
 			*writable =3D false;
@@ -2996,13 +2993,13 @@ kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gf=
n, bool write_fault,
 		      bool *writable)
 {
 	return __gfn_to_pfn_memslot(gfn_to_memslot(kvm, gfn), gfn, false, false,
-				    write_fault, writable, NULL);
+				    write_fault, writable);
 }
 EXPORT_SYMBOL_GPL(gfn_to_pfn_prot);
=20
 kvm_pfn_t gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn=
)
 {
-	return __gfn_to_pfn_memslot(slot, gfn, false, false, true, NULL, NULL);
+	return __gfn_to_pfn_memslot(slot, gfn, false, false, true, NULL);
 }
 EXPORT_SYMBOL_GPL(gfn_to_pfn_memslot);
=20
--=20
2.47.0.rc1.288.g06298d1525-goog


