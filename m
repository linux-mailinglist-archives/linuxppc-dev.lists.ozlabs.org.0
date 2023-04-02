Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 791906D3706
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Apr 2023 12:09:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pq8rl33L5z3cNN
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Apr 2023 20:09:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jPxlT2QG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pq8qs6Lqrz3c46
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Apr 2023 20:08:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jPxlT2QG;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pq8qr0BCTz4x1d;
	Sun,  2 Apr 2023 20:08:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1680430121;
	bh=0faWMLSs10CRD0mCDx/WUmkEtbZqufletK33FUqJucM=;
	h=From:To:Cc:Subject:Date:From;
	b=jPxlT2QGEYSUIZi+vehnng7GzGnMeKkNt5LkiTDf6QdfPco9MZ1UJoZcCAYzyJjVd
	 sCbQ002SY4J3yVvM9Dwo50qkjdiKyDT4Tbk+NW5Hk/W+jeZmJ+rLYSAfDgDWUR+qUl
	 tmkl3yEwFo+8c6t1b7jtDnza2Cgf0pQZQTRyEdf8ymHmcuCDpT0LC8e2r1fUKXhbVH
	 dcgCr/UjkLFq4zy6JdWD8PDNyt0AFxxBpve5cX5hs4rn6K6RfejbM32lIHss5QKmia
	 jUbIbqUG2IB2+snlNJmbvCb23CcWyZmHSrFFmm0y69/6RN7mafSYYIJy79NgJ5sEkO
	 Ti0ssaDWyEBPQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.3-4 tag
Date: Sun, 02 Apr 2023 20:08:38 +1000
Message-ID: <87lejabnq1.fsf@mpe.ellerman.id.au>
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
Cc: axboe@kernel.dk, linuxppc-dev@lists.ozlabs.org, haren@linux.ibm.com, linux-kernel@vger.kernel.org, bgray@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 6.3:

The following changes since commit f2c7e3562b4c4f1699acc1538ebf3e75f5cced35:

  powerpc/mm: Fix false detection of read faults (2023-03-15 20:48:53 +1100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.3-4

for you to fetch changes up to eca9f6e6f83b6725b84e1c76fdde19b003cff0eb:

  powerpc/pseries/vas: Ignore VAS update for DLPAR if copy/paste is not enabled (2023-03-29 23:01:35 +1100)

- ------------------------------------------------------------------
powerpc fixes for 6.3 #4

 - Fix a false positive warning in __pte_needs_flush() (with DEBUG_VM=y).
 - Fix oops when a PF_IO_WORKER thread tries to core dump.
 - Don't try to reconfigure VAS when it's disabled.

Thanks to: Benjamin Gray, Haren Myneni, Jens Axboe, Nathan Lynch, Russell Currey.

- ------------------------------------------------------------------
Benjamin Gray (1):
      powerpc/64s: Fix __pte_needs_flush() false positive warning

Haren Myneni (1):
      powerpc/pseries/vas: Ignore VAS update for DLPAR if copy/paste is not enabled

Jens Axboe (1):
      powerpc: Don't try to copy PPR for task with NULL pt_regs


 arch/powerpc/include/asm/book3s/64/tlbflush.h | 9 +++++++--
 arch/powerpc/kernel/ptrace/ptrace-view.c      | 6 ++++++
 arch/powerpc/platforms/pseries/vas.c          | 8 ++++++++
 3 files changed, 21 insertions(+), 2 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmQpU+AACgkQUevqPMjh
pYAtgw//bMBbJvHS3zysyA4ADuISc5asa73axQJ8UK9je0UqeprA6z+DEocFIY+w
Tr6J4/0ynX5fbtAGOBQfaiiv3bhRzsZF7XFo6dw+Gy7kqPshjaF7hR/By4jNcva4
pM84AKaPQAnkeOntkxkExSWYyWLA7sjYlLdkPxnoifqH3WELOLCas9Be9NmUgKDi
kcspsRVeTdVlQuRS+mVJ62AHixfBz1ZmZcq9i1m4vrhvajlWtfp1TKb7xjIBAydL
el3yiNPlQa5W2aLuJM/+i/33Fik89jJ8muUssMIBL+1rVVzFcoLY/f/Tbo7i4ex1
+kwtSGRdp5N9EZglpUSmQobe/fc1dmx52aa0HFpnIpUKbd62oeKrAtvNowVx+UGa
zU5keDwCqUysweGtfDbIrn12828CQV50hywgwkF0r6wv2dqaJ6NVRWMsnGIFumV4
6i2ZLc014ixdju6xdL67hFPUl0WU/Nx+T9kKT1+9qEzOvsR9SUS8TuMcQkfNs7JL
zueSYJM3yf7J/EqKroyqnDgsR+UWApMMuOfXjEEeDLTAoGpzY2RdJ5Zh8tej7S7o
lAKbQC2s3g2/amNmySr9D19YWXAmQBaxk3t10J2Jvj5ccVlNMbrwjfrNFxOats2L
ZHELf7F/O9x5X21BpWypHKGZWq7GJx1uYGArGHgBjCrEUNR+7Aw=
=sL3a
-----END PGP SIGNATURE-----
