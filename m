Return-Path: <linuxppc-dev+bounces-7460-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81338A7CB41
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Apr 2025 20:31:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZVPDf4g1nz2yqT;
	Sun,  6 Apr 2025 04:30:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743877858;
	cv=none; b=iNikiHnSvgHVG6KV0LbqfyF5X5YWLqepygDkS8dJEBj/71jiDXzUGxxZOBe/9FPbt2eziCxqZ+FpDybK/ZcSHa6P8I55CrtJJ/NtcZlAzt42q07V2cVKZ477Hy9paFsmdew0vPpJYYnnYz/5vCo+ZfYRMnzn0csQZY3WUsH6vpMXU4sddG/TcOv0rnCgWS2WXD0RmwJfZhWmi2k/g1f0zgzmZSul6kCsTp3C47m/S8Z9ql59pLiS7VNOqW3GtIBPJVXcqzzbHezsbV2hwejX8ynBg4/kP/ZdNXELDwScRbi2GYhd/QHJM/m+5mY0O1iIC5Yih8+KhTgMF1YJdvZFdw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743877858; c=relaxed/relaxed;
	bh=opnZfCZ0neXJH9H/qFRNtMe7ebtD0rAGv16WYa1Q+Fo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WfxGEgseaFq9Ej5YU9333xL8/2Vo3D2GUMPpOvx9778W+cLop8ltm7tFRlHrQ7H89PLPlkGUbrwmIpWaXvs2lWKF456pOHCC7LBSYcEVbMRO72Sx9oc715GL0aLbxXzqDzfqu9cXUZjfirjwc362bWFaRcjzkPMNjq2wiG33icSYW8EsWg6kAfjCvY0x8zhqZJVivbc09eyNWNxkEHaSYVhjRaoHPz92HbqfLctnhemX8RD12Iw8rERKrh6XrOVEfDyOUKEr1M6/D8Fo7wmLV8aJ88M/VtukPyb5lQzUxQDMMpMTHpqUa0+AqVoFGFhXh/poZdqfLe+jjRO+O5MbBw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZADTKA2X; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZADTKA2X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZVPDd1lSQz2ygn
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Apr 2025 04:30:56 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 073235C4A31;
	Sat,  5 Apr 2025 18:28:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 571E2C4CEE4;
	Sat,  5 Apr 2025 18:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743877852;
	bh=NUeI4U0WXhSt3zBtNRQTMMK3/MdfX1g2dDF6Z2qmcBk=;
	h=From:To:Cc:Subject:Date:From;
	b=ZADTKA2XpWmUoC1UvEdiBW5vfd7VpA7EcazTAeFqV6IYRAcTwJj32Vg1Wq5fCGLgs
	 7JyOAjRuSsqqgqYWs71EQVJOb9Z2n5pA17nrPeJlhMKCA/eAK9NXkFZR3p91Y8caSt
	 jinR8neVOTsIM05C1MclF0w8iWixTieJ05Msm7l1WKlKmf9VdzyhgwbvbhsJ497vsg
	 XywIxp8b7zKgwiB5AvFpxMRMingbmpZEm6NwEgL/uIHCSdA3oOaTUTX2dXfFwk4hjZ
	 yqf7tRidgJduOJ/eghplQ3/3xFBzLYQ40Eu7Y4R9D9qCW1JAc/ukkE3kpFwTEyuN6k
	 35/hTz+afw7oA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 0/9] Remove per-architecture ChaCha skcipher glue code
Date: Sat,  5 Apr 2025 11:26:00 -0700
Message-ID: <20250405182609.404216-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Currently each architecture exposes ChaCha not only through the library
API, but also through the crypto_skcipher API.  That requires each
architecture to implement essentially the same skcipher glue code.

Following the example of what's been done for crc32 and crc32c,
eliminate this redundancy by making crypto/chacha.c register both the
generic and architecture-optimized skcipher algorithms, implemented on
top of the appropriate library functions.  This removes almost 800 lines
of code and disentangles the library code from the skcipher API.

