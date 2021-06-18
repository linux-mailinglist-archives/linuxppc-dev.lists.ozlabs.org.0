Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E633AC7ED
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 11:45:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5vDW0fxnz3c25
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 19:45:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=c4dDPzFM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canb.auug.org.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=sfr@canb.auug.org.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=c4dDPzFM; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5vCy09mfz2yYV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 19:44:59 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4G5vCs0bdBz9sVp;
 Fri, 18 Jun 2021 19:44:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1624009497;
 bh=uXi1N22K4kq4QBq+OXKjx0+1W75j2S5j6clTcEGS40c=;
 h=Date:From:To:Cc:Subject:From;
 b=c4dDPzFMr/46NzUIfpuv6iR3JOW7oMFztc+UavAX9LHPSoo6FRNjlO+I54Zw0fHPk
 opCtGe9dQfPy+YJk9FdwDikgoxJOxwC8bzueuPgHsQHCgPaX6PxI3J3mIoBtamL4ef
 Bi6blF3YWXJ+zyJ/MB85LPQTfboFJsgMohKu/Y9MO8s0b6ykt4NpBQRRxxYLuRwA8O
 jfilsrN583yJ0u9rxdQ+PvdJW2/CqN07hGMQmRZicCItmZ1xGE/TTscZqAJGSxdSwB
 WeUvfpn8qOs3zvraMmjuSOQz+WEt1tIFdSqs/rDUhaZQ5EgA3nyrNF6Q3LfhQNoTyp
 /YQvV0fxchhfQ==
Date: Fri, 18 Jun 2021 19:44:55 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>, Michael Ellerman
 <mpe@ellerman.id.au>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: manual merge of the akpm-current tree with the powerpc
 tree
Message-ID: <20210618194455.0d6c278c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/M+Wq.F/4zU0/J14IKaaJLBi";
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
 Nicholas Piggin <npiggin@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/M+Wq.F/4zU0/J14IKaaJLBi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/powerpc/kernel/smp.c

between commit:

  86f46f343272 ("powerpc/32s: Initialise KUAP and KUEP in C")

from the powerpc tree and commit:

  103e676c91d0 ("lazy tlb: introduce lazy mm refcount helper functions")

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

diff --cc arch/powerpc/kernel/smp.c
index b83a59ce9beb,b289f1d213f8..000000000000
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@@ -1541,11 -1541,7 +1541,11 @@@ void start_secondary(void *unused
  {
  	unsigned int cpu =3D raw_smp_processor_id();
 =20
 +	/* PPC64 calls setup_kup() in early_setup_secondary() */
 +	if (IS_ENABLED(CONFIG_PPC32))
 +		setup_kup();
 +
- 	mmgrab(&init_mm);
+ 	mmgrab_lazy_tlb(&init_mm);
  	current->active_mm =3D &init_mm;
 =20
  	smp_store_cpu_info(cpu);

--Sig_/M+Wq.F/4zU0/J14IKaaJLBi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDMaxcACgkQAVBC80lX
0GzLXwf8C7WvRhGnluquFmE4QTsgIa5BfVUijJRQokPBLJ36guAvonwimv3k5sIW
0wXj9QKboomPEoK2XAMuAqO4xj3Q0YWrwatlMb1fH11tZB4xJ011gGDVxtJM/Xsn
U114Jh+5ISE5a6zsoaHV4EsCOcDXgdvd+exXFoi2ulKL+YSFTGv9OA7S0iPbdJGk
PUkmAfYxrOLkAvC85J4XBrzhCCwcI4eQPrjtWq2/OP0d5so5uAT6MAkUjFQYT46G
1DGw9U9gGZT4F47uhX8oTrwzpJup2SWbA76WHbUJhdj99SEyN3K0stF4KtZL/BtH
7cOczdtZrkIV+JwdCT90v/gNqhS1PA==
=F/IL
-----END PGP SIGNATURE-----

--Sig_/M+Wq.F/4zU0/J14IKaaJLBi--
