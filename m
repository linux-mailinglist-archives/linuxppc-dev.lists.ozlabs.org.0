Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B68938BDA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2024 11:17:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSF6N5qF7z3d4H
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2024 19:17:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSF6051Ftz3cCh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2024 19:16:53 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF5ADFEC;
	Mon, 22 Jul 2024 02:16:45 -0700 (PDT)
Received: from [10.162.41.8] (a077893.blr.arm.com [10.162.41.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 71F823F766;
	Mon, 22 Jul 2024 02:16:12 -0700 (PDT)
Message-ID: <3c385faa-bfe9-4731-8fdc-fa786f2160df@arm.com>
Date: Mon, 22 Jul 2024 14:46:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 18/29] arm64: add POE signal support
To: Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-19-joey.gouly@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20240503130147.1154804-19-joey.gouly@arm.com>
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
> Add PKEY support to signals, by saving and restoring POR_EL0 from the stackframe.
> 
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Acked-by: Szabolcs Nagy <szabolcs.nagy@arm.com>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  arch/arm64/include/uapi/asm/sigcontext.h |  7 ++++
>  arch/arm64/kernel/signal.c               | 52 ++++++++++++++++++++++++
>  2 files changed, 59 insertions(+)
> 
> diff --git a/arch/arm64/include/uapi/asm/sigcontext.h b/arch/arm64/include/uapi/asm/sigcontext.h
> index 8a45b7a411e0..e4cba8a6c9a2 100644
> --- a/arch/arm64/include/uapi/asm/sigcontext.h
> +++ b/arch/arm64/include/uapi/asm/sigcontext.h
> @@ -98,6 +98,13 @@ struct esr_context {
>  	__u64 esr;
>  };
>  
> +#define POE_MAGIC	0x504f4530
> +
> +struct poe_context {
> +	struct _aarch64_ctx head;
> +	__u64 por_el0;
> +};
> +
>  /*
>   * extra_context: describes extra space in the signal frame for
>   * additional structures that don't fit in sigcontext.__reserved[].
> diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
> index 4a77f4976e11..077436a8bc10 100644
> --- a/arch/arm64/kernel/signal.c
> +++ b/arch/arm64/kernel/signal.c
> @@ -63,6 +63,7 @@ struct rt_sigframe_user_layout {
>  	unsigned long fpmr_offset;
>  	unsigned long extra_offset;
>  	unsigned long end_offset;
> +	unsigned long poe_offset;
>  };
>  
>  #define BASE_SIGFRAME_SIZE round_up(sizeof(struct rt_sigframe), 16)
> @@ -185,6 +186,8 @@ struct user_ctxs {
>  	u32 zt_size;
>  	struct fpmr_context __user *fpmr;
>  	u32 fpmr_size;
> +	struct poe_context __user *poe;
> +	u32 poe_size;
>  };
>  
>  static int preserve_fpsimd_context(struct fpsimd_context __user *ctx)
> @@ -258,6 +261,21 @@ static int restore_fpmr_context(struct user_ctxs *user)
>  	return err;
>  }
>  
> +static int restore_poe_context(struct user_ctxs *user)
> +{
> +	u64 por_el0;
> +	int err = 0;
> +
> +	if (user->poe_size != sizeof(*user->poe))
> +		return -EINVAL;
> +
> +	__get_user_error(por_el0, &(user->poe->por_el0), err);
> +	if (!err)
> +		write_sysreg_s(por_el0, SYS_POR_EL0);
> +
> +	return err;
> +}
> +
>  #ifdef CONFIG_ARM64_SVE
>  
>  static int preserve_sve_context(struct sve_context __user *ctx)
> @@ -621,6 +639,7 @@ static int parse_user_sigframe(struct user_ctxs *user,
>  	user->za = NULL;
>  	user->zt = NULL;
>  	user->fpmr = NULL;
> +	user->poe = NULL;
>  
>  	if (!IS_ALIGNED((unsigned long)base, 16))
>  		goto invalid;
> @@ -671,6 +690,17 @@ static int parse_user_sigframe(struct user_ctxs *user,
>  			/* ignore */
>  			break;
>  
> +		case POE_MAGIC:
> +			if (!system_supports_poe())
> +				goto invalid;
> +
> +			if (user->poe)
> +				goto invalid;
> +
> +			user->poe = (struct poe_context __user *)head;
> +			user->poe_size = size;
> +			break;
> +
>  		case SVE_MAGIC:
>  			if (!system_supports_sve() && !system_supports_sme())
>  				goto invalid;
> @@ -857,6 +887,9 @@ static int restore_sigframe(struct pt_regs *regs,
>  	if (err == 0 && system_supports_sme2() && user.zt)
>  		err = restore_zt_context(&user);
>  
> +	if (err == 0 && system_supports_poe() && user.poe)
> +		err = restore_poe_context(&user);
> +
>  	return err;
>  }
>  
> @@ -980,6 +1013,13 @@ static int setup_sigframe_layout(struct rt_sigframe_user_layout *user,
>  			return err;
>  	}
>  
> +	if (system_supports_poe()) {
> +		err = sigframe_alloc(user, &user->poe_offset,
> +				     sizeof(struct poe_context));
> +		if (err)
> +			return err;
> +	}
> +
>  	return sigframe_alloc_end(user);
>  }
>  
> @@ -1020,6 +1060,15 @@ static int setup_sigframe(struct rt_sigframe_user_layout *user,
>  		__put_user_error(current->thread.fault_code, &esr_ctx->esr, err);
>  	}
>  
> +	if (system_supports_poe() && err == 0 && user->poe_offset) {
> +		struct poe_context __user *poe_ctx =
> +			apply_user_offset(user, user->poe_offset);
> +
> +		__put_user_error(POE_MAGIC, &poe_ctx->head.magic, err);
> +		__put_user_error(sizeof(*poe_ctx), &poe_ctx->head.size, err);
> +		__put_user_error(read_sysreg_s(SYS_POR_EL0), &poe_ctx->por_el0, err);
> +	}
> +
>  	/* Scalable Vector Extension state (including streaming), if present */
>  	if ((system_supports_sve() || system_supports_sme()) &&
>  	    err == 0 && user->sve_offset) {
> @@ -1178,6 +1227,9 @@ static void setup_return(struct pt_regs *regs, struct k_sigaction *ka,
>  		sme_smstop();
>  	}
>  
> +	if (system_supports_poe())
> +		write_sysreg_s(POR_EL0_INIT, SYS_POR_EL0);
> +
>  	if (ka->sa.sa_flags & SA_RESTORER)
>  		sigtramp = ka->sa.sa_restorer;
>  	else
