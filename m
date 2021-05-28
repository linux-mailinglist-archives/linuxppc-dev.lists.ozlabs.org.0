Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1437393FC6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 11:21:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Frzh454CRz3dKJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 19:21:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=E6ClE/cn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=E6ClE/cn; dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrzQJ2VKpz3bT7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 19:09:12 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id s4so1315360plg.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 02:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lkhh+7+Ov19CpD2BZ2TpSp5T+9kMV12xhYDKRJk5AtI=;
 b=E6ClE/cnOwN19XjSaIrA2ToB1juk5hyxB8Pi6uYNUSTzCs6xUE2lnSwTa8Z5mu0YLf
 odxIjd+rKmFzeCfSn4uhXneiDDMWrGUN7bL3mAsATxCuEqYELSFUpyLBOxF1r9dhXues
 gUbzi/qQONtvhOkMgvCHZj3Gu+9BZvUPBicw47iriC7JsSWJr4jFA7YLdTxToQmZESVk
 UYyuAz/np+j9HgkkAUJIclstCAqx5bu2Z+K34dsCfm8Tj65lNnYgJFE9e8pk/GggcESv
 7hKPgYWUgDI+9bu73xRCCaqZ5RxVLAIetlR53JUTITEMKtM+12+QYqa4kmq33zmIsxCY
 VTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lkhh+7+Ov19CpD2BZ2TpSp5T+9kMV12xhYDKRJk5AtI=;
 b=ANoq/43BXFOUkrfZ8l3crTER6+fxJUjN5u2/jI3bzwzkHLhni9/5MjASujfOEwf9l9
 JtlWAZ+PKL4kB1/xhk2hJHNPQkzsmCebLNwAArBfna9HB6XhdGkmY3JKNTzLjN65QnSx
 tC+UE+UycCJDzyUy8kzldrgkFyFIBkUqzoDDY+hnw/NNXGroJGKItHOHCYUSkVQpoMbe
 5VfQi0W1x6+PUARlfjCzY8VorS/y9AcIyLsEWu/pGTqYbzqG3bu+FH8yjjnI5qUL8wbK
 pHGyG07PoknRoTVi/n0FErS8yhNRw4du+C0Vi+Z0pEOelT2oDbFyBzqHccEyhhlLNZQw
 wKnw==
X-Gm-Message-State: AOAM533KVETE+9rsriWxa9Ky8HOai0iAhpoudrXq1syXPhH2uwg4o95/
 nCL/+REl/mV+nrE9+mCdLEs4bJdrX+g=
X-Google-Smtp-Source: ABdhPJziDElpszUtRsQGuRpyUjxSJUJ/OdMWEFjxR3whjFKzDjOLE8WqHG258haY9+6ev2AwbGi9Nw==
X-Received: by 2002:a17:90a:ba8b:: with SMTP id
 t11mr3426534pjr.106.1622192949815; 
 Fri, 28 May 2021 02:09:09 -0700 (PDT)
Received: from bobo.ibm.com (124-169-110-219.tpgi.com.au. [124.169.110.219])
 by smtp.gmail.com with ESMTPSA id a2sm3624183pfv.156.2021.05.28.02.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 02:09:09 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v7 28/32] KVM: PPC: Book3S HV: add virtual mode handlers for
 HPT hcalls and page faults
Date: Fri, 28 May 2021 19:07:48 +1000
Message-Id: <20210528090752.3542186-29-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210528090752.3542186-1-npiggin@gmail.com>
References: <20210528090752.3542186-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In order to support hash guests in the P9 path (which does not do real
mode hcalls or page fault handling), these real-mode hash specific
interrupts need to be implemented in virt mode.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c        | 145 ++++++++++++++++++++++++++--
 arch/powerpc/kvm/book3s_hv_rm_mmu.c |   8 ++
 2 files changed, 144 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 9ba77747bf00..dee740a3ace9 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -939,6 +939,52 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
 		return RESUME_HOST;
 
 	switch (req) {
+	case H_REMOVE:
+		ret = kvmppc_h_remove(vcpu, kvmppc_get_gpr(vcpu, 4),
+					kvmppc_get_gpr(vcpu, 5),
+					kvmppc_get_gpr(vcpu, 6));
+		if (ret == H_TOO_HARD)
+			return RESUME_HOST;
+		break;
+	case H_ENTER:
+		ret = kvmppc_h_enter(vcpu, kvmppc_get_gpr(vcpu, 4),
+					kvmppc_get_gpr(vcpu, 5),
+					kvmppc_get_gpr(vcpu, 6),
+					kvmppc_get_gpr(vcpu, 7));
+		if (ret == H_TOO_HARD)
+			return RESUME_HOST;
+		break;
+	case H_READ:
+		ret = kvmppc_h_read(vcpu, kvmppc_get_gpr(vcpu, 4),
+					kvmppc_get_gpr(vcpu, 5));
+		if (ret == H_TOO_HARD)
+			return RESUME_HOST;
+		break;
+	case H_CLEAR_MOD:
+		ret = kvmppc_h_clear_mod(vcpu, kvmppc_get_gpr(vcpu, 4),
+					kvmppc_get_gpr(vcpu, 5));
+		if (ret == H_TOO_HARD)
+			return RESUME_HOST;
+		break;
+	case H_CLEAR_REF:
+		ret = kvmppc_h_clear_ref(vcpu, kvmppc_get_gpr(vcpu, 4),
+					kvmppc_get_gpr(vcpu, 5));
+		if (ret == H_TOO_HARD)
+			return RESUME_HOST;
+		break;
+	case H_PROTECT:
+		ret = kvmppc_h_protect(vcpu, kvmppc_get_gpr(vcpu, 4),
+					kvmppc_get_gpr(vcpu, 5),
+					kvmppc_get_gpr(vcpu, 6));
+		if (ret == H_TOO_HARD)
+			return RESUME_HOST;
+		break;
+	case H_BULK_REMOVE:
+		ret = kvmppc_h_bulk_remove(vcpu);
+		if (ret == H_TOO_HARD)
+			return RESUME_HOST;
+		break;
+
 	case H_CEDE:
 		break;
 	case H_PROD:
@@ -1138,6 +1184,7 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
 	default:
 		return RESUME_HOST;
 	}
