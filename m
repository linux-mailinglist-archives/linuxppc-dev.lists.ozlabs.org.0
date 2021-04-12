Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF83135D2D2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 00:03:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FK2mY6FgVz3cJq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 08:03:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=fg44s9YW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=kaleshsingh@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=fg44s9YW; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJyCS5XNqz302b
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 04:37:38 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id y32so10064971pga.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 11:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z3+agwM/TeNrjUCMQXaeoLSrY4b9sKMllw4YPnQltNg=;
 b=fg44s9YWe4dvFlAkKx4+cvJSjakBhdVeCGUvL4WcBLHsdaQHQkKop/DX7oXsvwUFB5
 +JdUdUg9vzY5p55aasDH1LiCLx9oY0hw5UVl5SoYEyegXOaRlxcWind7SBPqqJcdZjOB
 2hyzj4kHwzU/iFNwyu9e2k7YXQq3FkNmjCcrjHX4uCy9ZEkeW4MBnizGsr+EvU4mh0d+
 K3zxfBJXJrPzAX5NOVtVsnE/InTqgrCcnCHoOR5aR9k3K/FGM55/Vm7soYeVlMgte6po
 R4kmir40HqzuPSmgx/5/DsLenWmL3KWvYhgKeQmmZ2LAjAXkVb1uI1k7+ztX6P2gpuZt
 SoOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z3+agwM/TeNrjUCMQXaeoLSrY4b9sKMllw4YPnQltNg=;
 b=QSihjeRELpQD4or0E1Lriyt/V0AlUzIx6EzplAu8Q6DimL6DZJcfKLcOhdQzKfTA+E
 4GiCP5skPEH8UXN4f9yYgn1yY5YvTW1H9HF74/rAKClAdKC+zF4RSQwtIHxvWQbrfbpp
 gMmo2kaoXjKXMcvYIY5W3pObhhBB/0RR0VnL6+H/bpZMYcCM++NM4M3IpXjAM4kYS/Vc
 ATAJClv1pKs8EKAIl4Cu/IHAjXcAARiLZbYwdcfkCNiGh8yBBajxy8Sko0UCc+QhOy1Z
 WEt0PAw6TOmCjZhN7qrf/FfjeskoFj5u3/yx/ZRRgmsukmyAdXU8auVbaawkqR+vKbST
 hNRA==
X-Gm-Message-State: AOAM532/KWWEI8DjeMNM7pQYd9kvHrB0kqutGmfwIPh4+5yrrqIZ8qcE
 r/eM/AIosAXVutGoSoGhRG0cRhQN5Po4X723tpmOSw==
X-Google-Smtp-Source: ABdhPJwvcp/oN+rzkEkXX3s0V+B9ISLIx8bTCK7FQ3WQ5zVZE456bxdwefP/X1sYkxg61pV8BxZr6bs9VqpgtBYhBRA=
X-Received: by 2002:a05:6a00:1c67:b029:215:6f93:d220 with SMTP id
 s39-20020a056a001c67b02902156f93d220mr24848728pfw.36.1618252654995; Mon, 12
 Apr 2021 11:37:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210330060752.592769-1-aneesh.kumar@linux.ibm.com>
 <20210330060752.592769-2-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20210330060752.592769-2-aneesh.kumar@linux.ibm.com>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Mon, 12 Apr 2021 11:37:24 -0700
Message-ID: <CAC_TJvckza8EDro7orzWbtT3dbs=MG+zcASvvpFzj+eedVMXKA@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] selftest/mremap_test: Update the test to handle
 pagesize other than 4K
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 13 Apr 2021 08:01:23 +1000
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: npiggin@gmail.com, "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
 joel@joelfernandes.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 29, 2021 at 11:08 PM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> Instead of hardcoding 4K page size fetch it using sysconf(). For the performance
> measurements test still assume 2M and 1G are hugepage sizes.
>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

Reviewed-by: Kalesh Singh <kaleshsingh@google.com>

