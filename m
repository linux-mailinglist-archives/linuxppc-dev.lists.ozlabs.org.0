Return-Path: <linuxppc-dev+bounces-9123-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5DDACCEE6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jun 2025 23:23:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBkGm3DCCz2ySQ;
	Wed,  4 Jun 2025 07:23:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748985824;
	cv=none; b=VNQasW/Pok809QWGKSOFJ6qtwuoP/jw9+l4Oo/L+wXi4/uHX9gPpx0woiwkfSkwFb1Aa/7XKOIQFMcDkQ5H8cAuAXZRgGfxNfIU+zG6TtYDT9yXzvPwyRU5/vXZwHJMhcNC2KvR5sN8l5HsGdR7wlCpcjShewro5bdnuHjJH+5TzvRDshUq4JTHurVK/XIZAswqaufNAUD6F+UvHnDfUohAdQ0KUZUU7YAPVw5d3i+Yf616RQ0cWG1CRFJzqkHkrn1lJwmuFaiMmc61Dpq6m96vzCTZbTPn5ssX9e+nwWPgQEMyF0B17wbTWqAXQPhs6VND8rwdoero+K4D9AIFHJw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748985824; c=relaxed/relaxed;
	bh=sdmljyIspWu7QBONoix15aA02cq4Ww9ZxfYNS+9WHcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GeNaVqNpdPuX9x2O1zUeEKlYfAG6hMsQkAc09jUfmG2ES68cSzf/1Kksoowjs33wyIyDdMC/HfJtg9WOwt2DOoDOfUqzohrPAZyjVWl9C9bz5wTpoBHld037IZbliB0DgQYy0dSqafpCCKKH3RMDvsZr3EWYMjPjQ/VRYEuVSwx+YjOFT5mJqkSLpLdbkDO7dOPPqfC35G8jDK+rleUBq9TGGVRN8DlbRDmEg+0z+ZsMd+iesnfZkHSQKbxfE3Fwxp1EqgW953Rz3S3OSMwt5LX0cUgAnuVzs3XlZJemSFcC94qk2VR9iv9EwDZMy0oVM00M0gyqJf9g3/NXWpbXrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bwI6hyiM; dkim-atps=neutral; spf=pass (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=dave.jiang@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bwI6hyiM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=dave.jiang@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bBkGl2YrHz2xXP
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jun 2025 07:23:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748985823; x=1780521823;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Q0L033uSF8rn7qFAG0k3SFoNFf5x+r7D4n4XXeakONE=;
  b=bwI6hyiMLtT2t7Uh1Dra+RWx6/WdswNZB6/tr4+SDv8eYdOxKljXhzgj
   ca91XkgPVovXxFsloQ/YkjfrFkCMx2XdKLnBAq91/kx8XjDlwdnNwp0JW
   zqzMZJ4jCaYVdudZ1d/LVMPy90utRwIMkaQFV9NKLi/Sau1Y1sD8i0H3C
   TvTz/JqB/jBln0Hd5r6DgfalMGs9GMaKrF5B8k+4PmHA6V1hYIjGekdJa
   HQ+2JpcuuNwiOPtDuCgUmv28bCY6Sp7geIPTNMQugnhw3tIGGHnqzdwke
   bzPDxUwn8J/W9ZyjaNOWMZV2jmg6pInXxO41kOfuI3rjv6DLY1nFEXzJ7
   Q==;
X-CSE-ConnectionGUID: XEq49pMeSWupeoX/GKT0SQ==
X-CSE-MsgGUID: 2HyE0u/XRSueUgxUH4xY5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="62436994"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; 
   d="scan'208";a="62436994"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 14:23:40 -0700
X-CSE-ConnectionGUID: evdyZjPASNqPmS8z1WRJJA==
X-CSE-MsgGUID: AQMaIvz3QASYtFGYOI91nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; 
   d="scan'208";a="150277461"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [10.125.110.198]) ([10.125.110.198])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 14:23:38 -0700
Message-ID: <e919b8d3-5141-4e4f-9f96-9b680d4a7321@intel.com>
Date: Tue, 3 Jun 2025 14:23:36 -0700
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4 v3] PCI/AER: Modify pci_print_aer() to take log level
To: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-cxl@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-pci@vger.kernel.org, linux-edac@vger.kernel.org
Cc: Yazen Ghannam <yazen.ghannam@amd.com>
References: <20250603155536.577493-1-fabio.m.de.francesco@linux.intel.com>
 <20250603155536.577493-3-fabio.m.de.francesco@linux.intel.com>
