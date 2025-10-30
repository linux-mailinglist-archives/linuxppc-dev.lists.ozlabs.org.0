Return-Path: <linuxppc-dev+bounces-13595-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB6FC22278
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 21:12:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyFby2y6zz3f9s;
	Fri, 31 Oct 2025 07:10:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761855054;
	cv=none; b=hIF+GBcjBPFx/F92DohFb4cqxQOdwOxAEMn1ngt4+BsSNeT6ZOcpK7t1CdU2z7PBgDfI6Bw1f/iKEJGJ8OZO01FFmncCET8+ishceaAsn6ndYdxBb5pfzddaJR+4BGNlpUcYxUx6/MyQmPLs3YsoZQ7qbHS/Q81fxY+ab8Bp4SNggaN9Hy/DR88LqE7YFQunRHUc/wE/Klkfi+FYs/Jj8PGLrWUECyc8o02L5Ay7M1mP4KP276MAeplFIPKKV+SW0cvLs8+Zs5PdUwlWQwPOcdTvzgON2LSGLvZHZkVeYxjwtWUod9R9sh5l6AaoLYt6gqt9/KU2zFpDdUN6mmDviQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761855054; c=relaxed/relaxed;
	bh=xpa5Fver89jqQUHMNWla6MmRTI/zYJOh/l7CEBc/74M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=P4hVN8rySEKB8ksJwT45KFP9hdC5d6MXJC9H58/1UEO7HgqWjH/Pu1urtZCd4zxjWIsXpndMb/pwY2OSe4j19f5VaMI9LheNoruW39X92ESMvh3zlTRPXODnJ2coehovs1o/T8Sm0ZUPiUY80WFQNzRI4bSuvWFWg9dvChQTiAyj/MhGbus1rP9H6hK0O16s29dvFGp1+yMDpVqFs2FW7tcWDEd/Q/Kj6yRL67a33uIfRNJIKgAQEFnLR6f6wLjreZ9wR4QiufO+uXJ3+GdctyTqOLxmB9CazMPaYi1voSDw1V7OgB765eefAMiFQ4i2pXUlxRNKk5CyU8Y2N5A7bw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=2g5kX6N0; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3tmydaqykddclxtgcvzhhzex.vhfebgnqiiv-wxoeblml.hsetul.hkz@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=2g5kX6N0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3tmydaqykddclxtgcvzhhzex.vhfebgnqiiv-wxoeblml.hsetul.hkz@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyFbx4y9Kz3bvd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 07:10:53 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-32eb18b5500so2309086a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 13:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855052; x=1762459852; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=xpa5Fver89jqQUHMNWla6MmRTI/zYJOh/l7CEBc/74M=;
        b=2g5kX6N0oEn3PaaeSfek1sQ4lMjIqd3JGNNx82WDksHNYO2Ewbb6goq0xf3jAZIdHY
         J3Deq94ZcJkt0mmSA0x2oDZHqpNUok/MZHNeg9cfhWMRf4aHpB/RTihMUxp6SUSI2gGY
         ix9LCFYdw2IPu43l6nQG4m0/SpEWSG+q0bA6PK/7Asq6hj+6yhz3NwdJhv3FIJHN2NIk
         mbNe7qdoQrRv+TQcICtrvtVu6p9sdWxxfJg6N2S0KxTClhXlvhB7wFKLBxy5NHyw+Qh/
         94zdeIMvT60kL3ptYmZrsmpvACu72z1P5U7E2b8l+o9hWiCtrd7v4HZjbwe7uYtCeGkn
         DlYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855052; x=1762459852;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xpa5Fver89jqQUHMNWla6MmRTI/zYJOh/l7CEBc/74M=;
        b=KiHETfDoOK4HuFxg/4z+SlmkS1xRGw34GCPAJRPQ0BOUCCw+OEFRQRBjbrmKHUkfMO
         TmPvLNrf05ArQD2pzLhiAvmlyAFRPLITBqs64SmQOwKt+Ft0ohgHNDX25cSbQMu7UbnB
         8FaalZvea5X5ijzwWsA8yJx5VBaLP2Bd10u0X6VFQ86TEMLb2ruBvJmaWEprNdEkYo4n
         3qdkIB5hlrr2GhDFGbiSWLKMG3lOndqNBI/g56WAmQJNfvRcBTz2yLeygGzNq7GGGc5c
         THh6uYGNaKHQcpU+z5ODQiTn5t2x2arZL3jJsNZTTI1OjM91GH84wDkZnWADi7tB3Qq4
         UTkA==
