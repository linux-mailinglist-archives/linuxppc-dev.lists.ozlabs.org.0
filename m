Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C84071944C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 09:31:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWyVC1kQHz3dw1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 17:30:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QVG5fuZe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWyTJ0nSBz2xdv
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 17:30:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QVG5fuZe;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QWyTH4prsz4x3g;
	Thu,  1 Jun 2023 17:30:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1685604612;
	bh=mTuWQ6XrAwLtgrVCKqHX0Awwg82dw3fzJo1p5TuAc1M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QVG5fuZeCFjvAu67mCOoWVFuCwv7UHY0FRhkkOcWRGbsXUsURxHN7oWINLODsw3Pa
	 6IYgwTq0/fS/4coE4nwsew1Tt02PKnwhpDTDwvzQmIvCh/f9fNhf9kfkeyVegO/jcP
	 XoLDDnwYo2fyBf0cdnOg3fj4VZIVD2Q1/Twy4UEfwkr173fITVAfLr3C4vTeJEsCNS
	 kDClqSRr77P3UH21+NN04oFxie1tmU9yllnyrWknE/zp5/BSeEk6dbNY5kCo/nQAeJ
	 GsvCrgh3IBcxueYMi1uYP846flz4YaWkgUedQ26WxZAG5jpdowqE6ANyU4xKwGsyNn
	 hjBpaTK7V7kuQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] MAINTAINERS: Exclude m68k-only drivers from powerpc entry
In-Reply-To: <CAMuHMdUbVmjcYyXmparBm6pQwu3q7HpTKsKfi_aAHGOSX97MUw@mail.gmail.com>
References: <20230531125023.1121060-1-mpe@ellerman.id.au>
 <CAMuHMdUbVmjcYyXmparBm6pQwu3q7HpTKsKfi_aAHGOSX97MUw@mail.gmail.com>
Date: Thu, 01 Jun 2023 17:30:10 +1000
Message-ID: <87pm6fhc71.fsf@mail.lhotse>
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
Cc: linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Finn Thain <fthain@linux-m68k.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:
> Hi Michael,
>
> CC Finn
>
> On Wed, May 31, 2023 at 2:50=E2=80=AFPM Michael Ellerman <mpe@ellerman.id=
.au> wrote:
>> The powerpc section has a "F:" entry for drivers/macintosh, matching all
>> files in or below drivers/macintosh. That is correct for the most part,
>> but there are a couple of m68k-only drivers in the directory, so exclude
>> those.
>>
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>
> Thanks for your patch!
>
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -11916,6 +11916,8 @@ L:      linuxppc-dev@lists.ozlabs.org
>>  S:     Odd Fixes
>>  F:     arch/powerpc/platforms/powermac/
>>  F:     drivers/macintosh/
>> +X:     drivers/macintosh/adb-iop.c
>> +X:     drivers/macintosh/via-macii.c
>>
>>  LINUX FOR POWERPC (32-BIT AND 64-BIT)
>>  M:     Michael Ellerman <mpe@ellerman.id.au>
>
> LGTM, as there are already entries for these two files under
> "M68K ON APPLE MACINTOSH".
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Thanks.

cheers
