Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3583B0283
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 13:14:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8P0x4dtCz3dnd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 21:14:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=KJn6Ax6m;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KJn6Ax6m; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8Ngy2BBzz3cBc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 20:59:26 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id q192so9541967pfc.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 03:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V/olZtN5a/zQsNz7FyTzfOAhzC9rkOB1Pnt1p9gafZ4=;
 b=KJn6Ax6mQybKwB6CGL9UnDfbTshhvN2bEVBoJnl70W+gS/8W7NTTNTGcEGLfT8oBYM
 gnDvK8RX4H4jK7H+aiRzVvckNX9Rw0+R+kCVy9cdoU7YVvEwNlIgnRIww6qOtcBpKbk3
 3ggjyDvJJX2yjEKzehQbC9YtfPt5IazAUz0rVyFzDfe2Q0LfSv5hunBGv3Ffmk+20nng
 9naTBKIM/Z0YfAPh1SXJOvWcF3AKUfszVx6+xhDC3ft5/yJrLmTqvwevB7NY9puxTrSJ
 e9Ep8H03/kT95r5SCcVrge4itiAcxMaLUUsjVefpach83GXFZXwjU1RoN0lDV3dSOGmq
 ws+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V/olZtN5a/zQsNz7FyTzfOAhzC9rkOB1Pnt1p9gafZ4=;
 b=m772Bjx8HM6BRbXF/VAk+IwQxpHhAb1vOHPTFcYvlchH366uscvdPlX3iQl7+VD7bj
 bpVjbwUyZZmCMYQweK2ukL+rIhNXdw9sMFzefRTWwVKNIJw0Tug+Sx68yVc3Yk8kXfof
 cUaHB8cBrYgZJyngSag8q32s8Cgs3j5uREKA8a2wINWrY4dc6PF+Y33SFu7tut15HJBF
 kCvO0Tdd4baZ+TzES37ihvR9zGv0sRdiyziwGsWA7Ks9ipa+29xP6+6RqlJHrK0rjC8Y
 f35RmVGuWG1JeTxN7EJjcgG4Ra5wSKKUgd8PIxInmy47R3FDbgPWNfBpZA3dGWkKonKr
 3RKg==
X-Gm-Message-State: AOAM532cqmf+d9NKqyhBfEMCvNsjEjKuX4qluOkAAr4pt6WEF2BJnt1h
 Ylik3NiX07laG4KBsZ+nll+7M+uEL1c=
X-Google-Smtp-Source: ABdhPJxVC+9f7NntxdFzndvgi/H3c8jERHwqhDGfJ3zmCQcsLXvpv0y0i9792tpgOfsNJ2T74ox7PA==
X-Received: by 2002:a63:e14:: with SMTP id d20mr3286736pgl.35.1624359563316;
 Tue, 22 Jun 2021 03:59:23 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id l6sm5623621pgh.34.2021.06.22.03.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 03:59:22 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 36/43] KVM: PPC: Book3S HV P9: Use Linux SPR save/restore
 to manage some host SPRs
Date: Tue, 22 Jun 2021 20:57:29 +1000
Message-Id: <20210622105736.633352-37-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210622105736.633352-1-npiggin@gmail.com>
References: <20210622105736.633352-1-npiggin@gmail.com>
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

Linux implements SPR save/restore including storage space for registers
in the task struct for process context switching. Make use of this
similarly to the way we make use of the context switching fp/vec save
restore.

This improves code reuse, allows some stack space to be saved, and helps
with avoiding VRSAVE updates if they are not required.

-61 cycles (6620) POWER9 virt-mode NULL hcall

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/switch_to.h  |  2 +
 arch/powerpc/kernel/process.c         |  6 ++
 arch/powerpc/kvm/book3s_hv.c          | 22 +------
 arch/powerpc/kvm/book3s_hv.h          |  3 -
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 88 +++++++++++++++++++--------
 5 files changed, 72 insertions(+), 49 deletions(-)

diff --git a/arch/powerpc/include/asm/switch_to.h b/arch/powerpc/include/asm/switch_to.h
index 9d1fbd8be1c7..de17c45314bc 100644
--- a/arch/powerpc/include/asm/switch_to.h
+++ b/arch/powerpc/include/asm/switch_to.h
@@ -112,6 +112,8 @@ static inline void clear_task_ebb(struct task_struct *t)
 #endif
 }
 
