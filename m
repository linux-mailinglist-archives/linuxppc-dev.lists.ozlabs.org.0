Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D718423D439
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 01:41:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMSnp5bXPzDqjv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 09:41:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMSlr24hhzDqgZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 09:40:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=qExdT6B7; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BMSlp0VCMz9sR4;
 Thu,  6 Aug 2020 09:40:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1596670808;
 bh=TdkG1vT9yZEKFN0XCtbZ+7HMVEJsNm9Xzz0nNd1K2eM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qExdT6B7jJf7qQAVSnc05Zqb9z8kkG8nLZI+XL78nxLH9EgiWPOD7X8G1Z4VfkS/s
 9PaxYhEQa/d1lTy6TIc2jMk46g52crWeDa54/4vulMUITBfl19V703/3vMGZP+MTHY
 IZzfnoOObW/iZo6NAtjozmUqzob2rMkoxGgtOQjaRO+FPzddD5rx0O4g1EoiiJw9B7
 m0w6MD/TgSKz5O8MLh6n8gd19tueFxA0A1jrOqnEYfoqIZeJFwTcL+7uI8e8Mp/Gnm
 sapuNnVmqfxsmKRFtyhskq330MlSwHQACVq/pWWOAFfpZZjZf8EkqivZdrzXU5cHUl
 gpTYje0b+FaLA==
Date: Thu, 6 Aug 2020 09:40:05 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Michael
 Ellerman <mpe@ellerman.id.au>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: manual merge of the char-misc tree with the powerpc
 tree
Message-ID: <20200806094005.29296b53@canb.auug.org.au>
In-Reply-To: <20200803165546.6ab5ab6f@canb.auug.org.au>
References: <20200803165546.6ab5ab6f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YpRe1X4DL6Z4XGZOpqE8aXS";
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
 Lee Jones <lee.jones@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Alastair D'Silva <alastair@d-silva.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/YpRe1X4DL6Z4XGZOpqE8aXS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 3 Aug 2020 16:55:46 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the char-misc tree got a conflict in:
>=20
>   drivers/misc/ocxl/config.c
>=20
> between commit:
>=20
>   3591538a31af ("ocxl: Address kernel doc errors & warnings")
>=20
> from the powerpc tree and commit:
>=20
>   28fc491e9be6 ("misc: ocxl: config: Provide correct formatting to functi=
on headers")
>=20
> from the char-misc tree.
>=20
> I fixed it up (as it was just differences in comments, I just arbitrarily
> chose the latter version) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

This is now a conflict between the powerpc tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/YpRe1X4DL6Z4XGZOpqE8aXS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8rQ1UACgkQAVBC80lX
0GxKcAgAh9MsxkEzKH36US4RjkNvMuK3i1Mbivu0awyiu/pTkhV3wXb3PX+4cAX+
odIcjjAMxHtTHiN3OJqmCtywz9vzKdtjKo7d7SLetB7bcNQqgaOtpk8ZMtmOLxOJ
QF6q7rvcFrWGY9OPi2Y+GGLIHhyWr9z+IeC5SAJ1fPnVTn9HYGbSs2cutd2a5K9y
Qm7xcasc5CiYAEdhRmfwllSoBXx0Huq3k8D9ltTtRZLxyQkWh0nT32p6me2sHyOv
yQwnqTx+3CpEujw2I8d5OxTJgbXjdMkSsHds6G+okXBpj3n2xafRiN7NFfltXFjF
RdiGuazkFVmJ9WSwgTCF4cTGE8OftQ==
=Yve7
-----END PGP SIGNATURE-----

--Sig_/YpRe1X4DL6Z4XGZOpqE8aXS--
