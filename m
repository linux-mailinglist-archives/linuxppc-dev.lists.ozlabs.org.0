Return-Path: <linuxppc-dev+bounces-9923-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCD8AEE396
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 18:09:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWB1h0S46z3bpL;
	Tue,  1 Jul 2025 02:09:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751299767;
	cv=none; b=YZnx6SSYYl167oGYcKajlOcEbZy2uWfVmC0Vy70qdXncwa8mowWfWrhlw0f58UUUrHgH75thRUxMLURPTE1tTPkGh+ETv138HcaWp4sNI2EqkTWb2Jk/WBfUOynfWCypkyycjwlj6+zi0WZodXp7KGPz/t5rbFheDLQpT7UHysGGOc9z0Vt1DKIx5w1E7YKFQ+buXOwEDeaSYKuRIpyNS40AY7j8mjujW8kadGXqo0kyizhlbYJtujPlxglDPsiSFCVxDAqAewE957PRHrMKfHBRL/JPNwWiN7q9sQX3ZsYTavjjUx25SyieT+8Jg2yLTcnZAcoJHDRQn01FZDAg9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751299767; c=relaxed/relaxed;
	bh=d9fUYZmc/3Epl2iylX0t/MD0TSv3vwOVZJgxtOCjkPA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RqeHQmVF1Y6p5KYub/mt/wJn2QEhCEhGvIYrEGdSDAYWjXkRU5uEdceyNMDP/zdd7YOHl9oBYCYLMZqN0Vu7H7075VGkE9dSMTfdOq2vFsr9BmUffiV6oOSVTpIkzKq4p4wavpZqgRiZ2t4zTaSFickVQ0aV6fPX0xQRyF006dR18SqWX804CDtsiVUIHEcvwhmxMH6+svC1RFjNHqCU+qymHltXZqhczidV++zHlm4Eu88gk2qI2/U0GXiEi1lTfGtAZi9OucWmmwzAl5WaAaG6PmHM2Cw30luYnGzrnQJ8bc72gx284SqjC2H0+YCfEGEt6EkxoUjOtNpAPkQIiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lJs0niP7; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lJs0niP7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bWB1d2pqgz30W9
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jul 2025 02:09:25 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CB005A52F3D;
	Mon, 30 Jun 2025 16:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DAB8C4CEE3;
	Mon, 30 Jun 2025 16:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299760;
	bh=jSaZckhEe13RC9QBR74JJ8nh/qIlst0hCu0t6sAzGQ4=;
	h=From:To:Cc:Subject:Date:From;
	b=lJs0niP7c4sUx22SprZKZIPiIso64WKvtDPQJT6G30TxCGEWIR3EFb6SHnOqRAtUk
	 fN7c8bb4CH9QiW+9XdpNAcD4nsumnealLOj5hrYxucozl0FKYV/DaI3BwX/T1giLNC
	 z4FsBdQX+fpiqP2wY/i6FG+tKAqKfsWh6AWZun7jpHH1CVKMc/tUzcuV+yllDSZbLx
	 O18dqp2yaiZKu7TnaX1hbLP0VK2d8NbRA+aR3I9Eb+V9RdGjkJYfsgDEb2AY2UbGmc
	 copcTlE59ZwHiTuLQgVaXqDuZGTyksyBwBtx7VvTZzI9J8I64QckbRinKefQAZmPS4
	 PlAo6f4KbPMQg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 00/14] SHA-256 library improvements
Date: Mon, 30 Jun 2025 09:06:31 -0700
Message-ID: <20250630160645.3198-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This series is also available at:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git sha256-lib-cleanup-v2

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

Changed in v2:
- Dropped sha224_kunit.c changes; it will be added later in the history
- Dropped some patches that I folded into the SHA-512 series
- Removed redundant checks of IS_ENABLED(CONFIG_KERNEL_MODE_NEON)
- Removed obsolete setting of -DARCH for sha256.o
- Fixed a commit title to mention sha256 instead of sha512
- Excluded HMAC-SHA{224,256} code from purgatory, where it isn't needed

Eric Biggers (14):
  libceph: Rename hmac_sha256() to ceph_hmac_sha256()
  cxl/test: Simplify fw_buf_checksum_show()
  lib/crypto: sha256: Reorder some code
  lib/crypto: sha256: Remove sha256_blocks_simd()
  lib/crypto: sha256: Add sha224() and sha224_update()
  lib/crypto: sha256: Make library API use strongly-typed contexts
  lib/crypto: sha256: Propagate sha256_block_state type to
    implementations
  lib/crypto: sha256: Add HMAC-SHA224 and HMAC-SHA256 support
  crypto: sha256 - Wrap library and add HMAC support
  crypto: sha256 - Use same state format as legacy drivers
  lib/crypto: sha256: Remove sha256_is_arch_optimized()
  lib/crypto: sha256: Consolidate into single module
  lib/crypto: sha256: Sync sha256_update() with sha512_update()
  lib/crypto: sha256: Document the SHA-224 and SHA-256 API

 arch/mips/cavium-octeon/Kconfig               |   6 -
 arch/mips/cavium-octeon/crypto/Makefile       |   1 -
 arch/riscv/purgatory/purgatory.c              |   8 +-
 arch/s390/purgatory/purgatory.c               |   2 +-
 arch/x86/purgatory/purgatory.c                |   2 +-
 crypto/Kconfig                                |   4 +-
 crypto/Makefile                               |   1 -
 crypto/sha256.c                               | 371 +++++++++-------
 crypto/testmgr.c                              |  12 +
 drivers/char/tpm/tpm2-sessions.c              |  12 +-
 drivers/crypto/img-hash.c                     |   4 +-
 drivers/crypto/starfive/jh7110-hash.c         |   8 +-
 include/crypto/internal/sha2.h                |  66 ---
 include/crypto/sha2.h                         | 390 +++++++++++++++--
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
 lib/crypto/arm64/sha256.h                     |  57 +++
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
 lib/crypto/sha256.c                           | 413 ++++++++++++++++--
 lib/crypto/sparc/Kconfig                      |   8 -
 lib/crypto/sparc/Makefile                     |   4 -
 lib/crypto/sparc/{sha256.c => sha256.h}       |  37 +-
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
 58 files changed, 1307 insertions(+), 1008 deletions(-)
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

-- 
2.50.0


