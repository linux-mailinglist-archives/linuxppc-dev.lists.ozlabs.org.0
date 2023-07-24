Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7793D75F9F5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 16:34:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hC4layOn;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hC4layOn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8jNd2kH0z303d
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 00:34:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hC4layOn;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hC4layOn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8jMn2cDpz2xgp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:33:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690209234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QuAwZXj3hY8+uff4gHFej9mLNWJqFkLD2znR2KTvWws=;
	b=hC4layOn+WeJn+A2qkQDgoOKU/5MN5HuQoO+T+g9J349gkisHf6ffM+R83zFclT2pVVV+I
	KcLKamKG+3vZ6xpPvCgimR4AMbPnyP91vwgWlFN+gaooy0GKPt+Z3CU/lg0spM/th4i3ix
	6T4DPmCE7p2YdQE1f16JZjWMT5khv/w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690209234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QuAwZXj3hY8+uff4gHFej9mLNWJqFkLD2znR2KTvWws=;
	b=hC4layOn+WeJn+A2qkQDgoOKU/5MN5HuQoO+T+g9J349gkisHf6ffM+R83zFclT2pVVV+I
	KcLKamKG+3vZ6xpPvCgimR4AMbPnyP91vwgWlFN+gaooy0GKPt+Z3CU/lg0spM/th4i3ix
	6T4DPmCE7p2YdQE1f16JZjWMT5khv/w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-3Zn9-mJPP6ihnw9ke16Q_w-1; Mon, 24 Jul 2023 10:33:53 -0400
X-MC-Unique: 3Zn9-mJPP6ihnw9ke16Q_w-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-31400956ce8so2158079f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jul 2023 07:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690209232; x=1690814032;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QuAwZXj3hY8+uff4gHFej9mLNWJqFkLD2znR2KTvWws=;
        b=Tz3F6HgfkaJ5vbvKQKAcg7kxbxm8rSOJOULAin6+EEtw3n1pJ94RTWryyN6l3K0w0u
         2jiU5zRBOD19r2THPfmF2keL2l2RO0pPmNzo2aKOPiVugtIZL9uS10iGWaXBtiCjrg6a
         O8s8hBh3b2kmiAdwZ0lyFpL9iKoREggOE2HzOII6WblwkT+bR11CLqLH7KK8lMFw4RpW
         AA+8udVr5gK6ihDasQM0VBGc4lJ0gjEG5l5WRQCohv0QMastWa1+i6V+FcwHyudEQqV0
         X0VQPiiC4J51x9ERC6JNqGPzXp/Al7ALCXMYxyHljXxzLNNE+cR9AwZG4OWaeibioK91
         8lvQ==
X-Gm-Message-State: ABy/qLa0O59piTy+dugP5dnDrcCYlPRrACs7E6qKae2DHUAgPQBqK3Hj
	L0X+fy2j5fbqv8ZY4Iz3lt/XEm48BnxqJWjqSOSypVDrUsVWy5gpgg3zfWdMhSvgGUwb3+lGtqK
	dXXveCftd7wrB7OBq9i7VtuOiY+z72wfGug==
X-Received: by 2002:adf:e70d:0:b0:313:ede8:9f13 with SMTP id c13-20020adfe70d000000b00313ede89f13mr6911137wrm.32.1690209231982;
        Mon, 24 Jul 2023 07:33:51 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEPtHEZfW45h1GMyO5AvAf8f8oOZ5lizueDmlksmAWhGklwwVI9CZukkB7lJTtAERgsDlMM9Q==
X-Received: by 2002:adf:e70d:0:b0:313:ede8:9f13 with SMTP id c13-20020adfe70d000000b00313ede89f13mr6911119wrm.32.1690209231524;
        Mon, 24 Jul 2023 07:33:51 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73d:bb00:91a5:d1c:3a7e:4c77? (p200300cbc73dbb0091a50d1c3a7e4c77.dip0.t-ipconnect.de. [2003:cb:c73d:bb00:91a5:d1c:3a7e:4c77])
        by smtp.gmail.com with ESMTPSA id a23-20020a5d4577000000b00314315071bbsm13111541wrc.38.2023.07.24.07.33.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 07:33:51 -0700 (PDT)
Message-ID: <f9597236-866d-17cd-d549-938ea80eacbe@redhat.com>
Date: Mon, 24 Jul 2023 16:33:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230718024409.95742-1-aneesh.kumar@linux.ibm.com>
 <20230718024409.95742-5-aneesh.kumar@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v4 4/6] mm/hotplug: Allow pageblock alignment via altmap
 reservation
