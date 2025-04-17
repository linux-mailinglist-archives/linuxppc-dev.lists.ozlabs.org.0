Return-Path: <linuxppc-dev+bounces-7756-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FE5A9278F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 20:27:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZdmZj63Hzz3c00;
	Fri, 18 Apr 2025 04:27:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744914429;
	cv=none; b=i6PfOJj+ytL6Wv1s3Vv0sypqyJukAuiFuSh2NSm/4zKG2FiF0CauFYF4LN+EytNtJvs3RxEeqi3YJIOHTKM8WXTNleFxADOjRxiQXrimMYJkDVR20pAIZX+uhpA/cdRjLPXS3gPZdfo43GLbj5IvvWptl9K3LxWWu2fXNQ/IymX2n/UgEPy/2jyI6JAz+bsZN5LPCEZb/+lG643k9i2vU2eLeBKyJO34f0BQTcZ7YZYm9fHp9T1/IANe610t65mE3fEQBP+A223na0SqdT6HAaCS8TYYhK+ignqVDzdE8weZTirk+KPVrLimham5YQp/k69lAs/DyfVrOPVkJmJgew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744914429; c=relaxed/relaxed;
	bh=zkygNKKSJ6A/yCBu0e02gVkBmVl2/XwjeTtPr2xnTyU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XRv/dMvGp6gAOBoccFhcsE1hEK1bLrOXLoQsFhdEDQmMslUmcAMwgexb03Puy77LNBeFcsoknnMtrohczZcfyeaqCsVcVrN0xdWECFbpE/xdTM35SkbyyAyu4yqaKib+FPAeOeFg8sDcPzemWV3II3Xuf43HUIMstSpdFHWRx0HKhLQYe9v9HYt0S020vr/n+7NuS1EQBGZ5uZ8h99mg0hD+A5mLDKqfyUQKfdafnANrQPuIpnSwYHw012TaEZAsFTEfe45vE3alhdkdLcFj+8M5y1sCu44fL4Qfdcuu68Jl++Ulldpco6tPYwhagKeJFLfYFe79uOrSvPxmjEOBCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OIGe0C4H; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OIGe0C4H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZdmZh2qW5z2yrJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 04:27:08 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C3C9149E43;
	Thu, 17 Apr 2025 18:27:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 241E8C4CEEC;
	Thu, 17 Apr 2025 18:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744914425;
	bh=eYlw8AhwDiKSQwbJxBZMP6nL7U7/odFuPU2SW3GNcIs=;
	h=From:To:Cc:Subject:Date:From;
	b=OIGe0C4HhyE/SwSQmKx2rHmtBTJv+C//vsUPyHQ9nBNZ7SM70FI5kAjNOXx0SiPAT
	 oAV2RDvW3y7SexpSfNzDbW3E0WnI97wnBu7vd0ixGUtDVT++ajf0iwHpYPkfRoPvP9
	 dT4SFF4LmjWuyS23J7I28QPr2BOEobjN9OeNUvVqomFKSjPZoUnpDk/aJjRQhRsRIa
	 2jmz2BHEDWHCJM4wvqlkIeqwkGTdW4f9UXQwxbXtBHS8en8Ihmr+5OuGxO4m0tt2DT
	 hAvSXPNfuhibOtdvN7de1S4/+B2pChejRWcf0/OP2SYlBqQ90ckVcnffrq7XEP05h7
	 kOgQb7+Go6l8A==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH 00/15] Finish disentangling ChaCha, Poly1305, and BLAKE2s from CRYPTO
Date: Thu, 17 Apr 2025 11:26:08 -0700
Message-ID: <20250417182623.67808-1-ebiggers@kernel.org>
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
CONFIG_CRYPTO.  To do this, it moves arch/*/crypto/Kconfig from a
submenu of crypto/Kconfig to a submenu of arch/*/Kconfig, then re-adds
the CRYPTO dependency to the symbols that actually need it.

Patches 14-15 then simplify the ChaCha and Poly1305 symbols by removing
the unneeded "internal" symbols.

Note that Curve25519 is still entangled.  Later patches will fix that.

Eric Biggers (15):
  crypto: arm - remove CRYPTO dependency of library functions
  crypto: arm64 - drop redundant dependencies on ARM64
  crypto: arm64 - remove CRYPTO dependency of library functions
  crypto: loongarch - source arch/loongarch/crypto/Kconfig without
    CRYPTO
  crypto: mips - remove CRYPTO dependency of library functions
  crypto: powerpc - drop redundant dependencies on PPC
  crypto: powerpc - remove CRYPTO dependency of library functions
  crypto: riscv - remove CRYPTO dependency of library functions
  crypto: s390 - drop redundant dependencies on S390
  crypto: s390 - remove CRYPTO dependency of library functions
  crypto: sparc - source arch/sparc/crypto/Kconfig without CRYPTO
  crypto: x86 - drop redundant dependencies on X86
  crypto: x86 - remove CRYPTO dependency of library functions
  crypto: lib/chacha - remove INTERNAL symbol and selection of CRYPTO
  crypto: lib/poly1305 - remove INTERNAL symbol and selection of CRYPTO

 arch/arm/Kconfig            |  2 ++
 arch/arm/crypto/Kconfig     | 28 ++++++++-------
 arch/arm64/Kconfig          |  3 +-
 arch/arm64/crypto/Kconfig   | 45 ++++++++++++-----------
 arch/loongarch/Kconfig      |  1 +
 arch/mips/Kconfig           |  2 ++
 arch/mips/crypto/Kconfig    | 12 +++----
 arch/powerpc/Kconfig        |  2 ++
 arch/powerpc/crypto/Kconfig | 22 ++++++------
 arch/riscv/Kconfig          |  2 ++
 arch/riscv/crypto/Kconfig   | 14 ++++----
 arch/s390/Kconfig           |  4 +++
 arch/s390/crypto/Kconfig    | 21 ++++++-----
 arch/sparc/Kconfig          |  2 ++
 arch/sparc/crypto/Kconfig   | 14 ++++----
 arch/x86/Kconfig            |  4 +++
 arch/x86/crypto/Kconfig     | 72 ++++++++++++++++++-------------------
 crypto/Kconfig              | 34 ++----------------
 lib/crypto/Kconfig          | 32 ++++++-----------
 19 files changed, 149 insertions(+), 167 deletions(-)


base-commit: da4cb617bc7d827946cbb368034940b379a1de90
-- 
2.49.0


