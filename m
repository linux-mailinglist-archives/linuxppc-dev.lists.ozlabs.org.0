Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DDABF22E3AA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 03:34:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFMm101s0zDvt5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 11:34:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFMjv08FXzDsGD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 11:32:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=h2Oie2Tg; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BFMjt2QB1z9sRR;
 Mon, 27 Jul 2020 11:32:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1595813538;
 bh=Sd0QMp+dL8Xl9I/23zPlRtnU55UdXgSaX9CBCoroSaY=;
 h=Date:From:To:Cc:Subject:From;
 b=h2Oie2Tgxe4VdqETiQbQPK/848q7x4sw/9l/prnYyLvbOhKsCZ9UIgmG9Dqh7W+T0
 MESoCYuo5yiuk9mdpmSe6fBrERJ5TEB9EBctlZ6lmYdscXolmqwb4gqpVfXW3twlmc
 MhpNE+cQDNe2a9dKRPs4XVvbsShmFXdM9Y9yPwMWPIgQ8+RGRInCabPyPOy8B9A1KN
 FA0QINKwjs+M1XSPOZwToARjGS8b2Y8D0Dw0E9i/Kxs3RHMMDiBBYNUpjFN3sZmcmu
 rN0ANM9JrzeTa+pfxld+NWPnvyPq5G1ScTvw/ou3HJBRETtCQXBB+eHsvG+aHH5Ycu
 tq4+doTKIoj9Q==
Date: Mon, 27 Jul 2020 11:32:16 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Al Viro <viro@ZenIV.linux.org.uk>, Michael Ellerman <mpe@ellerman.id.au>
Subject: linux-next: manual merge of the vfs tree with the powerpc tree
Message-ID: <20200727113216.6620d08d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sVS2GV+Gl.fsQlMJEzZZfq5";
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/sVS2GV+Gl.fsQlMJEzZZfq5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  arch/powerpc/kernel/ptrace/ptrace-view.c

between commit:

  e0d8e991be64 ("powerpc/book3s64/kuap: Move UAMOR setup to key init functi=
on")

from the powerpc tree and commit:

  5e39a71bddb3 ("powerpc: switch to ->regset_get()")

from the vfs tree.

I fixed it up (I thnk - see below) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/powerpc/kernel/ptrace/ptrace-view.c
index ac7d480cb9c1,13208a9a02ca..000000000000
--- a/arch/powerpc/kernel/ptrace/ptrace-view.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-view.c
@@@ -486,23 -468,15 +468,15 @@@ static int pkey_active(struct task_stru
  }
 =20
  static int pkey_get(struct task_struct *target, const struct user_regset =
*regset,
- 		    unsigned int pos, unsigned int count, void *kbuf, void __user *ubuf)
+ 		    struct membuf to)
  {
- 	int ret;
-=20
  	BUILD_BUG_ON(TSO(amr) + sizeof(unsigned long) !=3D TSO(iamr));
 -	BUILD_BUG_ON(TSO(iamr) + sizeof(unsigned long) !=3D TSO(uamor));
 =20
  	if (!arch_pkeys_enabled())
  		return -ENODEV;
 =20
- 	ret =3D user_regset_copyout(&pos, &count, &kbuf, &ubuf, &target->thread.=
amr,
- 				  0, 2 * sizeof(unsigned long));
- 	if (ret)
- 		return ret;
-=20
- 	ret =3D user_regset_copyout(&pos, &count, &kbuf, &ubuf, &default_uamor,
- 				  2 * sizeof(unsigned long), 3 * sizeof(unsigned long));
- 	return ret;
 -	return membuf_write(&to, &target->thread.amr, ELF_NPKEY * sizeof(unsigne=
d long));
++	membuf_write(&to, &target->thread.amr, 2 * sizeof(unsigned long));
++	return membuf_write(&to, &default_uamor, sizeof(unsigned long));
  }
 =20
  static int pkey_set(struct task_struct *target, const struct user_regset =
*regset,

--Sig_/sVS2GV+Gl.fsQlMJEzZZfq5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8eLqAACgkQAVBC80lX
0GxrMAgAop/ZehtWHdSxDiwZRtYm/KeL+VDgOu/EB2NnzudtQ5fjbz5bPJ23A3Ro
eF83bAoOOFJBCRh05ih5yHRaQUT35EVYlKqs1RPgqf6RXN1cG5Pyy/UzJxwoifHU
MGMvguyLElrREbso7JqGVo2nXA4gUqyLwAZRNViuWBfUU0hOnyZppH3u1GfGfJyu
xdA6C9PSfc3ZaDQPRajM5GDBp/ZQGtKOucnW1fLnSs7GZbCnhrCPhZ5asQwcKB3P
2aiYbMGCGXcYva71IvnMC0zaDMLmDGlyrxJq06Up7PjoHYEaCWT3feD2F6W9htpv
NoH3SBihnsxmY4ccyTAKdJ7FDHiDSQ==
=LSpH
-----END PGP SIGNATURE-----

--Sig_/sVS2GV+Gl.fsQlMJEzZZfq5--
