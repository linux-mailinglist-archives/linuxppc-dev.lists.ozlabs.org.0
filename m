Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F03C23EE677
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 08:01:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpgQb6F5Tz3dGB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 16:01:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=UQlE8xgd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UQlE8xgd; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpgNX0t43z3bTV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 15:59:56 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id
 hv22-20020a17090ae416b0290178c579e424so4591321pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 22:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=GJ9GWlYCg4+zVJoMtI5zY2C8xGVLbc9EYOIpcL2yt3Y=;
 b=UQlE8xgdpvA4wdKffS3YBXWJ8ocFkMACZe4tOyzgzln8OS8FQBZlh4g430d8UyULhd
 ojYsujBq4d/9DevFVrqXeUyBuarYvGEMLD0g/ZQ9TdaDiMnY9zkG/vvAH0X9ZT1fxi8G
 It+8sQg6DLektNkUOsKr4qcAI6yh9qaVKUbhjKFU+OPrQcn/z0LWL5NJeSp2Axmeuq7w
 CecG7Iro6Yu6YvyIu/r3hfZ+IFBez5nbEGtsdjyFC6UZ1hE2N4tkdjTiFLStvC7uDeY/
 VxabWm3X1hrQqDf1WtKRu5xRRS169nfmRns76PmSOwJI55HAXjjupy3brLTqF9nlW4NZ
 Jz5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=GJ9GWlYCg4+zVJoMtI5zY2C8xGVLbc9EYOIpcL2yt3Y=;
 b=lh20t+nUgJyRoD4HQ3h0F4WIuhRELddeN71j4HsSmwb9gGjqdCqHCQMCbbkVPjS6BF
 1qWPm8fZ7dCAXz7aylswgCDB3oNA6vi7C1y/NVuOIw8WfWX4bYhW7flGMywtiuboZF1f
 RePL1dyvajhfXMClMm2Ys16Oxxzqn9Phaa4BS4DWa2ndVcy+Qo8VO4n/HZRicMnBaVhD
 XxKucZbTRMf8zrgW0Dg189sNUje1I6AgNiEfxQ6ZqwacWA+4WcuBxmilVuQry6kexpQ0
 SxX5A8FdqTGwHcrlB34ar5YGH7yuxF+lhrnNX3rbBkCNmmc95CeYoyQgps/jt2GRXEXi
 YYtw==
X-Gm-Message-State: AOAM532LHgJvZKZaSBQbcyx0od2XT3+YOqHZqN0KBxKijEf5drbGbGtM
 +fWsA4YxVP3OJer6TSnvEUQ=
X-Google-Smtp-Source: ABdhPJypZ0emOG909fZ+yC9uG8mlssu39sEfIPJw28MDurTAagsbzlP0+ZhR3OmyJWM1hBvPVaGcBA==
X-Received: by 2002:a17:90a:d784:: with SMTP id z4mr221009pju.73.1629179994153; 
 Mon, 16 Aug 2021 22:59:54 -0700 (PDT)
Received: from ?IPv6:2804:431:c7f0:30b2:5c9e:50:88f3:269a?
 ([2804:431:c7f0:30b2:5c9e:50:88f3:269a])
 by smtp.gmail.com with ESMTPSA id m194sm1093489pfd.58.2021.08.16.22.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 22:59:53 -0700 (PDT)
Message-ID: <25299f8dc62953996a43c3d654937d51ea8b1d9c.camel@gmail.com>
Subject: Re: [PATCH v5 10/11] powerpc/pseries/iommu: Make use of DDW for
 indirect mapping
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Frederic Barrat
 <fbarrat@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, David Gibson <david@gibson.dropbear.id.au>, kernel test
 robot <lkp@intel.com>, Nicolin Chen <nicoleotsuka@gmail.com>
Date: Tue, 17 Aug 2021 02:59:55 -0300
In-Reply-To: <75c84c0b-46b3-2600-c186-257aec05c645@ozlabs.ru>
References: <20210716082755.428187-1-leobras.c@gmail.com>
 <20210716082755.428187-11-leobras.c@gmail.com>
 <b98f696a-ed64-4c9e-ccb6-549ae8bc7fd6@linux.ibm.com>
 <8dfb28d5-b654-746c-03d8-aeee3d438240@ozlabs.ru>
 <994051df-73b3-4dad-76aa-1a03d9afaf6d@linux.ibm.com>
 <75c84c0b-46b3-2600-c186-257aec05c645@ozlabs.ru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.3 
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alexey, Fred:

On Fri, 2021-07-23 at 15:34 +1000, Alexey Kardashevskiy wrote:
> 
> 
> On 22/07/2021 01:04, Frederic Barrat wrote:
> > 
> > 
> > On 21/07/2021 05:32, Alexey Kardashevskiy wrote:
> > > > > +        struct iommu_table *newtbl;
> > > > > +        int i;
> > > > > +
> > > > > +        for (i = 0; i < ARRAY_SIZE(pci->phb->mem_resources);
> > > > > i++) {
> > > > > +            const unsigned long mask = IORESOURCE_MEM_64 | 
> > > > > IORESOURCE_MEM;
> > > > > +
> > > > > +            /* Look for MMIO32 */
> > > > > +            if ((pci->phb->mem_resources[i].flags & mask) ==
> > > > > IORESOURCE_MEM)
> > > > > +                break;
> > > > > +        }
> > > > > +
> > > > > +        if (i == ARRAY_SIZE(pci->phb->mem_resources))
> > > > > +            goto out_del_list;
> > > > 
> > > > 
> > > > So we exit and do nothing if there's no MMIO32 bar?
> > > > Isn't the intent just to figure out the MMIO32 area to reserve
> > > > it 
> > > > when init'ing the table? In which case we could default to 0,0
> > > > 
> > > > I'm actually not clear why we are reserving this area on
> > > > pseries.
> > > 
> > > 
> > > 
> > > If we do not reserve it, then the iommu code will allocate DMA
> > > pages 
> > > from there and these addresses are MMIO32 from the kernel pov at 
> > > least. I saw crashes when (I think) a device tried DMAing to the
> > > top 
> > > 2GB of the bus space which happened to be a some other device's
> > > BAR.
> > 
> > 
> > hmmm... then figuring out the correct range needs more work. We
> > could 
> > have more than one MMIO32 bar. And they don't have to be adjacent. 
> 
> They all have to be within the MMIO32 window of a PHB and we reserve
> the 
> entire window here.
> 
> > I 
> > don't see that we are reserving any range on the initial table
> > though 
> > (on pseries).
> True, we did not need to, as the hypervisor always took care of DMA
> and 
> MMIO32 regions to not overlap.
> 
> And in this series we do not (strictly speaking) need this either as 
> phyp never allocates more than one window dynamically and that only 
> window is always the second one starting from 0x800.0000.0000.0000.
> It 
> is probably my mistake that KVM allows a new window to start from 0 -
> PAPR did not prohibit this explicitly.
> 
> And for the KVM case, we do not need to remove the default window as
> KVM 
> can pretty much always allocate as many TCE as the VM wants. But we 
> still allow removing the default window and creating a huge one
> instead 
> at 0x0 as this way we can allow 1:1 for every single PCI device even
> if 
> it only allows 48 (or similar but less than 64bit) DMA. Hope this
> makes 
> sense. Thanks,
> 
> 

Thank you for this discussion, I got to learn a lot!

If I got this, no further change will be necessary, is that correct?

I am testing a v6, and I intend to send it soon.

