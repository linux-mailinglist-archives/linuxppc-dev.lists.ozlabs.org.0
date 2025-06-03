Return-Path: <linuxppc-dev+bounces-9129-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8136ACCF5B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jun 2025 23:49:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBkrK1MqJz2y92;
	Wed,  4 Jun 2025 07:49:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748987361;
	cv=none; b=QXYk0ApwW86rPF46nKaEg50UAr36XapJOEJb7d7zMcYwx25aYkf3SwRQwRBlo5fVH9pylJxZONbbBl3FGar2rcHMA6JJAY4JyB/N5izDoRagJ2uC8Kj3wgC2Zt4L0ZN7kzg3gpmGnkQNuV10X7ZPUelL7nNxsJjWeKxxGTo9NWNHhdBxs5taXrIjClnqoiEIaAA2U3H7pP5HTG5C9YXuhfGP0HhNUiNcU7YzSXRNhsUfRYKh0mEYSuD0MmlUtQ64ZXnvr4jOtyheOAfsfdRyAH9TURJ2O0TUhFS/kbAMkKa/fvMuAbDmg/TTwLR55EKRhIQ/mHKpCC6LvI7jYNdCqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748987361; c=relaxed/relaxed;
	bh=XqIAQmi+2MagpM80lD32fIK/S0sshNCVleZWh68dUmo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BeYjWAn8JiaV8/dVDhKsT1mvz3gL20ZOc7IpJn8ERG+nc5IeAqdZmjxbdzQSwV5c01EbE6qvKPDSVhM6AUHGlYCLe1VwHO+ocGLtzYEA6TbisM4ntrbznbZTEhLZweMRf00VurLHR68ISLSKFlHR70yp8JNVR66OgrrKINQm7T9pThHt9qaRdhaqxKOW/wTD4Gso1L3LsRg+6QxtOSfCD4l7wrrs2qXqypRvd+qQii4mLIWWWz2buE8W7PdL4jungMf7grRxGGGjOXeAy5qKUpYmwZ8KUIotAbdsPsNTeeGxXL/CofJ6rzbNjwVMMzOG5LKNfGxuxQz3N5uZFSHvqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J6WZ2Kef; dkim-atps=neutral; spf=pass (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=dave.jiang@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J6WZ2Kef;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=dave.jiang@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bBkrG5Bk7z2xXP
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jun 2025 07:49:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748987359; x=1780523359;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/72GejJlyaFyHD9yEsDhR0fa1xsa7AXd9PwGG3Wdsz4=;
  b=J6WZ2KefeDvIzLUEkKFJJ1h04nBRLGhUz3sMvV3MykOetlEB9PTN2Pr6
   GZIahmb1hMYWaj98QzvQn9Ii66hq2PGZ/38Bf8DSreyz2p8GTXECiKQFh
   pTv1EPKApRZQOPUlPlsk5b1kcbFv60MY2FxV9ARHnUTHNa88kmTHdL9aH
   q7dNfwnA7ndd50cCdw7Xezg0REzke6vHPTAfEge8jw3wi76IYrFtaGb+V
   IXgWJmEGayU/RMOHUtJ3++2/FfHBbc33qrLGYzCFb//WuYfaKyovs9Cy3
   FLFkixzsm1jk2kpBbmzS9XIeJlZ/DCnGFvernEjZffjOupkL1u4eTfz3Y
   A==;
X-CSE-ConnectionGUID: qRwJ6UvhRNijoU3ajO8cCw==
X-CSE-MsgGUID: haM0FglORnGBAfRqwyDXXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="62405366"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; 
   d="scan'208";a="62405366"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 14:49:14 -0700
X-CSE-ConnectionGUID: x1lAca+5SRCCSc7N8LZBFQ==
X-CSE-MsgGUID: ibOCymN6QieUiSF771rJRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; 
   d="scan'208";a="150035277"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [10.125.110.198]) ([10.125.110.198])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 14:49:13 -0700
Message-ID: <d37669fc-72e6-48d8-a080-e0353ccc812d@intel.com>
Date: Tue, 3 Jun 2025 14:49:10 -0700
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
Subject: Re: [PATCH 3/4 v3] ACPI: extlog: Trace CPER PCI Express Error Section
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
 <20250603155536.577493-4-fabio.m.de.francesco@linux.intel.com>
Content-Language: en-US
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20250603155536.577493-4-fabio.m.de.francesco@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 6/3/25 8:54 AM, Fabio M. De Francesco wrote:
> I/O Machine Check Architecture events may signal failing PCIe components
> or links. The AER event contains details on what was happening on the wire
> when the error was signaled.
> 
> Trace the CPER PCIe Error section (UEFI v2.10, Appendix N.2.7) reported
> by the I/O MCA.
> 
> Cc: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>

