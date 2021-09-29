Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE76341CD71
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 22:36:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKSnZ3x5Nz30R8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 06:36:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dx5126F5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dx5126F5; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKSmy2bPFz2yK2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Sep 2021 06:35:30 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 80722611C0;
 Wed, 29 Sep 2021 20:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632947728;
 bh=IH2/mcLbbTba4ogzth+XbUzMVfz5COKAcB5rIikRw94=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dx5126F50lyQID/bfEVzqPq/BLzY11owVpezNFcSvXROFliqNeV2mje/rCsxyQ/+v
 AJxnLUXx+kBHT2w9hX7qqk/Vc2eFOCMeTH5n7B6TUjBVtVpzLaLL8rOFNAFu9KaIOi
 3aYKm9R4Qr6kufne7uDFsHywV/Eho/GekRU5f6fbPYRi8qhR9QRwTIHIV9ctR1MRbp
 h9PjSjjLYz3I+WkGLYV4/JPbyyuG2f5Dw0GuEXaWRZDliAuwjLb9p9x7n3DcIOwuCZ
 QFRtcpkBcHfYbGSrPEygmw2XH/Fc2Vq7RQHARnQ3+rdprkqinQOw8pTXlu/Gu/t0l6
 Hu5eJ2jp4tm5g==
Date: Wed, 29 Sep 2021 22:35:25 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 00/10] Add Apple M1 support to PASemi i2c driver
Message-ID: <YVTODUqwQM0Ciqi1@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Sven Peter <sven@svenpeter.dev>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Olof Johansson <olof@lixom.net>,
 Hector Martin <marcan@marcan.st>,
 Mohamed Mediouni <mohamed.mediouni@caramail.com>,
 Stan Skowronek <stan@corellium.com>,
 Mark Kettenis <mark.kettenis@xs4all.nl>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210926095847.38261-1-sven@svenpeter.dev>
 <CAK8P3a3Lt2QXk+aWLtXUXjjNhKJwNns6d9r=Yh5_aWETuvZTpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="CeaervSQYJjiQNT9"
Content-Disposition: inline
In-Reply-To: <CAK8P3a3Lt2QXk+aWLtXUXjjNhKJwNns6d9r=Yh5_aWETuvZTpQ@mail.gmail.com>
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
Cc: Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Olof Johansson <olof@lixom.net>,
 Mohamed Mediouni <mohamed.mediouni@caramail.com>,
 Mark Kettenis <mark.kettenis@xs4all.nl>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Stan Skowronek <stan@corellium.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--CeaervSQYJjiQNT9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> This looks all very good to me, I had one very minor comment.
>=20
> Whole series
>=20
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Thanks for the series and the review!

Same here, looks good to me and I only had one minor comment.


--CeaervSQYJjiQNT9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFUzgwACgkQFA3kzBSg
Kbbn5A//f+gdLy9AwaxACKw3vT7xnW7HMQLauduB3y1RJmPHcvIkbtxlg6IPP9nV
Qbd1Tl7PuTtKHxadWeiIcgAh0UjJUAPPv2W4CResqMgRSHTC1Nk44zng53zmv97O
v+p0hpOTzzb77rN2RFBZ6sfYP+aXJ0M8SLLzmjt57pxck+kV0dRdHKjPOa4ayi0U
A2dQclLfceyEMU3Yi/DJpBZz6+wRbMqYQwsncS4exsTk7YAIubAL7w2NFq0lUKpD
P7ghHyD5/9fXgG3MuKV6EKuUN7N4Uq7tk2P/wn+wGTCVoBcgqyIod+4uS6B/iTcG
QPn5YPhe4N2Q9C3ODaffVvv95EY8+4Rt4uDylxGSGxuXndyIpi+rV8RdPxAUKpOd
uKuGbdFn7bQ9tKktQp0SJhfSv1eO40G4opaWxgYp8X05OzXDScCocF4pEnLYJLNR
JW1ZbZe+T47nTcjtougmxLHXfp2+tnERJALkZlfFHP22+RJdUx3296Mh4GUVzZ6g
8Vbuo4kf1q8YuASb375/3YBxp2lnD409kk46iWhJ2ZTWjUquLNUYz+Owtg0JIMW0
Nz9upxOiMhIR14ZFn8TVmXxnNUpIfEJugkjNmVoeJ9nDcyoL9KHtXvAZTSZHo/XU
PwHOVJ5HbZ7vIkXcrxSweCTP2f9RXS9rxME6kzLrPx0o1AgFp3k=
=AdDI
-----END PGP SIGNATURE-----

--CeaervSQYJjiQNT9--
