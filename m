Return-Path: <linuxppc-dev+bounces-6521-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50249A47063
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2025 01:38:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z3CBX28Y1z30Vw;
	Thu, 27 Feb 2025 11:38:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740616724;
	cv=none; b=kwS/6QyfLaI8dYJENdbBjxIfG8K12OtYCTLcSDibmAp2oDIZ9O9S4F77bTuO/NeFNLfqeo0hbXQ7dmr7cqYQi0LYAH6+4Ivp6JWK+w0Kt9vkojFVTvNiOa1xXHHTz/cluqRsS1Y/xy2hxJECBuZCbcjvBPI79PSqJQC5xCb2tfjUAIC7nGv64wwIxGbRLnGqNtl75ffHVhiBvrFZwEjIwGYNEtUGgyLy20G31RMRaX5Qlc72N4hd1p9dyK5r5HSnpuNrNCo7yK0lUX+M2DI4rFqGS+TPYd9a+aZ8XcNDdiLpE3u3BTRFnn+1SFiqruZSNEwadMYqKEwIT0BDMKCHsA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740616724; c=relaxed/relaxed;
	bh=U/2o78TJ4aosE71pMT8aPdkiGJw0OmLpNcGdfntm9wY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WE0nQBZg9PSEHPUKpct8MohZf3bKr+mBsC9jZXS/BnB9xX7BJef5j4n0ruh4g4FxqK6GadHoc8IFSn2M64Qm5MT5uEOcypHNYobH+h0QMUmzNoxaIwiqTuUKeCS63fPWwrUQPcdIlEjXUYxXrad3Nw66johrxDAnpe0Nay8wpYqZ5a1X/hdscN27CIBpxnXyaJ6ZP9z0zvF0zkDIIP7CYq6EOgTSCDSd2nyLGBty53B8PDkSdcyZ4J2u/SCx+sWB2L/l0ysarfqxTKxmk7IamPMw6zP/11bbeHTRB2BZpCy3legPJ9dne5tV+ZIZmYdxhidZ8aCHHS0J2flvzQGttg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P1cnCKTh; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P1cnCKTh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z3CBW2xM8z3028
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2025 11:38:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 59303612D4;
	Thu, 27 Feb 2025 00:38:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D0C8C4CEEC;
	Thu, 27 Feb 2025 00:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740616720;
	bh=pH+Tus83erUr+DDFNhkjgnullp4lB8TbGlhmy3hKBVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P1cnCKThxchj7yhzswvyKGZkpy4HNrdzezSEwQQuWH6FX377VszAlVHMLiDeKYHtQ
	 tFiAxFZuNRqg5tBvkXXkqGl9vUGEPvgB9n49A5MSbECN25EDI5krLzZ5fTsDAc/6pA
	 TRvl2gHASGv3Tg7/kdD3hzGjOWo0wKMv7rUiDRn35JUpJFoLhQ9kySpIY9w69KhyN+
	 JDw4hfKGOs6FwDbIXX+J7pzCKy/YqMFdOOrVzQZSOUkZJqcmVyCS+VqC8LVlonE6b7
	 fPFAjkke7fAnQAz3MPbHAvqKByuwNVXA31mR1eUdwW94afYJ2tZY3kpS+t/r7MYlQz
	 d8z06fOnwWjOQ==
Date: Wed, 26 Feb 2025 16:38:38 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Athira Rajeev <atrajeev@linux.ibm.com>
Cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
	irogers@google.com, linux-perf-users@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
	kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com,
	hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
	Tejas.Manhas1@ibm.com
Subject: Re: [PATCH] tools/perf: Use perf_tool__init() to initialize default
 values in builtin trace
Message-ID: <Z7-0DuisrMHyscDj@google.com>
References: <20250225113157.28836-1-atrajeev@linux.ibm.com>
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
In-Reply-To: <20250225113157.28836-1-atrajeev@linux.ibm.com>
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Feb 25, 2025 at 05:01:57PM +0530, Athira Rajeev wrote:
> Perf trace on perf.data fails as below:
> 
> 	./perf trace record -- sleep 1
> 	./perf trace -i perf.data
> 	perf: Segmentation fault
> 	Segmentation fault (core dumped)
> 
> Backtrace pointed to :
> 	?? ()
> 	perf_session.process_user_event ()
> 	reader.read_event ()
> 	perf_session.process_events ()
> 	cmd_trace ()
> 	run_builtin ()
> 	handle_internal_command ()
> 	main ()
> 
> Further debug pointed that, segmentation fault happens when
> trying to access id_index. Code snippet:
> 
> 	case PERF_RECORD_ID_INDEX:
> 		err = tool->id_index(session, event);
> 
> Since 'commit 15d4a6f41d72 ("perf tool: Remove
> perf_tool__fill_defaults()")', perf_tool__fill_defaults is
> removed. All tools are initialized using perf_tool__init()
> prior to use. But in builtin-trace, perf_tool__init is not
> used and hence the defaults are not initialized. Use
> perf_tool__init() in perf trace to handle the initialization.

Thanks for fixing this.  I can reproduce the problem and confirmed this
patch fixed it.

Thanks,
Namhyung

> 
> Reported-by: Tejas Manhas <Tejas.Manhas1@ibm.com>
> Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
> ---
>  tools/perf/builtin-trace.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/perf/builtin-trace.c b/tools/perf/builtin-trace.c
> index f55a8a6481f2..092c5f6404ba 100644
> --- a/tools/perf/builtin-trace.c
> +++ b/tools/perf/builtin-trace.c
> @@ -4589,6 +4589,7 @@ static int trace__replay(struct trace *trace)
>  	struct evsel *evsel;
>  	int err = -1;
>  
> +	perf_tool__init(&trace->tool, /*ordered_events=*/true);
>  	trace->tool.sample	  = trace__process_sample;
>  	trace->tool.mmap	  = perf_event__process_mmap;
>  	trace->tool.mmap2	  = perf_event__process_mmap2;
> -- 
> 2.43.5
> 

