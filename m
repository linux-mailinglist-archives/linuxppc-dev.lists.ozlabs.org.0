Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1950A1A06B1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 07:49:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xGh32ZPvzDr8R
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 15:49:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=UrkBqgGa; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xG3L0Vl5zDqwy
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 15:21:15 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48xG3B4r6hz9tyfQ;
 Tue,  7 Apr 2020 07:21:10 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=UrkBqgGa; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id R8Lvo0e7fxvy; Tue,  7 Apr 2020 07:21:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48xG3B3Lczz9tyfN;
 Tue,  7 Apr 2020 07:21:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586236870; bh=3u1ayauMY7gcRxL/tTNWMfHqhckK6E5BFvOAK3bNBl8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=UrkBqgGaMsObMON3ZTTcPlU+E6eOmmSBv1MqvJdKOpQAjLgvko+U6TsLIKFpIvJRu
 +NnPc8GYs0oEGbHiCScJZ0qEIQc33eamsV3chh7rFebJM1ovMSkLat3w7pMUnGOWkv
 Y+3LackF7BVIu8EyiPLwpeH6NT2oEHEqKLKWjl14=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 419EF8B76E;
 Tue,  7 Apr 2020 07:21:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Zn_UBkCihN6b; Tue,  7 Apr 2020 07:21:11 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 85BAF8B75E;
 Tue,  7 Apr 2020 07:21:09 +0200 (CEST)
Subject: Re: [PATCH] powerpcs: perf: consolidate perf_callchain_user_64 and
 perf_callchain_user_32
To: Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
References: <1585896170.ohti800w9v.astroid@bobo.none>
 <20200406210022.32265-1-msuchanek@suse.de>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <8786906b-edd5-e4a3-8286-33a05f39668c@c-s.fr>
Date: Tue, 7 Apr 2020 07:21:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200406210022.32265-1-msuchanek@suse.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 06/04/2020 à 23:00, Michal Suchanek a écrit :
> perf_callchain_user_64 and perf_callchain_user_32 are nearly identical.
> Consolidate into one function with thin wrappers.
> 
> Suggested-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---
>   arch/powerpc/perf/callchain.h    | 24 +++++++++++++++++++++++-
>   arch/powerpc/perf/callchain_32.c | 21 ++-------------------
>   arch/powerpc/perf/callchain_64.c | 14 ++++----------
>   3 files changed, 29 insertions(+), 30 deletions(-)
> 
> diff --git a/arch/powerpc/perf/callchain.h b/arch/powerpc/perf/callchain.h
> index 7a2cb9e1181a..7540bb71cb60 100644
> --- a/arch/powerpc/perf/callchain.h
> +++ b/arch/powerpc/perf/callchain.h
> @@ -2,7 +2,7 @@
>   #ifndef _POWERPC_PERF_CALLCHAIN_H
>   #define _POWERPC_PERF_CALLCHAIN_H
>   
> -int read_user_stack_slow(void __user *ptr, void *buf, int nb);
> +int read_user_stack_slow(const void __user *ptr, void *buf, int nb);

Does the constification of ptr has to be in this patch ?
Wouldn't it be better to have it as a separate patch ?

>   void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
>   			    struct pt_regs *regs);
>   void perf_callchain_user_32(struct perf_callchain_entry_ctx *entry,
> @@ -16,4 +16,26 @@ static inline bool invalid_user_sp(unsigned long sp)
>   	return (!sp || (sp & mask) || (sp > top));
>   }
>   
> +/*
> + * On 32-bit we just access the address and let hash_page create a
> + * HPTE if necessary, so there is no need to fall back to reading
> + * the page tables.  Since this is called at interrupt level,
> + * do_page_fault() won't treat a DSI as a page fault.
> + */
> +static inline int __read_user_stack(const void __user *ptr, void *ret,
> +				    size_t size)
> +{
> +	int rc;
> +
> +	if ((unsigned long)ptr > TASK_SIZE - size ||
> +			((unsigned long)ptr & (size - 1)))
> +		return -EFAULT;
> +	rc = probe_user_read(ret, ptr, size);
> +
> +	if (rc && IS_ENABLED(CONFIG_PPC64))

gcc is probably smart enough to deal with it efficiently, but it would
be more correct to test rc after checking CONFIG_PPC64.

> +		return read_user_stack_slow(ptr, ret, size);
> +
> +	return rc;
> +}
> +
>   #endif /* _POWERPC_PERF_CALLCHAIN_H */
> diff --git a/arch/powerpc/perf/callchain_32.c b/arch/powerpc/perf/callchain_32.c
> index 8aa951003141..1b4621f177e8 100644
> --- a/arch/powerpc/perf/callchain_32.c
> +++ b/arch/powerpc/perf/callchain_32.c
> @@ -31,26 +31,9 @@
>   
>   #endif /* CONFIG_PPC64 */
>   
> -/*
> - * On 32-bit we just access the address and let hash_page create a
> - * HPTE if necessary, so there is no need to fall back to reading
> - * the page tables.  Since this is called at interrupt level,
> - * do_page_fault() won't treat a DSI as a page fault.
> - */
> -static int read_user_stack_32(unsigned int __user *ptr, unsigned int *ret)
> +static int read_user_stack_32(const unsigned int __user *ptr, unsigned int *ret)
>   {
> -	int rc;
> -
> -	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned int) ||
> -	    ((unsigned long)ptr & 3))
> -		return -EFAULT;
> -
> -	rc = probe_user_read(ret, ptr, sizeof(*ret));
> -
> -	if (IS_ENABLED(CONFIG_PPC64) && rc)
> -		return read_user_stack_slow(ptr, ret, 4);
> -
> -	return rc;
> +	return __read_user_stack(ptr, ret, sizeof(*ret);
>   }
>   
>   /*
> diff --git a/arch/powerpc/perf/callchain_64.c b/arch/powerpc/perf/callchain_64.c
> index df1ffd8b20f2..55bbc25a54ed 100644
> --- a/arch/powerpc/perf/callchain_64.c
> +++ b/arch/powerpc/perf/callchain_64.c
> @@ -24,7 +24,7 @@
>    * interrupt context, so if the access faults, we read the page tables
>    * to find which page (if any) is mapped and access it directly.
>    */
> -int read_user_stack_slow(void __user *ptr, void *buf, int nb)
> +int read_user_stack_slow(const void __user *ptr, void *buf, int nb)
>   {
>   	int ret = -EFAULT;
>   	pgd_t *pgdir;
> @@ -65,16 +65,10 @@ int read_user_stack_slow(void __user *ptr, void *buf, int nb)
>   	return ret;
>   }
>   
> -static int read_user_stack_64(unsigned long __user *ptr, unsigned long *ret)
> +static int read_user_stack_64(const unsigned long __user *ptr,
> +			      unsigned long *ret)
>   {
> -	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned long) ||
> -	    ((unsigned long)ptr & 7))
> -		return -EFAULT;
> -
> -	if (!probe_user_read(ret, ptr, sizeof(*ret)))
> -		return 0;
> -
> -	return read_user_stack_slow(ptr, ret, 8);
> +	return __read_user_stack(ptr, ret, sizeof(*ret));
>   }
>   
>   /*
> 

Christophe
