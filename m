Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2901183DEE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 01:44:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463B7L0w0NzDqPj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 09:44:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="HTTyLudw"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463B0n09l9zDqvd
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2019 09:38:48 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id x15so32061055pgg.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Aug 2019 16:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e8DlPQSIeZqk6llpFmdndU3NDgbdbTIawHyJaggIQoo=;
 b=HTTyLudwRbeiuHf2htfVOhiV40w6Dgr7MyARBgshzPgRFODugMd8NTHVdJLLdrtNzw
 Th3VSBn8Ma8ruQJfeDflEZoI2U7KQkaPj/NWK4WP6B3UZjZqjV5XhlgIPNoWbersBhhu
 3uxfIzGO++S+IrgYhoKTQ6uFT4qO9pgW8mFWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e8DlPQSIeZqk6llpFmdndU3NDgbdbTIawHyJaggIQoo=;
 b=aBFHF0V2xGtXVCdHcKQV9BFcPVcSutWhnzxlBROBwsJGiDordaSs2BIvXiqMAdx+gd
 vEncYwWPApkkEko33S02DiGo/1sxdme5kEVHqzkVxLa3rs0kXD+OTRdTJItRVM7zb0AF
 30XSrwhCn0o4lXTffKmGo5B9rW7oJfKF20D6Gni+TwmfcE8hJd/X3Js5/zaJGB+DiKNW
 lXnbo8zFcE5fCOjncMRCTPHiKGngXrxxwC6VW45t2UeUnFBqA1Ps2GgNKTHYyuWLOlTm
 yOfU/iaPbVxqgHQdLU+Z5IVMg5Rko6H9va8Af6fj2NuJLFmJZPB1CfQRT6cxmE+aCjFq
 Sgbg==
X-Gm-Message-State: APjAAAXoBXh++8WsGgI9YpmGtgFjbIgjPJ18bUDr97O7ztdwhye3RFoT
 NMlxhxtm8vb2NcY/INPEd4Hn0Q==
X-Google-Smtp-Source: APXvYqxruHWnG159pCTWMciPjV2djBJRjOn9+0aEnLSptewl6s0rZRKvHnQRQlQSB0/hnEVgzfMuZw==
X-Received: by 2002:a63:c054:: with SMTP id z20mr5168572pgi.373.1565134726349; 
 Tue, 06 Aug 2019 16:38:46 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id d15sm45809221pjc.8.2019.08.06.16.38.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 16:38:45 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: aneesh.kumar@linux.ibm.com, christophe.leroy@c-s.fr, bsingharora@gmail.com
Subject: [PATCH 2/4] kasan: support instrumented bitops with generic
 non-atomic bitops
Date: Wed,  7 Aug 2019 09:38:25 +1000
Message-Id: <20190806233827.16454-3-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190806233827.16454-1-dja@axtens.net>
References: <20190806233827.16454-1-dja@axtens.net>
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
Cc: linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently bitops-instrumented.h assumes that the architecture provides
both the atomic and non-atomic versions of the bitops (e.g. both
set_bit and __set_bit). This is true on x86, but is not always true:
there is a generic bitops/non-atomic.h header that provides generic
non-atomic versions. powerpc uses this generic version, so it does
not have it's own e.g. __set_bit that could be renamed arch___set_bit.

Rearrange bitops-instrumented.h. As operations in bitops/non-atomic.h
will already be instrumented (they use regular memory accesses), put
the instrumenting wrappers for them behind an ifdef. Only include
these instrumentation wrappers if non-atomic.h has not been included.

Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 include/asm-generic/bitops-instrumented.h | 144 ++++++++++++----------
 1 file changed, 76 insertions(+), 68 deletions(-)

diff --git a/include/asm-generic/bitops-instrumented.h b/include/asm-generic/bitops-instrumented.h
index ddd1c6d9d8db..2fe8f7e12a11 100644
--- a/include/asm-generic/bitops-instrumented.h
+++ b/include/asm-generic/bitops-instrumented.h
@@ -29,21 +29,6 @@ static inline void set_bit(long nr, volatile unsigned long *addr)
 	arch_set_bit(nr, addr);
 }
 
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
 /**
  * clear_bit - Clears a bit in memory
  * @nr: Bit to clear
@@ -57,21 +42,6 @@ static inline void clear_bit(long nr, volatile unsigned long *addr)
 	arch_clear_bit(nr, addr);
 }
 
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
 /**
  * clear_bit_unlock - Clear a bit in memory, for unlock
  * @nr: the bit to set
@@ -116,21 +86,6 @@ static inline void change_bit(long nr, volatile unsigned long *addr)
 	arch_change_bit(nr, addr);
 }
 
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
 /**
  * test_and_set_bit - Set a bit and return its old value
  * @nr: Bit to set
@@ -144,20 +99,6 @@ static inline bool test_and_set_bit(long nr, volatile unsigned long *addr)
 	return arch_test_and_set_bit(nr, addr);
 }
 
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
 /**
  * test_and_set_bit_lock - Set a bit and return its old value, for lock
  * @nr: Bit to set
@@ -187,30 +128,96 @@ static inline bool test_and_clear_bit(long nr, volatile unsigned long *addr)
 }
 
 /**
- * __test_and_clear_bit - Clear a bit and return its old value
- * @nr: Bit to clear
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
+/*
+ * If the arch is using the generic non-atomic bit ops, they are already
+ * instrumented, and we don't need to create wrappers. Only wrap if we
+ * haven't included that header.
+ */
+#ifndef _ASM_GENERIC_BITOPS_NON_ATOMIC_H_
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
  * @addr: Address to count from
  *
  * This operation is non-atomic. If two instances of this operation race, one
  * can appear to succeed but actually fail.
  */
-static inline bool __test_and_clear_bit(long nr, volatile unsigned long *addr)
+static inline bool __test_and_set_bit(long nr, volatile unsigned long *addr)
 {
 	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
-	return arch___test_and_clear_bit(nr, addr);
+	return arch___test_and_set_bit(nr, addr);
 }
 
 /**
- * test_and_change_bit - Change a bit and return its old value
- * @nr: Bit to change
+ * __test_and_clear_bit - Clear a bit and return its old value
+ * @nr: Bit to clear
  * @addr: Address to count from
  *
- * This is an atomic fully-ordered operation (implied full memory barrier).
+ * This operation is non-atomic. If two instances of this operation race, one
+ * can appear to succeed but actually fail.
  */
-static inline bool test_and_change_bit(long nr, volatile unsigned long *addr)
+static inline bool __test_and_clear_bit(long nr, volatile unsigned long *addr)
 {
 	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
-	return arch_test_and_change_bit(nr, addr);
+	return arch___test_and_clear_bit(nr, addr);
 }
 
 /**
@@ -237,6 +244,7 @@ static inline bool test_bit(long nr, const volatile unsigned long *addr)
 	kasan_check_read(addr + BIT_WORD(nr), sizeof(long));
 	return arch_test_bit(nr, addr);
 }
+#endif /* _ASM_GENERIC_BITOPS_NON_ATOMIC_H_ */
 
 #if defined(arch_clear_bit_unlock_is_negative_byte)
 /**
-- 
2.20.1

