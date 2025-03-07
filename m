Return-Path: <linuxppc-dev+bounces-6816-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B51FAA574C1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Mar 2025 23:10:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z8gSq4JQ5z3cWd;
	Sat,  8 Mar 2025 09:10:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::736"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741385403;
	cv=none; b=F3ir0nR4fgav1Ei17CZumEjZCjRV7Kv34ZhHzvSv8WifjxkndTJaj+xB4a7XEEvxvGQAvxkOMzm+h4rX8wOdnrmzy4daVsvsVIiV2KvbY5LiT7NyWnh6tvqMcqj7Klo1thbKQQQhlR/uHm/M3Az4xa5Het6F/zsiwD2uspIkM//C8SxCc+stIEX4zCDSWLLWffhJYjJGBsRQkF/IWhimS3dvLcCvmXxh2RoX+LcKu310W9hZJTlw4T7Lakg7H/t0gG21v3kV9IGBfP0zxL470jm2HEPqhEjggbkwlVKp78xF4nkENNQK2qU45X+QuhKD57sVUdeNfbe+nHuxr7pugg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741385403; c=relaxed/relaxed;
	bh=67u4yKx69wt0LUt2XYoCDntO5OlMzTpGLsqyjTaA95c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HtRwrOUfWJbHGyjgLB6cJhVjwtq/DmZ4h5paaTxwpJAL7ywo4cDxUSp+EVS+2tarnyeIsrH7YPanhudcl41yMJYOVyAFIy3Q0HUBkw3Ctt+nYDDlVtz4UX1Ea/ERCuUuokzSV9s+M0AFfkIghAXfc22ZWap7RJ8TOF7xFA4ldqpMKdn/pkWjyWxxky8rodtxIxfwLhmkhV/t3RkH3EbdbvoymEVZQGh8XaZyR0gTun9VlonmNndE0ukGAsj+o1Dx8QLH73LVQHU+nfzuhH5LDvfK/9SYUAf4Xc+QyBe7dikcvfnSskyQXrXbHpPgMZLNcioXDlq820mJEAnqrKKWdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jVAW4esD; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::736; helo=mail-qk1-x736.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jVAW4esD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::736; helo=mail-qk1-x736.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z8gSn668fz3cW8
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Mar 2025 09:10:01 +1100 (AEDT)
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7c3d591e50aso256109085a.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Mar 2025 14:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741385399; x=1741990199; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=67u4yKx69wt0LUt2XYoCDntO5OlMzTpGLsqyjTaA95c=;
        b=jVAW4esDnRwzaPnzx3qcf5pPQP930VO7U6X67jO5/bg2sIfs7XMdzwtRYVKf1unWNn
         oRDggM/K5U3ZEawPiRkKiboBZn58icjeEY55jUuGzIaTdcgJJsTfY7qDJR9wXjeH/i2a
         znGbgNb5SPt+4vq2FXlJ88IdW+1Wq6KO8SDZhmZV9pvN6RtsYB7LbNSxj7qOiQcHfa8F
         GDf2DV3MWG65ZgLo6HiSljmdzRfJGla6kvMzEUxrtk5P0NbYPOL4NRGyBWJDI+/ioEnP
         wmFq9x002NGB73gPQ5erRNBp4Q/Aq3DGQx/LBChsr7XP1AQuibPaMk0k9RVwoFOy4KJF
         TUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741385399; x=1741990199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=67u4yKx69wt0LUt2XYoCDntO5OlMzTpGLsqyjTaA95c=;
        b=OfJlOZu8niNMoCEPKjYPyssdCNyNvguLUEhmF7YJv6syVYH295Wto5ZjhGGOWZNXmP
         uE2MW7RTY65vje7TLQLuPNQ/8jWCeILK5fu1cSk1J6/gIQafN/LPTbpCvOUXWLuOTZfX
         bnvxe6FeGhKbHM/f4s0ywBgZgxVAeLYef5vTp5/ucXIhbPVvy17eLQS7B9uhs7RSYfvw
         sAABttZTXZUcggaBsYQI8o5aIF5w1yWhlyQ7Ia+De6896boD9sQyr++o+LMUIdgjhNsr
         o9clhnMyRQ8Pd6e1IFEZF/Z9yDWiKFufKtVewUNnaEQ4FAMYF+O7jVQ6ENm2azywmKxy
         l8/w==
