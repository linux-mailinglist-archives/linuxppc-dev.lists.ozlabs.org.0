Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9921F80AB9
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Aug 2019 13:51:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 461fPf5nh1zDqgS
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Aug 2019 21:51:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 461fMZ3HMLzDqcJ
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Aug 2019 21:49:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 461fMX0rVhz9sN6;
 Sun,  4 Aug 2019 21:49:43 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.3-3 tag
Date: Sun, 04 Aug 2019 21:49:44 +1000
Message-ID: <87a7cpw3on.fsf@concordia.ellerman.id.au>
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
Cc: sfr@canb.auug.org.au, santosh@fossix.org, aneesh.kumar@linux.ibm.com,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 christian@brauner.io
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 5.3:

The following changes since commit 609488bc979f99f805f34e9a32c1e3b71179d10b:

  Linux 5.3-rc2 (2019-07-28 12:47:02 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.3-3

for you to fetch changes up to d7e23b887f67178c4f840781be7a6aa6aeb52ab1:

  powerpc/kasan: fix early boot failure on PPC32 (2019-07-31 22:02:52 +1000)

- ------------------------------------------------------------------
powerpc fixes for 5.3 #3

Wire up the new clone3 syscall.

A fix for the PAPR SCM nvdimm driver, to fix a crash when firmware gives us a
device that's attached to a non-online NUMA node.

A fix for a boot failure on 32-bit with KASAN enabled.

Three fixes for implicit fall through warnings, some of which are errors for us
due to -Werror.

Thanks to:
  Aneesh Kumar K.V, Christophe Leroy, Kees Cook, Santosh Sivaraj, Stephen
  Rothwell.

- ------------------------------------------------------------------
Aneesh Kumar K.V (1):
      powerpc/nvdimm: Pick nearby online node if the device node is not online

Christophe Leroy (1):
      powerpc/kasan: fix early boot failure on PPC32

Michael Ellerman (2):
      powerpc: Wire up clone3 syscall
      powerpc/spe: Mark expected switch fall-throughs

Santosh Sivaraj (1):
      powerpc/kvm: Fall through switch case explicitly

Stephen Rothwell (1):
      drivers/macintosh/smu.c: Mark expected switch fall-through


 arch/powerpc/include/asm/unistd.h         |  1 +
 arch/powerpc/kernel/align.c               |  4 ++++
 arch/powerpc/kernel/entry_32.S            |  8 ++++++++
 arch/powerpc/kernel/entry_64.S            |  5 +++++
 arch/powerpc/kernel/syscalls/syscall.tbl  |  2 +-
 arch/powerpc/kvm/book3s_32_mmu.c          |  1 +
 arch/powerpc/mm/kasan/kasan_init_32.c     |  7 +++++--
 arch/powerpc/platforms/pseries/papr_scm.c | 29 +++++++++++++++++++++++++++--
 drivers/macintosh/smu.c                   |  1 +
 9 files changed, 53 insertions(+), 5 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAl1GxcEACgkQUevqPMjh
pYDXVQ//Wg2vXgrCxc9Gk65Sspu1oLwgBOl8zsM7u/McOXBUeBC3o8pUMwh1N5MB
IbSffD6UlK3GNEcIfVGWb7OeaqEZjRL3uUtJMUJQIEkK8MnflE60H9n5jrKMApV7
zRTQfU2mL/wObXeASgdUIhCgiTlkaZJcse9ATIKOtDpYy2Xm7ahAyImfqet39Ea0
9OetR48YuZzEPzzuESFAFslawFLRLIYSpviBYeFO85+uuoULu2ylpts1c5XyOH38
bUfRyvEJvvPEmYgmmqnw3R6NqPQwCc6+VkEbIZ6kv67vfXQbrTG7uN/HOjm9ksFf
/2Q/hXl2ZfwM+SO2lhhDPWFkJuWyBrutoxumkVE1dlD8B5D71qWpCxlPOVbwF8tB
S5b+8pq1mrrwQmsPoYa46WtvuEbuKI0vZqqx27ZSzGE40FwQcEbJhDRTEmsXuh+D
n3395ddQclj5zfsxU/gk+bmdT03F8crT+OPZxYKYZlUDgk/+6rYvghm7EC0dK3h7
/5sIpl5oWVMEUqpjdfeWPbdnF8b5M2xHFJXBUTJcHNA2gZzarUp0KuSPxBt2suu6
NhXZ19Ja2vaHwI2NZvKCdd543PzP6NG8GHRrMyiMnGWC88Fm4r5/FBd2g80ShQ2p
WuXj98tye3dbPTPzbkQM24g4WNsrQcc7uhKveRwnimWEgcPATPI=
=nPN5
-----END PGP SIGNATURE-----
