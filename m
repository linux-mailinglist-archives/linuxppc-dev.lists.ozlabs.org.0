Return-Path: <linuxppc-dev+bounces-9568-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 792DBAE0DDB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jun 2025 21:23:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNVqF5xTXz30Wn;
	Fri, 20 Jun 2025 05:22:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750360937;
	cv=none; b=F78pD1qCYy9Iox8vacuQc9TMMz94mJtkr0A1gc6UVm4ohzjxY50OKdjklBXf1boRo0PysKGmCLtV8AxrumNaGekjjNPgir7u89ltX/ngMrL7OmZMwET0nL5AP62fhX4WYdhSluUatN2IHm+kDmW+cFle55qNw5hjlL3+NILPTXTSBPdh2j8S6aotKTc6FBc8pfxcU1fCt/gaaxs+GPsHIAEf5hL0sCFaWfMVhw6+Kw5Y+/aZJlIY1b6nQ2aNAgSWwo1kbJ7JmiuLNtIlY4W59/Zx67oVQ2p+DGoOGclaE8/vc1seg+250i+AFcMR6eoqzXMN1pu+IOfI7NAbt/001w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750360937; c=relaxed/relaxed;
	bh=83W10fLLpoIK8L9mY0z2oTkp6zKcXP+g8qzeZHR+GAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IxIKZtibi0duuu6MIY5o5GLeyLhhSSkgIBik6gaBP+cqnFIxyTSBw+D5G2JKrajpgdM+Ejg8RYmb37sumN6sSD2lkwKact6VEwkQyUFi9sMImEF1Fr7+eOuothIJxeyX67VjbPBek/K9NkKZ0Q+WjuL/nbrRuQHNjk2eRHlBohPSoadZMvhaSy5U7TKGMPCHJHDgK2fj2T0SCY+zhBVVIaE3U9XBkYAxQWk/+As8HMx0moO20U00HOIJbDGk8s64rIe5womCoA/8wSPVxeu9fyP4l7Ad6tc1PxyFlpCJu93BfyD6eXtZ27f/tzRCug/3uOJl8inK8E//1PUfpdESQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bXEnUCHo; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bXEnUCHo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNVq85Xffz3064
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jun 2025 05:22:12 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5F4E84ADB9;
	Thu, 19 Jun 2025 19:22:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFC34C4CEF0;
	Thu, 19 Jun 2025 19:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750360930;
	bh=LcwApgCrHyyCRJ2a2GiLxcYl5o0MWSHAzQ2wvFx8Muw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bXEnUCHoOEBW6mTEMAks5KvLkFh56qawoMnJm4Lu1chZFHRZ1mkUDFWyVIy9iVfSo
	 Av2+zMNkTlD264YmAlok7fz8uZva7Y/IUglzFRjBonpKdz+SnVah+29csKVS/BOH6p
	 bZJVaWxxXGNAbf4lcfqNjgJyc0dtyRuBjbzJNwOVWmZ4cpEFhnijLJ0q6uv1m/0M7k
	 4hY9RPYMyxNu+e+jvrThVOPgUI4OERXfD7BUZkdh8neyZvnECOInPybo8043B2+Mjz
	 KaweQKmbi1zfSGupVtAWc6XZUUPgLB4FQSdZ5yyLp/VYDNcb0ywrEAJ1I2xK5XPpbf
	 wYuFi60vKIOYg==
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
	x86@kernel.org,
	Sohil Mehta <sohil.mehta@intel.com>
Subject: [PATCH v2 8/9] lib/crypto: x86: move arch/x86/lib/crypto/ into lib/crypto/
Date: Thu, 19 Jun 2025 12:19:07 -0700
Message-ID: <20250619191908.134235-9-ebiggers@kernel.org>
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

Move the contents of arch/x86/lib/crypto/ into lib/crypto/x86/.

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

Add a gitignore entry for the removed directory arch/x86/lib/crypto/ so
that people don't accidentally commit leftover generated files.

