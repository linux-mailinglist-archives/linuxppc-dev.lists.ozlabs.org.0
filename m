Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD156D014E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 12:34:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PnKXl0PhNz3fTC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 21:34:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cqLl6hal;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PnKW03SwNz3c3w
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 21:32:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cqLl6hal;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4PnKW033Hfz4xFf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 21:32:44 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4PnKW02wCLz4xDw; Thu, 30 Mar 2023 21:32:44 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cqLl6hal;
	dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4PnKW02ll6z4whh;
	Thu, 30 Mar 2023 21:32:44 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id w4so17620090plg.9;
        Thu, 30 Mar 2023 03:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680172362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mIc+w6RBCuEkRBD/i6pcyb62xLvR8dwUGSTUtaSxH7w=;
        b=cqLl6halZSG9WXCERASQge5izK99zDa4rNioeDNySWQC2ClaqXwcHU0Q1YxNj+tWhX
         ++Lu7Nw8L0eaFKiWvx2VIsvXZ/icD2aNZ61Si3f5Z3fJvnwzI4enxObA/EBrDOdkk9DT
         PMFISn6eXALMunYdIqIPzOutRyjb/oLRURGXVDRz+fHzDfmoougRLpVDpOcbC5OO3gbr
         PlItIS3nadQXfvB9shYiQE3oObvD98AuYKKSReVB1kdUIULRmpAoZFr8MoTwjd7VhSoC
         ElzhPjNlSGH61T1VaTYKOLlUSL46U6rNmTNXTPoY02Go3mKTPxsT+bCxgaKJ/jgKA1SF
         gBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680172362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mIc+w6RBCuEkRBD/i6pcyb62xLvR8dwUGSTUtaSxH7w=;
        b=5vzl/FA80pNVLNm0TMueNnf5TOs3H2875omIMceHWIidOOTnZAsOG2QwZ46Rf9ON7s
         lZOJ84Gq/gjBbJ8vYV45eEJudTAR7mbs998uIWFJ95AwGffb0VacZa4rP59TrWV0gC6y
         QVj0G2GVJESnCRNk2XnV9zW66nFpxnTdsZEbP20lq5dppqQnrEADu//TX9FBUTWpSFa1
         WQtryAdmjy0mJWMPqxAfZnP7umzaraOxUQhQBm/yQDlQu5x2u2XbqzT/TQntMJytyqmO
         qpO2FeT8o/AYnHPkJ6J5Cd6VOTH72VSrXAyO43wXN4uBsPbbBP1AeIZ4l8oDakm966mU
         zkhQ==
X-Gm-Message-State: AAQBX9d+FXQhbPwmnTnU9dqqv/m8WYDZEEsNOBROGpK865fiRiQBzmyQ
	ZC6y9ZYEWknrQkAA0tkjDs2tvvG0UGk=
X-Google-Smtp-Source: AKy350Y/iwmxcVOrID+xf/ON8LaylCuMPMgYHR3HLDdeSZtv3Ffq4IGinukuF05XvY9E2oBbRrQV9A==
X-Received: by 2002:a17:90a:1a17:b0:23b:45be:a15a with SMTP id 23-20020a17090a1a1700b0023b45bea15amr23702960pjk.25.1680172361734;
        Thu, 30 Mar 2023 03:32:41 -0700 (PDT)
Received: from bobo.ibm.com ([203.220.177.81])
        by smtp.gmail.com with ESMTPSA id 6-20020a17090a08c600b0023440af7aafsm2895219pjn.9.2023.03.30.03.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 03:32:41 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2 2/2] KVM: PPC: Book3S HV: Set SRR1[PREFIX] bit on injected interrupts
