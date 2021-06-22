Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A80ED3B023B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 13:02:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8Nlw3JvHz3dj6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 21:02:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=P/vsSuDZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=P/vsSuDZ; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8Nfl6bwsz3bsk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 20:58:23 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id n12so8016118pgs.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 03:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3IbqYnc6jwDvTAVKkagWuc1eSLjZhsavaNtRfJS7oq4=;
 b=P/vsSuDZPUgS4FjBzc5tWU01c8viCiB83FONYuE5OKmnbB0zeqSrB1YPDnWzpqbv6c
 8bCE23HIXpzA411UubIO8at4ErknjI6Hbb2HuhebfjqNcyqYTvQV9vfcW8oRcRdfG+wR
 7TH0veYJrQJELn6aAfxFEmel0ezs812tekH+VrEuqQGEEKfSPgB7nBakNa6z2DwrCivP
 WisU8eTa3z9CizvIc/6iXiJ/Ct59T3FAsd7KGAInY0fxeE1VyaBqTK9vAMlyzUPRS8lf
 Uo8adtJHebIcJTEHYhynROoc3PkYY0rgVVFdBg/2HYSsBfZ3jeRj3FPs+5keg2z9yh/B
 Etjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3IbqYnc6jwDvTAVKkagWuc1eSLjZhsavaNtRfJS7oq4=;
 b=fBwR81H8S5WYy3oq5vlAfoW1Q8rrQITIkmnQCznBC6Ahyjd4V06BXj4nuX4vhtyZO6
 KSybsNlgyG8wkcw6aRzDzYiCOY92tPM6RzjgxNivDlJ7XbFraylr+ktqr1IdNTdtCG5E
 a+V5ZeQ1rHYFiXC8iceOowxVlc0EGICZNTfaXFkA0Jz4b8t6S9R3ZQnuEUxeZh7O3Nbe
 Z6BntHRAqeTdKEst1c0X7dOPv6df/72DVnl833jI6C0/ZU2u7tet2YkL6g4REDTBOPB4
 oaPpBbLflyKlRIH/0XhAD0zEMsCJXewKJGYE3Pny9j5t7nD8KjEditCCv+0zocaKQtd6
 RZkQ==
X-Gm-Message-State: AOAM532vfcuLIJgZQd7oqIDPKMO6XQfNRSPL9yGHZ0t5U9/jZxyfqRuh
 pQG9uEtbFNfDrdMS99dG5inwmZZX4TM=
X-Google-Smtp-Source: ABdhPJyM1MDyYUkMPfhJf1pBkmdHVWpT4T65oSvBG5VbXutiXxy7qdE2EqeMzMpFAE2dIVIWcaKhjg==
X-Received: by 2002:a63:f20:: with SMTP id e32mr2584597pgl.235.1624359500659; 
 Tue, 22 Jun 2021 03:58:20 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id l6sm5623621pgh.34.2021.06.22.03.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 03:58:20 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 10/43] powerpc/64s: Always set PMU control registers to
 frozen/disabled when not in use
Date: Tue, 22 Jun 2021 20:57:03 +1000
Message-Id: <20210622105736.633352-11-npiggin@gmail.com>
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

KVM PMU management code looks for particular frozen/disabled bits in
the PMU registers so it knows whether it must clear them when coming
out of a guest or not. Setting this up helps KVM make these optimisations
without getting confused. Longer term the better approach might be to
move guest/host PMU switching to the perf subsystem.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/cpu_setup_power.c | 4 ++--
 arch/powerpc/kernel/dt_cpu_ftrs.c     | 6 +++---
 arch/powerpc/kvm/book3s_hv.c          | 5 +++++
 arch/powerpc/perf/core-book3s.c       | 7 +++++++
 4 files changed, 17 insertions(+), 5 deletions(-)

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
index 0a6b36b4bda8..06a089fbeaa7 100644
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
index 1f30f98b09d1..f7349d150828 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -2593,6 +2593,11 @@ static int kvmppc_core_vcpu_create_hv(struct kvm_vcpu *vcpu)
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
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 51622411a7cc..e33b29ec1a65 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -1361,6 +1361,13 @@ static void power_pmu_enable(struct pmu *pmu)
 		goto out;
 
 	if (cpuhw->n_events == 0) {
+		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
+			mtspr(SPRN_MMCRA, MMCRA_BHRB_DISABLE);
+			mtspr(SPRN_MMCR0, MMCR0_FC | MMCR0_PMCCEXT);
+		} else {
+			mtspr(SPRN_MMCRA, 0);
+			mtspr(SPRN_MMCR0, MMCR0_FC);
+		}
 		ppc_set_pmu_inuse(0);
 		goto out;
 	}
-- 
2.23.0

