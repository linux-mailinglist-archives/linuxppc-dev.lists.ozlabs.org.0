Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D04F23DB8A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 18:16:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMtsw3Cj1zDqn1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 02:16:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=the-dreams.de (client-ip=88.99.104.3; helo=pokefinder.org;
 envelope-from=wsa@the-dreams.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=the-dreams.de
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BMtqt0SdwzDq96
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Aug 2020 02:15:04 +1000 (AEST)
Received: from localhost (router.4pisysteme.de [80.79.225.122])
 by pokefinder.org (Postfix) with ESMTPSA id 9B29B2C0845;
 Thu,  6 Aug 2020 13:24:51 +0200 (CEST)
Date: Thu, 6 Aug 2020 13:24:51 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][V2] macintosh: windfarm: remove detatch debug containing
 spelling mistakes
Message-ID: <20200806112451.GA14906@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
 Colin King <colin.king@canonical.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Wolfram Sang <wsa@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200806102901.44988-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline
In-Reply-To: <20200806102901.44988-1-colin.king@canonical.com>
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
Cc: Wolfram Sang <wsa@kernel.org>, kernel-janitors@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 06, 2020 at 11:29:01AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> There are spelling mistakes in two debug messages. As recommended
> by Wolfram Sang, these can be removed as there is plenty of debug
> in the driver core.
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Wolfram Sang <wsa@kernel.org>


--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8r6H8ACgkQFA3kzBSg
KbZtxg//ZIR7v0tw0KiapTuptJcoisvVibsbZs3xDlTDSfplKnupUcMTPKaOIHo0
osZmu8pbyB5NQ71RUoH2XWYU1/jnaiq0K65Xq+AuMWPJYHwFE4LNw0i1S/flf9sz
+i4zUmjRqIfGLN/csp0YJwXqWOrihCbbS051/lsInN6/PsuUFhC3ebIBjqVAreMA
W1bFKFPBF216CmXYnPvuPEHkrH5Wp/uTP+Y8VJA4zrnZHO3O2+SLL+pQanIPkV4n
VbUFFht90LlhppLYwb6CphT9lbyp/11gRKGG4ljB0PG6Bi7AIR1akALdFuIW/eCS
rljR6QUJrFZZgkS4RwcJL12VpvNgFA/jL71jjM74aMywyLp2ClrOmzANNgMZcwLD
WOZLk0RXM5jtvOEToyftgNHR0m8l2EXw8Q7oG2hoP1gkYL4afGD6NwsLTwSIxa+g
aK2dFR6htfbBiEVksZBiuT9bVjqTiKgUxpfC9KPG5b0feaAefcSZHeB60DA/Jt2w
9XK0oFUm2bMeMdeA9KVp7Bm/Ug6Ffc+Qk8qBahBArOIhZFfLAfD7puin+FCt39KR
/ZO8KLajFoHNtR7ft3XbleProaOCB0ktkX0sRvZTgxLiTK1l9TtwLbg/pNlBpX5W
DPLH/HHZJTo3FGEmhEPIuh8OlVO4Vk1x3cabp/SGHtLMxPBE+lU=
=Hjx1
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
