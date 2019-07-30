Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BB87A00E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 06:35:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yNyq02mYzDqRH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 14:35:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yNx549mFzDqQG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 14:34:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.b="K9D5mwU7"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45yNx50sRtz9s3Z;
 Tue, 30 Jul 2019 14:34:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1564461241;
 bh=Teg+aNdscBpNU2anyLsQ2KNdJL+bChQil9MGdHKGG2g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=K9D5mwU7OkG0qXHw1OKdBWmXBvLKy1ESsxidNwjIejk9KCzmjN/jdd03eETTyVO+A
 9FFdxUfGR1z2dUiZN4tlzdZocTIDPQqxudfUGO7xbEpb+qloBWiUQLgj92/qDTMbqq
 GqJ/U+0HTjgk+7qVLqZ8Mm36fi77t2ka42kqaEQrIriB88hyfpCy49reZgY0MSNDJD
 ngxxo4j8QnOZB4Or7ACp1f9QcHOABMNbqg5pM3MS9bBqnwUDvAlChr4oU/xMrSu9UF
 h6CQKfmKyMN7k65kORhZOBdah8W8T69WlKP3L2yNMT0FDZtHUU+7v9S4l0A8D14HYW
 j5BASHMt21z8w==
Date: Tue, 30 Jul 2019 14:34:00 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] powerpc/kvm: Fall through switch case explicitly
Message-ID: <20190730143400.08055688@canb.auug.org.au>
In-Reply-To: <119556dc-6dd2-d53a-0253-cf3025b42f7d@embeddedor.com>
References: <20190729055536.25591-1-santosh@fossix.org>
 <20190729181651.4b9586a7@canb.auug.org.au>
 <30ecba4e-a232-ad28-4c1a-5a173a7ac7cc@embeddedor.com>
 <20190730131849.4d704abe@canb.auug.org.au>
 <c77774e0-c613-64fc-c61f-e9ff73b4db17@embeddedor.com>
 <20190730135035.25441b40@canb.auug.org.au>
 <119556dc-6dd2-d53a-0253-cf3025b42f7d@embeddedor.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/E+PcZHVxXI_VKmzRwK7NE/J";
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
Cc: Santosh Sivaraj <santosh@fossix.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/E+PcZHVxXI_VKmzRwK7NE/J
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Gustavo,

On Mon, 29 Jul 2019 22:57:05 -0500 "Gustavo A. R. Silva" <gustavo@embeddedo=
r.com> wrote:
>
> On 7/29/19 10:50 PM, Stephen Rothwell wrote:
> >=20
> > I am assuming that Michael Ellerman will take it into his fixes tree
> > and send it to Lunis fairly soon as it actually breaks some powerpc
> > builds.
>=20
> Yeah. It seems that now that -Wimplicit-fallthrough has been globally ena=
bled,
> that's the case for all of these patches.

Only some of them cause failures (as opposed to warnings) .. in this
case because arch/powerpc is built with -Werror.

--=20
Cheers,
Stephen Rothwell

--Sig_/E+PcZHVxXI_VKmzRwK7NE/J
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0/yLgACgkQAVBC80lX
0GyGAQf+NVbyY0Ak6XBVsDQjYBkROFUFp2Hw8OdYTPVw8H6SyEsdR4R8pi0FaIjg
DTNjShKH5DtM2ANHeyasm4XGong1ptnx/xcHvmaWywhnlIj/m5hvDU8oeTlisfIf
8PwU7gIx2OJLgOKV12vWj5zv2gWIrOKB69AnUv/CthcwJDS1Iz61x4sB0HB8a1hI
QumUYKkYdDbslptpykcn694ZN5dp4HzB9H+13qKrvDPnLPXqnQUnmgOSHO6GB53/
lmpI7T98MHq/T7gZXcTfTYHm0Bic2JwPtxpLpKpp31BKJsQQrbbO7H+/QsnJi2Gc
a+LndsIt4uuht4g3MSUvCgntmIz2Sg==
=iedb
-----END PGP SIGNATURE-----

--Sig_/E+PcZHVxXI_VKmzRwK7NE/J--
