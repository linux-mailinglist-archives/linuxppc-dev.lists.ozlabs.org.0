Return-Path: <linuxppc-dev+bounces-15553-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF75D14E77
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 20:23:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqj2y38xXz2xP8;
	Tue, 13 Jan 2026 06:23:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768245802;
	cv=none; b=UjecN+JkRgg6EMmrjJknQZCH59SVP5XCKUAt7xGpvvXGhMZO5ITdC8qK9aDYjJQJ6PJVj6bcOBwH+w6nTaoxuoypAQi9hL/mCrXHzdNTrxL9HMFfdo0TpkqtKfsGGO/xFYENDgY/eFCgoheggK+LCBZTvdQC2rE/mWDUMkAldPVf0hOVUhQRDsaUXEove2aZGsZk9L8QRc5YdHRvJ6IPFW1lFRtuC1wv3dPRCiwhFmhyFfmoGqTQAWNu+dG8XVmU9xC/qaxSA1JP202xpYDHlv9RVU6XFM+oUBuOKg3he2popeFjN8FgJFbX3p5y717bNyPRjdfs2CfPkA0D7WmBIA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768245802; c=relaxed/relaxed;
	bh=FcdmpcYl+oA1UjjHKxKQOZkUZuagf/r1xudBDiOQakY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YoSTMJJtJk8HfNM00SiXwcpzWSOaXZ5u8+UBwvTyrrssKFz+snk+qpGXH6Q2l/2PYwAsQwLEfbMT+uhPq4zO0miVJXAwKNusaj7Bb1DQfODRV9fYr/k7ejkpJUwQg3A5IxI77Fwo/GArTGxi6N4KRA8yTEmTzOXMnd294U3eHtSHP8kpis+CB2WEruSQwr/VWMiflfly1ibMRk7xrF4C+K28LOoHfp5x2Ykz/de+bl/a1NcZF8GhOZS1vzykB7TJbdWjjPQCv7p7ATuIMHyJWfWt0G87QWoJOk4tMRC1wRhnMk0UMV/dxJP6eKfQsz8y0OLvstXVvWDGc2j0kR11Uw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=saTCPIlt; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=saTCPIlt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqj2w6H65z2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 06:23:20 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1831C60052;
	Mon, 12 Jan 2026 19:23:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A00AC116D0;
	Mon, 12 Jan 2026 19:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768245797;
	bh=ZRvP8Eu2ZYkXNX7mjnd+j5ZWmCcl5EekdaxQe1idS1w=;
	h=From:To:Cc:Subject:Date:From;
	b=saTCPIltyU6hz6OskiKaBu6wp//9dQn/pMKDiaQBrYAySSw/gaF4u8LT3tpoA/S3x
	 HDgSfhKkzgLurULIdcYBigyg4lcTPA0P4V2A85QIA8Arxy9IjXOyd+XXCtFL4YXbbM
	 9eN1XlEB6jH+SGVbkxNOOg8yh5x83M4rz1na5cHoXKGVUsbJQnzdPuslpZi/xasArB
	 hpEnTlENXpj9JzigBVXjAZGkliYF3R689fK4oBhSkVokLMBKAeehfrxQ+bbAoqbWSt
	 LZKoAa1hg/lJBEFBdij2oE6ESJlxcUveElZZcuVwMZLC/aFoWtf16D3TqQSO55znGl
	 ZPaaDYuTbv88g==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 00/35] AES library improvements
Date: Mon, 12 Jan 2026 11:19:58 -0800
Message-ID: <20260112192035.10427-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This series applies to libcrypto-next.  It can also be retrieved from:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git aes-lib-v2

This series makes three main improvements to the kernel's AES library:

  1. Make it use the kernel's existing architecture-optimized AES code,
     including AES instructions, when available.  Previously, only the
     traditional crypto API gave access to the optimized AES code.
     (As a reminder, AES instructions typically make AES over 10 times
     as fast as the generic code.  They also make it constant-time.)

  2. Support preparing an AES key for only the forward direction of the
     block cipher, using about half as much memory.  This is a helpful
     optimization for many common AES modes of operation.  It also helps
     keep structs small enough to be allocated on the stack, especially
     considering potential future library APIs for AES modes.

  3. Replace the library's generic AES implementation with a much faster
     one that is almost as fast as "aes-generic", while still keeping
     the table size reasonably small and maintaining some constant-time
     hardening.  This allows removing "aes-generic", unifying the
     current two generic AES implementations in the kernel tree.

