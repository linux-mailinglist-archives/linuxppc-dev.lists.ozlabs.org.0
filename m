Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2346501FC0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 02:45:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kfd0V3KSWz3bq9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 10:45:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=FuTYBhDI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--seanjc.bounces.google.com
 (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com;
 envelope-from=3xr9yygykdmezlhuqjnvvnsl.jvtspu14wwj-kl2spz0z.v6shiz.vyn@flex--seanjc.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=FuTYBhDI; dkim-atps=neutral
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [IPv6:2607:f8b0:4864:20::549])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kfcyc1jcVz2yhD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Apr 2022 10:43:52 +1000 (AEST)
Received: by mail-pg1-x549.google.com with SMTP id
 78-20020a630651000000b0039d993c3c55so3473379pgg.14
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Apr 2022 17:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=VDBBxbRymwn99ifXkPvrfvP8JeLntCySB5qG2FLdHGc=;
 b=FuTYBhDITxI66Qxt5+87xMlO2q0C9iJXI9s7fddQAntJKNcZhy4i5CX3Vpr1K7b1gG
 lpGYjjhgm/CKQjYxIZBLOAlu6Wf9zZOr5BTnS1Mm46MrfyyFviEAqnWwqxLbNvwWcsyf
 JvdoNGNXJ/6sDa03DP7PftstcK+dADaHLntSvUANgU/0B4isfM6BZs4hWPzvL2xkAlhB
 CUMjlksohwVrJztO8x/MgujxI4iPE/ysUfovmABWThXxb2g+rlV8zXfjr6a4wKFGQQ8A
 2BioePglRBUYrzqDp/34X5DBOonLRTI2L6fETCpuSbqRp5Wtv6N/vgi4/Y0xhSy1jDZu
 aMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=VDBBxbRymwn99ifXkPvrfvP8JeLntCySB5qG2FLdHGc=;
 b=6dySolxvvdVA5agad1q5463FnLMFzpUDVp9Vyof6hhOiv1Di446TQfyPfuA130NTZd
 J2gnaFrlz94NDKNB+ua65UnQC20V1dzg3iMhI6RnJ0fAQEFfrhqaupL8i584FObRki9/
 Jy3dajCXyHn+HQmUNMskFieMq0/5RSxKFOWdvaopViTG0b69GINcYRd2j4rOPzJ0jU5W
 y97G6bCoHgP7LD2QNTL2KjbJNtdM2IqkDza/4Kf4EDmF6bHl0A7wvSy5cnCHHZ55ghND
 y7UVtLZLVYBOprT8A4I55x6pY3+esk93Kz8j/KIad8zpHMwn3tUVw88UUGnM+2Z8nprc
 Ae5Q==
X-Gm-Message-State: AOAM530me8S1jjKItZjbCMCDeYF9Tk+Y1yOiAeEVrFKo3fFfopzYxRep
 TMakCv/OwNySgb9kVgm1+KVTJrssOqc=
X-Google-Smtp-Source: ABdhPJxWvnh9vGPdu8WwNvP/XothzcdXxz8DVteSxV4BWZ39Cw9eF09ZeKITExpxjd/oejtHjB373C4/RJY=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:1a90:b0:506:1e27:a579
 with SMTP id
 e16-20020a056a001a9000b005061e27a579mr6426109pfv.46.1649983430118; Thu, 14
 Apr 2022 17:43:50 -0700 (PDT)
Date: Fri, 15 Apr 2022 00:43:42 +0000
In-Reply-To: <20220415004343.2203171-1-seanjc@google.com>
Message-Id: <20220415004343.2203171-3-seanjc@google.com>
Mime-Version: 1.0
References: <20220415004343.2203171-1-seanjc@google.com>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
Subject: [PATCH 2/3] KVM: RISC-V: Use kvm_vcpu.srcu_idx, drop RISC-V's
 unnecessary copy
From: Sean Christopherson <seanjc@google.com>
To: Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
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
Cc: Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, Sean Christopherson <seanjc@google.com>,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, Jim Mattson <jmattson@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use the generic kvm_vcpu's srcu_idx instead of using an indentical field
in RISC-V's version of kvm_vcpu_arch.  Generic KVM very intentionally
does not touch vcpu->srcu_idx, i.e. there's zero chance of running afoul
of common code.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/riscv/include/asm/kvm_host.h |  3 ---
 arch/riscv/kvm/vcpu.c             | 16 ++++++++--------
 arch/riscv/kvm/vcpu_exit.c        |  4 ++--
 3 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 78da839657e5..cd4bbcecb0fb 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -193,9 +193,6 @@ struct kvm_vcpu_arch {
 
 	/* Don't run the VCPU (blocked) */
 	bool pause;
-
-	/* SRCU lock index for in-kernel run loop */
-	int srcu_idx;
 };
 
 static inline void kvm_arch_hardware_unsetup(void) {}
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 6785aef4cbd4..2f1caf23eed4 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -724,13 +724,13 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 	/* Mark this VCPU ran at least once */
 	vcpu->arch.ran_atleast_once = true;
 
-	vcpu->arch.srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
+	vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
 
 	/* Process MMIO value returned from user-space */
 	if (run->exit_reason == KVM_EXIT_MMIO) {
 		ret = kvm_riscv_vcpu_mmio_return(vcpu, vcpu->run);
 		if (ret) {
-			srcu_read_unlock(&vcpu->kvm->srcu, vcpu->arch.srcu_idx);
+			srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
 			return ret;
 		}
 	}
@@ -739,13 +739,13 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 	if (run->exit_reason == KVM_EXIT_RISCV_SBI) {
 		ret = kvm_riscv_vcpu_sbi_return(vcpu, vcpu->run);
 		if (ret) {
-			srcu_read_unlock(&vcpu->kvm->srcu, vcpu->arch.srcu_idx);
+			srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
 			return ret;
 		}
 	}
 
 	if (run->immediate_exit) {
-		srcu_read_unlock(&vcpu->kvm->srcu, vcpu->arch.srcu_idx);
+		srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
 		return -EINTR;
 	}
 
@@ -784,7 +784,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		 */
 		vcpu->mode = IN_GUEST_MODE;
 
-		srcu_read_unlock(&vcpu->kvm->srcu, vcpu->arch.srcu_idx);
+		srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
 		smp_mb__after_srcu_read_unlock();
 
 		/*
@@ -802,7 +802,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 			vcpu->mode = OUTSIDE_GUEST_MODE;
 			local_irq_enable();
 			preempt_enable();
-			vcpu->arch.srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
+			vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
 			continue;
 		}
 
@@ -846,7 +846,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 
 		preempt_enable();
 
-		vcpu->arch.srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
+		vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
 
 		ret = kvm_riscv_vcpu_exit(vcpu, run, &trap);
 	}
@@ -855,7 +855,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 
 	vcpu_put(vcpu);
 
-	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->arch.srcu_idx);
+	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
 
 	return ret;
 }
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index aa8af129e4bb..2d56faddb9d1 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -456,9 +456,9 @@ static int stage2_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 void kvm_riscv_vcpu_wfi(struct kvm_vcpu *vcpu)
 {
 	if (!kvm_arch_vcpu_runnable(vcpu)) {
-		srcu_read_unlock(&vcpu->kvm->srcu, vcpu->arch.srcu_idx);
+		srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
 		kvm_vcpu_halt(vcpu);
-		vcpu->arch.srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
+		vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
 		kvm_clear_request(KVM_REQ_UNHALT, vcpu);
 	}
 }
-- 
2.36.0.rc0.470.gd361397f0d-goog

