Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED61E6E1322
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 19:05:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Py5Yy6fSlz3fSH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 03:05:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=<UNKNOWN>)
X-Greylist: delayed 218 seconds by postgrey-1.36 at boromir; Fri, 14 Apr 2023 03:05:13 AEST
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Py5YP5bDSz3c7S
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 03:05:13 +1000 (AEST)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Py5XC1KD8z67Qj6;
	Fri, 14 Apr 2023 01:04:11 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 13 Apr
 2023 18:05:09 +0100
Date: Thu, 13 Apr 2023 18:05:08 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Robert Richter <rrichter@amd.com>
Subject: Re: [PATCH v3 6/6] PCI/AER: Unmask RCEC internal errors to enable
 RCH downstream port error handling
Message-ID: <20230413180508.00003f13@Huawei.com>
In-Reply-To: <ZDgFv6AtCXkVl8IQ@rric.localdomain>
References: <20230411180302.2678736-7-terry.bowman@amd.com>
	<20230412212901.GA81099@bhelgaas>
	<ZDgFv6AtCXkVl8IQ@rric.localdomain>
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
Cc: alison.schofield@intel.com, dave.jiang@intel.com, Terry Bowman <terry.bowman@amd.com>, vishal.l.verma@intel.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, bhelgaas@google.com, Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org, bwidawsk@kernel.org, Oliver O'Halloran <oohall@gmail.com>, dan.j.williams@intel.com, ira.weiny@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 13 Apr 2023 15:38:07 +0200
Robert Richter <rrichter@amd.com> wrote:

