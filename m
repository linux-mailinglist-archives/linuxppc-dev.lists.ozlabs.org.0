Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C0223D3D0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 00:10:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMQmk3DwCzDqg6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 08:10:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=UeLnj6w4; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMQkT3W1tzDqfs
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 08:08:49 +1000 (AEST)
Received: from localhost (router.4pisysteme.de [80.79.225.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0461E2250E;
 Wed,  5 Aug 2020 22:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596665326;
 bh=ZsUFr7FgM2XpxfbHCeXrW7JvL+WBNx4Wft3trEEd5RU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UeLnj6w40Jhp8B6cMdZcEEyuXbQtdP0eCmymnX0/SZfKSKd0zowpWbUMFZrSCeBzj
 Z2skU+VDD/EiTSQAdEUDOXb9o8QCXVMZoUO2remy9zqeQ/WW9LyEDlhxIVZcfwhRnL
 T0wh1MrA1+dtwZAnYgy5QqYFC/el1me+OQJbf7H8=
Date: Thu, 6 Aug 2020 00:08:42 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH] macintosh: windfarm: fix spelling mistake "detatch" ->
 "detach"
Message-ID: <20200805220842.GC2182@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Colin King <colin.king@canonical.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20200805104337.16104-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Fig2xvG2VGoz8o/s"
Content-Disposition: inline
In-Reply-To: <20200805104337.16104-1-colin.king@canonical.com>
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
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Fig2xvG2VGoz8o/s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 05, 2020 at 11:43:37AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> There are spelling mistakes in DBG messages. Fix them.
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

These comments can go entirely. i2c_detach is long history. And for
remove, we have debugging output in the driver core meanwhile.


--Fig2xvG2VGoz8o/s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8rLeoACgkQFA3kzBSg
Kbbf3A//dxQuXCMIP+fM3FpsD9xa0D6BvZJ9uye6lcytP3aB4nYwiyQH1Xa2chW4
DJPf0EYPgesQtRj6/VeAwrjt3I/a4TJcsPrTEPh42f+5lnBtdrjRPWI71ng37Ex8
PftsLWt0XWcveo/b1dfw3v33xLSGDq/+Ivz3perRsQjbW1+YdMXIy3WnfyxkLJDr
ZapgqtZAjIuJNGMym3RYIe6JYzHVJHzBXyNOB5IA99IdG5CvCu0IEMsX+35bCMhD
iCnA9Vnltejf73dv+ELfn5HjBCU2h813GxhZ/Wejl4E5sdgh+a0P+35ML6zOiq2O
wggmD98tGLXgshqnhJE/zEukOZY5b1rLWGvE9kWT6IMn8Z80pbgUloiF7RvddnP7
4LsG8z+soDJh0hZxDcWBZOgEg4xb97MF+7+0vS3miv8SYLqS8fwAjsJgOG/slaiC
aRCd68ndJIC4z25jkkjDIMBbY9yDI2vxUjG4igilXMUJEIEsDFGvf81uuXyZ496I
RBci3lH9ERyT5KW7xkd8WTfR/JxxHp39kOdD3g4NTh52J47YT5c8Io2StwQj+fxQ
NdQGiGR9d1oXVOXHcO/k/T8qoTUMctb5uOc8rfSUYycw0v2TgMb+AwgISq4ovw6L
2t+THEjAWKxIcej9U6b69Bj+DskSo3zoRHZZf4AukUr8awGp1NA=
=luwO
-----END PGP SIGNATURE-----

--Fig2xvG2VGoz8o/s--
