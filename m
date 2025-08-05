Return-Path: <linuxppc-dev+bounces-10674-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCBBB1BC86
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Aug 2025 00:30:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxSmL2hwXz2xck;
	Wed,  6 Aug 2025 08:30:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754433010;
	cv=none; b=lRbom1EN75EMGzfRmU2QJHRz/bQ0jUPX75YBSH577/fjKnxj2t/fe3ayA1EL7CCoN8NOIzZcVjA+2hF+bmjxa5u6RsW5Qg6xkjUWx8CjfXu7RoY9WYmPyKevZI/DvQUfiWI3Rn3UW+lf3XcgerCrqm1IMueX8LyeghfGas5fN7EWflgOCzNolWqUvkRl81U7HX9VULgdea4Q9Q00E9bl8DPBqbFBS2n0GSNpB4QWt/GRGbOQH5IgPPeuQfYwbYRyzEGRD/yvX8btfEUJ8bAJ7XR53rSW9IgNFzYvNGiF/Q8cGkwAqtg91QuQOHEA+aTpQgCP8FJ4TRwf91Ru8vwfiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754433010; c=relaxed/relaxed;
	bh=R0HKXZbhk+4h3gUwmA1OE+TXHM+1bwdStufOcAInYxU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JDdAykhxuqVCqhiOBe8t8eVQiL+MrLRDFW5dVpqRjEzdea5LJVEO6jhSRQI9L8ATgaxo6tLh5sFsBnPnhVdjjUyWgLj5DX1VFGuVK3+/X3rYggtTxXfY7PAmoxhl2QX15PT59alKgm8w9FvkhdGq4Pk16fM2pwEjLvbPH6ZjaSM6HibVwKkaK/o5XOU1mZ1GuWaMJ53fjEf2kcbDB40EGio5m7wbX3dUp1HTWQFsbnDkkm0n9e+z2Mw8ihhC61Xrx1fue+S8KyoF5jqKTpJz/EMD4GXRI4fDzc/VDZ65Vc3IPlk7EWaN92jYeu1Sp6Gl1YdaeMh9MivcYkj4YssR2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uI+dm8Jr; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uI+dm8Jr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxSmK2jlNz2xRs
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Aug 2025 08:30:09 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E5ED9601D1;
	Tue,  5 Aug 2025 22:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E859BC4CEF0;
	Tue,  5 Aug 2025 22:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754433006;
	bh=7ylTPhqKIZKqcaCZzAUkFz0JFvQR09C/unf3SduQA68=;
	h=From:To:Cc:Subject:Date:From;
	b=uI+dm8JrGYlbEptuLosbA376eEtZB3eyNYrv7b5JBvFPQSxCZXVXb+gHdeAkVZAes
	 C7h6VOmn3DI/jO1iy81zLEC64c4bGfyw7Xn1Z0gnFy3GJHHOODVU18dw+NdH1UWatj
	 vaXBnMEEqR96Fv81P8iqtkf9SM968MEnDOXEbpZK9NSiIOqsPL9UnF1/uYElHxkTYu
	 dY5FExx/Gh0Gp1GVh50gEomRbvqQ+P66nq3xIquMXRh0O5aCUvUnJdWS4lYwTdf+HX
	 WWcGDMVh0kOnqKg5kB9kPMbBGYyW95b52Zn6HoJXKITouqAY2RYQZoO/Ia1q1ZoMK2
	 9UAsRpJ37UeVg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 0/7] MD5 library functions
Date: Tue,  5 Aug 2025 15:28:48 -0700
Message-ID: <20250805222855.10362-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
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

This series is targeting libcrypto-next and can also be retrieved from:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git md5-lib-v2

This series introduces a library API for MD5 and HMAC-MD5 and
reimplements the crypto_shash "md5" and "hmac(md5)" on top of it.

The library API will also be usable directly by various in-kernel users
that are stuck with MD5 due to having to implement legacy protocols.

