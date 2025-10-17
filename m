Return-Path: <linuxppc-dev+bounces-12953-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F721BE5E7C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 02:33:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnm4n5LKGz3chb;
	Fri, 17 Oct 2025 11:32:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760661177;
	cv=none; b=aCZn4UiVoKDXYr44YRQ5US5xM/FadyzWF481vptsmodU247nYggg6qRaSpyG8T7R8amSNr+77N9hzLMcOPgck5TqwYKRMnsFdgxXQDpwlehwwDXd/GmsAA2X8zw01W7eTbvN/GEpy4GckoQ92eFtnDRFZnHIWWOrDRIs7HZ3NarFXiNsQ2Y+dvgqtRCYUCDxu6ChPAYr55+YIvq5P0gXJ7EPjkfme7Gvq+Wh35qEeAZ2yOh2PsaCSCPF884ewVskKw4Pm1EkaZrex+E6UAwYLnSnZ4du4kgxSs04HUO+7uh9Cn98QABdE83NzuH02cbXIDrnY3I2zUewQGH+SFCQjg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760661177; c=relaxed/relaxed;
	bh=ko9UTh0kFN5WvzyFoNPT6gnIbmUfHZvedxM+uwzO14M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=E8DR7yPp2/qY+7GCEaDEjH8/OCD8k1SIl5hQLAiE+KOqM+N9ZE3hVjzvwS95vlk0LNlbd1FOgUiim3QAAuXmcvGv+Q5nFPvH7HqhN0+LaMS+6Pr21C5wGc/lvN75a1Wlbdth87rnoI1Ntgg9QSKan4/52hCb9UgOS43cLEE3dcE+9APe4Qk240b4apWvuWjjKX5bPKPXv1Uy9mSLtp88DHTdDc8ACzUfJYRBAEITEoTpFHkbidCaTIydOtnq0idJqyJTWLxDR02ggh9Yyp+Z97ZBp8+2pezC7KZM7NM9G9KqkY9ESMMoHFStEoR8KetETKfrspgtll47+Fynu4qgRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=s4V/5R9K; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3t47xaaykdogcokxtmqyyqvo.mywvsxehzzm-nofvscdc.yjvklc.ybq@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=s4V/5R9K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3t47xaaykdogcokxtmqyyqvo.mywvsxehzzm-nofvscdc.yjvklc.ybq@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cnm4n0vZsz3cfQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 11:32:57 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-33428befc08so3128520a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Oct 2025 17:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661175; x=1761265975; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ko9UTh0kFN5WvzyFoNPT6gnIbmUfHZvedxM+uwzO14M=;
        b=s4V/5R9KRj8VyM939r502TGdEqbToCxws4fH82L2s2ebtiA1JAHvJgOu9xiaorTDTL
         ekS7E7UoYMsRicyvV0jmbA3aqC8t8Iw/SnTZNGVTyHL1Dj60GHEP2DqAPnLrOpl6A+9s
         9HRVXiSwtMiH2huWEO94fKSOuj6/vcEvjgT7ZMjiai8VP5sEGZUh0eM9WvWe0wDR0ol0
         IJthmH49ctSNSP61tBHqFez/v7laLaY+RYjRJ7LzInc8vva/8cqxH2vJ9Xd7RJPryqfj
         ic5seocQ3eo3nIaAKJAyTyc/rN0is4fj2/HifhLuwRI+WePEaNRuyEmQyieN4sZdHmwz
         7jTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661175; x=1761265975;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ko9UTh0kFN5WvzyFoNPT6gnIbmUfHZvedxM+uwzO14M=;
        b=QHhmYiaHDv7tjBiBO2FAAvH55eeB7sX2owXOHFJAZjuBehhwkwskjgfLPhPBYGPvC0
         2wg9ip26fU2sp8PMjvo8Is9wEZMME8/+JWpeayOrBX/HtWjJCbJQ+WW5MxpvfgTGbBUt
         4u5ohlxk+Aa6CuBiYY8bQUn9iQ1K4xP3RWbjHRitrVLERYHDb4OwKaYR5NTMiNrgiw9g
         0q82xh6uoc8p907rqN5o4NmZe2ynKXl8L9d5NAQ/M6sBPiOO7v+cOxFvl8IE4nAiuSaX
         BxGLrUPYfxQrAwNCp8gYKkfPUNlZp7M0qUXzt63HyB+/GNMd7uMQOVG5teafE9gfOeZf
         Ho0Q==
