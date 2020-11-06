Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A616C2A8FC6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 08:01:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSBBg0mbDzDrGv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 18:01:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSB781kyhzDrDn
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Nov 2020 17:58:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4CSB752rm8z8tSs
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Nov 2020 17:58:25 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4CSB751WDQz9sVK; Fri,  6 Nov 2020 17:58:25 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4CSB7462cbz9sSn
 for <linuxppc-dev@ozlabs.org>; Fri,  6 Nov 2020 17:58:24 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CSB7069ZGz9tyl8;
 Fri,  6 Nov 2020 07:58:20 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id X5yjvX0yGRKZ; Fri,  6 Nov 2020 07:58:20 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CSB705Mzzz9tyl7;
 Fri,  6 Nov 2020 07:58:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A1E058B885;
 Fri,  6 Nov 2020 07:58:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id QGm7ssV_oEbM; Fri,  6 Nov 2020 07:58:21 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 353168B75F;
 Fri,  6 Nov 2020 07:58:21 +0100 (CET)
Subject: Re: [PATCH v2] powerpc: topology.h: fix build when CONFIG_NUMA=n
To: Scott Cheloha <cheloha@linux.ibm.com>, linuxppc-dev@ozlabs.org
References: <20201105223040.3612663-1-cheloha@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <c0ca0647-a8c9-03ca-cc35-7e57b6ff4139@csgroup.eu>
Date: Fri, 6 Nov 2020 07:58:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201105223040.3612663-1-cheloha@linux.ibm.com>
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
 Laurent Dufour <ldufour@linux.vnet.ibm.com>, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 05/11/2020 à 23:30, Scott Cheloha a écrit :
> Add a non-NUMA definition for of_drconf_to_nid_single() to topology.h
> so we have one even if powerpc/mm/numa.c is not compiled.  On a non-NUMA
> kernel the appropriate node id is always first_online_node.
> 
> Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 72cdd117c449 ("pseries/hotplug-memory: hot-add: skip redundant LMB lookup")

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
> v1: Initial patch.
> 
> v2: Incorporate suggested cleanups from Christophe Leroy.
> 
>   arch/powerpc/include/asm/topology.h | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
> index 8728590f514a..3beeb030cd78 100644
> --- a/arch/powerpc/include/asm/topology.h
> +++ b/arch/powerpc/include/asm/topology.h
> @@ -6,6 +6,7 @@
>   
>   struct device;
>   struct device_node;
> +struct drmem_lmb;
>   
>   #ifdef CONFIG_NUMA
>   
> @@ -61,6 +62,9 @@ static inline int early_cpu_to_node(int cpu)
>   	 */
>   	return (nid < 0) ? 0 : nid;
>   }
> +
> +int of_drconf_to_nid_single(struct drmem_lmb *lmb);
> +
>   #else
>   
>   static inline int early_cpu_to_node(int cpu) { return 0; }
> @@ -84,10 +88,12 @@ static inline int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
>   	return 0;
>   }
>   
> -#endif /* CONFIG_NUMA */
> +static inline int of_drconf_to_nid_single(struct drmem_lmb *lmb)
> +{
> +	return first_online_node;
> +}
>   
> -struct drmem_lmb;
> -int of_drconf_to_nid_single(struct drmem_lmb *lmb);
> +#endif /* CONFIG_NUMA */
>   
>   #if defined(CONFIG_NUMA) && defined(CONFIG_PPC_SPLPAR)
>   extern int find_and_online_cpu_nid(int cpu);
> 
