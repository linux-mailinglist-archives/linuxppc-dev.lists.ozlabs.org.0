Return-Path: <linuxppc-dev+bounces-13837-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 006E2C39FC9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 11:02:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2HmR6Zpkz3c5y;
	Thu,  6 Nov 2025 21:02:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762423335;
	cv=none; b=ja8EosY+E6oXxlzDsLLaL07rih6aYZhf4PaC4t8WfQF473xjwmpTCEEndkBB73JA+xkbTt9/jG20NsijQtL4eUeYCtPr1i2yJ6I2EG+Ldh5/Cqv/rD4ljh3DLu3q4gd+OOY7yWCCnsxhtes7E8QruiMtajfffOgeShq5TurHrpyKY0Y+UxYJr5tbP8sxrEnZalwjAw1StQnyKctzAWdOi3pzvVP4LkLtKKnoX+l1oYzfKKLWRUbrKLoz0GOCRQe2tE82+xd4fJlOO3ZFiT+frreyjqyiht5NyobR1G+mBcenOy//3BFwDIRnBS6onhMLeJ34oAcuR1D37oGB0kQOhw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762423335; c=relaxed/relaxed;
	bh=/Xf1oeyZG1ZKuwhbZo2PyJCzRemXmJJv42128shNqao=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dw5Wf+KOhTlz77TS9Jo52sxf7/NGqdl5ZeexpQSkFJEivB54B3xSRBl0jL75DFNo6t9fMV0vGsPNsb+ExOg8XGt76n6md65WlJscYUD9luVOSPm/PvzLlxTb7QVuN+w2E6DZjPZhfv1jvErKDKqUNiThdQfob3pmvTTzuDIMfqbawj4Fu5mnB7EllZBJPjT7xPpWGYAVnUzAVXZO8nw9M73T9vDrcq6P5J+i2BO6EVjpFnq4ncIgjStvLU5IVusbHDFsgrR4P/zVUDiwqzQAS/NImHkl/UNvVtKDwFwvRKr7nsymHlt1rtGol3fV+l7Ne8iMYUtQ5Wj1XbKCRNw76A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=rNvfheX1; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=DOWu3kEq; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=rNvfheX1;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=DOWu3kEq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4d2HmQ5mWbz3069
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 21:02:14 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762423329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/Xf1oeyZG1ZKuwhbZo2PyJCzRemXmJJv42128shNqao=;
	b=rNvfheX1EV1aGgCBXYREO1AE3dBkrvMh7lQkLkDVFLIbsHNNwskDM3tD4J+isZ6YJM1Fc8
	yV7QTeJIm00gwhP9xT4Doc37juDV2L8xyl2yCMSV31xfF2XSRrj/upGwE/PC5/NYy4D+KZ
	T3dlhyrUOF4xiwQKVCi1rnDlWXFn3Pywsay6obbIH3o6VarXQgLohrx2qse6GEjEf851XP
	9zs0xWU7nYJDuphFpfs59n4p/++mn00jz76DkvXPFGC1mO9YJJz3hDOkPZNq8s/g1rfeiO
	gUVj8Qq3jGOgOsrf3W6L8uSPvKWapWZZ7c8kuixCJv4XYaC53rvdX09bJBL6oA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762423329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/Xf1oeyZG1ZKuwhbZo2PyJCzRemXmJJv42128shNqao=;
	b=DOWu3kEqoRIllLk+F51f/k3q3NnyXpuXoJyXij8n9lLnQZxlfacIga6q8FDbG4UyRy8Exc
	dXeOolc1PDMyWVBw==
Subject: [PATCH v5 00/34] sparc64: vdso: Switch to the generic vDSO library
Date: Thu, 06 Nov 2025 11:01:53 +0100
Message-Id: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABJyDGkC/3XPTYoCMRAF4KtI1hNJKr/tynvILDpJRQNDWhINi
 vTdJy3MCGIvX8H7ivcgFUvCSnabBynYUk1T7kF9bYg/jfmINIWeCTBQzADQFupE63ksXkt6xNz
 rngIFFQGZsjiAJ718LhjT7Qkfvns+pXqZyv35p/Hl+kfKNbJxyigKo0fhAsjA9z8pXy9lyum2D
 UgWtsGLslytUtApp2K0TBsQ0nyixIsauFmlRKeENoPjzltE+4mS/xRnfH2gXAYyzYyLcgg4vlP
 zPP8C9gA4QKEBAAA=
