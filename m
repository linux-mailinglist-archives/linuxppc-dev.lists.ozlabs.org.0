Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CDC128560
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2019 00:10:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47fkx13zH2zDqv8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2019 10:10:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47fkv91XXczDqX1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Dec 2019 10:08:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gibson.dropbear.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.b="N1wG2dW7"; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47fkv86Pvzz9sPT; Sat, 21 Dec 2019 10:08:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1576883316;
 bh=CrgwIo+z6Xbt37TQ0wVcGB5nq58bG6XUDpJcLv4nhuY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N1wG2dW7B/c4kn1obJ4EB2HkH4jTJiU4TulIRHmAweTg31SxDrtOWSF90bn4m/EbP
 BsGaavVgzXUcEpN6jSjTMHKcgHUZg+0GwrVdZHL7O9PCFb785a7R4E+f+KG3WIHYOa
 KN1mVuvZCmWktXlaNG7LPf8Qfj1ljTWcQ7aBl+HQ=
Date: Fri, 20 Dec 2019 23:21:44 +1100
From: David? Gibson <david@gibson.dropbear.id.au>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [Qemu-ppc] pseries on qemu-system-ppc64le crashes in
 doorbell_core_ipi()
Message-ID: <20191220122144.GA15511@umbus.fritz.box>
References: <1553850306.nyv11r9iej.astroid@bobo.none>
 <20190329113109.3a9bd24e@gandalf.local.home>
 <1553912871.ce5mzizoek.astroid@bobo.none>
 <20190401083827.GE11158@hirez.programming.kicks-ass.net>
 <20190406000611.GA27782@lenoir>
 <1554801792.ruzup3dxhe.astroid@bobo.none>
 <7a5b63a0-2bf5-60bb-8678-b7b36671a29c@zx2c4.com>
 <871rt0mql5.fsf@mpe.ellerman.id.au>
 <42d35390-0661-8d1e-d335-03186ee7ec93@kaod.org>
 <CAHmME9phu1QZSdX55sneJpFsSg0M8_xbP2hAb1ha0CYsRzqTUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Content-Disposition: inline
In-Reply-To: <CAHmME9phu1QZSdX55sneJpFsSg0M8_xbP2hAb1ha0CYsRzqTUg@mail.gmail.com>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Nicholas Piggin <npiggin@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 qemu-ppc@nongnu.org, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
 Frederic Weisbecker <fweisbec@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Frederic Weisbecker <frederic@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 20, 2019 at 12:32:06PM +0100, Jason A. Donenfeld wrote:
> On Thu, Dec 19, 2019 at 2:08 PM C=E9dric Le Goater <clg@kaod.org> wrote:>
> > There is a patch for msgsndp in my tree you could try :
> >
> >   https://github.com/legoater/qemu/tree/powernv-5.0
> >
> > Currently being reviewed. I have to address some remarks from David bef=
ore
> > it can be merged.
>=20
> Thanks. I've cherry-picked
> https://github.com/legoater/qemu/commit/910c9ea5ecc and can confirm
> that I no longer receive the crashes. QEMU 5.1 or 5.0.1 release, I
> guess?

Unless the revision takes much longer than I expect, I'd anticipate it
in 5.0.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl38vNYACgkQbDjKyiDZ
s5J2Ng/8DvIkXyKX5vxO0srBYowhpjrEbhXvpGIIUcbzzOXdZYHuqVWX8QosHKOT
jZI1YxZh6G1y7fkeOyUCpCgGjzxAfy+3NcHPFudoVBSSvs2jwabT/Ewqjkd+b4eL
9APQK+n7toJvJ1PnCBgaj0aUSj0XcQy6xBsxg/Gpv7V3I9lx0Al62W+/Awv6lfTz
RMTbGi3f+KPVJrhRiPppXF+1xduwbyMdkCqpX/cb8/LcAJQNjOJLjo6Hr69HBYeg
tHGnARkEwzol3zmsURwavun/JiAxzWlBVpvw6M9fGUZm/ql4nzGT0rhpjEk9A5Ih
AjQ90h0YRWX1bun4v461GdcMdHjB/rzk/Ngp/dYnKiHpp6ylPXQsTxQYsghPK/c/
4yYhyUzDN20Nq6j26rJPgoaBhhS2/f3TMkQFugEUvALvYi5CzH77Umpv8qY0pioR
7a4Gp8S1XG9euyPbQiClkgXR+n2idnB+3CdjXgUXne2oLMEMdVGgioVO0Fjie0kf
MJf2fcl3aKBmzUiBTOIS5E2XQFZ0fsiTORQbLhl3ylA4TvFR/IrvqMtEphpSceCT
DVDiokUqbuK7E75/sdZEItkEpWlrlSVy6f0JQQ6QYbxwgjKyjZww0Q6UBut+biZU
JoBidW5MXPmgVB1GfdHmMvz7jakK7ge5HFJP/j1SrqXOGgo5Bg4=
=CkEm
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
