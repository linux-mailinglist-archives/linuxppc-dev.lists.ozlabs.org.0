Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC075F38B2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 00:16:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhFYg3gB9z3dq1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 09:16:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=HZa29eeG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MhFXm3xnFz2xrk
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Oct 2022 09:16:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=HZa29eeG;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MhFXm2JWFz4xGd;
	Tue,  4 Oct 2022 09:16:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1664835368;
	bh=/ywn/hJ/rhTn2xvBQYEHB9QtHev1+jTnleFfK94jVz0=;
	h=Date:From:To:Cc:Subject:From;
	b=HZa29eeGup4/9cpjWUxrvUoxeahZgkZrk/zR4ACYDDP2vjPucOseIaUZi/Tjij/10
	 z6pWIg24yMJb6S6gHVDS8wgKq4hr7XdbwiVin/Vhb3mZ2qndcoIKBDAvzr0hy1qZE+
	 X1fMVeyVokgUfnFlei5pAl431oKJNpbiXYV1JT3/BzCB1nstpLFbjbLLb4/vxlWOFc
	 JTMH05uPwLxs5LHkCOo/daV5hsj9WWX4KWT+6qWHFj1thUZa3+VSzsRpx1n1cX+IKn
	 sxgAj0hM5+3TkqvpYPBNLa63e14Av9c8zew0fkm+VvaoA5iN7+KiN+gNYrxmnWZ8TS
	 +lYic6ne/3LHg==
Date: Tue, 4 Oct 2022 09:16:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>, Masahiro Yamada <masahiroy@kernel.org>
Subject: linux-next: manual merge of the powerpc tree with the kbuild tree
Message-ID: <20221004091606.71418ddc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9HMZ9obeKa+3ea5v+n8bH7G";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/9HMZ9obeKa+3ea5v+n8bH7G
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the powerpc tree got a conflict in:

  arch/powerpc/Makefile

between commit:

  ce697ccee1a8 ("kbuild: remove head-y syntax")

from the kbuild tree and commit:

  dfc3095cec27 ("powerpc: Remove CONFIG_FSL_BOOKE")

from the powerpc tree.

I fixed it up (I used the former version of this file and added the
following merge fix patch) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 4 Oct 2022 09:13:46 +1100
Subject: [PATCH] powerpc: fix up for "kbuild: remove head-y syntax"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 scripts/head-object-list.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/head-object-list.txt b/scripts/head-object-list.txt
index dd2ba2eda636..e8219d65c3b7 100644
--- a/scripts/head-object-list.txt
+++ b/scripts/head-object-list.txt
@@ -34,7 +34,7 @@ arch/powerpc/kernel/head_44x.o
 arch/powerpc/kernel/head_64.o
 arch/powerpc/kernel/head_8xx.o
 arch/powerpc/kernel/head_book3s_32.o
-arch/powerpc/kernel/head_fsl_booke.o
+arch/powerpc/kernel/head_85xx.o
 arch/powerpc/kernel/entry_64.o
 arch/powerpc/kernel/fpu.o
 arch/powerpc/kernel/vector.o
--=20
2.35.1

--=20
Cheers,
Stephen Rothwell

--Sig_/9HMZ9obeKa+3ea5v+n8bH7G
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmM7XyYACgkQAVBC80lX
0GzpvQf+P5/iiucN2fRIfc3bLL+7KzxSdMuT1y/bgbpO7Zb2eO1zqdfJiuioOTPm
Gv9/OT/3RRZDty764WEwdyvLgnLoz/G2cfQv8kJ9UiR7wq8qVqwpnvedWnfMpIgi
Vzobx5AfhtAKR80z/ouKwa8T5GzEOfNkJK0DtAKrSi4NGPYqjcDwTdhJqLP8QxJE
eMOROgBNBgsJNJzgx9YhgwX/zBAiU7dIe+RAh1CEbyBEjqM72X34oLlhXQ1Qr6r0
76NJgMJEHztLLNDoGBRRu37qz6ZB+VU/cMBc+c/18lV2B85+Hf+Z8xeayogRqdvX
jBAIEBTQ0B8XSUxx1ljyolb3kV+xrA==
=qf9g
-----END PGP SIGNATURE-----

--Sig_/9HMZ9obeKa+3ea5v+n8bH7G--
