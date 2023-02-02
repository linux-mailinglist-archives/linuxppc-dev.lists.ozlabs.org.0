Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D075687282
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 01:51:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6gFp116Lz3f4T
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 11:51:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KFdM1dcQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KFdM1dcQ;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6gDv5H7Fz3bfT
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Feb 2023 11:50:23 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4A703617B9;
	Thu,  2 Feb 2023 00:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 852EFC433D2;
	Thu,  2 Feb 2023 00:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675299020;
	bh=n4hEtb9EsHvuZXUBIU6Nt1NkOzJbp4LmhhGVAKGL/oM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KFdM1dcQ/s/BfrmN0LW+CyT6wpOEo7UCEfR3Ge9p3Xq45sHXDedOO7yDikfSW9hGw
	 tdKxPhCskYq3k8qKlLH3O47v+MeqRhr4IlpNax6uEAjmlDJMb/bvsG/Ks+02WAyTv7
	 9rL6D3BPDLZJMLHMwC30O+FCy9uDv3zQt3IaKLcpBmx2VcgdyzwMWi8S6bobRlDINb
	 XllOK6hQp/MuO3T9OTZD9oiSeZLHp8t1ideHug7MVTEZ+DhZP9RcdDM7ZDUpwnGyqN
	 fyXsVi+OOkWYJcCgmex4kCom51UmqvxbRDqTZUL79zNPZdOcW2XQqbZXDJf82FZLa2
	 CQlmRDe4X8dgg==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 0868C405BE; Wed,  1 Feb 2023 21:50:18 -0300 (-03)
Date: Wed, 1 Feb 2023 21:50:17 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH] tools/perf: Fix usage of perf probe when libtraceevent
 is missing
Message-ID: <Y9sIyTLHssijIFLT@kernel.org>
References: <20230131134748.54567-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230131134748.54567-1-atrajeev@linux.vnet.ibm.com>
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

Em Tue, Jan 31, 2023 at 07:17:48PM +0530, Athira Rajeev escreveu:
> While parsing the tracepoint events in parse_events_add_tracepoint()
> function, code checks for HAVE_LIBTRACEEVENT support. This is needed
> since libtraceevent is necessary for tracepoint. But while adding
> probe points, check for LIBTRACEEVENT is not done in case of perf probe.
> Hence, in environment with missing libtraceevent-devel, it is
> observed that adding a probe point shows below message though it
> can't be used via perf record.

Thanks, applied.

- Arnaldo

 
> Example:
> Adding probe point:
> 	./perf probe 'vfs_getname=getname_flags:72 pathname=result->name:string'
> 	Added new event:
> 	  probe:vfs_getname    (on getname_flags:72 with pathname=result->name:string)
> 
> 	You can now use it in all perf tools, such as:
> 
> 		perf record -e probe:vfs_getname -aR sleep 1
> 
> But trying perf record:
> 	./perf  record -e probe:vfs_getname -aR sleep 1
> 	event syntax error: 'probe:vfs_getname'
> 				\___ unsupported tracepoint
> 	libtraceevent is necessary for tracepoint support
> 	Run 'perf list' for a list of valid events
> 
> The builtin tool like perf record needs libtraceevent to
> parse tracefs. But still the probe can be used by enabling
> via tracefs. Patch fixes the probe usage message to the user
> based on presence of libtraceevent. With the fix,
> 
>  # ./perf probe 'pmu:myprobe=schedule'
>  Added new event:
>    pmu:myprobe          (on schedule)
> 
>  perf is not linked with libtraceevent, to use the new probe you can use tracefs:
> 
> 	cd /sys/kernel/tracing/
> 	echo 1 > events/pmu/myprobe/enable
> 	echo 1 > tracing_on
> 	cat trace_pipe
> 	Before removing the probe, echo 0 > events/pmu/myprobe/enable
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  tools/perf/builtin-probe.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/tools/perf/builtin-probe.c b/tools/perf/builtin-probe.c
> index ed73d0b89ca2..e72f6cea76f7 100644
> --- a/tools/perf/builtin-probe.c
> +++ b/tools/perf/builtin-probe.c
> @@ -383,9 +383,18 @@ static int perf_add_probe_events(struct perf_probe_event *pevs, int npevs)
>  
>  	/* Note that it is possible to skip all events because of blacklist */
>  	if (event) {
> +#ifndef HAVE_LIBTRACEEVENT
> +		pr_info("\nperf is not linked with libtraceevent, to use the new probe you can use tracefs:\n\n");
> +		pr_info("\tcd /sys/kernel/tracing/\n");
> +		pr_info("\techo 1 > events/%s/%s/enable\n", group, event);
> +		pr_info("\techo 1 > tracing_on\n");
> +		pr_info("\tcat trace_pipe\n");
> +		pr_info("\tBefore removing the probe, echo 0 > events/%s/%s/enable\n", group, event);
> +#else
>  		/* Show how to use the event. */
>  		pr_info("\nYou can now use it in all perf tools, such as:\n\n");
>  		pr_info("\tperf record -e %s:%s -aR sleep 1\n\n", group, event);
> +#endif
>  	}
>  
>  out_cleanup:
> -- 
> 2.39.0
> 

-- 

- Arnaldo
