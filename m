Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B7747034
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 15:37:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Qz771jgSzDrg1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 23:37:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Qz3s4dg6zDrSd
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2019 23:34:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45Qz3s1wF6z9s4Y;
 Sat, 15 Jun 2019 23:34:49 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.2-4 tag
Date: Sat, 15 Jun 2019 23:34:46 +1000
Message-ID: <87v9x7nf9l.fsf@concordia.ellerman.id.au>
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
Hash: SHA1

Hi Linus,

Please pull some more powerpc fixes for 5.2:

The following changes since commit cd6c84d8f0cdc911df435bb075ba22ce3c605b07:

  Linux 5.2-rc2 (2019-05-26 16:49:19 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.2-4

for you to fetch changes up to c21f5a9ed85ca3e914ca11f421677ae9ae0d04b0:

  powerpc/32s: fix booting with CONFIG_PPC_EARLY_DEBUG_BOOTX (2019-06-07 19:00:14 +1000)

- ------------------------------------------------------------------
powerpc fixes for 5.2 #4

One fix for a regression introduced by our 32-bit KASAN support, which broke
booting on machines with "bootx" early debugging enabled.

A fix for a bug which broke kexec on 32-bit, introduced by changes to the 32-bit
STRICT_KERNEL_RWX support in v5.1.

Finally two fixes going to stable for our THP split/collapse handling,
discovered by Nick. The first fixes random crashes and/or corruption in guests
under sufficient load.

Thanks to:
  Nicholas Piggin, Christophe Leroy, Aaro Koskinen, Mathieu Malaterre.

- ------------------------------------------------------------------
Christophe Leroy (2):
      powerpc: Fix kexec failure on book3s/32
      powerpc/32s: fix booting with CONFIG_PPC_EARLY_DEBUG_BOOTX

Nicholas Piggin (2):
      powerpc/64s: Fix THP PMD collapse serialisation
      powerpc/64s: __find_linux_pte() synchronization vs pmdp_invalidate()


 arch/powerpc/include/asm/book3s/64/pgtable.h | 30 ++++++++++++++++++++++++++++
 arch/powerpc/include/asm/btext.h             |  4 ++++
 arch/powerpc/include/asm/kexec.h             |  3 +++
 arch/powerpc/kernel/machine_kexec_32.c       |  4 +++-
 arch/powerpc/kernel/prom_init.c              |  1 +
 arch/powerpc/kernel/prom_init_check.sh       |  2 +-
 arch/powerpc/mm/book3s64/pgtable.c           |  3 +++
 arch/powerpc/mm/pgtable.c                    | 16 +++++++++++++--
 8 files changed, 59 insertions(+), 4 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJdBO4+AAoJEFHr6jzI4aWAsAwQAK+CK0jvw2pgZMk8/RwuPihJ
gr6pvRaiUuyyiCpWxpzHslZx0WYSg84EYaog4e3fRss6MZeTd4CxxJqAIIny2XTK
3Z6EI3GQGtA8U/+GY+whaQ5+ILdJotbPNRci+yGwc3HNZwT/4RScbmJz7E84MZv+
9gyXrKUio0RdtdZmMHtkrCbpg24QYf1+168gUlJ8H5XGy5NVXVhXwxbYcFeN4zIY
JI+exlBZwtYBJQMtR0FCvjybKk7kRdQzrrUEFM/ZmzsXQryUR7tLrwqAeLvcDc6x
CY9/fn2q7BcFRiOxeZ3AGG89NRTGdOOC1cNJ+Wqn8bIxzP/yFwTEr+lcbdpooCAs
MYyR0yoiI8Aty55lH0uTYQDbXWBZigvKDjLJzn3KN91NKnb3Yw37y5fM5e1ZYQez
bJmbcJJpQzv0YVxXpxd27QeLQtJe6B8D5y0HkpRzYifma5ItAzc1VGzp66jLRFT+
m4LmzD3TjQ61LWyxxDBjAWCHUKW7+cu++sFw0LOA2Wib5DjLjhQAu9qXN1sR5704
FXji4jULMajLMhqqMxjwTEatS46THyz2rqOtJ5/eRWOHBMBS8rHTbHRtFF20mL7x
tHtDmKCfFs2HwHOndtaWduBjiGVVwOo84o2jY0EvfaQ5nscf2XE9acVo6czpJacn
NnIsVZZ6RU/y4Q/f55T4
=Viyv
-----END PGP SIGNATURE-----
