Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA948D555E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 00:29:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vr1Bn3FP2z3ftC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 08:29:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=amitdaniel.kachhap@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VpNcc6ZF6z3w1l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2024 16:57:36 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B57FF150C;
	Mon, 27 May 2024 23:57:29 -0700 (PDT)
Received: from [10.162.40.16] (a077841.arm.com [10.162.40.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B67F3F792;
	Mon, 27 May 2024 23:56:57 -0700 (PDT)
Message-ID: <229bd367-466e-4bf9-9627-24d2d0821ff4@arm.com>
Date: Tue, 28 May 2024 12:26:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Amit Daniel Kachhap <amitdaniel.kachhap@arm.com>
Subject: Re: [PATCH v4 18/29] arm64: add POE signal support
To: Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-19-joey.gouly@arm.com>
Content-Language: en-US
In-Reply-To: <20240503130147.1154804-19-joey.gouly@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 31 May 2024 08:19:55 +1000
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
Cc: szabolcs.nagy@arm.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com, linux-mm@kvack.org, hpa@zytor.com, shuah@kernel.org, maz@kernel.org, x86@kernel.org, aneesh.kumar@kernel.org, mingo@redhat.com, naveen.n.rao@linux.ibm.com, will@kernel.org, npiggin@gmail.com, broonie@kernel.org, bp@alien8.de, kvmarm@lists.linux.dev, tglx@linutronix.de, oliver.upton@linux.dev, aneesh.kumar@linux.ibm.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
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
> ---
>   arch/arm64/include/uapi/asm/sigcontext.h |  7 ++++
>   arch/arm64/kernel/signal.c               | 52 ++++++++++++++++++++++++
>   2 files changed, 59 insertions(+)
> 
> diff --git a/arch/arm64/include/uapi/asm/sigcontext.h b/arch/arm64/include/uapi/asm/sigcontext.h
> index 8a45b7a411e0..e4cba8a6c9a2 100644
> --- a/arch/arm64/include/uapi/asm/sigcontext.h
> +++ b/arch/arm64/include/uapi/asm/sigcontext.h
> @@ -98,6 +98,13 @@ struct esr_context {
>   	__u64 esr;
>   };
>   
> +#define POE_MAGIC	0x504f4530
> +
> +struct poe_context {
> +	struct _aarch64_ctx head;
> +	__u64 por_el0;
> +};

There is a comment section in the beginning which mentions the size
of the context frame structure and subsequent reduction in the
reserved range. So this new context description can be added there.
Although looks like it is broken for za, zt and fpmr context.

> +
>   /*
>    * extra_context: describes extra space in the signal frame for
>    * additional structures that don't fit in sigcontext.__reserved[].
> diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
> index 4a77f4976e11..077436a8bc10 100644
> --- a/arch/arm64/kernel/signal.c
> +++ b/arch/arm64/kernel/signal.c
> @@ -63,6 +63,7 @@ struct rt_sigframe_user_layout {
>   	unsigned long fpmr_offset;
>   	unsigned long extra_offset;
>   	unsigned long end_offset;
> +	unsigned long poe_offset;

For consistency this can be added after fpmr_offset.

Thanks,
Amit

>   };
>   
>   #define BASE_SIGFRAME_SIZE round_up(sizeof(struct rt_sigframe), 16)
> @@ -185,6 +186,8 @@ struct user_ctxs {
>   	u32 zt_size;
>   	struct fpmr_context __user *fpmr;
>   	u32 fpmr_size;
> +	struct poe_context __user *poe;
