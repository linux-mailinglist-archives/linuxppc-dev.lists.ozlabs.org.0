Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB14E21069E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 10:43:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xZWf4q73zDqnG
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 18:43:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.218.67; helo=mail-ej1-f67.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xZTr4FgWzDqWQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 18:42:05 +1000 (AEST)
Received: by mail-ej1-f67.google.com with SMTP id rk21so23669019ejb.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Jul 2020 01:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=T9r9uXsGnf7xodRslPWJHaDGCw+J+NI5LCDeJSYGRKk=;
 b=nwLR0Nh1f69uXZLDOiPdsO7kPbQd/YIEQ02FEpWtD58bC0dkcze6lprxdJkgXoUHWp
 PrC34N2UgcX6eFXrQhQBhGBf/G6Vj5ZU92z9/9SBydQRqZKrlgtplfo3zGDOIm2K6vHT
 GsPCCaEIkcjEXMyYteuhPJ9EsdQlgSQgfFKSVvL2sela0E5eJw5b+nS6sVTw3DS4Kqau
 s2AQ98jwAEpr6gZvIkqqRWIXjainm+swQIryPuqmu9rJJaSyoyz6FYEPCClBMXNBRsvJ
 0Px6HQiu76fM4pF2FT1iitP/21OHx/j8Uqab7TCF0cMIvBa2DVUkLgIJQipk/8K3ofjI
 o0HQ==
X-Gm-Message-State: AOAM530diUi0blsVZ4Ht3d3+JbbLwdz/N3rpOGdfQqvg7Le9wG4HEcYL
 HyKKs3YRdibqHlmE7kXdpwg=
X-Google-Smtp-Source: ABdhPJyMVlYQgrE7cLMl4gjP0T0O//dKmjL8Y5w1eARBxVyjaPD/C6BUoqOwtCjSXGmrBV01flxkow==
X-Received: by 2002:a17:906:abd6:: with SMTP id
 kq22mr22915729ejb.458.1593592922127; 
 Wed, 01 Jul 2020 01:42:02 -0700 (PDT)
Received: from localhost (ip-37-188-168-3.eurotel.cz. [37.188.168.3])
 by smtp.gmail.com with ESMTPSA id b4sm5387790edx.96.2020.07.01.01.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 01:42:01 -0700 (PDT)
Date: Wed, 1 Jul 2020 10:42:00 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v5 3/3] mm/page_alloc: Keep memoryless cpuless node 0
 offline