X-Forwarded-Encrypted: i=1; AJvYcCXFIOYjNMMhxLp8wchEqwP0pIYmeMJl5YDAAR62qjdBroNluWyjaI82N7GKGEvWgAcyTO5HDLQjhnbu3Cw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxQeUTMcTcQXdU1e10W3WiDQONgxFzRos+noH9ZJu8p0vGB7E/6
	F4isx3NAjDZSk3BAzwHH23KXYSkrTsA1Khzu8CUEIppx5dvX60DKMtRs9M8r+2I=
X-Gm-Gg: ASbGncvIj3viXMOKA2OO96REifHHSirf2y84MNlXZrgGsEdJKFrm/uVMjgHSyqBwYNc
	FSqqWk7fI9ESXNL5FtLDex1gs1ftoaV2+AH+IDOiOvkruClZ/fqhCIU1JfJGx+ATbfpUKPz2FGX
	Mwbp1h+kS9M2Nzv3liDI/OpP4+G7bF+ZH52Hf2wnul3YFW++M1LbUNLLt7n8uHVdVtYXX8vYxYB
	tFDMJV//hg7L3bwRFyWQMWCDV6h7U+6+Jx/A9sn5IZzOUsj9Nf8/Omw+8G0uAKlskKT0ALTQfm9
	YN0+jBbMob1mwcXG5wItSR15zBBmDhP4iDrkp3QuW2RMp0vYRNfcCEvXHsISpO4xCvhhv3CPwoT
	S
X-Google-Smtp-Source: AGHT+IEai4ZR+GPg9IqBNC11z36R1pgnxaE5azU4DgOMhWO/Agxa1FtzDoKPPOy7rPFAxzIZLqbVOw==
X-Received: by 2002:a05:620a:6501:b0:7c3:9cdd:55a3 with SMTP id af79cd13be357-7c4e1679b53mr826383785a.9.1741385399513;
        Fri, 07 Mar 2025 14:09:59 -0800 (PST)
Received: from 1.0.0.127.in-addr.arpa ([2600:4041:5be7:7c00:f0dd:49a0:8ab6:b3b6])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c3e533a095sm295001385a.3.2025.03.07.14.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 14:09:58 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 07 Mar 2025 17:08:58 -0500
Subject: [PATCH v6 3/3] printf: implicate test line in failure messages
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
Message-Id: <20250307-printf-kunit-convert-v6-3-4d85c361c241@gmail.com>
References: <20250307-printf-kunit-convert-v6-0-4d85c361c241@gmail.com>
In-Reply-To: <20250307-printf-kunit-convert-v6-0-4d85c361c241@gmail.com>
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
 linuxppc-dev@lists.ozlabs.org, workflows@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This improves the failure output by pointing to the failing line at the
top level of the test, e.g.:
      # test_number: EXPECTATION FAILED at lib/printf_kunit.c:103
  lib/printf_kunit.c:167: vsnprintf(buf, 256, "%#-12x", ...) wrote '0x1234abcd  ', expected '0x1234abce  '
      # test_number: EXPECTATION FAILED at lib/printf_kunit.c:142
  lib/printf_kunit.c:167: kvasprintf(..., "%#-12x", ...) returned '0x1234abcd  ', expected '0x1234abce  '

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 lib/tests/printf_kunit.c | 60 ++++++++++++++++++++++++++----------------------
 1 file changed, 33 insertions(+), 27 deletions(-)

