Return-Path: <linuxppc-dev+bounces-8117-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5F2A9F66E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Apr 2025 19:02:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmV9S2pXtz30RK;
	Tue, 29 Apr 2025 03:02:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745859724;
	cv=none; b=ayUCKTTPTV1oRRuQp9mpRl4kNxPEifmRNX7eUwncXPLpGKtZx/tXZIN0ksm374jIRUTHC5V6BZstfaMw4NJ/WFGBIi1XHzI9CAw2Dg+KK3NAFT27OXNnZeRDjcK0AF6TSquOTcNcpiyy/Q/QEii6FJd1X5ZJzlBUcnCazavjV3chJHsa1gFiFJuScKOPh1/WzbiLXAhZyRS3jPLjq+/ENeGEI2GskY7p5VyuGa9FzZpMn1UBHdtv8/founFZsvwWtQ/KJ01HgdMPEJDNGaztlkIPwvQYy90aJkJlkO/TQUrabSxMCqBv3gNQfV1TXIYMqVl1MrnX8odQ0DNgnGHrzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745859724; c=relaxed/relaxed;
	bh=PHLiIwSCvTLj134spCUBl0P1X339oWed8jBjcI5l7O4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cCCGOGpzM9j8TAFA8LFtCJf9gtoKD2L7+24H1Wx3Sd31FISaHG+bJr9UnYO+bVcpdaXOwvuSwkKKA9NXcRdFowjZ/zsL0zK/JLfdx17rs9vJ160jI4RM4PES6+8aNYU8FhJoWcBo8vIDvsjFJA1ka4sYk9ZnaerLRGnW+ZlJgi8TWD7u+CCoO6NbXtjLY8y8iYMMb0iL799HWVNuS7rMWAlRH6lBzMFM/gtGrvBMONLy4A0FchVx0+I+3tkkX6mSRzZQy/WtERu/v/gPTxF81GvNVvHUBJW7iqvbNnImy0l+ISrK4J8qC3RM7rz7d91GIcfz+rEmAdpMoBuDpAGoIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VzAYmKSF; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VzAYmKSF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZmV9Q2JWkz30Lt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Apr 2025 03:02:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 62C075C5B8F;
	Mon, 28 Apr 2025 16:59:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEF47C4CEE4;
	Mon, 28 Apr 2025 17:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745859719;
	bh=XK7q7Zz0y/YmoLpjlx1FJdc0BX2x3ByOt7hnXtJHIP0=;
	h=From:To:Cc:Subject:Date:From;
	b=VzAYmKSFPCv9LO+z3NyJNmE29HM97zw0w+cAAP5jOAtTL8J33qg/YU1iwxIu2heKa
	 NgvfU9+nxqmhDlYra2/fB/lISwTYKj07gA7bZCE4uoCmaGoqzelQMfKCBDJy4W8M3H
	 +uYG+DjdsY8Ac9dDs0Xf9VmjlOG2idw9zTLeLkbrYNF6Ug3VWcPmBnJX1d658fuCWM
	 7+eA+rDBr7VUfxeFyJy0COScjZG6ut0wj+jOQOgXaSyjIcVSUi7nPW3IZxDdKYPNmQ
	 RwkAjFjatxLfFkrNBfAJK0crnpy2Cgi4FEf8YsBDajiX4D4F58WKkkzjxPdeOEv0ZQ
	 oqNV5J2CbRzjg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v4 00/13] Architecture-optimized SHA-256 library API
Date: Mon, 28 Apr 2025 10:00:25 -0700
Message-ID: <20250428170040.423825-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This is based on cryptodev commit 2dfc7cd74a5e062a.  It can also be
retrieved from:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git sha256-lib-v4

Following the example of several other algorithms (e.g. CRC32, ChaCha,
Poly1305, BLAKE2s), this series refactors the kernel's existing
architecture-optimized SHA-256 code to be available via the library API,
instead of just via the crypto_shash API as it was before.  It also
reimplements the SHA-256 crypto_shash API on top of the library API.

