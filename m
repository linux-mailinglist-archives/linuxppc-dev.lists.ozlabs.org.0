Return-Path: <linuxppc-dev+bounces-9055-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 983DAACA0BA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jun 2025 00:46:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b9XBc1S23z2xd5;
	Mon,  2 Jun 2025 08:46:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748817960;
	cv=none; b=ShXnkEhMBndD3wUpSj7SD2/CQSdr+xv2ExpLUDLJOw3b4IujBZeMvNaL7mF3S4blLW1v2WmKLYtFgGeYiANf2ZRzYl4x3N9EGrzSrO2wdjeNieyUI5dsrnLroYIlrjG/6mhUKjnXbRnPJUySROKVnqnCZ1zWJmHh1bzpBh24IGuTbYHFRE+ESOTKjJTn8Cpuaqt/n+HEZRWnYIYbsDt6BUDbcIOFU26rd5D/8ofaPXXE5zb7tI5J+dFt79wIsi0PH6RBaxfZtFC9Q1O2Hr/bdsVKfJ2hTJvmqS6ADKjjvO1cRmIBjS7rS9BU/x4qOTrE31bYKSECwQMzzxHjsiFuDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748817960; c=relaxed/relaxed;
	bh=21rXFIz4QtGMQ1+rDMEYiKH8CEZXaVScaXVV6Uc4nhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dpgMKZMD3gboYzVQ9HMqwqDl+XYg7Zr7sdbXtNTg6FpRQz/i7GAf3a0sHo/+dgAB9b22yWJ7GI7e7OrBdegqUS95j50ZBmxOo8TINxyyLGY7cQNV7lv+N9ZNKXq6852izIKt18G6cqgYkh73ZLspdaJkJ4G5PGe0mHGHAZmjOMTjF/wOLdmMhLJ2b2WyuttBD4XO6WGtvR3hbBHxTpZNIRx4TnEJGtHE461arG3m6Jft72vTQ8IMH1yJEfqeQ6plvVnqnEP4fFIAsjyHUBS/Vn6oATkHjkQmJz16fGQMObtN7Scg6l8T7yWSQYgJILolXYKYOUJxSC6Wcot3phslTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pz+DFv84; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pz+DFv84;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b9XBX3zBwz2xGw
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Jun 2025 08:45:56 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B2ED84A8B7;
	Sun,  1 Jun 2025 22:45:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F07EC4AF0C;
	Sun,  1 Jun 2025 22:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748817954;
	bh=n02zpmiKFoZCFseh0go3tL+B28l1c/RKe0UcUZvIUPU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pz+DFv84GlPqBaQzPmtnVnqB9ixuVmKdzCU/KW+UhCtBiaEdlTTHMj7hCpJ50o0DV
	 3wqzFLjNboGqMH8jDK420YbG+Sz07wknsXCpkVnOiREJMMdKcIvzH/ZeYFoHdGi3GA
	 LmOKWrQOjWgP/q2YDdK/o1WXAzanaX1r0uiHy5zttbKr60OCF2EihyVsprf5xeTn0B
	 Y8/p/zCxXES4PW4Y4AA+QG00iOX7cKylWQSD8a1yZQQBRNAk7qGDwCa2leJEXnB6Es
	 wTVc5XY7f4DtGgiVoOdjGT9Hlx4t8fZ8s9vRcDdA8s43aeR5rVnggY1pmkfWEgPbw/
	 u8mpkAxEBA6+w==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 03/13] lib/crc: move files into lib/crc/
Date: Sun,  1 Jun 2025 15:44:31 -0700
Message-ID: <20250601224441.778374-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250601224441.778374-1-ebiggers@kernel.org>
References: <20250601224441.778374-1-ebiggers@kernel.org>
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

