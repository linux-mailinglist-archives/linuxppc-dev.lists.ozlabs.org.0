Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7467369533B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Feb 2023 22:39:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFyQm2wbdz3cCc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 08:39:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tQL42HF5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tQL42HF5;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFyPs1ZGCz3bby
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 08:38:25 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9C964612B4;
	Mon, 13 Feb 2023 21:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF532C433D2;
	Mon, 13 Feb 2023 21:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676324302;
	bh=9nebqvQ7ySSjFeV8SLUotJs6wqet5/xLHxl7MoVxxEg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=tQL42HF5NlkdQ3RbhTe7i9NDKF4D/lyFwaas814GdXW3JnyXEgRsN1Fonkm1P1apG
	 CMnWRRWHVpScq3GbQGxTP+nYGIqVZOgrQjpIOiJ92tNY20409xP4PlK+YeXicSUnsm
	 6JUN6CoqbYIK/Kzw3+7fIxORg/6Xdg3PDjdcLIIGWUifm3J/mmWYPNMacHy8U6HfL9
	 sNj4zyexO3vVHukETDYbjzU92v4W+8W/ELpwR+5P2EEkwB9O3OKPVw4AbPeertcNir
	 F85jNu4KczfP51l6rfGFEEqYTGLST/+bheozyDdUudGIKdP6O6VwMzmCJXS0PjvtyF
	 EAz3WDtyMLbGQ==
Date: Mon, 13 Feb 2023 15:38:20 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH RFC] PCI/AER: Enable internal AER errors by default
Message-ID: <20230213213820.GA2935044@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230209-cxl-pci-aer-v1-1-f9a817fa4016@intel.com>
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
Cc: Alison Schofield <alison.schofield@intel.com>, Dave Jiang <dave.jiang@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, Jonathan Cameron <Jonathan.Cameron@Huawei.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Bjorn Helgaas <bhelgaas@google.com>, Oliver O'Halloran <oohall@gmail.com>, linux-pci@vger.kernel.org, Ben Widawsky <bwidawsk@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Stefan Roese <sr@denx.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 10, 2023 at 02:33:23PM -0800, Ira Weiny wrote:
> The CXL driver expects internal error reporting to be enabled via
> pci_enable_pcie_error_reporting().  It is likely other drivers expect the same.
> Dave submitted a patch to enable the CXL side[1] but the PCI AER registers
> still mask errors.
> 
> PCIe v6.0 Uncorrectable Mask Register (7.8.4.3) and Correctable Mask
> Register (7.8.4.6) default to masking internal errors.  The
> Uncorrectable Error Severity Register (7.8.4.4) defaults internal errors
> as fatal.
> 
> Enable internal errors to be reported via the standard
> pci_enable_pcie_error_reporting() call.  Ensure uncorrectable errors are set
> non-fatal to limit any impact to other drivers.

Do you have any background on why the spec makes these errors masked
by default?  I'm sympathetic to wanting to learn about all the errors
we can, but I'm a little wary if the spec authors thought it was
important to mask these by default.

> [1] https://lore.kernel.org/all/167604864163.2392965.5102660329807283871.stgit@djiang5-mobl3.local/
> 
> Cc: Bjorn Helgaas <helgaas@kernel.org>
> Cc: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Dave Jiang <dave.jiang@intel.com>
> Cc: Stefan Roese <sr@denx.de>
> Cc: "Kuppuswamy Sathyanarayanan" <sathyanarayanan.kuppuswamy@linux.intel.com>
> Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
> Cc: Oliver O'Halloran <oohall@gmail.com>
> Cc: linux-cxl@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-pci@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> ---
> This is RFC to see if it is acceptable to be part of the standard
> pci_enable_pcie_error_reporting() call or perhaps a separate pci core
> call should be introduced.  It is anticipated that enabling this error
> reporting is what existing drivers are expecting.  The errors are marked
> non-fatal therefore it should not adversely affect existing devices.
> ---
>  drivers/pci/pcie/aer.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 625f7b2cafe4..9d3ed3a5fc23 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -229,11 +229,28 @@ int pcie_aer_is_native(struct pci_dev *dev)
>  
>  int pci_enable_pcie_error_reporting(struct pci_dev *dev)
>  {
> +	int pos_cap_err;
> +	u32 reg;
>  	int rc;
>  
>  	if (!pcie_aer_is_native(dev))
>  		return -EIO;
>  
> +	pos_cap_err = dev->aer_cap;
> +
> +	/* Unmask correctable and uncorrectable (non-fatal) internal errors */
> +	pci_read_config_dword(dev, pos_cap_err + PCI_ERR_COR_MASK, &reg);
> +	reg &= ~PCI_ERR_COR_INTERNAL;
> +	pci_write_config_dword(dev, pos_cap_err + PCI_ERR_COR_MASK, reg);
> +
> +	pci_read_config_dword(dev, pos_cap_err + PCI_ERR_UNCOR_SEVER, &reg);
> +	reg &= ~PCI_ERR_UNC_INTN;
> +	pci_write_config_dword(dev, pos_cap_err + PCI_ERR_UNCOR_SEVER, reg);
> +
> +	pci_read_config_dword(dev, pos_cap_err + PCI_ERR_UNCOR_MASK, &reg);
> +	reg &= ~PCI_ERR_UNC_INTN;
> +	pci_write_config_dword(dev, pos_cap_err + PCI_ERR_UNCOR_MASK, reg);
> +
>  	rc = pcie_capability_set_word(dev, PCI_EXP_DEVCTL, PCI_EXP_AER_FLAGS);
>  	return pcibios_err_to_errno(rc);
>  }
> 
> ---
> base-commit: e5ab7f206ffc873160bd0f1a52cae17ab692a9d1
> change-id: 20230209-cxl-pci-aer-18dda61c8239
> 
> Best regards,
> -- 
> Ira Weiny <ira.weiny@intel.com>
> 
