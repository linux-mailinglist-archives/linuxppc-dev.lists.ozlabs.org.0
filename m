Return-Path: <linuxppc-dev+bounces-9707-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 755F0AE77EB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 09:11:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRtJC3qzwz307q;
	Wed, 25 Jun 2025 17:10:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750835435;
	cv=none; b=jT39z39lCt8dRxPdaMSanqF8YFGE0svhqT7mSdVu/D3giLXUXikshJoaXXfMPq2ijL4fLl5xrh8irFNUouhVGZL1JASokjYVlj5iISsnKVz3TSElnyKR+hsB+J0ChhMdZyY8hdBFUNpQaqc8bzYVxkys2g0Tsz8iayRvLnXhJyWiBr/VtE5X/7NgvM9Xc8hZ81kTEhI9YXyxlvI0aw5kfcgS2UUFWKYEREioLL/pkUPgLCow8dnOVMPjWVO8GhKogq5xPHBWDaB+takpjdb2DLKXFeDHkzlD2R/wZ4VXStSQnzDTAgiXQiEtZ54vuwEX/0HZWUXK5PhWQD063XhKuw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750835435; c=relaxed/relaxed;
	bh=THHkjXjEOqvapB514CaFbXrbuImezgeDGuGgUZi1xU0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F/2pUpYVEgmPV3ktyJrPUxkZJ5AwkiyFzzG4sw2CQ+mMHZ6MlzyObrIdHXR5mtO+NuT0Bl3+rFA8OSCE1Zmv1NvT8LY1g0QrP0y91ff3FzsDAdq+J39ZZ9e7pNtzLSOJ52VPrrG3kjmbDgHZqgek9tTBKB6MQPOfLsgD3k84QGyj62ezGYcuZ1HLPaAyBMF/yY9yfUKjnx3PM8VuT9Oi5eWaQB9ohOQPhvJKQ4R+QpRxp+8/2OHZf/NYrno74K62cQ/flHUQZc/X1lCxyqU+3OM6bEfK4YEkHYS+4GuvlVrA5HNxIUwzAr58AoN1mCABNjJNpZGWrTo2OTvm4tNnpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f8mx/QGa; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f8mx/QGa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRtJ66Tmgz2yPS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 17:10:30 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6DB4AA511D6;
	Wed, 25 Jun 2025 07:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCD40C4CEEA;
	Wed, 25 Jun 2025 07:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750835427;
	bh=dNjTP1K/kwMastCEsJrXq3spz7hep3Wcru9OBJvpwJA=;
	h=From:To:Cc:Subject:Date:From;
	b=f8mx/QGaAe/zXMItJZ0F55QwX91jS97FGsefAFIby9DnkyFtMYmePw0hWX0k2Vjz0
	 BNtUus02OG1FPiTEiuTLnKq4XdAPibOkbVuuWIwqr6Teh6x7q+npmu7RYtGSs3TgKh
	 yHlR3Z3sFMiJF1JmEr21Vz4XeDobauDmgAKuguO0wLRUkdQZo1+uNogSSTox5pjMRA
	 Q9S3L7aW2Ha3BEGdVnUoHxi0bZrXRDXM98wQvtA8KqOd6w32WkvBpZ7zvQj5cG+WOI
	 oDpEQEOqm7HuwDrOxoiqqiywB1kYtRddglKdLZktyv2YJSKY5cUtjgQmHokaeRDEJb
	 SXMChrbYairMQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 00/18] SHA-256 library improvements
Date: Wed, 25 Jun 2025 00:08:01 -0700
Message-ID: <20250625070819.1496119-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
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
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This series is targeting libcrypto-next and can also be retrieved from:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git sha256-lib-cleanup-v1

This series improves the SHA-224 and SHA-256 library code to be
consistent with what I did for SHA-384 and SHA-512.  This includes:

- Use stronger typing in the SHA-224 and SHA-256 functions.

- Add support for HMAC-SHA224 and HMAC-SHA256.  (I'll send a separate
  patch with KUnit test cases for this.)

- Make the old-school crypto API's support for sha224 and sha256 just
  use the actual library API, instead of unsafe low-level functions.

- Consolidate the CPU-based SHA-224 and SHA-256 code into a single
  module, with better inlining and dead code elimination.

- Properly document the SHA-224 and SHA-256 functions.

- Other changes to synchronize the code with SHA-384 and SHA-512.

Patches 3-6 are a few fixes/cleanups for the SHA-384 and SHA-512 code
that I noticed while doing this.

