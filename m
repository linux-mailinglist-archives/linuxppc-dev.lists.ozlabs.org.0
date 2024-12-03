Return-Path: <linuxppc-dev+bounces-3746-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC27B9E2B29
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 19:42:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2qK71l18z30Pn;
	Wed,  4 Dec 2024 05:42:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733251371;
	cv=none; b=aduVnNfu7yIoRUGDZS4uH5F5CYorVar6uZ5drupoq/HSDQIpgnRnS5y2KTrZORA9pffqmdibDE4UZKX9LUrX7gy0/uNZ0LLk8l2eBeru8hn7jf6GKf4EYaGbHFpYnvsI2bx4uamNerAdmh9ffwAelgoaWcvBaW9LlnKmhTcZg98Uv3C3TlPtLXf7M6IB9WDSreELy9lEunMcKcfYmUEszz4oQUPmV60Z2AibCF3085R2ufVhi4lIuqrG3PXUaH22GxrJadJLhShXMCclBZiQwuHel5z9/V2qq18lDdICsniUQdDVlCEcF23vS+A0u/VQUVGaoyudEF1CqgggOuln7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733251371; c=relaxed/relaxed;
	bh=KOqcNENWXlE+fnWQbKbM5jARfWP6Egdv4xGlAVEtoF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cVjXa5viaCvvQ3ag+yaiCN1yVOwUjs0EThs5tHiZTezVJAm/oojqKAr2Llz+QHsIBvrKTxomKsQm+Ak58aQMcIaYMQ9t+8TWprJYmCX704sT3gkyl7s1eg1yQ6MYYFrozTRKYLSdTNJIiCwVwN1VkDOd4TU5GwF0IdvjPDlRmFyBxVKnKXWzHgdPc3hWwZaCGRmkMGOFt+kzVeB1rK5E1K5NNmDXt8ZVdRZjLZW6uqDgBRpruJFHqjc9uWKX/dj051tBNyuIuXq6lYpARfPc3+yIvVuYBWGDaStttX+A12gZctWewY+EkoJPdUWsrWhU24jz156tkCC/xfgQ2nNIrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mzJJqEqb; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mzJJqEqb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2qK60Rjxz30Ng
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 05:42:49 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 071EF5C62B8;
	Tue,  3 Dec 2024 18:42:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F2ADC4CECF;
	Tue,  3 Dec 2024 18:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733251367;
	bh=IE/QB8ecP1kkb8KyuAoQXlcTO6A7S0zskyQTSpqhqXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mzJJqEqbKT6h0rEo44OZpG6soedWaZUYOqxRXJDOb5C/kTUBWIpJAbKpEUxE6/JhD
	 OEEasR9x7Rl/PMncXsa2i9ZK04bRex7jpp1sFEIYhLMLZFecofT5IZqc1kLM3KJETP
	 Ci+04CkRrp/XSMGEcH3/cC2e9V5MYDu8/i41BXDqcSqr0SCx/VSrY5T1Qbo7q5zjim
	 JHPokyf5xd1MriPF1Ur+DgRohouo1ESNBghOpEuplpo149hJDPr4wOnWAcq9H/zt6K
	 AbMtr8gKlU9MHfifYjYAkRfrz6mFp6Ezid0ZDU98TwiXA1EX3DQbdrKUzQxJxq3QZF
	 Z3XsF451iOkzQ==
Date: Tue, 3 Dec 2024 10:42:45 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Cc: Leo Yan <leo.yan@arm.com>, Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>, tmricht@linux.ibm.com,
	acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
	linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	akanksha@linux.ibm.com, maddy@linux.ibm.com, kjain@linux.ibm.com,
	disgoel@linux.vnet.ibm.com, hbathini@linux.ibm.com,
	Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH] tools/perf/tests/expr: Make the system_tsc_freq test
 only for intel
Message-ID: <Z09RJbpmHzc4b1D6@google.com>
References: <20241022140156.98854-1-atrajeev@linux.vnet.ibm.com>
 <ZyF2-XNUh38p_5Gg@google.com>
 <B72F330F-2A56-41B0-ABED-FCA7DC9EE711@linux.vnet.ibm.com>
 <CAP-5=fXCYURva6Q8ktRVmnf2QCcsr-E3fPn327k0JRCw_9fn3A@mail.gmail.com>
 <BBF1A4DC-3BD9-4377-BE2F-CBEFE55F0497@linux.vnet.ibm.com>
 <20241107135606.GA47850@e132581.arm.com>
 <0F805B2F-35CC-4E0C-BD2F-84552C4C528E@linux.vnet.ibm.com>
 <Z09K5orKhWbeOGLV@google.com>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z09K5orKhWbeOGLV@google.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Dec 03, 2024 at 10:16:06AM -0800, Namhyung Kim wrote:
