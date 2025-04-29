Return-Path: <linuxppc-dev+bounces-8136-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2595AA0555
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Apr 2025 10:17:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmtTR157Fz305P;
	Tue, 29 Apr 2025 18:17:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745914635;
	cv=none; b=ZzfpugYmbebGgONHN9H6CW2b7if4ge5UhcG7XnVchXfOse3r/N12Y2WgUbCHuvun/NYKXHdJWqytl4IqnXQSk4r53iIdsDp5kHmjHp2G6I3k7VbpxgS06N6ytOKpF0J04i3NuWnCnAPn+1uOP9s/y0NYBpVaYplP0UmcCrnMZh9JYP65AJx9eZNJUMvEkwsN58xIaJ5DcTd5cFdNJRBSEV+xh7bmQs0tDkKgreQTp5ps+45L78knTvoyU5U56IrggDNgwnHzeqTWzr74bm37X41eDxMajWEIKrmCxbqCV43X4N0ynLw38jdDvgTVXjVV+mrBn9RhFKBcEq/TGROdTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745914635; c=relaxed/relaxed;
	bh=HExZNHYkEKf+BKlNRp64fQKIFOICQSHtkd49KA/FaSw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hma9rWMR56F+LI8OmFrvajQV++pjRwCIlV+QeV7x7daCjcG0eNoUkOuA9NkbHechLbzZnjCLnYsOKxogxcNXaMK0uNMnZO84RGYHj8VKNznl4weXRHPu7OdGrAW5CLbGvCSZrF6LbNOdo1sS0CTWSv/qPgLHPlCJZdDSuvYaE1L1M1iaqi6c2PLuvQr/t0e2prkxn7/LuOGP1WpbidN7kh/wNykoYR7pA8iM6Xx6e2OxyzXVgzU6uoD0lkLzKjZSnBg12GMlBce74BobGT/OKVfju1+kG+5g2M/plbO6PlWsVEdxA1+YO8ULkqLe/XqUzDgxUOn98UvZg/L6T/m8bQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=Jm1jPNwx; dkim-atps=neutral; spf=pass (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=Jm1jPNwx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canb.auug.org.au (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org)
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZmtTP2gjqz2yVV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Apr 2025 18:17:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745914628;
	bh=HExZNHYkEKf+BKlNRp64fQKIFOICQSHtkd49KA/FaSw=;
	h=Date:From:To:Cc:Subject:From;
	b=Jm1jPNwxl9YZFshfUxkNq2A8WBpCnDWtWfZFMvbm46fjCzKbQwyjXCLvtUPTXUWsW
	 V6eYtTJPEjBQ45gwHAIteQdA0rd1iJV0Yia8E1+60NK1S++LW02MAPb/z1bsUd4S+m
	 Nn31r2nQzzdhOYY1rir7EMeYJ3jUoY+Y9bVP8bqu9PheMXpnzdSUQafgSey103oojI
	 YaxYRIvN7sYlDLIs9fJyBQbnO6idxzt1n5439qdIBNvao7um/ZgyjMc+1NekS0pTgn
	 DbzKJCnJBxES/kRzkhLzJsaNpyqOjO+WKo5P2VmwxQiXNci2UXul+MXJAXEonDjpJI
	 s7z0pMaL2x98w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZmtTJ5Sdwz4xM4;
	Tue, 29 Apr 2025 18:17:08 +1000 (AEST)
Date: Tue, 29 Apr 2025 18:17:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Haren Myneni <haren@linux.ibm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the powerpc tree
Message-ID: <20250429181707.7848912b@canb.auug.org.au>
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
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/q.Qs18BhseAqq.VEV.GFDJg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--Sig_/q.Qs18BhseAqq.VEV.GFDJg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the powerpc tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/userspace-api/ioctl/ioctl-number.rst:369: ERROR: Malformed ta=
ble.
Text in column margin in table line 301.

=3D=3D=3D=3D  =3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
Code  Seq#    Include File                                           Commen=
ts
      (hex)
=3D=3D=3D=3D  =3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
	.
	.
	.
0xB2  03-05 arch/powerpc/include/uapi/asm/papr-indices.h             powerp=
c/pseries indices API
                                                                     <mailt=
o:linuxppc-dev>
0xB2  06-07 arch/powerpc/include/uapi/asm/papr-platform-dump.h       powerp=
c/pseries Platform Dump API
                                                                     <mailt=
o:linuxppc-dev>
0xB2  08  arch/powerpc/include/uapi/asm/papr-physical-attestation.h  powerp=
c/pseries Physical Attestation API
                                                                     <mailt=
o:linuxppc-dev>
	.
	.
	.
=3D=3D=3D=3D  =3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D [docutils]

Introduced by commits

  43d869ac25f1 ("powerpc/pseries: Define papr_indices_io_block for papr-ind=
ices ioctls")
  8aa9efc0be66 ("powerpc/pseries: Add papr-platform-dump character driver f=
or dump retrieval")
  86900ab620a4 ("powerpc/pseries: Add a char driver for physical-attestatio=
n RTAS")

--=20
Cheers,
Stephen Rothwell

--Sig_/q.Qs18BhseAqq.VEV.GFDJg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgQiwMACgkQAVBC80lX
0GzuXAgAkLwObeJPWr+4TeINP3ifG01TRZtyCBPOM9aGLC87vJeu9wd/z5K8khTk
W4cTIRHcUV8pS7Jgr/EaB9l5db9Z7HnK1kk2DkL4VxCuEAKpiqA8ZHcMbupLCXDh
KFeJ+i9kESjrFOIkTo8nE89iXbho0WCfxd5kTAb5WBeQe74AE+zLkj1jfoBwsPuI
x9EROGoCMiDEoTauls+2TeaUIU1Go+FC5GtUSgOb852x0dT51Y9Zbnjx+FlhrDVr
UX+weV1YFC0Iu4IDLZ0+VFBUqGhW4NyNgzqjbtsLUyAF0Szxp8qEZ4d3a4aKFvqH
BvabfpwfDvGikVdjnoQYgZlDcd/Zfg==
=JLi7
-----END PGP SIGNATURE-----

--Sig_/q.Qs18BhseAqq.VEV.GFDJg--

