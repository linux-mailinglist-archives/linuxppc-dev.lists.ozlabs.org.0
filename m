Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F148613B9D7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 07:41:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yHlv0pHDzDqM0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 17:41:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=hZt2zcSk; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yHgk1RBjzDqRW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2020 17:37:38 +1100 (AEDT)
Received: by mail-pj1-x1042.google.com with SMTP id s94so1717396pjc.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2020 22:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r5/dhMWxJZ8SOba/KcCWGM9GPzNc+Jy36C4OySceHUs=;
 b=hZt2zcSkhPM4xlgQqygBb81tHBpEUlKN16gNo5uwFqu0hmxvbGMEGnga+kgyb8gycl
 0mEPUm8zWm/afABGpp4qo/+EicaA5gwQ5PcqATowdt0QsOeVETsscNnXyOxzczMnAN0J
 F2Mg0XTtpYBWxFAaFL+t4jrE6YIHS/9Xxn0sU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r5/dhMWxJZ8SOba/KcCWGM9GPzNc+Jy36C4OySceHUs=;
 b=Cu/HMPViagaYD8vZ3r3/ccH7V7b8QFYGImjr7dyPC6hqLpxIVivycKf0Yy3ZK9msk4
 M02sN46pYLPKsajQ6AFcbysoXEdmECuAM7p4corEEbKcAEzr2WwDR47gvvlubLeUPuAY
 E+PGqPC48SoIlP28vrdE6egOpGP/mCDzCpmiNuC91S5IFi7TRZNcJssPldOBdzgNVvcj
 3bCvM0p7kDUdv7zNwFAYddgCYypILF3iqjgrM/R4G1P3Hbhkf9Ip/t8E/AlzAUuoof/F
 PoTthv275UaIKDwzxVelqR4+ffx4kUZgccP/WX/aPFKAUJI2dIvB8yjLemUtFgBu1y2i
 tW7g==
X-Gm-Message-State: APjAAAWOCEDnhGw1Y6viOQ3g6zgnnxf5Clr6MMqVEZAQILAGXY1dAaPp
 AthyJzghRO/ABitsIn31XuolCw==
X-Google-Smtp-Source: APXvYqwq4olT7JovwG6rqn0xRWiB0H+icpZZI6IwXn3zwCq1AedHh4w2c0F9mU0Wz9byY74hw2I0kw==
X-Received: by 2002:a17:90a:6:: with SMTP id 6mr34950202pja.71.1579070255741; 
 Tue, 14 Jan 2020 22:37:35 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-8d73-bc9d-5592-cfd7.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:8d73:bc9d:5592:cfd7])
 by smtp.gmail.com with ESMTPSA id c15sm20438468pja.30.2020.01.14.22.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 22:37:35 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com
Subject: [PATCH 1/2] kasan: stop tests being eliminated as dead code with
 FORTIFY_SOURCE
Date: Wed, 15 Jan 2020 17:37:09 +1100
Message-Id: <20200115063710.15796-2-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200115063710.15796-1-dja@axtens.net>
References: <20200115063710.15796-1-dja@axtens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-s390@vger.kernel.org, linux-xtensa@linux-xtensa.org, x86@kernel.org,
 Daniel Micay <danielmicay@gmail.com>, Alexander Potapenko <glider@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

3 KASAN self-tests fail on a kernel with both KASAN and FORTIFY_SOURCE:
memchr, memcmp and strlen.

When FORTIFY_SOURCE is on, a number of functions are replaced with
fortified versions, which attempt to check the sizes of the operands.
However, these functions often directly invoke __builtin_foo() once they
have performed the fortify check. The compiler can detect that the results
of these functions are not used, and knows that they have no other side
effects, and so can eliminate them as dead code.

Why are only memchr, memcmp and strlen affected?
================================================

Of string and string-like functions, kasan_test tests:

 * strchr  ->  not affected, no fortified version
 * strrchr ->  likewise
 * strcmp  ->  likewise
 * strncmp ->  likewise

 * strnlen ->  not affected, the fortify source implementation calls the
               underlying strnlen implementation which is instrumented, not
               a builtin

 * strlen  ->  affected, the fortify souce implementation calls a __builtin
               version which the compiler can determine is dead.

 * memchr  ->  likewise
 * memcmp  ->  likewise

 * memset ->   not affected, the compiler knows that memset writes to its
	       first argument and therefore is not dead.

Why does this not affect the functions normally?
================================================

