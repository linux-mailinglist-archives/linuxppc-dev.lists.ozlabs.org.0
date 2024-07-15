Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42869930FEA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 10:37:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WMwYg1dNPz3fQm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 18:37:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WMwYH5XYJz3cQM
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2024 18:37:07 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 256A8DA7;
	Mon, 15 Jul 2024 01:37:01 -0700 (PDT)
Received: from [10.162.40.16] (a077893.blr.arm.com [10.162.40.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C89A3F73F;
	Mon, 15 Jul 2024 01:36:27 -0700 (PDT)
Message-ID: <82a5acea-0a06-437e-b246-ae2874c3493e@arm.com>
Date: Mon, 15 Jul 2024 14:06:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/29] KVM: arm64: make kvm_at() take an OP_AT_*
To: Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-9-joey.gouly@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20240503130147.1154804-9-joey.gouly@arm.com>
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
> To allow using newer instructions that current assemblers don't know about,
> replace the `at` instruction with the underlying SYS instruction.
> 
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_asm.h       | 3 ++-
>  arch/arm64/kvm/hyp/include/hyp/fault.h | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> index 24b5e6b23417..ce65fd0f01b0 100644
> --- a/arch/arm64/include/asm/kvm_asm.h
> +++ b/arch/arm64/include/asm/kvm_asm.h
> @@ -10,6 +10,7 @@
>  #include <asm/hyp_image.h>
>  #include <asm/insn.h>
>  #include <asm/virt.h>
> +#include <asm/sysreg.h>
>  
>  #define ARM_EXIT_WITH_SERROR_BIT  31
>  #define ARM_EXCEPTION_CODE(x)	  ((x) & ~(1U << ARM_EXIT_WITH_SERROR_BIT))
> @@ -261,7 +262,7 @@ extern u64 __kvm_get_mdcr_el2(void);
>  	asm volatile(							\
>  	"	mrs	%1, spsr_el2\n"					\
>  	"	mrs	%2, elr_el2\n"					\
> -	"1:	at	"at_op", %3\n"					\
> +	"1:	" __msr_s(at_op, "%3") "\n"				\
>  	"	isb\n"							\
>  	"	b	9f\n"						\
>  	"2:	msr	spsr_el2, %1\n"					\
> diff --git a/arch/arm64/kvm/hyp/include/hyp/fault.h b/arch/arm64/kvm/hyp/include/hyp/fault.h
> index 9e13c1bc2ad5..487c06099d6f 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/fault.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/fault.h
> @@ -27,7 +27,7 @@ static inline bool __translate_far_to_hpfar(u64 far, u64 *hpfar)
>  	 * saved the guest context yet, and we may return early...
>  	 */
>  	par = read_sysreg_par();
> -	if (!__kvm_at("s1e1r", far))
> +	if (!__kvm_at(OP_AT_S1E1R, far))
>  		tmp = read_sysreg_par();
>  	else
>  		tmp = SYS_PAR_EL1_F; /* back to the guest */

I guess this patch has already been included in a different series now.

https://lore.kernel.org/all/20240625133508.259829-6-maz@kernel.org/
