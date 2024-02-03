Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BB88483DA
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Feb 2024 06:00:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DAQaeQoE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TRgT03MBhz3dDT
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Feb 2024 16:00:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DAQaeQoE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=qingshun.wang@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TRgS90FSrz30gM
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Feb 2024 16:00:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706936409; x=1738472409;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kf32GCMyGnr3JaXaP9xyzsdixQItASwsYvGjp9HHTXk=;
  b=DAQaeQoEmimGLOD7SAjr9ycf/d2tiYqfNWeWcjlidNP4EpAC8w3d+vrL
   iMh5RZuV3vC4K4qCgv2hke1Wd6sD5EEHjTas2XfwLSAMP+wzCK2YrPBPF
   KynXiKP0+uRicBp4HOWZk9iMNdmZ5SuojXS0RJ1Lr1wzGt580c7+qPOk1
   tz2UGsXIBe9tmaRv74E9661WgR14zBfADIMPnInFTdEP5iNWCrKjX6kiv
   d/r2IiKCqweGrzvck/DZeJqnWuGoUFxzVl8pgtZ1wg2njWc6Dju7DWpxA
   CLH9qo9jmtippQBFCTPMugiCt2WrWfbsioFFXXLKA2fOs/n5oQl/zz7tV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="193959"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="193959"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 21:00:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="4864772"
Received: from yanqiu-mobl.ccr.corp.intel.com (HELO localhost) ([10.254.214.166])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 20:59:53 -0800
Date: Sat, 3 Feb 2024 12:59:44 +0800
From: "Wang, Qingshun" <qingshun.wang@linux.intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v2 3/4] PCI/AER: Fetch information for FTrace
Message-ID: <7ajtd5skxgfkkwolsbxrd7y2yzfjsikffkg4shxvpumconc2rz@i7hk4gvirrx2>
References: <20240125062802.50819-1-qingshun.wang@linux.intel.com>
 <20240125062802.50819-4-qingshun.wang@linux.intel.com>
 <65bd2e04aed44_2d43c29463@dwillia2-mobl3.amr.corp.intel.com.notmuch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65bd2e04aed44_2d43c29463@dwillia2-mobl3.amr.corp.intel.com.notmuch>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Alison Schofield <alison.schofield@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org, erwin.tsaur@intel.com, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>, chao.p.peng@linux.intel.com, Ira Weiny <ira.weiny@intel.com>, Davidlohr Bueso <dave@stgolabs.net>, Dave Jiang <dave.jiang@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, Smita Koralahalli <Smita.KoralahalliChannabasappa@amd.com>, linux-acpi@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>, Len Brown <lenb@kernel.org>, Robert Richter <rrichter@amd.com>, Borislav Petkov <bp@alien8.de>, Jonathan Cameron <jonathan.cameron@huawei.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-edac@vger.kernel.org, Tony Luck <tony.luck@intel.com>, feiting.wanyan@intel.com, qingshun.wang@intel.com, Adam Preble <adam.c.preble@intel.com>, Mahesh J Salgaonkar <m
 ahesh@linux.ibm.com>, Li Yang <leoyang.li@nxp.com>, Lukas Wunner <lukas@wunner.de>, James Morse <james.morse@arm.com>, linuxppc-dev@lists.ozlabs.org, Shiju Jose <shiju.jose@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 02, 2024 at 10:01:40AM -0800, Dan Williams wrote:
