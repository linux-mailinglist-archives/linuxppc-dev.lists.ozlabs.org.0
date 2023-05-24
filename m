Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7103371000E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 23:33:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QRPYy2qvHz3fDF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 07:33:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lMx/KN93;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lMx/KN93;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QRPY44Jl3z3f5l
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 May 2023 07:32:40 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8160B637F7;
	Wed, 24 May 2023 21:32:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C438C433D2;
	Wed, 24 May 2023 21:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684963956;
	bh=jEakiaLRopAlh8EvqotdkfZNKyp75Hnrsks6lmpmN1c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=lMx/KN93+1DYxUoebXEfpIAngoq3DKRNI3d5CSD854A1tcNDlVBI0iE4C70scU8sm
	 KGwFipr68UwHCLR4T+ihyZ9HONABD6psbG+n0SXFC8+Te5Un5id1807sZzjOnNX5wp
	 Z6yyiU5KrigwWsb6hLV3kwmVU1zinbF9mHkZFTzwSzwNLMyMwiGAiwt5VqqmfGkhKD
	 06HBFsXz3XHn25qy/53eF0jbsZf6B5LVMAL6bg9iVRByke0O+MEC+D5xyK4XlNjNxV
	 MCtiCiFWIGwkGHZ9S8xanSpBcd2UjMYipzwzLSIf1hGGxY5isALj0ZYAV1W1kVbRF6
	 ipYsxtcWURMaw==
Date: Wed, 24 May 2023 16:32:35 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Terry Bowman <terry.bowman@amd.com>
Subject: Re: [PATCH v4 22/23] PCI/AER: Forward RCH downstream port-detected
 errors to the CXL.mem dev handler
Message-ID: <ZG6Cc6uqYqTPel8P@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230523232214.55282-23-terry.bowman@amd.com>
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
Cc: alison.schofield@intel.com, dave.jiang@intel.com, rrichter@amd.com, vishal.l.verma@intel.com, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org, bhelgaas@google.com, Oliver O'Halloran <oohall@gmail.com>, Jonathan.Cameron@huawei.com, bwidawsk@kernel.org, dan.j.williams@intel.com, ira.weiny@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 23, 2023 at 06:22:13PM -0500, Terry Bowman wrote:
> From: Robert Richter <rrichter@amd.com>
> 
> In Restricted CXL Device (RCD) mode a CXL device is exposed as an
> RCiEP, but CXL downstream and upstream ports are not enumerated and
> not visible in the PCIe hierarchy. Protocol and link errors are sent
> to an RCEC.
>
> Restricted CXL host (RCH) downstream port-detected errors are signaled
> as internal AER errors, either Uncorrectable Internal Error (UIE) or
> Corrected Internal Errors (CIE). 

From the parallelism with RCD above, I first thought that RCH devices
were non-RCD mode and *were* enumerated as part of the PCIe hierarchy,
but actually I suspect it's more like the following?

  ... but CXL downstream and upstream ports are not enumerated and not
  visible in the PCIe hierarchy.

  Protocol and link errors from these non-enumerated ports are
  signaled as internal AER errors ... via a CXL RCEC.

> The error source is the id of the RCEC.

This seems odd; I assume this refers to the RCEC's AER Error Source
Identification register, and the ERR_COR or ERR_FATAL/NONFATAL Source
Identification would ordinarily be the Requester ID of the RCiEP that
"sent" the Error Message.  But you're saying it's actually the ID of
the *RCEC*, not the RCiEP?

We're going to call pci_aer_handle_error() as well, to handle the
non-internal errors, and I'm pretty sure that path expects the RCiEP
ID there.

Whatever the answer, I'm not sure this sentence is actually relevant
to this patch, since this patch doesn't read PCI_ERR_ROOT_ERR_SRC or
look at struct aer_err_source.id.

