Return-Path: <linuxppc-dev+bounces-7219-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D17EA6966F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Mar 2025 18:29:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHwgk2ZY9z2xGp;
	Thu, 20 Mar 2025 04:29:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742405378;
	cv=none; b=aTTugwdQVKnPGguUp9MesMQVzLpYY0uLXtecucavj+5CLlUZ/cAofJkMAwFaRw9g000AcuI2SQMJxKySBMTO3NQG468wdWyUCdW8By1rJuYPD34IWhR+KKpY0+RHgu1BNuIFkD03kzyOhCjyQ6DJ77kywZenrNrH8yDjjEYJCPPhS9lUIXpuQHfJWdSE981GO73WhOVe1J0wMbMbEG7GFyWjuiY027K+YxG9rKx1ImayA4nJuJ/1Ufjz2YJZBmGuOLrymoUwObPmApfz3r7/j+W3ktonuEfdo+zCLWOptpdTNlYeCCwPG8GrcQjSTdhH07yFmKHsGtskjtNYlcFVqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742405378; c=relaxed/relaxed;
	bh=vMrYu1osGr7V6A5J0GJf4oN8siwZ0RnsLRJLACTdmTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bslm/3uyOuCRWbQPukW7RazL9n3vJY0f0vOFhlg6MIthYJwD+GW8m6hV3oeoc/uZt6Gj3moyvV5fpHApL5DEOQx5bMvUdcmug2/85G9qmFeITNI/b2Lcb53GcSgId97wrZcpuyXnsrYSGnrpZ9XoE3CTFVdXhtNTaYw+DftXf+Vptb68cmo47fOiXWkwXeMt8GHd/nqWGlnxyG5HFBm9oj+0LDhn7CfPeJ8lKiG9hfGjgWrUy0jnwS8B4ClUzG4xz5WhIIyRCxTwXrUgJo4MlX/AYASu1fAF7uc2KAorC3n+BT9LkvxP6SQOyUPWqA+aN+WF0kimHC65w1edAP1CuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wIBWcptd; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=mhSjOK8v; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wIBWcptd; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=mhSjOK8v; dkim-atps=neutral; spf=pass (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wIBWcptd;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=mhSjOK8v;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wIBWcptd;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=mhSjOK8v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHwgf4jvkz2ySW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Mar 2025 04:29:34 +1100 (AEDT)
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 07F6021F4D;
	Wed, 19 Mar 2025 17:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742405371; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vMrYu1osGr7V6A5J0GJf4oN8siwZ0RnsLRJLACTdmTY=;
	b=wIBWcptdGL+wkdTnuRmjJXC5snJGbMWIVCxqbn4wIIeDRVC6KrF/+knh7WpDye1AppidiY
	oNnP7wAOwinz/S8kaqmYKPtVBmudI4p92iT9mxxa37UvjtdFWE9R78N+1335L82mEYL9fl
	Ph/m6w+67nMRNXkoR8w7Ivs6dU8SdFA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742405371;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vMrYu1osGr7V6A5J0GJf4oN8siwZ0RnsLRJLACTdmTY=;
	b=mhSjOK8vSII2RfD2Z5FNo8udjoZhtjLW5cncFRKciXlruiXhPe8UnU/jpdU9VmR1lTs5Nl
	mM3BuhZTKoi/brCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742405371; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vMrYu1osGr7V6A5J0GJf4oN8siwZ0RnsLRJLACTdmTY=;
	b=wIBWcptdGL+wkdTnuRmjJXC5snJGbMWIVCxqbn4wIIeDRVC6KrF/+knh7WpDye1AppidiY
	oNnP7wAOwinz/S8kaqmYKPtVBmudI4p92iT9mxxa37UvjtdFWE9R78N+1335L82mEYL9fl
	Ph/m6w+67nMRNXkoR8w7Ivs6dU8SdFA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742405371;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vMrYu1osGr7V6A5J0GJf4oN8siwZ0RnsLRJLACTdmTY=;
	b=mhSjOK8vSII2RfD2Z5FNo8udjoZhtjLW5cncFRKciXlruiXhPe8UnU/jpdU9VmR1lTs5Nl
	mM3BuhZTKoi/brCQ==
Date: Wed, 19 Mar 2025 18:29:29 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Gaurav Batra <gbatra@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, donettom@linux.ibm.com
Subject: Re: [PATCH] powerpc/pseries/iommu: memory notifier incorrectly adds
 TCEs for pmemory
Message-ID: <Z9r--U_INHB4RjXI@kitsune.suse.cz>
References: <20250130183854.92258-1-gbatra@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250130183854.92258-1-gbatra@linux.ibm.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nongnu.org:url]
X-Spam-Score: -4.30
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello,

looks like this upsets some assumption qemu has about these windows.

https://lists.nongnu.org/archive/html/qemu-devel/2025-03/msg05137.html

When Linux kernel that has this patch applied is running inside a qemu
VM with a PCI device and the VM is rebooted qemu crashes shortly after
the next Linux kernel starts.

This is quite curious since qemu does AFAIK not support pmemory at all.

Any idea what went wrong there?

Thanks

Michal