Move all CRC files in lib/ into a subdirectory lib/crc/ to keep them
from cluttering up the main lib/ directory.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 Documentation/core-api/kernel-api.rst |  14 ++--
 MAINTAINERS                           |   3 +-
 include/linux/crc64.h                 |   3 -
 lib/Kconfig                           |  87 +-------------------
 lib/Kconfig.debug                     |  21 -----
 lib/Makefile                          |  32 +-------
 lib/crc/.gitignore                    |   5 ++
 lib/crc/Kconfig                       | 111 ++++++++++++++++++++++++++
 lib/crc/Makefile                      |  32 ++++++++
 lib/{ => crc}/crc-ccitt.c             |   3 -
 lib/{ => crc}/crc-itu-t.c             |   0
 lib/{ => crc}/crc-t10dif.c            |   0
 lib/{ => crc}/crc16.c                 |   0
 lib/{ => crc}/crc32.c                 |   0
 lib/{ => crc}/crc4.c                  |   0
 lib/{ => crc}/crc64.c                 |   0
 lib/{ => crc}/crc7.c                  |   0
 lib/{ => crc}/crc8.c                  |   0
 lib/{ => crc}/gen_crc32table.c        |   4 +-
 lib/{ => crc}/gen_crc64table.c        |  11 +--
 lib/crc/tests/Makefile                |   2 +
 lib/{ => crc}/tests/crc_kunit.c       |   0
 lib/tests/Makefile                    |   1 -
 23 files changed, 164 insertions(+), 165 deletions(-)
 create mode 100644 lib/crc/.gitignore
 create mode 100644 lib/crc/Kconfig
 create mode 100644 lib/crc/Makefile
 rename lib/{ => crc}/crc-ccitt.c (98%)
 rename lib/{ => crc}/crc-itu-t.c (100%)
 rename lib/{ => crc}/crc-t10dif.c (100%)
 rename lib/{ => crc}/crc16.c (100%)
 rename lib/{ => crc}/crc32.c (100%)
 rename lib/{ => crc}/crc4.c (100%)
 rename lib/{ => crc}/crc64.c (100%)
 rename lib/{ => crc}/crc7.c (100%)
 rename lib/{ => crc}/crc8.c (100%)
 rename lib/{ => crc}/gen_crc32table.c (95%)
 rename lib/{ => crc}/gen_crc64table.c (81%)
 create mode 100644 lib/crc/tests/Makefile
 rename lib/{ => crc}/tests/crc_kunit.c (100%)

diff --git a/Documentation/core-api/kernel-api.rst b/Documentation/core-api/kernel-api.rst
index ae92a2571388a..c4642d9f13a9c 100644
--- a/Documentation/core-api/kernel-api.rst
+++ b/Documentation/core-api/kernel-api.rst
@@ -134,28 +134,28 @@ Arithmetic Overflow Checking
    :internal:
 
 CRC Functions
 -------------
 
-.. kernel-doc:: lib/crc4.c
+.. kernel-doc:: lib/crc/crc4.c
    :export:
 
-.. kernel-doc:: lib/crc7.c
+.. kernel-doc:: lib/crc/crc7.c
    :export:
 
-.. kernel-doc:: lib/crc8.c
+.. kernel-doc:: lib/crc/crc8.c
    :export:
 
-.. kernel-doc:: lib/crc16.c
+.. kernel-doc:: lib/crc/crc16.c
    :export:
 
-.. kernel-doc:: lib/crc32.c
+.. kernel-doc:: lib/crc/crc32.c
 
-.. kernel-doc:: lib/crc-ccitt.c
+.. kernel-doc:: lib/crc/crc-ccitt.c
    :export:
 
-.. kernel-doc:: lib/crc-itu-t.c
+.. kernel-doc:: lib/crc/crc-itu-t.c
    :export:
 
 Base 2 log and power Functions
 ------------------------------
 
