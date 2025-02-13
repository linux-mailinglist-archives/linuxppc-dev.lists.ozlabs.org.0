Return-Path: <linuxppc-dev+bounces-6142-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AD6A3361B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2025 04:35:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YtgmK31GSz2xbS;
	Thu, 13 Feb 2025 14:34:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739417697;
	cv=none; b=de8X4J+ZjOtB2Va+vuoGyEQSf3R5fgDNP1wmXHDOB4lvLuTIIZUm7lNkaAOIkIpiPjtVxvxQNX2WOVBYZd3vx089Zv5jqtigatAWWM9HPv3WjG9+UPqY8ckE0zd9lv+8PFC+vHNj4/mqeyAmTDOsYbfpKb2X6M5M9BC2s7679O7RWOWfKm9Dsh8DhtSVknErCJTT81/VVfUcbXNZ++SqbsKaVgSkgVMAHhOkbMG/FezAMe2VvsgvfFNbqJhmtyD7A4HATS5AWI39TF5yS/Vd5ug4EMRq0TDcHyTCKl1pJTWQzsZsgHYOgt3eZkGoln98qZvEHCFnV3RRMie1nL9FEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739417697; c=relaxed/relaxed;
	bh=YYVVaH1KoS9i/xFqdf5VJZELfzu9qDSeiroHMd7k830=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZoZrnrN620JZnOUVdd30WNS77mfGF23ZZDNF0L6RQ6YlAI6Os5UcRN7NVW2XH9MX1cawAlcwvui5szONR9ebteYS2fdW3nl2S021PVoRhtPGU2/mcpFunI+bbNOlUGQV3XK/YHBKQ4VxyXb0iiOpXdziO/9SMYrU/iEWXRN3/t5zh3+Rh7ZaHVAuFAoxgawpYm/NJJFUVuQP3OKCrBbB9E7hBjTrvBF9d8UJfnI/XmIYnL/6cagwoEY1+BipUGKZ6lUIg7Llcfvdy+97Qr7IGzOBj3VC20aYTc8qSeHTlyLZfGorfJa70DlWhae7mma3SoqwMXrZfnr80fRmxEFPIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rmCF82ki; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rmCF82ki;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YtgmJ2rSRz2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2025 14:34:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B9A2F5C2C6F;
	Thu, 13 Feb 2025 03:34:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 747BCC4CED1;
	Thu, 13 Feb 2025 03:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739417692;
	bh=Aayi0JKLnbqq30nO8hz+ejLA0s7Jkjsteezm9FkASsI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rmCF82kiyDAJQCZ9hvSmbNxWvZRbCrrpBXeE/VuA92anLO11mNC5jODnvsJaVG4gA
	 6gJzRE8U71jBhB77BdpVX3TdUtkoPSInt2PeFYFgcYiV/4ybvUbLLXdB+ou3vFqlew
	 7uzDaN5bGWmHJN1z+S8ZIEF3UxDHVLRZW7lNBfLZbCrPvV1S0AxZYDdW/8uooGcg6X
	 T13+ro4QG5rkJSw89UTc4+DxIKF0nAOCY6NGomy4lG8bsiJuVolHnoimhgKJCtTi/n
	 a9K2DLbR0EqGuVJafVURS/1m+Pv4n8CY+Vg9GkfULrXsHz6uA87RaOq7JdGQtYsSX5
	 SgCQ3Mu77+c8w==
Date: Wed, 12 Feb 2025 19:34:50 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
	irogers@google.com, linux-perf-users@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
	kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com,
	hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com
Subject: Re: [PATCH] tools/perf: Add check to tool pmu tests to ensure if the
 event is valid
Message-ID: <Z61oWlOoyF0BKwYV@google.com>
References: <20250212185438.15251-1-atrajeev@linux.vnet.ibm.com>
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
In-Reply-To: <20250212185438.15251-1-atrajeev@linux.vnet.ibm.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Feb 13, 2025 at 12:24:38AM +0530, Athira Rajeev wrote:
> "Tool PMU" tests fails on powerpc as below:
> 
>    12.1: Parsing without PMU name:
>    --- start ---
>    test child forked, pid 48492
>    Using CPUID 0x00800200
>    Attempt to add: tool/duration_time/
>    ..after resolving event: tool/config=0x1/
>    duration_time -> tool/duration_time/
>    Attempt to add: tool/user_time/
>    ..after resolving event: tool/config=0x2/
>    user_time -> tool/user_time/
>    Attempt to add: tool/system_time/
>    ..after resolving event: tool/config=0x3/
>    system_time -> tool/system_time/
>    Attempt to add: tool/has_pmem/
>    ..after resolving event: tool/config=0x4/
>    has_pmem -> tool/has_pmem/
>    Attempt to add: tool/num_cores/
>    ..after resolving event: tool/config=0x5/
>    num_cores -> tool/num_cores/
>    Attempt to add: tool/num_cpus/
>    ..after resolving event: tool/config=0x6/
>    num_cpus -> tool/num_cpus/
>    Attempt to add: tool/num_cpus_online/
>    ..after resolving event: tool/config=0x7/
>    num_cpus_online -> tool/num_cpus_online/
>    Attempt to add: tool/num_dies/
>    ..after resolving event: tool/config=0x8/
>    num_dies -> tool/num_dies/
>    Attempt to add: tool/num_packages/
>    ..after resolving event: tool/config=0x9/
>    num_packages -> tool/num_packages/
> 
>    ---- unexpected signal (11) ----
>    12.1: Parsing without PMU name                                      : FAILED!
> 
> Same fail is observed for "Parsing with PMU name" as well.
> 
> The testcase loops through events in tool_pmu__for_each_event()
> and access event name using "tool_pmu__event_to_str()".
> Here tool_pmu__event_to_str returns null for "slots" event
> and "system_tsc_freq" event. These two events are only applicable
> for arm64 and x86 respectively. So the function tool_pmu__event_to_str()
> skips for unsupported events and returns null. This null value is
> causing testcase fail.
> 
> To address this in "Tool PMU" testcase, add a helper function
> tool_pmu__all_event_to_str() which returns the name for all
> events mapping to the tool_pmu_event index including the
> skipped ones. So that even if its a skipped event, the
> helper function helps to resolve the tool_pmu_event index to
> its mapping event name. Update the testcase to check for null event
> names before proceeding the test.
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Please take a look at:
https://lore.kernel.org/r/20250212163859.1489916-1-james.clark@linaro.org

