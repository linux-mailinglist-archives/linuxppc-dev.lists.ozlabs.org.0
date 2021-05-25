Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA2F39093B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 20:50:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqNS21GgRz2ykG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 May 2021 04:50:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UXf/KkIU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UXf/KkIU; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqNRV5ffhz2yX9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 May 2021 04:49:42 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6444761249;
 Tue, 25 May 2021 18:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621968578;
 bh=LKdcmj5xf+yFErAth6zsRB6/eMGCN48nWrCCNpMz7iY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UXf/KkIUPu3dHjYGzOcDXQus+geltLjUHC+6VZZnILWWtcA8W+HRyrFWL53f7LEuf
 +sZxUmygs50hlc1IXsROKvZ5GMbsuxOzNCYBLLgkcCeDvl9bSQZr4Iw38rwUTpYANX
 Z7Ki5YOuiQyqteQ46O/1Ma8ZXjeE70LxQU9ijzzujrl97SNbu6Ia6NrQB7SnAPvwNm
 w+uQU5LJtsc0ZgNAvFwIEDlvhvgQlEwnmz0mcNlucx79ZIMspmY8FOFZg4LOn5+gck
 UVuuCPw/cBctPG68SEIVvEQQjNmZGbvvQ3Bkm00BvfGa5wCB1HYpsdunu8WgC5JceL
 HR4cjXTqIVEkw==
Date: Tue, 25 May 2021 20:49:28 +0200
From: "wsa@kernel.org" <wsa@kernel.org>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCH v3 0/4] P2040/P2041 i2c recovery erratum
Message-ID: <YK1GuD8o7k+jDLFZ@kunai>
Mail-Followup-To: "wsa@kernel.org" <wsa@kernel.org>,
 Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20210511212052.27242-1-chris.packham@alliedtelesis.co.nz>
 <b90f48cfdc31af08190e7a8eaa71b7bd488fcbaa.camel@infinera.com>
 <ec3cdcc8-5869-9e7d-30c0-59ff4ec67a58@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="M6Zv91vJLKCj4+lw"
Content-Disposition: inline
In-Reply-To: <ec3cdcc8-5869-9e7d-30c0-59ff4ec67a58@alliedtelesis.co.nz>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--M6Zv91vJLKCj4+lw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> For those reading along the v2 mentioned in that thread was posted as=20
> https://lore.kernel.org/linux-i2c/20170511122033.22471-1-joakim.tjernlund=
@infinera.com/=20
> there was a bit of discussion but it seemed to die out without reaching=
=20
> a conclusion.
>=20
> The i2c-mpc driver is now using the generic recovery mechanism so that=20
> addresses one bit of feedback from the original thread.

Yes, and the generic recovery has been improved since then. There is an
"incomplete_write_byte" fault injector now and the generic recovery
handles it correctly meanwhile. Before, it actually could cause a write
to happen but we are sending STOPs now.


--M6Zv91vJLKCj4+lw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCtRrQACgkQFA3kzBSg
KbaY4Q//Z/AUf2L648u1FyKxiUMz7Bk1yhGNT95n1p3QU0z2pK4egbXmcfJWxU7p
zNQDFUFeMDROP4kSlnVz/xbY2Y1DHX+aarmFmIxWq7m5OJs+PErShPp8mpoWaexW
xoBieaadYbjZtcA46sQd4gxr3WI+Vl404/4wWTkQgIEUj5WttH0WvfbzPdBwt1Rg
laG97k4NbeZaf7IPTkQnjbQvxOeWtLRQSD6PBJETlIin+Dygecv55jFnoVd+fm3+
l1k9trK+rnpekqyopIxr2mXK/6821FmZZI8isHX6FKtW8HRdXJwZH6lkIh1AJ4/m
V89xF65s/PDkP8rFT0U9dOsVX35cdF9FJlQRedm3y5V7OkpOIi+1wC7TxyCC680s
DdUw3yFO+UwV+iPfQRBTGbDrfcSPNX1GLsImJ8mniK/NcV+Dll8+Q8ShsIKWqFYo
N8G/fgL1QVkQM3RYGB2+MIfg8AJ4oXlWZSMc5fDNgxx5MYGDBxMswSncO4PlWELq
NFfG1Q9X02KY4JQLNtVYm1v07JVXOTt6oLTLYqI1yRGCAYoKaXeRamwykoHPvikh
S1WiM2CtfCVG+OJB3S+q8JEhJYyYmSSvgFrAzVA3K93NoujpoA4w4TWHY6DUjOoM
3h19gXeeWLKRF8AUqjG2dX9hkTQJ23vW15NZR17apyh70FgbusU=
=kqR6
-----END PGP SIGNATURE-----

--M6Zv91vJLKCj4+lw--
