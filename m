Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB225F38A4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 00:13:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhFT66VqTz3dqm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 09:12:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=nEhFnZ4+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MhFSB6tG6z2xsL
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Oct 2022 09:12:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=nEhFnZ4+;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MhFS64cPlz4x1F;
	Tue,  4 Oct 2022 09:12:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1664835126;
	bh=0c+SzmccFkv+qi7iD7DLPmYckdmiYVEdqmGxGj+h9t4=;
	h=Date:From:To:Cc:Subject:From;
	b=nEhFnZ4+dmTDVXYht1hFM97IUlmTdGSsDwMt0Nxe1KHuvFJkT232Th8rMrdWdLKp+
	 GWF26cSSseYAgGy56ookATcllUj2aVCcG8VYMLklidqxHVCBtlhhqLgUJeRjDIUCTV
	 m/BAD5FyJ/EulQwUISCO4vjlNyhpCdMTzmDdwExWZlB33kMtf0o4lJmKCktonIvDBx
	 AiwKWZ2zAd+WoE8C2k1lcalANaJGAaUiEUtYmEjkH9jaiVYj5mgCfqbvZJb89Ao/jE
	 6iQH0V8Eoi/vqYMvS29B20NSZdxkM3dshnAyWFbFnGnDqfSblsQvByOEAYPIZpQSFH
	 GpH7f1AskpsQQ==
Date: Tue, 4 Oct 2022 09:12:05 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>, Masahiro Yamada <masahiroy@kernel.org>
Subject: linux-next: manual merge of the powerpc tree with the kbuild tree
Message-ID: <20221004091205.2677b823@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CJ3sH5PGGLeblzCGnmsurzf";
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

--Sig_/CJ3sH5PGGLeblzCGnmsurzf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the powerpc tree got a conflict in:

  arch/powerpc/kernel/Makefile

between commit:

  321648455061 ("kbuild: use obj-y instead extra-y for objects placed at th=
e head")

from the kbuild tree and commit:

  dfc3095cec27 ("powerpc: Remove CONFIG_FSL_BOOKE")

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

diff --cc arch/powerpc/kernel/Makefile
index ad3decb9f20b,1f121c188805..000000000000
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@@ -118,12 -116,12 +116,12 @@@ obj-$(CONFIG_PPC_E500)		+=3D cpu_setup_e5
  obj-$(CONFIG_PPC_DOORBELL)	+=3D dbell.o
  obj-$(CONFIG_JUMP_LABEL)	+=3D jump_label.o
 =20
 -extra-$(CONFIG_PPC64)		:=3D head_64.o
 -extra-$(CONFIG_PPC_BOOK3S_32)	:=3D head_book3s_32.o
 -extra-$(CONFIG_40x)		:=3D head_40x.o
 -extra-$(CONFIG_44x)		:=3D head_44x.o
 -extra-$(CONFIG_PPC_85xx)	:=3D head_85xx.o
 -extra-$(CONFIG_PPC_8xx)		:=3D head_8xx.o
 +obj-$(CONFIG_PPC64)		+=3D head_64.o
 +obj-$(CONFIG_PPC_BOOK3S_32)	+=3D head_book3s_32.o
 +obj-$(CONFIG_40x)		+=3D head_40x.o
 +obj-$(CONFIG_44x)		+=3D head_44x.o
- obj-$(CONFIG_FSL_BOOKE)		+=3D head_fsl_booke.o
++obj-$(CONFIG_PPC_85xx)		:=3D head_85xx.o
 +obj-$(CONFIG_PPC_8xx)		+=3D head_8xx.o
  extra-y				+=3D vmlinux.lds
 =20
  obj-$(CONFIG_RELOCATABLE)	+=3D reloc_$(BITS).o

--Sig_/CJ3sH5PGGLeblzCGnmsurzf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmM7XjUACgkQAVBC80lX
0Gzrhwf+K+L9GgrO9Z5+wx/WZVQcN4vQgA5tF+Yan3IyiYXlGsQyZYn6+nhuPZ51
WD24iaPE67tedyZk/3VHIuG1ZdFCu++/19D4MtEO2Dilq7XYhXY1PB0q4rLlyZkp
UhU9E/oi4CH5WfRwlu2eIWgWqnu50tdVfYDxMXBbEfZyc1If3eh09PDVkvBZBdJ2
cJXIr7d4HZvEeJZ7PqDrdq9s47Q5mgnyhUngDj2HV/HYgV23wwd2VgFnatltMK58
OoUfZWauGJkTUOWEDRylAYcYvH0O8031/WoKoAjoeBCtY1CTh/q02SyPWhjbsSBP
Ys27ZJgFpnkyO4EnVn2z/jPOA8ilKw==
=JLWo
-----END PGP SIGNATURE-----

--Sig_/CJ3sH5PGGLeblzCGnmsurzf--
