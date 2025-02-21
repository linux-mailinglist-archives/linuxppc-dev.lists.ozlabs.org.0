Return-Path: <linuxppc-dev+bounces-6383-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0B0A4010C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2025 21:35:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z021K165Nz30C5;
	Sat, 22 Feb 2025 07:34:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f36"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740170085;
	cv=none; b=PoJZjnUc26JoPIbnU1z6I8Ys+UfWq9GdAHEgc+REDh3NmAImQ8hCrFEDx6NyjkdQ1g2iTAH2gV/Ud+DFjzKsFWe7teUkX48/5f2IyIQyV+zhwAaUZUhgcWCrBu6tenpwIFKQT/7+OEKCoAr6OD7hr+iI1l4zOYx3bhBqJ/gc5Rb6h46fcnQ7q8rvUYINbpERKWhx3ojCudA03UGdHFtHmEOaLOQzO4PhUFAPXLXxWKcFqEz5MHC09rMSn+niMA02x/Ig5ZKDeV4x+sGqWcIgacWSsJcPINqxyBYBE44oMaER6RkpuMimyU5mrRbuqlvMJIpzhvtYFThsUwW2Be2F7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740170085; c=relaxed/relaxed;
	bh=Eoi45DrFExaeO8JTjw8qgTrj/TOzu6Gqxn36YdKMoVM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fxgY2uBJR4El0IMybwsrilxM9D4Q40mRwYf7Mx7wDijNyntQMVqzYlixucS9uwh66FgBsz5IJ/EH7I+4yA6z38WViieBort+enaQs6LT0W0kFdl6xf5eDmu+xo4ME1C0vrv+9Ym0kcwwGAKI9JwaBf5Boa+yJFq0X+qXZOmx7UyDtgUJBRRRUDQWclHI/LUtthwSL1gLkoZhkbl0n0YhzCj7yoE9B/kJhWuxvEjjxxnQgRDbQOcBv9uZxBGXiVLGUq9rabGoUj2RXrfiRiURzzqmtgBvueTpsEO/f1BWGCVZF2ObnAjLmibDypwvdTYGHScTQrK/8Lj8xsBmTzZU2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cTVsvcMQ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f36; helo=mail-qv1-xf36.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cTVsvcMQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f36; helo=mail-qv1-xf36.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z021H4Ndyz2yVG
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Feb 2025 07:34:43 +1100 (AEDT)
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6df83fd01cbso12384556d6.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Feb 2025 12:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740170081; x=1740774881; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eoi45DrFExaeO8JTjw8qgTrj/TOzu6Gqxn36YdKMoVM=;
        b=cTVsvcMQiE133yzJF/nOMP7aZOVu7eWlk+r8/k03EVJkoTSvWCU6ezVrzPzAWrwkQU
         4PcZ+RfIGL8aB/ZZSyyTtvCNG8aXeRJIbxgiODn8gwJj4EyP6/G/fcNUcWpzI+9jyM2N
         6ppAdGXP5rKIMdK5bzpWf9kPbjMqibJoXYQbCCtKV3v+ujiQcuJmD9Fki55TCVBDkQRO
         04C46BYzC4JEG/STRWfgQ6vZLywdL3DRGTEDsDAHQtc/q8SUeQEA0R1/thFSSmqxZCkU
         Vo1BF6QcrxlIuiLBgUNEwqCLu6Qz2ihWv+fXUbpPmgI5F7MlZgY79PicR642ws9bWbm7
         /F0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740170081; x=1740774881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eoi45DrFExaeO8JTjw8qgTrj/TOzu6Gqxn36YdKMoVM=;
        b=nLHetXUNaqO5LJZx6x5suF4e9Dq3maoTzf9brT1WYXPp8rVtpP0N/Fak8M+xgfbn+V
         7Q5FryfhyGuZk1kaGg7lr5YqVb7q1mT2R2HQWB8qyPshg4YhdqozO8TnRkl5OHkdxRNY
         BU/zv8h7QKYu1chPqBqLcbzId/fvj0KsZQtQ0JprdVHE6WmIsA8cB9AJH5buMyuTh2WA
         UhDQ6GgWn5ldrRhEMq7/BErskJssFIFJHFJrjsoomyjwKbTU+Txg0T5Y8VOJUJVQonFS
         9nXExdIPfBQTQ9SXtnQ0Sw8TOwbC67imxAiTCWeO4B2ODp0kwPRqQ+AUC+SuOQR3qOG8
         yVEw==
