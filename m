Return-Path: <linuxppc-dev+bounces-9569-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBD2AE0DDE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jun 2025 21:23:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNVqG1tmqz3bV6;
	Fri, 20 Jun 2025 05:22:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750360938;
	cv=none; b=mOOHFC9SIyLmJXrB1TW8N5iZmhiVIPw8M5k3IzyHk+2N4QlzXUyLw5Yrb4n/Co/c7jPvGChjNIGUNQmUCm++ZXb9spvmvmpT1odRyygQ6l/Dsn2y74BqjFgD2CsWJgAxmXIACt16VAf1TJQqwv7u9p20e6WfqlCo/B8ep/ObK+CbiYPQK2BfY7aNf/Cq6xSAN5AuP17UqrWt76ccMi4LnGc4s858/MzqSY/R2qgATKSheM0ESiOuNsOiB+oRt76Ri69V3GweNV+/Fu+y4pPv6GzGM2o1NVhi7KL8fSHWNjispV7FcNudmH3nRDiN7v1jFxe/0PwTO6cS+cbHMlSSdw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750360938; c=relaxed/relaxed;
	bh=YoifR3L0F6KCwbKGtz/D0/P7CUUwCCQ0xZh+WHZ6kgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lYUvMTlybW9ETfXJELZgbnpJvBDR3Ixdf6ELmGgxZWhS7yc4AaGZyrzehWB0uNztpSGjhBai8eskZJwrpKihUwUaU/tyWB6Wvk7xQODvyd5WLgZuQi1epu4qWl40D+5z9GuP7g1dPeYwlL4nzLQaAj8WWBjDMoj5hI10TSlWKC9cTHXe6vD/gjm+t0fN/Syr5Ykf4rplYvGxAsyu1DfRndgmT0kvz7d6suy6DGZtqj92WXCI9lz5X4lOWkL8Vixnlpb7mO0idSY0UUqLGFUFYSDAuoUkzhcWJHOYXVhCZJbSi73CwZ5r0fyD6+gk7UzJI6CSWmHVdl/rTJs8kDg14A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=t+9eGIBC; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=t+9eGIBC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNVq90NK9z308P
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jun 2025 05:22:12 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E89B0A54758;
	Thu, 19 Jun 2025 19:22:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69858C4CEED;
	Thu, 19 Jun 2025 19:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750360929;
	bh=kUVhngdCHpSMNtk0i1v0SVNnjxwdD/3jWEooeOamq10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t+9eGIBC2JDa5DBQqAnw528r9ACWVj+Qr17A54ciB4TVHa1eLZ+Cw/tv4tJe3qmmu
	 CWLfxIkUEzwdqVlNIiGwx5Bzb+kZ1SMWxgAgqqYfslDii+7pCSH2VfWxr2ABGHVZjL
	 9NEvxT+rF0Mq1lA/MD4+yRkBdaYERMN5l5JlW4/bbiyiLfYF0lg/9VIM1f6jZ23kZb
	 BSUZGerbrfDxB8isVNt5CoRE7prpNbtHPX2VquHxJSou2QE3ZgjbzVzIOHMsIyQsY3
	 cTZiTne87ZdJEDTIPCgGIdHOXjYtICNzsMQSHbLOzkBUNHtR6AczWJzS8dJRbfIQ9c
	 TBRr1sB+g/jow==
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
Subject: [PATCH v2 7/9] lib/crypto: sparc: move arch/sparc/lib/crypto/ into lib/crypto/
Date: Thu, 19 Jun 2025 12:19:06 -0700
Message-ID: <20250619191908.134235-8-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250619191908.134235-1-ebiggers@kernel.org>
References: <20250619191908.134235-1-ebiggers@kernel.org>
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
2.50.0


