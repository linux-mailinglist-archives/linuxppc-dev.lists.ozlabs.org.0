Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2506EB0F68
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 15:02:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Tf6y3yJCzF4Ff
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 23:02:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=andrew.murray@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 46Tf4K3GChzF37y
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 22:59:43 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48B7B28;
 Thu, 12 Sep 2019 05:59:42 -0700 (PDT)
Received: from localhost (unknown [10.37.6.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B4FCE3F71F;
 Thu, 12 Sep 2019 05:59:41 -0700 (PDT)
Date: Thu, 12 Sep 2019 13:59:40 +0100
From: Andrew Murray <andrew.murray@arm.com>
To: Xiaowei Bao <xiaowei.bao@nxp.com>, helgaas@kernel.org
Subject: Re: [PATCH v3 11/11] misc: pci_endpoint_test: Add LS1088a in
 pci_device_id table
Message-ID: <20190912125939.GE9720@e119886-lin.cambridge.arm.com>
References: <20190902031716.43195-1-xiaowei.bao@nxp.com>
 <20190902031716.43195-12-xiaowei.bao@nxp.com>
 <20190902125454.GK9720@e119886-lin.cambridge.arm.com>
 <AM5PR04MB3299D598229952C13C492B48F5B90@AM5PR04MB3299.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AM5PR04MB3299D598229952C13C492B48F5B90@AM5PR04MB3299.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1+81 (426a6c1) (2018-08-26)
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
 "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "Z.q. Hou" <zhiqiang.hou@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kishon@ti.com" <kishon@ti.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>,
 Leo Li <leoyang.li@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
 Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 03, 2019 at 01:52:30AM +0000, Xiaowei Bao wrote:
> 
> 
> > -----Original Message-----
> > From: Andrew Murray <andrew.murray@arm.com>
> > Sent: 2019年9月2日 20:55
> > To: Xiaowei Bao <xiaowei.bao@nxp.com>
> > Cc: robh+dt@kernel.org; mark.rutland@arm.com; shawnguo@kernel.org; Leo
> > Li <leoyang.li@nxp.com>; kishon@ti.com; lorenzo.pieralisi@arm.com; M.h.
> > Lian <minghuan.lian@nxp.com>; Mingkai Hu <mingkai.hu@nxp.com>; Roy
> > Zang <roy.zang@nxp.com>; jingoohan1@gmail.com;
> > gustavo.pimentel@synopsys.com; linux-pci@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; linuxppc-dev@lists.ozlabs.org;
> > arnd@arndb.de; gregkh@linuxfoundation.org; Z.q. Hou
> > <zhiqiang.hou@nxp.com>
> > Subject: Re: [PATCH v3 11/11] misc: pci_endpoint_test: Add LS1088a in
> > pci_device_id table
> > 
> > On Mon, Sep 02, 2019 at 11:17:16AM +0800, Xiaowei Bao wrote:
> > > Add LS1088a in pci_device_id table so that pci-epf-test can be used
> > > for testing PCIe EP in LS1088a.
> > >
> > > Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> > > ---
> > > v2:
> > >  - No change.
> > > v3:
> > >  - No change.
> > >
> > >  drivers/misc/pci_endpoint_test.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/misc/pci_endpoint_test.c
> > > b/drivers/misc/pci_endpoint_test.c
> > > index 6e208a0..d531951 100644
> > > --- a/drivers/misc/pci_endpoint_test.c
> > > +++ b/drivers/misc/pci_endpoint_test.c
> > > @@ -793,6 +793,7 @@ static const struct pci_device_id
> > pci_endpoint_test_tbl[] = {
> > >  	{ PCI_DEVICE(PCI_VENDOR_ID_TI, PCI_DEVICE_ID_TI_DRA74x) },
> > >  	{ PCI_DEVICE(PCI_VENDOR_ID_TI, PCI_DEVICE_ID_TI_DRA72x) },
> > >  	{ PCI_DEVICE(PCI_VENDOR_ID_FREESCALE, 0x81c0) },
> > > +	{ PCI_DEVICE(PCI_VENDOR_ID_FREESCALE, 0x80c0) },
> > 
> > The Freescale PCI devices are the only devices in this table that don't have a
> > define for their device ID. I think a define should be created for both of the
> > device IDs above.
> 
> OK, but I only define in this file, I am not sure this can define in include/linux/pci_ids.h
> file 

This file seems a little inconsistent...

 - Two of the TI device IDs are defined in pci_ids.h and only used in pci_endpoint_test.c
 - One of the TI device IDs are defined in pci_endpoint_test.c and only used there
 - The Freescale device ID is hardcoded and only used in pci_endpoint_test.c

The header in pci_ids.h has a comment suggestion definitions are only added where used
in multiple files - yet I don't think this holds true.

Bjorn - do you have a suggestion?

Thanks,

Andrew Murray

> 
> Thanks 
> Xiaowei
> 
> > 
> > Thanks,
> > 
> > Andrew Murray
> > 
> > >  	{ PCI_DEVICE_DATA(SYNOPSYS, EDDA, NULL) },
> > >  	{ PCI_DEVICE(PCI_VENDOR_ID_TI, PCI_DEVICE_ID_TI_AM654),
> > >  	  .driver_data = (kernel_ulong_t)&am654_data
> > > --
> > > 2.9.5
> > >
