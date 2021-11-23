Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA0845A030
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 11:27:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz0hX5D10z3frM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 21:27:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jmKqm+Dr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=jmKqm+Dr; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hyzy40Gdxz3ccV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 20:54:36 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id u11so16615997plf.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jnWXCla2rk/Lk0f8Yox75O92jo//Tatiois+E+oXjq4=;
 b=jmKqm+DrrL5Elg5IxKlB/7Z4uLUlYE45xcL4y1jugFH9QutwUSrJzN+/D0508lSkYZ
 HM9tX6sOZq6coqbAEkIN5/LeSa6vo9TQM1j0jQg7SExnsDclh+1T1JlJhxjTvLd8SUMl
 iZDJV98Eyl+JkKL+t/RNKQii+Mex6WA/u3jWe0qZeSM6X7LEVuzlAeoy6Fe4lO0C3Rd9
 a0azNVtITP2+scdllxiN/0o0C2qmO7cKPCLTqEfiyiZnak8yqt0A2YXdhsb/eCQY6YAQ
 KzjdAC8rujLr4nLlotLf2fl2HsZ5f7P7YR3LSMfrYhQ1/N7KRvTuoJ02l2mV8o/kJM9h
 N+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jnWXCla2rk/Lk0f8Yox75O92jo//Tatiois+E+oXjq4=;
 b=raqAWMEClVE4Oq7ouJ9njaL5NRU08tt6HD52x2K21iHu9TtCVAkRPGYiJauru7LC5S
 SjRUlhUyNDUY6+JETM5tXGOoy+sSUYQ88xGe7ObB19wqDL1hrHmNLzKieDYJU9wXQqC3
 fXTH274QIWTM2Ck9UbV/ANnmdmQcO8dhhUi7624F+hqmvM6p6fMZn8BrdvVuhyglHImH
 Y/IJe3QAW9qnFQTsUC2+JkFzDI39KDFrO1eFrlkcwjLdC3gwFJulnxCgdlL155inLgqs
 ngbCoXkdHWxA5Lg7ATY801aRF6zz2Ee8EqsHhCzsd9DzURghWzF6STftEsTVTaLZ/YDX
 u75A==
X-Gm-Message-State: AOAM532czoXX4/KQDG2e+B/u7o3nyzRmJ1OfIwIZrmJ1h1csgkjA/oJe
 J6qoVyiQ4pEfvVtFlRs8OC84LpjfHJYtcw==
X-Google-Smtp-Source: ABdhPJy/NexDxuuquJA1uLtdHQgMwBL28MJLJbhvtEQaiw/EOvvYjZ6sZMeZj23UrNMsksDlYync8g==
X-Received: by 2002:a17:902:d3c1:b0:142:2794:c8cc with SMTP id
 w1-20020a170902d3c100b001422794c8ccmr5067818plb.67.1637661274290; 
 Tue, 23 Nov 2021 01:54:34 -0800 (PST)
Received: from bobo.ibm.com ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id j8sm12662176pfc.8.2021.11.23.01.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 01:54:34 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 53/53] KVM: PPC: Book3S HV P9: Remove subcore HMI handling
Date: Tue, 23 Nov 2021 19:52:31 +1000
Message-Id: <20211123095231.1036501-54-npiggin@gmail.com>
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
index 2b76d51e4b13..33db83b82fbd 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -759,6 +759,7 @@ void kvmppc_realmode_machine_check(struct kvm_vcpu *vcpu);
 void kvmppc_subcore_enter_guest(void);
 void kvmppc_subcore_exit_guest(void);
 long kvmppc_realmode_hmi_handler(void);
+long kvmppc_p9_realmode_hmi_handler(struct kvm_vcpu *vcpu);
 long kvmppc_h_enter(struct kvm_vcpu *vcpu, unsigned long flags,
                     long pte_index, unsigned long pteh, unsigned long ptel);
 long kvmppc_h_remove(struct kvm_vcpu *vcpu, unsigned long flags,
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 214481e5d56d..98e90bdf1f27 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4033,8 +4033,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	vcpu->arch.ceded = 0;
 
-	kvmppc_subcore_enter_guest();
-
 	vcpu_vpa_increment_dispatch(vcpu);
 
 	if (kvmhv_on_pseries()) {
@@ -4087,8 +4085,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	vcpu_vpa_increment_dispatch(vcpu);
 
-	kvmppc_subcore_exit_guest();
-
 	return trap;
 }
 
@@ -6102,9 +6098,11 @@ static int kvmppc_book3s_init_hv(void)
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
index 72119bc13e1d..ebb4781859e2 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -1013,7 +1013,7 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
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

