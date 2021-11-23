Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB6B459FA8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 11:00:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz04M0TCfz3dy5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 21:00:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HPDjXxXv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=HPDjXxXv; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyzwN1K8nz2ypL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 20:53:08 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id m24so16585346pls.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4d63twaUJDv117YIjN0bRVHx7WhvWql9ainllhAXWOE=;
 b=HPDjXxXvQ+1eMpL6QZl7hSMIveiuqLfcGzHVohmsL/OlZiikUWFX/qBGOXeIZClejK
 6GCeQsgOTajq9g0ggfJoyd7CDB+dqUxlv9v/adtmPanbI2JGHR1rWAnBjcYE5ZsNIVTS
 SF1/mB09vmG+F26Pf04VjoeAJPUWJgE0ZyRCsh+QlzxS4zzg52FDafBJ45HDgkugfiAd
 ry6Sg/aTcMzx0s3keKCcuejdlSEDYDataOizvQhXeoQVdQf8JjHeJ9KZzUufJD1AWlDr
 Qyvc5nmnD87hkWziaIKbgnxsNzz4sFyl9y3qqvLG5nhCzxkFCWvKBKozdgW4wjjmTwic
 of9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4d63twaUJDv117YIjN0bRVHx7WhvWql9ainllhAXWOE=;
 b=oCDYsAKYe0JmoGESzKn/QEBJXLrlJGQJQQufjApVi907L1a0NG/nCGruB3a7q5vsNX
 2x0eq0Misxd1/BEub9lchBnEb1ryoVBQWGG6/do4XUbhMLtCdTpyW/7LV+5moAo9Vbwy
 Sg8dTg6rBM83IL4xWYkK9EcASePtI8DMYfeOfuURueHsNqY1zGN1HSfi9EOEoiw3tV4O
 nmR37IlQ4Hv22UU7zdDp69J0bwmxHInKbo033Fk4IVRMz+006LpAM56V/VPRUBTvclJz
 BfiI0yrxii0MKQzPnnbxHvUhITT1Ga0vS6x9I8iS/vIBCWgaOzjnmt968weAzx1aU6Hu
 yB8w==
X-Gm-Message-State: AOAM531UgKe+5Y3yxQw/ngliZwawSW5jF5ae+K5dC0HPehZqqqRpi9Kq
 TlPNHQCpi9NDEKNeNQBWnI+M+QveL35RGQ==
X-Google-Smtp-Source: ABdhPJw827JtB4uKaRjV+itYa22dHxm3C6Tic0xwM9bxROrCqAw8WUzC9f5OdTbLvUXkx4F3nmm5xQ==
X-Received: by 2002:a17:903:300d:b0:142:744f:c74d with SMTP id
 o13-20020a170903300d00b00142744fc74dmr5435324pla.26.1637661186490; 
 Tue, 23 Nov 2021 01:53:06 -0800 (PST)
Received: from bobo.ibm.com ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id j8sm12662176pfc.8.2021.11.23.01.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 01:53:06 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 11/53] powerpc/64s: Always set PMU control registers to
 frozen/disabled when not in use
Date: Tue, 23 Nov 2021 19:51:49 +1000
Message-Id: <20211123095231.1036501-12-npiggin@gmail.com>
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
Cc: Athira Jajeev <atrajeev@linux.vnet.ibm.com>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

KVM PMU management code looks for particular frozen/disabled bits in
the PMU registers so it knows whether it must clear them when coming
out of a guest or not. Setting this up helps KVM make these optimisations
without getting confused. Longer term the better approach might be to
move guest/host PMU switching to the perf subsystem.

Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Reviewed-by: Athira Jajeev <atrajeev@linux.vnet.ibm.com>
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
index de59971319ab..d2b35fb9181d 100644
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
index 6e760f48bbaf..8bf0f6337212 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -2715,6 +2715,11 @@ static int kvmppc_core_vcpu_create_hv(struct kvm_vcpu *vcpu)
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

