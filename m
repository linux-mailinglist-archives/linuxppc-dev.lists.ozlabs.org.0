Return-Path: <linuxppc-dev+bounces-6198-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DFAA361D5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 16:35:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yvbj54915z3blF;
	Sat, 15 Feb 2025 02:35:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739547321;
	cv=none; b=fi18fwMLVBqV6MpwR1YTALFdV5mgE9avfe3AP4fKpjF05YPPUtC2XPw21vxFQ3b/p7z7EQCvWIEmLfcF/Gb7U9VUovhKz5VbDXuMXuBUkko4PU3cvEvEo1y4v0NElWz0xgQkGU+fhzcN+MfYn+EJ33JAMx4a2NNJ9FZM4p+iLy1IiMuqDeDcd4IYmTP2nxfhJn02HY7p6OnRE4lsvs5hZ5ePntygpG6w9kHMSKF/kYa6Y/3/TdngjZ/mbIKDukPc47nf5+9KlTGufJ1/JdEplH4HXHxNBWkriqbMjK3DoUAT2AybuMz3408bQwTdDkTUlDpldw4gs6HFlYFT4vCErw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739547321; c=relaxed/relaxed;
	bh=Epi7Q+7wQY9RKlfsXwKc7BTRBEAbnD6Wjsq4fX0UxxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQ+uEecohg7fkYf4th5IIkvQzk8RjIt0+EG2jMi83r5NdSId7iVkgImMwpiLMF8caJdEQMvCj1o/wbBDmSrSQrY4RXfLFoZkK8M0mcWisfR45re4gbbRFOpQhvQkul1inp6vzsRRyWOKRskdciJIJ9sTyF8h2Dh2uqBhX9BmaFmUR4+oLS+S+W9cEbMZ+ICbpOClrfNn8KByqQfu+Nbo5w8zmDERgFPvH9dCM3hgcEQ+ltcxFX9hq8KBeueZH2jkdXeO5W+fGy6GJmhrhqbt2E4EFIv7a+1/z08Tx1dZHJc0kZOwAulNLYTVdSqwdr0OazN2+AiH/4+gjSFWMhTkzw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CObuytdr; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CObuytdr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yvbj439yRz2yGm
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2025 02:35:19 +1100 (AEDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-aaedd529ba1so265582966b.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 07:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739547315; x=1740152115; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Epi7Q+7wQY9RKlfsXwKc7BTRBEAbnD6Wjsq4fX0UxxY=;
        b=CObuytdrGf+dU4PU4rO3oOxBzTvSCc5UX06BkUIgVPK/Oy9YovyXWQjItTlWfVLhr0
         mXoE+J95c6sncdCks24uwPYww/f9RCZvbH3oWbvkGKwe5fPvaI6EG4f4BwQNr7Hnsypu
         /P+hYiTe4fijU0zUDSOIdMVrWrUaIoKjOzW7/4XbclnqX9o0uXmcMrQ9L9ZyzE0JuXul
         vzMc7DnkNdXZJuLoOUisOe0fyn7irFMnQnF6w1XP5sO+fUf8TjsmJYgsbvqLDQqVqiZm
         qJ5Nvu4KX0r6z5rKA7oQF2OmU/iOhOCk6krWd1VvNkLAI3REgHZV5YtvHM+E25M+hYNJ
         GfPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739547315; x=1740152115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Epi7Q+7wQY9RKlfsXwKc7BTRBEAbnD6Wjsq4fX0UxxY=;
        b=Ob1X/OPEbPQAazwGMNlrSFi6vxdrOAR+7hti7bD9Xr2F8XpjLMN50kUl4raGFF8fOr
         My1JYpfI9dCeydxJL9JmVN28SDCEMkBlJZaylmXb83Z05yugcgjIApTAFCGeJ35lW3m2
         o0e+UZfwjSOZXiggz8gR2ERjPEGQJvaemiqyVCxjDjWT3CE/OedYwGGG9Fa9dOjdLcZR
         S0wEuX++rQe2IS+87COO0gfz1dv2+0oOyGvalwdsl256q5IsCDZhuoAyV1QLN/sdhVWR
         LRddc7/1qPFxeG4eM84dklcixpTQUgyce1P+Qm/u2e1+TOUHRtt5gHkZv/tOoZwYl+T7
         lJKw==
X-Forwarded-Encrypted: i=1; AJvYcCUOmdCKlMIecYgHwr/mn0w3rfY9RcAuNqDHUrC14wBuw+pKQstuoYBxYnwqNvR8IXLHY4TcVNA6mJcYXoY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwAU9T5IN5kW3LYYVh862q5IApULAAHndbSqagwRlxJQ9fcf7zA
	EtCew2Ltomhdm83jXmQuVlULVqWHnYaEQW/F/k8dZtLYrqF17k55oMjbpx7yZ7w=
X-Gm-Gg: ASbGncvS8L6+QkQmY3ngnrk3E6Kot+mOAcqTXWUNqHq7Ni5t6u18X/wgsjnqmZvxJhh
	T9TmI8IO+qek0fQjuIwCt9b6wa6QG6oTFPLT/TpU3m4WLt2a1sJccbX7fblLWXZHWutKA0qsH+G
	zjhmZlJsyt0KJYk7n1XKjYT/yaCRtKBjnIbSlh6tbjuwmlE3TBHpXxWFcHJYbg42eOnGIsS+V7j
	UFNfJNHXJCMAr2d3CrKBEBhTGfu4hRjhnU8n+64B4FnorHkC6TOnlX3zSv7OmzsZbALdpje1lqg
	DZWW8M89x0Kx4KhygA==
X-Google-Smtp-Source: AGHT+IGJzwISDCnvraLVLyP20Cfh4hPSTu9kDD0t/YPlFJMdBbmRyuUpNouBSir5X0Q630+BioQj3Q==
X-Received: by 2002:a05:6402:2387:b0:5de:d98c:3b4e with SMTP id 4fb4d7f45d1cf-5ded98c4a30mr6607100a12.21.1739547315302;
        Fri, 14 Feb 2025 07:35:15 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1d369esm3052385a12.37.2025.02.14.07.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 07:35:14 -0800 (PST)
Date: Fri, 14 Feb 2025 16:35:12 +0100
From: Petr Mladek <pmladek@suse.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>,
	David Gow <davidgow@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 0/2] printf: convert self-test to KUnit
