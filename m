Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB0C2A8517
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 18:39:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRrPC1hr5zDqKL
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 04:39:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRrMR3z6BzDr2g
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Nov 2020 04:37:40 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CRrLy3VmQzB09bR;
 Thu,  5 Nov 2020 18:37:30 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ZyufDVRjDfXh; Thu,  5 Nov 2020 18:37:30 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CRrLy2DytzB09bQ;
 Thu,  5 Nov 2020 18:37:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1F7D08B861;
 Thu,  5 Nov 2020 18:37:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id QwaUA1tnrZCz; Thu,  5 Nov 2020 18:37:32 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 403928B84C;
 Thu,  5 Nov 2020 18:37:31 +0100 (CET)
Subject: Re: [PATCH] powerpc: topology.h: fix build when CONFIG_NUMA=n
To: Scott Cheloha <cheloha@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20201105162018.3559108-1-cheloha@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <ce83ecd5-5c2e-86bd-e6b9-73db0108014d@csgroup.eu>
Date: Thu, 5 Nov 2020 18:34:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201105162018.3559108-1-cheloha@linux.ibm.com>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Laurent Dufour <ldufour@linux.ibm.com>, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 05/11/2020 à 17:20, Scott Cheloha a écrit :
> Add a non-NUMA definition for of_drconf_to_nid_single() to topology.h
> so we have one even if powerpc/mm/numa.c is not compiled.  On a non-NUMA
> kernel the appropriate node id is always first_online_node.
> 
> Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 72cdd117c449 ("pseries/hotplug-memory: hot-add: skip redundant LMB lookup")
> ---
>   arch/powerpc/include/asm/topology.h | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
> index 8728590f514a..90d2424418b5 100644
> --- a/arch/powerpc/include/asm/topology.h
> +++ b/arch/powerpc/include/asm/topology.h
> @@ -61,6 +61,10 @@ static inline int early_cpu_to_node(int cpu)
>   	 */
>   	return (nid < 0) ? 0 : nid;
>   }
> +
> +struct drmem_lmb;

Can you put that before the #ifdef CONFIG_NUMA in order to avoid duplicating it ?

> +extern int of_drconf_to_nid_single(struct drmem_lmb *lmb);

'extern' keywork is useless on a function prototype, don't add one, keep the prototype as before, ie:

int of_drconf_to_nid_single(struct drmem_lmb *lmb);


> +
>   #else
>   
>   static inline int early_cpu_to_node(int cpu) { return 0; }
> @@ -84,10 +88,13 @@ static inline int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
>   	return 0;
>   }
>   
> -#endif /* CONFIG_NUMA */
> -
>   struct drmem_lmb;

Can you put that before the #ifdef CONFIG_NUMA in order to avoid duplicating it ?

> -int of_drconf_to_nid_single(struct drmem_lmb *lmb);
> +static inline int of_drconf_to_nid_single(struct drmem_lmb *lmb)
> +{
> +	return first_online_node;
> +}
> +
> +#endif /* CONFIG_NUMA */
>   
>   #if defined(CONFIG_NUMA) && defined(CONFIG_PPC_SPLPAR)
>   extern int find_and_online_cpu_nid(int cpu);
> 

Christophe
