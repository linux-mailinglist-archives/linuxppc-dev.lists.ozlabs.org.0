Return-Path: <linuxppc-dev+bounces-3650-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DC59DF861
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2024 02:21:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y1mG54trMz2yXf;
	Mon,  2 Dec 2024 12:21:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733102493;
	cv=none; b=QdMRKaBop5beTh8voSMKyTl8ht1sNVwUjaRqGd3JHxVJUInzeuVd2Ad0Qq6urZEdAGql/xr/XU1rsXfct0ecDQUV83aifcKXf59HvpSt1y+dx4kj4TrMkXfy3Bxx0mCYZ1GViqKbZ2Ax66eEhVgPRiKmMwehh0viF7IeDwxzwk6NyzgAviuluuiEj+OH2zR8qj82ygrOEqg/GVIbX9C2QOb00zuvMUXCOMQGy5FnPZhKb6KkYfj51nQOOJiqd9Y2Ks4xVY3nVoyIqq/pg30YrG4/M4Hs5br+qtEeach+cN0DKanCtpAt5cs7yVFiLpaJY4AkPBl2mDNqYZQU4MI0vg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733102493; c=relaxed/relaxed;
	bh=JrZ+QUjRT4pqTOQJiT5ETJDWl3aPgmGybRdGwewC27M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vl++ap0MHywrLY8K8d0KrabZYKAJnc/b88QMakVZP3oRv9u6mxjjuSKtjvOxcgBUn0xarny5niq1f0Gy/mY/lFGlw0M5mxz6D7V+uKWREn5g7plVgiY7MyFaS2HsIeHTtZZUZ5YnoxR9H+wEZTOUljrWyColFK+PZgRaRwgZLMGfRrK4vuXLicekH5m1qKB1E1++b9iUKVus5R2PwB/P4QFkvjdOPG6y8VzM9Uw9R032sfrHNpgDQb08dkUfPAmxK2VroEFZmD/YMWjbxOsdbZWjlK5oKyrNFfHp0p4lpAK1E5ReydhcRvGqyHDVlsha0GtMxqIAUlO0oX58/j38Bg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nh+Asw+Z; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nh+Asw+Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y1mG32JvVz2yTs
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2024 12:21:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 739E2A409EC;
	Mon,  2 Dec 2024 01:19:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC63C4CECF;
	Mon,  2 Dec 2024 01:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733102488;
	bh=/7wxVzZwNcofbQOcXCfiHDj5ZWUNwfZ+aktniqfssqM=;
	h=From:To:Cc:Subject:Date:From;
	b=nh+Asw+ZZIteP03MdjDFm7cHrGNz+KxSlP178lnD9ZkMBRp6xMjw0ipr1Pou8AZMW
	 TvF2uuyV5O04PS/6BFann3nVTw7pZ7Qnr0FnOUtMT5kKlW3/WO5GPEm9vrKzluPVyS
	 jY5UuixHlURAjORTl39jgQ35uwmYOAdefS0uwcKYI40i9oxfmJL6VKw0dFF50ZwNQO
	 IjEg5EFbuqqen4fqa597LxXrFCmxL7o2429IKxQsmnBRrpHuV9r+VUryFkuq7TOcob
	 fdlTe0gH+XDl8RO0LfEwNQcRLNbilF8fGRwnPXWYn2ng8yi6yJJaImrzdqaQwH0MZM
	 OlfXx067f7ezQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	Zhihang Shao <zhihang.shao.iscas@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v2 00/12] Wire up CRC-T10DIF library functions to arch-optimized code
Date: Sun,  1 Dec 2024 17:20:44 -0800
Message-ID: <20241202012056.209768-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.1
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
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This patchset is also available in git via:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc-t10dif-lib-v2

This patchset updates the kernel's CRC-T10DIF library functions to be
directly optimized for x86, arm, arm64, and powerpc without taking an
unnecessary and inefficient detour through the crypto API.  It follows
the same approach that I'm taking for CRC32 in the patchset
https://lore.kernel.org/lkml/20241202010844.144356-1-ebiggers@kernel.org/

This patchset also adds a CRC KUnit test suite that covers multiple CRC
variants, and deletes some older ad-hoc tests that are obsoleted by it.