> ---
>  tools/testing/selftests/vm/mremap_test.c | 113 ++++++++++++-----------
>  1 file changed, 61 insertions(+), 52 deletions(-)
>
> diff --git a/tools/testing/selftests/vm/mremap_test.c b/tools/testing/selftests/vm/mremap_test.c
> index 9c391d016922..c9a5461eb786 100644
> --- a/tools/testing/selftests/vm/mremap_test.c
> +++ b/tools/testing/selftests/vm/mremap_test.c
> @@ -45,14 +45,15 @@ enum {
>         _4MB = 4ULL << 20,
>         _1GB = 1ULL << 30,
>         _2GB = 2ULL << 30,
> -       PTE = _4KB,
>         PMD = _2MB,
>         PUD = _1GB,
>  };
>
> +#define PTE page_size
> +
>  #define MAKE_TEST(source_align, destination_align, size,       \
>                   overlaps, should_fail, test_name)             \
> -{                                                              \
> +(struct test){                                                 \
>         .name = test_name,                                      \
>         .config = {                                             \
>                 .src_alignment = source_align,                  \
> @@ -252,12 +253,17 @@ static int parse_args(int argc, char **argv, unsigned int *threshold_mb,
>         return 0;
>  }
>
> +#define MAX_TEST 13
> +#define MAX_PERF_TEST 3
>  int main(int argc, char **argv)
>  {
>         int failures = 0;
>         int i, run_perf_tests;
>         unsigned int threshold_mb = VALIDATION_DEFAULT_THRESHOLD;
>         unsigned int pattern_seed;
> +       struct test test_cases[MAX_TEST];
> +       struct test perf_test_cases[MAX_PERF_TEST];
> +       int page_size;
>         time_t t;
>
>         pattern_seed = (unsigned int) time(&t);
> @@ -268,56 +274,59 @@ int main(int argc, char **argv)
>         ksft_print_msg("Test configs:\n\tthreshold_mb=%u\n\tpattern_seed=%u\n\n",
>                        threshold_mb, pattern_seed);
>
> -       struct test test_cases[] = {
> -               /* Expected mremap failures */
> -               MAKE_TEST(_4KB, _4KB, _4KB, OVERLAPPING, EXPECT_FAILURE,
> -                 "mremap - Source and Destination Regions Overlapping"),
> -               MAKE_TEST(_4KB, _1KB, _4KB, NON_OVERLAPPING, EXPECT_FAILURE,
> -                 "mremap - Destination Address Misaligned (1KB-aligned)"),
> -               MAKE_TEST(_1KB, _4KB, _4KB, NON_OVERLAPPING, EXPECT_FAILURE,
> -                 "mremap - Source Address Misaligned (1KB-aligned)"),
> -
> -               /* Src addr PTE aligned */
> -               MAKE_TEST(PTE, PTE, _8KB, NON_OVERLAPPING, EXPECT_SUCCESS,
> -                 "8KB mremap - Source PTE-aligned, Destination PTE-aligned"),
> -
> -               /* Src addr 1MB aligned */
> -               MAKE_TEST(_1MB, PTE, _2MB, NON_OVERLAPPING, EXPECT_SUCCESS,
> -                 "2MB mremap - Source 1MB-aligned, Destination PTE-aligned"),
> -               MAKE_TEST(_1MB, _1MB, _2MB, NON_OVERLAPPING, EXPECT_SUCCESS,
> -                 "2MB mremap - Source 1MB-aligned, Destination 1MB-aligned"),
> -
> -               /* Src addr PMD aligned */
> -               MAKE_TEST(PMD, PTE, _4MB, NON_OVERLAPPING, EXPECT_SUCCESS,
> -                 "4MB mremap - Source PMD-aligned, Destination PTE-aligned"),
> -               MAKE_TEST(PMD, _1MB, _4MB, NON_OVERLAPPING, EXPECT_SUCCESS,
> -                 "4MB mremap - Source PMD-aligned, Destination 1MB-aligned"),
> -               MAKE_TEST(PMD, PMD, _4MB, NON_OVERLAPPING, EXPECT_SUCCESS,
> -                 "4MB mremap - Source PMD-aligned, Destination PMD-aligned"),
> -
> -               /* Src addr PUD aligned */
> -               MAKE_TEST(PUD, PTE, _2GB, NON_OVERLAPPING, EXPECT_SUCCESS,
> -                 "2GB mremap - Source PUD-aligned, Destination PTE-aligned"),
> -               MAKE_TEST(PUD, _1MB, _2GB, NON_OVERLAPPING, EXPECT_SUCCESS,
> -                 "2GB mremap - Source PUD-aligned, Destination 1MB-aligned"),
> -               MAKE_TEST(PUD, PMD, _2GB, NON_OVERLAPPING, EXPECT_SUCCESS,
> -                 "2GB mremap - Source PUD-aligned, Destination PMD-aligned"),
> -               MAKE_TEST(PUD, PUD, _2GB, NON_OVERLAPPING, EXPECT_SUCCESS,
> -                 "2GB mremap - Source PUD-aligned, Destination PUD-aligned"),
> -       };
> -
> -       struct test perf_test_cases[] = {
> -               /*
> -                * mremap 1GB region - Page table level aligned time
> -                * comparison.
> -                */
> -               MAKE_TEST(PTE, PTE, _1GB, NON_OVERLAPPING, EXPECT_SUCCESS,
> -                 "1GB mremap - Source PTE-aligned, Destination PTE-aligned"),
> -               MAKE_TEST(PMD, PMD, _1GB, NON_OVERLAPPING, EXPECT_SUCCESS,
> -                 "1GB mremap - Source PMD-aligned, Destination PMD-aligned"),
> -               MAKE_TEST(PUD, PUD, _1GB, NON_OVERLAPPING, EXPECT_SUCCESS,
> -                 "1GB mremap - Source PUD-aligned, Destination PUD-aligned"),
> -       };
> +       page_size = sysconf(_SC_PAGESIZE);
> +
> +       /* Expected mremap failures */
> +       test_cases[0] = MAKE_TEST(page_size, page_size, page_size,
> +                                 OVERLAPPING, EXPECT_FAILURE,
> +                                 "mremap - Source and Destination Regions Overlapping");
> +
> +       test_cases[1] = MAKE_TEST(page_size, page_size/4, page_size,
> +                                 NON_OVERLAPPING, EXPECT_FAILURE,
> +                                 "mremap - Destination Address Misaligned (1KB-aligned)");
> +       test_cases[2] = MAKE_TEST(page_size/4, page_size, page_size,
> +                                 NON_OVERLAPPING, EXPECT_FAILURE,
> +                                 "mremap - Source Address Misaligned (1KB-aligned)");
> +
> +       /* Src addr PTE aligned */
> +       test_cases[3] = MAKE_TEST(PTE, PTE, PTE * 2,
> +                                 NON_OVERLAPPING, EXPECT_SUCCESS,
> +                                 "8KB mremap - Source PTE-aligned, Destination PTE-aligned");
> +
> +       /* Src addr 1MB aligned */
> +       test_cases[4] = MAKE_TEST(_1MB, PTE, _2MB, NON_OVERLAPPING, EXPECT_SUCCESS,
> +                                 "2MB mremap - Source 1MB-aligned, Destination PTE-aligned");
> +       test_cases[5] = MAKE_TEST(_1MB, _1MB, _2MB, NON_OVERLAPPING, EXPECT_SUCCESS,
> +                                 "2MB mremap - Source 1MB-aligned, Destination 1MB-aligned");
> +
> +       /* Src addr PMD aligned */
> +       test_cases[6] = MAKE_TEST(PMD, PTE, _4MB, NON_OVERLAPPING, EXPECT_SUCCESS,
> +                                 "4MB mremap - Source PMD-aligned, Destination PTE-aligned");
> +       test_cases[7] = MAKE_TEST(PMD, _1MB, _4MB, NON_OVERLAPPING, EXPECT_SUCCESS,
> +                                 "4MB mremap - Source PMD-aligned, Destination 1MB-aligned");
> +       test_cases[8] = MAKE_TEST(PMD, PMD, _4MB, NON_OVERLAPPING, EXPECT_SUCCESS,
> +                                 "4MB mremap - Source PMD-aligned, Destination PMD-aligned");
> +
> +       /* Src addr PUD aligned */
> +       test_cases[9] = MAKE_TEST(PUD, PTE, _2GB, NON_OVERLAPPING, EXPECT_SUCCESS,
> +                                 "2GB mremap - Source PUD-aligned, Destination PTE-aligned");
> +       test_cases[10] = MAKE_TEST(PUD, _1MB, _2GB, NON_OVERLAPPING, EXPECT_SUCCESS,
> +                                  "2GB mremap - Source PUD-aligned, Destination 1MB-aligned");
> +       test_cases[11] = MAKE_TEST(PUD, PMD, _2GB, NON_OVERLAPPING, EXPECT_SUCCESS,
> +                                  "2GB mremap - Source PUD-aligned, Destination PMD-aligned");
> +       test_cases[12] = MAKE_TEST(PUD, PUD, _2GB, NON_OVERLAPPING, EXPECT_SUCCESS,
> +                                  "2GB mremap - Source PUD-aligned, Destination PUD-aligned");
> +
> +       perf_test_cases[0] =  MAKE_TEST(page_size, page_size, _1GB, NON_OVERLAPPING, EXPECT_SUCCESS,
> +                                       "1GB mremap - Source PTE-aligned, Destination PTE-aligned");
> +       /*
> +        * mremap 1GB region - Page table level aligned time
> +        * comparison.
> +        */
> +       perf_test_cases[1] = MAKE_TEST(PMD, PMD, _1GB, NON_OVERLAPPING, EXPECT_SUCCESS,
> +                                      "1GB mremap - Source PMD-aligned, Destination PMD-aligned");
> +       perf_test_cases[2] = MAKE_TEST(PUD, PUD, _1GB, NON_OVERLAPPING, EXPECT_SUCCESS,
> +                                      "1GB mremap - Source PUD-aligned, Destination PUD-aligned");
>
>         run_perf_tests =  (threshold_mb == VALIDATION_NO_THRESHOLD) ||
>                                 (threshold_mb * _1MB >= _1GB);
> --
> 2.30.2
>