Reviewed-by: Sohil Mehta <sohil.mehta@intel.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/x86/lib/.gitignore                                       | 4 ++++
 arch/x86/lib/Makefile                                         | 2 --
 lib/crypto/Kconfig                                            | 2 +-
 lib/crypto/Makefile                                           | 1 +
 {arch/x86/lib/crypto => lib/crypto/x86}/.gitignore            | 0
 {arch/x86/lib/crypto => lib/crypto/x86}/Kconfig               | 0
 {arch/x86/lib/crypto => lib/crypto/x86}/Makefile              | 0
 {arch/x86/lib/crypto => lib/crypto/x86}/blake2s-core.S        | 0
 {arch/x86/lib/crypto => lib/crypto/x86}/blake2s-glue.c        | 0
 {arch/x86/lib/crypto => lib/crypto/x86}/chacha-avx2-x86_64.S  | 0
 .../lib/crypto => lib/crypto/x86}/chacha-avx512vl-x86_64.S    | 0
 {arch/x86/lib/crypto => lib/crypto/x86}/chacha-ssse3-x86_64.S | 0
 {arch/x86/lib/crypto => lib/crypto/x86}/chacha_glue.c         | 0
 .../crypto => lib/crypto/x86}/poly1305-x86_64-cryptogams.pl   | 0
 {arch/x86/lib/crypto => lib/crypto/x86}/poly1305_glue.c       | 0
 {arch/x86/lib/crypto => lib/crypto/x86}/sha256-avx-asm.S      | 0
 {arch/x86/lib/crypto => lib/crypto/x86}/sha256-avx2-asm.S     | 0
 {arch/x86/lib/crypto => lib/crypto/x86}/sha256-ni-asm.S       | 0
 {arch/x86/lib/crypto => lib/crypto/x86}/sha256-ssse3-asm.S    | 0
 {arch/x86/lib/crypto => lib/crypto/x86}/sha256.c              | 0
 20 files changed, 6 insertions(+), 3 deletions(-)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/.gitignore (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/Kconfig (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/Makefile (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/blake2s-core.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/blake2s-glue.c (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/chacha-avx2-x86_64.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/chacha-avx512vl-x86_64.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/chacha-ssse3-x86_64.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/chacha_glue.c (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/poly1305-x86_64-cryptogams.pl (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/poly1305_glue.c (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/sha256-avx-asm.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/sha256-avx2-asm.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/sha256-ni-asm.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/sha256-ssse3-asm.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/sha256.c (100%)

diff --git a/arch/x86/lib/.gitignore b/arch/x86/lib/.gitignore
index 8ae0f93ecbfdd..ec2131c9fd206 100644
--- a/arch/x86/lib/.gitignore
+++ b/arch/x86/lib/.gitignore
@@ -1,2 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
+# This now-removed directory used to contain generated files.
+/crypto/
+
 inat-tables.c
diff --git a/arch/x86/lib/Makefile b/arch/x86/lib/Makefile
index 4fa5c4e1ba8a0..7cf8681cba0f2 100644
--- a/arch/x86/lib/Makefile
+++ b/arch/x86/lib/Makefile
@@ -1,12 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Makefile for x86 specific library files.
 #
 
-obj-y += crypto/
-
 # Produces uninteresting flaky coverage.
 KCOV_INSTRUMENT_delay.o	:= n
 
 # KCSAN uses udelay for introducing watchpoint delay; avoid recursion.
 KCSAN_SANITIZE_delay.o := n
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index b98543c7ef231..2460ddff967fc 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -209,10 +209,10 @@ source "lib/crypto/s390/Kconfig"
 endif
 if SPARC
 source "lib/crypto/sparc/Kconfig"
 endif
 if X86
-source "arch/x86/lib/crypto/Kconfig"
+source "lib/crypto/x86/Kconfig"
 endif
 endif
 
 endmenu
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 748d1fc6b6be2..16f5d76d92710 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -108,5 +108,6 @@ obj-$(CONFIG_ARM64) += arm64/
 obj-$(CONFIG_MIPS) += mips/
 obj-$(CONFIG_PPC) += powerpc/
 obj-$(CONFIG_RISCV) += riscv/
 obj-$(CONFIG_S390) += s390/
 obj-$(CONFIG_SPARC) += sparc/
+obj-$(CONFIG_X86) += x86/
diff --git a/arch/x86/lib/crypto/.gitignore b/lib/crypto/x86/.gitignore
similarity index 100%
rename from arch/x86/lib/crypto/.gitignore
rename to lib/crypto/x86/.gitignore
diff --git a/arch/x86/lib/crypto/Kconfig b/lib/crypto/x86/Kconfig
similarity index 100%
rename from arch/x86/lib/crypto/Kconfig
rename to lib/crypto/x86/Kconfig
diff --git a/arch/x86/lib/crypto/Makefile b/lib/crypto/x86/Makefile
similarity index 100%
rename from arch/x86/lib/crypto/Makefile
rename to lib/crypto/x86/Makefile
diff --git a/arch/x86/lib/crypto/blake2s-core.S b/lib/crypto/x86/blake2s-core.S
similarity index 100%
rename from arch/x86/lib/crypto/blake2s-core.S
rename to lib/crypto/x86/blake2s-core.S
diff --git a/arch/x86/lib/crypto/blake2s-glue.c b/lib/crypto/x86/blake2s-glue.c
similarity index 100%
rename from arch/x86/lib/crypto/blake2s-glue.c
rename to lib/crypto/x86/blake2s-glue.c
diff --git a/arch/x86/lib/crypto/chacha-avx2-x86_64.S b/lib/crypto/x86/chacha-avx2-x86_64.S
similarity index 100%
rename from arch/x86/lib/crypto/chacha-avx2-x86_64.S
rename to lib/crypto/x86/chacha-avx2-x86_64.S
diff --git a/arch/x86/lib/crypto/chacha-avx512vl-x86_64.S b/lib/crypto/x86/chacha-avx512vl-x86_64.S
similarity index 100%
rename from arch/x86/lib/crypto/chacha-avx512vl-x86_64.S
rename to lib/crypto/x86/chacha-avx512vl-x86_64.S
diff --git a/arch/x86/lib/crypto/chacha-ssse3-x86_64.S b/lib/crypto/x86/chacha-ssse3-x86_64.S
similarity index 100%
rename from arch/x86/lib/crypto/chacha-ssse3-x86_64.S
rename to lib/crypto/x86/chacha-ssse3-x86_64.S
diff --git a/arch/x86/lib/crypto/chacha_glue.c b/lib/crypto/x86/chacha_glue.c
similarity index 100%
rename from arch/x86/lib/crypto/chacha_glue.c
rename to lib/crypto/x86/chacha_glue.c
diff --git a/arch/x86/lib/crypto/poly1305-x86_64-cryptogams.pl b/lib/crypto/x86/poly1305-x86_64-cryptogams.pl
similarity index 100%
rename from arch/x86/lib/crypto/poly1305-x86_64-cryptogams.pl
rename to lib/crypto/x86/poly1305-x86_64-cryptogams.pl
diff --git a/arch/x86/lib/crypto/poly1305_glue.c b/lib/crypto/x86/poly1305_glue.c
similarity index 100%
rename from arch/x86/lib/crypto/poly1305_glue.c
rename to lib/crypto/x86/poly1305_glue.c
diff --git a/arch/x86/lib/crypto/sha256-avx-asm.S b/lib/crypto/x86/sha256-avx-asm.S
similarity index 100%
rename from arch/x86/lib/crypto/sha256-avx-asm.S
rename to lib/crypto/x86/sha256-avx-asm.S
diff --git a/arch/x86/lib/crypto/sha256-avx2-asm.S b/lib/crypto/x86/sha256-avx2-asm.S
similarity index 100%
rename from arch/x86/lib/crypto/sha256-avx2-asm.S
rename to lib/crypto/x86/sha256-avx2-asm.S
diff --git a/arch/x86/lib/crypto/sha256-ni-asm.S b/lib/crypto/x86/sha256-ni-asm.S
similarity index 100%
rename from arch/x86/lib/crypto/sha256-ni-asm.S
rename to lib/crypto/x86/sha256-ni-asm.S
diff --git a/arch/x86/lib/crypto/sha256-ssse3-asm.S b/lib/crypto/x86/sha256-ssse3-asm.S
similarity index 100%
rename from arch/x86/lib/crypto/sha256-ssse3-asm.S
rename to lib/crypto/x86/sha256-ssse3-asm.S
diff --git a/arch/x86/lib/crypto/sha256.c b/lib/crypto/x86/sha256.c
similarity index 100%
rename from arch/x86/lib/crypto/sha256.c
rename to lib/crypto/x86/sha256.c
-- 
2.50.0


