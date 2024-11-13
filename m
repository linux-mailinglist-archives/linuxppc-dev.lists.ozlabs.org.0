Return-Path: <linuxppc-dev+bounces-3132-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F489C66F9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2024 02:57:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xp5yN40f9z2yPR;
	Wed, 13 Nov 2024 12:57:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731463052;
	cv=none; b=efeFVUP4mYghEQ6pPxfRem0xMCiULZCRJ4fZPcXwGP1aB314NDGv/DfD7pqAFymzGQmeFuv3gDJBhDtHPkw/yzqI2yXK8SJigS4jAvwbI6ym3bmtZtCq12m8/8wcuRyCJ9FlbTIiJjPbLt349e2nGeOqqsaSsNKButms4h6VF1Q3E2S8/3hw5Q87bF6Kg8NTERkDgJDugmAICo4BBIypAckQOjOip3kIg3mUb+dGAht/MmE886Ay3Ickn44PcuVASqe5pdBTMcHtM+IBcTd4AEDVOhBK2BZnHadMAiIMCND0r8UhXg4L0KYxRkAZqy4t1yOKroDD4E39FXHCCOeZiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731463052; c=relaxed/relaxed;
	bh=N61dRP0zCZ5yj3jghYT9YKlYmR07EvPApdhNG3AAtvE=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=JQsYLSrhOX2PXnx6HbcjduYmjsTN6bHSN06immDz/BRStfrB/+JTPkx52kdVsoutR4xBY+RcwmrR1S4paOu7ckdQtutn0cNFTJ6ZyUyU1lZn+Z2N4Y9tz63gkK65IvjaCbxy93me9w36cjPCj+ZtJGnBNHyrI9sAjP1BvIaNH/oTKjpHe1uwDzrRVSXSwZeVeBuv8E2FSdlVt37YlWr9stLJHxljkgItuotE1DP2VLodeA/wO25maFPZRm0TL5fdru4xP9Lh+QIMPo8hdVfZ4jq9KiqnFQOWFoHH4Cef4rGaD6UZcT5QlFfdJ3gq3bsNqjsQUxMpfYErHnsg5S+FlA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nGh3kgNP; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nGh3kgNP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xp5yM49cPz2yPD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 12:57:31 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-20c77459558so57984045ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2024 17:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731463049; x=1732067849; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N61dRP0zCZ5yj3jghYT9YKlYmR07EvPApdhNG3AAtvE=;
        b=nGh3kgNPTfo326Nthht+L2KhWEBp1yh0G2J4K2ZtTiNv+RvCMIvVdBEnbERBRTnSW7
         jIoCfbc1BOofKnl8QOjAucf9UZxoxiuhyOPxiUURnHdn5J2CrtMlyl024eVwFFMQvcGZ
         Q5mdxN60q8Zad7ugTbeyD5wkg+9Tl6lImz0UjIDOJSXi+ynvgy7585pPAucYD+Q/yAUz
         g75EZzQf23K4Po7gF/YzowlEhrbuFsnalR0g4uUTJu0sQh2jfaz01s8kEHK/HsE5RqnZ
         o1ECJkbtc8rAZs/MgvTzzch0CgyjIH49Gv0TxGYwnBXeumd72L0et0CMax/jXYfaL09t
         rM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731463049; x=1732067849;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N61dRP0zCZ5yj3jghYT9YKlYmR07EvPApdhNG3AAtvE=;
        b=xFOf699KTE6pTO0a+WS/7LH9hB6sJtcV5tRJxRjGwnNLVt2SfG24hD+g35zFfDrqSW
         1jsCGSqaYfqvYkHZcQOScoYiqX9wlFAR3wos8AiANSKtr7e4vgHnqu1JgvivpUHoRMyX
         yPvkygjq0UZak0stpJ394psPqXNFBststq7XUqpA22A4JOP2FcurWB770Uvk1FHbpB31
         lV5PnCzHc8UK8p9a26riE+Zf4PXqbQz65f69X7+5g/JIBsck7Ei0M0J08vhsv7shRufm
         sgkeVmOfa783jBlWSLKPWRzifccDuXPZkRr6tO78wNANe9wa8KOjIS5PtBGkIJKSnz1V
         euvg==
X-Forwarded-Encrypted: i=1; AJvYcCV/JmZf7huQRVw7CypmfejcW5UbIebdImszflag9wo/jPfBZINqGdityIHEbrN49NVAVSlM0G35GPxIuOg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx96xn2i4YY9DgibDEhaKfHWCGiRpzQ0eAgncVu4auvwQmKMRGM
	EhaHM0N076KWqYVtnQLHSuwrHB17Ykf75TVHECzkTePcPIuWe9Za
X-Google-Smtp-Source: AGHT+IFeKPp1A0NyOhpaXktmGDd/OEl+DxH4cN9vIkIT18flyn+V4BUfhg3AcxVyXBhzufQZ9fl2pQ==
X-Received: by 2002:a17:902:d2cf:b0:20b:6a57:bf3a with SMTP id d9443c01a7336-211ab90a59emr66341285ad.1.1731463048726;
        Tue, 12 Nov 2024 17:57:28 -0800 (PST)