+	WARN_ON_ONCE(ret == H_TOO_HARD);
 	kvmppc_set_gpr(vcpu, 3, ret);
 	vcpu->arch.hcall_needed = 0;
 	return RESUME_GUEST;
@@ -1438,22 +1485,102 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 	 * We get these next two if the guest accesses a page which it thinks
 	 * it has mapped but which is not actually present, either because
 	 * it is for an emulated I/O device or because the corresonding
-	 * host page has been paged out.  Any other HDSI/HISI interrupts
-	 * have been handled already.
+	 * host page has been paged out.
+	 *
+	 * Any other HDSI/HISI interrupts have been handled already for P7/8
+	 * guests. For POWER9 hash guests not using rmhandlers, basic hash
+	 * fault handling is done here.
 	 */
-	case BOOK3S_INTERRUPT_H_DATA_STORAGE:
-		r = RESUME_PAGE_FAULT;
-		if (vcpu->arch.fault_dsisr == HDSISR_CANARY)
+	case BOOK3S_INTERRUPT_H_DATA_STORAGE: {
+		unsigned long vsid;
+		long err;
+
+		if (vcpu->arch.fault_dsisr == HDSISR_CANARY) {
 			r = RESUME_GUEST; /* Just retry if it's the canary */
+			break;
+		}
+
+		if (kvm_is_radix(vcpu->kvm) || !cpu_has_feature(CPU_FTR_ARCH_300)) {
+			/*
+			 * Radix doesn't require anything, and pre-ISAv3.0 hash
+			 * already attempted to handle this in rmhandlers. The
+			 * hash fault handling below is v3 only (it uses ASDR
+			 * via fault_gpa).
+			 */
+			r = RESUME_PAGE_FAULT;
+			break;
+		}
+
+		if (!(vcpu->arch.fault_dsisr & (DSISR_NOHPTE | DSISR_PROTFAULT))) {
+			kvmppc_core_queue_data_storage(vcpu,
+				vcpu->arch.fault_dar, vcpu->arch.fault_dsisr);
+			r = RESUME_GUEST;
+			break;
+		}
+
+		if (!(vcpu->arch.shregs.msr & MSR_DR))
+			vsid = vcpu->kvm->arch.vrma_slb_v;
+		else
+			vsid = vcpu->arch.fault_gpa;
+
+		err = kvmppc_hpte_hv_fault(vcpu, vcpu->arch.fault_dar,
+				vsid, vcpu->arch.fault_dsisr, true);
+		if (err == 0) {
+			r = RESUME_GUEST;
+		} else if (err == -1 || err == -2) {
+			r = RESUME_PAGE_FAULT;
+		} else {
+			kvmppc_core_queue_data_storage(vcpu,
+				vcpu->arch.fault_dar, err);
+			r = RESUME_GUEST;
+		}
 		break;
-	case BOOK3S_INTERRUPT_H_INST_STORAGE:
+	}
+	case BOOK3S_INTERRUPT_H_INST_STORAGE: {
+		unsigned long vsid;
+		long err;
+
 		vcpu->arch.fault_dar = kvmppc_get_pc(vcpu);
 		vcpu->arch.fault_dsisr = vcpu->arch.shregs.msr &
 			DSISR_SRR1_MATCH_64S;
-		if (vcpu->arch.shregs.msr & HSRR1_HISI_WRITE)
-			vcpu->arch.fault_dsisr |= DSISR_ISSTORE;
-		r = RESUME_PAGE_FAULT;
+		if (kvm_is_radix(vcpu->kvm) || !cpu_has_feature(CPU_FTR_ARCH_300)) {
+			/*
+			 * Radix doesn't require anything, and pre-ISAv3.0 hash
+			 * already attempted to handle this in rmhandlers. The
+			 * hash fault handling below is v3 only (it uses ASDR
+			 * via fault_gpa).
+			 */
+			if (vcpu->arch.shregs.msr & HSRR1_HISI_WRITE)
+				vcpu->arch.fault_dsisr |= DSISR_ISSTORE;
+			r = RESUME_PAGE_FAULT;
+			break;
+		}
+
+		if (!(vcpu->arch.fault_dsisr & SRR1_ISI_NOPT)) {
+			kvmppc_core_queue_inst_storage(vcpu,
+				vcpu->arch.fault_dsisr);
+			r = RESUME_GUEST;
+			break;
+		}
+
+		if (!(vcpu->arch.shregs.msr & MSR_IR))
+			vsid = vcpu->kvm->arch.vrma_slb_v;
+		else
+			vsid = vcpu->arch.fault_gpa;
+
+		err = kvmppc_hpte_hv_fault(vcpu, vcpu->arch.fault_dar,
+				vsid, vcpu->arch.fault_dsisr, false);
+		if (err == 0) {
+			r = RESUME_GUEST;
+		} else if (err == -1) {
+			r = RESUME_PAGE_FAULT;
+		} else {
+			kvmppc_core_queue_inst_storage(vcpu, err);
+			r = RESUME_GUEST;
+		}
 		break;
+	}
+
 	/*
 	 * This occurs if the guest executes an illegal instruction.
 	 * If the guest debug is disabled, generate a program interrupt
diff --git a/arch/powerpc/kvm/book3s_hv_rm_mmu.c b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
index 7a0f12404e0e..9b8c2c41fa5f 100644
--- a/arch/powerpc/kvm/book3s_hv_rm_mmu.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
@@ -398,6 +398,7 @@ long kvmppc_h_enter(struct kvm_vcpu *vcpu, unsigned long flags,
 				 vcpu->arch.pgdir, true,
 				 &vcpu->arch.regs.gpr[4]);
 }
+EXPORT_SYMBOL_GPL(kvmppc_h_enter);
 
 #ifdef __BIG_ENDIAN__
 #define LOCK_TOKEN	(*(u32 *)(&get_paca()->lock_token))
@@ -542,6 +543,7 @@ long kvmppc_h_remove(struct kvm_vcpu *vcpu, unsigned long flags,
 	return kvmppc_do_h_remove(vcpu->kvm, flags, pte_index, avpn,
 				  &vcpu->arch.regs.gpr[4]);
 }
+EXPORT_SYMBOL_GPL(kvmppc_h_remove);
 
 long kvmppc_h_bulk_remove(struct kvm_vcpu *vcpu)
 {
@@ -660,6 +662,7 @@ long kvmppc_h_bulk_remove(struct kvm_vcpu *vcpu)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(kvmppc_h_bulk_remove);
 
 long kvmppc_h_protect(struct kvm_vcpu *vcpu, unsigned long flags,
 		      unsigned long pte_index, unsigned long avpn)
@@ -730,6 +733,7 @@ long kvmppc_h_protect(struct kvm_vcpu *vcpu, unsigned long flags,
 
 	return H_SUCCESS;
 }
+EXPORT_SYMBOL_GPL(kvmppc_h_protect);
 
 long kvmppc_h_read(struct kvm_vcpu *vcpu, unsigned long flags,
 		   unsigned long pte_index)
@@ -770,6 +774,7 @@ long kvmppc_h_read(struct kvm_vcpu *vcpu, unsigned long flags,
 	}
 	return H_SUCCESS;
 }
+EXPORT_SYMBOL_GPL(kvmppc_h_read);
 
 long kvmppc_h_clear_ref(struct kvm_vcpu *vcpu, unsigned long flags,
 			unsigned long pte_index)
@@ -818,6 +823,7 @@ long kvmppc_h_clear_ref(struct kvm_vcpu *vcpu, unsigned long flags,
 	unlock_hpte(hpte, v & ~HPTE_V_HVLOCK);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(kvmppc_h_clear_ref);
 
 long kvmppc_h_clear_mod(struct kvm_vcpu *vcpu, unsigned long flags,
 			unsigned long pte_index)
@@ -865,6 +871,7 @@ long kvmppc_h_clear_mod(struct kvm_vcpu *vcpu, unsigned long flags,
 	unlock_hpte(hpte, v & ~HPTE_V_HVLOCK);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(kvmppc_h_clear_mod);
 
 static int kvmppc_get_hpa(struct kvm_vcpu *vcpu, unsigned long mmu_seq,
 			  unsigned long gpa, int writing, unsigned long *hpa,
@@ -1283,3 +1290,4 @@ long kvmppc_hpte_hv_fault(struct kvm_vcpu *vcpu, unsigned long addr,
 
 	return -1;		/* send fault up to host kernel mode */
 }
+EXPORT_SYMBOL_GPL(kvmppc_hpte_hv_fault);
-- 
2.23.0

