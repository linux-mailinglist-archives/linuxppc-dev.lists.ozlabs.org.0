Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1201C5D0C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 18:09:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Gl6q1qrkzDqhC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 02:09:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=Jpyx0GW/; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Gl0H4WGtzDqg6
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 02:04:15 +1000 (AEST)
Received: from localhost (p54B335A1.dip0.t-ipconnect.de [84.179.53.161])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B2BCE206A4;
 Tue,  5 May 2020 16:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588694653;
 bh=UPUCU3eUar7iY9cJbizcok3tqdxkqvfWgxtd4KniG9w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jpyx0GW/MEFsaJ/3a8hJQAhv87YOfwuY2VCRaz2f23rAvywCCpVGpGI62SPlvU69i
 M6PyJEGWsX8kBfF4OIpUBzoH6UU6urADCJP1Lvy+RrPyzkDrdWg3+P38CzNeDwJ73w
 fcgb2+iKwsiUevl4QPm+FOQRnr/WwxiojXAm3VSs=
Date: Tue, 5 May 2020 18:04:10 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/5200: update contact email
Message-ID: <20200505160410.GH2468@ninjato>
References: <20200502142642.18979-1-wsa@kernel.org>
 <877dxsdl5e.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="v2Uk6McLiE8OV1El"
Content-Disposition: inline
In-Reply-To: <877dxsdl5e.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 kernel@pengutronix.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--v2Uk6McLiE8OV1El
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > My 'pengutronix' address is defunct for years. Merge the entries and use
> > the proper contact address.
>=20
> Is there any point adding the new address? It's just likely to bit-rot
> one day too.

At least, this one is a group address, not an individual one, so less
likey.

> I figure the git history is a better source for more up-to-date emails.

But yes, can still be argued. I won't persist if you don't like it.

Thanks!


--v2Uk6McLiE8OV1El
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6xjnoACgkQFA3kzBSg
KbaTsxAAizU7yVpsyfvJAhLroyGpAVRj7LysT+H5JlZ8JjJ4uDpEhOhL4Hzr5QO4
T4RfB4o+1xmKc0pwT2BOUteCO05S2hRH6+cwel++k+vWjCnKUBxeinylK+ixk4+V
P8QWDo/gFuqUtsm/Wb6PtBR8otMVa0FajdEPuaAkhi2OPQjO/2DvffSHT4c3VAtI
HY4pIIbwaaCiAalCse6IrqkuJT90A0ZDM9oRTZOIaryVkkTHHkBNmB7PKu4viJic
yS3yH+R0e5yBGEre6FkwL1z2CCNAGNXeBQ23gvq3glJAQIQyfBYgnO+lQFD8lZzq
Cb8E69+sastbZnUBKAK7GR5xvBYJImCxN35PRakdd8/pLHcdKgwIWu1B9PTO5xQP
avv3RmViYiSqfRJa5MSWqPu04zkJCYxy/w6yskdPHqhpG+7x1grsLO9hFBWxDN18
KDQaMtcgGzQbGzhxXnB8aZGJOEOTGrmlCxE35WQ5t3uGQe09hHTKuaUri288LXwH
7mK08jCqhMDavvLaUPngPz4IkdiAv8yZaK3LH4ikMQ4bKTJXhpnwfHYEswLP9FQq
Qcrm3tGBksw5Ld3sncU+ENfhhVaoIyxWxxjTp+WQVI+jMjWGCuJ1hy57iPonXfKn
2LEqI9lEf2iukddWH32wj4eivgYf6UHnf91Y5FoePzMf197dID4=
=bFLt
-----END PGP SIGNATURE-----

--v2Uk6McLiE8OV1El--
