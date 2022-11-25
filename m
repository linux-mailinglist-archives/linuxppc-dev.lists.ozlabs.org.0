Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 182BC6382B6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Nov 2022 04:31:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NJL4C72Rvz3dvV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Nov 2022 14:31:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=SnCFcg/C;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NJL3F5VYpz3cGR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Nov 2022 14:30:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=SnCFcg/C;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NJL393T3cz4x1V;
	Fri, 25 Nov 2022 14:30:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1669347014;
	bh=6SWwZc2uQtmpeEVjQzq7dy69TnAznszEflKHW/ZfoLY=;
	h=Date:From:To:Cc:Subject:From;
	b=SnCFcg/C4VSrKZZ+rUfjyyLZ44/oQbDrg/sJp1Q5r3pSsZIN+0vTqPNGugZHmoiwZ
	 jShzCWsdh2qx5xOb61DO+rwX2ddHafsHh4E3uWDemT73c3GOB43aDIdoqxDFpP86PV
	 KshHXPQdYCtnh+PQwWQ2vldLjOF86GReJkbTorfi7+kf9OECLD9aqP0iFSsrdiL+wU
	 ANr8T6jLZlOct4Sncyq8ql0VXb+SmJzERPqjuvpJ9S6ikITpASHyZQAFVxVefWwOge
	 GJJSX2Yw+0SveJv8oHb2iYm5hpby6t2ckc6K2vZuUMXDG89Bqr/k4gpbBRVmLISeVb
	 VtIwtOrtQMK1g==
Date: Fri, 25 Nov 2022 14:30:12 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: build warnings after merge of the powerpc-objtool tree
Message-ID: <20221125143012.6426c2b9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qIAd5CAuMjQ7zm8y6Hspz0Y";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Sathvika Vasireddy <sv@linux.ibm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/qIAd5CAuMjQ7zm8y6Hspz0Y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the powerpc-objtool tree, today's linux-next build (powerpc
pseries_le_defconfig) produced these warnings:

arch/powerpc/kernel/head_64.o: warning: objtool: end_first_256B(): can't fi=
nd starting instruction
arch/powerpc/kernel/optprobes_head.o: warning: objtool: optprobe_template_e=
nd(): can't find starting instruction

I have no idea what started this (they may have been there yesterday).

--=20
Cheers,
Stephen Rothwell

--Sig_/qIAd5CAuMjQ7zm8y6Hspz0Y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmOANsQACgkQAVBC80lX
0Gx9qggAl/flwI3IFQ4qQYlHsYOAVZdsiag897RGpD2qHFNlnRyfaoBHVwSh4XFj
LPSFRiK4kjbMj4iJgD57WCDqklvx5R6BrixXRHFXaMecbJzBDWepEVZLhR7Cth2C
ZeDWXrZC38j8Yx/nHMjQqPXxZCV5ua4sUYGMcX9V6D8cRA5Qaf8nDbV4hzZEYKsA
pqByt5NeRX6sOGRSSJwd/ddIKbASklks1sYxYk7ijeGgB+up94tTarDwnHbWo5mO
UiYfx6uPfiijrT8B3Nd/9XtxL4+Eoru1cfj9+eZJxqb83NcpiTDfVlQk1YL4W+09
iutP/nnvH3/N4yk9i95pDrikytSbEA==
=6Rr6
-----END PGP SIGNATURE-----

--Sig_/qIAd5CAuMjQ7zm8y6Hspz0Y--
