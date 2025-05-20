Return-Path: <linuxppc-dev+bounces-8791-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A78ABE6E4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 00:27:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b28LD0Nppz2yr1;
	Wed, 21 May 2025 08:27:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747780019;
	cv=none; b=JmP761uoiWaJEShtDklkWw2M7OjQWw6aNKDrC900ztrh0Tx6BZe4/KsS1NOpqd3lrqsULijh/+eR2IDL+5CRUFtDkbnvW8jwYrez3GQqTFBAI4Yr0Pw6yShPYOLzpQKa0GSq67Np0XzhkIPKx7NSpkF72245xGxOa4kwUPsNOx27unC8T/oHhbJaWzdFWHTLKQoAG3YOCW7oTyCWzlFk0H5Bcrl/+KpaARRdCuWCbL1Fdbwaxe/LuEZlocGvyDl2KBKWkLrq+b5DSQKaMrwu5yDW9TAJWCSVcivEo0oVMj+UtQEte7qMw8XxtTjd1RuS8/g94vlVP5KtU6LQioQqPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747780019; c=relaxed/relaxed;
	bh=Gh6z/F9J5IqF5rLjv8rxhqmsr/GLUDLqhJtB+KsJqgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dpc5KSe6Lhf54L7AzgSarMC6Fam/PqHhVFL2+Bodz1ZRDPaCVoZukUYjP+sDHRcMZM8qjFwXCAAjpWvmwEYvD9DWQ9mDla6sI3tXaTOKocxekbQVxtOyyLyMZ8VEIPUzHClL5XzRyXj8IZIMSTFSvrmktBn6M3SDhL1WUGqiaTHARzwLPZpGGixhcCqreM6rTnmz6rgn+MjENH7icT0cNcYbQtU6jPlFAVvQxl6BMGUTUAeSc14X57Jf8RW1S34i3458MAtjr2G3XuT3euli0OSomZV9YuaPzVmi68doT6IHyN7ntUKfGVihHeELWVNvM4vniqngqCbVehT8FTUxeA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oFhfpASq; dkim-atps=neutral; spf=none (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oFhfpASq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b28L940Tyz2yql
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 08:26:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747780018; x=1779316018;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8tFeW05/7XCVuFCJ6OwQew4Gt09wQRdhiAtl6NZm4Vs=;
  b=oFhfpASqHkpxjaIZ8ZpKH+w6C6ngpEC8lMbLFnE3O1cg0THt+P5faVL2
   /Jt8un7hvzYf9GULfW4Me+HKwDrJ26Uwb+KvHc5vHSq0j965M3x8/mvy5
   vpbzKEYQoQF7yUyUM3CkKKDbhyvJbeeuSWTMsFD0Uyz4BcD2LLUFdhLkt
   eN33Jffg7Ze2dhoAAN/Oub/Ri5JKCByr4ZZJK0DpoQnC06Fa8tr9W5RIv
   0ytrbBGIM2Fk+LQ6r4yG9eWbJBzbDzyH/ttS/BRorlZjL96jHUMSPqnh8
   x/roa4s2egcqfUQynFQrdKV1MQg/LhHByVSdYyzDsWJGeGYOW9vH4TOI0
   g==;
X-CSE-ConnectionGUID: IznHIOwGQQOyInkcpnQd/Q==
X-CSE-MsgGUID: fIMB0wAnR2WLoNdECSCedg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49835304"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="49835304"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 15:26:52 -0700
X-CSE-ConnectionGUID: DEx49EBDSU2K0eC3jg1jlw==
X-CSE-MsgGUID: ZKAIxYD7Rsq5IwWloIgvsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="144786555"
Received: from iweiny-desk3.amr.corp.intel.com (HELO [10.124.222.89]) ([10.124.222.89])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 15:26:50 -0700
Message-ID: <bacf754b-7807-4058-be4b-6b5c5a17a4d6@linux.intel.com>
Date: Tue, 20 May 2025 15:26:49 -0700
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
Subject: Re: [PATCH v7 03/17] PCI/AER: Factor COR/UNCOR error handling out
 from aer_isr_one_error()
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
 <20250520215047.1350603-4-helgaas@kernel.org>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250520215047.1350603-4-helgaas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 5/20/25 2:50 PM, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
>
> aer_isr_one_error() duplicates the Error Source ID logging and AER error
> processing for Correctable Errors and Uncorrectable Errors.  Factor out the
> duplicated code to aer_isr_one_error_type().
>
> aer_isr_one_error() doesn't need the struct aer_rpc pointer, so pass it the
> Root Port or RCEC pci_dev pointer instead.
>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>   drivers/pci/pcie/aer.c | 36 +++++++++++++++++++++++-------------
>   1 file changed, 23 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index a1cf8c7ef628..568229288ca3 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -1273,17 +1273,32 @@ static inline void aer_process_err_devices(struct aer_err_info *e_info)
>   }
>   
>   /**
> - * aer_isr_one_error - consume an error detected by Root Port
> - * @rpc: pointer to the Root Port which holds an error
> + * aer_isr_one_error_type - consume a Correctable or Uncorrectable Error
/s/cosume/Consume/
> + *			    detected by Root Port or RCEC
> + * @root: pointer to Root Port or RCEC that signaled AER interrupt
> + * @info: pointer to AER error info
> + */
> +static void aer_isr_one_error_type(struct pci_dev *root,
> +				   struct aer_err_info *info)
> +{
> +	aer_print_port_info(root, info);
> +
> +	if (find_source_device(root, info))
> +		aer_process_err_devices(info);
> +}
> +
> +/**
> + * aer_isr_one_error - consume error(s) signaled by an AER interrupt from
> + *		       Root Port or RCEC
> + * @root: pointer to Root Port or RCEC that signaled AER interrupt
>    * @e_src: pointer to an error source
>    */
> -static void aer_isr_one_error(struct aer_rpc *rpc,
> +static void aer_isr_one_error(struct pci_dev *root,
>   		struct aer_err_source *e_src)
>   {
> -	struct pci_dev *pdev = rpc->rpd;
>   	struct aer_err_info e_info;
>   
> -	pci_rootport_aer_stats_incr(pdev, e_src);
> +	pci_rootport_aer_stats_incr(root, e_src);
>   
>   	/*
>   	 * There is a possibility that both correctable error and
> @@ -1297,10 +1312,8 @@ static void aer_isr_one_error(struct aer_rpc *rpc,
>   			e_info.multi_error_valid = 1;
>   		else
>   			e_info.multi_error_valid = 0;
> -		aer_print_port_info(pdev, &e_info);
>   
> -		if (find_source_device(pdev, &e_info))
> -			aer_process_err_devices(&e_info);
> +		aer_isr_one_error_type(root, &e_info);
>   	}
>   
>   	if (e_src->status & PCI_ERR_ROOT_UNCOR_RCV) {
> @@ -1316,10 +1329,7 @@ static void aer_isr_one_error(struct aer_rpc *rpc,
>   		else
>   			e_info.multi_error_valid = 0;
>   
> -		aer_print_port_info(pdev, &e_info);
> -
> -		if (find_source_device(pdev, &e_info))
> -			aer_process_err_devices(&e_info);
> +		aer_isr_one_error_type(root, &e_info);
>   	}
>   }
>   
> @@ -1340,7 +1350,7 @@ static irqreturn_t aer_isr(int irq, void *context)
>   		return IRQ_NONE;
>   
>   	while (kfifo_get(&rpc->aer_fifo, &e_src))
> -		aer_isr_one_error(rpc, &e_src);
> +		aer_isr_one_error(rpc->rpd, &e_src);
>   	return IRQ_HANDLED;
>   }
>   

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


