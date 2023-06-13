Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C7B72DAB6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 09:24:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgKnT6MJGz30gp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 17:24:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgKmy1WF0z2xpr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 17:24:18 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q8yE6-000778-SV; Tue, 13 Jun 2023 09:14:02 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q8yE2-0074Rm-9T; Tue, 13 Jun 2023 09:13:58 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q8yE1-00DnL1-Dv; Tue, 13 Jun 2023 09:13:57 +0200
Date: Tue, 13 Jun 2023 09:13:56 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Ellerman <mpe@ellerman.id.au>, Scott Wood <oss@buserror.net>
Subject: Re: [PATCH] powerpc: Switch i2c drivers back to use .probe()
Message-ID: <20230613071356.xxdl2asqrev6be7x@pengutronix.de>
References: <20230525205622.734093-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ut2kuzp24f4s5kaa"
Content-Disposition: inline
In-Reply-To: <20230525205622.734093-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
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
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, Rob Herring <robh@kernel.org>, Crt Mori <cmo@melexis.com>, Liang He <windhl@126.com>, Nicholas Piggin <npiggin@gmail.com>, kernel@pengutronix.de, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--ut2kuzp24f4s5kaa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, May 25, 2023 at 10:56:22PM +0200, Uwe Kleine-K=F6nig wrote:
> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter")
> convert back to (the new) .probe() to be able to eventually drop
> .probe_new() from struct i2c_driver.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Is there a chance to get this patch in before v6.5-rc1? I intend to
complete the conversion (i.e. drop .probe_new() from struct i2c_driver)
after v6.5-rc1. If this patch doesn't make it in, I'd include it in a
pull request for Wolfram's i2c tree early after v6.5-rc1. So if you
don't take it any more for the upcoming merge window, an ack would be
great.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ut2kuzp24f4s5kaa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSIFzMACgkQj4D7WH0S
/k4JCQgAud2f5LiMgnZwzyy+ZDZyS2nc/AISel2RNS5oc/uEQhkUgApD4CqzFDAO
wR7lv5t/42MF+5EVTlf8sd6g2NqyAo4NG11eCKrYfqjDgihAXdS+tDG/RVL1/6Re
m6+ErUd1GwEfml3SaIgoKMqLpaTThIEybby3rzEGC9EByRO3PDQUzTTi/T7pjOAT
/6cqq7/79/NOeUtK37kTXi1CC54Yj/hUyCm2Dol90oS1WPQQ86jywLY8UyztpuFq
Wo8YHq9rAnWh+WE//wza/p6Xx0ZPILiSWUfb/sKcedVMJSiMhrVk4bvhRLDJVqk2
b4hTKkppq9nezvVQMd3cqMThfPidiw==
=NmuJ
-----END PGP SIGNATURE-----

--ut2kuzp24f4s5kaa--
