Return-Path: <linuxppc-dev+bounces-6765-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 879A5A55198
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Mar 2025 17:44:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z7wHJ49ltz2yDH;
	Fri,  7 Mar 2025 03:44:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::334"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741279452;
	cv=none; b=dGLYZyeWJ1i0BQaKV63E1q9/hNLJwLB4j9h2OCF9F8fbK5fLSeyAluWYKv+RNZdX044DbSJcmrgOQPgvTwyfe6hadTq9GfkHVpBxvj41MDq+5d+67EHKKgfQ5bj9nWmAJYzsHTbWPTBk0vNLG1Bw6zuDBKDiX7QNP3gE2kPJ46tq/h3HS1XGe1kUwRGr6jcE+2UzxyQVjXgXxb+G+H7xuEaO9wFdRgYPwWgNvu49Wt7YTd7YTknaJ1bIK6wJYDoPN275wajcuxSHWCm2+IxW/cc11JpwfmgrdAYQC/ZZj0HogBzoo1zECIVeVqw8Hil2cRTZg1mc6B6MI9SoBKWiLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741279452; c=relaxed/relaxed;
	bh=ShoYw58ehpsrQYbnJ7nHU0dRrMyBrcfiule3tNowvNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GrDCzQ6FyesdcBpKtcBw4nzXNWE5Y8W8I/Od1egnDP240Q8IPaFkUZeGKeKWCA3eY3K7p4ohIw0YCFmJkpH+S5SBHVbWA7xmjUJc8wj5wo9lzC/gz5WRRTGKKRO+hM+mM7mS9erKGJZmSeWWSbr1nXqEMjQizkd29K6HOoGvdgcdTC3vvRQO8LIt/uXV2NgDHlB5EpnJ50fKErrCnPHFmAIoeBkqnmHF0oMbVKlcLdwOTuHRyro1NSeu7IExv+lFBZgsq1Ar+EBj/y0Mb/W9ZO7WPhcWXCD1/ROTCIPGtxTAIoD6bRfMStqWNujTC2b2gawGa5frjTj6XlDhdEj86Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FX+DQNdE; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FX+DQNdE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z7wHH1cMRz2x9N
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Mar 2025 03:44:09 +1100 (AEDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43bc38bb6baso5744565e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Mar 2025 08:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741279445; x=1741884245; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ShoYw58ehpsrQYbnJ7nHU0dRrMyBrcfiule3tNowvNI=;
        b=FX+DQNdEj8mgeCYc7Q5uJmTIZHnbenPvTXm7y5lQAzd6Gk89zcxrxBHD1KzXjDTsFH
         1xAKqNJhrfnCfe78Qq7V24xJd8VPWUs07vCD0/uGrFqZd3PSAUc283nxc+YmP3jVgYDm
         sHnSF/E0f1YLLo809XzBWinvhAYLFTa/+KABtDNRDmW+BrLy/GHtyRQV9+Jbu43aJ3BA
         oqsmyxrXhTDB76g8b6a4BhIRRa9fMOLI8MnMpmElIuiJmY5vyQ2Vt7oNAoMGUyTszh3R
         HtwkjpAFtklyzQuWNnzwFHUgSdKIayW8fe/1gMnTlh6s0ISwnqQKPB1c75vRKjPJSS3V
         t2FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741279445; x=1741884245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShoYw58ehpsrQYbnJ7nHU0dRrMyBrcfiule3tNowvNI=;
        b=MlZwLdAJFBUHkF6ukpeFJkvWmjXkQtOHj9bYnVLXY6vQIa0fJNSqeZclDGWgfVWS/L
         /xopS4/kff856uqfvI21rum7riRHzfCDC2m4uLZ9mKJtQYTE4hfbNsy6DglMPRvWk37C
         eJBHi7mhgt3BWYF8G1fu5+bch+FAp/CDIbQcdGWl4pkJvHXg6EqUNJu+51N4oeugQ9o8
         jJLm/zWDLL6WEWonCaSGW7l1smN61mgvyDVwqeRPVmd5RKYL9lnZCQpc0BOCPi73+QlB
         KmDb/7ByVuX/zCashL5UXXE66U/RZ9mjl91cA3t+ICX0fqHLr16ODA5RC93JXkrLsaHO
         UEJg==
X-Forwarded-Encrypted: i=1; AJvYcCW+8gDo2ezEKUFQWmiPizS060hfnWApXXNDAJh79N7fwYHHeEA0P+8OhgMdaq+/g/p3rIFStF7iK/+tGu0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxIPurvnLITqomTmnW+YlRJOO8LenIFfLyQF249VClgKtn2qySp
	PRfXWZT7LSS2TUA1iJ9VgpNZgoEZVdIPGQKLSpyFA+OqlzlJleYrpDIl2E1eB94=
X-Gm-Gg: ASbGncuBSGHMzCIvZffwkpQcb/GfKMZKaySOH1r/iut104iyGY3iQKTxoCMwNBnZxIg
	KFNmC7+BwN9Ua8pY3bNmleEnmek04oGjvIPO25RAU3cYTlqZQxCtybe9P0R/+uBnyKzURxaBKld
	WyU1foSJJpH0XDx/R2T/xs/P/ocGeGuqxfpEyAgdf0ejH6bMcOKYZzjCRdLQW0quYpkGegU/XXG
	wE/DvqW5NGRFXb385LTOJ6WU4cslcFlEAk4alLezRYyinfaTfHNWUpR3/t/+Mm553c+qlM+HSRm
	Qfg85KuEuoQyHlsSZP/agSpN9opNUSLvqn8FxQo5Ip8FcIM=
X-Google-Smtp-Source: AGHT+IFd7b+2c3n2/3ricwGLn/lNyHyrhR79mvLaq9Hu+pYWcGfA3QA0G41/DOvWu3YCV95G+BwDLw==
X-Received: by 2002:a05:600c:1506:b0:43b:bdf4:1c9 with SMTP id 5b1f17b1804b1-43c743cd2admr33565e9.29.1741279444950;
        Thu, 06 Mar 2025 08:44:04 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bcbd27996sm45419025e9.2.2025.03.06.08.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:44:04 -0800 (PST)
Date: Thu, 6 Mar 2025 17:44:02 +0100
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
Subject: Re: [PATCH v5 2/3] printf: break kunit into test cases
Message-ID: <Z8nQ0vCNgz4lEJEj@pathway.suse.cz>
References: <20250221-printf-kunit-convert-v5-0-5db840301730@gmail.com>
 <20250221-printf-kunit-convert-v5-2-5db840301730@gmail.com>
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
In-Reply-To: <20250221-printf-kunit-convert-v5-2-5db840301730@gmail.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri 2025-02-21 15:34:31, Tamir Duberstein wrote:
> Move all tests into `printf_test_cases`. This gives us nicer output in
> the event of a failure.
> 
> Combine `plain_format` and `plain_hash` into `hash_pointer` since
> they're testing the same scenario.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  lib/tests/printf_kunit.c | 331 +++++++++++++++++------------------------------
>  1 file changed, 121 insertions(+), 210 deletions(-)
> 
> diff --git a/lib/tests/printf_kunit.c b/lib/tests/printf_kunit.c
> index 287bbfb61148..013df6f6dd49 100644
> --- a/lib/tests/printf_kunit.c
> +++ b/lib/tests/printf_kunit.c
> @@ -38,13 +38,8 @@ static unsigned int total_tests;
>  static char *test_buffer;
>  static char *alloced_buffer;
>  
> -static struct kunit *kunittest;
> -
> -#define tc_fail(fmt, ...) \
> -	KUNIT_FAIL(kunittest, fmt, ##__VA_ARGS__)
> -
> -static void __printf(4, 0)
> -do_test(int bufsize, const char *expect, int elen,
> +static void __printf(5, 0)
> +do_test(struct kunit *kunittest, int bufsize, const char *expect, int elen,
>  	const char *fmt, va_list ap)
>  {
>  	va_list aq;
> @@ -58,59 +53,64 @@ do_test(int bufsize, const char *expect, int elen,
[...]
>  
>  	if (memcmp(test_buffer, expect, written)) {
> -		tc_fail("vsnprintf(buf, %d, \"%s\", ...) wrote '%s', expected '%.*s'",
> -			bufsize, fmt, test_buffer, written, expect);
> +		KUNIT_FAIL(kunittest, "vsnprintf(buf, %d, \"%s\", ...) wrote '%s', expected '%.*s'",
> +			   bufsize, fmt, test_buffer, written, expect);
>  		return;
>  	}
>  }
>  
> -static void __printf(3, 4)
> -__test(const char *expect, int elen, const char *fmt, ...)
> +static void __printf(4, 0)

This should be:

static void __printf(4, 5)

The 2nd parameter is zero when the variable list of parameters is
passed using va_list.

> +__test(struct kunit *kunittest, const char *expect, int elen, const char *fmt, ...)
>  {
>  	va_list ap;
>  	int rand;
>  	char *p;

> @@ -247,89 +225,44 @@ plain_format(void)
>  #define ZEROS ""
>  #define ONES ""
>  
> -static int
> -plain_format(void)
> -{
> -	/* Format is implicitly tested for 32 bit machines by plain_hash() */
> -	return 0;
> -}
> -
>  #endif	/* BITS_PER_LONG == 64 */
>  
> -static int
> -plain_hash_to_buffer(const void *p, char *buf, size_t len)
> +static void
> +plain_hash_to_buffer(struct kunit *kunittest, const void *p, char *buf, size_t len)
>  {
> -	int nchars;
> -
> -	nchars = snprintf(buf, len, "%p", p);
> -
> -	if (nchars != PTR_WIDTH)
> -		return -1;
> +	KUNIT_ASSERT_EQ(kunittest, snprintf(buf, len, "%p", p), PTR_WIDTH);
>  
>  	if (strncmp(buf, PTR_VAL_NO_CRNG, PTR_WIDTH) == 0) {
>  		kunit_warn(kunittest, "crng possibly not yet initialized. plain 'p' buffer contains \"%s\"",
>  			PTR_VAL_NO_CRNG);
> -		return 0;
>  	}
> -
> -	return 0;
>  }
>  
> -static int
> -plain_hash(void)
> -{
> -	char buf[PLAIN_BUF_SIZE];
> -	int ret;
> -
> -	ret = plain_hash_to_buffer(PTR, buf, PLAIN_BUF_SIZE);
> -	if (ret)
> -		return ret;
> -
> -	if (strncmp(buf, PTR_STR, PTR_WIDTH) == 0)
> -		return -1;
> -
> -	return 0;
> -}
> -
> -/*
> - * We can't use test() to test %p because we don't know what output to expect
> - * after an address is hashed.
> - */
>  static void
> -plain(void)
> +hash_pointer(struct kunit *kunittest)
>  {
> -	int err;
> +	if (no_hash_pointers)
> +		kunit_skip(kunittest, "hash pointers disabled");
>  
> -	if (no_hash_pointers) {
> -		kunit_warn(kunittest, "skipping plain 'p' tests");
> -		return;
> -	}
> +	char buf[PLAIN_BUF_SIZE];
>  
> -	err = plain_hash();
> -	if (err) {
> -		tc_fail("plain 'p' does not appear to be hashed");
> -		return;
> -	}
> +	plain_hash_to_buffer(kunittest, PTR, buf, PLAIN_BUF_SIZE);
>  
> -	err = plain_format();
> -	if (err) {
> -		tc_fail("hashing plain 'p' has unexpected format");
> -	}
> +	/*
> +	 * We can't use test() to test %p because we don't know what output to expect
> +	 * after an address is hashed.
> +	 */

The code does not longer print a reasonable error message on failure.
I would extend the comment to make it easier to understand the
meaning. Also I would use the imperative style. Something like:

	/*
	 * The hash of %p is unpredictable, therefore test() cannot be used.
	 * Instead, verify that the first 32 bits are zeros on a 64-bit system,
	 * and confirm the non-hashed value is not printed.
	 */
> +
> +	KUNIT_EXPECT_MEMEQ(kunittest, buf, ZEROS, strlen(ZEROS));
> +	KUNIT_EXPECT_MEMNEQ(kunittest, buf+strlen(ZEROS), PTR_STR, PTR_WIDTH);

This looks wrong. It should be either:

	KUNIT_EXPECT_MEMNEQ(kunittest, buf, PTR_STR, PTR_WIDTH);

or

	KUNIT_EXPECT_MEMNEQ(kunittest,
			    buf + strlen(ZEROS),
			    PTR_STR + strlen(ZEROS),
			    PTR_WIDTH - strlen(ZEROS));

I would use the 1st variant. It is easier and it works the same way
as the original check.

Anyway, it is a great clean up of the pointer tests. I have wanted to do it
since a long time but I never found time.

>  }
>  
>  static void
> -test_hashed(const char *fmt, const void *p)
> +test_hashed(struct kunit *kunittest, const char *fmt, const void *p)
>  {
>  	char buf[PLAIN_BUF_SIZE];
> -	int ret;
>  
> -	/*
> -	 * No need to increase failed test counter since this is assumed
> -	 * to be called after plain().
> -	 */
> -	ret = plain_hash_to_buffer(p, buf, PLAIN_BUF_SIZE);
> -	if (ret)
> -		return;
> +	plain_hash_to_buffer(kunittest, p, buf, PLAIN_BUF_SIZE);
>  
>  	test(buf, fmt, p);
>  }
> @@ -739,11 +664,9 @@ flags(void)
>  							(unsigned long) gfp);
>  	gfp |= __GFP_HIGH;
>  	test(cmp_buffer, "%pGg", &gfp);
> -
> -	kfree(cmp_buffer);

I belive that the kfree() should stay. Otherwise, the test leaks memory
in every run.

>  }
>  
> -static void fwnode_pointer(void)
> +static void fwnode_pointer(struct kunit *kunittest)
>  {
>  	const struct software_node first = { .name = "first" };
>  	const struct software_node second = { .name = "second", .parent = &first };

Otherwise, it looks good to me.

Best Regards,
Petr