On Thu, Jan 30, 2025 at 12:38:54PM -0600, Gaurav Batra wrote:
> iommu_mem_notifier() is invoked when RAM is dynamically added/removed. This
> notifier call is responsible to add/remove TCEs from the Dynamic DMA Window
> (DDW) when TCEs are pre-mapped. TCEs are pre-mapped only for RAM and not
> for persistent memory (pmemory). For DMA buffers in pmemory, TCEs are
> dynamically mapped when the device driver instructs to do so.
> 
> The issue is 'daxctl' command is capable of adding pmemory as "System RAM"
> after LPAR boot. The command to do so is -
> 
> daxctl reconfigure-device --mode=system-ram dax0.0 --force
> 
> This will dynamically add pmemory range to LPAR RAM eventually invoking
> iommu_mem_notifier(). The address range of pmemory is way beyond the Max
> RAM that the LPAR can have. Which means, this range is beyond the DDW
> created for the device, at device initialization time.
> 
> As a result when TCEs are pre-mapped for the pmemory range, by
> iommu_mem_notifier(), PHYP HCALL returns H_PARAMETER. This failed the
> command, daxctl, to add pmemory as RAM.
> 
> The solution is to not pre-map TCEs for pmemory.
> 
> Signed-off-by: Gaurav Batra <gbatra@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/mmzone.h      |  1 +
>  arch/powerpc/mm/numa.c                 |  2 +-
>  arch/powerpc/platforms/pseries/iommu.c | 29 ++++++++++++++------------
>  3 files changed, 18 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/mmzone.h b/arch/powerpc/include/asm/mmzone.h
> index d99863cd6cde..049152f8d597 100644
> --- a/arch/powerpc/include/asm/mmzone.h
> +++ b/arch/powerpc/include/asm/mmzone.h
> @@ -29,6 +29,7 @@ extern cpumask_var_t node_to_cpumask_map[];
>  #ifdef CONFIG_MEMORY_HOTPLUG
>  extern unsigned long max_pfn;
>  u64 memory_hotplug_max(void);
> +u64 hot_add_drconf_memory_max(void);
>  #else
>  #define memory_hotplug_max() memblock_end_of_DRAM()
>  #endif
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index 3c1da08304d0..603a0f652ba6 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -1336,7 +1336,7 @@ int hot_add_scn_to_nid(unsigned long scn_addr)
>  	return nid;
>  }
>  
> -static u64 hot_add_drconf_memory_max(void)
> +u64 hot_add_drconf_memory_max(void)
>  {
>  	struct device_node *memory = NULL;
>  	struct device_node *dn = NULL;
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index 29f1a0cc59cd..abd9529a8f41 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -1284,17 +1284,13 @@ static LIST_HEAD(failed_ddw_pdn_list);
>  
>  static phys_addr_t ddw_memory_hotplug_max(void)
>  {
> -	resource_size_t max_addr = memory_hotplug_max();
> -	struct device_node *memory;
> +	resource_size_t max_addr;
>  
> -	for_each_node_by_type(memory, "memory") {
> -		struct resource res;
> -
> -		if (of_address_to_resource(memory, 0, &res))
> -			continue;
> -
> -		max_addr = max_t(resource_size_t, max_addr, res.end + 1);
> -	}
> +#if defined(CONFIG_NUMA) && defined(CONFIG_MEMORY_HOTPLUG)
> +	max_addr = hot_add_drconf_memory_max();
> +#else
> +	max_addr = memblock_end_of_DRAM();
> +#endif
>  
>  	return max_addr;
>  }
> @@ -1600,7 +1596,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>  
>  	if (direct_mapping) {
>  		/* DDW maps the whole partition, so enable direct DMA mapping */
> -		ret = walk_system_ram_range(0, memblock_end_of_DRAM() >> PAGE_SHIFT,
> +		ret = walk_system_ram_range(0, ddw_memory_hotplug_max() >> PAGE_SHIFT,
>  					    win64->value, tce_setrange_multi_pSeriesLP_walk);
>  		if (ret) {
>  			dev_info(&dev->dev, "failed to map DMA window for %pOF: %d\n",
> @@ -2346,11 +2342,17 @@ static int iommu_mem_notifier(struct notifier_block *nb, unsigned long action,
>  	struct memory_notify *arg = data;
>  	int ret = 0;
>  
> +	/* This notifier can get called when onlining persistent memory as well.
> +	 * TCEs are not pre-mapped for persistent memory. Persistent memory will
> +	 * always be above ddw_memory_hotplug_max()
> +	 */
> +
>  	switch (action) {
>  	case MEM_GOING_ONLINE:
>  		spin_lock(&dma_win_list_lock);
>  		list_for_each_entry(window, &dma_win_list, list) {
> -			if (window->direct) {
> +			if (window->direct && (arg->start_pfn << PAGE_SHIFT) <
> +				ddw_memory_hotplug_max()) {
>  				ret |= tce_setrange_multi_pSeriesLP(arg->start_pfn,
>  						arg->nr_pages, window->prop);
>  			}
> @@ -2362,7 +2364,8 @@ static int iommu_mem_notifier(struct notifier_block *nb, unsigned long action,
>  	case MEM_OFFLINE:
>  		spin_lock(&dma_win_list_lock);
>  		list_for_each_entry(window, &dma_win_list, list) {
> -			if (window->direct) {
> +			if (window->direct && (arg->start_pfn << PAGE_SHIFT) <
> +				ddw_memory_hotplug_max()) {
>  				ret |= tce_clearrange_multi_pSeriesLP(arg->start_pfn,
>  						arg->nr_pages, window->prop);
>  			}
> 
> base-commit: 95ec54a420b8f445e04a7ca0ea8deb72c51fe1d3
> -- 
> 2.39.3 (Apple Git-146)
> 
> 