In string.h, these functions are not marked as __pure, so the compiler
cannot know that they do not have side effects. If relevant functions are
marked as __pure in string.h, we see the following warnings and the
functions are elided:

lib/test_kasan.c: In function ‘kasan_memchr’:
lib/test_kasan.c:606:2: warning: statement with no effect [-Wunused-value]
  memchr(ptr, '1', size + 1);
  ^~~~~~~~~~~~~~~~~~~~~~~~~~
lib/test_kasan.c: In function ‘kasan_memcmp’:
lib/test_kasan.c:622:2: warning: statement with no effect [-Wunused-value]
  memcmp(ptr, arr, size+1);
  ^~~~~~~~~~~~~~~~~~~~~~~~
lib/test_kasan.c: In function ‘kasan_strings’:
lib/test_kasan.c:645:2: warning: statement with no effect [-Wunused-value]
  strchr(ptr, '1');
  ^~~~~~~~~~~~~~~~
...

This annotation would make sense to add and could be added at any point, so
the behaviour of test_kasan.c should change.

The fix
=======

Make all the functions that are pure write their results to a global,
which makes them live. The strlen and memchr tests now pass.

The memcmp test still fails to trigger, which is addressed in the next
patch.

Cc: Daniel Micay <danielmicay@gmail.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Fixes: 0c96350a2d2f ("lib/test_kasan.c: add tests for several string/memory API functions")
Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 lib/test_kasan.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/lib/test_kasan.c b/lib/test_kasan.c
index 328d33beae36..58a8cef0d7a2 100644
--- a/lib/test_kasan.c
+++ b/lib/test_kasan.c
@@ -23,6 +23,14 @@
 
 #include <asm/page.h>
 
+/*
+ * We assign some test results to these globals to make sure the tests
+ * are not eliminated as dead code.
+ */
+
+int int_result;
+void *ptr_result;
+
 /*
  * Note: test functions are marked noinline so that their names appear in
  * reports.
@@ -603,7 +611,7 @@ static noinline void __init kasan_memchr(void)
 	if (!ptr)
 		return;
 
-	memchr(ptr, '1', size + 1);
+	ptr_result = memchr(ptr, '1', size + 1);
 	kfree(ptr);
 }
 
@@ -618,8 +626,7 @@ static noinline void __init kasan_memcmp(void)
 	if (!ptr)
 		return;
 
-	memset(arr, 0, sizeof(arr));
-	memcmp(ptr, arr, size+1);
+	int_result = memcmp(ptr, arr, size + 1);
 	kfree(ptr);
 }
 
@@ -642,22 +649,22 @@ static noinline void __init kasan_strings(void)
 	 * will likely point to zeroed byte.
 	 */
 	ptr += 16;
-	strchr(ptr, '1');
+	ptr_result = strchr(ptr, '1');
 
 	pr_info("use-after-free in strrchr\n");
-	strrchr(ptr, '1');
+	ptr_result = strrchr(ptr, '1');
 
 	pr_info("use-after-free in strcmp\n");
-	strcmp(ptr, "2");
+	int_result = strcmp(ptr, "2");
 
 	pr_info("use-after-free in strncmp\n");
-	strncmp(ptr, "2", 1);
+	int_result = strncmp(ptr, "2", 1);
 
 	pr_info("use-after-free in strlen\n");
-	strlen(ptr);
+	int_result = strlen(ptr);
 
 	pr_info("use-after-free in strnlen\n");
-	strnlen(ptr, 1);
+	int_result = strnlen(ptr, 1);
 }
 
 static noinline void __init kasan_bitops(void)
@@ -724,11 +731,12 @@ static noinline void __init kasan_bitops(void)
 	__test_and_change_bit(BITS_PER_LONG + BITS_PER_BYTE, bits);
 
 	pr_info("out-of-bounds in test_bit\n");
-	(void)test_bit(BITS_PER_LONG + BITS_PER_BYTE, bits);
+	int_result = test_bit(BITS_PER_LONG + BITS_PER_BYTE, bits);
 
 #if defined(clear_bit_unlock_is_negative_byte)
 	pr_info("out-of-bounds in clear_bit_unlock_is_negative_byte\n");
-	clear_bit_unlock_is_negative_byte(BITS_PER_LONG + BITS_PER_BYTE, bits);
+	int_result = clear_bit_unlock_is_negative_byte(BITS_PER_LONG +
+		BITS_PER_BYTE, bits);
 #endif
 	kfree(bits);
 }
-- 
2.20.1

