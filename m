Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B54D7F219E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 00:52:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kp8ucdqG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZ47V3J05z3ckQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 10:52:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kp8ucdqG;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZ46f3p7gz3c5H
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 10:51:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1700524314;
	bh=jR0Hf6327B7/OYzN1VHBnicX4g5bDf6vltQfCoh+8SY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kp8ucdqGYDvrnc9eGyxIFREKJCsO1HEytudDisVuEP2gfBZSbRih9wsiNG8A7gqAV
	 jFtxrTHlXaC+zEinxqAbsJv8al06rTwM01AEQVzJ+IVYiZeXSmU21l/JQHSv2ZxDeI
	 LAzyyz2bF3fSP7hfg1rQ6NjfOUMMgeOA44Se2kgX0TlLMNRgXRDYgSPnBwBlxkQj24
	 O358CUkVdUQmOllChkoR+1JWOcoUvC0frSzcRZV1AthFLCQ9438TPhIghloCnpeXr+
	 iS8KvtgfSfpesg9dx5vZIXbAwhjNb2ARI89OUHf9pkTa6nNeKvaav4AbDtdu4GmPrQ
	 GXMkQ7gaVugJQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SZ46f12cMz4wdB;
	Tue, 21 Nov 2023 10:51:53 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Naveen N Rao
 <naveen@kernel.org>, Balamuruhan S <bala24@linux.ibm.com>
Subject: Re: [RFC - is this a bug?] powerpc/lib/sstep: Asking for some light
 on this, please. :)
In-Reply-To: <dfd4895d-241d-4f09-a6a8-9b1781793226@embeddedor.com>
References: <6a8bf78c-aedb-4d5a-b0aa-82a51a17b884@embeddedor.com>
 <kheudo7mk4dtjtkble2hdgsc4eod336oirsq3xj4so2upsbjzu@gx3wydlzshru>
 <5764b2f5-d0ae-4123-8a40-e4ecbf6908fd@embeddedor.com>
 <duj4s25crkeo7etywq4unqcuhdxc3v3fbx6qkw7mbzq66zsu5d@uz7uslgrooiz>
 <dfd4895d-241d-4f09-a6a8-9b1781793226@embeddedor.com>
Date: Tue, 21 Nov 2023 10:51:53 +1100
Message-ID: <871qck6l0m.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Gustavo A. R. Silva" <gustavo@embeddedor.com> writes:
> On 11/20/23 09:21, Naveen N Rao wrote:
>> On Mon, Nov 20, 2023 at 08:33:45AM -0600, Gustavo A. R. Silva wrote:
>>> On 11/20/23 08:25, Naveen N Rao wrote:
>>>> On Fri, Nov 17, 2023 at 12:36:01PM -0600, Gustavo A. R. Silva wrote:
>>>>> Hi all,
>>>>>
>>>>> I'm trying to fix the following -Wstringop-overflow warnings, and I'd=
 like
>>>>> to get your feedback on this, please:
>>>>>
>>>>> In function 'do_byte_reverse',
>>>>>       inlined from 'do_vec_store' at /home/gus/linux/arch/powerpc/lib=
/sstep.c:722:3,
>>>>>       inlined from 'emulate_loadstore' at /home/gus/linux/arch/powerp=
c/lib/sstep.c:3510:9:
>>>>> arch/powerpc/lib/sstep.c:287:23: error: writing 8 bytes into a region=
 of size 0 [-Werror=3Dstringop-overflow=3D]
>>>>>     287 |                 up[3] =3D tmp;
>>>>>         |                 ~~~~~~^~~~~
>>>>> arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
>>>>> arch/powerpc/lib/sstep.c:708:11: note: at offset [24, 39] into destin=
ation object 'u' of size 16
>>>>>     708 |         } u;
>>>>>         |           ^
>>>>> In function 'do_byte_reverse',
>>>>>       inlined from 'do_vec_store' at /home/gus/linux/arch/powerpc/lib=
/sstep.c:722:3,
>>>>>       inlined from 'emulate_loadstore' at /home/gus/linux/arch/powerp=
c/lib/sstep.c:3510:9:
>>>>> arch/powerpc/lib/sstep.c:289:23: error: writing 8 bytes into a region=
 of size 0 [-Werror=3Dstringop-overflow=3D]
>>>>>     289 |                 up[2] =3D byterev_8(up[1]);
>>>>>         |                 ~~~~~~^~~~~~~~~~~~~~~~~~
>>>>> arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
>>>>> arch/powerpc/lib/sstep.c:708:11: note: at offset 16 into destination =
object 'u' of size 16
>>>>>     708 |         } u;
>>>>>         |           ^
>>>>> In function 'do_byte_reverse',
>>>>>       inlined from 'do_vec_load' at /home/gus/linux/arch/powerpc/lib/=
sstep.c:691:3,
>>>>>       inlined from 'emulate_loadstore' at /home/gus/linux/arch/powerp=
c/lib/sstep.c:3439:9:
>>>>> arch/powerpc/lib/sstep.c:287:23: error: writing 8 bytes into a region=
 of size 0 [-Werror=3Dstringop-overflow=3D]
