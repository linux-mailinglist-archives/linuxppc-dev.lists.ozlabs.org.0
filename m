Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6191A9BE8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 13:14:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492KWR1kC4zDqxV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 21:14:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=the-dreams.de (client-ip=88.99.104.3; helo=pokefinder.org;
 envelope-from=wsa@the-dreams.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=the-dreams.de
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 492KTT4GckzDq6J
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 21:12:59 +1000 (AEST)
Received: from localhost (p54B33507.dip0.t-ipconnect.de [84.179.53.7])
 by pokefinder.org (Postfix) with ESMTPSA id C08EA2C1FF1;
 Wed, 15 Apr 2020 13:12:55 +0200 (CEST)
Date: Wed, 15 Apr 2020 13:12:55 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Aishwarya R <aishwaryarj100@gmail.com>
Subject: Re: [PATCH] i2c: powermac: Simplify reading the "reg" and
 "i2c-address" property
Message-ID: <20200415111255.GP1141@ninjato>
References: <20200408100354.17782-1-aishwaryarj100@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mejza3ZMMA5Za1mX"
Content-Disposition: inline
In-Reply-To: <20200408100354.17782-1-aishwaryarj100@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-kernel@vger.kernel.org, Richard Fontana <rfontana@redhat.com>,
 Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 linux-i2c@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--mejza3ZMMA5Za1mX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 08, 2020 at 03:33:53PM +0530, Aishwarya R wrote:
> Use of_property_read_u32 to read the "reg" and "i2c-address" property
> instead of using of_get_property to check the return values.
>=20
> Signed-off-by: Aishwarya R <aishwaryarj100@gmail.com>

This is quite a fragile driver. Have you tested it on HW?


--mejza3ZMMA5Za1mX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6W7DcACgkQFA3kzBSg
KbbKcg/+LuL3CQDRqRDK5QM2XE52jwFinJ8KZNx2KhKdg3UvWQMcWqt+V0ZvVy0F
NTo355uvwsvO9dtuemowZmBP6QgS6SPBWktIpn7FX73l5CCx4YT9J/LsHYnJOoCR
2xm3Ai02XtRv3cB6E9jCKXqLz1gxKdmQVDmVcjODqiqDjzppgXuQhsEDeTb6/jpK
6Blt2slVkB2GYEakAuV5+4lLXdAFb7Gl1+VIGxnBYz0H5eGdzU/i3TC5Zbr3FFWT
tjaFJmnQIPQc9kjw2vXy/UZagb3KQ+9nJe1/55iF9VyaA8u7wpS8dPBwXLuKuqX9
PrHffSmjd7MIVvMXEVq/lh3z3cxk4eFKz8uCh+XYBPFVDpTfyupZoa2mxZHqPk4E
WxpRhoSRY7rG/GyO8dGaMfQdYL+9mX+tDI8is3U4gfUPXqaaTRogZ/85T0Y7rZIN
xs2IO8SC/e8TAQqQ1SbH4oErJk4QjyK9n+YprFiirsm28U8D0FD7/Kiy8nFny/17
4j8DB2xTwtyZyVg8OjPojUm00XEPGZEUFdsYgxUW5nesk+lZkDvlVAWgUg0v9rWO
BjM+OWhc3ShIar6Wp2W8Zog18i5ds4wTYNqMPjI8VUv9muuYxMOUdZGD/oUKcylf
rMBsGgX0hoTe6KVyd+MP9ER4nhckHKMgemOKQJuF14sFRUi8Ri4=
=XD4D
-----END PGP SIGNATURE-----

--mejza3ZMMA5Za1mX--
