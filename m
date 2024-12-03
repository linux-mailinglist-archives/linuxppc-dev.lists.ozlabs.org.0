Return-Path: <linuxppc-dev+bounces-3745-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 576909E2A94
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 19:16:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2pkQ6mQTz30Pp;
	Wed,  4 Dec 2024 05:16:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733249774;
	cv=none; b=bWb97wyn3YfhaiYerBJDyW0Aqbb/Pvv1/09yznwhCUG3izW8Je0H+6l90XBAg2ngZFExvINwWxgGDZTTbV9vd9DMz/K4FEGxabutKAp+j0TI3olodpTHFYaQNU7H+xT81B1vBn1uSNJ6WOz7KRFza+z/t/5Een7GG8PMXZQWP4VovuYYQDZENSLBwUF1DvjRQs33TfgPDItiyxBnGYicffiD9qFev1sxSB4L5P6EjG4RJz/g4WWVTwo49pYW39vOevQSIdyOxYBLtZpyhz2x6wjLMqmp4+S+CAgszGy4X97iW4C6B6tvupAG5pxWmRg89hr7UxumpooelniNVV1C9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733249774; c=relaxed/relaxed;
	bh=EuUqkiP4+Zx7Gf8TtMSLfT15hrcDijR01dxcn4S6JJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dbAdW7xy8vhqfQ9SPK6+mnxMAkQuvCNQTgvbi/HHpRmQijXUfwlhWC0N2aiDGYpCfkasHwAUL4a6OS+yLOOGWzT7tBQ73c3XXUU3w1ramIbgsPe+dmEW+F8w4U7rXB0ewFMA3S/Z7aV3oxHRdugqYk08NTwubADmWLEafvuKaSIrKsaqajj4znO/k7F6dAHe2ybDcY6Hgdhn3B4awqphZgv8+yB2KCB5agg7G/7YGTAwQ9uFQdBrkyNXoHJ1xQrQrgsQnXhrVW2yCPWRoaQvUpRxB+pYAEvEMNeuxstE31bMvBOPHjIj0i1HAkM99kQ6sisorZQSCVW3Ir9LwEwNhg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AhZHAunw; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AhZHAunw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2pkM5rzvz30Pn
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 05:16:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 01C565C5741;
	Tue,  3 Dec 2024 18:15:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A899C4CECF;
	Tue,  3 Dec 2024 18:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733249768;
	bh=+MgMv1FFactu5GtM+qs2qFnKFxz3fIsOOrabXsp9ehA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AhZHAunw6cTIVm0KnZ1qPsKWMfmNvVvgiozA3SwQCeseXc9ZKBMdf3GfP4wN0w7pc
	 qDy231uQgw3IAlxndcB3hrUaBs//JWwgNxYRULVZku8Av/OxrLnMsREIRhDpPyuugo
	 1DyBgcT6mPrvGLAUtji81tD8jYHQ+ntlSA5HOoXFUNjJh4Lejob+dxXjDtplUumbOf
	 z1u1RZWHVfFQnS43GPgPYMz8Ljn2KdLM62yOcJkxD7XY/idqTrLXJscyEy5JQPOS5d
	 Mi4Diu1FSaZks5YuB7Z+53LvYKxKGAW3jckBZbvBqKBw4uSUA2BSNf36RAslfG05Gy
	 hT0nV6lxhmAlA==
Date: Tue, 3 Dec 2024 10:16:06 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Cc: Leo Yan <leo.yan@arm.com>, Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>, tmricht@linux.ibm.com,
	acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
	linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	akanksha@linux.ibm.com, maddy@linux.ibm.com, kjain@linux.ibm.com,
	disgoel@linux.vnet.ibm.com, hbathini@linux.ibm.com
Subject: Re: [PATCH] tools/perf/tests/expr: Make the system_tsc_freq test
 only for intel
