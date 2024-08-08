Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0311094B6DC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 08:40:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=djVVfhZ/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wfcq10RvMz3dKJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 16:39:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=djVVfhZ/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfcpJ0J6cz3cjm
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 16:39:16 +1000 (AEST)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5a156556fb4so685164a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Aug 2024 23:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723099151; x=1723703951; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XzREIHv7djAsRlQoZ0lEYM3ck8TqSPELhLYhb00UwBA=;
        b=djVVfhZ/DgwDrv1U1JgloDn1uY+ZXiHK9R8tw2IJaqwfGi7GFfZyOHEpvMt7ICDzup
         tffjHDtXVOD9fwvg42edFBR+Zyht13hylCNfvjtNMZFjQNhZ9iJ6TE+zF2z6e6nJlMV/
         pVQVJOVR8kEi1IR8IQovh4MJjKCfRPoz94ljT6dJLiPsRROWhNPTdSQKxZnPVAkZjgX0
         DbkTRmoDuMzq79EBDt2bSkBWMAt/tqI7JSwwlVo+ltzc1fnN6niPDBzkhi79rigzKBlD
         9Jm8Gz0IrALL7mA9VwmRZr0KSjK3zNj1y3GtdKmD0r0QuGuvwR2sYr5/VIOaQNz7lEHY
         EQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723099151; x=1723703951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XzREIHv7djAsRlQoZ0lEYM3ck8TqSPELhLYhb00UwBA=;
        b=U6NrqW8UQnAOpl5cavmWE1Cg3uzt2tr0PrhQEb6jvWHH/FYW8RYfCjc/V9Pskla10O
         8Q3xLSk3d8JJzHgkPOo1r1m4HY36WLxIdx0QGCBnBpH8YJD0jviSl391C08HyXRXYGvy
         YkDJ33KktKn0RzNl4IBpLtjBgua4q7AIFoTjYFVz47weGx6/31GV5zmdmCmNvcdK7D/6
         D6G17MImrOFSEcuza8R7B8E4ay6e0RjEFPbUxC7ZF/nCDYhKyWV8IcXBzWOzGBCvWEBK
         p+sKK4OHP8sXUHbwKATRzKoRViQPpoYtrhCUzJnw13MNPrJ/cyfIDTgg0cNpQKM8hFCF
         vHMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfaYKSCt9PmsCqnwWz8Dwv/oPAzQUfF7sxF+WosGymiASUlWmMtikQ3pDFqsNiBwUuKJEkiO/H7ioJ3X1zgrqMphNQwJnbDte6jpAz6w==
X-Gm-Message-State: AOJu0Yyfv0g0vOzKB1Cj4BKekniz2X+1LBakXZcLGKMK8cPqD3xijei6
	N/piGzlYVudWmpb12UL0ZmcmAR4QEMNRduOqGUCtNv8Pjzh6VDIK43ccL+on8os=
X-Google-Smtp-Source: AGHT+IFYE++R4zQ6oP4dTWiBQKqnLH3w5nmZ4KrvmlIp/crnjaHkWi+F5OEeYOkYO/k4WvFt2B3j1g==
X-Received: by 2002:a05:6402:270d:b0:5a2:37e0:1e88 with SMTP id 4fb4d7f45d1cf-5bbb21a29d7mr708798a12.9.1723099150973;
        Wed, 07 Aug 2024 23:39:10 -0700 (PDT)
Received: from localhost (p50915eb1.dip0.t-ipconnect.de. [80.145.94.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2bf85fbsm315986a12.16.2024.08.07.23.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 23:39:10 -0700 (PDT)
Date: Thu, 8 Aug 2024 08:39:08 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/476: Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
Message-ID: <l6mnn7ritcdnvz4mmf25vom2l2mltvvhvhby23mvzb7wfiurl5@6ytmgge3i4pm>
References: <20240804112032.3628645-2-u.kleine-koenig@baylibre.com>
 <9321c44b-f25c-4cb2-8a7a-a32c4692c865@csgroup.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="53j2fz2a5u2kgmfw"
Content-Disposition: inline
In-Reply-To: <9321c44b-f25c-4cb2-8a7a-a32c4692c865@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, Naveen N Rao <naveen@kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--53j2fz2a5u2kgmfw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Aug 07, 2024 at 07:50:26AM +0200, Christophe Leroy wrote:
> Le 04/08/2024 =E0 13:20, Uwe Kleine-K=F6nig a =E9crit=A0:
> > This driver doesn't use the driver_data member of struct i2c_device_id,
> > so don't explicitly initialize this member.
>=20
> Well, even if the member was used, a 0 init is useless because as soon as
> you initialise one field of the struct, the compiler initialise everything
> else with 0.

Yeah, there are different shades of "useless". I'd say that if the
driver_data member is used, e.g. like:

	static const struct i2c_device_id avr_id[] =3D {
		{
			.name =3D "akebono-avr",
			.driver_data =3D 0,
		}, {
			.name =3D "akebono-arduino",
			.driver_data =3D 1,
		}, {
		}
	};

the assignment to driver_data in the first entry is useless as it
doesn't make a difference for the compiler, but still has a benefit for
the human reader of the code. So I would keep that one.

> Reviewed-by: Christophe Leroy <christophe leroy@csgroup.eu>

Thanks
Uwe

--53j2fz2a5u2kgmfw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAma0aAoACgkQj4D7WH0S
/k7VKwgArCMO3hiO36dweJjZo3GJJdEgnB9Nu9MU0Ue5bVA/+tSGhWbjhaR3lfvW
Jt1Vdr/pTcBgk/PYdu6JYAoKt2hLfQdXrVOAIywP6w1ce5YtRwEwVA3tMFFFZsll
P4CIo9faM3fgpKvZGrEqn6RYVMItUNxXEed5EKcETF9kt/q7XHZFg96p2znNFnip
gBZuz2a3KSDiIJAljVuPCBoGXbEG1zuIoM6qGBd7IpHAShRScTHmJu8CRXWBFVBx
4XPO8ws2xgTA98lKC2B6PyLtmkbEE9gk2zL8Voo74H7Rd29kaRWIglewoKiOziah
MsGKzWhyZ/EoBbEIzfnle9kdz0ltCA==
=IdmB
-----END PGP SIGNATURE-----

--53j2fz2a5u2kgmfw--
