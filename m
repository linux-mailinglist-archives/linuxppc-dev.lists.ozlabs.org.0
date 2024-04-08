Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF1189BB2B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 11:05:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=XJjGzyTS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VCjpy3NDhz3dTr
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 19:05:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=XJjGzyTS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sang-engineering.com (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org)
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCjpG38M2z3bw2
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Apr 2024 19:04:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=lh0X
	YsdX9X7r+2LfLut3yBKFYOyg97EUMVhcdGoaLIo=; b=XJjGzyTSVij7r9HRza6z
	sWYNWwG61nhB7EyH5ca89Wl0/Fpvdj0+EIjvMtK+S+JG1yvPn/qH6QKJ55SL1Flc
	VyQECrU3n3+PV7wMLcOpF8AVxCJ6ooDXSmC2aALkuHJ3CclgS4XjMhnZ3cc5Fs3C
	gzNepVtYURM/uyuRHz0WJxtdNrBfZZZYCMaKtcBJU0688a4TFj/uLeMA4nSlvmMV
	527TnoKEaOR2QLV/rgf6po1Ej5vzgfOXbgSm302RpwOa/MTwc5b4WxQfxUvReVm2
	ePYrkjkTyfDgiGtaTUHu1x+WHt7tN6jji5W9aXBkKMrhH/U8w22qTKrxw/LsNEZz
	ag==
Received: (qmail 713144 invoked from network); 8 Apr 2024 11:04:34 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Apr 2024 11:04:34 +0200
X-UD-Smtp-Session: l3s3148p1@YmsjGJIVvNAgAwDPXwE9APSWg5D5lDs4
Date: Mon, 8 Apr 2024 11:04:34 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH 14/64] i2c: cpm: reword according to newest specification
Message-ID: <maxjcriuq6qfoeoing5ic7l5pnxdyylovjdoh4w3bzhnmco6ax@mslv35p4k35k>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, Jochen Friedrich <jochen@scram.de>, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-15-wsa+renesas@sang-engineering.com>
 <jpp67ejeropvsc6gwompwc5t2nbl6cde2o33vtf42e2on2ycal@42ovfdhp6oh4>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e5r3yanqecrrgaxn"
Content-Disposition: inline
In-Reply-To: <jpp67ejeropvsc6gwompwc5t2nbl6cde2o33vtf42e2on2ycal@42ovfdhp6oh4>
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
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--e5r3yanqecrrgaxn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >  	out_8(&cpm->i2c_reg->i2mod, 0x00);
> > -	out_8(&cpm->i2c_reg->i2com, I2COM_MASTER);	/* Master mode */
> > +	out_8(&cpm->i2c_reg->i2com, I2COM_MASTER);	/* Host mode */
>=20
> I2COM_MASTER might be coming from the datasheet.

Maybe we can just drop the comment? The value we write is pretty
self-explaining.


--e5r3yanqecrrgaxn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYTsx4ACgkQFA3kzBSg
KbYO6g/5AedCCDQIWj4C4jH7ScNJsrMsQsNgW1n2+FdZUbvt0sA7ZQcuIVZnbQEP
bHkMsZmy6ftTFuxN5a10qk/jpmIAGDBgP6MYa568mAPsBp4G9/9tK6sMo/q6Hvcl
YWqiCbbhD5h3/EqcEEEzOr8ft+79mXdtLawdQH5BuwKtBNJPHdKvhtrc9Y9whFxg
M4cWJUOgANxPIogyi6sWSsC2iaJTT4R14+ReipObubq32mZiGz7lk93wwAg0pF94
jMzH3fpEMXmJHpcqob9oj9Rsg/ymefKh9aU/p/uCC4seFrvS94KYb4xjsSBFU1RZ
a3vYArJNg3gclCE3AH6hks3UpQWHm6OYrQBX/VUZEhw/V013ymrIDWCpZY7nGgBr
BIgEqWbn8pnOTCRXQ7E4WmoR0fyF+eWTK98EFQ5QI5Itxj+fyFuffWfvzo8PoXQI
GqFT7LoEa1TvbL7pitevPMLzjKCWpdIDkLnvzzhe02oyd09AZlRhtM6wZ9oby3fc
TZO9NP9OFH9iR+MEQ5awHBKlTim4VaBkCndqtw01ehQ2OgPD5fdlyNXgw3MIqFBf
bsnitjgnu2lbv/xtL7aW1GOsHzRP4Z8t3aeYRUA0+PbYqD6Nq5QQGfRrLxCRxxTN
RKgM6DeDl3dWXkU9NqV2W4HnKTsZQpegdg0cxYXZTcJAHwHvciE=
=8GgV
-----END PGP SIGNATURE-----

--e5r3yanqecrrgaxn--
