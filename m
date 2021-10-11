Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA28428596
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 05:28:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSPQf4y4fz302G
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 14:28:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=a4YjLDMT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HSPPz0qVpz2xbB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Oct 2021 14:28:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=a4YjLDMT; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HSPPx6yqyz4xbT;
 Mon, 11 Oct 2021 14:28:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1633922886;
 bh=3baH5QewyQbCgQVzBWlsDgB/cVMlKpnWUxMHk+PnPd8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=a4YjLDMTWaR17budh/yrDuLZjrrqdz505tFQGLFWeywekecn1lP4OZC0vMqTcMUOO
 JJY9iXLkKZ+rBkwdORGXv7mQUic4YfD48sBx+pJOvY7n2siwhOewIKm7vDyHREIvYG
 TVAFT7FAcF/x5mVGumOGZuC1i59eD5v/vPgUDulihJVwJ2TnHkuFC6qloPnWEeFV2p
 S88/pzJvmDqTuByB/GNtzfFyaoWl77ibA3D9MPXThxZYhdf9pTQvwX+ZYzJvXYePCH
 Sfznxwk2ZFNixb26i93NxbAnijY7NnXLqZwg3FKtJpQZKqa3ky0Qm0IgNayPAKzN41
 ov7Zracz5CX3w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, "Aneesh Kumar K.V"
 <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v6 19/22] powerpc/book3s64/hash/kuap: Enable kuap on hash
In-Reply-To: <b2ab09a4-7f30-deee-e983-9459d93cb9b3@csgroup.eu>
References: <20201125051634.509286-1-aneesh.kumar@linux.ibm.com>
 <20201125051634.509286-20-aneesh.kumar@linux.ibm.com>
 <b2ab09a4-7f30-deee-e983-9459d93cb9b3@csgroup.eu>
Date: Mon, 11 Oct 2021 14:28:05 +1100
Message-ID: <87v924me9m.fsf@mpe.ellerman.id.au>
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
Cc: Sandipan Das <sandipan@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 25/11/2020 =C3=A0 06:16, Aneesh Kumar K.V a =C3=A9crit=C2=A0:
>> Reviewed-by: Sandipan Das <sandipan@linux.ibm.com>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   arch/powerpc/mm/book3s64/pkeys.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64=
/pkeys.c
>> index f747d66cc87d..84f8664ffc47 100644
>> --- a/arch/powerpc/mm/book3s64/pkeys.c
>> +++ b/arch/powerpc/mm/book3s64/pkeys.c
>> @@ -257,7 +257,12 @@ void __init setup_kuep(bool disabled)
>>   #ifdef CONFIG_PPC_KUAP
>>   void __init setup_kuap(bool disabled)
>>   {
>> -	if (disabled || !early_radix_enabled())
>> +	if (disabled)
>> +		return;
>> +	/*
>> +	 * On hash if PKEY feature is not enabled, disable KUAP too.
>> +	 */
>> +	if (!early_radix_enabled() && !early_mmu_has_feature(MMU_FTR_PKEY))
>
> pkey_early_init_devtree() bails out without setting MMU_FTR_PKEY with=20
> the following:
>
> 	/*
> 	 * Only P7 and above supports SPRN_AMR update with MSR[PR] =3D 1
> 	 */
> 	if (!early_cpu_has_feature(CPU_FTR_ARCH_206))
> 		return;
>
>
>
> Why would it be impossible to do KUAP in that case ? KUAP doesn't=20
> require updating SPRN_AMR with MSR[PR] =3D 1

You're right, it would be possible to do KUAP in that case.

That's an artifact of KUAP being implemented using PKEYs on hash. For
the PKEYs user-visible API we want AMR to be user controlled.

It's possible we could untangle all that, allowing KUAP to be
implemented on earlier CPUs, but I'm not sure it's going to be high on
anyone's todo list.

cheers