> Hello,
> 
> On Fri, Nov 08, 2024 at 10:50:10AM +0530, Athira Rajeev wrote:
> > 
> > 
> > > On 7 Nov 2024, at 7:26 PM, Leo Yan <leo.yan@arm.com> wrote:
> > > 
> > > Hi Athira,
> > > 
> > > On Wed, Nov 06, 2024 at 03:04:57PM +0530, Athira Rajeev wrote:
> > > 
> > > [...]
> > > 
> > >>> Hi Athira,
> > >>> 
> > >>> sorry for the breakage and thank you for the detailed explanation. As
> > >>> the code will run on AMD I think your change will break that - . It is
> > >>> probably safest to keep the ".. else { .." for this case but guard it
> > >>> in the ifdef.
> > >>> 
> > >> 
> > >> Hi Ian
> > >> 
> > >> Thanks for your comments. Does the below change looks good ?
> > >> 
> > >> diff --git a/tools/perf/tests/expr.c b/tools/perf/tests/expr.c
> > >> index e3aa9d4fcf3a..f5b2d96bb59b 100644
> > >> --- a/tools/perf/tests/expr.c
> > >> +++ b/tools/perf/tests/expr.c
> > >> @@ -74,14 +74,12 @@ static int test__expr(struct test_suite *t __maybe_unused, int subtest __maybe_u
> > >>    double val, num_cpus_online, num_cpus, num_cores, num_dies, num_packages;
> > >>    int ret;
> > >>    struct expr_parse_ctx *ctx;
> > >> -    bool is_intel = false;
> > >>    char strcmp_cpuid_buf[256];
> > >>    struct perf_pmu *pmu = perf_pmus__find_core_pmu();
> > >>    char *cpuid = perf_pmu__getcpuid(pmu);
> > >>    char *escaped_cpuid1, *escaped_cpuid2;
> > >> 
> > >>    TEST_ASSERT_VAL("get_cpuid", cpuid);
> > >> -    is_intel = strstr(cpuid, "Intel") != NULL;
> > >> 
> > >>    TEST_ASSERT_EQUAL("ids_union", test_ids_union(), 0);
> > >> 
> > >> @@ -244,11 +242,13 @@ static int test__expr(struct test_suite *t __maybe_unused, int subtest __maybe_u
> > >>    if (num_dies) // Some platforms do not have CPU die support, for example s390
> > >>        TEST_ASSERT_VAL("#num_dies >= #num_packages", num_dies >= num_packages);
> > >> 
> > >> +#if defined(__i386__) && defined(__x86_64__)
> > >>    TEST_ASSERT_VAL("#system_tsc_freq", expr__parse(&val, ctx, "#system_tsc_freq") == 0);
> > >> -    if (is_intel)
> > >> +    if (strstr(cpuid, "Intel") != NULL)
> > >>        TEST_ASSERT_VAL("#system_tsc_freq > 0", val > 0);
> > >>    else
> > >>        TEST_ASSERT_VAL("#system_tsc_freq == 0", fpclassify(val) == FP_ZERO);
> > >> +#endif
> > >> 
> > >>    /*
> > >>     * Source count returns the number of events aggregating in a leader
> > > 
> > > I confirmed the change above fixes the failure on Arm64.
> > > 
> > > Tested-by: Leo Yan <leo.yan@arm.com>
> > Thanks Leo Yan for testing.
> > 
> > Hi Ian,
> > 
> > If the change above looks good, I will post a V2 . Please share your review comments
> 
> Sorry for the delay, it looks good to me.  Can you please send the v2?

After looking at another report, I think we need to check the value of
TSC freq, not just the vendor.  Can you please test this?

Thanks,
Namhyung


---8<---
diff --git a/tools/perf/tests/expr.c b/tools/perf/tests/expr.c
index 41ff1affdfcdf31c..45151696e7b76308 100644
--- a/tools/perf/tests/expr.c
+++ b/tools/perf/tests/expr.c
@@ -5,6 +5,7 @@
 #include "util/hashmap.h"
 #include "util/header.h"
 #include "util/smt.h"
+#include "util/tsc.h"
 #include "tests.h"
 #include <perf/cpumap.h>
 #include <math.h>
@@ -75,14 +76,12 @@ static int test__expr(struct test_suite *t __maybe_unused, int subtest __maybe_u
 	double val, num_cpus_online, num_cpus, num_cores, num_dies, num_packages;
 	int ret;
 	struct expr_parse_ctx *ctx;
-	bool is_intel = false;
 	char strcmp_cpuid_buf[256];
 	struct perf_cpu cpu = {-1};
 	char *cpuid = get_cpuid_allow_env_override(cpu);
 	char *escaped_cpuid1, *escaped_cpuid2;
 
 	TEST_ASSERT_VAL("get_cpuid", cpuid);
-	is_intel = strstr(cpuid, "Intel") != NULL;
 
 	TEST_ASSERT_EQUAL("ids_union", test_ids_union(), 0);
 
@@ -246,10 +245,10 @@ static int test__expr(struct test_suite *t __maybe_unused, int subtest __maybe_u
 		TEST_ASSERT_VAL("#num_dies >= #num_packages", num_dies >= num_packages);
 
 	TEST_ASSERT_VAL("#system_tsc_freq", expr__parse(&val, ctx, "#system_tsc_freq") == 0);
-	if (is_intel)
-		TEST_ASSERT_VAL("#system_tsc_freq > 0", val > 0);
-	else
-		TEST_ASSERT_VAL("#system_tsc_freq == 0", fpclassify(val) == FP_ZERO);
+	if (val > 0) {
+		TEST_ASSERT_VAL("#system_tsc_freq == arch_get_tsc_freq()",
+				val == arch_get_tsc_freq());
+	}
 
 	/*
 	 * Source count returns the number of events aggregating in a leader

