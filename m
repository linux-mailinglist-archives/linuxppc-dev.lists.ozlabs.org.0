Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EF385CF60
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 05:48:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GbnN26R+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfkKs1DKgz3dDq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 15:48:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GbnN26R+;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfkJF0zhLz3bx2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 15:46:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1708490795;
	bh=v8Rm1u8fU2Rj5MvUP3rCMSv8Lan4BOkATbDS4M86uDU=;
	h=From:To:Cc:Subject:Date:From;
	b=GbnN26R+gZospe7EgTzJsgs8AYja+Kf6DCCTOkrF/3K0eCtzt4WLRDHC6kgBRKjpy
	 F7ZyxgTV51Y4INBNgBUl8ml66BVKhAjTeT4fI9NaOLX4cTJIN4Ndzf8s+JK/9wD3Y4
	 muHQptjqkRS4XqdxfomKko6Y2wcatoPSOczS6qth4ydpPhRWo1kafymYd3noL0okTO
	 qKncMJ5pJvsMzq8dTRMbY9D1z2vI2lMpeEwyMoyTbCz+TPOtPYPJHQ8HcYgickWR+N
	 anebCtrZJRWaDGEUNDJygxmnTXR2K6hE5MBHt7DkrnTlDi9GQUqR+1wt+kvNwg+ock
	 7jvTMK6CMFbvg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TfkJC4SWbz4wbr;
	Wed, 21 Feb 2024 15:46:35 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v4 1/2] powerpc: Add Power11 architected and raw mode
Date: Wed, 21 Feb 2024 15:46:22 +1100
Message-ID: <20240221044623.1598642-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.43.1
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
Cc: maddy@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Madhavan Srinivasan <maddy@linux.ibm.com>

Add CPU table entries for raw and architected mode. Most fields are
copied from the Power10 table entries.

CPU, MMU and user (ELF_HWCAP) features are unchanged vs P10. However
userspace can detect P11 because the AT_PLATFORM value changes to
"power11".

The logical PVR value of 0x0F000007, passed to firmware via the
ibm_arch_vec, indicates the kernel can support a P11 compatible CPU,
which means at least ISA v3.1 compliant.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/cputable.h       |  3 ++
 arch/powerpc/include/asm/mmu.h            |  1 +
 arch/powerpc/include/asm/reg.h            |  2 ++
 arch/powerpc/kernel/cpu_specs_book3s_64.h | 34 +++++++++++++++++++++++
 arch/powerpc/kernel/dt_cpu_ftrs.c         | 10 +++++++
 arch/powerpc/kernel/prom_init.c           | 10 ++++++-
 arch/powerpc/kvm/book3s_hv.c              |  1 +
 7 files changed, 60 insertions(+), 1 deletion(-)

v4: mpe: Rename PVR_ARCH_31N to PVR_ARCH_31_P11, to clarify that it indicates
P11 compatibility. Flesh out change log with some more detail.

diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index 48471ca388dd..07a204d21034 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -454,6 +454,9 @@ static inline void cpu_feature_keys_init(void) { }
 	    CPU_FTR_ARCH_300 | CPU_FTR_ARCH_31 | \
 	    CPU_FTR_DAWR | CPU_FTR_DAWR1 | \
 	    CPU_FTR_DEXCR_NPHIE)
+
+#define CPU_FTRS_POWER11	CPU_FTRS_POWER10
+
 #define CPU_FTRS_CELL	(CPU_FTR_LWSYNC | \
 	    CPU_FTR_PPCAS_ARCH_V2 | CPU_FTR_CTRL | \
 	    CPU_FTR_ALTIVEC_COMP | CPU_FTR_MMCRA | CPU_FTR_SMT | \
diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
index d8b7e246a32f..61ebe5eff2c9 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -133,6 +133,7 @@
 #define MMU_FTRS_POWER8		MMU_FTRS_POWER6
 #define MMU_FTRS_POWER9		MMU_FTRS_POWER6
 #define MMU_FTRS_POWER10	MMU_FTRS_POWER6
+#define MMU_FTRS_POWER11	MMU_FTRS_POWER6
 #define MMU_FTRS_CELL		MMU_FTRS_DEFAULT_HPTE_ARCH_V2 | \
 				MMU_FTR_CI_LARGE_PAGE
 #define MMU_FTRS_PA6T		MMU_FTRS_DEFAULT_HPTE_ARCH_V2 | \
diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 7fd09f25452d..58d6348e4ea0 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -1364,6 +1364,7 @@
 #define PVR_HX_C2000	0x0066
 #define PVR_POWER9	0x004E
 #define PVR_POWER10	0x0080
+#define PVR_POWER11	0x0082
 #define PVR_BE		0x0070
 #define PVR_PA6T	0x0090
 
@@ -1375,6 +1376,7 @@
 #define PVR_ARCH_207	0x0f000004
 #define PVR_ARCH_300	0x0f000005
 #define PVR_ARCH_31	0x0f000006
+#define PVR_ARCH_31_P11	0x0f000007
 
 /* Macros for setting and retrieving special purpose registers */
 #ifndef __ASSEMBLY__
diff --git a/arch/powerpc/kernel/cpu_specs_book3s_64.h b/arch/powerpc/kernel/cpu_specs_book3s_64.h
index 3ff9757df4c0..98d4274a1b6b 100644
--- a/arch/powerpc/kernel/cpu_specs_book3s_64.h
+++ b/arch/powerpc/kernel/cpu_specs_book3s_64.h
@@ -60,6 +60,9 @@
 				 PPC_FEATURE2_ISEL | PPC_FEATURE2_TAR | \
 				 PPC_FEATURE2_VEC_CRYPTO)
 
