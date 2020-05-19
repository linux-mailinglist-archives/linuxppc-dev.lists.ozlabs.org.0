Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B40431D8C89
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 02:48:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Qy1G6vz8zDqJC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 10:48:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Qxgf4TFjzDqL2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 10:33:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49Qxgf29kNz9sTn;
 Tue, 19 May 2020 10:33:18 +1000 (AEST)
From: Alistair Popple <alistair@popple.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 7/7] powerpc: Add POWER10 architected mode
Date: Tue, 19 May 2020 10:31:57 +1000
Message-Id: <20200519003157.31946-8-alistair@popple.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200519003157.31946-1-alistair@popple.id.au>
References: <20200519003157.31946-1-alistair@popple.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 Alistair Popple <alistair@popple.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PVR value of 0x0F000006 means we are arch v3.1 compliant (i.e. POWER10).
This is used by phyp and kvm when booting as a pseries guest to detect
the presence of new P10 features and to enable the appropriate hwcap and
facility bits.

Signed-off-by: Alistair Popple <alistair@popple.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/include/asm/cputable.h   | 15 ++++++++++++--
 arch/powerpc/include/asm/mmu.h        |  1 +
 arch/powerpc/include/asm/prom.h       |  1 +
 arch/powerpc/kernel/cpu_setup_power.S | 20 ++++++++++++++++--
 arch/powerpc/kernel/cputable.c        | 30 +++++++++++++++++++++++++++
 arch/powerpc/kernel/prom_init.c       | 12 +++++++++--
 6 files changed, 73 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index 36f894dea9e7..10b6d93c9d0b 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -468,6 +468,17 @@ static inline void cpu_feature_keys_init(void) { }
 #define CPU_FTRS_POWER9_DD2_2 (CPU_FTRS_POWER9 | CPU_FTR_POWER9_DD2_1 | \
 			       CPU_FTR_P9_TM_HV_ASSIST | \
 			       CPU_FTR_P9_TM_XER_SO_BUG)
+#define CPU_FTRS_POWER10 (CPU_FTR_LWSYNC | \
+	    CPU_FTR_PPCAS_ARCH_V2 | CPU_FTR_CTRL | CPU_FTR_ARCH_206 |\
+	    CPU_FTR_MMCRA | CPU_FTR_SMT | \
+	    CPU_FTR_COHERENT_ICACHE | \
+	    CPU_FTR_PURR | CPU_FTR_SPURR | CPU_FTR_REAL_LE | \
+	    CPU_FTR_DSCR | CPU_FTR_SAO  | \
+	    CPU_FTR_STCX_CHECKS_ADDRESS | CPU_FTR_POPCNTB | CPU_FTR_POPCNTD | \
+	    CPU_FTR_CFAR | CPU_FTR_HVMODE | CPU_FTR_VMX_COPY | \
+	    CPU_FTR_DBELL | CPU_FTR_HAS_PPR | CPU_FTR_ARCH_207S | \
+	    CPU_FTR_TM_COMP | CPU_FTR_ARCH_300 | CPU_FTR_PKEY | \
+	    CPU_FTR_ARCH_31)
 #define CPU_FTRS_CELL	(CPU_FTR_LWSYNC | \
 	    CPU_FTR_PPCAS_ARCH_V2 | CPU_FTR_CTRL | \
 	    CPU_FTR_ALTIVEC_COMP | CPU_FTR_MMCRA | CPU_FTR_SMT | \
@@ -486,14 +497,14 @@ static inline void cpu_feature_keys_init(void) { }
 #define CPU_FTRS_POSSIBLE	\
 	    (CPU_FTRS_POWER7 | CPU_FTRS_POWER8E | CPU_FTRS_POWER8 | \
 	     CPU_FTR_ALTIVEC_COMP | CPU_FTR_VSX_COMP | CPU_FTRS_POWER9 | \
-	     CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2)
+	     CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10)
 #else
 #define CPU_FTRS_POSSIBLE	\
 	    (CPU_FTRS_PPC970 | CPU_FTRS_POWER5 | \
 	     CPU_FTRS_POWER6 | CPU_FTRS_POWER7 | CPU_FTRS_POWER8E | \
 	     CPU_FTRS_POWER8 | CPU_FTRS_CELL | CPU_FTRS_PA6T | \
 	     CPU_FTR_VSX_COMP | CPU_FTR_ALTIVEC_COMP | CPU_FTRS_POWER9 | \
-	     CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2)
+	     CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10)
 #endif /* CONFIG_CPU_LITTLE_ENDIAN */
 #endif
 #else
diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
index 0699cfeeb8c9..17b19510f204 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -122,6 +122,7 @@
 #define MMU_FTRS_POWER7		MMU_FTRS_POWER6
 #define MMU_FTRS_POWER8		MMU_FTRS_POWER6
 #define MMU_FTRS_POWER9		MMU_FTRS_POWER6
+#define MMU_FTRS_POWER10	MMU_FTRS_POWER6
 #define MMU_FTRS_CELL		MMU_FTRS_DEFAULT_HPTE_ARCH_V2 | \
 				MMU_FTR_CI_LARGE_PAGE
 #define MMU_FTRS_PA6T		MMU_FTRS_DEFAULT_HPTE_ARCH_V2 | \
diff --git a/arch/powerpc/include/asm/prom.h b/arch/powerpc/include/asm/prom.h
index 94e3fd54f2c8..324a13351749 100644
--- a/arch/powerpc/include/asm/prom.h
+++ b/arch/powerpc/include/asm/prom.h
@@ -117,6 +117,7 @@ extern int of_read_drc_info_cell(struct property **prop,
 #define OV1_PPC_2_07		0x01	/* set if we support PowerPC 2.07 */
 
 #define OV1_PPC_3_00		0x80	/* set if we support PowerPC 3.00 */
+#define OV1_PPC_3_1			0x40	/* set if we support PowerPC 3.1 */
 
 /* Option vector 2: Open Firmware options supported */
 #define OV2_REAL_MODE		0x20	/* set if we want OF in real mode */
diff --git a/arch/powerpc/kernel/cpu_setup_power.S b/arch/powerpc/kernel/cpu_setup_power.S
index a460298c7ddb..f3730cf904fa 100644
--- a/arch/powerpc/kernel/cpu_setup_power.S
+++ b/arch/powerpc/kernel/cpu_setup_power.S
@@ -91,10 +91,15 @@ _GLOBAL(__restore_cpu_power8)
 	mtlr	r11
 	blr
 
+_GLOBAL(__setup_cpu_power10)
+	mflr	r11
+	bl	__init_FSCR_P10
+	b	1f
+
 _GLOBAL(__setup_cpu_power9)
 	mflr	r11
 	bl	__init_FSCR
-	bl	__init_PMU
+1:	bl	__init_PMU
 	bl	__init_hvmode_206
 	mtlr	r11
 	beqlr
@@ -116,10 +121,15 @@ _GLOBAL(__setup_cpu_power9)
 	mtlr	r11
 	blr
 
+_GLOBAL(__restore_cpu_power10)
+	mflr	r11
+	bl	__init_FSCR_P10
+	b	1f
+
 _GLOBAL(__restore_cpu_power9)
 	mflr	r11
 	bl	__init_FSCR
-	bl	__init_PMU
+1:	bl	__init_PMU
 	mfmsr	r3
 	rldicl.	r0,r3,4,63
 	mtlr	r11
@@ -182,6 +192,12 @@ __init_LPCR_ISA300:
 	isync
 	blr
 
+__init_FSCR_P10:
+	mfspr	r3,SPRN_FSCR
+	ori	r3,r3,FSCR_TAR|FSCR_DSCR|FSCR_EBB|FSCR_PREFIX
+	mtspr	SPRN_FSCR,r3
+	blr
+
 __init_FSCR:
 	mfspr	r3,SPRN_FSCR
 	ori	r3,r3,FSCR_TAR|FSCR_DSCR|FSCR_EBB
diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
index 13eba2eb46fe..a17eeb311cdb 100644
--- a/arch/powerpc/kernel/cputable.c
+++ b/arch/powerpc/kernel/cputable.c
@@ -70,6 +70,8 @@ extern void __setup_cpu_power8(unsigned long offset, struct cpu_spec* spec);
 extern void __restore_cpu_power8(void);
 extern void __setup_cpu_power9(unsigned long offset, struct cpu_spec* spec);
 extern void __restore_cpu_power9(void);
+extern void __setup_cpu_power10(unsigned long offset, struct cpu_spec* spec);
+extern void __restore_cpu_power10(void);
 extern long __machine_check_early_realmode_p7(struct pt_regs *regs);
 extern long __machine_check_early_realmode_p8(struct pt_regs *regs);
 extern long __machine_check_early_realmode_p9(struct pt_regs *regs);
@@ -119,6 +121,10 @@ extern void __restore_cpu_e6500(void);
 				 PPC_FEATURE2_ARCH_3_00 | \
 				 PPC_FEATURE2_HAS_IEEE128 | \
 				 PPC_FEATURE2_DARN )
