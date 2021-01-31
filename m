Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEA6309BDC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 13:09:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DT8xw4MQtzDr7D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 23:09:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DT8td3bxyzDr6Q
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 23:06:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=k8qogh1O; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DT8tc4BJ9z9sVJ;
 Sun, 31 Jan 2021 23:06:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1612094776;
 bh=pk/16qIX80DlJO9jvOHQeDUbvvNswlsOYjrJcXuhhOc=;
 h=From:To:Cc:Subject:Date:From;
 b=k8qogh1OaK/b5Ef4mtQ+vFmqhgJBT+cM1+hgAI4M0NvbY8zQIxz590AgHoAWWy6NE
 GdQy6AbzfKP2t48ZUhP+Jx93eq3EJRHRLO5n28byrgxugLZcWDGVML3Lgs0Ijz9Qo9
 9yd7swzcC7q6PHvnVgMj2TEI8mPQSL4NubdtF0rrro1CCOr/Uh4urYM+inuG6qDU3W
 Ft6Kib1QdTJB6BTCCBRJE3NrVsZkKInRv6zTV8WQR8Py0UI1r+UpTLVI5RiHxf/Bvd
 nAdpfcl7NZq77X8bu/SBc9stT+sWB/XYdu+lEInSgvI60P5JaMwPeHkFcvIRz8CSpq
 FI+Z+9HBKAWNQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.11-6 tag
Date: Sun, 31 Jan 2021 23:06:15 +1100
Message-ID: <87lfc9cnuw.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull another powerpc fix for 5.11:

The following changes since commit 08685be7761d69914f08c3d6211c543a385a5b9c:

  powerpc/64s: fix scv entry fallback flush vs interrupt (2021-01-20 15:58:19 +1100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.11-6

for you to fetch changes up to 4025c784c573cab7e3f84746cc82b8033923ec62:

  powerpc/64s: prevent recursive replay_soft_interrupts causing superfluous interrupt (2021-01-24 22:27:24 +1100)

- ------------------------------------------------------------------
powerpc fixes for 5.11 #6

One fix for a bug in our soft interrupt masking, which could lead to interrupt
replaying recursing, causing spurious interrupts.

Thanks to:
  Nicholas Piggin.

- ------------------------------------------------------------------
Nicholas Piggin (1):
      powerpc/64s: prevent recursive replay_soft_interrupts causing superfluous interrupt


 arch/powerpc/kernel/irq.c | 28 +++++++++++---------
 1 file changed, 16 insertions(+), 12 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmAWmTMACgkQUevqPMjh
pYDsLBAAoGKn8ZsTEYHm/sRJ7Bsl+H+AvokytjpU9aZPOiqPgAQiUBNXDJy2ykmp
uzBWDp0J9J6waoaRxFsjHt2nOIkPwWMzvbE2QRfbmisNW4OVSvxjMncRhHVhBdpf
9bnrRI37DYVSDEx1E8RD6v5rRCrZv/CNEXwSVyf8EBcd8ExZGZy1zL01gC9F9Iwy
09JiNrqAvHay13V04GPRPCzYYUb3asCl1Im/OLKfoIKzx3cI7qYvcLh215dP7QnU
p621aLIkGw3R3Fsol2wMT4/KZljsoMXFzUp/IXoLBZUM9GeV6XRYRLRdjCO5xpoD
hVP7i7l7B468fJaOflr+qn26YvFtQsqZB3/B6NoWiDZhb/LrTieV5d6ogMO1teRu
TsAmZrXiocP7K3NiAHjRx8cdJnUhTikPCnyOMILqBoXWfPbRCJdVp5yTIcJ2ho+G
GwJ4/gXaqbCMKSctzxAzSdGaXbo3okpBRVPpYcx2/mmju9NGhFxB4+Jod4vZQnPY
/Bj5l5CJF9XzbfNSvWZ6/Q0AuhEszhhL73SrU8uh4DuhoVShr8D/Lwp+zSmdvhAf
t1YmvugpymG+GlVW5dVjHUqbVyDe5ZDprT/xwqhh51yuxMDnmmXs6tFgr4RQbBqU
St0g5NgUa44SQ//bBYVuUrRpEeqSJXg/sQ8GDp4b32oaq2db/kc=
=XoZ/
-----END PGP SIGNATURE-----
