Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 830F02C3BD9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 10:20:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgwNF0MFwzDqjx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 20:20:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgwLP6MV3zDqXs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 20:18:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4CgwLP2VRSz8tY4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 20:18:53 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4CgwLP1qr0z9sSs; Wed, 25 Nov 2020 20:18:53 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4CgwLM0vqpz9s0b
 for <linuxppc-dev@ozlabs.org>; Wed, 25 Nov 2020 20:18:43 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CgwL50b4fz9ty4Q;
 Wed, 25 Nov 2020 10:18:37 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 3vqczoful9tO; Wed, 25 Nov 2020 10:18:37 +0100 (CET)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CgwL46k0lz9ty4P;
 Wed, 25 Nov 2020 10:18:36 +0100 (CET)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 9BE1C868; Wed, 25 Nov 2020 10:21:34 +0100 (CET)
Received: from 192.168.4.90 ([192.168.4.90]) by messagerie.c-s.fr (Horde
 Framework) with HTTP; Wed, 25 Nov 2020 10:21:34 +0100
Date: Wed, 25 Nov 2020 10:21:34 +0100
Message-ID: <20201125102134.Horde.0HRWPh9SlZQBfjT7da-o2A1@messagerie.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: C vdso
References: <20200916165516.Horde.uocmo3irPb7BMg__NUSqRA9@messagerie.si.c-s.fr>
 <87r1r0oa4o.fsf@mpe.ellerman.id.au>
 <cc532aa8-a9e0-a105-b7b1-ee8d723b7ed6@csgroup.eu>
 <be21c7c8-6828-b757-064d-20f74e5c1a31@csgroup.eu>
 <877drhxeg8.fsf@mpe.ellerman.id.au>
 <50214d90-be25-f673-494c-840fdfb96206@csgroup.eu>
 <49ac0354-d6a5-be2c-c717-965e6a102320@csgroup.eu>
 <87tuteyyxi.fsf@mpe.ellerman.id.au>
In-Reply-To: <87tuteyyxi.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Quoting Michael Ellerman <mpe@ellerman.id.au>:

> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> Le 03/11/2020 =C3=A0 19:13, Christophe Leroy a =C3=A9crit=C2=A0:
>>> Le 23/10/2020 =C3=A0 15:24, Michael Ellerman a =C3=A9crit=C2=A0:
>>>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>>>> Le 24/09/2020 =C3=A0 15:17, Christophe Leroy a =C3=A9crit=C2=A0:
>>>>>> Le 17/09/2020 =C3=A0 14:33, Michael Ellerman a =C3=A9crit=C2=A0:
>>>>>>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>>>>>>>
>>>>>>>> What is the status with the generic C vdso merge ?
>>>>>>>> In some mail, you mentionned having difficulties getting it workin=
g on
>>>>>>>> ppc64, any progress ? What's the problem ? Can I help ?
>>>>>>>
>>>>>>> Yeah sorry I was hoping to get time to work on it but haven't been =
able
>>>>>>> to.
>>>>>>>
>>>>>>> It's causing crashes on ppc64 ie. big endian.
>>>> ...
>>>>>>
>>>>>> Can you tell what defconfig you are using ? I have been able to=20=
=20
>>>>>>=20setup a full glibc PPC64 cross
>>>>>> compilation chain and been able to test it under QEMU with=20=20
>>>>>>=20success, using Nathan's vdsotest tool.
>>>>>
>>>>> What config are you using ?
>>>>
>>>> ppc64_defconfig + guest.config
>>>>
>>>> Or pseries_defconfig.
>>>>
>>>> I'm using Ubuntu GCC 9.3.0 mostly, but it happens with other=20=20
>>>>=20toolchains too.
>>>>
>>>> At a minimum we're seeing relocations in the output, which is a proble=
m:
>>>>
>>>> =C2=A0=C2=A0 $ readelf -r build\~/arch/powerpc/kernel/vdso64/vdso64.so
>>>> =C2=A0=C2=A0 Relocation section '.rela.dyn' at offset 0x12a8 contains =
8 entries:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Offset=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Info=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Type=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Sym=
. Value=C2=A0=C2=A0=C2=A0=20=20
>>>>=20Sym. Name + Addend
>>>> =C2=A0=C2=A0 000000001368=C2=A0 000000000016 R_PPC64_RELATIVE=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7c0
>>>> =C2=A0=C2=A0 000000001370=C2=A0 000000000016 R_PPC64_RELATIVE=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9300
>>>> =C2=A0=C2=A0 000000001380=C2=A0 000000000016 R_PPC64_RELATIVE=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 970
>>>> =C2=A0=C2=A0 000000001388=C2=A0 000000000016 R_PPC64_RELATIVE=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9300
>>>> =C2=A0=C2=A0 000000001398=C2=A0 000000000016 R_PPC64_RELATIVE=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 a90
>>>> =C2=A0=C2=A0 0000000013a0=C2=A0 000000000016 R_PPC64_RELATIVE=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9300
>>>> =C2=A0=C2=A0 0000000013b0=C2=A0 000000000016 R_PPC64_RELATIVE=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 b20
>>>> =C2=A0=C2=A0 0000000013b8=C2=A0 000000000016 R_PPC64_RELATIVE=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9300
>>>
>>> Looks like it's due to the OPD and relation between the function()=20=
=20
>>>=20and .function()
>>>
>>> By using DOTSYM() in the 'bl' call, that's directly the dot=20=20
>>>=20function which is called and the OPD is
>>> not used anymore, it can get dropped.
>>>
>>> Now I get .rela.dyn full of 0, don't know if we should drop it explicit=
ely.
>>
>> What is the status now with latest version of CVDSO ? I saw you had=20=
=20
>>=20it in next-test for some time,
>> it is not there anymore today.
>
> Still having some trouble with the compat VDSO.
>
> eg:
>
> $ ./vdsotest clock-gettime-monotonic verify
> timestamp obtained from kernel predates timestamp
> previously obtained from libc/vDSO:
> 	[1346, 821441653] (vDSO)
> 	[570, 769440040] (kernel)
>
>
> And similar for all clocks except the coarse ones.
>

Ok, I managed to get the same with QEMU. Looking at the binary, I only=20=
=20
see=20an mftb instead of the mftbu/mftb/mftbu triplet.

Fix below. Can you carry it, or do you prefer a full patch from me ?=20=20
The=20easiest would be either to squash it into [v13,4/8]=20=20
("powerpc/time:=20Move timebase functions into new asm/timebase.h"), or=20=
=20
to=20add it between patch 4 and 5 ?

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.=
h
index f877a576b338..c3473eb031a3 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -1419,7 +1419,7 @@ static inline void msr_check_and_clear(unsigned=20=20
long=20bits)
  		__msr_check_and_clear(bits);
  }

-#if defined(CONFIG_PPC_CELL) || defined(CONFIG_E500)
+#if defined(__powerpc64__) && (defined(CONFIG_PPC_CELL) ||=20=20
defined(CONFIG_E500))
=20 #define mftb()		({unsigned long rval;				\
  			asm volatile(					\
  				"90:	mfspr %0, %2;\n"		\
diff --git a/arch/powerpc/include/asm/timebase.h=20=20
b/arch/powerpc/include/asm/timebase.h
index=20a8eae3adaa91..7b372976f5a5 100644
--- a/arch/powerpc/include/asm/timebase.h
+++ b/arch/powerpc/include/asm/timebase.h
@@ -21,7 +21,7 @@ static inline u64 get_tb(void)
  {
  	unsigned int tbhi, tblo, tbhi2;

-	if (IS_ENABLED(CONFIG_PPC64))
+	if (IS_BUILTIN(__powerpc64__))
  		return mftb();

  	do {

