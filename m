Return-Path: <linuxppc-dev+bounces-1986-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6A7998FDB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:25:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdTM0Wwxz3bjs;
	Fri, 11 Oct 2024 05:24:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::549"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584694;
	cv=none; b=FOM41sTzql/SXFzh4ZV4gpyWr8TldBrUr8zD9Llu9OlqJXwglFGfPlyTCZ3DIBwIvu6FdM6Uj2I4CkpeVLWm9fGHYjgi2J9BYxjvjhcb102b+hLl4ovM2n1sU2U1j1pdYTUK0TJ9zKIFlAtH+KE/8Kbl9z/oHlmnbQYZ3o0t9nLO8GkyVpH9rBKPTsgWFZrtXcXDe66Ss+wxfNd8IXJii5L7NTGomj6qxUJYIxIXIz8826n/aZ/AKWgkhYipwDS5aoH3mN38BORnZntR77fbmowJBB2utpD3jhUsFh4h+heHOSmvUT5WmU9r5OKL7eQtZOP3Rl1szNTjiXzzEoWSMA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584694; c=relaxed/relaxed;
	bh=Om/x5O1cFoCu45xFQlZl7muX4OGvvwFhFfu/OqGssvQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SrMpz2VBwyI4OkAOuqdWy78/hEhWeRllzv0BBusAMLsda53mIi8YL5tpfyE+K5+p3Fdpz+4/sErueEJwLwgAtaLKM1hyNwoguHEtpldsnBqjXbetkYu+23EtcMKh8yLbA6pMveDW/JW4QAsgNyRHVFHwQb5/Ohj7CguDeLpV8bXE/4iDkxPEe4V3EyUbj3ZF5uYrVmOTsWD4yKDJpQ36CQdVK2Gw/5wjGTD3pIh2R+9Sjf2Yz2Rd4MM0litvtjwsh/x2n/L8W3rPCD7MwSB4N+XU0VigtBhUXfj5kJxvr+OekfStvkPSe6nH3dDSh8dvoIeCVnSOGKHhBEzA412oAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=zg7Z7e62; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=38rsizwykdig4qmzvos00sxq.o0yxuz6911o-pq7xu454.0bxmn4.03s@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=zg7Z7e62;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=38rsizwykdig4qmzvos00sxq.o0yxuz6911o-pq7xu454.0bxmn4.03s@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdTL12Xsz2yNc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:24:54 +1100 (AEDT)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-7e6cc094c2fso1887365a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584691; x=1729189491; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Om/x5O1cFoCu45xFQlZl7muX4OGvvwFhFfu/OqGssvQ=;
        b=zg7Z7e62xGVFtHprGUc7fjLQQo3zj9QM/AXTEPhKgkIq/YwDU65srKEdggQWhDsbIr
         SIEgB3rRWW+V6xZdQxm9C9ObwR5IHe7wiGfo8mA4ATC/0ixRoYyiuVzeydwUA+vUYbIu
         7PUocju903LY+Y6PKDKj2b1/QmvealpHuV/oK463CHOB/ntGMD8d8qZoA2ph9ZbQHuEz
         iJYRt3nBDm+JNuG29m1mQEIcyyQxuZ58qmpscBmgXoTk8PE24WJhowTaVhcUuyF7wT8l
         mGdRuvopFMzo8qNwM460+ONKlPWqLx/o3lmQFYMKs9832GQPdYKUhw1AUgrp7dCYiRwr
         kgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584691; x=1729189491;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Om/x5O1cFoCu45xFQlZl7muX4OGvvwFhFfu/OqGssvQ=;
        b=Cau4ON1X45AodTJpnQ5bKxseROuJsS5Qqu9pwTH8how1fRR6lkiWqpRGy0QND0Eemh
         wzfOvfRGUOlNoAmtTred3L4Ju56F9y6C9JrsWqKyCeH4RsH2kLKxHnrexR0sMXyDApIi
         GJsxMNhSbYNLxg1g48+R9LjqyXNpQCaxSWQM3UNRV0y4nCZmsVT4QH7HRdiqJ1pMgMd1
         HbuG8LsmWYbUPe5SX213samMk/hsC7Q74F5HPQNqB4nhBNAatTT/kzHOWupvtuG17sK/
         vH9vPjhHtO8E+oz+v2pyLPkG2dYzpk0HAhjbHlPjv2roOrwmsqVd7thsB9aGc2eUOA3p
         iglQ==
X-Forwarded-Encrypted: i=1; AJvYcCWucSweiJpx1AI4JHDA4ojgKuxeH/LVCuTi4Qyz9Oatbf6y6V68A7lfPGU2NSmsN8HQAnwnv9+1Eeu56PA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyoQaW7BbJB702NM7ZPQZPLAoFQa4Fd4AFtmWbgYqvPxWLBn0to
	OVMDHOFmoKEyGWo3n3UAN2t3e+blXS7ai1D1sfqt73RL+Qc1WmQavTedoB/awp6ENZMN3e4BehE
	FPw==
X-Google-Smtp-Source: AGHT+IG89v4lIFRhnNqxe9hFvIIxqDvldHGwH//6ib2L4odxYyk8SJA2JGOjXIHuxBeh8ylp7HgA6abaBbM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90a:eac4:b0:2e2:8f4d:457 with SMTP id
 98e67ed59e1d1-2e2c80b5015mr7266a91.2.1728584689990; Thu, 10 Oct 2024 11:24:49
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:03 -0700
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
Message-ID: <20241010182427.1434605-2-seanjc@google.com>
Subject: [PATCH v13 01/85] KVM: Drop KVM_ERR_PTR_BAD_PAGE and instead return
 NULL to indicate an error
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