Reviewed-by: Dave Jiang <dave.jiang@intel.com>
> ---
>  drivers/acpi/Kconfig       |  1 +
>  drivers/acpi/acpi_extlog.c | 32 ++++++++++++++++++++++++++++++++
>  drivers/pci/pcie/aer.c     |  2 +-
>  include/linux/aer.h        |  8 ++++++--
>  4 files changed, 40 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
> index 7bc40c2735ac0..2bbd9e4868ad7 100644
> --- a/drivers/acpi/Kconfig
> +++ b/drivers/acpi/Kconfig
> @@ -493,6 +493,7 @@ config ACPI_EXTLOG
>  	tristate "Extended Error Log support"
>  	depends on X86_MCE && X86_LOCAL_APIC && EDAC
>  	select UEFI_CPER
> +	select ACPI_APEI_PCIEAER
>  	help
>  	  Certain usages such as Predictive Failure Analysis (PFA) require
>  	  more information about the error than what can be described in
> diff --git a/drivers/acpi/acpi_extlog.c b/drivers/acpi/acpi_extlog.c
> index 47d11cb5c9120..b2928ff297eda 100644
> --- a/drivers/acpi/acpi_extlog.c
> +++ b/drivers/acpi/acpi_extlog.c
> @@ -132,6 +132,34 @@ static int print_extlog_rcd(const char *pfx,
>  	return 1;
>  }
>  
> +static void extlog_print_pcie(struct cper_sec_pcie *pcie_err,
> +			      int severity)
> +{
> +	struct aer_capability_regs *aer;
> +	struct pci_dev *pdev;
> +	unsigned int devfn;
> +	unsigned int bus;
> +	int aer_severity;
> +	int domain;
> +
> +	if (!(pcie_err->validation_bits & CPER_PCIE_VALID_DEVICE_ID ||
> +	      pcie_err->validation_bits & CPER_PCIE_VALID_AER_INFO))
> +		return;
> +
> +	aer_severity = cper_severity_to_aer(severity);
> +	aer = (struct aer_capability_regs *)pcie_err->aer_info;
> +	domain = pcie_err->device_id.segment;
> +	bus = pcie_err->device_id.bus;
> +	devfn = PCI_DEVFN(pcie_err->device_id.device,
> +			  pcie_err->device_id.function);
> +	pdev = pci_get_domain_bus_and_slot(domain, bus, devfn);
> +	if (!pdev)
> +		return;
> +
> +	pci_print_aer(KERN_DEBUG, pdev, aer_severity, aer);
> +	pci_dev_put(pdev);
> +}
> +
>  static int extlog_print(struct notifier_block *nb, unsigned long val,
>  			void *data)
>  {
> @@ -183,6 +211,10 @@ static int extlog_print(struct notifier_block *nb, unsigned long val,
>  			if (gdata->error_data_length >= sizeof(*mem))
>  				trace_extlog_mem_event(mem, err_seq, fru_id, fru_text,
>  						       (u8)gdata->error_severity);
> +		} else if (guid_equal(sec_type, &CPER_SEC_PCIE)) {
> +			struct cper_sec_pcie *pcie_err = acpi_hest_get_payload(gdata);
> +
> +			extlog_print_pcie(pcie_err, gdata->error_severity);
>  		} else {
>  			void *err = acpi_hest_get_payload(gdata);
>  
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index d0ebf7c15afa9..627fcf4346983 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -801,7 +801,7 @@ void pci_print_aer(char *level, struct pci_dev *dev, int aer_severity,
>  	trace_aer_event(dev_name(&dev->dev), (status & ~mask),
>  			aer_severity, tlp_header_valid, &aer->header_log);
>  }
> -EXPORT_SYMBOL_NS_GPL(pci_print_aer, "CXL");
> +EXPORT_SYMBOL_GPL(pci_print_aer);
>  
>  /**
>   * add_error_device - list device to be handled
> diff --git a/include/linux/aer.h b/include/linux/aer.h
> index 45d0fb2e2e759..6ce433cee4625 100644
> --- a/include/linux/aer.h
> +++ b/include/linux/aer.h
> @@ -56,16 +56,20 @@ struct aer_capability_regs {
>  #if defined(CONFIG_PCIEAER)
>  int pci_aer_clear_nonfatal_status(struct pci_dev *dev);
>  int pcie_aer_is_native(struct pci_dev *dev);
> +void pci_print_aer(char *level, struct pci_dev *dev, int aer_severity,
> +		   struct aer_capability_regs *aer);
>  #else
>  static inline int pci_aer_clear_nonfatal_status(struct pci_dev *dev)
>  {
>  	return -EINVAL;
>  }
>  static inline int pcie_aer_is_native(struct pci_dev *dev) { return 0; }
> +static inline void pci_print_aer(char *level, struct pci_dev *dev,
> +				 int aer_severity,
> +				 struct aer_capability_regs *aer)
> +{ }
>  #endif
>  
> -void pci_print_aer(char *level, struct pci_dev *dev, int aer_severity,
> -		   struct aer_capability_regs *aer);
>  int cper_severity_to_aer(int cper_severity);
>  void aer_recover_queue(int domain, unsigned int bus, unsigned int devfn,
>  		       int severity, struct aer_capability_regs *aer_regs);