This makes it possible to use the SHA-256 library in
performance-critical cases.  The new design is also much simpler, with a
negative diffstat of almost 1200 lines.  Finally, this also fixes the
longstanding issue where the arch-optimized SHA-256 was disabled by
default, so people often forgot to enable it.

For now the SHA-256 library is well-covered by the crypto_shash
self-tests, but I plan to add a test for the library directly later.
I've fully tested this series on arm, arm64, riscv, and x86.  On mips,
powerpc, s390, and sparc I've only been able to partially test it, since
QEMU does not support the SHA-256 instructions on those platforms.  If
anyone with access to a mips, powerpc, s390, or sparc system that has
SHA-256 instructions can verify that the crypto self-tests still pass,

Changed v1 => v4:
    - Moved sha256_generic_blocks() into its own module to avoid a
      circular module dependency.
    - Added Ard's Reviewed-by tags.
    - Rebased onto cryptodev.

Eric Biggers (13):
  crypto: sha256 - support arch-optimized lib and expose through shash
  crypto: arm/sha256 - implement library instead of shash
  crypto: arm64/sha256 - remove obsolete chunking logic
  crypto: arm64/sha256 - implement library instead of shash
  crypto: mips/sha256 - implement library instead of shash
  crypto: powerpc/sha256 - implement library instead of shash
  crypto: riscv/sha256 - implement library instead of shash
  crypto: s390/sha256 - implement library instead of shash
  crypto: sparc - move opcodes.h into asm directory
  crypto: sparc/sha256 - implement library instead of shash
  crypto: x86/sha256 - implement library instead of shash
  crypto: sha256 - remove sha256_base.h
  crypto: lib/sha256 - improve function prototypes

 arch/arm/configs/exynos_defconfig             |   1 -
 arch/arm/configs/milbeaut_m10v_defconfig      |   1 -
 arch/arm/configs/multi_v7_defconfig           |   1 -
 arch/arm/configs/omap2plus_defconfig          |   1 -
 arch/arm/configs/pxa_defconfig                |   1 -
 arch/arm/crypto/Kconfig                       |  21 -
 arch/arm/crypto/Makefile                      |   8 +-
 arch/arm/crypto/sha2-ce-glue.c                |  87 ----
 arch/arm/crypto/sha256_glue.c                 | 107 -----
 arch/arm/crypto/sha256_glue.h                 |   9 -
 arch/arm/crypto/sha256_neon_glue.c            |  75 ---
 arch/arm/lib/crypto/.gitignore                |   1 +
 arch/arm/lib/crypto/Kconfig                   |   6 +
 arch/arm/lib/crypto/Makefile                  |   8 +-
 arch/arm/{ => lib}/crypto/sha256-armv4.pl     |   0
 .../sha2-ce-core.S => lib/crypto/sha256-ce.S} |  10 +-
 arch/arm/lib/crypto/sha256.c                  |  64 +++
 arch/arm64/configs/defconfig                  |   1 -
 arch/arm64/crypto/Kconfig                     |  19 -
 arch/arm64/crypto/Makefile                    |  13 +-
 arch/arm64/crypto/sha2-ce-glue.c              | 138 ------
 arch/arm64/crypto/sha256-glue.c               | 171 -------
 arch/arm64/lib/crypto/.gitignore              |   1 +
 arch/arm64/lib/crypto/Kconfig                 |   5 +
 arch/arm64/lib/crypto/Makefile                |   9 +-
 .../crypto/sha2-armv8.pl}                     |   0
 .../sha2-ce-core.S => lib/crypto/sha256-ce.S} |  36 +-
 arch/arm64/lib/crypto/sha256.c                |  75 +++
 arch/mips/cavium-octeon/Kconfig               |   6 +
 .../mips/cavium-octeon/crypto/octeon-sha256.c | 135 ++----
 arch/mips/configs/cavium_octeon_defconfig     |   1 -
 arch/mips/crypto/Kconfig                      |  10 -
 arch/powerpc/crypto/Kconfig                   |  11 -
 arch/powerpc/crypto/Makefile                  |   2 -
 arch/powerpc/crypto/sha256-spe-glue.c         | 128 ------
 arch/powerpc/lib/crypto/Kconfig               |   6 +
 arch/powerpc/lib/crypto/Makefile              |   3 +
 .../powerpc/{ => lib}/crypto/sha256-spe-asm.S |   0
 arch/powerpc/lib/crypto/sha256.c              |  70 +++
 arch/riscv/crypto/Kconfig                     |  11 -
 arch/riscv/crypto/Makefile                    |   3 -
 arch/riscv/crypto/sha256-riscv64-glue.c       | 125 -----
 arch/riscv/lib/crypto/Kconfig                 |   7 +
 arch/riscv/lib/crypto/Makefile                |   3 +
 .../sha256-riscv64-zvknha_or_zvknhb-zvkb.S    |   4 +-
 arch/riscv/lib/crypto/sha256.c                |  62 +++
 arch/s390/configs/debug_defconfig             |   1 -
 arch/s390/configs/defconfig                   |   1 -
 arch/s390/crypto/Kconfig                      |  10 -
 arch/s390/crypto/Makefile                     |   1 -
 arch/s390/crypto/sha256_s390.c                | 144 ------
 arch/s390/lib/crypto/Kconfig                  |   6 +
 arch/s390/lib/crypto/Makefile                 |   2 +
 arch/s390/lib/crypto/sha256.c                 |  47 ++
 arch/sparc/crypto/Kconfig                     |  10 -
 arch/sparc/crypto/Makefile                    |   2 -
 arch/sparc/crypto/aes_asm.S                   |   3 +-
 arch/sparc/crypto/aes_glue.c                  |   3 +-
 arch/sparc/crypto/camellia_asm.S              |   3 +-
 arch/sparc/crypto/camellia_glue.c             |   3 +-
 arch/sparc/crypto/des_asm.S                   |   3 +-
 arch/sparc/crypto/des_glue.c                  |   3 +-
 arch/sparc/crypto/md5_asm.S                   |   3 +-
 arch/sparc/crypto/md5_glue.c                  |   3 +-
 arch/sparc/crypto/sha1_asm.S                  |   3 +-
 arch/sparc/crypto/sha1_glue.c                 |   3 +-
 arch/sparc/crypto/sha256_glue.c               | 129 ------
 arch/sparc/crypto/sha512_asm.S                |   3 +-
 arch/sparc/crypto/sha512_glue.c               |   3 +-
 arch/sparc/{crypto => include/asm}/opcodes.h  |   6 +-
 arch/sparc/lib/Makefile                       |   1 +
 arch/sparc/lib/crc32c_asm.S                   |   3 +-
 arch/sparc/lib/crypto/Kconfig                 |   8 +
 arch/sparc/lib/crypto/Makefile                |   4 +
 arch/sparc/lib/crypto/sha256.c                |  64 +++
 arch/sparc/{ => lib}/crypto/sha256_asm.S      |   5 +-
 arch/x86/crypto/Kconfig                       |  14 -
 arch/x86/crypto/Makefile                      |   3 -
 arch/x86/crypto/sha256_ssse3_glue.c           | 432 ------------------
 arch/x86/lib/crypto/Kconfig                   |   7 +
 arch/x86/lib/crypto/Makefile                  |   3 +
 arch/x86/{ => lib}/crypto/sha256-avx-asm.S    |  12 +-
 arch/x86/{ => lib}/crypto/sha256-avx2-asm.S   |  12 +-
 .../crypto/sha256-ni-asm.S}                   |  36 +-
 arch/x86/{ => lib}/crypto/sha256-ssse3-asm.S  |  14 +-
 arch/x86/lib/crypto/sha256.c                  |  74 +++
 crypto/Kconfig                                |   1 +
 crypto/Makefile                               |   3 +-
 crypto/sha256.c                               | 201 ++++++++
 crypto/sha256_generic.c                       | 102 -----
 include/crypto/internal/sha2.h                |  28 ++
 include/crypto/sha2.h                         |  23 +-
 include/crypto/sha256_base.h                  | 180 --------
 lib/crypto/Kconfig                            |  22 +
 lib/crypto/Makefile                           |   3 +
 lib/crypto/sha256-generic.c                   | 137 ++++++
 lib/crypto/sha256.c                           | 204 ++++-----
 97 files changed, 1128 insertions(+), 2319 deletions(-)
 delete mode 100644 arch/arm/crypto/sha2-ce-glue.c
 delete mode 100644 arch/arm/crypto/sha256_glue.c
 delete mode 100644 arch/arm/crypto/sha256_glue.h
 delete mode 100644 arch/arm/crypto/sha256_neon_glue.c
 rename arch/arm/{ => lib}/crypto/sha256-armv4.pl (100%)
 rename arch/arm/{crypto/sha2-ce-core.S => lib/crypto/sha256-ce.S} (91%)
 create mode 100644 arch/arm/lib/crypto/sha256.c
 delete mode 100644 arch/arm64/crypto/sha2-ce-glue.c
 delete mode 100644 arch/arm64/crypto/sha256-glue.c
 rename arch/arm64/{crypto/sha512-armv8.pl => lib/crypto/sha2-armv8.pl} (100%)
 rename arch/arm64/{crypto/sha2-ce-core.S => lib/crypto/sha256-ce.S} (80%)
 create mode 100644 arch/arm64/lib/crypto/sha256.c
 delete mode 100644 arch/powerpc/crypto/sha256-spe-glue.c
 rename arch/powerpc/{ => lib}/crypto/sha256-spe-asm.S (100%)
 create mode 100644 arch/powerpc/lib/crypto/sha256.c
 delete mode 100644 arch/riscv/crypto/sha256-riscv64-glue.c
 rename arch/riscv/{ => lib}/crypto/sha256-riscv64-zvknha_or_zvknhb-zvkb.S (98%)
 create mode 100644 arch/riscv/lib/crypto/sha256.c
 delete mode 100644 arch/s390/crypto/sha256_s390.c
 create mode 100644 arch/s390/lib/crypto/sha256.c
 delete mode 100644 arch/sparc/crypto/sha256_glue.c
 rename arch/sparc/{crypto => include/asm}/opcodes.h (96%)
 create mode 100644 arch/sparc/lib/crypto/Kconfig
 create mode 100644 arch/sparc/lib/crypto/Makefile
 create mode 100644 arch/sparc/lib/crypto/sha256.c
 rename arch/sparc/{ => lib}/crypto/sha256_asm.S (95%)
 delete mode 100644 arch/x86/crypto/sha256_ssse3_glue.c
 rename arch/x86/{ => lib}/crypto/sha256-avx-asm.S (98%)
 rename arch/x86/{ => lib}/crypto/sha256-avx2-asm.S (98%)
 rename arch/x86/{crypto/sha256_ni_asm.S => lib/crypto/sha256-ni-asm.S} (85%)
 rename arch/x86/{ => lib}/crypto/sha256-ssse3-asm.S (98%)
 create mode 100644 arch/x86/lib/crypto/sha256.c
 create mode 100644 crypto/sha256.c
 delete mode 100644 crypto/sha256_generic.c
 create mode 100644 include/crypto/internal/sha2.h
 delete mode 100644 include/crypto/sha256_base.h
 create mode 100644 lib/crypto/sha256-generic.c


base-commit: 2dfc7cd74a5e062a5405560447517e7aab1c7341
-- 
2.49.0


