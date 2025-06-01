Return-Path: <linuxppc-dev+bounces-9054-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F894ACA0B2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jun 2025 00:46:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b9XBZ0mFdz2xJ8;
	Mon,  2 Jun 2025 08:45:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748817957;
	cv=none; b=N3wA1N7f1QE8GJF6hWIZoBTPBsV/kr++64SzZYf/5UZOSeizw4N1T+32ArYdxNVRsrI1UeSH7U6tDjziIVBMMr7wOgmBh6r6KR+OSPtaZ03zXKBuC6Qn696/F2NUG5E7Pko2cFfoknNGT2HILGGu1vxl/iiknvbEmRUapMk250SMA2dIVoRUIEqIwuzoE0pR8y/Q09j7CMc3VW6WQTYmXuJ4cSFhiS08YtJ4UQ+0nS5QQLeAMT2W9vu7M4N5cE6Hfo2a+Kj5lt6Ik13vBFBQVocN/Ialyn83gmV6DFD0lKoCHDMkGdIkqVVmVzNHSaqBdFztWDTFYsjnFFo/PzaMQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748817957; c=relaxed/relaxed;
	bh=qCkmWEkVwz6dRrG3pC0j3IqxiYQTVTgt5n5ZYeRZ+OQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nXLF5pRP0CVfNH53+16cHFTnxSaEP5XjYqxBEswG23VZqcKnYAipUC8mwrvMV7wECPZINLE6u0Q4sqYri3m0DsDZe1SB44dmTgX8TtBida5AitxycdXxd9eSEqzJ26rd8ZQZFpGKrWIXlM3Ak9lK1qjmpJzHDLfekZ4tiFWynPCj0ueTCnr97EFUavxCtJfYw2V9B5r84DjTr2CcRdfKx+04N9wzT80hdyaJOyWawUpxJoV3FT0dLzTRebAVeOtSntXSA2td1Uxveci7OKilbY9nABYrDw4QgbSAsOfI1laF8N++IkmUQql88eqJXvEPj+IpJc8bwFkFaFJrIusKSQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=D1vveVQO; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=D1vveVQO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b9XBX3QdFz2xGv
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Jun 2025 08:45:56 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 863D160EDF;
	Sun,  1 Jun 2025 22:45:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6902FC4CEE7;
	Sun,  1 Jun 2025 22:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748817952;
	bh=+Jr0DfYTtSLUgtIhUw1xndcaRDnhct6ml0L8zeKyV8I=;
	h=From:To:Cc:Subject:Date:From;
	b=D1vveVQOEOFlaQitpUnAPEJK5wovky/1hjK5K7Yr74MSwV0OMkXyUqCzcdWtVeYZC
	 /Mr/WAD0ylD0RfhFxbDMAvn41iMg4hkgfRRS1YuuIph/cIitepltHPVQhW5eYbS9Dm
	 SFQsbx9+aAHCCKkuo98OfLANfn8gTVaLvgzFSJeYQyGmfsiEJs+f9EpihVF5TXGVs0
	 S1L8P1JIW6ElhBC4kDCQGkew6sOTbo62KYr88FToZQmbIuN2RX9cMJBf7TNrHOueJe
	 uZHIeQppZaEmnIA4yU7gM7sfutEnJuWmQ6wSDU5DjCc7sYnXw+wKBfy92I5Sv6TDUK
	 wu5Ge0GzbiZNw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 00/13] lib/crc: improve how arch-optimized code is integrated
Date: Sun,  1 Jun 2025 15:44:28 -0700
Message-ID: <20250601224441.778374-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This series improves how lib/crc supports arch-optimized code.  First,
instead of the arch-optimized CRC code being in arch/$(SRCARCH)/lib/, it
will now be in lib/crc/$(SRCARCH)/.  Second, the API functions (e.g.
crc32c()), arch-optimized functions (e.g. crc32c_arch()), and generic
functions (e.g. crc32c_base()) will now be part of a single module for
each CRC type, allowing better inlining and dead code elimination.  The
second change is made possible by the first.

As an example, consider CONFIG_CRC32=m on x86.  We'll now have just
crc32.ko instead of both crc32-x86.ko and crc32.ko.  The two modules
were already coupled together and always both got loaded together via
direct symbol dependency, so the separation provided no benefit.

