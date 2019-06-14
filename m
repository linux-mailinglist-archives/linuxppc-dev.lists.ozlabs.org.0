Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D5346833
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 21:37:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QW893NK6zDrgr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 05:36:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=redhat.com
 (client-ip=209.132.183.28; helo=mx1.redhat.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45QW656GwVzDrgZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2019 05:35:08 +1000 (AEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DF3793092645;
 Fri, 14 Jun 2019 19:35:04 +0000 (UTC)
Received: from [10.36.116.43] (ovpn-116-43.ams2.redhat.com [10.36.116.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 955E519C67;
 Fri, 14 Jun 2019 19:35:00 +0000 (UTC)
Subject: Re: [PATCH v1 1/6] mm: Section numbers use the type "unsigned long"
To: Andrew Morton <akpm@linux-foundation.org>
References: <20190614100114.311-1-david@redhat.com>
 <20190614100114.311-2-david@redhat.com>
 <20190614120036.00ae392e3f210e7bc9ec6960@linux-foundation.org>
From: David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <e07449fa-251f-51c7-9ee2-202635c4aef7@redhat.com>
Date: Fri, 14 Jun 2019 21:34:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614120036.00ae392e3f210e7bc9ec6960@linux-foundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Fri, 14 Jun 2019 19:35:05 +0000 (UTC)
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
 Mel Gorman <mgorman@techsingularity.net>, Baoquan He <bhe@redhat.com>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 Wei Yang <richard.weiyang@gmail.com>, linux-acpi@vger.kernel.org,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Arun KS <arunks@codeaurora.org>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Pavel Tatashin <pasha.tatashin@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 14.06.19 21:00, Andrew Morton wrote:
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

t460s: ~/git/linux memory_block_devices2 $ git grep "unsigned long i;" |
wc -l
245
t460s: ~/git/linux memory_block_devices2 $ git grep "int i;" | wc -l
26827

Yes ;)

While it makes sense for the second and third occurrence, I think for
the first one it could be confusing (it's not actually a section number
but a counter for sections_per_block).

I see just now that we can avoid converting the first occurrence
completely. So maybe we should drop changing removable_show() from this
patch.

Cheers!

> 
> 
> 
> s/unsigned long i/unsigned long section_nr/
> 
> --- a/drivers/base/memory.c~mm-section-numbers-use-the-type-unsigned-long-fix
> +++ a/drivers/base/memory.c
> @@ -131,17 +131,17 @@ static ssize_t phys_index_show(struct de
>  static ssize_t removable_show(struct device *dev, struct device_attribute *attr,
>  			      char *buf)
>  {
> -	unsigned long i, pfn;
> +	unsigned long section_nr, pfn;
>  	int ret = 1;
>  	struct memory_block *mem = to_memory_block(dev);
>  
>  	if (mem->state != MEM_ONLINE)
>  		goto out;
>  
> -	for (i = 0; i < sections_per_block; i++) {
> -		if (!present_section_nr(mem->start_section_nr + i))
> +	for (section_nr = 0; section_nr < sections_per_block; section_nr++) {
> +		if (!present_section_nr(mem->start_section_nr + section_nr))
>  			continue;
> -		pfn = section_nr_to_pfn(mem->start_section_nr + i);
> +		pfn = section_nr_to_pfn(mem->start_section_nr + section_nr);
>  		ret &= is_mem_section_removable(pfn, PAGES_PER_SECTION);
>  	}
>  
> @@ -695,12 +695,12 @@ static int add_memory_block(unsigned lon
>  {
>  	int ret, section_count = 0;
>  	struct memory_block *mem;
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
>  			section_count++;
>  
>  	if (section_count == 0)
> @@ -823,7 +823,7 @@ static const struct attribute_group *mem
>   */
>  int __init memory_dev_init(void)
>  {
> -	unsigned long i;
> +	unsigned long section_nr;
>  	int ret;
>  	int err;
>  	unsigned long block_sz;
> @@ -840,9 +840,9 @@ int __init memory_dev_init(void)
>  	 * during boot and have been initialized
>  	 */
>  	mutex_lock(&mem_sysfs_mutex);
> -	for (i = 0; i <= __highest_present_section_nr;
> -		i += sections_per_block) {
> -		err = add_memory_block(i);
> +	for (section_nr = 0; section_nr <= __highest_present_section_nr;
> +		section_nr += sections_per_block) {
> +		err = add_memory_block(section_nr);
>  		if (!ret)
>  			ret = err;
>  	}
> _
> 


-- 

Thanks,

David / dhildenb
