Return-Path: <linuxppc-dev+bounces-8704-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07608ABCC4C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 03:32:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1cW615Xlz2yrb;
	Tue, 20 May 2025 11:32:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747704770;
	cv=none; b=oZsQO3qRTQTZnEWvPhdltWhrzMg++hiCSncB56H3KfeMQe5LBixMcPtLcYa5k3v5xFmBTBnA0QWSFG2mAsfjFslw42odX7hA4nnL68y18QxtRDEJGVklx2fiydjmybQyXRqFd5WxHAfEzFdrMHI+xFoDUMc0XO9C3WLnGvNXvMw7nwUls8Ys5Ko//LfNVfrr3QuDv7fAYoDHUL4xSvKEGB5//Cx7YRdxJjuJF8qanrnjFTi48k6ocqtw/OBm6SRB9VQ3ur/xBq+znLC+JQ/Z+ImCViJvHRsBiOqXTzAaIC8VDHN0onvJzsgWdqxKwgTFxLcxhaPcjiyVvh2GT7ftiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747704770; c=relaxed/relaxed;
	bh=SbWG2H+vW1uThqYzT1WlVvMXvRuwwc/3bJvP2VgaaOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EdnqbDG9RcLYdECikACFnosykxnh2fi8HPE4//XDnK1S1HIsT68QxIAC82YwCF5cUi8WO5UKV2tyIIkNGkj8J3afgyAWNs/o+Vk9JCspJ7bsPL/ZTQIIe1k6JPzkqoIGSay4psAdoIgupl7NSodRTJKnGZOz0xkvG/9cB6crysl5BJRTfaS9tCLiQJPmV6cvXS7KbMrI7FatlzQQEzicfq/getIwbvht7sSjNv2qZijUaOFH4gdvOGoZtpolYa366UIj1zXRGcsnI9gi9ji5BJAMID/FNHqryE1ckYEDcMrEhG8QoOYuH+I95S+AlwI3u/ib/EwtxOPEFMj+J1mk+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H3SHSMoy; dkim-atps=neutral; spf=none (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H3SHSMoy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1cW34Bh1z2yrZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 11:32:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747704768; x=1779240768;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=giaSwuHieTqwGgTsYdG88FEyVGxZpG3P9dwKAPi9yfs=;
  b=H3SHSMoy6vdyJX5mksY/gUYtyVJaas13/3j1tkY6g26FNyjH3Kv/ZPXe
   W2jy7vcquu3A3DkFgfr4N6xCwr3YjXc5JuEnx1ZPgr9vuHbjeYPiXvHLt
   0Stvzw5sQP98BA8BZZCMYjHLXRWWbE1yGSTIwrcdHSFU3EijcQteiHg6K
   TZ3Wa5LYlG5g8Bo9MJ46k1tJdF+nx2ieLHIXk2FTeFt5W4jo3ePsH+VGh
   rbuvEeSxZfsuDlA+WHwIgpzFr/806GTNJmA7H86Y32s1MkL00wpagoGEe
   d29lgQyejvU2WnEQesKY2/MgdK61L+1uTpn9NvkKS5JkyC+4tVaD5sf1C
   A==;
X-CSE-ConnectionGUID: YsznIbZ0RdeDoDObGTHekA==
X-CSE-MsgGUID: EpVNBASjTDyEOTh7A+XLzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="48873789"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="48873789"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 18:32:42 -0700
X-CSE-ConnectionGUID: YZ3GzqMlTm2bKFghH6fY0w==
X-CSE-MsgGUID: w2CTRgTqTgqZy9BhjouVRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139373805"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO [10.124.221.39]) ([10.124.221.39])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 18:32:15 -0700
Message-ID: <92b8da5f-081d-4ca5-98f1-73d6bc3af743@linux.intel.com>
Date: Mon, 19 May 2025 18:32:13 -0700
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
Subject: Re: [PATCH v6 09/16] PCI/AER: Update statistics early in logging
To: Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org
Cc: Jon Pan-Doh <pandoh@google.com>,
 Karolina Stolarek <karolina.stolarek@oracle.com>,
 Martin Petersen <martin.petersen@oracle.com>,
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
References: <20250519213603.1257897-1-helgaas@kernel.org>
 <20250519213603.1257897-10-helgaas@kernel.org>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250519213603.1257897-10-helgaas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 5/19/25 2:35 PM, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
>
> There are two AER logging entry points:
>
>    - aer_print_error() is used by DPC (dpc_process_error()) and native AER
>      handling (aer_process_err_devices()).
>
>    - pci_print_aer() is used by GHES (aer_recover_work_func()) and CXL
>      (cxl_handle_rdport_errors())
>
> Both use __aer_print_error() to print the AER error bits.  Previously
> __aer_print_error() also incremented the AER statistics via
> pci_dev_aer_stats_incr().
>
> Call pci_dev_aer_stats_incr() early in the entry points instead of in
> __aer_print_error() so we update the statistics even if the actual printing
> of error bits is rate limited by a future change.
>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>   drivers/pci/pcie/aer.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 73d618354f6a..eb80c382187d 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -693,7 +693,6 @@ static void __aer_print_error(struct pci_dev *dev,
>   		aer_printk(level, dev, "   [%2d] %-22s%s\n", i, errmsg,
>   				info->first_error == i ? " (First)" : "");
>   	}
> -	pci_dev_aer_stats_incr(dev, info);
>   }
>   
>   static void aer_print_source(struct pci_dev *dev, struct aer_err_info *info,
> @@ -714,6 +713,8 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
>   	int id = pci_dev_id(dev);
>   	const char *level;
>   
> +	pci_dev_aer_stats_incr(dev, info);
> +
>   	if (!info->status) {
>   		pci_err(dev, "PCIe Bus Error: severity=%s, type=Inaccessible, (Unregistered Agent ID)\n",
>   			aer_error_severity_string[info->severity]);
> @@ -782,6 +783,8 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
>   	info.status = status;
>   	info.mask = mask;
>   
> +	pci_dev_aer_stats_incr(dev, &info);
> +
>   	layer = AER_GET_LAYER_ERROR(aer_severity, status);
>   	agent = AER_GET_AGENT(aer_severity, status);
>   

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


