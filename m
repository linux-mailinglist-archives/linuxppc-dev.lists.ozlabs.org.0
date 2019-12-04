Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6E71137FE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2019 00:08:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Svf847sVzDqSn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2019 10:08:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WOgaivyj"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Svbv2MDpzDqST
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2019 10:06:16 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id b19so600132pfd.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Dec 2019 15:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gHjbdz8YjglfRyBOQRN/xcfeVAsHrq3SRybElugHfXs=;
 b=WOgaivyjec8eNc7t/z/69gcnZ/tfy4hJffPd8m2IrtyDPvRQr3G2j6nG07CG2TGoCX
 Rzy2HnJ1Vs9kLN1fjNjV+eC0+eUCM7aXHvsTlvWAQRuSvZBLkDsnY32o/CcYgvAoyBYM
 X7Q6VtONRRCMXZA6dDXObNbnIqoy5LaInC9VGt/JGCEoO+PYJau48csR6XcRjgA/uu/X
 gMWFzqZ4d2lemYk55mInJlQYdtHBTbXElcfBSlnfrmuo9SOWrcpMRIWzekgOfYvjI9+l
 r5bjLVS4UNCzoqIxMvHpt7UNmePvP6+GJXzw8Gp7Og0QAPOfOoJXs47HhAIh2G4RsUHl
 4FYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gHjbdz8YjglfRyBOQRN/xcfeVAsHrq3SRybElugHfXs=;
 b=ZpfiErNNfWYV0oL18KRANBRruccOMdayJCPYclBgqjlHFisPVYggLYL64ogUTwqP01
 zWqkt4DjaTrKZKP89eyUpyFa1f5vBLQV0pRhxCRwNCUDo7WrSrw3S0IPIov9VTwcHS4W
 w3KE8iREHjXJf5BNFYdStDXHkk1gQ+HIDhfRAPor1SDVqVhRd69w0OSr9SWtJGpcGbO+
 RoOPYSR21L3XiFlur+Tzb1W6lINb4BVZsk8AN0qW7mSShoGw0cnXhs+ufEdnLEHtf02s
 F77I+eAHoPoQvi2npdX80I1bPmlsXMIraxonMTAO1VpWUJ+vJ4fYoMu5jJ7ekk3NFSqe
 aKyA==
X-Gm-Message-State: APjAAAUQmZ38jY1sFlTuG+Nl4OmEFRb43G7D/GXzrypjQSNcRgBR8nc9
 UfSaHbtVoemrFK134fZR1nKc6tZjFD8=
X-Google-Smtp-Source: APXvYqxs4dYZg/KwhQ5UGxhF1Q5lBhQQd8YBuClZ4a8U+GLRMeiPsj79W6q9+SVIHYLExSq5nxObhQ==
X-Received: by 2002:a63:fc5d:: with SMTP id r29mr6184652pgk.282.1575500772790; 
 Wed, 04 Dec 2019 15:06:12 -0800 (PST)
Received: from sol.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id j28sm8672575pgb.36.2019.12.04.15.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 15:06:12 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
	kvm-ppc@vger.kernel.org
Subject: [PATCH v2] powerpc/mm: Remove kvm radix prefetch workaround for
 Power9 DD2.2
Date: Thu,  5 Dec 2019 10:05:19 +1100
Message-Id: <20191204230519.5987-1-jniethe5@gmail.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Jordan Niethe <jniethe5@gmail.com>, oohall@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit a25bd72badfa ("powerpc/mm/radix: Workaround prefetch issue with
KVM") introduced a number of workarounds as coming out of a guest with
the mmu enabled would make the cpu would start running in hypervisor
state with the PID value from the guest. The cpu will then start
prefetching for the hypervisor with that PID value.

In Power9 DD2.2 the cpu behaviour was modified to fix this. When
accessing Quadrant 0 in hypervisor mode with LPID != 0 prefetching will
not be performed. This means that we can get rid of the workarounds for
Power9 DD2.2 and later revisions. Add a new cpu feature
CPU_FTR_P9_RADIX_PREFETCH_BUG to indicate if the workarounds are needed.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v2: Use a cpu feature instead of open coding the PVR check
---
 arch/powerpc/include/asm/cputable.h      |  6 ++++--
 arch/powerpc/kernel/dt_cpu_ftrs.c        | 13 ++++++++-----
 arch/powerpc/kvm/book3s_hv_rmhandlers.S  |  2 ++
 arch/powerpc/mm/book3s64/radix_pgtable.c |  6 +++++-
 arch/powerpc/mm/book3s64/radix_tlb.c     |  3 +++
 5 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index cf00ff0d121d..944a39c4c3a0 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -212,6 +212,7 @@ static inline void cpu_feature_keys_init(void) { }
 #define CPU_FTR_P9_TLBIE_STQ_BUG	LONG_ASM_CONST(0x0000400000000000)
 #define CPU_FTR_P9_TIDR			LONG_ASM_CONST(0x0000800000000000)
 #define CPU_FTR_P9_TLBIE_ERAT_BUG	LONG_ASM_CONST(0x0001000000000000)
+#define CPU_FTR_P9_RADIX_PREFETCH_BUG	LONG_ASM_CONST(0x0002000000000000)
 
 #ifndef __ASSEMBLY__
 
@@ -459,8 +460,9 @@ static inline void cpu_feature_keys_init(void) { }
 	    CPU_FTR_DBELL | CPU_FTR_HAS_PPR | CPU_FTR_ARCH_207S | \
 	    CPU_FTR_TM_COMP | CPU_FTR_ARCH_300 | CPU_FTR_PKEY | \
 	    CPU_FTR_P9_TLBIE_STQ_BUG | CPU_FTR_P9_TLBIE_ERAT_BUG | CPU_FTR_P9_TIDR)
