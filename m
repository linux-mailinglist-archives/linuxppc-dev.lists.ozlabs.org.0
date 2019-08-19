Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAF791D11
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 08:30:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46BkYj10F2zDqxG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 16:30:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="XDJIYUfq"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46BkWt3z64zDqwp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 16:28:23 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id g2so571382pfq.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Aug 2019 23:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2QchgQKPhfgnzyJjz7DvkZyOhG/B9Buywq3Uf73BFlU=;
 b=XDJIYUfqQm1mTQ70rdxFY3tIjTDawvczVNoJjZ2XqAh5Elhcj80YflNG7BQzaYMMbp
 gC5Z2Q23iJYjEJP7CUrZZMoty3MbTBelVitZqBB/NIOq0+89hyW3ko68ZuZwCmisVkzh
 GF9QZROb2pZYQ58y5njQp8jWWWrQm68OcFs3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2QchgQKPhfgnzyJjz7DvkZyOhG/B9Buywq3Uf73BFlU=;
 b=Aqd9z8iSgIYCYIYOnLh7k8IEUgBc9RH191zvDy+eZvC4X4DLUMZY3mGrUtQvNVv1yb
 0f557DvR0G+lp2BayXBi1eTaDtPXGZsZEnHqE95772FZ3UiEJibMlpXL4SFbdvHfYwuo
 UkjLkrX/49KRNz/uo2xajc9g6Hnq/G1BvNQCZQGu16t53I+32m8vl/4Ho1rzD0DXww6y
 68g5QIFaYYXQGTJWYWbymRRxr5M/XAS5FS+roqwnIU0/O96gA7OT86ZDuOOljL0V/48g
 A6N3+LK0dwphsDqjT1trWVI9Tp9j3sIZQDpgVXqTTtbPiSyzghyq1pYQ3WX1ZMMTcdrs
 P6JQ==
X-Gm-Message-State: APjAAAUJqW3kzn0UHCS8AFdTPnUFM/hkvbIPxOzbmsXtiHBqOFRJF5xF
 4wQeWRFRFB7K1T8J9UDuy4HLMQ==
X-Google-Smtp-Source: APXvYqyViH1Gv3/gebWA4yyG7JjmTbwEolDo7L/6xqlG/0dWKQ8mcaZMSDG5L7ZVasyPDHbfZIGwXA==
X-Received: by 2002:a62:7641:: with SMTP id r62mr21713543pfc.201.1566196100186; 
 Sun, 18 Aug 2019 23:28:20 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id z19sm12879234pgv.35.2019.08.18.23.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Aug 2019 23:28:19 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: christophe.leroy@c-s.fr, linux-s390@vger.kernel.org,
 linux-arch@vger.kernel.org, x86@kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] kasan: support instrumented bitops combined with generic
 bitops
Date: Mon, 19 Aug 2019 16:28:13 +1000
Message-Id: <20190819062814.5315-1-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: kasan-dev@googlegroups.com, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently bitops-instrumented.h assumes that the architecture provides
atomic, non-atomic and locking bitops (e.g. both set_bit and __set_bit).
This is true on x86 and s390, but is not always true: there is a
generic bitops/non-atomic.h header that provides generic non-atomic
operations, and also a generic bitops/lock.h for locking operations.

powerpc uses the generic non-atomic version, so it does not have it's
own e.g. __set_bit that could be renamed arch___set_bit.

Split up bitops-instrumented.h to mirror the atomic/non-atomic/lock
split. This allows arches to only include the headers where they
have arch-specific versions to rename. Update x86 and s390.

(The generic operations are automatically instrumented because they're
written in C, not asm.)

Suggested-by: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 Documentation/core-api/kernel-api.rst         |  17 +-
 arch/s390/include/asm/bitops.h                |   4 +-
 arch/x86/include/asm/bitops.h                 |   4 +-
 include/asm-generic/bitops-instrumented.h     | 263 ------------------
 .../asm-generic/bitops/instrumented-atomic.h  | 100 +++++++
 .../asm-generic/bitops/instrumented-lock.h    |  81 ++++++
 .../bitops/instrumented-non-atomic.h          | 114 ++++++++
 7 files changed, 317 insertions(+), 266 deletions(-)
 delete mode 100644 include/asm-generic/bitops-instrumented.h
 create mode 100644 include/asm-generic/bitops/instrumented-atomic.h
 create mode 100644 include/asm-generic/bitops/instrumented-lock.h
 create mode 100644 include/asm-generic/bitops/instrumented-non-atomic.h