>>>>>     287 |                 up[3] =3D tmp;
>>>>>         |                 ~~~~~~^~~~~
>>>>> arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
>>>>> arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into destin=
ation object 'u' of size 16
>>>>>     681 |         } u =3D {};
>>>>>         |           ^
>>>>> arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into destin=
ation object 'u' of size 16
>>>>> arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into destin=
ation object 'u' of size 16
>>>>>
>>>>> The origing of the issue seems to be the following calls to function =
`do_vec_store()`, when
>>>>> `size > 16`, or more precisely when `size =3D=3D 32`
>>>>>
>>>>> arch/powerpc/lib/sstep.c:
>>>>> 3436         case LOAD_VMX:
>>>>> 3437                 if (!(regs->msr & MSR_PR) && !(regs->msr & MSR_V=
EC))
>>>>> 3438                         return 0;
>>>>> 3439                 err =3D do_vec_load(op->reg, ea, size, regs, cro=
ss_endian);
>>>>> 3440                 break;
>>>>> ...
>>>>> 3507         case STORE_VMX:
>>>>> 3508                 if (!(regs->msr & MSR_PR) && !(regs->msr & MSR_V=
EC))
>>>>> 3509                         return 0;
>>>>> 3510                 err =3D do_vec_store(op->reg, ea, size, regs, cr=
oss_endian);
>>>>> 3511                 break;
>>>>
>>>> LOAD_VMX and STORE_VMX are set in analyse_instr() and size does not
>>>> exceed 16. So, the warning looks incorrect to me.
>>>
>>> Does that mean that this piece of code is never actually executed:
>>>
>>>   281         case 32: {
>>>   282                 unsigned long *up =3D (unsigned long *)ptr;
>>>   283                 unsigned long tmp;
>>>   284
>>>   285                 tmp =3D byterev_8(up[0]);
>>>   286                 up[0] =3D byterev_8(up[3]);
>>>   287                 up[3] =3D tmp;
>>>   288                 tmp =3D byterev_8(up[2]);
>>>   289                 up[2] =3D byterev_8(up[1]);
>>>   290                 up[1] =3D tmp;
>>>   291                 break;
>>>   292         }
>>>
>>> or rather, under which conditions the above code is executed, if any?
>>=20
>> Please see git history to understand the commit that introduced that
>> code. You can do that by starting with a 'git blame' on the file. You'll
>> find that the commit that introduced the above hunk was af99da74333b
>> ("powerpc/sstep: Support VSX vector paired storage access
>> instructions").
>>=20
>> The above code path is hit via
>> do_vsx_load()->emulate_vsx_load()->do_byte_reverse()
>
> It seems there is another path (at least the one that triggers the
> -Wstringop-overflow warnings):
>
> emulate_step()->emulate_loadstore()->do_vec_load()->do_byte_reverse()
>
> emulate_step() {
> ...
> if (OP_IS_LOAD_STORE(type)) {
=20
The type comes from the op, which is determined in analyse_instr()

>                  err =3D emulate_loadstore(regs, &op);
>                  if (err)
>                          return 0;
>                  goto instr_done;
>          }
> ...
> }
>
> ----> emulate_loadstore() {
> ...
> #ifdef CONFIG_ALTIVEC
>          case LOAD_VMX:
>                  if (!(regs->msr & MSR_PR) && !(regs->msr & MSR_VEC))
>                          return 0;
>                  err =3D do_vec_load(op->reg, ea, size, regs, cross_endia=
n); // with size =3D=3D 32
>                  break;
> #endif
> ...
> #ifdef CONFIG_ALTIVEC
>          case STORE_VMX:
>                  if (!(regs->msr & MSR_PR) && !(regs->msr & MSR_VEC))
>                          return 0;
>                  err =3D do_vec_store(op->reg, ea, size, regs, cross_endi=
an); // with size =3D=3D 32
>                  break;
> #endif
> ...
> }

If you look at analyse_instr() the cases that produce an op with
type =3D=3D LOAD_VMX/STORE_VMX never use a size of 32:

$ git grep -E "MKOP\((LOAD|STORE)_VMX" arch/powerpc/
arch/powerpc/lib/sstep.c:                        op->type =3D MKOP(LOAD_VMX=
, 0, 1);
arch/powerpc/lib/sstep.c:                        op->type =3D MKOP(LOAD_VMX=
, 0, 2);
arch/powerpc/lib/sstep.c:                        op->type =3D MKOP(LOAD_VMX=
, 0, 4);
arch/powerpc/lib/sstep.c:                        op->type =3D MKOP(LOAD_VMX=
, 0, 16);
arch/powerpc/lib/sstep.c:                        op->type =3D MKOP(STORE_VM=
X, 0, 1);
arch/powerpc/lib/sstep.c:                        op->type =3D MKOP(STORE_VM=
X, 0, 2);
arch/powerpc/lib/sstep.c:                        op->type =3D MKOP(STORE_VM=
X, 0, 4);
arch/powerpc/lib/sstep.c:                        op->type =3D MKOP(STORE_VM=
X, 0, 16);


So I don't think there's an actual bug.

But the code is very hard to follow and it would be very easy for a bug
to be introduced.

D=C3=A9j=C3=A0 vu intensifies...

... and apparently I have a patch for this that I never sent out. Sorry! :}

I'll post it and see if the build bots are happy.

cheers