This should again look quite boring and familiar, as it mirrors the
SHA-1 and SHA-2 changes closely.

Changed in v2:
  - Kept the architecture-optimized MD5 code, since unfortunately there
    were objections to removing it.

Eric Biggers (7):
  lib/crypto: md5: Add MD5 and HMAC-MD5 library functions
  lib/crypto: mips/md5: Migrate optimized code into library
  mips: cavium-octeon: Move octeon-crypto.c into parent dir
  lib/crypto: powerpc/md5: Migrate optimized code into library
  lib/crypto: sparc/md5: Migrate optimized code into library
  crypto: md5 - Wrap library and add HMAC support
  lib/crypto: tests: Add KUnit tests for MD5 and HMAC-MD5

 arch/mips/cavium-octeon/Makefile              |   2 +-
 arch/mips/cavium-octeon/crypto/Makefile       |   8 -
 arch/mips/cavium-octeon/crypto/octeon-md5.c   | 214 -----------
 .../{crypto => }/octeon-crypto.c              |   0
 arch/mips/configs/cavium_octeon_defconfig     |   1 -
 arch/mips/crypto/Kconfig                      |  10 -
 arch/powerpc/configs/powernv_defconfig        |   1 -
 arch/powerpc/configs/ppc64_defconfig          |   1 -
 arch/powerpc/crypto/Kconfig                   |   8 -
 arch/powerpc/crypto/Makefile                  |   2 -
 arch/powerpc/crypto/md5-glue.c                |  99 -----
 arch/sparc/crypto/Kconfig                     |  10 -
 arch/sparc/crypto/Makefile                    |   4 -
 arch/sparc/crypto/md5_glue.c                  | 174 ---------
 crypto/Kconfig                                |   2 +-
 crypto/md5.c                                  | 359 ++++++++----------
 crypto/testmgr.c                              |   3 +
 drivers/crypto/img-hash.c                     |   2 +-
 include/crypto/md5.h                          | 181 ++++++++-
 lib/crypto/Kconfig                            |  13 +
 lib/crypto/Makefile                           |  12 +
 lib/crypto/md5.c                              | 322 ++++++++++++++++
 lib/crypto/mips/md5.h                         |  65 ++++
 .../crypto => lib/crypto/powerpc}/md5-asm.S   |   0
 lib/crypto/powerpc/md5.h                      |  12 +
 lib/crypto/sparc/md5.h                        |  48 +++
 .../crypto => lib/crypto/sparc}/md5_asm.S     |   0
 lib/crypto/tests/Kconfig                      |  10 +
 lib/crypto/tests/Makefile                     |   1 +
 lib/crypto/tests/md5-testvecs.h               | 186 +++++++++
 lib/crypto/tests/md5_kunit.c                  |  39 ++
 31 files changed, 1060 insertions(+), 729 deletions(-)
 delete mode 100644 arch/mips/cavium-octeon/crypto/Makefile
 delete mode 100644 arch/mips/cavium-octeon/crypto/octeon-md5.c
 rename arch/mips/cavium-octeon/{crypto => }/octeon-crypto.c (100%)
 delete mode 100644 arch/powerpc/crypto/md5-glue.c
 delete mode 100644 arch/sparc/crypto/md5_glue.c
 create mode 100644 lib/crypto/md5.c
 create mode 100644 lib/crypto/mips/md5.h
 rename {arch/powerpc/crypto => lib/crypto/powerpc}/md5-asm.S (100%)
 create mode 100644 lib/crypto/powerpc/md5.h
 create mode 100644 lib/crypto/sparc/md5.h
 rename {arch/sparc/crypto => lib/crypto/sparc}/md5_asm.S (100%)
 create mode 100644 lib/crypto/tests/md5-testvecs.h
 create mode 100644 lib/crypto/tests/md5_kunit.c


base-commit: 186f3edfdd41f2ae87fc40a9ccba52a3bf930994
-- 
2.50.1


