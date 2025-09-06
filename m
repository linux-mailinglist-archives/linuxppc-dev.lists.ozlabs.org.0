Return-Path: <linuxppc-dev+bounces-11832-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A86DFB47780
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Sep 2025 23:37:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cK64C3r8Tz3cYV;
	Sun,  7 Sep 2025 07:36:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757194619;
	cv=none; b=dMewKAcNVYCWNaqKvDM+zNnRinEoAeZ3Sag2newEIoL3MplLzrIoCNM1xbLpcf0IV8TvIjC+Yc9YHYnFkU499mwknNEtnfllfRqqWbfO6r6tUmeXgzg0Y+99a9gfeYIARw3oPqaMeBq4qWe+zHs/t7ur+5k6XO74ilGfEJK6OqvcR0hf0kFl8vgq2EQeVsQWSm6z64oakshOkj2b0VmSbULyBWMMViMsRn6O2a8pkXL4rqNiqwjo2spgVtp/VD6h5Y6u1rG0nhN5+/UMQhzfaaSKYPzx8kI9fbJ3hKQ98DFNMIxP99BVFB4qJVWw/vTh+M93CZA8ndaMushLjHXYaw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757194619; c=relaxed/relaxed;
	bh=tzKuzsdhMKA/kd854LR6kFwx0tzwqw3fTchyWIzO++w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CSiYbwbcnNxd05uymWifKINHIVivP1quATNj6BczCu193qOtGyMlZOR+pX+XWMHqqHzMw82Hu3aUYL9KH4ekYUXEQdo5EgLAOHltzMpJ5DZzkOGDtzfZJlKJqs7v585lSvzviIbkhJFDgrjiDPNo329j2yA//Rp793zIyn2JxVEND8bkQh6+S5k6dkgWYkpDheDfbLX0hzWkcHSZ3WxTZkephx8fqx5J/dosJ9hNjE6BLGJc4eSQkSsyU5CrL0ns4rFrF8RB3G8r9ZgdnEyU7H6SHqLYAdWGXZR5Kx0U+0A8x8EwoBlGHvLIf1uTcE9v/X4Gz8PNJioTp42H4cut6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C0gaTjHY; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C0gaTjHY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cK64B3DQDz3cYN
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Sep 2025 07:36:58 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 666B0436AD;
	Sat,  6 Sep 2025 21:36:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 763D5C4CEE7;
	Sat,  6 Sep 2025 21:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757194616;
	bh=IesAjkCYOGpflP2789SjEF/QyWGCcvo1W1xkNCqpIB4=;
	h=From:To:Cc:Subject:Date:From;
	b=C0gaTjHYH0JBqqIGhTuB0tR5U5fZpfgEQeXd0gD9RnbIC89y7hF85+QF9EWH5PphP
	 nVrC2w0jeMdNVHq5OqCCHlgYFUk3fHP1vQvqjoVXhJTjabgBMVPQEpQBZnLrHLG2Nj
	 pkGB0piOP1wo7OBhrrFQfA2FotmlCNQkuYb9SwvYeJRM72w4E0anatDeebM+Uw2T7q
	 Wvqf0F7vw/JPHgNnGjaB4BoWOxsLu+U1d/YyeF7QJ5BZ+KMpohdgdjzFyyJ8abvuo2
	 opDCZACNXQ2+PGZ8K9pJmstb9/sDkgRdOUxClGdg+tLpmRNUWt5hU/We/3YecB0jYB
	 QafJKoBplsIzA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Zhiqi Song <songzhiqi1@huawei.com>,
	Longfang Liu <liulongfang@huawei.com>,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 00/12] Curve25519 cleanup
Date: Sat,  6 Sep 2025 14:35:11 -0700
Message-ID: <20250906213523.84915-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This series is targeting libcrypto-next.  It can also be retrieved from:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git curve25519-v2

This series removes the unused crypto_kpp support for Curve25519,
migrates curve25519-selftest to a KUnit test suite, and reorganizes the
generic and arch-optimized Curve25519 code to all be located in
lib/crypto/ and built into a single libcurve25519 module.