diff --git a/MAINTAINERS b/MAINTAINERS
index 75da23034e18d..724f46458a480 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6335,12 +6335,11 @@ L:	linux-crypto@vger.kernel.org
 S:	Maintained
 T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc-next
 F:	Documentation/staging/crc*
 F:	arch/*/lib/crc*
 F:	include/linux/crc*
-F:	lib/crc*
-F:	lib/tests/crc_kunit.c
+F:	lib/crc/
 F:	scripts/gen-crc-consts.py
 
 CREATIVE SB0540
 M:	Bastien Nocera <hadess@hadess.net>
 L:	linux-input@vger.kernel.org
diff --git a/include/linux/crc64.h b/include/linux/crc64.h
index 41de30b907dff..b6aa290a79312 100644
--- a/include/linux/crc64.h
+++ b/include/linux/crc64.h
@@ -1,9 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/*
- * See lib/crc64.c for the related specification and polynomial arithmetic.
- */
 #ifndef _LINUX_CRC64_H
 #define _LINUX_CRC64_H
 
 #include <linux/types.h>
 
diff --git a/lib/Kconfig b/lib/Kconfig
index 6c1b8f1842678..3db88ab0d2b4c 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -134,98 +134,13 @@ config TRACE_MMIO_ACCESS
 	depends on TRACING && ARCH_HAVE_TRACE_MMIO_ACCESS
 	help
 	  Create tracepoints for MMIO read/write operations. These trace events
 	  can be used for logging all MMIO read/write operations.
 
+source "lib/crc/Kconfig"
 source "lib/crypto/Kconfig"
 
-config CRC_CCITT
-	tristate
-	help
-	  The CRC-CCITT library functions.  Select this if your module uses any
-	  of the functions from <linux/crc-ccitt.h>.
-
-config CRC16
-	tristate
-	help
-	  The CRC16 library functions.  Select this if your module uses any of
-	  the functions from <linux/crc16.h>.
-
-config CRC_T10DIF
-	tristate
-	help
-	  The CRC-T10DIF library functions.  Select this if your module uses
-	  any of the functions from <linux/crc-t10dif.h>.
-
-config ARCH_HAS_CRC_T10DIF
-	bool
-
-config CRC_T10DIF_ARCH
-	tristate
-	default CRC_T10DIF if ARCH_HAS_CRC_T10DIF && CRC_OPTIMIZATIONS
-
-config CRC_ITU_T
-	tristate
-	help
-	  The CRC-ITU-T library functions.  Select this if your module uses
-	  any of the functions from <linux/crc-itu-t.h>.
-
-config CRC32
-	tristate
-	select BITREVERSE
-	help
-	  The CRC32 library functions.  Select this if your module uses any of
-	  the functions from <linux/crc32.h> or <linux/crc32c.h>.
-
-config ARCH_HAS_CRC32
-	bool
-
-config CRC32_ARCH
-	tristate
-	default CRC32 if ARCH_HAS_CRC32 && CRC_OPTIMIZATIONS
-
-config CRC64
-	tristate
-	help
-	  The CRC64 library functions.  Select this if your module uses any of
-	  the functions from <linux/crc64.h>.
-
-config ARCH_HAS_CRC64
-	bool
-
-config CRC64_ARCH
-	tristate
-	default CRC64 if ARCH_HAS_CRC64 && CRC_OPTIMIZATIONS
-
-config CRC4
-	tristate
-	help
-	  The CRC4 library functions.  Select this if your module uses any of
-	  the functions from <linux/crc4.h>.
-
-config CRC7
-	tristate
-	help
-	  The CRC7 library functions.  Select this if your module uses any of
-	  the functions from <linux/crc7.h>.
-
-config CRC8
-	tristate
-	help
-	  The CRC8 library functions.  Select this if your module uses any of
-	  the functions from <linux/crc8.h>.
-
-config CRC_OPTIMIZATIONS
-	bool "Enable optimized CRC implementations" if EXPERT
-	default y
-	help
-	  Disabling this option reduces code size slightly by disabling the
-	  architecture-optimized implementations of any CRC variants that are
-	  enabled.  CRC checksumming performance may get much slower.
-
-	  Keep this enabled unless you're really trying to minimize the size of
-	  the kernel.
 
 config XXHASH
 	tristate
 
 config AUDIT_GENERIC
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index ebe33181b6e6e..3fda96761adbc 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2899,31 +2899,10 @@ config HW_BREAKPOINT_KUNIT_TEST
 	help
 	  Tests for hw_breakpoint constraints accounting.
 
 	  If unsure, say N.
 
