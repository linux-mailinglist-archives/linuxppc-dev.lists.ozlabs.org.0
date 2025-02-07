Return-Path: <linuxppc-dev+bounces-5949-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE190A2CDEA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2025 21:14:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YqQD65jlDz30V7;
	Sat,  8 Feb 2025 07:14:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::72f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738959254;
	cv=none; b=PQ/P2odH4FEaWIytCqox6TSBVPqChrHZ4pq5uDho+Ovefk0dfl/w3YkeSUtkAANUYXcTZwDvvvcKjQSjQZaT38wGUTNwco0SDwH9Lo/iwKyx6RC2S1IMvKHHuesse9hoccwkV5b5a21YpiduYFZcIBg4iR4omU6GHL8bjXWnGCcInHZAceDY7pIX/9xj0/7N7FZTvgWIGyXmPb+EQqz/eltKzyCRd+fYnZv9H98+rde909RSLDsbSQbf9cZFU71ypFJRXCwPnRE0yGw1KGiMtXbwYJJkvbjxCGHr09zUOsohWwchdkcueUwg9GUlMtWyH8WuaLlEnbJuxJW0CUt0Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738959254; c=relaxed/relaxed;
	bh=NZxkSETWBGyS9QsIncAjdUCkDXpgCrsMQVJ3J6dEfbc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AhPnmVjHWYVoIrfR90G9JXAiGQ2S2VUsWOc1kLeVo+U5qtReQenKmZUJFUU2VBUJxJvZAm0WJket038BSxdZEczkbI+PGv//WTTgN2uK58KU/HTLcVU2lOU5rBZYi0uIwYt02QbPlgCXu9zfwGvjauzPsAz0ytzDPPMsH+ndcLKNku/rh2/FQN4k+43WnYktkpDbZC+tZrCWbu/kuWVQKOHaucJSFJjzI2cckrlXpM6ZsXq+oaV4gi9z3nx/PHZ6Tq7qUAffIRn72hFHHk8dOvksw5al4ztAyPUA6DKRfQPUMvrnyquX+MT/ln+Cckb0N2xVGFmDEuuoKZbfhnHmvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=clS4l3ED; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::72f; helo=mail-qk1-x72f.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=clS4l3ED;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72f; helo=mail-qk1-x72f.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YqQD53rzYz30TY
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2025 07:14:12 +1100 (AEDT)
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7be8efa231aso228367585a.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Feb 2025 12:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738959250; x=1739564050; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZxkSETWBGyS9QsIncAjdUCkDXpgCrsMQVJ3J6dEfbc=;
        b=clS4l3EDhYgsgnUtILrJvAterOssxZGB7swPd+A90ChweR5yFnhQYhC9zT9kZDyXde
         lRNrxs0qd4fR7O0oos0gC6JrD6dvMdRBqJZgzB3hpa8VcD9wPrU+GirIvq+ocRj2XeQ5
         YDTDGPGd90Oe3CFzUEpZqRnJonrouWpIesiO/MPFFVufLP/u5v33krCXPpZUdpL99qzN
         0/XLSo9YWvIJQkZ7YfmbpiEvGveb7VnpGE0Sxr01SoqGeskdihPws2crFTepEC2T3g+i
         PChbBkErDb6xjyoNta2ZwjtW17PW5lsTtMsmracMjuE+/74u7VSI4b+z/Iw9b5HY7pkK
         6VcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738959250; x=1739564050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZxkSETWBGyS9QsIncAjdUCkDXpgCrsMQVJ3J6dEfbc=;
        b=jPGHLOJXajxuyRuN+aRe6LPdVJVP2fkyZC5A6iLfkepMid6SZKyyoKxyxMW3KmBj+7
         VCCL9MVELW21JWRykLD7CuTtH3JMhlmsRkOEMy+Aj+04BIrgUvHtv5aIuGLSA8Q7d9jt
         REWZ45DPE79NqOWZF8G+s0AwvwxXktsVkj1SFu2xBEUsG79qr7az0QewkZQs0xEupvYe
         a76VAuCXGpHhXbSSBzLSdBTEdyUgQ5ZeTcf3LuXbPwuTBRVKJZVU2qqcvC+fS5U641zH
         d4oIPXQxZWs8SK2qZFmjKiooMLFJ4hFMaWBi7bVbLepZSgQCTtrfR5dCBi0E+pxmot71
         y10w==