This patchset applies to v6.13-rc1 plus my CRC32 patchset.  It can be
retrieved from git using above command.  This is targeting 6.14.

Changed in v2:
  - Rebased onto v6.13-rc1.
  - Tweaked crc_t10dif_arch() for arm32 and arm64 to not call
    crypto_simd_usable() more times than is necessary.
  - Added patch removing redundant crc16_kunit.c which got added in v6.13-rc1.
  - Made some small tweaks to crc_kunit.c.
  - Listed Ard as a reviewer in the MAINTAINERS entry.
  - Dropped scripts/crc from MAINTAINERS entry, as it hasn't been added yet.
  - Clarified a commit message.
  - Added Reviewed-by and Acked-by's.

Eric Biggers (12):
  lib/crc-t10dif: stop wrapping the crypto API
  lib/crc-t10dif: add support for arch overrides
  crypto: crct10dif - expose arch-optimized lib function
  x86/crc-t10dif: expose CRC-T10DIF function through lib
  arm/crc-t10dif: expose CRC-T10DIF function through lib
  arm64/crc-t10dif: expose CRC-T10DIF function through lib
  powerpc/crc-t10dif: expose CRC-T10DIF function through lib
  lib/crc_kunit.c: add KUnit test suite for CRC library functions
  lib/crc16_kunit: delete obsolete crc16_kunit.c
  lib/crc32test: delete obsolete crc32test.c
  powerpc/crc: delete obsolete crc-vpmsum_test.c
  MAINTAINERS: add entry for CRC library

 MAINTAINERS                                   |  11 +
 arch/arm/Kconfig                              |   1 +
 arch/arm/crypto/Kconfig                       |  11 -
 arch/arm/crypto/Makefile                      |   2 -
 arch/arm/crypto/crct10dif-ce-glue.c           | 124 ---
 arch/arm/lib/Makefile                         |   3 +
 .../crc-t10dif-core.S}                        |   0
 arch/arm/lib/crc-t10dif-glue.c                |  80 ++
 arch/arm64/Kconfig                            |   1 +
 arch/arm64/configs/defconfig                  |   1 -
 arch/arm64/crypto/Kconfig                     |  10 -
 arch/arm64/crypto/Makefile                    |   3 -
 arch/arm64/crypto/crct10dif-ce-glue.c         | 132 ---
 arch/arm64/lib/Makefile                       |   3 +
 .../crc-t10dif-core.S}                        |   0
 arch/arm64/lib/crc-t10dif-glue.c              |  81 ++
 arch/m68k/configs/amiga_defconfig             |   1 -
 arch/m68k/configs/apollo_defconfig            |   1 -
 arch/m68k/configs/atari_defconfig             |   1 -
 arch/m68k/configs/bvme6000_defconfig          |   1 -
 arch/m68k/configs/hp300_defconfig             |   1 -
 arch/m68k/configs/mac_defconfig               |   1 -
 arch/m68k/configs/multi_defconfig             |   1 -
 arch/m68k/configs/mvme147_defconfig           |   1 -
 arch/m68k/configs/mvme16x_defconfig           |   1 -
 arch/m68k/configs/q40_defconfig               |   1 -
 arch/m68k/configs/sun3_defconfig              |   1 -
 arch/m68k/configs/sun3x_defconfig             |   1 -
 arch/powerpc/Kconfig                          |   1 +
 arch/powerpc/configs/powernv_defconfig        |   1 -
 arch/powerpc/configs/ppc64_defconfig          |   2 -
 arch/powerpc/crypto/Kconfig                   |  20 -
 arch/powerpc/crypto/Makefile                  |   3 -
 arch/powerpc/crypto/crc-vpmsum_test.c         | 133 ---
 arch/powerpc/lib/Makefile                     |   3 +
 .../crc-t10dif-glue.c}                        |  69 +-
 .../{crypto => lib}/crct10dif-vpmsum_asm.S    |   2 +-
 arch/s390/configs/debug_defconfig             |   1 -
 arch/x86/Kconfig                              |   1 +
 arch/x86/crypto/Kconfig                       |  10 -
 arch/x86/crypto/Makefile                      |   3 -
 arch/x86/crypto/crct10dif-pclmul_glue.c       | 143 ---
 arch/x86/lib/Makefile                         |   3 +
 arch/x86/lib/crc-t10dif-glue.c                |  51 ++
 .../{crypto => lib}/crct10dif-pcl-asm_64.S    |   0
 crypto/Kconfig                                |   1 +
 crypto/Makefile                               |   3 +-
 crypto/crct10dif_common.c                     |  82 --
 crypto/crct10dif_generic.c                    |  82 +-
 include/linux/crc-t10dif.h                    |  28 +-
 lib/Kconfig                                   |  43 +-
 lib/Kconfig.debug                             |  29 +-
 lib/Makefile                                  |   3 +-
 lib/crc-t10dif.c                              | 156 +---
 lib/crc16_kunit.c                             | 155 ----
 lib/crc32test.c                               | 852 ------------------
 lib/crc_kunit.c                               | 435 +++++++++
 .../testing/selftests/arm64/fp/kernel-test.c  |   3 +-
 58 files changed, 880 insertions(+), 1913 deletions(-)
 delete mode 100644 arch/arm/crypto/crct10dif-ce-glue.c
 rename arch/arm/{crypto/crct10dif-ce-core.S => lib/crc-t10dif-core.S} (100%)
 create mode 100644 arch/arm/lib/crc-t10dif-glue.c
 delete mode 100644 arch/arm64/crypto/crct10dif-ce-glue.c
 rename arch/arm64/{crypto/crct10dif-ce-core.S => lib/crc-t10dif-core.S} (100%)
 create mode 100644 arch/arm64/lib/crc-t10dif-glue.c
 delete mode 100644 arch/powerpc/crypto/crc-vpmsum_test.c
 rename arch/powerpc/{crypto/crct10dif-vpmsum_glue.c => lib/crc-t10dif-glue.c} (50%)
 rename arch/powerpc/{crypto => lib}/crct10dif-vpmsum_asm.S (99%)
 delete mode 100644 arch/x86/crypto/crct10dif-pclmul_glue.c
 create mode 100644 arch/x86/lib/crc-t10dif-glue.c
 rename arch/x86/{crypto => lib}/crct10dif-pcl-asm_64.S (100%)
 delete mode 100644 crypto/crct10dif_common.c
 delete mode 100644 lib/crc16_kunit.c
 delete mode 100644 lib/crc32test.c
 create mode 100644 lib/crc_kunit.c


