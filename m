Return-Path: <linuxppc-dev+bounces-9131-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2326ACCFAE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jun 2025 00:18:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBlVL0WgGz2xYl;
	Wed,  4 Jun 2025 08:18:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748989129;
	cv=none; b=BUyYE7nq4+MhEsA6PbaI+9fq8KMkStnwPRL1CVvjix6K78XkqecCDKCkdBco1fur6hIUCpf2SATBsy4ylUxqd3lQjvv58ATAdKQBIx7xk9xbq/F1w9fTacr8W8S+LNSJABtC/8oMSs1Dt3mvcZeSYnumSSof/EqFnMPMIAKef2XOiQQNfaLAQ/ZtB20/FW2tpT0um/zGYL2I473ty8rTtuogq3UCSklHoEqKt+JXF/XQ5F+BCHcFhwkffyTVcxxycPwjdgaS8azxaktImhwVNuQyZ7y64AjkWjYg22bbFZxxOTzcEwQm6xPbN6NBzjU+KcepupbiMX+vl/L1zB59tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748989129; c=relaxed/relaxed;
	bh=64YKHf5WCCqMSuvyYfEekiYQAZ3LXIMMvG4VtrGWxOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XmDccLp1Ri0HM/NU6wzxGYyt150ebn5L2Px0DFICGMrtcAuwOnyh8hAOYT+xJHKwABfVuFU9iaDIFeI18mEDbYgwzEk3nXEO7m/pjV+EwqGqkhzSxR00Lu6VJj4OGyg1tLE8rrSLSTmuswyZas82fk3Hi5NOqMLzpYekI/wiy0yrA0ho2mQqvToKWT4EJKRSTdtS3bdt44rrs0EjU7WzyoqE7qrjfRB5RYc//weshxttChpI/kA0iX4LddJLt1uIzZPbDKXr4LoJzAhnyq8KUs0cy1pI6CXizYFJwaXeZ2Kj+CwdADNducbLwJ5+7umMVlg18vL9SNT72SSiBc7HgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Aqz4Argy; dkim-atps=neutral; spf=none (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Aqz4Argy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bBlVK0tN5z2xXP
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jun 2025 08:18:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748989129; x=1780525129;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=K+F/YtNdZO6JxPVsJPOUW+izB++yyaaoWNSWuIwcQIU=;
  b=Aqz4ArgytaFD3OjRUUfx96KrZPGkYv6OX8dFKOKfOyzECU/YGRPvNTPw
   kobgrACi8Rt5RYhlzI8F8vS8Oraw24Amtfz4HR9sEmmkrRi/+bZ670hAg
   NZ1UjRgj3G2Zmd3cI+AbOzsZz1vAI9dYv+pXY4oT2FlXFKs86yCa7fuE+
   HwOfpMCqx4GrJDmD1No0VAuCsK3b6WSRju7FUKdgBN4LUH8jdTwtXVP4W
   XfL4qlZaHeXbhfxwFf3/UqqdxXAqoCXwJwq48S2W5EHupwEoKaQKgn1nR
   7Vt0f/Zp2m17FK2tGRk/DXGr4AKQmAY3vSrSLdaauBjgw0nABi0ChwlHJ
   g==;
X-CSE-ConnectionGUID: LoRRV6KrQNKd4stjmmJ4sg==
X-CSE-MsgGUID: 5hnsSYw/Q2Wsxjc52fkdiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="53677531"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; 
   d="scan'208";a="53677531"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 15:18:47 -0700
X-CSE-ConnectionGUID: vDKE25ChRcipbzHXBQUJOw==
X-CSE-MsgGUID: PQehbhp5RjqoV3hwbE53Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; 
   d="scan'208";a="148829830"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 15:18:46 -0700
Received: from [10.124.221.22] (unknown [10.124.221.22])
	by linux.intel.com (Postfix) with ESMTP id A14C120B5736;
	Tue,  3 Jun 2025 15:18:43 -0700 (PDT)
