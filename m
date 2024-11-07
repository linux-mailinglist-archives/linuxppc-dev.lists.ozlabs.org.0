Return-Path: <linuxppc-dev+bounces-3024-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A559E9C0FDE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 21:40:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xkv8P3lKgz3bsL;
	Fri,  8 Nov 2024 07:40:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730987805;
	cv=none; b=NRnQa3YcubiKJPUGll3EECZRHx4TNTXIvulRX1wU8B6ZevM3mnW1athn+WxBUbonmf6sUK5+2Rkh0+4b6H7NkHy2UkGqD0MVzZpgpoMpF7M3K51TbZNb3N4fQr2YRO/pK54Ep6b1DVAATlARsLXGceaMEQAqhuJQVfmxNicWKMn19b5WYLin/z+wj+9gP6aTb3oRK4MFD/BoWFOaXMwHmJ84phPuEeQ6vIzdK89UaFLcDLXqrZMRxgQ6dRuWtPMnIV/K1Yd+fTv8WhWSYga43fkY2Rex1iDxqxU6UPUo5uL30Ni/iAMSIRLiPeDIqhsnsT2noxTWPedpoWkrdrZwCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730987805; c=relaxed/relaxed;
	bh=8QQVkafZcCRpDQpWhpOVq7SfsMWPxQ+ZlRFAONCk4rM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJT4fdq/WAujIvIu9fhwHJAmztSofg/eTWF3KtpinSPyNNQoSRpWyGNs8ejrGqzwYBxxNKG1slxV6JtFY2z7c9U2Tmqh01hbFp7z0Fjf55+JDzdE8rvKBFW8etVVMPdT2Czq71wNz9fmAgHyeuIfU9SEjkCYX2uk360McaRIFjgLpCt3Wlk49D/KqMYlyhl1TtJpCU1vRJQJdrB5imDwOD3CqQhk2G18wWZnz6ISQ8TJQPiPw3s8P8CPzv7/d0Wyv1IURY28yJrpK5j81pBq+RBsg6b3DiCa6TOu2RuBNroHAUotiVKFCLQag8swq19/PQNT5qSWEuwcdcrlIGzVPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=leo.yan@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=leo.yan@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkkBz4RSnz3bmQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 00:56:41 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8323497;
	Thu,  7 Nov 2024 05:56:38 -0800 (PST)
Received: from localhost (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 97AB93F6A8;
	Thu,  7 Nov 2024 05:56:08 -0800 (PST)
Date: Thu, 7 Nov 2024 13:56:06 +0000
From: Leo Yan <leo.yan@arm.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Cc: Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>,
	James Clark <james.clark@linaro.org>, tmricht@linux.ibm.com,
	acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
	linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	akanksha@linux.ibm.com, maddy@linux.ibm.com, kjain@linux.ibm.com,
	disgoel@linux.vnet.ibm.com, hbathini@linux.ibm.com
Subject: Re: [PATCH] tools/perf/tests/expr: Make the system_tsc_freq test
 only for intel
Message-ID: <20241107135606.GA47850@e132581.arm.com>
References: <20241022140156.98854-1-atrajeev@linux.vnet.ibm.com>
 <ZyF2-XNUh38p_5Gg@google.com>
 <B72F330F-2A56-41B0-ABED-FCA7DC9EE711@linux.vnet.ibm.com>
 <CAP-5=fXCYURva6Q8ktRVmnf2QCcsr-E3fPn327k0JRCw_9fn3A@mail.gmail.com>
 <BBF1A4DC-3BD9-4377-BE2F-CBEFE55F0497@linux.vnet.ibm.com>
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
In-Reply-To: <BBF1A4DC-3BD9-4377-BE2F-CBEFE55F0497@linux.vnet.ibm.com>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Athira,

On Wed, Nov 06, 2024 at 03:04:57PM +0530, Athira Rajeev wrote:

[...]

> > Hi Athira,
> >
> > sorry for the breakage and thank you for the detailed explanation. As
> > the code will run on AMD I think your change will break that - . It is
> > probably safest to keep the ".. else { .." for this case but guard it
> > in the ifdef.
> >
> 
> Hi Ian
> 
> Thanks for your comments. Does the below change looks good ?
> 
> diff --git a/tools/perf/tests/expr.c b/tools/perf/tests/expr.c
> index e3aa9d4fcf3a..f5b2d96bb59b 100644
> --- a/tools/perf/tests/expr.c
> +++ b/tools/perf/tests/expr.c
> @@ -74,14 +74,12 @@ static int test__expr(struct test_suite *t __maybe_unused, int subtest __maybe_u
>     double val, num_cpus_online, num_cpus, num_cores, num_dies, num_packages;
>     int ret;
>     struct expr_parse_ctx *ctx;
> -    bool is_intel = false;
>     char strcmp_cpuid_buf[256];
>     struct perf_pmu *pmu = perf_pmus__find_core_pmu();
>     char *cpuid = perf_pmu__getcpuid(pmu);
>     char *escaped_cpuid1, *escaped_cpuid2;
> 
>     TEST_ASSERT_VAL("get_cpuid", cpuid);
> -    is_intel = strstr(cpuid, "Intel") != NULL;
> 
>     TEST_ASSERT_EQUAL("ids_union", test_ids_union(), 0);
> 
> @@ -244,11 +242,13 @@ static int test__expr(struct test_suite *t __maybe_unused, int subtest __maybe_u
>     if (num_dies) // Some platforms do not have CPU die support, for example s390
>         TEST_ASSERT_VAL("#num_dies >= #num_packages", num_dies >= num_packages);
> 
> +#if defined(__i386__) && defined(__x86_64__)
>     TEST_ASSERT_VAL("#system_tsc_freq", expr__parse(&val, ctx, "#system_tsc_freq") == 0);
> -    if (is_intel)
> +    if (strstr(cpuid, "Intel") != NULL)
>         TEST_ASSERT_VAL("#system_tsc_freq > 0", val > 0);
>     else
>         TEST_ASSERT_VAL("#system_tsc_freq == 0", fpclassify(val) == FP_ZERO);
> +#endif
> 
>     /*
>      * Source count returns the number of events aggregating in a leader

I confirmed the change above fixes the failure on Arm64.

Tested-by: Leo Yan <leo.yan@arm.com>

