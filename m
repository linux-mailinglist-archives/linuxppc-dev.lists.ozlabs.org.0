Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B652C410C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 14:23:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch1mZ1qglzDqHV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 00:23:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ch0Qh1Mg0zDqn2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 23:22:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=qewmJXNk; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4Ch0Qg2g26z9sSf; Wed, 25 Nov 2020 23:22:51 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ch0Qf509dz9s0b;
 Wed, 25 Nov 2020 23:22:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1606306971;
 bh=FRwVWVebZf2DkbIk7DYuWX+IyC38zqW5HRtzL0YnQ/0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=qewmJXNkzstd3e8YPtuWALtDT03iYozyvb0qq+b0+9UFmOp8e66gfPHjL8XyiTdLr
 /yL24XGpbTQpPc9VUMsaEqw3cgKy3NHSTkZZnnmM20qns8sv0RBm8davhHS7Ry7Ycc
 WVSzfPQlRsJhTr0BQFHJGAjNv3qIKtEds61fG7uY2q4OF52/XZh/NFE+PYanETx6zu
 joT4L1XPSYT6U1DG5OwbRkhWyW4dd33dYDbLI+YVCcaewkW2tq2bF3vr58pXeaQnOI
 hgUtzdo8bDQl7xBSiv+ERDp5w2yYWnMnftBUySJSQLtwYaVCK5ryrXZMX2OPJFFhtd
 gQda77Uz75GYw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: C vdso
In-Reply-To: <20201125102134.Horde.0HRWPh9SlZQBfjT7da-o2A1@messagerie.c-s.fr>
References: <20200916165516.Horde.uocmo3irPb7BMg__NUSqRA9@messagerie.si.c-s.fr>
 <87r1r0oa4o.fsf@mpe.ellerman.id.au>
 <cc532aa8-a9e0-a105-b7b1-ee8d723b7ed6@csgroup.eu>
 <be21c7c8-6828-b757-064d-20f74e5c1a31@csgroup.eu>
 <877drhxeg8.fsf@mpe.ellerman.id.au>
 <50214d90-be25-f673-494c-840fdfb96206@csgroup.eu>
 <49ac0354-d6a5-be2c-c717-965e6a102320@csgroup.eu>
 <87tuteyyxi.fsf@mpe.ellerman.id.au>
 <20201125102134.Horde.0HRWPh9SlZQBfjT7da-o2A1@messagerie.c-s.fr>
Date: Wed, 25 Nov 2020 23:22:45 +1100
Message-ID: <87ft4xzkve.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Quoting Michael Ellerman <mpe@ellerman.id.au>:
>
>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>> Le 03/11/2020 =C3=A0 19:13, Christophe Leroy a =C3=A9crit=C2=A0:
>>>> Le 23/10/2020 =C3=A0 15:24, Michael Ellerman a =C3=A9crit=C2=A0:
>>>>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>>>>> Le 24/09/2020 =C3=A0 15:17, Christophe Leroy a =C3=A9crit=C2=A0:
>>>>>>> Le 17/09/2020 =C3=A0 14:33, Michael Ellerman a =C3=A9crit=C2=A0:
>>>>>>>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>>>>>>>>
>>>>>>>>> What is the status with the generic C vdso merge ?
>>>>>>>>> In some mail, you mentionned having difficulties getting it worki=
ng on
>>>>>>>>> ppc64, any progress ? What's the problem ? Can I help ?
>>>>>>>>
>>>>>>>> Yeah sorry I was hoping to get time to work on it but haven't been=
 able
>>>>>>>> to.
>>>>>>>>
>>>>>>>> It's causing crashes on ppc64 ie. big endian.
>>>>> ...
>>>>>>>
>>>>>>> Can you tell what defconfig you are using ? I have been able to=20=
=20
>>>>>>> setup a full glibc PPC64 cross
>>>>>>> compilation chain and been able to test it under QEMU with=20=20
>>>>>>> success, using Nathan's vdsotest tool.
>>>>>>
>>>>>> What config are you using ?
>>>>>
>>>>> ppc64_defconfig + guest.config
>>>>>
>>>>> Or pseries_defconfig.
>>>>>
>>>>> I'm using Ubuntu GCC 9.3.0 mostly, but it happens with other=20=20
>>>>> toolchains too.
>>>>>
>>>>> At a minimum we're seeing relocations in the output, which is a probl=
em:
>>>>>
>>>>> =C2=A0=C2=A0 $ readelf -r build\~/arch/powerpc/kernel/vdso64/vdso64.so
>>>>> =C2=A0=C2=A0 Relocation section '.rela.dyn' at offset 0x12a8 contains=
 8 entries:
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Offset=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 Info=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Type=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
Sym. Value=C2=A0=C2=A0=C2=A0=20=20
>>>>> Sym. Name + Addend
>>>>> =C2=A0=C2=A0 000000001368=C2=A0 000000000016 R_PPC64_RELATIVE=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7c0
>>>>> =C2=A0=C2=A0 000000001370=C2=A0 000000000016 R_PPC64_RELATIVE=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9300
>>>>> =C2=A0=C2=A0 000000001380=C2=A0 000000000016 R_PPC64_RELATIVE=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 970
>>>>> =C2=A0=C2=A0 000000001388=C2=A0 000000000016 R_PPC64_RELATIVE=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9300
>>>>> =C2=A0=C2=A0 000000001398=C2=A0 000000000016 R_PPC64_RELATIVE=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 a90
>>>>> =C2=A0=C2=A0 0000000013a0=C2=A0 000000000016 R_PPC64_RELATIVE=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9300
>>>>> =C2=A0=C2=A0 0000000013b0=C2=A0 000000000016 R_PPC64_RELATIVE=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 b20
>>>>> =C2=A0=C2=A0 0000000013b8=C2=A0 000000000016 R_PPC64_RELATIVE=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9300
>>>>
>>>> Looks like it's due to the OPD and relation between the function()=20=
=20
>>>> and .function()
>>>>
>>>> By using DOTSYM() in the 'bl' call, that's directly the dot=20=20
>>>> function which is called and the OPD is
>>>> not used anymore, it can get dropped.
>>>>
>>>> Now I get .rela.dyn full of 0, don't know if we should drop it explici=
tely.
>>>
>>> What is the status now with latest version of CVDSO ? I saw you had=20=
=20
>>> it in next-test for some time,
>>> it is not there anymore today.
>>
>> Still having some trouble with the compat VDSO.
>>
>> eg:
>>
>> $ ./vdsotest clock-gettime-monotonic verify
>> timestamp obtained from kernel predates timestamp
>> previously obtained from libc/vDSO:
>> 	[1346, 821441653] (vDSO)
>> 	[570, 769440040] (kernel)
>>
>>
>> And similar for all clocks except the coarse ones.
>>
>
> Ok, I managed to get the same with QEMU. Looking at the binary, I only=20=
=20
> see an mftb instead of the mftbu/mftb/mftbu triplet.
>
> Fix below. Can you carry it, or do you prefer a full patch from me ?=20=20
> The easiest would be either to squash it into [v13,4/8]=20=20
> ("powerpc/time: Move timebase functions into new asm/timebase.h"), or=20=
=20
> to add it between patch 4 and 5 ?

I can squash it in.

cheers
