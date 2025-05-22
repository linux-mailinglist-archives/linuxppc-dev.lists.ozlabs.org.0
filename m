Return-Path: <linuxppc-dev+bounces-8902-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C40AC1836
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 May 2025 01:44:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3Pz71nZNz3c53;
	Fri, 23 May 2025 09:44:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747957491;
	cv=none; b=dT9ibjfsDRMMOqbf1ZRoPRiX2AxHNNRRQ1LgNiN+lfVhLfxkedzxOmNbzoj26utLVLyi8PBc6N7Y6I+PFG+DfKKBuGcRqAe89pisZIXcNCuohUQHONVToeN8NaGZz0IZlFJpFdlzX/dbuEKU4sgwy4XxSBUJN5c/+R0qPjchcFjmzlUZkhv2Ia8QrjdbpQeoJooDaT6514nRJ4YiUPMjzFDq3R3rlv2E9xdFK2jySZLkeKAz+EhIU7ited+9mSA4R6LmIToIKPv8ne5YLc5JGy0uIGuYXCt01b0cHTOO/tMf3W65yC079//rHrdy9UJSbQ9iW3giFU/Kq95IwrKyuw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747957491; c=relaxed/relaxed;
	bh=tvjLgs0WeKnsEmxHkPdFNoYQtyXRtG68F2kEcBWi9C4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JEMuVaubmNYQm7dy5Bl9KmdhBWi2zMYpOQnCN56IfAosnp4pk7+KbQ2MfSpBfeXpiw6DJPSWCUkK6VUXWm396PFyZd/hthyDxiumpC9cUZCNg+uDXBmPcE3ku8g9p4Z509tbLFepia7zemPJidj6U3L05P9KLpQqTeArsoU3o4xYvJb7A3+u3xMBMBCcD/RHLTOFkitBI024lFuxSmMr3jvfClkVzZzsUhJnPmUvmSQFngPXlsnjGVOwuzDl8TqxEnGVpnLRygvHmyagfrQjrVPnwTqd1aEc6Mtvi+WI+VV+E7U2iMEV8HFoCLFXeuQ7+97T5D320s97F6ZhYzx2FQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=agPf9mo8; dkim-atps=neutral; spf=none (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=agPf9mo8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3Pz464Hxz3c52
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 May 2025 09:44:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747957489; x=1779493489;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HrxTnpzGlksA3R7lsGE+tdhiAU6geStxqS72uNEzULM=;
  b=agPf9mo8ik05eMU1xl7gD+0wFSBazAaFowAnTUl1APEuXmzzc+wJPDac
   QFPDiHDs0mNjuBhdM2hguG19erplP9yNkZAutmz0hwJAglxBWd6c2C+3+
   U3JdRbdGiQLHsZvjzGiBDfScOYlMqIaoqITGYjE9f1ZT4maqHlxgRXB4J
   zDp/zaWFBzRk0TYCoGES4LwQtPk0F4KUyNzDUBXshMUDUFSLFAq8Ty3hV
   QUmMxi9YZFAVkvNbOrtunUOsAMUaFKYGG4KFwgfo8mIHyfxmI7SMp/fVz
   FJzKQSBeBKCI2Engkl8KifGLMxiozDXPlBXnM0hxlwAoYP11PvnOfgpCg
   A==;
X-CSE-ConnectionGUID: xJJRrrDESd6csNF8z2mp8g==
X-CSE-MsgGUID: SMEsOZduSxOUOAGoTcq8ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="60257387"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="60257387"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 16:44:45 -0700
X-CSE-ConnectionGUID: y/I8ALG+QGGXRBknYG+cJA==
X-CSE-MsgGUID: MLFZckS/QtKuGpd0063UaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="145538704"
Received: from bjrankin-mobl3.amr.corp.intel.com (HELO [10.124.223.120]) ([10.124.223.120])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 16:44:44 -0700
Message-ID: <2d99e03b-e899-41dd-91f8-d36673d23392@linux.intel.com>
Date: Thu, 22 May 2025 16:44:43 -0700
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
Subject: Re: [PATCH v8 13/20] PCI/ERR: Add printk level to
 pcie_print_tlp_log()
To: Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org
Cc: Jon Pan-Doh <pandoh@google.com>,
 Karolina Stolarek <karolina.stolarek@oracle.com>,
 Weinan Liu <wnliu@google.com>, Martin Petersen <martin.petersen@oracle.com>,
 Ben Fuller <ben.fuller@oracle.com>, Drew Walton <drewwalton@microsoft.com>,
 Anil Agrawal <anilagrawal@meta.com>, Tony Luck <tony.luck@intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Lukas Wunner <lukas@wunner.de>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Sargun Dhillon <sargun@meta.com>, "Paul E . McKenney" <paulmck@kernel.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Kai-Heng Feng <kaihengf@nvidia.com>,
 Keith Busch <kbusch@kernel.org>, Robert Richter <rrichter@amd.com>,
 Terry Bowman <terry.bowman@amd.com>, Shiju Jose <shiju.jose@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>
References: <20250522232339.1525671-1-helgaas@kernel.org>
 <20250522232339.1525671-14-helgaas@kernel.org>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250522232339.1525671-14-helgaas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 5/22/25 4:21 PM, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
>
> aer_print_error() produces output at a printk level (KERN_ERR/KERN_WARNING/
> etc) that depends on the kind of error, and it calls pcie_print_tlp_log(),
> which previously always produced output at KERN_ERR.
>
> Add a "level" parameter so aer_print_error() can control the level of the
> pcie_print_tlp_log() output to match.
>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>   drivers/pci/pci.h      | 3 ++-
>   drivers/pci/pcie/aer.c | 5 +++--
>   drivers/pci/pcie/dpc.c | 2 +-
>   drivers/pci/pcie/tlp.c | 6 ++++--
>   4 files changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 705f9ef58acc..1a9bfc708757 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -613,7 +613,8 @@ int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
>   		      struct pcie_tlp_log *log);
>   unsigned int aer_tlp_log_len(struct pci_dev *dev, u32 aercc);
>   void pcie_print_tlp_log(const struct pci_dev *dev,
> -			const struct pcie_tlp_log *log, const char *pfx);
> +			const struct pcie_tlp_log *log, const char *level,
> +			const char *pfx);
>   #endif	/* CONFIG_PCIEAER */
>   
>   #ifdef CONFIG_PCIEPORTBUS
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index f80c78846a14..f0936759ba8b 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -734,7 +734,7 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
>   	__aer_print_error(dev, info);
>   
>   	if (info->tlp_header_valid)
> -		pcie_print_tlp_log(dev, &info->tlp, dev_fmt("  "));
> +		pcie_print_tlp_log(dev, &info->tlp, level, dev_fmt("  "));
>   
>   out:
>   	if (info->id && info->error_dev_num > 1 && info->id == id)
> @@ -797,7 +797,8 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
>   			aer->uncor_severity);
>   
>   	if (tlp_header_valid)
> -		pcie_print_tlp_log(dev, &aer->header_log, dev_fmt("  "));
> +		pcie_print_tlp_log(dev, &aer->header_log, info.level,
> +				   dev_fmt("  "));
>   }
>   EXPORT_SYMBOL_NS_GPL(pci_print_aer, "CXL");
>   
> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> index 6c98fabdba57..7ae1590ea1da 100644
> --- a/drivers/pci/pcie/dpc.c
> +++ b/drivers/pci/pcie/dpc.c
> @@ -222,7 +222,7 @@ static void dpc_process_rp_pio_error(struct pci_dev *pdev)
>   			  dpc_tlp_log_len(pdev),
>   			  pdev->subordinate->flit_mode,
>   			  &tlp_log);
> -	pcie_print_tlp_log(pdev, &tlp_log, dev_fmt(""));
> +	pcie_print_tlp_log(pdev, &tlp_log, KERN_ERR, dev_fmt(""));
>   
>   	if (pdev->dpc_rp_log_size < PCIE_STD_NUM_TLP_HEADERLOG + 1)
>   		goto clear_status;
> diff --git a/drivers/pci/pcie/tlp.c b/drivers/pci/pcie/tlp.c
> index 890d5391d7f5..71f8fc9ea2ed 100644
> --- a/drivers/pci/pcie/tlp.c
> +++ b/drivers/pci/pcie/tlp.c
> @@ -98,12 +98,14 @@ int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
>    * pcie_print_tlp_log - Print TLP Header / Prefix Log contents
>    * @dev: PCIe device
>    * @log: TLP Log structure
> + * @level: Printk log level
>    * @pfx: String prefix
>    *
>    * Prints TLP Header and Prefix Log information held by @log.
>    */
>   void pcie_print_tlp_log(const struct pci_dev *dev,
> -			const struct pcie_tlp_log *log, const char *pfx)
> +			const struct pcie_tlp_log *log, const char *level,
> +			const char *pfx)
>   {
>   	/* EE_PREFIX_STR fits the extended DW space needed for the Flit mode */
>   	char buf[11 * PCIE_STD_MAX_TLP_HEADERLOG + 1];
> @@ -130,6 +132,6 @@ void pcie_print_tlp_log(const struct pci_dev *dev,
>   		}
>   	}
>   
> -	pci_err(dev, "%sTLP Header%s: %s\n", pfx,
> +	dev_printk(level, &dev->dev, "%sTLP Header%s: %s\n", pfx,
>   		log->flit ? " (Flit)" : "", buf);
>   }

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


