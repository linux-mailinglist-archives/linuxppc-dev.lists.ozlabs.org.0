Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE122B491E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Nov 2020 16:25:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZXvb30VbzDqMf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 02:25:31 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZXsh1LvtzDqDK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 02:23:47 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CZXsN08X6z9twnc;
 Mon, 16 Nov 2020 16:23:36 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 8q6JWAeXMjiq; Mon, 16 Nov 2020 16:23:35 +0100 (CET)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CZXsM6Ljpz9v13s;
 Mon, 16 Nov 2020 16:23:35 +0100 (CET)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 544032561; Mon, 16 Nov 2020 16:26:30 +0100 (CET)
Received: from 192.168.4.90 ([192.168.4.90]) by messagerie.c-s.fr (Horde
 Framework) with HTTP; Mon, 16 Nov 2020 16:26:30 +0100
Date: Mon, 16 Nov 2020 16:26:30 +0100
Message-ID: <20201116162630.Horde.ihSuzv-KmZ3hdBC3_dOsHA6@messagerie.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: Error: invalid switch -me200
References: <202011131146.g8dPLQDD-lkp@intel.com>
 <CAFP8O3LpSmxVnjHfQAN455k1ZRg3PbgZYhWr030evCq1T10k=Q@mail.gmail.com>
 <20201113190824.GA1477315@ubuntu-m3-large-x86>
 <CAKwvOdkEtTQhDRFRV_d66FyhQBe536vRbOW=fQjesiHz3dfeBA@mail.gmail.com>
 <20201113200444.GA1496675@ubuntu-m3-large-x86>
 <CAKwvOdkBSGPaKmQY1nERVe4_n19Q=MUtuwdond=FJAAF9N9Zhg@mail.gmail.com>
 <20201114002037.GW2672@gate.crashing.org>
 <14e9ce2b-1a83-5353-44c7-b0709796c70e@csgroup.eu>
 <87h7pp4yzm.fsf@mpe.ellerman.id.au>
In-Reply-To: <87h7pp4yzm.fsf@mpe.ellerman.id.au>
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
Cc: Arnd Bergmann <arnd@kernel.org>, kbuild-all@lists.01.org,
 Brian Cain <bcain@codeaurora.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 =?utf-8?b?RsSBbmctcnXDrCA=?= =?utf-8?b?U8Oybmc=?= <maskray@google.com>,
 mihai.caraman@freescale.com, Nathan Chancellor <natechancellor@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Quoting Michael Ellerman <mpe@ellerman.id.au>:

> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> Le 14/11/2020 =C3=A0 01:20, Segher Boessenkool a =C3=A9crit=C2=A0:
>>> On Fri, Nov 13, 2020 at 12:14:18PM -0800, Nick Desaulniers wrote:
>>>>>>> Error: invalid switch -me200
>>>>>>> Error: unrecognized option -me200
>>>>>>
>>>>>> 251 cpu-as-$(CONFIG_E200)   +=3D -Wa,-me200
>>>>>>
>>>>>> Are those all broken configs, or is Kconfig messed up such that
>>>>>> randconfig can select these when it should not?
>>>>>
>>>>> Hmmm, looks like this flag does not exist in mainline binutils? There=
 is
>>>>> a thread in 2010 about this that Segher commented on:
>>>>>
>>>>> https://lore.kernel.org/linuxppc-dev/9859E645-954D-4D07-8003-FFCD2391=
AB6E@kernel.crashing.org/
>>>>>
>>>>> Guess this config should be eliminated?
>>>
>>> The help text for this config options says that e200 is used in 55xx,
>>> and there *is* an -me5500 GAS flag (which probably does this same
>>> thing, too).  But is any of this tested, or useful, or wanted?
>>>
>>> Maybe Christophe knows, cc:ed.
>>>
>>
>> I don't have much clue on this.
>
> Me either.
>
>> But I see on wikipedia that e5500 is a 64 bits powerpc=20=20
>>=20(https://en.wikipedia.org/wiki/PowerPC_e5500)
>>
>> What I see is that NXP seems to provide a GCC version that includes=20=
=20
>>=20aditionnal cpu (e200z0 e200z2
>> e200z3 e200z4 e200z6 e200z7):
>>
>> valid arguments to '-mcpu=3D' are: 401 403 405 405fp 440 440fp 464=20=20
>>=20464fp 476 476fp 505 601 602 603
>> 603e 604 604e 620 630 740 7400 7450 750 801 821 823 8540 8548 860=20=20
>>=20970 G3 G4 G5 a2 cell e200z0 e200z2
>> e200z3 e200z4 e200z6 e200z7 e300c2 e300c3 e500mc e500mc64 e5500=20=20
>>=20e6500 ec603e native power3 power4
>> power5 power5+ power6 power6x power7 power8 powerpc powerpc64=20=20
>>=20powerpc64le rs64 titan "
>>
>> https://community.nxp.com/t5/MPC5xxx/GCC-generating-not-implemented-inst=
ructions/m-p/845049
>>
>> Apparently based on binutils 2.28
>>
>> https://www.nxp.com/docs/en/release-note/S32DS-POWER-v1-2-RN.pdf
>>
>> But that's not exactly -me200 though.
>>
>> Now, I can't see any defconfig that selects CONFIG_E200, so is that=20=
=20
>>=20worth keeping it in the kernel
>> at all ?
>
> There was a commit in 2014 that suggests it worked at least to some
> extent then:
>
>   3477e71d5319 ("powerpc/booke: Restrict SPE exception handlers to=20=20
>=20e200/e500 cores")

Not sure, that patch seems to be focussed on the new e500mc

>
>
> Presumably there was a non-upstream toolchain where it was supported?
>
> AFAICS the kernel builds OK with just the cpu-as modification removed:
>
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index a4d56f0a41d9..16b8336f91dd 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -248,7 +248,6 @@ KBUILD_CFLAGS               +=3D $(call=20=20
>=20cc-option,-mno-string)
>  cpu-as-$(CONFIG_40x)           +=3D -Wa,-m405
>  cpu-as-$(CONFIG_44x)           +=3D -Wa,-m440
>  cpu-as-$(CONFIG_ALTIVEC)       +=3D $(call as-option,-Wa$(comma)-maltive=
c)
> -cpu-as-$(CONFIG_E200)          +=3D -Wa,-me200
>  cpu-as-$(CONFIG_E500)          +=3D -Wa,-me500
>
>  # When using '-many -mpower4' gas will first try and find a matching pow=
er4
>
>
> So that seems like the obvious fix for now.

Or we could do

diff --git a/arch/powerpc/platforms/Kconfig.cputype=20=20
b/arch/powerpc/platforms/Kconfig.cputype
index=20c194c4ae8bc7..a11cf9431e1e 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -67,6 +67,7 @@ config 44x
  	select PHYS_64BIT

  config E200
+	depends on $(cc-option,-me200)
  	bool "Freescale e200"

  endchoice
---
Christophe