+#define COMMON_USER_POWER10	COMMON_USER_POWER9
+#define COMMON_USER2_POWER10	(COMMON_USER2_POWER9 | \
+				 PPC_FEATURE2_ARCH_3_1 | \
+				 PPC_FEATURE2_MMA)
 
 #ifdef CONFIG_PPC_BOOK3E_64
 #define COMMON_USER_BOOKE	(COMMON_USER_PPC64 | PPC_FEATURE_BOOKE)
@@ -127,6 +133,14 @@ extern void __restore_cpu_e6500(void);
 				 PPC_FEATURE_BOOKE)
 #endif
 
+#ifdef CONFIG_PPC64
+static void setup_cpu_power10(unsigned long offset, struct cpu_spec* spec)
+{
+	__setup_cpu_power10(offset, spec);
+	current->thread.fscr |= FSCR_PREFIX;
+}
+#endif
+
 static struct cpu_spec __initdata cpu_specs[] = {
 #ifdef CONFIG_PPC_BOOK3S_64
 	{	/* PPC970 */
@@ -367,6 +381,22 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.cpu_restore		= __restore_cpu_power9,
 		.platform		= "power9",
 	},
+	{	/* 3.1-compliant processor, i.e. Power10 "architected" mode */
+		.pvr_mask		= 0xffffffff,
+		.pvr_value		= 0x0f000006,
+		.cpu_name		= "POWER10 (architected)",
+		.cpu_features		= CPU_FTRS_POWER10,
+		.cpu_user_features	= COMMON_USER_POWER10,
+		.cpu_user_features2	= COMMON_USER2_POWER10,
+		.mmu_features		= MMU_FTRS_POWER10,
+		.icache_bsize		= 128,
+		.dcache_bsize		= 128,
+		.oprofile_type		= PPC_OPROFILE_INVALID,
+		.oprofile_cpu_type	= "ppc64/ibm-compat-v1",
+		.cpu_setup		= setup_cpu_power10,
+		.cpu_restore		= __restore_cpu_power10,
+		.platform		= "power10",
+	},
 	{	/* Power7 */
 		.pvr_mask		= 0xffff0000,
 		.pvr_value		= 0x003f0000,
diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 806be751c336..1ecadbd7e8b2 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -920,7 +920,7 @@ struct option_vector6 {
 } __packed;
 
 struct ibm_arch_vec {
-	struct { u32 mask, val; } pvrs[12];
+	struct { u32 mask, val; } pvrs[14];
 
 	u8 num_vectors;
 
@@ -973,6 +973,14 @@ static const struct ibm_arch_vec ibm_architecture_vec_template __initconst = {
 			.mask = cpu_to_be32(0xffff0000), /* POWER9 */
 			.val  = cpu_to_be32(0x004e0000),
 		},
+		{
+			.mask = cpu_to_be32(0xffff0000), /* POWER10 */
+			.val  = cpu_to_be32(0x00800000),
+		},
+		{
+			.mask = cpu_to_be32(0xffffffff), /* all 3.1-compliant */
+			.val  = cpu_to_be32(0x0f000006),
+		},
 		{
 			.mask = cpu_to_be32(0xffffffff), /* all 3.00-compliant */
 			.val  = cpu_to_be32(0x0f000005),
@@ -1002,7 +1010,7 @@ static const struct ibm_arch_vec ibm_architecture_vec_template __initconst = {
 		.byte1 = 0,
 		.arch_versions = OV1_PPC_2_00 | OV1_PPC_2_01 | OV1_PPC_2_02 | OV1_PPC_2_03 |
 				 OV1_PPC_2_04 | OV1_PPC_2_05 | OV1_PPC_2_06 | OV1_PPC_2_07,
-		.arch_versions3 = OV1_PPC_3_00,
+		.arch_versions3 = OV1_PPC_3_00 | OV1_PPC_3_1,
 	},
 
 	.vec2_len = VECTOR_LENGTH(sizeof(struct option_vector2)),
-- 
2.20.1

