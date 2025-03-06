Return-Path: <linuxppc-dev+bounces-6759-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B1DA54A9E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Mar 2025 13:25:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z7pXT2KSdz3bsm;
	Thu,  6 Mar 2025 23:25:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741263913;
	cv=none; b=iVBO0JjDPDHTrSjch4jCDVrgozKWwhAF2L2SDfbP8MB/OG2f9eDPdMlelvH9gijeT2Zr9DSIHcPJROW3+VEIxkxML8GRBRwAwKwVHL998tXdgil4y7O8ynXNCxIWQhc+d3KmYgnlXnwf5YsQ3YqSdFE/OiqEdZ3Bos7CShniT47P+62O7/UK05vcOsEBeDEFaqvFEMNkWEa7YzZMHjk7AxA4DNp9tdtwJS+AxtSPL7yGU8wWI2ROAEGrpe6tHP8h91A6E3CNlNXH60VB8ym2rRs3UFSOIRDrMNKz50SUB0wzU9lEIwyi/WMkcpNHQcsyDFrHaXd7gfrifWMup2Jhxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741263913; c=relaxed/relaxed;
	bh=nIwcoBN/hkEYZ3G8KOPMnrmKGBBnfRqx2ozDCVdFctQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jX5tX1PDS3gg39npWU+kKwSzqE0TvyrTXV7FYSGHImXK11fH4j7ZoQIvx2jWJMKaegPlY8xEd02c21Pw8wfnY2e5kW5yELk5TKiCX4RUQTy4DU9VpSgEa5eWz5UKE0cPq3YKT8T6dKxvq9eaGnEC4LpZ52RXREHBUg/7gaQrka6YjZO6rZxAm5WeGcoHmC4gruwPDc92Imq07Ionlyt7um/4JR4csuBxY4XsWF0veZPkL4Niph7PaC06xbRURYhTXIvAS2jLEGEz+xrzW+ZeTLxi5CwdAEZltRFt8CqqOPcV+svxjSBolD4UPvKhazKbzZWdj91EBZfXTVd8FtZjnQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Eeyqd3/e; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Eeyqd3/e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z7pXR1y8gz3bqs
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Mar 2025 23:25:10 +1100 (AEDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso3469255e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Mar 2025 04:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741263905; x=1741868705; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nIwcoBN/hkEYZ3G8KOPMnrmKGBBnfRqx2ozDCVdFctQ=;
        b=Eeyqd3/eafs6KF0k5i3ktdzI+TqeikTEP677oA/ekxttLMAoVvIdVQY8rUPe8TsE0G
         grJCfnHkSXkV692R9cciuGWXogdDXZWHLyEIvflL5MZCNNGCSsW29Gp8jXyNmThsHyiP
         FY4aia/tCfNRmtMQUf6baotYwxFoeM9vUaXIRUS/X9ntJ3cxFt9AF2p8CozDviR57/0D
         FYJyCtsMZb2GacgJq1OI3dLdqCf2xsCbScb+w5Ay/wQ/2Rz+vMZjom2Y/Y2WAWP07B8O
         KN1yLAmcooOypzdBIyPxjn79kuXQZScaEw1m/IuP1xrgRs/wJ1MZmRvLz+1FawjMkn0i
         TNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741263905; x=1741868705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIwcoBN/hkEYZ3G8KOPMnrmKGBBnfRqx2ozDCVdFctQ=;
        b=OHSJF4HbOCZbc+rhDOxDb9lbkPyGcdmhNrnA4r8dUlfTjZwtCaMunsOgsoQRhqBjpP
         Hex7zMU2PzX0E4bt3ZE48tON7Q1Cd+crap3kGpV4Qbe3aBErnrTNy41DH1iQ9D3EP9Xj
         odclpKbVJwEZ0Wc4RUTsGHNJC2NxiICwMLLnj+LMx5V5F9B2kud/xrYxxgPkco2j8txs
         CmWVjs6Ul6QTqUgxSkGQPCkrzHUz9XBdoAV9LCbHuVfhGbxFNSl3u6hFxKn2winDpMjh
         L+hr0fJgrqNf1cc4G6h0B0Bh36p56PYYWcL3s3xLDlpmUJ36foJpvndEBhpY4jr0JQAh
         OhCQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8D2hYAT8+n/rhCvNbSZ+uIagNx1HwTXiWSGz/K45eTWkjEFCiwN5r5JxED5I17inA48IgzT3mtsf25GM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzDlIn/e6J+7mYu2L42pft2wTR7Csh7KUjAKnlqvTJagKl14dbO
	tkTEp2BpyJ4MBU4WlN+5xuAKeliDKzrQ1DomW0aNi2qXLEIZquD4t5SnF1WKZIw=
X-Gm-Gg: ASbGnctxm1UjYbVilzohUEe++WuSarikoVKdzCMSbk/hi4soNQxbYNP/jDSZkFpFZvk
	tvIDOc+vxNutjm8eDbFgQlwLPJXb+DP6DBZJOmnlCFG+/9GYGv+BzteDaO0m1pE8TYWmC6FF9Z9
	fD7afMErDUAQk8JjtDoswwaP5CprhcKsDnR17YYb1QGFviMVeuvoiLJF2c2JkyVT9+4ePUG/hVj
	0HTZnUPAyiiNSOm05y7wRrSkXilqdDAwwSEO4YlxGXnRIumhA6El9By/mWxQLMu6RsLLIkxZyFE
	5ZJ6bN/nw2krzYgVYwE8rTy4geLUmwnZ+6WaGLhowXYan1c=
X-Google-Smtp-Source: AGHT+IG009jfgS7Y1rNm77MEBAZpvk+csfOSyOFqNcxON1KmaThlFkX95r4263wttZgsIJhefyFJoA==
X-Received: by 2002:a05:600c:548f:b0:43b:c0fa:f9bc with SMTP id 5b1f17b1804b1-43bd29c75famr57031165e9.12.1741263905515;
        Thu, 06 Mar 2025 04:25:05 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd947544sm18165635e9.35.2025.03.06.04.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 04:25:05 -0800 (PST)
Date: Thu, 6 Mar 2025 13:25:03 +0100
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
Subject: Re: [PATCH v5 1/3] printf: convert self-test to KUnit
Message-ID: <Z8mUH0comOCpycpK@pathway.suse.cz>
References: <20250221-printf-kunit-convert-v5-0-5db840301730@gmail.com>
 <20250221-printf-kunit-convert-v5-1-5db840301730@gmail.com>
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
In-Reply-To: <20250221-printf-kunit-convert-v5-1-5db840301730@gmail.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri 2025-02-21 15:34:30, Tamir Duberstein wrote:
> Convert the printf() self-test to a KUnit test.
> 
> In the interest of keeping the patch reasonably-sized this doesn't
> refactor the tests into proper parameterized tests - it's all one big
> test case.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  Documentation/core-api/printk-formats.rst   |   4 +-
>  MAINTAINERS                                 |   2 +-
>  lib/Kconfig.debug                           |  12 +-
>  lib/Makefile                                |   1 -
>  lib/tests/Makefile                          |   1 +
>  lib/{test_printf.c => tests/printf_kunit.c} | 188 +++++++++++++++-------------
>  tools/testing/selftests/lib/config          |   1 -
>  tools/testing/selftests/lib/printf.sh       |   4 -
>  8 files changed, 117 insertions(+), 96 deletions(-)
> 
> diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
> index ecccc0473da9..4bdc394e86af 100644
> --- a/Documentation/core-api/printk-formats.rst
> +++ b/Documentation/core-api/printk-formats.rst
> @@ -661,7 +661,7 @@ Do *not* use it from C.
>  Thanks
>  ======
>  
> -If you add other %p extensions, please extend <lib/test_printf.c> with
> -one or more test cases, if at all feasible.
> +If you add other %p extensions, please extend <lib/tests/printf_kunit.c>
> +with one or more test cases, if at all feasible.
>  
>  Thank you for your cooperation and attention.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f076360ce3c6..b051ccf6b276 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25510,8 +25510,8 @@ R:	Sergey Senozhatsky <senozhatsky@chromium.org>
>  S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git
>  F:	Documentation/core-api/printk-formats.rst
> -F:	lib/test_printf.c
>  F:	lib/test_scanf.c
> +F:	lib/tests/printf_kunit.c
>  F:	lib/vsprintf.c
>  
>  VT1211 HARDWARE MONITOR DRIVER
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 7ddbfdacf895..d2b15f633227 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -2436,6 +2436,15 @@ config ASYNC_RAID6_TEST
>  config TEST_HEXDUMP
>  	tristate "Test functions located in the hexdump module at runtime"
>  
> +config PRINTF_KUNIT_TEST
> +	tristate "KUnit test printf() family of functions at runtime" if !KUNIT_ALL_TESTS
> +	depends on KUNIT
> +	default KUNIT_ALL_TESTS
> +	help
> +	  Enable this option to test the printf functions at runtime.
> +
> +	  If unsure, say N.
> +
>  config STRING_KUNIT_TEST
>  	tristate "KUnit test string functions at runtime" if !KUNIT_ALL_TESTS
>  	depends on KUNIT
> @@ -2449,9 +2458,6 @@ config STRING_HELPERS_KUNIT_TEST
>  config TEST_KSTRTOX
>  	tristate "Test kstrto*() family of functions at runtime"
>  
> -config TEST_PRINTF
> -	tristate "Test printf() family of functions at runtime"
> -
>  config TEST_SCANF
>  	tristate "Test scanf() family of functions at runtime"
>  
> diff --git a/lib/Makefile b/lib/Makefile
> index 961aef91d493..f31e6a3100ba 100644
> --- a/lib/Makefile
> +++ b/lib/Makefile
> @@ -77,7 +77,6 @@ obj-$(CONFIG_TEST_RHASHTABLE) += test_rhashtable.o
>  obj-$(CONFIG_TEST_STATIC_KEYS) += test_static_keys.o
>  obj-$(CONFIG_TEST_STATIC_KEYS) += test_static_key_base.o
>  obj-$(CONFIG_TEST_DYNAMIC_DEBUG) += test_dynamic_debug.o
> -obj-$(CONFIG_TEST_PRINTF) += test_printf.o
>  obj-$(CONFIG_TEST_SCANF) += test_scanf.o
>  
>  obj-$(CONFIG_TEST_BITMAP) += test_bitmap.o
> diff --git a/lib/tests/Makefile b/lib/tests/Makefile
> index 8961fbcff7a4..183c6a838a5d 100644
> --- a/lib/tests/Makefile
> +++ b/lib/tests/Makefile
> @@ -30,6 +30,7 @@ obj-$(CONFIG_LINEAR_RANGES_TEST) += test_linear_ranges.o
>  obj-$(CONFIG_MEMCPY_KUNIT_TEST) += memcpy_kunit.o
>  CFLAGS_overflow_kunit.o = $(call cc-disable-warning, tautological-constant-out-of-range-compare)
>  obj-$(CONFIG_OVERFLOW_KUNIT_TEST) += overflow_kunit.o
> +obj-$(CONFIG_PRINTF_KUNIT_TEST) += printf_kunit.o
>  obj-$(CONFIG_SIPHASH_KUNIT_TEST) += siphash_kunit.o
>  obj-$(CONFIG_SLUB_KUNIT_TEST) += slub_kunit.o
>  obj-$(CONFIG_TEST_SORT) += test_sort.o
> diff --git a/lib/test_printf.c b/lib/tests/printf_kunit.c
> similarity index 87%
> rename from lib/test_printf.c
> rename to lib/tests/printf_kunit.c
> index 59dbe4f9a4cb..287bbfb61148 100644
> --- a/lib/test_printf.c
> +++ b/lib/tests/printf_kunit.c
> @@ -3,9 +3,7 @@
>   * Test cases for printf facility.
>   */
>  
> -#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> -
> -#include <linux/init.h>
> +#include <kunit/test.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/printk.h>
> @@ -25,8 +23,6 @@
>  
>  #include <linux/property.h>
>  
> -#include "../tools/testing/selftests/kselftest_module.h"
> -
>  #define BUF_SIZE 256
>  #define PAD_SIZE 16
>  #define FILL_CHAR '$'
> @@ -37,12 +33,17 @@
>  	block \
>  	__diag_pop();
>  
> -KSTM_MODULE_GLOBALS();
> +static unsigned int total_tests;
> +
> +static char *test_buffer;
> +static char *alloced_buffer;
> +
> +static struct kunit *kunittest;
>  
> -static char *test_buffer __initdata;
> -static char *alloced_buffer __initdata;
> +#define tc_fail(fmt, ...) \
> +	KUNIT_FAIL(kunittest, fmt, ##__VA_ARGS__)
>  
> -static int __printf(4, 0) __init
> +static void __printf(4, 0)
>  do_test(int bufsize, const char *expect, int elen,
>  	const char *fmt, va_list ap)
>  {
> @@ -57,52 +58,50 @@ do_test(int bufsize, const char *expect, int elen,
>  	va_end(aq);
>  
>  	if (ret != elen) {
> -		pr_warn("vsnprintf(buf, %d, \"%s\", ...) returned %d, expected %d\n",
> +		tc_fail("vsnprintf(buf, %d, \"%s\", ...) returned %d, expected %d",

1. It looks a bit strange that the 1st patch replaces pr_warn() with
   tc_fail() which hides KUNIT_FAIL().

   And the 2nd patch replaces tc_fail() with KUNIT_FAIL().

   It looks like a non-necessary churn.

   It would be better to avoid the temporary "tc_fail" and swith to
   KUNIT_FAIL() already in this patch.

   I did not find any comment about this in the earier versions of the
   patchset.

   Is it just a result of the evolution of the patchset or
   is there any motivation for this?


2. What was the motivation to remove the trailing '\n', please?

   It actually makes a difference from the printk() POV. Messages without
   the trailing '\n' are _not_ flushed to the console until another
   message is added. The reason is that they might still be appended
   by pr_cont(). And printk() emits only complete lines to the
   console.

   In general, messages should include the trailing '\n' unless the
   code wants to append something later or the trailing '\n' is
   added by another layer of the code. It does not seem to be this case.


>  			bufsize, fmt, ret, elen);
> -		return 1;
> +		return;
>  	}

[...]

> @@ -842,13 +836,15 @@ test_pointer(void)
>  	fourcc_pointer();
>  }
>  
> -static void __init selftest(void)
> +static void printf_test(struct kunit *test)
>  {
>  	alloced_buffer = kmalloc(BUF_SIZE + 2*PAD_SIZE, GFP_KERNEL);
>  	if (!alloced_buffer)
>  		return;

I would use here:

	KUNIT_ASSERT_NOT_NULL(test, alloced_buffer);

And move the same change for the other kmalloc() location from
the 2nd patch.


>  	test_buffer = alloced_buffer + PAD_SIZE;
>  
> +	kunittest = test;
> +
>  	test_basic();
>  	test_number();
>  	test_string();


Otherwise, it looks good to me.

Best Regards,
Petr

