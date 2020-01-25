Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE0C14961A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jan 2020 15:36:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 484dqy4yztzDqJg
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jan 2020 01:36:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 484dnZ0tMDzDq9B
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jan 2020 01:34:40 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 484dnR3H6Kz9vCRl;
 Sat, 25 Jan 2020 15:34:35 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 3RI8PEMKEfJE; Sat, 25 Jan 2020 15:34:35 +0100 (CET)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 484dnR2Dbnz9vCRk;
 Sat, 25 Jan 2020 15:34:35 +0100 (CET)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id AA7E8763; Sat, 25 Jan 2020 15:35:00 +0100 (CET)
Received: from 37.173.164.116 ([37.173.164.116]) by messagerie.si.c-s.fr
 (Horde Framework) with HTTP; Sat, 25 Jan 2020 15:35:00 +0100
Date: Sat, 25 Jan 2020 15:35:00 +0100
Message-ID: <20200125153500.Horde.JTfP3wDEY-lCopNyg0xvuA4@messagerie.si.c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/32: Add missing context synchronisation with
 CONFIG_VMAP_STACK
References: <872477f7c7552d3bb7baf0b302398fcd42c5fcfd.1579885334.git.christophe.leroy@c-s.fr>
 <87r1znhgvi.fsf@mpe.ellerman.id.au>
 <20200125140052.Horde.0-n2_EcIdGahTxfDVj913w1@messagerie.si.c-s.fr>
 <87o8urhdi3.fsf@mpe.ellerman.id.au>
In-Reply-To: <87o8urhdi3.fsf@mpe.ellerman.id.au>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> a =C3=A9crit=C2=A0:

> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>> Michael Ellerman <mpe@ellerman.id.au> a =C3=A9crit=C2=A0:
>>> Christophe Leroy <christophe.leroy@c-s.fr> writes:
> ...
>>>> diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_=
32.h
>>>> index 73a035b40dbf..a6a5fbbf8504 100644
>>>> --- a/arch/powerpc/kernel/head_32.h
>>>> +++ b/arch/powerpc/kernel/head_32.h
>>>> @@ -43,6 +43,7 @@
>>>>  	.ifeq	\for_rtas
>>>>  	li	r11, MSR_KERNEL & ~(MSR_IR | MSR_RI) /* can take DTLB miss */
>>>>  	mtmsr	r11
>>>> +	isync
>>>
>>> Actually this one leads to:
>>>
>>>   /home/michael/linux/arch/powerpc/kernel/head_8xx.S: Assembler message=
s:
>>>   /home/michael/linux/arch/powerpc/kernel/head_8xx.S:151: Error:
>>> attempt to move .org backwards
>>>   make[3]: *** [/home/michael/linux/scripts/Makefile.build:348:
>>> arch/powerpc/kernel/head_8xx.o] Error 1
>>>
>>> For mpc885_ads_defconfig.
>>>
>>> That's the alignment exception overflowing into the program check
>>> handler:
>>>
>>> /* Alignment exception */
>>> 	. =3D 0x600
>>> Alignment:
>>> 	EXCEPTION_PROLOG handle_dar_dsisr=3D1
>>> 	save_dar_dsisr_on_stack r4, r5, r11
>>> 	li	r6, RPN_PATTERN
>>> 	mtspr	SPRN_DAR, r6	/* Tag DAR, to be used in DTLB Error */
>>> 	addi	r3,r1,STACK_FRAME_OVERHEAD
>>> 	EXC_XFER_STD(0x600, alignment_exception)
>>>
>>> /* Program check exception */
>>> 	EXCEPTION(0x700, ProgramCheck, program_check_exception, EXC_XFER_STD)
>>>
>>>
>>> Can't see an obvious/easy way to fix it.
>>
>> Argh !
>>
>> I think the easiest is to move the EXC_XFER_STD(0x600,
>> alignment_exception) somewhere else and branch to it. There is some
>> space at .0xa00
>
> That works, or builds at least. I'm not setup to boot test it.
>
> Does this look OK?

Yes it looks ok,

Thanks
Christophe

>
> cheers
>
>
> From 40e7d671aa27cf4411188f978b2cd06b30a9cb6c Mon Sep 17 00:00:00 2001
> From: Michael Ellerman <mpe@ellerman.id.au>
> Date: Sun, 26 Jan 2020 00:20:16 +1100
> Subject: [PATCH] powerpc/8xx: Move tail of alignment exception out of lin=
e
>
> When we enable VMAP_STACK there will not be enough room for the
> alignment handler at 0x600 in head_8xx.S. For now move the tail of the
> alignment handler out of line, and branch to it.
>
> Suggested-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/kernel/head_8xx.S | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8x=
x.S
> index 477933b36bde..9922306ae512 100644
> --- a/arch/powerpc/kernel/head_8xx.S
> +++ b/arch/powerpc/kernel/head_8xx.S
> @@ -145,7 +145,7 @@ _ENTRY(_start);
>  	li	r6, RPN_PATTERN
>  	mtspr	SPRN_DAR, r6	/* Tag DAR, to be used in DTLB Error */
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
> -	EXC_XFER_STD(0x600, alignment_exception)
> +	b	.Lalignment_exception_ool
>
>  /* Program check exception */
>  	EXCEPTION(0x700, ProgramCheck, program_check_exception, EXC_XFER_STD)
> @@ -153,6 +153,11 @@ _ENTRY(_start);
>  /* Decrementer */
>  	EXCEPTION(0x900, Decrementer, timer_interrupt, EXC_XFER_LITE)
>
> +	/* With VMAP_STACK there's not enough room for this at 0x600 */
> +	. =3D 0xa00
> +.Lalignment_exception_ool:
> +	EXC_XFER_STD(0x600, alignment_exception)
> +
>  /* System call */
>  	. =3D 0xc00
>  SystemCall:
> --
> 2.21.1


