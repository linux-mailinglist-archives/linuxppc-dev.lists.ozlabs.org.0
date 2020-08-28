Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C5325609A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 20:38:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BdSyg5wK0zDqrX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Aug 2020 04:38:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f42;
 helo=mail-qv1-xf42.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VjLfAFz6; dkim-atps=neutral
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BdSwq24B2zDqpK
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Aug 2020 04:36:27 +1000 (AEST)
Received: by mail-qv1-xf42.google.com with SMTP id x6so75668qvr.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Aug 2020 11:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=T/7fXvhi9m9yNI5hpRrZ1GDKeEKw1eYmtTIY3iOIQvM=;
 b=VjLfAFz6r0wu2KncwbJRE1VCWNYSCsHVcWYOA/EHarpmKwB9doxUCHzV6Xk5Bl4Rhg
 WlpI6w6Ev6f+Rppno5GkM/q7R62QfK2t6JlZyOtRACpb0ovSY1rx1zS3zLlOvD8+klsO
 V6WKR1Vo0IbtS20s1vPqk/6itwJKotxzORolHCIcSxtUvQdLUIyPdnwrdinIvMzP/Z5a
 pI5Czf1/Ce1Sbcw9QYbZf/2QFElG6w8ZjfJnECCjW3bjTX9XGOleAtXGNnTJfyszSe0o
 N4an9xhyKJtEe0GesMA4jyYSVIaBGxMV/ofOggD4DP5E9EsYMKmO7Bonzt6qJ2suvzgj
 oJTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=T/7fXvhi9m9yNI5hpRrZ1GDKeEKw1eYmtTIY3iOIQvM=;
 b=O/l6HIf7AfUo8YuuZ/0LxrsOTvelCogUjXbOKuDgZyXUS6y9ekw9eZ2qM9gN7cvKQH
 PmXebNfZF0fokkBNXUFrPhEhVEWbSu04Hfjsa3+e4FLRO+0gl5irx0aoSztLB1jlUHT0
 xIFhi/rNk5F3yRshUdaHhcOCsly5kSF9vIWx4Wv45iBQky7SfuuDnetBQEQTRCyVzWbv
 YKOdP40qsjRH2vL9Us/ocW9iFk8No2t/ZgM601e8EtGvYsMmV/UoTXSW1A/qZ7EhKJly
 LyEPFts2gF65idAny/f0+5GD6mcFwonqdyMmAP8EmrpMpdEskaC77YZlEFobHGD5e5V7
 8V7A==
X-Gm-Message-State: AOAM531REEe/EKNKWsHnTipEH5IAEFW6NYayLXXEtEev0iJRvYanAZ4r
 fMi5bMn/N/n9vGh9nl5+0Yc=
X-Google-Smtp-Source: ABdhPJzrDlq1SgSEYdKnTYs2V5Gwg5DgDW7jzfB2xdpiGpFwscnbAXoBenj30lOmZFdDaoz8yHKrlA==
X-Received: by 2002:a0c:e9c7:: with SMTP id q7mr3012582qvo.195.1598639783442; 
 Fri, 28 Aug 2020 11:36:23 -0700 (PDT)
Received: from LeoBras ([2804:14d:8084:8e41:9b0d:571e:a65:b5d8])
 by smtp.gmail.com with ESMTPSA id e21sm1369995qkl.88.2020.08.28.11.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 11:36:22 -0700 (PDT)
Message-ID: <f3ccef770985b8dfd8d5cb2b9f7b55f2e734d402.camel@gmail.com>
Subject: Re: [PATCH v1 09/10] powerpc/pseries/iommu: Make use of DDW even if
 it does not map the partition
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Christophe Leroy
 <christophe.leroy@c-s.fr>,  Joel Stanley <joel@jms.id.au>, Thiago Jung
 Bauermann <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,  Brian
 King <brking@linux.vnet.ibm.com>, Murilo Fossa Vicentini
 <muvic@linux.ibm.com>, David Dai <zdai@linux.vnet.ibm.com>