> Wang, Qingshun wrote:
> > Fetch and store the data of 3 more registers: "Link Status", "Device
> > Control 2", and "Advanced Error Capabilities and Control". This data is
> > needed for external observation to better understand ANFE.
> > 
> > Signed-off-by: "Wang, Qingshun" <qingshun.wang@linux.intel.com>
> > ---
> >  drivers/acpi/apei/ghes.c |  8 +++++++-
> >  drivers/cxl/core/pci.c   | 11 ++++++++++-
> >  drivers/pci/pci.h        |  4 ++++
> >  drivers/pci/pcie/aer.c   | 26 ++++++++++++++++++++------
> >  include/linux/aer.h      |  6 ++++--
> >  5 files changed, 45 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
> > index 6034039d5cff..047cc01be68c 100644
> > --- a/drivers/acpi/apei/ghes.c
> > +++ b/drivers/acpi/apei/ghes.c
> > @@ -594,7 +594,9 @@ static void ghes_handle_aer(struct acpi_hest_generic_data *gdata)
> >  	if (pcie_err->validation_bits & CPER_PCIE_VALID_DEVICE_ID &&
> >  	    pcie_err->validation_bits & CPER_PCIE_VALID_AER_INFO) {
> >  		struct pcie_capability_regs *pcie_caps;
> > +		u16 device_control_2 = 0;
> >  		u16 device_status = 0;
> > +		u16 link_status = 0;
> >  		unsigned int devfn;
> >  		int aer_severity;
> >  		u8 *aer_info;
> > @@ -619,7 +621,9 @@ static void ghes_handle_aer(struct acpi_hest_generic_data *gdata)
> >  
> >  		if (pcie_err->validation_bits & CPER_PCIE_VALID_CAPABILITY) {
> >  			pcie_caps = (struct pcie_capability_regs *)pcie_err->capability;
> > +			device_control_2 = pcie_caps->device_control_2;
> >  			device_status = pcie_caps->device_status;
> > +			link_status = pcie_caps->link_status;
> >  		}
> >  
> >  		aer_recover_queue(pcie_err->device_id.segment,
> > @@ -627,7 +631,9 @@ static void ghes_handle_aer(struct acpi_hest_generic_data *gdata)
> >  				  devfn, aer_severity,
> >  				  (struct aer_capability_regs *)
> >  				  aer_info,
> > -				  device_status);
> > +				  device_status,
> > +				  link_status,
> > +				  device_control_2);
> >  	}
> >  #endif
> >  }
> > diff --git a/drivers/cxl/core/pci.c b/drivers/cxl/core/pci.c
> > index 9111a4415a63..3aa57fe8db42 100644
> > --- a/drivers/cxl/core/pci.c
> > +++ b/drivers/cxl/core/pci.c
> > @@ -903,7 +903,9 @@ static void cxl_handle_rdport_errors(struct cxl_dev_state *cxlds)
> >  	struct aer_capability_regs aer_regs;
> >  	struct cxl_dport *dport;
> >  	struct cxl_port *port;
> > +	u16 device_control_2;
> >  	u16 device_status;
> > +	u16 link_status;
> >  	int severity;
> >  
> >  	port = cxl_pci_find_port(pdev, &dport);
> > @@ -918,10 +920,17 @@ static void cxl_handle_rdport_errors(struct cxl_dev_state *cxlds)
> >  	if (!cxl_rch_get_aer_severity(&aer_regs, &severity))
> >  		return;
> >  
> > +	if (pcie_capability_read_word(pdev, PCI_EXP_DEVCTL2, &device_control_2))
> > +		return;
> > +
> >  	if (pcie_capability_read_word(pdev, PCI_EXP_DEVSTA, &device_status))
> >  		return;
> >  
> > -	pci_print_aer(pdev, severity, &aer_regs, device_status);
> > +	if (pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &link_status))
> > +		return;
> > +
> > +	pci_print_aer(pdev, severity, &aer_regs, device_status,
> > +		      link_status, device_control_2);
> 
> Rather than complicate the calling convention of pci_print_aer(), update
> the internals of pci_print_aer() to get these extra registers, or
> provide a new wrapper interface that satisfies the dependencies and
> switch users over to that.  Otherwise multiple touches of the same code
> path in one patch set is indicative of the need for a higher level
> helper.

Thanks for the advice, it does make sense. Will reconsider the
implementation.

--
Best regards,
Wang, Qingshun
