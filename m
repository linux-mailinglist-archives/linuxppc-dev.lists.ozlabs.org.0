Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A7B2B3CC8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Nov 2020 07:08:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZJXR1YQgzDqCx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Nov 2020 17:08:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZJVX4pqHzDqNr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Nov 2020 17:06:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=DuqXwDq6; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CZJVT5pSnz9sPB;
 Mon, 16 Nov 2020 17:06:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1605506788;
 bh=vqYCYo4MARa/47/zGrLgKczDlUHji65lqYdbUx/3osI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=DuqXwDq6U0b7naSqRQmRagUgb6qDI0kHN9U8xiS4ATTzm5VNnNhY2Jlay9CRTF8eU
 kR5dblk1m7rLD2GaP88/AUsPePKENcZdk/XyIubpEcyY5SN68siZadygmgHKbAaxk5
 hC8Mclnk1XiykNhfenWjZ0XGPbNjzce56uhhXfInzv8vkb7BtuPRZf0/lzwO2blwEY
 tCa9rRt3d/PCw0fi3QDwn1BImmPAs24JeAHRBOfHObYvfcyER2eE6yp9U04EHphPx3
 GCFKl8UGBNPFzBEnRtBYNPNhbzvOcj5boVd8IwGT51vnSOOTqhTKfR3YwJ5L/SgcU+
 r4i73rYuMbxMQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Segher Boessenkool <segher@kernel.crashing.org>,
 Nick Desaulniers <ndesaulniers@google.com>, mihai.caraman@freescale.com
Subject: Re: Error: invalid switch -me200
In-Reply-To: <14e9ce2b-1a83-5353-44c7-b0709796c70e@csgroup.eu>
References: <202011131146.g8dPLQDD-lkp@intel.com>
 <CAFP8O3LpSmxVnjHfQAN455k1ZRg3PbgZYhWr030evCq1T10k=Q@mail.gmail.com>
 <20201113190824.GA1477315@ubuntu-m3-large-x86>
 <CAKwvOdkEtTQhDRFRV_d66FyhQBe536vRbOW=fQjesiHz3dfeBA@mail.gmail.com>
 <20201113200444.GA1496675@ubuntu-m3-large-x86>
 <CAKwvOdkBSGPaKmQY1nERVe4_n19Q=MUtuwdond=FJAAF9N9Zhg@mail.gmail.com>
 <20201114002037.GW2672@gate.crashing.org>
 <14e9ce2b-1a83-5353-44c7-b0709796c70e@csgroup.eu>
Date: Mon, 16 Nov 2020 17:06:21 +1100
Message-ID: <87h7pp4yzm.fsf@mpe.ellerman.id.au>
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
Cc: Arnd Bergmann <arnd@kernel.org>, kbuild-all@lists.01.org,
 Brian Cain <bcain@codeaurora.org>,
 =?utf-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Masahiro Yamada <masahiroy@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 14/11/2020 =C3=A0 01:20, Segher Boessenkool a =C3=A9crit=C2=A0:
>> On Fri, Nov 13, 2020 at 12:14:18PM -0800, Nick Desaulniers wrote:
>>>>>> Error: invalid switch -me200
>>>>>> Error: unrecognized option -me200
>>>>>
>>>>> 251 cpu-as-$(CONFIG_E200)   +=3D -Wa,-me200
>>>>>
>>>>> Are those all broken configs, or is Kconfig messed up such that
>>>>> randconfig can select these when it should not?
>>>>
>>>> Hmmm, looks like this flag does not exist in mainline binutils? There =
is
>>>> a thread in 2010 about this that Segher commented on:
>>>>
>>>> https://lore.kernel.org/linuxppc-dev/9859E645-954D-4D07-8003-FFCD2391A=
B6E@kernel.crashing.org/
>>>>
>>>> Guess this config should be eliminated?
>>=20
>> The help text for this config options says that e200 is used in 55xx,
>> and there *is* an -me5500 GAS flag (which probably does this same
>> thing, too).  But is any of this tested, or useful, or wanted?
>>=20
>> Maybe Christophe knows, cc:ed.
>>=20
>
> I don't have much clue on this.

Me either.

> But I see on wikipedia that e5500 is a 64 bits powerpc (https://en.wikipe=
dia.org/wiki/PowerPC_e5500)
>
> What I see is that NXP seems to provide a GCC version that includes aditi=
onnal cpu (e200z0 e200z2=20
> e200z3 e200z4 e200z6 e200z7):
>
> valid arguments to '-mcpu=3D' are: 401 403 405 405fp 440 440fp 464 464fp =
476 476fp 505 601 602 603=20
> 603e 604 604e 620 630 740 7400 7450 750 801 821 823 8540 8548 860 970 G3 =
G4 G5 a2 cell e200z0 e200z2=20
> e200z3 e200z4 e200z6 e200z7 e300c2 e300c3 e500mc e500mc64 e5500 e6500 ec6=
03e native power3 power4=20
> power5 power5+ power6 power6x power7 power8 powerpc powerpc64 powerpc64le=
 rs64 titan "
>
> https://community.nxp.com/t5/MPC5xxx/GCC-generating-not-implemented-instr=
uctions/m-p/845049
>
> Apparently based on binutils 2.28
>
> https://www.nxp.com/docs/en/release-note/S32DS-POWER-v1-2-RN.pdf
>
> But that's not exactly -me200 though.
>
> Now, I can't see any defconfig that selects CONFIG_E200, so is that worth=
 keeping it in the kernel=20
> at all ?

There was a commit in 2014 that suggests it worked at least to some
extent then:

  3477e71d5319 ("powerpc/booke: Restrict SPE exception handlers to e200/e50=
0 cores")


Presumably there was a non-upstream toolchain where it was supported?

AFAICS the kernel builds OK with just the cpu-as modification removed:

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index a4d56f0a41d9..16b8336f91dd 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -248,7 +248,6 @@ KBUILD_CFLAGS               +=3D $(call cc-option,-mno-=
string)
 cpu-as-$(CONFIG_40x)           +=3D -Wa,-m405
 cpu-as-$(CONFIG_44x)           +=3D -Wa,-m440
 cpu-as-$(CONFIG_ALTIVEC)       +=3D $(call as-option,-Wa$(comma)-maltivec)
-cpu-as-$(CONFIG_E200)          +=3D -Wa,-me200
 cpu-as-$(CONFIG_E500)          +=3D -Wa,-me500

 # When using '-many -mpower4' gas will first try and find a matching power4


So that seems like the obvious fix for now.

I tried booting the resulting kernel in qemu, but I get:

  $ qemu-system-ppc -M none -cpu e200 -kernel build\~/vmlinux
  Error: Trying to register SPR 574 (23e) twice !


Which is not related AFAIK and indicates the qemu support is broken.

Unless we hear from someone that they're using mainline on an e200 then
it seems like it's a candidate for removal.

cheers
