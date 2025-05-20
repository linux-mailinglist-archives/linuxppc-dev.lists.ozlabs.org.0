Return-Path: <linuxppc-dev+bounces-8711-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F82ABCDCF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 05:23:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1fyf2dNZz2yrg;
	Tue, 20 May 2025 13:23:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747711402;
	cv=none; b=d1vn5Y+PkU6muG94zOOHYCzLiKoRueCMcXYx6C8SapQnfirsOZJEPlh75I2QbTdEJx6Ua8fByHILaLFwMgYfFqY4xC7uRVUErsdIInb8hO9HCBnkni3Abpv4CS60Lj40QyTTZa+rPHT4PlWgQtZN7UKKjmvJzaOAhaRK1r2mjM30ifqeZGBR4fvjj4wLAxbGYHmMQ7XHmk+o6iuEp52MYl3Jnp+yhzA/Q+IsuO/i+8b01YiAdjm8k8qvRZ0PFboCjKItbmrI8Ib4IIcMrE6cWr7nXDRM6i8A7pbB3o8F4ZfvgsS4/IYDfIKMeIaJDXcjQkbinjNTa9BQaZYweAnC5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747711402; c=relaxed/relaxed;
	bh=AOfePqi6RWxFVSYZgWjt7V5d6mmV85wEhjZR2CVBvVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FxqmzTZSB/5uVHPmMqBq7lDz7/yv65ZZuUjdLeL/xrwmh3CWPQxopcwGoDjWmLrnHg1+KHhj4igupeXHr2hzUgt9sJER0ZzWczrnu4SuvxMqALWGyyfnwNaGFUs68nJ0t6AEp4xzxyyxB2prDBBPxcWn0s6c1PWkO2SWWCuOA+m8LtoX2YDD00/jF7yEjYgcPaC4iEPi6dhTgcCkVS4pEqnKzc8LBZvGvPuDGqROOPFf+zNvDH6arISA5A5ygx1x6GhXQrAoPOGNlFM9kovcHEEf+8QX1F5+26tgrQ+rKoNTP6G43TVu5slp3kQocTdxK6wbSEdS3fRolK+Pk1TTUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bL1jQTW2; dkim-atps=neutral; spf=none (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bL1jQTW2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1fyb5xRTz2yDr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 13:23:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747711400; x=1779247400;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=085HP7XPilFAqMffUta5x9Z+kE/97G6V4mggr3IBiuE=;
  b=bL1jQTW2vhUE2HKlb2xdFajj3IPsog84DX27urgr/agM7T0BENhezVOV
   Ox+l6+8HPUYEtajj71DX/+HcuCZImmRrMAr7VO0K8u5fpZPbPLyB24JVg
   N/DczRZXtqFGcj5woaCuQgMBLIJkUWia0+fOKFDkDJgoL3Rk+QpAG4kk5
   m3hlnmPEK8SkXmEefsLYlM9XgRcUP0AyYtN4+FKgFTCpH9FIiyQbehv9R
   l6AP44xrheh5H8Rp0E4nBChAVCBjfm0j/zJXaZnLAUtDrBNwqdzfmMbvV
   Kkl8dpOw531I9orqKNCw3KXKmS76UHF5zGKZmiMaUJqdSw1iuLcoqmbLi
   g==;
X-CSE-ConnectionGUID: sdQU2hTnToG9QiVxKtGA5A==
X-CSE-MsgGUID: QfuLWFjtRGa5VoogX6nE5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49765903"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49765903"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 20:23:17 -0700
X-CSE-ConnectionGUID: 4BCxmwICTFGDp8jqz2FZ8w==
X-CSE-MsgGUID: 0tKkvGx6SbOIwqDZv62iGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139289141"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO [10.124.221.39]) ([10.124.221.39])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 20:23:15 -0700
Message-ID: <bcc3f629-7ada-4ec0-bcb1-92760583c9c1@linux.intel.com>
Date: Mon, 19 May 2025 20:23:13 -0700
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
Subject: Re: [PATCH v6 12/16] PCI/AER: Make all pci_print_aer() log levels
 depend on error type
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
 <20250519213603.1257897-13-helgaas@kernel.org>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250519213603.1257897-13-helgaas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 5/19/25 2:35 PM, Bjorn Helgaas wrote:
> From: Karolina Stolarek <karolina.stolarek@oracle.com>
>
> Some existing logs in pci_print_aer() log with error severity by default.
> Convert them to depend on error type (consistent with rest of AER logging).
>
> Link: https://lore.kernel.org/r/20250321015806.954866-3-pandoh@google.com
> Signed-off-by: Karolina Stolarek <karolina.stolarek@oracle.com>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>   drivers/pci/pcie/aer.c | 16 +++++++++++-----
>   1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 73b03a195b14..06a7dda20846 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -788,15 +788,21 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
>   	layer = AER_GET_LAYER_ERROR(aer_severity, status);
>   	agent = AER_GET_AGENT(aer_severity, status);
>   
> -	pci_err(dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n", status, mask);
> +	aer_printk(info.level, dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n",
> +		   status, mask);
>   	__aer_print_error(dev, &info);
> -	pci_err(dev, "aer_layer=%s, aer_agent=%s\n",
> -		aer_error_layer[layer], aer_agent_string[agent]);
> +	aer_printk(info.level, dev, "aer_layer=%s, aer_agent=%s\n",
> +		   aer_error_layer[layer], aer_agent_string[agent]);
>   
>   	if (aer_severity != AER_CORRECTABLE)
> -		pci_err(dev, "aer_uncor_severity: 0x%08x\n",
> -			aer->uncor_severity);
> +		aer_printk(info.level, dev, "aer_uncor_severity: 0x%08x\n",
> +			   aer->uncor_severity);
>   
> +	/*
> +	 * pcie_print_tlp_log() uses KERN_ERR, but we only call it when
> +	 * tlp_header_valid is set, and info.level is always KERN_ERR in
> +	 * that case.
> +	 */
>   	if (tlp_header_valid)
>   		pcie_print_tlp_log(dev, &aer->header_log, dev_fmt("  "));
>   }

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


