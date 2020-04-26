Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C25B1B8DF0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 10:33:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4991QX0vgRzDqjJ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 18:33:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=the-dreams.de (client-ip=88.99.104.3; helo=pokefinder.org;
 envelope-from=wsa@the-dreams.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=the-dreams.de
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 4991Nq4dP6zDqSq
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Apr 2020 18:32:09 +1000 (AEST)
Received: from localhost (p54B33954.dip0.t-ipconnect.de [84.179.57.84])
 by pokefinder.org (Postfix) with ESMTPSA id 77B902C01E8;
 Sun, 26 Apr 2020 10:32:05 +0200 (CEST)
Date: Sun, 26 Apr 2020 10:32:05 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Aishwarya R <aishwaryarj100@gmail.com>
Subject: Re: [PATCH] i2c: powermac: Simplify reading the "reg" and
 "i2c-address" property
Message-ID: <20200426083205.GJ1262@kunai>
References: <20200408100354.17782-1-aishwaryarj100@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="QnBU6tTI9sljzm9u"
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


--QnBU6tTI9sljzm9u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 08, 2020 at 03:33:53PM +0530, Aishwarya R wrote:
> Use of_property_read_u32 to read the "reg" and "i2c-address" property
> instead of using of_get_property to check the return values.
>=20
> Signed-off-by: Aishwarya R <aishwaryarj100@gmail.com>

Applied to for-next, thanks!


--QnBU6tTI9sljzm9u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6lRwUACgkQFA3kzBSg
KbYkkRAAj6PdEqcV4sRmSLua5W0PhREgd+RUQQZg1RlhYnXmuIBl9ZyY2yPCvOEA
VdI/VDX2iVDBNSbdsV5RbBKjuenjPMr7yi1AUXlB8TRwME//QtTTAc7XmAkHGQi3
ERFJS1umTANHaI5Axlrap2W3vlE2mFgE8rzK9Q+1c08QAlxoK4egQdLOlsZ8wbkI
GyB+lu1xhLsBaKBxErublzua26wa6BMVqIKcnHbtID1TmKnd7bHTO2ZKC00yzuGt
nN8BS5eGVm3Gd06nBt55C3wyxRVJonsE3hJFN534aZbG4fiS1ugvK0IrvDjBdyWr
gIsUCrSyOVeDORSdLx4y6NBUFPJw5AcmkipInfOCDRb9cqCaKw+Iha9BajpKX7qs
lHZCHBpfLvcb+JMN4ZgwbWsjRWSCd99nQvj/0EF0WuU8bvsznIVNwTmRF+anMFWT
TGwV/jM5k/u/cJ0YbF2jUhGMrMmqL4BYYWQh6zJMSefQac/llzkxN6Iye4Fzdybs
wuzQE6dR3ae9qiWAn6YTVkbnlClBULBI1ao1qzFdCfb5e1Pk291YIdHb8uX6uvH3
PWg9fm5pONMdaN+Zg+W9bTYESoraDkaL8dc3yGNi4BWJ85+6X/HDgoNNYGinZIS0
4FwchlniK/1tv0dSldHOzLkFgtfeK30xAJObEyDxFhH6CH9x2I8=
=xMJl
-----END PGP SIGNATURE-----

--QnBU6tTI9sljzm9u--
