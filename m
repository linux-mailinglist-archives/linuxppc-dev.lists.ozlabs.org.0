Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAB3A628F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 09:32:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MzDh2d46zDqjc
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 17:32:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="PACcrujt"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MzBh657fzDqTj
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 17:30:35 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46MzBb0xz5z9ttBV;
 Tue,  3 Sep 2019 09:30:31 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=PACcrujt; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id T0xRNXlM8bhP; Tue,  3 Sep 2019 09:30:31 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46MzBZ6yTWz9ttBQ;
 Tue,  3 Sep 2019 09:30:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1567495831; bh=k+NYjZeOfQFXUZQiLH4UtQme2OzTv4EeVCcmJnZlXBg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=PACcrujt/U+pxq6p5AU120JT3mbVQ3cW4oPpaXGbcbo9veT9LgqsFTyRF5V5MDw6t
 h6HOwiDj4R7hIZnZYw3YSP24RxUHpxmf0peajHN8swFwfcWweeWL41p9BIqXw4BuvZ
 HWOHEzFOceiIDOedYMTVw0tLK9IvknIMfWMwJ4Ak=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F129C8B7AF;
 Tue,  3 Sep 2019 09:30:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id dIi89VWj3eRR; Tue,  3 Sep 2019 09:30:31 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BF4558B777;
 Tue,  3 Sep 2019 09:30:30 +0200 (CEST)
Subject: Re: [PATCH v2 4/6] powerpc: Chunk calls to flush_dcache_range in
 arch_*_memory
To: Alastair D'Silva <alastair@au1.ibm.com>
References: <20190903052407.16638-1-alastair@au1.ibm.com>
 <20190903052407.16638-5-alastair@au1.ibm.com>
 <3bde4dbc-5176-0df5-a0bf-993eef2a333b@c-s.fr>
 <f49d3a861ecd35b5c62ea1cd96a88751a3ad3649.camel@au1.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <aaea79e3-c0af-1a0c-f1c3-d8b12b3c2bb7@c-s.fr>
Date: Tue, 3 Sep 2019 08:51:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f49d3a861ecd35b5c62ea1cd96a88751a3ad3649.camel@au1.ibm.com>
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
Cc: Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Qian Cai <cai@lca.pw>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 03/09/2019 à 08:25, Alastair D'Silva a écrit :
> On Tue, 2019-09-03 at 08:19 +0200, Christophe Leroy wrote:
>>
>> Le 03/09/2019 à 07:23, Alastair D'Silva a écrit :
>>> From: Alastair D'Silva <alastair@d-silva.org>
>>>
>>> When presented with large amounts of memory being hotplugged
>>> (in my test case, ~890GB), the call to flush_dcache_range takes
>>> a while (~50 seconds), triggering RCU stalls.
>>>
>>> This patch breaks up the call into 1GB chunks, calling
>>> cond_resched() inbetween to allow the scheduler to run.
>>>
>>> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
>>> ---
>>>    arch/powerpc/mm/mem.c | 18 ++++++++++++++++--
>>>    1 file changed, 16 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
>>> index cd540123874d..854aaea2c6ae 100644
>>> --- a/arch/powerpc/mm/mem.c
>>> +++ b/arch/powerpc/mm/mem.c
>>> @@ -104,11 +104,14 @@ int __weak remove_section_mapping(unsigned
>>> long start, unsigned long end)
>>>    	return -ENODEV;
>>>    }
>>>    
>>> +#define FLUSH_CHUNK_SIZE SZ_1G
>>
>> Maybe the name is a bit long for a local define. See if we could
>> reduce
>> code line splits below by shortening this name.
>>
>>> +
>>>    int __ref arch_add_memory(int nid, u64 start, u64 size,
>>>    			struct mhp_restrictions *restrictions)
>>>    {
>>>    	unsigned long start_pfn = start >> PAGE_SHIFT;
>>>    	unsigned long nr_pages = size >> PAGE_SHIFT;
>>> +	u64 i;
>>>    	int rc;
>>>    
>>>    	resize_hpt_for_hotplug(memblock_phys_mem_size());
>>> @@ -120,7 +123,12 @@ int __ref arch_add_memory(int nid, u64 start,
>>> u64 size,
>>>    			start, start + size, rc);
>>>    		return -EFAULT;
>>>    	}
>>> -	flush_dcache_range(start, start + size);
>>> +
>>> +	for (i = 0; i < size; i += FLUSH_CHUNK_SIZE) {
>>> +		flush_dcache_range(start + i,
>>> +				   min(start + size, start + i +
>>> FLUSH_CHUNK_SIZE));
>>
>> My eyes don't like it.
>>
>> What about
>> 	for (; i < size; i += FLUSH_CHUNK_SIZE) {
>> 		int len = min(size - i, FLUSH_CHUNK_SIZE);
>>
>> 		flush_dcache_range(start + i, start + i + len);
>> 		cond_resched();
>> 	}
>>
>> or
>>
>> 	end = start + size;
>> 	for (; start < end; start += FLUSH_CHUNK_SIZE, size -=
>> FLUSH_CHUNK_SIZE) {
>> 		int len = min(size, FLUSH_CHUNK_SIZE);
>>
>> 		flush_dcache_range(start, start + len);
>> 		cond_resched();
>> 	}
>>
>>> +		cond_resched();
>>> +	}
>>>    
>>>    	return __add_pages(nid, start_pfn, nr_pages, restrictions);
>>>    }
>>> @@ -131,13 +139,19 @@ void __ref arch_remove_memory(int nid, u64
>>> start, u64 size,
>>>    	unsigned long start_pfn = start >> PAGE_SHIFT;
>>>    	unsigned long nr_pages = size >> PAGE_SHIFT;
>>>    	struct page *page = pfn_to_page(start_pfn) +
>>> vmem_altmap_offset(altmap);
>>> +	u64 i;
>>>    	int ret;
>>>    
>>>    	__remove_pages(page_zone(page), start_pfn, nr_pages, altmap);
>>>    
>>>    	/* Remove htab bolted mappings for this section of memory */
>>>    	start = (unsigned long)__va(start);
>>> -	flush_dcache_range(start, start + size);
>>> +	for (i = 0; i < size; i += FLUSH_CHUNK_SIZE) {
>>> +		flush_dcache_range(start + i,
>>> +				   min(start + size, start + i +
>>> FLUSH_CHUNK_SIZE));
>>> +		cond_resched();
>>> +	}
>>> +
>>
>> This piece of code looks pretty similar to the one before. Can we
>> refactor into a small helper ?
>>
> 
> Not much point, it's removed in a subsequent patch.
> 

But you tell me that you leave to people the opportunity to not apply 
that subsequent patch, and that's the reason you didn't put that patch 
before this one. In that case adding a helper is worth it.

Christophe
