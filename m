Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E642C366B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 03:06:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgklH402tzDqZW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 13:06:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgkjB22BdzDqLy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 13:04:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=PkFhZffo; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4Cgkj929S4z9sSs; Wed, 25 Nov 2020 13:04:29 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cgkj90dvFz9sRK;
 Wed, 25 Nov 2020 13:04:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1606269869;
 bh=Y4hKnEv7c23eIe71ELM+qjjUelOXgnJzYdQlMRIH7lY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=PkFhZffoZsfB9iUrBsPpHOIdl8fxUCOkM2JJH/I78l7ZSzudw/cAYlhfHTWYWQsqs
 kSOritl6wKbMpTBTfU+Ut7d34H4RL+Fdv+6naK6kUrs8o+oh9Oy/S6YUOnNIx+TYrh
 /VTNstDNBW00fSq4EETrrOdtKnz8us3QEFwPSs+Q2uVDOkIZWkC115uHZFH9nWpV2M
 gp4zb31TOHCbgjjj6pszCojoP8M4Yvep1q+uw6WzE41udS6arBoSMjCaxD1iperi5g
 a2vIDeNc7JjWwWMpVs6Asv4CucF/Nvjbb1wQaOy/aiJqyIr+29EPGFB1qpV38Bg6k8
 vHL+Q4/bqL1iA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: C vdso
In-Reply-To: <49ac0354-d6a5-be2c-c717-965e6a102320@csgroup.eu>
References: <20200916165516.Horde.uocmo3irPb7BMg__NUSqRA9@messagerie.si.c-s.fr>
 <87r1r0oa4o.fsf@mpe.ellerman.id.au>
 <cc532aa8-a9e0-a105-b7b1-ee8d723b7ed6@csgroup.eu>
 <be21c7c8-6828-b757-064d-20f74e5c1a31@csgroup.eu>
 <877drhxeg8.fsf@mpe.ellerman.id.au>
 <50214d90-be25-f673-494c-840fdfb96206@csgroup.eu>
 <49ac0354-d6a5-be2c-c717-965e6a102320@csgroup.eu>
Date: Wed, 25 Nov 2020 13:04:25 +1100
Message-ID: <87tuteyyxi.fsf@mpe.ellerman.id.au>
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
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 03/11/2020 =C3=A0 19:13, Christophe Leroy a =C3=A9crit=C2=A0:
>> Le 23/10/2020 =C3=A0 15:24, Michael Ellerman a =C3=A9crit=C2=A0:
>>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>>> Le 24/09/2020 =C3=A0 15:17, Christophe Leroy a =C3=A9crit=C2=A0:
>>>>> Le 17/09/2020 =C3=A0 14:33, Michael Ellerman a =C3=A9crit=C2=A0:
>>>>>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>>>>>>
>>>>>>> What is the status with the generic C vdso merge ?
>>>>>>> In some mail, you mentionned having difficulties getting it working=
 on
>>>>>>> ppc64, any progress ? What's the problem ? Can I help ?
>>>>>>
>>>>>> Yeah sorry I was hoping to get time to work on it but haven't been a=
ble
>>>>>> to.
>>>>>>
>>>>>> It's causing crashes on ppc64 ie. big endian.
>>> ...
>>>>>
>>>>> Can you tell what defconfig you are using ? I have been able to setup=
 a full glibc PPC64 cross
>>>>> compilation chain and been able to test it under QEMU with success, u=
sing Nathan's vdsotest tool.
>>>>
>>>> What config are you using ?
>>>
>>> ppc64_defconfig + guest.config
>>>
>>> Or pseries_defconfig.
>>>
>>> I'm using Ubuntu GCC 9.3.0 mostly, but it happens with other toolchains=
 too.
>>>
>>> At a minimum we're seeing relocations in the output, which is a problem:
>>>
>>> =C2=A0=C2=A0 $ readelf -r build\~/arch/powerpc/kernel/vdso64/vdso64.so
>>> =C2=A0=C2=A0 Relocation section '.rela.dyn' at offset 0x12a8 contains 8=
 entries:
>>> =C2=A0=C2=A0=C2=A0=C2=A0 Offset=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Info=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Type=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Sym=
. Value=C2=A0=C2=A0=C2=A0 Sym. Name + Addend
>>> =C2=A0=C2=A0 000000001368=C2=A0 000000000016 R_PPC64_RELATIVE=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7c0
>>> =C2=A0=C2=A0 000000001370=C2=A0 000000000016 R_PPC64_RELATIVE=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9300
>>> =C2=A0=C2=A0 000000001380=C2=A0 000000000016 R_PPC64_RELATIVE=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 970
>>> =C2=A0=C2=A0 000000001388=C2=A0 000000000016 R_PPC64_RELATIVE=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9300
>>> =C2=A0=C2=A0 000000001398=C2=A0 000000000016 R_PPC64_RELATIVE=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 a90
>>> =C2=A0=C2=A0 0000000013a0=C2=A0 000000000016 R_PPC64_RELATIVE=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9300
>>> =C2=A0=C2=A0 0000000013b0=C2=A0 000000000016 R_PPC64_RELATIVE=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 b20
>>> =C2=A0=C2=A0 0000000013b8=C2=A0 000000000016 R_PPC64_RELATIVE=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9300
>>=20
>> Looks like it's due to the OPD and relation between the function() and .=
function()
>>=20
>> By using DOTSYM() in the 'bl' call, that's directly the dot function whi=
ch is called and the OPD is=20
>> not used anymore, it can get dropped.
>>=20
>> Now I get .rela.dyn full of 0, don't know if we should drop it explicite=
ly.
>
> What is the status now with latest version of CVDSO ? I saw you had it in=
 next-test for some time,=20
> it is not there anymore today.

Still having some trouble with the compat VDSO.

eg:

$ ./vdsotest clock-gettime-monotonic verify
timestamp obtained from kernel predates timestamp
previously obtained from libc/vDSO:
	[1346, 821441653] (vDSO)
	[570, 769440040] (kernel)


And similar for all clocks except the coarse ones.

Hopefully I can find time to dig into it.

cheers
