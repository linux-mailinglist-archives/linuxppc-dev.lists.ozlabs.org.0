Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD896E2305
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 14:20:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PybBK1NV3z3fX1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 22:20:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=<UNKNOWN>)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pyb9q4Xpnz3c63
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 22:19:57 +1000 (AEST)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Pyb4X6Y3Dz6DDPf;
	Fri, 14 Apr 2023 20:15:24 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 14 Apr
 2023 13:19:51 +0100
Date: Fri, 14 Apr 2023 13:19:50 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Terry Bowman <terry.bowman@amd.com>
Subject: Re: [PATCH v3 5/6] PCI/AER: Forward RCH downstream port-detected
 errors to the CXL.mem dev handler
Message-ID: <20230414131950.00006e76@Huawei.com>
In-Reply-To: <20230411180302.2678736-6-terry.bowman@amd.com>
References: <20230411180302.2678736-1-terry.bowman@amd.com>
	<20230411180302.2678736-6-terry.bowman@amd.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
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
Cc: alison.schofield@intel.com, dave.jiang@intel.com, rrichter@amd.com, vishal.l.verma@intel.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, bhelgaas@google.com, Oliver O'Halloran <oohall@gmail.com>, linux-pci@vger.kernel.org, bwidawsk@kernel.org, dan.j.williams@intel.com, ira.weiny@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 11 Apr 2023 13:03:01 -0500
Terry Bowman <terry.bowman@amd.com> wrote:

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
> 0, only pass it there [2]. These devices have the Memory Device class
> code set (PCI_CLASS_MEMORY_CXL, 502h) and the existing cxl_pci driver
> can implement the handler.

This comment implies only class code compliant drivers.  Sure we don't
have drivers for anything else yet, but we should try to avoid saying
there won't be any (which I think above implies).

You have a comment in the code, but maybe relaxing the description above
to "currently support devices have..."

> In addition to errors directed to the CXL
> endpoint device, the handler must also inspect the CXL downstream
> port's CXL RAS and PCIe AER external capabilities that is connected to
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
> 
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

Generally looks good to me.  A few trivial comments inline.

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

Description makes this sound too general. I'd mentioned restricted
hosts even in the menu option title.


> +	default y
> +	depends on PCIEAER && CXL_PCI
> +	help
> +	  This enables CXL error handling for Restricted CXL Hosts
> +	  (RCHs).

Spec term is probably fine in the title, but in the help I'd 
expand it as per the CXL 3.0 glossary to include
"CXL Host that is operating in RCD mode."
It might otherwise surprise people that this matters on their shiny
new CXL X.0 host (because they found an old CXL 1.1 card in a box
and decided to plug it in)

Do we actually need this protection at all?  It's a tiny amount of code
and I can't see anything immediately that requires the CXL_PCI dependency
other than it's a bit pointless if that isn't here.

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

That's not true in general.   Definitely true that CXL protocol
error reporting is controlled only using this Devfn, but
more generally there could be other stuff in later functions.
So perhaps make the comment more specific.

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

Make this comment more specific (to RCH I think).

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

