Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F1F766FE5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 16:55:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qAbPllgi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RC9fH0HQqz3cRX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jul 2023 00:55:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qAbPllgi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RC9dQ1Kfnz2yDc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jul 2023 00:54:18 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 26B0B62175;
	Fri, 28 Jul 2023 14:54:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C5C3C433C7;
	Fri, 28 Jul 2023 14:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690556054;
	bh=R9op8pPpmsKkCoqmTa7kyILBaKx3qjkB+WKspxSkx40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qAbPllgiag0JHhACI1BZnqart2OdDDXqYcHTpHOQj3SCt1iDM8OLCW0nwB1ETdBkY
	 mW4lutGWRjORuLx3M+L1to6wA7cZb3hFtA8P3imJIxuxoiYWD1EKhT9aKv43fuSIPK
	 o9EHbV6ZlTb5PfxS9hKxjTB5Tzqy9t7zMjtSix6d0bypSRygrmgCb1pGt3eCvpIrDV
	 4mSJqVgH8fsBaSrjPG6aqCpFdZOLzyoEOjF2zu7I0Wa76+MEzXXRwfesGoRfvDcbUt
	 DprSrK41ByXxrMZIP8f4v9PEshuQMvVePtiXGcjhsOxTZNPwiBfUjh9N8pS5ibdM78
	 B8Dx0laG5GL4Q==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id BBCF640096; Fri, 28 Jul 2023 11:54:11 -0300 (-03)
Date: Fri, 28 Jul 2023 11:54:11 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Aditya Gupta <adityag@linux.ibm.com>
Subject: Re: [PATCH 1/1] perf tests task_analyzer: Check perf build options
 for libtraceevent support
Message-ID: <ZMPWk5K63tadmDlU@kernel.org>
References: <20230725061649.34937-1-adityag@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725061649.34937-1-adityag@linux.ibm.com>
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
Cc: irogers@google.com, maddy@linux.ibm.com, kjain@linux.ibm.com, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, atrajeev@linux.vnet.ibm.com, jolsa@kernel.org, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Tue, Jul 25, 2023 at 11:46:49AM +0530, Aditya Gupta escreveu:
> Currently we depend on output of 'perf record -e "sched:sched_switch"', to
> check whether perf was built with libtraceevent support.
> 
> Instead, a more straightforward approach can be to check the build options,
> using 'perf version --build-options', to check for libtraceevent support.
> 
> When perf is compiled WITHOUT libtraceevent ('make NO_LIBTRACEEVENT=1'),
> 'perf version --build-options' outputs (output trimmed):
> 
> 	 ...
>          libtraceevent: [ OFF ]  # HAVE_LIBTRACEEVENT
> 	 ...
> 
> While, when perf is compiled WITH libtraceevent,
> 
> 'perf version --build-options' outputs:
> 
> ...
>          libtraceevent: [ on ]  # HAVE_LIBTRACEEVENT
> 	 ...
> 
> Suggested-by: Ian Rogers <irogers@google.com>
> Signed-off-by: Aditya Gupta <adityag@linux.ibm.com>
> ---
> 
>  tools/perf/tests/shell/test_task_analyzer.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/perf/tests/shell/test_task_analyzer.sh b/tools/perf/tests/shell/test_task_analyzer.sh
> index 0095abbe20ca..a28d784987b4 100755
> --- a/tools/perf/tests/shell/test_task_analyzer.sh
> +++ b/tools/perf/tests/shell/test_task_analyzer.sh
> @@ -52,7 +52,7 @@ find_str_or_fail() {
>  
>  # check if perf is compiled with libtraceevent support
>  skip_no_probe_record_support() {
> -	perf record -e "sched:sched_switch" -a -- sleep 1 2>&1 | grep "libtraceevent is necessary for tracepoint support" && return 2
> +	perf version --build-options | grep HAVE_LIBTRACEEVENT | grep -q OFF && return 2
>  	return 0

I'll apply this, but please consider adding a:

	perf build --has libtraceevent

subcommand to have that query made more compact and to avoid the two
extra grep.

BTW, I'll change that to:

[acme@quaco perf-tools-next]$ perf version --build-options | grep " on .* HAVE_LIBTRACEEVENT"
         libtraceevent: [ on  ]  # HAVE_LIBTRACEEVENT
[acme@quaco perf-tools-next]$

replacing "on" with OFF, so that we have just one grep.

Thanks,

- Arnaldo

>  }
>  
> -- 
> 2.41.0
> 

-- 

- Arnaldo
