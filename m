Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 677BF934525
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 01:49:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=Z+LnhLwo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WPXhX27Plz3cZ5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 09:49:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=Z+LnhLwo;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WPXgj02N0z3c5R
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2024 09:48:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721260090;
	bh=ceg7+ctfX7CD3PPYZQGMs9DNxj+fO0JSKmVo/H/Im/8=;
	h=Date:From:To:Cc:Subject:From;
	b=Z+LnhLwo808NiwJmP1eBRbgeDCtktY3rGl8H2mg+Mloun5AZGZdQDzEqnlfLyLVyR
	 UgdhGBc4qOdGSHudCdNm3IEJTTvdtsfaM3DoW8b+k0lr36WziccZxWu9e93t8dLUPp
	 BwFB07IAvey6HvoxHr2r/zHi/86oYSgMLADmtZpva6sB/kYRUQ9yczROAX90jUT4SB
	 pSzkDeQW9jk1EhTcEvevEyswE10cOCg6VA7FZswoRHHkSVEiTN3J1ulv+GWbBpOKX1
	 0Lb3MOa2D0pRd9QezpksHFp9NzaKboymq8fNqMM17harrqxyN1SW4VWKiXDD27enLI
	 jVnv8zIpFD4Rg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WPXgZ1Vlcz4w2F;
	Thu, 18 Jul 2024 09:48:10 +1000 (AEST)
Date: Thu, 18 Jul 2024 09:48:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Daniel Borkmann
 <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Andrii
 Nakryiko <andrii@kernel.org>
Subject: linux-next: manual merge of the powerpc tree with the bpf tree
Message-ID: <20240718094809.204e67dc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sp3SdhcSw_c+G=ot+UMWlot";
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
Cc: Networking <netdev@vger.kernel.org>, Naveen N Rao <naveen@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, bpf <bpf@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/sp3SdhcSw_c+G=ot+UMWlot
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the powerpc tree got a conflict in:

  MAINTAINERS

between commit:

  c638b130e83e ("MAINTAINERS: Update powerpc BPF JIT maintainers")

from the bpf tree and commit:

  e8061392ee09 ("MAINTAINERS: Update powerpc BPF JIT maintainers")

from the powerpc tree.

I fixed it up (I arbitrarily chose the latter version) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/sp3SdhcSw_c+G=ot+UMWlot
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaYWDkACgkQAVBC80lX
0GxyAAf+JmnNzyxJbGRCHXcF0wckEuwkJwYHSRsrKK0g7taq502Z4jbJzqz7luvC
TROzcPrg8XWIA+M37pkKfwT8mYaSfL3GwwR+p3cZEf2s0pqpqkDTcrpsIj70/rHw
zj/T43/aX2yXSV3TzuZXTI2kwqSTNx5WSnQZ+FNjSMn0NwlUX7oi36xjjs+3wwAZ
9Ut8rdlUuEUBlJt5cmZJX6mfFrbfz7GwG9pY7XvzjxDwH1HtP3d3MROs/DuPq48L
7dIuFZoC3IHbNrxpUpUKT+rS/xweyVrQuWiyAAmlJokziK4hy45iwz58WVdaHk8c
hkSCu04Fnpf0tbNtyojvzKjfTHkuWg==
=NjXF
-----END PGP SIGNATURE-----

--Sig_/sp3SdhcSw_c+G=ot+UMWlot--