Date: Thu, 30 Mar 2023 20:32:24 +1000
Message-Id: <20230330103224.3589928-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230330103224.3589928-1-npiggin@gmail.com>
References: <20230330103224.3589928-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Michael Neuling <mikey@neuling.org>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Pass the hypervisor (H)SRR1[PREFIX] indication through to synchronous
interrupts injected into the guest.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_64_mmu_radix.c | 13 +++++++++----
 arch/powerpc/kvm/book3s_hv.c           | 27 +++++++++++++++++---------
 arch/powerpc/kvm/book3s_hv_nested.c    |  9 ++++++---
 arch/powerpc/kvm/emulate_loadstore.c   |  6 +++---
 arch/powerpc/kvm/powerpc.c             |  3 ++-
 5 files changed, 38 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 215a6b5ba104..461307b89c3a 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -954,7 +954,9 @@ int kvmppc_book3s_radix_page_fault(struct kvm_vcpu *vcpu,
 	if (dsisr & DSISR_BADACCESS) {
 		/* Reflect to the guest as DSI */
 		pr_err("KVM: Got radix HV page fault with DSISR=%lx\n", dsisr);
-		kvmppc_core_queue_data_storage(vcpu, 0, ea, dsisr);
+		kvmppc_core_queue_data_storage(vcpu,
+				kvmppc_get_msr(vcpu) & SRR1_PREFIXED,
+				ea, dsisr);
 		return RESUME_GUEST;
 	}
 
@@ -979,7 +981,9 @@ int kvmppc_book3s_radix_page_fault(struct kvm_vcpu *vcpu,
 			 * Bad address in guest page table tree, or other
 			 * unusual error - reflect it to the guest as DSI.
 			 */
-			kvmppc_core_queue_data_storage(vcpu, 0, ea, dsisr);
+			kvmppc_core_queue_data_storage(vcpu,
+					kvmppc_get_msr(vcpu) & SRR1_PREFIXED,
+					ea, dsisr);
 			return RESUME_GUEST;
 		}
 		return kvmppc_hv_emulate_mmio(vcpu, gpa, ea, writing);
@@ -988,8 +992,9 @@ int kvmppc_book3s_radix_page_fault(struct kvm_vcpu *vcpu,
 	if (memslot->flags & KVM_MEM_READONLY) {
 		if (writing) {
 			/* give the guest a DSI */
-			kvmppc_core_queue_data_storage(vcpu, 0, ea,
-					DSISR_ISSTORE | DSISR_PROTFAULT);
+			kvmppc_core_queue_data_storage(vcpu,
+					kvmppc_get_msr(vcpu) & SRR1_PREFIXED,
+					ea, DSISR_ISSTORE | DSISR_PROTFAULT);
 			return RESUME_GUEST;
 		}
 		kvm_ro = true;
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 16ea0ffb7976..c973bf556fb3 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1428,7 +1428,8 @@ static int kvmppc_emulate_debug_inst(struct kvm_vcpu *vcpu)
 		vcpu->run->debug.arch.address = kvmppc_get_pc(vcpu);
 		return RESUME_HOST;
 	} else {
-		kvmppc_core_queue_program(vcpu, SRR1_PROGILL);
+		kvmppc_core_queue_program(vcpu, SRR1_PROGILL |
+				(kvmppc_get_msr(vcpu) & SRR1_PREFIXED));
 		return RESUME_GUEST;
 	}
 }
@@ -1632,7 +1633,8 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 		 * so that it knows that the machine check occurred.
 		 */
 		if (!vcpu->kvm->arch.fwnmi_enabled) {
-			ulong flags = vcpu->arch.shregs.msr & 0x083c0000;
+			ulong flags = (vcpu->arch.shregs.msr & 0x083c0000) |
+					(kvmppc_get_msr(vcpu) & SRR1_PREFIXED);
 			kvmppc_core_queue_machine_check(vcpu, flags);
 			r = RESUME_GUEST;
 			break;
@@ -1661,7 +1663,8 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 		 * as a result of a hypervisor emulation interrupt
 		 * (e40) getting turned into a 700 by BML RTAS.
 		 */
-		flags = vcpu->arch.shregs.msr & 0x1f0000ull;
+		flags = (vcpu->arch.shregs.msr & 0x1f0000ull) |
+			(kvmppc_get_msr(vcpu) & SRR1_PREFIXED);
 		kvmppc_core_queue_program(vcpu, flags);
 		r = RESUME_GUEST;
 		break;
@@ -1741,7 +1744,8 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 		}
 
 		if (!(vcpu->arch.fault_dsisr & (DSISR_NOHPTE | DSISR_PROTFAULT))) {
-			kvmppc_core_queue_data_storage(vcpu, 0,
+			kvmppc_core_queue_data_storage(vcpu,
+				kvmppc_get_msr(vcpu) & SRR1_PREFIXED,
 				vcpu->arch.fault_dar, vcpu->arch.fault_dsisr);
 			r = RESUME_GUEST;
 			break;
@@ -1759,7 +1763,8 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 		} else if (err == -1 || err == -2) {
 			r = RESUME_PAGE_FAULT;
 		} else {
-			kvmppc_core_queue_data_storage(vcpu, 0,
+			kvmppc_core_queue_data_storage(vcpu,
+				kvmppc_get_msr(vcpu) & SRR1_PREFIXED,
 				vcpu->arch.fault_dar, err);
 			r = RESUME_GUEST;
 		}
@@ -1787,7 +1792,8 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 
 		if (!(vcpu->arch.fault_dsisr & SRR1_ISI_NOPT)) {
 			kvmppc_core_queue_inst_storage(vcpu,
-				vcpu->arch.fault_dsisr);
+				vcpu->arch.fault_dsisr |
+				(kvmppc_get_msr(vcpu) & SRR1_PREFIXED));
 			r = RESUME_GUEST;
 			break;
 		}
@@ -1804,7 +1810,8 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 		} else if (err == -1) {
 			r = RESUME_PAGE_FAULT;
 		} else {
-			kvmppc_core_queue_inst_storage(vcpu, err);
+			kvmppc_core_queue_inst_storage(vcpu,
+				err | (kvmppc_get_msr(vcpu) & SRR1_PREFIXED));
 			r = RESUME_GUEST;
 		}
 		break;
@@ -1825,7 +1832,8 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 		if (vcpu->guest_debug & KVM_GUESTDBG_USE_SW_BP) {
 			r = kvmppc_emulate_debug_inst(vcpu);
 		} else {
-			kvmppc_core_queue_program(vcpu, SRR1_PROGILL);
+			kvmppc_core_queue_program(vcpu, SRR1_PROGILL |
+				(kvmppc_get_msr(vcpu) & SRR1_PREFIXED));
 			r = RESUME_GUEST;
 		}
 		break;
@@ -1866,7 +1874,8 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 				r = kvmppc_tm_unavailable(vcpu);
 		}
 		if (r == EMULATE_FAIL) {
-			kvmppc_core_queue_program(vcpu, SRR1_PROGILL);
+			kvmppc_core_queue_program(vcpu, SRR1_PROGILL |
+				(kvmppc_get_msr(vcpu) & SRR1_PREFIXED));
 			r = RESUME_GUEST;
 		}
 		break;
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 2c9db6119d89..377d0b4a05ee 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -1560,7 +1560,9 @@ static long int __kvmhv_nested_page_fault(struct kvm_vcpu *vcpu,
 	if (!memslot || (memslot->flags & KVM_MEMSLOT_INVALID)) {
 		if (dsisr & (DSISR_PRTABLE_FAULT | DSISR_BADACCESS)) {
 			/* unusual error -> reflect to the guest as a DSI */
-			kvmppc_core_queue_data_storage(vcpu, 0, ea, dsisr);
+			kvmppc_core_queue_data_storage(vcpu,
+					kvmppc_get_msr(vcpu) & SRR1_PREFIXED,
+					ea, dsisr);
 			return RESUME_GUEST;
 		}
 
@@ -1570,8 +1572,9 @@ static long int __kvmhv_nested_page_fault(struct kvm_vcpu *vcpu,
 	if (memslot->flags & KVM_MEM_READONLY) {
 		if (writing) {
 			/* Give the guest a DSI */
-			kvmppc_core_queue_data_storage(vcpu, 0, ea,
-					DSISR_ISSTORE | DSISR_PROTFAULT);
+			kvmppc_core_queue_data_storage(vcpu,
+					kvmppc_get_msr(vcpu) & SRR1_PREFIXED,
+					ea, DSISR_ISSTORE | DSISR_PROTFAULT);
 			return RESUME_GUEST;
 		}
 		kvm_ro = true;
diff --git a/arch/powerpc/kvm/emulate_loadstore.c b/arch/powerpc/kvm/emulate_loadstore.c
index 5666d69e202a..059c08ae0340 100644
--- a/arch/powerpc/kvm/emulate_loadstore.c
+++ b/arch/powerpc/kvm/emulate_loadstore.c
@@ -28,7 +28,7 @@
 static bool kvmppc_check_fp_disabled(struct kvm_vcpu *vcpu)
 {
 	if (!(kvmppc_get_msr(vcpu) & MSR_FP)) {
-		kvmppc_core_queue_fpunavail(vcpu, 0);
+		kvmppc_core_queue_fpunavail(vcpu, kvmppc_get_msr(vcpu) & SRR1_PREFIXED);
 		return true;
 	}
 
@@ -40,7 +40,7 @@ static bool kvmppc_check_fp_disabled(struct kvm_vcpu *vcpu)
 static bool kvmppc_check_vsx_disabled(struct kvm_vcpu *vcpu)
 {
 	if (!(kvmppc_get_msr(vcpu) & MSR_VSX)) {
-		kvmppc_core_queue_vsx_unavail(vcpu, 0);
+		kvmppc_core_queue_vsx_unavail(vcpu, kvmppc_get_msr(vcpu) & SRR1_PREFIXED);
 		return true;
 	}
 
@@ -52,7 +52,7 @@ static bool kvmppc_check_vsx_disabled(struct kvm_vcpu *vcpu)
 static bool kvmppc_check_altivec_disabled(struct kvm_vcpu *vcpu)
 {
 	if (!(kvmppc_get_msr(vcpu) & MSR_VEC)) {
-		kvmppc_core_queue_vec_unavail(vcpu, 0);
+		kvmppc_core_queue_vec_unavail(vcpu, kvmppc_get_msr(vcpu) & SRR1_PREFIXED);
 		return true;
 	}
 
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 9478bbd873c6..339267c33636 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -321,7 +321,8 @@ int kvmppc_emulate_mmio(struct kvm_vcpu *vcpu)
 			if (vcpu->mmio_is_write)
 				dsisr |= DSISR_ISSTORE;
 
-			kvmppc_core_queue_data_storage(vcpu, 0,
+			kvmppc_core_queue_data_storage(vcpu,
+					kvmppc_get_msr(vcpu) & SRR1_PREFIXED,
 					vcpu->arch.vaddr_accessed, dsisr);
 		} else {
 			/*
-- 
2.37.2