X-Forwarded-Encrypted: i=1; AJvYcCXKP434ffykolB8QmnA1Fqeq48iDSzvqMQCm0SYO8hppMM70oZoh3wW5+SephKOtEOHc3+7myjVwkoAzGQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yybwzjbr0B9+N51dR9mlEZVKj4AwiS1XVZz3DbAiFg/XLIud33D
	MwowjhULJOTHeFb0Cd8ypW67OLUymo9J5UA34JmKfmhR7HDAPzR+
X-Gm-Gg: ASbGncsQwnewrVqEUWr6LRo09DYdMNp8gPiOqa5/SMtQ2FtnuohlM9EJXhjL2Q/fi1S
	+JIlXn3AJEHbRS4cL872H4b2R6v3LLEVc+c2y0DS4eXZjyMJxytVk/A+cPWHpfFcJebWLsj8OlA
	olZWCyhGUCtvw/D1HLgeLjgSzuJEjMUM33YcujPDuYsRldtkdA/zP3CSCM+RTWJtLl67IcjH2Ux
	8XBRN0rGZTrgQA+QXibhnHOte9pb+y200S6M/XGYjs4D2o7TRiGlcI5z+TCUDCiIC0Mr2/3sjGT
	SOoo1PVjzW9RLqdl72iZBKc7+qjfxh/JB3LRuV+vtkOhFUuZ+MhC5oO6o5wYreXgwPC3FFQy548
	/lIHaZ5p88ajSbuCZGVh8dHXDJryXqvn6LqMCmA==
X-Google-Smtp-Source: AGHT+IFu3LnMnZppr9scjvCc/cSU/9PZACsPok2gL4YMsF6uEMfT/WzvaxNeLs4vM8mQeUo9sHI+ow==
X-Received: by 2002:a05:620a:2621:b0:7be:2a68:6d79 with SMTP id af79cd13be357-7c047c34ad5mr860389785a.7.1738959249714;
        Fri, 07 Feb 2025 12:14:09 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:4041:5be7:7c00:c58e:ed03:1b60:c56d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c041e13895sm228851285a.58.2025.02.07.12.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 12:14:09 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 07 Feb 2025 15:14:02 -0500
Subject: [PATCH 1/3] bitmap: remove _check_eq_u32_array
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
Message-Id: <20250207-bitmap-kunit-convert-v1-1-c520675343b6@gmail.com>
References: <20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com>
In-Reply-To: <20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com>
To: David Gow <davidgow@google.com>, John Hubbard <jhubbard@nvidia.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Shuah Khan <shuah@kernel.org>, 
 Kees Cook <kees@kernel.org>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>, 
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This has been unused since commit 3aa56885e516 ("bitmap: replace
bitmap_{from,to}_u32array") in 2018. Remove it to avoid the need to port
it to KUnit in this series.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 lib/test_bitmap.c | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/lib/test_bitmap.c b/lib/test_bitmap.c
index 65a75d58ed9e..c83829ef557f 100644
--- a/lib/test_bitmap.c
+++ b/lib/test_bitmap.c
@@ -100,34 +100,6 @@ __check_eq_pbl(const char *srcfile, unsigned int line,
 	return true;
 }
 
-static bool __init
-__check_eq_u32_array(const char *srcfile, unsigned int line,
-		     const u32 *exp_arr, unsigned int exp_len,
-		     const u32 *arr, unsigned int len) __used;
-static bool __init
-__check_eq_u32_array(const char *srcfile, unsigned int line,
-		     const u32 *exp_arr, unsigned int exp_len,
-		     const u32 *arr, unsigned int len)
-{
-	if (exp_len != len) {
-		pr_warn("[%s:%u] array length differ: expected %u, got %u\n",
-			srcfile, line,
-			exp_len, len);
-		return false;
-	}
-
-	if (memcmp(exp_arr, arr, len*sizeof(*arr))) {
-		pr_warn("[%s:%u] array contents differ\n", srcfile, line);
-		print_hex_dump(KERN_WARNING, "  exp:  ", DUMP_PREFIX_OFFSET,
-			       32, 4, exp_arr, exp_len*sizeof(*exp_arr), false);
-		print_hex_dump(KERN_WARNING, "  got:  ", DUMP_PREFIX_OFFSET,
-			       32, 4, arr, len*sizeof(*arr), false);
-		return false;
-	}
-
-	return true;
-}
-
 static bool __init __check_eq_clump8(const char *srcfile, unsigned int line,
 				    const unsigned int offset,
 				    const unsigned int size,

-- 
2.48.1


