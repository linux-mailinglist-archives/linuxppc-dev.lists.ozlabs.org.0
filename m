Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA24B89EB19
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 08:42:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDtYs4Wf1z3vbd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 16:42:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDtYP0d3Vz30fm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Apr 2024 16:42:30 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruReq-0007RM-FZ; Wed, 10 Apr 2024 08:42:08 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruReo-00BRVQ-DH; Wed, 10 Apr 2024 08:42:06 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruReo-00HOKB-0z;
	Wed, 10 Apr 2024 08:42:06 +0200
Date: Wed, 10 Apr 2024 08:42:06 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Drop Li Yang as their email address stopped
 working
Message-ID: <u4bhjzjr4jjx26r3r4jupqd5u273xsvuyfzq5ecv6binoyoqzq@5zib23vgtlsx>
References: <20240405072042.697182-2-u.kleine-koenig@pengutronix.de>
 <20240409144204.00cc76ce@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qezoggtwtmgqqqvk"
Content-Disposition: inline
In-Reply-To: <20240409144204.00cc76ce@kernel.org>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Li Yang <leoyang.li@nxp.com>, Zhang Wei <zw@zh-kernel.org>, kernel@pengutronix.de, netdev@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--qezoggtwtmgqqqvk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 09, 2024 at 02:42:04PM -0700, Jakub Kicinski wrote:
> On Fri,  5 Apr 2024 09:20:41 +0200 Uwe Kleine-K=F6nig wrote:
> > When sending a patch to (among others) Li Yang the nxp MTA replied that
> > the address doesn't exist and so the mail couldn't be delivered. The
> > error code was 550, so at least technically that's not a temporal issue.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> FWIW it's eaac25d026a1 in net, thanks!

Greg also picked it up, it's fbdd90334a6205e8a99d0bc2dfc738ee438f00bc in
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
=2E Both are included in next-20240410. I guess that's not a big problem.
(And please prevent that the patch is dropped from both trees as it's
already included in the other :-)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--qezoggtwtmgqqqvk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYWNL0ACgkQj4D7WH0S
/k5wNAf+MJDdbm33k3wubemVjjqKUK3f6FxXQe4t7lCMtz5sI0KpYVCrJhtHd0LK
Ml2eGbqb9oiNe5Uzf+DtMLAfrEGD0nKi4ILU18nmZwIGgqDslReXcKGZgbHZ0VMU
/HvqSZfEi+ePr+n7yZ4rF2bdpwzrUsJjRpqsUKqhB3OsZep3zgXjOeedd+g3vtXR
RBMcHTVhin3cVtMV3HoXfL7IDqL2S9tvRLxovSxZGHnCYbnZwS2jEuk6oyx9AwXh
ykjeo7C+PNBKzDUsLfwqk9GwKBzeMeRxsjCvhQpls8uzKJJEPUfEsmcuv8geHk4b
BEKAyo3PsJjIffwle960ADMQG+Xqig==
=bfVT
-----END PGP SIGNATURE-----

--qezoggtwtmgqqqvk--
