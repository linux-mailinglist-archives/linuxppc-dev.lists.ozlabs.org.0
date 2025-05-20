Return-Path: <linuxppc-dev+bounces-8722-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7D9ABD4B9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 12:28:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1rP00Zt9z301Y;
	Tue, 20 May 2025 20:28:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747736900;
	cv=none; b=LMv5KtpD0s3MG0k/94OEBBDlPaTbsKmj2bQZOuwLn3v4OmEdEZKrzqKem9YdJvVJItFRcbfDIb57yWQBaOTi1cEkyJZXum/OGRBAcPzfqcosyl80Qtvrn77h9yTPKUGhuHx4DvR26oc9lXbhB0+4njI2p/+SKT7ieUvgJR5pL2UAnTgcDKfA8nByqFmkCcwhZF/3yOfV8gTcNvBPHWTaJbjLzCIe0Ks4ZpcphsNTvbKnZkPrMaZv8CubpN5Ge6AO+hU+5Tv+RBgML6yu+k68hAWz7uqGmpGoQsEffeJ2gUKQqozt/mC3gPb7esduy152fjNfK5HBFrkbpq6FOd/zcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747736900; c=relaxed/relaxed;
	bh=hwDzzgjznX9cH7+ri0xQdBL1ZEKWHGGv3J3bOXK4N50=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gbrFF8w0Icr4qYpLo9XnbC8K9tZ+GLksOgCO7bCeMH0Er/HfGWWvG9yC9W+hgR7R6GQrtPdeNM7bwyFgKahYOzyAXkSGVrTIYfhNUqeud6KQKXZf+r4vO+bQOdqQgrRzrbPJvaQHy4CUjrfmg8+5HG6yK0Z93eDwIfBS9L2Wir6HyWJ5V7WMNzGop5ha6EJp0UF7r901sEZhN3x4PLiE8lM7fjNhg/p54gYbIc+IWSp7xa+56gilU6ER5EnCbaq6kc3ZcdXMr1zjbtbuvBsGMYTQWA/+9W50W+ANeZh+AWHDKcBWskVDLG0049gwRGcZQYZdjgjGClV3UBheuWBlig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=knrNWVDo; dkim-atps=neutral; spf=none (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=knrNWVDo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1rNx61KXz3000
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 20:28:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747736898; x=1779272898;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ABdjG3Pe62S3x9ocvJ5urldXhGi9h8OX8THWZ/USw6U=;
  b=knrNWVDoDGb1E8EApXi2KcmZcBDq9zahj4h6FKyiM6xQA1GO67j/gWMn
   9iBCm8B8+SjN8LBZ4o9MfkWrY+aP/2UfSojdf0GtvRwBrNElYY3wZzHxD
   dZm5ReW1zA9JxfNAjB1Lin0xi7d7rL9ufapCsJ6vAngmcxtciDF1euE9k
   izBgSdnb+nxsvPExJxuKvFcoeX/gkRwiNT89Y92JZrAz0kstmhTOTdrvz
   hJ8qgJHbniOXaeQhX8CkPyeBKkwiRTziboC6RGjkeoRSuzBO13lQ8lXzD
   WBArm8bBRWsGl5Xb97bHQtGYyqvTvb6zCWc/Tul8evB07UbDqnUzg78Wb
   Q==;
X-CSE-ConnectionGUID: OkPSojr7Q/qNpP9+0wyM4Q==
X-CSE-MsgGUID: /LdV7+6/T56hWqmdUwCEJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60700843"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="60700843"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 03:28:13 -0700
X-CSE-ConnectionGUID: 9pyCjzPqSgefZQ4zCEbisg==
X-CSE-MsgGUID: DlBKfSmYShKo2EDVX2N9Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="144640371"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 03:28:05 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 May 2025 13:28:02 +0300 (EEST)
To: Bjorn Helgaas <helgaas@kernel.org>
cc: linux-pci@vger.kernel.org, Jon Pan-Doh <pandoh@google.com>, 
    Karolina Stolarek <karolina.stolarek@oracle.com>, 
    Martin Petersen <martin.petersen@oracle.com>, 
    Ben Fuller <ben.fuller@oracle.com>, Drew Walton <drewwalton@microsoft.com>, 
    Anil Agrawal <anilagrawal@meta.com>, Tony Luck <tony.luck@intel.com>, 
    Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, 
    Lukas Wunner <lukas@wunner.de>, 
    Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
    Sargun Dhillon <sargun@meta.com>, "Paul E . McKenney" <paulmck@kernel.org>, 
    Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
    Oliver O'Halloran <oohall@gmail.com>, Kai-Heng Feng <kaihengf@nvidia.com>, 
    Keith Busch <kbusch@kernel.org>, Robert Richter <rrichter@amd.com>, 
    Terry Bowman <terry.bowman@amd.com>, Shiju Jose <shiju.jose@huawei.com>, 
    Dave Jiang <dave.jiang@intel.com>, LKML <linux-kernel@vger.kernel.org>, 
    linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v6 02/16] PCI/DPC: Log Error Source ID only when valid
