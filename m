Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9441FEA60
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 06:49:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nTxQ2Tl4zDqFY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 14:49:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nQRC0bDwzDr1D
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 12:11:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=WAj0Sbvl; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49nQR91GBPz9sWn;
 Thu, 18 Jun 2020 12:11:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1592446293;
 bh=/d/Jhma+imEvxuAxLE9c24AL1eQWO7+jWKTQDSwtFuU=;
 h=Date:From:To:Cc:Subject:From;
 b=WAj0Sbvl7Gfat/I6lvM3LprLDd6BRofv56Id2XEhtbOTr9duy/2s+DtPkz7W3MD/3
 RQ/AqEMv41xsQaLADD1N+EB/818QsKxnOTaFJdMeMzFxh0VDTnSJS9Y9UYDQS2dMI1
 s0AK+UX2SIzG3ALM+C0whl8aF4uJevgxqJ2YByZg78pKJTxuZlY1MduYEBR8rmZeNA
 gQ8THUFznuHoefAx88YJ3cgrf11lakFxeEjgx7C6CNkDOunbNBFYKAdGcbGJqGQROt
 vUSjo8fQAyFMSWjJR/pojBQs0/XjGejWOL9nxZTh03yGfWqA7Hif/9L5JMoqKwtgvI
 sdURzcF0zX//A==
Date: Thu, 18 Jun 2020 12:11:31 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <christian@brauner.io>, Michael Ellerman
 <mpe@ellerman.id.au>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: manual merge of the pidfd tree with the powerpc-fixes tree
Message-ID: <20200618121131.4ad29150@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/O856NgubTpu=wpzyxLA68e+";
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/O856NgubTpu=wpzyxLA68e+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pidfd tree got a conflict in:

  arch/powerpc/kernel/syscalls/syscall.tbl

between commit:

  35e32a6cb5f6 ("powerpc/syscalls: Split SPU-ness out of ABI")

from the powerpc-fixes tree and commit:

  9b4feb630e8e ("arch: wire-up close_range()")

from the pidfd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/powerpc/kernel/syscalls/syscall.tbl
index c0cdaacd770e,dd87a782d80e..000000000000
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@@ -480,6 -524,8 +480,7 @@@
  434	common	pidfd_open			sys_pidfd_open
  435	32	clone3				ppc_clone3			sys_clone3
  435	64	clone3				sys_clone3
 -435	spu	clone3				sys_ni_syscall
+ 436	common	close_range			sys_close_range
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
  439	common	faccessat2			sys_faccessat2

--Sig_/O856NgubTpu=wpzyxLA68e+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7qzVMACgkQAVBC80lX
0GwvewgAh+vJ/7gqcE/3Xk8Aya4tIWiLxqqpc5YVQlAH8zijoMf3p6i7hfZsuEM5
JmnLvrsiOlKdDQcmy0opuHd6HxtvVXmw3lTzShGPGb5ZDYg5tMYzWA/T8qpdGHpr
T42Da8GaxVuh9kZPLNu6AXFhe53lY/Xaol9ezWcYFrxjdcPXCbv3m7N0wlw5Hahc
hTIFCbhobIpLsC6DVQCmETW29B6Hl1hurkPA+RCR54NwIMjiFv1iBhbdYfpMZXrG
6J8wE96cwoQZJBWXrc7Ru9G78eIJGH7tmTEVMTDZuq7AfL1mXRAuJsoS9kiLHgCa
niMQB7k6Qte7mDnjdbxqVSeW+heHTQ==
=aO3b
-----END PGP SIGNATURE-----

--Sig_/O856NgubTpu=wpzyxLA68e+--
