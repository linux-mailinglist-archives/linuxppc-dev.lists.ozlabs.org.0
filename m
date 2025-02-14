Return-Path: <linuxppc-dev+bounces-6207-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB1AA367D7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 22:53:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yvm4v1KsFz304f;
	Sat, 15 Feb 2025 08:53:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::835"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739569983;
	cv=none; b=Cq9WJHu22LvoNc10knE9uA6H7O4jcJvmeAhvO676Slcf0ZTSaynEcRzON01N808txJuUdBvuQzjWVSTXY0E6qTmth0V4ebziJbJgrtevMeqXdJ6OE+CmOQAfflU8g7H8ngRE86PrvU+tVdlqHWQPMGetSWIzYDQeia++9CL9hh8bh+V2EQkoaXTx1Zoo9iMuUpsvNNcm4zxc/6Lo8VaULAZgABOHCpXJr7qzIyKtPC/Dc9G/hEDEheWx6FHfrH2YasHuqPodQWjSMS17xy25AjNzgYjlbsgpVY5akzccPsiLS21sCrar2zTce6HAXpKqxkdnCe4u1BguMBT0E2jMIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739569983; c=relaxed/relaxed;
	bh=yp/fik0Bq8MeiTalrgED7w5zwFXacTez/4crY6Ad8+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JIW29CDOjBwh4GbtQ5JFWDKwWLtE+4pKkowMEFo9sH3YkrXYAuAnlLaIFTJ5j7yS+BfNYoA5VRQPLFyU7RhmmIhvnLwkdMB1UvsaMIEfp+xTJfavCLm2PxtdBKXNJewWtisksPSdIhQK1/X88graxs3Jpf0wTb5neDc32uiaVJYO2pg7SQHCwMO5dxCJtaZqk6Om7JMQmuIv+hJ4/54mnx73ZOXOywYF0u3DbXXkXby/sEl1YE2aOqdqbSjQBhl0BnXR9LugYRENmEIlGbcjeUzhZ3+GeUvCWbGywNBtEKw9otJQLuSeVeV4yHrB0D9jDEDWFPWGYgrFlBcxPrnXMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=J1UKRtp2; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::835; helo=mail-qt1-x835.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=J1UKRtp2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::835; helo=mail-qt1-x835.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yvm4t1Qh1z2ysX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2025 08:53:02 +1100 (AEDT)
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-471c5f7a3d3so17637341cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 13:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739569980; x=1740174780; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yp/fik0Bq8MeiTalrgED7w5zwFXacTez/4crY6Ad8+g=;
        b=J1UKRtp2gQYqfOnqCK1DX28GXhAtAQwBXCOg2toi29+dyZqFfRuzscou+5A7knQEWl
         m5MJb5AfDbmufLuUbS7nzEf5SZAs2lPoseNHvIOSaxTsbFfp5LodIEcUt34UjN9FAP9M
         B/O5m2iwYpOnloysVCDC1yNLfnOk2POt7uFVWnoKH5d6iRt5y625zhFcXTK3M8O8if8r
         JCd2TdqG1DiKmxL7YciMU9A4t6WDZjOWylYUeOE1Pq+vzkCMrDff5BMl/PQc5oKAaOUX
         uImlImG+9MEdXRK41klQhkkOVv19ZE7zYdfinHyE9RZvcD0tjHH3jUAxy0jFDVqu0MiK
         es5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739569980; x=1740174780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yp/fik0Bq8MeiTalrgED7w5zwFXacTez/4crY6Ad8+g=;
        b=vwLv9uLi7S4hqQTAYvBhekBBONNtecFCo8UXnCXmerJufa7Uut3jDiBhaxLN85oZxq
         qumOGxfUajEdo+BuxMmvqyeZwCQkZOWU5GaZUcAApJqnG8EMxLgwzjcaPti5w3NJoy8L
         DfqkeK8nPurbkf/VynwzSf6sGhaKpFyHFvd5cy0cF3ThgQOjXv4QBdiC2TaW7uoLir2f
         m4ikOlLsmg1rYt8O3o96YF70LD7h++7jVxDhdVX646S/YQLKY0SHBrIsvSWPY9ksK7jn
         g5LuSyfUEl0ufCXua5w+IM1ChwXY+fAHSzM0JSyqUYAXINqYjxzXZNjeNr+uNen2sDRM
         KDpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNWld3PcgFR1dz1P04iHii1BGAllqlxOkGcWgWkU/rp0oiiIwEr/J/lGlLdWFNb0AH7KwzihkYe58VXDc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwjZBoNZHaNmIw4OCLkWRj5HczUUE0kNW3770J4Qe1KD5gNTc0G
	+kwcPfDUGOaUyCDcCPJeXYC9mfLNh9g3mjZzEezAjaHV5LVTtn+h
