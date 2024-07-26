Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F07493DCAF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:42:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=cr6FuRfC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW5S234wyz3dXQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:42:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=cr6FuRfC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3wtekzgykdjqg2yb704cc492.0ca96bildd0-12j96ghg.cn9yzg.cf4@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4PR0HCrz3cBH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:55:07 +1000 (AEST)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-721d20a0807so1376541a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038105; x=1722642905; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=M9eYn37tam32k4Zpbs9VqSvLY6wlhZ916YFlgyF6peA=;
        b=cr6FuRfCNjdG0MUf+Q+GvygsBNcOuG55Ew7XSfbyGjPWWJBdboVFuRisfEn/OBAA5w
         rk//4nzU6xb29TFRK/Q0EsOWTBsIU/fnNFgusF9jnV7yeoglQ6TMEWGw+1kRNplZtKN1
         DigmNUR75PqudaEDtNi78ZXwrDbvkz+hb+ejseBu/XdvVqTcY6a+6niZGRlheMcsMYKS
         uiM5IK+UDKZHcSdo8b7f+v1sJK0pUChnNrQx7F+AG7MXs09Sb53zoRnZKA5Bs+DMHz7i
         CLZA7TW/Z7HJw7UFUS7cGrtRliMEsf88Aaz7k+VMBLgQTm9Cq3ShncomCd68WIK+KDB2
         TspQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038105; x=1722642905;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M9eYn37tam32k4Zpbs9VqSvLY6wlhZ916YFlgyF6peA=;
        b=WFzUUpiUegI2O7sghEDNLb/QeMYsAvHMUzv9kvPX+bLttORcQnlmj5vW6qL7162oae
         sqHkp0cJ1LC/ZVrBTc0lqJI8gElTLM1Q7BraqbD3Q7DDMnc4wRy97ZdIAsadQ+7A99ey
         JYEmAmnYRhb+xnWrYg6nqpH3kRKSRabCSWaOR3GDPAl7OnVQWVLh5he1OZwlTHwNMzgt
         TCqOk71hxhIV79GZEV7pAMQCeeHTxtNMIGLMw+bXNcaFCdLzV9GO8/i0ODRaxa1flGZi
         y6xW5uQ4kJsJBkpQpHmOttCv0+NdXaG/eeRMrruVVxjbcr6WrAyWW5x3tAB4s3IKHtTA
         CE3w==
X-Forwarded-Encrypted: i=1; AJvYcCVyQiF0Bm50B/r6vdMwqc0GupRcqRnVSezuak9XSwyQxxX9AzwwOwUQ5r5rlW7NU1hNknwNPh5n7IDpX859oDcKwXue6DFY4TyC4jQSig==
X-Gm-Message-State: AOJu0YyXJT7S0k8l1uhGC6B2b0Ha2M+pnmL5HN5hoAbhB+EbWE413SXg
	5Io8GAqwEBCWl7YumJVY/AzJz+D1KgUKH+yun1zk1kmn6RLcUIiSASTqGujynkj8IN8q5nG+FTL
	nvg==
X-Google-Smtp-Source: AGHT+IG8TH3qPrjAadwsmfbGVL51l5vDfwJrWL4CCM6knLIepOGyFeiwzAiBROJulbOiIHONd5UuXBO9hTI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a02:526:b0:6e3:e0bc:a332 with SMTP id
 41be03b00d2f7-7ac8dbc497emr2439a12.2.1722038105187; Fri, 26 Jul 2024 16:55:05
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:20 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-72-seanjc@google.com>
Subject: [PATCH v12 71/84] KVM: MIPS: Use kvm_faultin_pfn() to map pfns into
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
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Reply-To: Sean Christopherson <seanjc@google.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, loongarch@lists.linux.dev, kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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
2.46.0.rc1.232.g9752f9e123-goog

