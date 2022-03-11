Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 375774D64D4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 16:43:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFVb60xySz3bbf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 02:43:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFVZf3kJZz2yLg
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar 2022 02:43:22 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KFVZc3q0rz4xMW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar 2022 02:43:20 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KFVZc3fNkz4xPt; Sat, 12 Mar 2022 02:43:20 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KFVZc1ZVdz4xMW
 for <linuxppc-dev@ozlabs.org>; Sat, 12 Mar 2022 02:43:18 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KFVZW3zm4z9sSK;
 Fri, 11 Mar 2022 16:43:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pfvD8e9MsdKX; Fri, 11 Mar 2022 16:43:15 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KFVZW3Fr2z9sSG;
 Fri, 11 Mar 2022 16:43:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5B6CD8B792;
 Fri, 11 Mar 2022 16:43:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id CjW_zgF7VZor; Fri, 11 Mar 2022 16:43:15 +0100 (CET)
Received: from [192.168.202.87] (unknown [192.168.202.87])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0766E8B763;
 Fri, 11 Mar 2022 16:43:14 +0100 (CET)
Message-ID: <59ab207a-eaf8-6701-f9d3-a3e984f829d2@csgroup.eu>
Date: Fri, 11 Mar 2022 16:43:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] Setup per-cpu cpu<->node binding early
Content-Language: fr-FR
To: Balbir Singh <bsingharora@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev <linuxppc-dev@ozlabs.org>
References: <1c7ad577-da11-e4a5-b5b0-16ce2da6f67c@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <1c7ad577-da11-e4a5-b5b0-16ce2da6f67c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 18/10/2016 à 09:10, Balbir Singh a écrit :
> Michael Ellerman debugged an issue w.r.t workqueue changes
> (see https://lkml.org/lkml/2016/10/17/352) down to the fact
> that we don't setup our per cpu (cpu to node) binding early
> enough (in setup_per_cpu_areas like x86 does).
> 
> This lead to a problem with workqueue changes where the
> cpus seen by for_each_node() in workqueue_init_early() was
> different from their binding seen later in
> 
> for_each_possible_cpu(cpu) {
> 	node = cpu_to_node(cpu)
> 	...
> 
> }
> 
> In setup_arch()->initmem_init() we have access to the binding
> in numa_cpu_lookup_table()
> 
> This patch implements Michael's suggestion of setting up
> the per cpu node binding inside of setup_per_cpu_areas()
> 
> I did not remove the original setting of these values
> from smp_prepare_cpus(). I've also not setup per cpu
> mem's via set_cpu_numa_mem() since zonelists are not
> yet built by the time we do per cpu setup.
> 
> Reported-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Balbir Singh <bsingharora@gmail.com>


I see we still have this patch as "New" in patchwork.

Is it similar to commit ba4a648f12f4 ("powerpc/numa: Fix percpu 
allocations to be NUMA aware")

Or is it something else ?

Thanks
Christophe

> ---
>   arch/powerpc/kernel/setup_64.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
> index c3e1290..842415a 100644
> --- a/arch/powerpc/kernel/setup_64.c
> +++ b/arch/powerpc/kernel/setup_64.c
> @@ -625,6 +625,8 @@ void __init setup_per_cpu_areas(void)
>   	for_each_possible_cpu(cpu) {
>                   __per_cpu_offset[cpu] = delta + pcpu_unit_offsets[cpu];
>   		paca[cpu].data_offset = __per_cpu_offset[cpu];
> +
> +		set_cpu_numa_node(cpu, numa_cpu_lookup_table[cpu]);
>   	}
>   }
>   #endif