X-Gm-Gg: ASbGnct/5rn/lg5Ixunu+BcXbAr79g2Iy78/8RoIONPQtTmucMcfCE8iKBtFkhabpTG
	Sft2CUhYKC0yaZqOnqzDG+xsvHTo/vKiKNPtN9l4l3oNmxev4Pf5T8LynOYgNBV/621XHC7qedZ
	YurmXiCctJNMc5GBzDShAAJBOXUaIBFfFan+44+5ho8cbxQwp8FiQMacoMIKMVfYvlCNPpjSwJi
	+nbyJ4cBV8BpSsfe+xa/uq4j+4HEVawEjcRTP4/k78l12PN7s8bmr0m0dZlvUqKxhYQebTfxroL
	dGg6x4GYMvV/gmxiJVtilVElS3GDRe9VfXdnmQ==
X-Google-Smtp-Source: AGHT+IEow4TZe60g03dSWKaEfGp7R7dhRLlBKKL5xkag9uaiavlaKhzAOVeApgaPZVTGFXeldqRfmg==
X-Received: by 2002:a05:622a:138a:b0:471:920d:6b3 with SMTP id d75a77b69052e-471c00fa1a4mr119789221cf.1.1739569979672;
        Fri, 14 Feb 2025 13:52:59 -0800 (PST)
Received: from [192.168.1.159] ([2600:4041:5be7:7c00:d4df:402c:65f0:87da])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-471c2af3367sm21844451cf.59.2025.02.14.13.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 13:52:58 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 14 Feb 2025 16:52:40 -0500
Subject: [PATCH v4 2/3] printf: break kunit into test cases
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-printf-kunit-convert-v4-2-c254572f1565@gmail.com>
References: <20250214-printf-kunit-convert-v4-0-c254572f1565@gmail.com>
In-Reply-To: <20250214-printf-kunit-convert-v4-0-c254572f1565@gmail.com>
To: Arpitha Raghunandan <98.arpi@gmail.com>, 
 David Gow <davidgow@google.com>, Petr Mladek <pmladek@suse.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 linuxppc-dev@lists.ozlabs.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Move all tests into `printf_test_cases`. This gives us nicer output in
the event of a failure.

Combine `plain_format` and `plain_hash` into `hash_pointer` since
they're testing the same scenario.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 lib/tests/printf_kunit.c | 331 +++++++++++++++++------------------------------
 1 file changed, 121 insertions(+), 210 deletions(-)

diff --git a/lib/tests/printf_kunit.c b/lib/tests/printf_kunit.c
index 287bbfb61148..013df6f6dd49 100644
--- a/lib/tests/printf_kunit.c
+++ b/lib/tests/printf_kunit.c
@@ -38,13 +38,8 @@ static unsigned int total_tests;
 static char *test_buffer;
 static char *alloced_buffer;
 
