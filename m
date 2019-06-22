Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3964F58E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2019 13:53:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45WDV30s0MzDqDG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2019 21:53:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45WDS74nYrzDqZG
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 21:52:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45WDS52D1hz9s3Z;
 Sat, 22 Jun 2019 21:52:05 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.2-5 tag
Date: Sat, 22 Jun 2019 21:52:06 +1000
Message-ID: <874l4halcp.fsf@concordia.ellerman.id.au>
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
Cc: mikey@neuling.org, linux-kernel@vger.kernel.org, sjitindarsingh@gmail.com,
 linuxppc-dev@lists.ozlabs.org, hch@lst.de, Larry.Finger@lwfinger.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Linus,

Please pull some more powerpc fixes for 5.2.

This is a frustratingly large batch at rc5. Some of these were sent earlier but
were missed by me due to being distracted by other things, and some took a while
to track down due to needing manual bisection on old hardware. But still we
clearly need to improve our testing of KVM, and of 32-bit, so that we catch
these earlier.

cheers


The following changes since commit c21f5a9ed85ca3e914ca11f421677ae9ae0d04b0:

  powerpc/32s: fix booting with CONFIG_PPC_EARLY_DEBUG_BOOTX (2019-06-07 19:00:14 +1000)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.2-5

for you to fetch changes up to 50087112592016a3fc10b394a55f1f1a1bde6908:

  KVM: PPC: Book3S HV: Invalidate ERAT when flushing guest TLB entries (2019-06-20 22:11:25 +1000)

- ------------------------------------------------------------------
powerpc fixes for 5.2 #5

Seven fixes, all for bugs introduced this cycle.

The commit to add KASAN support broke booting on 32-bit SMP machines, due to a
refactoring that moved some setup out of the secondary CPU path.

A fix for another 32-bit SMP bug introduced by the fast syscall entry
implementation for 32-bit BOOKE. And a build fix for the same commit.

Our change to allow the DAWR to be force enabled on Power9 introduced a bug in
KVM, where we clobber r3 leading to a host crash.

The same commit also exposed a previously unreachable bug in the nested KVM
handling of DAWR, which could lead to an oops in a nested host.

One of the DMA reworks broke the b43legacy WiFi driver on some people's
powermacs, fix it by enabling a 30-bit ZONE_DMA on 32-bit.

A fix for TLB flushing in KVM introduced a new bug, as it neglected to also
flush the ERAT, this could lead to memory corruption in the guest.

Thanks to:
  Aaro Koskinen, Christoph Hellwig, Christophe Leroy, Larry Finger, Michael
  Neuling, Suraj Jitindar Singh.

- ------------------------------------------------------------------
Christoph Hellwig (1):
      powerpc: enable a 30-bit ZONE_DMA for 32-bit pmac

Christophe Leroy (3):
      powerpc/32s: fix initial setup of segment registers on secondary CPU
      powerpc/booke: fix fast syscall entry on SMP
      powerpc/32: fix build failure on book3e with KVM

Michael Neuling (1):
      KVM: PPC: Book3S HV: Fix r3 corruption in h_set_dabr()

Suraj Jitindar Singh (2):
      KVM: PPC: Book3S HV: Only write DAWR[X] when handling h_set_dawr in real mode
      KVM: PPC: Book3S HV: Invalidate ERAT when flushing guest TLB entries


 arch/powerpc/include/asm/page.h         |  7 +++++++
 arch/powerpc/kernel/head_32.S           |  1 +
 arch/powerpc/kernel/head_booke.h        | 10 +++++-----
 arch/powerpc/kernel/head_fsl_booke.S    |  2 +-
 arch/powerpc/kvm/book3s_hv_builtin.c    |  1 +
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 15 +++++++++++++--
 arch/powerpc/mm/mem.c                   |  3 ++-
 arch/powerpc/platforms/powermac/Kconfig |  1 +
 8 files changed, 31 insertions(+), 9 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJdDhYHAAoJEFHr6jzI4aWAe9MQALg4ximulK/aabpsUZ9VXvJG
xGtfDYi41KQt73CdiE4nacx3RH7YlcqmZAoKU0JhcuLL2zbqqufhFYnKJNYPEHcG
S2vHoEFfuVMR27B0Ba9FPHUwE1ND7dzPx8BGqjg4nUkoFd9rWV6xxQ5nYil3NBOi
+O5jtKMJxkF2DvSonaUrE6qX34F8N7HfVb8s3ZQpLEdcuyuJt3r9Zne/fvR9GRJ8
gDvjkQervuw0iA3BcJlRWnJqf5ch9iijd+YvkAIeAjO7M1yWXoGUdRbVK3M39iO7
n7znfy7JSdcM/AaMP+qiK0KDUgUNlBbtm/bvC9TFMBsD/dBHlYE3crCUIoYXxCE8
0bVyQL502J4Qd8vbIqK3WCZCprqQpp/q2SVYxgIj1jnk2enFn8kEVREVrdyVDuTJ
LcBQEyUtZooS/ATrwPOzIAC/XsdnHP7tBSqU23J3Ba+W6GM/t8wuDkGwN7nhwoYE
SU8p0AbAQ/G6Yi9JvgATbtSXAMQ2pPO3TCYkLVzD18KQLhfSYD4cbMs+gWvMCwVR
/8lRkRi4uHurUk8eE4y/Sp4T7pRk4mwVxYighLbGLXLW/pj9RvfdTRA3i+E51j/U
Wu1lZSTrKPRzNp7XYUOM5ZGfngptgO7istNkgeQz8zJsPu1S0aoxyK1ypCp1aUZ8
flxdVv62fmt3H/8A0I3O
=5RHe
-----END PGP SIGNATURE-----
