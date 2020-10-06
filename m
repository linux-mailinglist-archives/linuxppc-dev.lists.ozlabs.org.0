Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4249A284769
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Oct 2020 09:36:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C58RY596SzDq8x
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Oct 2020 18:36:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C58Pm5jrBzDqJC
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Oct 2020 18:35:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=GnOTvKeg; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4C58Pm1lTHz9sSs;
 Tue,  6 Oct 2020 18:35:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1601969708;
 bh=G6drw9dezd1UQq/NLkRw5u/t3LndYUdAFJyNKx+CzdU=;
 h=Date:From:To:Cc:Subject:From;
 b=GnOTvKege9v1FY64dpaggBASKEsPYj/bA02lkfzXxEIe6bk9YaiVQO6ZXnZLrU6BS
 lLDZWSMFemZ/D0w15OLKZEBKRUrHDgnrqubCy7mqWXm2YcElxqF7ueL6qo23Fp4TJU
 WpKmrwQDJ/Yl0M20eisumg/9HBul0s8xvUvb6Kl6oreKbWW4A8RAEr729O2fI65VXR
 Su+ub4xG5DOxtdM24IRC3Bp4U0An3de9vmw5zj9i3xRUJxgz7fR5nv/3lADhwAftR+
 Ik99YC63Pw20UJm6SFdT+sqe4uguAOXZzct+jUU4hBg8vBQfsVXJBL++0ea2CAqHob
 90IAjltMOTWTA==
Date: Tue, 6 Oct 2020 18:35:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Michael
 Ellerman <mpe@ellerman.id.au>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: manual merge of the char-misc tree with the powerpc tree
Message-ID: <20201006183506.186a3562@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GfSsT2Kfmr2d+e01ablFb9.";
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/GfSsT2Kfmr2d+e01ablFb9.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  drivers/misc/ocxl/Kconfig

between commit:

  dde6f18a8779 ("ocxl: Don't return trigger page when allocating an interru=
pt")

from the powerpc tree and commit:

  4b53a3c72116 ("ocxl: fix kconfig dependency warning for OCXL")

from the char-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/misc/ocxl/Kconfig
index 0d815b2a40b3,947294f6d7f4..000000000000
--- a/drivers/misc/ocxl/Kconfig
+++ b/drivers/misc/ocxl/Kconfig
@@@ -9,9 -9,8 +9,9 @@@ config OCXL_BAS
 =20
  config OCXL
  	tristate "OpenCAPI coherent accelerator support"
 -	depends on PPC_POWERNV && PCI && EEH && HOTPLUG_PCI_POWERNV
 +	depends on PPC_POWERNV && PCI && EEH && PPC_XIVE_NATIVE
++	depends on HOTPLUG_PCI_POWERNV
  	select OCXL_BASE
- 	select HOTPLUG_PCI_POWERNV
  	default m
  	help
  	  Select this option to enable the ocxl driver for Open

--Sig_/GfSsT2Kfmr2d+e01ablFb9.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl98HioACgkQAVBC80lX
0GyRfwgAkidgqs1bB97u1dg5aB8UkYvfzipcPVv0yYNpMfOfY4gi1gnGFaw0SUPg
TJJRwISUFftQujmrSnTEKWuEqho2V1p0qaPcWabJTCRd5Ub+cJvdRcjKQZwJJNFm
5FnnTNjyadVmYtryS4P6vj4L+M5d/8zQBbF9o6e6j2Xir73D4mJCH0l/e0RFfcK6
hMNOXphi+28UnfJm1byvlRmEHlRX75jCQCHJJnRHlvXHL6VDhdJ8zo+P1gAzQXH9
cpcrUPE7RqtTZ/j8I2sXPVZ2LmrvGRLzlKj8kEbXu+jM5CX/QxzRwtJ/QDXwlR3/
toM9myajY6ov87LBx1OvxgNcdEXg/g==
=BlnR
-----END PGP SIGNATURE-----

--Sig_/GfSsT2Kfmr2d+e01ablFb9.--