+void kvmppc_save_current_sprs(void);
+
 extern int set_thread_tidr(struct task_struct *t);
 
 #endif /* _ASM_POWERPC_SWITCH_TO_H */
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index dfce089ac424..29b8fd9704be 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1175,6 +1175,12 @@ static inline void save_sprs(struct thread_struct *t)
 #endif
 }
 
+void kvmppc_save_current_sprs(void)
+{
+	save_sprs(&current->thread);
+}
+EXPORT_SYMBOL_GPL(kvmppc_save_current_sprs);
+
 static inline void restore_sprs(struct thread_struct *old_thread,
 				struct thread_struct *new_thread)
 {
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 2430725f29f7..c7cf771d3351 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4410,9 +4410,6 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 	struct kvm_run *run = vcpu->run;
 	int r;
 	int srcu_idx;
-	unsigned long ebb_regs[3] = {};	/* shut up GCC */
-	unsigned long user_tar = 0;
-	unsigned int user_vrsave;
 	struct kvm *kvm;
 	unsigned long msr;
 
@@ -4473,14 +4470,7 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 
 	save_user_regs_kvm();
 
-	/* Save userspace EBB and other register values */
-	if (cpu_has_feature(CPU_FTR_ARCH_207S)) {
-		ebb_regs[0] = mfspr(SPRN_EBBHR);
-		ebb_regs[1] = mfspr(SPRN_EBBRR);
-		ebb_regs[2] = mfspr(SPRN_BESCR);
-		user_tar = mfspr(SPRN_TAR);
-	}
-	user_vrsave = mfspr(SPRN_VRSAVE);
+	kvmppc_save_current_sprs();
 
 	vcpu->arch.waitp = &vcpu->arch.vcore->wait;
 	vcpu->arch.pgdir = kvm->mm->pgd;
@@ -4521,17 +4511,9 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 		}
 	} while (is_kvmppc_resume_guest(r));
 
-	/* Restore userspace EBB and other register values */
-	if (cpu_has_feature(CPU_FTR_ARCH_207S)) {
-		mtspr(SPRN_EBBHR, ebb_regs[0]);
-		mtspr(SPRN_EBBRR, ebb_regs[1]);
-		mtspr(SPRN_BESCR, ebb_regs[2]);
-		mtspr(SPRN_TAR, user_tar);
-	}
-	mtspr(SPRN_VRSAVE, user_vrsave);
-
 	vcpu->arch.state = KVMPPC_VCPU_NOTREADY;
 	atomic_dec(&kvm->arch.vcpus_running);
+
 	return r;
 }
 
