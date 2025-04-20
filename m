Return-Path: <linuxppc-dev+bounces-7826-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D11A94920
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Apr 2025 21:28:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZgdnH31Mdz3c2k;
	Mon, 21 Apr 2025 05:27:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745177267;
	cv=none; b=EBX5nHKZcpFmLf/2B0y9i/UhPbSwfwN1mxErpxIVY/XiHJZ3twPFJBVX07yjk95Di9RpnTUu8SEzpdGVYhU1DaXy5/KejkqqIV1V+oCtTNlbzlxphuySsgJHyvgxT0QQ0EW491WnMoFJAmdjbIKsFBx9HvneFFDTzE3zrnTik32KwQWTttyddqH+/NFZj3CMV46azy6YynTDJ2I7Z1WA/Q9Ilse61koUMPAwQtFGGXI1a1csLt2kjwdrtP6R4yZ/hMcA7+N4/P7XgrTpgXChsCQod7LGsEgD6YiFYk6EJ4IDc5ypJCH8KHyAFGF9mtXEd5w7+JICrPeQg59xXqZr5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745177267; c=relaxed/relaxed;
	bh=JTbO3bkLwy7G2nJqTkGEYXUtBveaaxyR2UC7H7HLcoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dsTqgdQoJ1ouneIio7RWGUFoarckpRbeVuUKmR2JeRCQ85LNf3fVeG7bdbjdy0QeAm5HuyFXzXfDcAwFdIRc3VFnlEWbkMgfBuROeN6oNPf7pe2trBVwbytpDZumQiNkWVCjlKzlJQoUQ5ggHzABmDj2OZDseEROSjQLhZJGDeyQFpwTsXVnb8x/dQgoBt6Rg1gxuJ0+LJlv4ld6kU1OoPZJs1cx0tvbz4vjmAUh74iZ9o0cumAwMI5PLfIaIcDPQNiKjizLPMP1TjmaMgbyTZAKwgU/WLz0MBmHtXaaEarkuAJ2pZ2LD69yU6ZGM6p+blqmBmRb2HzgepcDOzK5jw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZCkUDe2S; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZCkUDe2S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZgdnB75VFz3c3W
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Apr 2025 05:27:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0A5E74A6E8;
	Sun, 20 Apr 2025 19:27:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F183DC4CEED;
	Sun, 20 Apr 2025 19:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745177261;
	bh=JceMeyvHZFS3hU3osMnM8DtDXrhU/UjeqoFMt/NCYhM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZCkUDe2S72itq2OYuxxdcNB38pxf0twZvxcIytZW+K9b6WjYA0TAIwlMai/eahJAx
	 w8hnWfFuUPwQIEWcmraLbu+8LuMqAmesx2H0tNclifUpqnw3RlSCtQJQXl7qosnV2B
	 X9dfT634nEyucjsrsXXn2P/ZQhmdjtoJhC5zA8zcTDZzetaY0MekSgwZdqf1NxO2DG
	 rGjDYkc5mRCzY0avNxgFZx69VsIWcl/xjeGBuZUOG9mWyOjDRjtgn9xGXhXEkHed9d
	 0Qkk02QD/yLL5xsi23VAlR3hd1WRfL/GqaURyDQikpiyFjKT3o0P20ZHdJC6pdJW+2
	 BorTK//xE0hgg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v2 09/13] crypto: riscv - move library functions to arch/riscv/lib/crypto/
Date: Sun, 20 Apr 2025 12:26:05 -0700
Message-ID: <20250420192609.295075-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250420192609.295075-1-ebiggers@kernel.org>
References: <20250420192609.295075-1-ebiggers@kernel.org>
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

From: Eric Biggers <ebiggers@google.com>

Continue disentangling the crypto library functions from the generic
crypto infrastructure by moving the riscv ChaCha library functions into
a new directory arch/riscv/lib/crypto/ that does not depend on CRYPTO.
This mirrors the distinction between crypto/ and lib/crypto/.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/riscv/crypto/Kconfig                         | 7 -------
 arch/riscv/crypto/Makefile                        | 3 ---
 arch/riscv/lib/Makefile                           | 1 +
 arch/riscv/lib/crypto/Kconfig                     | 8 ++++++++
 arch/riscv/lib/crypto/Makefile                    | 4 ++++
 arch/riscv/{ => lib}/crypto/chacha-riscv64-glue.c | 0
 arch/riscv/{ => lib}/crypto/chacha-riscv64-zvkb.S | 0
 lib/crypto/Kconfig                                | 3 +++
 8 files changed, 16 insertions(+), 10 deletions(-)
 create mode 100644 arch/riscv/lib/crypto/Kconfig
 create mode 100644 arch/riscv/lib/crypto/Makefile
 rename arch/riscv/{ => lib}/crypto/chacha-riscv64-glue.c (100%)
 rename arch/riscv/{ => lib}/crypto/chacha-riscv64-zvkb.S (100%)

