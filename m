Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0691D912D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 09:38:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49R76Q3xJQzDqNL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 17:38:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49R6mk2QBfzDrLj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 17:23:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=ZljnTLzv; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49R6mj2b5Wz9sPF;
 Tue, 19 May 2020 17:23:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1589872997;
 bh=fm3/tATrAoXqTVvMa/B2iTLxXsnYu0FCK43ABfBVGtw=;
 h=Date:From:To:Cc:Subject:From;
 b=ZljnTLzvF6ZMfdTUqkBzlUIaUlr6dR/xMzFEkPpomW2Qcdwhbj41e1SP+ewCK631i
 GVqB7J9dGKw/QMwgIuXl9yDNXG6rsj0eHLP+WLejaHc3IxNxjfENg3WzqgflXlCE+V
 AT5ATUzF5euh4NXfg7cbsWha97yQrZXSGvyZvCJyzTl4nfLkPMZXVcKSiTPlB/HdBf
 R6FBe+A8aj2oQUWPks87QtrcrW+ZUtcPF1R168rFZKMv5KfPsHLatBmdjmOODXYdKl
 3kxtI9M6QSjTI1ZTBxbwQT5waTlBF8GfdRg4Vsn8vbrFMU5HRiHXzTVXH23IMfsS8w
 +aJOsPpZu2CwQ==
Date: Tue, 19 May 2020 17:23:16 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Paul E. McKenney" <paulmck@kernel.org>, Michael Ellerman
 <mpe@ellerman.id.au>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: manual merge of the rcu tree with the powerpc tree
Message-ID: <20200519172316.3b37cbae@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RyBJk_rS_Gx3yS0K5/j43lV";
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
Cc: Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/RyBJk_rS_Gx3yS0K5/j43lV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rcu tree got a conflict in:

  arch/powerpc/kernel/traps.c

between commit:

  116ac378bb3f ("powerpc/64s: machine check interrupt update NMI accounting=
")

from the powerpc tree and commit:

  187416eeb388 ("hardirq/nmi: Allow nested nmi_enter()")

from the rcu tree.

I fixed it up (I used the powerpc tree version for now) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/RyBJk_rS_Gx3yS0K5/j43lV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7DiWQACgkQAVBC80lX
0GwZPAf/cPBhPN6cLwgUjG2OMKLg7D/X4Ay9qr9KUqtvaj0bCQ0Qw/KkU+8/RDGA
X1SaRWnlNGEhz+nKyuNePBGLohcoWnta7yXvjxJSfdAX6/EJYd7Sak5HNwTcZE/e
kyD9Ur+RgvsbqUGmYF1etEcYnZL3/KLuGHPF/SikKdDxVdQCIRmL1SlEMi8gfOjc
PaVl+38fsi8JFlO1pAigmiNo0pCzijp8NTvrYlTLRwBFjk6MXSOoBU5DrYg3pYHF
VCOGgkyTj/NATiy30exWNbk+O+OYTuGcwFCmTi6hArq1fJBoRC1B3B9vSdPJJVkC
I5YibpxQ9No7zGGlc2bfBqyIrAZUSg==
=IY1W
-----END PGP SIGNATURE-----

--Sig_/RyBJk_rS_Gx3yS0K5/j43lV--