diff --git a/arch/powerpc/kvm/book3s_hv.h b/arch/powerpc/kvm/book3s_hv.h
index 72e3a8f4c2cf..c7ad1127462d 100644
--- a/arch/powerpc/kvm/book3s_hv.h
+++ b/arch/powerpc/kvm/book3s_hv.h
@@ -3,11 +3,8 @@
  * Privileged (non-hypervisor) host registers to save.
  */
 struct p9_host_os_sprs {
-	unsigned long dscr;
-	unsigned long tidr;
 	unsigned long iamr;
 	unsigned long amr;
-	unsigned long fscr;
 
 	unsigned int pmc1;
 	unsigned int pmc2;
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 653f2765a399..55286a8357f7 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -217,15 +217,26 @@ EXPORT_SYMBOL_GPL(switch_pmu_to_host);
 static void load_spr_state(struct kvm_vcpu *vcpu,
 				struct p9_host_os_sprs *host_os_sprs)
 {
+	/* TAR is very fast */
 	mtspr(SPRN_TAR, vcpu->arch.tar);
 
+#ifdef CONFIG_ALTIVEC
+	if (cpu_has_feature(CPU_FTR_ALTIVEC) &&
+	    current->thread.vrsave != vcpu->arch.vrsave)
+		mtspr(SPRN_VRSAVE, vcpu->arch.vrsave);
+#endif
+
 	if (vcpu->arch.hfscr & HFSCR_EBB) {
-		mtspr(SPRN_EBBHR, vcpu->arch.ebbhr);
-		mtspr(SPRN_EBBRR, vcpu->arch.ebbrr);
-		mtspr(SPRN_BESCR, vcpu->arch.bescr);
+		if (current->thread.ebbhr != vcpu->arch.ebbhr)
+			mtspr(SPRN_EBBHR, vcpu->arch.ebbhr);
+		if (current->thread.ebbrr != vcpu->arch.ebbrr)
+			mtspr(SPRN_EBBRR, vcpu->arch.ebbrr);
+		if (current->thread.bescr != vcpu->arch.bescr)
+			mtspr(SPRN_BESCR, vcpu->arch.bescr);
 	}
 
-	if (!cpu_has_feature(CPU_FTR_ARCH_31))
+	if (!cpu_has_feature(CPU_FTR_ARCH_31) &&
+			current->thread.tidr != vcpu->arch.tid)
 		mtspr(SPRN_TIDR, vcpu->arch.tid);
 	if (host_os_sprs->iamr != vcpu->arch.iamr)
 		mtspr(SPRN_IAMR, vcpu->arch.iamr);
@@ -233,9 +244,9 @@ static void load_spr_state(struct kvm_vcpu *vcpu,
 		mtspr(SPRN_AMR, vcpu->arch.amr);
 	if (vcpu->arch.uamor != 0)
 		mtspr(SPRN_UAMOR, vcpu->arch.uamor);
-	if (host_os_sprs->fscr != vcpu->arch.fscr)
+	if (current->thread.fscr != vcpu->arch.fscr)
 		mtspr(SPRN_FSCR, vcpu->arch.fscr);
-	if (host_os_sprs->dscr != vcpu->arch.dscr)
+	if (current->thread.dscr != vcpu->arch.dscr)
 		mtspr(SPRN_DSCR, vcpu->arch.dscr);
 	if (vcpu->arch.pspb != 0)
 		mtspr(SPRN_PSPB, vcpu->arch.pspb);
@@ -255,18 +266,15 @@ static void store_spr_state(struct kvm_vcpu *vcpu)
 {
 	vcpu->arch.tar = mfspr(SPRN_TAR);
 
+#ifdef CONFIG_ALTIVEC
+	if (cpu_has_feature(CPU_FTR_ALTIVEC))
+		vcpu->arch.vrsave = mfspr(SPRN_VRSAVE);
+#endif
+
 	if (vcpu->arch.hfscr & HFSCR_EBB) {
 		vcpu->arch.ebbhr = mfspr(SPRN_EBBHR);
 		vcpu->arch.ebbrr = mfspr(SPRN_EBBRR);
 		vcpu->arch.bescr = mfspr(SPRN_BESCR);
-		/*
-		 * This is like load_fp in context switching, turn off the
-		 * facility after it wraps the u8 to try avoiding saving
-		 * and restoring the registers each partition switch.
-		 */
-		vcpu->arch.load_ebb++;
-		if (!vcpu->arch.load_ebb)
-			vcpu->arch.hfscr &= ~HFSCR_EBB;
 	}
 
 	if (!cpu_has_feature(CPU_FTR_ARCH_31))
@@ -303,7 +311,6 @@ void load_vcpu_state(struct kvm_vcpu *vcpu,
 #ifdef CONFIG_ALTIVEC
 	load_vr_state(&vcpu->arch.vr);
 #endif
-	mtspr(SPRN_VRSAVE, vcpu->arch.vrsave);
 }
 EXPORT_SYMBOL_GPL(load_vcpu_state);
 
@@ -315,7 +322,6 @@ void store_vcpu_state(struct kvm_vcpu *vcpu)
 #ifdef CONFIG_ALTIVEC
 	store_vr_state(&vcpu->arch.vr);
 #endif
-	vcpu->arch.vrsave = mfspr(SPRN_VRSAVE);
 
 	if ((cpu_has_feature(CPU_FTR_TM) ||
 	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST)) &&
@@ -337,12 +343,8 @@ EXPORT_SYMBOL_GPL(store_vcpu_state);
 
 void save_p9_host_os_sprs(struct p9_host_os_sprs *host_os_sprs)
 {
-	if (!cpu_has_feature(CPU_FTR_ARCH_31))
-		host_os_sprs->tidr = mfspr(SPRN_TIDR);
 	host_os_sprs->iamr = mfspr(SPRN_IAMR);
 	host_os_sprs->amr = mfspr(SPRN_AMR);
-	host_os_sprs->fscr = mfspr(SPRN_FSCR);
-	host_os_sprs->dscr = mfspr(SPRN_DSCR);
 }
 EXPORT_SYMBOL_GPL(save_p9_host_os_sprs);
 
@@ -350,26 +352,60 @@ EXPORT_SYMBOL_GPL(save_p9_host_os_sprs);
 void restore_p9_host_os_sprs(struct kvm_vcpu *vcpu,
 				    struct p9_host_os_sprs *host_os_sprs)
 {
+	/*
+	 * current->thread.xxx registers must all be restored to host
+	 * values before a potential context switch, othrewise the context
+	 * switch itself will overwrite current->thread.xxx with the values
+	 * from the guest SPRs.
+	 */
+
 	mtspr(SPRN_SPRG_VDSO_WRITE, local_paca->sprg_vdso);
 
-	if (!cpu_has_feature(CPU_FTR_ARCH_31))
-		mtspr(SPRN_TIDR, host_os_sprs->tidr);
+	if (!cpu_has_feature(CPU_FTR_ARCH_31) &&
+			current->thread.tidr != vcpu->arch.tid)
+		mtspr(SPRN_TIDR, current->thread.tidr);
 	if (host_os_sprs->iamr != vcpu->arch.iamr)
 		mtspr(SPRN_IAMR, host_os_sprs->iamr);
 	if (vcpu->arch.uamor != 0)
 		mtspr(SPRN_UAMOR, 0);
 	if (host_os_sprs->amr != vcpu->arch.amr)
 		mtspr(SPRN_AMR, host_os_sprs->amr);
-	if (host_os_sprs->fscr != vcpu->arch.fscr)
-		mtspr(SPRN_FSCR, host_os_sprs->fscr);
-	if (host_os_sprs->dscr != vcpu->arch.dscr)
-		mtspr(SPRN_DSCR, host_os_sprs->dscr);
+	if (current->thread.fscr != vcpu->arch.fscr)
+		mtspr(SPRN_FSCR, current->thread.fscr);
+	if (current->thread.dscr != vcpu->arch.dscr)
+		mtspr(SPRN_DSCR, current->thread.dscr);
 	if (vcpu->arch.pspb != 0)
 		mtspr(SPRN_PSPB, 0);
 
 	/* Save guest CTRL register, set runlatch to 1 */
 	if (!(vcpu->arch.ctrl & 1))
 		mtspr(SPRN_CTRLT, 1);
+
+#ifdef CONFIG_ALTIVEC
+	if (cpu_has_feature(CPU_FTR_ALTIVEC) &&
+	    vcpu->arch.vrsave != current->thread.vrsave)
+		mtspr(SPRN_VRSAVE, current->thread.vrsave);
+#endif
+	if (vcpu->arch.hfscr & HFSCR_EBB) {
+		if (vcpu->arch.bescr != current->thread.bescr)
+			mtspr(SPRN_BESCR, current->thread.bescr);
+		if (vcpu->arch.ebbhr != current->thread.ebbhr)
+			mtspr(SPRN_EBBHR, current->thread.ebbhr);
+		if (vcpu->arch.ebbrr != current->thread.ebbrr)
+			mtspr(SPRN_EBBRR, current->thread.ebbrr);
+
+		/*
+		 * This is like load_fp in context switching, turn off the
+		 * facility after it wraps the u8 to try avoiding saving
+		 * and restoring the registers each partition switch.
+		 */
+		vcpu->arch.load_ebb++;
+		if (!vcpu->arch.load_ebb)
+			vcpu->arch.hfscr &= ~HFSCR_EBB;
+	}
+
+	if (vcpu->arch.tar != current->thread.tar)
+		mtspr(SPRN_TAR, current->thread.tar);
 }
 EXPORT_SYMBOL_GPL(restore_p9_host_os_sprs);
 
-- 
2.23.0