-config CRC_KUNIT_TEST
-	tristate "KUnit tests for CRC functions" if !KUNIT_ALL_TESTS
-	depends on KUNIT
-	default KUNIT_ALL_TESTS
-	select CRC7
-	select CRC16
-	select CRC_T10DIF
-	select CRC32
-	select CRC64
-	help
-	  Unit tests for the CRC library functions.
-
-	  This is intended to help people writing architecture-specific
-	  optimized versions.  If unsure, say N.
-
-config CRC_BENCHMARK
-	bool "Benchmark for the CRC functions"
-	depends on CRC_KUNIT_TEST
-	help
-	  Include benchmarks in the KUnit test suite for the CRC functions.
-
 config SIPHASH_KUNIT_TEST
 	tristate "Perform selftest on siphash functions" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
 	help
diff --git a/lib/Makefile b/lib/Makefile
index c38582f187dd8..14a5928bb57f5 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -120,11 +120,11 @@ CFLAGS_kobject_uevent.o += -DDEBUG
 endif
 
 obj-$(CONFIG_DEBUG_INFO_REDUCED) += debug_info.o
 CFLAGS_debug_info.o += $(call cc-option, -femit-struct-debug-detailed=any)
 
-obj-y += math/ crypto/ tests/ vdso/
+obj-y += math/ crc/ crypto/ tests/ vdso/
 
 obj-$(CONFIG_GENERIC_IOMAP) += iomap.o
 obj-$(CONFIG_HAS_IOMEM) += iomap_copy.o devres.o
 obj-$(CONFIG_CHECK_SIGNATURE) += check_signature.o
 obj-$(CONFIG_DEBUG_LOCKING_API_SELFTESTS) += locking-selftest.o
@@ -146,19 +146,10 @@ obj-$(CONFIG_DEBUG_OBJECTS) += debugobjects.o
 
 obj-$(CONFIG_BITREVERSE) += bitrev.o
 obj-$(CONFIG_LINEAR_RANGES) += linear_ranges.o
 obj-$(CONFIG_PACKING)	+= packing.o
 obj-$(CONFIG_PACKING_KUNIT_TEST) += packing_test.o
-obj-$(CONFIG_CRC_CCITT)	+= crc-ccitt.o
-obj-$(CONFIG_CRC16)	+= crc16.o
-obj-$(CONFIG_CRC_T10DIF)+= crc-t10dif.o
-obj-$(CONFIG_CRC_ITU_T)	+= crc-itu-t.o
-obj-$(CONFIG_CRC32)	+= crc32.o
-obj-$(CONFIG_CRC64)     += crc64.o
-obj-$(CONFIG_CRC4)	+= crc4.o
-obj-$(CONFIG_CRC7)	+= crc7.o
-obj-$(CONFIG_CRC8)	+= crc8.o
 obj-$(CONFIG_XXHASH)	+= xxhash.o
 obj-$(CONFIG_GENERIC_ALLOCATOR) += genalloc.o
 
 obj-$(CONFIG_842_COMPRESS) += 842/
 obj-$(CONFIG_842_DECOMPRESS) += 842/
@@ -292,31 +283,10 @@ obj-$(CONFIG_PERCPU_TEST) += percpu_test.o
 obj-$(CONFIG_ASN1) += asn1_decoder.o
 obj-$(CONFIG_ASN1_ENCODER) += asn1_encoder.o
 
 obj-$(CONFIG_FONT_SUPPORT) += fonts/
 