diff --git a/Documentation/core-api/kernel-api.rst b/Documentation/core-api/kernel-api.rst
index 08af5caf036d..2e21248277e3 100644
--- a/Documentation/core-api/kernel-api.rst
+++ b/Documentation/core-api/kernel-api.rst
@@ -54,7 +54,22 @@ The Linux kernel provides more basic utility functions.
 Bit Operations
 --------------
 
-.. kernel-doc:: include/asm-generic/bitops-instrumented.h
+Atomic Operations
+~~~~~~~~~~~~~~~~~
+
+.. kernel-doc:: include/asm-generic/bitops/instrumented-atomic.h
+   :internal:
+
+Non-atomic Operations
+~~~~~~~~~~~~~~~~~~~~~
+
+.. kernel-doc:: include/asm-generic/bitops/instrumented-non-atomic.h
+   :internal:
+
+Locking Operations
+~~~~~~~~~~~~~~~~~~
+
+.. kernel-doc:: include/asm-generic/bitops/instrumented-lock.h
    :internal:
 
 Bitmap Operations
diff --git a/arch/s390/include/asm/bitops.h b/arch/s390/include/asm/bitops.h
index b8833ac983fa..0ceb12593a68 100644
--- a/arch/s390/include/asm/bitops.h
+++ b/arch/s390/include/asm/bitops.h
@@ -241,7 +241,9 @@ static inline void arch___clear_bit_unlock(unsigned long nr,
 	arch___clear_bit(nr, ptr);
 }
 
