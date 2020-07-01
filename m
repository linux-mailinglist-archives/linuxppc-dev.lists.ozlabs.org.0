Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3965C2113E3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 21:50:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xsJl34PDzDqvH
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 05:50:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f41;
 helo=mail-qv1-xf41.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hAB+GTQQ; dkim-atps=neutral
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xsH136CSzDqP1
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jul 2020 05:48:43 +1000 (AEST)
Received: by mail-qv1-xf41.google.com with SMTP id m8so7369647qvk.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Jul 2020 12:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=F+zOFzzQGW/IWyDrMNDLzgC5H7MP7fwCTcrqfKVNTg0=;
 b=hAB+GTQQpCETbZHenGH6duyUbioG5Ol2dwra3/38/gHPTbyAbAV7nUnZbVUx5fMvho
 h8+oMgHOyI99Z/nhFr/rJ0LNqmcphzEyvGGQ2kiTpp0sbRbEOxVgqSf5o3eWsG0nhNxW
 EpJTGxVXVYg+bbLDPcpoVC1SNXTDWD4LXyx6x5mVWXZAUS/ANs6NuJKPMel22+yl8GL2
 q4vewjCVRa0u0fdX+Bnb6PHbR1pXGnanPvI9/a20/NtsLfrZIVaDTcEXq87BpzUFmYIX
 5thhjuQHDEgz+CmG3bKc9gsPmjUg+a/gzqZM/ki0NiEnxfBsKyQzWt122XUS1rfpsZql
 0/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=F+zOFzzQGW/IWyDrMNDLzgC5H7MP7fwCTcrqfKVNTg0=;
 b=n4kS2pGBjZNxVp6yPURVR1pWQR1kjeWcWNGXIleuIlIsq8j0/H6KyglnpZhtdw1qKm
 ebpNrcZLLmCKLyBIz0kAxIaLW2L+UdFZDDHyU+j3aYSBfH4RhnQExkls1wF9kPcbZcVJ
 H76xhJ6fZ0sbOVVyUjiB/0d2Rv1ebPRwpmylVVnanAxnR4xvn8NP2TkVcgxbWdVPGyMr
 XvBTFJYK7ZfDIpEBT+ygVl6lPKw2wDs7VpjXIrJ8IeYiHQBgqZISzRIWJdKZj+eikk54
 s3QicpaI77OU++xxBmCNwmOw1tDUi0LklNnf/pAHXZT4S8dgnyaiVHpuIm80UkgJ0D+1
 5GLA==
X-Gm-Message-State: AOAM532ABjt3LhMVvQG0dgsC8w6pT5Mdnl2kB6JWK8i2Sz0rjajAityO
 +XZFrjHK/62BfBN6liJBZJQ=
X-Google-Smtp-Source: ABdhPJzU5xygkbKHsZhoN0wv1tTdnJ1PHu+l27Lo6dgQ/TjIwGafcKr1iso828lWlwcx1YtbiPZ+lg==
X-Received: by 2002:a05:6214:7a5:: with SMTP id
 v5mr25679250qvz.22.1593632920004; 
 Wed, 01 Jul 2020 12:48:40 -0700 (PDT)
Received: from LeoBras (200-236-245-17.dynamic.desktop.com.br.
 [200.236.245.17])
 by smtp.gmail.com with ESMTPSA id w77sm6653841qka.34.2020.07.01.12.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 12:48:39 -0700 (PDT)
Message-ID: <42e7174bf60227caee4d1c353235e42b90305632.camel@gmail.com>
Subject: Re: [PATCH v2 4/6] powerpc/pseries/iommu: Remove default DMA window
 before creating DDW
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Thiago Jung Bauermann
 <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>
Date: Wed, 01 Jul 2020 16:48:33 -0300
In-Reply-To: <e00340a3-1070-a787-5acc-0bfc37f73dff@ozlabs.ru>
References: <20200624062411.367796-1-leobras.c@gmail.com>
 <20200624062411.367796-5-leobras.c@gmail.com>
 <e00340a3-1070-a787-5acc-0bfc37f73dff@ozlabs.ru>
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

