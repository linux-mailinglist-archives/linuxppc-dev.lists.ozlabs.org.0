Return-Path: <linuxppc-dev+bounces-6208-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB7BA367DA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 22:53:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yvm4w6Yt4z30Tq;
	Sat, 15 Feb 2025 08:53:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::734"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739569984;
	cv=none; b=fDzs6cSDJ4TujIxAcW6m1exaRPJS0mJ7LmuGxm2k7+uU+lgog6PXUIe1R5froPWF5nqJZ4+zLUQpEz/q+HNW0wtbKotpi6xCxSpKsN5o1H0lDF13/XT6Oeqau7Raid8Fq8UXMBtAPaGP+wbwHIToNj9PQjQ6ZzKD10TttFvFzx5ZePQdk4Z9u2B+CSMzBPNC2O3i4BP4fy0ia6xVY2SVXVe03O870WvZEb0B6DLh/6m4w0c7KOEy5MS++7VI3Q58MeJ/epAJRnTxWCeJip6EQtN2sdjPBhIKjE1akqvWtTrPBsWE/CK/j9TSIP8nGHv2VVEeTDYmNWfHKQrydZeLzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739569984; c=relaxed/relaxed;
	bh=xFMliA0Dn/p4u+VrmfnKQQd+kfiJIGEDkR0ON34/fPY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JBKIBduPt/zXgjsalfj4w4Y8qCQbOwHYu8+h0c5VBVND5E0SWkgg44Zd/aEBBZB993AsNPmdjtk7GZKvIB4RZ7t1OkPZl14T9+YW673rogXlz3f8OWDoOADN9/xw9TmcbtziKu8tHLkh29dlBVrAtjjVesOJrH76rWfaeYodaRuKyVDS+b4uyAYBlEzrNPSjrLZmul8i2wvSoQA625SQpPLVURRjpCzBThlGCGkY6CN0EBTLIKa9S6MYUmvPoJnhI9X3suuXAe8nXZQlT6aAK9HIbSOA9XFHc69WKNINnfavADPJcmcKAA0tGQ4jKSZFPRe0HpRkmIX1pJh56xGpsQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QifWBbz5; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::734; helo=mail-qk1-x734.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QifWBbz5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::734; helo=mail-qk1-x734.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yvm4w1RQrz2ysX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2025 08:53:04 +1100 (AEDT)
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7c08621f6a2so88335685a.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 13:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739569982; x=1740174782; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFMliA0Dn/p4u+VrmfnKQQd+kfiJIGEDkR0ON34/fPY=;
        b=QifWBbz5CUiDdqUWvZ69IJx+8MJBytmtDclrA55CF6My37zY1YPQFRllg4Qe7tfWS1
         rXqRBNv98oP86KaTmcXptvKmUpJ/aFLW6BDxytMQ+80YkkdCmwD4vIUaQzENzZ8PUGjW
         4YMn9FwvdzZ4CgF8LCCdR+j1j0EXjx2OW/Fcx3H0Qqyb911/lY6xaSoVsourKAplPpOB
         qRv9PTpC3wd/KfIV2DRx/TchCY+mxxfrmLYcR6tKVDihtZu+vYcEq5bjqkxxmpmLYeef
         Xc0EiweTYLvFyE8Km71fzAUIwbe/NITgkh4wRRPX4bCl8Pydy6nMuyFjjQrhG6IFrNxC
         bV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739569982; x=1740174782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xFMliA0Dn/p4u+VrmfnKQQd+kfiJIGEDkR0ON34/fPY=;
        b=DT8kMHBG1dlxRvFgKDKCRrrvVGzzvSVxDZUTDtqOsJt28b5mH2qXMxrL+jtbUMVUil
         XM44gc6K2B6DazKGC0tUWVXV9a+7tZ1xJF2YC7xTiCHqTr2L1Q7BCxGNtYzEB2nhCyLd
         yUZ17bgM0rDd3KOESG8MAN/mAycwKMMxYjA3pfAx/GdZgdpwUt8FlHFnzfHVbr/aWXYF
         DH9IzpIU42IHRUzWHJM8Xf//7nY5Bhpp1o97gXOxiuM0HybbKE6FuoqZfy8YNKlLvqw5
         vCI9nXte4cJEf4EfXUZtXnPrgoxAcHmYiq05WbhIwwYM6EPX9xFwdqAAKDm5bIpR3se5
         CM4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXCY4HMm/jffjZ1ktyy/d6FnsdUsZvtRFds0jf8KPgW25yQe7F3tFC6yvXikqal0lrC7lL4xCA94Jh6+4I=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxyUqA8WPb2QKWqNmW+3tytQ04r46Cq0J/em/ZOMvcB8NB9ecxj
	AfT1Sw8E9y6dqNnCe9vO2FfnWGCgE0rS1Y1K4Z6/YnKRINScfoFT
X-Gm-Gg: ASbGncuaEt6HTCMfXrK7rL43QugVMcGHCBhYoxJZP+QE2Uy5MJIxlGd+0kOcuSrxE16
	fxr1SBqGBmnZmOwbQuOEeNb16fJL/9FPfOpdAELDmw2TeE5TgGeVKvdFKawI8WZ6iL7wj+f+yea
	RePzrEV6TBi6Bk2nWEXNyOiUFdPJXL2J1gc9WnWa2dJrK799kx+X63FFRgq04J01fKNThprTz1V
	nL7c//62zi8UC2q04q6zneZZzkPaNnKDPzACmjHtppBDc83bwDZ5ZB+hKrr2gaIjm8lO/Nlzp64
	u/8glnHH+Itn5PScisDRF9+WPc79YhRl4+KmMQ==
X-Google-Smtp-Source: AGHT+IFHRDJwKLMxI67DD6WpGbO1HVraQMP3bdVweoIapsF2KWSn8IFdluxVK/yBTsz5cTIjR/UZbQ==
X-Received: by 2002:a05:622a:241:b0:471:bce7:39e2 with SMTP id d75a77b69052e-471dbd234f4mr12562881cf.17.1739569981830;
        Fri, 14 Feb 2025 13:53:01 -0800 (PST)
Received: from [192.168.1.159] ([2600:4041:5be7:7c00:d4df:402c:65f0:87da])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-471c2af3367sm21844451cf.59.2025.02.14.13.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 13:53:00 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 14 Feb 2025 16:52:41 -0500
Subject: [PATCH v4 3/3] printf: implicate test line in failure messages
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
Message-Id: <20250214-printf-kunit-convert-v4-3-c254572f1565@gmail.com>
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
index 013df6f6dd49..aa5011156788 100644
--- a/lib/tests/printf_kunit.c
+++ b/lib/tests/printf_kunit.c
@@ -39,8 +39,8 @@ static char *test_buffer;
 static char *alloced_buffer;
 
 static void __printf(5, 0)
-do_test(struct kunit *kunittest, int bufsize, const char *expect, int elen,
-	const char *fmt, va_list ap)
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


