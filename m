Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F70C386F8B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 May 2021 03:43:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fkf142NgZz3bTv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 May 2021 11:43:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HYfPXXBs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=HYfPXXBs; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fkf0b2jcGz2xxp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 May 2021 11:43:26 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fkf0W3DsMz9sW7;
 Tue, 18 May 2021 11:43:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1621302204;
 bh=MELaYUpC5ly3VlBnFkjsexeqoKnK1KYBd5YFbY5yxKc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=HYfPXXBsgIAxCYG3a9ljJm56qp0IsVzey/NYdWNeifg8CMsOaOze0CdQHJ0m0WVpz
 RmPgu5ElykGxG0TdEQiRTDUu3J44HniiFqpeIARBgsCcjWGklHXmdTzFVIZWVAVTfv
 vkZO/8hqSZ885DfMi1hklSNKDxkxxMyVi/Gxw1xXRm5g3jvZN69TmiEKzVHC27XvUI
 XgkdfjTlTxLwrcz6NoCEXkZP4GiI+vbJKGESLsgs4LRe5qBLsMbFBrpFSuMSh+Bkld
 QMDMCafWsofSBHsQ1aO2jqehm7WncGW/n7jYSnEqhXzQ9BjL1bFr90oZpdYp1RWEjy
 a3Oa/mZ4eT4iQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Jordan Niethe
 <jniethe5@gmail.com>
Subject: Re: [PATCH v14 3/9] powerpc/modules: Make module_alloc() Strict
 Module RWX aware
In-Reply-To: <27d15f13-c6bd-86d7-c4fc-2c4c495f54b3@csgroup.eu>
References: <20210517032810.129949-1-jniethe5@gmail.com>
 <20210517032810.129949-4-jniethe5@gmail.com>
 <04311ba7-8b91-6837-2bc5-1f55f49da253@csgroup.eu>
 <CACzsE9rk7D_ocSsf74C1vX=oXgLa_pQTSusncXRPeGBVe+48Nw@mail.gmail.com>
 <87lf8dk4iw.fsf@mpe.ellerman.id.au>
 <27d15f13-c6bd-86d7-c4fc-2c4c495f54b3@csgroup.eu>
Date: Tue, 18 May 2021 11:43:18 +1000
Message-ID: <87fsykkea1.fsf@mpe.ellerman.id.au>
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
Cc: ajd@linux.ibm.com, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, cmr@codefail.de,
 naveen.n.rao@linux.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 17/05/2021 =C3=A0 13:01, Michael Ellerman a =C3=A9crit=C2=A0:
>> Jordan Niethe <jniethe5@gmail.com> writes:
>>> On Mon, May 17, 2021 at 4:37 PM Christophe Leroy
>>> <christophe.leroy@csgroup.eu> wrote:
>>>> Le 17/05/2021 =C3=A0 05:28, Jordan Niethe a =C3=A9crit :
>>>>> Make module_alloc() use PAGE_KERNEL protections instead of
>>>>> PAGE_KERNEL_EXEX if Strict Module RWX is enabled.
>>>>>
>>>>> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
>>>>> ---
>>>>> v14: - Split out from powerpc: Set ARCH_HAS_STRICT_MODULE_RWX
>>>>>        - Add and use strict_module_rwx_enabled() helper
>>>>> ---
>>>>>    arch/powerpc/include/asm/mmu.h | 5 +++++
>>>>>    arch/powerpc/kernel/module.c   | 4 +++-
>>>>>    2 files changed, 8 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/as=
m/mmu.h
>>>>> index 607168b1aef4..7710bf0cbf8a 100644
>>>>> --- a/arch/powerpc/include/asm/mmu.h
>>>>> +++ b/arch/powerpc/include/asm/mmu.h
>>>>> @@ -357,6 +357,11 @@ static inline bool strict_kernel_rwx_enabled(voi=
d)
>>>>>        return false;
>>>>>    }
>>>>>    #endif
>>>>> +
>>>>> +static inline bool strict_module_rwx_enabled(void)
>>>>> +{
>>>>> +     return IS_ENABLED(CONFIG_STRICT_MODULE_RWX) && strict_kernel_rw=
x_enabled();
>>>>> +}
>>>>
>>>> Looking at arch/Kconfig, I have the feeling that it is possible to sel=
ect CONFIG_STRICT_MODULE_RWX
>>>> without selecting CONFIG_STRICT_KERNEL_RWX.
>>>>
>>>> In that case, strict_kernel_rwx_enabled() will return false.
>>=20
>>> Ok, if someone did that currently it would break things, e.g. code
>>> patching. I think it should it be made impossible to
>>> CONFIG_STRICT_MODULE_RWX without CONFIG_STRICT_KERNEL_RWX?
>>=20
>> Yeah I don't see any reason to support that combination.
>>=20
>> We should be moving to a world where both are on by default, or in fact
>> are always enabled.
>
> Would it work if we add the following in arch/powerpc/Kconfig ? :
>
> 	select STRICT_KERNEL_RWX if STRICT_MODULE_RWX
>
> There should be no dependency issue as powerpc only selects ARCH_HAS_STRI=
CT_MODULE_RWX when=20
> ARCH_HAS_STRICT_KERNEL_RWX is also selected.

I think it will work. It's slightly rude to select things like that, but
I think it's OK for something like this.

Medium term we can possibly just have the generic STRICT_MODULE_RWX
depend on STRICT_KERNEL_RWX.

cheers
