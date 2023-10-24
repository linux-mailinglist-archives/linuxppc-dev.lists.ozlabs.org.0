Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4761C7D479B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Oct 2023 08:39:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=bDdUKwTt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SF2Ty2DLNz3cTG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Oct 2023 17:39:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=bDdUKwTt;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SF2T33CYxz2xYk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Oct 2023 17:38:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1698129524;
	bh=Yjbi8baLATD/fHzOgylyef37xmECN0dtorEYBlgpJAo=;
	h=Date:From:To:Cc:Subject:From;
	b=bDdUKwTtceJdJmpW1npM8gL05L9yIA6l8I9K6l3S1aeZzuF+uwvzAv2fQqVBIabZN
	 ErnhUntr7EB5+K3b12a7j1QZYC/Srm+1F/5C5dg1/51V7vU3uYs/k5dnrgw7nAm77S
	 0g7wr/YOedGN1Np95gqYAR6cZRFICQvtgO8G2YSlvZRjQOshPDsHAUz2FMWX1AuefF
	 eWBBwN0xoIwf7MDYuUZIIvu2nbv9wCHT+jvJghDoQLv+u82wq7eCxgnr52HATyDTQM
	 wX5DSB/Zt4MfQyw3KkSO8O7WSTnsakiS4ePXZEDMzdPas8azsaZML2e+ovdjGBXoJf
	 HrQQcI30KG+PA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SF2Sz551tz4wdC;
	Tue, 24 Oct 2023 17:38:43 +1100 (AEDT)
Date: Tue, 24 Oct 2023 17:38:43 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: build warnings after merge of the powerpc tree
Message-ID: <20231024173843.07ca9afc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZmEuILtJOwo8pcQ9yHFFAfJ";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sourabh Jain <sourabhjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/ZmEuILtJOwo8pcQ9yHFFAfJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the powerpc tree, today's linux-next build (powerpc
allyesconfig) produced this warnings:

WARNING: modpost: vmlinux: section mismatch in reference: process_fadump+0x=
2c8 (section: .text.process_fadump) -> fadump_setup_elfcorehdr_buf (section=
: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: process_fadump+0x=
2f4 (section: .text.process_fadump) -> fadump_populate_elfcorehdr (section:=
 .init.text)

Probably introduced by commit

  c17687d0d62d ("powerpc: make fadump resilient with memory add/remove even=
ts")

--=20
Cheers,
Stephen Rothwell

--Sig_/ZmEuILtJOwo8pcQ9yHFFAfJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmU3ZnMACgkQAVBC80lX
0Gzx8Qf+KFI2SR2hDeKrZJa/tECX1cLqRx+/7vMPVE3k7qFJOfHJj/jm5zL9TkuQ
iT6yyzyHcGKfqy1AS7u6vbsjDdeIEXpgOXSxfS9AKboWsDCcMnd4AcKBnjbuR0DV
S0JOEfvjT+YTTXPmzaq7gnJj80y66R+DaAWtylGmnSH+9qZMyU3o9G563kHvUE4d
df7R03M3OmlGXISG75/bS1zpYrEvAp3zRHFZPbkibVlOSCsR+NHvPsmHZhRyP2bc
3DgGFSvLdUAJblONBqH99i0Atm520zencF0HHLWT1OwvhAePEV9WJL33M3NRPSRR
uKvBqKdPxIRs+G8qliqCDUbUrfS2LQ==
=bMPO
-----END PGP SIGNATURE-----

--Sig_/ZmEuILtJOwo8pcQ9yHFFAfJ--
