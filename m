Return-Path: <linuxppc-dev+bounces-9563-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 723A3AE0DC9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jun 2025 21:22:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNVqB6sJhz2xjN;
	Fri, 20 Jun 2025 05:22:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750360934;
	cv=none; b=FxNJmGirM3O5kPB9cJ6Y0mRPTR+IAkHISDrDoOU4tgCgINgCVyZjDa7kM/Pqge0zGTHaIJAl5oCJiP2ynAgwDJIMhrQuufyyVDb2/EBjSZ0Ev+MLncCyMNACxTTnap6wN6SyxcJNxuGw/xmotXkHRxbXF4A4DTQB77+M+mcjXsGOJZJqljjIffIHeWb4oN8NYlahomaKrgbOwsUhnygXRb7I5eLcZO7BCVdFJUV/8niJTMESaR53G/iqVeT8d4sZ73uMnmze6iJi2GFK89egPqZ/pXEbvArzLt1Ikg82zCehtrv5P/4SecGNbkaFUBfDU0lCZw/0sdTUoKDLZAPVWg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750360934; c=relaxed/relaxed;
	bh=m2M7+2gaUCp+pdGZ4iBUatFVr+vuRJYvrM+tTcvtPhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eNH4A1pSlnb404scEs80Ln7MN2b1F+w3rsXftomuL305K7RDQjo/5hQQbaQi0vFJMjwU6NL1IzZZRNoEpJOfk6tK1USx8QeF7ntzsbrfNsS8FrD4Klv2zGA2LUn8+kxOz666EuUlZwFAYwAV88723dSO7CQCsh7he4h6d40V7XdCs+0bfJWKHZoCj6wOFy3FrvSRguoOO82+EHEaWc9fjSx18qg4BEmBFBPzWMwPlb8xQSr1+uiTZKFC7wVhJWqrUVd7DevW+0ElyIs8e4u0ewNFzKP7tYn6Zlfbk/+BF6+pRjIzFI6icMyv65hdmMSz7w1b4ywqGLfk3nBEZSUfgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KgvoC/BR; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KgvoC/BR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNVq65ZCmz2xtt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jun 2025 05:22:10 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DCBD84ACB6;
	Thu, 19 Jun 2025 19:22:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C698C4CEF2;
	Thu, 19 Jun 2025 19:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750360928;
	bh=olGuQl6hXdBWJzjyuen1xpyitMxkK608OWYpY9JoADg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KgvoC/BReFq1Lm55icK7ABnxNL5KdGaV5L4vxKrywBy7UfLviPfht7YJ0+aDH8XkE
	 PykslUmioa2H8UJWvJJ3G0GfVQSNo7J81My9lz/C2tHV92+8y250WL3lyixxQCG63Y
	 alFfFntKrRy1O2+H0Jovai2Z69VT6/YjPmUxYE29HEcsdPRWt8BcQsqR+XlJFxY4gi
	 ll9qJvMNNdzgp9slPesfx6+JndPYMinTFvyQ/AZSjcSxLCRz0ICJk1P7FiRssZSozY
	 bbkdhtkDDRs1CgETKB7RMcQBlEd1Lql2PMTEEjQylAcS1/jqGv1rl5l8BpcMvWIAPp
	 trU2POGmbT9Yg==
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
Subject: [PATCH v2 5/9] lib/crypto: riscv: move arch/riscv/lib/crypto/ into lib/crypto/
Date: Thu, 19 Jun 2025 12:19:04 -0700
Message-ID: <20250619191908.134235-6-ebiggers@kernel.org>
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
2.50.0