base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
prerequisite-patch-id: f8b995a05288ddc7f06f93d5eb7ffc71f53232d4
prerequisite-patch-id: cda9f22081116d690534a921473af93d06ab7539
prerequisite-patch-id: 12e0b107ed65a4d61fe3c9aa29451b082276f84f
prerequisite-patch-id: 292ec37c4a28e33cce4c13ad75a3ad2104799352
prerequisite-patch-id: b1cf6138d2a225dcda1adedc89d20d36a54bb309
prerequisite-patch-id: 1a7519c0d1fc64926480c8be838a98b5095534ec
prerequisite-patch-id: 0f22f1d50b6c17c93825e4a0651d51f4de9efe47
prerequisite-patch-id: 285ac22e7e2bad4920c3872992aa45e7f04d3702
prerequisite-patch-id: 9b085b26ff8fe55cf7cd343e9123e742f82a1fbb
prerequisite-patch-id: a4e94f9bb7c2c1d4d5486877b660ca6d606a46ef
prerequisite-patch-id: 5d541cd572220aa5c1885a639693fc78210c6112
prerequisite-patch-id: 95195b4e2e9d9e0e7b1cafa37d0cf2b3373f007f
prerequisite-patch-id: da2e5649997b6265ef0e6ad90b8be6a7a1509705
prerequisite-patch-id: e4b967a2d11e31bb8ee1402313bc0c70b34af26b
prerequisite-patch-id: d535ea87c7ac3b194abc358567b97b5fd524c144
prerequisite-patch-id: 1b919d5298106e9014f09f6e9ca5c75cbb157399
prerequisite-patch-id: 19f12966c5081d27bc64bced052814b15f16b087
prerequisite-patch-id: a4251f6e980b8ac54aeb6cfb09f0ffe92396331d
prerequisite-patch-id: 6fad2aeaf54145934d2dfd52bed0464b18445fb5
-- 
2.47.1


