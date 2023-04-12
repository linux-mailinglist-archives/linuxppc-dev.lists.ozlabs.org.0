Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 252A16E01A2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 00:03:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PxcCx0LfLz3fDL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 08:03:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hqh8QIOj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hqh8QIOj;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PxcC225Rnz2xYL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Apr 2023 08:02:38 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1044963320;
	Wed, 12 Apr 2023 22:02:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F9ADC433D2;
	Wed, 12 Apr 2023 22:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681336955;
	bh=DW7xegFaolvGBJ2256BboSBdl8fEqguZRrLmrPW4TmI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=hqh8QIOjLdcYMhEeayRe/x4dSNqv0nAJhYcaNWOdwmX09SoP2D1m+KhFUKRubudy0
	 0Nx2GLxTH4kjLmMTB527zhjFDr7pyfwW5C/K6uTT+0b5EeFp64vgTjle9IDGu3Fusq
	 jpBTRS4fpo0qnni2wFEQmvGNJS1Coav6iIWgHikwKvKoFjjH7LgK8LM/TH1dtxrcL4
	 R/QsXR3gHIr2A19pIvhm0fttAKndCcX1D968Q+bxwVDencpDJd0oLv3jRyPJQ58frS
	 53scneCqXonwVY4kNiBJheysykYMzIIcqPp6qdIO7PGTmb2YIYzfDy27GnCyYLNJ8d
	 +XKssHD0RqpCQ==
Date: Wed, 12 Apr 2023 17:02:33 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Terry Bowman <terry.bowman@amd.com>
Subject: Re: [PATCH v3 5/6] PCI/AER: Forward RCH downstream port-detected
 errors to the CXL.mem dev handler
Message-ID: <20230412220233.GA83215@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411180302.2678736-6-terry.bowman@amd.com>
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
Cc: alison.schofield@intel.com, dave.jiang@intel.com, rrichter@amd.com, vishal.l.verma@intel.com, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, bhelgaas@google.com, Oliver O'Halloran <oohall@gmail.com>, Jonathan.Cameron@huawei.com, bwidawsk@kernel.org, dan.j.williams@intel.com, ira.weiny@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 11, 2023 at 01:03:01PM -0500, Terry Bowman wrote:
> From: Robert Richter <rrichter@amd.com>
> 
> In Restricted CXL Device (RCD) mode a CXL device is exposed as an
> RCiEP, but CXL downstream and upstream ports are not enumerated and
> not visible in the PCIe hierarchy. Protocol and link errors are sent
> to an RCEC.
> 
> Restricted CXL host (RCH) downstream port-detected errors are signaled
> as internal AER errors, either Uncorrectable Internal Error (UIE) or
> Corrected Internal Errors (CIE). The error source is the id of the
> RCEC. A CXL handler must then inspect the error status in various CXL
> registers residing in the dport's component register space (CXL RAS
> cap) or the dport's RCRB (AER ext cap). [1]
> 
> Errors showing up in the RCEC's error handler must be handled and
> connected to the CXL subsystem. Implement this by forwarding the error
> to all CXL devices below the RCEC. Since the entire CXL device is
> controlled only using PCIe Configuration Space of device 0, Function
> 0,

Capitalize "device" and "Function" the same way (also appears in
comment below).

> only pass it there [2]. These devices have the Memory Device class
> code set (PCI_CLASS_MEMORY_CXL, 502h) and the existing cxl_pci driver
> can implement the handler. In addition to errors directed to the CXL
> endpoint device, the handler must also inspect the CXL downstream
> port's CXL RAS and PCIe AER external capabilities that is connected to

"AER external capabilities" --  is that referring to the "AER
*Extended* capability"?  If so, we usually don't bother including the
"extended" part because it's usually not relevant.  But if you intended
"external", I don't know what it means.

> the device.
> 
> Since CXL downstream port errors are signaled using internal errors,
> the handler requires those errors to be unmasked. This is subject of a
> follow-on patch.
> 
> The reason for choosing this implementation is that a CXL RCEC device
> is bound to the AER port driver, but the driver does not allow it to
> register a custom specific handler to support CXL. Connecting the RCEC
> hard-wired with a CXL handler does not work, as the CXL subsystem
> might not be present all the time. The alternative to add an
> implementation to the portdrv to allow the registration of a custom
> RCEC error handler isn't worth doing it as CXL would be its only user.
> Instead, just check for an CXL RCEC and pass it down to the connected
> CXL device's error handler. With this approach the code can entirely
> be implemented in the PCIe AER driver and is independent of the CXL
> subsystem. The CXL driver only provides the handler.

Can you make this more concrete with an example topology so we can
work through how this all works?  Correct me when I go off the rails
here:

The current code uses pcie_walk_rcec() in this path, which basically
searches below a Root Port or RCEC for devices that have an AER error
status bit set, add them to the e_info[] list, and call
handle_error_source() for each one:

  aer_isr_one_error
    # get e_src from aer_fifo
    find_source_device(e_src)
      pcie_walk_rcec(find_device_iter)
        find_device_iter
          is_error_source
            # read PCI_ERR_COR_STATUS or PCI_ERR_UNCOR_STATUS
          if (error-source)
            add_error_device
              # add device to e_info[] list
    # now call handle_error_source for everything in e_info[]
    aer_process_err_devices
      for (i = 0; i < e_info->err_dev_num; i++)
        handle_error_source

