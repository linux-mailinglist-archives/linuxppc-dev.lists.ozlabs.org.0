Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA191B8A37
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 02:00:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 498p2R6RnHzDqkT
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 10:00:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 498ns91STZzDqd0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Apr 2020 09:52:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=aGKQXrsO; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 498ns83CNnz9sPF;
 Sun, 26 Apr 2020 09:52:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1587858749;
 bh=QM5ZKcJ2tMvx9VFL3k7p8C/A0iXUIAeWTBT2WmvmMQs=;
 h=From:To:Cc:Subject:Date:From;
 b=aGKQXrsOaB69CbmCngXgy3nQdTvBRQ59ijveXFlTt3+g34Wd1J6uhgQ73ASmGhGLc
 YROHeU6R1FI6IkXcXYcU+xlaNS9j/uSfoENLb24GAHT07s/Qh59Tu6zFdGV+JPLP5k
 tisHwhlrvpf3R7ZGItxacpcvzdqRgONzSCPyek0pXkdPXfV6uk/0QKXcF/TZNivdDl
 RVl49yOB92kOinIBh1xEsPiaFj8dFPRiIFql5a1Ib5VFLy/PFzEXeYSygRSS+Dt4gO
 Mrwgv83pee6cYvnGEeGrNlh2YcwwbF8Hr+aaPY96NoSge/qLFIC4DSAkpsrGK9pSFq
 xUlz9dc8CTOww==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.7-3 tag
Date: Sun, 26 Apr 2020 09:52:43 +1000
Message-ID: <877dy3gm2c.fsf@mpe.ellerman.id.au>
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
Cc: herbert@gondor.apana.org.au, linux-kernel@vger.kernel.org,
 chris.packham@alliedtelesis.co.nz, natechancellor@gmail.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 5.7.

The lib/mpi one is all contained within #ifdef _ARCH_PPC.

cheers


The following changes since commit ae83d0b416db002fe95601e7f97f64b59514d936:

  Linux 5.7-rc2 (2020-04-19 14:35:30 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.7-3

for you to fetch changes up to 5990cdee689c6885b27c6d969a3d58b09002b0bc:

  lib/mpi: Fix building for powerpc with clang (2020-04-24 13:14:59 +1000)

Out of area changes:
lib/mpi/longlong.h	# 5990cdee689c lib/mpi: Fix building for powerpc with clang

- ------------------------------------------------------------------
powerpc fixes for 5.7 #3

 - One important fix for a bug in the way we find the cache-line size from the
   device tree, which was leading to the wrong size being reported to userspace
   on some platforms.

 - A fix for 8xx STRICT_KERNEL_RWX which was leaving TLB entries around leading
   to a window at boot when the strict mapping wasn't enforced.

 - A fix to enable our KUAP (kernel user access prevention) debugging on PPC32.

 - A build fix for clang in lib/mpi.

Thanks to:
  Chris Packham, Christophe Leroy, Nathan Chancellor, Qian Cai.

- ------------------------------------------------------------------
Chris Packham (1):
      powerpc/setup_64: Set cache-line-size based on cache-block-size

Christophe Leroy (2):
      powerpc/8xx: Fix STRICT_KERNEL_RWX startup test failure
      powerpc/mm: Fix CONFIG_PPC_KUAP_DEBUG on PPC32

Nathan Chancellor (1):
      lib/mpi: Fix building for powerpc with clang


 arch/powerpc/kernel/entry_32.S         |  2 +-
 arch/powerpc/kernel/setup_64.c         |  2 ++
 arch/powerpc/mm/nohash/8xx.c           |  3 ++
 arch/powerpc/platforms/Kconfig.cputype |  2 +-
 lib/mpi/longlong.h                     | 34 ++++++++++----------
 5 files changed, 24 insertions(+), 19 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAl6kzJMACgkQUevqPMjh
pYDp0g/+Ndo+utPPnfPQmcc8fX9poJYqxW27p99rK4lj3t2Gk1tuIwHK6UmZYjTP
admPhfRPU16M+bqcIEhqab8YA0JeTYxgggGZER0hxHBCeZXqp6nxcr6J7N4rlR+I
HqwE8Pt4+8GOvIK992F5O2YL0upAkgjdfNGwIDdYEcui1312P0y2OWxb/CMJ6wn/
nvzmljbog/U/OR6oCppe2DkEJwxM4Q+XOP7nMsDSsQCYmFakjlbpvMVOv0SuQ2nJ
A9zOihWDonYYD17kKRUON6Z0QStGCWM53koHZXzSvC3CZxv749/FD1iIfs1wGUzc
/xGMuqjCWbzOBlDF7Nc8OsO9sdB7MkymZu5yINLgrL0kaHftiUVDrooPdTgK0pZO
tFW41pgbMUHJaLqvH51oNxbrTpsu3uUaR8fv+aPeQW6sGxehQ3qANQUHiTQ+U+Jq
qwyxqBlGHVRe2DmjAaOSP2fYRwlFVQbH1/C7kCMByNNbWiJ6lQYi7Prxq8/3HQ2q
nrmLhYTna52YPPH0i745KxXvi0z0B46nMjpKq5r1a7R2MwWZ0+cBoTvZEECH9ar/
Pzu7qR4SrEJLBXfQ9T5wEPbqe1/yL9Azt836juRyEc7kF94htOswW5MiAtyxZ6v1
6BWX58XYw+QUhtH6QmB8xtm6zLTRiT0mChwU7VxwuEUBa3T6SSA=
=fSRV
-----END PGP SIGNATURE-----
