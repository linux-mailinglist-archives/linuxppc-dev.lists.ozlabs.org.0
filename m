Return-Path: <linuxppc-dev+bounces-9560-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CE1AE0DB3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jun 2025 21:22:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNVq713r8z2yF1;
	Fri, 20 Jun 2025 05:22:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750360930;
	cv=none; b=Fp8BNAuLmN+ZsL1jBhI0cZYZtYibXs/t3ycjv94ZY8tGiBbJ5i6WAf9ahdVkX00WtsHF2ONMir+k0gs6A5Op2oIddhNIKckTGfktB/qN1L8r9bUZ5NA0ifB5riqyx4u6+zmGd2DHQ4gR5jce3EIZ8JF+Oct2Ta12Pj43vlkDFSz4Tdz5o5kKjhkNg+z+otzaBFQ2SV1COLQVV/Xb1as12FN2dJb6i0nBkWB/P+yUCI6ckqglD52sXTnv5cmA0AwzEBmN1rARezQKdk/ykjaeh0tOOUFptWdYAoydHhGJbj9fOizxo1U0AtlXtSUHXZ+AYDxmNOmlnnZsG64/Oe5pAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750360930; c=relaxed/relaxed;
	bh=op8uxJiZJcCsIUzDoS3EQ/635BCXkIAFSyrEKQ1He04=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y7pDdRXyOfhdumiOply4sYhlKagzFpsqCL+LdJUeBc/qYIleZgyPddhmBVZliOXtaDTQXbHnijVn9lwe+vCdc7dPlaYquNuBmgGVaar97x4CjiH6P69HuVRX8Xv/cQNISOxHr+ojgUTXSOZk9aVh54QRIoFwCYZDm7yImoUUZyCxttKWCSBU1dnxzhv0M5svgH6iqRHYjcNlBbWcvqC5VTKR2BsEUAQqPFPeZSgHmOjB9RxLQfvUOENlGCpvkkZSBc0LalNGpnhMpnd7BTUmePO2xq0tgkuCPf2b0K54K9T5FPtm8ur0pR5y21W10HtElqZ4MJ82IH6PHnH0ExUCCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Yz6Ikq5r; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Yz6Ikq5r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNVq53vT9z2xRs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jun 2025 05:22:09 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BEB0361140;
	Thu, 19 Jun 2025 19:22:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 052A0C4CEEA;
	Thu, 19 Jun 2025 19:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750360926;
	bh=jmrdGd3GvJ31TvJntp3ksEbB5xST5taMNbDxinY66vg=;
	h=From:To:Cc:Subject:Date:From;
	b=Yz6Ikq5rKYwn4yMQdjVT/HIwxHppEMUsudT9DRL9wpMcXwK0vmNHJvL1ZX+nft3Mq
	 X3fzlSr72u4abOQ48iOGEr1q1tRtyzPwTdkEQlxvyVRFFgpkBk7Is7YFlkwrQAYqKP
	 YNHCr05v2Wk5yOyCOHspRwUvUlCsrfdFFXvl0JIBBw/oCEH7I5/jzWJdqMOgiet0WZ
	 XgXglFN/Phfy8K0kEM5BY4BqXWAWl6FUuRC/T/PR9A24nUFAe2rNffVKY3DI0twp7A
	 N07y4HroQCuXz3NdcciTuo9NNCoEJUws7EdSV2tpQ/zwti7FzUk0cHyBE3TMAvYCuk
	 RNxytRVCM4sQg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v2 0/9] lib/crypto: move arch/$(ARCH)/lib/crypto/ to lib/crypto/$(ARCH)/
Date: Thu, 19 Jun 2025 12:18:59 -0700
Message-ID: <20250619191908.134235-1-ebiggers@kernel.org>
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

This series applies on top of
https://lore.kernel.org/r/20250616014019.415791-1-ebiggers@kernel.org/
and is also available in git at:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git arch-to-lib-crypto-v2

This series moves the contents of arch/$(ARCH)/lib/crypto/ into
lib/crypto/$(ARCH)/.

