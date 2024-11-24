Return-Path: <linuxppc-dev+bounces-3538-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 982039D791F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2024 00:34:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XxQCJ6yHgz2yDl;
	Mon, 25 Nov 2024 10:34:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732491244;
	cv=none; b=DhA219eCQdxMqg2p4RByuUc/h+vHzcVoDr0qegFtQroqGv1g3u3BUfquvxwvkJOdIUIiKj29CQtA8J85+ifFWYkR6CnWE6i+r1EAHlSZvt/SYiMa7Fj2bDOjll+0RTCS+Y0R4tkMUngEyYapCQge7ACY4Dyz+zptuCsc7zgFl2ggcJJUNtmCCEEbETWANu6x/gmYh/dKg25E2H4KsJrJV0W+UAEWcGTBiM5AGXJkQd3qCyMuiZEuWdiPZ6C8PRCXe1ZwTk37jfpoJAnzvM8sdXy0rTU2kxAIsxYRku2uAdFz5tizP7z4VW5q0Ne1xnrYKrsDz6cvozTlgudZTM5Yaw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732491244; c=relaxed/relaxed;
	bh=3HZgDipoBDYjlrimLFeAzGIB/HpXZYSyIrDnhPg+UVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aDWRKOtUC3YIRXN0tDAF87PwFZ93zezzLwpv7DX/QC/EOXPHPVVf+2j/2gdi6kbnL1bPBompf7V+qxuweaFwH+z/I6X2Zam5bEFvVDAVgZPDAuVFYuUmLsfTdDTuf7fgCBvNjYBojRkZqtXIgoZx5mqxSjMJj3S6bmRmLBYcuMFA6ySa3ga1c1gtyl7nOHocS+33Th13aOw9rctIwbe6KN4yNnblzRj89OnSCr489+wilUCYj/yqeVzdxGaiH07qwJmIR71KEagmdO9Wk/4oGiC2lRNAaYhzQ3dtMdmK613f5Q6NTkj2whbqCjuNElNJ6S96NmwcBVrmz0Fd7pGIvQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=Y2ZGqkIJ; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=Y2ZGqkIJ;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XxQCF4q4jz2xs4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2024 10:34:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1732491238;
	bh=3HZgDipoBDYjlrimLFeAzGIB/HpXZYSyIrDnhPg+UVQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Y2ZGqkIJPobGRlc/ltIq3UFrdZNbJNUQ1D32IYYc+2P5f66hP/QPs6kSWZmdRZnAj
	 l7iJA0prBuFnXLEHQ105uzhw3SC1s9QZ+NstXkKtjIcBiLk17LvBD1lytYAhw026Hv
	 r6pR/CQHrTJew4MQQPMsrPTozkl8WXf9tA9qFzWMZuDjZl0g3W1y3jpcrhajp3pR+q
	 G5qbBJ8NjOTfekwjZv1cnYUZ0NW6fDd1uItzJhJgq3/SwXo6k+DVqhI5gCJjNit6b0
	 i6rRmNJQOSWEbyN15CjwNgktroiSr0xT3hNqmDAymTYaDWEzXBqPp5+c7MAuDWZfNo
	 03C9z0xRAghcw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XxQCB10mLz4xdH;
	Mon, 25 Nov 2024 10:33:58 +1100 (AEDT)
Date: Mon, 25 Nov 2024 10:32:17 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>
Subject: Re: linux-next: manual merge of the powerpc tree with the kbuild
 tree
Message-ID: <20241125103217.56a6eb0e@canb.auug.org.au>
In-Reply-To: <20241113095228.4ac96776@canb.auug.org.au>
References: <20241113095228.4ac96776@canb.auug.org.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dY9MbLJdb98co5AuDAiy8S5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

--Sig_/dY9MbLJdb98co5AuDAiy8S5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 13 Nov 2024 09:52:28 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the powerpc tree got a conflict in:
>=20
>   arch/powerpc/Makefile
>=20
> between commit:
>=20
>   de51342c5157 ("kbuild: add $(objtree)/ prefix to some in-kernel build a=
rtifacts")
>=20
> from the kbuild tree and commit:
>=20
>   bee08a9e6ab0 ("powerpc: Adjust adding stack protector flags to KBUILD_C=
LAGS for clang")
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
>=20
> diff --cc arch/powerpc/Makefile
> index 321b596d2550,99af7953e844..000000000000
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@@ -402,9 -403,11 +403,11 @@@ prepare: stack_protector_prepar
>   PHONY +=3D stack_protector_prepare
>   stack_protector_prepare: prepare0
>   ifdef CONFIG_PPC64
> - 	$(eval KBUILD_CFLAGS +=3D -mstack-protector-guard-offset=3D$(shell awk=
 '{if ($$2 =3D=3D "PACA_CANARY") print $$3;}' $(objtree)/include/generated/=
asm-offsets.h))
> + 	$(eval KBUILD_CFLAGS +=3D -mstack-protector-guard=3Dtls -mstack-protec=
tor-guard-reg=3Dr13 \
>  -				-mstack-protector-guard-offset=3D$(shell awk '{if ($$2 =3D=3D "PACA=
_CANARY") print $$3;}' include/generated/asm-offsets.h))
> ++				-mstack-protector-guard-offset=3D$(shell awk '{if ($$2 =3D=3D "PACA=
_CANARY") print $$3;}' $(objtree)/include/generated/asm-offsets.h))
>   else
> - 	$(eval KBUILD_CFLAGS +=3D -mstack-protector-guard-offset=3D$(shell awk=
 '{if ($$2 =3D=3D "TASK_CANARY") print $$3;}' $(objtree)/include/generated/=
asm-offsets.h))
> + 	$(eval KBUILD_CFLAGS +=3D -mstack-protector-guard=3Dtls -mstack-protec=
tor-guard-reg=3Dr2 \
>  -				-mstack-protector-guard-offset=3D$(shell awk '{if ($$2 =3D=3D "TASK=
_CANARY") print $$3;}' include/generated/asm-offsets.h))
> ++				-mstack-protector-guard-offset=3D$(shell awk '{if ($$2 =3D=3D "TASK=
_CANARY") print $$3;}' $(objtree)/include/generated/asm-offsets.h))
>   endif
>   endif
>  =20

This is now a conflict between the kbuild tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/dY9MbLJdb98co5AuDAiy8S5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdDt4EACgkQAVBC80lX
0GxIRgf/ZYcl6Eoilt3oUwtsfmVx4S5ZuRc/BGXxz+C7amLovrnnvKd2soqIYk8d
+iluP6iZPEAxqkoYSWwMoCqBrO+OLlQi/TY2S0f9Ig7M7TqcZG0qR+43FohW62hN
usbJEFKHp1T+Oc3LCdxQArk9aAZJ0BI/vdypwRvZ+d+fQ+u2OLMNFmKJ6HOlNfL5
bLdD2kMhRR85pIGcHMqfuDvb2aiePB0IKmilp4iRZkj3AEddl3+ArIoyCiKjqt3/
XKSmoCBIXejzOq573z2PiKoJBEtRsSTJK2Nf1Vo9tffmzYcNaQfUbmdDj2nG1B8H
nvRg6C76jMaRfB/NHco2+2++nLjncg==
=Bz4k
-----END PGP SIGNATURE-----

--Sig_/dY9MbLJdb98co5AuDAiy8S5--

