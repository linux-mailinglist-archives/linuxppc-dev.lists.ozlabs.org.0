Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F75868B9E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 10:05:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkWmF5T0Mz3dW3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 20:05:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkWlr4hj8z3bYc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 20:05:12 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1retOc-00065e-SA; Tue, 27 Feb 2024 10:05:06 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1retOc-003A8L-6j; Tue, 27 Feb 2024 10:05:06 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1retOc-00CLjC-0N;
	Tue, 27 Feb 2024 10:05:06 +0100
Date: Tue, 27 Feb 2024 10:05:05 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: Re: Increasing build coverage for drivers/spi/spi-ppc4xx.c
Message-ID: <p6jiwwqxq5tkqgpipve46l6gyckjunaopmcbjo7h6da2taif2l@nuhpuagodhlz>
References: <qvuhez7vrcoui7i6s4yohd4ednneuoejcp6tw6iwzeefgpyvd6@fkwwtwozhakf>
 <0b29d980-b3b4-4437-be24-19f54b473224@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rfhmgqw7ekafbys3"
Content-Disposition: inline
In-Reply-To: <0b29d980-b3b4-4437-be24-19f54b473224@linaro.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
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
Cc: linux-spi@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Mark Brown <broonie@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--rfhmgqw7ekafbys3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Feb 27, 2024 at 08:54:03AM +0000, Tudor Ambarus wrote:
> On 2/27/24 08:46, Uwe Kleine-K=F6nig wrote:
> > recently the spi-ppc4xx.c driver suffered from build errors and warnings
> > that were undetected for longer than I expected. I think it would be
>=20
> long enough so that we remove the driver altogether?

I know at least one user who noticed the driver being broken because he
needs it and not because a build bot stumbled.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--rfhmgqw7ekafbys3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXdpcEACgkQj4D7WH0S
/k40+Qf+McTNZyqk8elCNTKJEmtaH3li2C4DEQO+7AtfPhiLVsQVPAxDcO6QKt6z
ON64F4KzMK8LdBxBmi3a3I3zceBJxvF8zlyj6X6xTRq2fmaUGm4axOZNliSvqPzo
+tJ3Dm9GKa0cEPX31xYt+2JVsN3KLBxqMdT62XqpUp1nzvRwLC0DjNUujpfljE7f
n8MsLRrPQXHwrVQRKYGmJtxjUG0U4rY0FG4t/t7tO3XTOsrsIPm7oGbMcVNRPT+t
7MC8NJUdGHkfXL6il/pid2C/BP7Div/e/rU8aConqvkuG/38ruaCYAYl/YI17+iN
nkSDgHAltp5JO3Y06QoOqwMUIjNaTg==
=GKeb
-----END PGP SIGNATURE-----

--rfhmgqw7ekafbys3--
