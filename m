Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 739065BF245
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 02:40:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXKM218NGz3fWK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 10:40:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ibjIPgLF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3w1sqywykdeqykgtpimuumrk.iusrot03vvi-jk1royzy.u5rghy.uxm@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ibjIPgLF;
	dkim-atps=neutral
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXKBs5vn0z3bqw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 10:33:09 +1000 (AEST)
Received: by mail-pg1-x54a.google.com with SMTP id r126-20020a632b84000000b004393806c06eso2526340pgr.4
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 17:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date;
        bh=+E7SBXFF/pN+H28Afkv9jB+NCJ3Rw0RTn5O7MGGdbKI=;
        b=ibjIPgLF5I6AXlmJ3Q4IemgLaT/lgMJUAXwpoRB9fgiTq3B6/S+tqOgIvoh6kKlygY
         pbNwcmMitpR9SNqtrp9b0UlUojZe823krBUrhHPCFgS3r1WU+fsCuetavBekqQaizwyl
         EFFZIDW9cV9dCmoIkcWn6i3gNIeueZjT/aCM8tPasnvO2YUi4h3kS4dY21ok5rgmL3AF
         PjTT6O0p+Z0vjiTZHuvxNmTO93XcMZyv7QubeTjUc8zeBsA7+CIjxALld5d6hRcnoM5F
         zyFZVhAqUIW6q8v1obVpB2Az4u79i9Ija4UuoEBuDNhwQsJb9x2y4tydk9zYMieq2gVf
         YX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date;
        bh=+E7SBXFF/pN+H28Afkv9jB+NCJ3Rw0RTn5O7MGGdbKI=;
        b=yJPApVdmCT0W9ZB0iSfAwHKlYoal7NnyTq8oQQgDTfemW/Drgb2h43+2QrGlqjLqf6
         YJvnBBbFVSXac9cKthRVmS6BC+jOkAyGlbq2GAYtW4ryI4rOkrjacbFxZE7wC+cuRWS3
         neRd+47kY7BUWDo7d5J7iai4lX0eqIYTWgOn6RXjvG6ux2ifpWeqRb1Es9LRoPlA6Ty9
         wgM/L0kvNLLiMyJ5lVrFHBf73Wr702nVYW4rt4vgERQ2CNZCKJTpNoQO1r6CRE3WEG/S
         V9R5CnR5pKsXU23yyDvAba0ym2kmk6t1SRTApAzVmuwK6Le0+vXIyzHBvWmSySDe+pu7
         1VhQ==
X-Gm-Message-State: ACrzQf3vHwGCgkXW3bsqSMwEZOZ6hLkw16WCdbaH8UE8yRSlU1oe24Gb
	GdaSi8rySkS/nkdAraclW2FW6rUPT9A=
X-Google-Smtp-Source: AMsMyM7TuLtKOESiQvzHqCTa5KhMYj9IIW+qSKhLxtvGrcIaF1YkZxOSI6ORJl97kE9caeim7Hm4LdKYiHE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:b08b:b0:178:48b6:f5a8 with SMTP id
 p11-20020a170902b08b00b0017848b6f5a8mr2132543plr.3.1663720387879; Tue, 20 Sep
 2022 17:33:07 -0700 (PDT)
Date: Wed, 21 Sep 2022 00:32:01 +0000
In-Reply-To: <20220921003201.1441511-1-seanjc@google.com>
Mime-Version: 1.0
References: <20220921003201.1441511-1-seanjc@google.com>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
Message-ID: <20220921003201.1441511-13-seanjc@google.com>
Subject: [PATCH v4 12/12] KVM: remove KVM_REQ_UNHALT
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Suzuki K Poulose <suzuki.poulose@arm.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Maxim Levitsky <mlevitsk@redhat.com>, Alexandru Elisei <alexandru.elisei@arm.com>, kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Paolo Bonzini <pbonzini@redhat.com>

KVM_REQ_UNHALT is now unnecessary because it is replaced by the return
value of kvm_vcpu_block/kvm_vcpu_halt.  Remove it.

No functional change intended.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 Documentation/virt/kvm/vcpu-requests.rst | 28 +-----------------------
 arch/arm64/kvm/arm.c                     |  1 -
 arch/mips/kvm/emulate.c                  |  1 -
 arch/powerpc/kvm/book3s_pr.c             |  1 -
 arch/powerpc/kvm/book3s_pr_papr.c        |  1 -
 arch/powerpc/kvm/booke.c                 |  1 -
 arch/powerpc/kvm/powerpc.c               |  1 -
 arch/riscv/kvm/vcpu_insn.c               |  1 -
 arch/s390/kvm/kvm-s390.c                 |  2 --
 arch/x86/kvm/x86.c                       |  3 ---
 arch/x86/kvm/xen.c                       |  1 -
 include/linux/kvm_host.h                 |  3 +--
 virt/kvm/kvm_main.c                      |  4 +---
 13 files changed, 3 insertions(+), 45 deletions(-)

