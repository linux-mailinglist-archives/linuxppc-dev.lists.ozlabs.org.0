Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E464F221C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Apr 2022 06:42:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KXZk54C0vz2yHt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Apr 2022 14:42:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=k2shsDxs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=k2shsDxs; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KXZjT1NJmz2xfN
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Apr 2022 14:41:33 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 58A1B6143A;
 Tue,  5 Apr 2022 04:41:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7DE2C340EE;
 Tue,  5 Apr 2022 04:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649133690;
 bh=m/uQbitfmj/N/wi3Sh93J6M3WHgc24S78RIat84YU0E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k2shsDxsDVUAghuf1px3v/OitUtJaQ1t0kWhiHifvjPbEqYC26hAA7KWQHCNwAU//
 t8/Ey8eTKmJHSP/dIFbG4K0qOH8mcvY/y5HeOP1QiQTMgabkDu6s/dB2X0c/0B0C1I
 lrMefiHjdlTrLuFlGqLhLMDrQ78k0Dqf8Mvmq6spPwlCbFVsj9fUEmiMWu38eprfT3
 WuVJKXaUpQZEpmLtwyMmVgUO2aqYwKHDyGnpWlOYv1So5Y+5wf/5pX0spxSCrsNaPy
 UtaEdP9sf0BfFaQoLvNTnJoZd6ogGqN06b2V/C//AmThxysMJIcuCqWn/xhS2YcGSB
 pZ0Db+m+DzM6A==
Date: Tue, 5 Apr 2022 07:41:22 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/numa: Handle partially initialized numa nodes
Message-ID: <YkvIclZSeINOfybx@kernel.org>
References: <20220330135123.1868197-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220330135123.1868197-1-srikar@linux.vnet.ibm.com>
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
Cc: Michal Hocko <mhocko@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>, linux-mm@kvack.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 30, 2022 at 07:21:23PM +0530, Srikar Dronamraju wrote:
> With commit 09f49dca570a ("mm: handle uninitialized numa nodes
> gracefully") NODE_DATA for even a memoryless/cpuless node is partially
> initialized at boot time.
> 
> Before onlining the node, current Powerpc code checks for NODE_DATA to
> be NULL. However since NODE_DATA is partially initialized, this check
> will end up always being false.
> 
> This causes hotplugging a CPU to a memoryless/cpuless node to fail.
> 
> Before adding CPUs
> $ numactl -H
> available: 1 nodes (4)
> node 4 cpus: 0 1 2 3 4 5 6 7
> node 4 size: 97372 MB
> node 4 free: 95545 MB
> node distances:
> node   4
> 4:  10
> 
> $ lparstat
> System Configuration
> type=Dedicated mode=Capped smt=8 lcpu=1 mem=99709440 kB cpus=0 ent=1.00
> 
> %user  %sys %wait    %idle    physc %entc lbusy   app  vcsw phint
> ----- ----- -----    -----    ----- ----- ----- ----- ----- -----
> 2.66  2.67  0.16    94.51     0.00  0.00  5.33  0.00 67749     0
> 
> After hotplugging 32 cores
> $ numactl -H
> node 4 cpus: 0 1 2 3 4 5 6 7 120 121 122 123 124 125 126 127 128 129 130
> 131 132 133 134 135 136 137 138 139 140 141 142 143 144 145 146 147 148
> 149 150 151 152 153 154 155 156 157 158 159 160 161 162 163 164 165 166
> 167 168 169 170 171 172 173 174 175
> node 4 size: 97372 MB
> node 4 free: 93636 MB
> node distances:
> node   4
> 4:  10
> 
> $ lparstat
> System Configuration
> type=Dedicated mode=Capped smt=8 lcpu=33 mem=99709440 kB cpus=0 ent=33.00
> 
> %user  %sys %wait    %idle    physc %entc lbusy   app  vcsw phint
> ----- ----- -----    -----    ----- ----- ----- ----- ----- -----
> 0.04  0.02  0.00    99.94     0.00  0.00  0.06  0.00 1128751     3
> 
> As we can see numactl is listing only 8 cores while lparstat is showing
> 33 cores.
> 
> Also dmesg is showing messages like:
> [ 2261.318350 ] BUG: arch topology borken
> [ 2261.318357 ]      the DIE domain not a subset of the NODE domain
> 
> Fixes: 09f49dca570a ("mm: handle uninitialized numa nodes gracefully")
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-mm@kvack.org
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Reported-by: Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>

Acked-by: Mike Rapoport <rppt@linux.ibm.com>

> ---
>  arch/powerpc/mm/numa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index b9b7fefbb64b..13022d734951 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -1436,7 +1436,7 @@ int find_and_online_cpu_nid(int cpu)
>  	if (new_nid < 0 || !node_possible(new_nid))
>  		new_nid = first_online_node;
>  
> -	if (NODE_DATA(new_nid) == NULL) {
> +	if (!node_online(new_nid)) {
>  #ifdef CONFIG_MEMORY_HOTPLUG
>  		/*
>  		 * Need to ensure that NODE_DATA is initialized for a node from
> -- 
> 2.27.0
> 
> 

-- 
Sincerely yours,
Mike.
