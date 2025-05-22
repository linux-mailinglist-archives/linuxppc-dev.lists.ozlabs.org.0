Return-Path: <linuxppc-dev+bounces-8906-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FAFAC18B7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 May 2025 01:58:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3QGQ6BH7z3c9c;
	Fri, 23 May 2025 09:58:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747958286;
	cv=none; b=Y571j8HKcxX7U3Wy8NuovQGky94BipnoRFueZM+9LB2t3OSNSpTRKPmQQ1CjTh+OYhnmalC/HuoVTkkG10NFmcilSvqNzYvBTo1/sjTFHbO6c8z8F8wn/jT5dRA+klozbfu4fuM049O3WZn3MGdAkZbkeqjbO7Rqs/tO8+R39LhJW0tjtjDoU+0koeclpct4ibw7qypeZsK93OIaL4MlphAxjd7HXXgBoQyb/eJA7foNZZ3QsvNsF6ixGj7v1ZjiY7U/RhGctwTQThEDQngYSkZgF3/RLcnyqTtQxaBBirMZCFhWHjOD1gWOdIjUHR93z0E/ERfMDiyLzbizzn28iw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747958286; c=relaxed/relaxed;
	bh=QPGW3Q2A2njdh/pmMownMl/P0madpXNeBZTIHqivUYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XWObdQtRG+LgsHaL2GE7z3KRsmzjEqNnyAbJg6eQzeeF4x6grUknu5odPmZyceNZNyFVTDkkzXu4Q/YdCYHwc2yndaR1F/S8+Uw491jEOP8669OO3P7/mPPYwiY1f8DGjSQK/ivLhb2iXyRNhhpL7YK/dPp/EmUzq4NxAq3V27uyQ2DW+ZA6LMDs3uB0MKESHuQAhH0HOm5T0pP4H6CyZpvhR0DuWJXz2FRxN1GYjEI8eezlRd/Ls7ztWG0zD5vrsemKnlEARfrYas70KhIPoFUuCSYWdrcuifq7i4IR1qrxk0X1lPMD8EzceCucJbJGOlf5sTBFM/2GihaEsg2+jQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R05Z9GVa; dkim-atps=neutral; spf=none (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R05Z9GVa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3QGP6x4Cz3c8s
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 May 2025 09:58:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747958286; x=1779494286;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DHcfECq7IBIOTWyIdwrHZNjowJ0zmZT531wNLeqqEXs=;
  b=R05Z9GVaTlFKhhNpM+Qvex4iIhSLIyKOaLyS0wlsHOlFSFyrzxtjhEkk
   QrJ8BdJ0iEM8PJ5qqQmXcIFnwj8DhVFFPGXE2148/ALZATpQlcbfqxsRr
   Ji6+RLjww++PUBXTVBMI8BOZsR5ySN6k2kxtmsgQ2C9av5LhNYXWe/qH3
   5VHTYcLfBlKyEkPF4kmEPDlDlp+YQikJHUbC3cNt+1rkODhBDTSHFQMZH
   NUCipF4iBLgJzSVYBST6H0CTF103T1eCywEa/SzEqYmaEfeyudDFB5PIf
   r6FYylgi2OErQCMtMktkBaT6Pen7gHI6pL6EQbO4DD0ZngeMfIM/4XoGc
   w==;
X-CSE-ConnectionGUID: dM8AastERpGCP5ZDeWj42A==
X-CSE-MsgGUID: LfRqk3lbR86o/ZOlXcf8Jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="60643765"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="60643765"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 16:58:04 -0700
X-CSE-ConnectionGUID: EmapeLK0Shu0TLs2CApchQ==
X-CSE-MsgGUID: mLPKdty7TlSPc1ipuwDdGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="140657840"
Received: from bjrankin-mobl3.amr.corp.intel.com (HELO [10.124.223.120]) ([10.124.223.120])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 16:58:03 -0700
Message-ID: <ac9b9e83-1f4d-46e9-ac15-60e5765a139f@linux.intel.com>
Date: Thu, 22 May 2025 16:58:02 -0700
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
Subject: Re: [PATCH v8 16/20] PCI/AER: Convert aer_get_device_error_info(),
 aer_print_error() to index
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
 <20250522232339.1525671-17-helgaas@kernel.org>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250522232339.1525671-17-helgaas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 5/22/25 4:21 PM, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
>
> Previously aer_get_device_error_info() and aer_print_error() took a pointer
> to struct aer_err_info and a pointer to a pci_dev.  Typically the pci_dev
> was one of the elements of the aer_err_info.dev[] array (DPC was an
> exception, where the dev[] array was unused).
>
> Convert aer_get_device_error_info() and aer_print_error() to take an index
> into the aer_err_info.dev[] array instead.  A future patch will add
> per-device ratelimit information, so the index makes it convenient to find
> the ratelimit associated with the device.
>
> To accommodate DPC, set info->dev[0] to the DPC port before using these
> interfaces.
>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>   drivers/pci/pci.h      |  4 ++--
>   drivers/pci/pcie/aer.c | 33 +++++++++++++++++++++++----------
>   drivers/pci/pcie/dpc.c |  8 ++++++--
>   3 files changed, 31 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 1a9bfc708757..e1a28215967f 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -605,8 +605,8 @@ struct aer_err_info {
>   	struct pcie_tlp_log tlp;	/* TLP Header */
>   };
>   
> -int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info);
> -void aer_print_error(struct pci_dev *dev, struct aer_err_info *info);
> +int aer_get_device_error_info(struct aer_err_info *info, int i);
> +void aer_print_error(struct aer_err_info *info, int i);
>   
>   int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
>   		      unsigned int tlp_len, bool flit,
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 787a953fb331..237741e66d28 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -705,12 +705,18 @@ static void aer_print_source(struct pci_dev *dev, struct aer_err_info *info,
>   		 found ? "" : " (no details found");
>   }
>   
> -void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
> +void aer_print_error(struct aer_err_info *info, int i)
>   {
> -	int layer, agent;
> -	int id = pci_dev_id(dev);
> +	struct pci_dev *dev;
> +	int layer, agent, id;
>   	const char *level = info->level;
>   
> +	if (i >= AER_MAX_MULTI_ERR_DEVICES)
> +		return;
> +
> +	dev = info->dev[i];
> +	id = pci_dev_id(dev);
> +
>   	pci_dev_aer_stats_incr(dev, info);
>   	trace_aer_event(pci_name(dev), (info->status & ~info->mask),
>   			info->severity, info->tlp_header_valid, &info->tlp);
> @@ -1193,19 +1199,26 @@ EXPORT_SYMBOL_GPL(aer_recover_queue);
>   
>   /**
>    * aer_get_device_error_info - read error status from dev and store it to info
> - * @dev: pointer to the device expected to have an error record
>    * @info: pointer to structure to store the error record
> + * @i: index into info->dev[]
>    *
>    * Return: 1 on success, 0 on error.
>    *
>    * Note that @info is reused among all error devices. Clear fields properly.
>    */
> -int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
> +int aer_get_device_error_info(struct aer_err_info *info, int i)
>   {
> -	int type = pci_pcie_type(dev);
> -	int aer = dev->aer_cap;
> +	struct pci_dev *dev;
> +	int type, aer;
>   	u32 aercc;
>   
> +	if (i >= AER_MAX_MULTI_ERR_DEVICES)
> +		return 0;
> +
> +	dev = info->dev[i];
> +	aer = dev->aer_cap;
> +	type = pci_pcie_type(dev);
> +
>   	/* Must reset in this function */
>   	info->status = 0;
>   	info->tlp_header_valid = 0;
> @@ -1257,11 +1270,11 @@ static inline void aer_process_err_devices(struct aer_err_info *e_info)
>   
>   	/* Report all before handling them, to not lose records by reset etc. */
>   	for (i = 0; i < e_info->error_dev_num && e_info->dev[i]; i++) {
> -		if (aer_get_device_error_info(e_info->dev[i], e_info))
> -			aer_print_error(e_info->dev[i], e_info);
> +		if (aer_get_device_error_info(e_info, i))
> +			aer_print_error(e_info, i);
>   	}
>   	for (i = 0; i < e_info->error_dev_num && e_info->dev[i]; i++) {
> -		if (aer_get_device_error_info(e_info->dev[i], e_info))
> +		if (aer_get_device_error_info(e_info, i))
>   			handle_error_source(e_info->dev[i], e_info);
>   	}
>   }
> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> index 7ae1590ea1da..fc18349614d7 100644
> --- a/drivers/pci/pcie/dpc.c
> +++ b/drivers/pci/pcie/dpc.c
> @@ -253,6 +253,10 @@ static int dpc_get_aer_uncorrect_severity(struct pci_dev *dev,
>   		info->severity = AER_NONFATAL;
>   
>   	info->level = KERN_ERR;
> +
> +	info->dev[0] = dev;
> +	info->error_dev_num = 1;
> +
>   	return 1;
>   }
>   
> @@ -270,8 +274,8 @@ void dpc_process_error(struct pci_dev *pdev)
>   		pci_warn(pdev, "containment event, status:%#06x: unmasked uncorrectable error detected\n",
>   			 status);
>   		if (dpc_get_aer_uncorrect_severity(pdev, &info) &&
> -		    aer_get_device_error_info(pdev, &info)) {
> -			aer_print_error(pdev, &info);
> +		    aer_get_device_error_info(&info, 0)) {
> +			aer_print_error(&info, 0);
>   			pci_aer_clear_nonfatal_status(pdev);
>   			pci_aer_clear_fatal_status(pdev);
>   		}

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


