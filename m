Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA1589D38
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 13:37:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466Yjf2HMxzDqlY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 21:37:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=lorenzo.pieralisi@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 466Ygv3xPLzDqZx
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2019 21:35:53 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3FC615AB;
 Mon, 12 Aug 2019 04:35:50 -0700 (PDT)
Received: from e121166-lin.cambridge.arm.com (unknown [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4384D3F706;
 Mon, 12 Aug 2019 04:35:48 -0700 (PDT)
Date: Mon, 12 Aug 2019 12:35:43 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: Re: [EXT] Re: [PATCHv3 1/2] PCI: layerscape: Add the bar_fixed_64bit
 property in EP driver.
Message-ID: <20190812113543.GA25040@e121166-lin.cambridge.arm.com>
References: <20190628013826.4705-1-xiaowei.bao@nxp.com>
 <20190812101213.GB20861@e121166-lin.cambridge.arm.com>
 <AM5PR04MB329929A0B046F6BEB94B0120F5D30@AM5PR04MB3299.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AM5PR04MB329929A0B046F6BEB94B0120F5D30@AM5PR04MB3299.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Roy Zang <roy.zang@nxp.com>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "pombredanne@nexb.com" <pombredanne@nexb.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>, "kishon@ti.com" <kishon@ti.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "shawn.lin@rock-chips.com" <shawn.lin@rock-chips.com>,
 Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 12, 2019 at 10:39:00AM +0000, Xiaowei Bao wrote:
> 
> 
> > -----Original Message-----
> > From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> > Sent: 2019年8月12日 18:12
> > To: Xiaowei Bao <xiaowei.bao@nxp.com>; kishon@ti.com
> > Cc: bhelgaas@google.com; robh+dt@kernel.org; mark.rutland@arm.com;
> > shawnguo@kernel.org; Leo Li <leoyang.li@nxp.com>; arnd@arndb.de;
> > gregkh@linuxfoundation.org; M.h. Lian <minghuan.lian@nxp.com>; Mingkai
> > Hu <mingkai.hu@nxp.com>; Roy Zang <roy.zang@nxp.com>;
> > kstewart@linuxfoundation.org; pombredanne@nexb.com;
> > shawn.lin@rock-chips.com; linux-pci@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; linuxppc-dev@lists.ozlabs.org
> > Subject: [EXT] Re: [PATCHv3 1/2] PCI: layerscape: Add the bar_fixed_64bit
> > property in EP driver.
> > 
> > Caution: EXT Email
> > 
> > First off:
> > 
> > Trim the CC list, you CC'ed maintainers (and mailing lists) for no reasons
> > whatsover.
> [Xiaowei Bao]Hi Lorenzo, I am not clear why the mail list is the CC, I use the command "git send-email --to", I will try to send the patch again, do I need to modify the version is v4 when I send this patch again?

Yes you do.

Wrap lines to max 80 characters. There is no need to add [Xiaowei Bao].

1) Read, email etiquette

https://kernelnewbies.org/PatchCulture

2) get_maintainer.pl -f drivers/pci/controller/dwc/pci-layerscape.c

Compare the output to the people in CC, trim it accordingly.

3) The NXP maintainers in the MAINTAINERS file have not given a single
   comment for this patchset. Either they show up or I will remove them
   from the MAINTAINERS list.

4) Before submitting patches, talk to someone at NXP who can help you
   format them in preparation for posting, I do not have time to write
   guidelines for everyone posting on linux-pci, sorry, the information
   is out there if you care to read it.

Thanks,
Lorenzo

> > 
> > Then, read this:
> > 
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.ke
> > rnel.org%2Flinux-pci%2F20171026223701.GA25649%40bhelgaas-glaptop.roa
> > m.corp.google.com%2F&amp;data=02%7C01%7Cxiaowei.bao%40nxp.com%7
> > C1c586178e23c423a0e8808d71f0d8f6f%7C686ea1d3bc2b4c6fa92cd99c5c30
> > 1635%7C0%7C0%7C637012015426788575&amp;sdata=3bx1bDFIzik8FnD0wl
> > duAUv7wtLdD1J3hQ3xNH2xmFY%3D&amp;reserved=0
> > 
> > and make your patches compliant please.
> > 
> > On Fri, Jun 28, 2019 at 09:38:25AM +0800, Xiaowei Bao wrote:
> > > The PCIe controller of layerscape just have 4 BARs, BAR0 and BAR1 is
> > > 32bit, BAR3 and BAR4 is 64bit, this is determined by hardware, so set
> > > the bar_fixed_64bit with 0x14.
> > >
> > > Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> > > ---
> > > v2:
> > >  - Replace value 0x14 with a macro.
> > > v3:
> > >  - No change.
> > >
> > >  drivers/pci/controller/dwc/pci-layerscape-ep.c |    1 +
> > >  1 files changed, 1 insertions(+), 0 deletions(-)
> > >
> > > diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > > b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > > index be61d96..227c33b 100644
> > > --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > > +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > > @@ -44,6 +44,7 @@ static int ls_pcie_establish_link(struct dw_pcie *pci)
> > >       .linkup_notifier = false,
> > >       .msi_capable = true,
> > >       .msix_capable = false,
> > > +     .bar_fixed_64bit = (1 << BAR_2) | (1 << BAR_4),
> > 
> > I would appreciate Kishon's ACK on this.
> > 
> > Lorenzo
> > 
> > >  };
> > >
> > >  static const struct pci_epc_features*
> > > --
> > > 1.7.1
> > >
