Return-Path: <linuxppc-dev+bounces-2416-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D929A4977
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Oct 2024 00:06:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVf1R3dwzz3bpt;
	Sat, 19 Oct 2024 09:06:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729285418;
	cv=none; b=ckPvhRASpvNHx/xCZSEYI+IhFvGYWiszBcVZ2eygx7D93aYfyDRUw1WC+qIx9zNh33GeYDYeNgEmn21q+DOOBeBzkEYTavMofgeNFaBuWTPcbOaI+h+L72rOgWTppA8kqAye7ZDbOsPGK7ow1fmylXJHTM/VMv1vdugCwGOaU/EW+ZHTgCipd8e3h+MU9sWrzqPsApUK2h3kLSswIty+1qfc/4mfTObTVE21QHZxwLF91s3OjDOz61GGpsWyhacJEgvMTQXeqeUZ7yCZqwyqXZY8INBLST6Y+IHPpwU3sXCMKcE1c6y6+W9lxHnJDl1MdJwTvvWwipmgVsQLCyw0mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729285418; c=relaxed/relaxed;
	bh=nt+dAjhuzZ5n+ygaPAn3gZpiBolEQtWHa7Naom0sNUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JEfJk33zdEvzbL99N/6j8onIcnsM6nUiUzgxswM+SCYQSPqK1Y0iQ4cejL3WhxGDlj8MdXV5wBQzFwPujYfqFySs+Hbzrh5G+lq+YCKou0KsvF151G7NS1x5GJfHFMcKs/0xaetvtZ99BGa8A4hYrGauVseQqd7WUhP533X6kW3loZdGrtK2D/P1ugkYZUJ4nAiMNjcfYR9ya79zbFYT1KtroMts7+hkaiKkeJm8Aa+sDA/AeJvkpNuLtyoEjSczD9k/Rp7kwzz8OJiAYkKRZP39g6GYt+I24ZEAfcFqvhAqq1waH5rTOJzzv8tbcMERfmuBWBASYgwCvlUSYhD7qg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=149Fzrn3; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=elver@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=149Fzrn3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=elver@google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVccm5wdDz2xrC
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2024 08:03:36 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2e2bd347124so1903144a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 14:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729285412; x=1729890212; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nt+dAjhuzZ5n+ygaPAn3gZpiBolEQtWHa7Naom0sNUY=;
        b=149Fzrn3QPc6ZcPu1dEj9txH7bEs48w6Wc3mNEnTkCX6UpDgoNljZD3F8ryUC2YGMX
         E1uA/aoCImFmCOESATtkALn3ZwOIjZs4j4/jA9FAqBbsig2p8DA/xuN4rzmWg1eseCEa
         GLPFoQFyskFH5X7lR/mSBxSMapV6yN6ySn+SOR2gMt5zaRJ2S/ohkjFF/ol6bY7ot6jD
         +Qo2W625JwrxH59cHn//yCiC8u+JVbg9eY3AfLmIUsKPFc6oGd/uy5Ll3TXXyRGfXNky
         BH/oIAKFlvKt5dKwPFzsv7rkRg7pxRsqHa2r4gMsYrmECyk6DxrR5Ja5aO1BeJPN8DZo
         RKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729285412; x=1729890212;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nt+dAjhuzZ5n+ygaPAn3gZpiBolEQtWHa7Naom0sNUY=;
        b=EbEs474diBIMXcS4koBQTkq8X6YU1wMUfG5yLShziK33KIj1UZpFXrlnrteQ/wNaF9
         GzAi7RPuJhHDGI4jJC/Hxy4UJYR1R9nhczoKjv5stzW6Lpog8OyDLyivc7Alq+klRvWu
         FGHivfoKp2BgLGTIOcdIpOijRGR5UcJWd1L02UMUvFZ8QzlRs2cK6WKsoKvweC/45nYu
         U1SH4VHyp0zvVC1EppGLGKKv3FpgjTF/y5j1LzQOeQn/bFJ2QohnS+kzldPdRNJV3JEF
         fcZEIYNfQDi2xfYTK5zz1ub6QlI2Y7XthpznuEHiBP4/2rEyMP5HBRMup+2DMuR8WQzO
         lQkw==
X-Forwarded-Encrypted: i=1; AJvYcCVNdZNrzDcNxqwhHQASa54jGtdjNtU0v70D8hUoEECakhRZiQpa9RDCKV/Z2IJzO2MrZTCvb9nFFhXWLSE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YynfexWJG6hAJkF/mjJkAzv4MGWSn3LIEHB7kQnnBLdRjJdrWg1
	o8cxadDoPkEJPrYnmL3tbns85SsSwewLJTSdhbbyYVTjk8NPmP6SZzDAxYFyEusep1smBlEYDSt
	5UDRQKROzLzPsyVnRpgpnE5y0JcSeXoFXps2N