-hostprogs	:= gen_crc32table
-hostprogs	+= gen_crc64table
-clean-files	:= crc32table.h
-clean-files	+= crc64table.h
-
-$(obj)/crc32.o: $(obj)/crc32table.h
-
-quiet_cmd_crc32 = GEN     $@
-      cmd_crc32 = $< > $@
-
-$(obj)/crc32table.h: $(obj)/gen_crc32table
-	$(call cmd,crc32)
-
-$(obj)/crc64.o: $(obj)/crc64table.h
-
-quiet_cmd_crc64 = GEN     $@
-      cmd_crc64 = $< > $@
-
-$(obj)/crc64table.h: $(obj)/gen_crc64table
-	$(call cmd,crc64)
-
 #
 # Build a fast OID lookip registry from include/linux/oid_registry.h
 #
 obj-$(CONFIG_OID_REGISTRY) += oid_registry.o
 
diff --git a/lib/crc/.gitignore b/lib/crc/.gitignore
new file mode 100644
index 0000000000000..a9e48103c9fb1
--- /dev/null
+++ b/lib/crc/.gitignore
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-only
+/crc32table.h
+/crc64table.h
+/gen_crc32table
+/gen_crc64table
diff --git a/lib/crc/Kconfig b/lib/crc/Kconfig
new file mode 100644
index 0000000000000..e0e7168b74c75
--- /dev/null
+++ b/lib/crc/Kconfig
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+# Kconfig for the kernel's cyclic redundancy check (CRC) library code
+
+config CRC4
+	tristate
+	help
+	  The CRC4 library functions.  Select this if your module uses any of
+	  the functions from <linux/crc4.h>.
+
+config CRC7
+	tristate
+	help
+	  The CRC7 library functions.  Select this if your module uses any of
+	  the functions from <linux/crc7.h>.
+
+config CRC8
+	tristate
+	help
+	  The CRC8 library functions.  Select this if your module uses any of
+	  the functions from <linux/crc8.h>.
+
+config CRC16
+	tristate
+	help
+	  The CRC16 library functions.  Select this if your module uses any of
+	  the functions from <linux/crc16.h>.
+
+config CRC_CCITT
+	tristate
+	help
+	  The CRC-CCITT library functions.  Select this if your module uses any
+	  of the functions from <linux/crc-ccitt.h>.
+
+config CRC_ITU_T
+	tristate
+	help
+	  The CRC-ITU-T library functions.  Select this if your module uses
+	  any of the functions from <linux/crc-itu-t.h>.
+
+config CRC_T10DIF
+	tristate
+	help
+	  The CRC-T10DIF library functions.  Select this if your module uses
+	  any of the functions from <linux/crc-t10dif.h>.
+
+config ARCH_HAS_CRC_T10DIF
+	bool
+
+config CRC_T10DIF_ARCH
+	tristate
+	default CRC_T10DIF if ARCH_HAS_CRC_T10DIF && CRC_OPTIMIZATIONS
+
+config CRC32
+	tristate
+	select BITREVERSE
+	help
+	  The CRC32 library functions.  Select this if your module uses any of
+	  the functions from <linux/crc32.h> or <linux/crc32c.h>.
+
+config ARCH_HAS_CRC32
+	bool
+
+config CRC32_ARCH
+	tristate
+	default CRC32 if ARCH_HAS_CRC32 && CRC_OPTIMIZATIONS
+
+config CRC64
+	tristate
+	help
+	  The CRC64 library functions.  Select this if your module uses any of
+	  the functions from <linux/crc64.h>.
+
+config ARCH_HAS_CRC64
+	bool
+
+config CRC64_ARCH
+	tristate
+	default CRC64 if ARCH_HAS_CRC64 && CRC_OPTIMIZATIONS
+
+config CRC_OPTIMIZATIONS
+	bool "Enable optimized CRC implementations" if EXPERT
+	default y
+	help
+	  Disabling this option reduces code size slightly by disabling the
+	  architecture-optimized implementations of any CRC variants that are
+	  enabled.  CRC checksumming performance may get much slower.
+
+	  Keep this enabled unless you're really trying to minimize the size of
+	  the kernel.
+
+config CRC_KUNIT_TEST
+	tristate "KUnit tests for CRC functions" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	select CRC7
+	select CRC16
+	select CRC_T10DIF
+	select CRC32
+	select CRC64
+	help
+	  Unit tests for the CRC library functions.
+
+	  This is intended to help people writing architecture-specific
+	  optimized versions.  If unsure, say N.
+
+config CRC_BENCHMARK
+	bool "Benchmark for the CRC functions"
+	depends on CRC_KUNIT_TEST
+	help
+	  Include benchmarks in the KUnit test suite for the CRC functions.
diff --git a/lib/crc/Makefile b/lib/crc/Makefile
new file mode 100644
index 0000000000000..ff4c30dda4528
--- /dev/null
+++ b/lib/crc/Makefile
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+# Makefile for the kernel's cyclic redundancy check (CRC) library code
+
+obj-$(CONFIG_CRC4) += crc4.o
+obj-$(CONFIG_CRC7) += crc7.o
+obj-$(CONFIG_CRC8) += crc8.o
+obj-$(CONFIG_CRC16) += crc16.o
+obj-$(CONFIG_CRC_CCITT) += crc-ccitt.o
+obj-$(CONFIG_CRC_ITU_T) += crc-itu-t.o
+obj-$(CONFIG_CRC_T10DIF) += crc-t10dif.o
+obj-$(CONFIG_CRC32) += crc32.o
+obj-$(CONFIG_CRC64) += crc64.o
+obj-y += tests/
+
+hostprogs := gen_crc32table gen_crc64table
+clean-files := crc32table.h crc64table.h
+
+$(obj)/crc32.o: $(obj)/crc32table.h
+$(obj)/crc64.o: $(obj)/crc64table.h
+
+quiet_cmd_crc32 = GEN     $@
+      cmd_crc32 = $< > $@
+
+quiet_cmd_crc64 = GEN     $@
+      cmd_crc64 = $< > $@
+
+$(obj)/crc32table.h: $(obj)/gen_crc32table
+	$(call cmd,crc32)
+
+$(obj)/crc64table.h: $(obj)/gen_crc64table
+	$(call cmd,crc64)
diff --git a/lib/crc-ccitt.c b/lib/crc/crc-ccitt.c
similarity index 98%
rename from lib/crc-ccitt.c
rename to lib/crc/crc-ccitt.c
index 9cddf35d3b66e..8d2bc419230b3 100644
--- a/lib/crc-ccitt.c
+++ b/lib/crc/crc-ccitt.c
@@ -1,9 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/*
- *	linux/lib/crc-ccitt.c
- */
 
 #include <linux/types.h>
 #include <linux/module.h>
 #include <linux/crc-ccitt.h>
 
