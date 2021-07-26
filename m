Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7B03D524A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 06:15:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GY65q3vTYz3jn6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 14:15:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=T4Qgip1K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=T4Qgip1K; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GY5c502Mnz30Ky
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 13:52:53 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id
 a4-20020a17090aa504b0290176a0d2b67aso9380795pjq.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jul 2021 20:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g7tzAmHt9KFCtjyh0DlOhYXuEQ09+ToK2o7s2d30wi4=;
 b=T4Qgip1KmTTvnYJO1orXDsbOKQ2HY5MjVPhZr3mE8waj56Ds3xJLVFSGfRv7Szdn1y
 QEzBi1loDZwMIy49XVPf8h/N1fXKHBhgcHelSVF0/AyF2h+2AOjgeWJ4muenI4CbdSqC
 PvUrTx7RF19wifBUACpAviUfXSzAwe/ZNK0ysFv9S9SpSfVVngyJDrbiZIvfJ3+zvHLo
 fDBxmKlxQxE14P5J5dsSNY/5p7Mk+7zxjCqagaSpqQWdgGUy3oQ/E3sG9o6w6nrXZiQr
 rwaARkvRIC259z375gg2N3HbUA2XXq6FvPckc9qiQ+HENWTGj78+lM+7wXhJb2GLk05M
 aqWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g7tzAmHt9KFCtjyh0DlOhYXuEQ09+ToK2o7s2d30wi4=;
 b=JjeFwkg5gd+9w4408WNMCUQzBnu8A0jtcvLeGmgpIo+ThlY58ZgXtH5/0VWF8JbjN9
 hr/qJfG1ePoGSWGzkl1QIibYE6rWjlYVvgvrfUHw1IV0zqmCrTRKU4U5D9Mj/nfsmm7T
 E6JRApIk3LKUhsGRG9+gLJ3dnqr4cZMW7aF9vKPynILeiA2ytjOj2edIaMm0GNPMEgvy
 oc5MqFomn5an6D1sAvtLycuOR0fxVd9IB1iOU3yRh3Z+HeObNIQKIZcUXhyUK7a+HAto
 aiUXAy4rbAOuOcujO+58aNLOu7xRjTwLknOdo7Ik2aL8oF9/l3nX7+yk3rnHX/lM9soe
 LUZw==
X-Gm-Message-State: AOAM5325f4qyFXTGPmOr45+UnoiPj2nboWRMLee8k+eJMYo7SC8jGLe2
 PJZX5C4Ij+KrTukn9SryjiM=
X-Google-Smtp-Source: ABdhPJzwIM7O9OUMjHW7iRnCSulR7E5dYl4iqmmFRRUkU6vIcCXmbFuSo8vKOF91kEH2jrCedJc7DQ==
X-Received: by 2002:a17:90a:f40f:: with SMTP id
 ch15mr3517977pjb.32.1627271571042; 
 Sun, 25 Jul 2021 20:52:51 -0700 (PDT)
Received: from bobo.ibm.com (220-244-190-123.tpgi.com.au. [220.244.190.123])
 by smtp.gmail.com with ESMTPSA id p33sm41140341pfw.40.2021.07.25.20.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 20:52:50 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v1 55/55] KVM: PPC: Book3S HV P9: Remove subcore HMI handling
Date: Mon, 26 Jul 2021 13:50:36 +1000
Message-Id: <20210726035036.739609-56-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210726035036.739609-1-npiggin@gmail.com>
References: <20210726035036.739609-1-npiggin@gmail.com>
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
 arch/powerpc/kvm/book3s_hv.c          | 12 +++++-----
 arch/powerpc/kvm/book3s_hv_hmi.c      |  7 +++++-
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 32 ++++++++++++++++++++++++++-
 arch/powerpc/kvm/book3s_hv_ras.c      |  4 ++++
 4 files changed, 46 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index b727b2cfad98..3f62ada1a669 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3994,8 +3994,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	vcpu->arch.ceded = 0;
 
-	kvmppc_subcore_enter_guest();
-
 	vcpu_vpa_increment_dispatch(vcpu);
 
 	if (kvmhv_on_pseries()) {
@@ -4048,8 +4046,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	vcpu_vpa_increment_dispatch(vcpu);
 
-	kvmppc_subcore_exit_guest();
-
 	return trap;
 }
 
@@ -6031,9 +6027,11 @@ static int kvmppc_book3s_init_hv(void)
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
index 032ca6dfd83c..d23e1ef2e3a7 100644
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
@@ -927,7 +928,36 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
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
+
+		hmi_exception_realmode(NULL);
+
+		if (vc->tb_offset) {
+			u64 new_tb = mftb() + vc->tb_offset;
+			mtspr(SPRN_TBU40, new_tb);
+			if ((mftb() & 0xffffff) < (new_tb & 0xffffff)) {
+				new_tb += 0x1000000;
+				mtspr(SPRN_TBU40, new_tb);
+			}
+			vc->tb_offset_applied = vc->tb_offset;
+		}
 
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

