Return-Path: <linuxppc-dev+bounces-3811-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AD09E4D5B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2024 06:47:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3k1F0tVnz2yD8;
	Thu,  5 Dec 2024 16:47:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733377633;
	cv=none; b=QzqJraLItGLuWiNA7Bu1I+D/4DC0MYp2oiRGgovIsPVNPuEVzRJNcWJ6NmiXtep0ntOW402183RKKfRyDkbJpG5QMvfwLzd8WllInFafXevmEnLCxh2eDjjd7s3PsJPAFNXYKjgNUg4zmbUAkia8mdwqm+t/41lO2JbBHI9CPzrOP4h6XEIod+lV/rLG+Qc/w6GKV6sR8P7ixwHRfGJ3xeSect8eGcbEMEgaJKpwj7e/9bgEpiYdkVtZn56rgk0fWipHLFFzOeRLP1meWm6LYuBhHdLVrDDEfEv5ohrHixDDEsqOiyqTMLdBBfHEwDloJvtg0LED38/9Bvigh/CMmg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733377633; c=relaxed/relaxed;
	bh=6XxXzHP1Wk9rI+jtDHc/CO+R8Pu3Bup784I4e66wwOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G6e4HdkdPkg1FPRNGmI9TrLlwtnFyu8Rq2qRNDt6l6HgOjf7v+cCr5Z/3oF0atNdjk7Bfa6ebiI8YesLjx0qbuWZlT+lzTneaHRE2uXerBYNjUi2T+pWlNaNkxTtNC7/iaImt+NByNb4MEJqGV1IU+MCyImPeB5gVOl3F9SQDnPwXwp8k0oWqqumMSdEw3QgZEXIPjYFcsCZimHpEj7fc6DsbkTnH074v9U7c1M04RzsMryko/Hm24NWJ/6MmRj2daJMP6t2GfSc/Ld0ey0bsaav5llVWww9n3wnls9cVtg49vhUjpjL04VJfqfBRQ08KAGjO/q1ADgfnfdhu8CaeA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tEq2FCse; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tEq2FCse;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3k1C2TNzz2y8V
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2024 16:47:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DC7E1A420CF;
	Thu,  5 Dec 2024 05:45:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9862C4CED6;
	Thu,  5 Dec 2024 05:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733377626;
	bh=Br/k2viK1u/+hung3i5Uw32rL4YHFiHzUgWg/j96zuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tEq2FCseVKyNzS9AMXilL632NLi9ovlfX67rKXYMnCAhXOIQRknFKVdP+6muHjsJ3
	 QGfqQIoImkS+nNn8Yv5BFvqGXWPr3uGnW4CT7CfsBI25CVEH0xadeAMZSK05ha823e
	 9nR60DTyZW+uPLYV2qRXylQGP8UXR+zDVfzm8O+Npit9c12tGk8wLsqHNIOz8+T6Ki
	 /Y8hqzrmEOk2y0/NHTHI0sZFXI6RAX94yppUQ5+2si3msOIUtTl+c5QZ0aNSuW6tEv
	 GpqBEZ8CnbV3OLr6bDIQ8e98/b/UMFEVN7//goSsIj9VBukc/1HxJ308bHQz9FmRJh
	 tSzrXj2rViL7Q==
Date: Wed, 4 Dec 2024 21:47:04 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	James Clark <james.clark@linaro.org>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, akanksha@linux.ibm.com,
	maddy@linux.ibm.com, atrajeev@linux.vnet.ibm.com,
	kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com,
	hbathini@linux.ibm.com
Subject: Re: [PATCH v1] perf test expr: Fix system_tsc_freq for only x86
Message-ID: <Z1E-WHWSPAezVF4f@google.com>
References: <20241205022305.158202-1-irogers@google.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205022305.158202-1-irogers@google.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Ian,

On Wed, Dec 04, 2024 at 06:23:05PM -0800, Ian Rogers wrote:
> The refactoring of tool PMU events to have a PMU then adding the expr
> literals to the tool PMU made it so that the literal system_tsc_freq
> was only supported on x86. Update the test expectations to match -
> namely the parsing is x86 specific and only yields a non-zero value on
> Intel.
> 
> Fixes: 609aa2667f67 ("perf tool_pmu: Switch to standard pmu functions and json descriptions")
> Reported-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Closes: https://lore.kernel.org/linux-perf-users/20241022140156.98854-1-atrajeev@linux.vnet.ibm.com/
> Co-developed-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Signed-off-by: Ian Rogers <irogers@google.com>

It failed on my VM.

  root@arm64-vm:~/build# ./perf test -v 7
  --- start ---
  test child forked, pid 2096
  Using CPUID 0x00000000000f0510
  division by zero
  syntax error
  Unrecognized literal '#system_tsc_freq'FAILED tests/expr.c:253 #system_tsc_freq == 0
  ---- end(-1) ----
    7: Simple expression parser                                        : FAILED!

> ---
>  tools/perf/tests/expr.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/perf/tests/expr.c b/tools/perf/tests/expr.c
> index 41ff1affdfcd..726cf8d4da28 100644
> --- a/tools/perf/tests/expr.c
> +++ b/tools/perf/tests/expr.c
> @@ -75,14 +75,12 @@ static int test__expr(struct test_suite *t __maybe_unused, int subtest __maybe_u
>  	double val, num_cpus_online, num_cpus, num_cores, num_dies, num_packages;
>  	int ret;
>  	struct expr_parse_ctx *ctx;
> -	bool is_intel = false;
>  	char strcmp_cpuid_buf[256];
>  	struct perf_cpu cpu = {-1};
>  	char *cpuid = get_cpuid_allow_env_override(cpu);
>  	char *escaped_cpuid1, *escaped_cpuid2;
>  
>  	TEST_ASSERT_VAL("get_cpuid", cpuid);
> -	is_intel = strstr(cpuid, "Intel") != NULL;
>  
>  	TEST_ASSERT_EQUAL("ids_union", test_ids_union(), 0);
>  
> @@ -245,12 +243,19 @@ static int test__expr(struct test_suite *t __maybe_unused, int subtest __maybe_u
>  	if (num_dies) // Some platforms do not have CPU die support, for example s390
>  		TEST_ASSERT_VAL("#num_dies >= #num_packages", num_dies >= num_packages);
>  
> -	TEST_ASSERT_VAL("#system_tsc_freq", expr__parse(&val, ctx, "#system_tsc_freq") == 0);
> -	if (is_intel)
> -		TEST_ASSERT_VAL("#system_tsc_freq > 0", val > 0);
> -	else
> -		TEST_ASSERT_VAL("#system_tsc_freq == 0", fpclassify(val) == FP_ZERO);
>  
> +	if (expr__parse(&val, ctx, "#system_tsc_freq") == 0) {
> +		bool is_intel = strstr(cpuid, "Intel") != NULL;
> +
> +		if (is_intel)
> +			TEST_ASSERT_VAL("#system_tsc_freq > 0", val > 0);

Also Sasha reported that some (Intel?) guest machine doesn't have TSC
frequency.

Thanks,
Namhyung


> +		else
> +			TEST_ASSERT_VAL("#system_tsc_freq == 0", fpclassify(val) == FP_ZERO);
> +	} else {
> +#if defined(__i386__) || defined(__x86_64__)
> +		TEST_ASSERT_VAL("#system_tsc_freq unsupported", 0);
> +#endif
> +	}
>  	/*
>  	 * Source count returns the number of events aggregating in a leader
>  	 * event including the leader. Check parsing yields an id.
> -- 
> 2.47.0.338.g60cca15819-goog
> 