> On 12.04.23 16:29:01, Bjorn Helgaas wrote:
> > On Tue, Apr 11, 2023 at 01:03:02PM -0500, Terry Bowman wrote:  
> > > From: Robert Richter <rrichter@amd.com>
> > > 
> > > RCEC AER corrected and uncorrectable internal errors (CIE/UIE) are
> > > disabled by default.  
> > 
> > "Disabled by default" just means "the power-up state of CIE/UIC is
> > that they are masked", right?  It doesn't mean that Linux normally
> > masks them.  
> 
> Yes, will change the wording here.
> 
> > > [1][2] Enable them to receive CXL downstream port
> > > errors of a Restricted CXL Host (RCH).
> > > 
> > > [1] CXL 3.0 Spec, 12.2.1.1 - RCH Downstream Port Detected Errors
> > > [2] PCIe Base Spec 6.0, 7.8.4.3 Uncorrectable Error Mask Register,
> > >     7.8.4.6 Correctable Error Mask Register
> > > 
> > > Co-developed-by: Terry Bowman <terry.bowman@amd.com>
> > > Signed-off-by: Robert Richter <rrichter@amd.com>
> > > Signed-off-by: Terry Bowman <terry.bowman@amd.com>
> > > Cc: "Oliver O'Halloran" <oohall@gmail.com>
> > > Cc: Bjorn Helgaas <bhelgaas@google.com>
> > > Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
> > > Cc: linuxppc-dev@lists.ozlabs.org
> > > Cc: linux-pci@vger.kernel.org
> > > ---
> > >  drivers/pci/pcie/aer.c | 73 ++++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 73 insertions(+)
> > > 
> > > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > > index 171a08fd8ebd..3973c731e11d 100644
> > > --- a/drivers/pci/pcie/aer.c
> > > +++ b/drivers/pci/pcie/aer.c
> > > @@ -1000,7 +1000,79 @@ static void cxl_handle_error(struct pci_dev *dev, struct aer_err_info *info)
> > >  		pcie_walk_rcec(dev, cxl_handle_error_iter, info);
> > >  }
> > >  
> > > +static bool cxl_error_is_native(struct pci_dev *dev)
> > > +{
> > > +	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
> > > +
> > > +	if (pcie_ports_native)
> > > +		return true;
> > > +
> > > +	return host->native_aer && host->native_cxl_error;
> > > +}
> > > +
> > > +static int handles_cxl_error_iter(struct pci_dev *dev, void *data)
> > > +{
> > > +	int *handles_cxl = data;
> > > +
> > > +	*handles_cxl = is_cxl_mem_dev(dev) && cxl_error_is_native(dev);
> > > +
> > > +	return *handles_cxl;
> > > +}
> > > +
> > > +static bool handles_cxl_errors(struct pci_dev *rcec)
> > > +{
> > > +	int handles_cxl = 0;
> > > +
> > > +	if (!rcec->aer_cap)
> > > +		return false;
> > > +
> > > +	if (pci_pcie_type(rcec) == PCI_EXP_TYPE_RC_EC)
> > > +		pcie_walk_rcec(rcec, handles_cxl_error_iter, &handles_cxl);
> > > +
> > > +	return !!handles_cxl;
> > > +}
> > > +
> > > +static int __cxl_unmask_internal_errors(struct pci_dev *rcec)
> > > +{
> > > +	int aer, rc;
> > > +	u32 mask;
> > > +
> > > +	/*
> > > +	 * Internal errors are masked by default, unmask RCEC's here
> > > +	 * PCI6.0 7.8.4.3 Uncorrectable Error Mask Register (Offset 08h)
> > > +	 * PCI6.0 7.8.4.6 Correctable Error Mask Register (Offset 14h)
> > > +	 */  
> > 
> > Unmasking internal errors doesn't have anything specific to do with
> > CXL, so I don't think it should have "cxl" in the function name.
> > Maybe something like "pci_aer_unmask_internal_errors()".  
> 
> Since it is static I renamed it to aer_unmask_internal_errors() and
> also moved it to the beginning of the #ifdef block for easier later
> reuse.
> 
> > 
> > This also has nothing special to do with RCECs, so I think we should
> > refer to the device as "dev" as is typical in this file.  
> 
> Changed.
> 
> > 
> > I think this needs to check pcie_aer_is_native() as is done by
> > pci_aer_clear_nonfatal_status() and other functions that write the AER
> > Capability.  
> 
> Also added the check to aer_unmask_internal_errors(). There was a
> check for native_* in handles_cxl_errors() already, but only for the
> pci devs of the RCEC. I added a check of the RCEC there too.
> 
> > 
> > With the exception of this function, this patch looks like all CXL
> > code that maybe could be with other CXL code.  Would require making
> > pcie_walk_rcec() available outside drivers/pci, I guess.  
> 
> Even this is CXL code, it implements AER support and fits better here
> around AER code. Export of pcie_walk_rcec() (and others?) is not the
> main issue here. CXL drivers can come as modules and would need to
> register a hook at the aer handler.  This would add even more
> complexity here. In contrast, current solution just adds two functions
> for enablement and handling which are empty stubs if code is disabled.
> 
> I could move that code to aer_cxl.c similar to aer_inject.c. Since the
> CXL part is small compared to the remaining aer code I left it in
> aer.c. Also, it is guarded by #ifdef which additionally encapsulates
> it.
> 

To throw another option in there (what Bjorn suggested IIRC for the more
general case..) 

Just enable internal errors always.  No need to know if they are CXL
or something else.

There will/might be fallout and it will be fun.

Jonathan

> >   
> > > +	aer = rcec->aer_cap;
> > > +	rc = pci_read_config_dword(rcec, aer + PCI_ERR_UNCOR_MASK, &mask);
> > > +	if (rc)
> > > +		return rc;
> > > +	mask &= ~PCI_ERR_UNC_INTN;
> > > +	rc = pci_write_config_dword(rcec, aer + PCI_ERR_UNCOR_MASK, mask);
> > > +	if (rc)
> > > +		return rc;
> > > +
> > > +	rc = pci_read_config_dword(rcec, aer + PCI_ERR_COR_MASK, &mask);
> > > +	if (rc)
> > > +		return rc;
> > > +	mask &= ~PCI_ERR_COR_INTERNAL;
> > > +	rc = pci_write_config_dword(rcec, aer + PCI_ERR_COR_MASK, mask);
> > > +
> > > +	return rc;
> > > +}
> > > +
> > > +static void cxl_unmask_internal_errors(struct pci_dev *rcec)  
> 
> Also renaming this to cxl_enable_rcec() to more generalize the
> function.
> 
> > > +{
> > > +	if (!handles_cxl_errors(rcec))
> > > +		return;
> > > +
> > > +	if (__cxl_unmask_internal_errors(rcec))
> > > +		dev_err(&rcec->dev, "cxl: Failed to unmask internal errors");
> > > +	else
> > > +		dev_dbg(&rcec->dev, "cxl: Internal errors unmasked");  
> 
> I am going to change this to a pci_info() for alignment with other
> messages around:
> 
> [   14.200265] pcieport 0000:40:00.3: PME: Signaling with IRQ 44
> [   14.213925] pcieport 0000:40:00.3: AER: cxl: Internal errors unmasked
> [   14.228413] pcieport 0000:40:00.3: AER: enabled with IRQ 44
> 
> Plus, using pci_err() instead of dev_err().
> 
> > > +}
> > > +
> > >  #else
> > > +static inline void cxl_unmask_internal_errors(struct pci_dev *dev) { }
> > >  static inline void cxl_handle_error(struct pci_dev *dev,
> > >  				    struct aer_err_info *info) { }
> > >  #endif
> > > @@ -1397,6 +1469,7 @@ static int aer_probe(struct pcie_device *dev)
> > >  		return status;
> > >  	}
> > >  
> > > +	cxl_unmask_internal_errors(port);
> > >  	aer_enable_rootport(rpc);
> > >  	pci_info(port, "enabled with IRQ %d\n", dev->irq);
> > >  	return 0;
> > > -- 
> > > 2.34.1
> > >   
> 
> Thanks for review,
> 
> -Robert

