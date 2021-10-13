Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB90A42B78B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 08:38:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTjY54hMyz30GN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 17:38:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=tjArxxti;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTjXN0lC2z2xX2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 17:38:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=tjArxxti; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HTjXK2t0qz4xbG;
 Wed, 13 Oct 2021 17:38:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1634107091;
 bh=vG5wu8rK/bYN0SCJfvAhVNcO15ZTCrwihNZzPlGYioU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tjArxxtiWKW8QOQvHragrEHJbtBkAH6yvJiBrlCtpKo/Jvxv34mapJ9Bk9B7iT5Xu
 gHv9bYuIQ0YQpAYePJAC42B3GQEACJrC0vFeeJ9jUlGYXru4RHoODwhA6tNYJ1QsE4
 qIqSxq6Gbx0cjLzqskoflQpITzbv8NeKPLpb1UPueCrm6TM9mVdmJDeKwnMTWLcJ6t
 8cOA5cuh+NmKK3Jl2D7VAA5VEi0rwAIwx5rTMDnqb8ujb/NjkN2dFC8/TCgJkM6vHJ
 hDkGDeVBrlYYIEsfAPr1kjfKBJ5KwiGiKyDFlhCIJzNlY5ebt8QmgzkosjPGKGz30m
 M7qszNN/ZDtXw==
Date: Wed, 13 Oct 2021 17:38:08 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH] powerpc: dts: Remove MPC5xxx platforms
Message-ID: <20211013173808.7ab92035@canb.auug.org.au>
In-Reply-To: <20211012153456.2844193-1-robh@kernel.org>
References: <20211012153456.2844193-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hNT9L3ZDbI5k34wFOdCx2dr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Anatolij Gustschin <agust@denx.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/hNT9L3ZDbI5k34wFOdCx2dr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Tue, 12 Oct 2021 10:34:56 -0500 Rob Herring <robh@kernel.org> wrote:
>
> The mpc5xxx platforms have had dts warnings for some time which no one
> seems to care to fix, so let's just remove the dts files.
>=20
> According to Arnd:
> "Specifically, MPC5200B has a 15 year lifetime, which ends in
> 11 months from now. The original bplan/Genesi Efika 5K2 was
> quite popular at the time it came out, and there are probably
> still some of those hanging around, but they came with Open
> Firmware rather than relying on the dts files that ship with the
> kernel.
>=20
> Grant Likely was the original maintainer for MPC52xx until 2011,
> Anatolij Gustschin is still listed as maintainer since then but hasn't
> been active in it for a while either. Anatolij can probably best judge
> which of these boards are still in going to be used with future kernels,
> but I suspect once you start removing bits from 52xx, the newer
> but less common 512x platform can go away as well."
>=20
> Cc: Anatolij Gustschin <agust@denx.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Sending this out as a feeler to see if anyone cares. If anyone does,=20
> please fix the warnings.

Thanks.  However .. :-)

FATAL ERROR: Couldn't open "mpc5200b.dtsi": No such file or directory
make[2]: *** [/home/sfr/next/next/scripts/Makefile.lib:358: arch/powerpc/bo=
ot/dts/digsy_mtc.dtb] Error 1

$ grep -wrl mpc5200b.dtsi
arch/powerpc/boot/dts/digsy_mtc.dts

missed one :-)
--=20
Cheers,
Stephen Rothwell

--Sig_/hNT9L3ZDbI5k34wFOdCx2dr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFmftAACgkQAVBC80lX
0GySTgf/SwHWqYw3xEIGHbUBCpLmTzIJWw0cXaAN8VFo6Lpsb/H7xKz/Cu3fUYyX
Z7veE1EKdxvZfcnE4rwSHEL8TvtLp3U3yAls5foblypO301bXEISgNaYxAHKSKeV
S7D0KIY0U8fcSaM0HrBhwxTECEBGJtSwf2K/I81GlIKO8h+dt6ajec974Ku8mMMc
LWukJfatx9F0Ex7prCIlJA1S/gnw8RO7x0GTaF8mM4ULay59UQbn2W+5W0MEs58g
zyQFj8yL5OqaV6ZlzPhGIKQc1DLTPlQLvI7iuF2CxDKomoHvTPSiGqRtd/p3qnrt
KR+wol1v6zuUZu7DClfczJuiGJ3vnw==
=oWcO
-----END PGP SIGNATURE-----

--Sig_/hNT9L3ZDbI5k34wFOdCx2dr--
