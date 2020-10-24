Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC6D297BC6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Oct 2020 12:09:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CJGzG1cNNzDr3B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Oct 2020 21:09:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CJGxt1DsyzDqsx
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Oct 2020 21:08:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Uwc9G8o0; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4CJGxs4w3jz9sSW; Sat, 24 Oct 2020 21:08:01 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CJGxs3Xjyz9sSG;
 Sat, 24 Oct 2020 21:08:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1603534081;
 bh=luyJA5FdBXcg9+ajNwZCdx2msZz+14LN+lyqL3pVJQA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Uwc9G8o0I8D9zlfpTMFdB/c68AxKypzs65FjYlurPeD3s0jNcJXAlUZaZB5z9jP6T
 l7vmDEOV/ypkVnto+7goPg6Fpr6MYBs2ZnDC5jKKCzYE2c0SfNOnm6SDg8zKw3up4x
 yF6Ci/rrgfzt6AOtxyOFmuuLG+Pk4VHyMY2lpxfmYZvECVCunhKbScZNx7Fyuw8Ttj
 55mR2YdCZomai/7sDoyQkVfKEjCdC+kxGiNhOwysW6oubeb7+jVdfZxpr7Rl31yIlb
 mNtBmSFiZZEtI7ENJkKDqmqjg6zwVP6tR3k4IY1CyGgfJrLBgoBkTcfPbzvdibOmA8
 SQDNRBwLkn1Ag==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: C vdso
In-Reply-To: <877drhxeg8.fsf@mpe.ellerman.id.au>
References: <20200916165516.Horde.uocmo3irPb7BMg__NUSqRA9@messagerie.si.c-s.fr>
 <87r1r0oa4o.fsf@mpe.ellerman.id.au>
 <cc532aa8-a9e0-a105-b7b1-ee8d723b7ed6@csgroup.eu>
 <be21c7c8-6828-b757-064d-20f74e5c1a31@csgroup.eu>
 <877drhxeg8.fsf@mpe.ellerman.id.au>
Date: Sat, 24 Oct 2020 21:07:57 +1100
Message-ID: <874kmkx7gi.fsf@mpe.ellerman.id.au>
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

Michael Ellerman <mpe@ellerman.id.au> writes:
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> Le 24/09/2020 =C3=A0 15:17, Christophe Leroy a =C3=A9crit=C2=A0:
>>> Le 17/09/2020 =C3=A0 14:33, Michael Ellerman a =C3=A9crit=C2=A0:
>>>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>>>>
>>>>> What is the status with the generic C vdso merge ?
>>>>> In some mail, you mentionned having difficulties getting it working on
>>>>> ppc64, any progress ? What's the problem ? Can I help ?
>>>>
>>>> Yeah sorry I was hoping to get time to work on it but haven't been able
>>>> to.
>>>>
>>>> It's causing crashes on ppc64 ie. big endian.
> ...
>>>=20
>>> Can you tell what defconfig you are using ? I have been able to setup a=
 full glibc PPC64 cross=20
>>> compilation chain and been able to test it under QEMU with success, usi=
ng Nathan's vdsotest tool.
>>
>> What config are you using ?
>
> ppc64_defconfig + guest.config
>
> Or pseries_defconfig.
>
> I'm using Ubuntu GCC 9.3.0 mostly, but it happens with other toolchains t=
oo.

I'm also seeing warnings because of the feature fixups:

  ------------[ cut here ]------------
  WARNING: CPU: 0 PID: 1 at arch/powerpc/lib/feature-fixups.c:109 .do_featu=
re_fixups+0x80/0xc0
  Modules linked in:
  CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.9.0-rc2-00261-g107a86292cc4 #=
11
  NIP:  c0000000000a3660 LR: c0000000000a362c CTR: 0000000000000000
  REGS: c00000007e3a3790 TRAP: 0700   Not tainted  (5.9.0-rc2-00261-g107a86=
292cc4)
  MSR:  8000000002029032 <SF,VEC,EE,ME,IR,DR,RI>  CR: 48000422  XER: 000000=
00
  CFAR: c0000000000a3630 IRQMASK: 0
  GPR00: c0000000011e8964 c00000007e3a3a20 c000000001bb2b00 0000000000000001
  GPR04: c000000001bc0bc0 c000000001bc0bf0 0000000066736574 00000000fffffe00
  GPR08: 0000000300000004 0000000000000000 0000000000000000 0000000000000db8
  GPR12: 0000000028000224 c000000001dc0000 c000000000012d40 0000000000000000
  GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR24: c000000001aae0f0 c000000001063f08 c000000001063f18 c000000001063f28
  GPR28: c00000000106e188 000000eb8f4d91a7 c000000001bc0bf0 c000000001bc0bc0
  NIP [c0000000000a3660] .do_feature_fixups+0x80/0xc0
  LR [c0000000000a362c] .do_feature_fixups+0x4c/0xc0
  Call Trace:
  [c00000007e3a3a20] [c0000000000a362c] .do_feature_fixups+0x4c/0xc0 (unrel=
iable)
  [c00000007e3a3ab0] [c0000000011e8964] .vdso_init+0x498/0x95c
  [c00000007e3a3bd0] [c000000000012780] .do_one_initcall+0x60/0x2b8
  [c00000007e3a3cb0] [c0000000011e4d8c] .kernel_init_freeable+0x2d8/0x370
  [c00000007e3a3da0] [c000000000012d64] .kernel_init+0x24/0x150
  [c00000007e3a3e20] [c00000000000e24c] .ret_from_kernel_thread+0x58/0x6c
  Instruction dump:
  40820030 3bff0030 7c3ef840 4181ffe4 38210090 e8010010 eb81ffe0 eba1ffe8
  ebc1fff0 7c0803a6 ebe1fff8 4e800020 <0fe00000> e8ff0028 e8df0020 7f83e378
  ---[ end trace ece1c957ca5bd6e9 ]---
  Unable to patch feature section at bffffffd01bc0bbc - c000000001bc0bc0 wi=
th bffffd9101bc0958 - bfffffe501bc0ba4


That's happening because the 32-bit VDSO is built with CONFIG_PPC32=3Dy,
due to config-fake32.h, and that causes the feature fixup entries to be
the wrong size.

See the logic in feature-fixup.h:

  #if defined(CONFIG_PPC64) && !defined(__powerpc64__)
  /* 64 bits kernel, 32 bits code (ie. vdso32) */
  #define FTR_ENTRY_LONG		.8byte
  #define FTR_ENTRY_OFFSET	.long 0xffffffff; .long
  #elif defined(CONFIG_PPC64)
  #define FTR_ENTRY_LONG		.8byte
  #define FTR_ENTRY_OFFSET	.8byte
  #else
  #define FTR_ENTRY_LONG		.long
  #define FTR_ENTRY_OFFSET	.long
  #endif


We expect the fixup entries to still use 64-bit values, even for the
32-bit VDSO in a 64-bit kernel.

TBH I'm not sure how config-fake32.h can work long term, it's so fragile
to be defining/redefining a handful of CONFIG symbols like that.

The generic VDSO code is fairly careful to only include uapi and vdso
headers, not linux ones. So I think we need to better split our headers
so that we can build the VDSO code with few or no linux headers, and so
avoid the need to define any (or most) CONFIG symbols.

cheers