Content-Language: en-US
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20250603155536.577493-3-fabio.m.de.francesco@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 6/3/25 8:54 AM, Fabio M. De Francesco wrote:
> Modify pci_print_aer() to take a printk() log level in preparation of a
> patch that logs PCIe Components and Link errors from ELOG.
> 
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>

Reviewed-by: Dave Jiang <dave.jiang@intel.com>
> ---
>  drivers/cxl/core/pci.c |  2 +-
>  drivers/pci/pcie/aer.c | 16 ++++++++--------
>  include/linux/aer.h    |  4 ++--
>  3 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/cxl/core/pci.c b/drivers/cxl/core/pci.c
> index 3b80e9a76ba86..ad8d7939c2e1c 100644
> --- a/drivers/cxl/core/pci.c
> +++ b/drivers/cxl/core/pci.c
> @@ -885,7 +885,7 @@ static void cxl_handle_rdport_errors(struct cxl_dev_state *cxlds)
>  	if (!cxl_rch_get_aer_severity(&aer_regs, &severity))
>  		return;
>  
> -	pci_print_aer(pdev, severity, &aer_regs);
> +	pci_print_aer(KERN_ERR, pdev, severity, &aer_regs);
>  
>  	if (severity == AER_CORRECTABLE)
>  		cxl_handle_rdport_cor_ras(cxlds, dport);
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index a1cf8c7ef628a..d0ebf7c15afa9 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -760,7 +760,7 @@ int cper_severity_to_aer(int cper_severity)
>  EXPORT_SYMBOL_GPL(cper_severity_to_aer);
>  #endif
>  
> -void pci_print_aer(struct pci_dev *dev, int aer_severity,
> +void pci_print_aer(char *level, struct pci_dev *dev, int aer_severity,
>  		   struct aer_capability_regs *aer)
>  {
>  	int layer, agent, tlp_header_valid = 0;
> @@ -785,14 +785,15 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
>  	info.mask = mask;
>  	info.first_error = PCI_ERR_CAP_FEP(aer->cap_control);
>  
> -	pci_err(dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n", status, mask);
> +	pci_printk(level, dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n",
> +		   status, mask);
>  	__aer_print_error(dev, &info);
> -	pci_err(dev, "aer_layer=%s, aer_agent=%s\n",
> -		aer_error_layer[layer], aer_agent_string[agent]);
> +	pci_printk(level, dev, "aer_layer=%s, aer_agent=%s\n",
> +		   aer_error_layer[layer], aer_agent_string[agent]);
>  
>  	if (aer_severity != AER_CORRECTABLE)
> -		pci_err(dev, "aer_uncor_severity: 0x%08x\n",
> -			aer->uncor_severity);
> +		pci_printk(level, dev, "aer_uncor_severity: 0x%08x\n",
> +			   aer->uncor_severity);
>  
>  	if (tlp_header_valid)
>  		pcie_print_tlp_log(dev, &aer->header_log, dev_fmt("  "));
> @@ -1146,8 +1147,7 @@ static void aer_recover_work_func(struct work_struct *work)
>  			       PCI_SLOT(entry.devfn), PCI_FUNC(entry.devfn));
>  			continue;
>  		}
> -		pci_print_aer(pdev, entry.severity, entry.regs);
> -
> +		pci_print_aer(KERN_ERR, pdev, entry.severity, entry.regs);
>  		/*
>  		 * Memory for aer_capability_regs(entry.regs) is being
>  		 * allocated from the ghes_estatus_pool to protect it from
> diff --git a/include/linux/aer.h b/include/linux/aer.h
> index 02940be66324e..45d0fb2e2e759 100644
> --- a/include/linux/aer.h
> +++ b/include/linux/aer.h
> @@ -64,8 +64,8 @@ static inline int pci_aer_clear_nonfatal_status(struct pci_dev *dev)
>  static inline int pcie_aer_is_native(struct pci_dev *dev) { return 0; }
>  #endif
>  
> -void pci_print_aer(struct pci_dev *dev, int aer_severity,
> -		    struct aer_capability_regs *aer);
> +void pci_print_aer(char *level, struct pci_dev *dev, int aer_severity,
> +		   struct aer_capability_regs *aer);
>  int cper_severity_to_aer(int cper_severity);
>  void aer_recover_queue(int domain, unsigned int bus, unsigned int devfn,
>  		       int severity, struct aer_capability_regs *aer_regs);


