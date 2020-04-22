Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F30F11B37A0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 08:41:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496W6w27sVzDqf9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 16:41:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496W4q0H1NzDq9V
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Apr 2020 16:39:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=ULKCsgJT; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 496W4p1ZTlz9sRN;
 Wed, 22 Apr 2020 16:39:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1587537578;
 bh=HetjwFcCPllHwYqcVQt5dzRVpiFFvTaW7Z/y3khbovk=;
 h=Date:From:To:Cc:Subject:From;
 b=ULKCsgJT45PDL/BlotGATp6YVRJ6UMmpNaqtMLhQAoUQh2pJjvRkUFwwIh1pgio1c
 /qxIVp06NPT+I0bgDx1Qyx6Yq/FIrKI7Ay6u+SqB9tOiclx+p/MCY99IdydLzVEIu3
 id/SKVgWdVrGtkypkeHQ2HMXjmxPbEXwQY1696/0zRGFPiixofvXFcDBEoRMflvxcK
 OGHL8Ls3OMhCNeiXmm5QCirFBPDOlQx+Lu80H9xmPBHwlSrehxmYC+ZmW6wrdbMMlh
 9ecAKQkQWpDyo3aGxqe8+bTP8hRkXlNb1sIMFSFu35Wwe5zyk+nCBq9OyIz6Loz5FO
 B41bh7ePOYcZQ==
Date: Wed, 22 Apr 2020 16:39:35 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>, Michael Ellerman
 <mpe@ellerman.id.au>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: build failure after merge of the akpm tree
Message-ID: <20200422163935.5aa93ba5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dS27h1O0JnSRFS7JJdx_l1R";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Haren Myneni <haren@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/dS27h1O0JnSRFS7JJdx_l1R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

arch/powerpc/platforms/powernv/vas-fault.c: In function 'update_csb':
arch/powerpc/platforms/powernv/vas-fault.c:130:2: error: implicit declarati=
on of function 'use_mm' [-Werror=3Dimplicit-function-declaration]
  130 |  use_mm(window->mm);
      |  ^~~~~~
arch/powerpc/platforms/powernv/vas-fault.c:142:2: error: implicit declarati=
on of function 'unuse_mm' [-Werror=3Dimplicit-function-declaration]
  142 |  unuse_mm(window->mm);
      |  ^~~~~~~~

Caused by commit

  7fe021a3f1c9 ("kernel: better document the use_mm/unuse_mm API contract")

interacting with commit

  c96c4436aba4 ("powerpc/vas: Update CSB and notify process for fault CRBs")

from the powerpc tree.

I added the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 22 Apr 2020 16:35:23 +1000
Subject: [PATCH] powerpc/vas: fix up for {un}use_mm() rename

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/platforms/powernv/vas-fault.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/plat=
forms/powernv/vas-fault.c
index 25db70be4c9c..266a6ca5e15e 100644
--- a/arch/powerpc/platforms/powernv/vas-fault.c
+++ b/arch/powerpc/platforms/powernv/vas-fault.c
@@ -127,7 +127,7 @@ static void update_csb(struct vas_window *window,
 		return;
 	}
=20
-	use_mm(window->mm);
+	kthread_use_mm(window->mm);
 	rc =3D copy_to_user(csb_addr, &csb, sizeof(csb));
 	/*
 	 * User space polls on csb.flags (first byte). So add barrier
@@ -139,7 +139,7 @@ static void update_csb(struct vas_window *window,
 		smp_mb();
 		rc =3D copy_to_user(csb_addr, &csb, sizeof(u8));
 	}
-	unuse_mm(window->mm);
+	kthread_unuse_mm(window->mm);
 	put_task_struct(tsk);
=20
 	/* Success */
--=20
2.25.1

--=20
Cheers,
Stephen Rothwell

--Sig_/dS27h1O0JnSRFS7JJdx_l1R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6f5qcACgkQAVBC80lX
0GxE7QgAgDep0KJguHqQoY328f2BUYcc2F3HFkc3ksHyC4LFO5PQyEYD/uwXvGTT
QyGoPx8vYYUsa6On5PU6gbUicbWlYcsTZ8hmU3wQ0yyVnUtm0aoOdeEv86zanbBW
ZfAndCQXpU+A5dGDxFa5F9BrmgOXuH7ktH2aDmpIpFLR7Pzt1YL65G/hH5Dim4Mx
mzBggwT+XlIo+ah3dpGGjJfhfk5/aT36KwCWCsEjsh+qg4B+qYfpdbNbt7KrrpGo
ItU0D3xB0UVbIpYuAQQ51RjlR+KHqp91Ar9DTpY2Hw9gcBQXDLcU4QxwqbP+TAwC
LFaZRxtW33PHIuOnGNR0BUeyKTfR9g==
=iRvE
-----END PGP SIGNATURE-----

--Sig_/dS27h1O0JnSRFS7JJdx_l1R--