X-Change-ID: 20250722-vdso-sparc64-generic-2-25f2e058e92c
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Shannon Nelson <sln@onemain.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Arnd Bergmann <arnd@kernel.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762423327; l=7494;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=6fe5s/8WXt8LDR1x1k083tpK7z5zoUWlL2PJcCJcAEw=;
 b=rCuKSMr6iJrvIuN8HAr9NkC+5G1piq0o1jjz4q0RyKSUW0yPa4W0eF4Ciut3f9pmozkQphTjR
 6O/EemPcZ2GAsAcXeyi0kkML8xnkho/tNgVP3ZMddFBB/oPyCJw0Zd4
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The generic vDSO provides a lot common functionality shared between
different architectures. SPARC is the last architecture not using it,
preventing some necessary code cleanup.

Make use of the generic infrastructure.

Follow-up to and replacement for Arnd's SPARC vDSO removal patches:
https://lore.kernel.org/lkml/20250707144726.4008707-1-arnd@kernel.org/

SPARC64 can not map .bss into userspace, so the vDSO datapages are
switched over to be allocated dynamically. This requires changes to the
s390 and random subsystem vDSO initialization as preparation.
The random subsystem changes in turn require some cleanup of the vDSO
headers to not end up as ugly #ifdef mess.

Tested on a Niagara T4 and QEMU.

This has a semantic conflict with my series "vdso: Reject absolute
relocations during build" [0]. The last patch of this series expects all
users of the generic vDSO library to use the vdsocheck tool.
This is not the case (yet) for SPARC64. I do have the patches for the
integration, the specifics will depend on which series is applied first.

Based on v6.18-rc1.

[0] https://lore.kernel.org/lkml/20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de/

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Changes in v5:
- Merge the patches for 'struct page' mapping and dynamic allocation
- Zero out newly-allocated data pages
- Pick up review tags
- Link to v4: https://lore.kernel.org/r/20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de

Changes in v4:
- Rebase on v6.18-rc1.
- Keep inclusion of asm/clocksource.h from linux/clocksource.h
- Reword description of "s390/time: Set up vDSO datapage later"
- Link to v3: https://lore.kernel.org/r/20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de

Changes in v3:
- Allocate vDSO data pages dynamically (and lots of preparations for that)
- Drop clock_getres()
- Fix 32bit clock_gettime() syscall fallback
- Link to v2: https://lore.kernel.org/r/20250815-vdso-sparc64-generic-2-v2-0-b5ff80672347@linutronix.de

Changes in v2:
- Rebase on v6.17-rc1
- Drop RFC state
- Fix typo in commit message
- Drop duplicate 'select GENERIC_TIME_VSYSCALL'
- Merge "sparc64: time: Remove architecture-specific clocksource data" into the
  main conversion patch. It violated the check in __clocksource_register_scale()
- Link to v1: https://lore.kernel.org/r/20250724-vdso-sparc64-generic-2-v1-0-e376a3bd24d1@linutronix.de

---
Arnd Bergmann (1):
      clocksource: remove ARCH_CLOCKSOURCE_DATA