Thanks,
Namhyung

> ---
>  tools/perf/tests/tool_pmu.c | 12 ++++++++++++
>  tools/perf/util/tool_pmu.c  | 17 +++++++++++++++++
>  tools/perf/util/tool_pmu.h  |  1 +
>  3 files changed, 30 insertions(+)
> 
> diff --git a/tools/perf/tests/tool_pmu.c b/tools/perf/tests/tool_pmu.c
> index 187942b749b7..e468e5fb3c73 100644
> --- a/tools/perf/tests/tool_pmu.c
> +++ b/tools/perf/tests/tool_pmu.c
> @@ -19,6 +19,18 @@ static int do_test(enum tool_pmu_event ev, bool with_pmu)
>  		return TEST_FAIL;
>  	}
>  
> +	/*
> +	 * if tool_pmu__event_to_str returns NULL, Check if the event is
> +	 * valid for the platform.
> +	 * Example:
> +	 * slots event is only on arm64.
> +	 * system_tsc_freq event is only on x86.
> +	 */
> +	if (!tool_pmu__event_to_str(ev) && tool_pmu__skip_event(tool_pmu__all_event_to_str(ev))) {
> +		ret = TEST_OK;
> +		goto out;
> +	}
> +
>  	if (with_pmu)
>  		snprintf(str, sizeof(str), "tool/%s/", tool_pmu__event_to_str(ev));
>  	else
> diff --git a/tools/perf/util/tool_pmu.c b/tools/perf/util/tool_pmu.c
> index 3a68debe7143..572422797f6e 100644
> --- a/tools/perf/util/tool_pmu.c
> +++ b/tools/perf/util/tool_pmu.c
> @@ -60,6 +60,15 @@ int tool_pmu__num_skip_events(void)
>  	return num;
>  }
>  
> +/*
> + * tool_pmu__event_to_str returns only supported event names.
> + * For events which are supposed to be skipped in the platform,
> + * return NULL
> + *
> + * tool_pmu__all_event_to_str returns the name for all
> + * events mapping to the tool_pmu_event index including the
> + * skipped ones.
> + */
>  const char *tool_pmu__event_to_str(enum tool_pmu_event ev)
>  {
>  	if ((ev > TOOL_PMU__EVENT_NONE && ev < TOOL_PMU__EVENT_MAX) &&
> @@ -69,6 +78,14 @@ const char *tool_pmu__event_to_str(enum tool_pmu_event ev)
>  	return NULL;
>  }
>  
> +const char *tool_pmu__all_event_to_str(enum tool_pmu_event ev)
> +{
> +	if (ev > TOOL_PMU__EVENT_NONE && ev < TOOL_PMU__EVENT_MAX)
> +		return tool_pmu__event_names[ev];
> +
> +	return NULL;
> +}
> +
>  enum tool_pmu_event tool_pmu__str_to_event(const char *str)
>  {
>  	int i;
> diff --git a/tools/perf/util/tool_pmu.h b/tools/perf/util/tool_pmu.h
> index a60184859080..da76808ae71e 100644
> --- a/tools/perf/util/tool_pmu.h
> +++ b/tools/perf/util/tool_pmu.h
> @@ -30,6 +30,7 @@ enum tool_pmu_event {
>  	for ((ev) = TOOL_PMU__EVENT_DURATION_TIME; (ev) < TOOL_PMU__EVENT_MAX; ev++)
>  
>  const char *tool_pmu__event_to_str(enum tool_pmu_event ev);
> +const char *tool_pmu__all_event_to_str(enum tool_pmu_event ev);
>  enum tool_pmu_event tool_pmu__str_to_event(const char *str);
>  bool tool_pmu__skip_event(const char *name);
>  int tool_pmu__num_skip_events(void);
> -- 
> 2.43.5
> 

