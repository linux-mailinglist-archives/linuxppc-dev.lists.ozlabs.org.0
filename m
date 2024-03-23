Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B63B887647
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 01:55:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dNi6vZJw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1gjG2FKVz3vn1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 11:55:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dNi6vZJw;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1ghX5c2cz3cy4
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Mar 2024 11:54:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1711155292;
	bh=Q1ozhTLC0i5nJma6jn4h+gT4TZHIFCymNO4pKD/VVU8=;
	h=From:To:Cc:Subject:Date:From;
	b=dNi6vZJwyDbkp/Yq+28o/8e3ySxTXuCaIAF23CBOjAuLdpYRgLxvsLpBzaDkWP4Rs
	 hp8fOw/pYwhdbLVHk+8fJqd/SyiDurShcrLWhX6OSzhYATgoTJJdG0xeSMw+007lth
	 k1MQysQalKjGNe8BInC5uh5//nat4zvp2ewODhULn/TJfuy3Kc9O0l8IoE6XXGsfjr
	 VnKLmVqLxuzKG6hgjlZG3x0DQ1mLGvMclEdBDMJXODu0QgWRQ1dApeyxtQ4HTp/amS
	 Y7qTl5bS5b3KNJG5jDiF2ovweQi6EihbheQUCRtaNL23qQM6ydiVZjPK55mEiXP+D3
	 aMpKHOBaVHwjg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4V1ghX0QzCz4wx5;
	Sat, 23 Mar 2024 11:54:51 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.9-2 tag
Date: Sat, 23 Mar 2024 11:54:50 +1100
Message-ID: <87zfupix7p.fsf@mail.lhotse>
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
Cc: bhe@redhat.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc updates for 6.9. These were posted before the
merge window but had complicated dependencies and/or conflicts with other
content that has gone into 6.9.

cheers

The following changes since commit 66a27abac311a30edbbb65fe8c41ff1b13876faa:

  Merge tag 'powerpc-6.9-1' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux (2024-03-15 17:53:48 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.9-2

for you to fetch changes up to 5c4233cc0920cc90787aafe950b90f6c57a35b88:

  powerpc/kdump: Split KEXEC_CORE and CRASH_DUMP dependency (2024-03-17 13:34:00 +1100)

- ------------------------------------------------------------------
powerpc updates for 6.9 #2

 - Handle errors in mark_rodata_ro() and mark_initmem_nx().

 - Make struct crash_mem available without CONFIG_CRASH_DUMP.

Thanks to: Christophe Leroy, Hari Bathini.

- ------------------------------------------------------------------
Christophe Leroy (1):
      powerpc: Handle error in mark_rodata_ro() and mark_initmem_nx()

Hari Bathini (3):
      kexec/kdump: make struct crash_mem available without CONFIG_CRASH_DUMP
      powerpc/kexec: split CONFIG_KEXEC_FILE and CONFIG_CRASH_DUMP
      powerpc/kdump: Split KEXEC_CORE and CRASH_DUMP dependency


 arch/powerpc/Kconfig                 |   9 +-
 arch/powerpc/include/asm/kexec.h     |  98 +++----
 arch/powerpc/kernel/prom.c           |   2 +-
 arch/powerpc/kernel/setup-common.c   |   2 +-
 arch/powerpc/kernel/smp.c            |   4 +-
 arch/powerpc/kexec/Makefile          |   3 +-
 arch/powerpc/kexec/core.c            |   4 +
 arch/powerpc/kexec/elf_64.c          |   4 +-
 arch/powerpc/kexec/file_load_64.c    | 269 ++++++++++----------
 arch/powerpc/mm/book3s32/mmu.c       |   7 +-
 arch/powerpc/mm/mmu_decl.h           |   8 +-
 arch/powerpc/mm/nohash/8xx.c         |  33 ++-
 arch/powerpc/mm/nohash/e500.c        |  10 +-
 arch/powerpc/mm/pgtable_32.c         |  38 ++-
 arch/powerpc/platforms/powernv/smp.c |   2 +-
 include/linux/crash_core.h           |  12 +-
 16 files changed, 274 insertions(+), 231 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmX+Jw4ACgkQUevqPMjh
pYA6WA/+PVlWRRhMWDZ0BEMFKtVMwUlGJWSZGNGqX/5ZV40lcTIsuIruw8C6VY11
Hq1J+CafM3H7LnqzYwruAYhpBYwb1Oje6IK208XiKH+eUmCzzk+hLfjGdbNbkTOx
6xBqoV3Hjj+p4H6QRXYkZQihQDHy9IfuBGNtoaTaiVuqg9NOT9PLnVNYaI11uLBP
qRS08hkORyJEOO/QRjoVXyXdP7pOwl1EbuYYg805BZ9NFlp7j105yT8XjKQ1X5w+
yF4b2eSV78/Z55dpnBM1GqJqkOSaQjq42PKS+JNSBRpgVDZiLzTdVgWBHY1Q2zho
H5XH9RHvT789vtGsXxhYqvSOSMsM+LgdZo82ZQuqHDA5djmwoMOVXcb/NkyVZ0o3
E+glLdWe6X+0B8Fhx2PH4R5j5j1r3/B2Ighf9Qz60rXNCnbUfT8ZJefyUZg6pHMg
Y/YwdftiqBRnVsK1VSvMrIW3/Sk47QHlM2d7B11R9sVw85zlVwg4FHFXlGtoVpFS
cWZityzVY10wKcblhHYt0/X0n2eeMhjyZuq9lvgls2zypr1qxJ+x/URVVM4hzbNH
P+1qvVUp9mHfSmUGqC5OWv/365BhPQy2t7vkK1NYmmfee2r2umHEY9zphu/yysUg
OQvE+v0F7fETuYg/QTWLlsusEyU0uBCoJOxeB2M6KacrNZfE64A=
=SfuI
-----END PGP SIGNATURE-----
