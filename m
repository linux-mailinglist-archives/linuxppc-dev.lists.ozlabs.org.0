Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFA1255C02
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 16:11:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BdM390LMZzDqsM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Aug 2020 00:11:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UGEkJzkD; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BdLvY5CmZzDqrC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Aug 2020 00:04:55 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id u3so998581qkd.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Aug 2020 07:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=sDSHoOJkUg6tpuGyDLcmRUTHThKkKUUoAr4tYQuZRc0=;
 b=UGEkJzkDUHcOG/dJy0Wj+dVh3dW7lgoJKFBVwiA5r8LQ6Fl8XWOB3Qmivm4MfPhRRk
 5QA3CMmEC8Cvwps0yyc3GeYDNxLoTNbp4JXY43byOvoTjH7LpLUtYBFhSISnIU3eyofp
 Wbd/VWYZEpcQri9cxyyOGSDzWRuPnG/6a+MXPrZnzSqZ55mxs22JZQgi68B7i0hzwk1S
 /YmVCs7Es3g5avVnKZZQhBYymvdzzLBxfV3y3EgJyxjOXDka2BItSmFP66mcbm//aBwv
 w/flewKNWmJVG0rYmZzsRUDdUSeIZN0OxcpC/WAxVYpY6DHoZXxnLSOoj7ZxiK3H9fFT
 TrfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=sDSHoOJkUg6tpuGyDLcmRUTHThKkKUUoAr4tYQuZRc0=;
 b=fcKu35oO8wfNrvY5EFBGuSioTIEKkZm6ZC29zTqsk5tsGNFIKyeczH9YgihMfqXywF
 7jzgKHpycsNbYcj7pgEpmQod2d5nyOpEAsVoIPNslYqPKsPHpomfb9YXFqwz+lSveaQH
 uzqI+ZFChXK4YQs+QZaLCxZ/5C+3S3qObkjf0KTLLa2J+evCdpE9dwFBABkPjesHFvyN
 S37DBRPlK3iKoYqNTgHSjffse7QFdV/umATx6evI/XsZORq4gP4QcYxn1UIdK+G69m/K
 C9zff5DBVKHHmARVz+PCktWgexxeV12bON+LdG6hUVRZBIDLLYrnQv5V15c6WdAh7hJS
 W7+g==
X-Gm-Message-State: AOAM530q9ZZ0NIRwaSvKh1kdaCriElUPmgUwWvC2yJw4tYTlgte7/s2/
 T27kxBEaztXs2G5okQPpKRA=
X-Google-Smtp-Source: ABdhPJxBt//F0SgaxMRwcTJ2l1vIihVNS/yF0IzhK0eIvicNH2R040CCUUfeoAgX+xnQ3px5ayRnlQ==
X-Received: by 2002:a37:794:: with SMTP id 142mr1343808qkh.114.1598623491802; 
 Fri, 28 Aug 2020 07:04:51 -0700 (PDT)
Received: from LeoBras ([2804:14d:8084:8e41:9b0d:571e:a65:b5d8])
 by smtp.gmail.com with ESMTPSA id g18sm983292qtu.69.2020.08.28.07.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 07:04:50 -0700 (PDT)
Message-ID: <2d2b1a048faf75c8e68f95b3bf2d9514721786c6.camel@gmail.com>
Subject: Re: [PATCH v1 07/10] powerpc/pseries/iommu: Allow DDW windows
 starting at 0x00
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Christophe Leroy
 <christophe.leroy@c-s.fr>,  Joel Stanley <joel@jms.id.au>, Thiago Jung
 Bauermann <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,  Brian
 King <brking@linux.vnet.ibm.com>, Murilo Fossa Vicentini
 <muvic@linux.ibm.com>, David Dai <zdai@linux.vnet.ibm.com>
Date: Fri, 28 Aug 2020 11:04:45 -0300
In-Reply-To: <3fda1c2d-20f2-7789-e072-47fe966f0265@ozlabs.ru>
References: <20200817234033.442511-1-leobras.c@gmail.com>
 <20200817234033.442511-8-leobras.c@gmail.com>
 <3fda1c2d-20f2-7789-e072-47fe966f0265@ozlabs.ru>
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

