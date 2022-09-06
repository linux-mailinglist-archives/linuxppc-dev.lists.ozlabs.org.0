Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8865AE812
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 14:27:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMPmN11WRz3bxC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 22:27:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o0FOon/0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o0FOon/0;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMPll3SQKz2xHM
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Sep 2022 22:27:15 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 73F396150B;
	Tue,  6 Sep 2022 12:27:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACB90C433D6;
	Tue,  6 Sep 2022 12:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662467230;
	bh=ROd6gADFJ3cfF/PWA6JaxGXAfhNHmr3DVsYT1UhA9Uc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o0FOon/0ilITbYQDLBQOk3fCwYw2o3M4ivW8tzeoQI3sS57RJoSaaa8y8r3/1ldxk
	 XXpPvsamz5GA+/c3i635FuaQ69QQGU9BxL5n4HRzr4WyEWYwJ5cHmIAdAZ2x4fJ2Mk
	 9ObkEC/r/5dz/7ilZ0Av4kD17wVNldTPN961IrUqNjrn/0HLdv6/9x1EVHi4kggUFX
	 lFsZFzkXwiKCMkP8LbiQBsSMfTgK/E2BuHpUc0MuGRsDAJC6RNMwobAfyzncmqtXfo
	 ALmTE4Hdv6o9V8r1eE88CSv/qAkHoqltLiTZykr2769c9DcEgKm69G91Ihxyu4feir
	 4GzdJNox39+Pg==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 72FDB404A1; Tue,  6 Sep 2022 09:27:08 -0300 (-03)
Date: Tue, 6 Sep 2022 09:27:08 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V2 1/2] tools/perf: Fix out of bound access to affinity
 "sched_cpus"
Message-ID: <Yxc8nFLFsiOD/hHu@kernel.org>
References: <20220905141929.7171-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220905141929.7171-1-atrajeev@linux.vnet.ibm.com>
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
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com, linux-perf-users@vger.kernel.org, jolsa@kernel.org, kjain@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Mon, Sep 05, 2022 at 07:49:28PM +0530, Athira Rajeev escreveu:
> The affinity code in "affinity_set" function access array
> named "sched_cpus". The size for this array is allocated in
> affinity_setup function which is nothing but value from
> get_cpu_set_size. This is used to contain the cpumask value
> for each cpu. While setting bit for each cpu, it calls
> "set_bit" function which access index in sched_cpus array.
> If we provide a command-line option to -C which is more than
> the number of CPU's present in the system, the set_bit could
> access an array member which is out-of the array size. This
> is because currently, there is no boundary check for the CPU.
> This will result in seg fault:


Thanks, tested, reproduced the problem before, and the fix after,
applied.

- Arnaldo

 
> <<>>
>  ./perf stat -C 12323431 ls
> Perf can support 2048 CPUs. Consider raising MAX_NR_CPUS
> Segmentation fault (core dumped)
> <<>>
> 
> Fix this by adding boundary check for the array.
> 
> After the fix from powerpc system:
> 
> <<>>
> ./perf stat -C 12323431 ls 1>out
> Perf can support 2048 CPUs. Consider raising MAX_NR_CPUS
> 
>  Performance counter stats for 'CPU(s) 12323431':
> 
>    <not supported> msec cpu-clock
>    <not supported>      context-switches
>    <not supported>      cpu-migrations
>    <not supported>      page-faults
>    <not supported>      cycles
>    <not supported>      instructions
>    <not supported>      branches
>    <not supported>      branch-misses
> 
>        0.001192373 seconds time elapsed
> <<>>
> 
> Reported-by: Nageswara Sastry <rnsastry@linux.ibm.com>
> Tested-by: Nageswara Sastry <rnsastry@linux.ibm.com>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
> Changelog:
>  From v1 -> v2:
>  Addressed review comment from Jiri Olsa by changing condition
>  check to directly use "cpu_set_size * 8" for comparing with the
>  cpu number.
> 
>  tools/perf/util/affinity.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/affinity.c b/tools/perf/util/affinity.c
> index 4d216c0dc425..4ee96b3c755b 100644
> --- a/tools/perf/util/affinity.c
> +++ b/tools/perf/util/affinity.c
> @@ -49,8 +49,14 @@ void affinity__set(struct affinity *a, int cpu)
>  {
>  	int cpu_set_size = get_cpu_set_size();
>  
> -	if (cpu == -1)
> +	/*
> +	 * Return:
> +	 * - if cpu is -1
> +	 * - restrict out of bound access to sched_cpus
> +	 */
> +	if (cpu == -1 || ((cpu >= (cpu_set_size * 8))))
>  		return;
> +
>  	a->changed = true;
>  	set_bit(cpu, a->sched_cpus);
>  	/*
> -- 
> 2.35.1

-- 

- Arnaldo