diff --git a/lib/tests/printf_kunit.c b/lib/tests/printf_kunit.c
index dd373cb9036a..2c9f6170bacd 100644
--- a/lib/tests/printf_kunit.c
+++ b/lib/tests/printf_kunit.c
@@ -38,9 +38,9 @@ static unsigned int total_tests;
 static char *test_buffer;
 static char *alloced_buffer;
 
-static void __printf(5, 0)
-do_test(struct kunit *kunittest, int bufsize, const char *expect, int elen,
-	const char *fmt, va_list ap)
+static void __printf(7, 0)
+do_test(struct kunit *kunittest, const char *file, const int line, int bufsize, const char *expect,
+	int elen, const char *fmt, va_list ap)
 {
 	va_list aq;
 	int ret, written;
@@ -53,20 +53,24 @@ do_test(struct kunit *kunittest, int bufsize, const char *expect, int elen,
 	va_end(aq);
 
 	if (ret != elen) {
-		KUNIT_FAIL(kunittest, "vsnprintf(buf, %d, \"%s\", ...) returned %d, expected %d\n",
-			   bufsize, fmt, ret, elen);
+		KUNIT_FAIL(kunittest,
+			   "%s:%d: vsnprintf(buf, %d, \"%s\", ...) returned %d, expected %d\n",
+			   file, line, bufsize, fmt, ret, elen);
 		return;
 	}
 
 	if (memchr_inv(alloced_buffer, FILL_CHAR, PAD_SIZE)) {
-		KUNIT_FAIL(kunittest, "vsnprintf(buf, %d, \"%s\", ...) wrote before buffer\n",
-			   bufsize, fmt);
+		KUNIT_FAIL(kunittest,
+			   "%s:%d: vsnprintf(buf, %d, \"%s\", ...) wrote before buffer\n",
+			   file, line, bufsize, fmt);
 		return;
 	}
 
 	if (!bufsize) {
 		if (memchr_inv(test_buffer, FILL_CHAR, BUF_SIZE + PAD_SIZE)) {
-			KUNIT_FAIL(kunittest, "vsnprintf(buf, 0, \"%s\", ...) wrote to buffer\n", fmt);
+			KUNIT_FAIL(kunittest,
+				   "%s:%d: vsnprintf(buf, 0, \"%s\", ...) wrote to buffer\n",
+				   file, line, fmt);
 		}
 		return;
 	}
@@ -74,34 +78,36 @@ do_test(struct kunit *kunittest, int bufsize, const char *expect, int elen,
 	written = min(bufsize-1, elen);
 	if (test_buffer[written]) {
 		KUNIT_FAIL(kunittest,
-			   "vsnprintf(buf, %d, \"%s\", ...) did not nul-terminate buffer\n",
-			   bufsize, fmt);
+			   "%s:%d: vsnprintf(buf, %d, \"%s\", ...) did not nul-terminate buffer\n",
+			   file, line, bufsize, fmt);
 		return;
 	}
 
 	if (memchr_inv(test_buffer + written + 1, FILL_CHAR, bufsize - (written + 1))) {
 		KUNIT_FAIL(kunittest,
-			   "vsnprintf(buf, %d, \"%s\", ...) wrote beyond the nul-terminator\n",
-			   bufsize, fmt);
+			   "%s:%d: vsnprintf(buf, %d, \"%s\", ...) wrote beyond the nul-terminator\n",
+			   file, line, bufsize, fmt);
 		return;
 	}
 
 	if (memchr_inv(test_buffer + bufsize, FILL_CHAR, BUF_SIZE + PAD_SIZE - bufsize)) {
-		KUNIT_FAIL(kunittest, "vsnprintf(buf, %d, \"%s\", ...) wrote beyond buffer\n",
-			   bufsize, fmt);
+		KUNIT_FAIL(kunittest,
+			   "%s:%d: vsnprintf(buf, %d, \"%s\", ...) wrote beyond buffer\n",
+			   file, line, bufsize, fmt);
 		return;
 	}
 
 	if (memcmp(test_buffer, expect, written)) {
 		KUNIT_FAIL(kunittest,
-			   "vsnprintf(buf, %d, \"%s\", ...) wrote '%s', expected '%.*s'\n",
-			   bufsize, fmt, test_buffer, written, expect);
+			   "%s:%d: vsnprintf(buf, %d, \"%s\", ...) wrote '%s', expected '%.*s'\n",
+			   file, line, bufsize, fmt, test_buffer, written, expect);
 		return;
 	}
 }
 