IIUC, this patch basically says that an RCEC should have an AER error
status bit (UIE or CIE) set, but the devices "below" the RCEC will
not, so they won't get added to e_info[].

So we insert cxl_handle_error() in handle_error_source(), where it
gets called for the RCEC, and then it uses pcie_walk_rcec() again to
forcibly call handle_error_source() for *every* device "below" the
RCEC (even though they don't have AER error status bits set).

Then handle_error_source() ultimately calls the CXL driver err_handler
entry points (.cor_error_detected(), .error_detected(), etc), which
can look at the CXL-specific error status in the CXL RAS or RCRB or
whatever.

So this basically looks like a workaround for the fact that the AER
code only calls handle_error_source() when it finds AER error status,
and CXL doesn't *set* that AER error status.  There's not that much
code here, but it seems like a quite a bit of complexity in an area
that is already pretty complicated.

Here's another idea: the ACPI GHES code (ghes_handle_aer()) basically
receives a packet of error status from firmware and queues it for
recovery via pcie_do_recovery().  What if you had a CXL module that
knew how to look for the CXL error status, package it up similarly,
and queue it via aer_recover_queue()?

> [1] CXL 3.0 spec, 12.2.1.1 RCH Downstream Port-detected Errors
> [2] CXL 3.0 spec, 8.1.3 PCIe DVSEC for CXL Devices
> 
> Co-developed-by: Terry Bowman <terry.bowman@amd.com>
> Signed-off-by: Robert Richter <rrichter@amd.com>
> Signed-off-by: Terry Bowman <terry.bowman@amd.com>
> Cc: "Oliver O'Halloran" <oohall@gmail.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-pci@vger.kernel.org
> ---
>  drivers/pci/pcie/Kconfig |  8 ++++++
>  drivers/pci/pcie/aer.c   | 61 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 69 insertions(+)
> 
> diff --git a/drivers/pci/pcie/Kconfig b/drivers/pci/pcie/Kconfig
> index 228652a59f27..b0dbd864d3a3 100644
> --- a/drivers/pci/pcie/Kconfig
> +++ b/drivers/pci/pcie/Kconfig
> @@ -49,6 +49,14 @@ config PCIEAER_INJECT
>  	  gotten from:
>  	     https://git.kernel.org/cgit/linux/kernel/git/gong.chen/aer-inject.git/
>  
> +config PCIEAER_CXL
> +	bool "PCI Express CXL RAS support"
> +	default y
> +	depends on PCIEAER && CXL_PCI
> +	help
> +	  This enables CXL error handling for Restricted CXL Hosts
> +	  (RCHs).
> +
>  #
>  # PCI Express ECRC
>  #
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 7a25b62d9e01..171a08fd8ebd 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -946,6 +946,65 @@ static bool find_source_device(struct pci_dev *parent,
>  	return true;
>  }
>  
> +#ifdef CONFIG_PCIEAER_CXL
> +
> +static bool is_cxl_mem_dev(struct pci_dev *dev)
> +{
> +	/*
> +	 * A CXL device is controlled only using PCIe Configuration
> +	 * Space of device 0, Function 0.
> +	 */
> +	if (dev->devfn != PCI_DEVFN(0, 0))
> +		return false;
> +
> +	/* Right now there is only a CXL.mem driver */
> +	if ((dev->class >> 8) != PCI_CLASS_MEMORY_CXL)
> +		return false;
> +
> +	return true;
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
> +static void handle_error_source(struct pci_dev *dev, struct aer_err_info *info);
> +
> +static int cxl_handle_error_iter(struct pci_dev *dev, void *data)
> +{
> +	struct aer_err_info *e_info = (struct aer_err_info *)data;
> +
> +	if (!is_cxl_mem_dev(dev))
> +		return 0;
> +
> +	/* pci_dev_put() in handle_error_source() */
> +	dev = pci_dev_get(dev);
> +	if (dev)
> +		handle_error_source(dev, e_info);
> +
> +	return 0;
> +}
> +
> +static void cxl_handle_error(struct pci_dev *dev, struct aer_err_info *info)
> +{
> +	/*
> +	 * CXL downstream port errors are signaled as RCEC internal
> +	 * errors. Forward them to all CXL devices below the RCEC.
> +	 */
> +	if (pci_pcie_type(dev) == PCI_EXP_TYPE_RC_EC &&
> +	    is_internal_error(info))
> +		pcie_walk_rcec(dev, cxl_handle_error_iter, info);
> +}
> +
> +#else
> +static inline void cxl_handle_error(struct pci_dev *dev,
> +				    struct aer_err_info *info) { }
> +#endif
> +
>  /**
>   * handle_error_source - handle logging error into an event log
>   * @dev: pointer to pci_dev data structure of error source device
> @@ -957,6 +1016,8 @@ static void handle_error_source(struct pci_dev *dev, struct aer_err_info *info)
>  {
>  	int aer = dev->aer_cap;
>  
> +	cxl_handle_error(dev, info);
> +
>  	if (info->severity == AER_CORRECTABLE) {
>  		/*
>  		 * Correctable error does not need software intervention.
> -- 
> 2.34.1
> 
