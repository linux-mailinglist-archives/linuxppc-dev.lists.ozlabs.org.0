Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B533E95E1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 18:25:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlFYN1LH4z3gNB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 02:25:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=XJqwDEXZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XJqwDEXZ; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlF3Y2BFJz3dDC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 02:03:21 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id
 t7-20020a17090a5d87b029017807007f23so10311654pji.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 09:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nSYAtI8P17mLu9fXMsfGStnZ2i1gV8qJNG1zXcMJXYc=;
 b=XJqwDEXZ1TmJVgaAZbsPYwhy/zHNIJw9dyq5b9vepuoqGa9FonsxE15xQixMwOIPSA
 0eQ8VuWbHvQRflYSzYFDDpzigE5OJ06n1AHujAibRT84kZtsguujccvLpbNXqR0vkLVq
 L797vhzmblb1JFS/yZwoIstySRBaJQijH/477RDJcUEgKvgnKYdS2Mw7dL06H1VDFX/r
 zmXZcoVpnUPgBruMljhKY5hyvQzo2t6au0SCGouXi/pZQcO+4sIp/SvZYTadel9RRkZr
 elyfai5Jf9PxXEeebBJzPgmhuHkKQDybAVxPU8BOOt1WRu1l4/2EFXLYtH95z5/xXKoQ
 9Srw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nSYAtI8P17mLu9fXMsfGStnZ2i1gV8qJNG1zXcMJXYc=;
 b=hbLTlaR6PVB87nGFD1pphCB599iug9pistelruFZCaDbwNxtvbxDxW+yKTiRkwaz9e
 Uum46l0FECrpI8ikbIYzd9pyAMX3O7ojKak3+4HFo/QJ6V6H42XHdL8CN4xjtAkOmXLB
 nt5aI84P1zif0Kao6D+uq84BxTQK6fUYsD/e/QDNy4ebs7kiGnPoX9fOTsJh1MX5OfSo
 dIR1V4bIoXqklOAJMnW7rYmbPyH6h/rtovw8f3JoT2QT7hTTuUC2kkRyIAAq8vDbOP8H
 0KI2AwWUZsmq3iEpnSGKlQfOn/LKa6us7v8fLyIFkicw93igjKZ5WBqfojiK5tlJ2g5H
 qCIg==
X-Gm-Message-State: AOAM533hkMWdAlSYercQrZHcSRrPbr1PD0YNYWwygHHQ3fzVNnkCGzXE
 PPu/K2ilBiR3MOTJRwQDvVI=
X-Google-Smtp-Source: ABdhPJzYHkcy92be5dnLULlLQ58hc/tVRRBzsBWSWBMxdO9FX9NIlvnt7dZL9vptNvxz3XXxEvbLfA==
X-Received: by 2002:a17:90a:9cf:: with SMTP id
 73mr11357005pjo.136.1628697799168; 
 Wed, 11 Aug 2021 09:03:19 -0700 (PDT)
Received: from bobo.ibm.com ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id k19sm6596494pff.28.2021.08.11.09.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 09:03:18 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 36/60] KVM: PPC: Book3S HV P9: Move vcpu register
 save/restore into functions
Date: Thu, 12 Aug 2021 02:01:10 +1000
Message-Id: <20210811160134.904987-37-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210811160134.904987-1-npiggin@gmail.com>
References: <20210811160134.904987-1-npiggin@gmail.com>
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

This should be no functional difference but makes the caller easier
to read.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 65 +++++++++++++++++++++++-------------
 1 file changed, 41 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 7867d6793b3e..0f86b65efc10 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4098,6 +4098,44 @@ static void store_spr_state(struct kvm_vcpu *vcpu)
 	vcpu->arch.ctrl = mfspr(SPRN_CTRLF);
 }
 
+/* Returns true if current MSR and/or guest MSR may have changed */
+static bool load_vcpu_state(struct kvm_vcpu *vcpu,
+			   struct p9_host_os_sprs *host_os_sprs)
+{
+	bool ret = false;
+
+	if (cpu_has_feature(CPU_FTR_TM) ||
+	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST)) {
+		kvmppc_restore_tm_hv(vcpu, vcpu->arch.shregs.msr, true);
+		ret = true;
+	}
+
+	load_spr_state(vcpu, host_os_sprs);
+
+	load_fp_state(&vcpu->arch.fp);
+#ifdef CONFIG_ALTIVEC
+	load_vr_state(&vcpu->arch.vr);
+#endif
+	mtspr(SPRN_VRSAVE, vcpu->arch.vrsave);
+
+	return ret;
+}
+
+static void store_vcpu_state(struct kvm_vcpu *vcpu)
+{
+	store_spr_state(vcpu);
+
+	store_fp_state(&vcpu->arch.fp);
+#ifdef CONFIG_ALTIVEC
+	store_vr_state(&vcpu->arch.vr);
+#endif
+	vcpu->arch.vrsave = mfspr(SPRN_VRSAVE);
+
+	if (cpu_has_feature(CPU_FTR_TM) ||
+	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
+		kvmppc_save_tm_hv(vcpu, vcpu->arch.shregs.msr, true);
+}
+
 static void save_p9_host_os_sprs(struct p9_host_os_sprs *host_os_sprs)
 {
 	if (!cpu_has_feature(CPU_FTR_ARCH_31))
@@ -4205,19 +4243,8 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	vcpu_vpa_increment_dispatch(vcpu);
 
-	if (cpu_has_feature(CPU_FTR_TM) ||
-	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST)) {
-		kvmppc_restore_tm_hv(vcpu, vcpu->arch.shregs.msr, true);
-		msr = mfmsr(); /* TM restore can update msr */
-	}
-
-	load_spr_state(vcpu, &host_os_sprs);
-
-	load_fp_state(&vcpu->arch.fp);
-#ifdef CONFIG_ALTIVEC
-	load_vr_state(&vcpu->arch.vr);
-#endif
-	mtspr(SPRN_VRSAVE, vcpu->arch.vrsave);
+	if (unlikely(load_vcpu_state(vcpu, &host_os_sprs)))
+		msr = mfmsr(); /* MSR may have been updated */
 
 	switch_pmu_to_guest(vcpu, &host_os_sprs);
 
@@ -4321,17 +4348,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	switch_pmu_to_host(vcpu, &host_os_sprs);
 
-	store_spr_state(vcpu);
-
-	store_fp_state(&vcpu->arch.fp);
-#ifdef CONFIG_ALTIVEC
-	store_vr_state(&vcpu->arch.vr);
-#endif
-	vcpu->arch.vrsave = mfspr(SPRN_VRSAVE);
-
-	if (cpu_has_feature(CPU_FTR_TM) ||
-	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
-		kvmppc_save_tm_hv(vcpu, vcpu->arch.shregs.msr, true);
+	store_vcpu_state(vcpu);
 
 	vcpu_vpa_increment_dispatch(vcpu);
 
-- 
2.23.0

