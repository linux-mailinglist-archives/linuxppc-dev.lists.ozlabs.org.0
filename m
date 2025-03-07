Return-Path: <linuxppc-dev+bounces-6806-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFEDA56D64
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Mar 2025 17:18:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z8Wfq3nygz30MR;
	Sat,  8 Mar 2025 03:18:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::333"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741364291;
	cv=none; b=hpYOZJPoaSo3qIvg7hR6F0yb4YcAfLKN+ijss+ODHOgLuD/lGxnyWtiPqz3GYckcEbD37kBv9adnVuNoogYvvQWnH4PuSBQnm9y3EsVmVMJVoQ1Qh9iOhZcaxg4KJ6tdsqcxG5Gy6M7E3e2SvogTlZPjyUdI0pko54lVNIT1+o8CzadPt5yJYJWx2hqOBtvkRb0t2wcXERXhZNm1KCggU9VkUre/3OHUYpkqPIgJ/HldoDSwYazuZ+5Bw60/BVc2bWJPeCZYTbVC3Xaqa/tQSod4zcAK1idLLgqZ01WX63/9F7huuNDAuMta+x0oIGm03U4s3Tw++YhkJ+iX1jfd0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741364291; c=relaxed/relaxed;
	bh=DCwkI3mTb9TuFtkjp33h0Opv3nnmlBn/Bi8OthUIuag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=czav1yW1LY+TWcoJfIfJnqaBwKJtM/lTd2029rWkNILm7qU/TH1U8GK3g5i1MXZ+YSznk/ZdRLGRfMXicujAa7CEBejTkFdpfCY4q2NFLih2B4u+A/7Zt1QLnn81qFF2oA/d71RXlL7xAhq4tJWkrFwhKAbxgQl+kOuQUQPZ8DHLnDcglf33sN7aMLXXeNQD7ljYhMnATAHhU/o5l9hcWNm7l2S1bPkjxGdNOofpXVRSAzLWPAbk/Meqmdg5APabl6u2fsrjRtCUTmAHorDpWPzUhiQWquSUzElfm0ki9bxDFGchmQwWT15+frlQXDDqvhMBWcBdTaXh2U0HjzeHvg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=eID8rajC; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=eID8rajC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z8Wfp2N7gz301n
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Mar 2025 03:18:09 +1100 (AEDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43bbd711eedso16113155e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Mar 2025 08:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741364286; x=1741969086; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DCwkI3mTb9TuFtkjp33h0Opv3nnmlBn/Bi8OthUIuag=;
        b=eID8rajC9bbW2T+MArRPiUoi8nRQdAQVlcNf+Ibydp/nQRkEQJSCtztDe5pdV04puZ
         cgsxniXq6YlhYRNk7YGWEXLQFG3HXOuYDuCiMWFeOUwL1xCuPuQXl5QSg+IkStj70htP
         lT2U9CIsFd12BedX3amygCOTX0ekmkLO0UxG4jwLeX7YMY8yVDHvlz+9Iz6am48EXfay
         aKOxevsUXf5MVq8JyJBE5cXR/FEzXYttbpV6tx7nax5spqpjo+ep+X/cKo2cE072xIBG
         MLLgpCklewg42t76x6cD1DK5FBn5wVWtvfcYpGcUIiK8TmHsO0NeZ1FgN13V+Jrd0fus
         aTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741364286; x=1741969086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCwkI3mTb9TuFtkjp33h0Opv3nnmlBn/Bi8OthUIuag=;
        b=BcT05tsPg9PhMZHW50J9YhqWtAMbmUblPWWyMet+MqEAXsLWQfTvT4wMB6FSnPONB3
         s6EfZFr0zrMV4RO3bH6bbiA37nIN9Kzhti8mBYfrawvogYhEZLbAImvJwnvhVE1n6L4p
         SAy4jmWFBLKnPNasY5kRPZDUIHva91zmvJW9NS9Nczd7+1EbFekJ16Ap7zC8YzgNAnvR
         kRM1fIOtfBCQd2TphEIxKzL2lws1fosgxMibnfBALrD79new1a/SW9SDv17VC2j/0MXE
         sBadz6C8FglK+wBT1WJJRUIAnPpPTLfXev60xG/J5GrmlodTPLVpLwNNLdg/tlvxXWSA
         /0sA==
X-Forwarded-Encrypted: i=1; AJvYcCXXXZSElABgL+w/Of+PUChoW9FmzkXY5fNDW/l+3XAC1MNZBBhk2ZwFsG06dzDYglfHrSWL+wSpN4vDslw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzBmJDLSvv0HS4GKMIW4f3fHCtB8XRPWtqf22xu5/hPeN7X/eoD
	3hXPN7N2oDuNx3SniSuP9X5CGQTs99PYle414So2UbWDz8HFHOYn/sAo8WM6PW4oW589ln+AZ8+
	p
X-Gm-Gg: ASbGnctEnnMKakth0AxW6bFHXU7yCqzkuW9hxUmZMh3XrgPHREvJzfzE1WwXDShtuMN
	iAAci+Plx03p46zp+bR0UuXkJbsH6X7PRq7G2s802gffrLxmA/YBBPhT6rrgR3LPjthpA3Ov0aU
	1uJ6Giaqm2IyQ1DXIr6EiqQlRLjovV+xWPKn3NgkmU8MelFcGskcJRjhEtiUB/A7oK85xMou11C
	0Ae+OTxCXTASNtTcgkTkH0/1+qnxvtlkwiEAEgeQFm/+N1n1gg/kNL3fJPvb5cYp4gkjRz0zHlk
	y5TGpE365ctpltnWGjPRiIAIZ7RRuEFAdk9FiLJnN5Ap6/Y=
X-Google-Smtp-Source: AGHT+IGMBR2Hp2OA9Ih2wlEa/vbwb3VUa33IIHpQ9OS7HGryoxL0uxxYnq5ViotX8t1NqsEHP3nLBw==
X-Received: by 2002:a05:6000:1867:b0:390:f987:26a1 with SMTP id ffacd0b85a97d-39132d885bcmr2413534f8f.29.1741364285897;
        Fri, 07 Mar 2025 08:18:05 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfba888sm5897036f8f.16.2025.03.07.08.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 08:18:05 -0800 (PST)
Date: Fri, 7 Mar 2025 17:18:03 +0100
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
Subject: crng init: was: Re: [PATCH v5 2/3] printf: break kunit into test
 cases
Message-ID: <Z8scO-LsAWxdYIfJ@pathway.suse.cz>
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
> --- a/lib/tests/printf_kunit.c
> +++ b/lib/tests/printf_kunit.c
> @@ -178,7 +179,7 @@ test_number(void)
>  }
>  
>  static void
> -test_string(void)
> +test_string(struct kunit *kunittest)
>  {
>  	test("", "%s%.0s", "", "123");
>  	test("ABCD|abc|123", "%s|%.3s|%.*s", "ABCD", "abcdef", 3, "123456");
> @@ -215,29 +216,6 @@ test_string(void)
>  #define ZEROS "00000000"	/* hex 32 zero bits */
>  #define ONES "ffffffff"		/* hex 32 one bits */
>  
> -static int
> -plain_format(void)
> -{
> -	char buf[PLAIN_BUF_SIZE];
> -	int nchars;
> -
> -	nchars = snprintf(buf, PLAIN_BUF_SIZE, "%p", PTR);
> -
> -	if (nchars != PTR_WIDTH)
> -		return -1;
> -
> -	if (strncmp(buf, PTR_VAL_NO_CRNG, PTR_WIDTH) == 0) {
> -		kunit_warn(kunittest, "crng possibly not yet initialized. plain 'p' buffer contains \"%s\"",
> -			PTR_VAL_NO_CRNG);
> -		return 0;
> -	}
> -
> -	if (strncmp(buf, ZEROS, strlen(ZEROS)) != 0)
> -		return -1;
> -
> -	return 0;
> -}
> -
>  #else
>  
>  #define PTR_WIDTH 8
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

I have simulated the not-yet-initialized crng and got:

[   80.109760] printf_kunit: module verification failed: signature and/or required key missing - tainting kernel
[   80.114218] KTAP version 1
[   80.114743] 1..1
[   80.116124]     KTAP version 1
[   80.116752]     # Subtest: printf
[   80.117239]     # module: printf_kunit
[   80.117256]     1..28
[   80.120924]     ok 1 test_basic
[   80.121495]     ok 2 test_number
[   80.122741]     ok 3 test_string
[   80.123498]     # hash_pointer: crng possibly not yet initialized. plain 'p' buffer contains "(____ptrval____)"
[   80.124044]     # hash_pointer: EXPECTATION FAILED at lib/tests/printf_kunit.c:256
                   Expected buf == "00000000", but
                       buf ==
                       <28><5f><5f><5f><5f><70><74><72>
                       "00000000" ==
                       <30><30><30><30><30><30><30><30>
[   80.125888]     not ok 4 hash_pointer
[   80.129831]     ok 5 null_pointer
[   80.130253]     ok 6 error_pointer
[   80.131221]     # invalid_pointer: crng possibly not yet initialized. plain 'p' buffer contains "(____ptrval____)"
[   80.132168]     ok 7 invalid_pointer
[   80.135149]     ok 8 symbol_ptr
[   80.136016]     ok 9 kernel_ptr
[   80.136868]     ok 10 struct_resource
[   80.137768]     ok 11 struct_range
[   80.138613]     ok 12 addr
[   80.139370]     ok 13 escaped_str
[   80.140054]     ok 14 hex_string
[   80.140601]     ok 15 mac
[   80.141162]     ok 16 ip4
[   80.141670]     ok 17 ip6
[   80.142221]     ok 18 uuid
[   80.143090]     ok 19 dentry
[   80.143963]     ok 20 struct_va_format
[   80.144523]     ok 21 time_and_date
[   80.145043]     ok 22 struct_clk
[   80.145589]     ok 23 bitmap
[   80.146087]     ok 24 netdev_features
[   80.146572]     ok 25 flags
[   80.146980]     # errptr: crng possibly not yet initialized. plain 'p' buffer contains "(____ptrval____)"
[   80.147412]     ok 26 errptr
[   80.148548]     ok 27 fwnode_pointer
[   80.149086]     ok 28 fourcc_pointer
[   80.149090]     # printf: ran 448 tests
[   80.149099] # printf: pass:27 fail:1 skip:0 total:28
[   80.149102] # Totals: pass:27 fail:1 skip:0 total:28
[   80.149106] not ok 1 printf

=> One test failed even though vspritf() worked as expected.

   The "EXPECTATION FAILED" message was a bit tricky because
   it printed "<28><5f><5f><5f><5f><70><74><72>" instead of "(____ptrval____)".

   Two tests succeeded even after a warning message which would make people
   to investigate it.

I suggest to rather skip the test in this case. Something like:

	if (strncmp(buf, PTR_VAL_NO_CRNG, PTR_WIDTH) == 0) {
		kunit_skip(kunittest,
			   "crng possibly not yet initialized. plain 'p' buffer contains \"%s\"\n",
			   PTR_VAL_NO_CRNG);
	}


It produces:

[  140.555055] KTAP version 1
[  140.555413] 1..1
[  140.555796]     KTAP version 1
[  140.556115]     # Subtest: printf
[  140.556450]     # module: printf_kunit
[  140.556459]     1..28
[  140.557757]     ok 1 test_basic
[  140.558072]     ok 2 test_number
[  140.558693]     ok 3 test_string
[  140.559278]     ok 4 hash_pointer # SKIP crng possibly not yet initialized. plain 'p' buffer contains "(____ptrval____)"
[  140.560949]     ok 5 null_pointer
[  140.561257]     ok 6 error_pointer
[  140.561880]     ok 7 invalid_pointer # SKIP crng possibly not yet initialized. plain 'p' buffer contains "(____ptrval____)"
[  140.564159]     ok 8 symbol_ptr
[  140.565248]     ok 9 kernel_ptr
[  140.566346]     ok 10 struct_resource
[  140.567642]     ok 11 struct_range
[  140.569141]     ok 12 addr
[  140.570395]     ok 13 escaped_str
[  140.571407]     ok 14 hex_string
[  140.572337]     ok 15 mac
[  140.573572]     ok 16 ip4
[  140.574712]     ok 17 ip6
[  140.575743]     ok 18 uuid
[  140.577164]     ok 19 dentry
[  140.578248]     ok 20 struct_va_format
[  140.579400]     ok 21 time_and_date
[  140.580507]     ok 22 struct_clk
[  140.581706]     ok 23 bitmap
[  140.582739]     ok 24 netdev_features
[  140.583808]     ok 25 flags
[  140.585274]     ok 26 errptr # SKIP crng possibly not yet initialized. plain 'p' buffer contains "(____ptrval____)"
[  140.588403]     ok 27 fwnode_pointer
[  140.592141]     ok 28 fourcc_pointer
[  140.592758]     # printf: ran 408 tests
[  140.593219] # printf: pass:25 fail:0 skip:3 total:28
[  140.593706] # Totals: pass:25 fail:0 skip:3 total:28
[  140.594280] ok 1 printf

Best Regards,
Petr

