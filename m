Return-Path: <linuxppc-dev+bounces-7342-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE1DA7196C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Mar 2025 15:53:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZN8tF3Bd6z2yr5;
	Thu, 27 Mar 2025 01:53:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743000805;
	cv=none; b=LV5g/K8F+qclViosVwi6YpIkT88d1QAZKf0dDlB+i0o74pFcL29audLbIRN4Eh963Hs6/PwtRux2EHvLcAAoM6lxmdR4+ZOuLSbmrZOgDWbxyECvKm7aHIfewrAHgy931WGhvvN2j3mzzzkCNQdxxpTqxXWhZVm+sv0LRNv8tPLQl5lhocTB+mrbjTce1ZyqD23FB9jsfoHFgRVpN7+y3QrLuIHxpm+MFzK1lXwZKPca5aKlwRxui5Fuem75FBcrpZWXGx7llgmibtnqgaajltcwA6vk2HXfuEzq7KSCT1A+Bz5M/cJ4oRG+NB6LmLFvk/mI/gANMADE+/Ue9V7iaw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743000805; c=relaxed/relaxed;
	bh=7HQSnfCMXTMBWOcw0XYfisM0NT/8ENm6SWaZ6ipbLxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MC5he3btPiXth4MlyciEMbtGueusDgS9pk79hCRDqwRStjE6w14xvc7b6HGaZC7HAi/ummIy1t+N1zZHoINfAP+btWhpiGcH4GUFnVZGZAUIB4Qh/RzUyHSlobpGK+E6JcC0Sss6o89NtuNySM6zETNH7ogiac6H3TmEnzT6zlmAAOKPshirDwnzCDw4Giul/FfBewqNw0CuJYRHNTruBSOjZHWTsZiNxkiHgHAs4HW/WYtZwyU+N5HFmiMZCrAeGaFQNBCwIamITgPrNQmqeSopDQtOVUH13/RbsEAD12ZB9TWnqVK0hpHD4aLPllLTEyQPZkxUEV7RQOiuZ1D6ig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=j17mEyhz; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=QZ0Egd7M; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=j17mEyhz; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=QZ0Egd7M; dkim-atps=neutral; spf=pass (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=j17mEyhz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=QZ0Egd7M;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=j17mEyhz;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=QZ0Egd7M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZN8tC4Q59z2ySh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Mar 2025 01:53:23 +1100 (AEDT)
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 738AE21175;
	Wed, 26 Mar 2025 14:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743000795; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7HQSnfCMXTMBWOcw0XYfisM0NT/8ENm6SWaZ6ipbLxI=;
	b=j17mEyhznoumRX/85Y/oKyK04gcySCr9bpPS/doAaCl5jSjjqXB4i08SrwW3EuNZdvOEbZ
	qPTaeIgcYPWwpyE/roAGFMPB4cQiZM1OIhHVd07dd38d8I9N6sqlLvmIgTXi/NsmiC6NOB
	GhF2ZC80djrK3aECV+n211lNRQYvbNQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743000795;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7HQSnfCMXTMBWOcw0XYfisM0NT/8ENm6SWaZ6ipbLxI=;
	b=QZ0Egd7MLUTQw0fRVKnjAYgH0U/+nzxfw2pI2TBvfcaDlq3aLsdaQyFryLsm+el8dhJcg8
	btI5rVYL/k4BW6AQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743000795; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7HQSnfCMXTMBWOcw0XYfisM0NT/8ENm6SWaZ6ipbLxI=;
	b=j17mEyhznoumRX/85Y/oKyK04gcySCr9bpPS/doAaCl5jSjjqXB4i08SrwW3EuNZdvOEbZ
	qPTaeIgcYPWwpyE/roAGFMPB4cQiZM1OIhHVd07dd38d8I9N6sqlLvmIgTXi/NsmiC6NOB
	GhF2ZC80djrK3aECV+n211lNRQYvbNQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743000795;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7HQSnfCMXTMBWOcw0XYfisM0NT/8ENm6SWaZ6ipbLxI=;
	b=QZ0Egd7MLUTQw0fRVKnjAYgH0U/+nzxfw2pI2TBvfcaDlq3aLsdaQyFryLsm+el8dhJcg8
	btI5rVYL/k4BW6AQ==
Date: Wed, 26 Mar 2025 15:53:14 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Gaurav Batra <gbatra@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, donettom@linux.ibm.com
Subject: Re: [PATCH] powerpc/pseries/iommu: memory notifier incorrectly adds
 TCEs for pmemory
Message-ID: <Z-QU2vtWYrZgo0iT@kitsune.suse.cz>
References: <20250130183854.92258-1-gbatra@linux.ibm.com>
 <Z9r--U_INHB4RjXI@kitsune.suse.cz>
 <aaab4789-390c-4b8d-9b83-bdb5fd6b0767@linux.ibm.com>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aaab4789-390c-4b8d-9b83-bdb5fd6b0767@linux.ibm.com>
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	DBL_BLOCKED_OPENRESOLVER(0.00)[opensuse.org:url]
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello,

On Wed, Mar 26, 2025 at 09:46:11AM -0500, Gaurav Batra wrote:
> Hello Michal,
> 
> In the patch to fix the pmemory bug, I made some changes to the code that
> determines Max memory an LPAR can have (excluding pmemory). This information
> is needed while creating Dynamic DMA Window (DDW). These changes are in the
> main line code path of DDW creation. This might have irritated QEMU somehow,
> no idea yet on how.

Yes, it's defeinitely something with the DDW code. Using the
disable_ddw=1 kernel parameter avoids the qemu crash.

The kernels in
https://download.opensuse.org/repositories/Kernel:/SLE15-SP7/pool/ppc64le/

have the patch applied.

Booting the kernel inside qemu VM with a PCI device (such as the USB
hub) and then rebooting the VM crashes qemu.

Thanks

Michal

> 
> Thanks,
> 
> Gaurav
> 
> On 3/19/25 12:29 PM, Michal Suchánek wrote:
> > Hello,
> > 
> > looks like this upsets some assumption qemu has about these windows.
> > 
> > https://lists.nongnu.org/archive/html/qemu-devel/2025-03/msg05137.html
> > 
> > When Linux kernel that has this patch applied is running inside a qemu
> > VM with a PCI device and the VM is rebooted qemu crashes shortly after
> > the next Linux kernel starts.
> > 
> > This is quite curious since qemu does AFAIK not support pmemory at all.
> > 
> > Any idea what went wrong there?
> > 
> > Thanks
> > 
> > Michal
> > 
> > On Thu, Jan 30, 2025 at 12:38:54PM -0600, Gaurav Batra wrote:
> > > iommu_mem_notifier() is invoked when RAM is dynamically added/removed. This
> > > notifier call is responsible to add/remove TCEs from the Dynamic DMA Window
> > > (DDW) when TCEs are pre-mapped. TCEs are pre-mapped only for RAM and not
> > > for persistent memory (pmemory). For DMA buffers in pmemory, TCEs are
> > > dynamically mapped when the device driver instructs to do so.
> > > 
> > > The issue is 'daxctl' command is capable of adding pmemory as "System RAM"
> > > after LPAR boot. The command to do so is -
> > > 
> > > daxctl reconfigure-device --mode=system-ram dax0.0 --force
> > > 
> > > This will dynamically add pmemory range to LPAR RAM eventually invoking
> > > iommu_mem_notifier(). The address range of pmemory is way beyond the Max
> > > RAM that the LPAR can have. Which means, this range is beyond the DDW
> > > created for the device, at device initialization time.
> > > 
> > > As a result when TCEs are pre-mapped for the pmemory range, by
> > > iommu_mem_notifier(), PHYP HCALL returns H_PARAMETER. This failed the
> > > command, daxctl, to add pmemory as RAM.
> > > 
> > > The solution is to not pre-map TCEs for pmemory.
> > > 
> > > Signed-off-by: Gaurav Batra <gbatra@linux.ibm.com>
> > > ---
> > >   arch/powerpc/include/asm/mmzone.h      |  1 +
> > >   arch/powerpc/mm/numa.c                 |  2 +-
> > >   arch/powerpc/platforms/pseries/iommu.c | 29 ++++++++++++++------------
> > >   3 files changed, 18 insertions(+), 14 deletions(-)
> > > 
> > > diff --git a/arch/powerpc/include/asm/mmzone.h b/arch/powerpc/include/asm/mmzone.h
> > > index d99863cd6cde..049152f8d597 100644
> > > --- a/arch/powerpc/include/asm/mmzone.h
> > > +++ b/arch/powerpc/include/asm/mmzone.h
> > > @@ -29,6 +29,7 @@ extern cpumask_var_t node_to_cpumask_map[];
> > >   #ifdef CONFIG_MEMORY_HOTPLUG
> > >   extern unsigned long max_pfn;
> > >   u64 memory_hotplug_max(void);
> > > +u64 hot_add_drconf_memory_max(void);
> > >   #else
> > >   #define memory_hotplug_max() memblock_end_of_DRAM()
> > >   #endif
> > > diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> > > index 3c1da08304d0..603a0f652ba6 100644
> > > --- a/arch/powerpc/mm/numa.c
> > > +++ b/arch/powerpc/mm/numa.c
> > > @@ -1336,7 +1336,7 @@ int hot_add_scn_to_nid(unsigned long scn_addr)
> > >   	return nid;
> > >   }
> > > -static u64 hot_add_drconf_memory_max(void)
> > > +u64 hot_add_drconf_memory_max(void)
> > >   {
> > >   	struct device_node *memory = NULL;
> > >   	struct device_node *dn = NULL;
> > > diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> > > index 29f1a0cc59cd..abd9529a8f41 100644
> > > --- a/arch/powerpc/platforms/pseries/iommu.c
> > > +++ b/arch/powerpc/platforms/pseries/iommu.c
> > > @@ -1284,17 +1284,13 @@ static LIST_HEAD(failed_ddw_pdn_list);
> > >   static phys_addr_t ddw_memory_hotplug_max(void)
> > >   {
> > > -	resource_size_t max_addr = memory_hotplug_max();
> > > -	struct device_node *memory;
> > > +	resource_size_t max_addr;
> > > -	for_each_node_by_type(memory, "memory") {
> > > -		struct resource res;
> > > -
> > > -		if (of_address_to_resource(memory, 0, &res))
> > > -			continue;
> > > -
> > > -		max_addr = max_t(resource_size_t, max_addr, res.end + 1);
> > > -	}
> > > +#if defined(CONFIG_NUMA) && defined(CONFIG_MEMORY_HOTPLUG)
> > > +	max_addr = hot_add_drconf_memory_max();
> > > +#else
> > > +	max_addr = memblock_end_of_DRAM();
> > > +#endif
> > >   	return max_addr;
> > >   }
> > > @@ -1600,7 +1596,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
> > >   	if (direct_mapping) {
> > >   		/* DDW maps the whole partition, so enable direct DMA mapping */
> > > -		ret = walk_system_ram_range(0, memblock_end_of_DRAM() >> PAGE_SHIFT,
> > > +		ret = walk_system_ram_range(0, ddw_memory_hotplug_max() >> PAGE_SHIFT,
> > >   					    win64->value, tce_setrange_multi_pSeriesLP_walk);
> > >   		if (ret) {
> > >   			dev_info(&dev->dev, "failed to map DMA window for %pOF: %d\n",
> > > @@ -2346,11 +2342,17 @@ static int iommu_mem_notifier(struct notifier_block *nb, unsigned long action,
> > >   	struct memory_notify *arg = data;
> > >   	int ret = 0;
> > > +	/* This notifier can get called when onlining persistent memory as well.
> > > +	 * TCEs are not pre-mapped for persistent memory. Persistent memory will
> > > +	 * always be above ddw_memory_hotplug_max()
> > > +	 */
> > > +
> > >   	switch (action) {
> > >   	case MEM_GOING_ONLINE:
> > >   		spin_lock(&dma_win_list_lock);
> > >   		list_for_each_entry(window, &dma_win_list, list) {
> > > -			if (window->direct) {
> > > +			if (window->direct && (arg->start_pfn << PAGE_SHIFT) <
> > > +				ddw_memory_hotplug_max()) {
> > >   				ret |= tce_setrange_multi_pSeriesLP(arg->start_pfn,
> > >   						arg->nr_pages, window->prop);
> > >   			}
> > > @@ -2362,7 +2364,8 @@ static int iommu_mem_notifier(struct notifier_block *nb, unsigned long action,
> > >   	case MEM_OFFLINE:
> > >   		spin_lock(&dma_win_list_lock);
> > >   		list_for_each_entry(window, &dma_win_list, list) {
> > > -			if (window->direct) {
> > > +			if (window->direct && (arg->start_pfn << PAGE_SHIFT) <
> > > +				ddw_memory_hotplug_max()) {
> > >   				ret |= tce_clearrange_multi_pSeriesLP(arg->start_pfn,
> > >   						arg->nr_pages, window->prop);
> > >   			}
> > > 
> > > base-commit: 95ec54a420b8f445e04a7ca0ea8deb72c51fe1d3
> > > -- 
> > > 2.39.3 (Apple Git-146)
> > > 
> > > 

