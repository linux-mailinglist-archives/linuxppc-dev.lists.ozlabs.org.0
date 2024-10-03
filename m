Return-Path: <linuxppc-dev+bounces-1740-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 218B098E950
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2024 07:17:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VijjpUT2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XK0Km5KZ4z2yDx;
	Thu,  3 Oct 2024 15:17:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727932636;
	cv=none; b=Zx4ATpptpkp6YPe1VqKUpYgMx1jztBx4wEqNO6S/GgUOyuCoGYcfBhbZYB6rgwFCvzlqfRj0jbG1hpNx+D3otPeo6ufoOZvvmHmzSeIxyp8VgQa0iGBqGyNweIvL0NCRc1CxF4mSDIZofyQlVpFb5UEY059iLW90pbhnoR6ujtTRKE5gkjQQybuu7cF4jB/o9LHWgeS0UssHecf1uMWhnTV3i5bTl1DRPnMVytxzUY9ivDESFJNINfOUhvGB5p1CPsqBRpQZEZ6geurcOfSwPAc1T42bIDl2mQhrwPI9Opyu26IZTKUyjVaJO0Vfr7ikgoSrTF1T7Ra3ebGyZqiBgA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727932636; c=relaxed/relaxed;
	bh=P61WjNBevRMtAfuGcNIvU5lX9OAgdg1UBpDmxbARpHY=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=Pc1T9lZEX3y1+v5PYovtzbccpu6xPJo8YISDANXYf7R5Fzm5UUat/sS0zDV1KVtwN2tuLD9apfUsfxVWuK07/Jd/5XQJ6oLjOmPQzdNueCZM8TQqTUA9U02XpUx/WPfXFRFxDXJNEgUa8LN7lomMO1+HUeaNG0u6h9+kaNqwFPHtYumTH/hZp1KHi6I1+yG/3vsVAj9zIKg/SKABXkzb5TlII+/+8U/IxBh8VI6HiqFoolEnxidS7DNVjZVOxcu1B5xbtqz2HP+EExQtVUESAodYn0JjKZHlM6sL9/7XKkqH+upkv+GOdwMuVY/ZfKLD6ztWMUHeY8cuabZAbKT8uQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VijjpUT2; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VijjpUT2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XK0Kl2NSvz2xnc
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Oct 2024 15:17:15 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-71b8d10e9b3so429559b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Oct 2024 22:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727932631; x=1728537431; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P61WjNBevRMtAfuGcNIvU5lX9OAgdg1UBpDmxbARpHY=;
        b=VijjpUT2lYpgU7ZqGsCDzMSudT5cAN4VWh5hzNytUg+jVk8wcFGvoys+b7mxt/ittC
         fMPOTXPnvwKO47qNCkvVAWZ71vkrlWe6z8EAt90HTpcWv+7TGX/b9oEwcOII332nM53L
         4UzjeVtf06ZHYQKU+0HLmRFHDyQtWrMvaveLWTse4alxfo3nxtzPjGH3JQ274PaZlpsC
         uIsW4+5JicSpZh1fR42bgrAg3zEeUaATNy1z5+U925vGtJmWDE0Lx9NBZmA+55SDPFq/
         ctFZhrDKpqf3YkUTlHzYkGwHO0W3YjwEYczDh6amD4dCc3YVI9x/XxW5fB/H3H7OQjdm
         GskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727932631; x=1728537431;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P61WjNBevRMtAfuGcNIvU5lX9OAgdg1UBpDmxbARpHY=;
        b=nue7+ZVxaoYEPqcrP2Hy+pcozIHz6NITPOtvGEadhBjffN4PwzSHuM3sR9e8JfQKzH
         f2PP5wnmjfqzM76/dpIbXC7HEBoB5U0PY7GMOIaIVT0BVgdqaTcTFAtNtWfM3/bSUDnN
         qGQmovutoUzKGMUFZOy3L8FDLxwFKtdEBuO1WcOC/Z+dUHLBA1qfupRLwHsjPLU90z7X
         gKa0P0VH4D7NmBVDfc7Kg6rk+AcGXvcrDjv9vQslpZjs+aJ/Vss+A4/mmfzc5qPIkDv6
         t16LE6vLhfuUQ34/aoEYh46q8Di+kbik+FSBIF3vUkhZNqMDYrEY+sNcvnHw8tyO3zZv
         I5cQ==
X-Gm-Message-State: AOJu0Yyz/BOb6aAQZ8wYuDs7OUSP3LbL+up4Af2HVykVqqgHlNmLqT6l
	pmIgunVh0RgpUNjCTXX/F+BN53ZmC2lvMwP0hA4QASCcEqRPjA1B
