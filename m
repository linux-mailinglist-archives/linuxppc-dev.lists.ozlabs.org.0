Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BD583DF5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 01:46:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463B9S2n9LzDqxF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 09:46:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="XcS54DC/"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463B0r58qfzDqxq
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2019 09:38:52 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id b13so42357996pfo.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Aug 2019 16:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QItJBQZK9T1seVQYKJ2PYQ+PjsrVTZaWuqJ1GoAJvEg=;
 b=XcS54DC/AfpUDLLigvb/8SW9LltZFtFJRZYmGlfEVgchL4a6wVKgNknKnsyN8Gmmmw
 VODGDIzk2L6pFnlNLCyCO1cfHF4XWwzD0De0kr04PSUot9+sueA7zrqBs6LEjjzjb6Yu
 dLMWpZKyrmurzAJAjJx/7gJ9wuFjMsPcBrS/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QItJBQZK9T1seVQYKJ2PYQ+PjsrVTZaWuqJ1GoAJvEg=;
 b=oaI0Bq0xcVnUa6DcF1iougwlQiNh7xbUdegIodagoqYQaQ9D4jRMQTVYz6uThDTPRJ
 Tz0sc3wJo/6rM1mL/CB5JLN/haCeRmpsnyDtKBvN/BtXbhVrFfGo7OeeFXU5TNTRvxQw
 uo37oKdNtZJ0PIrwkBzCQIx/MZIb43cpJzuyFYMUPmKEPKCpdGrIOKsY5+DUsWe7mHod
 ayuoRE08Zy95BFzJacUdO0/JjXGJHNzfOlo3zNXOJrRtyxTPow52/zWNERkUsE77BGUZ
 /0yZr5km49DOxgMxVuVCw9uXsLTGC/oT+BSU51CNgHyCE4ep/aNwJYYjrtypfNZ6uMm6
 Dosw==
X-Gm-Message-State: APjAAAXVyCtejngp81XrJWyFUU5ku86GESRnTD2psPf5+ueydTM9BFrg
 uLScaDpfCnM6LyHfEdaVhEJzHg==
X-Google-Smtp-Source: APXvYqzHHOqzYgVM6iRB1Qj6JVVoSFeYIp7l51vB+YqLBP0y6dop5rqfMAqdWjkwkJTbkGJ4OAOR3Q==
X-Received: by 2002:a62:1c93:: with SMTP id c141mr6480128pfc.9.1565134731039; 
 Tue, 06 Aug 2019 16:38:51 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id b30sm121525557pfr.117.2019.08.06.16.38.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 16:38:50 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: aneesh.kumar@linux.ibm.com, christophe.leroy@c-s.fr, bsingharora@gmail.com
Subject: [PATCH 3/4] powerpc: support KASAN instrumentation of bitops
Date: Wed,  7 Aug 2019 09:38:26 +1000
Message-Id: <20190806233827.16454-4-dja@axtens.net>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 kasan-dev@googlegroups.com, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In KASAN development I noticed that the powerpc-specific bitops
were not being picked up by the KASAN test suite.

Instrumentation is done via the bitops-instrumented.h header. It
requies that arch-specific versions of bitop functions are renamed
to arch_*. Do this renaming.

For clear_bit_unlock_is_negative_byte, the current implementation
uses the PG_waiter constant. This works because it's a preprocessor
macro - so it's only actually evaluated in contexts where PG_waiter
is defined. With instrumentation however, it becomes a static inline
function, and all of a sudden we need the actual value of PG_waiter.
Because of the order of header includes, it's not available and we
fail to compile. Instead, manually specify that we care about bit 7.
This is still correct: bit 7 is the bit that would mark a negative
byte, but it does obscure the origin a little bit.

Cc: Nicholas Piggin <npiggin@gmail.com> # clear_bit_unlock_negative_byte
Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 arch/powerpc/include/asm/bitops.h | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/bitops.h b/arch/powerpc/include/asm/bitops.h
index 603aed229af7..19dc16e62e6a 100644
--- a/arch/powerpc/include/asm/bitops.h
+++ b/arch/powerpc/include/asm/bitops.h
@@ -86,22 +86,22 @@ DEFINE_BITOP(clear_bits, andc, "")
 DEFINE_BITOP(clear_bits_unlock, andc, PPC_RELEASE_BARRIER)
 DEFINE_BITOP(change_bits, xor, "")
 