diff --git a/lib/crc-itu-t.c b/lib/crc/crc-itu-t.c
similarity index 100%
rename from lib/crc-itu-t.c
rename to lib/crc/crc-itu-t.c
diff --git a/lib/crc-t10dif.c b/lib/crc/crc-t10dif.c
similarity index 100%
rename from lib/crc-t10dif.c
rename to lib/crc/crc-t10dif.c
diff --git a/lib/crc16.c b/lib/crc/crc16.c
similarity index 100%
rename from lib/crc16.c
rename to lib/crc/crc16.c
diff --git a/lib/crc32.c b/lib/crc/crc32.c
similarity index 100%
rename from lib/crc32.c
rename to lib/crc/crc32.c
diff --git a/lib/crc4.c b/lib/crc/crc4.c
similarity index 100%
rename from lib/crc4.c
rename to lib/crc/crc4.c
diff --git a/lib/crc64.c b/lib/crc/crc64.c
similarity index 100%
rename from lib/crc64.c
rename to lib/crc/crc64.c
diff --git a/lib/crc7.c b/lib/crc/crc7.c
similarity index 100%
rename from lib/crc7.c
rename to lib/crc/crc7.c
diff --git a/lib/crc8.c b/lib/crc/crc8.c
similarity index 100%
rename from lib/crc8.c
rename to lib/crc/crc8.c
diff --git a/lib/gen_crc32table.c b/lib/crc/gen_crc32table.c
similarity index 95%
rename from lib/gen_crc32table.c
rename to lib/crc/gen_crc32table.c
index 6d03425b849e4..9a7f31658e355 100644
--- a/lib/gen_crc32table.c
+++ b/lib/crc/gen_crc32table.c
@@ -1,9 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <stdio.h>
-#include "../include/linux/crc32poly.h"
-#include "../include/generated/autoconf.h"
+#include "../../include/linux/crc32poly.h"
+#include "../../include/generated/autoconf.h"
 #include <inttypes.h>
 
 static uint32_t crc32table_le[256];
 static uint32_t crc32table_be[256];
 static uint32_t crc32ctable_le[256];