Message-ID: <Z69isDf_6Vy8gGcS@pathway.suse.cz>
References: <20250210-printf-kunit-convert-v3-0-ee6ac5500f5e@gmail.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210-printf-kunit-convert-v3-0-ee6ac5500f5e@gmail.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon 2025-02-10 13:23:21, Tamir Duberstein wrote:
> This is one of just 3 remaining "Test Module" kselftests (the others
> being bitmap and scanf), the rest having been converted to KUnit.
> 
> I tested this using:
> 
> $ tools/testing/kunit/kunit.py run --arch arm64 --make_options LLVM=1 printf
> 
> I have also sent out a series converting scanf[0].
> 
> Link: https://lore.kernel.org/all/20250204-scanf-kunit-convert-v3-0-386d7c3ee714@gmail.com/T/#u [0]
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

I have just quickly tested this before leaving for a week.
And I am fine with the result.


I tried to simmulate an error.

diff --git a/lib/test_printf.c b/lib/test_printf.c
index 59dbe4f9a4cb..d2a1af31a540 100644
--- a/lib/test_printf.c
+++ b/lib/test_printf.c
@@ -590,7 +590,7 @@ time_and_date(void)
 	test("15:32:23|0119-00-04", "%ptTtr|%ptTdr", &t, &t);
 
 	test("2019-01-04 15:32:23", "%ptTs", &t);
-	test("0119-00-04 15:32:23", "%ptTsr", &t);
+	test("0119-00-04 15:32:24", "%ptTsr", &t);
 	test("15:32:23|2019-01-04", "%ptTts|%ptTds", &t, &t);
 	test("15:32:23|0119-00-04", "%ptTtrs|%ptTdrs", &t, &t);
 }


The original result was:

[  787.626709] test_printf: loaded.
[  787.627398] test_printf: vsnprintf(buf, 256, "%ptTsr", ...) wrote '0119-00-04 15:32:23', expected '0119-00-04 15:32:24'
[  787.628496] test_printf: kvasprintf(..., "%ptTsr", ...) returned '0119-00-04 15:32:23', expected '0119-00-04 15:32:24'
[  787.629939] test_printf: failed 2 out of 448 tests


The new output is:

[  585.652278] KTAP version 1
[  585.652675] 1..1
[  585.653085]     KTAP version 1
[  585.653382]     # Subtest: printf
[  585.653702]     # module: printf_kunit
[  585.653716]     1..28
[  585.655223]     ok 1 test_basic
[  585.655908]     ok 2 test_number
[  585.656824]     ok 3 test_string
[  585.657522]     ok 4 hash_pointer
[  585.658547]     ok 5 null_pointer
[  585.659572]     ok 6 error_pointer
[  585.661057]     ok 7 invalid_pointer
[  585.662290]     ok 8 symbol_ptr
[  585.663390]     ok 9 kernel_ptr
[  585.665162]     ok 10 struct_resource
[  585.666231]     ok 11 struct_range
[  585.667257]     ok 12 addr
[  585.668399]     ok 13 escaped_str
[  585.670212]     ok 14 hex_string
[  585.671903]     ok 15 mac
[  585.673389]     ok 16 ip4
[  585.674886]     ok 17 ip6
[  585.676255]     ok 18 uuid
[  585.677875]     ok 19 dentry
[  585.679138]     ok 20 struct_va_format
[  585.679783]     # time_and_date: EXPECTATION FAILED at lib/printf_kunit.c:97
               vsnprintf(buf, 256, "%ptTsr", ...) wrote '0119-00-04 15:32:23', expected '0119-00-04 15:32:24'
[  585.680264]     # time_and_date: EXPECTATION FAILED at lib/printf_kunit.c:135
               kvasprintf(..., "%ptTsr", ...) returned '0119-00-04 15:32:23', expected '0119-00-04 15:32:24'
[  585.682436]     not ok 21 time_and_date
[  585.683115]     ok 22 struct_clk
[  585.685807]     ok 23 bitmap
[  585.686576]     ok 24 netdev_features
[  585.687243]     ok 25 flags
[  585.687875]     ok 26 errptr
[  585.688930]     ok 27 fwnode_pointer
[  585.689544]     ok 28 fourcc_pointer
[  585.689886]     # printf: ran 448 tests
[  585.690215] # printf: pass:27 fail:1 skip:0 total:28
[  585.690582] # Totals: pass:27 fail:1 skip:0 total:28
[  585.691013] not ok 1 printf


I still have to look at the implementation before I add an ack.

And of course, I am also curious about what other reviewers think
about it. And if this is OK for Rasmus.

Best Regards,
Petr

