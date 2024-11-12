Return-Path: <linuxppc-dev+bounces-3128-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 063999C6483
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2024 23:52:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xp1rz4bY0z2xmS;
	Wed, 13 Nov 2024 09:52:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731451955;
	cv=none; b=UjQGWLbB6Qzg7QeGRH7sd103mKfEfdwXZjAwwaL0bQ1iLqgxYqFn6Hrm2lfwgMvUzy70cdWPvN0gurWb/dJNReoIQQSUd030zKL9PHUDn1Sye5SonIeSqyhCNdLV0/G6cJeNUbsnD0t2KxP5fHL5LEeidRYz0Y6VC8TxKUGZfy/4KzqnDFUA7BYxixOs5hPTg+VhjzvIYXTG1/gGSxGY4+agpThYGK/WXAqAJlFNi3ItUNerQohmeKSLmwe16c+ljStQTl0pRfoOI49aRT/YHM9ZHE0t1ifUVH0mSPjDWgMC6wOZvI5Jri8adycInB38wsRimvw/2E/WT3cNIHyxfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731451955; c=relaxed/relaxed;
	bh=5SUS8h1FDCOnKZcauReWecwOZMznU7f7Y2JZrN2r7SM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=j04Y1sQ7whXweo8TpsRCCIwjOL9mfBpv3pHL5JAnOp0jR80bbu5YBwKXWwUBQNbfLVlHZvLpnRd3Ocj5c5QvRsQ50uUog+t94PHl4P6X3tXDV4aC9dJRaKJd6XA6zCXX0hZejUY8ATWzPOrpmnEMNgihGMkfE5kd6IvQLFPDaATCl4acCx4y3/FgvbziIFaEeo2EdLcj90FzV75AyeTTMZNJf/5ZHCM7TRMOKxZT085ub6sl++4W7kxS8o5T17Cy27+CBnRO9YJHCUVVfuHpr5cSuuac3++kyv9aTzQLQxFTlDmEiLNxjjW5qu//nJSvKjDYNMwOBTCfKw7rfyR7tQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=CXXu+kDI; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=CXXu+kDI;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xp1rv5p6vz2xjL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 09:52:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731451947;
	bh=5SUS8h1FDCOnKZcauReWecwOZMznU7f7Y2JZrN2r7SM=;
	h=Date:From:To:Cc:Subject:From;
	b=CXXu+kDI+tNZf5t4hU+9MepqNkXRKecTsLUDfkD8cLhBKKdyTWYfquSsJlpvF344Y
	 VKVZmOOmhNNbDuDGIr1+IdqpkfduvmuizhJOsnSTmP50eP7UnFsti56DPD1lx8VgAh
	 ybOU6Qru/ua/RVb6FlAF8hgAp/Q/nH/YbFBj7HWWyzZ74KSJdzEC8QDcLpyVgg8xGM
	 MojYK0H7AIh22pR7GEvnEg6QdXactTsEURGPnzSy/nAKnolByGXvjD3/Ru5p09CmCw
	 u57X2oGdq8zoFQEukwFRl8UH4SVOwFBSnkeirkBLEK+DE4yUAhoijg28X+QRQBBkkp
	 KdSa3KzeVEP6Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xp1rq4VQPz4x8C;
	Wed, 13 Nov 2024 09:52:27 +1100 (AEDT)
Date: Wed, 13 Nov 2024 09:52:28 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Masahiro Yamada
 <masahiroy@kernel.org>
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>
Subject: linux-next: manual merge of the powerpc tree with the kbuild tree
Message-ID: <20241113095228.4ac96776@canb.auug.org.au>
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
Content-Type: multipart/signed; boundary="Sig_/OJSHOma8eTbb221uzinmuQ5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

--Sig_/OJSHOma8eTbb221uzinmuQ5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the powerpc tree got a conflict in:

  arch/powerpc/Makefile

between commit:

  de51342c5157 ("kbuild: add $(objtree)/ prefix to some in-kernel build art=
ifacts")

from the kbuild tree and commit:

  bee08a9e6ab0 ("powerpc: Adjust adding stack protector flags to KBUILD_CLA=
GS for clang")

from the powerpc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/powerpc/Makefile
index 321b596d2550,99af7953e844..000000000000
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@@ -402,9 -403,11 +403,11 @@@ prepare: stack_protector_prepar
  PHONY +=3D stack_protector_prepare
  stack_protector_prepare: prepare0
  ifdef CONFIG_PPC64
- 	$(eval KBUILD_CFLAGS +=3D -mstack-protector-guard-offset=3D$(shell awk '=
{if ($$2 =3D=3D "PACA_CANARY") print $$3;}' $(objtree)/include/generated/as=
m-offsets.h))
+ 	$(eval KBUILD_CFLAGS +=3D -mstack-protector-guard=3Dtls -mstack-protecto=
r-guard-reg=3Dr13 \
 -				-mstack-protector-guard-offset=3D$(shell awk '{if ($$2 =3D=3D "PACA_C=
ANARY") print $$3;}' include/generated/asm-offsets.h))
++				-mstack-protector-guard-offset=3D$(shell awk '{if ($$2 =3D=3D "PACA_C=
ANARY") print $$3;}' $(objtree)/include/generated/asm-offsets.h))
  else
- 	$(eval KBUILD_CFLAGS +=3D -mstack-protector-guard-offset=3D$(shell awk '=
{if ($$2 =3D=3D "TASK_CANARY") print $$3;}' $(objtree)/include/generated/as=
m-offsets.h))
+ 	$(eval KBUILD_CFLAGS +=3D -mstack-protector-guard=3Dtls -mstack-protecto=
r-guard-reg=3Dr2 \
 -				-mstack-protector-guard-offset=3D$(shell awk '{if ($$2 =3D=3D "TASK_C=
ANARY") print $$3;}' include/generated/asm-offsets.h))
++				-mstack-protector-guard-offset=3D$(shell awk '{if ($$2 =3D=3D "TASK_C=
ANARY") print $$3;}' $(objtree)/include/generated/asm-offsets.h))
  endif
  endif
 =20

--Sig_/OJSHOma8eTbb221uzinmuQ5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcz3CwACgkQAVBC80lX
0GynbQf/QT9xN5Sadagwxsdm+jnyJshU9thoOA+VE1BCgAD92+Ejeoqi9n4OaHyW
Znl+GF3VDsGajimTDFXoOJM1Wo52jvMNonXMezv4gpR/q2SobxfoKQ8MhKDW2gnF
ZdSeoSWKxCEeNYuMNMoDDwFuncgz+CXTrQIBFnJc1R4tZfUjLU9aDcu1zT20c9w7
ohToakX5p4aizTudR7Hqcb0jvV0LcxuZUGa3x2dqc1humE2D2JRADrMbc2dj0cKV
OvZMQia1n4v6gxz7IgzJSGu0thVwNXB9MRNH17UnHOegxIgh0U4xsDZ1nslllAQz
u7ZR+nJ6JhTxsjFXuLXv3TVILH6BjA==
=STb3
-----END PGP SIGNATURE-----

--Sig_/OJSHOma8eTbb221uzinmuQ5--

