Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A048124446D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 07:03:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSWY74ljTzDqjg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 15:03:23 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSWVV5lmszDqfZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Aug 2020 15:01:02 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BSWVJ0Wd9z9v0CX;
 Fri, 14 Aug 2020 07:00:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id I5p15_tFkzZn; Fri, 14 Aug 2020 07:00:56 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BSWVH6Q7Tz9v0CW;
 Fri, 14 Aug 2020 07:00:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0B9B58B775;
 Fri, 14 Aug 2020 07:00:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id UlsOiHE9fsDA; Fri, 14 Aug 2020 07:00:54 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D5E1D8B767;
 Fri, 14 Aug 2020 07:00:52 +0200 (CEST)
Subject: Re: [PATCH v3] powerpc/pseries: explicitly reschedule during
 drmem_lmb list traversal
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20200813151131.2070161-1-nathanl@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <ec5f6e34-a17e-1989-de46-039f6da88d59@csgroup.eu>
Date: Fri, 14 Aug 2020 07:00:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200813151131.2070161-1-nathanl@linux.ibm.com>
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
Cc: cheloha@linux.ibm.com, ldufour@linux.ibm.com, tyreld@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/08/2020 à 17:11, Nathan Lynch a écrit :
> The drmem lmb list can have hundreds of thousands of entries, and
> unfortunately lookups take the form of linear searches. As long as
> this is the case, traversals have the potential to monopolize the CPU
> and provoke lockup reports, workqueue stalls, and the like unless
> they explicitly yield.
> 
> Rather than placing cond_resched() calls within various
> for_each_drmem_lmb() loop blocks in the code, put it in the iteration
> expression of the loop macro itself so users can't omit it.
> 
> Introduce a drmem_lmb_next() iteration helper function which calls
> cond_resched() at a regular interval during array traversal. Each
> iteration of the loop in DLPAR code paths can involve around ten RTAS
> calls which can each take up to 250us, so this ensures the check is
> performed at worst every few milliseconds.
> 
> Fixes: 6c6ea53725b3 ("powerpc/mm: Separate ibm, dynamic-memory data from DT format")
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>

Looks a lot better to me than v2.

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
> 
> Notes:
>      Changes since v2:
>      * Make drmem_lmb_next() more general.
>      * Adjust reschedule interval for better code generation.
>      * Add commentary to drmem_lmb_next() to explain the cond_resched()
>        call.
>      * Remove bounds assertions.
>      
>      Changes since v1:
>      * Add bounds assertions in drmem_lmb_next().
>      * Call cond_resched() in the iterator on only every 20th element
>        instead of on every iteration, to reduce overhead in tight loops.
> 
>   arch/powerpc/include/asm/drmem.h | 18 +++++++++++++++++-
>   1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/drmem.h b/arch/powerpc/include/asm/drmem.h
> index 17ccc6474ab6..6fb928605ed1 100644
> --- a/arch/powerpc/include/asm/drmem.h
> +++ b/arch/powerpc/include/asm/drmem.h
> @@ -8,6 +8,8 @@
>   #ifndef _ASM_POWERPC_LMB_H
>   #define _ASM_POWERPC_LMB_H
>   
> +#include <linux/sched.h>
> +
>   struct drmem_lmb {
>   	u64     base_addr;
>   	u32     drc_index;
> @@ -26,8 +28,22 @@ struct drmem_lmb_info {
>   
>   extern struct drmem_lmb_info *drmem_info;
>   
> +static inline struct drmem_lmb *drmem_lmb_next(struct drmem_lmb *lmb,
> +					       const struct drmem_lmb *start)
> +{
> +	/*
> +	 * DLPAR code paths can take several milliseconds per element
> +	 * when interacting with firmware. Ensure that we don't
> +	 * unfairly monopolize the CPU.
> +	 */
> +	if (((++lmb - start) % 16) == 0)
> +		cond_resched();
> +
> +	return lmb;
> +}
> +
>   #define for_each_drmem_lmb_in_range(lmb, start, end)		\
> -	for ((lmb) = (start); (lmb) < (end); (lmb)++)
> +	for ((lmb) = (start); (lmb) < (end); lmb = drmem_lmb_next(lmb, start))
>   
>   #define for_each_drmem_lmb(lmb)					\
>   	for_each_drmem_lmb_in_range((lmb),			\
> 