Date: Fri, 28 Aug 2020 15:36:15 -0300
In-Reply-To: <d2d98195-982d-c40a-43bc-5853726ed1d6@ozlabs.ru>
References: <20200817234033.442511-1-leobras.c@gmail.com>
 <20200817234033.442511-10-leobras.c@gmail.com>
 <d2d98195-982d-c40a-43bc-5853726ed1d6@ozlabs.ru>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2020-08-24 at 15:17 +1000, Alexey Kardashevskiy wrote:
> 
> On 18/08/2020 09:40, Leonardo Bras wrote:
> > As of today, if the biggest DDW that can be created can't map the whole
> > partition, it's creation is skipped and the default DMA window
> > "ibm,dma-window" is used instead.
> > 
> > DDW is 16x bigger than the default DMA window,
> 
> 16x only under very specific circumstances which are
> 1. phyp
> 2. sriov
> 3. device class in hmc (or what that priority number is in the lpar config).

Yeah, missing details.

> > having the same amount of
> > pages, but increasing the page size to 64k.
> > Besides larger DMA window,
> 
> "Besides being larger"?

You are right there.

> 
> > it performs better for allocations over 4k,
> 
> Better how?

I was thinking for allocations larger than (512 * 4k), since >2
hypercalls are needed here, and for 64k pages would still be just 1
hypercall up to (512 * 64k). 
But yeah, not the usual case anyway.

> 
> > so it would be nice to use it instead.
> 
> I'd rather say something like:
> ===
> So far we assumed we can map the guest RAM 1:1 to the bus which worked
> with a small number of devices. SRIOV changes it as the user can
> configure hundreds VFs and since phyp preallocates TCEs and does not
> allow IOMMU pages bigger than 64K, it has to limit the number of TCEs
> per a PE to limit waste of physical pages.
> ===

I mixed this in my commit message, it looks like this:

===
powerpc/pseries/iommu: Make use of DDW for indirect mapping

So far it's assumed possible to map the guest RAM 1:1 to the bus, which
works with a small number of devices. SRIOV changes it as the user can
configure hundreds VFs and since phyp preallocates TCEs and does not
allow IOMMU pages bigger than 64K, it has to limit the number of TCEs
per a PE to limit waste of physical pages.

As of today, if the assumed direct mapping is not possible, DDW
creation is skipped and the default DMA window "ibm,dma-window" is used
instead.

The default DMA window uses 4k pages instead of 64k pages, and since
the amount of pages is the same, making use of DDW instead of the
default DMA window for indirect mapping will expand in 16x the amount
of memory that can be mapped on DMA.

The DDW created will be used for direct mapping by default. [...]
===

What do you think?

> > The DDW created will be used for direct mapping by default.
> > If it's not available, indirect mapping will be used instead.
> > 
> > For indirect mapping, it's necessary to update the iommu_table so
> > iommu_alloc() can use the DDW created. For this,
> > iommu_table_update_window() is called when everything else succeeds
> > at enable_ddw().
> > 
> > Removing the default DMA window for using DDW with indirect mapping
> > is only allowed if there is no current IOMMU memory allocated in
> > the iommu_table. enable_ddw() is aborted otherwise.
> > 
> > As there will never have both direct and indirect mappings at the same
> > time, the same property name can be used for the created DDW.
> > 
> > So renaming
> > define DIRECT64_PROPNAME "linux,direct64-ddr-window-info"
> > to
> > define DMA64_PROPNAME "linux,dma64-ddr-window-info"
> > looks the right thing to do.
> 
> I know I suggested this but this does not look so good anymore as I
> suspect it breaks kexec (from older kernel to this one) so you either
> need to check for both DT names or just keep the old one. Changing the
> macro name is fine.
> 

Yeah, having 'direct' in the name don't really makes sense if it's used
for indirect mapping. I will just add this new define instead of
replacing the old one, and check for both. 
Is that ok?

