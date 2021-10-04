Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1A9421432
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 18:36:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNRDq2WxCz3fWS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 03:36:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Iwuc5/Be;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Iwuc5/Be; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNQVM0zlLz3cYf
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 03:03:06 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id
 d13-20020a17090ad3cd00b0019e746f7bd4so4286771pjw.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 09:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YDapZeq+Cy3m4K/ha0FiUOzYZwT+p/FpOvrkM+uM8lQ=;
 b=Iwuc5/BeQEGbDH9HFCxyQmkwx/v0mQd/vNNky/r0eKdQSWoFzgcR4n+X0nDvL8MBRv
 CIjt1+IriqKuBXtUXpgffvMClEU9Q35eLHLNiZqQ43J5pdDej5gbZIf53pHJ9No8IEpG
 5bRL8Y0fs9foTn1QU3wunMaW6VpjcTWoTeG+Dd1RAaT9MtZWHIJ0WqgbyMKS7QGbgxlF
 ADHwsTp8MgUztZ5GucriEPyyfU1H9wbb8VECM12iN7Wyjss1j6P+xRoOJH8ExBmjk9wD
 vA/t8nydvb7HiDUR2iFDyMkyLEKwKc8LJ/5W0FLIljO6zxWuDYgYBdSAkU5jryzIIdx+
 UxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YDapZeq+Cy3m4K/ha0FiUOzYZwT+p/FpOvrkM+uM8lQ=;
 b=i48pXz3OlEIiYJyo7SHzBFhkAqFcgbEPaxVYCbrVI1DiREhOl9sgRIxZuLriX3Sbaz
 wrglQahzdSMc7qas735SD5vmrsBLUowwlE6ATv5bFJnKWAfJq4Hjl/0DGACwRDinITcE
 Xk5nSyLMYAAnte5hTO9uc+67U+eLa0T/RyZ6UoYgW1QMKFR5e86mEwOKDtN593m7XFl/
 CfTqt/mggEvGmpE8elZH8eBoRpn1giEglPgKh6GX5ppeqDAT34+d1RVFC+aGsw/3w5Ig
 vh5IqD0+wQcP9PyMZRVMaBdThFvetY5t6tz8Ar47GsDbsgCJAIxpJZlACEr8RCju4xZ2
 ++DA==
X-Gm-Message-State: AOAM530yYlrtJ30RrqI0vNx/aHwVW1iozxCR7jZ+aHqxRto1L7i77AIA
 IZpmSy5E7bjflC0R573Oum8=
X-Google-Smtp-Source: ABdhPJy/apREgMGxV3J8KWmaYig1di0dorNMqQ75JWm2ocp7vQ9l8cznQW55+rHuzKVb+Y7THN9n9A==
X-Received: by 2002:a17:90a:8b8d:: with SMTP id
 z13mr33340553pjn.214.1633363384700; 
 Mon, 04 Oct 2021 09:03:04 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id 130sm15557223pfz.77.2021.10.04.09.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 09:03:04 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 52/52] KVM: PPC: Book3S HV P9: Remove subcore HMI handling
Date: Tue,  5 Oct 2021 02:00:49 +1000
Message-Id: <20211004160049.1338837-53-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211004160049.1338837-1-npiggin@gmail.com>
References: <20211004160049.1338837-1-npiggin@gmail.com>
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

On POWER9 and newer, rather than the complex HMI synchronisation and
subcore state, have each thread un-apply the guest TB offset before
calling into the early HMI handler.

This allows the subcore state to be avoided, including subcore enter
/ exit guest, which includes an expensive divide that shows up
slightly in profiles.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_ppc.h    |  1 +
 arch/powerpc/kvm/book3s_hv.c          | 12 +++---
 arch/powerpc/kvm/book3s_hv_hmi.c      |  7 +++-
 arch/powerpc/kvm/book3s_hv_p9_entry.c |  2 +-
 arch/powerpc/kvm/book3s_hv_ras.c      | 54 +++++++++++++++++++++++++++
 5 files changed, 67 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index 671fbd1a765e..70ffcb3c91bf 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -760,6 +760,7 @@ void kvmppc_realmode_machine_check(struct kvm_vcpu *vcpu);
 void kvmppc_subcore_enter_guest(void);
 void kvmppc_subcore_exit_guest(void);
 long kvmppc_realmode_hmi_handler(void);
