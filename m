Return-Path: <linuxppc-dev+bounces-1176-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C0D9714EA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2024 12:09:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2MyS3pcYz2yGl;
	Mon,  9 Sep 2024 20:09:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725876592;
	cv=none; b=o0qKeFy2yxlSAaEJX6lTX0uPcfHulfbEVFhVCu2/q1X02RIId/don/c0YmU+Y7+NUqS+uXqWbydjOnS4UXSsr+ZoB8c/eANNu/tfztpejSoSFqBiWswC9XutCh/08tPtIKgOfLcAaEuPdzfhVrRPyIsn3k03pyywVkS1MJAUDmKW3MTSx7KDiG4aExbrXW4jb8b4ojKFqg3sZtQyY7wydRzYxWZvx0RLNc6tdY9qv3oUV+PIhloQMBAH/hKiG1tKSJEA9KLXejW/E0dLzlItRNEkCM4iMauwk9JEVS6k5asyRcVa1OCEN9/RmCwMJiCDfl+cq6poIo3dcqdZ8cnnpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725876592; c=relaxed/relaxed;
	bh=jlMhYQgkHnB97TYYkfaMe1TWYOcT+z7w/DMkDtkdwqo=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
	 Content-Type; b=QLhoGohnFWijHJo/QwRYzrS+AYWXpcBqFMm9vm1fYWHfhDvgfBx7APvYWzJfBPMAEGYhhPnUTBrv4ng4EfheBt3eytfJEdHhsNGzcQ/4iLodVkxWHJ4CEFzNdma3lLZdUcFKJxKxPn3USGGF9cPdoi/c7bq27Zm+niq827bT3eS6DYfwuW8F3Um+0TPkbYFYm7e6fJdmCVvcBN326DftS4KM+UCBDxT0OyriznHbeKM1tnILHd9TDCTBH3sdK4ZEwPzJtS95YVU9FnRmQhCMZ5JO5aci3pp+4w4WuiYSGUXoxl1x8WgW0Ei4yGAvO6h4WE/MPGxOsK6qoHe9OCPaBA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=si+DqjI7; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=si+DqjI7;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2MyS3ZHPz2xxt
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Sep 2024 20:09:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725876589;
	bh=jlMhYQgkHnB97TYYkfaMe1TWYOcT+z7w/DMkDtkdwqo=;
	h=Date:From:To:Cc:Subject:From;
	b=si+DqjI7XGoiwjiLj1DdM8l+YpMTMZ70L0nO9Y8wEAZUodDyAJ2GD3hQwfqR1CaKn
	 UEtOtNBQz2hTLiyhpMTeyQpXynUWeZyhilEmBjyfIBlJrIoaQq1jQTqh3WKVXbcRFL
	 LTiRiBfeotdYn71yOHJQakmJ2m9I/9NiuW49dCWPEjiYy4nfGnhgI3iNW/yUHUDXBr
	 9uy9mFBzyBrL6PlcHDB6jrC/nIv+1F7pLdrOeh1HxTlGCJHr7MLDzfKsXXsjDbS4LY
	 zA43NTUd2igl0aY0SFQWQtRRo2VEKkygV2dsrgZcsoVmxFu9JNVCL4cyDbThNZULzE
	 7JKNWzub7eiIQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X2MyP1TcSz4w2L;
	Mon,  9 Sep 2024 20:09:49 +1000 (AEST)
Date: Mon, 9 Sep 2024 20:09:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the powerpc tree
Message-ID: <20240909200948.70087f49@canb.auug.org.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4AB8h.HOyFeR3ZsoL+kqqtR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4AB8h.HOyFeR3ZsoL+kqqtR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the powerpc tree, today's linux-next build (powerpc
ppc44x_defconfig) failed like this:

make[3]: *** No rule to make target 'arch/powerpc/boot/treeImage.ebony', ne=
eded by 'arch/powerpc/boot/zImage'.  Stop.
make[2]: *** [/home/sfr/next/next/arch/powerpc/Makefile:236: zImage] Error 2
make[1]: *** [/home/sfr/next/next/Makefile:224: __sub-make] Error 2
make: *** [Makefile:224: __sub-make] Error 2

It is not obvious to me what change caused this, so I have just left
the build  broken for today.



--=20
Cheers,
Stephen Rothwell

--Sig_/4AB8h.HOyFeR3ZsoL+kqqtR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbeyWwACgkQAVBC80lX
0GwVEwf9HVJTba1AJeaFI8U2LkU+rCnMOKxJbXsV+/Xjm7rKzngSv/Cx6n5rpXEb
LjQ1a31r3x1xFcLDwz5BiZyPIGiR/LHO7FR2NMKgyZR06d2LyU/iDB/6VFeCTYyW
phYAAHiRNM6rdpxMpPsLFripeNHfpdWy5wgkLBYxwBQ/LZHYGJPYzGdpXpLsIHnG
Bd6xBdN5H5obPvPCQFjtKVa3SyyHxV1HoeVYnzCgODHD9QR937y7zRnXEm+3UJgs
ec+jqd9kQIj/HWtEs2s4cTyOtrblk9bzJ5/bvUhsKPIUImiCVyhDEV3KuACgwORo
IWSJWUauBAg4N3tN585x+oDGHJs2nw==
=XbtQ
-----END PGP SIGNATURE-----

--Sig_/4AB8h.HOyFeR3ZsoL+kqqtR--

