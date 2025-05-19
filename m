Return-Path: <linuxppc-dev+bounces-8697-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3CFABCB56
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 01:16:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1YTY0JYmz2yqW;
	Tue, 20 May 2025 09:16:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747696575;
	cv=none; b=Tr8GPT1uSy/F4CwVZjwJIZTjic1rCvhXVtzkXxF1KRffCl7+9M/7RReAF0Rimlrmtg7TCrpJwSbBdRzNXSLXvy73dwCUDZMqDuG7/kdo13Oq7dHs9pW9dKp2+vZciIK2g5jFYFslA8Al+fz6R7/C6vgAxyp7MsmWUoV9FIVb0pEhrkSURQAPqFXoc0/8h1EA84QGRibda7xnsy80d5pTXlcyY0TOAhTZikjAuwZfZl00EEQC+a6mULLwkTaiRldk3sE/0+/w8XJGcMkalrK5tVnveOk7EDOpGWXn394aFE1Xui0+k7NzOp9m1P0SvSf7tgfeRhm+dHy9/H5IudY92A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747696575; c=relaxed/relaxed;
	bh=PbuDfQ2PNYYO2DTuXka3C5ya3cML9BKqf0uilqabtTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bknMAllX8TWG/U6dWmmF6Hakd7r+/CXWX1zcdyVmezZdCzjXHDFFWgf6PuRGOLZXgbKdwKbM6YJ/8aih8Z2ViboRkx5ZnISOOV5Tjy9fBKPNNWK+jQNoMpaV/Xq0FHlprzzEV6eG4E8+OhZ2sxqQeqxvNNJxfmvQ2Zh0P9hgKpKTJ3yCvgHCXfhlxKFwDo+6OThiugBfozJm+VJ8HLdbDuH4z2uKJgPwqjErsE0co41qZnWoYUEB+aJDa3m0DX+HzQRpmHbe1/7Hw+MC9E1n/6mXbOLxoo5RwqGm/QnNdV3dR8kyW5apVhyhj6kJ7VJ74w5ESCo5H4hMsfSAzAQdPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dVzrLVbF; dkim-atps=neutral; spf=none (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dVzrLVbF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1YTT0Gh5z2ym3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 09:16:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747696573; x=1779232573;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=dXooAyhFtIbkNwlVi/qdsagXG5Z4H1TWB2hLbacD1/c=;
  b=dVzrLVbFuYKzlv57iPEyMLtWGnUt83EgNwKbMIlRngrtcqrKgbP+1AVL
   yd8C3mtGl0sqo3B0LuLCZ+MSMVx8L/n5WY5O5NFU7Xn8BI7+qgBfFpMLA
   aKJmOIQ48PVbM2G3J+LgPJ/mUyYsqUoADA2u8f7hSIVfQYeC5COMleQzB
   K86w/GgLKTG1AWBSPpBDjwj+Ty8O9RNskZJawWrnHpsnUfLA3b8glaREZ
   rWYujAZJkgwoNsFBbGKrZUOAe3jUh7cIFiim49gysO5n7bFtQtrKmbIwL
   mxumnH0G7825aDx0d0CPTVQp548LH8hcJusHP7oNudblXtA8rNYmB3Rc9
   Q==;
X-CSE-ConnectionGUID: NT/F9Cx0SZ6xxjLhyVoBHg==
X-CSE-MsgGUID: sojTuV+dTZG+oUyf02sIfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49677367"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49677367"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 16:15:58 -0700
X-CSE-ConnectionGUID: VzHO+0MGRvOaAlG2gyO3pw==
X-CSE-MsgGUID: lgvVC65aSzObW5WDwhFXEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140412830"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO [10.124.221.39]) ([10.124.221.39])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 16:15:58 -0700
Message-ID: <e37c5f7f-3460-4f58-892f-39faf88a8e9c@linux.intel.com>
Date: Mon, 19 May 2025 16:15:56 -0700
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
Subject: Re: [PATCH v6 02/16] PCI/DPC: Log Error Source ID only when valid
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
 <20250519213603.1257897-3-helgaas@kernel.org>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250519213603.1257897-3-helgaas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 5/19/25 2:35 PM, Bjorn Helgaas wrote:
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
>    - pci 0000:00:01.0: DPC: containment event, status:0x000d source:0x0200
>    - pci 0000:00:01.0: DPC: ERR_FATAL detected
>    + pci 0000:00:01.0: DPC: containment event, status:0x000d, ERR_FATAL received from 0000:02:00.0
>
> and when DPC triggered for other reasons, where DPC Error Source ID is
> undefined, e.g., unmasked uncorrectable error:
>
>    - pci 0000:00:01.0: DPC: containment event, status:0x0009 source:0x0200
>    - pci 0000:00:01.0: DPC: unmasked uncorrectable error detected
>    + pci 0000:00:01.0: DPC: containment event, status:0x0009: unmasked uncorrectable error detected
>
> Previously the "containment event" message was at KERN_INFO and the
> "%s detected" message was at KERN_WARNING.  Now the single message is at
> KERN_WARNING.

Since we are handling Uncorrectable errors, why not use pci_err?

>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>   drivers/pci/pcie/dpc.c | 45 ++++++++++++++++++++++++++----------------
>   1 file changed, 28 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> index fe7719238456..315bf2bfd570 100644
> --- a/drivers/pci/pcie/dpc.c
> +++ b/drivers/pci/pcie/dpc.c
> @@ -261,25 +261,36 @@ void dpc_process_error(struct pci_dev *pdev)
>   	struct aer_err_info info = { 0 };
>   
>   	pci_read_config_word(pdev, cap + PCI_EXP_DPC_STATUS, &status);
> -	pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &source);
> -
> -	pci_info(pdev, "containment event, status:%#06x source:%#06x\n",
> -		 status, source);
>   
>   	reason = status & PCI_EXP_DPC_STATUS_TRIGGER_RSN;
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

I see the BDF extraction and format code in many places in the PCI drivers. May be a
common macro will make it more readable.

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
>   	/* show RP PIO error detail information */
>   	if (pdev->dpc_rp_extensions &&

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


