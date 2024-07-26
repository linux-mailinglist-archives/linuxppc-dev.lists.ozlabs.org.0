Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2266193DBAB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:04:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=KmJ2IaeN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW4bz0NYqz3fpn
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:04:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=KmJ2IaeN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=35takzgykdcaoa6jf8ckkcha.8kihejqtll8-9arheopo.kvh67o.knc@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4MC6JNYz3cQP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:53:11 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-668e964ffd9so6346117b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037990; x=1722642790; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=0OUoj11Bw7qJz7X/aUJltZsNV6l4pB1orjUswDi1Y5Y=;
        b=KmJ2IaeN1cdnjMQt/Jaj2mr6mYBYp9ODk6YERpLyBb7gGuS6+Blu6jf3i+Tg8x828N
         gVL09k5lAITWhEmw7alSIB391MJ5CPM6oduKMqQx63DffPBPla4XQEOWsqkrYjvyS80c
         ozSTkl/BqI+w5tSCcAJeMbVr5YIYtmcBiJ3GaTg29tcTQ+S56ZMveMzCWKGsavnTM7SL
         BRN+EAeSz0q0mcvUE8RExcC/I6kWJENRcaKArVIaKt6TMRgXD1uXQ8talGGCOswZEwN7
         ScCJn/JhmYoazI4v0HU6kz7HFXo8Br+sfCB9C+DXRAYh2Ipebas7nwCQ0NUw9AWVLQZU
         +ATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037990; x=1722642790;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0OUoj11Bw7qJz7X/aUJltZsNV6l4pB1orjUswDi1Y5Y=;
        b=JBGVE7LlQQyHGXIPNI0yugUsaE1Hxie+pmMQpTHjCrArH28RbejAPpkKLLfREd1/8R
         Cr0X9tB03jDpvI7nU16CkaGbHk4IArU1uxG3XRl9glCNDG4MfcmCpvvVcEsmBmDfqmAI
         m68UM98qeShneuclBjbqSDmP3elFBEeKflR+1jO3dajewuiGPb6k1gtD0j3Gj4Z8iOJ8
         qyXDRiUFF2uQSi/W0U3+X0cOjsKbr70iO6DSGT6t5vqtkdcwXhmxnnG1NwrzZYpuQr1M
         9884XDJtDSoeRa4JZ1YtMN8WZC+LRHcb12A0Jgt1LGX2FMeM0ET41bNtbyTMLquAD+rb
         4FUA==
X-Forwarded-Encrypted: i=1; AJvYcCWs/TRiqvtLh8tDy4vA6AOoReNzZQMOOnvlR9Cb1ZJJ+s+i/qwr8QOtII7l/s6WnLBk3ty5AmpIMK9fByqfE+MKKb9P/40YbziUiyGk4g==
X-Gm-Message-State: AOJu0Yy9OvQmzhCyKXafIi+kEu/9F/WIxO9u4HKcFySJG1gbP48jjU9E
	unYj6JDLfDWRWqvcIF4ODrDq5bNAjFEMKpok5m54u4/hXYDnTWlMkUTncIUTva9xUXeOI3j+Xzu
	5OQ==
X-Google-Smtp-Source: AGHT+IHWajt4q+2GEWgaIgDXJueM9mo/vIIpZUTkzUWbzeiF8EolzfURUXE0pwxlI4gUkbCX2sqdG3/b4FA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:86:b0:650:a16c:91ac with SMTP id
 00721157ae682-67a0a324dfdmr195847b3.8.1722037989755; Fri, 26 Jul 2024
 16:53:09 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:25 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-17-seanjc@google.com>
Subject: [PATCH v12 16/84] KVM: Drop unused "hva" pointer from __gfn_to_pfn_memslot()
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

Drop @hva from __gfn_to_pfn_memslot() now that all callers pass NULL.