X-Forwarded-Encrypted: i=1; AJvYcCXALM4wsgH6GaVuVUEhkvf3IUiXza7xn8jVL0s4icsO9vuk/XUikAM3MLAR5JqhuANgGrp3sbj1NxnrNhA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzKYvt/xdXU0TJflDeO6fw+afPLldSwzKa2bKDK06Wo865hBDmB
	COiy2IBF8K1vR273VerPbI6RV/BfUTDJd9VO9bloliCqJh5ywszB
X-Gm-Gg: ASbGncsYK+4UaVIlVJoFzDBqZj5lS1dSOSmRgLIokAmia9/Dm5xZGirbRWH9li6V4Hy
	LhnaDjgr1p9RO7JzQ75gnwwenJKdmSp4mxWSnqmFON5ItLZNywsV/5x/0UEBLpZPNLESW/CrKUj
	nPoL17tii+8/N2aT8PqDT9sO+YF6QeWIbfTygghur4u+rxBfPQM/aLD4Kras0tspq+3Qv9ImvaR
	SysqLIVDhkvesLJC1BS1muiA5HIgSKCph+IvoNKZOmJV8n8lew0rLqqxho9sGfd4U8IzpzOhLuh
	k9Y1ea+4Rz+SZ/SHTCQIrfUjnewUJExKnIcuCWpuguMf2lVyBA==
X-Google-Smtp-Source: AGHT+IHZk626/PCbkUmvjSlL6T9hQUoiEhcd/cjugAXTLDwX+GAde7Djl8OMDd5sudOZWoO2zG+F+w==
X-Received: by 2002:a05:6214:2422:b0:6d8:9a85:5b44 with SMTP id 6a1803df08f44-6e6ae9959bdmr52539466d6.29.1740170081234;
        Fri, 21 Feb 2025 12:34:41 -0800 (PST)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:880f:47d4:56c6:b852])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e65d9f36easm101677546d6.74.2025.02.21.12.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 12:34:40 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 21 Feb 2025 15:34:32 -0500
Subject: [PATCH v5 3/3] printf: implicate test line in failure messages
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
Message-Id: <20250221-printf-kunit-convert-v5-3-5db840301730@gmail.com>
References: <20250221-printf-kunit-convert-v5-0-5db840301730@gmail.com>
In-Reply-To: <20250221-printf-kunit-convert-v5-0-5db840301730@gmail.com>
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

This improves the failure output by pointing to the failing line at the
top level of the test, e.g.:
      # test_number: EXPECTATION FAILED at lib/printf_kunit.c:103
  lib/printf_kunit.c:167: vsnprintf(buf, 256, "%#-12x", ...) wrote '0x1234abcd  ', expected '0x1234abce  '
      # test_number: EXPECTATION FAILED at lib/printf_kunit.c:142
  lib/printf_kunit.c:167: kvasprintf(..., "%#-12x", ...) returned '0x1234abcd  ', expected '0x1234abce  '

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 lib/tests/printf_kunit.c | 62 ++++++++++++++++++++++++++----------------------
 1 file changed, 34 insertions(+), 28 deletions(-)

