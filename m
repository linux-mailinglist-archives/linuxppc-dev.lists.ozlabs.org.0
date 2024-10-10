Return-Path: <linuxppc-dev+bounces-2047-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D870599905F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:31:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdWt1Nqnz3cQP;
	Fri, 11 Oct 2024 05:27:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::44a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584826;
	cv=none; b=NONQ8g8LvPoyZTjK6fhawqvIdxwL5hkRnfn/j4XvWZCgwhmr4cL6OFRLRqoKV+WTyXgVnvb/Z0+I4SmYJAk6h0v9LRFd8alMElO83R6IVIRmdYIO2duMkhXj/FPx8/hsyaH2gIRp0EVN9RFTsypO3Q+DuxwCu2e77/7jaAOmuHFvs7q9zqfkYgL4SsBJx6kcp9oFpjCehwcYzWymcOZY4bpGe6kkRvpvWv1wKpkeCaBwq5a7IrB5na+B4uNn9T2YKd0L4fTaG/wBUJjm4QDjkDfdxgeEkhDr2VJHMwDrtwSoOPRsx9sUmFrqeOFSK2+cNh2f7C/iU3IYCLT1ByzqPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584826; c=relaxed/relaxed;
	bh=8JV5lSZeo1By1ou6uwDGqoH8kmaYenoeIxSHz9El/d0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XQlIpEttxcF9EbOpaRVeFnKtm5V262qBhA08oHGQrO5sYZnjXP7ZelBJItB88zDadolrl51xVk60Ikrpg+GHFgHq4V6Sshwa1zs7SPDeq1GJx6WzrhAuQanOoQ/fE3au8MnzEYO2THIJqahpRhm69nCSY/HFZBdsMSeCUvVs+MX4TFR/MrkIh/0HXfmoD905VylZbwCccpmO87qQXr67PcWuXxUqefkP5pcPZMwCSyXLzz7JJC0SZVeqGuPr+sZBmg4SfYJuwgkdSCvf+/jM8NVVSdxbjM8nRfU1OG0oP4LtLryPD4Is+87P2qipPdkTaee5ckNj281+qaV5W9nghA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Zzv5oedh; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com; envelope-from=3dxwizwykdba8uq3zsw44w1u.s421y3ad55s-tub1y898.4f1qr8.47w@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Zzv5oedh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com; envelope-from=3dxwizwykdba8uq3zsw44w1u.s421y3ad55s-tub1y898.4f1qr8.47w@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdWs1z7Kz3cPW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:27:05 +1100 (AEDT)
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-71e1e989aa2so1656076b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584824; x=1729189624; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=8JV5lSZeo1By1ou6uwDGqoH8kmaYenoeIxSHz9El/d0=;
        b=Zzv5oedhmqCAH0N0X+SPBZeMFdOhZ8hBRavsmeEBoxf+iNkIhKbPnKTJvkeGSd8Ng2
         GEc5QgEW65HSZC+eJCAS5xA+6S7gsH2JO6SRj/8nsPpCqEZKmawlMxSBNXRNyrmyDudd
         +oAAe+3sGUFw0rniuccpe2By6ixH1ZDSS2t1G1NsWhGHlAT7e5gDfoiXEMtInuRb8+Vh
         D1wdGRVctiPO9c+uC+5FftFRV3hfMu1voCxO2nF7ijHZrmeYBj2ay2mvWo9XlMohsd3l
         fdsa+QhMmVEee8bquDSCEVoeiC/7URpNBYw2t1mSg43sHQHpnZ9h973y8IQomck+ZIIN
         xgKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584824; x=1729189624;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8JV5lSZeo1By1ou6uwDGqoH8kmaYenoeIxSHz9El/d0=;
        b=DKXxFSZYEzryVIQ4xY/s9uBXPRp6N3BsJmQ/0m9hZZXE8Rboyz2wDMx4d1HAb5VKQI
         tTLCAOqr+/lxPjlgJYTzpZYcB7Sb/HITmEBgtrFXc1d7zaFiPuIJIPpy6skr7duSGIfB
         B2xUWeC3Io/qMtMxeNJ5Cr59EowzA8xAv1XGNe9b8lCixTVd9kfOlMnFsN4WxO232dLZ
         TIm9wKeouE4MzVxBjm/Hq4+FuuCIzmBzlduLkWk69yelzLS689B2UpPu6LEFnv7uEUlK
         7sCYxzZpUa0FXhU6dFy13mgWgDeVfaZtBPQIUivGlNLlJTNCv3Ka19sboLhh41ym7j4d
         uWBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJSbuk8hodgE50m2MDM0W+mVgrDHTWH+DYcFerw8/hnEGcoOB1iV/YI3VHGURkhqXuSmxh7UlLOsmQwlA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxZ7vCLmpT+ZJvgad7B8dwQ7nYKZQtlFGjF1YklbKh7Ktu+rqj2
	WR1eS6OU2bac6SnwmMQXKEzj6Ds5PLQyKYx9nN2BQJDhsXQrXSI4uINV/w+iS/anFfdvnKisstv
	dOg==
