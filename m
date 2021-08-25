Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4B63F7236
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 11:47:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gvh2x5Ggnz2yQ6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 19:47:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=dBR+SZEo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canb.auug.org.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=sfr@canb.auug.org.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=dBR+SZEo; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gvh2D0YDTz2yJq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Aug 2021 19:46:26 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gvh230lxXz9sW4;
 Wed, 25 Aug 2021 19:46:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1629884779;
 bh=O63FVEis+tfsPeNV+aZkqfqyT140XVNRKuAvAnxilVk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dBR+SZEoTC2fZZR1XrORjpCVP8v/BioZEw00rd3gOR4HLIFhY/KZvFIPnzlYaOvVB
 zg5W9JXr1F1J6D+CjROSFahTZE4sQpfqE+wDUphBmn39Xv8fzIQ9RuB6nF8MylIduT
 8T4oedvc2I3YeyC76q/NVstxGZxQ9E/34hXWhqC53fJ1L9yLXnwawZSQUiTT25STFT
 CWrmU+l4A9SmrS7Sl5ygaMIjlkl0NoMG/FZTed0ryBz94amRVjSZM14fx3sv9i79OH
 aMGS7LcecpyBijV2KRn9CzJEUfyhriX6XZqjVkCCI0+M6M1ZjzjRpB+6TCUS9twKdr
 YNc2vJXEr4XcQ==
Date: Wed, 25 Aug 2021 19:46:17 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] powerpc/doc: Fix htmldocs errors
Message-ID: <20210825194617.77a3d2cd@canb.auug.org.au>
In-Reply-To: <20210825042447.106219-1-aneesh.kumar@linux.ibm.com>
References: <20210825042447.106219-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XGJE0Wky955j0SYUmG16wvf";
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
Cc: linuxppc-dev@lists.ozlabs.org, Jonathan Corbet <corbet@lwn.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/XGJE0Wky955j0SYUmG16wvf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Aneesh,

On Wed, 25 Aug 2021 09:54:47 +0530 "Aneesh Kumar K.V" <aneesh.kumar@linux.i=
bm.com> wrote:
>
> Fix make htmldocs related errors with the newly added associativity.rst
> doc file.
>=20
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  Documentation/powerpc/associativity.rst | 29 +++++++++++++------------
>  Documentation/powerpc/index.rst         |  1 +
>  2 files changed, 16 insertions(+), 14 deletions(-)

This fixes all the warnings related to this file for me.

Tested-by: Stephen Rothwell <sfr@canb.auug.org.au> # build test

Michael, it would be good if this could go in soon as without this
patch my "make htmldocs" run livelocks. :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/XGJE0Wky955j0SYUmG16wvf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEmEWkACgkQAVBC80lX
0Gzz1wgAnAfLdcryNfc8ngKkAPNu1O02a5NCYRqx9is8aSBY8a19g1BYA6Dp6AkO
/2dHiBWX1T4w2foc4gbpga2jsuKch9XkMvRaAOSoQuiX6zOG3cfMDfe0mbVVkKQZ
fqiZecnyGYqGJmrRt9ozpbBNKzZNVjN2aSPsLIuWcLGy88VEtLVmFVuNwD1Q7cw/
aJBQ6gL0uwlQ6+1frv+zlnh+ZSkeBlwbgRM8htAZGKnRBXlzW2NCMfZUL+3jCDEb
vKGX18em/rba4CfBcw2RhJD97rSivI7V77iO+2NQW0Aj/mtc9HZwPcA8KflqcwWk
s8Nxb9mpiW+MLmMI5WxcV5TQpiPVNg==
=rAhP
-----END PGP SIGNATURE-----

--Sig_/XGJE0Wky955j0SYUmG16wvf--
