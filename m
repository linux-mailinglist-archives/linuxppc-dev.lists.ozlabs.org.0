Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB713222D3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Feb 2021 00:57:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DkzdD0r81z3cTd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Feb 2021 10:57:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=DFaLskWm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canb.auug.org.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=sfr@canb.auug.org.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=DFaLskWm; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dkzcq5jNgz30Nd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Feb 2021 10:57:13 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dkzcg1GNRz9sCD;
 Tue, 23 Feb 2021 10:57:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1614038229;
 bh=U5lBCA5imuyW2behzsReiu6hPI8n+Ak13A6YUU800x4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DFaLskWmy/OS4jLTkkk904cz9Zy/OIMwybHJzqeApl7cO9HWUALQ/83LA2MPQWnkd
 ehbDOl1wn90NOocXeGnzn6Pk2HV3LYWaMtJLXQ0JgNd1pFJNlvzv2OZqvnrQaMWtYT
 Rf5isW2EZpj+qX/qYer8q4fKZ0DPcfwZUomYF1kD1ZLJM2UPhDh7WQGH/SJfd/ATpk
 DCix2kpNPs17MhyyOPJk4/+/E77/Ka8+QKauNZ9KPKcJkq2dzLtWws895kXzg4hMGA
 aqNG7NKRfVzP/KZYkvUcq16TsJFBLv4XYEWGMkjYxOEYFvSia71uOJxiMd47jcPU0H
 il8TbXv633qtQ==
Date: Tue, 23 Feb 2021 10:57:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: manual merge of the spi tree with the powerpc tree
Message-ID: <20210223105706.1a57be06@canb.auug.org.au>
In-Reply-To: <20210212152755.5c82563a@canb.auug.org.au>
References: <20210212152755.5c82563a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NYDmyQxYEcZbJPIOnMi8qJp";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/NYDmyQxYEcZbJPIOnMi8qJp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Fri, 12 Feb 2021 15:31:42 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> Today's linux-next merge of the spi tree got a conflict in:
>=20
>   drivers/spi/spi-mpc52xx.c
>=20
> between commit:
>=20
>   e10656114d32 ("spi: mpc52xx: Avoid using get_tbl()")
>=20
> from the powerpc tree and commit:
>=20
>   258ea99fe25a ("spi: spi-mpc52xx: Use new structure for SPI transfer del=
ays")
>=20
> from the spi tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc drivers/spi/spi-mpc52xx.c
> index e6a30f232370,36f941500676..000000000000
> --- a/drivers/spi/spi-mpc52xx.c
> +++ b/drivers/spi/spi-mpc52xx.c
> @@@ -247,8 -247,10 +247,10 @@@ static int mpc52xx_spi_fsmstate_transfe
>   	/* Is the transfer complete? */
>   	ms->len--;
>   	if (ms->len =3D=3D 0) {
>  -		ms->timestamp =3D get_tbl();
>  +		ms->timestamp =3D mftb();
> - 		ms->timestamp +=3D ms->transfer->delay_usecs * tb_ticks_per_usec;
> + 		if (ms->transfer->delay.unit =3D=3D SPI_DELAY_UNIT_USECS)
> + 			ms->timestamp +=3D ms->transfer->delay.value *
> + 					 tb_ticks_per_usec;
>   		ms->state =3D mpc52xx_spi_fsmstate_wait;
>   		return FSM_CONTINUE;
>   	}

This is now a conflict between the powerpc tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/NYDmyQxYEcZbJPIOnMi8qJp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA0RNIACgkQAVBC80lX
0GxdFggAlfolbgn5bq51VTyZ+1tyiXa8aezsnmPSQvuwqiHkoa3ZPjBersgqLAul
MH9DvEjqXpvRnFIqiDoeTmUA/tc4HYNncv+s/NrV+iBjwmtCoK5umm5kdwjgENGL
nh5BnuIRG9mFSo/KKrHhhJYgJ1PwLC0uto5ou7fw7eLf5RqYlK/mx1Gl/kBWojgx
NvxY8QE6iXyE+4pSaXo/rOR45n5VwrczgnKE8LsY79yNXfpYTPkQYoS/tGqAPh9K
m3KcGO9Y2co27EO8YPw1KXNAhDW3k5uNCAqoapnnPKcKnx1zrDOxMhflo8XMNPU2
LvtNSsm091rgYgW4c9s0JYQTLphTtw==
=GXwL
-----END PGP SIGNATURE-----

--Sig_/NYDmyQxYEcZbJPIOnMi8qJp--