diff --git a/lib/gen_crc64table.c b/lib/crc/gen_crc64table.c
similarity index 81%
rename from lib/gen_crc64table.c
rename to lib/crc/gen_crc64table.c
index e05a4230a0a08..f2be9f62bab71 100644
--- a/lib/gen_crc64table.c
+++ b/lib/crc/gen_crc64table.c
@@ -1,16 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Generate lookup table for the table-driven CRC64 calculation.
- *
- * gen_crc64table is executed in kernel build time and generates
- * lib/crc64table.h. This header is included by lib/crc64.c for
- * the table-driven CRC64 calculation.
- *
- * See lib/crc64.c for more information about which specification
- * and polynomial arithmetic that gen_crc64table.c follows to
- * generate the lookup table.
+ * This host program runs at kernel build time and generates the lookup tables
+ * used by the generic CRC64 code.
  *
  * Copyright 2018 SUSE Linux.
  *   Author: Coly Li <colyli@suse.de>
  */
 #include <inttypes.h>
diff --git a/lib/crc/tests/Makefile b/lib/crc/tests/Makefile
new file mode 100644
index 0000000000000..65f63c318ef5e
--- /dev/null
+++ b/lib/crc/tests/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_CRC_KUNIT_TEST) += crc_kunit.o
diff --git a/lib/tests/crc_kunit.c b/lib/crc/tests/crc_kunit.c
similarity index 100%
rename from lib/tests/crc_kunit.c
rename to lib/crc/tests/crc_kunit.c
diff --git a/lib/tests/Makefile b/lib/tests/Makefile
index 56d6450144828..741d3ac2cba25 100644
--- a/lib/tests/Makefile
+++ b/lib/tests/Makefile
@@ -8,11 +8,10 @@ obj-$(CONFIG_BITFIELD_KUNIT) += bitfield_kunit.o
 obj-$(CONFIG_BITS_TEST) += test_bits.o
 obj-$(CONFIG_BLACKHOLE_DEV_KUNIT_TEST) += blackhole_dev_kunit.o
 obj-$(CONFIG_CHECKSUM_KUNIT) += checksum_kunit.o
 obj-$(CONFIG_CMDLINE_KUNIT_TEST) += cmdline_kunit.o
 obj-$(CONFIG_CPUMASK_KUNIT_TEST) += cpumask_kunit.o
-obj-$(CONFIG_CRC_KUNIT_TEST) += crc_kunit.o
 CFLAGS_fortify_kunit.o += $(call cc-disable-warning, unsequenced)
 CFLAGS_fortify_kunit.o += $(call cc-disable-warning, stringop-overread)
 CFLAGS_fortify_kunit.o += $(call cc-disable-warning, stringop-truncation)
 CFLAGS_fortify_kunit.o += $(DISABLE_STRUCTLEAK_PLUGIN)
 obj-$(CONFIG_FORTIFY_KUNIT_TEST) += fortify_kunit.o
-- 
2.49.0