-static struct kunit *kunittest;
-
-#define tc_fail(fmt, ...) \
-	KUNIT_FAIL(kunittest, fmt, ##__VA_ARGS__)
-
-static void __printf(4, 0)
-do_test(int bufsize, const char *expect, int elen,
+static void __printf(5, 0)
+do_test(struct kunit *kunittest, int bufsize, const char *expect, int elen,
 	const char *fmt, va_list ap)
 {
 	va_list aq;
@@ -58,59 +53,64 @@ do_test(int bufsize, const char *expect, int elen,
 	va_end(aq);
 
 	if (ret != elen) {
-		tc_fail("vsnprintf(buf, %d, \"%s\", ...) returned %d, expected %d",
-			bufsize, fmt, ret, elen);
+		KUNIT_FAIL(kunittest, "vsnprintf(buf, %d, \"%s\", ...) returned %d, expected %d",
+			   bufsize, fmt, ret, elen);
 		return;
 	}
 
 	if (memchr_inv(alloced_buffer, FILL_CHAR, PAD_SIZE)) {
-		tc_fail("vsnprintf(buf, %d, \"%s\", ...) wrote before buffer",
-			bufsize, fmt);
+		KUNIT_FAIL(kunittest, "vsnprintf(buf, %d, \"%s\", ...) wrote before buffer",
+			   bufsize, fmt);
 		return;
 	}
 
 	if (!bufsize) {
 		if (memchr_inv(test_buffer, FILL_CHAR, BUF_SIZE + PAD_SIZE)) {
-			tc_fail("vsnprintf(buf, 0, \"%s\", ...) wrote to buffer", fmt);
+			KUNIT_FAIL(kunittest, "vsnprintf(buf, 0, \"%s\", ...) wrote to buffer",
+				   fmt);
 		}
 		return;
 	}
 
 	written = min(bufsize-1, elen);
 	if (test_buffer[written]) {
-		tc_fail("vsnprintf(buf, %d, \"%s\", ...) did not nul-terminate buffer",
-			bufsize, fmt);
+		KUNIT_FAIL(kunittest,
+			   "vsnprintf(buf, %d, \"%s\", ...) did not nul-terminate buffer",
+			   bufsize, fmt);
 		return;
 	}
 
 	if (memchr_inv(test_buffer + written + 1, FILL_CHAR, bufsize - (written + 1))) {
-		tc_fail("vsnprintf(buf, %d, \"%s\", ...) wrote beyond the nul-terminator",
-			bufsize, fmt);
+		KUNIT_FAIL(kunittest,
+			   "vsnprintf(buf, %d, \"%s\", ...) wrote beyond the nul-terminator",
+			   bufsize, fmt);
 		return;
 	}
 
 	if (memchr_inv(test_buffer + bufsize, FILL_CHAR, BUF_SIZE + PAD_SIZE - bufsize)) {
-		tc_fail("vsnprintf(buf, %d, \"%s\", ...) wrote beyond buffer", bufsize, fmt);
+		KUNIT_FAIL(kunittest, "vsnprintf(buf, %d, \"%s\", ...) wrote beyond buffer",
+			   bufsize, fmt);
 		return;
 	}
 
 	if (memcmp(test_buffer, expect, written)) {
-		tc_fail("vsnprintf(buf, %d, \"%s\", ...) wrote '%s', expected '%.*s'",
-			bufsize, fmt, test_buffer, written, expect);
+		KUNIT_FAIL(kunittest, "vsnprintf(buf, %d, \"%s\", ...) wrote '%s', expected '%.*s'",
+			   bufsize, fmt, test_buffer, written, expect);
 		return;
 	}
 }
 
-static void __printf(3, 4)
-__test(const char *expect, int elen, const char *fmt, ...)
+static void __printf(4, 0)
+__test(struct kunit *kunittest, const char *expect, int elen, const char *fmt, ...)
 {
 	va_list ap;
 	int rand;
 	char *p;
 
 	if (elen >= BUF_SIZE) {
-		tc_fail("error in test suite: expected output length %d too long. Format was '%s'.",
-			elen, fmt);
+		KUNIT_FAIL(kunittest,
+			   "error in test suite: expected length (%d) >= BUF_SIZE (%d). fmt=\"%s\"",
+			   elen, BUF_SIZE, fmt);
 		return;
 	}
 
@@ -122,18 +122,19 @@ __test(const char *expect, int elen, const char *fmt, ...)
 	 * enough and 0), and then we also test that kvasprintf would
 	 * be able to print it as expected.
 	 */
-	do_test(BUF_SIZE, expect, elen, fmt, ap);
+	do_test(kunittest, BUF_SIZE, expect, elen, fmt, ap);
 	rand = get_random_u32_inclusive(1, elen + 1);
 	/* Since elen < BUF_SIZE, we have 1 <= rand <= BUF_SIZE. */
-	do_test(rand, expect, elen, fmt, ap);
-	do_test(0, expect, elen, fmt, ap);
+	do_test(kunittest, rand, expect, elen, fmt, ap);
+	do_test(kunittest, 0, expect, elen, fmt, ap);
 
 	p = kvasprintf(GFP_KERNEL, fmt, ap);
 	if (p) {
 		total_tests++;
 		if (memcmp(p, expect, elen+1)) {
-			tc_fail("kvasprintf(..., \"%s\", ...) returned '%s', expected '%s'",
-				fmt, p, expect);
+			KUNIT_FAIL(kunittest,
+				   "kvasprintf(..., \"%s\", ...) returned '%s', expected '%s'",
+				   fmt, p, expect);
 		}
 		kfree(p);
 	}
@@ -141,10 +142,10 @@ __test(const char *expect, int elen, const char *fmt, ...)
 }
 
 #define test(expect, fmt, ...)					\
-	__test(expect, strlen(expect), fmt, ##__VA_ARGS__)
+	__test(kunittest, expect, strlen(expect), fmt, ##__VA_ARGS__)
 
 static void
-test_basic(void)
+test_basic(struct kunit *kunittest)
 {
 	/* Work around annoying "warning: zero-length gnu_printf format string". */
 	char nul = '\0';
@@ -152,11 +153,11 @@ test_basic(void)
 	test("", &nul);
 	test("100%", "100%%");
 	test("xxx%yyy", "xxx%cyyy", '%');
-	__test("xxx\0yyy", 7, "xxx%cyyy", '\0');
+	__test(kunittest, "xxx\0yyy", 7, "xxx%cyyy", '\0');
 }
 
 static void
-test_number(void)
+test_number(struct kunit *kunittest)
 {
 	test("0x1234abcd  ", "%#-12x", 0x1234abcd);
 	test("  0x1234abcd", "%#12x", 0x1234abcd);
@@ -178,7 +179,7 @@ test_number(void)
 }
 
 static void
-test_string(void)
+test_string(struct kunit *kunittest)
 {
 	test("", "%s%.0s", "", "123");
 	test("ABCD|abc|123", "%s|%.3s|%.*s", "ABCD", "abcdef", 3, "123456");
@@ -215,29 +216,6 @@ test_string(void)
 #define ZEROS "00000000"	/* hex 32 zero bits */
 #define ONES "ffffffff"		/* hex 32 one bits */
 
-static int
-plain_format(void)
-{
-	char buf[PLAIN_BUF_SIZE];
-	int nchars;
-
-	nchars = snprintf(buf, PLAIN_BUF_SIZE, "%p", PTR);
-
-	if (nchars != PTR_WIDTH)
-		return -1;
-
-	if (strncmp(buf, PTR_VAL_NO_CRNG, PTR_WIDTH) == 0) {
-		kunit_warn(kunittest, "crng possibly not yet initialized. plain 'p' buffer contains \"%s\"",
-			PTR_VAL_NO_CRNG);
-		return 0;
-	}
-
-	if (strncmp(buf, ZEROS, strlen(ZEROS)) != 0)
-		return -1;
-
-	return 0;
-}
-
 #else
 
 #define PTR_WIDTH 8
@@ -247,89 +225,44 @@ plain_format(void)
 #define ZEROS ""
 #define ONES ""
 
-static int
-plain_format(void)
-{
-	/* Format is implicitly tested for 32 bit machines by plain_hash() */
-	return 0;
-}
-
 #endif	/* BITS_PER_LONG == 64 */
 
-static int
-plain_hash_to_buffer(const void *p, char *buf, size_t len)
+static void
+plain_hash_to_buffer(struct kunit *kunittest, const void *p, char *buf, size_t len)
 {
-	int nchars;
-
-	nchars = snprintf(buf, len, "%p", p);
-
-	if (nchars != PTR_WIDTH)
-		return -1;
+	KUNIT_ASSERT_EQ(kunittest, snprintf(buf, len, "%p", p), PTR_WIDTH);
 
 	if (strncmp(buf, PTR_VAL_NO_CRNG, PTR_WIDTH) == 0) {
 		kunit_warn(kunittest, "crng possibly not yet initialized. plain 'p' buffer contains \"%s\"",
 			PTR_VAL_NO_CRNG);
-		return 0;
 	}
-
-	return 0;
 }
 
-static int
-plain_hash(void)
-{
-	char buf[PLAIN_BUF_SIZE];
-	int ret;
-
-	ret = plain_hash_to_buffer(PTR, buf, PLAIN_BUF_SIZE);
-	if (ret)
-		return ret;
-
-	if (strncmp(buf, PTR_STR, PTR_WIDTH) == 0)
-		return -1;
-
-	return 0;
-}
-
-/*
- * We can't use test() to test %p because we don't know what output to expect
- * after an address is hashed.
- */
 static void
-plain(void)
+hash_pointer(struct kunit *kunittest)
 {
-	int err;
+	if (no_hash_pointers)
+		kunit_skip(kunittest, "hash pointers disabled");
 
-	if (no_hash_pointers) {
-		kunit_warn(kunittest, "skipping plain 'p' tests");
-		return;
-	}
+	char buf[PLAIN_BUF_SIZE];
 
-	err = plain_hash();
-	if (err) {
-		tc_fail("plain 'p' does not appear to be hashed");
-		return;
-	}
+	plain_hash_to_buffer(kunittest, PTR, buf, PLAIN_BUF_SIZE);
 
-	err = plain_format();
-	if (err) {
-		tc_fail("hashing plain 'p' has unexpected format");
-	}
+	/*
+	 * We can't use test() to test %p because we don't know what output to expect
+	 * after an address is hashed.
+	 */
+
+	KUNIT_EXPECT_MEMEQ(kunittest, buf, ZEROS, strlen(ZEROS));
+	KUNIT_EXPECT_MEMNEQ(kunittest, buf+strlen(ZEROS), PTR_STR, PTR_WIDTH);
 }
 
 static void
-test_hashed(const char *fmt, const void *p)
+test_hashed(struct kunit *kunittest, const char *fmt, const void *p)
 {
 	char buf[PLAIN_BUF_SIZE];
-	int ret;
 
-	/*
-	 * No need to increase failed test counter since this is assumed
-	 * to be called after plain().
-	 */
-	ret = plain_hash_to_buffer(p, buf, PLAIN_BUF_SIZE);
-	if (ret)
-		return;
+	plain_hash_to_buffer(kunittest, p, buf, PLAIN_BUF_SIZE);
 
 	test(buf, fmt, p);
 }
@@ -338,7 +271,7 @@ test_hashed(const char *fmt, const void *p)
  * NULL pointers aren't hashed.
  */
 static void
-null_pointer(void)
+null_pointer(struct kunit *kunittest)
 {
 	test(ZEROS "00000000", "%p", NULL);
 	test(ZEROS "00000000", "%px", NULL);
@@ -349,7 +282,7 @@ null_pointer(void)
  * Error pointers aren't hashed.
  */
 static void
-error_pointer(void)
+error_pointer(struct kunit *kunittest)
 {
 	test(ONES "fffffff5", "%p", ERR_PTR(-11));
 	test(ONES "fffffff5", "%px", ERR_PTR(-11));
@@ -359,26 +292,26 @@ error_pointer(void)
 #define PTR_INVALID ((void *)0x000000ab)
 
 static void
-invalid_pointer(void)
+invalid_pointer(struct kunit *kunittest)
 {
-	test_hashed("%p", PTR_INVALID);
+	test_hashed(kunittest, "%p", PTR_INVALID);
 	test(ZEROS "000000ab", "%px", PTR_INVALID);
 	test("(efault)", "%pE", PTR_INVALID);
 }
 
 static void
-symbol_ptr(void)
+symbol_ptr(struct kunit *kunittest)
 {
 }
 
 static void
-kernel_ptr(void)
+kernel_ptr(struct kunit *kunittest)
 {
 	/* We can't test this without access to kptr_restrict. */
 }
 
 static void
-struct_resource(void)
+struct_resource(struct kunit *kunittest)
 {
 	struct resource test_resource = {
 		.start = 0xc0ffee00,
@@ -427,7 +360,7 @@ struct_resource(void)
 }
 
 static void
-struct_range(void)
+struct_range(struct kunit *kunittest)
 {
 	struct range test_range = DEFINE_RANGE(0xc0ffee00ba5eba11,
 					       0xc0ffee00ba5eba11);
@@ -443,17 +376,17 @@ struct_range(void)
 }
 
 static void
-addr(void)
+addr(struct kunit *kunittest)
 {
 }
 
 static void
-escaped_str(void)
+escaped_str(struct kunit *kunittest)
 {
 }
 
 static void
-hex_string(void)
+hex_string(struct kunit *kunittest)
 {
 	const char buf[3] = {0xc0, 0xff, 0xee};
 
@@ -464,7 +397,7 @@ hex_string(void)
 }
 
 static void
-mac(void)
+mac(struct kunit *kunittest)
 {
 	const u8 addr[6] = {0x2d, 0x48, 0xd6, 0xfc, 0x7a, 0x05};
 
@@ -476,7 +409,7 @@ mac(void)
 }
 
 static void
-ip4(void)
+ip4(struct kunit *kunittest)
 {
 	struct sockaddr_in sa;
 
@@ -491,19 +424,12 @@ ip4(void)
 }
 
 static void
-ip6(void)
+ip6(struct kunit *kunittest)
 {
 }
 
 static void
-ip(void)
-{
-	ip4();
-	ip6();
-}
-
-static void
-uuid(void)
+uuid(struct kunit *kunittest)
 {
 	const char uuid[16] = {0x0, 0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7,
 			       0x8, 0x9, 0xa, 0xb, 0xc, 0xd, 0xe, 0xf};
@@ -530,7 +456,7 @@ static struct dentry test_dentry[4] = {
 };
 
 static void
-dentry(void)
+dentry(struct kunit *kunittest)
 {
 	test("foo", "%pd", &test_dentry[0]);
 	test("foo", "%pd2", &test_dentry[0]);
@@ -551,12 +477,12 @@ dentry(void)
 }
 
 static void
-struct_va_format(void)
+struct_va_format(struct kunit *kunittest)
 {
 }
 
 static void
-time_and_date(void)
+time_and_date(struct kunit *kunittest)
 {
 	/* 1543210543 */
 	const struct rtc_time tm = {
@@ -590,12 +516,12 @@ time_and_date(void)
 }
 
 static void
-struct_clk(void)
+struct_clk(struct kunit *kunittest)
 {
 }
 
 static void
-large_bitmap(void)
+large_bitmap(struct kunit *kunittest)
 {
 	const int nbits = 1 << 16;
 	unsigned long *bits = bitmap_zalloc(nbits, GFP_KERNEL);
@@ -609,7 +535,7 @@ large_bitmap(void)
 }
 
 static void
-bitmap(void)
+bitmap(struct kunit *kunittest)
 {
 	DECLARE_BITMAP(bits, 20);
 	const int primes[] = {2,3,5,7,11,13,17,19};
@@ -628,11 +554,11 @@ bitmap(void)
 	test("fffff|fffff", "%20pb|%*pb", bits, 20, bits);
 	test("0-19|0-19", "%20pbl|%*pbl", bits, 20, bits);
 
-	large_bitmap();
+	large_bitmap(kunittest);
 }
 
 static void
-netdev_features(void)
+netdev_features(struct kunit *kunittest)
 {
 }
 
@@ -658,8 +584,8 @@ static const struct page_flags_test pft[] = {
 };
 
 static void
-page_flags_test(int section, int node, int zone, int last_cpupid,
-		int kasan_tag, unsigned long flags, const char *name,
+page_flags_test(struct kunit *kunittest, int section, int node, int zone,
+		int last_cpupid, int kasan_tag, unsigned long flags, const char *name,
 		char *cmp_buf)
 {
 	unsigned long values[] = {section, node, zone, last_cpupid, kasan_tag};
@@ -696,25 +622,24 @@ page_flags_test(int section, int node, int zone, int last_cpupid,
 }
 
 static void
-flags(void)
+flags(struct kunit *kunittest)
 {
 	unsigned long flags;
 	char *cmp_buffer;
 	gfp_t gfp;
 
-	cmp_buffer = kmalloc(BUF_SIZE, GFP_KERNEL);
-	if (!cmp_buffer)
-		return;
+	cmp_buffer = kunit_kmalloc(kunittest, BUF_SIZE, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(kunittest, cmp_buffer);
 
 	flags = 0;
-	page_flags_test(0, 0, 0, 0, 0, flags, "", cmp_buffer);
+	page_flags_test(kunittest, 0, 0, 0, 0, 0, flags, "", cmp_buffer);
 
 	flags = 1UL << NR_PAGEFLAGS;
-	page_flags_test(0, 0, 0, 0, 0, flags, "", cmp_buffer);
+	page_flags_test(kunittest, 0, 0, 0, 0, 0, flags, "", cmp_buffer);
 
 	flags |= 1UL << PG_uptodate | 1UL << PG_dirty | 1UL << PG_lru
 		| 1UL << PG_active | 1UL << PG_swapbacked;
-	page_flags_test(1, 1, 1, 0x1fffff, 1, flags,
+	page_flags_test(kunittest, 1, 1, 1, 0x1fffff, 1, flags,
 			"uptodate|dirty|lru|active|swapbacked",
 			cmp_buffer);
 
@@ -739,11 +664,9 @@ flags(void)
 							(unsigned long) gfp);
 	gfp |= __GFP_HIGH;
 	test(cmp_buffer, "%pGg", &gfp);
-
-	kfree(cmp_buffer);
 }
 
-static void fwnode_pointer(void)
+static void fwnode_pointer(struct kunit *kunittest)
 {
 	const struct software_node first = { .name = "first" };
 	const struct software_node second = { .name = "second", .parent = &first };
@@ -757,8 +680,7 @@ static void fwnode_pointer(void)
 
 	rval = software_node_register_node_group(group);
 	if (rval) {
-		kunit_warn(kunittest, "cannot register softnodes; rval %d", rval);
-		return;
+		kunit_skip(kunittest, "cannot register softnodes; rval %d", rval);
 	}
 
 	test(full_name_second, "%pfw", software_node_fwnode(&second));
@@ -770,7 +692,7 @@ static void fwnode_pointer(void)
 	software_node_unregister_node_group(group);
 }
 
-static void fourcc_pointer(void)
+static void fourcc_pointer(struct kunit *kunittest)
 {
 	struct {
 		u32 code;
@@ -788,13 +710,13 @@ static void fourcc_pointer(void)
 }
 
 static void
-errptr(void)
+errptr(struct kunit *kunittest)
 {
 	test("-1234", "%pe", ERR_PTR(-1234));
 
 	/* Check that %pe with a non-ERR_PTR gets treated as ordinary %p. */
 	BUILD_BUG_ON(IS_ERR(PTR));
-	test_hashed("%pe", PTR);
+	test_hashed(kunittest, "%pe", PTR);
 
 #ifdef CONFIG_SYMBOLIC_ERRNAME
 	test("(-ENOTSOCK)", "(%pe)", ERR_PTR(-ENOTSOCK));
@@ -807,65 +729,54 @@ errptr(void)
 #endif
 }
 
-static void
-test_pointer(void)
-{
-	plain();
-	null_pointer();
-	error_pointer();
-	invalid_pointer();
-	symbol_ptr();
-	kernel_ptr();
-	struct_resource();
-	struct_range();
-	addr();
-	escaped_str();
-	hex_string();
-	mac();
-	ip();
-	uuid();
-	dentry();
-	struct_va_format();
-	time_and_date();
-	struct_clk();
-	bitmap();
-	netdev_features();
-	flags();
-	errptr();
-	fwnode_pointer();
-	fourcc_pointer();
-}
-
-static void printf_test(struct kunit *test)
+static int printf_suite_init(struct kunit_suite *suite)
 {
+	total_tests = 0;
+
 	alloced_buffer = kmalloc(BUF_SIZE + 2*PAD_SIZE, GFP_KERNEL);
 	if (!alloced_buffer)
-		return;
+		return -ENOMEM;
 	test_buffer = alloced_buffer + PAD_SIZE;
 
-	kunittest = test;
-
-	test_basic();
-	test_number();
-	test_string();
-	test_pointer();
-
-	kfree(alloced_buffer);
-}
-
-static int printf_suite_init(struct kunit_suite *suite)
-{
-	total_tests = 0;
 	return 0;
 }
 
 static void printf_suite_exit(struct kunit_suite *suite)
 {
+	kfree(alloced_buffer);
+
 	kunit_info(suite, "ran %u tests", total_tests);
 }
 
 static struct kunit_case printf_test_cases[] = {
-	KUNIT_CASE(printf_test),
+	KUNIT_CASE(test_basic),
+	KUNIT_CASE(test_number),
+	KUNIT_CASE(test_string),
+	KUNIT_CASE(hash_pointer),
+	KUNIT_CASE(null_pointer),
+	KUNIT_CASE(error_pointer),
+	KUNIT_CASE(invalid_pointer),
+	KUNIT_CASE(symbol_ptr),
+	KUNIT_CASE(kernel_ptr),
+	KUNIT_CASE(struct_resource),
+	KUNIT_CASE(struct_range),
+	KUNIT_CASE(addr),
+	KUNIT_CASE(escaped_str),
+	KUNIT_CASE(hex_string),
+	KUNIT_CASE(mac),
+	KUNIT_CASE(ip4),
+	KUNIT_CASE(ip6),
+	KUNIT_CASE(uuid),
+	KUNIT_CASE(dentry),
+	KUNIT_CASE(struct_va_format),
+	KUNIT_CASE(time_and_date),
+	KUNIT_CASE(struct_clk),
+	KUNIT_CASE(bitmap),
+	KUNIT_CASE(netdev_features),
+	KUNIT_CASE(flags),
+	KUNIT_CASE(errptr),
+	KUNIT_CASE(fwnode_pointer),
+	KUNIT_CASE(fourcc_pointer),
 	{}
 };
 

-- 
2.48.1


