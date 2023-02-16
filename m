Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F5F698B3D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 04:41:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHLMl1xRcz3chk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 14:41:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=TukCD6eB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHLLn3F0fz3cKG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 14:40:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=TukCD6eB;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PHLLm1DY2z4x5R;
	Thu, 16 Feb 2023 14:40:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1676518832;
	bh=IhhtNy3W6goacXun/EPhiJafiIJA87yrMDChswJsA90=;
	h=Date:From:To:Cc:Subject:From;
	b=TukCD6eB0yr67J/ISyBFD4uzlbdNHnDHK+OwVPsOPMgHa6kjH1makxS4VeLGNjNqo
	 sqQwZcBreZfl5gqXuVKqCNKhuVEqjXcFVkrPrN2D0AZksI/hH4f4CbMCXG8bFS4aVP
	 tPejZIl1xmvaW15KOFUiZ++bCqu1Gnxr9Hrb9g7A3R/3gDuRJMORZUfOS9y0zADGPG
	 GMYxnTVB5te/tmUDysECrJpQ6i2eqQl01IL8EfEcBriMhLVqlvq7mpoXDsDIXCvlZc
	 agVIMRme8hdpN186gT//b8ysxJOHHY8//Dc/IWKASPaNi/OMPq6lfxTbHB1vQewR7V
	 AJ/jl+nxmdtow==
Date: Thu, 16 Feb 2023 14:40:31 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Subject: linux-next: build warning after merge of the powerpc tree
Message-ID: <20230216144031.45b1fc12@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dglXHvi7hVb4e17fbyF=Xyc";
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

--Sig_/dglXHvi7hVb4e17fbyF=Xyc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the powerpc tree, today's linux-next build (powerpc
pseries_le_defconfig) produced this warning:

arch/powerpc/kernel/head_64.o: warning: objtool: .text+0x6128: unannotated =
intra-function call

I have no idea what caused this.

--=20
Cheers,
Stephen Rothwell

--Sig_/dglXHvi7hVb4e17fbyF=Xyc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmPtpa8ACgkQAVBC80lX
0GyOCAf/XT5HWVB0yvKvhPl6Utb11p2X3m1l7VIfHcuzgHN+Z/xTBb2rrVxumHd7
iX6kl5zHsMfENpxd4UFnvNs8zZwFOQSVs70FcXCN7R4cEAmggxuAzsAZezYC+kIu
zmmev8elNVcUwN4dxm7gNT4dhXgJKqhJ2BRSF2c9C3Ws4WhKYj4sJh+njnErk5XZ
oQuBOjHzJdaZ7Qy03QyKgLPpKO/ceWRUi43ZZUJx13MBGmwCBOJBRhh+1Aar55v5
2Mt/qdGd6L0ESMSOwyjQrBlCnOX9w9PNB3K7D9Fmw1Cjkadt3v2X2au5h5pwrNuZ
GXgASLbb2L/dEn6q9FuPEw5953tRIg==
=S3YE
-----END PGP SIGNATURE-----

--Sig_/dglXHvi7hVb4e17fbyF=Xyc--
