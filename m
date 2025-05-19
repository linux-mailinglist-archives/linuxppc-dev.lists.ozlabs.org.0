Return-Path: <linuxppc-dev+bounces-8698-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD54ABCBA0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 01:39:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1Z0K239bz2yrF;
	Tue, 20 May 2025 09:39:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747697969;
	cv=none; b=JUCeW++yWKWTIBcmFn372SEwGMuk+e9DeBNnSeGscCNbuCmD7xSliqUrnbFb0/rXtwklLiYSFWtPlqm7fcJfmfjDFuaRCqgj+4HZG0yB3UOcjb6qXeNPocd6YlCwr5EGPTH16z1l7FGCYp7sVmC/x7ldBjslLxrqaNSe4rQmot9QX1PqNigZtQfaaumhr3IrAdPNT9bImdyZoxQifxyKV/RbJj2Y/ed1KI6VXTDVUR8/7ouFLumzy581IKkgIY7Pxq8TMWQDF4N+Gd4YvZKFzEfu3tmu0AY5ZTrtc/ZWcNE0Am1G4cx+X0tvgSYXsAtjD62veksa2pkD8vKMvhkpWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747697969; c=relaxed/relaxed;
	bh=Rv4cUHlFnoFdPjiLn9SsSkl/9Xho/uVlRIPdu4ayZIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hLrluMym40OOwI4+BK6nufxC/2eIVTPrEkYkKs7GmXOt/u2JhdcnGKS3H2PUSNDwY0DkTht4SvUppHygQtnaBIgIXBL7JfciFnSzngI8zoTPtpH88MEDx+AaxfSmoTRH7hWlvCkvKeild2x2CbgrXSC+ZNyQAvU/re9BYlF8Q3LbfqTI4ZBjHm05KTL8u9ShmtZ5uM5+8SZytdfpsF/dJ7iFdJGX6vQl8ko3GZIigIq151C11xrx5c7nJK1Za5FdhrwdKe7QXi5oNDrEm6JfrONMnHOrzPo+Qw4iImg4u98wYZtGTVrmkx++SbVeN/45Ddyry1tA/wl9BtQ3copyhw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mMNqg9fx; dkim-atps=neutral; spf=none (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mMNqg9fx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1Z0G4pVJz2yrB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 09:39:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747697967; x=1779233967;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=yJhwSl/hpeMxQzA7iiTB8rCpNN0FxQgYCJXfN813PcM=;
  b=mMNqg9fxYMTV84hK5FXjN3yyO0X5uRthunoPu4rvGyHwAgba/apQMznN
   XlPvrS97hD/iPj7eF5sAFCm0ep7Nr+O4gVnw/hDgFumin16zMEDLcJ1D4
   4TkOK/HVNDXMICLGZRHLp9w/ky4mRBlr1vZGUayvdOuxOaR8TTqM7IXBy
   Z0b6fHHNZS8w2AbybVdx2mB7KCTX2V5VqhhOVWZ79+z798i9twbJtiayY
   3tqAKZgKE272AtL0VljGTG6RwKiYjyHC4pybBwQhEvZ/SvUN9+quKl4BR
   FMb44vA7Sb+J0nWUIuJbNuyBRVp6monvp8nRiua5fMCuUh2ZjANrMcTH4
   Q==;
X-CSE-ConnectionGUID: a9fdKdGGSEaI+Qo++poRQg==
X-CSE-MsgGUID: wdnus8tLSGy0zwn7Tus1TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60958459"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="60958459"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 16:39:22 -0700
X-CSE-ConnectionGUID: ixaNyZ2lQBCj7Dc0Lj0Gew==
X-CSE-MsgGUID: KnT+1naGTc+MgRutki7GMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140420007"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO [10.124.221.39]) ([10.124.221.39])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 16:39:20 -0700
Message-ID: <9ac2bb02-974f-4952-b069-1bcc94682d89@linux.intel.com>
Date: Mon, 19 May 2025 16:39:19 -0700
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
Subject: Re: [PATCH v6 03/16] PCI/AER: Consolidate Error Source ID logging in
 aer_print_port_info()
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
 <20250519213603.1257897-4-helgaas@kernel.org>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250519213603.1257897-4-helgaas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

On 5/19/25 2:35 PM, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
>
> Previously we decoded the AER Error Source ID in two places.  Consolidate
> them so both places use aer_print_port_info().  Add a "details" parameter
> so we can add a note when we didn't find any downstream devices with errors
> logged in their AER Capability.
>
> When we didn't read any error details from the source device, we logged two
> messages: one in aer_isr_one_error() and another in find_source_device().
> Since they both contain the same information, only log the first one when
> when find_source_device() has found error details.
/s/when//
>
> This changes the dmesg logging when we found no devices with errors logged:
>
>    - pci 0000:00:01.0: AER: Correctable error message received from 0000:02:00.0
>    - pci 0000:00:01.0: AER: found no error details for 0000:02:00.0
>    + pci 0000:00:01.0: AER: Correctable error message received from 0000:02:00.0 (no details found)
>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>   drivers/pci/pcie/aer.c | 30 ++++++++++++++++--------------
>   1 file changed, 16 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index a1cf8c7ef628..b8494ccd935b 100644
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

Instead of relying on the callers, why not add a space before details here?

>   		 info->multi_error_valid ? "Multiple " : "",
>   		 aer_error_severity_string[info->severity],
>   		 pci_domain_nr(dev->bus), bus, PCI_SLOT(devfn),
> -		 PCI_FUNC(devfn));
> +		 PCI_FUNC(devfn), details);
>   }
>   
>   #ifdef CONFIG_ACPI_APEI_PCIEAER
> @@ -926,13 +927,13 @@ static bool find_source_device(struct pci_dev *parent,
>   	else
>   		pci_walk_bus(parent->subordinate, find_device_iter, e_info);
>   
> +	/*
> +	 * If we didn't find any devices with errors logged in the AER
> +	 * Capability, just print the Error Source ID from the Root Port or
> +	 * RCEC that received an ERR_* Message.
> +	 */
>   	if (!e_info->error_dev_num) {
> -		u8 bus = e_info->id >> 8;
> -		u8 devfn = e_info->id & 0xff;
> -
> -		pci_info(parent, "found no error details for %04x:%02x:%02x.%d\n",
> -			 pci_domain_nr(parent->bus), bus, PCI_SLOT(devfn),
> -			 PCI_FUNC(devfn));
> +		aer_print_port_info(parent, e_info, " (no details found)");
>   		return false;
>   	}
>   	return true;
> @@ -1297,10 +1298,11 @@ static void aer_isr_one_error(struct aer_rpc *rpc,
>   			e_info.multi_error_valid = 1;
>   		else
>   			e_info.multi_error_valid = 0;
> -		aer_print_port_info(pdev, &e_info);
>   

Instead of printing the error information in find_source_device() (a helper function), I think it be better to print it here (the error handler). source_found = find_source_device(pdev, &e_info); aer_print_port_info(pdev, &e_info, source_found? "" : "(no details found) " );

if (source_found) aer_process_err_devices(&e_info)


> -		if (find_source_device(pdev, &e_info))
> +		if (find_source_device(pdev, &e_info)) {
> +			aer_print_port_info(pdev, &e_info, "");
>   			aer_process_err_devices(&e_info);
> +		}
>   	}
>   
>   	if (e_src->status & PCI_ERR_ROOT_UNCOR_RCV) {
> @@ -1316,10 +1318,10 @@ static void aer_isr_one_error(struct aer_rpc *rpc,
>   		else
>   			e_info.multi_error_valid = 0;
>   
> -		aer_print_port_info(pdev, &e_info);
> -
> -		if (find_source_device(pdev, &e_info))
> +		if (find_source_device(pdev, &e_info)) {
> +			aer_print_port_info(pdev, &e_info, "");
>   			aer_process_err_devices(&e_info);
> +		}
>   	}
>   }
>   

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


