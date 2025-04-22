Return-Path: <linuxppc-dev+bounces-7924-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0479BA970C6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 17:29:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZhmND6pR5z3cHt;
	Wed, 23 Apr 2025 01:28:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745335708;
	cv=none; b=XPr5a+IvaV3nV0yMqazKm+ZBtj7AMmG0qvbtvL/6be1Qh3RzV2wQQ3X3mbqFsanfkO7QhIjmFL2Ah5MzhUkQvtdGyMX08JJtGtshX2bkrdderSm6W2kKQaJ/aNm/11rxLdirjzcPxsPDDzMSTTK1WjbwoSRBeQNUeDNRJ35hEU23F4QdreqboAGB5uGZhFYkC7niz6I0N5F/yDrpxwxrXKYKzW/ctNBPBumHF9soKbqGG3U2bNDXnTG0h9jE9IRIHh7+13+4QX/86NXEIV/NwZbOZ7qd5xh3tEzLH3zUmpYyX7x6JmfryRY2/leVc6ZUx9L36MQ2NeHjm8RaBRbbhw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745335708; c=relaxed/relaxed;
	bh=WtPCi66iSqMZcLw/odJWl7zof7PIFZ58Gm8bwD5gdUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o02Mstbdg3WyAXXzyh1G+ik7vp5KuT4I3uPfNIh7jIWzEZOxJa4XhSJ8bsIN65KsPBAzgs6WGfPhoYBLKWGYW5hVo0w4Z2NgZBUz1siK36Stnuabm2LjwSNm28LhQ99CWIdDBJ6+bzF3biQFBa0J4k9dlm0Vj8mgUDM5+Nxu++8U0x0bf34MAWrOBygZ6iPNiZVptP7RHiWQfhyHR+PY7mZj4h0eQhLmZ0o0pSp1W/AFDAxD0rBZ+43SphQ7Xt7Zu/1UDnQPZu51nm73YDSOLQH8qW7tqyGCCUIFBxA8uUtPvNVSJ1o8HdY8r8+vLFvoU+mQxYL65LNZbYYqUzo8gA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cKwMSXyS; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cKwMSXyS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZhmN61lwcz3bvd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Apr 2025 01:28:21 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 96E135C5CBC;
	Tue, 22 Apr 2025 15:26:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04868C4CEF0;
	Tue, 22 Apr 2025 15:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745335699;
	bh=ki6Sn/ee5qgO3vhh3ZkrojeEv770iQQrw7Ukhfk4zI8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cKwMSXyShmoHoJUgBOV9El8W3aUBH6B0Lz2ReK5Ym+/HXRopKgkn01mXIoaJjRjWO
	 Rmyc7OlIJeA+Jq8fnsi9olY+0Z6qJ33MBan8XAwwZU15EexRsxco6jYkVAJpbmWUdw
	 k0W+pKj3tOJd9n0K/kF93dD+ZqWixWfdWR2iEC2blBH7niDgSzB+Eab1g9SkEPXWPK
	 miq+8VeFRIDQ9eKZZ6SRyjXnnrGZwZBPk4rcz3Zml+i3s+36nIv/RasGxrNX1GI9of
	 Wo4JYKUEfdCTsdGvzQWPi78zsaclbLaPDuWsc2OgCOInv7zjSeKx10axodSTGDrhSh
	 yIGZqaS1xAWdQ==
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
	Ard Biesheuvel <ardb@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>
Subject: [PATCH v3 10/13] crypto: s390 - move library functions to arch/s390/lib/crypto/
Date: Tue, 22 Apr 2025 08:27:13 -0700
Message-ID: <20250422152716.5923-11-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422152716.5923-1-ebiggers@kernel.org>
References: <20250422152716.5923-1-ebiggers@kernel.org>
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
crypto infrastructure by moving the s390 ChaCha library functions into a
new directory arch/s390/lib/crypto/ that does not depend on CRYPTO.
This mirrors the distinction between crypto/ and lib/crypto/.

Acked-by: Heiko Carstens <hca@linux.ibm.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/s390/crypto/Kconfig                 | 6 ------
 arch/s390/crypto/Makefile                | 3 ---
 arch/s390/lib/Makefile                   | 1 +
 arch/s390/lib/crypto/Kconfig             | 7 +++++++
 arch/s390/lib/crypto/Makefile            | 4 ++++
 arch/s390/{ => lib}/crypto/chacha-glue.c | 0
 arch/s390/{ => lib}/crypto/chacha-s390.S | 0
 arch/s390/{ => lib}/crypto/chacha-s390.h | 0
 lib/crypto/Kconfig                       | 3 +++
 9 files changed, 15 insertions(+), 9 deletions(-)
 create mode 100644 arch/s390/lib/crypto/Kconfig
 create mode 100644 arch/s390/lib/crypto/Makefile
 rename arch/s390/{ => lib}/crypto/chacha-glue.c (100%)
 rename arch/s390/{ => lib}/crypto/chacha-s390.S (100%)
 rename arch/s390/{ => lib}/crypto/chacha-s390.h (100%)

