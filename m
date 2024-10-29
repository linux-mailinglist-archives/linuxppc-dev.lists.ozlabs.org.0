Return-Path: <linuxppc-dev+bounces-2693-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2309B581E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2024 01:00:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XdS1D3kKrz2xmk;
	Wed, 30 Oct 2024 11:00:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730246400;
	cv=none; b=Dgj1d6kCGQphE+xr04Q3rTb3L9TnyTA6n1Q/DHOMa8CJALiJMjk7thDdFAHxubvtR2rDeTdVX8YMtDrHc2PjXVt8+h50P5Rv0OUiArvUJkK89oD4PQHiWt16ZxMmzky1fkAo053H6NoBOo2WimudiiYT4gelHIbkjGwAbgEvd5+HuMZ9PhQHcVAxj/NuMr5lFIYQnUDeI2lvaNjTARCAAz0MdR1F26OtDb5fy9a9kMiYgCVXBMGPYP/hWnV51F2ILZTrDep401iA3tNBUrlwGG/z/GDWlkafvRZoOFb/K9/W38gDBnCauJEjwHhQxaRmC5eP5Pr0FA0jfkLE4wBf3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730246400; c=relaxed/relaxed;
	bh=s2ENhSuEqrog1uHDDbEyVVmY22VURV3KOt3jlfpKgU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bw4UmCO6zwpw8y8uci7xeyZK4Nb7f/mevFdAnYBHwu5wCN9LGzKTK7mU9u9msTlX7j75yOG5TwJq0mA9+hPafoJmGf41pSYL5XBPZZWTPHcdG2FgXAczttW1v+pE22cNTXn7Z/lbGmpQ5tljShMdixrIoCmf7hVlDz/otpnmECk0ocaF7JIqo+ZdMOMPacfnsrnMwkOvCJsAS1J6bFY7F8pzQMTebm/cAlXiFps4pqhT50gBwA6n7RPAtciv+bL0spEBrIfaG+XKx0M0lVVljqPM3hQIBVRvABg8c4WGiLtW1IROJksJqWYWy2wsm8m5sgHlPDxO69PUbBodGfB0rw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DQlFkpVL; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DQlFkpVL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XdS1B6njJz2xGQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2024 10:59:58 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7D5B85C5620;
	Tue, 29 Oct 2024 23:59:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2253C4CEE3;
	Tue, 29 Oct 2024 23:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730246395;
	bh=3PGjG05cL0ib9NjJ+m7Zaogil8o/zoAM1qJXs34+Osw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DQlFkpVL86I8W/Qkkhs89NgOwBqRFkbkYxuZ2284KfOH+pIyfrLm7MEyh+tojwlZ5
	 jSkCVNeVDDv4KV6VA0Edpi3esGjjos0qicuIWlhKsQd8hP5PyLCfhREv1LTLRjrAJ9
	 u8KKrCqsOaYSUcm55ifenkmlf17Dvpk9lTXHhNo599Jm/zFfIQcXQtl2AFcAsYKj+N
	 ZdPfQcjg8XUlXDtm8/2McpxeYfSJuM3Dj7uLraIxC9tFFE9Br+ThX7waHLqb65YH3l
	 Ci7d9pJ4yu7Lmb9lYhlUH20vEEWk+DokQsQWVoKtUV2m62HnVhf4IG4LCbhixL7mgZ
	 SO01mdlmm5luw==
Date: Tue, 29 Oct 2024 16:59:53 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, irogers@google.com
Cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
	linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	akanksha@linux.ibm.com, maddy@linux.ibm.com, kjain@linux.ibm.com,
	disgoel@linux.vnet.ibm.com, hbathini@linux.ibm.com
Subject: Re: [PATCH] tools/perf/tests/expr: Make the system_tsc_freq test
 only for intel
Message-ID: <ZyF2-XNUh38p_5Gg@google.com>
References: <20241022140156.98854-1-atrajeev@linux.vnet.ibm.com>
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
In-Reply-To: <20241022140156.98854-1-atrajeev@linux.vnet.ibm.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello,

On Tue, Oct 22, 2024 at 07:31:56PM +0530, Athira Rajeev wrote:
> The "Simple expression parser" test fails on powerpc
> as below:
> 
>  parsing metric: #system_tsc_freq
>  Unrecognized literal '#system_tsc_freq'literal: #system_tsc_freq = nan
>  syntax error
>  FAILED tests/expr.c:247 #system_tsc_freq
>  ---- end(-1) ----
>  7: Simple expression parser  : FAILED!
> 
> In the test, system_tsc_freq is checked as below:
> 
>  if (is_intel)
>     TEST_ASSERT_VAL("#system_tsc_freq > 0", val > 0);
>  else
> 
> But commit 609aa2667f67 ("perf tool_pmu: Switch to standard
> pmu functions and json descriptions")' changed condition in

Probably need to put it as Fixes: tag.


> tool_pmu__skip_event so that system_tsc_freq event should
> only appear on x86
> 
>  +#if !defined(__i386__) && !defined(__x86_64__)
>  +       /* The system_tsc_freq event should only appear on x86. */
>  +       if (strcasecmp(name, "system_tsc_freq") == 0)
>  +               return true;
>  +#endif
> 
> After this commit, the testcase breaks for expr__parse of
> system_tsc_freq in powerpc case. Fix the testcase to have
> complete system_tsc_freq test within "is_intel" check.

Ian, are you ok with this?

Thanks,
Namhyung

> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  tools/perf/tests/expr.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/perf/tests/expr.c b/tools/perf/tests/expr.c
> index e3aa9d4fcf3a..eb3bd68fc4ce 100644
> --- a/tools/perf/tests/expr.c
> +++ b/tools/perf/tests/expr.c
> @@ -244,11 +244,10 @@ static int test__expr(struct test_suite *t __maybe_unused, int subtest __maybe_u
>  	if (num_dies) // Some platforms do not have CPU die support, for example s390
>  		TEST_ASSERT_VAL("#num_dies >= #num_packages", num_dies >= num_packages);
>  
> -	TEST_ASSERT_VAL("#system_tsc_freq", expr__parse(&val, ctx, "#system_tsc_freq") == 0);
> -	if (is_intel)
> +	if (is_intel) {
> +		TEST_ASSERT_VAL("#system_tsc_freq", expr__parse(&val, ctx, "#system_tsc_freq") == 0);
>  		TEST_ASSERT_VAL("#system_tsc_freq > 0", val > 0);
> -	else
> -		TEST_ASSERT_VAL("#system_tsc_freq == 0", fpclassify(val) == FP_ZERO);
> +	}
>  
>  	/*
>  	 * Source count returns the number of events aggregating in a leader
> -- 
> 2.43.5
> 

