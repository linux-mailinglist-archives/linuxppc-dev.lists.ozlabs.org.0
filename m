Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 531CC9310F7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 11:14:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WMxNd1vF1z3fLT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 19:14:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WMxND1x3jz30W1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2024 19:14:17 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE003DA7;
	Mon, 15 Jul 2024 02:14:09 -0700 (PDT)
Received: from [10.162.40.16] (a077893.blr.arm.com [10.162.40.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 622603F73F;
	Mon, 15 Jul 2024 02:13:27 -0700 (PDT)
Message-ID: <850c93dd-7cbe-4904-910e-a389884655d9@arm.com>
Date: Mon, 15 Jul 2024 14:43:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/29] arm64: enable the Permission Overlay Extension
 for EL0
To: Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-11-joey.gouly@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20240503130147.1154804-11-joey.gouly@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: szabolcs.nagy@arm.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com, linux-mm@kvack.org, hpa@zytor.com, shuah@kernel.org, maz@kernel.org, x86@kernel.org, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, mingo@redhat.com, naveen.n.rao@linux.ibm.com, will@kernel.org, npiggin@gmail.com, broonie@kernel.org, bp@alien8.de, kvmarm@lists.linux.dev, tglx@linutronix.de, oliver.upton@linux.dev, aneesh.kumar@linux.ibm.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/3/24 18:31, Joey Gouly wrote:
> Expose a HWCAP and ID_AA64MMFR3_EL1_S1POE to userspace, so they can be used to
> check if the CPU supports the feature.
> 
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> ---
> 
> This takes the last bit of HWCAP2, is this fine? What can we do about more features in the future?
> 
> 
>  Documentation/arch/arm64/elf_hwcaps.rst |  2 ++
>  arch/arm64/include/asm/hwcap.h          |  1 +
>  arch/arm64/include/uapi/asm/hwcap.h     |  1 +
>  arch/arm64/kernel/cpufeature.c          | 14 ++++++++++++++
>  arch/arm64/kernel/cpuinfo.c             |  1 +
>  5 files changed, 19 insertions(+)
> 
> diff --git a/Documentation/arch/arm64/elf_hwcaps.rst b/Documentation/arch/arm64/elf_hwcaps.rst
> index 448c1664879b..694f67fa07d1 100644
> --- a/Documentation/arch/arm64/elf_hwcaps.rst
> +++ b/Documentation/arch/arm64/elf_hwcaps.rst
> @@ -365,6 +365,8 @@ HWCAP2_SME_SF8DP2
>  HWCAP2_SME_SF8DP4
>      Functionality implied by ID_AA64SMFR0_EL1.SF8DP4 == 0b1.
>  
> +HWCAP2_POE
> +    Functionality implied by ID_AA64MMFR3_EL1.S1POE == 0b0001.
>  
>  4. Unused AT_HWCAP bits
>  -----------------------
> diff --git a/arch/arm64/include/asm/hwcap.h b/arch/arm64/include/asm/hwcap.h
> index 4edd3b61df11..a775adddecf2 100644
> --- a/arch/arm64/include/asm/hwcap.h
> +++ b/arch/arm64/include/asm/hwcap.h
> @@ -157,6 +157,7 @@
>  #define KERNEL_HWCAP_SME_SF8FMA		__khwcap2_feature(SME_SF8FMA)
>  #define KERNEL_HWCAP_SME_SF8DP4		__khwcap2_feature(SME_SF8DP4)
>  #define KERNEL_HWCAP_SME_SF8DP2		__khwcap2_feature(SME_SF8DP2)
> +#define KERNEL_HWCAP_POE		__khwcap2_feature(POE)
>  
>  /*
>   * This yields a mask that user programs can use to figure out what
> diff --git a/arch/arm64/include/uapi/asm/hwcap.h b/arch/arm64/include/uapi/asm/hwcap.h
> index 285610e626f5..055381b2c615 100644
> --- a/arch/arm64/include/uapi/asm/hwcap.h
> +++ b/arch/arm64/include/uapi/asm/hwcap.h
> @@ -122,5 +122,6 @@
>  #define HWCAP2_SME_SF8FMA	(1UL << 60)
>  #define HWCAP2_SME_SF8DP4	(1UL << 61)
>  #define HWCAP2_SME_SF8DP2	(1UL << 62)
> +#define HWCAP2_POE		(1UL << 63)
>  
>  #endif /* _UAPI__ASM_HWCAP_H */
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 2f3c2346e156..8c02aae9db11 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -465,6 +465,8 @@ static const struct arm64_ftr_bits ftr_id_aa64mmfr2[] = {
>  };
>  
>  static const struct arm64_ftr_bits ftr_id_aa64mmfr3[] = {
> +	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_POE),
> +		       FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64MMFR3_EL1_S1POE_SHIFT, 4, 0),
>  	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64MMFR3_EL1_S1PIE_SHIFT, 4, 0),
>  	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64MMFR3_EL1_TCRX_SHIFT, 4, 0),
>  	ARM64_FTR_END,
> @@ -2339,6 +2341,14 @@ static void cpu_enable_mops(const struct arm64_cpu_capabilities *__unused)
>  	sysreg_clear_set(sctlr_el1, 0, SCTLR_EL1_MSCEn);
>  }
>  
> +#ifdef CONFIG_ARM64_POE
> +static void cpu_enable_poe(const struct arm64_cpu_capabilities *__unused)
> +{
> +	sysreg_clear_set(REG_TCR2_EL1, 0, TCR2_EL1x_E0POE);
> +	sysreg_clear_set(CPACR_EL1, 0, CPACR_ELx_E0POE);
> +}
> +#endif
> +
>  /* Internal helper functions to match cpu capability type */
>  static bool
>  cpucap_late_cpu_optional(const struct arm64_cpu_capabilities *cap)
> @@ -2867,6 +2877,7 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
>  		.capability = ARM64_HAS_S1POE,
>  		.type = ARM64_CPUCAP_BOOT_CPU_FEATURE,
>  		.matches = has_cpuid_feature,
> +		.cpu_enable = cpu_enable_poe,
>  		ARM64_CPUID_FIELDS(ID_AA64MMFR3_EL1, S1POE, IMP)
>  	},
>  #endif
> @@ -3034,6 +3045,9 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
>  	HWCAP_CAP(ID_AA64FPFR0_EL1, F8DP2, IMP, CAP_HWCAP, KERNEL_HWCAP_F8DP2),
>  	HWCAP_CAP(ID_AA64FPFR0_EL1, F8E4M3, IMP, CAP_HWCAP, KERNEL_HWCAP_F8E4M3),
>  	HWCAP_CAP(ID_AA64FPFR0_EL1, F8E5M2, IMP, CAP_HWCAP, KERNEL_HWCAP_F8E5M2),
> +#ifdef CONFIG_ARM64_POE
> +	HWCAP_CAP(ID_AA64MMFR3_EL1, S1POE, IMP, CAP_HWCAP, KERNEL_HWCAP_POE),
> +#endif
>  	{},
>  };
>  
> diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
> index 09eeaa24d456..b9db812082b3 100644
> --- a/arch/arm64/kernel/cpuinfo.c
> +++ b/arch/arm64/kernel/cpuinfo.c
> @@ -143,6 +143,7 @@ static const char *const hwcap_str[] = {
>  	[KERNEL_HWCAP_SME_SF8FMA]	= "smesf8fma",
>  	[KERNEL_HWCAP_SME_SF8DP4]	= "smesf8dp4",
>  	[KERNEL_HWCAP_SME_SF8DP2]	= "smesf8dp2",
> +	[KERNEL_HWCAP_POE]		= "poe",
>  };
>  
>  #ifdef CONFIG_COMPAT

This LGTM but as Joey mentioned earlier, what happens when another new
feature gets added later which needs to be exposed to userspace, add
HWCAP3 ?

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
