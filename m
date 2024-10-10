Return-Path: <linuxppc-dev+bounces-2057-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A2A999076
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:32:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdXH2tHGz3cSg;
	Fri, 11 Oct 2024 05:27:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b49"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584847;
	cv=none; b=JyCKcfNNNvCusR1+mM5T3yEW9Imw82YOyspA4f4ZEvWR2sgjVMEUk3hLIS/Ou2GHnsnAbMxbRrL3wneZoC9OUKD6my7XS99A2CdCEcaSfGfDPcHM6ka8TTu5b+y59AWRp5B+QHlZr7GdiQ+gx2/5SScXyNtaMLDjnwVksLBQTscsqAuwTXP1nz1DyTpqXNeETBdWPcnEoRmq7wNnRO/y3uwspEFDHWIMIoNOfEVopSenfQwl1u5BfViqPqPZeO+LIM5wI7yLPzW/ZNuI3MccUtUnIHW9Svp5Z7Ar91Ymh4wUHGbdVA2K4gbPVY/a0oycowZoSr3C/fTaHoxmoWdcww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584847; c=relaxed/relaxed;
	bh=ojyPU0tzKIRRbswoqL6JjpEgqRgu1FFXpokE5rqa8U0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DHcx+eHb5tUatUhR88CsSrqzBpsNtZisWgDG7Ts57hRZyKiYj4iAqZHq41d63svf51dNtXy4JjdwP4JCmYMVFGY/d3bYGp0BqlmgaI4YWQ/75SPw//uRYdsEfKVQHSYW+EaFJ4b7knK4K+uqXXWMmu15L8qdBDAlpwTqii+jvioQ97x38vTEIHTk8PGgMFX57cmjAxcoLcjsq5iysbLBMwUcQC7vKzO8YdlELzXoo60Mw597FRNmRlOSlfOKjBQiqJRaGVw7nPeXl05L/BZez99K23x0HV8HmzOg4BK+U+EBll3i8Os/BcfkWmeQf3E1J6myHA4uoJ2M9lsoyFE85g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=4kX7Y14b; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3jbwizwykdcutfbokdhpphmf.dpnmjovyqqd-efwmjtut.pambct.psh@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=4kX7Y14b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3jbwizwykdcutfbokdhpphmf.dpnmjovyqqd-efwmjtut.pambct.psh@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdXG4S7Wz3cSN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:27:26 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e1159159528so3623550276.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584844; x=1729189644; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ojyPU0tzKIRRbswoqL6JjpEgqRgu1FFXpokE5rqa8U0=;
        b=4kX7Y14bmhFL4B4Fhs9c+sZDMqJkvjJ9gUCCm20xxnT+aIFnTMAVgaAGsMiy8qyTpu
         izDiswwaO7FBGZ9YuUzcFq7XKPSh/vOXwH/VcmrMOJlFva8weNDLWdBqDAh1KdyjN5ZN
         7WqdC5oIs2MYzaASmB0MERjD0Hhb2QaPKD0yCjYJZ1zAdUY+CgsM7EZXIiOYjZ2Q3Ogx
         eiFOsHGJG07R8hlShkWgUyzpdreFAUWNEmYhoipWw9s4p7ME6ruKTRMfkfRefxqz/WDr
         m09qvT6oW4U+CPzvzUOGyUM79l9X+A+KYg3kBesxnoS+4PDQvk6+mU92AIlRXZoPWn25
         cY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584844; x=1729189644;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ojyPU0tzKIRRbswoqL6JjpEgqRgu1FFXpokE5rqa8U0=;
        b=PHc3lr6/8Lyfmjt3xbLQmdk3i+D2XeI6U+qEfdiUQc3cQ+AkVFnZ1bZlcdTNffHo7v
         D5kb2g0KS3lNYdZ0f6i677+8A/U9fmDsM1CIRIAeO9xfPNbryWBmQrfwHutqcmI+onE2
         2lPiyIOEQ2pMH1FV0ElV8Fg0m85VeQyV84ImpU2+GZ5i07b0Zu3ZVa2OGkQT350z53+T
         8C0bnF2FkILW5fQbZ1cD25etsJeG+MPd5HFJq/zUQHfAKW646gzRq5kwTVzmZW4Qxi3J
         SmYV4XVNve/E485+AE0vl2y6J5FfJ8z83j7KjYYZOYPsvBkZw4kDsVY5se/3sNpwHXtE
         jslg==
