Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E58E03ED9C4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 17:20:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpHsv5Ytlz3cVg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 01:20:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpHsS0hcZz303H
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 01:20:09 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GpHsL1Wbnz9sW4;
 Mon, 16 Aug 2021 17:20:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pTmRzOziONw1; Mon, 16 Aug 2021 17:20:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GpHsL0Vd1z9sVj;
 Mon, 16 Aug 2021 17:20:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D2A948B796;
 Mon, 16 Aug 2021 17:20:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id q9_x1VKISikP; Mon, 16 Aug 2021 17:20:05 +0200 (CEST)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B09718B788;
 Mon, 16 Aug 2021 17:20:05 +0200 (CEST)
Subject: Re: [PATCH] powerpc/pseries/cpuhp: fix non-NUMA build
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20210816151705.2786296-1-nathanl@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <e9935336-43e3-228d-57f9-40cec438a23f@csgroup.eu>
Date: Mon, 16 Aug 2021 17:19:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210816151705.2786296-1-nathanl@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: ldufour@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 16/08/2021 à 17:17, Nathan Lynch a écrit :
> With CONFIG_NUMA unset, direct references to node_to_cpumask_map don't
> work:
> 
>     arch/powerpc/platforms/pseries/hotplug-cpu.c: In function 'pseries_cpu_hotplug_init':
>>> arch/powerpc/platforms/pseries/hotplug-cpu.c:1022:8: error: 'node_to_cpumask_map' undeclared (first use in this
>>> function)
>      1022 |        node_to_cpumask_map[node]);
> 	 |        ^~~~~~~~~~~~~~~~~~~
> 
> Use cpumask_of_node() here instead.


Isn't it the same as 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210816041032.2839343-1-mpe@ellerman.id.au/ ?

Christophe

> 
> Fixes: bd1dd4c5f528 ("powerpc/pseries: Prevent free CPU ids being reused on another node")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
>   arch/powerpc/platforms/pseries/hotplug-cpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> index 1ef40ef699a6..d646c22e94ab 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> @@ -1021,7 +1021,7 @@ static int __init pseries_cpu_hotplug_init(void)
>   			/* Record ids of CPU added at boot time */
>   			cpumask_or(node_recorded_ids_map[node],
>   				   node_recorded_ids_map[node],
> -				   node_to_cpumask_map[node]);
> +				   cpumask_of_node(node));
>   		}
>   
>   		of_reconfig_notifier_register(&pseries_smp_nb);
> 
