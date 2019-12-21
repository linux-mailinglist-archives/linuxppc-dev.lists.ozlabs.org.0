Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E498B1288FB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2019 13:06:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47g48Y6kqczDqwY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2019 23:06:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47g4632WgtzDqtW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Dec 2019 23:04:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="hYdBIxHB"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47g4601wyyz9sPJ;
 Sat, 21 Dec 2019 23:04:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1576929850;
 bh=GY6xEygZs9ytfEkJrzz6g06C/FlTmp2w1Dpa+AtQcpI=;
 h=From:To:Cc:Subject:Date:From;
 b=hYdBIxHBVCi6hQqkpxSrTwD8Gq0z3iKbOm+g10wOO11IFj5j2Q3PoHlqQ3YB47ZUQ
 PhI1FS8ykEFyOBjpeOPNeiV7H22QTngncHAAN7mzTSCSJzy8Uf2M1E1nBA00Qh9FdG
 hF6GHXzvATw/RQdXL2LPAt5OeosGXX7OJZj4FFybUvbkt5opfMelPXOYpGdEhCfdGm
 oRfTV8Tn9h4Tg+xkwEpCZJ8fFZWUjLTxRZ3qDcF9xurJoqVftfe/ggMDLNlinMFlVL
 FQbH2UvbiZY1XxlvP0DOzBqXJtcUgzG11msRd/j6hz/HBCiJtMjnNtXiPUKmU4zNko
 XJRaKJ4afxpOw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.5-4 tag
Date: Sat, 21 Dec 2019 23:04:03 +1100
Message-ID: <87sgldlwb0.fsf@mpe.ellerman.id.au>
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
Cc: pauld@redhat.com, ajd@linux.ibm.com, david@redhat.com,
 linux-kernel@vger.kernel.org, rppt@linux.ibm.com, fbarrat@linux.ibm.com,
 longman@redhat.com, linuxppc-dev@lists.ozlabs.org, marcus@mc.pp.se,
 srikar@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 5.5:

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.5-4

for you to fetch changes up to 228b607d8ea1b7d4561945058d5692709099d432:

  KVM: PPC: Book3S HV: Fix regression on big endian hosts (2019-12-17 15:09:08 +1100)

- ------------------------------------------------------------------
powerpc fixes for 5.5 #4

Two weeks worth of accumulated fixes.

A fix for a performance regression seen on PowerVM LPARs using dedicated CPUs,
caused by our vcpu_is_preempted() returning true even for idle CPUs.

One of the ultravisor support patches broke KVM on big endian hosts in v5.4.

Our KUAP (Kernel User Access Prevention) code missed allowing access in
__clear_user(), which could lead to an oops or erroneous SEGV when triggered via
PTRACE_GETREGSET.

Two fixes for the ocxl driver, an open/remove race, and a memory leak in an
error path.

A handful of other small fixes.

Thanks to:
  Andrew Donnellan, Christian Zigotzky, Christophe Leroy, Christoph Hellwig,
  Daniel Axtens, David Hildenbrand, Frederic Barrat, Gautham R. Shenoy, Greg
  Kurz, Ihor Pasichnyk, Juri Lelli, Marcus Comstedt, Mike Rapoport, Parth Shah,
  Srikar Dronamraju, Vaidyanathan Srinivasan.

- ------------------------------------------------------------------
Andrew Donnellan (1):
      powerpc: Fix __clear_user() with KUAP enabled

Christophe Leroy (2):
      powerpc/irq: fix stack overflow verification
      powerpc/8xx: fix bogus __init on mmu_mapin_ram_chunk()

David Hildenbrand (1):
      powerpc/pseries/cmm: fix managed page counts when migrating pages between zones

Frederic Barrat (2):
      ocxl: Fix concurrent AFU open and device removal
      ocxl: Fix potential memory leak on context creation

Marcus Comstedt (1):
      KVM: PPC: Book3S HV: Fix regression on big endian hosts

Mike Rapoport (1):
      powerpc: Ensure that swiotlb buffer is allocated from low memory

Srikar Dronamraju (2):
      powerpc/vcpu: Assume dedicated processors as non-preempt
      powerpc/shared: Use static key to detect shared processor


 arch/powerpc/include/asm/spinlock.h     | 13 +++++------
 arch/powerpc/include/asm/uaccess.h      |  9 ++++++--
 arch/powerpc/kernel/irq.c               |  4 ++--
 arch/powerpc/kvm/book3s_hv_rmhandlers.S |  4 ++--
 arch/powerpc/lib/string_32.S            |  4 ++--
 arch/powerpc/lib/string_64.S            |  6 ++---
 arch/powerpc/mm/mem.c                   |  8 +++++++
 arch/powerpc/mm/nohash/8xx.c            |  2 +-
 arch/powerpc/platforms/pseries/cmm.c    | 10 +++++++++
 arch/powerpc/platforms/pseries/setup.c  |  7 ++++++
 drivers/misc/ocxl/context.c             |  8 +++----
 drivers/misc/ocxl/file.c                | 23 ++++++++++----------
 12 files changed, 62 insertions(+), 36 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAl3+CgMACgkQUevqPMjh
pYAOfQ/9FkfVDcf9N3l4EPbnfQ6jWIFz51DZgy4ZsDMfqbdq/hokXnOCLxlsJZHS
GGJIKgS/CRgvWJzeCSlYm1pEbeMNW7WT3k9vwHaBd5LLKCNC0YWGnAIt+Cp/dXC6
VLbn/lubsY5iEQgnQ+WCLTCc0CpNksAX9zoIsN2xa3fHOHK+ji+xg5fFR4Fzbxob
RBBj4lWiDANlHKLYyZvoGevx8sgElTc7j3dHzIPU0eaJX7kCenrGpGJupvAiCmzm
c57qYr90UMmaXbNvV8xpVV6UaLpw5DTKHuCk5LoXP8CcRJTFT2a0AbYVJU53LPR9
9TaWYgA/3O1FTUEkJtCHyGMEEeXXRqlqyjZB//3mEuN+/XMmEQJO4IuGq9kKTHv8
wOzhPjo8q86c22jyTtKCbOqBzNT0ZJrNON6mkb0fdbvZjRAQcjzzzWe6IOBEl2R8
U1O+5+weEbBfRt6wRgCyuiN95+3nT8/zXpAMIH2IG3lrFysKG+dPZ3QuwPoG5xl9
UVEhtKxMb4FcWj0aImuT3fxvkcTxGiBFh6VZboruFAE6I3YO9rG5iUr/TEE9V+Tp
b6xe9P2ZyM9vH0dR1sXcFtfx3YLRUNOjOS6RO/8LiGv2kzUnNU63adSgeE0xrW1w
JR3+X75Mfw4bBXrmaxI+CZM8WnGWi0siz8SvF6TwfQdQkLkZvyQ=
=Y0zp
-----END PGP SIGNATURE-----
