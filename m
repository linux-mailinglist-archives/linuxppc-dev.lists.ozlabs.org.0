Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8223642C0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 15:16:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FP6lt058sz2ypn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 23:16:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kfQSK/qQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=kfQSK/qQ; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FP6lT1Gsrz2xYc
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 23:16:21 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FP6lR6tt2z9vGg;
 Mon, 19 Apr 2021 23:16:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1618838180;
 bh=beEBY1aTtwrCYZv4EOZJ6Ww3eewnnBgGb4hAm+d0UyU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=kfQSK/qQKGM04fPfpT4pFr+rsuzPjBFMDI1mdsZ0nZzmispR5c9pZIw+I40vwOyZy
 EtCDHSoO9ZcM9JIa847SHoNoCMDOPOo5fzbKIN6aV2FzOlamsGFiq31pj7nZvC7ItZ
 Co/r/MS2eMhrCKdSXDtAA0Clwktgv4cil6k0x2u1oXSYjzWvHs9yqu9x8clNvpS3ZF
 jrwgVdu35qD196OCU3Qs69WsjmkVu/R0UlRA6nhpVph4aQZGxdNPFa3nr8+TkxnrPJ
 SaN0izc2XyqcYnl41NfX7f4I/rsUXTFbUpmsfMNhPShSOHgV0ZE349Z42OAax7YHs/
 sj6efJCLApHgg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Randy Dunlap <rdunlap@infradead.org>, Segher Boessenkool
 <segher@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Subject: Re: PPC_FPU, ALTIVEC: enable_kernel_fp, put_vr, get_vr
In-Reply-To: <bf119bfe-7db1-e7f3-d837-f910635eeebb@infradead.org>
References: <7107fcae-5c7a-ac94-8d89-326f2cd4cd33@infradead.org>
 <8b1cb0a2-ed3a-7da0-a73a-febbda528703@csgroup.eu>
 <20210418174648.GN26583@gate.crashing.org>
 <bf119bfe-7db1-e7f3-d837-f910635eeebb@infradead.org>
Date: Mon, 19 Apr 2021 23:16:18 +1000
Message-ID: <87sg3mct3x.fsf@mpe.ellerman.id.au>
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
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Randy Dunlap <rdunlap@infradead.org> writes:
> On 4/18/21 10:46 AM, Segher Boessenkool wrote:
>> On Sun, Apr 18, 2021 at 06:24:29PM +0200, Christophe Leroy wrote:
>>> Le 17/04/2021 =C3=A0 22:17, Randy Dunlap a =C3=A9crit=C2=A0:
>>>> Should the code + Kconfigs/Makefiles handle that kind of
>>>> kernel config or should ALTIVEC always mean PPC_FPU as well?
>>>
>>> As far as I understand, Altivec is completely independant of FPU in The=
ory.=20
>>=20
>> And, as far as the hardware is concerned, in practice as well.
>>=20
>>> So it should be possible to use Altivec without using FPU.
>>=20
>> Yup.
>>=20
>>> However, until recently, it was not possible to de-activate FPU support=
 on=20
>>> book3s/32. I made it possible in order to reduce unneccessary processin=
g on=20
>>> processors like the 832x that has no FPU.
>>=20
>> The processor has to implement FP to be compliant to any version of
>> PowerPC, as far as I know?  So that is all done by emulation, including
>> all the registers?  Wow painful.
>>=20
>>> As far as I can see in cputable.h/.c, 832x is the only book3s/32 withou=
t=20
>>> FPU, and it doesn't have ALTIVEC either.
>>=20
>> 602 doesn't have double-precision hardware, also no 64-bit FP registers.
>> But that CPU was never any widely used :-)
>>=20
>>> So we can in the future ensure that Altivec can be used without FPU=20
>>> support, but for the time being I think it is OK to force selection of =
FPU=20
>>> when selecting ALTIVEC in order to avoid build failures.
>>=20
>> It is useful to allow MSR[VEC,FP]=3D1,0 but yeah there are no CPUs that
>> have VMX (aka AltiVec) but that do not have FP.  I don't see how making
>> that artificial dependency buys anything, but maybe it does?
>>=20
>>>> I have patches to fix the build errors with the config as
>>>> reported but I don't know if that's the right thing to do...
>>=20
>> Neither do we, we cannot see those patches :-)
>
> Sure.  I'll post them later today.
> They keep FPU and ALTIVEC as independent (build) features.

Those patches look OK.

But I don't think it makes sense to support that configuration, FPU=3Dn
ALTVEC=3Dy. No one is ever going to make a CPU like that. We have enough
testing surface due to configuration options, without adding artificial
combinations that no one is ever going to use.

IMHO :)

So I'd rather we just make ALTIVEC depend on FPU.

cheers
