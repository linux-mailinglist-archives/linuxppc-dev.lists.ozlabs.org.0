Return-Path: <linuxppc-dev+bounces-7873-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8E3A95C59
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 04:51:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZhRZR2XHFz2yRn;
	Tue, 22 Apr 2025 12:51:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.185
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745289629;
	cv=none; b=douWWibF47IJW+pewIRfQKYH01dx5z2DWg/NuXPFWLgAFL5derhUklFT/vHM4mvmrWh7dzWq/h//BgDPrN0I/sn4yyrDThIZoLRUU/OZGIcV1PBK0k6VSZI7NU/hXAOz1m1eLe6RKSloqyvhj6eYRfRUvLfTuffON9+MxIfQoXYKqyZSW4RnTSjQgAsZAxd0dDFmFRCZac2fKge89feZT2lnKz5XRP7rxRtkNAvHKbqiB33hjCfK0w42eO6EAz+x71r50AkQFA8Wj3mAC2OUfqx8fkvIBAYHgWR9HHxqUHjn5fHO4ZIZkHXuAMOFsos/jwblf7KHJMfBN4mAzP6IIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745289629; c=relaxed/relaxed;
	bh=Wuhh/TBYeam+nC6yC/O/v03N69+rG6bSS92mduqrHAE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J4xyX0qVXu/3W9tjXo09JU8gMEgN0JwMtT+eS3fVqQVguCuqEtbBGZRoXePecBF/2+w2nmTfZMZxHeL28WXySyCyCLLIM6gziil0KwQz9v17M8lLZQNAYuA/hZVeWusbHqq8VS43lX8vTOSrEIzHB0kUWfYB7WJ+mnUu76mU6+S+lxtMwv729H8vbVuugI3goODAq8D4Dd/gh69nLF/vKsHuBh0ke/mG6a0H2EBr5D5rq6HCOq5siw3v4MkIEDVEfqKpy8HGYm+X7eA6XStOD07YRlxx0Nc/l65vfyv9LvB0XbuPu7Zt5u5vQjWKAV/v8PrYhsMJs6XN6E38jXIJxg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass (client-ip=91.218.175.185; helo=out-185.mta0.migadu.com; envelope-from=ben.collins@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.185; helo=out-185.mta0.migadu.com; envelope-from=ben.collins@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 531 seconds by postgrey-1.37 at boromir; Tue, 22 Apr 2025 12:40:29 AEST
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZhRL51H1Sz2yRn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 12:40:27 +1000 (AEST)
Date: Mon, 21 Apr 2025 22:40:04 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ben Collins <bcollins@kernel.org>
To: linuxppc-dev@lists.ozlabs.org
Cc: Scott Wood <oss@buserror.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	linux-kernel@vger.kernel.org
Subject: [PATCH] 85xx: Add several root nodes to probe
Message-ID: <2025042122-shiny-vicugna-28507c@boujee-and-buff>
Mail-Followup-To: linuxppc-dev@lists.ozlabs.org, 
	Scott Wood <oss@buserror.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org
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
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="njrs3bnfcssymytq"
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=0.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--njrs3bnfcssymytq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] 85xx: Add several root nodes to probe
MIME-Version: 1.0

T4240 fails to hafve ifc, rapidio, and localbus probed.

This matches other QorIQ platforms and ensures devices under these nodes
get added as platform devices.

Signed-off-by: Ben Collins <bcollins@kernel.org>
Cc: Scott Wood <oss@buserror.net>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
---
 arch/powerpc/platforms/85xx/corenet_generic.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/powerpc/platforms/85xx/corenet_generic.c b/arch/powerpc/p=
latforms/85xx/corenet_generic.c
index c44400e95f551..c81b8a47f3b0f 100644
--- a/arch/powerpc/platforms/85xx/corenet_generic.c
+++ b/arch/powerpc/platforms/85xx/corenet_generic.c
@@ -61,6 +61,9 @@ static const struct of_device_id of_device_ids[] =3D {
 	{
 		.compatible	=3D "simple-bus"
 	},
+	{
+		.compatible	=3D "fsl,ifc"
+	},
 	{
 		.compatible	=3D "mdio-mux-gpio"
 	},
@@ -91,6 +94,12 @@ static const struct of_device_id of_device_ids[] =3D {
 	{
 		.compatible	=3D "fsl,qe",
 	},
+	{
+		.name           =3D "localbus",
+	},
+	{
+		.name		=3D "rapidio",
+	},
 	/* The following two are for the Freescale hypervisor */
 	{
 		.name		=3D "hypervisor",
--=20
2.49.0


--=20
 Ben Collins
 https://libjwt.io
 https://github.com/benmcollins
 --
 3EC9 7598 1672 961A 1139  173A 5D5A 57C7 242B 22CF

--njrs3bnfcssymytq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEPsl1mBZylhoRORc6XVpXxyQrIs8FAmgHAYMACgkQXVpXxyQr
Is/u8RAAi2lE1gs0W6x62/w3eY4OZ8pEG9T58Z5JcBQ9YgW65BmYGsqVPZwbzplu
OV69z8HJ6ug5trtfHghiQT8Safo2kJ9KvIxHxYF6ni9/LIlnYICdhU/7ewKCdxqQ
7JYcd5Jcg5MEC5OaiMzy3PUIzcuVfCKcCsCMjTjPDQiihfv/+ZGc5TobQstuARxB
BmaeWwr2e8xXthPYu3C48ayHBg3VlYK5zHhA6H8W6R6RXY8jr20pQMtwidKok0gA
3XgXyil4Vr3Zyk2rE1QfxkcE3SXBnd4nwgyVXM02eX0v9MPg60z2sn2WriwbW3rc
D7LVfgYK19hoKdKblskE49UjyRZX47/MUpGDrNFi8KeqFwDatArFYeATgANG2tDo
hQwXWsENBh+IUf06WkBvZkrLhwuii2/FSUikYTBOGJdKQKw0QUChLaTmh19dOgW8
lhzx5/CJJHBByZ0z5eTuM0vd/BEw3m5ILdnw8Ge1rCes2S3ODRLB38E+eURUUQ32
0OXNmSyaqgcVrDZvw301/YoLPAOlLpGeHzA5Op87xeGSjE9iU9giAd2Gz37v9AW1
csIAM/EFc9nJeij6SbMNepFzNooakJ0jwdmhFZgqvi5pirU7UhahTb7x725zoUbJ
EvpdXuV4/xicEQJfkxuLwH2U87lKEIPjFa7oyUClRczWYVSJ/pE=
=8ZNj
-----END PGP SIGNATURE-----

--njrs3bnfcssymytq--

