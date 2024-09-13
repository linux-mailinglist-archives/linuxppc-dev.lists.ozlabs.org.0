Return-Path: <linuxppc-dev+bounces-1362-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F70978BB6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Sep 2024 01:10:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X595C6VS0z302P;
	Sat, 14 Sep 2024 09:10:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726269023;
	cv=none; b=ROxtEBFVpJ04smI2I/8hre8gOxjaeMM47y7/tmdcEo3x1eGNAe6T6WUOhvwct+798e3wTWfF/Cd2BZq8ZQBfni8Q+KfinD4NYpicqpW/Yv/HUzneqEO7qSKXrjjdbAiNdt8KjzMapcC0FJRGT1MUNbC3cQcqOnv3DORmiLuTmH7W5gBcVarImuR6MlNiwqouhxkhgufbL+XTX+PiTVn93X+Z1UJv9g0kuoQ1GC7v/tatflppfEep1Af2gag67/hnFX+iQbZsEq3DBgwwCmgmtZARkVEYTx49xZd8MBovNn4IqDp4Sd+NFXYV08X1u/5rhP/wgdTS307Wpu42wBUH3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726269023; c=relaxed/relaxed;
	bh=gy3hRIQfFMt+naW5uo5M4vgY3O8DQ+s8NBlJGzQZOSY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BFqZwaaOgF2Vst7Pgwe7zxzBYhwSRKpvx99AcnW2uD0nXlE1nz8Ht+t+kVUpthl74S9eRISl01MtZEc84OGOrAF3OLkIP6bWCs+9E4DR8GyEa090x0ZnwazKajc57lzLuG/sxJ+19SMjHgRg8TeK5f5JeLCS4hyUtS0VNzX0RM8wDMOgZ08fOEoLDkJCpikcsaeYF7yuZxlMNJ+keYk+eYdiM+dMZm+g+pe+Ojs6L7ro4P3HOoWOBkBc04BR7gu2jdQ30nFngeMw74ul3i43VHw3X6XiY+4qEcz2w4+ywxYiAw9DkyX5YgFxyMWi1dXZ70NcuQ0CdVgV3JliXAP2Kw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qcpULeM/; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qcpULeM/;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X595C238jz2xmh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 09:10:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1726269023;
	bh=gy3hRIQfFMt+naW5uo5M4vgY3O8DQ+s8NBlJGzQZOSY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qcpULeM/kqlHDKMJdI99cEZTIQVTUG1Ecedaa6xxZ2uQ3S9WQcM7etXghncO5Prbv
	 B/++QsNVSrw+L08LnkqU/PQPUcwrmjyPFJ8LMWPHoP4JiOqxVU8DQ5S2aBwCdHzxgj
	 JOrqdd9pFb81Gk7i9npf4WZj9gI3xMKGhc52A260yT6MtmxkBLbrH8kWhQZnpEmAes
	 lzYmDQ1Ebg0iml/6IPQhhzzUAj0V/JM8wKMxcCI5OTs7+gBZrxQgdbZDcPaZ4V6Fhm
	 eYwbYbgCLqABXGzISOv7/yAuerVBRW1S7F93NF+mypdUNZCgikRr7cFuZIPoiVWrab
	 hB9aXGh+0fBUw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X595C0jDtz4x8c;
	Sat, 14 Sep 2024 09:10:23 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Rob Herring <robh@kernel.org>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Saravana Kannan
 <saravanak@google.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] of: address: Unify resource bounds overflow checking
In-Reply-To: <CAL_JsqLYQyue9WyYiQPaM1D8Hxve-a4RXCaDRvyeF2VWWx=Ozg@mail.gmail.com>
References: <20240906-of-address-overflow-v1-1-19567aaa61da@linutronix.de>
 <87plp7r8ye.fsf@mail.lhotse>
 <CAL_JsqLYQyue9WyYiQPaM1D8Hxve-a4RXCaDRvyeF2VWWx=Ozg@mail.gmail.com>
Date: Sat, 14 Sep 2024 09:10:20 +1000
Message-ID: <87mskbqher.fsf@mail.lhotse>
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

Rob Herring <robh@kernel.org> writes:
> On Fri, Sep 13, 2024 at 8:15=E2=80=AFAM Michael Ellerman <mpe@ellerman.id=
.au> wrote:
>> Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de> writes:
>> > The members "start" and "end" of struct resource are of type
>> > "resource_size_t" which can be 32bit wide.
>> > Values read from OF however are always 64bit wide.
>> >
>> > Refactor the diff overflow checks into a helper function.
>> > Also extend the checks to validate each calculation step.
>> >
>> > Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
>> > ---
>> >  drivers/of/address.c | 45 ++++++++++++++++++++++++++-----------------=
--
>> >  1 file changed, 26 insertions(+), 19 deletions(-)
>> >
>> > diff --git a/drivers/of/address.c b/drivers/of/address.c
>> > index 7e59283a4472..df854bb427ce 100644
>> > --- a/drivers/of/address.c
>> > +++ b/drivers/of/address.c
>> > @@ -198,6 +198,25 @@ static u64 of_bus_pci_map(__be32 *addr, const __b=
e32 *range, int na, int ns,
>> >
>> >  #endif /* CONFIG_PCI */
>> >
>> > +static int __of_address_resource_bounds(struct resource *r, u64 start=
, u64 size)
>> > +{
>> > +     u64 end =3D start;
>> > +
>> > +     if (overflows_type(start, r->start))
>> > +             return -EOVERFLOW;
>> > +     if (size =3D=3D 0)
>> > +             return -EOVERFLOW;
>> > +     if (check_add_overflow(end, size - 1, &end))
>> > +             return -EOVERFLOW;
>> > +     if (overflows_type(end, r->end))
>> > +             return -EOVERFLOW;
>>
>> This breaks PCI on powerpc qemu. Part of the PCI probe reads a resource
>> that's zero sized, which used to succeed but now fails due to the size
>> check above.
>>
>> The diff below fixes it for me.
>
> I fixed it up with your change.

Thanks.

cheers