+long kvmppc_p9_realmode_hmi_handler(struct kvm_vcpu *vcpu);
 long kvmppc_h_enter(struct kvm_vcpu *vcpu, unsigned long flags,
                     long pte_index, unsigned long pteh, unsigned long ptel);
 long kvmppc_h_remove(struct kvm_vcpu *vcpu, unsigned long flags,
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 351018f617fb..449ac0a19ceb 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4014,8 +4014,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	vcpu->arch.ceded = 0;
 
-	kvmppc_subcore_enter_guest();
-
 	vcpu_vpa_increment_dispatch(vcpu);
 
 	if (kvmhv_on_pseries()) {
@@ -4068,8 +4066,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	vcpu_vpa_increment_dispatch(vcpu);
 
-	kvmppc_subcore_exit_guest();
-
 	return trap;
 }
 
@@ -6069,9 +6065,11 @@ static int kvmppc_book3s_init_hv(void)
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
index fbecbdc42c26..86a222f97e8e 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -938,7 +938,7 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 		kvmppc_realmode_machine_check(vcpu);
 
 	} else if (unlikely(trap == BOOK3S_INTERRUPT_HMI)) {
-		kvmppc_realmode_hmi_handler();
+		kvmppc_p9_realmode_hmi_handler(vcpu);
 
 	} else if (trap == BOOK3S_INTERRUPT_H_EMUL_ASSIST) {
 		vcpu->arch.emul_inst = mfspr(SPRN_HEIR);
diff --git a/arch/powerpc/kvm/book3s_hv_ras.c b/arch/powerpc/kvm/book3s_hv_ras.c
index d4bca93b79f6..ccfd96965630 100644
--- a/arch/powerpc/kvm/book3s_hv_ras.c
+++ b/arch/powerpc/kvm/book3s_hv_ras.c
@@ -136,6 +136,60 @@ void kvmppc_realmode_machine_check(struct kvm_vcpu *vcpu)
 	vcpu->arch.mce_evt = mce_evt;
 }
 
+
+long kvmppc_p9_realmode_hmi_handler(struct kvm_vcpu *vcpu)
+{
+	struct kvmppc_vcore *vc = vcpu->arch.vcore;
+	long ret = 0;
+
+	/*
+	 * Unapply and clear the offset first. That way, if the TB was not
+	 * resynced then it will remain in host-offset, and if it was resynced
+	 * then it is brought into host-offset. Then the tb offset is
+	 * re-applied before continuing with the KVM exit.
+	 *
+	 * This way, we don't need to actually know whether not OPAL resynced
+	 * the timebase or do any of the complicated dance that the P7/8
+	 * path requires.
+	 */
+	if (vc->tb_offset_applied) {
+		u64 new_tb = mftb() - vc->tb_offset_applied;
+		mtspr(SPRN_TBU40, new_tb);
+		if ((mftb() & 0xffffff) < (new_tb & 0xffffff)) {
+			new_tb += 0x1000000;
+			mtspr(SPRN_TBU40, new_tb);
+		}
+		vc->tb_offset_applied = 0;
+	}
+
+	local_paca->hmi_irqs++;
+
+	if (hmi_handle_debugtrig(NULL) >= 0) {
+		ret = 1;
+		goto out;
+	}
+
+	if (ppc_md.hmi_exception_early)
+		ppc_md.hmi_exception_early(NULL);
+
+out:
+	if (vc->tb_offset) {
+		u64 new_tb = mftb() + vc->tb_offset;
+		mtspr(SPRN_TBU40, new_tb);
+		if ((mftb() & 0xffffff) < (new_tb & 0xffffff)) {
+			new_tb += 0x1000000;
+			mtspr(SPRN_TBU40, new_tb);
+		}
+		vc->tb_offset_applied = vc->tb_offset;
+	}
+
+	return ret;
+}
+
+/*
+ * The following subcore HMI handling is all only for pre-POWER9 CPUs.
+ */
+
 /* Check if dynamic split is in force and return subcore size accordingly. */
 static inline int kvmppc_cur_subcore_size(void)
 {
-- 
2.23.0