From what I remember, the following are the reasons why it wasn't just
done this way originally.  But none of these really hold water:

- The skcipher code was there first, so it may have seemed more natural
  to add onto it rather than replace it.

- Architectures could register multiple skcipher algorithms using
  different CPU features and have them all be tested in a single boot.
  This was convenient in theory, but it never really worked properly.
  It didn't apply to the library code, the x86 ChaCha code wasn't
  actually doing this (it used static keys instead), and this cannot
  catch bugs like accidentally using an AVX instruction in SSE code.
  Instead, a correct solution, which also doesn't require any special
  kernel support, is to just boot the kernel in QEMU using different
  -cpu arguments as needed to test all the code.

- There was a concern about changing cra_driver_names potentially
  breaking users.  But in practice users rely on cra_name, not
  cra_driver_name.  We already change, add, and remove cra_driver_names
  occasionally for various reasons.  And even if someone was relying on
  a specific cra_driver_name, there are some more lightweight
  compatibility tricks that could be used.

- There was a desire for users to be able to override the kernel's
  choice of ChaCha implementation by blacklisting the arch-optimized
  ChaCha module.  But that already became mostly impossible when the
  library functions were added to the same module.  And in practice
  users don't do this anyway.  Even if, hypothetically, someone really
  needed to do this and for some reason the kernel couldn't be fixed to
  make the right choice in their case automatically, there are other
  ways this could be implemented such as a module parameter.

Eric Biggers (9):
  crypto: riscv/chacha - implement library instead of skcipher
  crypto: chacha - centralize the skcipher wrappers for arch code
  crypto: arm/chacha - remove the redundant skcipher algorithms
  crypto: arm64/chacha - remove the skcipher algorithms
  crypto: mips/chacha - remove the skcipher algorithms
  crypto: powerpc/chacha - remove the skcipher algorithms
  crypto: s390/chacha - remove the skcipher algorithms
  crypto: x86/chacha - remove the skcipher algorithms
  crypto: chacha - remove <crypto/internal/chacha.h>

 arch/arm/crypto/Kconfig                 |   7 -
 arch/arm/crypto/chacha-glue.c           | 243 +---------------------
 arch/arm/crypto/chacha-neon-core.S      |   2 +-
 arch/arm64/crypto/Kconfig               |   7 -
 arch/arm64/crypto/chacha-neon-core.S    |   2 +-
 arch/arm64/crypto/chacha-neon-glue.c    | 146 +------------
 arch/mips/crypto/Kconfig                |   6 -
 arch/mips/crypto/chacha-glue.c          | 131 +-----------
 arch/powerpc/crypto/Kconfig             |   8 -
 arch/powerpc/crypto/chacha-p10-glue.c   | 147 +-------------
 arch/riscv/crypto/Kconfig               |  11 +-
 arch/riscv/crypto/chacha-riscv64-glue.c | 112 ++++------
 arch/riscv/crypto/chacha-riscv64-zvkb.S |  71 +++----
 arch/s390/crypto/Kconfig                |   7 -
 arch/s390/crypto/chacha-glue.c          |  99 ++-------
 arch/x86/crypto/Kconfig                 |   9 -
 arch/x86/crypto/chacha_glue.c           | 144 +------------
 crypto/Makefile                         |   3 +-
 crypto/chacha.c                         | 260 ++++++++++++++++++++++++
 crypto/chacha_generic.c                 | 139 -------------
 include/crypto/chacha.h                 |   9 +
 include/crypto/internal/chacha.h        |  43 ----
 22 files changed, 413 insertions(+), 1193 deletions(-)
 create mode 100644 crypto/chacha.c
 delete mode 100644 crypto/chacha_generic.c
 delete mode 100644 include/crypto/internal/chacha.h

base-commit: 56f944529ec2292cbe63377a76df3759d702dd39
-- 
2.49.0


