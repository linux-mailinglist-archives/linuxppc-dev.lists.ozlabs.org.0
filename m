Return-Path: <linuxppc-dev+bounces-7914-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94295A970A8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 17:28:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZhmN44pcJz3c1C;
	Wed, 23 Apr 2025 01:28:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745335700;
	cv=none; b=N8LnlcOWrGinBQx37AZXJnjeMQ2Cx82r5dpkcmy2QRf5ndfBL0aTYaWWI4MwJAW2WO3whGJcwa60Z86mfOet0RJF/Z/kEkYoAFTbLAwZGz5Vcjr2cvO38bhIXWb0btchglMLTtjP0TRueu0BzTUhTlETX4A6HzYb0spY/9esqAAWSZ/BSS+JZ0lTSDD+K4tWAP4LRd6wO01VbjwXk32Gk2VZjiFnmZ6nuFzCJ1FV4bts/YiW4VvaV7q6WD6ua3GpWs6Zxp4VfuXRgdrqousxwhvFqAFk/h9Xbh9XqrqttXE9UmzLX7RyqOp0nL2Q8WdrUiesmk4Trz4EFjVNY4LLgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745335700; c=relaxed/relaxed;
	bh=JCTyTBIIf/QorubiTsDpM9QBqhdWr2M8Ga7jYGYja5I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XsUxv8+XUlcA4NDGHzoQgAtKAZPY7O8Y/JKZO0bUoHkE6WgPXBKCwmsxHtoTRtrY+pHycTMOstSkhBazME/hq4pQni7a+ZzCiSdFkgkA1w2R6N6fkFX/aeHX2Z0aUgCebW1UCpxKMwdrjvU2MD71KlzAa57o3Ro/Y6+BbKKGjH47xE+13WvnZ1VThJbtJKfuStp/5vLa1clvfqQKTGUMnYtdAjPPCVkQwnEe0qqHXCNPmvTCsRL6/+cF6ZX8+DMzefrXx8b7hUw9KR8S90zpakR7jEniAlUQEfWdxmWCNWvdRSS075JD753bWcXCDPNPyzldOZ0FH1biHcVxu8Ib/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r2C1zzQ/; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r2C1zzQ/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZhmN21r2hz3btn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Apr 2025 01:28:18 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CBD53A4BD0B;
	Tue, 22 Apr 2025 15:22:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A341C4CEEC;
	Tue, 22 Apr 2025 15:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745335694;
	bh=RInyZrD0gAu95MMMtI1Xy1yYNgjyW5cUQ56jzsf5ziU=;
	h=From:To:Cc:Subject:Date:From;
	b=r2C1zzQ/hs7mqzbHs2PFFNBFuondu33UnDjNz3rSvYSqnbphUM9LnMW2tlraJp8zf
	 +TXDHzgEtPHTuIBC73A097V8x0DSBt85XVRklVCixt3sc05rQDpkBFDhcoBmYzEdqv
	 X4KKVMP3fM8lBnqlpRqKnY/9c7js5o4hartil+JldwHyPo2K/mVCV7CxpK9S3+aSib
	 +CTBgoaVGv4RT8PlQMAA+NyBe74B3IcmTL4+sVq/atz3I81FRv/b/Bns9fPSNR/XK8
	 ZLuBoRuoZuK/sS5fRkxYQiVwpoC82iiTFcP3499ZkIXUEbLa+qOgHf/QpzYlua5/hn
	 /kC3++00+efjg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v3 00/13] Finish disentangling ChaCha, Poly1305, and BLAKE2s from CRYPTO
