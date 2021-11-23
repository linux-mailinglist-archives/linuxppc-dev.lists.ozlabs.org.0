Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08236459FED
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 11:18:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz0T175Htz3gTY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 21:17:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XIBJIUuY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=XIBJIUuY; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyzxV5GGyz3cVP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 20:54:06 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id 71so2402628pgb.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J1ke/n4GvgJNDbbnXhTdOYVcP6bq/Uwp1BcjX+fO+4c=;
 b=XIBJIUuYOWauOBWrv+ugjHYkSU0tS7v+r75kQg0LC4+GV2XmEC+VvMI2lgAM+EgpcG
 01U5IO807DiUgm7yA9i9iOROe6p3+UDhLweLbqNpPavapA1N941LLQsE3a3XG4fNX1gr
 wkQ0fCIKViDuw5Omlx2Sc1IyGdlsUbKTzjnieOHqAR4emrjgncW2MEj9droGTPcovcm4
 is8ZsQPKdCmUdPPtZOxI5aOrVHe2Skzx5yBDx9BVJA5DZqgkqDD6UFTH7dY6VjBW9HRA
 1Yu5+lsC/moGAA7HhIOp9LHaBGPL1l8TbjpDl0paaW9vpEfCkPEjnfAmn5O6Usecc8VA
 2CDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J1ke/n4GvgJNDbbnXhTdOYVcP6bq/Uwp1BcjX+fO+4c=;
 b=QZ0Zu9Sg5hbNVu6RqSV5VCo4m2ozt11NWKwHgbT40CgHBRGKCv5LT1esNi6FSdjXSa
 pwYYPqcfvbmmobFUrJK655lqR66yXfJailFl4nR84cmhjidMHveciO+3EL2E9dQ7goEB
 UDeN75aSGAdw2i+H/OexuXnuDAgaZKDEjiSvxyvu5jdmHyxTsM3yw2ire+/CUB6kYhHe
 5A7FiMYuFdm1VoP5Q7WscaTkSJ0DwtttKjlVgw6Q8hgSHMGc5r26XoNC1NbH1/gpR+t8
 Ox3PpmJxWFv2Kanxe8ER2JwRKdd0Z8DR0U3caXH+n3AOrGjtgwG2rD07kTFAM4GBQfwq
 QeeQ==
X-Gm-Message-State: AOAM531QbDH+hJgcBY6VRC3/GoOM/RyjoOy43zOaGy0MdpfNKW6dXwCY
 ec2zBTPBRrAPKUiaFydNnBblEfF3Yaeq8w==
X-Google-Smtp-Source: ABdhPJxgS/oeGRp1s0mOdRkum5c5REI9L18u0cvgergomf1aWw9yPcv6pQIEiugc6lVwNv88h8U2gA==
X-Received: by 2002:a05:6a00:24c7:b0:4a0:41b:38f9 with SMTP id
 d7-20020a056a0024c700b004a0041b38f9mr3985241pfv.54.1637661244209; 
 Tue, 23 Nov 2021 01:54:04 -0800 (PST)
Received: from bobo.ibm.com ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id j8sm12662176pfc.8.2021.11.23.01.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 01:54:04 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 38/53] KVM: PPC: Book3S HV P9: Use Linux SPR save/restore
 to manage some host SPRs
Date: Tue, 23 Nov 2021 19:52:16 +1000
Message-Id: <20211123095231.1036501-39-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211123095231.1036501-1-npiggin@gmail.com>
References: <20211123095231.1036501-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Linux implements SPR save/restore including storage space for registers
in the task struct for process context switching. Make use of this
similarly to the way we make use of the context switching fp/vec save
restore.

This improves code reuse, allows some stack space to be saved, and helps
with avoiding VRSAVE updates if they are not required.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/switch_to.h  |  1 +
 arch/powerpc/kernel/process.c         |  6 ++
 arch/powerpc/kvm/book3s_hv.c          | 21 +-----
 arch/powerpc/kvm/book3s_hv.h          |  3 -
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 93 +++++++++++++++++++--------
 5 files changed, 73 insertions(+), 51 deletions(-)

diff --git a/arch/powerpc/include/asm/switch_to.h b/arch/powerpc/include/asm/switch_to.h
index e8013cd6b646..1f43ef696033 100644
--- a/arch/powerpc/include/asm/switch_to.h
+++ b/arch/powerpc/include/asm/switch_to.h
@@ -113,6 +113,7 @@ static inline void clear_task_ebb(struct task_struct *t)
 }
 
 void kvmppc_save_user_regs(void);
+void kvmppc_save_current_sprs(void);
 
 extern int set_thread_tidr(struct task_struct *t);
 
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 8f841fbe16ad..5d2333d2a283 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1182,6 +1182,12 @@ void kvmppc_save_user_regs(void)
 #endif
 }
 EXPORT_SYMBOL_GPL(kvmppc_save_user_regs);
