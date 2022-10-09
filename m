Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1D05F8FE1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 00:17:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MlxHT0nZzz3dsm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 09:17:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=RVxnEoNn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MlxGY2NN9z2xJ8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Oct 2022 09:16:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=RVxnEoNn;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MlxGS5W22z4wgv;
	Mon, 10 Oct 2022 09:16:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1665353793;
	bh=5JXiyZ2rBUBWg3NdZnRUOBYGxdaJVI3zNREgAnnnSGE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RVxnEoNnLYmLN/XeKRBBN0MbOXQ7XdNGTwIFR7MAqcDRQC+OXtn6AWacO5gOP8gJP
	 pairn8Mfsct4dLSrLqwliTM9oUgUXDPB2m04UNsCzJncJ9IUO6xkSqOLJj2qfCIFnj
	 5w2iCiFpfYsFHYY4KCHtxRQ//JycHRaIsKMKx+PAPPBdMsWizVTQu9cfsAO8reCMp6
	 SJMo7QCx3AKrCy+OT91tXDROL4CJMvHvAZZ5KfPsVTGb5LRepEisAPHmuQVDfLo1hI
	 8RvipvyxQorPHaOXKeGeqvacFqTPPAlzRZ9nLR7VGKgepxnV7rN0SvmxCUnDJ0xmJF
	 0gXpZ1KGBKcbA==
Date: Mon, 10 Oct 2022 09:16:14 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: linux-next: manual merge of the powerpc tree with the kbuild
 tree
Message-ID: <20221010091614.20a89f56@canb.auug.org.au>
In-Reply-To: <20221004091205.2677b823@canb.auug.org.au>
References: <20221004091205.2677b823@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.km7qOSO.2uHzBoxFdOk.nC";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/.km7qOSO.2uHzBoxFdOk.nC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 4 Oct 2022 09:12:05 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> Today's linux-next merge of the powerpc tree got a conflict in:
>=20
>   arch/powerpc/kernel/Makefile
>=20
> between commit:
>=20
>   321648455061 ("kbuild: use obj-y instead extra-y for objects placed at =
the head")
>=20
> from the kbuild tree and commit:
>=20
>   dfc3095cec27 ("powerpc: Remove CONFIG_FSL_BOOKE")
>=20
> from the powerpc tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc arch/powerpc/kernel/Makefile
> index ad3decb9f20b,1f121c188805..000000000000
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@@ -118,12 -116,12 +116,12 @@@ obj-$(CONFIG_PPC_E500)		+=3D cpu_setup_e5
>   obj-$(CONFIG_PPC_DOORBELL)	+=3D dbell.o
>   obj-$(CONFIG_JUMP_LABEL)	+=3D jump_label.o
>  =20
>  -extra-$(CONFIG_PPC64)		:=3D head_64.o
>  -extra-$(CONFIG_PPC_BOOK3S_32)	:=3D head_book3s_32.o
>  -extra-$(CONFIG_40x)		:=3D head_40x.o
>  -extra-$(CONFIG_44x)		:=3D head_44x.o
>  -extra-$(CONFIG_PPC_85xx)	:=3D head_85xx.o
>  -extra-$(CONFIG_PPC_8xx)		:=3D head_8xx.o
>  +obj-$(CONFIG_PPC64)		+=3D head_64.o
>  +obj-$(CONFIG_PPC_BOOK3S_32)	+=3D head_book3s_32.o
>  +obj-$(CONFIG_40x)		+=3D head_40x.o
>  +obj-$(CONFIG_44x)		+=3D head_44x.o
> - obj-$(CONFIG_FSL_BOOKE)		+=3D head_fsl_booke.o
> ++obj-$(CONFIG_PPC_85xx)		:=3D head_85xx.o
>  +obj-$(CONFIG_PPC_8xx)		+=3D head_8xx.o
>   extra-y				+=3D vmlinux.lds
>  =20
>   obj-$(CONFIG_RELOCATABLE)	+=3D reloc_$(BITS).o

This is now a conflict between the kbuild tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/.km7qOSO.2uHzBoxFdOk.nC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmNDSC8ACgkQAVBC80lX
0Gy6egf8CKc2goJR5uR31lWy7MtzaXaEXtSJhagzpfue8Ykt1sikkbMLJt+i2WVt
zK2/ehfB9wV6o37xfSdeL3slBnX7bkhqEI6oolypnozHXRArTYbtCO1uVs0cO2kR
+vR1h/TzNcApDlPnZ6DKEjpVDAv3uQyFFuMy9CrTR8lq4ZR7xL/5l9ksfcd02vOO
+aSrN0UDZ05BeFF5AzQs7wBl4iBrDqr+1atpqtxxSmyAJqs+yT2w8mjov8+u2x2p
HUL/F+PepQhGYLFY+M1x56VYH8BLx2SPBc1wM+LZtfGPIYCV/Aw8Ma8i6VKhV2a1
hnOJqR8ie93KM+zhra1hgZrxlurK+g==
=ID1k
-----END PGP SIGNATURE-----

--Sig_/.km7qOSO.2uHzBoxFdOk.nC--