diff --git a/arch/s390/crypto/Kconfig b/arch/s390/crypto/Kconfig
index e88d9cd256ef5..a2bfd6eef0ca3 100644
--- a/arch/s390/crypto/Kconfig
+++ b/arch/s390/crypto/Kconfig
@@ -97,16 +97,10 @@ config CRYPTO_DES_S390
 	  Architecture: s390
 
 	  As of z990 the ECB and CBC mode are hardware accelerated.
 	  As of z196 the CTR mode is hardware accelerated.
 
-config CRYPTO_CHACHA_S390
-	tristate
-	select CRYPTO_LIB_CHACHA_GENERIC
-	select CRYPTO_ARCH_HAVE_LIB_CHACHA
-	default CRYPTO_LIB_CHACHA_INTERNAL
-
 config CRYPTO_HMAC_S390
 	tristate "Keyed-hash message authentication code: HMAC"
 	select CRYPTO_HASH
 	help
 	  s390 specific HMAC hardware support for SHA224, SHA256, SHA384 and
diff --git a/arch/s390/crypto/Makefile b/arch/s390/crypto/Makefile
index 14dafadbcbed4..e3853774e1a3a 100644
--- a/arch/s390/crypto/Makefile
+++ b/arch/s390/crypto/Makefile
@@ -9,12 +9,9 @@ obj-$(CONFIG_CRYPTO_SHA512_S390) += sha512_s390.o sha_common.o
 obj-$(CONFIG_CRYPTO_SHA3_256_S390) += sha3_256_s390.o sha_common.o
 obj-$(CONFIG_CRYPTO_SHA3_512_S390) += sha3_512_s390.o sha_common.o
 obj-$(CONFIG_CRYPTO_DES_S390) += des_s390.o
 obj-$(CONFIG_CRYPTO_AES_S390) += aes_s390.o
 obj-$(CONFIG_CRYPTO_PAES_S390) += paes_s390.o
-obj-$(CONFIG_CRYPTO_CHACHA_S390) += chacha_s390.o
 obj-$(CONFIG_S390_PRNG) += prng.o
 obj-$(CONFIG_CRYPTO_GHASH_S390) += ghash_s390.o
 obj-$(CONFIG_CRYPTO_HMAC_S390) += hmac_s390.o
 obj-y += arch_random.o
-
-chacha_s390-y := chacha-glue.o chacha-s390.o
diff --git a/arch/s390/lib/Makefile b/arch/s390/lib/Makefile
index 14bbfe50033c7..fce4edbe8a078 100644
--- a/arch/s390/lib/Makefile
+++ b/arch/s390/lib/Makefile
@@ -1,10 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Makefile for s390-specific library files..
 #
 
+obj-y += crypto/
 lib-y += delay.o string.o uaccess.o find.o spinlock.o tishift.o
 lib-y += csum-partial.o
 obj-y += mem.o xor.o
 lib-$(CONFIG_KPROBES) += probes.o
 lib-$(CONFIG_UPROBES) += probes.o
diff --git a/arch/s390/lib/crypto/Kconfig b/arch/s390/lib/crypto/Kconfig
new file mode 100644
index 0000000000000..b79fd91af9fe1
--- /dev/null
+++ b/arch/s390/lib/crypto/Kconfig
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config CRYPTO_CHACHA_S390
+	tristate
+	default CRYPTO_LIB_CHACHA_INTERNAL
+	select CRYPTO_LIB_CHACHA_GENERIC
+	select CRYPTO_ARCH_HAVE_LIB_CHACHA
diff --git a/arch/s390/lib/crypto/Makefile b/arch/s390/lib/crypto/Makefile
new file mode 100644
index 0000000000000..06c2cf77178ef
--- /dev/null
+++ b/arch/s390/lib/crypto/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_CRYPTO_CHACHA_S390) += chacha_s390.o
+chacha_s390-y := chacha-glue.o chacha-s390.o
diff --git a/arch/s390/crypto/chacha-glue.c b/arch/s390/lib/crypto/chacha-glue.c
similarity index 100%
rename from arch/s390/crypto/chacha-glue.c
rename to arch/s390/lib/crypto/chacha-glue.c
diff --git a/arch/s390/crypto/chacha-s390.S b/arch/s390/lib/crypto/chacha-s390.S
similarity index 100%
rename from arch/s390/crypto/chacha-s390.S
rename to arch/s390/lib/crypto/chacha-s390.S
diff --git a/arch/s390/crypto/chacha-s390.h b/arch/s390/lib/crypto/chacha-s390.h
similarity index 100%
rename from arch/s390/crypto/chacha-s390.h
rename to arch/s390/lib/crypto/chacha-s390.h
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 0b06c25eb38a5..db19a7acc2fbf 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -169,8 +169,11 @@ if PPC
 source "arch/powerpc/lib/crypto/Kconfig"
 endif
 if RISCV
 source "arch/riscv/lib/crypto/Kconfig"
 endif
+if S390
+source "arch/s390/lib/crypto/Kconfig"
+endif
 endif
 
 endmenu
-- 
2.49.0