(1) and (2) end up being interrelated: the existing
'struct crypto_aes_ctx' does not work for either one (in general).
Thus, this series reworks the AES library to be based around new data
types 'struct aes_key' and 'struct aes_enckey'.

As has been the case for other algorithms, to achieve (1) without
duplicating the architecture-optimized code, it had to be moved into
lib/crypto/ rather than copied.  To allow actually removing the
arch-specific crypto_cipher "aes" algorithms, a consolidated "aes-lib"
crypto_cipher algorithm which simply wraps the library is also added.
That's most easily done with it replacing "aes-generic" too, so that is
done too.  (That's another reason for doing (3) at the same time.)

As usual, care is taken to support all the existing arch-optimized code.
This makes it possible for users of the traditional crypto API to switch
to the library API, which is generally much easier to use, without being
concerned about performance regressions.

That being said, this series only deals with the bare (single-block) AES
library.  Future patchsets are expected to build on this work to provide
architecture-optimized library APIs for specific AES modes of operation.

Changed in v2:
- Fix missing MMU protection for aes_enc_tab and aes_dec_tab.
  (Suggested by Qingfang Deng)
- Reduced churn by temporarily making aes_encrypt() and aes_decrypt()
  type-generic macros.  (Suggested by Andrew Cooper)
- Added Ard's Acked-by
- Rebased onto latest libcrypto-next
- A few other very minor tweaks, such as updating the file comment in
  aes-riscv64-glue.c

Eric Biggers (35):
  crypto: powerpc/aes - Rename struct aes_key
  lib/crypto: aes: Introduce improved AES library
  crypto: arm/aes-neonbs - Use AES library for single blocks
  crypto: arm/aes - Switch to aes_enc_tab[] and aes_dec_tab[]
  crypto: arm64/aes - Switch to aes_enc_tab[] and aes_dec_tab[]
  crypto: arm64/aes - Select CRYPTO_LIB_SHA256 from correct places
  crypto: aegis - Switch from crypto_ft_tab[] to aes_enc_tab[]
  crypto: aes - Remove aes-fixed-time / CONFIG_CRYPTO_AES_TI
  crypto: aes - Replace aes-generic with wrapper around lib
  lib/crypto: arm/aes: Migrate optimized code into library
  lib/crypto: arm64/aes: Migrate optimized code into library
  lib/crypto: powerpc/aes: Migrate SPE optimized code into library
  lib/crypto: powerpc/aes: Migrate POWER8 optimized code into library
  lib/crypto: riscv/aes: Migrate optimized code into library
  lib/crypto: s390/aes: Migrate optimized code into library
  lib/crypto: sparc/aes: Migrate optimized code into library
  lib/crypto: x86/aes: Add AES-NI optimization
  crypto: x86/aes - Remove the superseded AES-NI crypto_cipher
  Bluetooth: SMP: Use new AES library API
  chelsio: Use new AES library API
  net: phy: mscc: macsec: Use new AES library API
  staging: rtl8723bs: core: Use new AES library API
  crypto: arm/ghash - Use new AES library API
  crypto: arm64/ghash - Use new AES library API
  crypto: x86/aes-gcm - Use new AES library API
  crypto: ccp - Use new AES library API
  crypto: chelsio - Use new AES library API
  crypto: crypto4xx - Use new AES library API
  crypto: drbg - Use new AES library API
  crypto: inside-secure - Use new AES library API
  crypto: omap - Use new AES library API
  lib/crypto: aescfb: Use new AES library API
  lib/crypto: aesgcm: Use new AES library API
  lib/crypto: aes: Remove old AES en/decryption functions
  lib/crypto: aes: Drop 'volatile' from aes_sbox and aes_inv_sbox

 arch/arm/configs/milbeaut_m10v_defconfig      |    1 -
 arch/arm/configs/multi_v7_defconfig           |    2 +-
 arch/arm/configs/omap2plus_defconfig          |    2 +-
 arch/arm/configs/pxa_defconfig                |    2 +-
 arch/arm/crypto/Kconfig                       |   19 -
 arch/arm/crypto/Makefile                      |    2 -
 arch/arm/crypto/aes-cipher-glue.c             |   69 -
 arch/arm/crypto/aes-cipher.h                  |   13 -
 arch/arm/crypto/aes-neonbs-glue.c             |   29 +-
 arch/arm/crypto/ghash-ce-glue.c               |   14 +-
 arch/arm64/crypto/Kconfig                     |   29 +-
 arch/arm64/crypto/Makefile                    |    6 -
 arch/arm64/crypto/aes-ce-ccm-glue.c           |    2 -
 arch/arm64/crypto/aes-ce-glue.c               |  178 ---
 arch/arm64/crypto/aes-ce-setkey.h             |    6 -
 arch/arm64/crypto/aes-cipher-glue.c           |   63 -
 arch/arm64/crypto/aes-glue.c                  |    2 -
 arch/arm64/crypto/ghash-ce-glue.c             |   27 +-
 arch/m68k/configs/amiga_defconfig             |    1 -
 arch/m68k/configs/apollo_defconfig            |    1 -
 arch/m68k/configs/atari_defconfig             |    1 -
 arch/m68k/configs/bvme6000_defconfig          |    1 -
 arch/m68k/configs/hp300_defconfig             |    1 -
 arch/m68k/configs/mac_defconfig               |    1 -
 arch/m68k/configs/multi_defconfig             |    1 -
 arch/m68k/configs/mvme147_defconfig           |    1 -
 arch/m68k/configs/mvme16x_defconfig           |    1 -
 arch/m68k/configs/q40_defconfig               |    1 -
 arch/m68k/configs/sun3_defconfig              |    1 -
 arch/m68k/configs/sun3x_defconfig             |    1 -
 arch/powerpc/crypto/Kconfig                   |    2 +-
 arch/powerpc/crypto/Makefile                  |    9 +-
 arch/powerpc/crypto/aes-gcm-p10-glue.c        |    4 +-
 arch/powerpc/crypto/aes-spe-glue.c            |   88 +-
 arch/powerpc/crypto/aes.c                     |  134 --
 arch/powerpc/crypto/aes_cbc.c                 |    4 +-
 arch/powerpc/crypto/aes_ctr.c                 |    2 +-
 arch/powerpc/crypto/aes_xts.c                 |    6 +-
 arch/powerpc/crypto/aesp8-ppc.h               |   22 -
 arch/powerpc/crypto/vmx.c                     |   10 +-
 arch/riscv/crypto/Kconfig                     |    2 -
 arch/riscv/crypto/aes-macros.S                |   12 +-
 arch/riscv/crypto/aes-riscv64-glue.c          |   81 +-
 arch/riscv/crypto/aes-riscv64-zvkned.S        |   27 -
 arch/s390/configs/debug_defconfig             |    2 +-
 arch/s390/configs/defconfig                   |    2 +-
 arch/s390/crypto/Kconfig                      |    2 -
 arch/s390/crypto/aes_s390.c                   |  113 --
 arch/sparc/crypto/Kconfig                     |    2 +-
 arch/sparc/crypto/Makefile                    |    2 +-
 arch/sparc/crypto/aes_glue.c                  |  140 +-
 arch/x86/crypto/Kconfig                       |    2 -
 arch/x86/crypto/aes-gcm-aesni-x86_64.S        |   33 +-
 arch/x86/crypto/aes-gcm-vaes-avx2.S           |   21 +-
 arch/x86/crypto/aes-gcm-vaes-avx512.S         |   25 +-
 arch/x86/crypto/aesni-intel_asm.S             |   25 -
 arch/x86/crypto/aesni-intel_glue.c            |  119 +-
 crypto/Kconfig                                |   23 +-
 crypto/Makefile                               |    4 +-
 crypto/aegis.h                                |    2 +-
 crypto/aes.c                                  |   66 +
 crypto/aes_generic.c                          | 1320 -----------------
 crypto/aes_ti.c                               |   83 --
 crypto/crypto_user.c                          |    2 +-
 crypto/df_sp80090a.c                          |   30 +-
 crypto/drbg.c                                 |   12 +-
 crypto/testmgr.c                              |   43 +-
 drivers/char/tpm/tpm2-sessions.c              |   10 +-
 drivers/crypto/amcc/crypto4xx_alg.c           |   10 +-
 drivers/crypto/ccp/ccp-crypto-aes-cmac.c      |    4 +-
 drivers/crypto/chelsio/chcr_algo.c            |   10 +-
 .../crypto/inside-secure/safexcel_cipher.c    |   12 +-
 drivers/crypto/inside-secure/safexcel_hash.c  |   14 +-
 drivers/crypto/omap-aes-gcm.c                 |    6 +-
 drivers/crypto/omap-aes.h                     |    2 +-
 drivers/crypto/starfive/jh7110-aes.c          |   10 +-
 drivers/crypto/xilinx/xilinx-trng.c           |    8 +-
 .../inline_crypto/ch_ipsec/chcr_ipsec.c       |    4 +-
 .../chelsio/inline_crypto/ch_ktls/chcr_ktls.c |    8 +-
 .../chelsio/inline_crypto/chtls/chtls_hw.c    |    4 +-
 drivers/net/phy/mscc/mscc_macsec.c            |    8 +-
 drivers/staging/rtl8723bs/core/rtw_security.c |   20 +-
 include/crypto/aes.h                          |  278 +++-
 include/crypto/df_sp80090a.h                  |    2 +-
 include/crypto/gcm.h                          |    2 +-
 lib/crypto/Kconfig                            |   12 +
 lib/crypto/Makefile                           |   43 +-
 lib/crypto/aes.c                              |  473 ++++--
 lib/crypto/aescfb.c                           |   30 +-
 lib/crypto/aesgcm.c                           |   12 +-
 .../crypto/arm}/aes-cipher-core.S             |    4 +-
 lib/crypto/arm/aes.h                          |   56 +
 .../crypto => lib/crypto/arm64}/aes-ce-core.S |    0
 .../crypto/arm64}/aes-cipher-core.S           |    4 +-
 lib/crypto/arm64/aes.h                        |  164 ++
 lib/crypto/powerpc/.gitignore                 |    2 +
 .../crypto/powerpc}/aes-spe-core.S            |    0
 .../crypto/powerpc}/aes-spe-keys.S            |    0
 .../crypto/powerpc}/aes-spe-modes.S           |    0
 .../crypto/powerpc}/aes-spe-regs.h            |    0
 .../crypto/powerpc}/aes-tab-4k.S              |    0
 lib/crypto/powerpc/aes.h                      |  238 +++
 .../crypto/powerpc}/aesp8-ppc.pl              |    1 +
 lib/crypto/riscv/aes-riscv64-zvkned.S         |   84 ++
 lib/crypto/riscv/aes.h                        |   63 +
 lib/crypto/s390/aes.h                         |  106 ++
 lib/crypto/sparc/aes.h                        |  149 ++
 .../crypto => lib/crypto/sparc}/aes_asm.S     |    0
 lib/crypto/x86/aes-aesni.S                    |  261 ++++
 lib/crypto/x86/aes.h                          |   85 ++
 net/bluetooth/smp.c                           |    8 +-
 111 files changed, 2202 insertions(+), 2959 deletions(-)
 delete mode 100644 arch/arm/crypto/aes-cipher-glue.c
 delete mode 100644 arch/arm/crypto/aes-cipher.h
 delete mode 100644 arch/arm64/crypto/aes-ce-glue.c
 delete mode 100644 arch/arm64/crypto/aes-ce-setkey.h
 delete mode 100644 arch/arm64/crypto/aes-cipher-glue.c
 delete mode 100644 arch/powerpc/crypto/aes.c
 create mode 100644 crypto/aes.c
 delete mode 100644 crypto/aes_generic.c
 delete mode 100644 crypto/aes_ti.c
 rename {arch/arm/crypto => lib/crypto/arm}/aes-cipher-core.S (97%)
 create mode 100644 lib/crypto/arm/aes.h
 rename {arch/arm64/crypto => lib/crypto/arm64}/aes-ce-core.S (100%)
 rename {arch/arm64/crypto => lib/crypto/arm64}/aes-cipher-core.S (96%)
 create mode 100644 lib/crypto/arm64/aes.h
 create mode 100644 lib/crypto/powerpc/.gitignore
 rename {arch/powerpc/crypto => lib/crypto/powerpc}/aes-spe-core.S (100%)
 rename {arch/powerpc/crypto => lib/crypto/powerpc}/aes-spe-keys.S (100%)
 rename {arch/powerpc/crypto => lib/crypto/powerpc}/aes-spe-modes.S (100%)
 rename {arch/powerpc/crypto => lib/crypto/powerpc}/aes-spe-regs.h (100%)
 rename {arch/powerpc/crypto => lib/crypto/powerpc}/aes-tab-4k.S (100%)
 create mode 100644 lib/crypto/powerpc/aes.h
 rename {arch/powerpc/crypto => lib/crypto/powerpc}/aesp8-ppc.pl (99%)
 create mode 100644 lib/crypto/riscv/aes-riscv64-zvkned.S
 create mode 100644 lib/crypto/riscv/aes.h
 create mode 100644 lib/crypto/s390/aes.h
 create mode 100644 lib/crypto/sparc/aes.h
 rename {arch/sparc/crypto => lib/crypto/sparc}/aes_asm.S (100%)
 create mode 100644 lib/crypto/x86/aes-aesni.S
 create mode 100644 lib/crypto/x86/aes.h


base-commit: 959a634ebcda02e0add101024a5793323d66cda5
-- 
2.52.0


