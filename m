Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 186D3382A7B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 13:02:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkGRp0rHdz30G8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 21:02:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=S61N3nKa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=S61N3nKa; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FkGRG4cj9z2xZD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 21:01:46 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FkGRD3Nkbz9sWW;
 Mon, 17 May 2021 21:01:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1621249306;
 bh=u8xUMsLy2YzWoEEa4Av1DjxqTJmiNuJ11N17D7JQIN8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=S61N3nKa97e/B8iPeYBy+OQz94oeMQ5VvcrAq96IYWNRvS5X2Ru60jYKtJYewtchU
 H02yVlYtoDdAQc/eDHNyAw4PupBrD7j7szxySOExxBdCmKnSCouIp4VnuzGynCN3LB
 LwlMAH9KVy8Bx9xquidQ5wJ6WQleuTH1Pka7me7QJNvU55jdO1SEUjhFjwIC61p40M
 iigG1/yn/r+mPUON5fwjCFMeUK8OlONZg7xwrHls0mlmHcHR0ragga86RNQVQ4J5RN
 tJ5hZr1tSoIqLe2jaUfMQWIGX5XVZBcnDp1zsJnQdcZN7P36CLa+yISJszrdcc9o2r
 7SKYbpGjOUboQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jordan Niethe <jniethe5@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v14 3/9] powerpc/modules: Make module_alloc() Strict
 Module RWX aware
In-Reply-To: <CACzsE9rk7D_ocSsf74C1vX=oXgLa_pQTSusncXRPeGBVe+48Nw@mail.gmail.com>
References: <20210517032810.129949-1-jniethe5@gmail.com>
 <20210517032810.129949-4-jniethe5@gmail.com>
 <04311ba7-8b91-6837-2bc5-1f55f49da253@csgroup.eu>
 <CACzsE9rk7D_ocSsf74C1vX=oXgLa_pQTSusncXRPeGBVe+48Nw@mail.gmail.com>
Date: Mon, 17 May 2021 21:01:43 +1000
Message-ID: <87lf8dk4iw.fsf@mpe.ellerman.id.au>
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

Jordan Niethe <jniethe5@gmail.com> writes:
> On Mon, May 17, 2021 at 4:37 PM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>> Le 17/05/2021 =C3=A0 05:28, Jordan Niethe a =C3=A9crit :
>> > Make module_alloc() use PAGE_KERNEL protections instead of
>> > PAGE_KERNEL_EXEX if Strict Module RWX is enabled.
>> >
>> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
>> > ---
>> > v14: - Split out from powerpc: Set ARCH_HAS_STRICT_MODULE_RWX
>> >       - Add and use strict_module_rwx_enabled() helper
>> > ---
>> >   arch/powerpc/include/asm/mmu.h | 5 +++++
>> >   arch/powerpc/kernel/module.c   | 4 +++-
>> >   2 files changed, 8 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm=
/mmu.h
>> > index 607168b1aef4..7710bf0cbf8a 100644
>> > --- a/arch/powerpc/include/asm/mmu.h
>> > +++ b/arch/powerpc/include/asm/mmu.h
>> > @@ -357,6 +357,11 @@ static inline bool strict_kernel_rwx_enabled(void)
>> >       return false;
>> >   }
>> >   #endif
>> > +
>> > +static inline bool strict_module_rwx_enabled(void)
>> > +{
>> > +     return IS_ENABLED(CONFIG_STRICT_MODULE_RWX) && strict_kernel_rwx=
_enabled();
>> > +}
>>
>> Looking at arch/Kconfig, I have the feeling that it is possible to selec=
t CONFIG_STRICT_MODULE_RWX
>> without selecting CONFIG_STRICT_KERNEL_RWX.
>>
>> In that case, strict_kernel_rwx_enabled() will return false.

> Ok, if someone did that currently it would break things, e.g. code
> patching. I think it should it be made impossible to
> CONFIG_STRICT_MODULE_RWX without CONFIG_STRICT_KERNEL_RWX?

Yeah I don't see any reason to support that combination.

We should be moving to a world where both are on by default, or in fact
are always enabled.

cheers