Date: Tue, 22 Apr 2025 08:27:03 -0700
Message-ID: <20250422152716.5923-1-ebiggers@kernel.org>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This series removes the unnecessary dependency of the ChaCha, Poly1305,
and BLAKE2s library functions on the generic crypto infrastructure, i.e.
CONFIG_CRYPTO.  To do this, it moves the architecture-optimized
implementations of these functions into new directories
arch/*/lib/crypto/ which do not depend on CRYPTO.  This mirrors the
existing distinction between crypto/ and lib/crypto/.

The last two patches remove the selection of CRYPTO by CRYPTO_LIB_CHACHA
and CRYPTO_LIB_POLY1305, and they remove the corresponding *_INTERNAL
symbols which were needed only because of the entanglement with CRYPTO.

Note that Curve25519 is still entangled.  Later patches will fix that.

Changed in v3:
   - Fixed build error on arm with CONFIG_CPU_THUMBONLY=y.
   - Small whitespace and commit message fixes.
   - Added Acked-by's.

Changed in v2:
   - Introduced new directories arch/*/lib/crypto/ instead of keeping
     the library functions in arch/*/crypto/.

Eric Biggers (13):
  crypto: arm64 - drop redundant dependencies on ARM64
  crypto: powerpc - drop redundant dependencies on PPC
  crypto: s390 - drop redundant dependencies on S390
  crypto: x86 - drop redundant dependencies on X86
  crypto: arm - move library functions to arch/arm/lib/crypto/
  crypto: arm64 - move library functions to arch/arm64/lib/crypto/
  crypto: mips - move library functions to arch/mips/lib/crypto/
  crypto: powerpc - move library functions to arch/powerpc/lib/crypto/
  crypto: riscv - move library functions to arch/riscv/lib/crypto/
  crypto: s390 - move library functions to arch/s390/lib/crypto/
  crypto: x86 - move library functions to arch/x86/lib/crypto/
  crypto: lib/chacha - remove INTERNAL symbol and selection of CRYPTO
  crypto: lib/poly1305 - remove INTERNAL symbol and selection of CRYPTO

 MAINTAINERS                                   |  1 +
 arch/arm/crypto/Kconfig                       | 23 -----
 arch/arm/crypto/Makefile                      | 14 +--
 arch/arm/lib/Makefile                         |  2 +
 arch/arm/lib/crypto/.gitignore                |  2 +
 arch/arm/lib/crypto/Kconfig                   | 24 ++++++
 arch/arm/lib/crypto/Makefile                  | 26 ++++++
 arch/arm/{ => lib}/crypto/blake2s-core.S      |  0
 arch/arm/{ => lib}/crypto/blake2s-glue.c      |  0
 arch/arm/{ => lib}/crypto/chacha-glue.c       |  0
 arch/arm/{ => lib}/crypto/chacha-neon-core.S  |  0
 .../arm/{ => lib}/crypto/chacha-scalar-core.S |  0
 arch/arm/{ => lib}/crypto/poly1305-armv4.pl   |  0
 arch/arm/{ => lib}/crypto/poly1305-glue.c     |  0
 arch/arm64/crypto/Kconfig                     | 17 +---
 arch/arm64/crypto/Makefile                    |  9 +-
 arch/arm64/lib/Makefile                       |  3 +
 arch/arm64/lib/crypto/.gitignore              |  2 +
 arch/arm64/lib/crypto/Kconfig                 | 14 +++
 arch/arm64/lib/crypto/Makefile                | 16 ++++
 .../arm64/{ => lib}/crypto/chacha-neon-core.S |  0
 .../arm64/{ => lib}/crypto/chacha-neon-glue.c |  0
 arch/arm64/{ => lib}/crypto/poly1305-armv8.pl |  0
 arch/arm64/{ => lib}/crypto/poly1305-glue.c   |  0
 arch/mips/crypto/Kconfig                      | 11 ---
 arch/mips/crypto/Makefile                     | 17 ----
 arch/mips/lib/Makefile                        |  2 +
 arch/mips/lib/crypto/.gitignore               |  2 +
 arch/mips/lib/crypto/Kconfig                  | 12 +++
 arch/mips/lib/crypto/Makefile                 | 19 ++++
 arch/mips/{ => lib}/crypto/chacha-core.S      |  0
 arch/mips/{ => lib}/crypto/chacha-glue.c      |  0
 arch/mips/{ => lib}/crypto/poly1305-glue.c    |  0
 arch/mips/{ => lib}/crypto/poly1305-mips.pl   |  0
 arch/powerpc/crypto/Kconfig                   | 22 +----
 arch/powerpc/crypto/Makefile                  |  4 -
 arch/powerpc/lib/Makefile                     |  2 +
 arch/powerpc/lib/crypto/Kconfig               | 15 ++++
 arch/powerpc/lib/crypto/Makefile              |  7 ++
 .../{ => lib}/crypto/chacha-p10-glue.c        |  0
 .../{ => lib}/crypto/chacha-p10le-8x.S        |  0
 .../{ => lib}/crypto/poly1305-p10-glue.c      |  0
 .../{ => lib}/crypto/poly1305-p10le_64.S      |  0
 arch/riscv/crypto/Kconfig                     |  7 --
 arch/riscv/crypto/Makefile                    |  3 -
 arch/riscv/lib/Makefile                       |  1 +
 arch/riscv/lib/crypto/Kconfig                 |  8 ++
 arch/riscv/lib/crypto/Makefile                |  4 +
 .../{ => lib}/crypto/chacha-riscv64-glue.c    |  0
 .../{ => lib}/crypto/chacha-riscv64-zvkb.S    |  0
 arch/s390/crypto/Kconfig                      | 16 ----
 arch/s390/crypto/Makefile                     |  3 -
 arch/s390/lib/Makefile                        |  1 +
 arch/s390/lib/crypto/Kconfig                  |  7 ++
 arch/s390/lib/crypto/Makefile                 |  4 +
 arch/s390/{ => lib}/crypto/chacha-glue.c      |  0
 arch/s390/{ => lib}/crypto/chacha-s390.S      |  0
 arch/s390/{ => lib}/crypto/chacha-s390.h      |  0
 arch/x86/crypto/Kconfig                       | 86 +++++++------------
 arch/x86/crypto/Makefile                      | 15 ----
 arch/x86/lib/Makefile                         |  2 +
 arch/x86/lib/crypto/.gitignore                |  2 +
 arch/x86/lib/crypto/Kconfig                   | 26 ++++++
 arch/x86/lib/crypto/Makefile                  | 17 ++++
 arch/x86/{ => lib}/crypto/blake2s-core.S      |  0
 arch/x86/{ => lib}/crypto/blake2s-glue.c      |  0
 .../x86/{ => lib}/crypto/chacha-avx2-x86_64.S |  0
 .../{ => lib}/crypto/chacha-avx512vl-x86_64.S |  0
 .../{ => lib}/crypto/chacha-ssse3-x86_64.S    |  0
 arch/x86/{ => lib}/crypto/chacha_glue.c       |  0
 .../crypto/poly1305-x86_64-cryptogams.pl      |  0
 arch/x86/{ => lib}/crypto/poly1305_glue.c     |  0
 crypto/Kconfig                                |  4 +-
 lib/crypto/Kconfig                            | 56 +++++++-----
 74 files changed, 294 insertions(+), 234 deletions(-)
 create mode 100644 arch/arm/lib/crypto/.gitignore
 create mode 100644 arch/arm/lib/crypto/Kconfig
 create mode 100644 arch/arm/lib/crypto/Makefile
 rename arch/arm/{ => lib}/crypto/blake2s-core.S (100%)
 rename arch/arm/{ => lib}/crypto/blake2s-glue.c (100%)
 rename arch/arm/{ => lib}/crypto/chacha-glue.c (100%)
 rename arch/arm/{ => lib}/crypto/chacha-neon-core.S (100%)
 rename arch/arm/{ => lib}/crypto/chacha-scalar-core.S (100%)
 rename arch/arm/{ => lib}/crypto/poly1305-armv4.pl (100%)
 rename arch/arm/{ => lib}/crypto/poly1305-glue.c (100%)
 create mode 100644 arch/arm64/lib/crypto/.gitignore
 create mode 100644 arch/arm64/lib/crypto/Kconfig
 create mode 100644 arch/arm64/lib/crypto/Makefile
 rename arch/arm64/{ => lib}/crypto/chacha-neon-core.S (100%)
 rename arch/arm64/{ => lib}/crypto/chacha-neon-glue.c (100%)
 rename arch/arm64/{ => lib}/crypto/poly1305-armv8.pl (100%)
 rename arch/arm64/{ => lib}/crypto/poly1305-glue.c (100%)
 create mode 100644 arch/mips/lib/crypto/.gitignore
 create mode 100644 arch/mips/lib/crypto/Kconfig
 create mode 100644 arch/mips/lib/crypto/Makefile
 rename arch/mips/{ => lib}/crypto/chacha-core.S (100%)
 rename arch/mips/{ => lib}/crypto/chacha-glue.c (100%)
 rename arch/mips/{ => lib}/crypto/poly1305-glue.c (100%)
 rename arch/mips/{ => lib}/crypto/poly1305-mips.pl (100%)
 create mode 100644 arch/powerpc/lib/crypto/Kconfig
 create mode 100644 arch/powerpc/lib/crypto/Makefile
 rename arch/powerpc/{ => lib}/crypto/chacha-p10-glue.c (100%)
 rename arch/powerpc/{ => lib}/crypto/chacha-p10le-8x.S (100%)
 rename arch/powerpc/{ => lib}/crypto/poly1305-p10-glue.c (100%)
 rename arch/powerpc/{ => lib}/crypto/poly1305-p10le_64.S (100%)
 create mode 100644 arch/riscv/lib/crypto/Kconfig
 create mode 100644 arch/riscv/lib/crypto/Makefile
 rename arch/riscv/{ => lib}/crypto/chacha-riscv64-glue.c (100%)
 rename arch/riscv/{ => lib}/crypto/chacha-riscv64-zvkb.S (100%)
 create mode 100644 arch/s390/lib/crypto/Kconfig
 create mode 100644 arch/s390/lib/crypto/Makefile
 rename arch/s390/{ => lib}/crypto/chacha-glue.c (100%)
 rename arch/s390/{ => lib}/crypto/chacha-s390.S (100%)
 rename arch/s390/{ => lib}/crypto/chacha-s390.h (100%)
 create mode 100644 arch/x86/lib/crypto/.gitignore
 create mode 100644 arch/x86/lib/crypto/Kconfig
 create mode 100644 arch/x86/lib/crypto/Makefile
 rename arch/x86/{ => lib}/crypto/blake2s-core.S (100%)
 rename arch/x86/{ => lib}/crypto/blake2s-glue.c (100%)
 rename arch/x86/{ => lib}/crypto/chacha-avx2-x86_64.S (100%)
 rename arch/x86/{ => lib}/crypto/chacha-avx512vl-x86_64.S (100%)
 rename arch/x86/{ => lib}/crypto/chacha-ssse3-x86_64.S (100%)
 rename arch/x86/{ => lib}/crypto/chacha_glue.c (100%)
 rename arch/x86/{ => lib}/crypto/poly1305-x86_64-cryptogams.pl (100%)
 rename arch/x86/{ => lib}/crypto/poly1305_glue.c (100%)


base-commit: bb9c648b334be581a791c7669abaa594e4b5ebb7
-- 
2.49.0


