Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE3C8433E3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 03:28:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AGXz6xry;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPmDb2q8Zz3cTG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 13:28:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AGXz6xry;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Wed, 31 Jan 2024 13:27:53 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPmCs2LxCz30Ql
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jan 2024 13:27:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706668073; x=1738204073;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bj8cWvQXrmKq86waIXDVsaQ2lA8WS1l0Aluov5ssNAA=;
  b=AGXz6xrysbppHOVisKzDT69Fjb+B89RgAatnFf17+0xmiEti4tiALTUW
   TGYV4rICzFPlQ+skwS8eoI3TGj0qCzwybBvOZ76N1j0/JBl+VOtkmrTLz
   55K9GW8Ca7DVUdbAguSJpj1GA1U0v2VAL/4+nPOcN1jVV0Mq2bD2KheRs
   3M5xY0V5fyWoU7Ub9KUDs9vpKL8e7gX48kspymPWjCjOFgQ7SYG79B0et
   TgRNscLHQP3DSKd8ELJjOTbUnO11310aSMPdpBm3fmOpGWEchB74LtAxr
   wn/FPtVxergdsqG5USHsvc5laxSQjJinPW9SnEGQ70W4khQYu0ZZgAeKu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3337302"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="3337302"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 18:26:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="1119468425"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="1119468425"
Received: from pangchin-mobl3.amr.corp.intel.com (HELO [10.209.54.246]) ([10.209.54.246])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 18:26:41 -0800
Message-ID: <6ecb7bbf-0eba-4cea-b9b8-05fd092b7d01@linux.intel.com>
Date: Tue, 30 Jan 2024 18:26:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] PCI/AER: Store more information in aer_err_info
Content-Language: en-US
To: "Wang, Qingshun" <qingshun.wang@linux.intel.com>,
 linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-acpi@vger.kernel.org
References: <20240125062802.50819-1-qingshun.wang@linux.intel.com>
 <20240125062802.50819-2-qingshun.wang@linux.intel.com>
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20240125062802.50819-2-qingshun.wang@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Alison Schofield <alison.schofield@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, erwin.tsaur@intel.com, linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>, chao.p.peng@linux.intel.com, Ira Weiny <ira.weiny@intel.com>, Davidlohr Bueso <dave@stgolabs.net>, Dave Jiang <dave.jiang@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, Smita Koralahalli <Smita.KoralahalliChannabasappa@amd.com>, Bjorn Helgaas <helgaas@kernel.org>, Len Brown <lenb@kernel.org>, Robert Richter <rrichter@amd.com>, Borislav Petkov <bp@alien8.de>, Jonathan Cameron <jonathan.cameron@huawei.com>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, linux-edac@vger.kernel.org, Tony Luck <tony.luck@intel.com>, feiting.wanyan@intel.com, Adam Preble <adam.c.preble@intel.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Li Yang <leoyang.li@nxp.com>, Lukas Wunner <lukas@wunner.de>, James Morse <james.morse@arm
 .com>, qingshun.wang@intel.com, Shiju Jose <shiju.jose@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 1/24/24 10:27 PM, Wang, Qingshun wrote:
> When Advisory Non-Fatal errors are raised, both correctable and

Maybe you can start with same info about what Advisory Non-FataL
errors are and the specification reference. I know that you included
it in cover letter. But it is good to include it in commit log.

> uncorrectable error statuses will be set. The current kernel code cannot
> store both statuses at the same time, thus failing to handle ANFE properly.
> In addition, to avoid clearing UEs that are not ANFE by accident, UE