Changed from v1:
- Split kpp removal into multiple patches
- Don't select CRYPTO_LIB_CURVE25519_GENERIC from KUnit test
- Removed unnecessary parameter from hpre_ecc_clear_ctx()
- Removed unnecessary 'return' from arm curve25519_base_arch()
- Updated file comment in lib/crypto/curve25519.c
- Made kconfig help text for KUnit test more consistent with other tests
- Used initializer in test_curve25519()
- Removed unnecessary newlines from messages in test_curve25519()
- Use NSEC_PER_SEC instead of literal 1000000000
- Added an Acked-by

Eric Biggers (12):
  crypto: hisilicon/hpre - Remove unused curve25519 kpp support
  crypto: arm/curve25519 - Remove unused kpp support
  crypto: powerpc/curve25519 - Remove unused kpp support
  crypto: x86/curve25519 - Remove unused kpp support
  crypto: testmgr - Remove curve25519 kpp tests
  crypto: curve25519 - Remove unused kpp support
  lib/crypto: tests: Migrate Curve25519 self-test to KUnit
  lib/crypto: tests: Add Curve25519 benchmark
  lib/crypto: curve25519: Move a couple functions out-of-line
  lib/crypto: curve25519: Consolidate into single module
  lib/crypto: tests: Enable Curve25519 test when CRYPTO_SELFTESTS
  wireguard: kconfig: Simplify crypto kconfig selections

 arch/arm/crypto/Kconfig                       |   13 -
 arch/arm/crypto/Makefile                      |    2 -
 arch/arm/crypto/curve25519-glue.c             |  137 --
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
 arch/powerpc/crypto/Kconfig                   |   13 -
 arch/powerpc/crypto/Makefile                  |    2 -
 arch/s390/configs/debug_defconfig             |    1 -
 arch/s390/configs/defconfig                   |    1 -
 arch/x86/crypto/Kconfig                       |   13 -
 arch/x86/crypto/Makefile                      |    5 -
 crypto/Kconfig                                |    8 -
 crypto/Makefile                               |    1 -
 crypto/curve25519-generic.c                   |   91 --
 crypto/testmgr.c                              |    6 -
 crypto/testmgr.h                              | 1225 -----------------
 drivers/crypto/hisilicon/Kconfig              |    1 -
 drivers/crypto/hisilicon/hpre/hpre_crypto.c   |  403 +-----
 drivers/net/Kconfig                           |   15 +-
 include/crypto/curve25519.h                   |   40 +-
 lib/crypto/Kconfig                            |   37 +-
 lib/crypto/Makefile                           |   27 +-
 .../crypto/arm}/curve25519-core.S             |    0
 lib/crypto/arm/curve25519.h                   |   47 +
 lib/crypto/curve25519-generic.c               |   25 -
 lib/crypto/curve25519.c                       |   69 +-
 .../crypto/powerpc}/curve25519-ppc64le_asm.S  |    0
 .../crypto/powerpc/curve25519.h               |  124 +-
 lib/crypto/tests/Kconfig                      |    9 +
 lib/crypto/tests/Makefile                     |    1 +
 .../curve25519_kunit.c}                       |   99 +-
 .../crypto/x86/curve25519.h                   |  127 +-
 42 files changed, 236 insertions(+), 2318 deletions(-)
 delete mode 100644 arch/arm/crypto/curve25519-glue.c
 delete mode 100644 crypto/curve25519-generic.c
 rename {arch/arm/crypto => lib/crypto/arm}/curve25519-core.S (100%)
 create mode 100644 lib/crypto/arm/curve25519.h
 delete mode 100644 lib/crypto/curve25519-generic.c
 rename {arch/powerpc/crypto => lib/crypto/powerpc}/curve25519-ppc64le_asm.S (100%)
 rename arch/powerpc/crypto/curve25519-ppc64le-core.c => lib/crypto/powerpc/curve25519.h (56%)
 rename lib/crypto/{curve25519-selftest.c => tests/curve25519_kunit.c} (96%)
 rename arch/x86/crypto/curve25519-x86_64.c => lib/crypto/x86/curve25519.h (94%)


base-commit: 362f92286065d9f8282da5def89e173a12191568
-- 
2.50.1