Thomas Weißschuh (33):
      selftests: vDSO: vdso_test_correctness: Handle different tv_usec types
      arm64: vDSO: getrandom: Explicitly include asm/alternative.h
      arm64: vDSO: gettimeofday: Explicitly include vdso/clocksource.h
      arm64: vDSO: compat_gettimeofday: Add explicit includes
      ARM: vdso: gettimeofday: Add explicit includes
      powerpc/vdso/gettimeofday: Explicitly include vdso/time32.h
      powerpc/vdso: Explicitly include asm/cputable.h and asm/feature-fixups.h
      LoongArch: vDSO: Explicitly include asm/vdso/vdso.h
      MIPS: vdso: Add include guard to asm/vdso/vdso.h
      MIPS: vdso: Explicitly include asm/vdso/vdso.h
      random: vDSO: Add explicit includes
      vdso/gettimeofday: Add explicit includes
      vdso/helpers: Explicitly include vdso/processor.h
      vdso/datapage: Remove inclusion of gettimeofday.h
      vdso/datapage: Trim down unnecessary includes
      random: vDSO: trim vDSO includes
      random: vDSO: remove ifdeffery
      random: vDSO: split out datapage update into helper functions
      random: vDSO: only access vDSO datapage after random_init()
      s390/time: Set up vDSO datapage later
      vdso/datastore: Reduce scope of some variables in vvar_fault()
      vdso/datastore: Drop inclusion of linux/mmap_lock.h
      vdso/datastore: Allocate data pages dynamically
      sparc64: vdso: Link with -z noexecstack
      sparc64: vdso: Remove obsolete "fake section table" reservation
      sparc64: vdso: Replace code patching with runtime conditional
      sparc64: vdso: Move hardware counter read into header
      sparc64: vdso: Move syscall fallbacks into header
      sparc64: vdso: Introduce vdso/processor.h
      sparc64: vdso: Switch to the generic vDSO library
      sparc64: vdso2c: Drop sym_vvar_start handling
      sparc64: vdso2c: Remove symbol handling
      sparc64: vdso: Implement clock_gettime64()

 arch/arm/include/asm/vdso/gettimeofday.h           |   2 +
 arch/arm64/include/asm/vdso/compat_gettimeofday.h  |   3 +
 arch/arm64/include/asm/vdso/gettimeofday.h         |   2 +
 arch/arm64/kernel/vdso/vgetrandom.c                |   2 +
 arch/loongarch/kernel/process.c                    |   1 +
 arch/loongarch/kernel/vdso.c                       |   1 +
 arch/mips/include/asm/vdso/vdso.h                  |   5 +
 arch/mips/kernel/vdso.c                            |   1 +
 arch/powerpc/include/asm/vdso/gettimeofday.h       |   1 +
 arch/powerpc/include/asm/vdso/processor.h          |   3 +
 arch/s390/kernel/time.c                            |   4 +-
 arch/sparc/Kconfig                                 |   3 +-
 arch/sparc/include/asm/clocksource.h               |   9 -
 arch/sparc/include/asm/processor.h                 |   3 +
 arch/sparc/include/asm/processor_32.h              |   2 -
 arch/sparc/include/asm/processor_64.h              |  25 --
 arch/sparc/include/asm/vdso.h                      |   2 -
 arch/sparc/include/asm/vdso/clocksource.h          |  10 +
 arch/sparc/include/asm/vdso/gettimeofday.h         | 184 ++++++++++
 arch/sparc/include/asm/vdso/processor.h            |  41 +++
 arch/sparc/include/asm/vdso/vsyscall.h             |  10 +
 arch/sparc/include/asm/vvar.h                      |  75 ----
 arch/sparc/kernel/Makefile                         |   1 -
 arch/sparc/kernel/time_64.c                        |   6 +-
 arch/sparc/kernel/vdso.c                           |  69 ----
 arch/sparc/vdso/Makefile                           |   8 +-
 arch/sparc/vdso/vclock_gettime.c                   | 380 ++-------------------
 arch/sparc/vdso/vdso-layout.lds.S                  |  26 +-
 arch/sparc/vdso/vdso.lds.S                         |   2 -
 arch/sparc/vdso/vdso2c.c                           |  24 --
 arch/sparc/vdso/vdso2c.h                           |  45 +--
 arch/sparc/vdso/vdso32/vdso32.lds.S                |   4 +-
 arch/sparc/vdso/vma.c                              | 274 +--------------
 drivers/char/random.c                              |  71 ++--
 include/linux/clocksource.h                        |   6 +-
 include/linux/vdso_datastore.h                     |   6 +
 include/vdso/datapage.h                            |  23 +-
 include/vdso/helpers.h                             |   1 +
 init/main.c                                        |   2 +
 kernel/time/Kconfig                                |   4 -
 lib/vdso/datastore.c                               |  74 ++--
 lib/vdso/getrandom.c                               |   3 +
 lib/vdso/gettimeofday.c                            |  17 +
 .../testing/selftests/vDSO/vdso_test_correctness.c |   8 +-
 44 files changed, 449 insertions(+), 994 deletions(-)
---
base-commit: 28b1ac5ccd8d4900a8f53f0e6e84d517a7ccc71f
change-id: 20250722-vdso-sparc64-generic-2-25f2e058e92c

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


