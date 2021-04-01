Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 754C1351626
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 17:24:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB6RS2sxNz3hdy
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 02:24:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=NuGOW17Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NuGOW17Z; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB6284b9Bz3cyx
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 02:05:52 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id
 q6-20020a17090a4306b02900c42a012202so1159565pjg.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 08:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YwgW/IzByL/GBvKynVGK4GTgGQ8KhzbkEW+bUvuKPnk=;
 b=NuGOW17Z95NM7UW1ZDDudbu0EfhpuP/PSU8Goo0KD7DH3faGBIr+5iXI8Krje3xiph
 1J4PANz9/vdQvMuqc+gb1nFStCj/2gPn6LErJxNY27OccrBiPh2zpKBL7NfQzm2DOSQK
 pSiU321ZNPlOFuhDJCe7EYZejxoNOu6HXoN4UKWpN7PohQG2ZistMkWJBlrICoMUr/p1
 FMJJOuH6jBPZ1AYAXOy2ko//0PVPdcmuufWjPKvO+AgQdBijvPOTVSoM7ED95SzDn9Md
 EHqZ/sexhh/OPK9nh/7G3KoTOG4UtVCw/L998/MYWtYZ3rZHR48+RjZ+hMHzhLIKlwB6
 7yPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YwgW/IzByL/GBvKynVGK4GTgGQ8KhzbkEW+bUvuKPnk=;
 b=GWr2Qu7TNmR2+DV+JO0YZDzwejT3WuAtc1OX4cQ4dGQIZlaNhMPHELHGffM7aMbqSJ
 WW3NBCxCIoTXEduN4I8KQOZRjmqGJSrp7Y+1E3/uq+wcEYnh6Qotqxg/zHGxWRB4NH15
 BKtYDGID1AJav2CJmUUaXH7AFLf1Ukr07+iZn6vL1tNfp4aYKyJJX1/3q0emi/3/bal0
 rQdM1JKCqH8l62PUQXBmKxBYWuq95vmCvxeymh+0blK+gOP+617Bh847VUvkxkLY9B3c
 RyzosHNgs3R343WUk7SG2jcAHMofA8OKfcRSzZKcuMUIYlRStv9lzfTdzv9a61F0SrNY
 NOkw==
X-Gm-Message-State: AOAM530HA7DxNBssAU4y5EPb3IzVN69SRS+YW8pO0b2lCwFiEPV8rn6/
 ST5o0jLfJTF4dY65Lc5hhOiDkJrGK+s=
X-Google-Smtp-Source: ABdhPJxIkLjvr3J9eeahEj0+LLQ0o6+LMnTTsxftpSBra9QthDyWfB7zjjhSr9Rpat/AdVRa3Vrbag==
X-Received: by 2002:a17:90a:29e4:: with SMTP id
 h91mr9101208pjd.225.1617289551003; 
 Thu, 01 Apr 2021 08:05:51 -0700 (PDT)
Received: from bobo.ibm.com ([1.128.218.207])
 by smtp.gmail.com with ESMTPSA id l3sm5599632pju.44.2021.04.01.08.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 08:05:50 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v5 45/48] KVM: PPC: Book3S HV: add virtual mode handlers for
 HPT hcalls and page faults
Date: Fri,  2 Apr 2021 01:03:22 +1000
Message-Id: <20210401150325.442125-46-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210401150325.442125-1-npiggin@gmail.com>
References: <20210401150325.442125-1-npiggin@gmail.com>
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
 arch/powerpc/kvm/book3s_hv.c        | 126 ++++++++++++++++++++++++++--
 arch/powerpc/kvm/book3s_hv_rm_mmu.c |   8 ++
 2 files changed, 127 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 8416ec0d88bc..6b34cd81000e 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -937,6 +937,52 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
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
@@ -1136,6 +1182,7 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
 	default:
 		return RESUME_HOST;
 	}