X-Forwarded-Encrypted: i=1; AJvYcCWJreg1Y/YUaA3X67GPWsmudhx30iipVOWdfM+IkpyqiNtEpOUDD1U9XOStVWsYUvakBltZTx6aclxEDV0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwbNcKymIqf1AcLcx4VAVMoWwIgFCLGcW1pO8qtkeN6CXiRYTZs
	ytvTTOoO8bPI84jDUBqnDrKJGBe+WgPG5RmcXklvbm3JX+CILOBS0RLHuBv2ObHN7ODmzcdWTDq
	xtZpzWg==
X-Google-Smtp-Source: AGHT+IGdH9ACR3MS+ju/IeUipjD96kAUXZo3BjKEOn1spE0qh/NlJMuCLno+Rlt479ILTGbPCBlzBUGVIBM=
X-Received: from pjl4.prod.google.com ([2002:a17:90b:2f84:b0:339:dc19:ae60])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c52:b0:338:3789:2e7b
 with SMTP id 98e67ed59e1d1-34082fd9099mr1370626a91.13.1761855052135; Thu, 30
 Oct 2025 13:10:52 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 30 Oct 2025 13:09:44 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
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
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-22-seanjc@google.com>
Subject: [PATCH v4 21/28] KVM: TDX: Add macro to retry SEAMCALLs when forcing
 vCPUs out of guest
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
	Kai Huang <kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add a macro to handle kicking vCPUs out of the guest and retrying
SEAMCALLs on -EBUSY instead of providing small helpers to be used by each
SEAMCALL.  Wrapping the SEAMCALLs in a macro makes it a little harder to
tease out which SEAMCALL is being made, but significantly reduces the
amount of copy+paste code and makes it all but impossible to leave an
elevated wait_for_sept_zap.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 82 +++++++++++++++++-------------------------
 1 file changed, 33 insertions(+), 49 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 999b519494e9..97632fc6b520 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -294,25 +294,34 @@ static inline void tdx_disassociate_vp(struct kvm_vcpu *vcpu)
 	vcpu->cpu = -1;
 }
 
-static void tdx_no_vcpus_enter_start(struct kvm *kvm)
-{
-	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
-
-	lockdep_assert_held_write(&kvm->mmu_lock);
-
-	WRITE_ONCE(kvm_tdx->wait_for_sept_zap, true);
-
-	kvm_make_all_cpus_request(kvm, KVM_REQ_OUTSIDE_GUEST_MODE);
-}
-
-static void tdx_no_vcpus_enter_stop(struct kvm *kvm)
-{
-	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
-
-	lockdep_assert_held_write(&kvm->mmu_lock);
-
-	WRITE_ONCE(kvm_tdx->wait_for_sept_zap, false);
-}
+/*
+ * Execute a SEAMCALL related to removing/blocking S-EPT entries, with a single
+ * retry (if necessary) after forcing vCPUs to exit and wait for the operation
+ * to complete.  All flows that remove/block S-EPT entries run with mmu_lock
+ * held for write, i.e. are mutually exclusive with each other, but they aren't
+ * mutually exclusive with running vCPUs, and so can fail with "operand busy"
+ * if a vCPU acquires a relevant lock in the TDX-Module, e.g. when doing TDCALL.
+ *
+ * Note, the retry is guaranteed to succeed, absent KVM and/or TDX-Module bugs.
+ */
+#define tdh_do_no_vcpus(tdh_func, kvm, args...)					\
+({										\
+	struct kvm_tdx *__kvm_tdx = to_kvm_tdx(kvm);				\
+	u64 __err;								\
+										\
+	lockdep_assert_held_write(&kvm->mmu_lock);				\
+										\
+	__err = tdh_func(args);							\
+	if (unlikely(tdx_operand_busy(__err))) {				\
+		WRITE_ONCE(__kvm_tdx->wait_for_sept_zap, true);			\
+		kvm_make_all_cpus_request(kvm, KVM_REQ_OUTSIDE_GUEST_MODE);	\
+										\
+		__err = tdh_func(args);						\
+										\
+		WRITE_ONCE(__kvm_tdx->wait_for_sept_zap, false);		\
+	}									\
+	__err;									\
+})
 
 /* TDH.PHYMEM.PAGE.RECLAIM is allowed only when destroying the TD. */
 static int __tdx_reclaim_page(struct page *page)
