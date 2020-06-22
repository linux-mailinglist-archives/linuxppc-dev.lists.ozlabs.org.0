Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 646C4203FD5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jun 2020 21:02:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rJh85CWPzDqXC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 05:02:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LeipoEn2; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rJc70JXFzDqWL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 04:59:17 +1000 (AEST)
Received: by mail-qk1-x743.google.com with SMTP id r22so15045123qke.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 11:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=UJAR19ZQh+sTT93leBEvrqV+pEQ6XvP1o7bASqIMgsM=;
 b=LeipoEn2ydGrr/qIxHUn9PtwhmBuuEvdGb9+GYbxyVIT0TCx4iNlAIYen6lBAjEpsV
 XgsdUbI6I96q3adC/dSCrGSdumZLcUv27RR+4dfVU4YjqeB6XFiAJsyx7z1zQJegi4U1
 6NEfS+X4TyWRiHnBZgZqZBvc/1QPZonPSE97sr7Z/Vspp3HIgfGvnRVQQgZbfrVPjLKo
 6BUbXn+uwo57TPTyIVrA07ow3zOQnvrnShakxgtMIFwL7/CDvNDv+j2MaQv/+4HnuyKP
 e8BRqAs7RQSBsGZLdztJSx1b3h0rlPXnKreaZEBf8oDjlVBDwvZd6vKdCNj9F9lEu8GA
 6B8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=UJAR19ZQh+sTT93leBEvrqV+pEQ6XvP1o7bASqIMgsM=;
 b=VTus02+5MLXr5aP4Li4iv18J5WZY/1uWvOuBfOgPVjasaC2n9ZTIJMUdGhmTAfJgXc
 I54tGvPGy6jhbae+2J/JvmQavQ8QpoaTTgweFGiIp6OFgr49KZEeMn3pBs16ZwLxeZTn
 aCNrnn3nEvSur8UgeUL0Da44eaczDW8/znmK+QgXNM6RjKz7MaFVSxYRayZS65d3mc6I
 KijyeC6UGFyeLDphSUe8iyGD9ieXdx52X4IfeYpsOspldVJLP5h/CSENPWxiuaYbGiIP
 O54jwIFeFiX7kojrarww4UOSTz9Yiga3T4DdfCzwHBrWbum4qc1XeptP8xcEVhtRUhAC
 /UgA==
X-Gm-Message-State: AOAM533utvY4nZfGEIqZ5QPwTp62A9bVmU0biZ0TmCnTOpkU7eay5htT
 jKEmjnVKLpVmSXVwhcCCcGU=
X-Google-Smtp-Source: ABdhPJw3Fdoo4dZs+fR7uUjNE0nJB4yGTuFtPQwUEK3HCzivIlWeQ+GT7/xLbn050PlHT1NTXA1qUA==
X-Received: by 2002:a05:620a:958:: with SMTP id
 w24mr3380351qkw.20.1592852353496; 
 Mon, 22 Jun 2020 11:59:13 -0700 (PDT)
Received: from LeoBras (177-131-65-187.dynamic.desktop.com.br.
 [177.131.65.187])
 by smtp.gmail.com with ESMTPSA id c80sm6260720qke.26.2020.06.22.11.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 11:59:12 -0700 (PDT)
Message-ID: <c15189a5c77752ea62022608dab28601965afaaa.camel@gmail.com>
Subject: Re: [PATCH 1/4] powerpc/pseries/iommu: Update call to
 ibm,query-pe-dma-windows
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Date: Mon, 22 Jun 2020 15:58:44 -0300
In-Reply-To: <cfbcacde-ca7f-5fc7-2fcf-267f698f3d49@ozlabs.ru>
References: <20200619050619.266888-1-leobras.c@gmail.com>
 <20200619050619.266888-2-leobras.c@gmail.com>
 <cfbcacde-ca7f-5fc7-2fcf-267f698f3d49@ozlabs.ru>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
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
Cc: Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Alexey, thank you for the feedback!

On Mon, 2020-06-22 at 20:02 +1000, Alexey Kardashevskiy wrote:
> 
> On 19/06/2020 15:06, Leonardo Bras wrote:
> > From LoPAR level 2.8, "ibm,ddw-extensions" index 3 can make the number of
> > outputs from "ibm,query-pe-dma-windows" go from 5 to 6.
> > 
> > This change of output size is meant to expand the address size of
> > largest_available_block PE TCE from 32-bit to 64-bit, which ends up
> > shifting page_size and migration_capable.
> > 
> > This ends up requiring the update of
> > ddw_query_response->largest_available_block from u32 to u64, and manually
> > assigning the values from the buffer into this struct, according to
> > output size.
> > 
> > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > ---
> >  arch/powerpc/platforms/pseries/iommu.c | 57 +++++++++++++++++++++-----
> >  1 file changed, 46 insertions(+), 11 deletions(-)
> > 
> > diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> > index 6d47b4a3ce39..e5a617738c8b 100644
> > --- a/arch/powerpc/platforms/pseries/iommu.c
> > +++ b/arch/powerpc/platforms/pseries/iommu.c
> > @@ -334,7 +334,7 @@ struct direct_window {
> >  /* Dynamic DMA Window support */
> >  struct ddw_query_response {
> >  	u32 windows_available;
> > -	u32 largest_available_block;
> > +	u64 largest_available_block;
> >  	u32 page_size;
> >  	u32 migration_capable;
> >  };
> > @@ -869,14 +869,32 @@ static int find_existing_ddw_windows(void)
> >  }
> >  machine_arch_initcall(pseries, find_existing_ddw_windows);
> >  
> > +/*
> > + * From LoPAR level 2.8, "ibm,ddw-extensions" index 3 can rule how many output
> > + * parameters ibm,query-pe-dma-windows will have, ranging from 5 to 6.
> > + */
> > +
> > +static int query_ddw_out_sz(struct device_node *par_dn)
> 
> Can easily be folded into query_ddw().

