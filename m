Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C6293DC48
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:18:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=K2r1ft2l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW4wp5mSfz3dWG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:18:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=K2r1ft2l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com; envelope-from=3etekzgykdew6so1xqu22uzs.q20zw18b33q-rs9zw676.2dzop6.25u@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4N34LgPz3dWW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:53:55 +1000 (AEST)
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-70d1d51f3e9so1504842b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038034; x=1722642834; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=WZrNaP2gtmwMUuypG9xN5YPW8gmxxvZG3Q4zEjuRFyk=;
        b=K2r1ft2loMpevyW7QYzqJBX1ZFqkiWtmRQQDPzj78KY0Dp5bNu0dkyof/yIwYETyzv
         N9UebdsujwkHOxl16qez23etBSQEF0r+OhdF4UV/K/juk8S34W/GHhjvboZHt9eslzTv
         LK4XBjkUf93uZPg5rkuukU+UwhdCFxJW08DAZXINIkCWg7L/ATh4+XCQTPlqbRKUi8c8
         Yaprm4h6Lm6B5PZ3DA+LxDGeXcHc2kp6ZyJ1sCejLC25trIhpZZ0jggLhiJCdCWIjbXO
         OxJUhFTUqGxSuLXaTz4IqK7uOF0Up8hFKHLj5MS4Oh4eq8V78ZGf5Pj8PsyMAsLBU+2h
         S/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038034; x=1722642834;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WZrNaP2gtmwMUuypG9xN5YPW8gmxxvZG3Q4zEjuRFyk=;
        b=rQEhw8jLb68VMmTFEriyDaUJPLGAiaI37DxwlHJP60Qtf7YkcTLuPIxWowMVlr57ug
         IPOZiv2ZpDDK/cb9S28jId/nuJl7ukS+Q2fztohvaxQRGEkcBplCGizylkHRcDXe8z3n
         BCwh2HLQZ3qYDIuKvxIsFn9FZY0b0/GerokbZgtXd0wpbgsk6zc+xPhymcn+d+d7mpYv
         SdVwxDW3g4fXRwxnDtNGd29NhCIWQ30acpquUCeobqEiHbCZBY4DVwyCkKF4YQjhoSl+
         /XTKVKKeTjuAn20VQ5fT9vGnStPZvfZuQnOs4obl+Yudgb3pQ5RFZ25EvmhfwHx1Mjd3
         XjLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLFHnvc22jhELba+z/+nddxSLAP0jB+SUpYcR4ELoX2xLmYfSvjsGeXAEo7oIfI5KfrSvQ/hd2p/FKNMSMJfocj9xwoFAWdlhZnQSugA==
X-Gm-Message-State: AOJu0YwIiO4gO/2QuGLnULJU007ExL9K4YQ1G+7g2IYlBH7/NaHrgrhd
	HBII0YD16BGWUtRMeG6WfhdyYIY32t8MxtRE3P1tBW2lpNXOZGDZ8PRQrTuo1i+19rQdkg+IrDJ
	Tng==
X-Google-Smtp-Source: AGHT+IGBlhv2aegJ385ep1cUBQA5c+rLA7WdLDI/xGSka7RxNxI5KP3IWpNdT5/lkHtS9+xMECoFkdebDOk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:1829:b0:70d:1bf2:2878 with SMTP id
 d2e1a72fcca58-70ecee0a0ebmr24898b3a.5.1722038033787; Fri, 26 Jul 2024
 16:53:53 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:46 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-38-seanjc@google.com>
Subject: [PATCH v12 37/84] KVM: x86/mmu: Add "mmu" prefix fault-in helpers to
 free up generic names
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

Prefix x86's faultin_pfn helpers with "mmu" so that the mmu-less names can
be used by common KVM for similar APIs.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c          | 19 ++++++++++---------
 arch/x86/kvm/mmu/mmu_internal.h |  2 +-
 arch/x86/kvm/mmu/paging_tmpl.h  |  2 +-
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index a201b56728ae..4d30920f653d 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4301,8 +4301,8 @@ static u8 kvm_max_private_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
 	return req_max_level;
 }
 
-static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
-				   struct kvm_page_fault *fault)
+static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
+				       struct kvm_page_fault *fault)
 {
 	int max_order, r;
 
@@ -4325,10 +4325,11 @@ static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
 	return RET_PF_CONTINUE;
 }
 
-static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
+static int __kvm_mmu_faultin_pfn(struct kvm_vcpu *vcpu,
+				 struct kvm_page_fault *fault)
 {
 	if (fault->is_private)
-		return kvm_faultin_pfn_private(vcpu, fault);
+		return kvm_mmu_faultin_pfn_private(vcpu, fault);
 
 	fault->pfn = __gfn_to_pfn_memslot(fault->slot, fault->gfn, false, true,
 					  fault->write, &fault->map_writable);
@@ -4363,8 +4364,8 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 	return RET_PF_CONTINUE;
 }
 
-static int kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault,
-			   unsigned int access)
+static int kvm_mmu_faultin_pfn(struct kvm_vcpu *vcpu,
+			       struct kvm_page_fault *fault, unsigned int access)
 {
 	struct kvm_memory_slot *slot = fault->slot;
 	int ret;
@@ -4447,7 +4448,7 @@ static int kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault,
 	if (mmu_invalidate_retry_gfn_unsafe(vcpu->kvm, fault->mmu_seq, fault->gfn))
 		return RET_PF_RETRY;
 
-	ret = __kvm_faultin_pfn(vcpu, fault);
+	ret = __kvm_mmu_faultin_pfn(vcpu, fault);
 	if (ret != RET_PF_CONTINUE)
 		return ret;
 
@@ -4524,7 +4525,7 @@ static int direct_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 	if (r)
 		return r;
 
-	r = kvm_faultin_pfn(vcpu, fault, ACC_ALL);
+	r = kvm_mmu_faultin_pfn(vcpu, fault, ACC_ALL);
 	if (r != RET_PF_CONTINUE)
 		return r;
 
@@ -4617,7 +4618,7 @@ static int kvm_tdp_mmu_page_fault(struct kvm_vcpu *vcpu,
 	if (r)
 		return r;
 
-	r = kvm_faultin_pfn(vcpu, fault, ACC_ALL);
+	r = kvm_mmu_faultin_pfn(vcpu, fault, ACC_ALL);
 	if (r != RET_PF_CONTINUE)
 		return r;
 
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index f67396c435df..a5113347bb12 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -235,7 +235,7 @@ struct kvm_page_fault {
 	/* The memslot containing gfn. May be NULL. */
 	struct kvm_memory_slot *slot;
 
-	/* Outputs of kvm_faultin_pfn.  */
+	/* Outputs of kvm_mmu_faultin_pfn().  */
 	unsigned long mmu_seq;
 	kvm_pfn_t pfn;
 	bool map_writable;
diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
index bc801d454f41..b02d0abfca68 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -811,7 +811,7 @@ static int FNAME(page_fault)(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 	if (r)
 		return r;
 
-	r = kvm_faultin_pfn(vcpu, fault, walker.pte_access);
+	r = kvm_mmu_faultin_pfn(vcpu, fault, walker.pte_access);
 	if (r != RET_PF_CONTINUE)
 		return r;
 
-- 
2.46.0.rc1.232.g9752f9e123-goog

