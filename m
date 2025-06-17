Return-Path: <linuxppc-dev+bounces-9426-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 756F7ADDECB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 00:30:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMM4q613Fz2y92;
	Wed, 18 Jun 2025 08:30:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750199403;
	cv=none; b=YAs6R+R0+QAtUtWePT8g0Ej65XwMOIbe3hVFItOj8gVhoDwTHdUkT3ccEHCeni8xxd9tsmPK0W/wx+D8eR19DvKhPJzHsHvmz7jEvcqn16o5sk3Iga9jUYAO0C6p393futi2Np52jhfTzetmNSJaJySsRZZ+o4ptnLNPqmQ3QS7jmtsPjGu6flPOOlB6Ft7jk8wvt/Mg+cxi7vL2iih8xk5ZUWiqc+h8nOh8Df45do9sQ/yeLYeGnkLvmfo7ILw+DFrVSn7kchruH0Wj0UbUncfmjvEqsa7Ij2AJTOadXW7vSLTx4arOIPiXQW3cpOtReKKZuszNyg3n7pGX+Ls1fw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750199403; c=relaxed/relaxed;
	bh=QCkOlL+4+seiO2+WL3DoxSOsmGY8RtBk/qJCXZ3ylYI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XxLxL9UB9oOKnH4ToyJ3C8CqD6qfIOXW0pY1ZpOG8xKMMFmMZs6XCwFwY+Lrl7Qya0RdKREquZRRj/7i19XrDLvtQ0iTTMyORobudr0xSdCUFkgXYfG6fvAub8SBiDztW+TIoprxxPWt5FQ7fca7lB/nV4756ju0rDVM8h61XFXqttAgd7e2snmxHPDtaAx0aUAwNxwQnYeudnVygOGWaogaYKtrBTPyTLgubWqBQpigDYpawbl9JCfZrnmZUlk4OPLwB37LLeAYYpsvixsCdjhru2ma7kOhBkRBsu4BQE6PpUipa1rwEnTx50jwbnToUUSEfPBYBZ8WfIvN5XLuMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n+7P/y3E; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n+7P/y3E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMM4m5lcwz2xPc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 08:30:00 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1ABBA6111C;
	Tue, 17 Jun 2025 22:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70007C4CEE3;
	Tue, 17 Jun 2025 22:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750199397;
	bh=0mROCvAkY84h3wsIpbNLCY1gzYL1020FxJLMgOjDJTY=;
	h=From:To:Cc:Subject:Date:From;
	b=n+7P/y3EpQYb9JC/xhcaAICmrBI9FlrvjdYlDCtennrygikav6it9ZSmPjELmu69A
	 +Zw+41ZhtHJEZMq4R/XTXsTuAIS5I3BgSGnqPpd+lwcem/AfJ+kqTuNi8JXZOo+FuD
	 P0rLGSV7Q+xFY6bWX6bfYAiA4s6Y2hEVD4ZFIT9wiBOfLtzXQgeDQ73o6vcFBnyDws
	 USOn8XsBOS9cmwle7zRncqZdHbuZgJIfnPjFzY5KkFkozqxlmNIH6zbfWdisNH4BdY
	 vitO8k2Xa+pTENrYSdz/WA3iDYjm72BKzMeNOq8bxdT8sz44cMaG0kxKkZv/oESAhx
	 pQAuGH0okF9nA==
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
Subject: [PATCH 0/9] lib/crypto: move arch/$(ARCH)/lib/crypto/ to lib/crypto/$(ARCH)/
Date: Tue, 17 Jun 2025 15:27:17 -0700
Message-ID: <20250617222726.365148-1-ebiggers@kernel.org>
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

This series applies on top of
https://lore.kernel.org/r/20250616014019.415791-1-ebiggers@kernel.org/
and is also available in git at:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git arch-to-lib-crypto-v1

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

Note that .gitignore files are being intentionally kept for now.  See
https://lore.kernel.org/r/CAHk-=whu2fb22rEy6+oKx1-+NCHuWucZepvD0H2MD38DrJVKtg@mail.gmail.com/
I'll remove it later after some time has passed.

Eric Biggers (9):
  lib/crypto/arm: move arch/arm/lib/crypto/ to lib/crypto/arm/
  lib/crypto/arm64: move arch/arm64/lib/crypto/ to lib/crypto/arm64/
  lib/crypto/mips: move arch/mips/lib/crypto/ to lib/crypto/mips/
  lib/crypto/powerpc: move arch/powerpc/lib/crypto/ to
    lib/crypto/powerpc/
  lib/crypto/riscv: move arch/riscv/lib/crypto/ to lib/crypto/riscv/
  lib/crypto/s390: move arch/s390/lib/crypto/ to lib/crypto/s390/
  lib/crypto/sparc: move arch/sparc/lib/crypto/ to lib/crypto/sparc/
  lib/crypto/x86: move arch/x86/lib/crypto/ to lib/crypto/x86/
  MAINTAINERS: drop arch/*/lib/crypto/ pattern

 MAINTAINERS                                      |  1 -
 arch/arm/lib/Makefile                            |  2 --
 arch/arm64/lib/Makefile                          |  3 ---
 arch/mips/lib/Makefile                           |  2 --
 arch/powerpc/lib/Makefile                        |  2 --
 arch/riscv/lib/Makefile                          |  1 -
 arch/s390/lib/Makefile                           |  1 -
 arch/sparc/lib/Makefile                          |  1 -
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
 lib/crypto/mips/.gitignore                       |  2 ++
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
 lib/crypto/x86/.gitignore                        |  2 ++
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
 81 files changed, 26 insertions(+), 24 deletions(-)
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
 create mode 100644 lib/crypto/mips/.gitignore
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
 create mode 100644 lib/crypto/x86/.gitignore
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
2.49.0


