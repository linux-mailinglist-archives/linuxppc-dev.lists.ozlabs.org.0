Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC0B6420A4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 00:53:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQNm95W6Bz3bgg
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 10:53:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=AleDbY0C;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQNlH2wtjz2xZ7
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Dec 2022 10:52:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=AleDbY0C;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NQNlH0g92z4x1H;
	Mon,  5 Dec 2022 10:52:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1670197947;
	bh=DT7W5IgwDWV6hM6pj/xWqOLA5IrhhVNwym6MmH4hJX0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AleDbY0CMfFUM5aIqeKthFCwYsOwsPbAc2F4+4JpekaVi6SRp4+sco1VoQbcngrRo
	 lIC671ZBHnqu/P6RoW49TTI0fFd7j60FmiLT03S+AJJq0e+Rvf0UdmSVzmsA4Uw2br
	 gZBq33uiAojBxv/9RpulT5sP8rcGumQARbFcRuV9ZfuSSipcKdl7KQU+ID+DGQDy1k
	 Gut83pLTuhf2z8jJerVJK7XP+SLDM4djUyVZo+LJt/FBHHPXi9k5+I0Q7UaP4Jm9bJ
	 2KLNU106o0uej0RFDJYGkecRtOGBftf+cgoHbBmPoSIe1GLB8E6lrX5pdZunKCp36R
	 VWRxXTqrsRijw==
Date: Mon, 5 Dec 2022 10:52:25 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: build failure after merge of the crypto tree
Message-ID: <20221205105225.502d2278@canb.auug.org.au>
In-Reply-To: <20221205104857.2dab1586@canb.auug.org.au>
References: <20221205104857.2dab1586@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3O6KPx5Zsaa1u95P3VOcixO";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Crypto List <linux-crypto@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/3O6KPx5Zsaa1u95P3VOcixO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 5 Dec 2022 10:48:57 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> It could be (easily) argued that arch/powerpc/include/asm/cache.h should
> include linus/types.h, but it is also unusual to include an asm/... file
> before all the linux/... files.

Or maybe you should have included linux/cache.h instead of asm/cache.h?

--=20
Cheers,
Stephen Rothwell

--Sig_/3O6KPx5Zsaa1u95P3VOcixO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmONMroACgkQAVBC80lX
0Gz+UggAi8mAW4yDJzKsYQ0UKBCAnWxolGt7tWnVF38OLG7ZWrvmxmU/sTTWA1DL
QguCLzbg/NoN6tncqpL50+iYrC5R5IeF+Q2Od/mjCrgQNTGrs0GLWrJxQ3QEAqyS
7ibxucFAhEbg2q4xycf6zC0E7iZ+KpK6T2fALNQ8+x8cdZVsJijAUdamRsbF5+5w
Y52lcQW60AFKpLaUFtvyhnjZ0991pUF/pFzQu5Cegzt0f2mAKNwgtlAlLGOyaXAA
4pDycUrNmu1fFmH33KsiYDRZ1XCm/3Cknn3qeDVt5vliszRLXb/IkO4EWcdlCvWK
/HeB6U1H2cZQR6m37aoy9isMEpTT/Q==
=GEsa
-----END PGP SIGNATURE-----

--Sig_/3O6KPx5Zsaa1u95P3VOcixO--
