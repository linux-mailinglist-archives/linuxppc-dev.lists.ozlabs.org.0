Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E5BA6162
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 08:27:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MxpK724jzDqW2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 16:27:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="jSi/qWON"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MxjM34BZzDqWj
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 16:23:35 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46MxjD5f4jzB09ZG;
 Tue,  3 Sep 2019 08:23:28 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=jSi/qWON; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id yI4Wk4yYjcQ6; Tue,  3 Sep 2019 08:23:28 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46MxjD4JnLzB09ZC;
 Tue,  3 Sep 2019 08:23:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1567491808; bh=3rMEla0IRyGqnTbAGeQB90lkVJ6wbzqtAr9Y3HR5NO4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=jSi/qWONxHtO6HDsgkiglSSzPgvKuGVlatFhk3N+t6KuTIsZ6seRgJoCkVKpYasUg
 N24RMQnqqTSMkdU0MqAwYjX9ArNBNR87dD5imn8hOwLcyc4bgyIoKiople5dcIQFoU
 twlrhgP2nLDU1Ja5a8HaVQJYWX+lz3bs6VpgwCZI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7B0B58B7A3;
 Tue,  3 Sep 2019 08:23:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 7Kxqw9KkM_4J; Tue,  3 Sep 2019 08:23:29 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 80AC28B761;
 Tue,  3 Sep 2019 08:23:28 +0200 (CEST)
Subject: Re: [PATCH v2 6/6] powerpc: Don't flush caches when adding memory
To: Alastair D'Silva <alastair@au1.ibm.com>, alastair@d-silva.org
References: <20190903052407.16638-1-alastair@au1.ibm.com>
 <20190903052407.16638-7-alastair@au1.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <e6713f8a-6465-f9fe-40e9-91d52aa06195@c-s.fr>
Date: Tue, 3 Sep 2019 08:23:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190903052407.16638-7-alastair@au1.ibm.com>
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
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Qian Cai <cai@lca.pw>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 03/09/2019 à 07:24, Alastair D'Silva a écrit :
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> This operation takes a significant amount of time when hotplugging
> large amounts of memory (~50 seconds with 890GB of persistent memory).
> 
> This was orignally in commit fb5924fddf9e
> ("powerpc/mm: Flush cache on memory hot(un)plug") to support memtrace,
> but the flush on add is not needed as it is flushed on remove.
> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>   arch/powerpc/mm/mem.c | 7 -------
>   1 file changed, 7 deletions(-)
> 
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index 854aaea2c6ae..2a14b5b93e19 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -111,7 +111,6 @@ int __ref arch_add_memory(int nid, u64 start, u64 size,
>   {
>   	unsigned long start_pfn = start >> PAGE_SHIFT;
>   	unsigned long nr_pages = size >> PAGE_SHIFT;
> -	u64 i;
>   	int rc;
>   
>   	resize_hpt_for_hotplug(memblock_phys_mem_size());
> @@ -124,12 +123,6 @@ int __ref arch_add_memory(int nid, u64 start, u64 size,
>   		return -EFAULT;
>   	}
>   
> -	for (i = 0; i < size; i += FLUSH_CHUNK_SIZE) {
> -		flush_dcache_range(start + i,
> -				   min(start + size, start + i + FLUSH_CHUNK_SIZE));
> -		cond_resched();
> -	}
> -

So you are removing the code you added in patch 4. Why not move this one 
before patch 4 ?

>   	return __add_pages(nid, start_pfn, nr_pages, restrictions);
>   }
>   
> 

Christophe
