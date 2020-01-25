Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B68A314959B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jan 2020 14:03:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 484bmk3GBVzDqTN
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jan 2020 00:03:50 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 484bhy1r4szDqSD
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jan 2020 00:00:33 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 484bhp51jXz9vCR6;
 Sat, 25 Jan 2020 14:00:26 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id EVhjlkEv73BO; Sat, 25 Jan 2020 14:00:26 +0100 (CET)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 484bhp49Cmz9vCR0;
 Sat, 25 Jan 2020 14:00:26 +0100 (CET)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id B3A05660; Sat, 25 Jan 2020 14:00:52 +0100 (CET)
Received: from 37.173.164.116 ([37.173.164.116]) by messagerie.si.c-s.fr
 (Horde Framework) with HTTP; Sat, 25 Jan 2020 14:00:52 +0100
Date: Sat, 25 Jan 2020 14:00:52 +0100
Message-ID: <20200125140052.Horde.0-n2_EcIdGahTxfDVj913w1@messagerie.si.c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/32: Add missing context synchronisation with
 CONFIG_VMAP_STACK
References: <872477f7c7552d3bb7baf0b302398fcd42c5fcfd.1579885334.git.christophe.leroy@c-s.fr>
 <87r1znhgvi.fsf@mpe.ellerman.id.au>
In-Reply-To: <87r1znhgvi.fsf@mpe.ellerman.id.au>
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> a =C3=A9crit=C2=A0:

> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>> After reactivation of data translation by modifying MSR[DR], a isync
>> is required to ensure the translation is effective.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> ---
>> Rebased on powerpc/merge-test
>>
>> @mpe: If not too late:
>> - change to head_32.h should be squashed into "powerpc/32: prepare=20=20
>>=20for CONFIG_VMAP_STACK"
>> - change to head_32.S should be squashed into "powerpc/32s: Enable=20=20
>>=20CONFIG_VMAP_STACK"
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> ---
>>  arch/powerpc/kernel/head_32.S | 1 +
>>  arch/powerpc/kernel/head_32.h | 2 ++
>>  2 files changed, 3 insertions(+)
>>
>> diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32=
.h
>> index 73a035b40dbf..a6a5fbbf8504 100644
>> --- a/arch/powerpc/kernel/head_32.h
>> +++ b/arch/powerpc/kernel/head_32.h
>> @@ -43,6 +43,7 @@
>>  	.ifeq	\for_rtas
>>  	li	r11, MSR_KERNEL & ~(MSR_IR | MSR_RI) /* can take DTLB miss */
>>  	mtmsr	r11
>> +	isync
>
> Actually this one leads to:
>
>   /home/michael/linux/arch/powerpc/kernel/head_8xx.S: Assembler messages:
>   /home/michael/linux/arch/powerpc/kernel/head_8xx.S:151: Error:=20=20
>=20attempt to move .org backwards
>   make[3]: *** [/home/michael/linux/scripts/Makefile.build:348:=20=20
>=20arch/powerpc/kernel/head_8xx.o] Error 1
>
> For mpc885_ads_defconfig.
>
> That's the alignment exception overflowing into the program check
> handler:
>
> /* Alignment exception */
> 	. =3D 0x600
> Alignment:
> 	EXCEPTION_PROLOG handle_dar_dsisr=3D1
> 	save_dar_dsisr_on_stack r4, r5, r11
> 	li	r6, RPN_PATTERN
> 	mtspr	SPRN_DAR, r6	/* Tag DAR, to be used in DTLB Error */
> 	addi	r3,r1,STACK_FRAME_OVERHEAD
> 	EXC_XFER_STD(0x600, alignment_exception)
>
> /* Program check exception */
> 	EXCEPTION(0x700, ProgramCheck, program_check_exception, EXC_XFER_STD)
>
>
> Can't see an obvious/easy way to fix it.

Argh !

I think the easiest is to move the EXC_XFER_STD(0x600,=20=20
alignment_exception)=20somewhere else and branch to it. There is some=20=20
space at .0xa00

Christophe

PS: I'm afk until monday