diff --git a/Documentation/virt/kvm/vcpu-requests.rst b/Documentation/virt/kvm/vcpu-requests.rst
index 31f62b64e07b..87f04c1fa53d 100644
--- a/Documentation/virt/kvm/vcpu-requests.rst
+++ b/Documentation/virt/kvm/vcpu-requests.rst
@@ -97,7 +97,7 @@ VCPU requests are simply bit indices of the ``vcpu->requests`` bitmap.
 This means general bitops, like those documented in [atomic-ops]_ could
 also be used, e.g. ::
 
-  clear_bit(KVM_REQ_UNHALT & KVM_REQUEST_MASK, &vcpu->requests);
+  clear_bit(KVM_REQ_UNBLOCK & KVM_REQUEST_MASK, &vcpu->requests);
 
 However, VCPU request users should refrain from doing so, as it would
 break the abstraction.  The first 8 bits are reserved for architecture
@@ -126,17 +126,6 @@ KVM_REQ_UNBLOCK
   or in order to update the interrupt routing and ensure that assigned
   devices will wake up the vCPU.
 
-KVM_REQ_UNHALT
-
-  This request may be made from the KVM common function kvm_vcpu_block(),
-  which is used to emulate an instruction that causes a CPU to halt until
-  one of an architectural specific set of events and/or interrupts is
-  received (determined by checking kvm_arch_vcpu_runnable()).  When that
-  event or interrupt arrives kvm_vcpu_block() makes the request.  This is
-  in contrast to when kvm_vcpu_block() returns due to any other reason,
-  such as a pending signal, which does not indicate the VCPU's halt
-  emulation should stop, and therefore does not make the request.
-
 KVM_REQ_OUTSIDE_GUEST_MODE
 
   This "request" ensures the target vCPU has exited guest mode prior to the
@@ -297,21 +286,6 @@ architecture dependent.  kvm_vcpu_block() calls kvm_arch_vcpu_runnable()
 to check if it should awaken.  One reason to do so is to provide
 architectures a function where requests may be checked if necessary.
 
-Clearing Requests
------------------
-
-Generally it only makes sense for the receiving VCPU thread to clear a
-request.  However, in some circumstances, such as when the requesting
-thread and the receiving VCPU thread are executed serially, such as when
-they are the same thread, or when they are using some form of concurrency
-control to temporarily execute synchronously, then it's possible to know
-that the request may be cleared immediately, rather than waiting for the
-receiving VCPU thread to handle the request in VCPU RUN.  The only current
-examples of this are kvm_vcpu_block() calls made by VCPUs to block
-themselves.  A possible side-effect of that call is to make the
-KVM_REQ_UNHALT request, which may then be cleared immediately when the
-VCPU returns from the call.
-
 References
 ==========
 
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 2ff0ef62abad..4f949b64fdc9 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -666,7 +666,6 @@ void kvm_vcpu_wfi(struct kvm_vcpu *vcpu)
 
 	kvm_vcpu_halt(vcpu);
 	vcpu_clear_flag(vcpu, IN_WFIT);
-	kvm_clear_request(KVM_REQ_UNHALT, vcpu);
 
 	preempt_disable();
 	vgic_v4_load(vcpu);
diff --git a/arch/mips/kvm/emulate.c b/arch/mips/kvm/emulate.c
index 1d7c56defe93..edaec93a1a1f 100644
--- a/arch/mips/kvm/emulate.c
+++ b/arch/mips/kvm/emulate.c
@@ -958,7 +958,6 @@ enum emulation_result kvm_mips_emul_wait(struct kvm_vcpu *vcpu)
 		 * We are runnable, then definitely go off to user space to
 		 * check if any I/O interrupts are pending.
 		 */
-		kvm_clear_request(KVM_REQ_UNHALT, vcpu);
 		if (kvm_arch_vcpu_runnable(vcpu))
 			vcpu->run->exit_reason = KVM_EXIT_IRQ_WINDOW_OPEN;
 	}
diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index d6abed6e51e6..9fc4dd8f66eb 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -499,7 +499,6 @@ static void kvmppc_set_msr_pr(struct kvm_vcpu *vcpu, u64 msr)
 	if (msr & MSR_POW) {
 		if (!vcpu->arch.pending_exceptions) {
 			kvm_vcpu_halt(vcpu);
-			kvm_clear_request(KVM_REQ_UNHALT, vcpu);
 			vcpu->stat.generic.halt_wakeup++;
 
 			/* Unset POW bit after we woke up */
diff --git a/arch/powerpc/kvm/book3s_pr_papr.c b/arch/powerpc/kvm/book3s_pr_papr.c
index a1f2978b2a86..b2c89e850d7a 100644
--- a/arch/powerpc/kvm/book3s_pr_papr.c
+++ b/arch/powerpc/kvm/book3s_pr_papr.c
@@ -393,7 +393,6 @@ int kvmppc_h_pr(struct kvm_vcpu *vcpu, unsigned long cmd)
 	case H_CEDE:
 		kvmppc_set_msr_fast(vcpu, kvmppc_get_msr(vcpu) | MSR_EE);
 		kvm_vcpu_halt(vcpu);
-		kvm_clear_request(KVM_REQ_UNHALT, vcpu);
 		vcpu->stat.generic.halt_wakeup++;
 		return EMULATE_DONE;
 	case H_LOGICAL_CI_LOAD:
diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index 06c5830a93f9..7b4920e9fd26 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -719,7 +719,6 @@ int kvmppc_core_prepare_to_enter(struct kvm_vcpu *vcpu)
 	if (vcpu->arch.shared->msr & MSR_WE) {
 		local_irq_enable();
 		kvm_vcpu_halt(vcpu);
-		kvm_clear_request(KVM_REQ_UNHALT, vcpu);
 		hard_irq_disable();
 
 		kvmppc_set_exit_type(vcpu, EMULATED_MTMSRWE_EXITS);
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index fb1490761c87..ec9c1e3c2ff4 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -239,7 +239,6 @@ int kvmppc_kvm_pv(struct kvm_vcpu *vcpu)
 	case EV_HCALL_TOKEN(EV_IDLE):
 		r = EV_SUCCESS;
 		kvm_vcpu_halt(vcpu);
-		kvm_clear_request(KVM_REQ_UNHALT, vcpu);
 		break;
 	default:
 		r = EV_UNIMPLEMENTED;
diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index 7eb90a47b571..0bb52761a3f7 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -191,7 +191,6 @@ void kvm_riscv_vcpu_wfi(struct kvm_vcpu *vcpu)
 		kvm_vcpu_srcu_read_unlock(vcpu);
 		kvm_vcpu_halt(vcpu);
 		kvm_vcpu_srcu_read_lock(vcpu);
-		kvm_clear_request(KVM_REQ_UNHALT, vcpu);
 	}
 }
 
diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index edfd4bbd0cba..aa39ea4582bd 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -4343,8 +4343,6 @@ static int kvm_s390_handle_requests(struct kvm_vcpu *vcpu)
 		goto retry;
 	}
 
-	/* nothing to do, just clear the request */
-	kvm_clear_request(KVM_REQ_UNHALT, vcpu);
 	/* we left the vsie handler, nothing to do, just clear the request */
 	kvm_clear_request(KVM_REQ_VSIE_RESTART, vcpu);
 
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 8b1ff7e91ecb..8927f37a07c9 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10811,8 +10811,6 @@ static inline int vcpu_block(struct kvm_vcpu *vcpu)
 		if (hv_timer)
 			kvm_lapic_switch_to_hv_timer(vcpu);
 
-		kvm_clear_request(KVM_REQ_UNHALT, vcpu);
-
 		/*
 		 * If the vCPU is not runnable, a signal or another host event
 		 * of some kind is pending; service it without changing the
@@ -11032,7 +11030,6 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 			r = 0;
 			goto out;
 		}
-		kvm_clear_request(KVM_REQ_UNHALT, vcpu);
 		r = -EAGAIN;
 		if (signal_pending(current)) {
 			r = -EINTR;
diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
index 280cb5dc7341..93c628d3e3a9 100644
--- a/arch/x86/kvm/xen.c
+++ b/arch/x86/kvm/xen.c
@@ -1065,7 +1065,6 @@ static bool kvm_xen_schedop_poll(struct kvm_vcpu *vcpu, bool longmode,
 			del_timer(&vcpu->arch.xen.poll_timer);
 
 		vcpu->arch.mp_state = KVM_MP_STATE_RUNNABLE;
-		kvm_clear_request(KVM_REQ_UNHALT, vcpu);
 	}
 
 	vcpu->arch.xen.poll_evtchn = 0;
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 04c7e5f2f727..32f259fa5801 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -151,12 +151,11 @@ static inline bool is_error_page(struct page *page)
 #define KVM_REQUEST_NO_ACTION      BIT(10)
 /*
  * Architecture-independent vcpu->requests bit members
- * Bits 4-7 are reserved for more arch-independent bits.
+ * Bits 3-7 are reserved for more arch-independent bits.
  */
 #define KVM_REQ_TLB_FLUSH         (0 | KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
 #define KVM_REQ_VM_DEAD           (1 | KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
 #define KVM_REQ_UNBLOCK           2
-#define KVM_REQ_UNHALT            3
 #define KVM_REQUEST_ARCH_BASE     8
 
 /*
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index dcf47da44844..26383e63d9dd 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3409,10 +3409,8 @@ static int kvm_vcpu_check_block(struct kvm_vcpu *vcpu)
 	int ret = -EINTR;
 	int idx = srcu_read_lock(&vcpu->kvm->srcu);
 
-	if (kvm_arch_vcpu_runnable(vcpu)) {
-		kvm_make_request(KVM_REQ_UNHALT, vcpu);
+	if (kvm_arch_vcpu_runnable(vcpu))
 		goto out;
-	}
 	if (kvm_cpu_has_pending_timer(vcpu))
 		goto out;
 	if (signal_pending(current))
-- 
2.37.3.968.ga6b4b080e4-goog