+#define COMMON_USER_POWER11	COMMON_USER_POWER10
+#define COMMON_USER2_POWER11	COMMON_USER2_POWER10
+
 static struct cpu_spec cpu_specs[] __initdata = {
 	{	/* PPC970 */
 		.pvr_mask		= 0xffff0000,
@@ -281,6 +284,20 @@ static struct cpu_spec cpu_specs[] __initdata = {
 		.cpu_restore		= __restore_cpu_power10,
 		.platform		= "power10",
 	},
+	{	/* 3.1-compliant processor, i.e. Power11 "architected" mode */
+		.pvr_mask		= 0xffffffff,
+		.pvr_value		= 0x0f000007,
+		.cpu_name		= "Power11 (architected)",
+		.cpu_features		= CPU_FTRS_POWER11,
+		.cpu_user_features	= COMMON_USER_POWER11,
+		.cpu_user_features2	= COMMON_USER2_POWER11,
+		.mmu_features		= MMU_FTRS_POWER11,
+		.icache_bsize		= 128,
+		.dcache_bsize		= 128,
+		.cpu_setup		= __setup_cpu_power10,
+		.cpu_restore		= __restore_cpu_power10,
+		.platform		= "power11",
+	},
 	{	/* Power7 */
 		.pvr_mask		= 0xffff0000,
 		.pvr_value		= 0x003f0000,
@@ -451,6 +468,23 @@ static struct cpu_spec cpu_specs[] __initdata = {
 		.machine_check_early	= __machine_check_early_realmode_p10,
 		.platform		= "power10",
 	},
+	{	/* Power11 */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x00820000,
+		.cpu_name		= "Power11 (raw)",
+		.cpu_features		= CPU_FTRS_POWER11,
+		.cpu_user_features	= COMMON_USER_POWER11,
+		.cpu_user_features2	= COMMON_USER2_POWER11,
+		.mmu_features		= MMU_FTRS_POWER11,
+		.icache_bsize		= 128,
+		.dcache_bsize		= 128,
+		.num_pmcs		= 6,
+		.pmc_type		= PPC_PMC_IBM,
+		.cpu_setup		= __setup_cpu_power10,
+		.cpu_restore		= __restore_cpu_power10,
+		.machine_check_early	= __machine_check_early_realmode_p10,
+		.platform		= "power11",
+	},
 	{	/* Cell Broadband Engine */
 		.pvr_mask		= 0xffff0000,
 		.pvr_value		= 0x00700000,
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index c3fb9fdf5bd7..af4263594eb2 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -458,6 +458,14 @@ static int __init feat_enable_mce_power10(struct dt_cpu_feature *f)
 	return 1;
 }
 
+static int __init feat_enable_mce_power11(struct dt_cpu_feature *f)
+{
+	cur_cpu_spec->platform = "power11";
+	cur_cpu_spec->machine_check_early = __machine_check_early_realmode_p10;
+
+	return 1;
+}
+
 static int __init feat_enable_tm(struct dt_cpu_feature *f)
 {
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
@@ -648,8 +656,10 @@ static struct dt_cpu_feature_match __initdata
 	{"pc-relative-addressing", feat_enable, 0},
 	{"machine-check-power9", feat_enable_mce_power9, 0},
 	{"machine-check-power10", feat_enable_mce_power10, 0},
+	{"machine-check-power11", feat_enable_mce_power11, 0},
 	{"performance-monitor-power9", feat_enable_pmu_power9, 0},
 	{"performance-monitor-power10", feat_enable_pmu_power10, 0},
+	{"performance-monitor-power11", feat_enable_pmu_power10, 0},
 	{"event-based-branch-v3", feat_enable, 0},
 	{"random-number-generator", feat_enable, 0},
 	{"system-call-vectored", feat_disable, 0},
diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index e67effdba85c..0ef358285337 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -947,7 +947,7 @@ struct option_vector7 {
 } __packed;
 
 struct ibm_arch_vec {
-	struct { __be32 mask, val; } pvrs[14];
+	struct { __be32 mask, val; } pvrs[16];
 
 	u8 num_vectors;
 
@@ -1007,6 +1007,14 @@ static const struct ibm_arch_vec ibm_architecture_vec_template __initconst = {
 			.mask = cpu_to_be32(0xffff0000), /* POWER10 */
 			.val  = cpu_to_be32(0x00800000),
 		},
+		{
+			.mask = cpu_to_be32(0xffff0000), /* POWER11 */
+			.val  = cpu_to_be32(0x00820000),
+		},
+		{
+			.mask = cpu_to_be32(0xffffffff), /* P11 compliant */
+			.val  = cpu_to_be32(0x0f000007),
+		},
 		{
 			.mask = cpu_to_be32(0xffffffff), /* all 3.1-compliant */
 			.val  = cpu_to_be32(0x0f000006),
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 52427fc2a33f..0ee7395caa21 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -427,6 +427,7 @@ static int kvmppc_set_arch_compat(struct kvm_vcpu *vcpu, u32 arch_compat)
 			cap = H_GUEST_CAP_POWER9;
 			break;
 		case PVR_ARCH_31:
+		case PVR_ARCH_31_P11:
 			guest_pcr_bit = PCR_ARCH_31;
 			cap = H_GUEST_CAP_POWER10;
 			break;
-- 
2.43.1

