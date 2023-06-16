Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2C7733743
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 19:15:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XKIcZxmE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjQlX2ZjLz3c24
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 03:15:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XKIcZxmE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjQkc4NTgz3bcF
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 03:14:31 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 95B2761F3A;
	Fri, 16 Jun 2023 17:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8460BC433C8;
	Fri, 16 Jun 2023 17:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686935668;
	bh=PIy0eDkU+XgEcCqTGXTVNJA4eA/en2aswew83heoDgU=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=XKIcZxmE596EiYRv9HwErM0ngEbBPgMxzwFYkMIN0/WGjLUUkdukYBBM81CfUsSGp
	 6Vx76e77RzA5ARjRpW3v5KKT2rFsuNWDV1MgTSBd4EVLvl22velq9dM6l476Q5pbIx
	 S25ot0Ho+BKVsk5acJ5lgqBu7VCY8qk9GQG1hQwN1y/JRQhhVTkY0vpBfILE1z+L97
	 MraaV+CEv+Abii8aT2ETMZfnuH/p0SgOsXiNPCziORvxLdh+mmKANyCAy/93fnp5g3
	 L4bL2xcx+KWNS25gL8aC/gANJkbQpPDdbHfsctKRIoz9a+r/plAvMa6/V29oobbjtS
	 y5/CnpyCJ2n6g==
Date: Fri, 16 Jun 2023 22:42:40 +0530
From: Naveen N Rao <naveen@kernel.org>
Subject: Re: ppc64le vmlinuz is huge when building with BTF
To: Dominique Martinet <asmadeus@codewreck.org>
References: <ZIqGSJDaZObKjLnN@codewreck.org> <ZIrONqGJeATpbg3Y@krava>
	<ZIr7aaVpOaP8HjbZ@codewreck.org>
	<6b26dfef-016c-43df-07f5-c2f88157d1dc@oracle.com>
	<ZIt11crcIjfyeygA@codewreck.org> <1686912543.c6zqyw5s4x.naveen@kernel.org>
	<ZIxOxj0Y-kay22Oh@codewreck.org>
In-Reply-To: <ZIxOxj0Y-kay22Oh@codewreck.org>
MIME-Version: 1.0
User-Agent: astroid/0.16.0 (https://github.com/astroidmail/astroid)
Message-Id: <1686935137.j96zp0hcg9.naveen@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Alan Maguire <alan.maguire@oracle.com>, dwarves@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@kernel.org>, bpf@vger.kernel.org, Jiri Olsa <olsajiri@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dominique Martinet wrote:
> Naveen N Rao wrote on Fri, Jun 16, 2023 at 04:28:53PM +0530:
>> > We're not stripping anything in vmlinuz for other archs -- the linker
>> > script already should be including only the bare minimum to decompress
>> > itself (+compressed useful bits), so I guess it's a Kbuild issue for t=
he
>> > arch.
>>=20
>> For a related discussion, see:
>> http://lore.kernel.org/CAK18DXZKs2PNmLndeGYqkPxmrrBR=3D6ca3bhyYCj=3DGhyA=
7dHfAQ@mail.gmail.com
>=20
> Thanks, I didn't know that ppc64le boots straight into vmlinux, as 'make
> install' somehow installs something called 'vmlinuz-lts' (-lts coming
> out of localversion afaiu, but vmlinuz would come from the build
> scripts) ; this is somewhat confusing as vmlinuz on other archs is a
> compressed/pre-processed binary so I'd expect it to at least be
> stripped...

As far as I can tell, kernel's install script doesn't give out that=20
name, so 'vmlinuz' is likely coming from the distro's=20
/[s]bin/installkernel script. It probably needs an override to retain=20
'vmlinux'.=20

>=20
>> > We can add a strip but I unfortunately have no way of testing ppc buil=
d,
>> > I'll ask around the build linux-kbuild and linuxppc-dev lists if that'=
s
>> > expected; it shouldn't be that bad now that's figured out.
>>=20
>> Stripping vmlinux would indeed be the way to go. As mentioned in the abo=
ve
>> link, fedora also packages a strip'ed vmlinux for ppc64le:
>> https://src.fedoraproject.org/rpms/kernel/blob/4af17bffde7a1eca9ab164e5d=
e0e391c277998a4/f/kernel.spec#_1797
>=20
> It feels somewhat wrong to add a strip just for ppc64le after make
> install, but I guess we probably ought to do the same...
> I don't have any hardware to test booting the result though, I'll submit
> an update and ask for someone to test when it's done.
> (bit busy but that doesn't take long, will do that tomorrow morning
> before I forget)

Thanks! You're right that it's likely just powerpc that is different=20
here. It sure would be nice if we can iron out issues with our zImage.


- Naveen

