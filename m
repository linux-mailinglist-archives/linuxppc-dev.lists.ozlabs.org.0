Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6154B7CEEB2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 06:39:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JC0wjKhx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9w3c2J5Tz3dfr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 15:39:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JC0wjKhx;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9w2n2D4zz2y1Y
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 15:38:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1697690320;
	bh=Rv0RE/UnlB8ImLuckgrocUTCXXYAwShhb75jdX29cjc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JC0wjKhxL2KrO9rfTQylV0wrN1YQQTse08jfgDBNxbyiJkS4q1SvRMJIWc9XG81gy
	 LcHjOsq5IYrWqiuG48TdYsX0dhkH1VpWMq1uHO5zxGpWlmKIE+tMdgcKSZpW1s1Y27
	 9Gaas4gEdVokMsT90w7cSvRiQB4Wa1Yl12Myy6rlAycLx5YPkbTjG7xtcwMZx2inmA
	 BlnmzP8TYW7X+Kg6wbXhogcS33ZvEpxWSp29K7T6Swpv2E+Eiq8buPG+rNlg/ta9Xg
	 mOTTQKQIjXqG3MtyRMTa3b1hPWklNMPmud9M2pWbfd6LpRf9lvgCsZwZkAcWdjziyZ
	 AgTu/xGIiB7ug==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4S9w2m3N7Wz4xZS;
	Thu, 19 Oct 2023 15:38:40 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 2/6] powerpc/smp: Enable Asym packing for cores on
 shared processor
In-Reply-To: <20231018163751.2423181-3-srikar@linux.vnet.ibm.com>
References: <20231018163751.2423181-1-srikar@linux.vnet.ibm.com>
 <20231018163751.2423181-3-srikar@linux.vnet.ibm.com>
Date: Thu, 19 Oct 2023 15:38:40 +1100
Message-ID: <87v8b35ir3.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Mark Rutland <mark.rutland@arm.com>, Valentin Schneider <vschneid@redhat.com>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, Rohan McLure <rmclure@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> If there are shared processor LPARs, underlying Hypervisor can have more
> virtual cores to handle than actual physical cores.
>
> Starting with Power 9, a core has 2 nearly independent thread groups.

You need to be clearer here that you're talking about "big cores", not
SMT4 cores as seen on bare metal systems.

> On a shared processors LPARs, it helps to pack threads to lesser number
> of cores so that the overall system performance and utilization
> improves. PowerVM schedules at a core level. Hence packing to fewer
> cores helps.
>
> For example: Lets says there are two 8-core Shared LPARs that are
> actually sharing a 8 Core shared physical pool, each running 8 threads
> each. Then Consolidating 8 threads to 4 cores on each LPAR would help
> them to perform better. This is because each of the LPAR will get
> 100% time to run applications and there will no switching required by
> the Hypervisor.
>
> To achieve this, enable SD_ASYM_PACKING flag at CACHE, MC and DIE level.

.. when the system is running in shared processor mode and has big cores.

cheers

> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 37c41297c9ce..498c2d51fc20 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1009,9 +1009,20 @@ static int powerpc_smt_flags(void)
>   */
>  static int powerpc_shared_cache_flags(void)
>  {
> +	if (static_branch_unlikely(&powerpc_asym_packing))
> +		return SD_SHARE_PKG_RESOURCES | SD_ASYM_PACKING;
> +
>  	return SD_SHARE_PKG_RESOURCES;
>  }
>  
> +static int powerpc_shared_proc_flags(void)
> +{
> +	if (static_branch_unlikely(&powerpc_asym_packing))
> +		return SD_ASYM_PACKING;
> +
> +	return 0;
> +}
> +
>  /*
>   * We can't just pass cpu_l2_cache_mask() directly because
>   * returns a non-const pointer and the compiler barfs on that.
> @@ -1048,8 +1059,8 @@ static struct sched_domain_topology_level powerpc_topology[] = {
>  	{ cpu_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT) },
>  #endif
>  	{ shared_cache_mask, powerpc_shared_cache_flags, SD_INIT_NAME(CACHE) },
> -	{ cpu_mc_mask, SD_INIT_NAME(MC) },
> -	{ cpu_cpu_mask, SD_INIT_NAME(DIE) },
> +	{ cpu_mc_mask, powerpc_shared_proc_flags, SD_INIT_NAME(MC) },
> +	{ cpu_cpu_mask, powerpc_shared_proc_flags, SD_INIT_NAME(DIE) },
>  	{ NULL, },
>  };
>  
> @@ -1687,6 +1698,8 @@ static void __init fixup_topology(void)
>  	if (cpu_has_feature(CPU_FTR_ASYM_SMT)) {
>  		pr_info_once("Enabling Asymmetric SMT scheduling\n");
>  		static_branch_enable(&powerpc_asym_packing);
> +	} else if (is_shared_processor() && has_big_cores) {
> +		static_branch_enable(&powerpc_asym_packing);
>  	}
>  
>  #ifdef CONFIG_SCHED_SMT
> -- 
> 2.31.1
