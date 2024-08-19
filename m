Return-Path: <linuxppc-dev+bounces-173-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E34169568CE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2024 12:57:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnV1H5pd1z2xyB;
	Mon, 19 Aug 2024 20:57:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WnTQD05t7z2xy8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2024 20:30:41 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WnTKy1RgYz67MPb;
	Mon, 19 Aug 2024 18:27:02 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 218311400D7;
	Mon, 19 Aug 2024 18:30:34 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 19 Aug
 2024 11:30:33 +0100
Date: Mon, 19 Aug 2024 11:30:32 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Tong Tiangen <tongtiangen@huawei.com>
CC: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>, James Morse <james.morse@arm.com>, "Robin
 Murphy" <robin.murphy@arm.com>, Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino
	<vincenzo.frascino@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Aneesh Kumar K.V <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mm@kvack.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <wangkefeng.wang@huawei.com>, Guohanjun
	<guohanjun@huawei.com>
Subject: Re: [PATCH v12 2/6] arm64: add support for ARCH_HAS_COPY_MC
Message-ID: <20240819113032.000042af@Huawei.com>
In-Reply-To: <20240528085915.1955987-3-tongtiangen@huawei.com>
References: <20240528085915.1955987-1-tongtiangen@huawei.com>
	<20240528085915.1955987-3-tongtiangen@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 lhrpeml500005.china.huawei.com (7.191.163.240)

On Tue, 28 May 2024 16:59:11 +0800
Tong Tiangen <tongtiangen@huawei.com> wrote:

> For the arm64 kernel, when it processes hardware memory errors for
> synchronize notifications(do_sea()), if the errors is consumed within the
> kernel, the current processing is panic. However, it is not optimal.
> 
> Take copy_from/to_user for example, If ld* triggers a memory error, even in
> kernel mode, only the associated process is affected. Killing the user
> process and isolating the corrupt page is a better choice.
> 
> New fixup type EX_TYPE_KACCESS_ERR_ZERO_ME_SAFE is added to identify insn
> that can recover from memory errors triggered by access to kernel memory.
> 
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>