The new code organization makes a lot more sense for how this code
actually works and is developed.  In particular, it makes it possible to
build each algorithm as a single module, with better inlining and dead
code elimination.  For a more detailed explanation, see the patchset
which did this for the CRC library code:
https://lore.kernel.org/r/20250607200454.73587-1-ebiggers@kernel.org/.
Also see the patchset which did this for SHA-512:
https://lore.kernel.org/linux-crypto/20250616014019.415791-1-ebiggers@kernel.org/

This is just a preparatory series, which does the move to get the files
into their new location but keeps them building the same way as before.
Later patch series will make the actual improvements to the way the
arch-optimized code is integrated for each algorithm.

Changed in v2:
   - Instead of keeping arch/*/lib/crypto/.gitignore, instead add entry
     for now-removed crypto directory to arch/*/lib/.gitignore.
   - Adjusted commit messages and titles.
   - Added Reviewed-by.

Eric Biggers (9):
  lib/crypto: arm: move arch/arm/lib/crypto/ into lib/crypto/
  lib/crypto: arm64: move arch/arm64/lib/crypto/ into lib/crypto/
  lib/crypto: mips: move arch/mips/lib/crypto/ into lib/crypto/
  lib/crypto: powerpc: move arch/powerpc/lib/crypto/ into lib/crypto/
  lib/crypto: riscv: move arch/riscv/lib/crypto/ into lib/crypto/
  lib/crypto: s390: move arch/s390/lib/crypto/ into lib/crypto/
  lib/crypto: sparc: move arch/sparc/lib/crypto/ into lib/crypto/
  lib/crypto: x86: move arch/x86/lib/crypto/ into lib/crypto/
  MAINTAINERS: drop arch/*/lib/crypto/ pattern

 MAINTAINERS                                      |  1 -
 arch/arm/lib/.gitignore                          |  4 ++++
 arch/arm/lib/Makefile                            |  2 --
 arch/arm/lib/crypto/.gitignore                   |  3 ---
 arch/arm64/lib/.gitignore                        |  4 ++++
 arch/arm64/lib/Makefile                          |  3 ---
 arch/arm64/lib/crypto/.gitignore                 |  3 ---
 arch/mips/lib/.gitignore                         |  4 ++++
 arch/mips/lib/Makefile                           |  2 --
 arch/powerpc/lib/Makefile                        |  2 --
 arch/riscv/lib/Makefile                          |  1 -
 arch/s390/lib/Makefile                           |  1 -
 arch/sparc/lib/Makefile                          |  1 -
 arch/x86/lib/.gitignore                          |  4 ++++
 arch/x86/lib/Makefile                            |  2 --
 lib/crypto/Kconfig                               | 16 ++++++++--------
 lib/crypto/Makefile                              | 11 ++++++++++-
 lib/crypto/arm/.gitignore                        |  2 ++
 {arch/arm/lib/crypto => lib/crypto/arm}/Kconfig  |  0
 {arch/arm/lib/crypto => lib/crypto/arm}/Makefile |  0
 .../lib/crypto => lib/crypto/arm}/blake2s-core.S |  0
 .../lib/crypto => lib/crypto/arm}/blake2s-glue.c |  0
 .../lib/crypto => lib/crypto/arm}/chacha-glue.c  |  0
 .../crypto => lib/crypto/arm}/chacha-neon-core.S |  0
 .../crypto/arm}/chacha-scalar-core.S             |  0
 .../crypto => lib/crypto/arm}/poly1305-armv4.pl  |  0
 .../crypto => lib/crypto/arm}/poly1305-glue.c    |  0
 .../crypto => lib/crypto/arm}/sha256-armv4.pl    |  0
 .../lib/crypto => lib/crypto/arm}/sha256-ce.S    |  0
 {arch/arm/lib/crypto => lib/crypto/arm}/sha256.c |  0
 lib/crypto/arm64/.gitignore                      |  2 ++
 .../lib/crypto => lib/crypto/arm64}/Kconfig      |  0
 .../lib/crypto => lib/crypto/arm64}/Makefile     |  0
 .../crypto/arm64}/chacha-neon-core.S             |  0
 .../crypto/arm64}/chacha-neon-glue.c             |  0
 .../crypto/arm64}/poly1305-armv8.pl              |  0
 .../crypto => lib/crypto/arm64}/poly1305-glue.c  |  0
 .../crypto => lib/crypto/arm64}/sha2-armv8.pl    |  0
 .../lib/crypto => lib/crypto/arm64}/sha256-ce.S  |  0
 .../lib/crypto => lib/crypto/arm64}/sha256.c     |  0
 .../lib/crypto => lib/crypto/mips}/.gitignore    |  0
 .../mips/lib/crypto => lib/crypto/mips}/Kconfig  |  0
 .../mips/lib/crypto => lib/crypto/mips}/Makefile |  0
 .../lib/crypto => lib/crypto/mips}/chacha-core.S |  0
 .../lib/crypto => lib/crypto/mips}/chacha-glue.c |  0
 .../crypto => lib/crypto/mips}/poly1305-glue.c   |  0
 .../crypto => lib/crypto/mips}/poly1305-mips.pl  |  0
 .../lib/crypto => lib/crypto/powerpc}/Kconfig    |  0
 .../lib/crypto => lib/crypto/powerpc}/Makefile   |  0
 .../crypto/powerpc}/chacha-p10-glue.c            |  0
 .../crypto/powerpc}/chacha-p10le-8x.S            |  0
 .../crypto/powerpc}/poly1305-p10-glue.c          |  0
 .../crypto/powerpc}/poly1305-p10le_64.S          |  0
 .../crypto/powerpc}/sha256-spe-asm.S             |  0
 .../lib/crypto => lib/crypto/powerpc}/sha256.c   |  0
 .../lib/crypto => lib/crypto/riscv}/Kconfig      |  0
 .../lib/crypto => lib/crypto/riscv}/Makefile     |  0
 .../crypto/riscv}/chacha-riscv64-glue.c          |  0
 .../crypto/riscv}/chacha-riscv64-zvkb.S          |  0
 .../sha256-riscv64-zvknha_or_zvknhb-zvkb.S       |  0
 .../lib/crypto => lib/crypto/riscv}/sha256.c     |  0
 .../s390/lib/crypto => lib/crypto/s390}/Kconfig  |  0
 .../s390/lib/crypto => lib/crypto/s390}/Makefile |  0
 .../lib/crypto => lib/crypto/s390}/chacha-glue.c |  0
 .../lib/crypto => lib/crypto/s390}/chacha-s390.S |  0
 .../lib/crypto => lib/crypto/s390}/chacha-s390.h |  0
 .../s390/lib/crypto => lib/crypto/s390}/sha256.c |  0
 .../lib/crypto => lib/crypto/sparc}/Kconfig      |  0
 .../lib/crypto => lib/crypto/sparc}/Makefile     |  0
 .../lib/crypto => lib/crypto/sparc}/sha256.c     |  0
 .../lib/crypto => lib/crypto/sparc}/sha256_asm.S |  0
 .../x86/lib/crypto => lib/crypto/x86}/.gitignore |  0
 {arch/x86/lib/crypto => lib/crypto/x86}/Kconfig  |  0
 {arch/x86/lib/crypto => lib/crypto/x86}/Makefile |  0
 .../lib/crypto => lib/crypto/x86}/blake2s-core.S |  0
 .../lib/crypto => lib/crypto/x86}/blake2s-glue.c |  0
 .../crypto/x86}/chacha-avx2-x86_64.S             |  0
 .../crypto/x86}/chacha-avx512vl-x86_64.S         |  0
 .../crypto/x86}/chacha-ssse3-x86_64.S            |  0
 .../lib/crypto => lib/crypto/x86}/chacha_glue.c  |  0
 .../crypto/x86}/poly1305-x86_64-cryptogams.pl    |  0
 .../crypto => lib/crypto/x86}/poly1305_glue.c    |  0
 .../crypto => lib/crypto/x86}/sha256-avx-asm.S   |  0
 .../crypto => lib/crypto/x86}/sha256-avx2-asm.S  |  0
 .../crypto => lib/crypto/x86}/sha256-ni-asm.S    |  0
 .../crypto => lib/crypto/x86}/sha256-ssse3-asm.S |  0
 {arch/x86/lib/crypto => lib/crypto/x86}/sha256.c |  0
 87 files changed, 38 insertions(+), 30 deletions(-)
 create mode 100644 arch/arm/lib/.gitignore
 delete mode 100644 arch/arm/lib/crypto/.gitignore
 create mode 100644 arch/arm64/lib/.gitignore
 delete mode 100644 arch/arm64/lib/crypto/.gitignore
 create mode 100644 arch/mips/lib/.gitignore
 rename {arch/arm/lib/crypto => lib/crypto/arm}/Kconfig (100%)
 rename {arch/arm/lib/crypto => lib/crypto/arm}/Makefile (100%)
 rename {arch/arm/lib/crypto => lib/crypto/arm}/blake2s-core.S (100%)
 rename {arch/arm/lib/crypto => lib/crypto/arm}/blake2s-glue.c (100%)
 rename {arch/arm/lib/crypto => lib/crypto/arm}/chacha-glue.c (100%)
 rename {arch/arm/lib/crypto => lib/crypto/arm}/chacha-neon-core.S (100%)
 rename {arch/arm/lib/crypto => lib/crypto/arm}/chacha-scalar-core.S (100%)
 rename {arch/arm/lib/crypto => lib/crypto/arm}/poly1305-armv4.pl (100%)
 rename {arch/arm/lib/crypto => lib/crypto/arm}/poly1305-glue.c (100%)
 rename {arch/arm/lib/crypto => lib/crypto/arm}/sha256-armv4.pl (100%)
 rename {arch/arm/lib/crypto => lib/crypto/arm}/sha256-ce.S (100%)
 rename {arch/arm/lib/crypto => lib/crypto/arm}/sha256.c (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/Kconfig (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/Makefile (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/chacha-neon-core.S (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/chacha-neon-glue.c (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/poly1305-armv8.pl (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/poly1305-glue.c (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/sha2-armv8.pl (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/sha256-ce.S (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/sha256.c (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/.gitignore (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/Kconfig (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/Makefile (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/chacha-core.S (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/chacha-glue.c (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/poly1305-glue.c (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/poly1305-mips.pl (100%)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/Kconfig (100%)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/Makefile (100%)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/chacha-p10-glue.c (100%)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/chacha-p10le-8x.S (100%)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/poly1305-p10-glue.c (100%)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/poly1305-p10le_64.S (100%)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/sha256-spe-asm.S (100%)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/sha256.c (100%)
 rename {arch/riscv/lib/crypto => lib/crypto/riscv}/Kconfig (100%)
 rename {arch/riscv/lib/crypto => lib/crypto/riscv}/Makefile (100%)
 rename {arch/riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-glue.c (100%)
 rename {arch/riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-zvkb.S (100%)
 rename {arch/riscv/lib/crypto => lib/crypto/riscv}/sha256-riscv64-zvknha_or_zvknhb-zvkb.S (100%)
 rename {arch/riscv/lib/crypto => lib/crypto/riscv}/sha256.c (100%)
 rename {arch/s390/lib/crypto => lib/crypto/s390}/Kconfig (100%)
 rename {arch/s390/lib/crypto => lib/crypto/s390}/Makefile (100%)
 rename {arch/s390/lib/crypto => lib/crypto/s390}/chacha-glue.c (100%)
 rename {arch/s390/lib/crypto => lib/crypto/s390}/chacha-s390.S (100%)
 rename {arch/s390/lib/crypto => lib/crypto/s390}/chacha-s390.h (100%)
 rename {arch/s390/lib/crypto => lib/crypto/s390}/sha256.c (100%)
 rename {arch/sparc/lib/crypto => lib/crypto/sparc}/Kconfig (100%)
 rename {arch/sparc/lib/crypto => lib/crypto/sparc}/Makefile (100%)
 rename {arch/sparc/lib/crypto => lib/crypto/sparc}/sha256.c (100%)
 rename {arch/sparc/lib/crypto => lib/crypto/sparc}/sha256_asm.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/.gitignore (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/Kconfig (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/Makefile (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/blake2s-core.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/blake2s-glue.c (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/chacha-avx2-x86_64.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/chacha-avx512vl-x86_64.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/chacha-ssse3-x86_64.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/chacha_glue.c (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/poly1305-x86_64-cryptogams.pl (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/poly1305_glue.c (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/sha256-avx-asm.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/sha256-avx2-asm.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/sha256-ni-asm.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/sha256-ssse3-asm.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/sha256.c (100%)

-- 
2.50.0


