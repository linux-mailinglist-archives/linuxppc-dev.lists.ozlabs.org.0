Return-Path: <linuxppc-dev+bounces-9023-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 169F9AC852C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 May 2025 01:44:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b7jd04k3tz2xxr;
	Fri, 30 May 2025 09:44:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748562244;
	cv=none; b=DSKno1uFz8Gb3FQU2ABV5N3Wirmmr45J8gLi8YdoE7Ya+jqcEeUqLQrnsFAU/KAYOOLrb44uZjzlK/Hgc6flWFU0UCY+aY4zc61oRzUHglqvuF4L9s7DrMhYq8CtDNQqQt87Sn+vLfjNfVn4H3hgjLnE/cWFO4iFZfdbMavHJUb5W8x5TWBF6OV+iG6KHLleXAJQhTuQOidvhwvbhq+fT2PTAoVuaPHrj10y+QFlNaFr5l2QWwy1yCrF+nnsGQQRg5qCTKPxNOs7xcQ0fvQG66j4DldyGzzG3/9Ipv8g1oo0kfAV1gfGSr8y1nuYNrtGa5mXJRaaHQg8vY1ZHgFagw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748562244; c=relaxed/relaxed;
	bh=PUnVcrIPj4ms41h74epCZdcVJG1fuUK2dUYpjazCxXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e/cKgh7/BXxFv1JvHecs3tw3/wQX+CglV9b6wRwyS334Jc5qvwpTon4/HjYIt8M7g1cIUVth58S0rhyqZp0hhiDX766D3xG2lSfjNV4S8SviubtoZ6FVZ1TRzqJByHQS6EewALsEbicMRVNssctztodOquZrKuUQUgJpZoJaPowgfrzEAr85XLeNhDkYnxQm6IyMbmuH4W9OMgLewxlo464myl4LmVQd+sNkRaTSLWbb5X1+KG3yJwZpPrwFBeJm725adEWD51X3Urx+8BBVvNQuiSXwtwq/yzKvO7CqEpYFNzhNL/9lcIo9JwjbAHK6yntsT3ab90z8g7HE1ChJkA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=BzTK5rQa; dkim-atps=neutral; spf=pass (client-ip=150.107.74.76; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=BzTK5rQa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canb.auug.org.au (client-ip=150.107.74.76; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org)
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b7jcz1F6vz2xGY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 May 2025 09:44:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748562241;
	bh=PUnVcrIPj4ms41h74epCZdcVJG1fuUK2dUYpjazCxXQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BzTK5rQa0kYH/1zVjasJXQ14eo/k9IoRWXO4iGXY2GTQ4dDy/S8eZXIaSjZfEH2ln
	 uB3/sXAaOIYlz+sbGbphYDXwuHU98d9KVRkCS1xrZ2mJFPpwtEvXkhSs/nDwt7Ra0M
	 BpCGdyV8a52jJ4ivCGudjh2dYrb+YBZZYHqTnZaG49LxfI8bYDA8tHocDkG6MIoxSB
	 p7gZ1NA/iKm7B/pXwBnOTubQYvqSfP89b3KDcqOkQ4dZnJrhso3iqZ0zFljC+/tVLb
	 7TXIYpW35vkL5TiiV/+ZuCkdFiK7+P30CG68rPlfscP4vdjJ4Q7OeZvZY9FYbhVQsy
	 5alpqFsjDUSnQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b7jcx55Z4z4xVc;
	Fri, 30 May 2025 09:44:01 +1000 (AEST)
Date: Fri, 30 May 2025 09:44:00 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>
Cc: Athira Rajeev <atrajeev@linux.ibm.com>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the powerpc tree
Message-ID: <20250530094400.2743f5b3@canb.auug.org.au>
In-Reply-To: <20250513202809.7e23ed2d@canb.auug.org.au>
References: <20250513202809.7e23ed2d@canb.auug.org.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uD.MQ89IeNe9w0HRY+hb2mS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--Sig_/uD.MQ89IeNe9w0HRY+hb2mS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 13 May 2025 20:28:09 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the powerpc tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> Documentation/arch/powerpc/htm.rst: WARNING: document isn't included in a=
ny toctree
>=20
> Introduced by commit
>=20
>   ab1456c5aa7a ("powerpc/pseries/htmdump: Add documentation for H_HTM deb=
ugfs interface")

I am still seeing this warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/uD.MQ89IeNe9w0HRY+hb2mS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg48UAACgkQAVBC80lX
0Gx7Ngf/Ub294OckaW0B6laae5Wm7n6SHfRXYf/0GQ7+y2lfLV8Ykmv0xAbhWvi6
omu3dbKXjmBTiCXy64rkP6WbiDg6bE+xx9R9cZBuiC0x31jc23qUHyyptjLJVEV3
Ta6Y99Doxxv9/8xSJBub5Sij0/bapvNxNgj5/Vjr2bcLQorEDDFU69XAZPVO0sBL
ht7vBFKGtW9IcTx6UjmRdAXjSQ43yzJ3fZLDYZCdT6OVpk2t5ea/h4btQhDtR26d
WiQl2Dd58qJ/KPhIhnoVjtnkg8d/3nEexCKnRA5+rZElag/NvI96p4HtbcrcPZR8
y6hrVG2D0wMJoEoKU++xQQ/x0vrg7A==
=DlEO
-----END PGP SIGNATURE-----

--Sig_/uD.MQ89IeNe9w0HRY+hb2mS--