diff --git a/arch/riscv/crypto/Kconfig b/arch/riscv/crypto/Kconfig
index 27a1f26d41bde..4863be2a4ec2f 100644
--- a/arch/riscv/crypto/Kconfig
+++ b/arch/riscv/crypto/Kconfig
@@ -16,17 +16,10 @@ config CRYPTO_AES_RISCV64
 	  - Zvkned vector crypto extension
 	  - Zvbb vector extension (XTS)
 	  - Zvkb vector crypto extension (CTR)
 	  - Zvkg vector crypto extension (XTS)
 
-config CRYPTO_CHACHA_RISCV64
-	tristate
-	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
-	select CRYPTO_ARCH_HAVE_LIB_CHACHA
-	select CRYPTO_LIB_CHACHA_GENERIC
-	default CRYPTO_LIB_CHACHA_INTERNAL
-
 config CRYPTO_GHASH_RISCV64
 	tristate "Hash functions: GHASH"
 	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
 	select CRYPTO_GCM
 	help
diff --git a/arch/riscv/crypto/Makefile b/arch/riscv/crypto/Makefile
index 247c7bc7288ce..4ae9bf762e907 100644
--- a/arch/riscv/crypto/Makefile
+++ b/arch/riscv/crypto/Makefile
@@ -2,13 +2,10 @@
 
 obj-$(CONFIG_CRYPTO_AES_RISCV64) += aes-riscv64.o
 aes-riscv64-y := aes-riscv64-glue.o aes-riscv64-zvkned.o \
 		 aes-riscv64-zvkned-zvbb-zvkg.o aes-riscv64-zvkned-zvkb.o
 
-obj-$(CONFIG_CRYPTO_CHACHA_RISCV64) += chacha-riscv64.o
-chacha-riscv64-y := chacha-riscv64-glue.o chacha-riscv64-zvkb.o
-
 obj-$(CONFIG_CRYPTO_GHASH_RISCV64) += ghash-riscv64.o
 ghash-riscv64-y := ghash-riscv64-glue.o ghash-riscv64-zvkg.o
 
 obj-$(CONFIG_CRYPTO_SHA256_RISCV64) += sha256-riscv64.o
 sha256-riscv64-y := sha256-riscv64-glue.o sha256-riscv64-zvknha_or_zvknhb-zvkb.o
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index b1c46153606a6..0baec92d2f55b 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
+obj-y			+= crypto/
 lib-y			+= delay.o
 lib-y			+= memcpy.o
 lib-y			+= memset.o
 lib-y			+= memmove.o
 ifeq ($(CONFIG_KASAN_GENERIC)$(CONFIG_KASAN_SW_TAGS),)
diff --git a/arch/riscv/lib/crypto/Kconfig b/arch/riscv/lib/crypto/Kconfig
new file mode 100644
index 0000000000000..46ce2a7ac1f2c
--- /dev/null
+++ b/arch/riscv/lib/crypto/Kconfig
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config CRYPTO_CHACHA_RISCV64
+	tristate
+	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
+	default CRYPTO_LIB_CHACHA_INTERNAL
+	select CRYPTO_ARCH_HAVE_LIB_CHACHA
+	select CRYPTO_LIB_CHACHA_GENERIC
diff --git a/arch/riscv/lib/crypto/Makefile b/arch/riscv/lib/crypto/Makefile
new file mode 100644
index 0000000000000..e27b78f317fc8
--- /dev/null
+++ b/arch/riscv/lib/crypto/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_CRYPTO_CHACHA_RISCV64) += chacha-riscv64.o
+chacha-riscv64-y := chacha-riscv64-glue.o chacha-riscv64-zvkb.o
diff --git a/arch/riscv/crypto/chacha-riscv64-glue.c b/arch/riscv/lib/crypto/chacha-riscv64-glue.c
similarity index 100%
rename from arch/riscv/crypto/chacha-riscv64-glue.c
rename to arch/riscv/lib/crypto/chacha-riscv64-glue.c
diff --git a/arch/riscv/crypto/chacha-riscv64-zvkb.S b/arch/riscv/lib/crypto/chacha-riscv64-zvkb.S
similarity index 100%
rename from arch/riscv/crypto/chacha-riscv64-zvkb.S
rename to arch/riscv/lib/crypto/chacha-riscv64-zvkb.S
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 4b3e94ed84bb6..0b06c25eb38a5 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -166,8 +166,11 @@ if MIPS
 source "arch/mips/lib/crypto/Kconfig"
 endif
 if PPC
 source "arch/powerpc/lib/crypto/Kconfig"
 endif
+if RISCV
+source "arch/riscv/lib/crypto/Kconfig"
+endif
 endif
 
 endmenu
-- 
2.49.0