-#define CPU_FTRS_POWER9_DD2_0 CPU_FTRS_POWER9
-#define CPU_FTRS_POWER9_DD2_1 (CPU_FTRS_POWER9 | CPU_FTR_POWER9_DD2_1)
+#define CPU_FTRS_POWER9_DD2_0 CPU_FTRS_POWER9 | CPU_FTR_P9_RADIX_PREFETCH_BUG
+#define CPU_FTRS_POWER9_DD2_1 (CPU_FTRS_POWER9 | CPU_FTR_P9_RADIX_PREFETCH_BUG | \
+			       CPU_FTR_POWER9_DD2_1)
 #define CPU_FTRS_POWER9_DD2_2 (CPU_FTRS_POWER9 | CPU_FTR_POWER9_DD2_1 | \
 			       CPU_FTR_P9_TM_HV_ASSIST | \
 			       CPU_FTR_P9_TM_XER_SO_BUG)
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index 180b3a5d1001..182b4047c1ef 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -727,17 +727,20 @@ static __init void cpufeatures_cpu_quirks(void)
 	/*
 	 * Not all quirks can be derived from the cpufeatures device tree.
 	 */
-	if ((version & 0xffffefff) == 0x004e0200)
-		; /* DD2.0 has no feature flag */
-	else if ((version & 0xffffefff) == 0x004e0201)
+	if ((version & 0xffffefff) == 0x004e0200) {
+		/* DD2.0 has no feature flag */
+		cur_cpu_spec->cpu_features |= CPU_FTR_P9_RADIX_PREFETCH_BUG;
+	} else if ((version & 0xffffefff) == 0x004e0201) {
 		cur_cpu_spec->cpu_features |= CPU_FTR_POWER9_DD2_1;
-	else if ((version & 0xffffefff) == 0x004e0202) {
+		cur_cpu_spec->cpu_features |= CPU_FTR_P9_RADIX_PREFETCH_BUG;
+	} else if ((version & 0xffffefff) == 0x004e0202) {
 		cur_cpu_spec->cpu_features |= CPU_FTR_P9_TM_HV_ASSIST;
 		cur_cpu_spec->cpu_features |= CPU_FTR_P9_TM_XER_SO_BUG;
 		cur_cpu_spec->cpu_features |= CPU_FTR_POWER9_DD2_1;
-	} else if ((version & 0xffff0000) == 0x004e0000)
+	} else if ((version & 0xffff0000) == 0x004e0000) {
 		/* DD2.1 and up have DD2_1 */
 		cur_cpu_spec->cpu_features |= CPU_FTR_POWER9_DD2_1;
+	}
 
 	if ((version & 0xffff0000) == 0x004e0000) {
 		cur_cpu_spec->cpu_features &= ~(CPU_FTR_DAWR);
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index faebcbb8c4db..72b08bb17200 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -1793,6 +1793,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
 	tlbsync
 	ptesync
 
+BEGIN_FTR_SECTION
 	/* Radix: Handle the case where the guest used an illegal PID */
 	LOAD_REG_ADDR(r4, mmu_base_pid)
 	lwz	r3, VCPU_GUEST_PID(r9)
@@ -1822,6 +1823,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
 	addi	r7,r7,0x1000
 	bdnz	1b
 	ptesync
+END_FTR_SECTION_IFSET(CPU_FTR_P9_RADIX_PREFETCH_BUG)
 
 2:
 #endif /* CONFIG_PPC_RADIX_MMU */
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 6ee17d09649c..25cd2a5a6f9f 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -336,7 +336,11 @@ static void __init radix_init_pgtable(void)
 	}
 
 	/* Find out how many PID bits are supported */
-	if (cpu_has_feature(CPU_FTR_HVMODE)) {
+	if (!cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG)) {
+		if (!mmu_pid_bits)
+			mmu_pid_bits = 20;
+		mmu_base_pid = 1;
+	} else if (cpu_has_feature(CPU_FTR_HVMODE)) {
 		if (!mmu_pid_bits)
 			mmu_pid_bits = 20;
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 67af871190c6..d3ab36b33650 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -1221,6 +1221,9 @@ extern void radix_kvm_prefetch_workaround(struct mm_struct *mm)
 	if (unlikely(pid == MMU_NO_CONTEXT))
 		return;
 
+	if (!cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG))
+		return;
+
 	/*
 	 * If this context hasn't run on that CPU before and KVM is
 	 * around, there's a slim chance that the guest on another
-- 
2.20.1