-static __inline__ void set_bit(int nr, volatile unsigned long *addr)
+static __inline__ void arch_set_bit(int nr, volatile unsigned long *addr)
 {
 	set_bits(BIT_MASK(nr), addr + BIT_WORD(nr));
 }
 
-static __inline__ void clear_bit(int nr, volatile unsigned long *addr)
+static __inline__ void arch_clear_bit(int nr, volatile unsigned long *addr)
 {
 	clear_bits(BIT_MASK(nr), addr + BIT_WORD(nr));
 }
 
-static __inline__ void clear_bit_unlock(int nr, volatile unsigned long *addr)
+static __inline__ void arch_clear_bit_unlock(int nr, volatile unsigned long *addr)
 {
 	clear_bits_unlock(BIT_MASK(nr), addr + BIT_WORD(nr));
 }
 
-static __inline__ void change_bit(int nr, volatile unsigned long *addr)
+static __inline__ void arch_change_bit(int nr, volatile unsigned long *addr)
 {
 	change_bits(BIT_MASK(nr), addr + BIT_WORD(nr));
 }
@@ -138,26 +138,26 @@ DEFINE_TESTOP(test_and_clear_bits, andc, PPC_ATOMIC_ENTRY_BARRIER,
 DEFINE_TESTOP(test_and_change_bits, xor, PPC_ATOMIC_ENTRY_BARRIER,
 	      PPC_ATOMIC_EXIT_BARRIER, 0)
 
-static __inline__ int test_and_set_bit(unsigned long nr,
+static __inline__ int arch_test_and_set_bit(unsigned long nr,
 				       volatile unsigned long *addr)
 {
 	return test_and_set_bits(BIT_MASK(nr), addr + BIT_WORD(nr)) != 0;
 }
 
-static __inline__ int test_and_set_bit_lock(unsigned long nr,
+static __inline__ int arch_test_and_set_bit_lock(unsigned long nr,
 				       volatile unsigned long *addr)
 {
 	return test_and_set_bits_lock(BIT_MASK(nr),
 				addr + BIT_WORD(nr)) != 0;
 }
 
-static __inline__ int test_and_clear_bit(unsigned long nr,
+static __inline__ int arch_test_and_clear_bit(unsigned long nr,
 					 volatile unsigned long *addr)
 {
 	return test_and_clear_bits(BIT_MASK(nr), addr + BIT_WORD(nr)) != 0;
 }
 
-static __inline__ int test_and_change_bit(unsigned long nr,
+static __inline__ int arch_test_and_change_bit(unsigned long nr,
 					  volatile unsigned long *addr)
 {
 	return test_and_change_bits(BIT_MASK(nr), addr + BIT_WORD(nr)) != 0;
@@ -186,14 +186,14 @@ static __inline__ unsigned long clear_bit_unlock_return_word(int nr,
 }
 
 /* This is a special function for mm/filemap.c */
-#define clear_bit_unlock_is_negative_byte(nr, addr)			\
-	(clear_bit_unlock_return_word(nr, addr) & BIT_MASK(PG_waiters))
+#define arch_clear_bit_unlock_is_negative_byte(nr, addr)		\
+	(clear_bit_unlock_return_word(nr, addr) & BIT_MASK(7))
 
 #endif /* CONFIG_PPC64 */
 
 #include <asm-generic/bitops/non-atomic.h>
 
-static __inline__ void __clear_bit_unlock(int nr, volatile unsigned long *addr)
+static __inline__ void arch___clear_bit_unlock(int nr, volatile unsigned long *addr)
 {
 	__asm__ __volatile__(PPC_RELEASE_BARRIER "" ::: "memory");
 	__clear_bit(nr, addr);
@@ -239,6 +239,9 @@ unsigned long __arch_hweight64(__u64 w);
 
 #include <asm-generic/bitops/find.h>
 
+/* wrappers that deal with KASAN instrumentation */
+#include <asm-generic/bitops-instrumented.h>
+
 /* Little-endian versions */
 #include <asm-generic/bitops/le.h>
 
-- 
2.20.1

