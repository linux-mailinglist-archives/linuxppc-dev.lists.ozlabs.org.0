Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 65808203FE6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jun 2020 21:11:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rJtT3qD9zDqMp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 05:11:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=a85HKK1k; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rJcv2TQFzDqX3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 04:59:59 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id l6so12912501qkc.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 11:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=TpvdD/J8VwHzvZd0v6OyP8qTfmXp+6SIfe2vfAxjGyo=;
 b=a85HKK1kZBB03vsHeCPwXTkvFBVYKIduK9M11nnCMoNQ85WDdtUzATqJzzw5iWPSkN
 jIH+VsvZMOJiyygWpdlkAt4miJRj2esXs67ECxP+bRp1PCJ85Oi8Jrb8TxkBf9GTai4c
 CnEOplnB1bmQF0rKQmHvCleV013rhesLq9hy+s6q4PTqdCXRkWlonKo3ZGvpWqt+9K62
 Zw1QM7z4Ob3w/5sFHTzPH3AESLdGqshPqG7gh8wRuMBucjrMVmJbaT44lJD3viUIULtV
 2OGb/jHooIJTBYt1vnwzud1qXpmcBk49sPZQpwoCmalT3CGhUH+6AhVkosK08Zo+Jxv8
 u6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=TpvdD/J8VwHzvZd0v6OyP8qTfmXp+6SIfe2vfAxjGyo=;
 b=AaHzM/gmW0AttRpWAQyRfNxdZjpttrtpGNGxThj2Rf/Q3d+c4sgeI5Cdtum7C3/8b5
 X5Lmx98tlBnNKzJCF+bsALDhbJQY3nJfAsKY1Nn5xGothn8KB4Vioq8KBkY1/grxlfnv
 NI6IRIxlkH1hFhY8GFvZ302imSRRV2GW153+EOduv+FR+RZNvyNj6gG4XSCm1SuG8XaO
 Ur0iW2bczYQCZSbK49GLC82iW+759aqp/3Cs1VszSm+JzUrIGr7PhA3JYNASzqvtLqyS
 7V4QCJUWJ4269WJjpXFtSvKyw19niZHorCqxlKiC9+LsHO3CIeyGCUhI2P5vQuBwDSaG
 3j/g==
X-Gm-Message-State: AOAM531Za1aP9XIhxSgSwD1kkcy16PsLz7NzenB/2XKCU9Qk9h/u3xIe
 w7OyQfUEhlF2iRdNUmiLuAE=
X-Google-Smtp-Source: ABdhPJwcRpOXlOzNeD1ZeqA3JR6F+t1eie3QH4OXUnvCZxYSjmk86oye3yMPNcvPix9Qpg6DGlQ6Xg==
X-Received: by 2002:ae9:c113:: with SMTP id z19mr17078056qki.355.1592852397173; 
 Mon, 22 Jun 2020 11:59:57 -0700 (PDT)
Received: from LeoBras (177-131-65-187.dynamic.desktop.com.br.
 [177.131.65.187])
 by smtp.gmail.com with ESMTPSA id u7sm13928861qku.119.2020.06.22.11.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 11:59:56 -0700 (PDT)
Message-ID: <4bf1d32da3d13a44e3c2e4b04f369fe52c24a023.camel@gmail.com>
Subject: Re: [PATCH 4/4] powerpc/pseries/iommu: Remove default DMA window
 before creating DDW
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Thiago Jung Bauermann
 <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>
Date: Mon, 22 Jun 2020 15:59:28 -0300
In-Reply-To: <ade15776-61d1-b660-db74-7aeba4eddfdf@ozlabs.ru>
References: <20200619050619.266888-1-leobras.c@gmail.com>
 <20200619050619.266888-5-leobras.c@gmail.com>
 <ade15776-61d1-b660-db74-7aeba4eddfdf@ozlabs.ru>
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

Hello Alexey, thanks for the feedback!

