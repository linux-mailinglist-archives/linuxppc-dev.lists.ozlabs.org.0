Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB63A4B096
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 06:11:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TBNL6bmxzDqhm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 14:11:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="e8Gq2EnP"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TBKy3w0jzDqhF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 14:09:40 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id m7so3024017pls.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 21:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=77pWdaHfGcYd4F7qE35stB0L+DSNZxXNWUDsqBA+sCI=;
 b=e8Gq2EnP9AkgVUv76FKOYgmBvuher3GsW6d3BL6LWjmB0YmvAVT5ncAZlpXLnzG4LI
 /CWZ7At4ujeMrMLDGhlyKw7Wx09i7GWzu9vl28JUr/TFhAvrXJnw5jicwLdnGfwtI6/a
 lFrIVfn+zu/UkVo29SKF50iIzd50ADhvLG6ylrrBNHtUIvY/SeMkB3l8ukbIMHcA9Hy3
 qnJBwm6B4rUyS6ChLTWHccJ0H43j8oH4tG7KFxbuqazL3/I3apszDMulPNSX3lhJzmmn
 keOmlgMBWasQxvFZEUwDeX+g9lP1qfTOVKgD5Xeb3ifvjarnrca2sX5rSE3OPzNiIJQ1
 nXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=77pWdaHfGcYd4F7qE35stB0L+DSNZxXNWUDsqBA+sCI=;
 b=tmamJzQBGQXYTQIciXDQ7DI2bCJlkyfIYy7GK6Rc1/D8nfAI7gbfFRICrXKxYh0LR3
 cTwmnkPL14HuZicdo69kLCxSTh2LVJRyNu+bjhUfFT1nXyyFvZTahu0SjcBYXYsaDt6E
 Ma2mJ8KVBranxjKNtTEZ5ReJa9ILWMDQbRDFKdKHdKZ7u7eNXOQPzjAn7OCet/YeqwhO
 nPCaxipk5kr2NDSKWdgEAKQI3h2qD5Fzo9MwCuAvML4NM47en+HxcHs9G3fbbo7PmE8L
 yi/0OhR6ufm7GqHOJdoE+M6DEWtXWqypHJbEbvdS2fgmioUKygoDDn8Min6wqHjuAbke
 dOrg==
X-Gm-Message-State: APjAAAWxWTisCN/mdCdmINJF3cK5kSyZ8Qi9l482uv/VyF2USVdo3Poq
 6JPHqXqh+KID9Z/ePb1zXiM=
X-Google-Smtp-Source: APXvYqxVcw/Hw9oT7joRcv3UhSddONZFUJMePk6do9p0+GA0Fzl82KIsbYuQxy710t5pi3OUdBK2EQ==
X-Received: by 2002:a17:902:903:: with SMTP id
 3mr92698014plm.281.1560917376580; 
 Tue, 18 Jun 2019 21:09:36 -0700 (PDT)
Received: from localhost (193-116-92-108.tpgi.com.au. [193.116.92.108])
 by smtp.gmail.com with ESMTPSA id x3sm263791pja.4.2019.06.18.21.09.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 21:09:35 -0700 (PDT)
Date: Wed, 19 Jun 2019 14:04:30 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/3] powerpc/64: __ioremap_at clean up in the error case
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
References: <20190610030818.17965-1-npiggin@gmail.com>
 <5d358284-c31c-5e01-240a-54b3491a8915@c-s.fr>
In-Reply-To: <5d358284-c31c-5e01-240a-54b3491a8915@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1560916886.zyg87enrjs.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy's on June 11, 2019 4:28 pm:
>=20
>=20
> Le 10/06/2019 =C3=A0 05:08, Nicholas Piggin a =C3=A9crit=C2=A0:
>> __ioremap_at error handling is wonky, it requires caller to clean up
>> after it. Implement a helper that does the map and error cleanup and
>> remove the requirement from the caller.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>=20
>> This series is a different approach to the problem, using the generic
>> ioremap_page_range directly which reduces added code, and moves
>> the radix specific code into radix files. Thanks to Christophe for
>> pointing out various problems with the previous patch.
>>=20
>>   arch/powerpc/mm/pgtable_64.c | 27 ++++++++++++++++++++-------
>>   1 file changed, 20 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
>> index d2d976ff8a0e..6bd3660388aa 100644
>> --- a/arch/powerpc/mm/pgtable_64.c
>> +++ b/arch/powerpc/mm/pgtable_64.c
>> @@ -108,14 +108,30 @@ unsigned long ioremap_bot;
>>   unsigned long ioremap_bot =3D IOREMAP_BASE;
>>   #endif
>>  =20
>> +static int ioremap_range(unsigned long ea, phys_addr_t pa, unsigned lon=
g size, pgprot_t prot, int nid)
>> +{
>> +	unsigned long i;
>> +
>> +	for (i =3D 0; i < size; i +=3D PAGE_SIZE) {
>> +		int err =3D map_kernel_page(ea + i, pa + i, prot);
>=20
> Missing a blank line
>=20
>> +		if (err) {
>=20
> I'd have done the following to reduce indentation depth
>=20
> 		if (!err)
> 			continue

I'll consider it, line lengths were not too bad.

>> +			if (slab_is_available())
>> +				unmap_kernel_range(ea, size);
>=20
> Shouldn't it be unmap_kernel_range(ea, i) ?

I guess (i - PAGE_SIZE really), although the old code effectively did
the full range. As a "clean up" it may be better to avoid subtle
change in behaviour and do that in another patch?

Thanks,
Nick
=
