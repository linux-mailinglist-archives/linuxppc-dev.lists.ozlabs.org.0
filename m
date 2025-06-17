Return-Path: <linuxppc-dev+bounces-9429-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D62ADDEDF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 00:30:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMM4w1ZNVz2xdg;
	Wed, 18 Jun 2025 08:30:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750199408;
	cv=none; b=EwcSZqi2XxqZCLp+XgZe3LOKG+hYW0utBJHqSErS/7z36eybZyd8LdPsGIo3dCeBrWLrH8Fe1NHXbG56R2glR7W2CdSJgqs+GkWyfEmP65Vba7nevcOA2bf/N8IPxN6FYYVpbxO4f89/NS3z70Ecsh5FI3wGXimjfsmjE8xMGObqJ+y+dNRfTPpZL0+tWhGTeCq5f8pPP5YVkhbxETbMKnfBHVZ+Bnp5zZ+yafTirPo4DU+m/RxOJHiV+5moWAc9ylkeZs/aldkmkw4mQFOYpXz62uBJ4pBmaVL0HFuspak4KDDghb8JWZSCXERax6r4m/ADH+v4lxru2SmazhnpuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750199408; c=relaxed/relaxed;
	bh=5n1vHZXydhS4yJUDc/Oqq194hWPb/ViKF7MZZOHn4s8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n8k4nW/oD2xLCSXebVwVyHdB2Nbkrd2Rj59qibuTXiqB/v3rkytqpXEV5e4QZD1aTgB1e/RVzTICbk3RHi5WCNPixguEHgCkA4iqDwFyXAmx9yBcKTTFYP8cml7wqyLqiWswFEiXLi5X/Kc9l1jYkTMGD0eOrFw6sX9eZLzxQB6Bi33CtY31aCmB4cUU4oTjbzcSRwIABzTQPmhCw9v4SjI+Ux7avlydi/6owzWObKQZ7Odjblk2CoG/5BN0qaZkLmg0qesph+aMAMjFUbXCO6cMo0jE1loUUVRrwULcHc87nzzlcDXc7nXLmpBkCxF6aWxsD+YA1MUS7Vi+u5PHZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PTaZtDOX; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PTaZtDOX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMM4p5kqPz2xS0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 08:30:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 56068A51FA8;
	Tue, 17 Jun 2025 22:30:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6A8C4CEF1;
	Tue, 17 Jun 2025 22:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750199400;
	bh=VbE9czpaU9jNxtjMDcOio0GOQz7YJt+xzskruq3kFzs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PTaZtDOXV75LW7zhlMetRWriUCGRO9uBwPIiM9o0/jEGpdN+igUnmxQnEp4plB8z2
	 45lRWfeggFJliDHOVY2MKce3WTRRndV5f2cx8yM9CqnvMAaGpPnoCiBrWww0aTm1Vw
	 mb/ykxw5+1+sj3X/ZWy1+swIdw1jIQK1T2UVoQzR0k5DDwYg9Um4xB5KgtupYEyyrY
	 xGTrU+hBphtguYh6B2FokcvxM265qfbLomsSN+rM0M8skgWVKadi9zOf4tpHUhOr3H
	 lnujVLmhVQ+4tf7rjpOMO0cB1eYfI9J3Y63Gi9APd8owp+0RFif64XVknd3zuXeD5x
	 tr1mB08xo0mnw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 5/9] lib/crypto/riscv: move arch/riscv/lib/crypto/ to lib/crypto/riscv/
Date: Tue, 17 Jun 2025 15:27:22 -0700
Message-ID: <20250617222726.365148-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617222726.365148-1-ebiggers@kernel.org>
References: <20250617222726.365148-1-ebiggers@kernel.org>
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

From: Eric Biggers <ebiggers@google.com>

Move the contents of arch/riscv/lib/crypto/ into lib/crypto/riscv/.

The new code organization makes a lot more sense for how this code
actually works and is developed.  In particular, it makes it possible to
build each algorithm as a single module, with better inlining and dead
code elimination.  For a more detailed explanation, see the patchset
which did this for the CRC library code:
https://lore.kernel.org/r/20250607200454.73587-1-ebiggers@kernel.org/.
Also see the patchset which did this for SHA-512:
https://lore.kernel.org/linux-crypto/20250616014019.415791-1-ebiggers@kernel.org/

