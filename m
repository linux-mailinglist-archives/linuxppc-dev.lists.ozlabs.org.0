Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FDE1B1E5F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 07:52:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495t4p0pLQzDqvW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 15:52:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495t360h6BzDr3k
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 15:50:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 495t3526s9z9sPF;
 Tue, 21 Apr 2020 15:50:57 +1000 (AEST)
From: Alistair Popple <alistair@popple.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/dt_cpu_ftrs: Add MMA feature
Date: Tue, 21 Apr 2020 15:50:24 +1000
Message-Id: <20200421055024.20281-1-alistair@popple.id.au>
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
Cc: mikey@neuling.org, npiggin@gmail.com, oohall@gmail.com,
 Alistair Popple <alistair@popple.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

MMA (matrix multiply accumulate) instructions are only permitted to
execute when enabled via a PCR bit. Enable this bit when support is
advertised by a CPU device tree feature.

Signed-off-by: Alistair Popple <alistair@popple.id.au>
---
 arch/powerpc/include/asm/reg.h    |  1 +
 arch/powerpc/kernel/dt_cpu_ftrs.c | 17 ++++++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index da5cab038e25..6366f0223c80 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -476,6 +476,7 @@
 #define   PCR_VEC_DIS	(__MASK(63-0))	/* Vec. disable (bit NA since POWER8) */
 #define   PCR_VSX_DIS	(__MASK(63-1))	/* VSX disable (bit NA since POWER8) */
 #define   PCR_TM_DIS	(__MASK(63-2))	/* Trans. memory disable (POWER8) */
+#define   PCR_MMA_DIS	(__MASK(63-3)) /* Matrix-Multiply Accelerator */
 #define   PCR_HIGH_BITS	(PCR_VEC_DIS | PCR_VSX_DIS | PCR_TM_DIS)
 /*
  * These bits are used in the function kvmppc_set_arch_compat() to specify and
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index 36bc0d5c4f3a..26e811ab94c1 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -74,6 +74,7 @@ static struct {
 	u64	lpcr_clear;
 	u64	hfscr;
 	u64	fscr;
+	u64	pcr;
 } system_registers;
 
 static void (*init_pmu_registers)(void);
@@ -101,7 +102,7 @@ static void __restore_cpu_cpufeatures(void)
 	if (hv_mode) {
 		mtspr(SPRN_LPID, 0);
 		mtspr(SPRN_HFSCR, system_registers.hfscr);
-		mtspr(SPRN_PCR, PCR_MASK);
+		mtspr(SPRN_PCR, system_registers.pcr);
 	}
 	mtspr(SPRN_FSCR, system_registers.fscr);
 
@@ -552,6 +553,18 @@ static int __init feat_enable_large_ci(struct dt_cpu_feature *f)
 	return 1;
 }
 
+static int __init feat_enable_mma(struct dt_cpu_feature *f)
+{
+	u64 pcr;
+
+	feat_enable(f);
+	pcr = mfspr(SPRN_PCR);
+	pcr &= ~PCR_MMA_DIS;
+	mtspr(SPRN_PCR, pcr);
+
+	return 1;
+}
+
 struct dt_cpu_feature_match {
 	const char *name;
 	int (*enable)(struct dt_cpu_feature *f);
@@ -625,6 +638,7 @@ static struct dt_cpu_feature_match __initdata
 	{"vector-binary128", feat_enable, 0},
 	{"vector-binary16", feat_enable, 0},
 	{"wait-v3", feat_enable, 0},
+	{"matrix-multiply-accumulate", feat_enable_mma, 0},
 };
 
 static bool __initdata using_dt_cpu_ftrs;
@@ -770,6 +784,7 @@ static void __init cpufeatures_setup_finished(void)
 	system_registers.lpcr = mfspr(SPRN_LPCR);
 	system_registers.hfscr = mfspr(SPRN_HFSCR);
 	system_registers.fscr = mfspr(SPRN_FSCR);
+	system_registers.pcr = mfspr(SPRN_PCR);
 
 	pr_info("final cpu/mmu features = 0x%016lx 0x%08x\n",
 		cur_cpu_spec->cpu_features, cur_cpu_spec->mmu_features);
-- 
2.20.1