On Wed, 2020-07-01 at 18:17 +1000, Alexey Kardashevskiy wrote:
> 
> On 24/06/2020 16:24, Leonardo Bras wrote:
> > On LoPAR "DMA Window Manipulation Calls", it's recommended to remove the
> > default DMA window for the device, before attempting to configure a DDW,
> > in order to make the maximum resources available for the next DDW to be
> > created.
> > 
> > This is a requirement for some devices to use DDW, given they only
> > allow one DMA window.
> 
> Devices never know about these windows, it is purely PHB's side of
> things. A device can access any address on the bus, the bus can generate
> an exception if there is no window behind the address OR some other
> device's MMIO. We could actually create a second window in addition to
> the first one and allocate bus addresses from both, we just simplifying
> this by merging two separate non-adjacent windows into one.

That's interesting, I was not aware of this. 
I will try to improve this commit message with this info.
Thanks for sharing!

> > > > If setting up a new DDW fails anywhere after the removal of this
> > default DMA window, it's needed to restore the default DMA window.
> > For this, an implementation of ibm,reset-pe-dma-windows rtas call is
> > needed:
> > 
> > Platforms supporting the DDW option starting with LoPAR level 2.7 implement
> > ibm,ddw-extensions. The first extension available (index 2) carries the
> > token for ibm,reset-pe-dma-windows rtas call, which is used to restore
> > the default DMA window for a device, if it has been deleted.
> > 
> > It does so by resetting the TCE table allocation for the PE to it's
> > boot time value, available in "ibm,dma-window" device tree node.
> > 
> > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > ---
> >  arch/powerpc/platforms/pseries/iommu.c | 70 ++++++++++++++++++++++----
> >  1 file changed, 61 insertions(+), 9 deletions(-)
> > 
> > diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> > index a8840d9e1c35..4fcf00016fb1 100644
> > --- a/arch/powerpc/platforms/pseries/iommu.c
> > +++ b/arch/powerpc/platforms/pseries/iommu.c
> > @@ -1029,6 +1029,39 @@ static phys_addr_t ddw_memory_hotplug_max(void)
> >  	return max_addr;
> >  }
> >  
> > +/*
> > + * Platforms supporting the DDW option starting with LoPAR level 2.7 implement
> > + * ibm,ddw-extensions, which carries the rtas token for
> > + * ibm,reset-pe-dma-windows.
> > + * That rtas-call can be used to restore the default DMA window for the device.
> > + */
> > +static void reset_dma_window(struct pci_dev *dev, struct device_node *par_dn)
> > +{
> > +	int ret;
> > +	u32 cfg_addr, ddw_ext[DDW_EXT_RESET_DMA_WIN + 1];
> > +	u64 buid;
> > +	struct device_node *dn;
> > +	struct pci_dn *pdn;
> > +
> > +	ret = of_property_read_u32_array(par_dn, "ibm,ddw-extensions",
> > +					 &ddw_ext[0], DDW_EXT_RESET_DMA_WIN + 1);
> > +	if (ret)
> > +		return;
> > +
> > +	dn = pci_device_to_OF_node(dev);
> > +	pdn = PCI_DN(dn);
> > +	buid = pdn->phb->buid;
> > +	cfg_addr = ((pdn->busno << 16) | (pdn->devfn << 8));
> > +
> > +	ret = rtas_call(ddw_ext[DDW_EXT_RESET_DMA_WIN], 3, 1, NULL, cfg_addr,
> > +			BUID_HI(buid), BUID_LO(buid));
> > +	if (ret)
> > +		dev_info(&dev->dev,
> > +			 "ibm,reset-pe-dma-windows(%x) %x %x %x returned %d ",
> > +			 ddw_ext[1], cfg_addr, BUID_HI(buid), BUID_LO(buid),
> 
> s/ddw_ext[1]/ddw_ext[DDW_EXT_RESET_DMA_WIN]/

Good catch! I missed this one.

> 
> 
> > +			 ret);
> > +}
> > +
> >  /*
> >   * If the PE supports dynamic dma windows, and there is space for a table
> >   * that can map all pages in a linear offset, then setup such a table,
> > @@ -1049,8 +1082,9 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
> >  	u64 dma_addr, max_addr;
> >  	struct device_node *dn;
> >  	u32 ddw_avail[DDW_APPLICABLE_SIZE];
> > +
> 
> Unrelated new empty line.

Fixed!

> 
> 
> >  	struct direct_window *window;
> > -	struct property *win64;
> > +	struct property *win64, *default_win = NULL, *ddw_ext = NULL;
> >  	struct dynamic_dma_window_prop *ddwprop;
> >  	struct failed_ddw_pdn *fpdn;
> >  
> > @@ -1085,7 +1119,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
> >  	if (ret)
> >  		goto out_failed;
> >  
> > -       /*
> > +	/*
> >  	 * Query if there is a second window of size to map the
> >  	 * whole partition.  Query returns number of windows, largest
> >  	 * block assigned to PE (partition endpoint), and two bitmasks
> > @@ -1096,15 +1130,31 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
> >  	if (ret != 0)
> >  		goto out_failed;
> >  
> > +	/*
> > +	 * If there is no window available, remove the default DMA window,
> > +	 * if it's present. This will make all the resources available to the
> > +	 * new DDW window.
> > +	 * If anything fails after this, we need to restore it, so also check
> > +	 * for extensions presence.
> > +	 */
> >  	if (query.windows_available == 0) {
> 
> Does phyp really always advertise 0 windows for these VFs? What is in
> the largest_available_block when windows_available==0?

For this VF, it always advertise 0 windows before removing the default
DMA window. The largest available block size is the same as after the
removal (256GB). The only value that changes after removal is the
number of available windows. Here some debug prints:

[    3.473149] mlx5_core 4005:01:00.0: ibm,query-pe-dma-windows(53)
10000 8000000 29004005 returned 0
[    3.473162] mlx5_core 4005:01:00.0: windows_available = 0,
largest_block = 400000, page_size = 3, migration_capable = 3
[    3.473332] mlx5_core 4005:01:00.0: ibm,query-pe-dma-windows(53)
10000 8000000 29004005 returned 0
[    3.473345] mlx5_core 4005:01:00.0: windows_available = 1,
largest_block = 400000, page_size = 3, migration_capable = 3

> 
> 
> > -		/*
> > -		 * no additional windows are available for this device.
> > -		 * We might be able to reallocate the existing window,
> > -		 * trading in for a larger page size.
> > -		 */
> > -		dev_dbg(&dev->dev, "no free dynamic windows");
> > -		goto out_failed;
> > +		default_win = of_find_property(pdn, "ibm,dma-window", NULL);
> > +		ddw_ext = of_find_property(pdn, "ibm,ddw-extensions", NULL);
> > +		if (default_win && ddw_ext)
> > +			remove_dma_window(pdn, ddw_avail, default_win);
> > +
> > +		/* Query again, to check if the window is available */
> > +		ret = query_ddw(dev, ddw_avail, &query, pdn);
> > +		if (ret != 0)
> > +			goto out_failed;
> > +
> > +		if (query.windows_available == 0) {
> > +			/* no windows are available for this device. */
> > +			dev_dbg(&dev->dev, "no free dynamic windows");
> > +			goto out_failed;
> > +		}
> >  	}
> > +
> 
> Unrelated new empty line. Thanks,
Fixed!
Thank you!

> 
> >  	if (query.page_size & 4) {
> >  		page_shift = 24; /* 16MB */
> >  	} else if (query.page_size & 2) {
> > @@ -1194,6 +1244,8 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
> >  	kfree(win64);
> >  
> >  out_failed:
> > +	if (default_win && ddw_ext)
> > +		reset_dma_window(dev, pdn);
> >  
> >  	fpdn = kzalloc(sizeof(*fpdn), GFP_KERNEL);
> >  	if (!fpdn)
> > 

