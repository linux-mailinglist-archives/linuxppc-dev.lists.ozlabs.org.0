Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C398DF075C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 21:56:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47725c5rFSzF560
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 07:56:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=lorenzo.pieralisi@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 47723l5H4ZzF3n2
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 07:54:58 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36D7C30E;
 Tue,  5 Nov 2019 12:54:56 -0800 (PST)
Received: from e121166-lin.cambridge.arm.com (e121166-lin.cambridge.arm.com
 [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A0CB4014A;
 Tue,  5 Nov 2019 04:37:41 -0800 (PST)
Date: Tue, 5 Nov 2019 12:37:39 +0000
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v2 07/10] PCI: layerscape: Modify the MSIX to the
 doorbell way
Message-ID: <20191105123739.GB26960@e121166-lin.cambridge.arm.com>
References: <20190822112242.16309-1-xiaowei.bao@nxp.com>
 <20190822112242.16309-7-xiaowei.bao@nxp.com>
 <20190823135816.GH14582@e119886-lin.cambridge.arm.com>
 <AM5PR04MB3299E50BA5D7579D41B8B4F9F5A70@AM5PR04MB3299.eurprd04.prod.outlook.com>
 <20190827132504.GL14582@e119886-lin.cambridge.arm.com>
 <e64a484c-7cf5-5f65-400c-47128ab45e52@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e64a484c-7cf5-5f65-400c-47128ab45e52@ti.com>
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
 "lorenzo.pieralisi@arm.co" <lorenzo.pieralisi@arm.co>,
 Xiaowei Bao <xiaowei.bao@nxp.com>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 Andrew Murray <andrew.murray@arm.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 29, 2019 at 10:43:18AM +0530, Kishon Vijay Abraham I wrote:
> Gustavo,
> 
> On 27/08/19 6:55 PM, Andrew Murray wrote:
> > On Sat, Aug 24, 2019 at 12:08:40AM +0000, Xiaowei Bao wrote:
> >>
> >>
> >>> -----Original Message-----
> >>> From: Andrew Murray <andrew.murray@arm.com>
> >>> Sent: 2019年8月23日 21:58
> >>> To: Xiaowei Bao <xiaowei.bao@nxp.com>
> >>> Cc: bhelgaas@google.com; robh+dt@kernel.org; mark.rutland@arm.com;
> >>> shawnguo@kernel.org; Leo Li <leoyang.li@nxp.com>; kishon@ti.com;
> >>> lorenzo.pieralisi@arm.co; arnd@arndb.de; gregkh@linuxfoundation.org; M.h.
> >>> Lian <minghuan.lian@nxp.com>; Mingkai Hu <mingkai.hu@nxp.com>; Roy
> >>> Zang <roy.zang@nxp.com>; jingoohan1@gmail.com;
> >>> gustavo.pimentel@synopsys.com; linux-pci@vger.kernel.org;
> >>> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> >>> linux-arm-kernel@lists.infradead.org; linuxppc-dev@lists.ozlabs.org
> >>> Subject: Re: [PATCH v2 07/10] PCI: layerscape: Modify the MSIX to the
> >>> doorbell way
> >>>
> >>> On Thu, Aug 22, 2019 at 07:22:39PM +0800, Xiaowei Bao wrote:
> >>>> The layerscape platform use the doorbell way to trigger MSIX interrupt
> >>>> in EP mode.
> >>>>
> >>>
> >>> I have no problems with this patch, however...
> >>>
> >>> Are you able to add to this message a reason for why you are making this
> >>> change? Did dw_pcie_ep_raise_msix_irq not work when func_no != 0? Or did
> >>> it work yet dw_pcie_ep_raise_msix_irq_doorbell is more efficient?
> >>
> >> The fact is that, this driver is verified in ls1046a platform of NXP before, and ls1046a don't
> >> support MSIX feature, so I set the msix_capable of pci_epc_features struct is false,
> >> but in other platform, e.g. ls1088a, it support the MSIX feature, I verified the MSIX
> >> feature in ls1088a, it is not OK, so I changed to another way. Thanks.
> > 
> > Right, so the existing pci-layerscape-ep.c driver never supported MSIX yet it
> > erroneously had a switch case statement to call dw_pcie_ep_raise_msix_irq which
> > would never get used.
> > 
> > Now that we're adding a platform with MSIX support the existing
> > dw_pcie_ep_raise_msix_irq doesn't work (for this platform) so we are adding a
> > different method.
> 
> Gustavo, can you confirm dw_pcie_ep_raise_msix_irq() works for
> designware as it didn't work for both me and Xiaowei?

This question needs an answer.

Thanks,
Lorenzo
