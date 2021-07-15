Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0793C9F57
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jul 2021 15:18:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQZgP0y9vz3db6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jul 2021 23:18:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=tjL58WDW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tjL58WDW; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQZcZ3CxPz3bhs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jul 2021 23:15:42 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id
 i16-20020a17090acf90b02901736d9d2218so4155829pju.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jul 2021 06:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+Nnq2tW9Cjq/DhRE4HH4kRNi6d38rHtNf1hfbltAJ14=;
 b=tjL58WDWUl+RJU0o0zl4IHc4mDYYKa9FUMKSrioX6ntqLkxRD3TXrc0Win5jf26ns4
 O1G7l6XSgCl6FKbcCoKfaVERtu0aLznA5mnj07oTRg499O2Aaoz6LFJVJx/Vrizv3Om5
 mVmIjRibIzktvzxsGyvs4bJSn1PF+YsJ98LR7O1aSXsUpXwPGo0mEVLOlvCHuewMdXbW
 UulxPa2b812Qd8tFMKJUuj50Mv1izAU664jMotO6irjtx67Bg8A2ZFjfE3QZ8Jn9UHb/
 sJEJvxftXxuIf+M4I0VALNrqMzZRNBcifiYO6Fuz+kKuwzpdQL/b1bbyPE9eJQZXXUud
 MXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+Nnq2tW9Cjq/DhRE4HH4kRNi6d38rHtNf1hfbltAJ14=;
 b=k/uGfuC2/TRo4VBuqhCdgbORGVLADtJH+PTnYXtd6fsGFRpyEv0PPe3vAIWkhhmsZ6
 oRUF+W7s/yfiV7Av27pShm4MvW6540PH54jJEImEUdJ66GdSbHeZw+mEZvjdgAmM66vb
 NrZo4bMxF34BkQ0iD7+AzvGuFgWaMvjsIiZZetkRNnMnoyY7I+eFAN+rbwv/zEN8SVy4
 o5lhCdAqedVKxDvcraPrDODa94S95lAFTIZUhaaHGb+0OeyGrUMD1sRIAvmMa+PKRiEd
 JoH+MB6FXg9PS0KZT7zVrFGXvW+LffxVL5kyp7GCeU37fsz57k5r5XqhyAumRVCvIj1Q
 zUIA==
X-Gm-Message-State: AOAM533g2AV6TmGMvgNI3svoGYxS74s7IwCFH2EKNdom5X6kI+OoICzd
 xzODg/B6kP7Wp7PrY/9+0f4=
X-Google-Smtp-Source: ABdhPJzQJbG9TZ4Mdi0O8WATkk+L5cO1prDMgUyT/yBbImp+Eg5gaEGjZgvprokb3w3MNOPKrJ52NQ==
X-Received: by 2002:a17:90a:e611:: with SMTP id
 j17mr10042010pjy.48.1626354939561; 
 Thu, 15 Jul 2021 06:15:39 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (27-33-83-114.tpgi.com.au. [27.33.83.114])
 by smtp.gmail.com with ESMTPSA id
 k6sm4864216pju.8.2021.07.15.06.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 06:15:39 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 6/6] KVM: PPC: Book3S HV P9: Remove subcore HMI handling
Date: Thu, 15 Jul 2021 23:15:18 +1000
Message-Id: <20210715131518.146917-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210715131518.146917-1-npiggin@gmail.com>
References: <20210715131518.146917-1-npiggin@gmail.com>
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

On POWER9 and newer, rather than the complex HMI synchronisation and
subcore state, have each thread un-apply the guest TB offset before
calling into the early HMI handler.

This allows the subcore state to be avoided, including subcore enter
/ exit guest, which includes an expensive divide that shows up
slightly in profiles.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c          | 12 +++++-------
 arch/powerpc/kvm/book3s_hv_hmi.c      |  7 ++++++-
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 21 ++++++++++++++++++++-
 arch/powerpc/kvm/book3s_hv_ras.c      |  4 ++++
 4 files changed, 35 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 957efde59014..7d5c31537a79 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3985,8 +3985,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	vcpu->arch.ceded = 0;
 
