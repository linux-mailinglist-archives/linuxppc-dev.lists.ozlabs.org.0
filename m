Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E24436599E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 15:15:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPkhF1QzNz30FQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 23:15:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=k2bus5aw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=k2bus5aw; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPkgr3VQHz2xfY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 23:15:19 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FPkgp73Lkz9tlB;
 Tue, 20 Apr 2021 23:15:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1618924519;
 bh=UI0o3Fd/uLM07Bexdon7KWXa2iOf9VNOAMVICkVRMOA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=k2bus5awbaMgVM0Ns6wKbxineVVY2j79KhrIvn74R1fA7QXHOG7MZiUtSLeY1NpF9
 pEJTQvp5tDNN74LoICIwNbIhw7YrKRlO9ev37YKmiLwowDUoGWG6ogRN82qVU1S7qY
 JqfJDtpsbubG0TfDqzpXgac7CQq2jTPHO5XVvtAzNz+aaNu0iW2GGr8mYoAGrAX3Bc
 wSFlRM+bohB+xjJQX041uxKVOp/4XhFCIknd/o5xjpk6iukabU3Bq6LF+jwn7BYtQc
 uWFI+pSAm07Xdv1lkWq0XvrC7y0yGMBoFxCPEYC1iQbYIV9VjXbXtbJ8XP9eLCVBNd
 wu14uXGQlZ9+A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Randy Dunlap
 <rdunlap@infradead.org>, Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: PPC_FPU, ALTIVEC: enable_kernel_fp, put_vr, get_vr
In-Reply-To: <1f337b4c-940e-110c-d0a2-2ad95cfb2dc8@csgroup.eu>
References: <7107fcae-5c7a-ac94-8d89-326f2cd4cd33@infradead.org>
 <8b1cb0a2-ed3a-7da0-a73a-febbda528703@csgroup.eu>
 <20210418174648.GN26583@gate.crashing.org>
 <bf119bfe-7db1-e7f3-d837-f910635eeebb@infradead.org>
 <87sg3mct3x.fsf@mpe.ellerman.id.au>
 <bd83b06d-ed36-e600-e988-c1e0014fb9cf@infradead.org>
 <1f337b4c-940e-110c-d0a2-2ad95cfb2dc8@csgroup.eu>
Date: Tue, 20 Apr 2021 23:15:14 +1000
Message-ID: <871rb5cd25.fsf@mpe.ellerman.id.au>
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

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 19/04/2021 =C3=A0 23:39, Randy Dunlap a =C3=A9crit=C2=A0:
>> On 4/19/21 6:16 AM, Michael Ellerman wrote:
>>> Randy Dunlap <rdunlap@infradead.org> writes:
>>=20
>>>> Sure.  I'll post them later today.
>>>> They keep FPU and ALTIVEC as independent (build) features.
>>>
>>> Those patches look OK.
>>>
>>> But I don't think it makes sense to support that configuration, FPU=3Dn
>>> ALTVEC=3Dy. No one is ever going to make a CPU like that. We have enough
>>> testing surface due to configuration options, without adding artificial
>>> combinations that no one is ever going to use.
>>>
>>> IMHO :)
>>>
>>> So I'd rather we just make ALTIVEC depend on FPU.
>>=20
>> That's rather simple. See below.
>> I'm doing a bunch of randconfig builds with it now.
>>=20
>> ---
>> From: Randy Dunlap <rdunlap@infradead.org>
>> Subject: [PATCH] powerpc: make ALTIVEC depend PPC_FPU
>>=20
>> On a kernel config with ALTIVEC=3Dy and PPC_FPU not set/enabled,
>> there are build errors:
>>=20
>> drivers/cpufreq/pmac32-cpufreq.c:262:2: error: implicit declaration of f=
unction 'enable_kernel_fp' [-Werror,-Wimplicit-function-declaration]
>>             enable_kernel_fp();
>> ../arch/powerpc/lib/sstep.c: In function 'do_vec_load':
>> ../arch/powerpc/lib/sstep.c:637:3: error: implicit declaration of functi=
on 'put_vr' [-Werror=3Dimplicit-function-declaration]
>>    637 |   put_vr(rn, &u.v);
>>        |   ^~~~~~
>> ../arch/powerpc/lib/sstep.c: In function 'do_vec_store':
>> ../arch/powerpc/lib/sstep.c:660:3: error: implicit declaration of functi=
on 'get_vr'; did you mean 'get_oc'? [-Werror=3Dimplicit-function-declaratio=
n]
>>    660 |   get_vr(rn, &u.v);
>>        |   ^~~~~~
>>=20
>> In theory ALTIVEC is independent of PPC_FPU but in practice nobody
>> is going to build such a machine, so make ALTIVEC require PPC_FPU
>> by depending on PPC_FPU.
>>=20
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Cc: Segher Boessenkool <segher@kernel.crashing.org>
>> Cc: lkp@intel.com
>> ---
>>   arch/powerpc/platforms/86xx/Kconfig    |    1 +
>>   arch/powerpc/platforms/Kconfig.cputype |    2 ++
>>   2 files changed, 3 insertions(+)
>>=20
>> --- linux-next-20210416.orig/arch/powerpc/platforms/86xx/Kconfig
>> +++ linux-next-20210416/arch/powerpc/platforms/86xx/Kconfig
>> @@ -4,6 +4,7 @@ menuconfig PPC_86xx
>>   	bool "86xx-based boards"
>>   	depends on PPC_BOOK3S_32
>>   	select FSL_SOC
>> +	select PPC_FPU
>>   	select ALTIVEC
>>   	help
>>   	  The Freescale E600 SoCs have 74xx cores.
>> --- linux-next-20210416.orig/arch/powerpc/platforms/Kconfig.cputype
>> +++ linux-next-20210416/arch/powerpc/platforms/Kconfig.cputype
>> @@ -186,6 +186,7 @@ config E300C3_CPU
>>   config G4_CPU
>>   	bool "G4 (74xx)"
>>   	depends on PPC_BOOK3S_32
>> +	select PPC_FPU
>>   	select ALTIVEC
>>=20=20=20
>>   endchoice
>> @@ -309,6 +310,7 @@ config PHYS_64BIT
>>=20=20=20
>>   config ALTIVEC
>>   	bool "AltiVec Support"
>> +	depends on PPC_FPU
>
> Shouldn't we do it the other way round ? In extenso make ALTIVEC select P=
PC_FPU and avoid the two=20
> selects that are above ?

Yes, ALTIVEC should select PPC_FPU.

The latter is (generally) not user selectable, so there's no issue with
selecting it, whereas the reverse is not true.

For 64-bit Book3S I think we could just always enable ALTIVEC these
days. It's only Power5 that doesn't have it, and essentially no one is
running mainline on those AFAIK. But that can be done separately.

cheers