X-Forwarded-Encrypted: i=1; AJvYcCUItDR2fIh+0cLKEXmzRTSfmm7QbPww8TTZnRF3SYNl+NyUB1IpERJsGYNpG+UtbCxL6/Kgv8u0TJ4bK+w=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyqSFibcD5TodbS/2D+RiSxSWE7MwsesAFKg7QVnM494+vtAkrI
	FC/pkqi3qceD5wo4N/BIRYLsez5mDzBxa8jGuuJhozKOY0o9oH4mEZIJ6pUiEBhxpDHytTJldGH
	aWA==
X-Google-Smtp-Source: AGHT+IHEyKrdGSoNbMWcRNiKhgC/jPgVf/TjauaPCrq7yqhpXyuJQagleroMC0w40O7lZsOojHLr7EwrZqI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:6805:0:b0:e20:cfc2:a326 with SMTP id
 3f1490d57ef6-e29184333b9mr26276.6.1728584844184; Thu, 10 Oct 2024 11:27:24
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:14 -0700
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
Message-ID: <20241010182427.1434605-73-seanjc@google.com>
Subject: [PATCH v13 72/85] KVM: MIPS: Use kvm_faultin_pfn() to map pfns into
 the guest
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

Convert MIPS to kvm_faultin_pfn()+kvm_release_faultin_page(), which
are new APIs to consolidate arch code and provide consistent behavior
across all KVM architectures.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/mmu.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index 69463ab24d97..d2c3b6b41f18 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -557,6 +557,7 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 	bool writeable;
 	unsigned long prot_bits;
 	unsigned long mmu_seq;
+	struct page *page;
 
 	/* Try the fast path to handle old / clean pages */
 	srcu_idx = srcu_read_lock(&kvm->srcu);
@@ -578,7 +579,7 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 	mmu_seq = kvm->mmu_invalidate_seq;
 	/*
 	 * Ensure the read of mmu_invalidate_seq isn't reordered with PTE reads
-	 * in gfn_to_pfn_prot() (which calls get_user_pages()), so that we don't
+	 * in kvm_faultin_pfn() (which calls get_user_pages()), so that we don't
 	 * risk the page we get a reference to getting unmapped before we have a
 	 * chance to grab the mmu_lock without mmu_invalidate_retry() noticing.
 	 *
@@ -590,7 +591,7 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 	smp_rmb();
 
 	/* Slow path - ask KVM core whether we can access this GPA */
-	pfn = gfn_to_pfn_prot(kvm, gfn, write_fault, &writeable);
+	pfn = kvm_faultin_pfn(vcpu, gfn, write_fault, &writeable, &page);
 	if (is_error_noslot_pfn(pfn)) {
 		err = -EFAULT;
 		goto out;
@@ -602,10 +603,10 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 		/*
 		 * This can happen when mappings are changed asynchronously, but
 		 * also synchronously if a COW is triggered by
-		 * gfn_to_pfn_prot().
+		 * kvm_faultin_pfn().
 		 */
 		spin_unlock(&kvm->mmu_lock);
-		kvm_release_pfn_clean(pfn);
+		kvm_release_page_unused(page);
 		goto retry;
 	}
 
@@ -632,10 +633,7 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 	if (out_buddy)
 		*out_buddy = *ptep_buddy(ptep);
 
-	if (writeable)
-		kvm_set_pfn_dirty(pfn);
-	kvm_release_pfn_clean(pfn);
-
+	kvm_release_faultin_page(kvm, page, false, writeable);
 	spin_unlock(&kvm->mmu_lock);
 out:
 	srcu_read_unlock(&kvm->srcu, srcu_idx);
-- 
2.47.0.rc1.288.g06298d1525-goog


