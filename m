Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E6293DC8D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:27:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=qfjcI5Cc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW5785cWLz3dXj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:27:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=qfjcI5Cc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com; envelope-from=3ldekzgykdgcxjfsohlttlqj.htrqnszcuuh-ijaqnxyx.teqfgx.twl@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4NZ2Rjhz3dWC
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:54:22 +1000 (AEST)
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-70d19a4137dso1423323b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038061; x=1722642861; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=495sZLd3sCBTMIrtoKFKEohUXAwQ30LA4hbLQQBllaM=;
        b=qfjcI5Cc91AKW7sXuSGAuxaEbOM0VKsdwxcVGtk0irllHzhnOjSHN/lu2JVhvbC3q1
         qwPZkdz9edvF9jDwWNSYtkJl6zhqVXxUAANKnkbADxRrdrNk4/CDgiS9k1laS9vDwBb0
         4sqZQxlmnW3DymU9jka570SQaho0ir+D/WjPgUwKde27IhgHidXc6lPYq/SiiWSq9wcL
         U4Vn4fTxcsrMYcU4UjFVJi0bhcx7UX8Y4QnBW9a7yew3AbSOMoD/rt0o/wS2dtvjDiCI
         YdF9q0fDEqPe03tzlc8I5YcojGmv8NetOr31wUx2qSmT+PmidDCsFSeuPOAauoT+ys4W
         88iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038061; x=1722642861;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=495sZLd3sCBTMIrtoKFKEohUXAwQ30LA4hbLQQBllaM=;
        b=MIx77OdgB4TBR89m9UT8K/Y30+Gk+4eNrz51RdVC+wfOaOiR0XCmeR0G7Qd7Wm2Co2
         Tulnmia5x1V1pRBo+2E8m18+01sYESa09pGBUSps7VbTgJmgCd1QxOyWukasLbfqDZq4
         3nyZFCLxC+r8lbG+zmjzsKLMrwlZQEI2wxJHDwRAxXjFuUIZSTx+EIEPNyx8k3UVkk/R
         JV81XlP+IMn/0p6DemG6c3ZykfS7ciXJ3wXmZNSiNh7d8W0iImM1izCcMKkOjuCFcuYE
         Boc7GLak3qM5l7IX0jCDOr77QSCaME+ZeCqOTCDRc9n0ZOlPlvmAKDFvYvsX867jTeEC
         n1oQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK/4tgoCMqLslBslDpGMMCnb0Fp8uCwO85hjdxrd+IbdaKmLf+RasJI0SAZmAJA/aGEOztmyxMrqMx/v50y08YW9VQSsceHMgHkBnD3A==
X-Gm-Message-State: AOJu0YwD9fSWlAbxxIu8NUzIl+my8k/f8O9uamwMQN4ma3DcA9Xrmh7E
	0GttCsvwYWzVxv/DnaU2ImUja9Uc+Y6Cy5XPl2CKd9kk5Acn9XfGQoEn4qSbZcesLIMT9bM25Lg
	AGw==
X-Google-Smtp-Source: AGHT+IEX18wdLlkp+2aMf2anoWcNTpOtSr1c0ECGrHfjhmBCNZQh1f0vS16HR3FEGEctU7qtPLZbGkdGSSc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:6f1c:b0:70d:138a:bee8 with SMTP id
 d2e1a72fcca58-70ece533146mr8925b3a.0.1722038060383; Fri, 26 Jul 2024 16:54:20
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:59 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-51-seanjc@google.com>
Subject: [PATCH v12 50/84] KVM: VMX: Use __kvm_faultin_page() to get APIC
 access page/pfn
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

Use __kvm_faultin_page() get the APIC access page so that KVM can
precisely release the refcounted page, i.e. to remove yet another user
of kvm_pfn_to_refcounted_page().  While the path isn't handling a guest
page fault, the semantics are effectively the same; KVM just happens to
be mapping the pfn into a VMCS field instead of a secondary MMU.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 30032585f7dc..b109bd282a52 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -6786,8 +6786,10 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *vcpu)
 	struct kvm *kvm = vcpu->kvm;
 	struct kvm_memslots *slots = kvm_memslots(kvm);
 	struct kvm_memory_slot *slot;
+	struct page *refcounted_page;
 	unsigned long mmu_seq;
 	kvm_pfn_t pfn;
+	bool ign;
 
 	/* Defer reload until vmcs01 is the current VMCS. */
 	if (is_guest_mode(vcpu)) {
@@ -6823,7 +6825,7 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *vcpu)
 	 * controls the APIC-access page memslot, and only deletes the memslot
 	 * if APICv is permanently inhibited, i.e. the memslot won't reappear.
 	 */
-	pfn = gfn_to_pfn_memslot(slot, gfn);
+	pfn = __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, &ign, &refcounted_page);
 	if (is_error_noslot_pfn(pfn))
 		return;
 
@@ -6834,10 +6836,13 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *vcpu)
 		vmcs_write64(APIC_ACCESS_ADDR, pfn_to_hpa(pfn));
 
 	/*
-	 * Do not pin apic access page in memory, the MMU notifier
-	 * will call us again if it is migrated or swapped out.
+	 * Do not pin the APIC access page in memory so that it can be freely
+	 * migrated, the MMU notifier will call us again if it is migrated or
+	 * swapped out.  KVM backs the memslot with anonymous memory, the pfn
+	 * should always point at a refcounted page (if the pfn is valid).
 	 */
-	kvm_release_pfn_clean(pfn);
+	if (!WARN_ON_ONCE(!refcounted_page))
+		kvm_release_page_clean(refcounted_page);
 
 	/*
 	 * No need for a manual TLB flush at this point, KVM has already done a
-- 
2.46.0.rc1.232.g9752f9e123-goog