Message-ID: <Z09K5orKhWbeOGLV@google.com>
References: <20241022140156.98854-1-atrajeev@linux.vnet.ibm.com>
 <ZyF2-XNUh38p_5Gg@google.com>
 <B72F330F-2A56-41B0-ABED-FCA7DC9EE711@linux.vnet.ibm.com>
 <CAP-5=fXCYURva6Q8ktRVmnf2QCcsr-E3fPn327k0JRCw_9fn3A@mail.gmail.com>
 <BBF1A4DC-3BD9-4377-BE2F-CBEFE55F0497@linux.vnet.ibm.com>
 <20241107135606.GA47850@e132581.arm.com>
 <0F805B2F-35CC-4E0C-BD2F-84552C4C528E@linux.vnet.ibm.com>
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
In-Reply-To: <0F805B2F-35CC-4E0C-BD2F-84552C4C528E@linux.vnet.ibm.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello,

On Fri, Nov 08, 2024 at 10:50:10AM +0530, Athira Rajeev wrote:
> 
> 
> > On 7 Nov 2024, at 7:26 PM, Leo Yan <leo.yan@arm.com> wrote:
> > 
> > Hi Athira,
> > 
> > On Wed, Nov 06, 2024 at 03:04:57PM +0530, Athira Rajeev wrote:
> > 
> > [...]
> > 
> >>> Hi Athira,
> >>> 
> >>> sorry for the breakage and thank you for the detailed explanation. As
> >>> the code will run on AMD I think your change will break that - . It is
> >>> probably safest to keep the ".. else { .." for this case but guard it
> >>> in the ifdef.
> >>> 
> >> 
> >> Hi Ian
> >> 
> >> Thanks for your comments. Does the below change looks good ?
> >> 
> >> diff --git a/tools/perf/tests/expr.c b/tools/perf/tests/expr.c
> >> index e3aa9d4fcf3a..f5b2d96bb59b 100644
> >> --- a/tools/perf/tests/expr.c
> >> +++ b/tools/perf/tests/expr.c
> >> @@ -74,14 +74,12 @@ static int test__expr(struct test_suite *t __maybe_unused, int subtest __maybe_u
> >>    double val, num_cpus_online, num_cpus, num_cores, num_dies, num_packages;
> >>    int ret;
> >>    struct expr_parse_ctx *ctx;
> >> -    bool is_intel = false;
> >>    char strcmp_cpuid_buf[256];
> >>    struct perf_pmu *pmu = perf_pmus__find_core_pmu();
> >>    char *cpuid = perf_pmu__getcpuid(pmu);
> >>    char *escaped_cpuid1, *escaped_cpuid2;
> >> 
> >>    TEST_ASSERT_VAL("get_cpuid", cpuid);
> >> -    is_intel = strstr(cpuid, "Intel") != NULL;
> >> 
> >>    TEST_ASSERT_EQUAL("ids_union", test_ids_union(), 0);
> >> 
> >> @@ -244,11 +242,13 @@ static int test__expr(struct test_suite *t __maybe_unused, int subtest __maybe_u
> >>    if (num_dies) // Some platforms do not have CPU die support, for example s390
> >>        TEST_ASSERT_VAL("#num_dies >= #num_packages", num_dies >= num_packages);
> >> 
> >> +#if defined(__i386__) && defined(__x86_64__)
> >>    TEST_ASSERT_VAL("#system_tsc_freq", expr__parse(&val, ctx, "#system_tsc_freq") == 0);
> >> -    if (is_intel)
> >> +    if (strstr(cpuid, "Intel") != NULL)
> >>        TEST_ASSERT_VAL("#system_tsc_freq > 0", val > 0);
> >>    else
> >>        TEST_ASSERT_VAL("#system_tsc_freq == 0", fpclassify(val) == FP_ZERO);
> >> +#endif
> >> 
> >>    /*
> >>     * Source count returns the number of events aggregating in a leader
> > 
> > I confirmed the change above fixes the failure on Arm64.
> > 
> > Tested-by: Leo Yan <leo.yan@arm.com>
> Thanks Leo Yan for testing.
> 
> Hi Ian,
> 
> If the change above looks good, I will post a V2 . Please share your review comments

Sorry for the delay, it looks good to me.  Can you please send the v2?

Thanks,
Namhyung


