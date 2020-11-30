Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6066B2C8887
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 16:46:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cl8j21KFSzDqFM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 02:46:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.67; helo=mail-wm1-f67.google.com;
 envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.com
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cl8fC1PNzzDqty
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 02:43:46 +1100 (AEDT)
Received: by mail-wm1-f67.google.com with SMTP id c198so18886970wmd.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 07:43:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wrXxUQ92cZjqbtsEEoadFbidu9p7SlbrPzlM2q7qXbQ=;
 b=L3UIAn3knrTby5OeNbOWeQa3xtOfz1A7iw+VcNR2z6hkrFo//2Mezthnmg104fxeB4
 UdB3ui4BQEmmEBKmetsJqd9CJC9CucpsrFvenXgLqqDk34h/6UmVNiAZJvLvLiBju5kH
 GR/fCqY3TAp94qFAWVf8aT6mSQ1rziM2LX5jgrlYMh9pGHgLvssT7adWIqwye+2cmNU6
 p0AmDsFiKQIAWxK3gzgfMbJClDGHjpKlyLMQ+Gq7osoT2HmtSwRYweLwyRglFeBas3sa
 +mjkLE37bkvkj8amOBZMIzGeuo1yPKXzRwsGEdNfzeUQUjLNSnc9+dhQEkHGF6Kb49Iq
 vs+Q==
X-Gm-Message-State: AOAM530Mht/vKI2XcIM/MD0FniQ2/PVxuZ5+DTU4Y1Ko5sV0XXlEbSo+
 CO/Ui8snKERYRCm3O8iybt8=
X-Google-Smtp-Source: ABdhPJwrrDJzMhj73fjDkT0ADgqZ22ISWQCdbgUESE4glj3y9mWsdL0QCouWmsg3hBrKTtQdmgQ/Kw==
X-Received: by 2002:a1c:1d85:: with SMTP id d127mr7724937wmd.39.1606751023484; 
 Mon, 30 Nov 2020 07:43:43 -0800 (PST)
Received: from rocinante ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id x5sm29038317wrm.96.2020.11.30.07.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 07:43:42 -0800 (PST)
Date: Mon, 30 Nov 2020 16:43:41 +0100
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v5] PCI: Unify ECAM constants in native PCI Express drivers
Message-ID: <X8UTLQTXVX2iPCOn@rocinante>
References: <20201127104626.3979165-1-kw@linux.com>
 <20201128183516.GA897329@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201128183516.GA897329@bjorn-Precision-5520>
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
Cc: Heiko Stuebner <heiko@sntech.de>, Shawn Lin <shawn.lin@rock-chips.com>,
 Paul Mackerras <paulus@samba.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jonathan Chocron <jonnyc@amazon.com>, Toan Le <toan@os.amperecomputing.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Michal Simek <michal.simek@xilinx.com>, linux-rockchip@lists.infradead.org,
 David Laight <david.laight@aculab.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
 Ray Jui <rjui@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>,
 linux-rpi-kernel@lists.infradead.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Jonathan Derrick <jonathan.derrick@intel.com>,
 Scott Branden <sbranden@broadcom.com>, Zhou Wang <wangzhou1@hisilicon.com>,
 Robert Richter <rrichter@marvell.com>, linuxppc-dev@lists.ozlabs.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[+CC David for visibility]

Hi Bjorn,

Thank you for the review!

On 20-11-28 12:35:16, Bjorn Helgaas wrote:
[...]
> It's ironic that we don't use PCIE_ECAM_OFFSET in drivers/pci/ecam.c.
> We could do something like this, which would also let us drop
> .bus_shift completely in all the conforming implementations.  It also
> closes the hole that we didn't limit "where" to 4K for
> pci_ecam_map_bus() users.
> 
>   if (per_bus_mapping) {
>     base = cfg->winp[busn];
>     busn = 0;
>   } else {
>     base = cfg->win;
>   }
> 
>   if (cfg->ops->bus_shift) {
>     u32 bus_offset = (busn & 0xff) << cfg->ops->bus_shift;
>     u32 devfn_offset = (devfn & 0xff) << (cfg->ops->bus_shift - 8);
> 
>     where &= 0xfff;
> 
>     return base + (bus_offset | devfn_offset | where);
>   }
> 
>   return base + PCIE_ECAM_OFFSET(busn, devfn, where);
[...]

Thank you for suggesting this!  I sent v6 recently that includes this.

> >  static void __iomem *ppc4xx_pciex_get_config_base(struct ppc4xx_pciex_port *port,
> >  						  struct pci_bus *bus,
> > -						  unsigned int devfn)
> > +						  unsigned int devfn,
> > +						  int offset)
> 
> The interface change (to add "offset") could be a preparatory patch by
> itself.
> 
> But I'm actually not sure it's worth even touching this file.  This is
> the only place outside drivers/pci that includes linux/pci-ecam.h.  I
> think I might rather put PCIE_ECAM_OFFSET() and related things in
> drivers/pci/pci.h and keep it all inside drivers/pci.

Makes sense to drop it.  We can always introduce chances on PPC 4xx
platform in the future if we ever want it to leverage all the new macros
and constants.

These changes are not included in v6.

> >  static const struct pci_ecam_ops pci_thunder_pem_ops = {
> > -	.bus_shift	= 24,
> > +	.bus_shift	= THUNDER_PCIE_ECAM_BUS_SHIFT,
> >  	.init		= thunder_pem_platform_init,
> >  	.pci_ops	= {
> >  		.map_bus	= pci_ecam_map_bus,
> 
> This could be split to its own patch, no big deal either way.

Done.  v6 is now a series that includes this as a separate patch.

> >  const struct pci_ecam_ops xgene_v2_pcie_ecam_ops = {
> > -	.bus_shift	= 16,
> >  	.init		= xgene_v2_pcie_ecam_init,
> >  	.pci_ops	= {
> >  		.map_bus	= xgene_pcie_map_bus,
> 
> Thanks for mentioning this change in the cover letter.  It could also
> be split off to a preparatory patch, since it's not related to
> PCIE_ECAM_OFFSET(), which is the main point of this patch.

Done.
 
> >  static void __iomem *iproc_pcie_map_ep_cfg_reg(struct iproc_pcie *pcie,
> >  					       unsigned int busno,
> > -					       unsigned int slot,
> > -					       unsigned int fn,
> > +					       unsigned int devfn,
> 
> This interface change *could* be a separate preparatory patch, too,
> but I'm starting to feel even more OCD than usual :)

Done.  It's a separate patch in v6, although I kept it together with the
change to introduce the PCIE_ECAM_OFFSET() macro since I was retiring the
use of PCI_SLOT() and PCI_FUNC() macros.

> > @@ -94,7 +95,7 @@ struct vmd_dev {
> >  	struct pci_dev		*dev;
> >  
> >  	spinlock_t		cfg_lock;
> > -	char __iomem		*cfgbar;
> > +	void __iomem		*cfgbar;
> 
> This type change might be worth pushing to a separate patch since the
> casting issues are not completely trivial.

Done.

The patch included in the series as part of v6 already got a review from
David Laight (thank you!) who suggests that this might not be a good
idea to do, and keeping existing type would be better.

Krzysztof
