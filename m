Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3E593243A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 12:37:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNb9F6p3Dz3dH8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 20:37:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNb8s0t3Dz3cLl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2024 20:36:44 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 217271063;
	Tue, 16 Jul 2024 03:36:38 -0700 (PDT)
Received: from [10.163.52.225] (unknown [10.163.52.225])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 58F713F762;
	Tue, 16 Jul 2024 03:36:00 -0700 (PDT)
Message-ID: <30ee6b2d-f66b-45c5-9c18-2b6ddaafda33@arm.com>
Date: Tue, 16 Jul 2024 16:05:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 21/29] arm64/ptrace: add support for FEAT_POE
To: Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-22-joey.gouly@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20240503130147.1154804-22-joey.gouly@arm.com>
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
> Add a regset for POE containing POR_EL0.
> 
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  arch/arm64/kernel/ptrace.c | 46 ++++++++++++++++++++++++++++++++++++++
>  include/uapi/linux/elf.h   |  1 +
>  2 files changed, 47 insertions(+)
> 
> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> index 0d022599eb61..b756578aeaee 100644
> --- a/arch/arm64/kernel/ptrace.c
> +++ b/arch/arm64/kernel/ptrace.c
> @@ -1440,6 +1440,39 @@ static int tagged_addr_ctrl_set(struct task_struct *target, const struct
>  }
>  #endif
>  
> +#ifdef CONFIG_ARM64_POE
> +static int poe_get(struct task_struct *target,
> +		   const struct user_regset *regset,
> +		   struct membuf to)
> +{
> +	if (!system_supports_poe())
> +		return -EINVAL;
> +
> +	return membuf_write(&to, &target->thread.por_el0,
> +			    sizeof(target->thread.por_el0));
> +}
> +
> +static int poe_set(struct task_struct *target, const struct
> +		   user_regset *regset, unsigned int pos,
> +		   unsigned int count, const void *kbuf, const
> +		   void __user *ubuf)
> +{
> +	int ret;
> +	long ctrl;
> +
> +	if (!system_supports_poe())
> +		return -EINVAL;
> +
> +	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &ctrl, 0, -1);
> +	if (ret)
> +		return ret;
> +
> +	target->thread.por_el0 = ctrl;
> +
> +	return 0;
> +}
> +#endif
> +
>  enum aarch64_regset {
>  	REGSET_GPR,
>  	REGSET_FPR,
> @@ -1469,6 +1502,9 @@ enum aarch64_regset {
>  #ifdef CONFIG_ARM64_TAGGED_ADDR_ABI
>  	REGSET_TAGGED_ADDR_CTRL,
>  #endif
> +#ifdef CONFIG_ARM64_POE
> +	REGSET_POE
> +#endif
>  };
>  
>  static const struct user_regset aarch64_regsets[] = {
> @@ -1628,6 +1664,16 @@ static const struct user_regset aarch64_regsets[] = {
>  		.set = tagged_addr_ctrl_set,
>  	},
>  #endif
> +#ifdef CONFIG_ARM64_POE
> +	[REGSET_POE] = {
> +		.core_note_type = NT_ARM_POE,
> +		.n = 1,
> +		.size = sizeof(long),
> +		.align = sizeof(long),
> +		.regset_get = poe_get,
> +		.set = poe_set,
> +	},
> +#endif
>  };
>  
>  static const struct user_regset_view user_aarch64_view = {
> diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
> index b54b313bcf07..81762ff3c99e 100644
> --- a/include/uapi/linux/elf.h
> +++ b/include/uapi/linux/elf.h
> @@ -441,6 +441,7 @@ typedef struct elf64_shdr {
>  #define NT_ARM_ZA	0x40c		/* ARM SME ZA registers */
>  #define NT_ARM_ZT	0x40d		/* ARM SME ZT registers */
>  #define NT_ARM_FPMR	0x40e		/* ARM floating point mode register */
> +#define NT_ARM_POE	0x40f		/* ARM POE registers */
>  #define NT_ARC_V2	0x600		/* ARCv2 accumulator/extra registers */
>  #define NT_VMCOREDD	0x700		/* Vmcore Device Dump Note */
>  #define NT_MIPS_DSP	0x800		/* MIPS DSP ASE registers */
