Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3597856DC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 13:41:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h0NDEmxL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RW46s05DCz3c2t
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 21:41:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h0NDEmxL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RW45y43qzz2ytp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 21:40:38 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BF70060F23;
	Wed, 23 Aug 2023 11:40:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF820C433C7;
	Wed, 23 Aug 2023 11:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692790835;
	bh=XhjUDJiBZc/LK1cO8MyJqrI655Qda8/Ttel6T3Lr93Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h0NDEmxLqzsT/vm3aAFBa0fY2wA2eARy6Z9fGw8PpNuZbVD2xLJnX/8fG4ay+X568
	 I1kPHDqghweYC5cJd68RIxnQOuA1aek8VTsR0B3P8SkEiG0+3MHsklZgM+w8UKF0CH
	 QC/Ar/ZErYT3aWvJSk2RqG4gTZxnBJOO+BbT3ha+x+eNtxVDyKviLWaHNQdRZNOpZi
	 AZ0Nzl8gOJDgK61PlNu1ZLPDN0ctRRJ+zPG2JwAnmtEIPNiz4VRn+0wv3jLMDYaAKc
	 sKcEJfUioLYeN7hfrmrq8M2ehu0uhHgclpmqxm15ff9IV6c2AD5l8D333DbHjH4u8P
	 fsGU1ePn/OLbw==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 9313E40722; Wed, 23 Aug 2023 08:40:32 -0300 (-03)
Date: Wed, 23 Aug 2023 08:40:32 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [PATCH] perf test: Skip perf bench breakpoint run if no
 breakpoints available
Message-ID: <ZOXwMFmc8aMzZgBu@kernel.org>
References: <20230823075103.190565-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230823075103.190565-1-kjain@linux.ibm.com>
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
Cc: irogers@google.com, atrajeev@linux.vnet.ibm.com, Disha Goel <disgoel@linux.vnet.ibm.com>, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, namhyung@kernel.org, naveen.n.rao@linux.vnet.ibm.com, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Wed, Aug 23, 2023 at 01:21:03PM +0530, Kajol Jain escreveu:
> Based on commit 7d54a4acd8c1 ("perf test: Skip watchpoint
> tests if no watchpoints available"), hardware breakpoints
> are not available for power9 platform and because of that
> perf bench breakpoint run fails on power9 platform.
> Add code to check for the return value of perf_event_open()
> in breakpoint run and skip the perf bench breakpoint run,
> if hardware breakpoints are not available.
> 
> Result on power9 system before patch changes:
> [command]# perf bench breakpoint thread
> perf_event_open: No such device
> 
> Result on power9 system after patch changes:
> [command]# ./perf bench breakpoint thread
> Skipping perf bench breakpoint thread: No hardware support
> 
> Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>

Thanks, applied.

- Arnaldo

> ---
>  tools/perf/bench/breakpoint.c | 24 +++++++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/perf/bench/breakpoint.c b/tools/perf/bench/breakpoint.c
> index 41385f89ffc7..dfd18f5db97d 100644
> --- a/tools/perf/bench/breakpoint.c
> +++ b/tools/perf/bench/breakpoint.c
> @@ -47,6 +47,7 @@ struct breakpoint {
>  static int breakpoint_setup(void *addr)
>  {
>  	struct perf_event_attr attr = { .size = 0, };
> +	int fd;
>  
>  	attr.type = PERF_TYPE_BREAKPOINT;
>  	attr.size = sizeof(attr);
> @@ -56,7 +57,12 @@ static int breakpoint_setup(void *addr)
>  	attr.bp_addr = (unsigned long)addr;
>  	attr.bp_type = HW_BREAKPOINT_RW;
>  	attr.bp_len = HW_BREAKPOINT_LEN_1;
> -	return syscall(SYS_perf_event_open, &attr, 0, -1, -1, 0);
> +	fd = syscall(SYS_perf_event_open, &attr, 0, -1, -1, 0);
> +
> +	if (fd < 0)
> +		fd = -errno;
> +
> +	return fd;
>  }
>  
>  static void *passive_thread(void *arg)
> @@ -122,8 +128,14 @@ int bench_breakpoint_thread(int argc, const char **argv)
>  
>  	for (i = 0; i < thread_params.nbreakpoints; i++) {
>  		breakpoints[i].fd = breakpoint_setup(&breakpoints[i].watched);
> -		if (breakpoints[i].fd == -1)
> +
> +		if (breakpoints[i].fd < 0) {
> +			if (breakpoints[i].fd == -ENODEV) {
> +				printf("Skipping perf bench breakpoint thread: No hardware support\n");
> +				return 0;
> +			}
>  			exit((perror("perf_event_open"), EXIT_FAILURE));
> +		}
>  	}
>  	gettimeofday(&start, NULL);
>  	for (i = 0; i < thread_params.nparallel; i++) {
> @@ -196,8 +208,14 @@ int bench_breakpoint_enable(int argc, const char **argv)
>  		exit(EXIT_FAILURE);
>  	}
>  	fd = breakpoint_setup(&watched);
> -	if (fd == -1)
> +
> +	if (fd < 0) {
> +		if (fd == -ENODEV) {
> +			printf("Skipping perf bench breakpoint enable: No hardware support\n");
> +			return 0;
> +		}
>  		exit((perror("perf_event_open"), EXIT_FAILURE));
> +	}
>  	nthreads = enable_params.npassive + enable_params.nactive;
>  	threads = calloc(nthreads, sizeof(threads[0]));
>  	if (!threads)
> -- 
> 2.39.3
> 

-- 

- Arnaldo
