Return-Path: <linuxppc-dev+bounces-10536-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D3EB19533
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Aug 2025 22:45:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwBXb18J4z2xgp;
	Mon,  4 Aug 2025 06:45:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754253935;
	cv=none; b=Sy3eImJPTWXwtUdCJ1U5pQ67PyGvCIhlOeS5sXaNPSFMV9I2cYLa8/f6XmEsgYz9G20OI4NIVksVEVPHuGrRLi/kdwvu5AwLx9SUJn6BnVNdDIBGNIQSwQP1abluOYrz1kXyctVDm46TA8slrmGlwWpQNsggUNAu3Bd/4jDyl59OJKr3A3COm3NlrAmUIMpdGF4dhyfuQFIYB1TzI6lhCy5hboHSaya923h/9rM4YBuLcePCaxUx5UlD0vCgk4e+OnCrxU+ydz/QrDNYC4OYdmx5C8+mipWmPaBk7NfHJcmCDD8d62vyMyC3DojYwLZfVdMnw3UtcbqVCyy22BCK+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754253935; c=relaxed/relaxed;
	bh=PZYk44aTgpZax9kpcH9dOmqktQCDzDmeHd3GYiP/TNI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lqlPzy5QY+QXdiLT6Kb6NvAg07wi3fxko8xhbmbyPWt+54lOkd279ABd76g2LdRQE9vHNpuyCqZBFf20yijPK83KSKZ3Zoj5zaVivhmPxF/iQ2+vCYNJFVaAgwA0nA1EYJW/ZZHvB7E7F342JQfI7OmaO9AzSRW7WiGIpC+7IFy0Dy2aFvlEj6wTg6dBuz4K2PPmRTsOo2DYPykZXHaGfvtgqZNeD0BXELhIrgFkUhnQFH0BEfP9D+/WsmdGOl4rUDCZlaSVYivoBPBAGElu5iIj0q2oLK96AsnqOEXwmHYSkaiqkvOVUNcFJOxJMx2DRaeJ1xJoD5eFk0LXQkEmcg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EWoNC4zj; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EWoNC4zj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwBXY51Qsz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 06:45:33 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 80405A52D6F;
	Sun,  3 Aug 2025 20:45:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AE1EC4CEEB;
	Sun,  3 Aug 2025 20:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754253929;
	bh=fIsnggQ9bSogOYsC/oCooZJEKpFlIjgSJ+O2mM0ik/g=;
	h=From:To:Cc:Subject:Date:From;
	b=EWoNC4zj60IkF748py5lD143qrk8WMoOpmcQeQ+NC5PoeQKL1jJgTiyyteh1M5MC8
	 wJP/9/XZnmxbN+qq/oM/Wj7x4a/abxCh+2BVJ9o0n00s80/plMl1wskCZLsiaiV8ns
	 qjc4p9Xg+1Pet7M1z7PhtLPl1cKyB0aL67v35awvlDuhmwNVoivOT1fSrmF8bl5lfv
	 2rytBpIDtMTon6+n+XvB9kUJZkWk8tgr+W/D4pVPKzXHmMAJVHU84etSXr0T9oEdF0
	 cS9P1E0SO+IKSzuujuWHHIftTgkZ+FvAwEn/tI6CZuNW59BGG/XWXa+sydGqZns+Qu
	 m9hMGJf1qFtSQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 0/7] MD5 library functions
Date: Sun,  3 Aug 2025 13:44:26 -0700
Message-ID: <20250803204433.75703-1-ebiggers@kernel.org>
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

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git md5-lib-v1

Patches 1-4 remove the MD5 implementations for mips, powerpc, and sparc.
These were the only architecture-optimized MD5 implementations and are
not worth keeping around.

Patches 5-7 introduce a library API for MD5 and HMAC-MD5 and reimplement
the crypto_shash "md5" and "hmac(md5)" on top of it.

The library API will also be usable directly by various in-kernel users
that are stuck with MD5 due to having to implement legacy protocols.

This should again look quite boring and familiar, as it mirrors the
SHA-1 and SHA-2 changes closely.  The MD5 changes are quite a bit
simpler, though, since we'll only be supporting the generic C MD5 code.
Of course there's also only one variant of MD5, unlike e.g. SHA-2.

Eric Biggers (7):
  mips: cavium-octeon: Remove Octeon optimized MD5 code
  mips: cavium-octeon: Move octeon-crypto.c into parent dir
  crypto: powerpc/md5 - Remove PowerPC optimized MD5 code
  crypto: sparc/md5 - Remove SPARC64 optimized MD5 code
  lib/crypto: md5: Add MD5 and HMAC-MD5 library functions
  crypto: md5 - Wrap library and add HMAC support
  lib/crypto: tests: Add KUnit tests for MD5 and HMAC-MD5

 arch/mips/cavium-octeon/Makefile              |   2 +-
 arch/mips/cavium-octeon/crypto/Makefile       |   8 -
 arch/mips/cavium-octeon/crypto/octeon-md5.c   | 214 -----------
 .../{crypto => }/octeon-crypto.c              |   0
 arch/mips/configs/cavium_octeon_defconfig     |   1 -
 arch/mips/crypto/Kconfig                      |  10 -
 arch/mips/include/asm/octeon/crypto.h         |  21 +-
 arch/powerpc/configs/powernv_defconfig        |   1 -
 arch/powerpc/configs/ppc64_defconfig          |   1 -
 arch/powerpc/crypto/Kconfig                   |   8 -
 arch/powerpc/crypto/Makefile                  |   2 -
 arch/powerpc/crypto/md5-asm.S                 | 235 ------------
 arch/powerpc/crypto/md5-glue.c                |  99 -----
 arch/sparc/crypto/Kconfig                     |  10 -
 arch/sparc/crypto/Makefile                    |   4 -
 arch/sparc/crypto/md5_asm.S                   |  70 ----
 arch/sparc/crypto/md5_glue.c                  | 174 ---------
 crypto/Kconfig                                |   2 +-
 crypto/md5.c                                  | 359 ++++++++----------
 crypto/testmgr.c                              |   3 +
 drivers/crypto/img-hash.c                     |   2 +-
 include/crypto/md5.h                          | 181 ++++++++-
 lib/crypto/Kconfig                            |   6 +
 lib/crypto/Makefile                           |   3 +
 lib/crypto/md5.c                              | 290 ++++++++++++++
 lib/crypto/tests/Kconfig                      |  10 +
 lib/crypto/tests/Makefile                     |   1 +
 lib/crypto/tests/md5-testvecs.h               | 186 +++++++++
 lib/crypto/tests/md5_kunit.c                  |  39 ++
 29 files changed, 891 insertions(+), 1051 deletions(-)
 delete mode 100644 arch/mips/cavium-octeon/crypto/Makefile
 delete mode 100644 arch/mips/cavium-octeon/crypto/octeon-md5.c
 rename arch/mips/cavium-octeon/{crypto => }/octeon-crypto.c (100%)
 delete mode 100644 arch/powerpc/crypto/md5-asm.S
 delete mode 100644 arch/powerpc/crypto/md5-glue.c
 delete mode 100644 arch/sparc/crypto/md5_asm.S
 delete mode 100644 arch/sparc/crypto/md5_glue.c
 create mode 100644 lib/crypto/md5.c
 create mode 100644 lib/crypto/tests/md5-testvecs.h
 create mode 100644 lib/crypto/tests/md5_kunit.c


base-commit: 186f3edfdd41f2ae87fc40a9ccba52a3bf930994
-- 
2.50.1