In-Reply-To: <20230718024409.95742-5-aneesh.kumar@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Vishal Verma <vishal.l.verma@intel.com>, Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 18.07.23 04:44, Aneesh Kumar K.V wrote:
> Add a new kconfig option that can be selected if we want to allow

That description seems outdated.

> pageblock alignment by reserving pages in the vmemmap altmap area.
> This implies we will be reserving some pages for every memoryblock
> This also allows the memmap on memory feature to be widely useful
> with different memory block size values.

Can you add some more meat to the description, and especially, in
which cases this might be desired and in which cases it might be
completely undesired?


Let's assume we hotplug a 1 GiB DIMM on arm64/64k. With 512 MiB pageblocks,
we'd waste 50% of the hotplugged memory.

Also, see below on the case where we could end up with 100% wasted memory,
which we want to block compeltely.


Also, I wonder if we can avoid talking about "page reservation" or "altmap reservation",
that's rather an implementation detail.

For example, I'd call this patch

"mm/hotplug: Support memmap_on_memory when memmap is not aligned to pageblocks"



> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>   mm/memory_hotplug.c | 109 ++++++++++++++++++++++++++++++++++++++------
>   1 file changed, 96 insertions(+), 13 deletions(-)
> 
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 5921c81fcb70..c409f5ff6a59 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -41,17 +41,85 @@
>   #include "internal.h"
>   #include "shuffle.h"
>   
> +enum {
> +	MEMMAP_ON_MEMORY_DISABLE = 0,
> +	MEMMAP_ON_MEMORY_ENABLE,
> +	MEMMAP_ON_MEMORY_FORCE,
> +};
> +
> +static int memmap_mode __read_mostly = MEMMAP_ON_MEMORY_DISABLE;
> +
> +static inline unsigned long memory_block_align_base(unsigned long size)
> +{

Can we start with something like this instead?

memory_block_memmap_size() might be reasonable to put into the previous patch.


static inline unsigned long memory_block_memmap_size(void)
{
	return PHYS_PFN(memory_block_size_bytes()) * sizeof(struct page);
}

/*
  * In "forced" memmap_on_memory mode, we always align the vmemmap size up to cover
  * full pageblocks. That way, we can add memory even if the vmemmap size is not properly
  * aligned, however, we might waste memory.
  */
static inline unsigned long memory_block_memmap_on_memory_size(void)
{
	unsigned long size = memory_block_memmap_size();

	if (memmap_mode != MEMMAP_ON_MEMORY_FORCE)
		return size;
	return ALIGN(size, PFN_PHYS(pageblock_nr_pages));
}
	


> +	if (memmap_mode == MEMMAP_ON_MEMORY_FORCE) {
> +		unsigned long align;
> +		unsigned long nr_vmemmap_pages = size >> PAGE_SHIFT;
> +		unsigned long vmemmap_size;
> +
> +		vmemmap_size = DIV_ROUND_UP(nr_vmemmap_pages * sizeof(struct page), PAGE_SIZE);
> +		align = pageblock_align(vmemmap_size) - vmemmap_size;
> +		return align;
> +	} else
> +		return 0;
> +}
> +
>   #ifdef CONFIG_MHP_MEMMAP_ON_MEMORY
>   /*
>    * memory_hotplug.memmap_on_memory parameter
>    */
> -static bool memmap_on_memory __ro_after_init;
> -module_param(memmap_on_memory, bool, 0444);
> -MODULE_PARM_DESC(memmap_on_memory, "Enable memmap on memory for memory hotplug");
> +static int set_memmap_mode(const char *val, const struct kernel_param *kp)
> +{
> +	int ret, mode;
> +	bool enabled;
> +
> +	if (sysfs_streq(val, "force") ||  sysfs_streq(val, "FORCE")) {
> +		mode =  MEMMAP_ON_MEMORY_FORCE;
> +		goto matched;
> +	}
> +
> +	ret = kstrtobool(val, &enabled);
> +	if (ret < 0)
> +		return ret;
> +	if (enabled)
> +		mode =  MEMMAP_ON_MEMORY_ENABLE;
> +	else
> +		mode =  MEMMAP_ON_MEMORY_DISABLE;
> +
> +matched:
> +	*((int *)kp->arg) =  mode;
> +	if (mode == MEMMAP_ON_MEMORY_FORCE) {
> +		pr_info("Memory hotplug will reserve %ld pages in each memory block\n",
> +			memory_block_align_base(memory_block_size_bytes()));
> +	}
> +	return 0;
> +}
> +
> +static int get_memmap_mode(char *buffer, const struct kernel_param *kp)
> +{
> +	if (*((int *)kp->arg) == MEMMAP_ON_MEMORY_FORCE)
> +		return sprintf(buffer,  "force\n");
> +	if (*((int *)kp->arg) == MEMMAP_ON_MEMORY_ENABLE)
> +		return sprintf(buffer,  "y\n");
> +
> +	return sprintf(buffer,  "n\n");

param_get_bool() uses uppercase Y / N. Maybe just return the uppercase variants here as well.

> +}
> +
> +static const struct kernel_param_ops memmap_mode_ops = {
> +	.set = set_memmap_mode,
> +	.get = get_memmap_mode,
> +};
> +module_param_cb(memmap_on_memory, &memmap_mode_ops, &memmap_mode, 0444);
> +MODULE_PARM_DESC(memmap_on_memory, "Enable memmap on memory for memory hotplug\n"
> +	"With value \"force\" it could result in memory wastage due to memmap size limitations \n"
> +	"For example, if the memmap for a memory block requires 1 MiB, but the pageblock \n"
> +	"size is 2 MiB, 1 MiB of hotplugged memory will be wasted. Note that there are \n"
> +	"still cases where the feature cannot be enforced: for example, if the memmap is \n"
> +	"smaller than a single page, or if the architecture does not support the forced \n"
> +	"mode in all configurations. (y/n/force)");

