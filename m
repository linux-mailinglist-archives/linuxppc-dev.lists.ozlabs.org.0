Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EAF17F321
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 10:14:07 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48c8Xg2LB4zDqX8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 20:13:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=the-dreams.de (client-ip=88.99.104.3; helo=pokefinder.org;
 envelope-from=wsa@the-dreams.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=the-dreams.de
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 48c8Vg3dPzzDqQg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2020 20:12:07 +1100 (AEDT)
Received: from localhost (p54B33196.dip0.t-ipconnect.de [84.179.49.150])
 by pokefinder.org (Postfix) with ESMTPSA id 9A0582C1EB6;
 Tue, 10 Mar 2020 10:11:58 +0100 (CET)
Date: Tue, 10 Mar 2020 10:11:55 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] macintosh: windfarm: fix MODINFO regression
Message-ID: <20200310091155.GA1987@ninjato>
References: <20200303125046.5157-1-wsa@the-dreams.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline
In-Reply-To: <20200303125046.5157-1-wsa@the-dreams.de>
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
Cc: Erhard Furtner <erhard_f@mailbox.org>, Mathieu Malaterre <malat@debian.org>,
 debian-powerpc@lists.debian.org, linux-i2c@vger.kernel.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2020 at 01:50:46PM +0100, Wolfram Sang wrote:
> Commit af503716ac14 made sure OF devices get an OF style modalias with
> I2C events. It assumed all in-tree users were converted, yet it missed
> some Macintosh drivers.
>=20
> Add an OF module device table for all windfarm drivers to make them
> automatically load again.
>=20
> Fixes: af503716ac14 ("i2c: core: report OF style module alias for devices=
 registered via OF")
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D199471
> Reported-by: Erhard Furtner <erhard_f@mailbox.org>
> Tested-by: Erhard Furtner <erhard_f@mailbox.org>
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>

Michael, I can take this via I2C again, if you ack it.

Thanks,

   Wolfram


--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5nWdcACgkQFA3kzBSg
KbbDexAAoT6EkAdzdK+5cS24d9RczslflX/i4KO3FuBZhFXWgQPB++xI9bsVnx1K
lDnpYLkhuIhXBvpb0Mx34aXQmFHnlosUxF9Pgt/cPertcgLlgA2Fx9U6e6AZH7VI
xIzwCmTnaFEQC+3U+x34Ytad+4/v/YT94Mw/7Q4WlQ+f2IZpXZHLaegVwTaULv45
4+cuAY8YCAW0dPRjbUiX0W405w3kAWY/J5l1rOAbYfoS+at/c+L5qvDrUuOLdiUe
Jlh74Wrq428xd9xmRFfkp3WoOed4AD/tYghY+lzUof5OOp/iNb8nSqZbc40bjK2R
KrwK5yrQUb8kAL2DDGPKNMUkCpbQtUdRCKATf4cXMhF8M59mVme1rIzsrzF4uAsT
mVgeLE+KBLcIvf9APQlZb/SUuWYw3vxaCocgA1Dzr6yxXKxgDJhRR7Ys43aB5USo
cgiMbrKaiTtfsRwXUONpZZi4QFRkz0hv7QL1DUXPM84E0G4rsBa5eGCxYByz+Lm1
gjflQ8znE6LsF9SbnJJPEe7jfyPkOvLrf4EwlkfG77UWM1tMemfO+gUCCKIzDZSk
VIIc4kZgfRFntRoPYVNoVpK/4Cx4ghsXj/+bNod2mAxd+dLS10v3QWyO1dQyGJ1U
GUNVoye0M7ntf7TvmMnCfIc0oDBDSxfVVPmsajLs6/jhCPUZ5qk=
=/cbP
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
