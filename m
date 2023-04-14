Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4155D6E22B7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 13:56:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PyZfY1kmTz3fWj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 21:56:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=<UNKNOWN>)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PyZf335gMz3c8G
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 21:55:51 +1000 (AEST)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PyZXj4Qc2z67Ct2;
	Fri, 14 Apr 2023 19:51:17 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 14 Apr
 2023 12:55:44 +0100
Date: Fri, 14 Apr 2023 12:55:43 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Robert Richter <rrichter@amd.com>
Subject: Re: [PATCH v3 6/6] PCI/AER: Unmask RCEC internal errors to enable
 RCH downstream port error handling
Message-ID: <20230414125543.000021f6@Huawei.com>
In-Reply-To: <ZDk3QeWZDOP8sr4s@rric.localdomain>
References: <20230411180302.2678736-7-terry.bowman@amd.com>
	<20230412212901.GA81099@bhelgaas>
	<20230413180122.00007471@Huawei.com>
	<643887b44b2d4_3a1882949d@iweiny-mobl.notmuch>
	<ZDk3QeWZDOP8sr4s@rric.localdomain>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
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
Cc: alison.schofield@intel.com, dave.jiang@intel.com, Terry Bowman <terry.bowman@amd.com>, vishal.l.verma@intel.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org, Mahesh J
 Salgaonkar <mahesh@linux.ibm.com>, bhelgaas@google.com, Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org, bwidawsk@kernel.org, Oliver O'Halloran <oohall@gmail.com>, dan.j.williams@intel.com, Ira Weiny <ira.weiny@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 14 Apr 2023 13:21:37 +0200
Robert Richter <rrichter@amd.com> wrote:

> On 13.04.23 15:52:36, Ira Weiny wrote:
> > Jonathan Cameron wrote:  
> > > On Wed, 12 Apr 2023 16:29:01 -0500
> > > Bjorn Helgaas <helgaas@kernel.org> wrote:
> > >   
> > > > On Tue, Apr 11, 2023 at 01:03:02PM -0500, Terry Bowman wrote:  
> > > > > From: Robert Richter <rrichter@amd.com>
> > > > >   
> 
> > > > > +static int __cxl_unmask_internal_errors(struct pci_dev *rcec)
> > > > > +{
> > > > > +	int aer, rc;
> > > > > +	u32 mask;
> > > > > +
> > > > > +	/*
> > > > > +	 * Internal errors are masked by default, unmask RCEC's here
> > > > > +	 * PCI6.0 7.8.4.3 Uncorrectable Error Mask Register (Offset 08h)
> > > > > +	 * PCI6.0 7.8.4.6 Correctable Error Mask Register (Offset 14h)
> > > > > +	 */    
> > > > 
> > > > Unmasking internal errors doesn't have anything specific to do with
> > > > CXL, so I don't think it should have "cxl" in the function name.
> > > > Maybe something like "pci_aer_unmask_internal_errors()".  
> > > 
> > > This reminds me.  Not sure we resolved earlier discussion on changing
> > > the system wide policy to turn these on 
> > > https://lore.kernel.org/linux-cxl/20221229172731.GA611562@bhelgaas/
> > > which needs pretty much the same thing.
> > > 
> > > Ira, I think you were picking this one up?
> > > https://lore.kernel.org/linux-cxl/63e5fb533f304_13244829412@iweiny-mobl.notmuch/  
> > 
> > After this discussion I posted an RFC to enable those errors.
> > 
> > https://lore.kernel.org/all/20230209-cxl-pci-aer-v1-1-f9a817fa4016@intel.com/
> > 

Ah. I'd forgotten that thread. Thanks!

> > Unfortunately the prevailing opinion was that this was unsafe.  And no one
> > piped up with a reason to pursue the alternative of a pci core call to enable
> > them as needed.
> > 
> > So I abandoned the work.
> > 
> > I think the direction things where headed was to have a call like:
> > 
> > int pci_enable_pci_internal_errors(struct pci_dev *dev)
> > {
> > 	int pos_cap_err;
> > 	u32 reg;
> > 
> > 	if (!pcie_aer_is_native(dev))
> > 		return -EIO;
> > 
> > 	pos_cap_err = dev->aer_cap;
> > 
> > 	/* Unmask correctable and uncorrectable (non-fatal) internal errors */
> > 	pci_read_config_dword(dev, pos_cap_err + PCI_ERR_COR_MASK, &reg);
> > 	reg &= ~PCI_ERR_COR_INTERNAL;
> > 	pci_write_config_dword(dev, pos_cap_err + PCI_ERR_COR_MASK, reg);
> > 	
> > 	pci_read_config_dword(dev, pos_cap_err + PCI_ERR_UNCOR_SEVER, &reg);
> > 	reg &= ~PCI_ERR_UNC_INTN;
> > 	pci_write_config_dword(dev, pos_cap_err + PCI_ERR_UNCOR_SEVER, reg);
> > 	
> > 	pci_read_config_dword(dev, pos_cap_err + PCI_ERR_UNCOR_MASK, &reg);
> > 	reg &= ~PCI_ERR_UNC_INTN;
> > 	pci_write_config_dword(dev, pos_cap_err + PCI_ERR_UNCOR_MASK, reg);
> > 
> > 	return 0;
> > }
> > 
> > ... and call this from the cxl code where it is needed.  
> 
> The version I have ready after addressing Bjorn's comments is pretty
> much the same, apart from error checking of the read/writes.
> 
> From your patch proposed you will need it in aer.c too and we do not
> need to export it.

I think for the other components we'll want to call it from cxl_pci_ras_unmask()
so an export needed.

I also wonder if a more generic function would be better as seems likely
similar code will be needed for errors other than this pair.


> 
> This patch only enables it for (CXL) RCECs. You might want to extend
> this for CXL endpoints (and ports?) then.

Definitely.  We have the same limitation you are seeing.  No errors
without turning this on.

Jonathan



> 
> > 
> > Is this an acceptable direction?  Terry is welcome to steal the above from my
> > patch and throw it into the PCI core.
> > 
> > Looking at the current state of things I think cxl_pci_ras_unmask() may
> > actually be broken now without calling something like the above.  For that I
> > dropped the ball.  
> 
> Thanks,
> 
> -Robert
> 
> > 
> > Ira  

