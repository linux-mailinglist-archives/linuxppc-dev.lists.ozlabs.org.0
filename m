Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 025828A9087
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Apr 2024 03:17:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aECA6VmQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VKfyq5Dzhz3dDT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Apr 2024 11:17:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aECA6VmQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Thu, 18 Apr 2024 11:17:00 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VKfy43qXyz3cBK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Apr 2024 11:16:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713403021; x=1744939021;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=uFbfo87nO14001kmIG2rJyAQXlEfsQr2jrkvTkeyE/M=;
  b=aECA6VmQHzHArJ36yRGNgymXXCpR9okOQMdRk4nEzVSsmyHoe8VQIe9T
   aID6BhKpEBuTbSIEhs7+2IZp3yr56y55Rf7+DAINiIwt72jKU1zi1qDB/
   Sgt1kZKWq4eQjASWlOGO2wZqDcsNQIPbXi4uEQiNnF0Ov2BcbMFMXI5pw
   gfkknc6Qls+29AULANx2+JSXa5HWOmmwTK2v19aXCQV6zi/TH9r60MVoP
   +HrSrMF2k0jlIoWvE5VmZMIaIxaQ1ISQhGj3EuH/iW7K2nXFQE8dIf0u8
   nf0wz4QbNFG3tZtPP4UoeXfH0A9AP7r7oTd/ZUUMz4mzLzfQ5xpCRFqSU
   Q==;
X-CSE-ConnectionGUID: eZ7/p1cUSmSvvFm3j/1hwA==
X-CSE-MsgGUID: rK6xDW7TRpaZzj0I7OAb3g==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8799541"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="8799541"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 18:15:53 -0700
X-CSE-ConnectionGUID: Qg3sfDisSnqFwL5IYU/Blw==
X-CSE-MsgGUID: ay2i8yP0QI2Tkuy5KlkNFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="27470822"
Received: from kglossop-mobl.amr.corp.intel.com (HELO [10.209.94.180]) ([10.209.94.180])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 18:15:52 -0700
Message-ID: <2aff18aa-32b7-4092-8235-aead9b708ea0@linux.intel.com>
Date: Wed, 17 Apr 2024 18:15:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] PCI: Add helper to check if any of ancestor device
 support D3cold
To: Kai-Heng Feng <kai.heng.feng@canonical.com>, bhelgaas@google.com
References: <20240416043225.1462548-1-kai.heng.feng@canonical.com>
Content-Language: en-US
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20240416043225.1462548-1-kai.heng.feng@canonical.com>
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
Cc: kch@nvidia.com, regressions@lists.linux.dev, linux-pci@vger.kernel.org, mahesh@linux.ibm.com, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, oohall@gmail.com, hare@suse.de, bagasdotme@gmail.com, kbusch@kernel.org, gloriouseggroll@gmail.com, linuxppc-dev@lists.ozlabs.org, hch@lst.de, sagi@grimberg.me
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 4/15/24 9:32 PM, Kai-Heng Feng wrote:
> In addition to nearest upstream bridge, driver may want to know if the
> entire hierarchy can be powered off to perform different action.
>
> So walk higher up the hierarchy to find out if any device has valid
> _PR3.
>
> The user will be introduced in next patch.
>
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---

Since it has been a while, I was not sure what this series is about.

IMO, it is better to include a cover letter with the summary of your
changes.


> v8:
>  - No change.
>
>  drivers/pci/pci.c   | 16 ++++++++++++++++
>  include/linux/pci.h |  2 ++
>  2 files changed, 18 insertions(+)
>
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index e5f243dd4288..7a5662f116b8 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -6225,6 +6225,22 @@ bool pci_pr3_present(struct pci_dev *pdev)
>  		acpi_has_method(adev->handle, "_PR3");
>  }
>  EXPORT_SYMBOL_GPL(pci_pr3_present);
> +
> +bool pci_ancestor_pr3_present(struct pci_dev *pdev)
> +{
> +	struct pci_dev *parent = pdev;
> +
> +	if (acpi_disabled)
> +		return false;
> +
> +	while ((parent = pci_upstream_bridge(parent))) {
> +		if (pci_pr3_present(pdev))

I think it should be "parent" here?

> +			return true;
> +	}
> +
> +	return false;
> +}
> +EXPORT_SYMBOL_GPL(pci_ancestor_pr3_present);
>  #endif
>  
>  /**
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 16493426a04f..cd71ebfd0f89 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -2620,10 +2620,12 @@ struct irq_domain *pci_host_bridge_acpi_msi_domain(struct pci_bus *bus);
>  void
>  pci_msi_register_fwnode_provider(struct fwnode_handle *(*fn)(struct device *));
>  bool pci_pr3_present(struct pci_dev *pdev);
> +bool pci_ancestor_pr3_present(struct pci_dev *pdev);
>  #else
>  static inline struct irq_domain *
>  pci_host_bridge_acpi_msi_domain(struct pci_bus *bus) { return NULL; }
>  static inline bool pci_pr3_present(struct pci_dev *pdev) { return false; }
> +static inline bool pci_ancestor_pr3_present(struct pci_dev *pdev) { return false; }
>  #endif
>  
>  #ifdef CONFIG_EEH

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