Hi - this is going slow :(

A few comments inline in the meantime but this really needs ARM maintainers
to take a (hopefully final) look.

Jonathan


> diff --git a/arch/arm64/include/asm/asm-extable.h b/arch/arm64/include/asm/asm-extable.h
> index 980d1dd8e1a3..9c0664fe1eb1 100644
> --- a/arch/arm64/include/asm/asm-extable.h
> +++ b/arch/arm64/include/asm/asm-extable.h
> @@ -5,11 +5,13 @@
>  #include <linux/bits.h>
>  #include <asm/gpr-num.h>
>  
> -#define EX_TYPE_NONE			0
> -#define EX_TYPE_BPF			1
> -#define EX_TYPE_UACCESS_ERR_ZERO	2
> -#define EX_TYPE_KACCESS_ERR_ZERO	3
> -#define EX_TYPE_LOAD_UNALIGNED_ZEROPAD	4
> +#define EX_TYPE_NONE				0
> +#define EX_TYPE_BPF				1
> +#define EX_TYPE_UACCESS_ERR_ZERO		2
> +#define EX_TYPE_KACCESS_ERR_ZERO		3
> +#define EX_TYPE_LOAD_UNALIGNED_ZEROPAD		4
> +/* kernel access memory error safe */
> +#define EX_TYPE_KACCESS_ERR_ZERO_ME_SAFE	5

Does anyone care enough about the alignment to bother realigning for one
long line? I'd be tempted not to bother, but up to maintainers.


> diff --git a/arch/arm64/lib/copy_to_user.S b/arch/arm64/lib/copy_to_user.S
> index 802231772608..2ac716c0d6d8 100644
> --- a/arch/arm64/lib/copy_to_user.S
> +++ b/arch/arm64/lib/copy_to_user.S
> @@ -20,7 +20,7 @@
>   *	x0 - bytes not copied
>   */
>  	.macro ldrb1 reg, ptr, val
> -	ldrb  \reg, [\ptr], \val
> +	KERNEL_ME_SAFE(9998f, ldrb  \reg, [\ptr], \val)
>  	.endm
>  
>  	.macro strb1 reg, ptr, val
> @@ -28,7 +28,7 @@
>  	.endm
>  
>  	.macro ldrh1 reg, ptr, val
> -	ldrh  \reg, [\ptr], \val
> +	KERNEL_ME_SAFE(9998f, ldrh  \reg, [\ptr], \val)
>  	.endm
>  
>  	.macro strh1 reg, ptr, val
> @@ -36,7 +36,7 @@
>  	.endm
>  
>  	.macro ldr1 reg, ptr, val
> -	ldr \reg, [\ptr], \val
> +	KERNEL_ME_SAFE(9998f, ldr \reg, [\ptr], \val)
>  	.endm
>  
>  	.macro str1 reg, ptr, val
> @@ -44,7 +44,7 @@
>  	.endm
>  
>  	.macro ldp1 reg1, reg2, ptr, val
> -	ldp \reg1, \reg2, [\ptr], \val
> +	KERNEL_ME_SAFE(9998f, ldp \reg1, \reg2, [\ptr], \val)
>  	.endm
>  
>  	.macro stp1 reg1, reg2, ptr, val
> @@ -64,7 +64,7 @@ SYM_FUNC_START(__arch_copy_to_user)
>  9997:	cmp	dst, dstin
>  	b.ne	9998f
>  	// Before being absolutely sure we couldn't copy anything, try harder
> -	ldrb	tmp1w, [srcin]
> +KERNEL_ME_SAFE(9998f, ldrb	tmp1w, [srcin])

Alignment looks off?

>  USER(9998f, sttrb tmp1w, [dst])
>  	add	dst, dst, #1
>  9998:	sub	x0, end, dst			// bytes not copied



> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index 451ba7cbd5ad..2dc65f99d389 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -708,21 +708,32 @@ static int do_bad(unsigned long far, unsigned long esr, struct pt_regs *regs)
>  	return 1; /* "fault" */
>  }
>  
> +/*
> + * APEI claimed this as a firmware-first notification.
> + * Some processing deferred to task_work before ret_to_user().
> + */
> +static bool do_apei_claim_sea(struct pt_regs *regs)
> +{
> +	if (user_mode(regs)) {
> +		if (!apei_claim_sea(regs))

I'd keep to the the (apei_claim_sea(regs) == 0)
used in the original code. That hints to the reader that we are
interested here in an 'error' code rather than apei_claim_sea() returning
a bool.   I initially wondered why we return true when the code
fails to claim it.

Also, perhaps if you return 0 for success and an error code if not
you could just make this

	if (user_mode(regs))
		return apei_claim_sea(regs);

	if (IS_ENABLED(CONFIG_ARCH_HAS_COPY_MC)) {
		if (fixup_exception_me(regs)) {
			return apei_claim_sea(regs);
		}
	}

	return false;

or maybe even (I may have messed this up, but I think this logic
works).

	if (!user_mode(regs) && IS_ENABLED(CONFIG_ARCH_HAS_COPY_MC)) {
		if (!fixup_exception_me(regs))
			return false;
	}
	return apei_claim_sea(regs);


> +			return true;
> +	} else if (IS_ENABLED(CONFIG_ARCH_HAS_COPY_MC)) {
> +		if (fixup_exception_me(regs) && !apei_claim_sea(regs))

Same here with using apei_claim_sea(regs) == 0 so it's obvious we
are checking for an error, not a boolean.

> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>  static int do_sea(unsigned long far, unsigned long esr, struct pt_regs *regs)
>  {
>  	const struct fault_info *inf;
>  	unsigned long siaddr;
>  
> -	inf = esr_to_fault_info(esr);
> -
> -	if (user_mode(regs) && apei_claim_sea(regs) == 0) {
> -		/*
> -		 * APEI claimed this as a firmware-first notification.
> -		 * Some processing deferred to task_work before ret_to_user().
> -		 */
> +	if (do_apei_claim_sea(regs))

It might be made sense to factor this out first, then could be reviewed
as a noop before the new stuff is added.  Still it's not much code, so doesn't
really matter.
Might be worth keeping to returning 0 for success, error code
otherwise as per apei_claim_sea(regs)

The bool returning functions in the nearby code tend to be is_xxxx
not things that succeed or not.

If you change it to return int make this
	if (do_apei_claim_sea(regs) == 0)
so it's obvious this is the no error case.

>  		return 0;
> -	}
>  
> +	inf = esr_to_fault_info(esr);
>  	if (esr & ESR_ELx_FnV) {
>  		siaddr = 0;
>  	} else {