Remove KVM_ERR_PTR_BAD_PAGE and instead return NULL, as "bad page" is just
a leftover bit of weirdness from days of old when KVM stuffed a "bad" page
into the guest instead of actually handling missing pages.  See commit
cea7bb21280e ("KVM: MMU: Make gfn_to_page() always safe").

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/book3s_pr.c          |  2 +-
 arch/powerpc/kvm/book3s_xive_native.c |  2 +-
 arch/s390/kvm/vsie.c                  |  2 +-
 arch/x86/kvm/lapic.c                  |  2 +-
 include/linux/kvm_host.h              |  7 -------
 virt/kvm/kvm_main.c                   | 15 ++++++---------
 6 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index 7b8ae509328f..d7721297b9b6 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -645,7 +645,7 @@ static void kvmppc_patch_dcbz(struct kvm_vcpu *vcpu, st=
ruct kvmppc_pte *pte)
 	int i;
=20
 	hpage =3D gfn_to_page(vcpu->kvm, pte->raddr >> PAGE_SHIFT);
-	if (is_error_page(hpage))
+	if (!hpage)
 		return;
=20
 	hpage_offset =3D pte->raddr & ~PAGE_MASK;
diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/book3=
s_xive_native.c
index 6e2ebbd8aaac..d9bf1bc3ff61 100644
--- a/arch/powerpc/kvm/book3s_xive_native.c
+++ b/arch/powerpc/kvm/book3s_xive_native.c
@@ -654,7 +654,7 @@ static int kvmppc_xive_native_set_queue_config(struct k=
vmppc_xive *xive,
 	}
=20
 	page =3D gfn_to_page(kvm, gfn);
-	if (is_error_page(page)) {
+	if (!page) {
 		srcu_read_unlock(&kvm->srcu, srcu_idx);
 		pr_err("Couldn't get queue page %llx!\n", kvm_eq.qaddr);
 		return -EINVAL;
diff --git a/arch/s390/kvm/vsie.c b/arch/s390/kvm/vsie.c
index 89cafea4c41f..763a070f5955 100644
--- a/arch/s390/kvm/vsie.c
+++ b/arch/s390/kvm/vsie.c
@@ -661,7 +661,7 @@ static int pin_guest_page(struct kvm *kvm, gpa_t gpa, h=
pa_t *hpa)
 	struct page *page;
=20
 	page =3D gfn_to_page(kvm, gpa_to_gfn(gpa));
-	if (is_error_page(page))
+	if (!page)
 		return -EINVAL;
 	*hpa =3D (hpa_t)page_to_phys(page) + (gpa & ~PAGE_MASK);
 	return 0;
diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index 2098dc689088..20526e4d6c62 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -2664,7 +2664,7 @@ int kvm_alloc_apic_access_page(struct kvm *kvm)
 	}
=20
 	page =3D gfn_to_page(kvm, APIC_DEFAULT_PHYS_BASE >> PAGE_SHIFT);
-	if (is_error_page(page)) {
+	if (!page) {
 		ret =3D -EFAULT;
 		goto out;
 	}
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index db567d26f7b9..ee186a1fbaad 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -153,13 +153,6 @@ static inline bool kvm_is_error_gpa(gpa_t gpa)
 	return gpa =3D=3D INVALID_GPA;
 }
=20
-#define KVM_ERR_PTR_BAD_PAGE	(ERR_PTR(-ENOENT))
-
-static inline bool is_error_page(struct page *page)
-{
-	return IS_ERR(page);
-}
-
 #define KVM_REQUEST_MASK           GENMASK(7,0)
 #define KVM_REQUEST_NO_WAKEUP      BIT(8)
 #define KVM_REQUEST_WAIT           BIT(9)
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 05cbb2548d99..4b659a649dfa 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3078,19 +3078,14 @@ EXPORT_SYMBOL_GPL(gfn_to_page_many_atomic);
  */
 struct page *gfn_to_page(struct kvm *kvm, gfn_t gfn)
 {
-	struct page *page;
 	kvm_pfn_t pfn;
=20
 	pfn =3D gfn_to_pfn(kvm, gfn);
=20
 	if (is_error_noslot_pfn(pfn))
-		return KVM_ERR_PTR_BAD_PAGE;
+		return NULL;
=20
-	page =3D kvm_pfn_to_refcounted_page(pfn);
-	if (!page)
-		return KVM_ERR_PTR_BAD_PAGE;
-
-	return page;
+	return kvm_pfn_to_refcounted_page(pfn);
 }
 EXPORT_SYMBOL_GPL(gfn_to_page);
=20
@@ -3184,7 +3179,8 @@ static void kvm_set_page_accessed(struct page *page)
=20
 void kvm_release_page_clean(struct page *page)
 {
-	WARN_ON(is_error_page(page));
+	if (WARN_ON(!page))
+		return;
=20
 	kvm_set_page_accessed(page);
 	put_page(page);
@@ -3208,7 +3204,8 @@ EXPORT_SYMBOL_GPL(kvm_release_pfn_clean);
=20
 void kvm_release_page_dirty(struct page *page)
 {
-	WARN_ON(is_error_page(page));
+	if (WARN_ON(!page))
+		return;
=20
 	kvm_set_page_dirty(page);
 	kvm_release_page_clean(page);
--=20
2.47.0.rc1.288.g06298d1525-goog


