Return-Path: <linuxppc-dev+bounces-1925-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BB8997E19
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 09:02:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPLKY5CDkz3bnc;
	Thu, 10 Oct 2024 18:02:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728543729;
	cv=none; b=i51OvognIrvVhQEpG2X2SndosxXUg0tntZ1Hv9vzsSG0dTBKuQmoRink7dA7bJewcq36a0pw+V5kFQ7WVR4vdRvgorxgdLBQZUG8Igs7H0kd+kPmSunl2P7uCKRQG6cxohogjmJELmtbl28osSwdJUDxrvUo0wr7DSKS2goh/4OaIxvOp0PdWQvun6x8weQ5ow1aJy9knoEIqjp/otc0s/03oE8VdrXejfM0y/uwpUqIovGLJ0cUYToFXGC0A2o+wIWmTHVVGxQTYQzejr0K/RryrgL/518h574qY/udMo+rqLiscbLxfwsj0vXwPYl2eZepgxK1FSvIAVoLPH8tPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728543729; c=relaxed/relaxed;
	bh=E4T95t+t5uIUSPRmbXi3insr6gkvL1A7vX9/M6uzeAI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CAuwvSkwIdZ/ZpE3/ya2u5ytc1bGjJvN/hpQEbkH0aBXJWqeyaEYplkNvwEdt+qCdaxoSFWjGDRZcUq/JpmLz7iqpHvac3fMQurtGuPw+KJXzXmY8hKKn299rzhE7wHgjwxZs/6HQ7Kh0kKcBT47RXSsn9C9hV9KUdM0wQ9x+JihqdJb8va+bB3pA3tDegNQiFA5d/FAz6s3HqmMzBqTkpUzZOQrd5lXoKohnhIi9oPSjC0SZWft7YbhsylU1iv32tDOlSrug8M8wiZiy29hJqYnlj33E8r3fZxvDIXsKgTkS/JZKxtf/UrFPlSzQuo4XjEF8TBjeOY8LTSdxxwozA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=lmsrwGd/; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=jky3v+I1; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=lmsrwGd/;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=jky3v+I1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPLKX2LL0z3blk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 18:02:08 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=E4T95t+t5uIUSPRmbXi3insr6gkvL1A7vX9/M6uzeAI=;
	b=lmsrwGd/o99KSttwJ8sgkfe3ORDOYVzQtieE7kyC4+m+vRZ/tzWpxPQ8ePTZNQ19EFjx5I
	u3jGvagoJGW/qx9g2bUpnmEq8JoWczBHMUhDC79C1JomHxY98uotRFX+A96CPPno1gMwIu
	LyvrdSpMcdSsFeE5AWm4OzXxE/cIgCQiWE+WdzqZBRdbXLSt+FADnIPVu13PJJKh43s3lM
	jr/MVOD7fv5IDZjXZMEa9QSGaKAlyNTcMqwQmtVyZLRsNdOIMbYmcRsayg4uNcNoVlIB15
	aYyMd6cpaCwNPFx2oScFtCmRqL8D8perF6lVmPIECmor4hdzn03+zzeo55ZhLA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=E4T95t+t5uIUSPRmbXi3insr6gkvL1A7vX9/M6uzeAI=;
	b=jky3v+I1IC+JVC8fX81ewpslVewnrQMUfSlcSSaPKvbXwS/AgvfDy+/FHxXQi6ThcgvJUH
	9VEhGdOBmWvD01CA==
Subject: [PATCH 00/28] vdso: Preparations for generic data storage
Date: Thu, 10 Oct 2024 09:01:02 +0200
Message-Id: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAK57B2cC/x3MMQqAMAxA0atIZgNRa0WvIg5qY83SSgMiFO9uc
 fzD+xmUk7DCVGVIfItKDCWauoL9XINnFFcaWmpNQzTi7TSi51DYjtuqjLYjaw9nBrP1UNyV+JD
 nf87L+37En2/PYwAAAA==
X-Change-ID: 20241009-vdso-generic-base-63066fd474b5
To: Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Russell King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Nam Cao <namcao@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=6636;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=QNcCT8xdhsRdpIEe1ZjNJ7WuU4tLNw9Mj2qA/M/7NLg=;
 b=sQhdCAF4J2xGSbM7JksLHLhcrVflNnqDCh5fiBcZROnY5OCOWlamlaJcSOTO9oiyIYtO50MPw
 565h0NVu1OkDw1F3hJlaEbk39HsimcY4lNzgNEvSbhPhR8U0cTPGVTN
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Historically each architecture defined their own datapage to store the
VDSO data. This stands in contrast to the generic nature of the VDSO
code itself.
We plan to introduce a generic framework for the management of the VDSO
data storage that can be used by all architectures and which works
together with the existing generic VDSO code.

Before that is possible align the different architectures by
standardizing on the existing generic infrastructure and moving things
out of the VDSO data page which does not belong there.

Patches	 1- 2:	csky
Patch	    3:	s390
Patches	 4- 5:	arm64
Patch	    6:	riscv
Patch	    7:	arm
Patch	    8:	LoongArch
Patch	    9:	MIPS
Patches 10-20:	x86
Patches 21-27:	powerpc
Patch      28: 	Renamings to avoid a name clash with the new code.

These patches are intended to be merged via the tip tree,
so the following patches can be based on a unified base.

The queue, including the full generic storage, is available at

  git://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git vdso/store

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Nam Cao (1):
      vdso: Rename struct arch_vdso_data to arch_vdso_time_data

