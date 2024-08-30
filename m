Return-Path: <linuxppc-dev+bounces-803-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB5A966045
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 13:13:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwFrL5NSfz305v;
	Fri, 30 Aug 2024 21:13:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725016402;
	cv=none; b=f+9zH4MhwGq6BwU75qaynu1KCR18dBDLJ42SE5SoLPjV0vpo9sp1QwkXx/s8hBCCjQxQII1y/fW4jyWGayyL2n1hLfc/4aIjHngWRCRFhAMdLD72mYYImDHW6rzsXuASelUp9MpE1AHRyonnm6IVb3KWRh4t0uMUvHIIDThrhmrfBjU/0IlnV/4KuS0lagMqf27/WTL1DMYqmCHz5yTRwnfJ3A9c0a+w1b+EIlT2UI806scDTHKhHI0G79PXotnERGn8BCNJOBmuzo/FKU297sri4+YmUDUc/XvCAcv+wsn6VY37yxpPsHdXwS5uNKn57H7Mw8FEY9SWe1hsE/Ni9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725016402; c=relaxed/relaxed;
	bh=54VEsYyzzl8aBVA+cH24RkP2lRIl4hPJAoqqwcft+Iw=;
	h=DKIM-Signature:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding; b=gBZSl+DmJe9rJww+lZmTH/wJWrme8Ix/fQ4iMUuLgEPlTBcoCRYy7vk1XEqV3YhOcVp0IpR0QoPGS/SDHFOYJqbbraxGMjqw000IEIGA5rHqYaM/UHmOV2Pk326Q891/axwTzar9U0IpKBq5v5TcZw218FgE48RuoqLUcG71JBW5oNrQzj6r9ziLlSN1QMU9yjS7p3aat/Pg0iNt8PRuJwU2MtI/ADZxaZD2EVvUp1ZYBdb/KSjTJBW7leud/sezaRDBANJeSAsw3rXdyb5LN9tTrUzJzt+J5Fi4QGX0EEXKBq6maqo7qB3Nht2l7JqQGb1lieeJQquVwnBtWqVefQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lTXx7eNh; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lTXx7eNh;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwFrK4Zm7z3048
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 21:13:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725016400;
	bh=54VEsYyzzl8aBVA+cH24RkP2lRIl4hPJAoqqwcft+Iw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lTXx7eNhfGuEsboY1jQMYEe5MGANkVd85xzwCIQmfQk6bCEg01QnS+wwf+t07gd1b
	 buEJNasX9cugg2qG44IyUYyILEV8D5o9JTRStV0IKVykArL8ilgBICS9Rf5RH01/1U
	 5hiC9BGbR8kgKBtV4xhFWYTFu8NaskxETiVmgZK9aRux23a0Q8HcGyLhMA+6HncmTo
	 Kkn3Z9X72zAeZ9JAvVdOx8mY/0htPmqaxsjM7xX/+Z84OZVIMsxh8T4A+f+CeBMitX
	 l0dQ+1JrbCH6c2yYxCbi0QmxyLIdY20RUGoAJMCLAtibzwYLnJokNVh2BIeVt2JIWm
	 +/CsMIqI25MaA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WwFrJ1stpz4wcl;
	Fri, 30 Aug 2024 21:13:20 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, "Ritesh Harjani (IBM)"
 <ritesh.list@gmail.com>, linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH] powerpc: Use printk instead of WARN in change_memory_attr
In-Reply-To: <a09687b8-184c-40bf-bf5f-b9639dd6d136@csgroup.eu>
References: <e2fcabe78795552264f045bd224f83609903708f.1724749026.git.ritesh.list@gmail.com>
 <a09687b8-184c-40bf-bf5f-b9639dd6d136@csgroup.eu>
Date: Fri, 30 Aug 2024 21:13:19 +1000
Message-ID: <87ed66e01c.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 27/08/2024 =C3=A0 11:12, Ritesh Harjani (IBM) a =C3=A9crit=C2=A0:
>> [Vous ne recevez pas souvent de courriers de ritesh.list@gmail.com. D=C3=
=A9couvrez pourquoi ceci est important =C3=A0 https://aka.ms/LearnAboutSend=
erIdentification ]
>>=20
>> Use pr_warn_once instead of WARN_ON_ONCE as discussed here [1]
>> for printing possible use of set_memory_* on linear map on Hash.
>>=20
>> [1]: https://lore.kernel.org/all/877cc2fpi2.fsf@mail.lhotse/#t
>>=20
>> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> ---
>>   arch/powerpc/mm/pageattr.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
>> index ac22bf28086f..c8c2d664c6f3 100644
>> --- a/arch/powerpc/mm/pageattr.c
>> +++ b/arch/powerpc/mm/pageattr.c
>> @@ -94,8 +94,11 @@ int change_memory_attr(unsigned long addr, int numpag=
es, long action)
>>          if (!radix_enabled()) {
>>                  int region =3D get_region_id(addr);
>>=20
>> -               if (WARN_ON_ONCE(region !=3D VMALLOC_REGION_ID && region=
 !=3D IO_REGION_ID))
>> +               if (region !=3D VMALLOC_REGION_ID && region !=3D IO_REGI=
ON_ID) {
>> +                       pr_warn_once("%s: possible use of set_memory_* o=
n linear map on Hash from (%ps)\n",
>> +                                       __func__, __builtin_return_addre=
ss(0));
>
> Is it really only linear map ?
>
> What about "possible user of set_memory_* outside of vmalloc or io region.

Yeah that's more accurate. Can drop "possible" too I think? We're pretty
sure that's what happened.

> Maybe a show_stack() would also be worth it ?
>
>
> But in principle I think it would be better to keep the WARN_ONCE until=20
> we can add __must_check to set_memory_xxx() functions to be sure all=20
> callers check the result, as mandated by=20
> https://github.com/KSPP/linux/issues/7

Will that help in this case though?

If the caller checks the return value they'll see that the call failed,
and presumably error out, possibly breaking boot or something else crucial.

Unless we change change_memory_attr() to return EOPNOTSUPP or something
in this case, and expect callers to handle that.

cheers

