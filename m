Return-Path: <linuxppc-dev+bounces-7133-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3863A650C5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Mar 2025 14:26:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGbNR2vxLz2ydQ;
	Tue, 18 Mar 2025 00:26:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742218007;
	cv=none; b=HuzGBh/DjHoYB0YK0qrcV0p7ScGjAwWqKaTvOH657GiNRNfNcH+zNQSog2OiA51nsw5GfY5o5nPCCm0Gm8pBnXUIMGCtySfbPHregokWtGW3ECejsXFGLZiqpzwIDF19c5Zy8tzh/BpTcT5vaH6qg2+4/OF1kA5yMte/VBBwY0ubj5mbfSoCj5MTSFCedcqtxlwXcJmZSVzyQxMH2eTgmMhVl0kyQd6/DbhU3NAfJ+kQT/TWymbs0cMZHG2aasQc641bne30BhSFQzXeCgn3mxZOC+1I0Ei8E+8jfj2uMyOkkz+6s+NrY6wN6rA0PD6kixV/l9GlZtgvfbHynOtE9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742218007; c=relaxed/relaxed;
	bh=JLIHgAMxnwRLZG/obQ6vS4uXsd9KMOYOozy4YCRS9iE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZS7/hG2CdJ73Ytn5MPb6alNulJINyub8swsMTJnC058RqIRiTlUA3JwbcJGWKWzbZknsw4BcNCAR4uGhl7NVk1euH5s+Q7bxgN6PwYrAUyVJVpOIvtfdplClTN9azhiceA7sKsukgTXFAE70IL4zHutPi0Jb8S+ETQa8kiG21c1AKt7+S3FOdVf/MEi/cuxvnsvUB7oP19Bj0rR7SyKpZx9k7fx42+3htKlwVIgYohjFQDzVzS5O4Sdpmus/GWswALjIOy10Y0KgzNrnEWzJkkT3sFG0BgiKIEcZARBXIfqRFj44wydauBku6g84Fuv4NeuTfOHfW/YyYYGV0C5H2w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=i51ZQllL; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=i51ZQllL;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGbNN272Lz2yGy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Mar 2025 00:26:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742218004;
	bh=JLIHgAMxnwRLZG/obQ6vS4uXsd9KMOYOozy4YCRS9iE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=i51ZQllL8WkzUZQrqgD10mrWnp3ZYuN+acasktV6ddtEx793/Mq2rcaCYAB8yrnlP
	 9SdlizXx6LDhkMBq+KPHhe7DQwDp3eR2dn2C+JJ/UjXHFPM+4Uij4HQk6L4xlL/kLy
	 Kew1CGlU04xFVs7ehXV1dwMTeaAuWpBW175EO7u0ZliZSByrvOcYP0pjcurhuLB+b2
	 VOCs3QM9UNVwG9h7CwSWegLLQgoE/X+eHBUzpIpYjgaLHZOQzYf2YoBKY5M4zHWjri
	 heW6wq15RHnfgoN+qBK5xp3bafr2NcOEgY1cwiwCM41Mvx3+WfsNAWB9NEodlPeveM
	 fZi3eNJydq0SQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGbNM5zhgz4wcZ;
	Tue, 18 Mar 2025 00:26:43 +1100 (AEDT)
Date: Tue, 18 Mar 2025 00:26:43 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, Linux Next Mailing
 List <linux-next@vger.kernel.org>, Andrew Donnellan <ajd@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: Please add powerpc topic/cxl branch to linux-next
Message-ID: <20250318002643.71ef29f1@canb.auug.org.au>
In-Reply-To: <87y0x3dibs.fsf@mpe.ellerman.id.au>
References: <87y0x3dibs.fsf@mpe.ellerman.id.au>
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
Content-Type: multipart/signed; boundary="Sig_/O2rrYCitA=n4c8uYnDf2KW9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--Sig_/O2rrYCitA=n4c8uYnDf2KW9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Mon, 17 Mar 2025 22:09:43 +1100 Michael Ellerman <mpe@ellerman.id.au> wr=
ote:
>
> Could you please add the topic/cxl branch of the powerpc tree to
> linux-next for the next few weeks, it's targeted for the next merge
> window.
>=20
>   https://web.git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/l=
og/?h=3Dtopic/cxl

Translated to git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.g=
it#topic/cxl

:-)

> It contains a topic branch of sorts to hold the cxl removal. It has a
> few commits from the SCSI tree, up to and including the cxlflash
> removal, then it merges powerpc/fixes to get a Documentation/ patch that
> touches cxl, and then the cxl removal patch from Andrew.
>=20
> The plan will be to send it to Linus after the powerpc and SCSI trees
> have been merged, during the merge window.

OK, added from later today.  I have added it late in the merges.  Let me
know when you are finished with it.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/O2rrYCitA=n4c8uYnDf2KW9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfYIxMACgkQAVBC80lX
0GxdGAf+IpjmJzMze0AoOSyixrs+k1fUAntWwPH+G4HCg8TaJUN8UE/x73SnylPE
jueJYBe/I82pIX1GxpTZ2ydIW5pP1VoRERv13tcpkX0Xb52THt7EGNIfCehDjWPo
Ly3i1fXIAjcOPEs1cxy2o+ULZ8cuX9f3+xzRYec9DBdbopCWAc0ot0MDnGxlQn1o
xiVo9OLQkPROzlKriofin1NNnLdy/83IIxzRU1j7fUjRPCTGVIDUyq5UKw8VI2J8
DTiacyVsBC7kw3p2SWFFbZNGR4GpHWx0MM8RfMVO1PDO/X+1ncxprk38BpoSNCNy
wYp/j0R44VIG2SuiGwB83e6+FwacVg==
=d1ND
-----END PGP SIGNATURE-----

--Sig_/O2rrYCitA=n4c8uYnDf2KW9--

