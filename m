Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 564F95369DD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 May 2022 03:39:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L94972QHpz3byX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 May 2022 11:39:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=uqGGyNIe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L948T2HHXz3bZy
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 May 2022 11:39:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=uqGGyNIe;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4L948P2zPsz4xD2;
	Sat, 28 May 2022 11:39:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1653701942;
	bh=HKFcVVm5/7LSgaCjFHNxFATdWLHCcMy+vmEARcktGrc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uqGGyNIeZbnraYu02ou+8otrJfF4kDXT6FCavyWxCcCVbIJSwW6ovHn1y36/XlUH+
	 bjEEiBj6RS5oB8iLGjybz943Mz9W1coi1IuPF8Yh6M+eEJrRwYwdyMez9Gly1DE6C+
	 mkb17Mz9K1gI77v5KrO49KyXvnWbK0QnZOdmhIY5P66jpdxayw9ZTuMK+PGDgT7EBE
	 +gfvYz5tWsAE9OI/zgdi3X+KEmdaAOE1zN5rvEZll+qtAjoLQUTSd5tJO1sWcnMURh
	 MZRmJiepUmtlIL4yOPSznVsBm9pw91e6d3JLA6kK8DOnWjlvpvk2/3H0S/1pgw0bC6
	 aY712kSMZG95g==
Date: Sat, 28 May 2022 11:38:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: manual merge of the modules tree with the powerpc
 tree
Message-ID: <20220528113859.297d7b9c@canb.auug.org.au>
In-Reply-To: <20220520154055.7f964b76@canb.auug.org.au>
References: <20220520154055.7f964b76@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QA8=bCrTax+kKwceSFMPgK=";
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/QA8=bCrTax+kKwceSFMPgK=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 20 May 2022 15:40:55 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the modules tree got a conflict in:
>=20
>   arch/powerpc/Kconfig
>=20
> between commit:
>=20
>   b91d4eea5bff ("powerpc: Book3S 64-bit outline-only KASAN support")
>=20
> from the powerpc tree and commit:
>=20
>   eeaec7801c42 ("powerpc: Select ARCH_WANTS_MODULES_DATA_IN_VMALLOC on bo=
ok3s/32 and 8xx")
>=20
> from the modules tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc arch/powerpc/Kconfig
> index dddace39d005,0b7bcfa63d0d..000000000000
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@@ -158,7 -157,7 +158,8 @@@ config PP
>   	select ARCH_WANT_IPC_PARSE_VERSION
>   	select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
>   	select ARCH_WANT_LD_ORPHAN_WARN
> + 	select ARCH_WANTS_MODULES_DATA_IN_VMALLOC	if PPC_BOOK3S_32 || PPC_8xx
>  +	select ARCH_WANTS_NO_INSTR
>   	select ARCH_WEAK_RELEASE_ACQUIRE
>   	select BINFMT_ELF
>   	select BUILDTIME_TABLE_SORT

This is now a conflict between the powerpc tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/QA8=bCrTax+kKwceSFMPgK=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmKRfTMACgkQAVBC80lX
0GwzwggAmGNElexEU9XYGMeiO+b2tPs0w8Zd4XOTq48P6+W4GzT5QG3Z4e9wXk6F
eujoSC42242bzODq/FmbiGFTsFX9vB8WG+GG4tNm95xHzBoV6eM88con/0ERWhrA
T5yUbgglJ6IU+bDMD4Rf+w8Cp4lohNmHwBFHXch/YypBSa/oWLjEC27j+O+4BnUz
QxJ+8XGeBRCKzFTEW6BgcfvbOmgrUPFTOueKmA2k4eDP/qlc3huu9eusreK5EGCa
7y61VP+U/KL98A8+2KjOPNl4jdx5uULBXdSQjAg5uQyoqqVn05p6OIWVn4JAdH82
wkPwQ5OwsuTDODuwSWG3Ntsbhx57KA==
=gU3f
-----END PGP SIGNATURE-----

--Sig_/QA8=bCrTax+kKwceSFMPgK=--
