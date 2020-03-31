Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B48AE199A05
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 17:42:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sD9k3p3FzDqWg
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 02:42:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=the-dreams.de (client-ip=88.99.104.3; helo=pokefinder.org;
 envelope-from=wsa@the-dreams.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=the-dreams.de
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 48sCz21FHKzDqsb
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 02:33:30 +1100 (AEDT)
Received: from localhost (p54B3321E.dip0.t-ipconnect.de [84.179.50.30])
 by pokefinder.org (Postfix) with ESMTPSA id 8785E2C1EED;
 Tue, 31 Mar 2020 17:33:26 +0200 (CEST)
Date: Tue, 31 Mar 2020 17:33:23 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2] macintosh: convert to i2c_new_scanned_device
Message-ID: <20200331153323.GA5709@ninjato>
References: <20200326113819.7761-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Content-Disposition: inline
In-Reply-To: <20200326113819.7761-1-wsa+renesas@sang-engineering.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2020 at 12:38:19PM +0100, Wolfram Sang wrote:
> Move from the deprecated i2c_new_probed_device() to the new
> i2c_new_scanned_device(). No functional change for this driver because
> it doesn't check the return code anyhow.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au>

Applied to for-next, thanks!


--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6DYr8ACgkQFA3kzBSg
KbaRrQ/+NkT1leu18nmq9wUmVuXHs4jwgNIrw3w+V7G7J7jdi1G5SLFdwNgCoQSW
qRuK6Oq9+8nKYBFfnLS/XsU9jzpsRTyVKUaEr0OeomaR/LiL8ouAUYWsR0pnMstR
qLRBI2MUa0w638fXxOf08/hHWb9h4d5CNjuo3clkaW1JhdFhWngAYgrIBg7HQn0U
NVaN5fn/d4rxtUsIdoLgI8OPZEnFf7ZJ03Oidrm4bV8q4MZ0XNC5wAnf4+aHlo5T
pu5Krq+8nAHFZUITeqjQcE1Rw0PUuMxfUXT7eix9W/xo7cVgRLEYHwOlyLi4l5It
ABX9JPDpod6Jgw6PKY7HN35O+xgwAsSw9LS/pFJzmihWSb7lUYEiVYSbgnq08x3Y
YnE/pNYluRzBt8Xp6XoUQQNNxig0gKZXC/54r0AmIno/TAmRpMest1OqUJpVDqDU
G+F9dXgaakTAfIXm43C+N2ltZU/nbKF2XrX/cGFZZNjqxJZH2k7WF0gpyxzCHOQX
JSEqzgzyTDsAgfvPiDfy+y5VUSyky+my2eBFDHxt8+T6S+EWZsV3aTTrPyG7YycZ
n9cHNEfc4Hhl7gxvYgJXQR6QgoX3U7feJ9nqPqROsilPyrTUkkJa6i8VTSN9DCAN
5JCYLbkJRsWxQ0iQK3NDkRSHObqxaqywdMWIysZ2TUhnLhnG8Gs=
=96EW
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--
