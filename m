Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB9A36F745
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 10:42:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWm8s3tpkz3bSj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 18:42:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWm8X3Wq1z2xMd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 18:42:34 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4FWm8N6MCcz9wfG;
 Fri, 30 Apr 2021 10:42:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S7ZhkRsmT1sf; Fri, 30 Apr 2021 10:42:28 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FWm8N5NTyz9wbM;
 Fri, 30 Apr 2021 10:42:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AEDE28B888;
 Fri, 30 Apr 2021 10:42:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id G6mOmtyte8bt; Fri, 30 Apr 2021 10:42:28 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 30B108B885;
 Fri, 30 Apr 2021 10:42:28 +0200 (CEST)
Subject: Re: [PATCH] powerpc/powernv/memtrace: Fix dcache flushing
To: Sandipan Das <sandipan@linux.ibm.com>, mpe@ellerman.id.au
References: <20210430075557.893819-1-sandipan@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <cb700884-b9f3-f3b9-4fae-272d678d1626@csgroup.eu>
Date: Fri, 30 Apr 2021 10:42:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210430075557.893819-1-sandipan@linux.ibm.com>
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
Cc: aneesh.kumar@linux.ibm.com, rashmica.g@gmail.com, jniethe5@gmail.com,
 linuxppc-dev@lists.ozlabs.org, david@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/04/2021 à 09:55, Sandipan Das a écrit :
> Trace memory is cleared and the corresponding dcache lines
> are flushed after allocation. However, this should not be
> done using the PFN. This adds the missing __va() conversion.
> 
> Fixes: 2ac02e5ecec0 ("powerpc/mm: Remove dcache flush from memory remove.")
> Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
> ---
>   arch/powerpc/platforms/powernv/memtrace.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/memtrace.c b/arch/powerpc/platforms/powernv/memtrace.c
> index 71c1262589fe..a31f13814f2e 100644
> --- a/arch/powerpc/platforms/powernv/memtrace.c
> +++ b/arch/powerpc/platforms/powernv/memtrace.c
> @@ -104,8 +104,8 @@ static void memtrace_clear_range(unsigned long start_pfn,
>   	 * Before we go ahead and use this range as cache inhibited range
>   	 * flush the cache.
>   	 */
> -	flush_dcache_range_chunked(PFN_PHYS(start_pfn),
> -				   PFN_PHYS(start_pfn + nr_pages),
> +	flush_dcache_range_chunked((unsigned long)__va(PFN_PHYS(start_pfn)),
> +				   (unsigned long)__va(PFN_PHYS(start_pfn + nr_pages)),

Can you use pfn_to_virt() instead ?

>   				   FLUSH_CHUNK_SIZE);
>   }
>   
> 
