Return-Path: <linuxppc-dev+bounces-7822-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA43A94911
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Apr 2025 21:27:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zgdn95CQHz3bl7;
	Mon, 21 Apr 2025 05:27:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745177261;
	cv=none; b=oOrgHNjDTrHuQRnQxgFQQvyRd7MY7+fWx9VquBA953QqJCq+P6CcCX7s8IcqSDZRImEaRwewEWh601M/g0skJZGFWOGzMz9oVoVqh+bSbo8XuVSrCKkM3BkdyYyrOFoF6ZheiRB1Ng6isQ3OxgliorJ5t9F5lXAmMp5N8Ftx/aiL084yruPsPiEPEBvndhXdqIlhlFDEA25VHPzGzVOSeaan8/WqHPSb/ATetlFZaVpXy3/mB6ofucpk24yxofRpm65WlTOkVnzwVd04lnzZy1p/cvMmXOj6v1gxpRUkzWitOcYlQJIx8GdJqzZ7vCzG9uFpdH309wsUQV6T7qrMFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745177261; c=relaxed/relaxed;
	bh=eTRAyNtLWQPxHZfZr/ZoppeUM6KohpcyS7h4wlzdVD4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kdCTFeBH1cJtrV16hZ7kNRdvHL9kMYzu5WDg+EU26967OgCZ8XzosVkpfdkZROP/8Loyn0BUTpwl9MAShksAcWDkFjQUwZYGuYgZt2XRUbrhFn0TV/kD9vh4+HSxoSlkpsPSGNsfdu2gSr9uAHWbZaTK/rKiS8gz6iNzyKJZcLRy+fRJ610GysAOnpEqoYwREFcvibeZOv/K1ryT2q+iMfKBxw/TFJRmU/3H5Hfq3ulg4CkJ42tUz72TZhgKOxAjpKBGZIgYtsmOKrH4MiZ+Gd4Y/B6aSK0uhb0jIxoTc7b8B5EoU2a5aJIQWnIfon/Eek/fHteNmD2QSXcevMoSJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FbZpkEBW; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FbZpkEBW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zgdn74sHVz2ySP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Apr 2025 05:27:39 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E11B8443D9;
	Sun, 20 Apr 2025 19:27:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8694C4CEE9;
	Sun, 20 Apr 2025 19:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745177257;
	bh=G2+3guS80Z7+Fi1lTQSy/MYrzhZPPyiZuKBsiQq1cFw=;
	h=From:To:Cc:Subject:Date:From;
	b=FbZpkEBWNhZUAR4S/NO1XoeH4u34SC1lefokMqnGudEWBxqui2vKtymu/fD1cyNRi
	 hLiDpP0PlpvZvzNJR+916yiazGnDSV1m2YybRBCnIUcfMQ2EqTmxZYJXLbwsmNwtk/
	 /N4Zo8jNTcREjehEzjCCccCojpVmkcwHT/8o3zBx0CNWyj7MdXsI/SXXef8PuGC1x/
	 7LMxQ7czZNsOysEpEhKcaaXSJ79WfpajzfVEgmUhRQpWIi2Y1y3NOB0wRIEOSQ8cdD
	 7SLiRWaXXW9kb3MA5oc+kVrQ/QpIwXGHeprC9+xIWfFBX32PAj1CGSGv0QVoeGE7F/
	 BboR7QHPWHDow==
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
Subject: [PATCH v2 00/13] Finish disentangling ChaCha, Poly1305, and BLAKE2s from CRYPTO
Date: Sun, 20 Apr 2025 12:25:56 -0700
Message-ID: <20250420192609.295075-1-ebiggers@kernel.org>
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
 arch/arm/lib/crypto/Makefile                  | 24 ++++++
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
 74 files changed, 292 insertions(+), 234 deletions(-)
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