Message-ID: <b5c6a148-801e-46d5-bc8a-a550006dbd52@linux.intel.com>
Date: Tue, 3 Jun 2025 15:18:42 -0700
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
 Dave Jiang <dave.jiang@intel.com>,
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
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250603155536.577493-4-fabio.m.de.francesco@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
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
> ---
>   drivers/acpi/Kconfig       |  1 +
>   drivers/acpi/acpi_extlog.c | 32 ++++++++++++++++++++++++++++++++
>   drivers/pci/pcie/aer.c     |  2 +-
>   include/linux/aer.h        |  8 ++++++--
>   4 files changed, 40 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
> index 7bc40c2735ac0..2bbd9e4868ad7 100644
> --- a/drivers/acpi/Kconfig
> +++ b/drivers/acpi/Kconfig
> @@ -493,6 +493,7 @@ config ACPI_EXTLOG
>   	tristate "Extended Error Log support"
>   	depends on X86_MCE && X86_LOCAL_APIC && EDAC
>   	select UEFI_CPER
> +	select ACPI_APEI_PCIEAER
>   	help
>   	  Certain usages such as Predictive Failure Analysis (PFA) require
>   	  more information about the error than what can be described in
> diff --git a/drivers/acpi/acpi_extlog.c b/drivers/acpi/acpi_extlog.c
> index 47d11cb5c9120..b2928ff297eda 100644
> --- a/drivers/acpi/acpi_extlog.c
> +++ b/drivers/acpi/acpi_extlog.c
> @@ -132,6 +132,34 @@ static int print_extlog_rcd(const char *pfx,
>   	return 1;
>   }
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
>   static int extlog_print(struct notifier_block *nb, unsigned long val,
>   			void *data)
>   {
> @@ -183,6 +211,10 @@ static int extlog_print(struct notifier_block *nb, unsigned long val,
>   			if (gdata->error_data_length >= sizeof(*mem))
>   				trace_extlog_mem_event(mem, err_seq, fru_id, fru_text,
>   						       (u8)gdata->error_severity);
> +		} else if (guid_equal(sec_type, &CPER_SEC_PCIE)) {
> +			struct cper_sec_pcie *pcie_err = acpi_hest_get_payload(gdata);
> +
> +			extlog_print_pcie(pcie_err, gdata->error_severity);
>   		} else {
>   			void *err = acpi_hest_get_payload(gdata);
>   
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index d0ebf7c15afa9..627fcf4346983 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -801,7 +801,7 @@ void pci_print_aer(char *level, struct pci_dev *dev, int aer_severity,
>   	trace_aer_event(dev_name(&dev->dev), (status & ~mask),
>   			aer_severity, tlp_header_valid, &aer->header_log);
>   }
> -EXPORT_SYMBOL_NS_GPL(pci_print_aer, "CXL");
> +EXPORT_SYMBOL_GPL(pci_print_aer);
>   
>   /**
>    * add_error_device - list device to be handled
> diff --git a/include/linux/aer.h b/include/linux/aer.h
> index 45d0fb2e2e759..6ce433cee4625 100644
> --- a/include/linux/aer.h
> +++ b/include/linux/aer.h
> @@ -56,16 +56,20 @@ struct aer_capability_regs {
>   #if defined(CONFIG_PCIEAER)
>   int pci_aer_clear_nonfatal_status(struct pci_dev *dev);
>   int pcie_aer_is_native(struct pci_dev *dev);
> +void pci_print_aer(char *level, struct pci_dev *dev, int aer_severity,
> +		   struct aer_capability_regs *aer);
>   #else
>   static inline int pci_aer_clear_nonfatal_status(struct pci_dev *dev)
>   {
>   	return -EINVAL;
>   }
>   static inline int pcie_aer_is_native(struct pci_dev *dev) { return 0; }
> +static inline void pci_print_aer(char *level, struct pci_dev *dev,
> +				 int aer_severity,
> +				 struct aer_capability_regs *aer)
> +{ }

This also needs rebase. With the patches queued for v6.16, you may not
need to pass level any more.

>   #endif
>   
> -void pci_print_aer(char *level, struct pci_dev *dev, int aer_severity,
> -		   struct aer_capability_regs *aer);
>   int cper_severity_to_aer(int cper_severity);
>   void aer_recover_queue(int domain, unsigned int bus, unsigned int devfn,
>   		       int severity, struct aer_capability_regs *aer_regs);

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


