Return-Path: <linuxppc-dev+bounces-10082-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAE9AF83D0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jul 2025 00:46:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bYBhM3pNSz2xRv;
	Fri,  4 Jul 2025 08:46:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.28.40.42
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751566901;
	cv=none; b=CJZEfMmAwC00xkYj97G7LBN0Se3GU5PEgnkaGgwdqdrL72+dg09NHcEvHNyyD9q6kDwOxGjNik/NAqGVYjArwHAWdy8YzkRFtpYruFfzOx/zpBFSa6czRd61NWTiDA044swRa+KglvTN1ttntJRkKafutBIM4DlHMj0F0l2h0vcXu0BKXU8by8Baa9jdzEofH/mI3wg4BM/0jxfCNStwvs3fdEaPrujnymkzqk21qhO2wAGIp0Amc1H21prA/DtyqiJ3giPXAFrcOGouC7u7r7U8WNZE9Xr9F9vuHUEgBHgM35KnncG4U02paheVYYtDP/5nfWQKDzvC3rcrBFi9ug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751566901; c=relaxed/relaxed;
	bh=SPcCi4k/Qc+gWJuC3Kyt5CBeq4xZ4D/ykkJKRPG1Qpk=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d6sDnh0WA1cNaMLEz2qQWlAV9uPO8jAXgzbIr7gp6Y5GE46zFfFJG2XPK3+da1RniLra0YnuQbx39dW02B4VYxKkWb6lU1cBAC9rKKpc/pKGzHlrV3wDya8BQtSyhaQUfSicjkEZ7JW2VxUSzqolGvbUkUPpPYl+78KXDcRVv4i2Ni4xNg1KABEFwdmI8JEqlDdy3cl/Uy28+7fdVO2ZNU/TTJlRnEvTEd4i2ypldsVpxd8BAdQRZXbaJJoqMuunZfRzlpMiSdZZ7vcJMMDw8k77LfC6jtk5ripKKqVIFaUV8MOcJ0jqcLqY3yjRTZK26WPTu4zy5UVxtDkyv4eyVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nabijaczleweli.xyz; dkim=pass (2048-bit key; secure) header.d=nabijaczleweli.xyz header.i=@nabijaczleweli.xyz header.a=rsa-sha256 header.s=202505 header.b=QW5qVGwH; dkim-atps=neutral; spf=pass (client-ip=139.28.40.42; helo=tarta.nabijaczleweli.xyz; envelope-from=nabijaczleweli@nabijaczleweli.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=nabijaczleweli.xyz
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nabijaczleweli.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=nabijaczleweli.xyz header.i=@nabijaczleweli.xyz header.a=rsa-sha256 header.s=202505 header.b=QW5qVGwH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nabijaczleweli.xyz (client-ip=139.28.40.42; helo=tarta.nabijaczleweli.xyz; envelope-from=nabijaczleweli@nabijaczleweli.xyz; receiver=lists.ozlabs.org)
Received: from tarta.nabijaczleweli.xyz (tarta.nabijaczleweli.xyz [139.28.40.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bY4pq6zYKz2xgQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 04:21:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nabijaczleweli.xyz;
	s=202505; t=1751566893;
	bh=06IeWF9g6Lb/SjkAAwsA/jpMDxmYsB7Fb6EiMaWIDz8=;
	h=Date:From:Cc:Subject:From;
	b=QW5qVGwHCDUGU4UUj6IZGMufAeyWhcUAQSjuHPUXDZcURwGz2dSgu6Mr+qkjS2nVT
	 s+uUcyFoKFsQvnK9P3+Og6o852nJpDKUjMknmlLON4qW+FKRuasxn1G+DVaNVy80qF
	 HxjuTOxsFBJ03ydPX5h+oxEKBBJWXmgF6NkTB9LWUNejLE0CbPdLCKaC9Hw4VKkLzG
	 4F2SJzWs+NctD+Vgar5aSqPMXlRzxOcxfN28+x54CEGXmbaNzjtM+dUQgKRK+yvGEC
	 zwvCTZuwCzWiLx6gqPQN3XdjDQGYzxSe9Ul3bLUm7uwyoVfbOYiNgKs36ucGefqFrJ
	 6CvjWRebfxxtA==
Received: from tarta.nabijaczleweli.xyz (unknown [192.168.1.250])
	by tarta.nabijaczleweli.xyz (Postfix) with ESMTPSA id 3455494E;
	Thu,  3 Jul 2025 20:21:33 +0200 (CEST)
Date: Thu, 3 Jul 2025 20:21:33 +0200
From: 
	Ahelenia =?utf-8?Q?Ziemia=C5=84ska?= <nabijaczleweli@nabijaczleweli.xyz>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Shuah Khan <shuah@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] selftests/powerpc: fix "for a while" typo
Message-ID: <mt5r57q2pgllk3gy4ayasoymkdeqocqbdlkm3mw3mb3u7h34ms@tarta.nabijaczleweli.xyz>
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
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7kbtponqicmp274g"
Content-Disposition: inline
User-Agent: NeoMutt/20231221-2-4202cf-dirty
X-Spam-Flag: YES
X-Spam-Status: Yes, score=5.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
	FROM_SUSPICIOUS_NTLD_FP,MISSING_HEADERS,PDS_OTHER_BAD_TLD,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Report: 
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.0 SPF_PASS SPF: sender matches SPF record
	* -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
	*      envelope-from domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	*  2.0 PDS_OTHER_BAD_TLD Untrustworthy TLDs
	*      [URI: nabijaczleweli.xyz (xyz)]
	*  1.2 MISSING_HEADERS Missing To: header
	*  2.0 FROM_SUSPICIOUS_NTLD_FP From abused NTLD
	*  0.5 FROM_SUSPICIOUS_NTLD From abused NTLD
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--7kbtponqicmp274g
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Ahelenia Ziemia=C5=84ska <nabijaczleweli@nabijaczleweli.xyz>
---
v1: https://lore.kernel.org/lkml/h2ieddqja5jfrnuh3mvlxt6njrvp352t5rfzp2cvnr=
ufop6tch@tarta.nabijaczleweli.xyz/t/#u

 tools/testing/selftests/powerpc/tm/tm-tmspr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/tm/tm-tmspr.c b/tools/testing/=
selftests/powerpc/tm/tm-tmspr.c
index dd5ddffa28b7..0d64988ffb40 100644
--- a/tools/testing/selftests/powerpc/tm/tm-tmspr.c
+++ b/tools/testing/selftests/powerpc/tm/tm-tmspr.c
@@ -14,7 +14,7 @@
  * (1) create more threads than cpus
  * (2) in each thread:
  * 	(a) set TFIAR and TFHAR a unique value
- * 	(b) loop for awhile, continually checking to see if
+ * 	(b) loop for a while, continually checking to see if
  * 	either register has been corrupted.
  *
  * (3) Loop:
--=20
2.39.5

--7kbtponqicmp274g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEfWlHToQCjFzAxEFjvP0LAY0mWPEFAmhmyiwACgkQvP0LAY0m
WPH+fhAApqheEM4jQWQXOKaysF1B5Qibd8R0hWrB88uMXBRia/CSYfa4ZePI1+0D
mB7pe+lSIRuu6uQ1ZfHtrZoIKEVe0a+bTPU1BN7vdOjaLb6xn9dtgLhPZMzP0Atw
apXhRayZTOeUmFSwzCj9xrpExIRQiAnfN9wiXxcYgnRnkOQ45z7aOib8yDiq4IRA
qWcPOm6l7ONolQleJ+aQsL2ETGSNRyy2qmgOFLbvN6jEJH+rcioGZurKo7f1wULw
bqxIK7KuL8pVCaDQIf3xnl6et9aY76CNiXAWtlzfhtDSkgfKIosjA6PhlSe6okkj
gMHM3ooWtp5RTfZ91Dlfu9udxVvmwA8leX+22FbBoCCO4h467fyLXD+VsuYFPtl3
DRndFOA18ryQitJuaws8lLIhxIrVwq6p+hApAcHAI/pWG/agoPdYwh0TK1m6MOVS
Tbxg9Bejvw8Jzw7QldxM42xyKDX3FGZ2+Kiu1WHvu745RDFaqRsynJqh1BMtQ0GI
cLMME8tGUs3lmQEG225oyZkmIZ38jzE+wL0pu5QACEeWB+qXReYxzLIwKEpJgG2I
MX1sLLB6YMEkbNRYu225jZuOGvfgV+wQ28Xrbx+H+RizWVQXhnIWijs/YTiEaRpf
VPMW2MdOoVnIZ946db7bE7uEdkGl7gz+jELAMILMnSkclKTWze8=
=pdeB
-----END PGP SIGNATURE-----

--7kbtponqicmp274g--

