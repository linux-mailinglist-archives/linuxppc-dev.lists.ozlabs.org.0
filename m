Return-Path: <linuxppc-dev+bounces-12969-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F915BE5EE2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 02:35:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnm5K5gsQz3dS0;
	Fri, 17 Oct 2025 11:33:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760661205;
	cv=none; b=FEo8z1pz4n+ItcEUKkMMVha1LGOTgJCMH0acYmnO2jvAVOgIlhlla6f6uzWMi3m9WrTvFk7HKaFOJnyebaE312xhMMPuokHqvyEq+7qwnmlp4cccANKxsZxMTu127hVs9hk/Z00UOEw3+XOD1qE0c/kFvLDWydm6e9ZuPC+ulODC+9fDLmJ73kOFI4F2BIzjsXLUy229wvHgttt6VinrAcTWMKhQTnowMbw/aSc400qvBkSTxRVz/p9cojon87KSRYng+eRyMAIIC9AEq6FqFQL6wSvkMfsJIWBtlS9jw5u7EhsvSvxag4GXif3R9pX1y5w3x9j6WTU3uHnkAACrag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760661205; c=relaxed/relaxed;
	bh=jejy5GHiX1n5ZzK7FS/SwKAPXTIMDzw65QOVqYwFQBI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gO5eNdId0etE89DxC6OQFSwe5Zn4TGEIGBBKb1DJvCRwad3XzOx78C18jPgs8A1JCZHoA6InSvvzwIA2eDbNbHVo34U3Y79APup+1vXtJ1X6ey/9UypVYrtBXcjtfSUYqXbgN8FqoML3u89M4+l1TXeR+fnwZtGrcet/JoXM1zZS0rqcMakj4GA5oLGjX0h7pVpqbOb8m7VQKU4RNq1m+888ItGRuZHSUONxMwfbOqy7LSWQGuRn2LQuh8RpdSsA8XJbmoWiG6pwwguWu+7YUAp2R+SSBcSE6J76pIFqosEEg9EyiL5HS2PfcYH5bqMgCgSuvxRIdNjwSeJ2FCphmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=QI5STzO6; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3047xaaykdayykgtpimuumrk.iusrot03vvi-jk1royzy.u5rghy.uxm@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=QI5STzO6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3047xaaykdayykgtpimuumrk.iusrot03vvi-jk1royzy.u5rghy.uxm@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cnm5K0LGZz3dRg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 11:33:25 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-32ee157b9c9so1211245a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Oct 2025 17:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661203; x=1761266003; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=jejy5GHiX1n5ZzK7FS/SwKAPXTIMDzw65QOVqYwFQBI=;
        b=QI5STzO60hWqFPSONWG4ZRWYISToUR1EGp0VW+48oaHWGmAVQdEvK3JtzTJSzA93qv
         5Ktu5LsOh4CzfKVZTwYyAwL0Lx53xaxdhL/GqixxqPfHDQWPCF0LjX21GjNv186XyGbv
         X2RDvvEDZMgRhLBVfk2ouSiKCFrtSbKeTnVC9TFVBKssn6Tv9I8gX02UeQ4bU3hC6HNI
         efIcx0l+rR9oyMr1G2htMznaMzF1wNSjsI5yWqFcqauhEVTjKSpHK1R5dHWoEC4e8XSr
         CQ2qMUcCyKcZNPirR3c8aI4EOZym6pqh5H+7gJVgnSIkWVHunItc3ZISc4A3V+HSrmQn
         G9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661203; x=1761266003;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jejy5GHiX1n5ZzK7FS/SwKAPXTIMDzw65QOVqYwFQBI=;
        b=uLS9pyg+tLwbGA9lCrIhXlsuMHEcnjLseVo2/maLDUoDfZJRLjhaOaz+h6V1SrgQwl
         ZvKczvRKU2EOXsEKFeGJd1MzWaAcgf04H7d1RDw0hDJoG+JY7j4ez6aPMyyIwq2Yawn4
         3qa6TSAC7lAe9vdSXMf+wIb4JdUwzfo69hIrsdQChCnLw3GdfxS/w5bFlW/AsQrhYpUB
         D0ueVfY4ajbMT684mdk940jERjUOqDRQpWkaEA89jn9AYCo8v8dl6QqTDXTDBAzYo00k
         rjiohG7q3hVw2CK4nUe/AfnWdubktPOGm8Fe0Nh+sTOkduITWIMRS3YrJkSvWQLkIT35
         i5Vg==
X-Forwarded-Encrypted: i=1; AJvYcCWcYb3IZISPLSORHsVRxto7DuJnuxyhoNm6TC5IERWAGoTyD3cnVFWfFEcZF71ZyllbDq/Uds4p4QYWiKA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz96P3ao+xY+7t+Z1LOgtNRoSMG0BzWp7xAJ+VTPwLzIjzKtytw
	6ImtrbjoRbDt1iPszI87tCbjitQ1i2se2omWPP3+/hSppneRNI4wpOtuHP5RIAO4kZ8pBKyBSpw
	ICyinKg==
X-Google-Smtp-Source: AGHT+IFl8lCxI7RawbIX2CACJWbI5vFGM8HhgndqIpbMEKI2O7QrNwa82jxnXWK9S77FfTXYSbFZaN83qL4=
X-Received: from pjqx20.prod.google.com ([2002:a17:90a:b014:b0:338:3e6b:b835])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c02:b0:32c:38b0:593e
 with SMTP id 98e67ed59e1d1-33bcf85ffa4mr1903883a91.5.1760661203423; Thu, 16
 Oct 2025 17:33:23 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 16 Oct 2025 17:32:38 -0700
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
Message-ID: <20251017003244.186495-21-seanjc@google.com>
Subject: [PATCH v3 20/25] KVM: TDX: Add macro to retry SEAMCALLs when forcing
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
	Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
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
 arch/x86/kvm/vmx/tdx.c | 72 ++++++++++++++----------------------------
 1 file changed, 23 insertions(+), 49 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index f6782b0ffa98..2e2dab89c98f 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -294,25 +294,24 @@ static inline void tdx_disassociate_vp(struct kvm_vcpu *vcpu)
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
@@ -1711,14 +1710,7 @@ static void tdx_track(struct kvm *kvm)
 	if (unlikely(kvm_tdx->state != TD_STATE_RUNNABLE))
 		return;
 
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
@@ -1770,14 +1762,8 @@ static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
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
 
@@ -1792,20 +1778,8 @@ static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
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
2.51.0.858.gf9c4a03a3a-goog


