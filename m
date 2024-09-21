Return-Path: <linuxppc-dev+bounces-1505-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C053297DBBB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Sep 2024 07:16:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X9ctq4p6Gz2y8Z;
	Sat, 21 Sep 2024 15:16:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726895811;
	cv=none; b=WCrOfkH9YpUh/29ohBs6x41qkhPmgXqqRBycMVYdpd68llRBHQLniU1MYvCdOcar8G7KGatziADUN+evSITnJQ4TdWnWeMfezeE2BSTsH3nzSWCjOznPV+3MV3S5kEj9vRkJjc5OvjGd2gBZctoMfK6TMQknUa+eEWDXUUeX7J29Xv3agKUVXUwd4mvuGDVb3IVDYn9LOIvlvhOkqNtmR7FLRZjBh7qBxsmQfKekcnoFZTcn92qqFuQce+TjGg5rn5XEHsVE90PrvCkmt6s81v/06gSRrI4fwmk5ThnEl1zT9Q8aOAmSt5exR5lgSr42ajUyQZA8vEocA7DsJV1w2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726895811; c=relaxed/relaxed;
	bh=qyx/dHX7YUt7tYPdVE5RWKeFUCXghcIpaCAzPuASVKA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UlnQfYHMwFiTcVy6bcX1bmveelzs0HECSDh6+WWzi07ugsroA1gjDboPgSrSPW+Z5P02D5wDnEvbj9+FYrwBkUYFFUGsvWbhRENeeqkx3J3hf2+xXQ9hAGxVjLOtC90a9TJZfuL8vxjPg8eAFrLrk5ajlzCDaUY8DTn0Qyt695acP1PNGkySnJaat70ZeGeF2OafjH2t9dbdE2EDlfNI4LNTEorIZQKSqtxeBBi36SRHS9sKBVRXLV3AzfnGZjFx17bOZD9mqnmVrha4DB3xqLTNfp+J+YxcEiNPHT2ICnkjgDOPZYU/pC/99yEasgGBvX8ECf0quVN1vfEBeGfm1w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=Id95Uh0T; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=Id95Uh0T;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X9ctm0VNnz2xxm
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Sep 2024 15:16:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726895806;
	bh=qyx/dHX7YUt7tYPdVE5RWKeFUCXghcIpaCAzPuASVKA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Id95Uh0TMdJVZiDEBKIrjFEpwJCF9A1H/c/voUcjFf9gh5bnQcyoiu77PbCHWvM3W
	 07SUJ5XFJ8nnlFheNhmmfp67Edcp66LSRIN+sZtk6Dx7qT/FKHKN4U2uBdr9ptL2TI
	 i2l/2ihF0fwG2U1K7e+zjqDAVcGdzywGlICGZSYVoPd08ashLz7hRLEG9uP0eKD4et
	 WnrPQk8az/kxSzG1Zcx0HtL+3UahEY0p1xW2HUb5SOlfBnB+84L/VJkKd+7CUttfHS
	 hkQjphjGLYEu1d41Yc+Lds62wBd7ORIZgL4MmDam0uJX2o0Pjuqb67bI8Vw2P9H9uV
	 988q5puR1c9TQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X9ctj1Syrz4x8Y;
	Sat, 21 Sep 2024 15:16:44 +1000 (AEST)
Date: Sat, 21 Sep 2024 15:16:42 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kamlesh Gurudasani <kamlesh@ti.com>
Cc: Danny Tsen <dtsen@linux.ibm.com>, <linux-crypto@vger.kernel.org>,
 <stable@vger.kernel.org>, <herbert@gondor.apana.org.au>,
 <leitao@debian.org>, <nayna@linux.ibm.com>, <appro@cryptogams.org>,
 <linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <mpe@ellerman.id.au>, <ltcgcw@linux.vnet.ibm.com>, <dtsen@us.ibm.com>
Subject: Re: [PATCH v3] crypto: Removing CRYPTO_AES_GCM_P10.
Message-ID: <20240921151642.60b89e86@canb.auug.org.au>
In-Reply-To: <87ldzmll80.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
References: <20240919113637.144343-1-dtsen@linux.ibm.com>
	<87ldzmll80.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jhSltXngbv+WsRpVn7yvHAs";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/jhSltXngbv+WsRpVn7yvHAs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kamlesh,

On Fri, 20 Sep 2024 15:07:19 +0530 Kamlesh Gurudasani <kamlesh@ti.com> wrot=
e:
>
> Danny Tsen <dtsen@linux.ibm.com> writes:
>=20
> > Data mismatch found when testing ipsec tunnel with AES/GCM crypto.
> > Disabling CRYPTO_AES_GCM_P10 in Kconfig for this feature.
> >
> > Fixes: fd0e9b3e2ee6 ("crypto: p10-aes-gcm - An accelerated AES/GCM stit=
ched implementation")
> > Fixes: cdcecfd9991f ("crypto: p10-aes-gcm - Glue code for AES/GCM stitc=
hed implementation")
> > Fixes: 45a4672b9a6e2 ("crypto: p10-aes-gcm - Update Kconfig and Makefil=
e")
> >
> > Signed-off-by: Danny Tsen <dtsen@linux.ibm.com> =20
> nitpick
> checkpatch complains
> Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>=
")' -
> ie: 'Fixes: 45a4672b9a6e ("crypto: p10-aes-gcm - Update Kconfig and
> Makefile")'
>=20
> There is no rule for 12 characters, but it is generally preferred.
> I guess it is just a typo for you as you have correctly added other
> Fixes tag.

It should be at least 12 hex digits i.e. more is fine.  It is possible
that some commits need more than 12 hex digits of the SHA1 to be
uniquely identified in some git repositories already.  I guess
checkpatch needs a patch.

> Also, just to understand,
>=20
> "A Fixes: tag indicates that the patch fixes an issue in a previous
>  commit. It is used to make it easy to determine where a bug originated,
>  which can help review a bug fix"
>=20
> from=20
> https://docs.kernel.org/process/submitting-patches.html
>=20
> should there not be just single Fixes tag? as bug originated from one
> commit, may be the commit that actually broke the functionality.

While we generally prefer that a patch only fix one bug, it is very
possible that the bug may have been introduced in more than one commit
e.g. in different files.

--=20
Cheers,
Stephen Rothwell

--Sig_/jhSltXngbv+WsRpVn7yvHAs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbuVroACgkQAVBC80lX
0GzFnwf/e23oe9Qw1Ca7dvh9xkyu30hNMVeham1rhS6bKpc17gT0szzMz8eWWdln
m4DiWnBXv3x7L07rJ22+fiEtO9N6KZMKW5PWJzEQElsBzmMJfrSwgo/eUnODTZZx
3LpE0RV0scL9+XdTaM1nOjy5nOHXG33QR3llmtXuJ/PG+RrEARjBXctl6tF/8uzp
UI8R/NmiDozwvMXb+xGaTfxemK9CDZX0HRgY28XdRlz+Tz8j3FwEJQ7vdAJanzgp
poRsA7urS2fg2KQBRVFL2oFaW/9OVWuoYmB4eXF971g0qOyBCMg8smG5n4TdRKsM
8uHloMPT9uun/CL6E4onHEIgjddfvQ==
=S5Bm
-----END PGP SIGNATURE-----

--Sig_/jhSltXngbv+WsRpVn7yvHAs--