-static void __printf(4, 5)
-__test(struct kunit *kunittest, const char *expect, int elen, const char *fmt, ...)
+static void __printf(6, 7)
+__test(struct kunit *kunittest, const char *file, const int line, const char *expect, int elen,
+	const char *fmt, ...)
 {
 	va_list ap;
 	int rand;
@@ -109,8 +115,8 @@ __test(struct kunit *kunittest, const char *expect, int elen, const char *fmt, .
 
 	if (elen >= BUF_SIZE) {
 		KUNIT_FAIL(kunittest,
-			   "error in test suite: expected length (%d) >= BUF_SIZE (%d). fmt=\"%s\"\n",
-			   elen, BUF_SIZE, fmt);
+			   "%s:%d: error in test suite: expected length (%d) >= BUF_SIZE (%d). fmt=\"%s\"\n",
+			   file, line, elen, BUF_SIZE, fmt);
 		return;
 	}
 
@@ -122,19 +128,19 @@ __test(struct kunit *kunittest, const char *expect, int elen, const char *fmt, .
 	 * enough and 0), and then we also test that kvasprintf would
 	 * be able to print it as expected.
 	 */
-	do_test(kunittest, BUF_SIZE, expect, elen, fmt, ap);
+	do_test(kunittest, file, line, BUF_SIZE, expect, elen, fmt, ap);
 	rand = get_random_u32_inclusive(1, elen + 1);
 	/* Since elen < BUF_SIZE, we have 1 <= rand <= BUF_SIZE. */
-	do_test(kunittest, rand, expect, elen, fmt, ap);
-	do_test(kunittest, 0, expect, elen, fmt, ap);
+	do_test(kunittest, file, line, rand, expect, elen, fmt, ap);
+	do_test(kunittest, file, line, 0, expect, elen, fmt, ap);
 
 	p = kvasprintf(GFP_KERNEL, fmt, ap);
 	if (p) {
 		total_tests++;
 		if (memcmp(p, expect, elen+1)) {
 			KUNIT_FAIL(kunittest,
-				   "kvasprintf(..., \"%s\", ...) returned '%s', expected '%s'\n",
-				   fmt, p, expect);
+				   "%s:%d: kvasprintf(..., \"%s\", ...) returned '%s', expected '%s'\n",
+				   file, line, fmt, p, expect);
 		}
 		kfree(p);
 	}
@@ -142,7 +148,7 @@ __test(struct kunit *kunittest, const char *expect, int elen, const char *fmt, .
 }
 
 #define test(expect, fmt, ...)					\
-	__test(kunittest, expect, strlen(expect), fmt, ##__VA_ARGS__)
+	__test(kunittest, __FILE__, __LINE__, expect, strlen(expect), fmt, ##__VA_ARGS__)
 
 static void
 test_basic(struct kunit *kunittest)
@@ -153,7 +159,7 @@ test_basic(struct kunit *kunittest)
 	test("", &nul);
 	test("100%", "100%%");
 	test("xxx%yyy", "xxx%cyyy", '%');
-	__test(kunittest, "xxx\0yyy", 7, "xxx%cyyy", '\0');
+	__test(kunittest, __FILE__, __LINE__, "xxx\0yyy", 7, "xxx%cyyy", '\0');
 }
 
 static void

-- 
2.48.1


