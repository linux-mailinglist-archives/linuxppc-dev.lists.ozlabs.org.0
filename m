Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BDD18174F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 13:00:03 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48cr9q2GdMzDqP1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 22:59:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.68; helo=mail-wm1-f68.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48cr7B4m5mzDqM2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 22:57:42 +1100 (AEDT)
Received: by mail-wm1-f68.google.com with SMTP id a141so1803881wme.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 04:57:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tZ17rEf6Xvksk/thMYpVF8wPE/d3WH4FVyx1lotSqqk=;
 b=nUBrIPC72caxrwP1+mFfP6MJGSeNkTWT7qF2d/Cjq20m0HRv5c/y7EdxT7ueeEAI5S
 yo1Ex9vedXy0t9zbyPmXlC24IQTLhTx+TjMEdHEDdw6xI8YkldGGjqHokfS6pHhLTp40
 gTkAAibLfv1Iy0VK3SsE+46/n0hrfQKyRKwjyWHGWLY6h+iApB9kg0FTCNdZTaNkIpx5
 cOJWkLazLHgO8rBc4p1GnTE+MNMG8jm4BEDjFuSI6xaOUp4BjwC42h6+2zVW4KO3Cixf
 8Ml967CGCK853TfV8+G2Nlz8jsduHTLFZcUoQ1BHnIW45cRz5v7jcvLNjCTGIjndJHHq
 3MXQ==
X-Gm-Message-State: ANhLgQ0eXxDdIprgYuONN71RL8uzLtiWJ9Tdm1cPZAdGHDdkGlYnP0gh
 GCIzFSCqd68eNwox8VlBc+Y=
X-Google-Smtp-Source: ADFU+vvESGFZ1n4LLTj2JSRkMK7+3YcfWoI1XMkLFpJ1FrM0KfhtH1XEz0eUrZeFKyHCNhX1niYzAA==
X-Received: by 2002:a7b:c082:: with SMTP id r2mr3683800wmh.177.1583927857619; 
 Wed, 11 Mar 2020 04:57:37 -0700 (PDT)
Received: from localhost (prg-ext-pat.suse.com. [213.151.95.130])
 by smtp.gmail.com with ESMTPSA id w19sm8004689wmi.0.2020.03.11.04.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 04:57:36 -0700 (PDT)
Date: Wed, 11 Mar 2020 12:57:35 +0100
From: Michal Hocko <mhocko@kernel.org>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/3] powerpc/numa: Set numa_node for all possible cpus
Message-ID: <20200311115735.GM23944@dhcp22.suse.cz>
References: <20200311110237.5731-1-srikar@linux.vnet.ibm.com>
 <20200311110237.5731-2-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311110237.5731-2-srikar@linux.vnet.ibm.com>
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, Mel Gorman <mgorman@suse.de>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christopher Lameter <cl@linux.com>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 11-03-20 16:32:35, Srikar Dronamraju wrote:
> A Powerpc system with multiple possible nodes and with CONFIG_NUMA
> enabled always used to have a node 0, even if node 0 does not any cpus
> or memory attached to it. As per PAPR, node affinity of a cpu is only
> available once its present / online. For all cpus that are possible but
> not present, cpu_to_node() would point to node 0.
> 
> To ensure a cpuless, memoryless dummy node is not online, powerpc need
> to make sure all possible but not present cpu_to_node are set to a
> proper node.

Just curious, is this somehow related to
http://lkml.kernel.org/r/20200227182650.GG3771@dhcp22.suse.cz?

> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Mel Gorman <mgorman@suse.de>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: "Kirill A. Shutemov" <kirill@shutemov.name>
> Cc: Christopher Lameter <cl@linux.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> ---
>  arch/powerpc/mm/numa.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index 8a399db..54dcd49 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -931,8 +931,20 @@ void __init mem_topology_setup(void)
>  
>  	reset_numa_cpu_lookup_table();
>  
> -	for_each_present_cpu(cpu)
> -		numa_setup_cpu(cpu);
> +	for_each_possible_cpu(cpu) {
> +		/*
> +		 * Powerpc with CONFIG_NUMA always used to have a node 0,
> +		 * even if it was memoryless or cpuless. For all cpus that
> +		 * are possible but not present, cpu_to_node() would point
> +		 * to node 0. To remove a cpuless, memoryless dummy node,
> +		 * powerpc need to make sure all possible but not present
> +		 * cpu_to_node are set to a proper node.
> +		 */
> +		if (cpu_present(cpu))
> +			numa_setup_cpu(cpu);
> +		else
> +			set_cpu_numa_node(cpu, first_online_node);
> +	}
>  }
>  
>  void __init initmem_init(void)
> -- 
> 1.8.3.1

-- 
Michal Hocko
SUSE Labs
