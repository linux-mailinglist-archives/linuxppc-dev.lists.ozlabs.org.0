Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4695F05B0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 09:26:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mf1xN6lKsz3c41
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 17:26:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=eG0A5f5S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mf1wr39Njz3bnY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 17:25:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=eG0A5f5S;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mf1wm6SD8z4x1V;
	Fri, 30 Sep 2022 17:25:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664522747;
	bh=vldn3sCX6fLDQTDH63JsyZiUXyqsjpGMojYXIgEPshU=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=eG0A5f5SymRiSEQGqQ5aIP0vjmM5RtTOlCpAEM55fviuoC5HLicGq8JkNhJhEzoRt
	 O9pInta3f1O79v8QsJkinR/VhUq5hCWO6nKtxdktUw0UVZHfU1LEwT4G6AOyIIM/aY
	 wZzW9/ky/Qh84lH2yqxXCSoUgjZNWCpieKH4yOplyS6aEcvFz90O2bCi1TkAukuqo8
	 ngKyrscdFJ6kuI2TvxV5rXT2vr0/ZEhcjX4XHzLgEyjXrD5w/r/NO25gVal0bFDMv6
	 zMkWkClrQURX+e1M3axJFoJxnV1zaFKoLZv82357MZDMiHKaC2qt6vQaWcnnXEmUXq
	 rKkYiLAi5DgaA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, ruanjinjie
 <ruanjinjie@huawei.com>, "npiggin@gmail.com" <npiggin@gmail.com>,
 "joel@jms.id.au" <joel@jms.id.au>, "Julia.Lawall@inria.fr"
 <Julia.Lawall@inria.fr>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -next] powerpc/mpic_msgr: fix cast removes address space
 of expression warnings
In-Reply-To: <4d3b7f83-498e-deb2-ce2a-c17d4b22a078@csgroup.eu>
References: <20220901085416.204378-1-ruanjinjie@huawei.com>
 <4d3b7f83-498e-deb2-ce2a-c17d4b22a078@csgroup.eu>
Date: Fri, 30 Sep 2022 17:25:39 +1000
Message-ID: <87sfk9pbm4.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 01/09/2022 =C3=A0 10:54, ruanjinjie a =C3=A9crit=C2=A0:
>> [Vous ne recevez pas souvent de courriers de ruanjinjie@huawei.com. D=C3=
=A9couvrez pourquoi ceci est important =C3=A0 https://aka.ms/LearnAboutSend=
erIdentification ]
>>=20
>> When build Linux kernel, encounter the following warnings:
>>=20
>> ./arch/powerpc/sysdev/mpic_msgr.c:230:38: warning: cast removes address =
space '__iomem' of expression
>> ./arch/powerpc/sysdev/mpic_msgr.c:230:27: warning: incorrect type in ass=
ignment (different address spaces)
>>=20
>> The data type of msgr->mer and msgr->base are 'u32 __iomem *', but
>> converted to 'u32 *' and 'u8 *' directly and cause above warnings, now
>> recover their data types to fix these warnings.
>
> I think the best would be to change MPIC_MSGR_MER_OFFSET to 0x40 and=20
> then drop the casts completely:
>
> 	msgr->mer =3D msgr->base + MPIC_MSGR_MER_OFFSET;

Or:

#define MPIC_MSGR_MER_OFFSET    (0x100 / sizeof(u32))

To document that it's 0x100 bytes, but the the offset is in units of u32.

cheers