In-Reply-To: <20250519213603.1257897-3-helgaas@kernel.org>
Message-ID: <b6ba76ff-7cbd-2d73-fdc4-41aa8c788bc9@linux.intel.com>
References: <20250519213603.1257897-1-helgaas@kernel.org> <20250519213603.1257897-3-helgaas@kernel.org>
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
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 19 May 2025, Bjorn Helgaas wrote:

> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> DPC Error Source ID is only valid when the DPC Trigger Reason indicates
> that DPC was triggered due to reception of an ERR_NONFATAL or ERR_FATAL
> Message (PCIe r6.0, sec 7.9.14.5).
> 
> When DPC was triggered by ERR_NONFATAL (PCI_EXP_DPC_STATUS_TRIGGER_RSN_NFE)
> or ERR_FATAL (PCI_EXP_DPC_STATUS_TRIGGER_RSN_FE) from a downstream device,
> log the Error Source ID (decoded into domain/bus/device/function).  Don't
> print the source otherwise, since it's not valid.
> 
> For DPC trigger due to reception of ERR_NONFATAL or ERR_FATAL, the dmesg
> logging changes:
> 
>   - pci 0000:00:01.0: DPC: containment event, status:0x000d source:0x0200
>   - pci 0000:00:01.0: DPC: ERR_FATAL detected
>   + pci 0000:00:01.0: DPC: containment event, status:0x000d, ERR_FATAL received from 0000:02:00.0
> 
> and when DPC triggered for other reasons, where DPC Error Source ID is
> undefined, e.g., unmasked uncorrectable error:
> 
>   - pci 0000:00:01.0: DPC: containment event, status:0x0009 source:0x0200
>   - pci 0000:00:01.0: DPC: unmasked uncorrectable error detected
>   + pci 0000:00:01.0: DPC: containment event, status:0x0009: unmasked uncorrectable error detected
> 
> Previously the "containment event" message was at KERN_INFO and the
> "%s detected" message was at KERN_WARNING.  Now the single message is at
> KERN_WARNING.
> 
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  drivers/pci/pcie/dpc.c | 45 ++++++++++++++++++++++++++----------------
>  1 file changed, 28 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> index fe7719238456..315bf2bfd570 100644
> --- a/drivers/pci/pcie/dpc.c
> +++ b/drivers/pci/pcie/dpc.c
> @@ -261,25 +261,36 @@ void dpc_process_error(struct pci_dev *pdev)
>  	struct aer_err_info info = { 0 };
>  
>  	pci_read_config_word(pdev, cap + PCI_EXP_DPC_STATUS, &status);
> -	pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &source);
> -
> -	pci_info(pdev, "containment event, status:%#06x source:%#06x\n",
> -		 status, source);
>  
>  	reason = status & PCI_EXP_DPC_STATUS_TRIGGER_RSN;
> -	ext_reason = status & PCI_EXP_DPC_STATUS_TRIGGER_RSN_EXT;
> -	pci_warn(pdev, "%s detected\n",
> -		 (reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_UNCOR) ?
> -		 "unmasked uncorrectable error" :
> -		 (reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_NFE) ?
> -		 "ERR_NONFATAL" :
> -		 (reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_FE) ?
> -		 "ERR_FATAL" :
> -		 (ext_reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_RP_PIO) ?
> -		 "RP PIO error" :
> -		 (ext_reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_SW_TRIGGER) ?
> -		 "software trigger" :
> -		 "reserved error");
> +
> +	switch (reason) {
> +	case PCI_EXP_DPC_STATUS_TRIGGER_RSN_UNCOR:
> +		pci_warn(pdev, "containment event, status:%#06x: unmasked uncorrectable error detected\n",
> +			 status);
> +		break;
> +	case PCI_EXP_DPC_STATUS_TRIGGER_RSN_NFE:
> +	case PCI_EXP_DPC_STATUS_TRIGGER_RSN_FE:
> +		pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID,
> +				     &source);
> +		pci_warn(pdev, "containment event, status:%#06x, %s received from %04x:%02x:%02x.%d\n",
> +			 status,
> +			 (reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_FE) ?
> +				"ERR_FATAL" : "ERR_NONFATAL",
> +			 pci_domain_nr(pdev->bus), PCI_BUS_NUM(source),
> +			 PCI_SLOT(source), PCI_FUNC(source));
> +		return;
> +	case PCI_EXP_DPC_STATUS_TRIGGER_RSN_IN_EXT:
> +		ext_reason = status & PCI_EXP_DPC_STATUS_TRIGGER_RSN_EXT;
> +		pci_warn(pdev, "containment event, status:%#06x: %s detected\n",
> +			 status,
> +			 (ext_reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_RP_PIO) ?
> +			 "RP PIO error" :
> +			 (ext_reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_SW_TRIGGER) ?
> +			 "software trigger" :
> +			 "reserved error");
> +		break;
> +	}
>  
>  	/* show RP PIO error detail information */
>  	if (pdev->dpc_rp_extensions &&
> 

After adding that switch (reason) there, wouldn't it make sense to move 
also the code from the if blocks into the case blocks? That if 
conditions check for reason anyway so those if branches would naturally 
belong under one of the cases each.

-- 
 i.


