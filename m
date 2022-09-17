Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 699045BB6B3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Sep 2022 08:41:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MV1YM2Y5Rz3c42
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Sep 2022 16:41:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Pn1D3h7W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MV1Xp0FLyz2yYL
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Sep 2022 16:40:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Pn1D3h7W;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MV1Xn67gRz4xG8;
	Sat, 17 Sep 2022 16:40:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1663396841;
	bh=EWcls91cLZsNYnYnhKcuILudPebdd47HRci6a/BFmvo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Pn1D3h7WlBdBpFZwbI57rSypaxO9eWOmzraAUEw74dpU0OlMDWkF0JzngzB/tO87Z
	 FDv269lu8/c1PeLSFudTEaTnLmAewRS/KuH0QgwRwW7uynaImzEGRp6nrpcJ0VN5AS
	 ZfL9/D4gZnIQZI0PohyZz3ROEG7DiMpzJTOHBRfO+ztthS69SDCNLc/vm1RzYMuprg
	 Zz2pTrWSEEko8O2wnYCSnEAW/mBZkrOh7M8TdQwJpch/wSbnVKxmodkc1ZHKF/GJE1
	 t1/hKUVKPAjmxbQUHmYgv7CNhRPu2Ffauxf0KqEzJtXcyF/VLi0azEKe7BOQTxliz7
	 dXa2drf+CawJQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 1/2] powerpc/vmlinux.lds: Ensure STRICT_ALIGN_SIZE is at
 least page aligned
In-Reply-To: <5d88f02c-1d3e-4a5b-9aaf-87eb420df6e2@csgroup.eu>
References: <20220916131422.318752-1-mpe@ellerman.id.au>
 <5d88f02c-1d3e-4a5b-9aaf-87eb420df6e2@csgroup.eu>
Date: Sat, 17 Sep 2022 16:40:41 +1000
Message-ID: <87pmfuld06.fsf@mpe.ellerman.id.au>
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
Cc: "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 16/09/2022 =C3=A0 15:14, Michael Ellerman a =C3=A9crit=C2=A0:
>> Add a check that STRICT_ALIGN_SIZE is aligned to at least PAGE_SIZE.
>
> This cannot happen, the definitions in arch/powerpc/Kconfig don't allow=20
> that.

It can't happen yet :)

There's enough combinations of DATA_SHIFT and PAGE_SIZE that it would be
easy to add a new value for either and miss the implications. So I'd
rather have a check.

>> diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vml=
inux.lds.S
>> index fe22d940412f..4e56fc0ee42a 100644
>> --- a/arch/powerpc/kernel/vmlinux.lds.S
>> +++ b/arch/powerpc/kernel/vmlinux.lds.S
>> @@ -32,6 +32,10 @@
>>=20=20=20
>>   #define STRICT_ALIGN_SIZE	(1 << CONFIG_DATA_SHIFT)
>>=20=20=20
>> +#if STRICT_ALIGN_SIZE < PAGE_SIZE
>> +#error "CONFIG_DATA_SHIFT must be >=3D PAGE_SIZE"
>
> s/PAGE_SIZE/PAGE_SHIFT

Thanks.

cheers
