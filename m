Return-Path: <linuxppc-dev+bounces-11593-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30397B3EF5D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Sep 2025 22:20:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cG0bn5R4lz3057;
	Tue,  2 Sep 2025 06:20:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756758005;
	cv=none; b=Izh7CoXwA4UOt3DNRn3bjALL/LG0I5Stg14TcblrftQRs24+nnS6YSqS4jtH9ywXCURzmXbkwHHF3ropBpz3PuynGIohMG0wm6hNxjghSXMP52+WdsEo1dqvlTBTp0HyLi64vkWwszuFdm24pH09yNmKpPlQYZXN5I7cmK/K3z/vbtR0jsiGia45t1+gmoxWZhOCoAPtdjEJSHfZOt4SVEHCH5ZaVQ4E6RsPS0c8qQ8ji4ET5E/uMnkJ+uXrs1Lu7VVXS/bLXVzzSZLIoS0NpCqx+5K3gAXd+SoJPBn/6Y7Hzn0z7QCvwxhEUUaFC+vkJLykDVLv4kFnUjbLUXURqg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756758005; c=relaxed/relaxed;
	bh=YDDudy93Qt6NRe3X6MCDF5AVld8isjkmSup5quV1GdU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kgYezTY3OXHGcmzL/YRIXjnZMcdRvH4toy9naSfVqG8J/HyIWfcMzGhs8Uj5ch/0aR61W/WiaDoYZIxqDnC2jDvlZWzZy83yp1jkPJoUdjI6gxyaN02slNBJ6InQfdL0jUdSBEOBeE+PwsHFvpBwzw5N2jMP5HScqsOaa56yjASyPqi7NBf/FSpC9SHJqtgRrUzdA5mzxxkwdf0l7oNIIIP9DC3ufIvE1j80IoEX56d11lohk5guIg69dWs8OBd1Xdtv5e8zEbjjFT+tR5y5Z7ZkvSMIiTF18mEDQChEfpnIfTdOR+dti4nR59No9s8sEso7ENV82NFpNrRD5eWDdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AIzhIB/C; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AIzhIB/C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cG0bm72GMz3055
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Sep 2025 06:20:04 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A6412448D3;
	Mon,  1 Sep 2025 20:20:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A09FC4CEF0;
	Mon,  1 Sep 2025 20:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756758002;
	bh=LoGorSDHkEkIDGpixgk16+eL3mYFxlvutZWyJcKrM/I=;
	h=From:To:Cc:Subject:Date:From;
	b=AIzhIB/CNTd0wQFTtQjTvf7CsPNPwGEkwECUVhQOAz+FgHxLrCvXjjQTQKSXXcMB7
	 HAFQwwyPtBlLZgivyflOdd+HxDbrXS1bYj7HuhR75Pf4piROorXcT+eMYY0cGTaJXz
	 jU20iRaetmGGLVL8ixBenxqd0DXxsVtgTe/XywK8pjUdRtp0wwsnSycmifhMWTHm3m
	 gMlqHexiPwAgKPX9uoJRLLtRAbl0TN0vofhHgWAlyV87Rxl7Aokfuo2luCm5+fDzeU
	 +NKtrOtCxyJd8LDrfZgg29Sxa9hqhUvlHTqooqlRV/VGc/rVqx0DbKF+ABC2/PoCyb
	 QZDoRWJ6VDFvA==
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
Subject: [PATCH 0/6] Curve25519 cleanup
Date: Mon,  1 Sep 2025 13:18:09 -0700
Message-ID: <20250901201815.594177-1-ebiggers@kernel.org>
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

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git curve25519-v1

This series removes the unused crypto_kpp support for Curve25519,
migrates curve25519-selftest to a KUnit test suite, and reorganizes the
generic and arch-optimized Curve25519 code to all be located in
lib/crypto/ and built into a single libcurve25519 module.

Eric Biggers (6):
  crypto: curve25519 - Remove kpp support
  lib/crypto: tests: Migrate Curve25519 self-test to KUnit
  lib/crypto: tests: Add Curve25519 benchmark
  lib/crypto: curve25519: Move a couple functions out-of-line
  lib/crypto: curve25519: Consolidate into single module
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
 drivers/crypto/hisilicon/hpre/hpre_crypto.c   |  394 ------
 drivers/net/Kconfig                           |   15 +-
 include/crypto/curve25519.h                   |   40 +-
 lib/crypto/Kconfig                            |   37 +-
 lib/crypto/Makefile                           |   27 +-
 .../crypto/arm}/curve25519-core.S             |    0
 lib/crypto/arm/curve25519.h                   |   47 +
 lib/crypto/curve25519-generic.c               |   25 -
 lib/crypto/curve25519.c                       |   64 +-
 .../crypto/powerpc}/curve25519-ppc64le_asm.S  |    0
 .../crypto/powerpc/curve25519.h               |  124 +-
 lib/crypto/tests/Kconfig                      |   10 +
 lib/crypto/tests/Makefile                     |    1 +
 .../curve25519_kunit.c}                       |  100 +-
 .../crypto/x86/curve25519.h                   |  127 +-
 42 files changed, 232 insertions(+), 2310 deletions(-)
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


