Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59ABF232734
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 23:57:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BH6pP3HPrzDqnn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 07:57:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BH6mM1xPCzDqgd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 07:55:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=Djc/rBMj; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BH6mL5mgbz9sRN;
 Thu, 30 Jul 2020 07:55:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1596059731;
 bh=feb3M2Tk7QoN+CzEDFxCJPGadKxz1RoZ7BeKRMA8ws0=;
 h=Date:From:To:Cc:Subject:From;
 b=Djc/rBMjXX06vHBQ6rISKwYiBCTgzF7w6G7b7UcN8xfz2tv5rcu7JTBlTAoQNcTLm
 eUkTv3nFcSig2ivGJ7SNl7tefJzb8gOejqKTSHJyDKDj1jDM5aR/UfXfM7WDdcg2IV
 McLqLa/k7I7MKC9J61qh6jXDgm5Py92ivciH0R5zfoKkzCj11BsPYeT5YRSOEivRL6
 +9ZSHHly3y+yiwSWLrXatiipqjfLI8wyShqDCURY6xEWqA0LarSvyEQ48syImKK1GK
 Sq3u37Ba9ekKUU38k/RuUofMF0AHopRnx+eub1MX6Xo6oLsfdwfdqo8C7jGhwmDSJ0
 jtL4cVjjI/42A==
Date: Thu, 30 Jul 2020 07:55:30 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: Fixes tag needs some work in the powerpc tree
Message-ID: <20200730075530.02c7eb5f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ftLvL+EvRwAOYve/warG=5m";
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/ftLvL+EvRwAOYve/warG=5m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  443359aebce0 ("powerpc/perf: Fix MMCRA_BHRB_DISABLE define for binutils <=
 2.28")

Fixes tag

  Fixes: 9908c826d5ed ("Add Power10 PMU feature to DT CPU features")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

Just a hint for the future.

--=20
Cheers,
Stephen Rothwell

--Sig_/ftLvL+EvRwAOYve/warG=5m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8h8FIACgkQAVBC80lX
0Gykmgf8Dx0n7wa4xu6xO0gRMPjJuLp/+yab4jJ+BjqOQ/nY1RXB2jXEqOjon6Gw
3+C0L4ZwCnPlLmkoc5eGa2mauYfqqn9xvB5LwdtG9wt2weymCgNmPeRQ5zmNeupQ
9kuavgmrBK48SVxuMapq6goBse7azECS6LBAexuvKjye3FKS6njxIZh/Msb0cPLS
mQtH6FikGwkNRNeWOlMHWTSRJSk0DUKZD9H/AHhjolcXV0aGw2Qskx+5+FV4vrt2
9CUg1I4FprDueCDJUV0tBTZGDPaewDXUJ1sYDFvp/ZSjFBrgZvI/HfDDvOXaXVQH
QscrAe9TkG0mXDbnVUe9D3iSqAA9Hw==
=g8tK
-----END PGP SIGNATURE-----

--Sig_/ftLvL+EvRwAOYve/warG=5m--
