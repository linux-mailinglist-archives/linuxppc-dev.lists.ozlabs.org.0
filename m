Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D63F9178379
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 20:56:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48X7740g0FzDqTd
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 06:56:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=the-dreams.de (client-ip=88.99.104.3; helo=pokefinder.org;
 envelope-from=wsa@the-dreams.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=the-dreams.de
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 48X75959kYzDqP4
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Mar 2020 06:54:35 +1100 (AEDT)
Received: from localhost (p54B3308A.dip0.t-ipconnect.de [84.179.48.138])
 by pokefinder.org (Postfix) with ESMTPSA id B92872C0872;
 Tue,  3 Mar 2020 20:54:31 +0100 (CET)
Date: Tue, 3 Mar 2020 20:54:31 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] macintosh: windfarm: fix MODINFO regression
Message-ID: <20200303195431.GB6555@ninjato>
References: <20200303125046.5157-1-wsa@the-dreams.de>
 <87d09tw9is.fsf@igel.home>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cmJC7u66zC7hs+87"
Content-Disposition: inline
In-Reply-To: <87d09tw9is.fsf@igel.home>
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
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--cmJC7u66zC7hs+87
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > sound/aoa/codecs/onyx.c
> > sound/aoa/codecs/tas.c
>=20
> These are loaded explicitly via request_module (as snd-aoa-codec-%s).

Good to know, thanks!


--cmJC7u66zC7hs+87
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5etfcACgkQFA3kzBSg
Kbayzw//YsWK4+DusvCfptElHxJY7dRalfYF/ddNNzqZ4WXLEEVSPsXY96IS27PB
hEoC0lrIxcW6bIlAzZAIFmeJtx5zD+REfK/nPqrynsGg7o0yAxBSqsqDRD72+rVZ
DRzdKcSaUqDEb/5ndSpmBtHQ/MAt/mro/hOVkcICGIlxL5UdeahE9Ls3ktXtAVYc
rZ6b+1ImdKgwvJ3rKvsap1rnZPnhlMYxLkWgem+D8wD1bdana+lS4FjD5R3QqE89
0FC/e3vCzwq1t034V1ivywroTcL+UJF3u07BAZjaWh/l0v6Cnw7HMAXdqN8uISLi
NmU4ZSArp4+haD+eJQsWZkhxTP4Swvo2WHDzjv9QS74L/yb0SuXs2pz1Ppg1nVpN
taKu+IAbVZPEP7Ndz7CoX/1/cC+TfhiA1V9M1jM+olZL7lBLWDIrLhjzbzTSESb4
23zTtX7JQ/XwKyCSVHiDO4YJaalRiItmaZfTZB619TlhzqKQ1iH+wuD5mXEi3l2H
M1gGZmaAKtBZzL9JOwsoEOtltr9xPEnrWaw8r42kVyLx2iUcPyg+XP3ijDJyuebv
YKiL3GxAqF45tJsjBt5CfosxRW1eofmnP3Bx980Ibxpzv4xxQvq5PgYQ5yJ3Ue+l
Aeo+yd9rWUPIzpRhngwYPetzRSjN3Jr7NwWe5VMI7bR+8EV0yn4=
=QPwo
-----END PGP SIGNATURE-----

--cmJC7u66zC7hs+87--
