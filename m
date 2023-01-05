Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFAC65EB28
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jan 2023 13:55:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nnmfh1KQYz3c8m
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jan 2023 23:55:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E3Q2KRda;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E3Q2KRda;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nnmdk6RWQz2xvL
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Jan 2023 23:54:50 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1A36AB81AD3;
	Thu,  5 Jan 2023 12:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85527C433D2;
	Thu,  5 Jan 2023 12:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672923285;
	bh=8H1A64Xa4pXy/g+QvOfg6Jt5CrBUyVrj5r5XtaZWq4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E3Q2KRdaYV5Skte161CTa8brQV9jSWwS5P5Dx0oe7CRTMO9ZeGpNaUz884Qwi+xmh
	 MehLjbJGrchlcxVnwPRLF2xu1DZG6TI7CfqKYklCVCtok3GYkih0uShDk3ap5Rxfu0
	 U69VUMB79XgA7DL5O3otCmxmea+L/8PXr+6Bs2+zp5Hdr7weuRZpf3sYghRKHJwMo3
	 y8qOeNMLeI/WNLZRmUr6MwBezsh5JWrgrsusAuhZ7qNElTSq8d3qhdK5ii7+KXGe1w
	 QciwyyyhAK0uWe+2xiS6njXaTCnQeCcuGXT1B2CI1ah8jLl9MvtpIrxqyh1g7TeajW
	 uIIvI8IOb+Usw==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 07F4640468; Thu,  5 Jan 2023 09:54:43 -0300 (-03)
Date: Thu, 5 Jan 2023 09:54:43 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/2] perf test bpf: Skip test if kernel-debuginfo is not
 present
Message-ID: <Y7bIk77mdE4j8Jyi@kernel.org>
References: <20230105121742.92249-1-atrajeev@linux.vnet.ibm.com>
 <20230105121742.92249-2-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230105121742.92249-2-atrajeev@linux.vnet.ibm.com>
X-Url: http://acmel.wordpress.com
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
Cc: irogers@google.com, ak@linux.intel.com, rnsastry@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.vnet.ibm.com, james.clark@arm.com, jolsa@kernel.org, kjain@linux.ibm.com, namhyung@kernel.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Thu, Jan 05, 2023 at 05:47:42PM +0530, Athira Rajeev escreveu:
> Perf BPF filter test fails in environment where "kernel-debuginfo"
> is not installed.

I'll apply this to perf/core, for the next merge window, as its more an
improvement than a fix, i.e. we know why it fails, we're just improving
the user reporting to make that clear at first sight.

- Arnaldo
 
> Test failure logs:
> <<>>
> 42: BPF filter                            :
> 42.1: Basic BPF filtering                 : Ok
> 42.2: BPF pinning                         : Ok
> 42.3: BPF prologue generation             : FAILED!
> <<>>
> 
> Enabling verbose option provided debug logs, which says debuginfo
> needs to be installed. Snippet of verbose logs:
> 
> <<>>
> 42.3: BPF prologue generation                                       :
> --- start ---
> test child forked, pid 28218
> <<>>
> Rebuild with CONFIG_DEBUG_INFO=y, or install an appropriate debuginfo
> package.
> bpf_probe: failed to convert perf probe events
> Failed to add events selected by BPF
> test child finished with -1
> ---- end ----
> BPF filter subtest 3: FAILED!
> <<>>
> 
> Here subtest, "BPF prologue generation" failed and
> logs shows debuginfo is needed. After installing
> kernel-debuginfo package, testcase passes.
> 
> Subtest "BPF prologue generation" failed because, the "do_test"
> function returns "TEST_FAIL" without checking the error type
> returned by "parse_events_load_bpf_obj" function.
> Function parse_events_load_bpf_obj can also return error of type
> "-ENODATA" incase kernel-debuginfo package is not installed. Fix this
> by adding check for -ENODATA error.
> 
> Test result after the patch changes:
> 
> Test failure logs:
> <<>>
> 42: BPF filter                 :
> 42.1: Basic BPF filtering      : Ok
> 42.2: BPF pinning              : Ok
> 42.3: BPF prologue generation  : Skip (clang/debuginfo isn't
> installed or environment missing BPF support)
> 
> Fixes: ba1fae431e74 ("perf test: Add 'perf test BPF'")
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
> Note: This is dependent on patch 1:
>  tools/perf: Update the exit error codes in function
>  try_to_find_probe_trace_event
> 
>  tools/perf/tests/bpf.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/tests/bpf.c b/tools/perf/tests/bpf.c
> index 17c023823713..6a4235a9cf57 100644
> --- a/tools/perf/tests/bpf.c
> +++ b/tools/perf/tests/bpf.c
> @@ -126,6 +126,10 @@ static int do_test(struct bpf_object *obj, int (*func)(void),
>  
>  	err = parse_events_load_bpf_obj(&parse_state, &parse_state.list, obj, NULL);
>  	parse_events_error__exit(&parse_error);
> +	if (err == -ENODATA) {
> +		pr_debug("Failed to add events selected by BPF, debuginfo package not installed\n");
> +		return TEST_SKIP;
> +	}
>  	if (err || list_empty(&parse_state.list)) {
>  		pr_debug("Failed to add events selected by BPF\n");
>  		return TEST_FAIL;
> @@ -368,7 +372,7 @@ static struct test_case bpf_tests[] = {
>  			"clang isn't installed or environment missing BPF support"),
>  #ifdef HAVE_BPF_PROLOGUE
>  	TEST_CASE_REASON("BPF prologue generation", bpf_prologue_test,
> -			"clang isn't installed or environment missing BPF support"),
> +			"clang/debuginfo isn't installed or environment missing BPF support"),
>  #else
>  	TEST_CASE_REASON("BPF prologue generation", bpf_prologue_test, "not compiled in"),
>  #endif
> -- 
> 2.31.1

-- 

- Arnaldo
