Return-Path: <linuxppc-dev+bounces-1186-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F10D5971D4C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2024 16:58:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2VM560xRz2yNP;
	Tue, 10 Sep 2024 00:58:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725893889;
	cv=none; b=by6U3Vnk00fSKNM6ZOn/6pgYf2McENO2tFAAr4u9OC5uGzFwz1p9W34HWihmQkBAbA4TF4FnXjDRwegRv3dgvtJPMl8bumSety70sJfPNA7pAZKfG5s+4XnygV1EjqzJMaFqNnYEaF/IBck8yLTZo87eAMOpbs5wnlYd1qoBQ0fGgDODg8c6eApd3k0mDgtJcHsf/nnTmsr+2mmDEGAHTfUKkxwu29UxQRt6RX58pX/GYn/nUMFp4G/zrng37eNqQjkvmZq69p4qqNpleMWBnE2EPPnKHPgwWCHQ1masks+x+ppF4EjeoYcIkUcyrPzyzL7NC/MaTTIydtdi4Re03A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725893889; c=relaxed/relaxed;
	bh=PBOVkZww8Y1CyMvmzZcDEQcfauCNuY4CzWakfWzf4dQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dXL+sFaDfv2E3iSflL+w9z8Wckn4Yq4DWmkHDHaVoK7h1x0dXuOzd+yf2um0R7KgmhrNZyGQUaKK2gkZbNkwle9FF8aSjYHOrcuFF9N+c8E7kGl/jZs1n4roK/DLPLLPASwhzlhM7lhXjHZjHv3JoDET8bZf1E806gkdjQdHsguSPqKfdApCJd+lUkPoAvEgAzhK29nkutNsFAABaHQ0Gg3d6AXBoAArccsxBZFB9vBU5LFUDyRzoJsSonV2YzarzGguVmuOslrR88q0Xai8qdbhBQI8W/d9EuzyAxIvmP/2fFkUDqhRpgV7c6V+ZMKXXWS79pzY8ooefSi8QY0ddg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=HnKHNogN; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=HnKHNogN;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2VM55lhLz2xdR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2024 00:58:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725893889;
	bh=PBOVkZww8Y1CyMvmzZcDEQcfauCNuY4CzWakfWzf4dQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HnKHNogNfnZIrT2JtmSWn+LmmIDxSr/Yi0fd9e5iyW06hMgX8SOFkqJPLsrf8d0jD
	 BFCkLEA72KZd/TeMZB5PHgVG+3gfkk/U1W9cWDbXKFWzYmyic5De8MtVcaBjOBFSTi
	 VXuvOLfMAytdxeWSDgEKZstyE3guvuD9arAwnAxWG+xpcn5kJs8yzTVpoKLP5F3xzh
	 LyznG0WT5CsShiZctvMZE8isSaM+79zJsbPzGI/GWz9w8vGF/aPqXOysaqRDtSMxLB
	 k7Za2h18g63kCqUD/thaBJUsX85HadizmBrJlOe2udv5AP0kivBNhx6brCv0Bv4dVM
	 7Jl5K6FDrhnIQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X2VM53yB7z4wc1;
	Tue, 10 Sep 2024 00:58:09 +1000 (AEST)
Date: Tue, 10 Sep 2024 00:58:08 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Masahiro Yamada
 <masahiroy@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the powerpc tree
Message-ID: <20240910005808.2e355995@canb.auug.org.au>
In-Reply-To: <afa6f06a-8d92-4ac1-b5fe-d5b6ade3f740@csgroup.eu>
References: <20240909200948.70087f49@canb.auug.org.au>
	<afa6f06a-8d92-4ac1-b5fe-d5b6ade3f740@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/R2HOHTA/RK=GO7xuxNWT1SO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/R2HOHTA/RK=GO7xuxNWT1SO
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Christophe,

On Mon, 9 Sep 2024 16:22:26 +0200 Christophe Leroy <christophe.leroy@csgrou=
p.eu> wrote:
>
> Le 09/09/2024 =C3=A0 12:09, Stephen Rothwell a =C3=A9crit=C2=A0:
> > Hi all,
> >=20
> > After merging the powerpc tree, today's linux-next build (powerpc
> > ppc44x_defconfig) failed like this:
> >=20
> > make[3]: *** No rule to make target 'arch/powerpc/boot/treeImage.ebony'=
, needed by 'arch/powerpc/boot/zImage'.  Stop.
> > make[2]: *** [/home/sfr/next/next/arch/powerpc/Makefile:236: zImage] Er=
ror 2
> > make[1]: *** [/home/sfr/next/next/Makefile:224: __sub-make] Error 2
> > make: *** [Makefile:224: __sub-make] Error 2
> >=20
> > It is not obvious to me what change caused this, so I have just left
> > the build  broken for today.
> >  =20
>=20
> Bisected to commit e6abfb536d16 ("kbuild: split device tree build rules i=
nto scripts/Makefile.dtbs")

Thanks for that.

--=20
Cheers,
Stephen Rothwell

--Sig_/R2HOHTA/RK=GO7xuxNWT1SO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbfDQAACgkQAVBC80lX
0GybSwf/Qr7o1BZ6Cx4fElpbFJBc7ndD4mwjh9TYk+a0oY38b6Mu/hYOoQQRRbuF
YOuZ1dlbEchB0snIqXODHhr5Ad3h7KcvIlFqlfFqGgxjRZh7PklffnW63SQ80epk
5oEnQFwwUW9gTsqOq8BB6uSuFzre9X8zMp8l9HnIDLhfY7cZ3TzMc8j8PbFChOR1
NVQQOLhfY+r8ahWC3W9aEomm9/O93Uh8lyr3TU7z1auh6gQROzQb2HtDxLUH2kE7
58zE6TMd41Zss69CyfvM2XM6JWLmCeIUwzHZBCZ1fB/heo52LKVFnoMDBQ9RIp/K
v/xu9xhHS3ITq072SbIdV18xgI1YVQ==
=1oA0
-----END PGP SIGNATURE-----

--Sig_/R2HOHTA/RK=GO7xuxNWT1SO--