Sure, but it will get inlined by the compiler, and I think it reads
better this way. 

I mean, I understand you have a reason to think it's better to fold it
in query_ddw(), and I would like to better understand that to improve
my code in the future.

> > +{
> > +	int ret;
> > +	u32 ddw_ext[3];
> > +
> > +	ret = of_property_read_u32_array(par_dn, "ibm,ddw-extensions",
> > +					 &ddw_ext[0], 3);
> > +	if (ret || ddw_ext[0] < 2 || ddw_ext[2] != 1)
> 
> Oh that PAPR thing again :-/
> 
> ===
> The “ibm,ddw-extensions” property value is a list of integers the first
> integer indicates the number of extensions implemented and subsequent
> integers, one per extension, provide a value associated with that
> extension.
> ===
> 
> So ddw_ext[0] is length.
> Listindex==2 is for "reset" says PAPR and
> Listindex==3 is for this new 64bit "largest_available_block".
> 
> So I'd expect ddw_ext[2] to have the "reset" token and ddw_ext[3] to
> have "1" for this new feature but indexes are smaller. I am confused.
> Either way these "2" and "3" needs to be defined in macros, "0" probably
> too.

Remember these indexes are not C-like 0-starting indexes, where the
size would be Listindex==1.
Basically, in C-like array it's :
a[0] == size, 
a[1] == reset_token, 
a[2] == new 64bit "largest_available_block"

> Please post 'lsprop "ibm,ddw-extensions"' here. Thanks,

Sure:
[root@host pci@800000029004005]# lsprop "ibm,ddw-extensions"
ibm,dd
w-extensions
                 00000002 00000056 00000000


> 
> > +		return 5;
> > +	return 6;
> > +}
> > +
> >  static int query_ddw(struct pci_dev *dev, const u32 *ddw_avail,
> > -			struct ddw_query_response *query)
> > +		     struct ddw_query_response *query,
> > +		     struct device_node *par_dn)
> >  {
> >  	struct device_node *dn;
> >  	struct pci_dn *pdn;
> > -	u32 cfg_addr;
> > +	u32 cfg_addr, query_out[5];
> >  	u64 buid;
> > -	int ret;
> > +	int ret, out_sz;
> >  
> >  	/*
> >  	 * Get the config address and phb buid of the PE window.
> > @@ -888,12 +906,29 @@ static int query_ddw(struct pci_dev *dev, const u32 *ddw_avail,
> >  	pdn = PCI_DN(dn);
> >  	buid = pdn->phb->buid;
> >  	cfg_addr = ((pdn->busno << 16) | (pdn->devfn << 8));
> > +	out_sz = query_ddw_out_sz(par_dn);
> > +
> > +	ret = rtas_call(ddw_avail[0], 3, out_sz, query_out,
> > +			cfg_addr, BUID_HI(buid), BUID_LO(buid));
> > +	dev_info(&dev->dev, "ibm,query-pe-dma-windows(%x) %x %x %x returned %d\n",
> > +		 ddw_avail[0], cfg_addr, BUID_HI(buid), BUID_LO(buid), ret);
> > +
> > +	switch (out_sz) {
> > +	case 5:
> > +		query->windows_available = query_out[0];
> > +		query->largest_available_block = query_out[1];
> > +		query->page_size = query_out[2];
> > +		query->migration_capable = query_out[3];
> > +		break;
> > +	case 6:
> > +		query->windows_available = query_out[0];
> > +		query->largest_available_block = ((u64)query_out[1] << 32) |
> > +						 query_out[2];
> > +		query->page_size = query_out[3];
> > +		query->migration_capable = query_out[4];
> > +		break;
> > +	}
> >  
> > -	ret = rtas_call(ddw_avail[0], 3, 5, (u32 *)query,
> > -		  cfg_addr, BUID_HI(buid), BUID_LO(buid));
> > -	dev_info(&dev->dev, "ibm,query-pe-dma-windows(%x) %x %x %x"
> > -		" returned %d\n", ddw_avail[0], cfg_addr, BUID_HI(buid),
> > -		BUID_LO(buid), ret);
> >  	return ret;
> >  }
> >  
> > @@ -1040,7 +1075,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
> >  	 * of page sizes: supported and supported for migrate-dma.
> >  	 */
> >  	dn = pci_device_to_OF_node(dev);
> > -	ret = query_ddw(dev, ddw_avail, &query);
> > +	ret = query_ddw(dev, ddw_avail, &query, pdn);
> >  	if (ret != 0)
> >  		goto out_failed;
> >  
> > @@ -1068,7 +1103,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
> >  	/* check largest block * page size > max memory hotplug addr */
> >  	max_addr = ddw_memory_hotplug_max();
> >  	if (query.largest_available_block < (max_addr >> page_shift)) {
> > -		dev_dbg(&dev->dev, "can't map partition max 0x%llx with %u "
> > +		dev_dbg(&dev->dev, "can't map partition max 0x%llx with %llu "
> >  			  "%llu-sized pages\n", max_addr,  query.largest_available_block,
> >  			  1ULL << page_shift);
> >  		goto out_failed;
> > 

Best regards,
Leonardo

