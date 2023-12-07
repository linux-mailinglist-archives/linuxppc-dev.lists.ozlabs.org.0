Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EAC809506
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 23:04:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HBK5Wpbd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmSwn3PqXz3cVV
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 09:04:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HBK5Wpbd;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmSvw5fHMz3c2V
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Dec 2023 09:03:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701986620;
	bh=FpdRbCvLc9cM0+D2gGxh1LT50OOe3QMLXdfceOfcuro=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HBK5WpbdkQ6x34G7am++lhYlz4m4cBOfLFaUrA7IQI67nJdedI2N8VcRdwUhv9HJV
	 HxbZNO9GPin8H13ohRNqbvY5lHPM7hjJZv9fx770xMiXW6RMatXGqKKfQiGPpS0SA5
	 zCOS2f32cKaCGjkXbouGBuLNTaMNX3s6/K4uPqFgRXlzeEQjJEMBwL3Y07dZYpvCU8
	 rC/RDwfBuaG7zs6fmjNtaokjyEUW5Og86AcBKfVPz4tUjQAOzOHHzOoONsE7dy6ukW
	 y0uRT7i7Kgwxq8eNjjbRtP4JDT4BK7I8Bl1W2Njp7+OD23dBbhkYTCMibYVt7nGOHQ
	 QDhkCs67BbE1w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SmSvt01Fnz4wbQ;
	Fri,  8 Dec 2023 09:03:37 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Daniel Kolesa
 <daniel@octaforge.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] drm/amdgpu: drop the long-double-128 powerpc check/hack
In-Reply-To: <18cd1ce5-ebea-4cb6-a91c-23283f2fc999@csgroup.eu>
References: <dab9cbd8-2626-4b99-8098-31fe76397d2d@app.fastmail.com>
 <87o7o9b396.fsf@mpe.ellerman.id.au>
 <18cd1ce5-ebea-4cb6-a91c-23283f2fc999@csgroup.eu>
Date: Fri, 08 Dec 2023 09:03:34 +1100
Message-ID: <87v899ekll.fsf@mail.lhotse>
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
Cc: "dan@danny.cz" <dan@danny.cz>, "alexdeucher@gmail.com" <alexdeucher@gmail.com>, "tpearson@raptorengineering.com" <tpearson@raptorengineering.com>, "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 31/03/2023 =C3=A0 12:53, Michael Ellerman a =C3=A9crit=C2=A0:
>> "Daniel Kolesa" <daniel@octaforge.org> writes:
>>> Commit c653c591789b ("drm/amdgpu: Re-enable DCN for 64-bit powerpc")
>>> introduced this check as a workaround for the driver not building
>>> with toolchains that default to 64-bit long double.
>> ...
>>> In mainline, this work is now fully done, so this check is fully
>>> redundant and does not do anything except preventing AMDGPU DC
>>> from being built on systems such as those using musl libc. The
>>> last piece of work to enable this was commit c92b7fe0d92a
>>> ("drm/amd/display: move remaining FPU code to dml folder")
>>> and this has since been backported to 6.1 stable (in 6.1.7).
>>>
>>> Relevant issue: https://gitlab.freedesktop.org/drm/amd/-/issues/2288
>>=20
>> I looked to pick this up for 6.3 but was still seeing build errors with
>> some compilers. I assumed that was due to some fixes coming in
>> linux-next that I didn't have.
>>=20
>> But applying the patch on v6.3-rc4 I still see build errors. This is
>> building allyesconfig with the kernel.org GCC 12.2.0 / binutils 2.39
>> toolchain:
>>=20
>>    powerpc64le-linux-gnu-ld: drivers/gpu/drm/amd/display/dc/dml/display_=
mode_lib.o uses hard float, arch/powerpc/lib/test_emulate_step.o uses soft =
float
>>    powerpc64le-linux-gnu-ld: failed to merge target specific data of fil=
e drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.o
>>=20
>> etc.
>>=20
>> All the conflicts are between test_emulate_step.o and some file in drive=
rs/gpu/drm/amd/display/dc/dml.
>>=20
>> So even with all the hard-float code isolated in the dml folder, we
>> still hit build errors, because allyesconfig wants to link those
>> hard-float using objects with soft-float objects from elsewhere in the
>> kernel.
>>=20
>> It seems like the only workable fix is to force the kernel build to use
>> 128-bit long double. I'll send a patch doing that.
>>=20
>
> Commit 78f0929884d4 ("powerpc/64: Always build with 128-bit long=20
> double") I guess ?

Yes.

> Let's drop this patch from patchwork then.

Thanks.

cheers