+	WARN_ON_ONCE(ret == H_TOO_HARD);
 	kvmppc_set_gpr(vcpu, 3, ret);
 	vcpu->arch.hcall_needed = 0;
 	return RESUME_GUEST;
@@ -1443,19 +1490,84 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 	 * host page has been paged out.  Any other HDSI/HISI interrupts
 	 * have been handled already.
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
+		if (kvm_is_radix(vcpu->kvm)) {
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
+		if (kvm_is_radix(vcpu->kvm)) {
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
+		if (!(vcpu->arch.shregs.msr & MSR_DR))
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
index 7af7c70f1468..8cc73abbf42b 100644
--- a/arch/powerpc/kvm/book3s_hv_rm_mmu.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
@@ -409,6 +409,7 @@ long kvmppc_h_enter(struct kvm_vcpu *vcpu, unsigned long flags,
 				 vcpu->arch.pgdir, true,
 				 &vcpu->arch.regs.gpr[4]);
 }
+EXPORT_SYMBOL_GPL(kvmppc_h_enter);
 
 #ifdef __BIG_ENDIAN__
 #define LOCK_TOKEN	(*(u32 *)(&get_paca()->lock_token))
@@ -553,6 +554,7 @@ long kvmppc_h_remove(struct kvm_vcpu *vcpu, unsigned long flags,
 	return kvmppc_do_h_remove(vcpu->kvm, flags, pte_index, avpn,
 				  &vcpu->arch.regs.gpr[4]);
 }
+EXPORT_SYMBOL_GPL(kvmppc_h_remove);
 
 long kvmppc_h_bulk_remove(struct kvm_vcpu *vcpu)
 {
@@ -671,6 +673,7 @@ long kvmppc_h_bulk_remove(struct kvm_vcpu *vcpu)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(kvmppc_h_bulk_remove);
 
 long kvmppc_h_protect(struct kvm_vcpu *vcpu, unsigned long flags,
 		      unsigned long pte_index, unsigned long avpn)
@@ -741,6 +744,7 @@ long kvmppc_h_protect(struct kvm_vcpu *vcpu, unsigned long flags,
 
 	return H_SUCCESS;
 }
+EXPORT_SYMBOL_GPL(kvmppc_h_protect);
 
 long kvmppc_h_read(struct kvm_vcpu *vcpu, unsigned long flags,
 		   unsigned long pte_index)
@@ -781,6 +785,7 @@ long kvmppc_h_read(struct kvm_vcpu *vcpu, unsigned long flags,
 	}
 	return H_SUCCESS;
 }
+EXPORT_SYMBOL_GPL(kvmppc_h_read);
 
 long kvmppc_h_clear_ref(struct kvm_vcpu *vcpu, unsigned long flags,
 			unsigned long pte_index)
@@ -829,6 +834,7 @@ long kvmppc_h_clear_ref(struct kvm_vcpu *vcpu, unsigned long flags,
 	unlock_hpte(hpte, v & ~HPTE_V_HVLOCK);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(kvmppc_h_clear_ref);
 
 long kvmppc_h_clear_mod(struct kvm_vcpu *vcpu, unsigned long flags,
 			unsigned long pte_index)
@@ -876,6 +882,7 @@ long kvmppc_h_clear_mod(struct kvm_vcpu *vcpu, unsigned long flags,
 	unlock_hpte(hpte, v & ~HPTE_V_HVLOCK);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(kvmppc_h_clear_mod);
 
 static int kvmppc_get_hpa(struct kvm_vcpu *vcpu, unsigned long mmu_seq,
 			  unsigned long gpa, int writing, unsigned long *hpa,
@@ -1294,3 +1301,4 @@ long kvmppc_hpte_hv_fault(struct kvm_vcpu *vcpu, unsigned long addr,
 
 	return -1;		/* send fault up to host kernel mode */
 }
+EXPORT_SYMBOL_GPL(kvmppc_hpte_hv_fault);
-- 
2.23.0

