Return-Path: <linuxppc-dev+bounces-2037-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 827A899904B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:30:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdWV0f2jz3cMD;
	Fri, 11 Oct 2024 05:26:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1149"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584806;
	cv=none; b=AIYokqZ/WNcDI38nGVL/+spJrdomTN2pFqQdetuEa2lv2RCT87epM3KdtCfphIuVZpsY784cVRxJ3ZMhmT+qdtJKDRt8ABY3nJmEvoUjGTOp2dRVRvumPSAcX6qbhD2ow6+WSTtr94as+5rjksRRw08HDF9BEWF31x5DYaT+TpTRtzpyUHeeiXmoKwBxLN9clZfqMRpMe6/vv1WSvdNGCXRzYCRjd1KIwsroAW0CWTP495VQM19YDXdtvLzJY6+hLL0o7ToGPmVK+RKnlG+nZl4kNZhjDUwX1NQaruoPKdsJfUnHKaAmjBVoiuuqhAmDQqm++qtLpuzxDMmRqSvp2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584806; c=relaxed/relaxed;
	bh=/fC7L3Fchvvuu9GyGKk9VEzuiyLOIeBtO2SWEaXDNWE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IhgcCDYrgiuyDJ3Tpt4nVVdWPe+0sdziq8JqbJ1lm06vXM/N0d4Nn+Jy8YT+Xt+pkwfS8IDUeC2iW2eNC9ThcXaw0sghqGLk1XSuq+0FYQARQyyScr5PneVWQ2iQAnL58svta0/VSA8c8ZQ7mBCC3iLboxDgu337i6RnjXZWB8DtBFCNXRj1gzGHuvw3oovOGexyq9E/0P4UOe7+JVvimpCmEX+DY42ot1Zea8qCdw0zBrF7qDxKQCIMc7h9oaOyx0ZR7b4yGi4eXExmun9JMrTbTU0LdVPleav/S8UYWZ2hw46Wo5o47GpmDx10S2Ins2lUjTrkrqniIb4U7NDGGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ZVPcNttl; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3yxwizwykdpougcpleiqqing.eqonkpwzrre-fgxnkuvu.q1ncdu.qti@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ZVPcNttl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3yxwizwykdpougcpleiqqing.eqonkpwzrre-fgxnkuvu.q1ncdu.qti@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdWT284Pz3cMC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:26:45 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e29b4f8837so18952247b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584803; x=1729189603; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=/fC7L3Fchvvuu9GyGKk9VEzuiyLOIeBtO2SWEaXDNWE=;
        b=ZVPcNttlQqNFh8sod9yRa5DyXZkwSb+AG00xk2zMrjkufKv+nHmysj40/mhLsS2PEI
         to13KUbXxOYif9oNcZ+9DdLgkAQRNuCs6T5Wo8OQHYdYcrp6DAgbl0XaXiTuqoB5TYg8
         uYjhJiPqnQ3Qs64X57Ng7NbhlkWOdEP9HgSKDml5B4Ef+5bn6gEjNRMqlvq77gWRUmTM
         1O8vZlp3qe+5lU68lo7yqHmNCJfP5fyiSHmsX9CeCt/9WCd7KRIRISkdKy/y5PWSoVNw
         2iaiJu6ffso/uSHMtWxD3+MVkY0Siiw5Gs9DKYGKuqCKFCa1BoYtV6kUu21NbNUyEkwX
         dpMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584803; x=1729189603;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/fC7L3Fchvvuu9GyGKk9VEzuiyLOIeBtO2SWEaXDNWE=;
        b=PCi6w+nPQeO/P7+NfRxTbSetohugVWHXYe0e4CcRgRAK37y4euS/beSTXE4Lr326K5
         oQHdS/Z2VWrNjTjHn1jWRq8UnVQQfSWueRzSsJiT91IBzNwCoFmYCljMY2VmJ2bYadhR
         /yFFzPCEgcI0lrOHjK7r1z/VYjThuJMcc6No9UEmPKB4FhgAswE7m8cBgUatak4Limh/
         PkX8GB9UrmaSvSs9hqRpWIg0NlgL7zzctFDOjybDYa5Tr6gZFhhASxAHmzM8UYu5+k78
         1YdfooApJTBRpX1rPevvSWwSQ8E4/CSzwLCLkJ88p1OCZXG5uKk5s2szWwtMs7LZKpdr
         QdIw==
