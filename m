Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E138D73E5
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Jun 2024 07:21:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=kQKqP7vz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VsQFv4VQRz3cRr
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Jun 2024 15:21:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=kQKqP7vz;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VsQF70qlZz30PH
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Jun 2024 15:21:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1717305664;
	bh=2DwQizc09vDj0hOjBYqRErLzcC3C4KoGCg/eObaIELQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kQKqP7vzTVSHQ0UhYzQS+fJfdSjUIRTz68+/tuhR49fK+SsRzk4Vw1vNGEsXbfNB5
	 fGOuy6Yiiw227C0/JWf+ik0edpxXuEdM+AvWSavHHfWZD1Y/E+tSesT+4lCfVay0rf
	 GYBiJIyk8fpTM7sp8KrCOgYAb1B+4kMu3nJ/M1wMgL/rwkcIIQqfVJupqnETH+5OQk
	 fr0RpL+/uT3OZ7AOOvH/hKQmDZTQVgcm1mGP7x4OTp/AOVNGiRNzwBawuVslTZSSuA
	 YzsPafN1/y8kCjWABXqB0SrFohVLUvelemj9OTG7dr2u8f7ft6SGR+IyZavSh02sFo
	 izYrZmMzumNmQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VsQDv4xCLz4wcg;
	Sun,  2 Jun 2024 15:21:03 +1000 (AEST)
Date: Sun, 2 Jun 2024 15:20:58 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: Please add powerpc topic/kdump-hotplug branch to linux-next
Message-ID: <20240602152058.276df8e9@canb.auug.org.au>
In-Reply-To: <87mso42pag.fsf@mail.lhotse>
References: <87bk60ji79.fsf@mail.lhotse>
	<20240424074023.43932cca@canb.auug.org.au>
	<87mso42pag.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kx7e0nSXIXyfuOD1Yc5aE8u";
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
Cc: kexec@lists.infradead.org, Linux Next Mailing List <linux-next@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bhe@redhat.com, sourabhjain@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/kx7e0nSXIXyfuOD1Yc5aE8u
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Sun, 02 Jun 2024 09:53:27 +1000 Michael Ellerman <mpe@ellerman.id.au> wr=
ote:
>
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> >
> > On Tue, 23 Apr 2024 23:56:42 +1000 Michael Ellerman <mpe@ellerman.id.au=
> wrote: =20
> >>
> >> Can you please add the topic/kdump-hotplug branch of the powerpc tree =
to
> >> linux-next. It contains a series that touches generic kexec code as we=
ll
> >> as x86 and powerpc code.
> >>=20
> >> The hope is to have to get it merged for v6.10, so it should go along
> >> with the powerpc next branch in the merge order.
> >>=20
> >> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/log/=
?h=3Dtopic/kdump-hotplug =20
> >
> > Added from today. =20
>=20
> This branch has now been merged and can be dropped from linux-next,
> thanks.

Removed.

--=20
Cheers,
Stephen Rothwell

--Sig_/kx7e0nSXIXyfuOD1Yc5aE8u
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZcAToACgkQAVBC80lX
0Gw/4gf/Xpxz7iv8f7mNzqzlovFpBO0pdnSSU2Ui6uHaRbl5irBMzCK5n+S6JpKy
EFMO2NWyzrMI2g80hQjkve0Q5bygdABPAEjBJBMM1Dsp6sBgCZHU/hj8qnxfNh2c
ZVP2Jp90JdK37Iu8usPBJKTDX+OkX2l1dxcxiBjIOwGEI9UZ/gIvifoWlrSUFHb0
uKzGxKmsqUdc3wjY/f5MGgVaWnTK9Kr3Tj/iLFA+dvAbIkGjDbXEd7Q6XbWvg8A6
zPSsD/ph4RBfUOM26R3GcwGr8Su/wNm2qfG/0TcD3+a25j5DjBSjbetZxjav1fQr
sFqgwtONYNnL+JbVrmzNz8G5VlLosw==
=mtNi
-----END PGP SIGNATURE-----

--Sig_/kx7e0nSXIXyfuOD1Yc5aE8u--
