Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F9E46EEB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 10:08:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QqqJ67nnzDrfS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 18:08:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="CFZCdvS6"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Qqnh6BlYzDrX4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2019 18:07:02 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45QqnX6hxKz9v0F9;
 Sat, 15 Jun 2019 10:06:56 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=CFZCdvS6; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id hc2rOByaNF3V; Sat, 15 Jun 2019 10:06:56 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45QqnX5Gqkz9v0F8;
 Sat, 15 Jun 2019 10:06:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560586016; bh=1p6s1wDC21lFcLrW9LHAqnn+cIQAnQKI/I9iSnqTFsU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=CFZCdvS6Gn44Gms6CdPAgtpa9H53SYlJJFfS68xOIrkZxayPk64IgDJI88xDV354W
 YUTg0/LxuR+UPAdtUprz+7sTpVdF78EI+TcFZzuJjZLj1OU2Oi01DPmjcAOipLL3Gq
 9wjMJkVHKam+/9rCfdG+6q/sqIpKw2+fLOUwJHCI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BA5A58B7B3;
 Sat, 15 Jun 2019 10:06:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id FwFmC_wRUTFQ; Sat, 15 Jun 2019 10:06:57 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 96D348B77A;
 Sat, 15 Jun 2019 10:06:56 +0200 (CEST)
Subject: Re: [PATCH v1 1/6] mm: Section numbers use the type "unsigned long"
To: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>
References: <20190614100114.311-1-david@redhat.com>
 <20190614100114.311-2-david@redhat.com>
 <20190614120036.00ae392e3f210e7bc9ec6960@linux-foundation.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <701e8feb-cbf8-04c1-758c-046da9394ac1@c-s.fr>
Date: Sat, 15 Jun 2019 10:06:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614120036.00ae392e3f210e7bc9ec6960@linux-foundation.org>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Michal Hocko <mhocko@suse.com>,
 Pavel Tatashin <pasha.tatashin@oracle.com>, linux-acpi@vger.kernel.org,
 Baoquan He <bhe@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Wei Yang <richard.weiyang@gmail.com>,
 linux-mm@kvack.org, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Arun KS <arunks@codeaurora.org>, Johannes Weiner <hannes@cmpxchg.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Mel Gorman <mgorman@techsingularity.net>, Vlastimil Babka <vbabka@suse.cz>,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 14/06/2019 à 21:00, Andrew Morton a écrit :
> On Fri, 14 Jun 2019 12:01:09 +0200 David Hildenbrand <david@redhat.com> wrote:
> 
>> We are using a mixture of "int" and "unsigned long". Let's make this
>> consistent by using "unsigned long" everywhere. We'll do the same with
>> memory block ids next.
>>
>> ...
>>
>> -	int i, ret, section_count = 0;
>> +	unsigned long i;
>>
>> ...
>>
>> -	unsigned int i;
>> +	unsigned long i;
> 
> Maybe I did too much fortran back in the day, but I think the
> expectation is that a variable called "i" has type "int".
> 
> This?
> 
> 
> 
> s/unsigned long i/unsigned long section_nr/

 From my point of view you degrade readability by doing that.

section_nr_to_pfn(mem->start_section_nr + section_nr);

Three times the word 'section_nr' in one line, is that worth it ? Gives 
me headache.

Codying style says the following, which makes full sense in my opinion:

LOCAL variable names should be short, and to the point.  If you have
some random integer loop counter, it should probably be called ``i``.
Calling it ``loop_counter`` is non-productive, if there is no chance of it
being mis-understood.

What about just naming it 'nr' if we want to use something else than 'i' ?

Christophe


> 
> --- a/drivers/base/memory.c~mm-section-numbers-use-the-type-unsigned-long-fix
> +++ a/drivers/base/memory.c
> @@ -131,17 +131,17 @@ static ssize_t phys_index_show(struct de
>   static ssize_t removable_show(struct device *dev, struct device_attribute *attr,
>   			      char *buf)
>   {
> -	unsigned long i, pfn;
> +	unsigned long section_nr, pfn;
>   	int ret = 1;
>   	struct memory_block *mem = to_memory_block(dev);
>   
>   	if (mem->state != MEM_ONLINE)
>   		goto out;
>   
> -	for (i = 0; i < sections_per_block; i++) {
> -		if (!present_section_nr(mem->start_section_nr + i))
> +	for (section_nr = 0; section_nr < sections_per_block; section_nr++) {
> +		if (!present_section_nr(mem->start_section_nr + section_nr))
>   			continue;
> -		pfn = section_nr_to_pfn(mem->start_section_nr + i);
> +		pfn = section_nr_to_pfn(mem->start_section_nr + section_nr);
>   		ret &= is_mem_section_removable(pfn, PAGES_PER_SECTION);
>   	}
>   
> @@ -695,12 +695,12 @@ static int add_memory_block(unsigned lon
>   {
>   	int ret, section_count = 0;
>   	struct memory_block *mem;
> -	unsigned long i;
> +	unsigned long section_nr;
>   
> -	for (i = base_section_nr;
> -	     i < base_section_nr + sections_per_block;
> -	     i++)
> -		if (present_section_nr(i))
> +	for (section_nr = base_section_nr;
> +	     section_nr < base_section_nr + sections_per_block;
> +	     section_nr++)
> +		if (present_section_nr(section_nr))
>   			section_count++;
>   
>   	if (section_count == 0)
> @@ -823,7 +823,7 @@ static const struct attribute_group *mem
>    */
>   int __init memory_dev_init(void)
>   {
> -	unsigned long i;
> +	unsigned long section_nr;
>   	int ret;
>   	int err;
>   	unsigned long block_sz;
> @@ -840,9 +840,9 @@ int __init memory_dev_init(void)
>   	 * during boot and have been initialized
>   	 */
>   	mutex_lock(&mem_sysfs_mutex);
> -	for (i = 0; i <= __highest_present_section_nr;
> -		i += sections_per_block) {
> -		err = add_memory_block(i);
> +	for (section_nr = 0; section_nr <= __highest_present_section_nr;
> +		section_nr += sections_per_block) {
> +		err = add_memory_block(section_nr);
>   		if (!ret)
>   			ret = err;
>   	}
> _
> 