X-Forwarded-Encrypted: i=1; AJvYcCVP46p1yRNs9DNgBbGmGz0Hkz5PkGVjlvL8q5GKnsMA71YbUr1194QgAK2QK4MgJcCN0Lxg+HhzfGay1Gc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxsZ05ErQzTJ5Ef+hLH4lm1ejgQtB1rVvNYKYQtrNX/mJVkprRf
	XTxHUqgc0Sn55YP+YcM1eBZ+MeKt7IdWJQXRvXaCb7TmfT6YScYcqPaE4KMEt3f+TiRW48wFmKd
	wLw==
X-Google-Smtp-Source: AGHT+IF0bQSeBV+k7XDKFBXYzNvC7N99ueMTlOEEH5KNk6JZHzu/00W1ndtLnT51eyBFoV94Bmz3yNyB+P4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:dd1:b0:6db:e464:addc with SMTP id
 00721157ae682-6e344ce9308mr1337b3.4.1728584803335; Thu, 10 Oct 2024 11:26:43
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:54 -0700
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
Message-ID: <20241010182427.1434605-53-seanjc@google.com>
Subject: [PATCH v13 52/85] KVM: PPC: e500: Mark "struct page" dirty in kvmppc_e500_shadow_map()
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

Mark the underlying page as dirty in kvmppc_e500_ref_setup()'s sole
caller, kvmppc_e500_shadow_map(), which will allow converting e500 to
__kvm_faultin_pfn() + kvm_release_faultin_page() without having to do
a weird dance between ref_setup() and shadow_map().

Opportunistically drop the redundant kvm_set_pfn_accessed(), as
shadow_map() puts the page via kvm_release_pfn_clean().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/e500_mmu_host.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index c664fdec75b1..5c2adfd19e12 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -242,7 +242,7 @@ static inline int tlbe_is_writable(struct kvm_book3e_206_tlb_entry *tlbe)
 	return tlbe->mas7_3 & (MAS3_SW|MAS3_UW);
 }
 
-static inline void kvmppc_e500_ref_setup(struct tlbe_ref *ref,
+static inline bool kvmppc_e500_ref_setup(struct tlbe_ref *ref,
 					 struct kvm_book3e_206_tlb_entry *gtlbe,
 					 kvm_pfn_t pfn, unsigned int wimg)
 {
@@ -252,11 +252,7 @@ static inline void kvmppc_e500_ref_setup(struct tlbe_ref *ref,
 	/* Use guest supplied MAS2_G and MAS2_E */
 	ref->flags |= (gtlbe->mas2 & MAS2_ATTRIB_MASK) | wimg;
 
-	/* Mark the page accessed */
-	kvm_set_pfn_accessed(pfn);
-
-	if (tlbe_is_writable(gtlbe))
-		kvm_set_pfn_dirty(pfn);
+	return tlbe_is_writable(gtlbe);
 }
 
 static inline void kvmppc_e500_ref_release(struct tlbe_ref *ref)
@@ -337,6 +333,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 	unsigned int wimg = 0;
 	pgd_t *pgdir;
 	unsigned long flags;
+	bool writable = false;
 
 	/* used to check for invalidations in progress */
 	mmu_seq = kvm->mmu_invalidate_seq;
@@ -490,7 +487,9 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 			goto out;
 		}
 	}
-	kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg);
+	writable = kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg);
+	if (writable)
+		kvm_set_pfn_dirty(pfn);
 
 	kvmppc_e500_setup_stlbe(&vcpu_e500->vcpu, gtlbe, tsize,
 				ref, gvaddr, stlbe);
-- 
2.47.0.rc1.288.g06298d1525-goog


