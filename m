Return-Path: <linuxppc-dev+bounces-8792-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FBCABE6E5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 00:28:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b28MM5Sv5z2yrR;
	Wed, 21 May 2025 08:27:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747780079;
	cv=none; b=NlOF46iwZwc6ZC5qofMMfmBnqIdoD6T3NFVg+v1Rj9Tgv+gQZkTfB5C3Uduytu8fua2vHtaSfz9ICaeMaO3Wm5ylT4d1tw1i1e41FfH+U7JC/+WhDSmxBdOhq+rXJY+zInwHkGPnFiuuS0JsRHS+LClbDniayrp/+FC2G9wu31h0sd6CxGsmV7La6S76EbbSf7tAy2f96bT3tcdeQrmapzaE+4J29xNg+BSoqeSk5hozszFtdY956pDT1W6Yh52b8TOR3zrWsvfCPN8cGB50yhoi8a1UCUn2sK5sCJRP424ee4SU+n9A7y3RvCWskWFHoOpl4ZIEek31ObHdvg9eRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747780079; c=relaxed/relaxed;
	bh=Ar04t2BQd0TkD0T1j3VGFsJBmyFzgxzOfVANsNCqHWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ed6qtsHl6R604N9YWylDo+eBHdJYELRGDC0g8inYEkBRp/ney8UesLlZb7T73RS4Edh/4sskphTPP7qqFfqGdF2TWA/CXP6svxOJCKOZ244lYF8OSBfSBUKW8schxjjmFUlQx3PKtETwk8AB0sCZiQKxRZC314AULCv4IgllPOX/Cvb33psYq0Co09pXuq5/k7+U8p+/l2elk0er+3saiBU6O/4bbQc3KgMNVzI+ogKhS/b0Aa88NVoelndM8Xgi+c0zRTFWBRvM19kbxpdVm0WreGyjLOCmO51uAirqKDi0v5y3s8EfD5WaBiMxzWujIYC2tgUADImyyF3nWcutrQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SoWkxzQ4; dkim-atps=neutral; spf=none (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SoWkxzQ4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b28ML5hM1z2yrN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 08:27:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747780079; x=1779316079;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=l1cP/qs5vRZwTD2Bx8knT8IoVRjZHeWsMztzxK6U6fU=;
  b=SoWkxzQ4vXUatCaE0Czsh0O0SoWCAEogki3EBmTJ71EIGirPjsDrmwMm
   On/TiTicGD0KFJie4AigI4UzV92OPlG1Tcn8NoZxTjDwb7ALMWpgCkxJm
   Xm1NXEWyKfoRkHQLJRAfKuYoXsxIJx0c7/zK77c46e2+ybHKVkpH0HKq3
   qV8mn6fkUOAhf8rl3fyf2yDMr0s3cVn8t5scd6dMw8XeHwZZZtUSbJtZv
   u8gE0HYulbhDgk8938JiSyjnQysfvG9Kwp2Oyfuyq1YKxyfcWbMEyu2qF
   KPFxvyhdmnjdJBfZAU2/bAqiyoqFTWXZatuzYmToG8qTezCGinwmbHS5p
   Q==;
X-CSE-ConnectionGUID: 6tYQHyQnRAmt8vt/B4L0PA==
X-CSE-MsgGUID: j2A/Ap7zRJa/5CcVvOz8AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49835338"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="49835338"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 15:27:57 -0700
X-CSE-ConnectionGUID: qW9qWDnrScyHgWk0lNpy4A==
X-CSE-MsgGUID: uLC217MUQne/69bSqCsZ3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="144786813"
Received: from iweiny-desk3.amr.corp.intel.com (HELO [10.124.222.89]) ([10.124.222.89])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 15:27:55 -0700
Message-ID: <8898c999-b43b-4568-afe1-6a996fc90bbc@linux.intel.com>
Date: Tue, 20 May 2025 15:27:54 -0700
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
Subject: Re: [PATCH v7 04/17] PCI/AER: Consolidate Error Source ID logging in
 aer_isr_one_error_type()
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
References: <20250520215047.1350603-1-helgaas@kernel.org>
 <20250520215047.1350603-5-helgaas@kernel.org>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250520215047.1350603-5-helgaas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 5/20/25 2:50 PM, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
>
> Previously we decoded the AER Error Source ID in aer_isr_one_error_type(),
> then again in find_source_device() if we didn't find any devices with
> errors logged in their AER Capabilities.
>
> Consolidate this so we only decode and log the Error Source ID once in
> aer_isr_one_error_type().  Add a "details" parameter so we can add a note
> when we didn't find any downstream devices with errors logged in their AER
> Capability.
>
> This changes the dmesg logging when we found no devices with errors logged:
>
>    - pci 0000:00:01.0: AER: Correctable error message received from 0000:02:00.0
>    - pci 0000:00:01.0: AER: found no error details for 0000:02:00.0
>    + pci 0000:00:01.0: AER: Correctable error message received from 0000:02:00.0 (no details found)
>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>   drivers/pci/pcie/aer.c | 22 +++++++++-------------
>   1 file changed, 9 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 568229288ca3..488a6408c7a8 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -733,16 +733,17 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
>   			info->severity, info->tlp_header_valid, &info->tlp);
>   }
>   
> -static void aer_print_port_info(struct pci_dev *dev, struct aer_err_info *info)
> +static void aer_print_port_info(struct pci_dev *dev, struct aer_err_info *info,
> +				const char *details)
>   {
>   	u8 bus = info->id >> 8;
>   	u8 devfn = info->id & 0xff;
>   
> -	pci_info(dev, "%s%s error message received from %04x:%02x:%02x.%d\n",
> +	pci_info(dev, "%s%s error message received from %04x:%02x:%02x.%d%s\n",
>   		 info->multi_error_valid ? "Multiple " : "",
>   		 aer_error_severity_string[info->severity],
>   		 pci_domain_nr(dev->bus), bus, PCI_SLOT(devfn),
> -		 PCI_FUNC(devfn));
> +		 PCI_FUNC(devfn), details);
>   }
>   
>   #ifdef CONFIG_ACPI_APEI_PCIEAER
> @@ -926,15 +927,8 @@ static bool find_source_device(struct pci_dev *parent,
>   	else
>   		pci_walk_bus(parent->subordinate, find_device_iter, e_info);
>   
> -	if (!e_info->error_dev_num) {
> -		u8 bus = e_info->id >> 8;
> -		u8 devfn = e_info->id & 0xff;
> -
> -		pci_info(parent, "found no error details for %04x:%02x:%02x.%d\n",
> -			 pci_domain_nr(parent->bus), bus, PCI_SLOT(devfn),
> -			 PCI_FUNC(devfn));
> +	if (!e_info->error_dev_num)
>   		return false;
> -	}
>   	return true;
>   }
>   
> @@ -1281,9 +1275,11 @@ static inline void aer_process_err_devices(struct aer_err_info *e_info)
>   static void aer_isr_one_error_type(struct pci_dev *root,
>   				   struct aer_err_info *info)
>   {
> -	aer_print_port_info(root, info);
> +	bool found;
>   
> -	if (find_source_device(root, info))
> +	found = find_source_device(root, info);
> +	aer_print_port_info(root, info, found ? "" : " (no details found");
> +	if (found)
>   		aer_process_err_devices(info);
>   }
>   

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


