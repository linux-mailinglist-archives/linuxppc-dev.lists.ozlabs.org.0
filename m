Return-Path: <linuxppc-dev+bounces-1379-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 349F0979691
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2024 14:20:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X66Z11R5tz2yNc;
	Sun, 15 Sep 2024 22:20:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726402809;
	cv=none; b=S20b5vfjUKORWN7HQ0tmw4kzCNAnYeYAuSm4XmQIFkxsFNubvb7GG2nVZeeZwhCnUvi9YbTHTNyl+FGNbysMGSyHcZ0/gliaOVlYpqhXLDptypGWx8LuBTtHo59HCb9GJV728fhwQv/+5LZxqWWXDQlDzOmZQDPrj25FrCjnebIR/iKE435WJVU+4RK/C1h0HDJLTB5HDNpf3R2Hj/YglgXNM7cvd+7NeCgqD+NKeXGYT1Z1i23//tFJXe3+NSLU2+cmwRLB3/wbrt9nmxTuj3BcSZ/WhS3ZQqtI3/m4CuZEg5oOQpX0fINVZ2HozrBdxXTD5BchRAZrM8WO90Ce4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726402809; c=relaxed/relaxed;
	bh=LcqIBVzHw0KnwXTko6FqDEVdGVv2zi2crglHm27G4d8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OS5Ow0KGcmEbN5718ykq6gsM+C+1PvMkRDwwyIjAnSmjHkQRu2Gh5prZAr5Kqj9edXVLFPeldFT53AJGPP5f9ACavlCWLYDRMUcQo9ZyUsPvOqHTY+b0bmQb7oGRtP7U7DvxvpGsH1+arkXRVJ8kdYb2IlsTL0iBpIU83sXp3VJKVN8nhQVOytYAYIMulM3zAub9E6AIYozWJ0zqBGxheR0+WRwq/2g6pEaJzhx+Ok+2h5OWjxoJL4kBwdDc6Nu1+VWatqWK+0mwWJULUlm6jqxjk/XRWYSrxgZri11379bERefXn2oJ7kIHriD0eIQFGCISPWKPtJ7NRuN1Wp+wAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=I6iTjJPi; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=I6iTjJPi;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X66Z003ZRz2yLV
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Sep 2024 22:20:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1726402803;
	bh=LcqIBVzHw0KnwXTko6FqDEVdGVv2zi2crglHm27G4d8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=I6iTjJPikupA477s76MI4hBQ6xsZn3ga+yalo4/iLaFuUS78Rj0BUT9N6AswrEcWT
	 CDwMCJmusbYk6Ig8YpaBv5TvStzLHfR0phcE51BneSptcxhQVb8bv3K6hPrOBKlptG
	 1UfGTiGjWzZFUZZLYMqNQW57tplBHAbAViNUfDkTIvlrnptU7I4eocj2KnCziNk0e7
	 6IfgkTQIVGMzjExC5wmO7ZxNz3Y36+2ol2ZFq7bJg+HsE1vi4LhkzrdtnUbCjgOnuQ
	 Nd3s3BtWeeQhGquc1UcaXLNsa+vwi8oiCdfS2d8yLNZue6Pfj0dUlHhqAsIDqnkza6
	 L3vPXeZU7yhqQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X66Ys6GwTz4x8H;
	Sun, 15 Sep 2024 22:20:00 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Mina Almasry
 <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Stephen
 Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Matthew
 Wilcox <willy@infradead.org>
Subject: Re: [PATCH net-next v2] page_pool: fix build on powerpc with GCC 14
In-Reply-To: <498e7990-2c81-4779-83e6-1ff072796dbd@csgroup.eu>
References: <20240913213351.3537411-1-almasrymina@google.com>
 <87jzffq9ge.fsf@mail.lhotse>
 <498e7990-2c81-4779-83e6-1ff072796dbd@csgroup.eu>
Date: Sun, 15 Sep 2024 22:19:58 +1000
Message-ID: <87h6ahqfbl.fsf@mail.lhotse>
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
> Le 14/09/2024 =C3=A0 04:02, Michael Ellerman a =C3=A9crit=C2=A0:
...
>>=20
>> diff --git a/arch/powerpc/include/asm/atomic.h b/arch/powerpc/include/as=
m/atomic.h
>> index 5bf6a4d49268..0e41c1da82dd 100644
>> --- a/arch/powerpc/include/asm/atomic.h
>> +++ b/arch/powerpc/include/asm/atomic.h
>> @@ -23,6 +23,12 @@
>>   #define __atomic_release_fence()					\
>>   	__asm__ __volatile__(PPC_RELEASE_BARRIER "" : : : "memory")
>>=20=20=20
>> +#ifdef CONFIG_CC_IS_CLANG
>> +#define DS_FORM_CONSTRAINT "Z<>"
>> +#else
>> +#define DS_FORM_CONSTRAINT "YZ<>"
>> +#endif
>
> I see we have the same in uaccess.h, added by commit 2d43cc701b96=20
> ("powerpc/uaccess: Fix build errors seen with GCC 13/14")

Yep.

> Should that go in a common header, maybe ppc_asm.h ?

That would be the obvious place, but unfortunately including ppc_asm.h
in atomic.h breaks the build due to header spaghetti.

For now I've put the defines in asm-compat.h, which is not ideal but
seems to work.

cheers