Eric Biggers (18):
  libceph: Rename hmac_sha256() to ceph_hmac_sha256()
  cxl/test: Simplify fw_buf_checksum_show()
  crypto: sha512 - Use the correct legacy export format
  lib/crypto: sha512: Reorder some code in sha512.c
  lib/crypto: sha512: Do not include <crypto/internal/sha2.h>
  lib/crypto: sha512: Fix a grammatical error in kerneldoc comments
  lib/crypto: sha256: Reorder some code
  lib/crypto: sha256: Remove sha256_blocks_simd()
  lib/crypto: sha256: Add sha224() and sha224_update()
  lib/crypto: sha256: Make library API use strongly-typed contexts
  lib/crypto: sha256: Propagate sha256_block_state type to
    implementations
  lib/crypto: sha256: Add HMAC-SHA224 and HMAC-SHA256 support
  crypto: sha256 - Wrap library and add HMAC support
  crypto: sha256 - Use same state format as legacy drivers
  lib/crypto: sha512: Remove sha256_is_arch_optimized()
  lib/crypto: sha256: Consolidate into single module
  lib/crypto: sha256: Sync sha256_update() with sha512_update()
  lib/crypto: sha256: Document the SHA-224 and SHA-256 API

 arch/mips/cavium-octeon/Kconfig               |   6 -
 arch/mips/cavium-octeon/crypto/Makefile       |   1 -
 arch/riscv/purgatory/purgatory.c              |   8 +-
 arch/s390/purgatory/purgatory.c               |   2 +-
 arch/x86/purgatory/purgatory.c                |   2 +-
 crypto/Kconfig                                |   4 +-
 crypto/sha256.c                               | 371 +++++++++-------
 crypto/sha512.c                               |  22 +-
 crypto/testmgr.c                              |  12 +
 drivers/char/tpm/tpm2-sessions.c              |  12 +-
 drivers/crypto/img-hash.c                     |   4 +-
 drivers/crypto/starfive/jh7110-hash.c         |   8 +-
 include/crypto/internal/sha2.h                |  66 ---
 include/crypto/sha2.h                         | 402 +++++++++++++++--
 kernel/kexec_file.c                           |  10 +-
 lib/crypto/Kconfig                            |  34 +-
 lib/crypto/Makefile                           |  39 +-
 lib/crypto/arm/Kconfig                        |   7 -
 lib/crypto/arm/Makefile                       |   8 +-
 lib/crypto/arm/sha256-armv4.pl                |  20 +-
 lib/crypto/arm/sha256-ce.S                    |   2 +-
 lib/crypto/arm/sha256.c                       |  64 ---
 lib/crypto/arm/sha256.h                       |  46 ++
 lib/crypto/arm64/Kconfig                      |   6 -
 lib/crypto/arm64/Makefile                     |   9 +-
 lib/crypto/arm64/sha2-armv8.pl                |   2 +-
 lib/crypto/arm64/sha256-ce.S                  |   2 +-
 lib/crypto/arm64/sha256.c                     |  75 ----
 lib/crypto/arm64/sha256.h                     |  58 +++
 lib/crypto/arm64/sha512.h                     |   6 +-
 .../crypto/mips/sha256.h                      |  20 +-
 lib/crypto/powerpc/Kconfig                    |   6 -
 lib/crypto/powerpc/Makefile                   |   3 -
 lib/crypto/powerpc/{sha256.c => sha256.h}     |  19 +-
 lib/crypto/riscv/Kconfig                      |   8 -
 lib/crypto/riscv/Makefile                     |   3 -
 .../sha256-riscv64-zvknha_or_zvknhb-zvkb.S    |   2 +-
 lib/crypto/riscv/sha256.c                     |  67 ---
 lib/crypto/riscv/sha256.h                     |  42 ++
 lib/crypto/s390/Kconfig                       |   6 -
 lib/crypto/s390/Makefile                      |   3 -
 lib/crypto/s390/sha256.c                      |  47 --
 lib/crypto/s390/sha256.h                      |  28 ++
 lib/crypto/sha256-generic.c                   | 138 ------
 lib/crypto/sha256.c                           | 411 ++++++++++++++++--
 lib/crypto/sha512.c                           |  75 ++--
 lib/crypto/sparc/Kconfig                      |   8 -
 lib/crypto/sparc/Makefile                     |   4 -
 lib/crypto/sparc/{sha256.c => sha256.h}       |  37 +-
 lib/crypto/tests/sha224_kunit.c               |  15 +-
 lib/crypto/tests/sha256_kunit.c               |   2 +-
 lib/crypto/x86/Kconfig                        |   8 -
 lib/crypto/x86/Makefile                       |   3 -
 lib/crypto/x86/sha256-avx-asm.S               |   2 +-
 lib/crypto/x86/sha256-avx2-asm.S              |   2 +-
 lib/crypto/x86/sha256-ni-asm.S                |   2 +-
 lib/crypto/x86/sha256-ssse3-asm.S             |   2 +-
 lib/crypto/x86/sha256.c                       |  80 ----
 lib/crypto/x86/sha256.h                       |  55 +++
 net/ceph/messenger_v2.c                       |  12 +-
 tools/testing/cxl/test/mem.c                  |  21 +-
 61 files changed, 1369 insertions(+), 1070 deletions(-)
 delete mode 100644 include/crypto/internal/sha2.h
 delete mode 100644 lib/crypto/arm/sha256.c
 create mode 100644 lib/crypto/arm/sha256.h
 delete mode 100644 lib/crypto/arm64/sha256.c
 create mode 100644 lib/crypto/arm64/sha256.h
 rename arch/mips/cavium-octeon/crypto/octeon-sha256.c => lib/crypto/mips/sha256.h (76%)
 rename lib/crypto/powerpc/{sha256.c => sha256.h} (76%)
 delete mode 100644 lib/crypto/riscv/sha256.c
 create mode 100644 lib/crypto/riscv/sha256.h
 delete mode 100644 lib/crypto/s390/sha256.c
 create mode 100644 lib/crypto/s390/sha256.h
 delete mode 100644 lib/crypto/sha256-generic.c
 delete mode 100644 lib/crypto/sparc/Kconfig
 delete mode 100644 lib/crypto/sparc/Makefile
 rename lib/crypto/sparc/{sha256.c => sha256.h} (53%)
 delete mode 100644 lib/crypto/x86/sha256.c
 create mode 100644 lib/crypto/x86/sha256.h


base-commit: d74152ec2b5106263c2a502380acfaf5954f9898
-- 
2.50.0


