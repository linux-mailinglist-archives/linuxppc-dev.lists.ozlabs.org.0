Return-Path: <linuxppc-dev+bounces-9433-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B080AADDEEE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 00:31:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMM4y1wx1z30Wn;
	Wed, 18 Jun 2025 08:30:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750199410;
	cv=none; b=GfVxihY7kEA/07RL0P99j1gHxKOt+pLM5f6z8+lvH3H33+imZiN3OYLmpM4MEROqfdjwiUNgXDztjtRZMJ8f8oDicIV+zq7YLagpP7DWVQXrTCAm8qVMqZdGuYvvzkTSrSCeyV6TLMwXG458O5LMnsdVXtG9VNQpNqY1HdH3b5DjskysQCsVoClwpHbVIF+U52GwtWXsZBLooeFPAqvmAcmk1fI9x1tZHu4Y9ztfBYXhxpoxJWUH2v+YsHcGcNYBYrUmHAw6b3Ha4W9Vu0d7NRf7UG0eFHcyhG1mTI5oyWJjSGovmJhDGgPvHXi9vyH6w7F0OgsqK3juFhexWhr4SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750199410; c=relaxed/relaxed;
	bh=K2TQ9bvkT/supFVdWNHYngTA+l1eaZcCvqdK8kM8rAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N6idEXGfZnxwVtd01PLeLhT+HUeCztkl0wMav92R654jTfN63gm6nnZFb1PuxnicfczoplK4wlzgh5aP3EJFYU0DWLfx1rgrmwaj8d6iUce66t62i2DV8So/Tqklnev4Ouz32k8e1pRoLYJGbFmdu3EuyDGbbB9T4oTlMbnokBphZAmYmUxKD+qmrAWFn+nJfV50bZ5VdkpyPllEW9Pq5ZME6FqRnlDw79GQtaz6v/OWmb1JpOBHz5Xk2Pj5ZijvYsQqkX/ytClSAYM/usliZD3V675hrUtLymRAS/OZAnSMlKyw6mbtN56wLf20FSqBtzq6xK1E8/Ds6urJeihCqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CKc8qPKa; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CKc8qPKa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMM4q4WnSz2xlK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 08:30:03 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 32E224A817;
	Tue, 17 Jun 2025 22:30:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC62AC4CEF6;
	Tue, 17 Jun 2025 22:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750199401;
	bh=hkPIvoqxShZhMTTDhLVtDi8Yqmn39FL66nVo8qVRu1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CKc8qPKacvgviafDJA8lSI2yrliEIiRaHqww9PSNVArp3EkmSThFIj0ix9/MqJPwg
	 3t0MqZLXdwckLnEcpIcbnuhL8zrVWrFYzDDuEke7tXOvMfDa3J7RRrKLmU+uetbjZ4
	 bG1iU16tXN1rrqNMaQxv+54OWdd/MEWLvXU9V0sacQR86Pehnf0mSBErESrSvBLLqb
	 ntGC/IsNfd2afRrg89OWW2gQnIbUZFr5ADvscwB9ZsXqG8WMWm0JAyG4OPxWA5H3Q7
	 T9Uy/6lgMcgbVxTl3aSfMvp3Nmeamfxr1OxiYp1oJMF4LdCD3rAm7+Q0WUupeSaq0t
	 O5Ni41xVr1NEw==
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
Subject: [PATCH 7/9] lib/crypto/sparc: move arch/sparc/lib/crypto/ to lib/crypto/sparc/
Date: Tue, 17 Jun 2025 15:27:24 -0700
Message-ID: <20250617222726.365148-8-ebiggers@kernel.org>
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

Move the contents of arch/sparc/lib/crypto/ into lib/crypto/sparc/.

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
 arch/sparc/lib/Makefile                                  | 1 -
 lib/crypto/Kconfig                                       | 2 +-
 lib/crypto/Makefile                                      | 1 +
 {arch/sparc/lib/crypto => lib/crypto/sparc}/Kconfig      | 0
 {arch/sparc/lib/crypto => lib/crypto/sparc}/Makefile     | 0
 {arch/sparc/lib/crypto => lib/crypto/sparc}/sha256.c     | 0
 {arch/sparc/lib/crypto => lib/crypto/sparc}/sha256_asm.S | 0
 7 files changed, 2 insertions(+), 2 deletions(-)
 rename {arch/sparc/lib/crypto => lib/crypto/sparc}/Kconfig (100%)
 rename {arch/sparc/lib/crypto => lib/crypto/sparc}/Makefile (100%)
 rename {arch/sparc/lib/crypto => lib/crypto/sparc}/sha256.c (100%)
 rename {arch/sparc/lib/crypto => lib/crypto/sparc}/sha256_asm.S (100%)

diff --git a/arch/sparc/lib/Makefile b/arch/sparc/lib/Makefile
index 5cf9781d68b40..ef8860eb3f3d1 100644
--- a/arch/sparc/lib/Makefile
+++ b/arch/sparc/lib/Makefile
@@ -2,11 +2,10 @@
 # Makefile for Sparc library files..
 #
 
 asflags-y := -ansi -DST_DIV0=0x02
 
-obj-y                 += crypto/
 lib-$(CONFIG_SPARC32) += ashrdi3.o
 lib-$(CONFIG_SPARC32) += memcpy.o memset.o
 lib-y                 += strlen.o
 lib-y                 += checksum_$(BITS).o
 lib-$(CONFIG_SPARC32) += blockops.o
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 278b7ef5ec4f9..b98543c7ef231 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -206,11 +206,11 @@ source "lib/crypto/riscv/Kconfig"
 endif
 if S390
 source "lib/crypto/s390/Kconfig"
 endif
 if SPARC
-source "arch/sparc/lib/crypto/Kconfig"
+source "lib/crypto/sparc/Kconfig"
 endif
 if X86
 source "arch/x86/lib/crypto/Kconfig"
 endif
 endif
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 4cda1f5cd21d4..748d1fc6b6be2 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -107,5 +107,6 @@ obj-$(CONFIG_ARM) += arm/
 obj-$(CONFIG_ARM64) += arm64/
 obj-$(CONFIG_MIPS) += mips/
 obj-$(CONFIG_PPC) += powerpc/
 obj-$(CONFIG_RISCV) += riscv/
 obj-$(CONFIG_S390) += s390/
+obj-$(CONFIG_SPARC) += sparc/
diff --git a/arch/sparc/lib/crypto/Kconfig b/lib/crypto/sparc/Kconfig
similarity index 100%
rename from arch/sparc/lib/crypto/Kconfig
rename to lib/crypto/sparc/Kconfig
diff --git a/arch/sparc/lib/crypto/Makefile b/lib/crypto/sparc/Makefile
similarity index 100%
rename from arch/sparc/lib/crypto/Makefile
rename to lib/crypto/sparc/Makefile
diff --git a/arch/sparc/lib/crypto/sha256.c b/lib/crypto/sparc/sha256.c
similarity index 100%
rename from arch/sparc/lib/crypto/sha256.c
rename to lib/crypto/sparc/sha256.c
diff --git a/arch/sparc/lib/crypto/sha256_asm.S b/lib/crypto/sparc/sha256_asm.S
similarity index 100%
rename from arch/sparc/lib/crypto/sha256_asm.S
rename to lib/crypto/sparc/sha256_asm.S
-- 
2.49.0