diff --git a/lib/tests/printf_kunit.c b/lib/tests/printf_kunit.c
index 013df6f6dd49..ed6e708ddb61 100644
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
@@ -53,21 +53,24 @@ do_test(struct kunit *kunittest, int bufsize, const char *expect, int elen,
 	va_end(aq);
 
 	if (ret != elen) {
-		KUNIT_FAIL(kunittest, "vsnprintf(buf, %d, \"%s\", ...) returned %d, expected %d",
-			   bufsize, fmt, ret, elen);
+		KUNIT_FAIL(kunittest,
+			   "%s:%d: vsnprintf(buf, %d, \"%s\", ...) returned %d, expected %d",
+			   file, line, bufsize, fmt, ret, elen);
 		return;
 	}
 
 	if (memchr_inv(alloced_buffer, FILL_CHAR, PAD_SIZE)) {
-		KUNIT_FAIL(kunittest, "vsnprintf(buf, %d, \"%s\", ...) wrote before buffer",
-			   bufsize, fmt);
+		KUNIT_FAIL(kunittest,
+			   "%s:%d: vsnprintf(buf, %d, \"%s\", ...) wrote before buffer",
+			   file, line, bufsize, fmt);
 		return;
 	}
 
 	if (!bufsize) {
 		if (memchr_inv(test_buffer, FILL_CHAR, BUF_SIZE + PAD_SIZE)) {
-			KUNIT_FAIL(kunittest, "vsnprintf(buf, 0, \"%s\", ...) wrote to buffer",
-				   fmt);
+			KUNIT_FAIL(kunittest,
+				   "%s:%d: vsnprintf(buf, 0, \"%s\", ...) wrote to buffer",
+				   file, line, fmt);
 		}
 		return;
 	}
@@ -75,33 +78,36 @@ do_test(struct kunit *kunittest, int bufsize, const char *expect, int elen,
 	written = min(bufsize-1, elen);
 	if (test_buffer[written]) {
 		KUNIT_FAIL(kunittest,
-			   "vsnprintf(buf, %d, \"%s\", ...) did not nul-terminate buffer",
-			   bufsize, fmt);
+			   "%s:%d: vsnprintf(buf, %d, \"%s\", ...) did not nul-terminate buffer",
+			   file, line, bufsize, fmt);
 		return;
 	}
 
 	if (memchr_inv(test_buffer + written + 1, FILL_CHAR, bufsize - (written + 1))) {
 		KUNIT_FAIL(kunittest,
-			   "vsnprintf(buf, %d, \"%s\", ...) wrote beyond the nul-terminator",
-			   bufsize, fmt);
+			   "%s:%d: vsnprintf(buf, %d, \"%s\", ...) wrote beyond the nul-terminator",
+			   file, line, bufsize, fmt);
 		return;
 	}
 
 	if (memchr_inv(test_buffer + bufsize, FILL_CHAR, BUF_SIZE + PAD_SIZE - bufsize)) {
-		KUNIT_FAIL(kunittest, "vsnprintf(buf, %d, \"%s\", ...) wrote beyond buffer",
-			   bufsize, fmt);
+		KUNIT_FAIL(kunittest,
+			   "%s:%d: vsnprintf(buf, %d, \"%s\", ...) wrote beyond buffer",
+			   file, line, bufsize, fmt);
 		return;
 	}
 
 	if (memcmp(test_buffer, expect, written)) {
-		KUNIT_FAIL(kunittest, "vsnprintf(buf, %d, \"%s\", ...) wrote '%s', expected '%.*s'",
-			   bufsize, fmt, test_buffer, written, expect);
+		KUNIT_FAIL(kunittest,
+			   "%s:%d: vsnprintf(buf, %d, \"%s\", ...) wrote '%s', expected '%.*s'",
+			   file, line, bufsize, fmt, test_buffer, written, expect);
 		return;
 	}
 }
 
-static void __printf(4, 0)
-__test(struct kunit *kunittest, const char *expect, int elen, const char *fmt, ...)
+static void __printf(6, 0)
+__test(struct kunit *kunittest, const char *file, const int line, const char *expect, int elen,
+	const char *fmt, ...)
 {
 	va_list ap;
 	int rand;
@@ -109,8 +115,8 @@ __test(struct kunit *kunittest, const char *expect, int elen, const char *fmt, .
 
 	if (elen >= BUF_SIZE) {
 		KUNIT_FAIL(kunittest,
-			   "error in test suite: expected length (%d) >= BUF_SIZE (%d). fmt=\"%s\"",
-			   elen, BUF_SIZE, fmt);
+			   "%s:%d: error in test suite: expected length (%d) >= BUF_SIZE (%d). fmt=\"%s\"",
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
-				   "kvasprintf(..., \"%s\", ...) returned '%s', expected '%s'",
-				   fmt, p, expect);
+				   "%s:%d: kvasprintf(..., \"%s\", ...) returned '%s', expected '%s'",
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