X-Google-Smtp-Source: AGHT+IFev0i08WnhWXOHYVCiDa8hDSrBgilu3q+XI+BXP7ns5qqyHbYBrSKz+aJVjoCmfpAuiTEXvCWN4KQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:2daa:b0:71e:401:6580 with SMTP id
 d2e1a72fcca58-71e1dbf2587mr27202b3a.6.1728584823552; Thu, 10 Oct 2024
 11:27:03 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:04 -0700
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
Message-ID: <20241010182427.1434605-63-seanjc@google.com>
Subject: [PATCH v13 62/85] KVM: PPC: Drop unused @kvm_ro param from kvmppc_book3s_instantiate_page()
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
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Drop @kvm_ro from kvmppc_book3s_instantiate_page() as it is now only
written, and never read.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/include/asm/kvm_book3s.h  | 2 +-
 arch/powerpc/kvm/book3s_64_mmu_radix.c | 6 ++----
 arch/powerpc/kvm/book3s_hv_nested.c    | 4 +---
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
index 10618622d7ef..3d289dbe3982 100644
--- a/arch/powerpc/include/asm/kvm_book3s.h
+++ b/arch/powerpc/include/asm/kvm_book3s.h
@@ -203,7 +203,7 @@ extern bool kvmppc_hv_handle_set_rc(struct kvm *kvm, bool nested,
 extern int kvmppc_book3s_instantiate_page(struct kvm_vcpu *vcpu,
 				unsigned long gpa,
 				struct kvm_memory_slot *memslot,
-				bool writing, bool kvm_ro,
+				bool writing,
 				pte_t *inserted_pte, unsigned int *levelp);
 extern int kvmppc_init_vm_radix(struct kvm *kvm);
 extern void kvmppc_free_radix(struct kvm *kvm);
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 14891d0a3b73..b3e6e73d6a08 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -821,7 +821,7 @@ bool kvmppc_hv_handle_set_rc(struct kvm *kvm, bool nested, bool writing,
 int kvmppc_book3s_instantiate_page(struct kvm_vcpu *vcpu,
 				   unsigned long gpa,
 				   struct kvm_memory_slot *memslot,
-				   bool writing, bool kvm_ro,
+				   bool writing,
 				   pte_t *inserted_pte, unsigned int *levelp)
 {
 	struct kvm *kvm = vcpu->kvm;
@@ -931,7 +931,6 @@ int kvmppc_book3s_radix_page_fault(struct kvm_vcpu *vcpu,
 	struct kvm_memory_slot *memslot;
 	long ret;
 	bool writing = !!(dsisr & DSISR_ISSTORE);
-	bool kvm_ro = false;
 
 	/* Check for unusual errors */
 	if (dsisr & DSISR_UNSUPP_MMU) {
@@ -984,7 +983,6 @@ int kvmppc_book3s_radix_page_fault(struct kvm_vcpu *vcpu,
 					ea, DSISR_ISSTORE | DSISR_PROTFAULT);
 			return RESUME_GUEST;
 		}
-		kvm_ro = true;
 	}
 
 	/* Failed to set the reference/change bits */
@@ -1002,7 +1000,7 @@ int kvmppc_book3s_radix_page_fault(struct kvm_vcpu *vcpu,
 
 	/* Try to insert a pte */
 	ret = kvmppc_book3s_instantiate_page(vcpu, gpa, memslot, writing,
-					     kvm_ro, NULL, NULL);
+					     NULL, NULL);
 
 	if (ret == 0 || ret == -EAGAIN)
 		ret = RESUME_GUEST;
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 05f5220960c6..771173509617 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -1527,7 +1527,6 @@ static long int __kvmhv_nested_page_fault(struct kvm_vcpu *vcpu,
 	unsigned long n_gpa, gpa, gfn, perm = 0UL;
 	unsigned int shift, l1_shift, level;
 	bool writing = !!(dsisr & DSISR_ISSTORE);
-	bool kvm_ro = false;
 	long int ret;
 
 	if (!gp->l1_gr_to_hr) {
@@ -1607,7 +1606,6 @@ static long int __kvmhv_nested_page_fault(struct kvm_vcpu *vcpu,
 					ea, DSISR_ISSTORE | DSISR_PROTFAULT);
 			return RESUME_GUEST;
 		}
-		kvm_ro = true;
 	}
 
 	/* 2. Find the host pte for this L1 guest real address */
@@ -1629,7 +1627,7 @@ static long int __kvmhv_nested_page_fault(struct kvm_vcpu *vcpu,
 	if (!pte_present(pte) || (writing && !(pte_val(pte) & _PAGE_WRITE))) {
 		/* No suitable pte found -> try to insert a mapping */
 		ret = kvmppc_book3s_instantiate_page(vcpu, gpa, memslot,
-					writing, kvm_ro, &pte, &level);
+					writing, &pte, &level);
 		if (ret == -EAGAIN)
 			return RESUME_GUEST;
 		else if (ret)
-- 
2.47.0.rc1.288.g06298d1525-goog


