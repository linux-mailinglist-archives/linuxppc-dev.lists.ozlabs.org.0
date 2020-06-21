Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BA6202A26
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Jun 2020 12:53:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49qTsg6khWzDqg3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Jun 2020 20:53:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49qTrC1gcPzDqd2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Jun 2020 20:51:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=PEdBpw45; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49qTrB4HYvz9sTK;
 Sun, 21 Jun 2020 20:51:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1592736715;
 bh=fBwqQ7Cqe/T0CopqEcfuuX1XD11MecrWlMhDhwcFOZE=;
 h=From:To:Cc:Subject:Date:From;
 b=PEdBpw45WpgimY8nmwqCNcY8RuwGnl3OhLq1Stf8U3a9NZVG4I5HhgJ3xvgG9qUk7
 ShmgBwWbJ9H4B0GjHGGJBGs1xzcTJjuQhmppnnAvigagHJu/tVhEnFjXkKHEV+n1jz
 TlOglA+vUAEd0to2ORNuhgL2HzsMVmUDIWFp5H8f0bpiEip0nCyiC5mF0la4z+m/4T
 ekFNCGi3tx86NQQkAUcCJFEthuZGzAaD276J9ISQSA+uy8pDR2bfjnNzbyWsXqUXNV
 84o9fnKk2NSBbuQA5Nc7pmfhN1aMC47Jb5aWd7EwDmSBo2eudmxiuG//TveqGuKwhZ
 +AnnG1vOpLZYA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.8-3 tag
Date: Sun, 21 Jun 2020 20:52:25 +1000
Message-ID: <87366od72u.fsf@mpe.ellerman.id.au>
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
Cc: arnd@arndb.de, peterz@infradead.org, aneesh.kumar@linux.ibm.com,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, rppt@linux.ibm.com,
 will@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 5.8.

These have all been in linux-next since Thursday, but I rebased last night to
drop a commit, so the time stamps on the last few commits reflect that.

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.8-3

for you to fetch changes up to c0e1c8c22bebecef40097c80c1c74492ff96d081:

  powerpc/8xx: Provide ptep_get() with 16k pages (2020-06-20 22:14:54 +1000)

- ------------------------------------------------------------------
powerpc fixes for 5.8 #3

One fix for the interrupt rework we did last release which broke KVM-PR.

Three commits fixing some fallout from the READ_ONCE() changes interacting badly
with our 8xx 16K pages support, which uses a pte_t that is a structure of 4
actual PTEs.

A cleanup of the 8xx pte_update() to use the newly added pmd_off().

A fix for a crash when handling an oops if CONFIG_DEBUG_VIRTUAL is enabled.

A minor fix for the SPU syscall generation.

Thanks to:
  Aneesh Kumar K.V, Christian Zigotzky, Christophe Leroy, Mike Rapoport,
  Nicholas Piggin.

- ------------------------------------------------------------------
Aneesh Kumar K.V (1):
      powerpc: Fix kernel crash in show_instructions() w/DEBUG_VIRTUAL

Christophe Leroy (3):
      mm/gup: Use huge_ptep_get() in gup_hugepte()
      mm: Allow arches to provide ptep_get()
      powerpc/8xx: Provide ptep_get() with 16k pages

Michael Ellerman (1):
      powerpc/syscalls: Use the number when building SPU syscall table

Mike Rapoport (1):
      powerpc/8xx: use pmd_off() to access a PMD entry in pte_update()

Nicholas Piggin (1):
      powerpc/64s: Fix KVM interrupt using wrong save area


 arch/powerpc/include/asm/nohash/32/pgtable.h | 18 +++++++++++++-----
 arch/powerpc/kernel/exceptions-64s.S         |  4 ++--
 arch/powerpc/kernel/process.c                | 20 +++++++++++---------
 arch/powerpc/platforms/cell/spu_callbacks.c  |  2 +-
 include/asm-generic/hugetlb.h                |  2 +-
 include/linux/pgtable.h                      |  7 +++++++
 mm/gup.c                                     |  4 ++--
 7 files changed, 37 insertions(+), 20 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAl7vO44ACgkQUevqPMjh
pYClWQ/+IcdzjtYWNnTmPpgMXZQBd/kcWDycn84oEZSOQM8We1X9EPzO93nSRvMx
0R8X2nX6wS08xeYV3u8slX2na0GlcS1z3PleT23KseLEV8IHfdkhs46nsHilIT5n
WsYsf1oHDYCDFKwnK1/qr2wMJ6YJ4uiHAaxttcbRajRGY4oKRFhd8pDDkXX1cO3F
6vnvdy2l9cVgcvBqIgBxmIzjVe2B2kwfNXAyEaQLUzspO+TlhRHqRVjO9XR54607
4lDOu6dK0EG3Y0LuJNNsr6xIl4aykBrOgXOPkeygbz165Uv55+02NhNRzmYkWLIC
cntSJRMeZDhMeFwKWx73Vy3c+ot7rGrnC8P2SDB3DKzS3ng512uv7DeY4yHyjd80
ZcbUzINrb9dUrgzMQBV6CxSd00ecEout/v+qVBhP1KvCiODmPNP3gNm+qSyizFlg
oODH7QKcylD/V/8q+HSu3ddrPQyKuyKV9q46UdhMfw4KmV/SxOGcNSFyXZ6xQYdX
fbQCJ+iYHcJATj9RglBrnyRIyiw9gaVYOfNnh2VuyknutEGvPwlJGs+noWQ/jGdk
nf1B4lh6sIYn8bq8cjB36LD8m4zT4KiVyS/ot2v613i00/xr5PVmEyNhkwQc7uBD
gbA2K2g27D3RhsRYy49appAx+fWfSH5HjwCz7k/omzUCFdauR2k=
=4LHz
-----END PGP SIGNATURE-----