X-Google-Smtp-Source: AGHT+IEqtDiQGQ2m97dC1U/b6tmKS9G4+mhtsocnFyilcn7/D2jeuhNf+cYw3AyGzhurPX7BfICfIrDLSl6qK1QdU/s=
X-Received: by 2002:a17:90b:f87:b0:2e2:d821:1b77 with SMTP id
 98e67ed59e1d1-2e5616509b4mr4435772a91.24.1729285412125; Fri, 18 Oct 2024
 14:03:32 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <210e561f7845697a32de44b643393890f180069f.1729272697.git.ritesh.list@gmail.com>
In-Reply-To: <210e561f7845697a32de44b643393890f180069f.1729272697.git.ritesh.list@gmail.com>
From: Marco Elver <elver@google.com>
Date: Fri, 18 Oct 2024 23:02:51 +0200
Message-ID: <CANpmjNPQtAMbF2BZbUVOL+Sx2+VSOwxgxzXR8yFvDBH4Euu7Ew@mail.gmail.com>
Subject: Re: [PATCH v3] mm/kfence: Add a new kunit test test_use_after_free_read_nofault()
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: kasan-dev@googlegroups.com, linuxppc-dev@lists.ozlabs.org, 
	linux-mm@kvack.org, Dmitry Vyukov <dvyukov@google.com>, 
	Alexander Potapenko <glider@google.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Nirjhar Roy <nirjhar@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 18 Oct 2024 at 19:46, Ritesh Harjani (IBM)
<ritesh.list@gmail.com> wrote:
>
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
> Signed-off-by: Nirjhar Roy <nirjhar@linux.ibm.com>
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> ---
>
> Will be nice if we can get some feedback on this.

There was some discussion recently how sanitizers should behave around
these nofault helpers when accessing invalid memory (including freed
memory):
https://lore.kernel.org/all/CANpmjNMAVFzqnCZhEity9cjiqQ9CVN1X7qeeeAp_6yKjwKo8iw@mail.gmail.com/

It should be similar for KFENCE, i.e. no report should be generated.
Definitely a good thing to test.

Tested-by: Marco Elver <elver@google.com>
Reviewed-by: Marco Elver <elver@google.com>

> v2 -> v3:
> =========
> 1. Separated out this kfence kunit test from the larger powerpc+kfence+v3 series.
> 2. Dropped RFC tag
>
> [v2]: https://lore.kernel.org/linuxppc-dev/cover.1728954719.git.ritesh.list@gmail.com
> [powerpc+kfence+v3]: https://lore.kernel.org/linuxppc-dev/cover.1729271995.git.ritesh.list@gmail.com
>
>  mm/kfence/kfence_test.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/mm/kfence/kfence_test.c b/mm/kfence/kfence_test.c
> index 00fd17285285..f65fb182466d 100644
> --- a/mm/kfence/kfence_test.c
> +++ b/mm/kfence/kfence_test.c
> @@ -383,6 +383,22 @@ static void test_use_after_free_read(struct kunit *test)
>         KUNIT_EXPECT_TRUE(test, report_matches(&expect));
>  }
>
> +static void test_use_after_free_read_nofault(struct kunit *test)
> +{
> +       const size_t size = 32;
> +       char *addr;
> +       char dst;
> +       int ret;
> +
> +       setup_test_cache(test, size, 0, NULL);
> +       addr = test_alloc(test, size, GFP_KERNEL, ALLOCATE_ANY);
> +       test_free(addr);
> +       /* Use after free with *_nofault() */
> +       ret = copy_from_kernel_nofault(&dst, addr, 1);
> +       KUNIT_EXPECT_EQ(test, ret, -EFAULT);
> +       KUNIT_EXPECT_FALSE(test, report_available());
> +}
> +
>  static void test_double_free(struct kunit *test)
>  {
>         const size_t size = 32;
> @@ -780,6 +796,7 @@ static struct kunit_case kfence_test_cases[] = {
>         KFENCE_KUNIT_CASE(test_out_of_bounds_read),
>         KFENCE_KUNIT_CASE(test_out_of_bounds_write),
>         KFENCE_KUNIT_CASE(test_use_after_free_read),
> +       KFENCE_KUNIT_CASE(test_use_after_free_read_nofault),
>         KFENCE_KUNIT_CASE(test_double_free),
>         KFENCE_KUNIT_CASE(test_invalid_addr_free),
>         KFENCE_KUNIT_CASE(test_corruption),
> --
> 2.46.0
>

