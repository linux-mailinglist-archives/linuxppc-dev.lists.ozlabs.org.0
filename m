Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AED093C6F2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2024 18:01:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVFxG6bbPz3dSj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2024 02:01:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVFwm0Zx1z3cY9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 02:00:55 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2F0F1007;
	Thu, 25 Jul 2024 09:00:49 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3FE1C3F5A1;
	Thu, 25 Jul 2024 09:00:21 -0700 (PDT)
Date: Thu, 25 Jul 2024 17:00:18 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Joey Gouly <joey.gouly@arm.com>
Subject: Re: [PATCH v4 18/29] arm64: add POE signal support
Message-ID: <ZqJ2knGETfS4nfEA@e133380.arm.com>
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-19-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503130147.1154804-19-joey.gouly@arm.com>
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
Cc: szabolcs.nagy@arm.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com, linux-mm@kvack.org, hpa@zytor.com, shuah@kernel.org, maz@kernel.org, x86@kernel.org, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, mingo@redhat.com, naveen.n.rao@linux.ibm.com, will@kernel.org, npiggin@gmail.com, broonie@kernel.org, bp@alien8.de, kvmarm@lists.linux.dev, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev, aneesh.kumar@linux.ibm.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Fri, May 03, 2024 at 02:01:36PM +0100, Joey Gouly wrote:
> Add PKEY support to signals, by saving and restoring POR_EL0 from the stackframe.
> 
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Acked-by: Szabolcs Nagy <szabolcs.nagy@arm.com>
> ---
>  arch/arm64/include/uapi/asm/sigcontext.h |  7 ++++
>  arch/arm64/kernel/signal.c               | 52 ++++++++++++++++++++++++
>  2 files changed, 59 insertions(+)
> 
> diff --git a/arch/arm64/include/uapi/asm/sigcontext.h b/arch/arm64/include/uapi/asm/sigcontext.h
> index 8a45b7a411e0..e4cba8a6c9a2 100644
> --- a/arch/arm64/include/uapi/asm/sigcontext.h
> +++ b/arch/arm64/include/uapi/asm/sigcontext.h

[...]

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

Does the AArch64 procedure call standard say anything about whether
POR_EL0 is caller-saved?

<bikeshed>

In theory we could skip saving this register if it is already
POR_EL0_INIT (which it often will be), and if the signal handler is not
supposed to modify and leave the modified value in the register when
returning.

The complexity of the additional check my be a bit pointless though,
and the the handler might theoretically want to change the interrupted
code's POR_EL0 explicitly, which would be complicated if POE_MAGIC is
sometimes there and sometimes not.

</bikeshed>

[...]

Cheers
---Dave
