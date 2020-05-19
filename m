Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 064921D8C88
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 02:47:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49QxzV06n5zDqLS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 10:47:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Qxgd6NQpzDqKf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 10:33:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49Qxgc6vNHz9sTc;
 Tue, 19 May 2020 10:33:16 +1000 (AEST)
From: Alistair Popple <alistair@popple.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 6/7] powerpc/dt_cpu_ftrs: Add MMA feature
Date: Tue, 19 May 2020 10:31:56 +1000
Message-Id: <20200519003157.31946-7-alistair@popple.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200519003157.31946-1-alistair@popple.id.au>
References: <20200519003157.31946-1-alistair@popple.id.au>
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
Cc: mikey@neuling.org, npiggin@gmail.com, aneesh.kumar@linux.ibm.com,
 Alistair Popple <alistair@popple.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Matrix multiple accumulate (MMA) is a new feature added to ISAv3.1 and
POWER10. Support on powernv can be selected via a firmware CPU device
tree feature which enables it via a PCR bit.

Signed-off-by: Alistair Popple <alistair@popple.id.au>
---
 arch/powerpc/include/asm/reg.h    |  3 ++-
 arch/powerpc/kernel/dt_cpu_ftrs.c | 17 ++++++++++++++++-
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 1931b1142599..c446863a40cf 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -479,7 +479,8 @@
 #define   PCR_VEC_DIS	(__MASK(63-0))	/* Vec. disable (bit NA since POWER8) */
 #define   PCR_VSX_DIS	(__MASK(63-1))	/* VSX disable (bit NA since POWER8) */
 #define   PCR_TM_DIS	(__MASK(63-2))	/* Trans. memory disable (POWER8) */
-#define   PCR_HIGH_BITS	(PCR_VEC_DIS | PCR_VSX_DIS | PCR_TM_DIS)
+#define   PCR_MMA_DIS	(__MASK(63-3)) /* Matrix-Multiply Accelerator */
+#define   PCR_HIGH_BITS	(PCR_MMA_DIS | PCR_VEC_DIS | PCR_VSX_DIS | PCR_TM_DIS)
 /*
  * These bits are used in the function kvmppc_set_arch_compat() to specify and
  * determine both the compatibility level which we want to emulate and the
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index 93c340906aad..e7540ee5cad8 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -75,6 +75,7 @@ static struct {
 	u64	lpcr_clear;
 	u64	hfscr;
 	u64	fscr;
+	u64	pcr;
 } system_registers;
 
 static void (*init_pmu_registers)(void);
@@ -102,7 +103,7 @@ static void __restore_cpu_cpufeatures(void)
 	if (hv_mode) {
 		mtspr(SPRN_LPID, 0);
 		mtspr(SPRN_HFSCR, system_registers.hfscr);
-		mtspr(SPRN_PCR, PCR_MASK);
+		mtspr(SPRN_PCR, system_registers.pcr);
 	}
 	mtspr(SPRN_FSCR, system_registers.fscr);
 
@@ -555,6 +556,18 @@ static int __init feat_enable_large_ci(struct dt_cpu_feature *f)
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
@@ -629,6 +642,7 @@ static struct dt_cpu_feature_match __initdata
 	{"vector-binary16", feat_enable, 0},
 	{"wait-v3", feat_enable, 0},
 	{"prefix-instructions", feat_enable, 0},
+	{"matrix-multiply-accumulate", feat_enable_mma, 0},
 };
 
 static bool __initdata using_dt_cpu_ftrs;
@@ -779,6 +793,7 @@ static void __init cpufeatures_setup_finished(void)
 	system_registers.lpcr = mfspr(SPRN_LPCR);
 	system_registers.hfscr = mfspr(SPRN_HFSCR);
 	system_registers.fscr = mfspr(SPRN_FSCR);
+	system_registers.pcr = mfspr(SPRN_PCR);
 
 	pr_info("final cpu/mmu features = 0x%016lx 0x%08x\n",
 		cur_cpu_spec->cpu_features, cur_cpu_spec->mmu_features);
-- 
2.20.1