X-Google-Smtp-Source: AGHT+IGSqOhDYBnasu93qnl5wHf+ezCb1CmvK8YGFgZJKvwFslVJPTu8jAGM36pLvWJ19ve2joTQMQ==
X-Received: by 2002:a05:6a00:1915:b0:717:8489:6318 with SMTP id d2e1a72fcca58-71dc5c6756bmr8301952b3a.10.1727932630532;
        Wed, 02 Oct 2024 22:17:10 -0700 (PDT)
Received: from dw-tp ([171.76.83.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9d7e54csm444461b3a.67.2024.10.02.22.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 22:17:09 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Hari Bathini <hbathini@linux.ibm.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Donet Tom <donettom@linux.vnet.ibm.com>, Pavithra Prakash <pavrampu@linux.vnet.ibm.com>, Nirjhar Roy <nirjhar@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>, Alexander Potapenko <glider@google.com>, linux-mm@kvack.org, Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [RFC v2 01/13] mm/kfence: Add a new kunit test test_use_after_free_read_nofault()
In-Reply-To: <a8ca8bd5eb4114304b34dd8bac7a6280d358c728.1726571179.git.ritesh.list@gmail.com>
Date: Thu, 03 Oct 2024 10:36:08 +0530
Message-ID: <87cykhydvj.fsf@gmail.com>
References: <cover.1726571179.git.ritesh.list@gmail.com> <a8ca8bd5eb4114304b34dd8bac7a6280d358c728.1726571179.git.ritesh.list@gmail.com>
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>


Hello Kasan/kfence-devs, 

Wanted your inputs on this kfence kunit test [PATCH-1] and it's respective
powerpc fix [Patch-2]. The commit msgs has a good description of it. I
see that the same problem was noticed on s390 as well [1] a while ago.
So that makes me believe that maybe we should have a kunit test for the
same to make sure all architectures handles this properly. 

Thoughts?

[1]: https://lore.kernel.org/all/20230213183858.1473681-1-hca@linux.ibm.com/

-ritesh


"Ritesh Harjani (IBM)" <ritesh.list@gmail.com> writes:

> From: Nirjhar Roy <nirjhar@linux.ibm.com>
>
> Faults from copy_from_kernel_nofault() needs to be handled by fixup
> table and should not be handled by kfence. Otherwise while reading
> /proc/kcore which uses copy_from_kernel_nofault(), kfence can generate
> false negatives. This can happen when /proc/kcore ends up reading an
> unmapped address from kfence pool.
>
> Let's add a testcase to cover this case.
>
> Co-developed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Signed-off-by: Nirjhar Roy <nirjhar@linux.ibm.com>
> Cc: kasan-dev@googlegroups.com
> Cc: Alexander Potapenko <glider@google.com>
> Cc: linux-mm@kvack.org
> ---
>  mm/kfence/kfence_test.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/mm/kfence/kfence_test.c b/mm/kfence/kfence_test.c
> index 00fd17285285..f65fb182466d 100644
> --- a/mm/kfence/kfence_test.c
> +++ b/mm/kfence/kfence_test.c
> @@ -383,6 +383,22 @@ static void test_use_after_free_read(struct kunit *test)
>  	KUNIT_EXPECT_TRUE(test, report_matches(&expect));
>  }
>
> +static void test_use_after_free_read_nofault(struct kunit *test)
> +{
> +	const size_t size = 32;
> +	char *addr;
> +	char dst;
> +	int ret;
> +
> +	setup_test_cache(test, size, 0, NULL);
> +	addr = test_alloc(test, size, GFP_KERNEL, ALLOCATE_ANY);
> +	test_free(addr);
> +	/* Use after free with *_nofault() */
> +	ret = copy_from_kernel_nofault(&dst, addr, 1);
> +	KUNIT_EXPECT_EQ(test, ret, -EFAULT);
> +	KUNIT_EXPECT_FALSE(test, report_available());
> +}
> +
>  static void test_double_free(struct kunit *test)
>  {
>  	const size_t size = 32;
> @@ -780,6 +796,7 @@ static struct kunit_case kfence_test_cases[] = {
>  	KFENCE_KUNIT_CASE(test_out_of_bounds_read),
>  	KFENCE_KUNIT_CASE(test_out_of_bounds_write),
>  	KFENCE_KUNIT_CASE(test_use_after_free_read),
> +	KFENCE_KUNIT_CASE(test_use_after_free_read_nofault),
>  	KFENCE_KUNIT_CASE(test_double_free),
>  	KFENCE_KUNIT_CASE(test_invalid_addr_free),
>  	KFENCE_KUNIT_CASE(test_corruption),
> --
> 2.46.0

