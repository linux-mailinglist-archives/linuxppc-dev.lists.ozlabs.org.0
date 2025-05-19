Return-Path: <linuxppc-dev+bounces-8699-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 064FAABCBB3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 01:47:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1Z9Q4bpLz2yrX;
	Tue, 20 May 2025 09:47:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747698442;
	cv=none; b=DMfUj5uc0HSxctYtDz6pGJk+zjxvECsyydc3KGsLYqGisi+7/F0WjxC86ljeANDqyLW7JD687vktfm91yZbxaAJPymE4GQAnq/ACRBbrIMEblQOYLE62SkI4m81vhnYeMKUN/CIT8cKongoVPwpn+gyrNVcmwrLpPgIv21rZfOf+KrGokZMNEvSq0xPrynqliQMPIAQSU9M97d9J8zaPP7Uzns9fzLQlH9ot1qCwZaM1gLlvuBscD5QUuEZqhDrp/jTx+t8SqoypEDofuCVRwrVtEzbu/EBv1CpZG3tLyGp/gxqV+Sj+l2oWTP8B6uaIKfwUKeQMbPXUftuGAiGb5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747698442; c=relaxed/relaxed;
	bh=JR1oZE2fkYx7K3vLF0hvT/ADVFV39mhThwqJDGCZiqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NQRuXJVg/XBgUabG44uMJlubRYWXtGsSXgLTxMHl53jq7Bye1PS3H4KfTCYqD2n6HscvEh2PHv2PX3s9MeitcTDQ8lCXkTIZGdEFLCRQQ77tSAMTc5CSN06inUm5q/2JHNksTaG9ftSQJEeHTynd0gwhi1dgzn9+uWa/T3z5p/xo8q/BWHwuzpFPomMMxeg9CTbdwpl5PSqINCazkSADALaZ4SsX/i/vtMWEL09HSxkd9jcpWWNS0CJWbb4fKhWaRnPnzVcUZyvsDqnmKIeVnTiCYmPQSX1aNgFrQKadCqzi5kmsEnHl6p24srIPanNqVEiVjzVsnQ7u0+pnmQ4fbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nh0AK4gx; dkim-atps=neutral; spf=none (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nh0AK4gx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1Z9P4LLqz2yrR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 09:47:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747698442; x=1779234442;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2BXuPy0dtOIAjcn43s0b9leWNNf00rEj6dxgDnly9m4=;
  b=nh0AK4gx/RbM1f3sOJ0+MYeqq/Yiw3w/ZSsH68MZOd77hA+iCpuDsvOG
   btqcgGxeYChnkwjTR8X+qJfJJjEv15XzGuhqcpyctCmC4SvsdNJ9JeOeD
   TzxscPnSLU7FcvAIxpyTVD7tPaLY+otJEHvvUjUMozy/WcBUgN791kEVM
   bYFx5KpLDoAXgOwD2dKQEMSdR6bHWdDAmG56PSp12QMrNZqFrzOqV5hfE
   ylLFMQPzfydqPaePQseed2zj3uMjWs6vxrvacpiKzNHemlX9JgGKCj0mT
   /I7N285LGy8J0hOv+hdrbqPn3qrPzFHrlhvRaUe6hfrup2tMrifMHAw/8
   A==;
X-CSE-ConnectionGUID: 58/6BM7wQPesqF3A0l0OYQ==
X-CSE-MsgGUID: 6t72Jcc5Tu2px5Ik0cnEqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="52245880"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="52245880"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 16:47:19 -0700
X-CSE-ConnectionGUID: QWIh/uQRSY+1nhDqJrlsaw==
X-CSE-MsgGUID: OwcPBSk6TZS2d7dRiA+p6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139421077"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO [10.124.221.39]) ([10.124.221.39])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 16:47:18 -0700
Message-ID: <2889da2a-5cda-4a78-9457-864276c92410@linux.intel.com>
Date: Mon, 19 May 2025 16:47:17 -0700
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
Subject: Re: [PATCH v6 04/16] PCI/AER: Extract bus/dev/fn in
 aer_print_port_info() with PCI_BUS_NUM(), etc
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
 <20250519213603.1257897-5-helgaas@kernel.org>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250519213603.1257897-5-helgaas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 5/19/25 2:35 PM, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
>
> Use PCI_BUS_NUM(), PCI_SLOT(), PCI_FUNC() to extract the bus number,
> device, and function number directly from the Error Source ID.  There's no
> need to shift and mask it explicitly.
>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>   drivers/pci/pcie/aer.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index b8494ccd935b..dc8a50e0a2b7 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -736,14 +736,13 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
>   static void aer_print_port_info(struct pci_dev *dev, struct aer_err_info *info,
>   				const char *details)
>   {
> -	u8 bus = info->id >> 8;
> -	u8 devfn = info->id & 0xff;
> +	u16 source = info->id;
>   
>   	pci_info(dev, "%s%s error message received from %04x:%02x:%02x.%d%s\n",

Since it is used in many places in PCI driver, may be define

#define PCI_ADDR_FMT "%04x:%02x:%02x.%d"

>   		 info->multi_error_valid ? "Multiple " : "",
>   		 aer_error_severity_string[info->severity],
> -		 pci_domain_nr(dev->bus), bus, PCI_SLOT(devfn),
> -		 PCI_FUNC(devfn), details);
> +		 pci_domain_nr(dev->bus), PCI_BUS_NUM(source),
> +		 PCI_SLOT(source), PCI_FUNC(source), details);
>   }
>   
>   #ifdef CONFIG_ACPI_APEI_PCIEAER

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


