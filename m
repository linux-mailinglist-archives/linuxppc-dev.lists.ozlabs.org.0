Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A2E2D27EE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 10:42:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqwFK18BGzDqPm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 20:42:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqwC91LlhzDqVx
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Dec 2020 20:40:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=LOz5JpQj; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CqwC52zT5z9sWC;
 Tue,  8 Dec 2020 20:40:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1607420420;
 bh=SgR9rRLLr1wpSVNkvx0TwzJ8HMz7bq3+cs6tsbyEc2I=;
 h=Date:From:To:Cc:Subject:From;
 b=LOz5JpQjYf5HjjNeBUWfIuVZ9Lb7SNwdTt1qvJYyPtbLFfBZkcPivMFh1ibHAZ+Rt
 Rv6pNwkispda+2UI76IJ3A657fFA4Xnf5zoW3P8EwjTM4XCtdLdYqCtujQXiPuK9UL
 K9JBckgl8HB2DzV7MKLs8LfrMxIaQhHrbnw8GXoIFPzalD6VC+x5Y2voQssPl8BBfs
 RgvquyeAv51BA64SsxBzb1bbwRYb173dqRCJS9ZLMHLfomVvgGqLOZq3mPRaUtCmWc
 NHmWTdL/kn4JFsRsPeKjt1kcCaX8UzC4as9w7teAYwajS0c70HCk40HOUwYVkATern
 CYBlEqmdxhOng==
Date: Tue, 8 Dec 2020 20:40:16 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>, Michael Ellerman
 <mpe@ellerman.id.au>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: manual merge of the akpm-current tree with the powerpc
 tree
Message-ID: <20201208204016.4eb18ca4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WhuzseIJmOBCjIOtWW=K0=l";
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/WhuzseIJmOBCjIOtWW=K0=l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got conflicts in:

  drivers/misc/lkdtm/Makefile
  drivers/misc/lkdtm/lkdtm.h
  tools/testing/selftests/lkdtm/tests.txt

between commit:

  3ba150fb2120 ("lkdtm/powerpc: Add SLB multihit test")

from the powerpc tree and commit:

  014a486edd8a ("drivers/misc/lkdtm: add new file in LKDTM to test fortifie=
d strscpy")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/misc/lkdtm/Makefile
index 5a92c74eca92,d898f7b22045..000000000000
--- a/drivers/misc/lkdtm/Makefile
+++ b/drivers/misc/lkdtm/Makefile
@@@ -10,7 -10,7 +10,8 @@@ lkdtm-$(CONFIG_LKDTM)		+=3D rodata_objcop
  lkdtm-$(CONFIG_LKDTM)		+=3D usercopy.o
  lkdtm-$(CONFIG_LKDTM)		+=3D stackleak.o
  lkdtm-$(CONFIG_LKDTM)		+=3D cfi.o
+ lkdtm-$(CONFIG_LKDTM)		+=3D fortify.o
 +lkdtm-$(CONFIG_PPC_BOOK3S_64)	+=3D powerpc.o
 =20
  KASAN_SANITIZE_stackleak.o	:=3D n
  KCOV_INSTRUMENT_rodata.o	:=3D n
diff --cc drivers/misc/lkdtm/lkdtm.h
index 79ec05c18dd1,6aa6d6a1a839..000000000000
--- a/drivers/misc/lkdtm/lkdtm.h
+++ b/drivers/misc/lkdtm/lkdtm.h
@@@ -102,7 -104,7 +104,10 @@@ void lkdtm_STACKLEAK_ERASING(void)
  /* cfi.c */
  void lkdtm_CFI_FORWARD_PROTO(void);
 =20
+ /* fortify.c */
+ void lkdtm_FORTIFIED_STRSCPY(void);
+=20
 +/* powerpc.c */
 +void lkdtm_PPC_SLB_MULTIHIT(void);
 +
  #endif
diff --cc tools/testing/selftests/lkdtm/tests.txt
index 18e4599863c0,92ba4cc41314..000000000000
--- a/tools/testing/selftests/lkdtm/tests.txt
+++ b/tools/testing/selftests/lkdtm/tests.txt
@@@ -68,4 -68,4 +68,5 @@@ USERCOPY_STACK_BEYON
  USERCOPY_KERNEL
  STACKLEAK_ERASING OK: the rest of the thread stack is properly erased
  CFI_FORWARD_PROTO
+ FORTIFIED_STRSCPY
 +PPC_SLB_MULTIHIT Recovered

--Sig_/WhuzseIJmOBCjIOtWW=K0=l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/PSgAACgkQAVBC80lX
0GwEsAgAk4+6coRYdOFpzQs6pyo/XwOgK5qgBdXPsG7VYHQSQbt54tZylrmTvyrs
Q7sjjQnIvo0VxUlllPKV7i/A0v9G4cVcrWB6/fMfz2sjO5Hq45YnsJagT7xD04VX
cm1Fq3UCxrdACXhaVlR1JydEYEzAyplTjyGgpdgwB1Gv7nucW2uWtahusIIaB7s3
vv3DB+YSt8tjuVtzjNhI+OhiW8R0ExUnaa95F0Rsy8OrgFjdnH9f59GBlL+a3HKc
rvMfBS4M5kcf64Uik5SEHTs1ejWkzmL77S2EDZNWpBkYu4FHJXG1AMg3YIn/T7JW
AufpfmXzECUqaK8Ev3wfdi6QhOGx3Q==
=n6NW
-----END PGP SIGNATURE-----

--Sig_/WhuzseIJmOBCjIOtWW=K0=l--