Message-ID: <20200701084200.GN2369@dhcp22.suse.cz>
References: <20200624092846.9194-1-srikar@linux.vnet.ibm.com>
 <20200624092846.9194-4-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200624092846.9194-4-srikar@linux.vnet.ibm.com>
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
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 Mel Gorman <mgorman@suse.de>, "Kirill A. Shutemov" <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christopher Lameter <cl@linux.com>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Wed 24-06-20 14:58:46, Srikar Dronamraju wrote:
> Currently Linux kernel with CONFIG_NUMA on a system with multiple
> possible nodes, marks node 0 as online at boot.  However in practice,
> there are systems which have node 0 as memoryless and cpuless.
> 
> This can cause numa_balancing to be enabled on systems with only one node
> with memory and CPUs. The existence of this dummy node which is cpuless and
> memoryless node can confuse users/scripts looking at output of lscpu /
> numactl.
> 
> By marking, N_ONLINE as NODE_MASK_NONE, lets stop assuming that Node 0 is
> always online.
> 
> v5.8-rc2
>  available: 2 nodes (0,2)
>  node 0 cpus:
>  node 0 size: 0 MB
>  node 0 free: 0 MB
>  node 2 cpus: 0 1 2 3 4 5 6 7
>  node 2 size: 32625 MB
>  node 2 free: 31490 MB
>  node distances:
>  node   0   2
>    0:  10  20
>    2:  20  10
> 
> proc and sys files
> ------------------
>  /sys/devices/system/node/online:            0,2
>  /proc/sys/kernel/numa_balancing:            1
>  /sys/devices/system/node/has_cpu:           2
>  /sys/devices/system/node/has_memory:        2
>  /sys/devices/system/node/has_normal_memory: 2
>  /sys/devices/system/node/possible:          0-31
> 
> v5.8-rc2 + patch
> ------------------
>  available: 1 nodes (2)
>  node 2 cpus: 0 1 2 3 4 5 6 7
>  node 2 size: 32625 MB
>  node 2 free: 31487 MB
>  node distances:
>  node   2
>    2:  10
> 
> proc and sys files
> ------------------
> /sys/devices/system/node/online:            2
> /proc/sys/kernel/numa_balancing:            0
> /sys/devices/system/node/has_cpu:           2
> /sys/devices/system/node/has_memory:        2
> /sys/devices/system/node/has_normal_memory: 2
> /sys/devices/system/node/possible:          0-31
> 
> Note: On Powerpc, cpu_to_node of possible but not present cpus would
> previously return 0. Hence this commit depends on commit ("powerpc/numa: Set
> numa_node for all possible cpus") and commit ("powerpc/numa: Prefer node id
> queried from vphn"). Without the 2 commits, Powerpc system might crash.
> 
> 1. User space applications like Numactl, lscpu, that parse the sysfs tend to
> believe there is an extra online node. This tends to confuse users and
> applications. Other user space applications start believing that system was
> not able to use all the resources (i.e missing resources) or the system was
> not setup correctly.
> 
> 2. Also existence of dummy node also leads to inconsistent information. The
> number of online nodes is inconsistent with the information in the
> device-tree and resource-dump
> 
> 3. When the dummy node is present, single node non-Numa systems end up showing
> up as NUMA systems and numa_balancing gets enabled. This will mean we take
> the hit from the unnecessary numa hinting faults.

I have to say that I dislike the node online/offline state and directly
exporting that to the userspace. Users should only care whether the node
has memory/cpus. Numa nodes can be online without any memory. Just
offline all the present memory blocks but do not physically hot remove
them and you are in the same situation. If users are confused by an
output of tools like numactl -H then those could be updated and hide
nodes without any memory&cpus.

The autonuma problem sounds interesting but again this patch doesn't
really solve the underlying problem because I strongly suspect that the
problem is still there when a numa node gets all its memory offline as
mentioned above.

While I completely agree that making node 0 special is wrong, I have
still hard time to review this very simply looking patch because all the
numa initialization is so spread around that this might just blow up
at unexpected places. IIRC we have discussed testing in the previous
version and David has provided a way to emulate these configurations
on x86. Did you manage to use those instruction for additional testing
on other than ppc architectures?

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
> Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
> Cc: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
> Cc: David Hildenbrand <david@redhat.com>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> ---
> Changelog v4:->v5:
> - rebased to v5.8-rc2
> link v4: http://lore.kernel.org/lkml/20200512132937.19295-1-srikar@linux.vnet.ibm.com/t/#u
> 
> Changelog v1:->v2:
> - Rebased to v5.7-rc3
> Link v2: https://lore.kernel.org/linuxppc-dev/20200428093836.27190-1-srikar@linux.vnet.ibm.com/t/#u
> 
>  mm/page_alloc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 48eb0f1410d4..5187664558e1 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -117,8 +117,10 @@ EXPORT_SYMBOL(latent_entropy);
>   */
>  nodemask_t node_states[NR_NODE_STATES] __read_mostly = {
>  	[N_POSSIBLE] = NODE_MASK_ALL,
> +#ifdef CONFIG_NUMA
> +	[N_ONLINE] = NODE_MASK_NONE,
> +#else
>  	[N_ONLINE] = { { [0] = 1UL } },
> -#ifndef CONFIG_NUMA
>  	[N_NORMAL_MEMORY] = { { [0] = 1UL } },
>  #ifdef CONFIG_HIGHMEM
>  	[N_HIGH_MEMORY] = { { [0] = 1UL } },
> -- 
> 2.18.1
> 

-- 
Michal Hocko
SUSE Labs
