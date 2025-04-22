Return-Path: <linuxppc-dev+bounces-7874-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9870A95C5A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 04:51:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZhRZb0zqHz3bsQ;
	Tue, 22 Apr 2025 12:51:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::b4"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745289637;
	cv=none; b=dXITRSIrUWhNuzNw3ZZBl5BVea7whWIWIhLZ+B+jhkxLvxEUDzpEc6nMKggg9EeZv6c4gFCCUKYv08psN5t0RPgUkcvhD5FjnXCmREk26e06eUQJu7Cs1YbncvlhKWuKRHd1y89qbTqCTpm0HNmqkpOo8dTJydlf9BBWvp4lqCTLNU2uDUVF9S13GoUO8hng1Xj2aQ9YTPpuSyFrxS+oq2PBL18EFeB7gWa97mVbMefnVNF9lIYsqr6+bU3nH7qJk5lQRxdWzkiBfadYMyJf5WBInPAZXJCnZ5J9fpQvBxHVcsLxbzFM+bN15CEkMq+0IuaDLkVLWUtKgmBfE5HTSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745289637; c=relaxed/relaxed;
	bh=yEQlYFQOCFUoz3+grLTGT9fklmE5IKSbwXCDl90jhDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YKBCuRnEpXGxlcKX77iRuS5+jgR1pyDbxwohboKPYYyH6IROwnb9Tjxi7KhDVQYTxzQD/t8dwJlj4mw9gkuXjLVrCYu40RnGbeVpRSiQeEAz5P3bHHMYsLTkSlCdc/UdXbfY76rfn0Iq0Kg8JpXv1Ul9Nm9xJb5TMAwbJtwE+JaKmkbLK5kBxR7SDD8p17fu6qCAaaztTi7HApvS00Br5F8rUCFJnT14W5Nwo1a8yGSrvNBT7i8or1Av/4BgmueemjdFGLPKwuOi1FZbg1U8A9GK3LIuXXfjkiIysoWmbNEWyS7pxFugHyF20oJqwGTVmDTBXugXgP/v36ZzxPBDXQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass (client-ip=2001:41d0:1004:224b::b4; helo=out-180.mta0.migadu.com; envelope-from=ben.collins@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::b4; helo=out-180.mta0.migadu.com; envelope-from=ben.collins@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 533 seconds by postgrey-1.37 at boromir; Tue, 22 Apr 2025 12:40:37 AEST
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZhRLF1xnqz2yRn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 12:40:36 +1000 (AEST)
Date: Mon, 21 Apr 2025 22:31:13 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ben Collins <bcollins@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/addnote: Fix overflow on 32-bit builds
Message-ID: <2025042122-mustard-wrasse-694572@boujee-and-buff>
Mail-Followup-To: linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>
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
	protocol="application/pgp-signature"; boundary="7zvi5okcyrtudtse"
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--7zvi5okcyrtudtse
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] powerpc/addnote: Fix overflow on 32-bit builds
MIME-Version: 1.0

The PUT_64[LB]E() macros need to cast the value to unsigned long long
like the GET_64[LB]E() macros. Caused lots of warnings when compiled
on 32-bit, and clobbered addresses (36-bit P4080).

Signed-off-by: Ben Collins <bcollins@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/boot/addnote.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/boot/addnote.c b/arch/powerpc/boot/addnote.c
index 53b3b2621457d..78704927453aa 100644
--- a/arch/powerpc/boot/addnote.c
+++ b/arch/powerpc/boot/addnote.c
@@ -68,8 +68,8 @@ static int e_class =3D ELFCLASS32;
 #define PUT_16BE(off, v)(buf[off] =3D ((v) >> 8) & 0xff, \
 			 buf[(off) + 1] =3D (v) & 0xff)
 #define PUT_32BE(off, v)(PUT_16BE((off), (v) >> 16L), PUT_16BE((off) + 2, =
(v)))
-#define PUT_64BE(off, v)((PUT_32BE((off), (v) >> 32L), \
-			  PUT_32BE((off) + 4, (v))))
+#define PUT_64BE(off, v)((PUT_32BE((off), (unsigned long long)(v) >> 32L),=
 \
+			  PUT_32BE((off) + 4, (unsigned long long)(v))))
=20
 #define GET_16LE(off)	((buf[off]) + (buf[(off)+1] << 8))
 #define GET_32LE(off)	(GET_16LE(off) + (GET_16LE((off)+2U) << 16U))
@@ -78,7 +78,8 @@ static int e_class =3D ELFCLASS32;
 #define PUT_16LE(off, v) (buf[off] =3D (v) & 0xff, \
 			  buf[(off) + 1] =3D ((v) >> 8) & 0xff)
 #define PUT_32LE(off, v) (PUT_16LE((off), (v)), PUT_16LE((off) + 2, (v) >>=
 16L))
-#define PUT_64LE(off, v) (PUT_32LE((off), (v)), PUT_32LE((off) + 4, (v) >>=
 32L))
+#define PUT_64LE(off, v) (PUT_32LE((off), (unsigned long long)(v)), \
+			  PUT_32LE((off) + 4, (unsigned long long)(v) >> 32L))
=20
 #define GET_16(off)	(e_data =3D=3D ELFDATA2MSB ? GET_16BE(off) : GET_16LE(=
off))
 #define GET_32(off)	(e_data =3D=3D ELFDATA2MSB ? GET_32BE(off) : GET_32LE(=
off))
--=20
2.49.0


--=20
 Ben Collins
 https://libjwt.io
 https://github.com/benmcollins
 --
 3EC9 7598 1672 961A 1139  173A 5D5A 57C7 242B 22CF

--7zvi5okcyrtudtse
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEPsl1mBZylhoRORc6XVpXxyQrIs8FAmgG/3EACgkQXVpXxyQr
Is/yBQ/+OH7WmDD0UgLyzSDN8gylSgSZxSBsTU1JQOVVCXY68ULJiqoJgAtpzboC
wREgv6f8N6AzyklLxwlGDNfUSOespy9c76Z1/Hr0uoUwnUy1VA1ODKSQJIpgIDPZ
40mj9Fa1nhMnFJ6bS+ljYzSn6MRzEs2HOv9vxsDUWoZW5mdLAzcVHVZ167e81l8M
/31tWQOymIrS0Ink+HpXyYvsv6Pr40iRCCD5bWnsBHqrbF/dCJ/L7VAmPSJeB6F6
FDAggldX4gvLDjApYkXV/CLX8zbCnXTQV6D68FSeMPuK6OnNsU2FVkTIsbb5g7lZ
282OQYwc36fYizRxW/LXvMYCknE3BfXAzjwFS4DUzOXyauPgn+IXGZCkyOeCoLaA
lqvKNZsPNQP98clLGkI9Bh0yoQbL8tLCd6/icdIoJuCCPX+58UeCcJcaEUMKzK8q
SAkfB14xtiKgBG5xfinUBx4fKxrEefX2Cn+WJy1/gMvf4JpqBJeaMmccxh8QuWPP
o0HdNi7uI+/+VbGkGbevcHsetrjIaf0cmxippf8l656OHAcAg2wfbts/M3ta+AgV
UF5JlunaoEO3n9Ju56NlsQSllnch46F+oaUADF6rvhQtXkOPboECXEVOjVLBgBW2
br+5nhZoYlGhc08lQ3zJ1+Jlyy53DUofCOO00BqRBtjdfACrljs=
=Q31h
-----END PGP SIGNATURE-----

--7zvi5okcyrtudtse--