> A CXL handler must then inspect the error status in various CXL
> registers residing in the dport's component register space (CXL RAS
> capability) or the dport's RCRB (PCIe AER extended capability). [1]
> 
> Errors showing up in the RCEC's error handler must be handled and
> connected to the CXL subsystem. Implement this by forwarding the error
> to all CXL devices below the RCEC. Since the entire CXL device is
> controlled only using PCIe Configuration Space of device 0, function
> 0, only pass it there [2]. The error handling is limited to currently
> supported devices with the Memory Device class code set
> (PCI_CLASS_MEMORY_CXL, 502h), where the handler can be implemented in
> the existing cxl_pci driver. Support of CXL devices (e.g. a CXL.cache
> device) can be enabled later.

I assume the Memory Devices are CXL devices, so maybe "Error handling
for *other* CXL devices ... can be enabled later"?  

IIUC, this happens via cxl_rch_handle_error_iter() calling
pci_error_handlers for CXL RCiEPs.  Maybe the is_cxl_mem_dev() check
belongs inside those handlers, since that driver claimed the RCiEP and
should know its functionality?  Maybe is_internal_error() and
cxl_error_is_native(), too?

> In addition to errors directed to the CXL endpoint device, a handler
> must also inspect the CXL RAS and PCIe AER capabilities of the CXL
> downstream port that is connected to the device.
> 
> Since CXL downstream port errors are signaled using internal errors,
> the handler requires those errors to be unmasked. This is subject of a
> follow-on patch.
> 
> The reason for choosing this implementation is that a CXL RCEC device
> is bound to the AER port driver,

  ... is that the AER service driver claims the CXL RCEC device, but
  does not allow registration of a CXL sub-service driver ...

> but the driver does not allow it to
> register a custom specific handler to support CXL. Connecting the RCEC
> hard-wired with a CXL handler does not work, as the CXL subsystem
> might not be present all the time. The alternative to add an
> implementation to the portdrv to allow the registration of a custom
> RCEC error handler isn't worth doing it as CXL would be its only user.
> Instead, just check for an CXL RCEC and pass it down to the connected
> CXL device's error handler. With this approach the code can entirely
> be implemented in the PCIe AER driver and is independent of the CXL
> subsystem. The CXL driver only provides the handler.
> 
> [1] CXL 3.0 spec, 12.2.1.1 RCH Downstream Port-detected Errors
> [2] CXL 3.0 spec, 8.1.3 PCIe DVSEC for CXL Devices
> 
> Co-developed-by: Terry Bowman <terry.bowman@amd.com>
> Signed-off-by: Terry Bowman <terry.bowman@amd.com>
> Signed-off-by: Robert Richter <rrichter@amd.com>
> Cc: "Oliver O'Halloran" <oohall@gmail.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-pci@vger.kernel.org