This is just a preparatory commit, which does the move to get the files
into their new location but keeps them building the same way as before.
Later commits will make the actual improvements to the way the
arch-optimized code is integrated for each algorithm.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/riscv/lib/Makefile                                         | 1 -
 lib/crypto/Kconfig                                              | 2 +-
 lib/crypto/Makefile                                             | 1 +
 {arch/riscv/lib/crypto => lib/crypto/riscv}/Kconfig             | 0
 {arch/riscv/lib/crypto => lib/crypto/riscv}/Makefile            | 0
 .../riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-glue.c | 0
 .../riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-zvkb.S | 0
 .../crypto/riscv}/sha256-riscv64-zvknha_or_zvknhb-zvkb.S        | 0
 {arch/riscv/lib/crypto => lib/crypto/riscv}/sha256.c            | 0
 9 files changed, 2 insertions(+), 2 deletions(-)
 rename {arch/riscv/lib/crypto => lib/crypto/riscv}/Kconfig (100%)
 rename {arch/riscv/lib/crypto => lib/crypto/riscv}/Makefile (100%)
 rename {arch/riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-glue.c (100%)
 rename {arch/riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-zvkb.S (100%)
 rename {arch/riscv/lib/crypto => lib/crypto/riscv}/sha256-riscv64-zvknha_or_zvknhb-zvkb.S (100%)
 rename {arch/riscv/lib/crypto => lib/crypto/riscv}/sha256.c (100%)

diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 0baec92d2f55b..b1c46153606a6 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-y			+= crypto/
 lib-y			+= delay.o
 lib-y			+= memcpy.o
 lib-y			+= memset.o
 lib-y			+= memmove.o
 ifeq ($(CONFIG_KASAN_GENERIC)$(CONFIG_KASAN_SW_TAGS),)
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index f4f9a70dd0891..a2b58ca2df0cc 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -200,11 +200,11 @@ source "lib/crypto/mips/Kconfig"
 endif
 if PPC
 source "lib/crypto/powerpc/Kconfig"
 endif
 if RISCV
-source "arch/riscv/lib/crypto/Kconfig"
+source "lib/crypto/riscv/Kconfig"
 endif
 if S390
 source "arch/s390/lib/crypto/Kconfig"
 endif
 if SPARC
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 47c889b881b2a..0fe9200a031d6 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -105,5 +105,6 @@ libsm3-y					:= sm3.o
 
 obj-$(CONFIG_ARM) += arm/
 obj-$(CONFIG_ARM64) += arm64/
 obj-$(CONFIG_MIPS) += mips/
 obj-$(CONFIG_PPC) += powerpc/
+obj-$(CONFIG_RISCV) += riscv/
diff --git a/arch/riscv/lib/crypto/Kconfig b/lib/crypto/riscv/Kconfig
similarity index 100%
rename from arch/riscv/lib/crypto/Kconfig
rename to lib/crypto/riscv/Kconfig
diff --git a/arch/riscv/lib/crypto/Makefile b/lib/crypto/riscv/Makefile
similarity index 100%
rename from arch/riscv/lib/crypto/Makefile
rename to lib/crypto/riscv/Makefile
diff --git a/arch/riscv/lib/crypto/chacha-riscv64-glue.c b/lib/crypto/riscv/chacha-riscv64-glue.c
similarity index 100%
rename from arch/riscv/lib/crypto/chacha-riscv64-glue.c
rename to lib/crypto/riscv/chacha-riscv64-glue.c
diff --git a/arch/riscv/lib/crypto/chacha-riscv64-zvkb.S b/lib/crypto/riscv/chacha-riscv64-zvkb.S
similarity index 100%
rename from arch/riscv/lib/crypto/chacha-riscv64-zvkb.S
rename to lib/crypto/riscv/chacha-riscv64-zvkb.S
diff --git a/arch/riscv/lib/crypto/sha256-riscv64-zvknha_or_zvknhb-zvkb.S b/lib/crypto/riscv/sha256-riscv64-zvknha_or_zvknhb-zvkb.S
similarity index 100%
rename from arch/riscv/lib/crypto/sha256-riscv64-zvknha_or_zvknhb-zvkb.S
rename to lib/crypto/riscv/sha256-riscv64-zvknha_or_zvknhb-zvkb.S
diff --git a/arch/riscv/lib/crypto/sha256.c b/lib/crypto/riscv/sha256.c
similarity index 100%
rename from arch/riscv/lib/crypto/sha256.c
rename to lib/crypto/riscv/sha256.c
-- 
2.49.0