> 
> > To make sure the property differentiates both cases, a new u32 for flags
> > was added at the end of the property, where BIT(0) set means direct
> > mapping.
> > 
> > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > ---
> >  arch/powerpc/platforms/pseries/iommu.c | 108 +++++++++++++++++++------
> >  1 file changed, 84 insertions(+), 24 deletions(-)
> > 
> > diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> > index 3a1ef02ad9d5..9544e3c91ced 100644
> > --- a/arch/powerpc/platforms/pseries/iommu.c
> > +++ b/arch/powerpc/platforms/pseries/iommu.c
> > @@ -350,8 +350,11 @@ struct dynamic_dma_window_prop {
> >  	__be64	dma_base;	/* address hi,lo */
> >  	__be32	tce_shift;	/* ilog2(tce_page_size) */
> >  	__be32	window_shift;	/* ilog2(tce_window_size) */
> > +	__be32	flags;		/* DDW properties, see bellow */
> >  };
> >  
> > +#define DDW_FLAGS_DIRECT	0x01
> 
> This is set if ((1<<window_shift) >= ddw_memory_hotplug_max()), you
> could simply check window_shift and drop the flags.
> 

Yeah, it's better this way, I will revert this.

> 
> > +
> >  struct direct_window {
> >  	struct device_node *device;
> >  	const struct dynamic_dma_window_prop *prop;
> > @@ -377,7 +380,7 @@ static LIST_HEAD(direct_window_list);
> >  static DEFINE_SPINLOCK(direct_window_list_lock);
> >  /* protects initializing window twice for same device */
> >  static DEFINE_MUTEX(direct_window_init_mutex);
> > -#define DIRECT64_PROPNAME "linux,direct64-ddr-window-info"
> > +#define DMA64_PROPNAME "linux,dma64-ddr-window-info"
> >  
> >  static int tce_clearrange_multi_pSeriesLP(unsigned long start_pfn,
> >  					unsigned long num_pfn, const void *arg)
> > @@ -836,7 +839,7 @@ static void remove_ddw(struct device_node *np, bool remove_prop)
> >  	if (ret)
> >  		return;
> >  
> > -	win = of_find_property(np, DIRECT64_PROPNAME, NULL);
> > +	win = of_find_property(np, DMA64_PROPNAME, NULL);
> >  	if (!win)
> >  		return;
> >  
> > @@ -852,7 +855,7 @@ static void remove_ddw(struct device_node *np, bool remove_prop)
> >  			np, ret);
> >  }
> >  
> > -static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr)
> > +static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr, bool *direct_mapping)
> >  {
> >  	struct direct_window *window;
> >  	const struct dynamic_dma_window_prop *direct64;
> > @@ -864,6 +867,7 @@ static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr)
> >  		if (window->device == pdn) {
> >  			direct64 = window->prop;
> >  			*dma_addr = be64_to_cpu(direct64->dma_base);
> > +			*direct_mapping = be32_to_cpu(direct64->flags) & DDW_FLAGS_DIRECT;
> >  			found = true;
> >  			break;
> >  		}
> > @@ -901,8 +905,8 @@ static int find_existing_ddw_windows(void)
> >  	if (!firmware_has_feature(FW_FEATURE_LPAR))
> >  		return 0;
> >  
> > -	for_each_node_with_property(pdn, DIRECT64_PROPNAME) {
> > -		direct64 = of_get_property(pdn, DIRECT64_PROPNAME, &len);
> > +	for_each_node_with_property(pdn, DMA64_PROPNAME) {
> > +		direct64 = of_get_property(pdn, DMA64_PROPNAME, &len);
> >  		if (!direct64)
> >  			continue;
> >  
> > @@ -1124,7 +1128,8 @@ static void reset_dma_window(struct pci_dev *dev, struct device_node *par_dn)
> >  }
> >  
> >  static int ddw_property_create(struct property **ddw_win, const char *propname,
> > -			       u32 liobn, u64 dma_addr, u32 page_shift, u32 window_shift)
> > +			       u32 liobn, u64 dma_addr, u32 page_shift,
> > +			       u32 window_shift, bool direct_mapping)
> >  {
> >  	struct dynamic_dma_window_prop *ddwprop;
> >  	struct property *win64;
> > @@ -1144,6 +1149,36 @@ static int ddw_property_create(struct property **ddw_win, const char *propname,
> >  	ddwprop->dma_base = cpu_to_be64(dma_addr);
> >  	ddwprop->tce_shift = cpu_to_be32(page_shift);
> >  	ddwprop->window_shift = cpu_to_be32(window_shift);
> > +	if (direct_mapping)
> > +		ddwprop->flags = cpu_to_be32(DDW_FLAGS_DIRECT);
> > +
> > +	return 0;
> > +}
> > +
> > +static int iommu_table_update_window(struct iommu_table **tbl, int nid, unsigned long liobn,
> > +				     unsigned long win_addr, unsigned long page_shift,
> > +				     unsigned long window_size)
> 
> Rather strange helper imho. I'd extract the most of
> iommu_table_setparms_lpar() into iommu_table_setparms() (except
> of_parse_dma_window) and call new helper from where you call
> iommu_table_update_window; and do
> iommu_pseries_alloc_table/iommu_tce_table_put there.
> 

I don't see how to extract iommu_table_setparms_lpar() into
iommu_table_setparms(), they look to be used for different machine
types.

Do mean you extracting most of iommu_table_setparms_lpar() (and maybe
iommu_table_setparms() ) into a new helper, which is called in both
functions and use it instead of iommu_table_update_window() ?

> 
> > +{
> > +	struct iommu_table *new_tbl, *old_tbl;
> > +
> > +	new_tbl = iommu_pseries_alloc_table(nid);
> > +	if (!new_tbl)
> > +		return -ENOMEM;
> > +
> > +	old_tbl = *tbl;
> > +	new_tbl->it_index = liobn;
> > +	new_tbl->it_offset = win_addr >> page_shift;
> > +	new_tbl->it_page_shift = page_shift;
> > +	new_tbl->it_size = window_size >> page_shift;
> > +	new_tbl->it_base = old_tbl->it_base;
> 
> Should not be used in pseries.
> 

The point here is to migrate the values from the older tbl to the
newer. I Would like to understand why this is bad, if it will still be
'unused' as the older tbl.

> 
> > +	new_tbl->it_busno = old_tbl->it_busno;
> > +	new_tbl->it_blocksize = old_tbl->it_blocksize;
> 
> 16 for pseries and does not change (may be even make it a macro).
> 
> > +	new_tbl->it_type = old_tbl->it_type;
> 
> TCE_PCI.
> 

Same as above.

> 
> > +	new_tbl->it_ops = old_tbl->it_ops;
> > +
> > +	iommu_init_table(new_tbl, nid, old_tbl->it_reserved_start, old_tbl->it_reserved_end);
> > +	iommu_tce_table_put(old_tbl);
> > +	*tbl = new_tbl;
> >  
> >  	return 0;
> >  }
> > @@ -1171,12 +1206,16 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
> >  	struct direct_window *window;
> >  	struct property *win64 = NULL;
> >  	struct failed_ddw_pdn *fpdn;
> > -	bool default_win_removed = false;
> > +	bool default_win_removed = false, maps_whole_partition = false;
> 
> s/maps_whole_partition/direct_mapping/
> 

Sure, I will get it replaced.

> 
> > +	struct pci_dn *pci = PCI_DN(pdn);
> > +	struct iommu_table *tbl = pci->table_group->tables[0];
> >  
> >  	mutex_lock(&direct_window_init_mutex);
> >  
> > -	if (find_existing_ddw(pdn, &dev->dev.archdata.dma_offset))
> > -		goto out_unlock;
> > +	if (find_existing_ddw(pdn, &dev->dev.archdata.dma_offset, &maps_whole_partition)) {
> > +		mutex_unlock(&direct_window_init_mutex);
> > +		return maps_whole_partition;
> > +	}
> >  
> >  	/*
> >  	 * If we already went through this for a previous function of
> > @@ -1258,16 +1297,24 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
> >  			  query.page_size);
> >  		goto out_failed;
> >  	}
> > +
> >  	/* verify the window * number of ptes will map the partition */
> > -	/* check largest block * page size > max memory hotplug addr */
> >  	max_addr = ddw_memory_hotplug_max();
> >  	if (query.largest_available_block < (max_addr >> page_shift)) {
> > -		dev_dbg(&dev->dev, "can't map partition max 0x%llx with %llu "
> > -			  "%llu-sized pages\n", max_addr,  query.largest_available_block,
> > -			  1ULL << page_shift);
> > -		goto out_failed;
> > +		dev_dbg(&dev->dev, "can't map partition max 0x%llx with %llu %llu-sized pages\n",
> > +			max_addr, query.largest_available_block,
> > +			1ULL << page_shift);
> > +
> > +		len = order_base_2(query.largest_available_block << page_shift);
> > +	} else {
> > +		maps_whole_partition = true;
> > +		len = order_base_2(max_addr);
> >  	}
> > -	len = order_base_2(max_addr);
> > +
> > +	/* DDW + IOMMU on single window may fail if there is any allocation */
> > +	if (default_win_removed && !maps_whole_partition &&
> > +	    iommu_table_in_use(tbl))
> > +		goto out_failed;
> >  
> >  	ret = create_ddw(dev, ddw_avail, &create, page_shift, len);
> >  	if (ret != 0)
> > @@ -1277,8 +1324,8 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
> >  		create.liobn, dn);
> >  
> >  	win_addr = ((u64)create.addr_hi << 32) | create.addr_lo;
> > -	ret = ddw_property_create(&win64, DIRECT64_PROPNAME, create.liobn, win_addr,
> > -				  page_shift, len);
> > +	ret = ddw_property_create(&win64, DMA64_PROPNAME, create.liobn, win_addr,
> > +				  page_shift, len, maps_whole_partition);
> >  	if (ret) {
> >  		dev_info(&dev->dev,
> >  			 "couldn't allocate property, property name, or value\n");
> > @@ -1297,12 +1344,25 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
> >  	if (!window)
> >  		goto out_prop_del;
> >  
> > -	ret = walk_system_ram_range(0, memblock_end_of_DRAM() >> PAGE_SHIFT,
> > -			win64->value, tce_setrange_multi_pSeriesLP_walk);
> > -	if (ret) {
> > -		dev_info(&dev->dev, "failed to map direct window for %pOF: %d\n",
> > -			 dn, ret);
> > -		goto out_free_window;
> > +	if (maps_whole_partition) {
> > +		/* DDW maps the whole partition, so enable direct DMA mapping */
> > +		ret = walk_system_ram_range(0, memblock_end_of_DRAM() >> PAGE_SHIFT,
> > +					    win64->value, tce_setrange_multi_pSeriesLP_walk);
> > +		if (ret) {
> > +			dev_info(&dev->dev, "failed to map direct window for %pOF: %d\n",
> > +				 dn, ret);
> > +			goto out_free_window;
> > +		}
> > +	} else {
> > +		/* New table for using DDW instead of the default DMA window */
> > +		if (iommu_table_update_window(&tbl, pci->phb->node, create.liobn,
> > +					      win_addr, page_shift, 1UL << len))
> > +			goto out_free_window;
> > +
> > +		set_iommu_table_base(&dev->dev, tbl);
> > +		WARN_ON(dev->dev.archdata.dma_offset >= SZ_4G);
> 
> What is this check for exactly? Why 4G, not >= 0, for example?

I am not really sure, you suggested adding it here:
http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20200716071658.467820-6-leobras.c@gmail.com/#2488874

I can remove it if it's ok.

> 
> > +		goto out_unlock;
> > +
> >  	}
> >  
> >  	dev->dev.archdata.dma_offset = win_addr;
> > @@ -1340,7 +1400,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
> >  
> >  out_unlock:
> >  	mutex_unlock(&direct_window_init_mutex);
> > -	return win64;
> > +	return win64 && maps_whole_partition;
> >  }
> >  
> >  static void pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
> > 