Given the questions are minor:

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/pcie/Kconfig |  12 +++++
>  drivers/pci/pcie/aer.c   | 100 ++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 110 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/pcie/Kconfig b/drivers/pci/pcie/Kconfig
> index 228652a59f27..4f0e70fafe2d 100644
> --- a/drivers/pci/pcie/Kconfig
> +++ b/drivers/pci/pcie/Kconfig
> @@ -49,6 +49,18 @@ config PCIEAER_INJECT
>  	  gotten from:
>  	     https://git.kernel.org/cgit/linux/kernel/git/gong.chen/aer-inject.git/
>  
> +config PCIEAER_CXL
> +	bool "PCI Express CXL RAS support for Restricted Hosts (RCH)"
> +	default y
> +	depends on PCIEAER && CXL_PCI
> +	help
> +	  Enables error handling of downstream ports of a CXL host
> +	  that is operating in RCD mode (Restricted CXL Host, RCH).
> +	  The downstream port reports AER errors to a given RCEC.
> +	  Errors are handled by the CXL memory device driver.
> +
> +	  If unsure, say Y.
> +
>  #
>  # PCI Express ECRC
>  #
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index d3344fcf1f79..2e3f00b6a5bd 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -946,14 +946,104 @@ static bool find_source_device(struct pci_dev *parent,
>  	return true;
>  }
>  
> +#ifdef CONFIG_PCIEAER_CXL
> +
> +static bool is_cxl_mem_dev(struct pci_dev *dev)
> +{
> +	/*
> +	 * The capability, status, and control fields in Device 0,
> +	 * Function 0 DVSEC control the CXL functionality of the
> +	 * entire device (CXL 3.0, 8.1.3).
> +	 */
> +	if (dev->devfn != PCI_DEVFN(0, 0))
> +		return false;
> +
> +	/*
> +	 * CXL Memory Devices must have the 502h class code set (CXL
> +	 * 3.0, 8.1.12.1).
> +	 */
> +	if ((dev->class >> 8) != PCI_CLASS_MEMORY_CXL)
> +		return false;
> +
> +	return true;
> +}
> +
> +static bool cxl_error_is_native(struct pci_dev *dev)
> +{
> +	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
> +
> +	if (pcie_ports_native)
> +		return true;
> +
> +	return host->native_aer && host->native_cxl_error;
> +}
> +
> +static bool is_internal_error(struct aer_err_info *info)
> +{
> +	if (info->severity == AER_CORRECTABLE)
> +		return info->status & PCI_ERR_COR_INTERNAL;
> +
> +	return info->status & PCI_ERR_UNC_INTN;
> +}
> +
> +static int cxl_rch_handle_error_iter(struct pci_dev *dev, void *data)
> +{
> +	struct aer_err_info *info = (struct aer_err_info *)data;
> +	const struct pci_error_handlers *err_handler;
> +
> +	if (!is_cxl_mem_dev(dev) || !cxl_error_is_native(dev))
> +		return 0;
> +
> +	/* protect dev->driver */
> +	device_lock(&dev->dev);
> +
> +	err_handler = dev->driver ? dev->driver->err_handler : NULL;
> +	if (!err_handler)
> +		goto out;
> +
> +	if (info->severity == AER_CORRECTABLE) {
> +		if (err_handler->cor_error_detected)
> +			err_handler->cor_error_detected(dev);
> +	} else if (err_handler->error_detected) {
> +		if (info->severity == AER_NONFATAL)
> +			err_handler->error_detected(dev, pci_channel_io_normal);
> +		else if (info->severity == AER_FATAL)
> +			err_handler->error_detected(dev, pci_channel_io_frozen);
> +	}
> +out:
> +	device_unlock(&dev->dev);
> +	return 0;
> +}
> +
> +static void cxl_rch_handle_error(struct pci_dev *dev, struct aer_err_info *info)
> +{
> +	/*
> +	 * CXL downstream ports of a CXL host that is operating in RCD
> +	 * mode (RCH) signal errors as RCEC internal errors. Forward
> +	 * them to all CXL devices below the RCEC.
> +	 *
> +	 * See CXL 3.0:
> +	 *   9.11.8 CXL Devices Attached to an RCH
> +	 *   12.2.1.1 RCH Downstream Port-detected Errors
> +	 */
> +	if (pci_pcie_type(dev) == PCI_EXP_TYPE_RC_EC &&
> +	    is_internal_error(info))
> +		pcie_walk_rcec(dev, cxl_rch_handle_error_iter, info);
> +}
> +
> +#else
> +static inline void cxl_rch_handle_error(struct pci_dev *dev,
> +					struct aer_err_info *info) { }
> +#endif
> +
>  /**
> - * handle_error_source - handle logging error into an event log
> + * pci_aer_handle_error - handle logging error into an event log
>   * @dev: pointer to pci_dev data structure of error source device
>   * @info: comprehensive error information
>   *
>   * Invoked when an error being detected by Root Port.
>   */
> -static void handle_error_source(struct pci_dev *dev, struct aer_err_info *info)
> +static void pci_aer_handle_error(struct pci_dev *dev, struct aer_err_info *info)
>  {
>  	int aer = dev->aer_cap;
>  
> @@ -977,6 +1067,12 @@ static void handle_error_source(struct pci_dev *dev, struct aer_err_info *info)
>  		pcie_do_recovery(dev, pci_channel_io_normal, aer_root_reset);
>  	else if (info->severity == AER_FATAL)
>  		pcie_do_recovery(dev, pci_channel_io_frozen, aer_root_reset);
> +}
> +
> +static void handle_error_source(struct pci_dev *dev, struct aer_err_info *info)
> +{
> +	cxl_rch_handle_error(dev, info);
> +	pci_aer_handle_error(dev, info);
>  	pci_dev_put(dev);
>  }
>  
> -- 
> 2.34.1
> 