+
+void kvmppc_save_current_sprs(void)
+{
+	save_sprs(&current->thread);
+}
+EXPORT_SYMBOL_GPL(kvmppc_save_current_sprs);
 #endif /* CONFIG_KVM_BOOK3S_HV_POSSIBLE */
 
 static inline void restore_sprs(struct thread_struct *old_thread,
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 198f6d997330..7d48aa8aebb2 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4566,9 +4566,6 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 	struct kvm_run *run = vcpu->run;
 	int r;
 	int srcu_idx;
-	unsigned long ebb_regs[3] = {};	/* shut up GCC */
-	unsigned long user_tar = 0;
-	unsigned int user_vrsave;
 	struct kvm *kvm;
 	unsigned long msr;
 
@@ -4629,14 +4626,7 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 
 	kvmppc_save_user_regs();
 
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
@@ -4677,15 +4667,6 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
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
 
diff --git a/arch/powerpc/kvm/book3s_hv.h b/arch/powerpc/kvm/book3s_hv.h
index d7485b9e9762..6b7f07d9026b 100644
--- a/arch/powerpc/kvm/book3s_hv.h
+++ b/arch/powerpc/kvm/book3s_hv.h
@@ -4,11 +4,8 @@
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
index 8499e8a9ca8f..093ac0453d91 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -231,15 +231,26 @@ EXPORT_SYMBOL_GPL(switch_pmu_to_host);
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
 
-	if (cpu_has_feature(CPU_FTR_P9_TIDR))
+	if (cpu_has_feature(CPU_FTR_P9_TIDR) &&
+			current->thread.tidr != vcpu->arch.tid)
 		mtspr(SPRN_TIDR, vcpu->arch.tid);
 	if (host_os_sprs->iamr != vcpu->arch.iamr)
 		mtspr(SPRN_IAMR, vcpu->arch.iamr);
@@ -247,9 +258,9 @@ static void load_spr_state(struct kvm_vcpu *vcpu,
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
@@ -269,20 +280,15 @@ static void store_spr_state(struct kvm_vcpu *vcpu)
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
-		if (!vcpu->arch.nested) {
-			vcpu->arch.load_ebb++;
-			if (!vcpu->arch.load_ebb)
-				vcpu->arch.hfscr &= ~HFSCR_EBB;
-		}
 	}
 
 	if (cpu_has_feature(CPU_FTR_P9_TIDR))
@@ -324,7 +330,6 @@ bool load_vcpu_state(struct kvm_vcpu *vcpu,
 #ifdef CONFIG_ALTIVEC
 	load_vr_state(&vcpu->arch.vr);
 #endif
-	mtspr(SPRN_VRSAVE, vcpu->arch.vrsave);
 
 	return ret;
 }
@@ -338,7 +343,6 @@ void store_vcpu_state(struct kvm_vcpu *vcpu)
 #ifdef CONFIG_ALTIVEC
 	store_vr_state(&vcpu->arch.vr);
 #endif
-	vcpu->arch.vrsave = mfspr(SPRN_VRSAVE);
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	if (cpu_has_feature(CPU_FTR_TM) ||
@@ -364,12 +368,8 @@ EXPORT_SYMBOL_GPL(store_vcpu_state);
 
 void save_p9_host_os_sprs(struct p9_host_os_sprs *host_os_sprs)
 {
-	if (cpu_has_feature(CPU_FTR_P9_TIDR))
-		host_os_sprs->tidr = mfspr(SPRN_TIDR);
 	host_os_sprs->iamr = mfspr(SPRN_IAMR);
 	host_os_sprs->amr = mfspr(SPRN_AMR);
-	host_os_sprs->fscr = mfspr(SPRN_FSCR);
-	host_os_sprs->dscr = mfspr(SPRN_DSCR);
 }
 EXPORT_SYMBOL_GPL(save_p9_host_os_sprs);
 
@@ -377,26 +377,63 @@ EXPORT_SYMBOL_GPL(save_p9_host_os_sprs);
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
 
-	if (cpu_has_feature(CPU_FTR_P9_TIDR))
-		mtspr(SPRN_TIDR, host_os_sprs->tidr);
+	if (cpu_has_feature(CPU_FTR_P9_TIDR) &&
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
+		if (!vcpu->arch.nested) {
+			/*
+			 * This is like load_fp in context switching, turn off
+			 * the facility after it wraps the u8 to try avoiding
+			 * saving and restoring the registers each partition
+			 * switch.
+			 */
+			vcpu->arch.load_ebb++;
+			if (!vcpu->arch.load_ebb)
+				vcpu->arch.hfscr &= ~HFSCR_EBB;
+		}
+	}
+
+	if (vcpu->arch.tar != current->thread.tar)
+		mtspr(SPRN_TAR, current->thread.tar);
 }
 EXPORT_SYMBOL_GPL(restore_p9_host_os_sprs);
 
-- 
2.23.0

