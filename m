Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B363E95A9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 18:14:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlFJ43scVz3fJS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 02:14:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=m38fx7Mj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=m38fx7Mj; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlF2h1RkCz3cVM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 02:02:35 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id n12so2618640plf.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 09:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yZjufjuNadV1tghNNfY89lJSLDdECYjetCLWMrMMZtk=;
 b=m38fx7MjF9GLTn7G7CX6ptbf2MEFMOR2BN6eFsf1rwSxK69YYE8lrvFFLtplE02onm
 IPjG29oDa7wt9QpiY+qKMVdGYBFLR33agxko6jN0LnT89z/ofi/Akpm0GYxsBJxddWZB
 9XcrTmgU8kHiX5r5UgqmGo2MqPqGm5Dzv5RtKBuI8A8L7HLn6/4P2QrkZfNjZXpBLBmW
 FNDy6iwz5wi4ffmJOLWTn6T0preI7q7ajs6L0/JGSxZnp8hXzElv4pY0pWqqfz7MglDS
 I95hg+me3j2HIJR1mANo0yWA5ubJK+euNanTae/bhAWSmz23hhBmncuTNlQepPY56PlJ
 H/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yZjufjuNadV1tghNNfY89lJSLDdECYjetCLWMrMMZtk=;
 b=fi+fSFPKz/FbSt6D6WkJE2SV9rx6E7dZqYcPzoisFQUwCkQOWmxpAgwqShwHjmnHGe
 usIgCHBKOl8TJEk6YxSe0ZfvQa1mq1hoR0eUMDVulZ3vEuF1DuXZvPNggIl9qUSfCE0L
 EY98RIkivQQOwaF11CsCJTlxRydESWTz9dpgvNM6iYLo7Nwu1cqNVQKWeigkwoUk9JC2
 o+VOwJNgnGjApDxUI9z4EMucqZQHUWYUDPiHwgtEMAaJmYXb5+bOhvSLBFX7vIE4HIYc
 mM9KDLEMisjQeO5lluf5I0ja2FSKF+uB19gIelsAEF++OKfYcCnO2QwGipjwDySCimXA
 VjQg==
X-Gm-Message-State: AOAM530Sgms+AbwFFKl+bXmi9mPREAn2YwUVVVvvz/wyJDBXVHtEbjM7
 PZkRfNIyrsM6XrwdU0+bZ9Y=
X-Google-Smtp-Source: ABdhPJwHhdLxVG/f4hmuVWZtbivuXl7M2kIpPYqbLjFGsM/0UhkIb8Xix9zFZbjXXh0r4cI7gBnAkQ==
X-Received: by 2002:a17:902:d2c8:b029:12b:84f8:d916 with SMTP id
 n8-20020a170902d2c8b029012b84f8d916mr1293181plc.75.1628697753915; 
 Wed, 11 Aug 2021 09:02:33 -0700 (PDT)
Received: from bobo.ibm.com ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id k19sm6596494pff.28.2021.08.11.09.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 09:02:33 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 19/60] powerpc/64s: Always set PMU control registers to
 frozen/disabled when not in use
Date: Thu, 12 Aug 2021 02:00:53 +1000
Message-Id: <20210811160134.904987-20-npiggin@gmail.com>
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
Cc: Athira Jajeev <atrajeev@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

KVM PMU management code looks for particular frozen/disabled bits in
the PMU registers so it knows whether it must clear them when coming
out of a guest or not. Setting this up helps KVM make these optimisations
without getting confused. Longer term the better approach might be to
move guest/host PMU switching to the perf subsystem.

Cc: Athira Jajeev <atrajeev@linux.vnet.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/cpu_setup_power.c | 4 ++--
 arch/powerpc/kernel/dt_cpu_ftrs.c     | 6 +++---
 arch/powerpc/kvm/book3s_hv.c          | 5 +++++
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/cpu_setup_power.c b/arch/powerpc/kernel/cpu_setup_power.c
index a29dc8326622..3dc61e203f37 100644
--- a/arch/powerpc/kernel/cpu_setup_power.c
+++ b/arch/powerpc/kernel/cpu_setup_power.c
@@ -109,7 +109,7 @@ static void init_PMU_HV_ISA207(void)
 static void init_PMU(void)
 {
 	mtspr(SPRN_MMCRA, 0);
-	mtspr(SPRN_MMCR0, 0);
+	mtspr(SPRN_MMCR0, MMCR0_FC);
 	mtspr(SPRN_MMCR1, 0);
 	mtspr(SPRN_MMCR2, 0);
 }
@@ -123,7 +123,7 @@ static void init_PMU_ISA31(void)
 {
 	mtspr(SPRN_MMCR3, 0);
 	mtspr(SPRN_MMCRA, MMCRA_BHRB_DISABLE);
-	mtspr(SPRN_MMCR0, MMCR0_PMCCEXT);
+	mtspr(SPRN_MMCR0, MMCR0_FC | MMCR0_PMCCEXT);
 }
 
 /*
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index 38ea20fadc4a..a6bb0ee179cd 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -353,7 +353,7 @@ static void init_pmu_power8(void)
 	}
 
 	mtspr(SPRN_MMCRA, 0);
-	mtspr(SPRN_MMCR0, 0);
+	mtspr(SPRN_MMCR0, MMCR0_FC);
 	mtspr(SPRN_MMCR1, 0);
 	mtspr(SPRN_MMCR2, 0);
 	mtspr(SPRN_MMCRS, 0);
@@ -392,7 +392,7 @@ static void init_pmu_power9(void)
 		mtspr(SPRN_MMCRC, 0);
 
 	mtspr(SPRN_MMCRA, 0);
-	mtspr(SPRN_MMCR0, 0);
+	mtspr(SPRN_MMCR0, MMCR0_FC);
 	mtspr(SPRN_MMCR1, 0);
 	mtspr(SPRN_MMCR2, 0);
 }
@@ -428,7 +428,7 @@ static void init_pmu_power10(void)
 
 	mtspr(SPRN_MMCR3, 0);
 	mtspr(SPRN_MMCRA, MMCRA_BHRB_DISABLE);
-	mtspr(SPRN_MMCR0, MMCR0_PMCCEXT);
+	mtspr(SPRN_MMCR0, MMCR0_FC | MMCR0_PMCCEXT);
 }
 
 static int __init feat_enable_pmu_power10(struct dt_cpu_feature *f)
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 197665c1a1cd..e6cb923f91ff 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -2718,6 +2718,11 @@ static int kvmppc_core_vcpu_create_hv(struct kvm_vcpu *vcpu)
 #endif
 #endif
 	vcpu->arch.mmcr[0] = MMCR0_FC;
+	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
+		vcpu->arch.mmcr[0] |= MMCR0_PMCCEXT;
+		vcpu->arch.mmcra = MMCRA_BHRB_DISABLE;
+	}
+
 	vcpu->arch.ctrl = CTRL_RUNLATCH;
 	/* default to host PVR, since we can't spoof it */
 	kvmppc_set_pvr_hv(vcpu, mfspr(SPRN_PVR));
-- 
2.23.0