On Mon, 2020-06-22 at 20:02 +1000, Alexey Kardashevskiy wrote:
> 
> On 19/06/2020 15:06, Leonardo Bras wrote:
> > On LoPAR "DMA Window Manipulation Calls", it's recommended to remove the
> > default DMA window for the device, before attempting to configure a DDW,
> > in order to make the maximum resources available for the next DDW to be
> > created.
> > 
> > This is a requirement for some devices to use DDW, given they only
> > allow one DMA window.
> > 
> > If setting up a new DDW fails anywhere after the removal of this
> > default DMA window, restore it using reset_dma_window.
> 
> Nah... If we do it like this, then under pHyp we lose 32bit DMA for good
> as pHyp can only create a single window and it has to map at
> 0x800.0000.0000.0000. They probably do not care though.
> 
> Under KVM, this will fail as VFIO allows creating  2 windows and it
> starts from 0 but the existing iommu_bypass_supported_pSeriesLP() treats
> the window address == 0 as a failure. And we want to keep both DMA
> windows for PCI adapters with both 64bit and 32bit PCI functions (I
> heard AMD GPU video + audio are like this) or someone could hotplug
> 32bit DMA device on a vphb with already present 64bit DMA window so we
> do not remove the default window.

Well, then I would suggest doing something like this:
	query_ddw(...);
  	if (query.windows_available == 0){
		remove_dma_window(...,default_win);
		query_ddw(...);
	}

This would make sure to cover cases of windows available == 1
and windows available > 1; 

> The last discussed thing I remember was that there was supposed to be a
> new bit in "ibm,architecture-vec-5" (forgot the details), we could use
> that to decide whether to keep the default window or not, like this.

I checked on the latest LoPAR draft (soon to be published), for the
ibm,architecture-vec 'option array 5' and this entry was the only
recently added one that is related to this patchset:

Byte 8 - Bit 0:
SRIOV Virtual Functions Support Dynamic DMA Windows (DDW):
0: SRIOV Virtual Functions do not support DDW
1: SRIOV Virtual Functions do support DDW

Isn't this equivalent to having a "ibm,ddw-applicable" property?


> 
> > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > ---
> >  arch/powerpc/platforms/pseries/iommu.c | 20 +++++++++++++++++---
> >  1 file changed, 17 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> > index de633f6ae093..68d1ea957ac7 100644
> > --- a/arch/powerpc/platforms/pseries/iommu.c
> > +++ b/arch/powerpc/platforms/pseries/iommu.c
> > @@ -1074,8 +1074,9 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
> >  	u64 dma_addr, max_addr;
> >  	struct device_node *dn;
> >  	u32 ddw_avail[3];
> > +
> >  	struct direct_window *window;
> > -	struct property *win64;
> > +	struct property *win64, *dfl_win;
> 
> Make it "default_win" or "def_win", "dfl" hurts to read :)

Sure, no problem :)

> 
> >  	struct dynamic_dma_window_prop *ddwprop;
> >  	struct failed_ddw_pdn *fpdn;
> >  
> > @@ -1110,8 +1111,19 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
> >  	if (ret)
> >  		goto out_failed;
> >  
> > -       /*
> > -	 * Query if there is a second window of size to map the
> > +	/*
> > +	 * First step of setting up DDW is removing the default DMA window,
> > +	 * if it's present. It will make all the resources available to the
> > +	 * new DDW window.
> > +	 * If anything fails after this, we need to restore it.
> > +	 */
> > +
> > +	dfl_win = of_find_property(pdn, "ibm,dma-window", NULL);
> > +	if (dfl_win)
> > +		remove_dma_window(pdn, ddw_avail, dfl_win);
> 
> Before doing so, you want to make sure that the "reset" is actually
> supported. Thanks,

Good catch, I will improve that.

> 
> 
> > +
> > +	/*
> > +	 * Query if there is a window of size to map the
> >  	 * whole partition.  Query returns number of windows, largest
> >  	 * block assigned to PE (partition endpoint), and two bitmasks
> >  	 * of page sizes: supported and supported for migrate-dma.
> > @@ -1219,6 +1231,8 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
> >  	kfree(win64);
> >  
> >  out_failed:
> > +	if (dfl_win)
> > +		reset_dma_window(dev, pdn);
> >  
> >  	fpdn = kzalloc(sizeof(*fpdn), GFP_KERNEL);
> >  	if (!fpdn)
> > 

Best regards,
Leonardo