On Mon, 2020-08-24 at 13:44 +1000, Alexey Kardashevskiy wrote:
> 
> > On 18/08/2020 09:40, Leonardo Bras wrote:
> > enable_ddw() currently returns the address of the DMA window, which is
> > considered invalid if has the value 0x00.
> > 
> > Also, it only considers valid an address returned from find_existing_ddw
> > if it's not 0x00.
> > 
> > Changing this behavior makes sense, given the users of enable_ddw() only
> > need to know if direct mapping is possible. It can also allow a DMA window
> > starting at 0x00 to be used.
> > 
> > This will be helpful for using a DDW with indirect mapping, as the window
> > address will be different than 0x00, but it will not map the whole
> > partition.
> > 
> > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > ---
> >  arch/powerpc/platforms/pseries/iommu.c | 30 ++++++++++++--------------
> >  1 file changed, 14 insertions(+), 16 deletions(-)
> > 
> > diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> > index fcdefcc0f365..4031127c9537 100644
> > --- a/arch/powerpc/platforms/pseries/iommu.c
> > +++ b/arch/powerpc/platforms/pseries/iommu.c
> > @@ -852,24 +852,25 @@ static void remove_ddw(struct device_node *np, bool remove_prop)
> >  			np, ret);
> >  }
> > >  
> > -static u64 find_existing_ddw(struct device_node *pdn)
> > +static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr)
> >  {
> >  	struct direct_window *window;
> >  	const struct dynamic_dma_window_prop *direct64;
> > -	u64 dma_addr = 0;
> > +	bool found = false;
> >  
> >  	spin_lock(&direct_window_list_lock);
> >  	/* check if we already created a window and dupe that config if so */
> >  	list_for_each_entry(window, &direct_window_list, list) {
> >  		if (window->device == pdn) {
> >  			direct64 = window->prop;
> > -			dma_addr = be64_to_cpu(direct64->dma_base);
> > +			*dma_addr = be64_to_cpu(direct64->dma_base);
> > +			found = true;
> >  			break;
> >  		}
> >  	}
> >  	spin_unlock(&direct_window_list_lock);
> >  
> > -	return dma_addr;
> > +	return found;
> >  }
> >  
> >  static struct direct_window *ddw_list_add(struct device_node *pdn,
> > @@ -1131,15 +1132,15 @@ static void reset_dma_window(struct pci_dev *dev, struct device_node *par_dn)
> >   * pdn: the parent pe node with the ibm,dma_window property
> >   * Future: also check if we can remap the base window for our base page size
> >   *
> > - * returns the dma offset for use by the direct mapped DMA code.
> > + * returns true if can map all pages (direct mapping), false otherwise..
> >   */
> > -static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
> > +static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
> >  {
> >  	int len, ret;
> >  	struct ddw_query_response query;
> >  	struct ddw_create_response create;
> >  	int page_shift;
> > -	u64 dma_addr, max_addr;
> > +	u64 max_addr;
> >  	struct device_node *dn;
> >  	u32 ddw_avail[DDW_APPLICABLE_SIZE];
> >  	struct direct_window *window;
> > @@ -1150,8 +1151,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
> >  
> >  	mutex_lock(&direct_window_init_mutex);
> >  
> > -	dma_addr = find_existing_ddw(pdn);
> > -	if (dma_addr != 0)
> > +	if (find_existing_ddw(pdn, &dev->dev.archdata.dma_offset))
> >  		goto out_unlock;
> >  
> >  	/*
> > @@ -1292,7 +1292,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
> >  		goto out_free_window;
> >  	}
> >  
> > -	dma_addr = be64_to_cpu(ddwprop->dma_base);
> > +	dev->dev.archdata.dma_offset = be64_to_cpu(ddwprop->dma_base);
> 
> Do not you need the same chunk in the find_existing_ddw() case above as
> well? Thanks,

The new signature of find_existing_ddw() is 
static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr)

And on enable_ddw(), we call 
find_existing_ddw(pdn, &dev->dev.archdata.dma_offset)

And inside the function we do:
*dma_addr = be64_to_cpu(direct64->dma_base);

I think it's the same as the chunk before.
Am I missing something?

> 
> 
> >  	goto out_unlock;
> >  
> >  out_free_window:
> > @@ -1309,6 +1309,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
> >  	kfree(win64->name);
> >  	kfree(win64->value);
> >  	kfree(win64);
> > +	win64 = NULL;
> >  
> >  out_failed:
> >  	if (default_win_removed)
> > @@ -1322,7 +1323,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
> >  
> >  out_unlock:
> >  	mutex_unlock(&direct_window_init_mutex);
> > -	return dma_addr;
> > +	return win64;
> >  }
> >  
> >  static void pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
> > @@ -1401,11 +1402,8 @@ static bool iommu_bypass_supported_pSeriesLP(struct pci_dev *pdev, u64 dma_mask)
> >  			break;
> >  	}
> >  
> > -	if (pdn && PCI_DN(pdn)) {
> > -		pdev->dev.archdata.dma_offset = enable_ddw(pdev, pdn);
> > -		if (pdev->dev.archdata.dma_offset)
> > -			return true;
> > -	}
> > +	if (pdn && PCI_DN(pdn))
> > +		return enable_ddw(pdev, pdn);
> >  
> >  	return false;
> >  }
> > 

