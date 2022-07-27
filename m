Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CFD582603
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 14:01:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LtC6r3CChz3dp4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 22:01:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=Fqh1dDSo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LtC6D5Hjbz3bbQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 22:00:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=Fqh1dDSo;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LtC6C5kF3z4x1V;
	Wed, 27 Jul 2022 22:00:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1658923252;
	bh=22jeZx+EVHGac2JcBwvKlgVHJYKPVNQxebwTZeaFzUs=;
	h=Date:From:To:Cc:Subject:From;
	b=Fqh1dDSoZi8cU4OabBNSemQYrWqxOBkHCwW63ygbWnzpPxO7iY4f811rYdqhnDmw4
	 PmoNt3LCOU1EE7QCcyBZjZGJCuiXz74/hYr3d8C21D3JokPEJZF5kXq2adgSYUAOjY
	 UQQEOfEPS/4AklSIDfBv8QGAS6zRuSPSJbzjYK7fuwoADkF60Iw4VlEUwMXCM8kGfv
	 qdxjrBWNDXK2buAJzqByI1jwbEot7T+7b0PtYgkRlfr5GgWbshKGPHjIlKW/IKuuel
	 lLZ5818RaZzHUeIcrXuhoLT6iC4ug1DYiumutGSTiYWWbDAWU/Kf8TJ1ZD/9FWvpJf
	 k2vrzXeEP6xkQ==
Date: Wed, 27 Jul 2022 22:00:50 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: build warnings after merge of the powerpc tree
Message-ID: <20220727220050.549db613@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//DrwmQVWtZ5uWe5YwoEux_E";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_//DrwmQVWtZ5uWe5YwoEux_E
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the powerpc tree, today's linux-next build (htmldocs)
produces these warnings:

Documentation/powerpc/elf_hwcaps.rst:82: WARNING: Unexpected indentation.
Documentation/powerpc/elf_hwcaps.rst:100: WARNING: Unexpected indentation.
Documentation/powerpc/elf_hwcaps.rst:117: WARNING: Unexpected indentation.
Documentation/powerpc/elf_hwcaps.rst:122: WARNING: Unexpected indentation.
Documentation/powerpc/elf_hwcaps.rst:144: WARNING: Unexpected indentation.
Documentation/powerpc/elf_hwcaps.rst:5: WARNING: duplicate label elf_hwcaps=
_index, other instance in Documentation/arm64/elf_hwcaps.rst
Documentation/powerpc/elf_hwcaps.rst: WARNING: document isn't included in a=
ny toctree

Introduced by commit

  3df1ff42e69e ("powerpc: add documentation for HWCAPs")

--=20
Cheers,
Stephen Rothwell

--Sig_//DrwmQVWtZ5uWe5YwoEux_E
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmLhKPIACgkQAVBC80lX
0Gylqgf/VhEW/3p/YXhdwtMCrAVqT7nkj47Yeq1oLvycZndbTg4n0+nYdYgw32uI
B6Kg+3ZSyBzZa0PQcDWHqvqbkuvI7ouOAu5gsuA7r+S5NxToPxfRo5qSYe1/Jj8e
05U79pFxm5kE0o6sas9B7SURMNsLEj/sm/5/KOblu77Z1we3+mthYn5RadnKFl/g
ye0DmX1+CH0/3/VshQAXgwmjSsDGPS7BMgxpIMK6Y8C37T05K3/nBPeNqMGjbp4H
BPhrn00zLCO8dvlSxhxf143sExHKrSDvYulQFI7KWVm+2HJk6BjzYvylnyaxgeXC
kA9nPb91VByJKWtQ0sbWm/RGvSWtDA==
=7Q5q
-----END PGP SIGNATURE-----

--Sig_//DrwmQVWtZ5uWe5YwoEux_E--
