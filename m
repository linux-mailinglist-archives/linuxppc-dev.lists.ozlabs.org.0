Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2AD2214AE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 20:48:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6RGX5RWbzDqnf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 04:48:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6RDd0hYFzDql0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 04:46:21 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4B6RDS377kz9vBLp;
 Wed, 15 Jul 2020 20:46:16 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id v3pZUE7jclzU; Wed, 15 Jul 2020 20:46:16 +0200 (CEST)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4B6RDS1Lj6z9vBLn;
 Wed, 15 Jul 2020 20:46:16 +0200 (CEST)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 037EE6CC; Wed, 15 Jul 2020 20:47:25 +0200 (CEST)
Received: from 37.173.149.38 ([37.173.149.38]) by messagerie.si.c-s.fr
 (Horde Framework) with HTTP; Wed, 15 Jul 2020 20:47:25 +0200
Date: Wed, 15 Jul 2020 20:47:25 +0200
Message-ID: <20200715204725.Horde.5GZvsEv4ZkdzFHL76HZiFg8@messagerie.si.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v8 5/8] powerpc/vdso: Prepare for switching VDSO to
 generic C implementation.
References: <cover.1588079622.git.christophe.leroy@c-s.fr>
 <2a67c333893454868bbfda773ba4b01c20272a5d.1588079622.git.christophe.leroy@c-s.fr>
 <878sflvbad.fsf@mpe.ellerman.id.au>
In-Reply-To: <878sflvbad.fsf@mpe.ellerman.id.au>
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
Cc: linux-arch@vger.kernel.org, nathanl@linux.ibm.com, arnd@arndb.de,
 linux-kernel@vger.kernel.org,
 Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>, Christophe Leroy <christophe.leroy@c-s.fr>,
 luto@kernel.org, tglx@linutronix.de, vincenzo.frascino@arm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> a =C3=A9crit=C2=A0:

> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>> Prepare for switching VDSO to generic C implementation in following
>> patch. Here, we:
>> - Modify __get_datapage() to take an offset
>> - Prepare the helpers to call the C VDSO functions
>> - Prepare the required callbacks for the C VDSO functions
>> - Prepare the clocksource.h files to define VDSO_ARCH_CLOCKMODES
>> - Add the C trampolines to the generic C VDSO functions
>>
>> powerpc is a bit special for VDSO as well as system calls in the
>> way that it requires setting CR SO bit which cannot be done in C.
>> Therefore, entry/exit needs to be performed in ASM.
>>
>> Implementing __arch_get_vdso_data() would clobber the link register,
>> requiring the caller to save it. As the ASM calling function already
>> has to set a stack frame and saves the link register before calling
>> the C vdso function, retriving the vdso data pointer there is lighter.
> ...
>
>> diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h=20=20
>>=20b/arch/powerpc/include/asm/vdso/gettimeofday.h
>> new file mode 100644
>> index 000000000000..4452897f9bd8
>> --- /dev/null
>> +++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
>> @@ -0,0 +1,175 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef __ASM_VDSO_GETTIMEOFDAY_H
>> +#define __ASM_VDSO_GETTIMEOFDAY_H
>> +
>> +#include <asm/ptrace.h>
>> +
>> +#ifdef __ASSEMBLY__
>> +
>> +.macro cvdso_call funct
>> +  .cfi_startproc
>> +	PPC_STLU	r1, -STACK_FRAME_OVERHEAD(r1)
>> +	mflr		r0
>> +  .cfi_register lr, r0
>> +	PPC_STL		r0, STACK_FRAME_OVERHEAD + PPC_LR_STKOFF(r1)
>
> This doesn't work for me on ppc64(le) with glibc.
>
> glibc doesn't create a stack frame before making the VDSO call, so the
> store of r0 (LR) goes into the caller's frame, corrupting the saved LR,
> leading to an infinite loop.

Where should it be saved if it can't be saved in the standard location ?

>
> This is an example from a statically built program that calls
> clock_gettime():
>
> 0000000010030cb0 <__clock_gettime>:
>     10030cb0:   0e 10 40 3c     lis     r2,4110
>     10030cb4:   00 7a 42 38     addi    r2,r2,31232
>     10030cb8:   a6 02 08 7c     mflr    r0
>     10030cbc:   ff ff 22 3d     addis   r9,r2,-1
>     10030cc0:   58 6d 29 39     addi    r9,r9,27992
>     10030cc4:   f0 ff c1 fb     std     r30,-16(r1)			<-- redzone store
>     10030cc8:   78 23 9e 7c     mr      r30,r4
>     10030ccc:   f8 ff e1 fb     std     r31,-8(r1)			<-- redzone store
>     10030cd0:   78 1b 7f 7c     mr      r31,r3
>     10030cd4:   10 00 01 f8     std     r0,16(r1)			<-- save LR to=20=20
>=20caller's frame
>     10030cd8:   00 00 09 e8     ld      r0,0(r9)
>     10030cdc:   00 00 20 2c     cmpdi   r0,0
>     10030ce0:   50 00 82 41     beq     10030d30 <__clock_gettime+0x80>
>     10030ce4:   a6 03 09 7c     mtctr   r0
>     10030ce8:   21 04 80 4e     bctrl					<-- vdso call
>     10030cec:   26 00 00 7c     mfcr    r0
>     10030cf0:   00 10 09 74     andis.  r9,r0,4096
>     10030cf4:   78 1b 69 7c     mr      r9,r3
>     10030cf8:   28 00 82 40     bne     10030d20 <__clock_gettime+0x70>
>     10030cfc:   b4 07 23 7d     extsw   r3,r9
>     10030d00:   10 00 01 e8     ld      r0,16(r1)			<-- load saved=20=20
>=20LR, since clobbered by the VDSO
>     10030d04:   f0 ff c1 eb     ld      r30,-16(r1)
>     10030d08:   f8 ff e1 eb     ld      r31,-8(r1)
>     10030d0c:   a6 03 08 7c     mtlr    r0				<-- restore LR
>     10030d10:   20 00 80 4e     blr					<-- jumps to 10030cec
>
>
> I'm kind of confused how it worked for you on 32-bit.

So am I then. I'm away for 3 weeks, summer break. I'll check when I'm back.

>
> There's also no code to load/restore the TOC pointer on BE, which I
> think we'll need to handle.

What does it means exactly ? Just saving r2 all the time ? Is there a=20=20
dedicated=20location in the stack frame for it ? Is that only for 64 be ?

Christophe


