Return-Path: <linuxppc-dev+bounces-3926-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9764C9EBA03
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 20:21:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y77r54zWFz302N;
	Wed, 11 Dec 2024 06:21:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733858469;
	cv=none; b=GuEv1NxnIZ0F6eaO/O3aQB0W7jmfknXGds8vcxPl42ZwlwFy+VsIoaesx93hYb6fV6f6D3uNE1FrpAxyicuJP/NdvWJllgHPjObL75lfiHS7FL5j7HH4CqXdZJpKUR+aF7EPvC1IFblxy7FF2LLECdLJwanuMAneuD1BPDpHX9JswK3sTlhc80AL7hf7kKyhN+wtevvrLMPoObj/2l+2n++sUL4jhIKD3C8Kwg9THi5y/i+GzxKs3dHlmHtXG3gsmOyL1ih/UAxefSGGIDkwBUPXT1PcEeF2l9jVoPbznZRGRldSEtIfbuAWZ27G2OxV0V9eyE0xBHSBn8JcVELwEw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733858469; c=relaxed/relaxed;
	bh=A9AGNc0Lvn5ogPnrcm65UtGjdq5eKcVNLIEa5EktGeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XDvhVSWk7gZC/nAQx2nh6lGS/lj1oE42pBl7/N5pNfXHocZE8vLJF3I17bHZMyjRJ/tdmH6Yi9Se1Ztbthhco5jZYfJXV1nbPZ7duSYz6iJs0H+jC/ujH/KBMbCHpkkGsKydee+GG7nKT/m0lTFpDSOdJFilxiDcB+zowhOP7kECcbKEAoFcd0GGBr5ZKARTRTSGr5weGbXO1gIZ6GQRBSQc+QfECFaWvNa2dpCwExsgpN5o1WKQuVp5NA40ydax7e3/0eFlxPqmIHjLD9OutwvqpGH/poTDaFuGqPVM2wofpYP9jg/GHIdcY2GC/XQdxL+skQLhKFhZfkyflg03gw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J5LbnbRf; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J5LbnbRf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y77r12PhYz2yDp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 06:21:05 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4FE445C5D56;
	Tue, 10 Dec 2024 19:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B9BAC4CED6;
	Tue, 10 Dec 2024 19:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733858460;
	bh=ceTCYU0kBIVgKxl1o4KF3bKYCGW8KWEqpbWay4XK5P0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J5LbnbRfaM9/8HSf00ueRdr6DpSL8qtb3PYCZOXM6uxSYHL8VqeAaihNUNbOO9WcX
	 HGqe0/3oCog/anrDPUdqic7WW+5Te/4+1STSvrz2BZRbaJhG+SO3I+aYdS+Ubp0ovh
	 qcfoY9QiY7OzGLJPDyGohszKVdr66rLMXRwZzNDC7jqWjptyL2Gn3RUSrWEI6MWA2/
	 idz0xNaabatpRf7zfj81IEpvSm7yXcJiLFMOTiektrmyR/beylDcGLM8or+n/fkmaj
	 yaqC0ICDwXZn0H+9Or6Q7EyenaVCjcbM5Kp2OiqX9tdUboYOFrYCsQP11EwoAR0MAK
	 PAZxZnBf30UsA==
Date: Tue, 10 Dec 2024 16:20:57 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
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
Message-ID: <Z1iUmVRzN0V3vMpG@x1>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205022305.158202-1-irogers@google.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Dec 04, 2024 at 06:23:05PM -0800, Ian Rogers wrote:
> The refactoring of tool PMU events to have a PMU then adding the expr
> literals to the tool PMU made it so that the literal system_tsc_freq
> was only supported on x86. Update the test expectations to match -
> namely the parsing is x86 specific and only yields a non-zero value on
> Intel.

Namhyung,

	Since you see no more problems and Athira tested it, I think
this should go via perf-tools, right?

- Arnaldo
 
> Fixes: 609aa2667f67 ("perf tool_pmu: Switch to standard pmu functions and json descriptions")
> Reported-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Closes: https://lore.kernel.org/linux-perf-users/20241022140156.98854-1-atrajeev@linux.vnet.ibm.com/
> Co-developed-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Signed-off-by: Ian Rogers <irogers@google.com>
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