-	kvmppc_subcore_enter_guest();
-
 	vcpu_vpa_increment_dispatch(vcpu);
 
 	if (kvmhv_on_pseries()) {
@@ -4039,8 +4037,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	vcpu_vpa_increment_dispatch(vcpu);
 
-	kvmppc_subcore_exit_guest();
-
 	return trap;
 }
 
@@ -6022,9 +6018,11 @@ static int kvmppc_book3s_init_hv(void)
 	if (r)
 		return r;
 
-	r = kvm_init_subcore_bitmap();
-	if (r)
-		return r;
+	if (!cpu_has_feature(CPU_FTR_ARCH_300)) {
+		r = kvm_init_subcore_bitmap();
+		if (r)
+			return r;
+	}
 
 	/*
 	 * We need a way of accessing the XICS interrupt controller,
diff --git a/arch/powerpc/kvm/book3s_hv_hmi.c b/arch/powerpc/kvm/book3s_hv_hmi.c
index 9af660476314..1ec50c69678b 100644
--- a/arch/powerpc/kvm/book3s_hv_hmi.c
+++ b/arch/powerpc/kvm/book3s_hv_hmi.c
@@ -20,10 +20,15 @@ void wait_for_subcore_guest_exit(void)
 
 	/*
 	 * NULL bitmap pointer indicates that KVM module hasn't
-	 * been loaded yet and hence no guests are running.
+	 * been loaded yet and hence no guests are running, or running
+	 * on POWER9 or newer CPU.
+	 *
 	 * If no KVM is in use, no need to co-ordinate among threads
 	 * as all of them will always be in host and no one is going
 	 * to modify TB other than the opal hmi handler.
+	 *
+	 * POWER9 and newer don't need this synchronisation.
+	 *
 	 * Hence, just return from here.
 	 */
 	if (!local_paca->sibling_subcore_state)
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 44150a29f6e0..3c9e7a500264 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -3,6 +3,7 @@
 #include <linux/kvm_host.h>
 #include <asm/asm-prototypes.h>
 #include <asm/dbell.h>
+#include <asm/interrupt.h>
 #include <asm/kvm_ppc.h>
 #include <asm/pmc.h>
 #include <asm/ppc-opcode.h>
@@ -900,7 +901,25 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 		kvmppc_realmode_machine_check(vcpu);
 
 	} else if (unlikely(trap == BOOK3S_INTERRUPT_HMI)) {
-		kvmppc_realmode_hmi_handler();
+		/*
+		 * Unapply and clear the offset first. That way, if the TB
+		 * was fine then no harm done, if it is corrupted then the
+		 * HMI resync will bring it back to host mode. This way, we
+		 * don't need to actualy know whether not OPAL resynced the
+		 * timebase. Although it would be cleaner if we could rely
+		 * on that, early POWER9 OPAL did not support the
+		 * OPAL_HANDLE_HMI2 call.
+		 */
+		if (vc->tb_offset_applied) {
+			u64 new_tb = mftb() - vc->tb_offset_applied;
+			mtspr(SPRN_TBU40, new_tb);
+			if ((mftb() & 0xffffff) < (new_tb & 0xffffff)) {
+				new_tb += 0x1000000;
+				mtspr(SPRN_TBU40, new_tb);
+			}
+			vc->tb_offset_applied = 0;
+		}
+		hmi_exception_realmode(NULL);
 
 	} else if (trap == BOOK3S_INTERRUPT_H_EMUL_ASSIST) {
 		vcpu->arch.emul_inst = mfspr(SPRN_HEIR);
diff --git a/arch/powerpc/kvm/book3s_hv_ras.c b/arch/powerpc/kvm/book3s_hv_ras.c
index d4bca93b79f6..a49ee9bdab67 100644
--- a/arch/powerpc/kvm/book3s_hv_ras.c
+++ b/arch/powerpc/kvm/book3s_hv_ras.c
@@ -136,6 +136,10 @@ void kvmppc_realmode_machine_check(struct kvm_vcpu *vcpu)
 	vcpu->arch.mce_evt = mce_evt;
 }
 
+/*
+ * This subcore HMI handling is all only for pre-POWER9 CPUs.
+ */
+
 /* Check if dynamic split is in force and return subcore size accordingly. */
 static inline int kvmppc_cur_subcore_size(void)
 {
-- 
2.23.0