No functional change intended.

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
index 30dd62f56a11..22ee37360c4e 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1563,7 +1563,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	mmap_read_unlock(current->mm);
 
 	pfn = __gfn_to_pfn_memslot(memslot, gfn, false, NULL,
-				   write_fault, &writable, NULL);
+				   write_fault, &writable);
 	if (pfn == KVM_PFN_ERR_HWPOISON) {
 		kvm_send_hwpoison_signal(hva, vma_shift);
 		return 0;
diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index 8cd02ca4b1b8..2f1d58984b41 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -614,7 +614,7 @@ int kvmppc_book3s_hv_page_fault(struct kvm_vcpu *vcpu,
 	} else {
 		/* Call KVM generic code to do the slow-path check */
 		pfn = __gfn_to_pfn_memslot(memslot, gfn, false, NULL,
-					   writing, &write_ok, NULL);
+					   writing, &write_ok);
 		if (is_error_noslot_pfn(pfn))
 			return -EFAULT;
 		page = NULL;
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 26a969e935e3..8304b6f8fe45 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -853,7 +853,7 @@ int kvmppc_book3s_instantiate_page(struct kvm_vcpu *vcpu,
 
 		/* Call KVM generic code to do the slow-path check */
 		pfn = __gfn_to_pfn_memslot(memslot, gfn, false, NULL,
-					   writing, upgrade_p, NULL);
+					   writing, upgrade_p);
 		if (is_error_noslot_pfn(pfn))
 			return -EFAULT;
 		page = NULL;
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index e0bfbf95646c..a201b56728ae 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4331,8 +4331,7 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 		return kvm_faultin_pfn_private(vcpu, fault);
 
 	fault->pfn = __gfn_to_pfn_memslot(fault->slot, fault->gfn, false, true,
-					  fault->write, &fault->map_writable,
-					  NULL);
+					  fault->write, &fault->map_writable);
 
 	/*
 	 * If resolving the page failed because I/O is needed to fault-in the
@@ -4360,8 +4359,7 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 	 * get a page and a fatal signal, i.e. SIGKILL, is pending.
 	 */
 	fault->pfn = __gfn_to_pfn_memslot(fault->slot, fault->gfn, true, true,
-					  fault->write, &fault->map_writable,
-					  NULL);
+					  fault->write, &fault->map_writable);
 	return RET_PF_CONTINUE;
 }
 
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 92b2922e2216..f42e030f69a4 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1220,7 +1220,7 @@ kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
 kvm_pfn_t gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn);
 kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn,
 			       bool interruptible, bool no_wait,
-			       bool write_fault, bool *writable, hva_t *hva);
+			       bool write_fault, bool *writable);
 
 void kvm_release_pfn_clean(kvm_pfn_t pfn);
 void kvm_release_pfn_dirty(kvm_pfn_t pfn);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index c2efdfe26d5b..6e3bb202c1b3 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2988,13 +2988,10 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool no_wait,
 
 kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn,
 			       bool interruptible, bool no_wait,
-			       bool write_fault, bool *writable, hva_t *hva)
+			       bool write_fault, bool *writable)
 {
 	unsigned long addr = __gfn_to_hva_many(slot, gfn, NULL, write_fault);
 
-	if (hva)
-		*hva = addr;
-
 	if (kvm_is_error_hva(addr)) {
 		if (writable)
 			*writable = false;
@@ -3017,13 +3014,13 @@ kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
 		      bool *writable)
 {
 	return __gfn_to_pfn_memslot(gfn_to_memslot(kvm, gfn), gfn, false, false,
-				    write_fault, writable, NULL);
+				    write_fault, writable);
 }
 EXPORT_SYMBOL_GPL(gfn_to_pfn_prot);
 
 kvm_pfn_t gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn)
 {
-	return __gfn_to_pfn_memslot(slot, gfn, false, false, true, NULL, NULL);
+	return __gfn_to_pfn_memslot(slot, gfn, false, false, true, NULL);
 }
 EXPORT_SYMBOL_GPL(gfn_to_pfn_memslot);
 
-- 
2.46.0.rc1.232.g9752f9e123-goog

