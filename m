Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D77235658
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 12:50:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKHqM0MskzDqNj
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 20:50:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKHnV6N3fzDqP3
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Aug 2020 20:49:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BKHnH019cz9sTC;
 Sun,  2 Aug 2020 20:48:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1596365342;
 bh=0e58QyusNP7dBqOpUMMNzByT3A8iFjdlwagp9rs7fZg=;
 h=Date:From:To:Cc:Subject:From;
 b=Xbc+rEINC/p8zdMP+wVqqxEYzzUg/s2Trwsg5PiaxXCKJdhlz4Ailqan+untf9cXa
 zJXvEU+96RTuI5t/iUJTbDy2cNq1ktxJDxdxQJ8wkEpzGe8vf5EnljHXCbsplzApAJ
 gjczTxgVNtgkTh0I9Xkt2bSBvnCzpT/hj43DjS5jaI60mMErx+iFTsc396SR55bOZe
 d6/u2VL+7KYetz5csrN+5qDId8Q17KayHwxszQXltc+WBhNAXorgnIwY6xlVaqWlS6
 irxVQOxwk1Ww23sGxIfAZo2i6MBuZgjDd4x2iG12afCEa1rIgpghe9Y8QrVbAyZ0HE
 NeKWjjhCcMJnA==
Date: Sun, 2 Aug 2020 20:48:42 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Linux-kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: powerpc: build failures in Linus' tree
Message-ID: <20200802204842.36bca162@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/11ws0faSnCwwRvv=pFh50XV";
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>, Willy Tarreau <w@1wt.eu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/11ws0faSnCwwRvv=pFh50XV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

We are getting build failures in some PowerPC configs for Linus' tree.
See e.g. http://kisskb.ellerman.id.au/kisskb/buildresult/14306515/

In file included from /kisskb/src/arch/powerpc/include/asm/paca.h:18,
                 from /kisskb/src/arch/powerpc/include/asm/percpu.h:13,
                 from /kisskb/src/include/linux/random.h:14,
                 from /kisskb/src/include/linux/net.h:18,
                 from /kisskb/src/net/ipv6/ip6_fib.c:20:
/kisskb/src/arch/powerpc/include/asm/mmu.h:139:22: error: unknown type name=
 'next_tlbcam_idx'
  139 | DECLARE_PER_CPU(int, next_tlbcam_idx);

I assume this is caused by commit

  1c9df907da83 ("random: fix circular include dependency on arm64 after add=
ition of percpu.h")

But I can't see how, sorry.

--=20
Cheers,
Stephen Rothwell

--Sig_/11ws0faSnCwwRvv=pFh50XV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8mmgoACgkQAVBC80lX
0GyMiwf7BGCTCa8gdMsCcoo7i7NE9aJ+ZyU9KTXFRUteezTWskZrIwBlt73NEHY4
UhXvkhsdhxmsIst8p2gPiX6nNQHhjHT1z7Z4ZyJzTTKPvsAEsJjqje1oWaxDF51l
Q03MnxjXOTy+csqq0HzDmdJAOVV+B1NuRST9+1PwoMOnNIlF1qnEGv1yoSVTjnMX
bW37I8ONw4Alw733Ipp31Sd2FW/JzanHtXF1QqjOY1KoJI7aYDrg2+leHZ/v1Tlr
TWsmLWeKFD6F9S03VHbbmvOMRAkBW7OZk6XRqgmIeTAye6FA2Q/BfS+/JYOthXtk
bOHzW2BicikZoUugvnh0ZEC6i66nIQ==
=3kRN
-----END PGP SIGNATURE-----

--Sig_/11ws0faSnCwwRvv=pFh50XV--
