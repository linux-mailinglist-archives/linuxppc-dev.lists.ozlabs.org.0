Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F37EA552A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 13:42:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MSqL3kPmzDqcy
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 21:42:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MSnB1QjNzDqXv
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2019 21:40:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.b="i+i/DkaB"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46MSn91xDnz9sDQ;
 Mon,  2 Sep 2019 21:40:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1567424413;
 bh=YtBEn8N30LNig4IjM3QSpseznRYqbL0O14mcZ15x0/k=;
 h=Date:From:To:Cc:Subject:From;
 b=i+i/DkaBxJ+/ummk7mmRsfrU3c9NMQt9egwJ/BygIxh0SfgsClGY+6CunnOiC+h8g
 fNd5EHxk5z8WX/6vGKvPP54x7V/W+00P3HVeL/40SBIVp7YVvmawIfp6LnQ/ieOPYz
 IZuw2UneUmNoVJnJCgh6hqX5ZTyVeP09nJh6OJiGKanwCwl1idAcBFqCkwpWWasIAZ
 g+w7f6caXiKRxPXiUM7o7Hz0KjIPEhB9taoGDuG5W2CvAnGZA4+ATMdqXbTF1NPFQa
 BpNe3yEWZhrNV27QTLCv+KKPAyWKqaGUtTUHUFbT06hgKXleOcO/BDSAAx2A2AaE62
 NFfJGPo9J6X3w==
Date: Mon, 2 Sep 2019 21:40:11 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: build failure after merge of the powerpc tree
Message-ID: <20190902214011.2a5400c9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/x/Web=1e7njmi=+goy5cmBW";
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
Cc: Michal Simek <monstr@monstr.eu>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/x/Web=1e7njmi=+goy5cmBW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the powerpc tree, today's linux-next build (powerpc
ppc44x_defconfig) failed like this:

arch/powerpc/mm/dma-noncoherent.c: In function 'atomic_pool_init':
arch/powerpc/mm/dma-noncoherent.c:128:9: error: implicit declaration of fun=
ction 'dma_atomic_pool_init'; did you mean 'atomic_pool_init'? [-Werror=3Di=
mplicit-function-declaration]
  128 |  return dma_atomic_pool_init(GFP_KERNEL, pgprot_noncached(PAGE_KERN=
EL));
      |         ^~~~~~~~~~~~~~~~~~~~
      |         atomic_pool_init

Caused by commit

  f2902a2fb40c ("powerpc: use the generic dma coherent remap allocator")

interacting with commit

  8e3a68fb55e0 ("dma-mapping: make dma_atomic_pool_init self-contained")

from the dma-mapping tree.

I have applied the following patch for today (I did the microblaze
update as well):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 2 Sep 2019 21:23:11 +1000
Subject: [PATCH] merge fixes for "dma-mapping: make dma_atomic_pool_init se=
lf-contained"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/microblaze/mm/consistent.c   | 6 ------
 arch/powerpc/mm/dma-noncoherent.c | 6 ------
 2 files changed, 12 deletions(-)

diff --git a/arch/microblaze/mm/consistent.c b/arch/microblaze/mm/consisten=
t.c
index 0e0f733eb846..8c5f0c332d8b 100644
--- a/arch/microblaze/mm/consistent.c
+++ b/arch/microblaze/mm/consistent.c
@@ -56,10 +56,4 @@ void *cached_kernel_address(void *ptr)
=20
 	return (void *)(addr & ~UNCACHED_SHADOW_MASK);
 }
-#else /* CONFIG_MMU */
-static int __init atomic_pool_init(void)
-{
-	return dma_atomic_pool_init(GFP_KERNEL, pgprot_noncached(PAGE_KERNEL));
-}
-postcore_initcall(atomic_pool_init);
 #endif /* CONFIG_MMU */
diff --git a/arch/powerpc/mm/dma-noncoherent.c b/arch/powerpc/mm/dma-noncoh=
erent.c
index 4272ca5e8159..2a82984356f8 100644
--- a/arch/powerpc/mm/dma-noncoherent.c
+++ b/arch/powerpc/mm/dma-noncoherent.c
@@ -122,9 +122,3 @@ void arch_dma_prep_coherent(struct page *page, size_t s=
ize)
=20
 	flush_dcache_range(kaddr, kaddr + size);
 }
-
-static int __init atomic_pool_init(void)
-{
-	return dma_atomic_pool_init(GFP_KERNEL, pgprot_noncached(PAGE_KERNEL));
-}
-postcore_initcall(atomic_pool_init);
--=20
2.23.0.rc1

--=20
Cheers,
Stephen Rothwell

--Sig_/x/Web=1e7njmi=+goy5cmBW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1s/5sACgkQAVBC80lX
0Gz0zgf/W3JfSnlkCR8lJac0CEFjaarGLtBWuja8iV+5IdU3ryRxLwWk34wMByPt
ZbOZsr1Y2bIeE7fjHLiUOFQ18uesK4EvrnVae9sFWD5KFRTDnuXxVwKIXAZmo+GS
pZE2W/tW13cjbFu7MwWm7d4PCwZjhajMLCYLLm08gtKYE/LwlsGvwtixr3zPYG5p
sgARuWLFGJ95x8wyJ3KhIy/5MQgljB/SpJ1Rbzq3b5JhH8Tj2RfWegVlB5qW7o+D
TvoyGzeySQQ+ypGSpp9oqnYjDI1fShWQjgW106mCOHMI3xk0+/yfvBRTEa4b96Lh
RgneIWhy93djrOsgDPytsy0nZNBJ9Q==
=b7OS
-----END PGP SIGNATURE-----

--Sig_/x/Web=1e7njmi=+goy5cmBW--
