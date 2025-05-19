Return-Path: <linuxppc-dev+bounces-8700-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BF8ABCBB6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 01:48:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1ZC70Gkzz2yrq;
	Tue, 20 May 2025 09:48:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747698530;
	cv=none; b=YkTuomBe/mchkjkFeTNeF3Nz/NHG7JTsESfbN5rJUuy3Wp2K64nRuBLqZsfBd7fnNIBCcJbymwkmgXuYePomh5XiZJjxZ6JrkgjsUQMUZeRSqhMg2azvAQv/JKdONFnZUANJal31MFcHCsIezZuBO9WbhOfDR3mlHwjqgjTIfO1T0uHTWC9AWC1KpoHErqGx3J/TyinandgH0jezyCAkaqBpBFBC0ufBy9ddLjLHc8+5n8Wwye2/uX1UTqRPmS17uViwCpj+Vw356vs638+YKawSiV9OwViLOQxig5uGGgPgCup0j463QugFZOjT7icmA8y1UtZZH1GEL/qkGkpafg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747698530; c=relaxed/relaxed;
	bh=cfFNRL1vk+BmqhoscSMdFF+VzjTP9SAzzI2G/7S0wvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=baxDnbJWPRnxM8mZi0Sz9piF8gPmzmBuUw3xIzge24O2gpAQ9Eqa0MoPdsP/E47wW6ypo1FThqMsoj/Qe34HfnNmvmUMbBEo/6b68HLqKStHtTFTT86xkf21niOrtZMnIOmzxo2IJawe+RTNnx6WR9HYmJDZEdBnS7wYwptWnEnsAFY7bUEJKomqk9nmqQuGZSsG9w6ZD6I1d7ztcEWky+DcJoxWgPlMzeHxzaZ1HTe++qVIB36FV+bLgj16e10OKIY/pMP+Q1n4ApPSiCXmUi61ajupxr/kudiW/VOe1Gt793euOgO3m1XgYiSgtBdAbUIUNg1nSxld+PZqj7v5AQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lBAfo/F0; dkim-atps=neutral; spf=none (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lBAfo/F0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1ZC6140Sz2yrR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 09:48:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747698530; x=1779234530;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LJOuant5C3INJ16GsM0ycGuMue6hzGDfnJVPCWAo/VU=;
  b=lBAfo/F02DJRsV/GClYgFm4r4gcc6jmlc8AnEXbT3C5XzYcpFA8BLjhD
   HXo3D9CFu+XKjJfTmYCTd/XcU8TbUgBTxnMZW4hdjHamqLFKv474K7PIh
   tO+hrsQT7Ip94yu/DHtO3ax/0GYdDqyslAgeE1tJSZIq8QtqkqIH7JLoY
   EbXd5u4UBYFZThC45IQ9/JceIV5Eivqz/jF9BRT/0fM3fBuowfQ7e1s+t
   aJPFBgVY7nYxVGDGbD9t1L6/SgPDkuW35E5HuDGdYAJhgal19i+3tGQ7V
   b4nCQVw3MvdErHstGsBo7G/iaAQS+QRtV4kjaHREy4ibM/e/NQ7rXzS15
   g==;
X-CSE-ConnectionGUID: Z9XJmKMGSm2Nx/5ygNDj7g==
X-CSE-MsgGUID: ElfLb9ynTYmil2V87y6TyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="52245956"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="52245956"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 16:48:48 -0700
X-CSE-ConnectionGUID: F8EwIusvRgytG6VTL3CYQg==
X-CSE-MsgGUID: AH2P0i/EQZa7HbERW4MxuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139421191"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO [10.124.221.39]) ([10.124.221.39])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 16:48:47 -0700
Message-ID: <e8cf0a90-638d-446a-a5df-2dff3d091e38@linux.intel.com>
Date: Mon, 19 May 2025 16:48:46 -0700
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
Subject: Re: [PATCH v6 05/16] PCI/AER: Rename aer_print_port_info() to
 aer_print_source()
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
 <20250519213603.1257897-6-helgaas@kernel.org>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250519213603.1257897-6-helgaas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 5/19/25 2:35 PM, Bjorn Helgaas wrote:
> From: Jon Pan-Doh <pandoh@google.com>
>
> Rename aer_print_port_info() to aer_print_source() to be more descriptive.
> This logs the Error Source ID logged by a Root Port or Root Complex Event
> Collector when it receives an ERR_COR, ERR_NONFATAL, or ERR_FATAL Message.
>
> [bhelgaas: aer_print_rp_info() -> aer_print_source()]
> Link: https://lore.kernel.org/r/20250321015806.954866-5-pandoh@google.com
> Signed-off-by: Jon Pan-Doh <pandoh@google.com>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>   drivers/pci/pcie/aer.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index dc8a50e0a2b7..eb42d50b2def 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -733,8 +733,8 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
>   			info->severity, info->tlp_header_valid, &info->tlp);
>   }
>   
> -static void aer_print_port_info(struct pci_dev *dev, struct aer_err_info *info,
> -				const char *details)
> +static void aer_print_source(struct pci_dev *dev, struct aer_err_info *info,
> +			     const char *details)
>   {
>   	u16 source = info->id;
>   
> @@ -932,7 +932,7 @@ static bool find_source_device(struct pci_dev *parent,
>   	 * RCEC that received an ERR_* Message.
>   	 */
>   	if (!e_info->error_dev_num) {
> -		aer_print_port_info(parent, e_info, " (no details found)");
> +		aer_print_source(parent, e_info, " (no details found)");
>   		return false;
>   	}
>   	return true;
> @@ -1299,7 +1299,7 @@ static void aer_isr_one_error(struct aer_rpc *rpc,
>   			e_info.multi_error_valid = 0;
>   
>   		if (find_source_device(pdev, &e_info)) {
> -			aer_print_port_info(pdev, &e_info, "");
> +			aer_print_source(pdev, &e_info, "");
>   			aer_process_err_devices(&e_info);
>   		}
>   	}
> @@ -1318,7 +1318,7 @@ static void aer_isr_one_error(struct aer_rpc *rpc,
>   			e_info.multi_error_valid = 0;
>   
>   		if (find_source_device(pdev, &e_info)) {
> -			aer_print_port_info(pdev, &e_info, "");
> +			aer_print_source(pdev, &e_info, "");
>   			aer_process_err_devices(&e_info);
>   		}
>   	}

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


