Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CE82424F7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 07:21:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRJ2g45VczDqVm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 15:21:15 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRJ0p6BP4zDqBt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 15:19:33 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BRJ0b6N9Jz9txnS;
 Wed, 12 Aug 2020 07:19:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id JP0leeGbRS3m; Wed, 12 Aug 2020 07:19:27 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BRJ0b57pNz9txnR;
 Wed, 12 Aug 2020 07:19:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 870388B778;
 Wed, 12 Aug 2020 07:19:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0N3gvScVXHlB; Wed, 12 Aug 2020 07:19:28 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2D0398B75B;
 Wed, 12 Aug 2020 07:19:28 +0200 (CEST)
Subject: Re: [PATCH v2] powerpc/pseries: explicitly reschedule during
 drmem_lmb list traversal
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20200812012005.1919255-1-nathanl@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <c39976ce-a95c-a9cb-d119-d272b8de2f28@csgroup.eu>
Date: Wed, 12 Aug 2020 07:19:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200812012005.1919255-1-nathanl@linux.ibm.com>
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
Cc: tyreld@linux.ibm.com, cheloha@linux.ibm.com, ldufour@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 12/08/2020 à 03:20, Nathan Lynch a écrit :
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
> Call cond_resched() on every 20th element. Each iteration of the loop
> in DLPAR code paths can involve around ten RTAS calls which can each
> take up to 250us, so this ensures the check is performed at worst
> every few milliseconds.
> 
> Fixes: 6c6ea53725b3 ("powerpc/mm: Separate ibm, dynamic-memory data from DT format")
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/drmem.h | 18 +++++++++++++++++-
>   1 file changed, 17 insertions(+), 1 deletion(-)
> 
> Changes since v1:
> * Add bounds assertions in drmem_lmb_next().
> * Call cond_resched() in the iterator on only every 20th element
>    instead of on every iteration, to reduce overhead in tight loops.
> 
> diff --git a/arch/powerpc/include/asm/drmem.h b/arch/powerpc/include/asm/drmem.h
> index 17ccc6474ab6..583277e30dd2 100644
> --- a/arch/powerpc/include/asm/drmem.h
> +++ b/arch/powerpc/include/asm/drmem.h
> @@ -8,6 +8,9 @@
>   #ifndef _ASM_POWERPC_LMB_H
>   #define _ASM_POWERPC_LMB_H
>   
> +#include <linux/bug.h>
> +#include <linux/sched.h>
> +
>   struct drmem_lmb {
>   	u64     base_addr;
>   	u32     drc_index;
> @@ -26,8 +29,21 @@ struct drmem_lmb_info {
>   
>   extern struct drmem_lmb_info *drmem_info;
>   
> +static inline struct drmem_lmb *drmem_lmb_next(struct drmem_lmb *lmb)
> +{
> +	const unsigned int resched_interval = 20;
> +
> +	BUG_ON(lmb < drmem_info->lmbs);
> +	BUG_ON(lmb >= drmem_info->lmbs + drmem_info->n_lmbs);

BUG_ON() shall be avoided unless absolutely necessary.
Wouldn't WARN_ON() together with an early return be enough ?

> +
> +	if ((lmb - drmem_info->lmbs) % resched_interval == 0)
> +		cond_resched();

Do you need something that precise ? Can't you use 16 or 32 and use a 
logical AND instead of a MODULO ?

And what garanties that lmb is always an element of a table based at 
drmem_info->lmbs ?

What about:

static inline struct drmem_lmb *drmem_lmb_next(struct drmem_lmb *lmb, 
struct drmem_lmb *start)
{
	const unsigned int resched_interval = 16;

	if ((++lmb - start) & resched_interval == 0)
		cond_resched();

	return lmb;
}

#define for_each_drmem_lmb_in_range(lmb, start, end)		\
	for ((lmb) = (start); (lmb) < (end); lmb = drmem_lmb_next(lmb, start))


> +
> +	return ++lmb;
> +}
> +
>   #define for_each_drmem_lmb_in_range(lmb, start, end)		\
> -	for ((lmb) = (start); (lmb) < (end); (lmb)++)
> +	for ((lmb) = (start); (lmb) < (end); lmb = drmem_lmb_next(lmb))
>   
>   #define for_each_drmem_lmb(lmb)					\
>   	for_each_drmem_lmb_in_range((lmb),			\
> 

Christophe