Received: from dw-tp ([171.76.87.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e6c352sm101286045ad.253.2024.11.12.17.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 17:57:28 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Marco Elver <elver@google.com>
Cc: kasan-dev@googlegroups.com, linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, Dmitry Vyukov <dvyukov@google.com>, Alexander Potapenko <glider@google.com>, Heiko Carstens <hca@linux.ibm.com>, Nirjhar Roy <nirjhar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v3] mm/kfence: Add a new kunit test test_use_after_free_read_nofault()
In-Reply-To: <CANpmjNPQtAMbF2BZbUVOL+Sx2+VSOwxgxzXR8yFvDBH4Euu7Ew@mail.gmail.com>
Date: Wed, 13 Nov 2024 07:26:26 +0530
Message-ID: <87frnvnbg5.fsf@gmail.com>
References: <210e561f7845697a32de44b643393890f180069f.1729272697.git.ritesh.list@gmail.com> <CANpmjNPQtAMbF2BZbUVOL+Sx2+VSOwxgxzXR8yFvDBH4Euu7Ew@mail.gmail.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

Marco Elver <elver@google.com> writes:

> On Fri, 18 Oct 2024 at 19:46, Ritesh Harjani (IBM)
> <ritesh.list@gmail.com> wrote:
>>
>> From: Nirjhar Roy <nirjhar@linux.ibm.com>
>>
>> Faults from copy_from_kernel_nofault() needs to be handled by fixup
>> table and should not be handled by kfence. Otherwise while reading
>> /proc/kcore which uses copy_from_kernel_nofault(), kfence can generate
>> false negatives. This can happen when /proc/kcore ends up reading an
>> unmapped address from kfence pool.
>>
>> Let's add a testcase to cover this case.
>>
>> Co-developed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> Signed-off-by: Nirjhar Roy <nirjhar@linux.ibm.com>
>> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> ---
>>
>> Will be nice if we can get some feedback on this.
>
> There was some discussion recently how sanitizers should behave around
> these nofault helpers when accessing invalid memory (including freed
> memory):
> https://lore.kernel.org/all/CANpmjNMAVFzqnCZhEity9cjiqQ9CVN1X7qeeeAp_6yKjwKo8iw@mail.gmail.com/
>
> It should be similar for KFENCE, i.e. no report should be generated.
> Definitely a good thing to test.
>
> Tested-by: Marco Elver <elver@google.com>
> Reviewed-by: Marco Elver <elver@google.com>
>

Gentle ping. Is this going into -next?

-ritesh

>> v2 -> v3:
>> =========
>> 1. Separated out this kfence kunit test from the larger powerpc+kfence+v3 series.
>> 2. Dropped RFC tag
>>
>> [v2]: https://lore.kernel.org/linuxppc-dev/cover.1728954719.git.ritesh.list@gmail.com
>> [powerpc+kfence+v3]: https://lore.kernel.org/linuxppc-dev/cover.1729271995.git.ritesh.list@gmail.com
>>
>>  mm/kfence/kfence_test.c | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/mm/kfence/kfence_test.c b/mm/kfence/kfence_test.c
>> index 00fd17285285..f65fb182466d 100644
>> --- a/mm/kfence/kfence_test.c
>> +++ b/mm/kfence/kfence_test.c
>> @@ -383,6 +383,22 @@ static void test_use_after_free_read(struct kunit *test)
>>         KUNIT_EXPECT_TRUE(test, report_matches(&expect));
>>  }
>>
>> +static void test_use_after_free_read_nofault(struct kunit *test)
>> +{
>> +       const size_t size = 32;
>> +       char *addr;
>> +       char dst;
>> +       int ret;
>> +
>> +       setup_test_cache(test, size, 0, NULL);
>> +       addr = test_alloc(test, size, GFP_KERNEL, ALLOCATE_ANY);
>> +       test_free(addr);
>> +       /* Use after free with *_nofault() */
>> +       ret = copy_from_kernel_nofault(&dst, addr, 1);
>> +       KUNIT_EXPECT_EQ(test, ret, -EFAULT);
>> +       KUNIT_EXPECT_FALSE(test, report_available());
>> +}
>> +
>>  static void test_double_free(struct kunit *test)
>>  {
>>         const size_t size = 32;
>> @@ -780,6 +796,7 @@ static struct kunit_case kfence_test_cases[] = {
>>         KFENCE_KUNIT_CASE(test_out_of_bounds_read),
>>         KFENCE_KUNIT_CASE(test_out_of_bounds_write),
>>         KFENCE_KUNIT_CASE(test_use_after_free_read),
>> +       KFENCE_KUNIT_CASE(test_use_after_free_read_nofault),
>>         KFENCE_KUNIT_CASE(test_double_free),
>>         KFENCE_KUNIT_CASE(test_invalid_addr_free),
>>         KFENCE_KUNIT_CASE(test_corruption),
>> --
>> 2.46.0
>>

