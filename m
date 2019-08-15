Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A70568E59D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 09:38:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468JFz4j0JzDqnf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 17:37:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="t7BLZTw6"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468JD803BczDqMF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 17:36:24 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 468JD30rcTz9tyg8;
 Thu, 15 Aug 2019 09:36:19 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=t7BLZTw6; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id HIJrNzoNiyNv; Thu, 15 Aug 2019 09:36:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 468JD26cH8z9tyg7;
 Thu, 15 Aug 2019 09:36:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565854578; bh=mmIOgbK+JKM5jqW9/BcwHJtcKEwnCjuq52vwowq/M/k=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=t7BLZTw6TKXeDRRYgbMR6vS0jqTejMQ0wIwScx/uyvfr8pfdY6az2/5oTQi+z4+ZE
 CpSYrQoZQBUgOU/dnXo/sdKOxHQSLtzmXCitW+lv81+sK/RC80tDwgXcaHPxmb8iLJ
 g3MRjTITtwC/83OVnsCL+nos7wM2M0at4qyt6Ssw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 09DCF8B782;
 Thu, 15 Aug 2019 09:36:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0xetyh4uG_O4; Thu, 15 Aug 2019 09:36:19 +0200 (CEST)
Received: from [192.168.232.53] (unknown [192.168.232.53])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 359E18B755;
 Thu, 15 Aug 2019 09:36:19 +0200 (CEST)
Subject: Re: [PATCH 4/6] powerpc: Chunk calls to flush_dcache_range in
 arch_*_memory
To: Alastair D'Silva <alastair@au1.ibm.com>, alastair@d-silva.org
References: <20190815041057.13627-1-alastair@au1.ibm.com>
 <20190815041057.13627-5-alastair@au1.ibm.com>
From: christophe leroy <christophe.leroy@c-s.fr>
Message-ID: <366f94bd-c61b-d454-b202-d3feb81a14c3@c-s.fr>
Date: Thu, 15 Aug 2019 09:36:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190815041057.13627-5-alastair@au1.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Antivirus: Avast (VPS 190814-8, 14/08/2019), Outbound message
X-Antivirus-Status: Clean
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Qian Cai <cai@lca.pw>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 15/08/2019 à 06:10, Alastair D'Silva a écrit :
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> When presented with large amounts of memory being hotplugged
> (in my test case, ~890GB), the call to flush_dcache_range takes
> a while (~50 seconds), triggering RCU stalls.
> 
> This patch breaks up the call into 16GB chunks, calling
> cond_resched() inbetween to allow the scheduler to run.

Is 16GB small enough ? If 890GB takes 50s, 16GB still takes about 1s.
I'd use 1GB chuncks to remain below 100ms.

> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>   arch/powerpc/mm/mem.c | 16 ++++++++++++++--
>   1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index 5400da87a804..fb0d5e9aa11b 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -104,11 +104,14 @@ int __weak remove_section_mapping(unsigned long start, unsigned long end)
>   	return -ENODEV;
>   }
>   
> +#define FLUSH_CHUNK_SIZE (16ull * 1024ull * 1024ull * 1024ull)

Can we use SZ_16GB ?

> +
>   int __ref arch_add_memory(int nid, u64 start, u64 size,
>   			struct mhp_restrictions *restrictions)
>   {
>   	unsigned long start_pfn = start >> PAGE_SHIFT;
>   	unsigned long nr_pages = size >> PAGE_SHIFT;
> +	unsigned long i;
>   	int rc;
>   
>   	resize_hpt_for_hotplug(memblock_phys_mem_size());
> @@ -120,7 +123,11 @@ int __ref arch_add_memory(int nid, u64 start, u64 size,
>   			start, start + size, rc);
>   		return -EFAULT;
>   	}
> -	flush_dcache_range(start, start + size);
> +
> +	for (i = 0; i < size; i += FLUSH_CHUNK_SIZE) {
> +		flush_dcache_range(start + i, min(start + size, start + i + FLUSH_CHUNK_SIZE));

Isn't the line a bit long (I have not checked).

> +		cond_resched();
> +	}
>   
>   	return __add_pages(nid, start_pfn, nr_pages, restrictions);
>   }
> @@ -131,13 +138,18 @@ void __ref arch_remove_memory(int nid, u64 start, u64 size,
>   	unsigned long start_pfn = start >> PAGE_SHIFT;
>   	unsigned long nr_pages = size >> PAGE_SHIFT;
>   	struct page *page = pfn_to_page(start_pfn) + vmem_altmap_offset(altmap);
> +	unsigned long i;
>   	int ret;
>   
>   	__remove_pages(page_zone(page), start_pfn, nr_pages, altmap);
>   
>   	/* Remove htab bolted mappings for this section of memory */
>   	start = (unsigned long)__va(start);
> -	flush_dcache_range(start, start + size);
> +	for (i = 0; i < size; i += FLUSH_CHUNK_SIZE) {
> +		flush_dcache_range(start + i, min(start + size, start + i + FLUSH_CHUNK_SIZE));
> +		cond_resched();
> +	}
> +
>   	ret = remove_section_mapping(start, start + size);
>   	WARN_ON_ONCE(ret);
>   
> 

Christophe

---
L'absence de virus dans ce courrier électronique a été vérifiée par le logiciel antivirus Avast.
https://www.avast.com/antivirus

