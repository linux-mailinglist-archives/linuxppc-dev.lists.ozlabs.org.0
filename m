Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1730203FDB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jun 2020 21:06:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rJmh1dH0zDqKH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 05:06:44 +1000 (AEST)
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
 header.s=20161025 header.b=ricGvkCb; dkim-atps=neutral
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rJcG0Xw5zDqWL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 04:59:25 +1000 (AEST)
Received: by mail-qv1-xf41.google.com with SMTP id x16so8478774qvr.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 11:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=mrWr6kV+xxuaeAPelslUEIXjbrMNdMFZdqp0d0NBrWE=;
 b=ricGvkCbGapsRagk0P/ooqxU2YZShHCnDQleoF5icWCOEPdJyr0fj2Ev3TWJiE2Hxg
 XeFTJpyUWpOjha3FyzAJbkNvNtBMY7RMxrPP3Wzd0LkbpDzvleN3llV/LWFWkhsDh/WF
 MrIh1LAFu0E2N4X50qKG95bGcrWuxWvVVFWBl/JBDY/RUhBuofcV6CMxHf9joa7QOPnj
 q74goP8iutSXUh3bbBHZM8eSnGMAb5ZGnkdT+pcd4GGdAc2T+r16EdipTSgsZA2GSSwc
 O1WSWsje4rTWiFeom8ZtzDU86CDbmpozkErRCc9JhrLNUeabus7xJxw/bUSKiv7EjiRi
 r/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=mrWr6kV+xxuaeAPelslUEIXjbrMNdMFZdqp0d0NBrWE=;
 b=cGxn95ZdriONXw5oLExN1DtXxDM+7P/lj9LN7QEXAfdo6OMbTqH6aKav9jHe/0e0Rk
 yFlpNok0H/x0BK2RZ9Y0WvVsONjLxPYjaqz+35ydgjw06DPPNqNcHyXEmuFQNTle9ZSz
 SU3cPKlsisxA0wNVJrlU90JZJJ2+FUYZu0PQ2nlB1n/vR4oHv+SyJsZrXB+RDmhNFCMr
 aCobgFn5Yo6UPxzSlaogYuEFlmCjUpE+n6Rs3KcGuAS/NaLc1D9AHFLUI+1/GYn1mwVq
 i1OuOvbN6I9VbnKdCy2OSz+HKY6mI4h1Zd0zg841BE0+7YUi2zDRSE7Y17J00+Skrjis
 /PDA==
X-Gm-Message-State: AOAM530zdjyLgaI9qhIc88YTv5YHlYSFUf+9h/02Hxalb7+0wA5EXxDi
 OkL3ByHncfblX9T3R+Z0hHM=
X-Google-Smtp-Source: ABdhPJy8MpcqHwxreI5mbCmgW2JedRG0HFRE8kNBfLEsMNfvqdn3hFTaVKMG2xKHZPYh/5wm6cRynQ==
X-Received: by 2002:ad4:4f23:: with SMTP id fc3mr23471455qvb.25.1592852363119; 
 Mon, 22 Jun 2020 11:59:23 -0700 (PDT)
Received: from LeoBras (177-131-65-187.dynamic.desktop.com.br.
 [177.131.65.187])
 by smtp.gmail.com with ESMTPSA id l2sm17383902qtc.80.2020.06.22.11.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 11:59:22 -0700 (PDT)
Message-ID: <4180fd9bb0409a9c7009fef3ccae8eb2ad46d0a2.camel@gmail.com>
Subject: Re: [PATCH 2/4] powerpc/pseries/iommu: Implement
 ibm,reset-pe-dma-windows rtas call
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Thiago Jung Bauermann
 <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>
Date: Mon, 22 Jun 2020 15:58:50 -0300
In-Reply-To: <2f004ecc-4788-47b6-e9ae-0c08d4723008@ozlabs.ru>
References: <20200619050619.266888-1-leobras.c@gmail.com>
 <20200619050619.266888-3-leobras.c@gmail.com>
 <2f004ecc-4788-47b6-e9ae-0c08d4723008@ozlabs.ru>
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
> >  arch/powerpc/platforms/pseries/iommu.c | 33 ++++++++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> > 
> > diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> > index e5a617738c8b..5e1fbc176a37 100644
> > --- a/arch/powerpc/platforms/pseries/iommu.c
> > +++ b/arch/powerpc/platforms/pseries/iommu.c
> > @@ -1012,6 +1012,39 @@ static phys_addr_t ddw_memory_hotplug_max(void)
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
> > +	u32 cfg_addr, ddw_ext[3];
> > +	u64 buid;
> > +	struct device_node *dn;
> > +	struct pci_dn *pdn;
> > +
> > +	ret = of_property_read_u32_array(par_dn, "ibm,ddw-extensions",
> > +					 &ddw_ext[0], 3);
> 
> s/3/2/ as for the reset extension you do not need the "64bit largest
> block" extension.

Sure, I will update this.

> 
> 
> > +	if (ret)
> > +		return;
> > +
> > +	dn = pci_device_to_OF_node(dev);
> > +	pdn = PCI_DN(dn);
> > +	buid = pdn->phb->buid;
> > +	cfg_addr = ((pdn->busno << 16) | (pdn->devfn << 8));
> > +
> > +	ret = rtas_call(ddw_ext[1], 3, 1, NULL, cfg_addr,
> 
> Here the "reset" extention is in ddw_ext[1]. Hm. 1/4 has a bug then.

Humm, in 1/4 I used dd_ext[0] (how many extensions) and ddw_ext[2] (64-
bit largest window count). I fail to see the bug here.

> And I am pretty sure it won't compile as reset_dma_window() is not used
> and it is static so fold it into one the next patches. Thanks,

Sure, I will do that. 
I was questioning myself about this and thought it would be better to
split for easier revision.

> 
> 
> > +			BUID_HI(buid), BUID_LO(buid));
> > +	if (ret)
> > +		dev_info(&dev->dev,
> > +			 "ibm,reset-pe-dma-windows(%x) %x %x %x returned %d ",
> > +			 ddw_ext[1], cfg_addr, BUID_HI(buid), BUID_LO(buid),
> > +			 ret);
> > +}
> > +
> >  /*
> >   * If the PE supports dynamic dma windows, and there is space for a table
> >   * that can map all pages in a linear offset, then setup such a table,
> > 

Best regards,
Leonardo