That's a bit mouthful. Can we simplify and put the full doc into

Documentation/admin-guide/mm/memory-hotplug.rst

?

>   
>   static inline bool mhp_memmap_on_memory(void)
>   {
> -	return memmap_on_memory;
> +	return !!memmap_mode;

Maybe better  "memmap_mode != MEMMAP_ON_MEMORY_DISABLE"

>   }
>   #else
>   static inline bool mhp_memmap_on_memory(void)
> @@ -1264,7 +1332,6 @@ static inline bool arch_supports_memmap_on_memory(unsigned long size)
>   
>   static bool mhp_supports_memmap_on_memory(unsigned long size)
>   {
> -
>   	unsigned long nr_vmemmap_pages = size >> PAGE_SHIFT;
>   	unsigned long vmemmap_size = nr_vmemmap_pages * sizeof(struct page);
>   	unsigned long remaining_size = size - vmemmap_size;
> @@ -1295,10 +1362,23 @@ static bool mhp_supports_memmap_on_memory(unsigned long size)
>   	 *       altmap as an alternative source of memory, and we do not exactly
>   	 *       populate a single PMD.
>   	 */
> -	return mhp_memmap_on_memory() &&
> -	       size == memory_block_size_bytes() &&
> -	       IS_ALIGNED(remaining_size, (pageblock_nr_pages << PAGE_SHIFT)) &&
> -	       arch_supports_memmap_on_memory(size);
> +	if (!mhp_memmap_on_memory() || size != memory_block_size_bytes())
> +		return false;
> +
> +	/*
> +	 * Make sure the vmemmap allocation is fully contained
> +	 * so that we always allocate vmemmap memory from altmap area.
> +	 */
> +	if (!IS_ALIGNED(vmemmap_size,  PAGE_SIZE))
> +		return false;
> +	 /*
> +	  * Without page reservation remaining pages should be pageblock aligned.
> +	  */
> +	if (memmap_mode != MEMMAP_ON_MEMORY_FORCE &&
> +	    !IS_ALIGNED(remaining_size, (pageblock_nr_pages << PAGE_SHIFT)))
> +		return false;

With our new helper, this becomes the following:

memmap_on_memory_size = memory_block_memmap_on_memory_size();

if (!IS_ALIGNED(memmap_on_memory_size, PFN_PHYS(pageblock_nr_pages))
	/* We're not allowed to waste any memory for the memmap. */
	return false;

if (memmap_on_memory_size == memory_block_size_bytes())
	/* No effective hotplugged memory doesn't make sense. */
	return false;	

> +	return arch_supports_memmap_on_memory(size);
>   }
>   
>   /*
> @@ -1311,7 +1391,11 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
>   {
>   	struct mhp_params params = { .pgprot = pgprot_mhp(PAGE_KERNEL) };
>   	enum memblock_flags memblock_flags = MEMBLOCK_NONE;
> -	struct vmem_altmap mhp_altmap = {};
> +	struct vmem_altmap mhp_altmap = {
> +		.base_pfn =  PHYS_PFN(res->start),
> +		.end_pfn  =  PHYS_PFN(res->end),
> +		.reserve  = memory_block_align_base(resource_size(res)),

Can you remind me why we have to set reserve here at all?

IOW, can't we simply set

.free = memory_block_memmap_on_memory_size();

end then pass

mhp_altmap.alloc + mhp_altmap.free

to create_memory_block_devices() instead?


-- 
Cheers,

David / dhildenb