Please add some details about the impact of not clearing them.
> severity and Device Status also need to be recorded: any fatal UE cannot
> be ANFE, and if Fatal/Non-Fatal Error Detected is set in Device Status, do
> not take any assumption and let UE handler to clear UE status.
>
> Store status and mask of both correctable and uncorrectable errors in
> aer_err_info. The severity of UEs and the values of the Device Status
> register are also recorded, which will be used to determine UEs that should
> be handled by the ANFE handler. Refactor the rest of the code to use
> cor/uncor_status and cor/uncor_mask fields instead of status and mask
> fields.
>
> Signed-off-by: "Wang, Qingshun" <qingshun.wang@linux.intel.com>
> ---
>  drivers/acpi/apei/ghes.c | 10 ++++-
>  drivers/cxl/core/pci.c   |  6 ++-
>  drivers/pci/pci.h        |  8 +++-
>  drivers/pci/pcie/aer.c   | 93 ++++++++++++++++++++++++++--------------
>  include/linux/aer.h      |  4 +-
>  include/linux/pci.h      | 27 ++++++++++++
>  6 files changed, 111 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
> index 7b7c605166e0..6034039d5cff 100644
> --- a/drivers/acpi/apei/ghes.c
> +++ b/drivers/acpi/apei/ghes.c
> @@ -593,6 +593,8 @@ static void ghes_handle_aer(struct acpi_hest_generic_data *gdata)
>  
>  	if (pcie_err->validation_bits & CPER_PCIE_VALID_DEVICE_ID &&
>  	    pcie_err->validation_bits & CPER_PCIE_VALID_AER_INFO) {
> +		struct pcie_capability_regs *pcie_caps;
> +		u16 device_status = 0;
>  		unsigned int devfn;
>  		int aer_severity;
>  		u8 *aer_info;
> @@ -615,11 +617,17 @@ static void ghes_handle_aer(struct acpi_hest_generic_data *gdata)
>  			return;
>  		memcpy(aer_info, pcie_err->aer_info, sizeof(struct aer_capability_regs));
>  
> +		if (pcie_err->validation_bits & CPER_PCIE_VALID_CAPABILITY) {
> +			pcie_caps = (struct pcie_capability_regs *)pcie_err->capability;
> +			device_status = pcie_caps->device_status;
> +		}
> +
>  		aer_recover_queue(pcie_err->device_id.segment,
>  				  pcie_err->device_id.bus,
>  				  devfn, aer_severity,
>  				  (struct aer_capability_regs *)
> -				  aer_info);
> +				  aer_info,
> +				  device_status);
>  	}
>  #endif
>  }
> diff --git a/drivers/cxl/core/pci.c b/drivers/cxl/core/pci.c
> index 6c9c8d92f8f7..9111a4415a63 100644
> --- a/drivers/cxl/core/pci.c
> +++ b/drivers/cxl/core/pci.c
> @@ -903,6 +903,7 @@ static void cxl_handle_rdport_errors(struct cxl_dev_state *cxlds)
>  	struct aer_capability_regs aer_regs;
>  	struct cxl_dport *dport;
>  	struct cxl_port *port;
> +	u16 device_status;
>  	int severity;
>  
>  	port = cxl_pci_find_port(pdev, &dport);
> @@ -917,7 +918,10 @@ static void cxl_handle_rdport_errors(struct cxl_dev_state *cxlds)
>  	if (!cxl_rch_get_aer_severity(&aer_regs, &severity))
>  		return;
>  
> -	pci_print_aer(pdev, severity, &aer_regs);
> +	if (pcie_capability_read_word(pdev, PCI_EXP_DEVSTA, &device_status))
> +		return;
> +
> +	pci_print_aer(pdev, severity, &aer_regs, device_status);
>  
>  	if (severity == AER_CORRECTABLE)
>  		cxl_handle_rdport_cor_ras(cxlds, dport);
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 2336a8d1edab..f881a1b42f14 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -407,8 +407,12 @@ struct aer_err_info {
>  	unsigned int __pad2:2;
>  	unsigned int tlp_header_valid:1;
>  
> -	unsigned int status;		/* COR/UNCOR Error Status */
> -	unsigned int mask;		/* COR/UNCOR Error Mask */
> +	u32 cor_mask;		/* COR Error Mask */
> +	u32 cor_status;		/* COR Error Status */
> +	u32 uncor_mask;		/* UNCOR Error Mask */
> +	u32 uncor_status;	/* UNCOR Error Status */
> +	u32 uncor_severity;	/* UNCOR Error Severity */
> +	u16 device_status;
>  	struct aer_header_log_regs tlp;	/* TLP Header */
>  };
>  
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 05fc30bb5134..6583dcf50977 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -615,7 +615,7 @@ const struct attribute_group aer_stats_attr_group = {
>  static void pci_dev_aer_stats_incr(struct pci_dev *pdev,
>  				   struct aer_err_info *info)
>  {
> -	unsigned long status = info->status & ~info->mask;
> +	unsigned long status;
>  	int i, max = -1;
>  	u64 *counter = NULL;
>  	struct aer_stats *aer_stats = pdev->aer_stats;
> @@ -625,16 +625,19 @@ static void pci_dev_aer_stats_incr(struct pci_dev *pdev,
>  
>  	switch (info->severity) {
>  	case AER_CORRECTABLE:
> +		status = info->cor_status & ~info->cor_mask;
>  		aer_stats->dev_total_cor_errs++;
>  		counter = &aer_stats->dev_cor_errs[0];
>  		max = AER_MAX_TYPEOF_COR_ERRS;
>  		break;
>  	case AER_NONFATAL:
> +		status = info->uncor_status & ~info->uncor_mask;
>  		aer_stats->dev_total_nonfatal_errs++;
>  		counter = &aer_stats->dev_nonfatal_errs[0];
>  		max = AER_MAX_TYPEOF_UNCOR_ERRS;
>  		break;
>  	case AER_FATAL:
> +		status = info->uncor_status & ~info->uncor_mask;
>  		aer_stats->dev_total_fatal_errs++;
>  		counter = &aer_stats->dev_fatal_errs[0];
>  		max = AER_MAX_TYPEOF_UNCOR_ERRS;
> @@ -674,15 +677,17 @@ static void __print_tlp_header(struct pci_dev *dev,
>  static void __aer_print_error(struct pci_dev *dev,
>  			      struct aer_err_info *info)
>  {
> +	unsigned long status;
>  	const char **strings;
> -	unsigned long status = info->status & ~info->mask;
>  	const char *level, *errmsg;
>  	int i;
>  
>  	if (info->severity == AER_CORRECTABLE) {
> +		status = info->cor_status & ~info->cor_mask;
>  		strings = aer_correctable_error_string;
>  		level = KERN_WARNING;
>  	} else {
> +		status = info->uncor_status & ~info->uncor_mask;
>  		strings = aer_uncorrectable_error_string;
>  		level = KERN_ERR;
>  	}
> @@ -700,18 +705,27 @@ static void __aer_print_error(struct pci_dev *dev,
>  
>  void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
>  {
> +	u32 status, mask;
>  	int layer, agent;
>  	int id = pci_dev_id(dev);
>  	const char *level;
>  
> -	if (!info->status) {
> +	if (info->severity == AER_CORRECTABLE) {
> +		status = info->cor_status;
> +		mask = info->cor_mask;
> +	} else {
> +		status = info->uncor_status;
> +		mask = info->uncor_mask;
> +	}
> +
> +	if (!status) {
>  		pci_err(dev, "PCIe Bus Error: severity=%s, type=Inaccessible, (Unregistered Agent ID)\n",
>  			aer_error_severity_string[info->severity]);
>  		goto out;
>  	}
>  
> -	layer = AER_GET_LAYER_ERROR(info->severity, info->status);
> -	agent = AER_GET_AGENT(info->severity, info->status);
> +	layer = AER_GET_LAYER_ERROR(info->severity, status);
> +	agent = AER_GET_AGENT(info->severity, status);
>  
>  	level = (info->severity == AER_CORRECTABLE) ? KERN_WARNING : KERN_ERR;
>  
> @@ -720,7 +734,7 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
>  		   aer_error_layer[layer], aer_agent_string[agent]);
>  
>  	pci_printk(level, dev, "  device [%04x:%04x] error status/mask=%08x/%08x\n",
> -		   dev->vendor, dev->device, info->status, info->mask);
> +		   dev->vendor, dev->device, status, mask);
>  
>  	__aer_print_error(dev, info);
>  
> @@ -731,7 +745,7 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
>  	if (info->id && info->error_dev_num > 1 && info->id == id)
>  		pci_err(dev, "  Error of this Agent is reported first\n");
>  
> -	trace_aer_event(dev_name(&dev->dev), (info->status & ~info->mask),
> +	trace_aer_event(dev_name(&dev->dev), (status & ~mask),
>  			info->severity, info->tlp_header_valid, &info->tlp);
>  }
>  
> @@ -763,7 +777,7 @@ EXPORT_SYMBOL_GPL(cper_severity_to_aer);
>  #endif
>  
>  void pci_print_aer(struct pci_dev *dev, int aer_severity,
> -		   struct aer_capability_regs *aer)
> +		   struct aer_capability_regs *aer, u16 device_status)
>  {
>  	int layer, agent, tlp_header_valid = 0;
>  	u32 status, mask;
> @@ -783,8 +797,12 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
>  
>  	memset(&info, 0, sizeof(info));
>  	info.severity = aer_severity;
> -	info.status = status;
> -	info.mask = mask;
> +	info.cor_status = aer->cor_status;
> +	info.cor_mask = aer->cor_mask;
> +	info.uncor_status = aer->uncor_status;
> +	info.uncor_severity = aer->uncor_severity;
> +	info.uncor_mask = aer->uncor_mask;
> +	info.device_status = device_status;
>  	info.first_error = PCI_ERR_CAP_FEP(aer->cap_control);
>  
>  	pci_err(dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n", status, mask);
> @@ -996,9 +1014,9 @@ static bool cxl_error_is_native(struct pci_dev *dev)
>  static bool is_internal_error(struct aer_err_info *info)
>  {
>  	if (info->severity == AER_CORRECTABLE)
> -		return info->status & PCI_ERR_COR_INTERNAL;
> +		return info->cor_status & PCI_ERR_COR_INTERNAL;
>  
> -	return info->status & PCI_ERR_UNC_INTN;
> +	return info->uncor_status & PCI_ERR_UNC_INTN;
>  }
>  
>  static int cxl_rch_handle_error_iter(struct pci_dev *dev, void *data)
> @@ -1097,7 +1115,7 @@ static void pci_aer_handle_error(struct pci_dev *dev, struct aer_err_info *info)
>  		 */
>  		if (aer)
>  			pci_write_config_dword(dev, aer + PCI_ERR_COR_STATUS,
> -					info->status);
> +					info->cor_status);
>  		if (pcie_aer_is_native(dev)) {
>  			struct pci_driver *pdrv = dev->driver;
>  
> @@ -1128,6 +1146,7 @@ struct aer_recover_entry {
>  	u8	devfn;
>  	u16	domain;
>  	int	severity;
> +	u16	device_status;
>  	struct aer_capability_regs *regs;
>  };
>  
> @@ -1148,7 +1167,7 @@ static void aer_recover_work_func(struct work_struct *work)
>  			       PCI_SLOT(entry.devfn), PCI_FUNC(entry.devfn));
>  			continue;
>  		}
> -		pci_print_aer(pdev, entry.severity, entry.regs);
> +		pci_print_aer(pdev, entry.severity, entry.regs, entry.device_status);
>  		/*
>  		 * Memory for aer_capability_regs(entry.regs) is being allocated from the
>  		 * ghes_estatus_pool to protect it from overwriting when multiple sections
> @@ -1177,7 +1196,7 @@ static DEFINE_SPINLOCK(aer_recover_ring_lock);
>  static DECLARE_WORK(aer_recover_work, aer_recover_work_func);
>  
>  void aer_recover_queue(int domain, unsigned int bus, unsigned int devfn,
> -		       int severity, struct aer_capability_regs *aer_regs)
> +		       int severity, struct aer_capability_regs *aer_regs, u16 device_status)
>  {
>  	struct aer_recover_entry entry = {
>  		.bus		= bus,
> @@ -1185,6 +1204,7 @@ void aer_recover_queue(int domain, unsigned int bus, unsigned int devfn,
>  		.domain		= domain,
>  		.severity	= severity,
>  		.regs		= aer_regs,
> +		.device_status	= device_status,
>  	};
>  
>  	if (kfifo_in_spinlocked(&aer_recover_ring, &entry, 1,
> @@ -1213,38 +1233,49 @@ int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
>  	int temp;
>  
>  	/* Must reset in this function */
> -	info->status = 0;
> +	info->cor_status = 0;
> +	info->uncor_status = 0;
> +	info->uncor_severity = 0;
>  	info->tlp_header_valid = 0;
>  
>  	/* The device might not support AER */
>  	if (!aer)
>  		return 0;
>  
> -	if (info->severity == AER_CORRECTABLE) {
> +	if (info->severity == AER_CORRECTABLE ||
> +	    info->severity == AER_NONFATAL ||
> +	    type == PCI_EXP_TYPE_ROOT_PORT ||
> +	    type == PCI_EXP_TYPE_RC_EC ||
> +	    type == PCI_EXP_TYPE_DOWNSTREAM) {


It looks like you are reading both uncorrectable and correctable status
by default for both NONFATAL and CORRECTABLE errors. Why not do
it conditionally only for ANFE errors?


> +		/* Link is healthy for IO reads */
>  		pci_read_config_dword(dev, aer + PCI_ERR_COR_STATUS,
> -			&info->status);
> +				      &info->cor_status);
>  		pci_read_config_dword(dev, aer + PCI_ERR_COR_MASK,
> -			&info->mask);
> -		if (!(info->status & ~info->mask))
> -			return 0;
> -	} else if (type == PCI_EXP_TYPE_ROOT_PORT ||
> -		   type == PCI_EXP_TYPE_RC_EC ||
> -		   type == PCI_EXP_TYPE_DOWNSTREAM ||
> -		   info->severity == AER_NONFATAL) {
> -
> -		/* Link is still healthy for IO reads */
> +				      &info->cor_mask);
>  		pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS,
> -			&info->status);
> +				      &info->uncor_status);
> +		pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_SEVER,
> +				      &info->uncor_severity);
>  		pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_MASK,
> -			&info->mask);
> -		if (!(info->status & ~info->mask))
> +				      &info->uncor_mask);
> +		pcie_capability_read_word(dev, PCI_EXP_DEVSTA,
> +					  &info->device_status);
> +	} else {
> +		return 1;
> +	}
> +
> +	if (info->severity == AER_CORRECTABLE) {
> +		if (!(info->cor_status & ~info->cor_mask))
> +			return 0;
> +	} else {
> +		if (!(info->uncor_status & ~info->uncor_mask))
>  			return 0;
>  
>  		/* Get First Error Pointer */
>  		pci_read_config_dword(dev, aer + PCI_ERR_CAP, &temp);
>  		info->first_error = PCI_ERR_CAP_FEP(temp);
>  
> -		if (info->status & AER_LOG_TLP_MASKS) {
> +		if (info->uncor_status & AER_LOG_TLP_MASKS) {
>  			info->tlp_header_valid = 1;
>  			pci_read_config_dword(dev,
>  				aer + PCI_ERR_HEADER_LOG, &info->tlp.dw0);
> diff --git a/include/linux/aer.h b/include/linux/aer.h
> index ae0fae70d4bd..38ac802250ac 100644
> --- a/include/linux/aer.h
> +++ b/include/linux/aer.h
> @@ -52,9 +52,9 @@ static inline int pcie_aer_is_native(struct pci_dev *dev) { return 0; }
>  #endif
>  
>  void pci_print_aer(struct pci_dev *dev, int aer_severity,
> -		    struct aer_capability_regs *aer);
> +		    struct aer_capability_regs *aer, u16 device_status);
>  int cper_severity_to_aer(int cper_severity);
>  void aer_recover_queue(int domain, unsigned int bus, unsigned int devfn,
> -		       int severity, struct aer_capability_regs *aer_regs);
> +		       int severity, struct aer_capability_regs *aer_regs, u16 device_status);
>  #endif //_AER_H_
>  
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index add9368e6314..259812620d4d 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -318,6 +318,33 @@ struct pci_sriov;
>  struct pci_p2pdma;
>  struct rcec_ea;
>  
> +struct pcie_capability_regs {
> +	u8 pcie_cap_id;
> +	u8 next_cap_ptr;
> +	u16 pcie_caps;
> +	u32 device_caps;
> +	u16 device_control;
> +	u16 device_status;
> +	u32 link_caps;
> +	u16 link_control;
> +	u16 link_status;
> +	u32 slot_caps;
> +	u16 slot_control;
> +	u16 slot_status;
> +	u16 root_control;
> +	u16 root_caps;
> +	u32 root_status;
> +	u32 device_caps_2;
> +	u16 device_control_2;
> +	u16 device_status_2;
> +	u32 link_caps_2;
> +	u16 link_control_2;
> +	u16 link_status_2;
> +	u32 slot_caps_2;
> +	u16 slot_control_2;
> +	u16 slot_status_2;
> +};
> +
IIUC, this struct is only used drivers/acpi/apei/ghes.c . Why not define it in that file?
>  /* The pci_dev structure describes PCI devices */
>  struct pci_dev {
>  	struct list_head bus_list;	/* Node in per-bus list */

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