Thomas Weißschuh (27):
      csky/vdso: Remove gettimeofday() and friends from VDSO
      csky/vdso: Remove arch_vma_name()
      s390/vdso: Drop LBASE_VDSO
      arm64: vdso: Drop LBASE_VDSO
      arm64: vdso: Use only one single vvar mapping
      riscv: vdso: Use only one single vvar mapping
      arm: vdso: Remove assembly for datapage access
      LoongArch: vDSO: Use vdso/datapage.h to access vDSO data
      MIPS: vdso: Avoid name conflict around "vdso_data"
      x86/mm/mmap: Remove arch_vma_name()
      x86: vdso: Use __arch_get_vdso_data() to access vdso data
      x86: vdso: Place vdso_data at beginning of vvar page
      x86: vdso: Access rng data from kernel without vvar
      x86: vdso: Allocate vvar page from C code
      x86: vdso: Access timens vdso data without vvar.h
      x86: vdso: Access rng vdso data without vvar.h
      x86: vdso: Move the rng offset to vsyscall.h
      x86: vdso: Access vdso data without vvar.h
      x86: vdso: Delete vvar.h
      x86: vdso: Split virtual clock pages into dedicated mapping
      powerpc: vdso: Remove offset comment from 32bit vdso_arch_data
      powerpc: procfs: Propagate error of remap_pfn_range()
      powerpc/pseries/lparcfg: Fix printing of system_active_processors
      powerpc/pseries/lparcfg: Use num_possible_cpus() for potential processors
      powerpc: Add kconfig option for the systemcfg page
      powerpc: Split systemcfg data out of vdso data page
      powerpc: Split systemcfg struct definitions out from vdso

 arch/Kconfig                                       |   2 +-
 arch/arm/include/asm/vdso/gettimeofday.h           |   4 +-
 arch/arm/vdso/Makefile                             |   2 +-
 arch/arm/vdso/datapage.S                           |  16 ---
 arch/arm/vdso/vdso.lds.S                           |   3 +-
 arch/arm64/include/asm/vdso.h                      |   9 +-
 arch/arm64/kernel/vdso.c                           |  43 +++-----
 arch/arm64/kernel/vdso/vdso.lds.S                  |   2 +-
 arch/arm64/kernel/vdso32/vdso.lds.S                |   2 +-
 arch/csky/Kconfig                                  |   4 -
 arch/csky/include/asm/vdso/clocksource.h           |   9 --
 arch/csky/include/asm/vdso/gettimeofday.h          | 114 ---------------------
 arch/csky/include/asm/vdso/processor.h             |  12 ---
 arch/csky/include/asm/vdso/vsyscall.h              |  22 ----
 arch/csky/kernel/vdso.c                            |  31 +-----
 arch/csky/kernel/vdso/Makefile                     |   1 -
 arch/csky/kernel/vdso/vdso.lds.S                   |   4 -
 arch/csky/kernel/vdso/vgettimeofday.c              |  30 ------
 arch/loongarch/include/asm/vdso/getrandom.h        |   3 +-
 arch/loongarch/include/asm/vdso/gettimeofday.h     |   4 +-
 arch/loongarch/include/asm/vdso/vdso.h             |  18 +---
 arch/loongarch/kernel/asm-offsets.c                |   9 ++
 arch/loongarch/vdso/vdso.lds.S                     |   8 +-
 arch/loongarch/vdso/vgetcpu.c                      |   2 +-
 arch/mips/vdso/genvdso.c                           |   4 +-
 arch/powerpc/Kconfig                               |   8 ++
 arch/powerpc/include/asm/systemcfg.h               |  52 ++++++++++
 arch/powerpc/include/asm/vdso_datapage.h           |  61 +----------
 arch/powerpc/kernel/proc_powerpc.c                 |  37 +++++--
 arch/powerpc/kernel/setup-common.c                 |   5 +-
 arch/powerpc/kernel/smp.c                          |  11 +-
 arch/powerpc/kernel/time.c                         |   4 +
 arch/powerpc/kernel/vdso.c                         |  20 ----
 arch/powerpc/platforms/powernv/smp.c               |   5 +-
 arch/powerpc/platforms/pseries/hotplug-cpu.c       |   5 +-
 arch/powerpc/platforms/pseries/lparcfg.c           |   5 +-
 arch/riscv/Kconfig                                 |   2 +-
 .../riscv/include/asm/vdso/{data.h => time_data.h} |   8 +-
 arch/riscv/kernel/sys_hwprobe.c                    |   2 +-
 arch/riscv/kernel/vdso.c                           |  52 +++-------
 arch/riscv/kernel/vdso/hwprobe.c                   |   4 +-
 arch/s390/Kconfig                                  |   2 +-
 arch/s390/include/asm/vdso.h                       |   3 -
 arch/s390/include/asm/vdso/data.h                  |  12 ---
 arch/s390/include/asm/vdso/time_data.h             |  12 +++
 arch/s390/kernel/vdso32/vdso32.lds.S               |   2 +-
 arch/s390/kernel/vdso64/vdso64.lds.S               |   2 +-
 arch/x86/entry/vdso/vdso-layout.lds.S              |  20 ++--
 arch/x86/entry/vdso/vma.c                          |  87 ++++++++++------
 arch/x86/include/asm/vdso/getrandom.h              |  10 +-
 arch/x86/include/asm/vdso/gettimeofday.h           |  12 ++-
 arch/x86/include/asm/vdso/vsyscall.h               |  14 ++-
 arch/x86/include/asm/vvar.h                        |  71 -------------
 arch/x86/kernel/vmlinux.lds.S                      |  23 -----
 arch/x86/mm/mmap.c                                 |   5 -
 arch/x86/tools/relocs.c                            |   1 -
 include/vdso/datapage.h                            |   8 +-
 57 files changed, 295 insertions(+), 628 deletions(-)
---
base-commit: 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b
change-id: 20241009-vdso-generic-base-63066fd474b5

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


