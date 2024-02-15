Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 643DD856F21
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 22:13:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbST70lcBz3cS3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 08:12:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 1027 seconds by postgrey-1.37 at boromir; Fri, 16 Feb 2024 08:12:35 AEDT
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbSSg01hZz2ygZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 08:12:34 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1railD-0007mC-Jx; Thu, 15 Feb 2024 21:55:11 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1railC-000wwp-9Z; Thu, 15 Feb 2024 21:55:10 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1railC-005dsj-0g;
	Thu, 15 Feb 2024 21:55:10 +0100
Date: Thu, 15 Feb 2024 21:55:09 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 0/7] macintosh: Convert to platform remove callback
 returning void
Message-ID: <mdq5k6lq54c5t5yffjotkovrvzfh4uvt4qt4n6rwddmo26neqr@au5s5u3mkoet>
References: <cover.1704900449.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zse4sep35aklq4pu"
Content-Disposition: inline
In-Reply-To: <cover.1704900449.git.u.kleine-koenig@pengutronix.de>
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
Cc: Rob Herring <robh@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--zse4sep35aklq4pu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Jan 10, 2024 at 04:42:47PM +0100, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> this series converts all drivers below drivers/macintosh to use
> .remove_new(). See commit 5c5a7680e67b ("platform: Provide a remove
> callback that returns no value") for an extended explanation and the
> eventual goal. The TL;DR; is to make it harder for driver authors to
> leak resources without noticing.
>=20
> This is merge window material. All patches are pairwise independent of
> each other so they can be applied individually. There isn't a maintainer
> for drivers/macintosh, I'm still sending this as a series in the hope
> Michael feels repsonsible and applies it completely.

this didn't happen yet. Michael, is this still on your radar? Or is
there someone more suiteable to take these patches?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--zse4sep35aklq4pu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXOei0ACgkQj4D7WH0S
/k7Fhwf+NuS2VaUpbMrqUXSluHIMtZYy5acc235Gl6RrOPhOFsQiQHrZ5IHA39XT
C9ZZBaMBqtLUn5jSFA14l6ykQfWLwrubXNh531f6kzXa10ybh5zfJAI4T/53jBt5
Swk8OOwOXE/tvhRZuzsTUwwswWPloKEz953KIxHLaNp05L4Qq7WpIW7OOlVsCjM+
w+t1bHBfHpmhM9Rsaf5JiPXd4PXzpPAH1KeU5m6QhPw47CxrrcLuGxkF+VEs65+5
YGoDrpsbvgWCqmkvfFGb45yFYQn/4KgZtLcWpGSxHu8MHlwMu3EBJidxZNxl+rr/
H7BA9zyVjn2EBo2khLNl6R/TdBe+1Q==
=bXaU
-----END PGP SIGNATURE-----

--zse4sep35aklq4pu--