Note: later I'd like to apply the same design to lib/crypto/ too, where
often the API functions are out-of-line so this will work even better.
In those cases, for each algorithm we currently have 3 modules all
coupled together, e.g. libsha256.ko, libsha256-generic.ko, and
sha256-x86.ko.  We should have just one, inline things properly, and
rely on the compiler's dead code elimination to decide the inclusion of
the generic code instead of manually setting it via kconfig.

Having arch-specific code outside arch/ was somewhat controversial when
Zinc proposed it back in 2018.  But I don't think the concerns are
warranted.  It's better from a technical perspective, as it enables the
improvements mentioned above.  This model is already successfully used
in other places in the kernel such as lib/raid6/.  The community of each
architecture still remains free to work on the code, even if it's not in
arch/.  At the time there was also a desire to put the library code in
the same files as the old-school crypto API, but that was a mistake; now
that the library is separate, that's no longer a constraint either.

Patches 1 and 2, which I previously sent out by themselves, are
prerequisites because they eliminate the need for the CRC32 library API
to expose the generic functions.

Eric Biggers (13):
  crypto/crc32: register only one shash_alg
  crypto/crc32c: register only one shash_alg
  lib/crc: move files into lib/crc/
  lib/crc: prepare for arch-optimized code in subdirs of lib/crc/
  lib/crc/arm: migrate arm-optimized CRC code into lib/crc/
  lib/crc/arm64: migrate arm64-optimized CRC code into lib/crc/
  lib/crc/loongarch: migrate loongarch-optimized CRC code into lib/crc/
  lib/crc/mips: migrate mips-optimized CRC code into lib/crc/
  lib/crc/powerpc: migrate powerpc-optimized CRC code into lib/crc/
  lib/crc/riscv: migrate riscv-optimized CRC code into lib/crc/
  lib/crc/s390: migrate s390-optimized CRC code into lib/s390/
  lib/crc/sparc: migrate sparc-optimized CRC code into lib/crc/
  lib/crc/x86: migrate x86-optimized CRC code into lib/crc/

 Documentation/core-api/kernel-api.rst         |  14 +-
 MAINTAINERS                                   |   4 +-
 arch/arm/Kconfig                              |   2 -
 arch/arm/lib/Makefile                         |   6 -
 arch/arm64/Kconfig                            |   2 -
 arch/arm64/lib/Makefile                       |   6 -
 arch/loongarch/Kconfig                        |   1 -
 arch/loongarch/lib/Makefile                   |   2 -
 arch/mips/Kconfig                             |   1 -
 arch/mips/lib/Makefile                        |   2 -
 arch/powerpc/Kconfig                          |   2 -
 arch/powerpc/lib/Makefile                     |   6 -
 arch/riscv/Kconfig                            |   3 -
 arch/riscv/lib/Makefile                       |   6 -
 arch/s390/Kconfig                             |   1 -
 arch/s390/lib/Makefile                        |   3 -
 arch/sparc/Kconfig                            |   1 -
 arch/sparc/lib/Makefile                       |   2 -
 arch/x86/Kconfig                              |   3 -
 arch/x86/lib/Makefile                         |  10 --
 crypto/crc32.c                                |  69 ++--------
 crypto/crc32c.c                               |  70 ++--------
 include/linux/crc-t10dif.h                    |  10 +-
 include/linux/crc32.h                         |  30 +----
 include/linux/crc64.h                         |  22 +---
 lib/Kconfig                                   |  87 +------------
 lib/Kconfig.debug                             |  21 ---
 lib/Makefile                                  |  32 +----
 lib/crc/.gitignore                            |   5 +
 lib/crc/Kconfig                               | 121 ++++++++++++++++++
 lib/crc/Makefile                              |  62 +++++++++
 .../arm/lib => lib/crc/arm}/crc-t10dif-core.S |   0
 .../crc-t10dif.c => lib/crc/arm/crc-t10dif.h  |  23 +---
 {arch/arm/lib => lib/crc/arm}/crc32-core.S    |   0
 arch/arm/lib/crc32.c => lib/crc/arm/crc32.h   |  40 ++----
 .../lib => lib/crc/arm64}/crc-t10dif-core.S   |   0
 .../crc/arm64/crc-t10dif.h                    |  22 +---
 .../arm64/lib => lib/crc/arm64}/crc32-core.S  |   0
 .../lib/crc32.c => lib/crc/arm64/crc32.h      |  22 +---
 lib/{ => crc}/crc-ccitt.c                     |   3 -
 lib/{ => crc}/crc-itu-t.c                     |   0
 lib/{crc-t10dif.c => crc/crc-t10dif-main.c}   |  37 +++++-
 lib/{ => crc}/crc16.c                         |   0
 lib/{crc32.c => crc/crc32-main.c}             |  77 +++++++++--
 lib/{ => crc}/crc4.c                          |   0
 lib/{crc64.c => crc/crc64-main.c}             |  47 ++++++-
 lib/{ => crc}/crc7.c                          |   0
 lib/{ => crc}/crc8.c                          |   0
 lib/{ => crc}/gen_crc32table.c                |   4 +-
 lib/{ => crc}/gen_crc64table.c                |  11 +-
 .../crc/loongarch/crc32.h                     |  34 +----
 .../lib/crc32-mips.c => lib/crc/mips/crc32.h  |  35 +----
 .../crc/powerpc/crc-t10dif.h                  |  20 +--
 .../crc/powerpc}/crc-vpmsum-template.S        |   0
 .../lib/crc32.c => lib/crc/powerpc/crc32.h    |  36 +-----
 .../crc/powerpc}/crc32c-vpmsum_asm.S          |   0
 .../crc/powerpc}/crct10dif-vpmsum_asm.S       |   0
 .../lib => lib/crc/riscv}/crc-clmul-consts.h  |   0
 .../crc/riscv}/crc-clmul-template.h           |   0
 {arch/riscv/lib => lib/crc/riscv}/crc-clmul.h |   0
 .../crc/riscv/crc-t10dif.h                    |   8 +-
 {arch/riscv/lib => lib/crc/riscv}/crc16_msb.c |   0
 .../lib/crc32.c => lib/crc/riscv/crc32.h      |  20 +--
 {arch/riscv/lib => lib/crc/riscv}/crc32_lsb.c |   0
 {arch/riscv/lib => lib/crc/riscv}/crc32_msb.c |   0
 .../lib/crc64.c => lib/crc/riscv/crc64.h      |  11 +-
 {arch/riscv/lib => lib/crc/riscv}/crc64_lsb.c |   0
 {arch/riscv/lib => lib/crc/riscv}/crc64_msb.c |   0
 {arch/s390/lib => lib/crc/s390}/crc32-vx.h    |   0
 arch/s390/lib/crc32.c => lib/crc/s390/crc32.h |  19 +--
 {arch/s390/lib => lib/crc/s390}/crc32be-vx.c  |   0
 {arch/s390/lib => lib/crc/s390}/crc32le-vx.c  |   0
 .../lib/crc32.c => lib/crc/sparc/crc32.h      |  40 +-----
 .../sparc/lib => lib/crc/sparc}/crc32c_asm.S  |   0
 lib/crc/tests/Makefile                        |   2 +
 lib/{ => crc}/tests/crc_kunit.c               |   0
 .../lib => lib/crc/x86}/crc-pclmul-consts.h   |   0
 .../lib => lib/crc/x86}/crc-pclmul-template.S |   0
 .../lib => lib/crc/x86}/crc-pclmul-template.h |   0
 .../crc-t10dif.c => lib/crc/x86/crc-t10dif.h  |  18 +--
 .../lib => lib/crc/x86}/crc16-msb-pclmul.S    |   0
 {arch/x86/lib => lib/crc/x86}/crc32-pclmul.S  |   0
 arch/x86/lib/crc32.c => lib/crc/x86/crc32.h   |  32 +----
 {arch/x86/lib => lib/crc/x86}/crc32c-3way.S   |   0
 {arch/x86/lib => lib/crc/x86}/crc64-pclmul.S  |   0
 arch/x86/lib/crc64.c => lib/crc/x86/crc64.h   |  21 +--
 lib/tests/Makefile                            |   1 -
 87 files changed, 446 insertions(+), 743 deletions(-)
 create mode 100644 lib/crc/.gitignore
 create mode 100644 lib/crc/Kconfig
 create mode 100644 lib/crc/Makefile
 rename {arch/arm/lib => lib/crc/arm}/crc-t10dif-core.S (100%)
 rename arch/arm/lib/crc-t10dif.c => lib/crc/arm/crc-t10dif.h (70%)
 rename {arch/arm/lib => lib/crc/arm}/crc32-core.S (100%)
 rename arch/arm/lib/crc32.c => lib/crc/arm/crc32.h (69%)
 rename {arch/arm64/lib => lib/crc/arm64}/crc-t10dif-core.S (100%)
 rename arch/arm64/lib/crc-t10dif.c => lib/crc/arm64/crc-t10dif.h (70%)
 rename {arch/arm64/lib => lib/crc/arm64}/crc32-core.S (100%)
 rename arch/arm64/lib/crc32.c => lib/crc/arm64/crc32.h (81%)
 rename lib/{ => crc}/crc-ccitt.c (98%)
 rename lib/{ => crc}/crc-itu-t.c (100%)
 rename lib/{crc-t10dif.c => crc/crc-t10dif-main.c} (78%)
 rename lib/{ => crc}/crc16.c (100%)
 rename lib/{crc32.c => crc/crc32-main.c} (73%)
 rename lib/{ => crc}/crc4.c (100%)
 rename lib/{crc64.c => crc/crc64-main.c} (66%)
 rename lib/{ => crc}/crc7.c (100%)
 rename lib/{ => crc}/crc8.c (100%)
 rename lib/{ => crc}/gen_crc32table.c (95%)
 rename lib/{ => crc}/gen_crc64table.c (81%)
 rename arch/loongarch/lib/crc32-loongarch.c => lib/crc/loongarch/crc32.h (71%)
 rename arch/mips/lib/crc32-mips.c => lib/crc/mips/crc32.h (82%)
 rename arch/powerpc/lib/crc-t10dif.c => lib/crc/powerpc/crc-t10dif.h (75%)
 rename {arch/powerpc/lib => lib/crc/powerpc}/crc-vpmsum-template.S (100%)
 rename arch/powerpc/lib/crc32.c => lib/crc/powerpc/crc32.h (64%)
 rename {arch/powerpc/lib => lib/crc/powerpc}/crc32c-vpmsum_asm.S (100%)
 rename {arch/powerpc/lib => lib/crc/powerpc}/crct10dif-vpmsum_asm.S (100%)
 rename {arch/riscv/lib => lib/crc/riscv}/crc-clmul-consts.h (100%)
 rename {arch/riscv/lib => lib/crc/riscv}/crc-clmul-template.h (100%)
 rename {arch/riscv/lib => lib/crc/riscv}/crc-clmul.h (100%)
 rename arch/riscv/lib/crc-t10dif.c => lib/crc/riscv/crc-t10dif.h (62%)
 rename {arch/riscv/lib => lib/crc/riscv}/crc16_msb.c (100%)
 rename arch/riscv/lib/crc32.c => lib/crc/riscv/crc32.h (66%)
 rename {arch/riscv/lib => lib/crc/riscv}/crc32_lsb.c (100%)
 rename {arch/riscv/lib => lib/crc/riscv}/crc32_msb.c (100%)
 rename arch/riscv/lib/crc64.c => lib/crc/riscv/crc64.h (65%)
 rename {arch/riscv/lib => lib/crc/riscv}/crc64_lsb.c (100%)
 rename {arch/riscv/lib => lib/crc/riscv}/crc64_msb.c (100%)
 rename {arch/s390/lib => lib/crc/s390}/crc32-vx.h (100%)
 rename arch/s390/lib/crc32.c => lib/crc/s390/crc32.h (81%)
 rename {arch/s390/lib => lib/crc/s390}/crc32be-vx.c (100%)
 rename {arch/s390/lib => lib/crc/s390}/crc32le-vx.c (100%)
 rename arch/sparc/lib/crc32.c => lib/crc/sparc/crc32.h (62%)
 rename {arch/sparc/lib => lib/crc/sparc}/crc32c_asm.S (100%)
 create mode 100644 lib/crc/tests/Makefile
 rename lib/{ => crc}/tests/crc_kunit.c (100%)
 rename {arch/x86/lib => lib/crc/x86}/crc-pclmul-consts.h (100%)
 rename {arch/x86/lib => lib/crc/x86}/crc-pclmul-template.S (100%)
 rename {arch/x86/lib => lib/crc/x86}/crc-pclmul-template.h (100%)
 rename arch/x86/lib/crc-t10dif.c => lib/crc/x86/crc-t10dif.h (56%)
 rename {arch/x86/lib => lib/crc/x86}/crc16-msb-pclmul.S (100%)
 rename {arch/x86/lib => lib/crc/x86}/crc32-pclmul.S (100%)
 rename arch/x86/lib/crc32.c => lib/crc/x86/crc32.h (76%)
 rename {arch/x86/lib => lib/crc/x86}/crc32c-3way.S (100%)
 rename {arch/x86/lib => lib/crc/x86}/crc64-pclmul.S (100%)
 rename arch/x86/lib/crc64.c => lib/crc/x86/crc64.h (61%)

base-commit: cd2e103d57e5615f9bb027d772f93b9efd567224
-- 
2.49.0


