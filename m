Return-Path: <linuxppc-dev+bounces-373-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D8A95B99F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 17:13:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRXC1W3Zz2yvv;
	Fri, 23 Aug 2024 01:12:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724339563;
	cv=none; b=forPrKF2sQig/s5incbBZ/SDVb4bvr09240dpeWWM9H3goju2YrUwq9jduBPe3x7eenjPwHCVXMuE5j+/CBkpxFACu6rGlrTFFqg80vMz0N2Z3N5FTpptHFVOTNPfaczfTAooW2CVdYSMpVMUO5tf5/C/0nZoClyj0/gvzVAfzKDuluf9TNh5bQxduZ9hy8ezyYEvit7ytd10yvRtKIn+5vNEBhSPTAmcNhAUCsIISEgYyxZIgrGL47JA1It6Z3EAc/6itIhHx0swhRHSPkXqnTKSsBtJtqS0pcmz7kyn3/x6Ql/n8/xQKxxrqfYPSWAhaJbl7WdIRTVmeXocz8wgg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724339563; c=relaxed/relaxed;
	bh=uaX6trArFeDfzKeMq11RpmT+ufgxQad5zCSBp11VlPc=;
	h=Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding; b=k1vGBf/RE7f8zLtCY8b5UhbvDRR4eqPKuVuVRPFu2KCkDOMtfRtx8aUFqudcHum9+XjMDehHKFlOWBGkqfFh8c7jf0XQ8izRY5+5Njfb80cPVcsEb8DuXgLRVKKAj0msScJQzEhyppIMJRCCCBvljOf3FLwBleZVQ1R52b7P6n36mxLvYB0b0KYwCVoiVH/DeFly1xhq6GdrBe9OZ2JkFjCUuAImqKeuWozmreJMrTFMpFaJOwlznbhFJw8NP0y23gyTk9iPz2a6oQrVGUTJJ4aweDiCF+4O1wBpeFgaEyF9hSQDTDHubU874enB3qpWyqfXh/mdBpS7SOlmi7iBEg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRXB4ywMz2ytT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 01:12:42 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAB8B1576;
	Thu, 22 Aug 2024 08:12:37 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC5FA3F58B;
	Thu, 22 Aug 2024 08:12:07 -0700 (PDT)
From: Joey Gouly <joey.gouly@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: nd@arm.com,
	akpm@linux-foundation.org,
	aneesh.kumar@kernel.org,
	aneesh.kumar@linux.ibm.com,
	anshuman.khandual@arm.com,
	bp@alien8.de,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	christophe.leroy@csgroup.eu,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	joey.gouly@arm.com,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	maz@kernel.org,
	mingo@redhat.com,
	mpe@ellerman.id.au,
	naveen.n.rao@linux.ibm.com,
	npiggin@gmail.com,
	oliver.upton@linux.dev,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	szabolcs.nagy@arm.com,
	tglx@linutronix.de,
	will@kernel.org,
	x86@kernel.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v5 11/30] arm64: enable the Permission Overlay Extension for EL0
Date: Thu, 22 Aug 2024 16:10:54 +0100
Message-Id: <20240822151113.1479789-12-joey.gouly@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240822151113.1479789-1-joey.gouly@arm.com>
References: <20240822151113.1479789-1-joey.gouly@arm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose a HWCAP and ID_AA64MMFR3_EL1_S1POE to userspace, so they can be used to
check if the CPU supports the feature.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 Documentation/arch/arm64/elf_hwcaps.rst |  2 ++
 arch/arm64/include/asm/hwcap.h          |  1 +
 arch/arm64/include/uapi/asm/hwcap.h     |  1 +
 arch/arm64/kernel/cpufeature.c          | 14 ++++++++++++++
 arch/arm64/kernel/cpuinfo.c             |  1 +
 5 files changed, 19 insertions(+)

diff --git Documentation/arch/arm64/elf_hwcaps.rst Documentation/arch/arm64/elf_hwcaps.rst
index 448c1664879b..694f67fa07d1 100644
--- Documentation/arch/arm64/elf_hwcaps.rst
+++ Documentation/arch/arm64/elf_hwcaps.rst
@@ -365,6 +365,8 @@ HWCAP2_SME_SF8DP2
 HWCAP2_SME_SF8DP4
     Functionality implied by ID_AA64SMFR0_EL1.SF8DP4 == 0b1.
 
+HWCAP2_POE
+    Functionality implied by ID_AA64MMFR3_EL1.S1POE == 0b0001.
 
 4. Unused AT_HWCAP bits
 -----------------------
