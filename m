Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9268317F365
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 10:22:08 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48c8k25V0KzDqTd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 20:22:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=the-dreams.de (client-ip=88.99.104.3; helo=pokefinder.org;
 envelope-from=wsa@the-dreams.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=the-dreams.de
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 48c8gG0f7yzDqQg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2020 20:19:37 +1100 (AEDT)
Received: from localhost (p54B33196.dip0.t-ipconnect.de [84.179.49.150])
 by pokefinder.org (Postfix) with ESMTPSA id 36CBA2C1EB6;
 Tue, 10 Mar 2020 10:19:36 +0100 (CET)
Date: Tue, 10 Mar 2020 10:19:35 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: powermac: correct comment about custom handling
Message-ID: <20200310091935.GB1987@ninjato>
References: <20200225142613.7169-1-wsa@the-dreams.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/NkBOFFp2J2Af1nK"
Content-Disposition: inline
In-Reply-To: <20200225142613.7169-1-wsa@the-dreams.de>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--/NkBOFFp2J2Af1nK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2020 at 03:26:13PM +0100, Wolfram Sang wrote:
> The comment had some flaws which are now fixed:
> - the prefix is 'MAC' not 'AAPL'
> - no kernel coding style and too short length
> - 'we do' instead of 'we to'
>=20
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>

Applied to for-next, thanks!


--/NkBOFFp2J2Af1nK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5nW6cACgkQFA3kzBSg
KbZo7RAAlKU05fSDBuu5f+b9c5Ayd8ND1JVgOFlLm7CrMI729HVJSnWoPYJA53hr
IzunFX0sVieS4TF3UAG4yePmJ1ZQ+vdPnXR3LrhqSBQTCKVGEogvHF8sI6AsESkg
s+4G7b9sWdgsU6dcVbpOyze1tH694TK2I0h581cMMSnCXyoSIQcVHRr3Oy3QfeQF
vYYRv6Ew+Ag5dkBGIoqbCm0DHvLzaU2CI5Ni3cIADUmHZ8IRU4rhR04Cj29TT3jt
dKHEWybzfJO01GFMa5vlvRfgE5bTlNlM7z3bmj+7QZO/F6GvqH7h0sl/tLBgGoRU
ALoT0EkjttmnzH73bMwDt/WKWMSR8wnJs1Mp9sEPnefraBvZBSRDydz6ZynT895P
s6OtWv7QdfuOnktj+zHxYyduVHSWh8U6QS+kPRls5KV5ohDCSpomAHOnq41RMvk5
JJFlPxivN17td07xM2Th9Vd4uO+iNEvowIKjzTcFRzm8K8JZ1Vu55Bc6liN9dpIb
yJl9OSHKO5q60b0s/OMgUqmnGdGesELnnr/w5OqO7rdvWlnxuW+XIrw1ZGubKGzq
6+vXbuXcXIFzZiYc4TDvAlTvkcFp5QCHRniCcrXSXUhCJlNUJvqmxi1jpFzR92GC
ekniJBTj/ZNmbtGCtg8GUz/s1TWhYICTmmzFGOfhHfGy14Ne5f0=
=2z/6
-----END PGP SIGNATURE-----

--/NkBOFFp2J2Af1nK--