-#include <asm-generic/bitops-instrumented.h>
+#include <asm-generic/bitops/instrumented-atomic.h>
+#include <asm-generic/bitops/instrumented-non-atomic.h>
+#include <asm-generic/bitops/instrumented-lock.h>
 
 /*
  * Functions which use MSB0 bit numbering.
diff --git a/arch/x86/include/asm/bitops.h b/arch/x86/include/asm/bitops.h
index ba15d53c1ca7..4a2e2432238f 100644
--- a/arch/x86/include/asm/bitops.h
+++ b/arch/x86/include/asm/bitops.h
@@ -389,7 +389,9 @@ static __always_inline int fls64(__u64 x)
 
 #include <asm-generic/bitops/const_hweight.h>
 
-#include <asm-generic/bitops-instrumented.h>
+#include <asm-generic/bitops/instrumented-atomic.h>
+#include <asm-generic/bitops/instrumented-non-atomic.h>
+#include <asm-generic/bitops/instrumented-lock.h>
 
 #include <asm-generic/bitops/le.h>
 
diff --git a/include/asm-generic/bitops-instrumented.h b/include/asm-generic/bitops-instrumented.h
deleted file mode 100644
index ddd1c6d9d8db..000000000000
--- a/include/asm-generic/bitops-instrumented.h
+++ /dev/null
@@ -1,263 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-
-/*
- * This file provides wrappers with sanitizer instrumentation for bit
- * operations.
- *
- * To use this functionality, an arch's bitops.h file needs to define each of
- * the below bit operations with an arch_ prefix (e.g. arch_set_bit(),
- * arch___set_bit(), etc.).
- */
-#ifndef _ASM_GENERIC_BITOPS_INSTRUMENTED_H
-#define _ASM_GENERIC_BITOPS_INSTRUMENTED_H
-
-#include <linux/kasan-checks.h>
-
-/**
- * set_bit - Atomically set a bit in memory
- * @nr: the bit to set
- * @addr: the address to start counting from
- *
- * This is a relaxed atomic operation (no implied memory barriers).
- *
- * Note that @nr may be almost arbitrarily large; this function is not
- * restricted to acting on a single-word quantity.
- */
-static inline void set_bit(long nr, volatile unsigned long *addr)
-{
-	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
-	arch_set_bit(nr, addr);
-}
-
-/**
- * __set_bit - Set a bit in memory
- * @nr: the bit to set
- * @addr: the address to start counting from
- *
- * Unlike set_bit(), this function is non-atomic. If it is called on the same
- * region of memory concurrently, the effect may be that only one operation
- * succeeds.
- */
-static inline void __set_bit(long nr, volatile unsigned long *addr)
-{
-	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
-	arch___set_bit(nr, addr);
-}
-
-/**
- * clear_bit - Clears a bit in memory
- * @nr: Bit to clear
- * @addr: Address to start counting from
- *
- * This is a relaxed atomic operation (no implied memory barriers).
- */
-static inline void clear_bit(long nr, volatile unsigned long *addr)
-{
-	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
-	arch_clear_bit(nr, addr);
-}
-
-/**
- * __clear_bit - Clears a bit in memory
- * @nr: the bit to clear
- * @addr: the address to start counting from
- *
- * Unlike clear_bit(), this function is non-atomic. If it is called on the same
- * region of memory concurrently, the effect may be that only one operation
- * succeeds.
- */
-static inline void __clear_bit(long nr, volatile unsigned long *addr)
-{
-	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
-	arch___clear_bit(nr, addr);
-}
-
-/**
- * clear_bit_unlock - Clear a bit in memory, for unlock
- * @nr: the bit to set
- * @addr: the address to start counting from
- *
- * This operation is atomic and provides release barrier semantics.
- */
-static inline void clear_bit_unlock(long nr, volatile unsigned long *addr)
-{
-	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
-	arch_clear_bit_unlock(nr, addr);
-}
-
-/**
- * __clear_bit_unlock - Clears a bit in memory
- * @nr: Bit to clear
- * @addr: Address to start counting from
- *
- * This is a non-atomic operation but implies a release barrier before the
- * memory operation. It can be used for an unlock if no other CPUs can
- * concurrently modify other bits in the word.
- */
-static inline void __clear_bit_unlock(long nr, volatile unsigned long *addr)
-{
-	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
-	arch___clear_bit_unlock(nr, addr);
-}
-
-/**
- * change_bit - Toggle a bit in memory
- * @nr: Bit to change
- * @addr: Address to start counting from
- *
- * This is a relaxed atomic operation (no implied memory barriers).
- *
- * Note that @nr may be almost arbitrarily large; this function is not
- * restricted to acting on a single-word quantity.
- */
-static inline void change_bit(long nr, volatile unsigned long *addr)
-{
-	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
-	arch_change_bit(nr, addr);
-}
-
-/**
- * __change_bit - Toggle a bit in memory
- * @nr: the bit to change
- * @addr: the address to start counting from
- *
- * Unlike change_bit(), this function is non-atomic. If it is called on the same
- * region of memory concurrently, the effect may be that only one operation
- * succeeds.
- */
-static inline void __change_bit(long nr, volatile unsigned long *addr)
-{
-	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
-	arch___change_bit(nr, addr);
-}
-
-/**
- * test_and_set_bit - Set a bit and return its old value
- * @nr: Bit to set
- * @addr: Address to count from
- *
- * This is an atomic fully-ordered operation (implied full memory barrier).
- */
-static inline bool test_and_set_bit(long nr, volatile unsigned long *addr)
-{
-	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
-	return arch_test_and_set_bit(nr, addr);
-}
-
-/**
- * __test_and_set_bit - Set a bit and return its old value
- * @nr: Bit to set
- * @addr: Address to count from
- *
- * This operation is non-atomic. If two instances of this operation race, one
- * can appear to succeed but actually fail.
- */
-static inline bool __test_and_set_bit(long nr, volatile unsigned long *addr)
-{
-	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
-	return arch___test_and_set_bit(nr, addr);
-}
-
-/**
- * test_and_set_bit_lock - Set a bit and return its old value, for lock
- * @nr: Bit to set
- * @addr: Address to count from
- *
- * This operation is atomic and provides acquire barrier semantics if
- * the returned value is 0.
- * It can be used to implement bit locks.
- */
-static inline bool test_and_set_bit_lock(long nr, volatile unsigned long *addr)
-{
-	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
-	return arch_test_and_set_bit_lock(nr, addr);
-}
-
-/**
- * test_and_clear_bit - Clear a bit and return its old value
- * @nr: Bit to clear
- * @addr: Address to count from
- *
- * This is an atomic fully-ordered operation (implied full memory barrier).
- */
-static inline bool test_and_clear_bit(long nr, volatile unsigned long *addr)
-{
-	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
-	return arch_test_and_clear_bit(nr, addr);
-}
-
-/**
- * __test_and_clear_bit - Clear a bit and return its old value
- * @nr: Bit to clear
- * @addr: Address to count from
- *
- * This operation is non-atomic. If two instances of this operation race, one
- * can appear to succeed but actually fail.
- */
-static inline bool __test_and_clear_bit(long nr, volatile unsigned long *addr)
-{
-	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
-	return arch___test_and_clear_bit(nr, addr);
-}
-
-/**
- * test_and_change_bit - Change a bit and return its old value
- * @nr: Bit to change
- * @addr: Address to count from
- *
- * This is an atomic fully-ordered operation (implied full memory barrier).
- */
-static inline bool test_and_change_bit(long nr, volatile unsigned long *addr)
-{
-	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
-	return arch_test_and_change_bit(nr, addr);
-}
-
-/**
- * __test_and_change_bit - Change a bit and return its old value
- * @nr: Bit to change
- * @addr: Address to count from
- *
- * This operation is non-atomic. If two instances of this operation race, one
- * can appear to succeed but actually fail.
- */
-static inline bool __test_and_change_bit(long nr, volatile unsigned long *addr)
-{
-	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
-	return arch___test_and_change_bit(nr, addr);
-}
-
-/**
- * test_bit - Determine whether a bit is set
- * @nr: bit number to test
- * @addr: Address to start counting from
- */
-static inline bool test_bit(long nr, const volatile unsigned long *addr)
-{
-	kasan_check_read(addr + BIT_WORD(nr), sizeof(long));
-	return arch_test_bit(nr, addr);
-}
-
-#if defined(arch_clear_bit_unlock_is_negative_byte)
-/**
- * clear_bit_unlock_is_negative_byte - Clear a bit in memory and test if bottom
- *                                     byte is negative, for unlock.
- * @nr: the bit to clear
- * @addr: the address to start counting from
- *
- * This operation is atomic and provides release barrier semantics.
- *
- * This is a bit of a one-trick-pony for the filemap code, which clears
- * PG_locked and tests PG_waiters,
- */
-static inline bool
-clear_bit_unlock_is_negative_byte(long nr, volatile unsigned long *addr)
-{
-	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
-	return arch_clear_bit_unlock_is_negative_byte(nr, addr);
-}
-/* Let everybody know we have it. */
-#define clear_bit_unlock_is_negative_byte clear_bit_unlock_is_negative_byte
-#endif
-
-#endif /* _ASM_GENERIC_BITOPS_INSTRUMENTED_H */
diff --git a/include/asm-generic/bitops/instrumented-atomic.h b/include/asm-generic/bitops/instrumented-atomic.h
new file mode 100644
index 000000000000..18ce3c9e8eec
--- /dev/null
+++ b/include/asm-generic/bitops/instrumented-atomic.h
@@ -0,0 +1,100 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * This file provides wrappers with sanitizer instrumentation for atomic bit
+ * operations.
+ *
+ * To use this functionality, an arch's bitops.h file needs to define each of
+ * the below bit operations with an arch_ prefix (e.g. arch_set_bit(),
+ * arch___set_bit(), etc.).
+ */
+#ifndef _ASM_GENERIC_BITOPS_INSTRUMENTED_ATOMIC_H
+#define _ASM_GENERIC_BITOPS_INSTRUMENTED_ATOMIC_H
+
+#include <linux/kasan-checks.h>
+
+/**
+ * set_bit - Atomically set a bit in memory
+ * @nr: the bit to set
+ * @addr: the address to start counting from
+ *
+ * This is a relaxed atomic operation (no implied memory barriers).
+ *
+ * Note that @nr may be almost arbitrarily large; this function is not
+ * restricted to acting on a single-word quantity.
+ */
+static inline void set_bit(long nr, volatile unsigned long *addr)
+{
+	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
+	arch_set_bit(nr, addr);
+}
+
+/**
+ * clear_bit - Clears a bit in memory
+ * @nr: Bit to clear
+ * @addr: Address to start counting from
+ *
+ * This is a relaxed atomic operation (no implied memory barriers).
+ */
+static inline void clear_bit(long nr, volatile unsigned long *addr)
+{
+	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
+	arch_clear_bit(nr, addr);
+}
+
+/**
+ * change_bit - Toggle a bit in memory
+ * @nr: Bit to change
+ * @addr: Address to start counting from
+ *
+ * This is a relaxed atomic operation (no implied memory barriers).
+ *
+ * Note that @nr may be almost arbitrarily large; this function is not
+ * restricted to acting on a single-word quantity.
+ */
+static inline void change_bit(long nr, volatile unsigned long *addr)
+{
+	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
+	arch_change_bit(nr, addr);
+}
+
+/**
+ * test_and_set_bit - Set a bit and return its old value
+ * @nr: Bit to set
+ * @addr: Address to count from
+ *
+ * This is an atomic fully-ordered operation (implied full memory barrier).
+ */
+static inline bool test_and_set_bit(long nr, volatile unsigned long *addr)
+{
+	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
+	return arch_test_and_set_bit(nr, addr);
+}
+
+/**
+ * test_and_clear_bit - Clear a bit and return its old value
+ * @nr: Bit to clear
+ * @addr: Address to count from
+ *
+ * This is an atomic fully-ordered operation (implied full memory barrier).
+ */
+static inline bool test_and_clear_bit(long nr, volatile unsigned long *addr)
+{
+	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
+	return arch_test_and_clear_bit(nr, addr);
+}
+
+/**
+ * test_and_change_bit - Change a bit and return its old value
+ * @nr: Bit to change
+ * @addr: Address to count from
+ *
+ * This is an atomic fully-ordered operation (implied full memory barrier).
+ */
+static inline bool test_and_change_bit(long nr, volatile unsigned long *addr)
+{
+	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
+	return arch_test_and_change_bit(nr, addr);
+}
+
+#endif /* _ASM_GENERIC_BITOPS_INSTRUMENTED_NON_ATOMIC_H */
diff --git a/include/asm-generic/bitops/instrumented-lock.h b/include/asm-generic/bitops/instrumented-lock.h
new file mode 100644
index 000000000000..ec53fdeea9ec
--- /dev/null
+++ b/include/asm-generic/bitops/instrumented-lock.h
@@ -0,0 +1,81 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * This file provides wrappers with sanitizer instrumentation for bit
+ * locking operations.
+ *
+ * To use this functionality, an arch's bitops.h file needs to define each of
+ * the below bit operations with an arch_ prefix (e.g. arch_set_bit(),
+ * arch___set_bit(), etc.).
+ */
+#ifndef _ASM_GENERIC_BITOPS_INSTRUMENTED_LOCK_H
+#define _ASM_GENERIC_BITOPS_INSTRUMENTED_LOCK_H
+
+#include <linux/kasan-checks.h>
+
+/**
+ * clear_bit_unlock - Clear a bit in memory, for unlock
+ * @nr: the bit to set
+ * @addr: the address to start counting from
+ *
+ * This operation is atomic and provides release barrier semantics.
+ */
+static inline void clear_bit_unlock(long nr, volatile unsigned long *addr)
+{
+	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
+	arch_clear_bit_unlock(nr, addr);
+}
+
+/**
+ * __clear_bit_unlock - Clears a bit in memory
+ * @nr: Bit to clear
+ * @addr: Address to start counting from
+ *
+ * This is a non-atomic operation but implies a release barrier before the
+ * memory operation. It can be used for an unlock if no other CPUs can
+ * concurrently modify other bits in the word.
+ */
+static inline void __clear_bit_unlock(long nr, volatile unsigned long *addr)
+{
+	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
+	arch___clear_bit_unlock(nr, addr);
+}
+
+/**
+ * test_and_set_bit_lock - Set a bit and return its old value, for lock
+ * @nr: Bit to set
+ * @addr: Address to count from
+ *
+ * This operation is atomic and provides acquire barrier semantics if
+ * the returned value is 0.
+ * It can be used to implement bit locks.
+ */
+static inline bool test_and_set_bit_lock(long nr, volatile unsigned long *addr)
+{
+	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
+	return arch_test_and_set_bit_lock(nr, addr);
+}
+
+#if defined(arch_clear_bit_unlock_is_negative_byte)
+/**
+ * clear_bit_unlock_is_negative_byte - Clear a bit in memory and test if bottom
+ *                                     byte is negative, for unlock.
+ * @nr: the bit to clear
+ * @addr: the address to start counting from
+ *
+ * This operation is atomic and provides release barrier semantics.
+ *
+ * This is a bit of a one-trick-pony for the filemap code, which clears
+ * PG_locked and tests PG_waiters,
+ */
+static inline bool
+clear_bit_unlock_is_negative_byte(long nr, volatile unsigned long *addr)
+{
+	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
+	return arch_clear_bit_unlock_is_negative_byte(nr, addr);
+}
+/* Let everybody know we have it. */
+#define clear_bit_unlock_is_negative_byte clear_bit_unlock_is_negative_byte
+#endif
+
+#endif /* _ASM_GENERIC_BITOPS_INSTRUMENTED_LOCK_H */
diff --git a/include/asm-generic/bitops/instrumented-non-atomic.h b/include/asm-generic/bitops/instrumented-non-atomic.h
new file mode 100644
index 000000000000..95ff28d128a1
--- /dev/null
+++ b/include/asm-generic/bitops/instrumented-non-atomic.h
@@ -0,0 +1,114 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * This file provides wrappers with sanitizer instrumentation for non-atomic
+ * bit operations.
+ *
+ * To use this functionality, an arch's bitops.h file needs to define each of
+ * the below bit operations with an arch_ prefix (e.g. arch_set_bit(),
+ * arch___set_bit(), etc.).
+ */
+#ifndef _ASM_GENERIC_BITOPS_INSTRUMENTED_NON_ATOMIC_H
+#define _ASM_GENERIC_BITOPS_INSTRUMENTED_NON_ATOMIC_H
+
+#include <linux/kasan-checks.h>
+
+/**
+ * __set_bit - Set a bit in memory
+ * @nr: the bit to set
+ * @addr: the address to start counting from
+ *
+ * Unlike set_bit(), this function is non-atomic. If it is called on the same
+ * region of memory concurrently, the effect may be that only one operation
+ * succeeds.
+ */
+static inline void __set_bit(long nr, volatile unsigned long *addr)
+{
+	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
+	arch___set_bit(nr, addr);
+}
+
+/**
+ * __clear_bit - Clears a bit in memory
+ * @nr: the bit to clear
+ * @addr: the address to start counting from
+ *
+ * Unlike clear_bit(), this function is non-atomic. If it is called on the same
+ * region of memory concurrently, the effect may be that only one operation
+ * succeeds.
+ */
+static inline void __clear_bit(long nr, volatile unsigned long *addr)
+{
+	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
+	arch___clear_bit(nr, addr);
+}
+
+/**
+ * __change_bit - Toggle a bit in memory
+ * @nr: the bit to change
+ * @addr: the address to start counting from
+ *
+ * Unlike change_bit(), this function is non-atomic. If it is called on the same
+ * region of memory concurrently, the effect may be that only one operation
+ * succeeds.
+ */
+static inline void __change_bit(long nr, volatile unsigned long *addr)
+{
+	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
+	arch___change_bit(nr, addr);
+}
+
+/**
+ * __test_and_set_bit - Set a bit and return its old value
+ * @nr: Bit to set
+ * @addr: Address to count from
+ *
+ * This operation is non-atomic. If two instances of this operation race, one
+ * can appear to succeed but actually fail.
+ */
+static inline bool __test_and_set_bit(long nr, volatile unsigned long *addr)
+{
+	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
+	return arch___test_and_set_bit(nr, addr);
+}
+
+/**
+ * __test_and_clear_bit - Clear a bit and return its old value
+ * @nr: Bit to clear
+ * @addr: Address to count from
+ *
+ * This operation is non-atomic. If two instances of this operation race, one
+ * can appear to succeed but actually fail.
+ */
+static inline bool __test_and_clear_bit(long nr, volatile unsigned long *addr)
+{
+	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
+	return arch___test_and_clear_bit(nr, addr);
+}
+
+/**
+ * __test_and_change_bit - Change a bit and return its old value
+ * @nr: Bit to change
+ * @addr: Address to count from
+ *
+ * This operation is non-atomic. If two instances of this operation race, one
+ * can appear to succeed but actually fail.
+ */
+static inline bool __test_and_change_bit(long nr, volatile unsigned long *addr)
+{
+	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
+	return arch___test_and_change_bit(nr, addr);
+}
+
+/**
+ * test_bit - Determine whether a bit is set
+ * @nr: bit number to test
+ * @addr: Address to start counting from
+ */
+static inline bool test_bit(long nr, const volatile unsigned long *addr)
+{
+	kasan_check_read(addr + BIT_WORD(nr), sizeof(long));
+	return arch_test_bit(nr, addr);
+}
+
+#endif /* _ASM_GENERIC_BITOPS_INSTRUMENTED_NON_ATOMIC_H */
-- 
2.20.1

