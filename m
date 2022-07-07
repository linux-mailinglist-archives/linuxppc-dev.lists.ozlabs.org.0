Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F435569BC4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 09:36:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdpBZ6z1Jz3c99
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 17:36:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=gHtGI2X0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdpB10bQqz3btr
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 17:36:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=gHtGI2X0;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ldp9x3mG9z4xbm;
	Thu,  7 Jul 2022 17:36:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1657179366;
	bh=vJnXxPcjofl/dIJrG3s69roSNP0Kb5CB+IRWv7rORRU=;
	h=Date:From:To:Cc:Subject:From;
	b=gHtGI2X0vmZHZixH4ZZI+WRrjaGc64TL9zROPmNVrw30p9Y1UVdbPUlajGvYhwCjv
	 m86XwVgMJ4whkOqsU2S8nMlVOUJk2I/6+0IbydzL8efm0z45dTGdkfmrN2HDci05iT
	 I4p447ZUA8xXIQkhwVo8U3tHfUfv8cFB9HMO9el6ENsal+PFQkD6SFPpGHQLSTIrYY
	 JfytQO4kmg8BtO6UqgAdN/NuZ94GSuiZhOKSLnHMzgYQuO9rIMs3MEruV/a/F+Dn1r
	 Lji6kxxSEBuYjmZMFDwb5rY86N+0TtTyjasZOP62RNfdlQjfIjFH/PzmlREdL4sP0W
	 7BuqNfOZOFVjA==
Date: Thu, 7 Jul 2022 17:32:52 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Michael Ellerman <mpe@ellerman.id.au>
Subject: linux-next: manual merge of the random tree with the powerpc tree
Message-ID: <20220707173252.5fff21f2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/e5AqtJECmuDQE_Wb4bb0LJU";
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
Cc: Juerg Haefliger <juerg.haefliger@canonical.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/e5AqtJECmuDQE_Wb4bb0LJU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the random tree got a conflict in:

  arch/powerpc/Kconfig

between commit:

  cea9d62b64c9 ("powerpc: Kconfig: Replace tabs with whitespaces")

from the powerpc tree and commit:

  a2ff4b7600cd ("random: remove CONFIG_ARCH_RANDOM")

from the random tree.

I fixed it up (the latter removed some lines updated by the former) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/e5AqtJECmuDQE_Wb4bb0LJU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmLGjCUACgkQAVBC80lX
0Gzc1wf9Ecu/28vZactDStc5fH3/HRfTbzKkFbYUF1KJILODaEiaY2CQpOsiD9OP
gfgbJbZzimGQJXXsQef2Q8PFaZB54zryJIJz6NQmLOke380U7EFETj5uEPlhDP6i
gahF6cUCQVq9UZvwd5dq38ZmeBW+xBQ3RYv0juOwphXzJuD40a98/yuaXUGgAaRA
A+awkuyzhI+FiAPLHvyQOH5SC5fMgJYBEfJhnxBED3ciZ9xZ4V63352XhxU5cIyO
QgLfcvXiviRQKWgklcBITAcmgmisf3RYytJAkzGoJ2Lh19fUlNl9wkztgCNrqQ94
wpsHrq5MDnbLKNC6hY5OO0143Y5j0A==
=fyUJ
-----END PGP SIGNATURE-----

--Sig_/e5AqtJECmuDQE_Wb4bb0LJU--
