Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9173E5B635
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 09:57:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45cfqj2CWMzDqTx
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 17:57:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=mhocko@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45cfnv0NJhzDqDh
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2019 17:56:18 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9AD85AEBD;
 Mon,  1 Jul 2019 07:56:15 +0000 (UTC)
Date: Mon, 1 Jul 2019 09:56:15 +0200
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 05/11] drivers/base/memory: Pass a block_id to
 init_memory_block()
Message-ID: <20190701075615.GE6376@dhcp22.suse.cz>
References: <20190527111152.16324-1-david@redhat.com>
 <20190527111152.16324-6-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527111152.16324-6-david@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-s390@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
 Igor Mammedov <imammedo@redhat.com>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon 27-05-19 13:11:46, David Hildenbrand wrote:
> We'll rework hotplug_memory_register() shortly, so it no longer consumes
> pass a section.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Acked-by: Michal Hocko <mhocko@suse.com>

> ---
>  drivers/base/memory.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/base/memory.c b/drivers/base/memory.c
> index f180427e48f4..f914fa6fe350 100644
> --- a/drivers/base/memory.c
> +++ b/drivers/base/memory.c
> @@ -651,21 +651,18 @@ int register_memory(struct memory_block *memory)
>  	return ret;
>  }
>  
> -static int init_memory_block(struct memory_block **memory,
> -			     struct mem_section *section, unsigned long state)
> +static int init_memory_block(struct memory_block **memory, int block_id,
> +			     unsigned long state)
>  {
>  	struct memory_block *mem;
>  	unsigned long start_pfn;
> -	int scn_nr;
>  	int ret = 0;
>  
>  	mem = kzalloc(sizeof(*mem), GFP_KERNEL);
>  	if (!mem)
>  		return -ENOMEM;
>  
> -	scn_nr = __section_nr(section);
> -	mem->start_section_nr =
> -			base_memory_block_id(scn_nr) * sections_per_block;
> +	mem->start_section_nr = block_id * sections_per_block;
>  	mem->end_section_nr = mem->start_section_nr + sections_per_block - 1;
>  	mem->state = state;
>  	start_pfn = section_nr_to_pfn(mem->start_section_nr);
> @@ -694,7 +691,8 @@ static int add_memory_block(int base_section_nr)
>  
>  	if (section_count == 0)
>  		return 0;
> -	ret = init_memory_block(&mem, __nr_to_section(section_nr), MEM_ONLINE);
> +	ret = init_memory_block(&mem, base_memory_block_id(base_section_nr),
> +				MEM_ONLINE);
>  	if (ret)
>  		return ret;
>  	mem->section_count = section_count;
> @@ -707,6 +705,7 @@ static int add_memory_block(int base_section_nr)
>   */
>  int hotplug_memory_register(int nid, struct mem_section *section)
>  {
> +	int block_id = base_memory_block_id(__section_nr(section));
>  	int ret = 0;
>  	struct memory_block *mem;
>  
> @@ -717,7 +716,7 @@ int hotplug_memory_register(int nid, struct mem_section *section)
>  		mem->section_count++;
>  		put_device(&mem->dev);
>  	} else {
> -		ret = init_memory_block(&mem, section, MEM_OFFLINE);
> +		ret = init_memory_block(&mem, block_id, MEM_OFFLINE);
>  		if (ret)
>  			goto out;
>  		mem->section_count++;
> -- 
> 2.20.1

-- 
Michal Hocko
SUSE Labs