@@ -1722,14 +1731,7 @@ static void tdx_track(struct kvm *kvm)
 	 */
 	lockdep_assert_held_write(&kvm->mmu_lock);
 
-	err = tdh_mem_track(&kvm_tdx->td);
-	if (unlikely(tdx_operand_busy(err))) {
-		/* After no vCPUs enter, the second retry is expected to succeed */
-		tdx_no_vcpus_enter_start(kvm);
-		err = tdh_mem_track(&kvm_tdx->td);
-		tdx_no_vcpus_enter_stop(kvm);
-	}
-
+	err = tdh_do_no_vcpus(tdh_mem_track, kvm, &kvm_tdx->td);
 	TDX_BUG_ON(err, TDH_MEM_TRACK, kvm);
 
 	kvm_make_all_cpus_request(kvm, KVM_REQ_OUTSIDE_GUEST_MODE);
@@ -1781,14 +1783,8 @@ static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 	if (KVM_BUG_ON(level != PG_LEVEL_4K, kvm))
 		return;
 
-	err = tdh_mem_range_block(&kvm_tdx->td, gpa, tdx_level, &entry, &level_state);
-	if (unlikely(tdx_operand_busy(err))) {
-		/* After no vCPUs enter, the second retry is expected to succeed */
-		tdx_no_vcpus_enter_start(kvm);
-		err = tdh_mem_range_block(&kvm_tdx->td, gpa, tdx_level, &entry, &level_state);
-		tdx_no_vcpus_enter_stop(kvm);
-	}
-
+	err = tdh_do_no_vcpus(tdh_mem_range_block, kvm, &kvm_tdx->td, gpa,
+			      tdx_level, &entry, &level_state);
 	if (TDX_BUG_ON_2(err, TDH_MEM_RANGE_BLOCK, entry, level_state, kvm))
 		return;
 
@@ -1803,20 +1799,8 @@ static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 	 * with other vcpu sept operation.
 	 * Race with TDH.VP.ENTER due to (0-step mitigation) and Guest TDCALLs.
 	 */
-	err = tdh_mem_page_remove(&kvm_tdx->td, gpa, tdx_level, &entry,
-				  &level_state);
-
-	if (unlikely(tdx_operand_busy(err))) {
-		/*
-		 * The second retry is expected to succeed after kicking off all
-		 * other vCPUs and prevent them from invoking TDH.VP.ENTER.
-		 */
-		tdx_no_vcpus_enter_start(kvm);
-		err = tdh_mem_page_remove(&kvm_tdx->td, gpa, tdx_level, &entry,
-					  &level_state);
-		tdx_no_vcpus_enter_stop(kvm);
-	}
-
+	err = tdh_do_no_vcpus(tdh_mem_page_remove, kvm, &kvm_tdx->td, gpa,
+			      tdx_level, &entry, &level_state);
 	if (TDX_BUG_ON_2(err, TDH_MEM_PAGE_REMOVE, entry, level_state, kvm))
 		return;
 
-- 
2.51.1.930.gacf6e81ea2-goog