diff --git arch/arm64/include/asm/hwcap.h arch/arm64/include/asm/hwcap.h
index 4edd3b61df11..a775adddecf2 100644
--- arch/arm64/include/asm/hwcap.h
+++ arch/arm64/include/asm/hwcap.h
@@ -157,6 +157,7 @@
 #define KERNEL_HWCAP_SME_SF8FMA		__khwcap2_feature(SME_SF8FMA)
 #define KERNEL_HWCAP_SME_SF8DP4		__khwcap2_feature(SME_SF8DP4)
 #define KERNEL_HWCAP_SME_SF8DP2		__khwcap2_feature(SME_SF8DP2)
+#define KERNEL_HWCAP_POE		__khwcap2_feature(POE)
 
 /*
  * This yields a mask that user programs can use to figure out what
diff --git arch/arm64/include/uapi/asm/hwcap.h arch/arm64/include/uapi/asm/hwcap.h
index 285610e626f5..055381b2c615 100644
--- arch/arm64/include/uapi/asm/hwcap.h
+++ arch/arm64/include/uapi/asm/hwcap.h
@@ -122,5 +122,6 @@
 #define HWCAP2_SME_SF8FMA	(1UL << 60)
 #define HWCAP2_SME_SF8DP4	(1UL << 61)
 #define HWCAP2_SME_SF8DP2	(1UL << 62)
+#define HWCAP2_POE		(1UL << 63)
 
 #endif /* _UAPI__ASM_HWCAP_H */
diff --git arch/arm64/kernel/cpufeature.c arch/arm64/kernel/cpufeature.c
index 2daf5597cd65..718728a85430 100644
--- arch/arm64/kernel/cpufeature.c
+++ arch/arm64/kernel/cpufeature.c
@@ -466,6 +466,8 @@ static const struct arm64_ftr_bits ftr_id_aa64mmfr2[] = {
 };
 
 static const struct arm64_ftr_bits ftr_id_aa64mmfr3[] = {
+	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_POE),
+		       FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64MMFR3_EL1_S1POE_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64MMFR3_EL1_S1PIE_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64MMFR3_EL1_TCRX_SHIFT, 4, 0),
 	ARM64_FTR_END,
@@ -2348,6 +2350,14 @@ static void cpu_enable_mops(const struct arm64_cpu_capabilities *__unused)
 	sysreg_clear_set(sctlr_el1, 0, SCTLR_EL1_MSCEn);
 }
 
+#ifdef CONFIG_ARM64_POE
+static void cpu_enable_poe(const struct arm64_cpu_capabilities *__unused)
+{
+	sysreg_clear_set(REG_TCR2_EL1, 0, TCR2_EL1x_E0POE);
+	sysreg_clear_set(CPACR_EL1, 0, CPACR_ELx_E0POE);
+}
+#endif
+
 /* Internal helper functions to match cpu capability type */
 static bool
 cpucap_late_cpu_optional(const struct arm64_cpu_capabilities *cap)
@@ -2876,6 +2886,7 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.capability = ARM64_HAS_S1POE,
 		.type = ARM64_CPUCAP_BOOT_CPU_FEATURE,
 		.matches = has_cpuid_feature,
+		.cpu_enable = cpu_enable_poe,
 		ARM64_CPUID_FIELDS(ID_AA64MMFR3_EL1, S1POE, IMP)
 	},
 #endif
@@ -3043,6 +3054,9 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
 	HWCAP_CAP(ID_AA64FPFR0_EL1, F8DP2, IMP, CAP_HWCAP, KERNEL_HWCAP_F8DP2),
 	HWCAP_CAP(ID_AA64FPFR0_EL1, F8E4M3, IMP, CAP_HWCAP, KERNEL_HWCAP_F8E4M3),
 	HWCAP_CAP(ID_AA64FPFR0_EL1, F8E5M2, IMP, CAP_HWCAP, KERNEL_HWCAP_F8E5M2),
+#ifdef CONFIG_ARM64_POE
+	HWCAP_CAP(ID_AA64MMFR3_EL1, S1POE, IMP, CAP_HWCAP, KERNEL_HWCAP_POE),
+#endif
 	{},
 };
 
diff --git arch/arm64/kernel/cpuinfo.c arch/arm64/kernel/cpuinfo.c
index 09eeaa24d456..b9db812082b3 100644
--- arch/arm64/kernel/cpuinfo.c
+++ arch/arm64/kernel/cpuinfo.c
@@ -143,6 +143,7 @@ static const char *const hwcap_str[] = {
 	[KERNEL_HWCAP_SME_SF8FMA]	= "smesf8fma",
 	[KERNEL_HWCAP_SME_SF8DP4]	= "smesf8dp4",
 	[KERNEL_HWCAP_SME_SF8DP2]	= "smesf8dp2",
+	[KERNEL_HWCAP_POE]		= "poe",
 };
 
 #ifdef CONFIG_COMPAT
-- 
2.25.1