X-Forwarded-Encrypted: i=1; AJvYcCX1tB9eEb7SUyjx97ZrpIEwjJRE6JZzFxif0fCcchRPJYp6PtyJfYY5dHjVhzhuQ83ltpC5RyaTEqjjlTk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyDqIayu4SqEV6aGTCd2SazXzW0kj0n2hDBtNu4Y3inIaz+yLA0
	tae0Gavt6bTGS8It1a9lTIjGsjMiIzNWKHmEEWry6G818hv7jPVD9sssJQRlVmpiSzPHwggJ1/R
	RKthhOQ==
X-Google-Smtp-Source: AGHT+IE6CYPgkt1lc/boR85TJpRZ+SOX8flYF3i2xBYbojnuL2N+y/yOiWuvwhvUCsHzA0ZslE057qBeNRU=
X-Received: from pjbmr8.prod.google.com ([2002:a17:90b:2388:b0:330:49f5:c0a7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c0c:b0:33b:c5f6:40f1
 with SMTP id 98e67ed59e1d1-33bcf85d123mr2212838a91.7.1760661175511; Thu, 16
 Oct 2025 17:32:55 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 16 Oct 2025 17:32:22 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-5-seanjc@google.com>
Subject: [PATCH v3 04/25] KVM: x86/mmu: Add dedicated API to map guest_memfd
 pfn into TDP MMU
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add and use a new API for mapping a private pfn from guest_memfd into the
TDP MMU from TDX's post-populate hook instead of partially open-coding the
functionality into the TDX code.  Sharing code with the pre-fault path
sounded good on paper, but it's fatally flawed as simulating a fault loses
the pfn, and calling back into gmem to re-retrieve the pfn creates locking
problems, e.g. kvm_gmem_populate() already holds the gmem invalidation
lock.

Providing a dedicated API will also removing several MMU exports that
ideally would not be exposed outside of the MMU, let alone to vendor code.
On that topic, opportunistically drop the kvm_mmu_load() export.  Leave
kvm_tdp_mmu_gpa_is_mapped() alone for now; the entire commit that added
kvm_tdp_mmu_gpa_is_mapped() will be removed in the near future.

Cc: Michael Roth <michael.roth@amd.com>
Cc: Yan Zhao <yan.y.zhao@intel.com>
Cc: Ira Weiny <ira.weiny@intel.com>
Cc: Vishal Annapurve <vannapurve@google.com>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>
Link: https://lore.kernel.org/all/20250709232103.zwmufocd3l7sqk7y@amd.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu.h     |  1 +
 arch/x86/kvm/mmu/mmu.c | 60 +++++++++++++++++++++++++++++++++++++++++-
 arch/x86/kvm/vmx/tdx.c | 10 +++----
 3 files changed, 63 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kvm/mmu.h b/arch/x86/kvm/mmu.h
index f63074048ec6..2f108e381959 100644
--- a/arch/x86/kvm/mmu.h
+++ b/arch/x86/kvm/mmu.h
@@ -259,6 +259,7 @@ extern bool tdp_mmu_enabled;
 
 bool kvm_tdp_mmu_gpa_is_mapped(struct kvm_vcpu *vcpu, u64 gpa);
 int kvm_tdp_map_page(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code, u8 *level);
+int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn);
 
 static inline bool kvm_memslots_have_rmaps(struct kvm *kvm)
 {
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 18d69d48bc55..ba5cca825a7f 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -5014,6 +5014,65 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
 	return min(range->size, end - range->gpa);
 }
 
+int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn)
+{
+	struct kvm_page_fault fault = {
+		.addr = gfn_to_gpa(gfn),
+		.error_code = PFERR_GUEST_FINAL_MASK | PFERR_PRIVATE_ACCESS,
+		.prefetch = true,
+		.is_tdp = true,
+		.nx_huge_page_workaround_enabled = is_nx_huge_page_enabled(vcpu->kvm),
+
+		.max_level = PG_LEVEL_4K,
+		.req_level = PG_LEVEL_4K,
+		.goal_level = PG_LEVEL_4K,
+		.is_private = true,
+
+		.gfn = gfn,
+		.slot = kvm_vcpu_gfn_to_memslot(vcpu, gfn),
+		.pfn = pfn,
+		.map_writable = true,
+	};
+	struct kvm *kvm = vcpu->kvm;
+	int r;
+
+	lockdep_assert_held(&kvm->slots_lock);
+
+	if (KVM_BUG_ON(!tdp_mmu_enabled, kvm))
+		return -EIO;
+
+	if (kvm_gfn_is_write_tracked(kvm, fault.slot, fault.gfn))
+		return -EPERM;
+
+	r = kvm_mmu_reload(vcpu);
+	if (r)
+		return r;
+
+	r = mmu_topup_memory_caches(vcpu, false);
+	if (r)
+		return r;
+
+	do {
+		if (signal_pending(current))
+			return -EINTR;
+
+		if (kvm_test_request(KVM_REQ_VM_DEAD, vcpu))
+			return -EIO;
+
+		cond_resched();
+
+		guard(read_lock)(&kvm->mmu_lock);
+
+		r = kvm_tdp_mmu_map(vcpu, &fault);
+	} while (r == RET_PF_RETRY);
+
+	if (r != RET_PF_FIXED)
+		return -EIO;
+
+	return 0;
+}
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_tdp_mmu_map_private_pfn);
+
 static void nonpaging_init_context(struct kvm_mmu *context)
 {
 	context->page_fault = nonpaging_page_fault;
@@ -5997,7 +6056,6 @@ int kvm_mmu_load(struct kvm_vcpu *vcpu)
 out:
 	return r;
 }
-EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_mmu_load);
 
 void kvm_mmu_unload(struct kvm_vcpu *vcpu)
 {
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 4c3014befe9f..29f344af4cc2 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -3157,15 +3157,12 @@ struct tdx_gmem_post_populate_arg {
 static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
 				  void __user *src, int order, void *_arg)
 {
-	u64 error_code = PFERR_GUEST_FINAL_MASK | PFERR_PRIVATE_ACCESS;
-	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
 	struct tdx_gmem_post_populate_arg *arg = _arg;
-	struct kvm_vcpu *vcpu = arg->vcpu;
+	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
+	u64 err, entry, level_state;
 	gpa_t gpa = gfn_to_gpa(gfn);
-	u8 level = PG_LEVEL_4K;
 	struct page *src_page;
 	int ret, i;
-	u64 err, entry, level_state;
 
 	/*
 	 * Get the source page if it has been faulted in. Return failure if the
@@ -3177,7 +3174,7 @@ static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
 	if (ret != 1)
 		return -ENOMEM;
 
-	ret = kvm_tdp_map_page(vcpu, gpa, error_code, &level);
+	ret = kvm_tdp_mmu_map_private_pfn(arg->vcpu, gfn, pfn);
 	if (ret < 0)
 		goto out;
 
@@ -3240,7 +3237,6 @@ static int tdx_vcpu_init_mem_region(struct kvm_vcpu *vcpu, struct kvm_tdx_cmd *c
 	    !vt_is_tdx_private_gpa(kvm, region.gpa + (region.nr_pages << PAGE_SHIFT) - 1))
 		return -EINVAL;
 
-	kvm_mmu_reload(vcpu);
 	ret = 0;
 	while (region.nr_pages) {
 		if (signal_pending(current)) {
-- 
2.51.0.858.gf9c4a03a3a-goog


