Return-Path: <linuxppc-dev+bounces-8705-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3A1ABCC70
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 03:50:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1cts3blRz2yw7;
	Tue, 20 May 2025 11:49:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747705797;
	cv=none; b=Tk/O6odjdfhBXxSHXfrSVlYosXy46rZ8jNWIoQkgSbtrGU15JUgoejvlVs/+Db+9CkpyS6inPYNqslEXbAMuF3Bta2sB1LnXuTErzueo9NRDqJEAxPgIFrlYgFWhiDpsn2bp+MRhbtEHnYAcfygkiYfJDAnqA2A0ZjwdHiSb4THmn64SWS4hUz+6dVze+jKDGpWE0OET4IciK72Lcm/NNA/FaJMGrlcSyEP1dPYBsAxrnE83zagUtN5ZAssbJ0OYu4faAg/AYsEyfT5j/k4TiPNfa8YGLdS43WROR8s9fqvI4ncIbvkJZYs8Hb5R+v5+28D0xlr/I1fyuZyR6N4tDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747705797; c=relaxed/relaxed;
	bh=Hi+NzX9R6lkkQMckxVZsS7uVSvs8p9qlOoYBvVPc584=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jtz+xt/6DZR/5H2HDtji2U2NOpAkKK/1fwEeFslOs56RXwJQALpk9rXJcMFVugE1j2ru+5S2JW4y45eBrwTiE3xKNbuk6/e3RhWKQxb6/LSoRjW+BtdSGAgxnoVs+8FkDin8H8QXtyEmXD/JFENDNu+14xAxY1WsZc0wsQXkwgkGe257dKlOz/QfZx6oWhxd4Qtw5ErK00VNafRvie7hh9GNUKx6lyRDcA9+0jiTKnjq5GPbsGQUcSXUgjx8ceTVUmpPNzcmpUjnmivVxeZdt5gfJHt41h8x1KygPLADQPqVxXo6qYWcaBIid1EozuEOSgfc1HFD/0u64o4dnrU1cw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LBCe9Jy6; dkim-atps=neutral; spf=none (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LBCe9Jy6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1ctp55nqz2yrn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 11:49:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747705795; x=1779241795;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vsLxZwJQaEjAfR/JuZ5NYNwq+/uZf2rMOMPY+vUbdi0=;
  b=LBCe9Jy6N9+E3wZkxKOZIORLkjIhR2OZdpLaP1NNYFNGLN2Kt0BvXyFC
   8FqtLctLFKUMo7vqyQtYEQomAa4JzeR6oOFxAORa0cnD7ZLJUlGKKVhRd
   srVoB0zodoXZFXsBYPGqYBEXyGKSXh3jLbf9HrgJqFWLXZfgjkXHaaVS4
   pSQK23S9bRbNXqj5SUkP97iBjQvJ7GAUi40AIxdpELiVy66xyFSJt5iJR
   DNT+ReEUcBIzzNrTT/CD24O7puVxDJhdAslC4QXD7VNFco4aY4hMLDOX7
   QRmBs66TOLdxrvuu8G6WC8dFtGNGDstej40LsX55oGwvmyUQHmvxq7gcC
   w==;
X-CSE-ConnectionGUID: 42BmM2j1QCOrpJdW9si1Fw==
X-CSE-MsgGUID: FeLzlXTzREmrqsiP+1Pd5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="48737307"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="48737307"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 18:49:50 -0700
X-CSE-ConnectionGUID: 0zrs3Y+BSOak+jEDiEkNbQ==
X-CSE-MsgGUID: md5biXXwRjyq3FH5wZYmvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140063943"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO [10.124.221.39]) ([10.124.221.39])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 18:49:49 -0700
Message-ID: <6774c3a6-9d0e-4a73-bfb1-91507ce85411@linux.intel.com>
Date: Mon, 19 May 2025 18:49:49 -0700
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
Subject: Re: [PATCH v6 10/16] PCI/AER: Combine trace_aer_event() with
 statistics updates
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
 <20250519213603.1257897-11-helgaas@kernel.org>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250519213603.1257897-11-helgaas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 5/19/25 2:35 PM, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
>
> As with the AER statistics, we always want to emit trace events, even if
> the actual dmesg logging is rate limited.
>
> Call trace_aer_event() directly from pci_dev_aer_stats_incr(), where we
> update the statistics.
>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>   drivers/pci/pcie/aer.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index eb80c382187d..4683a99c7568 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -625,6 +625,9 @@ static void pci_dev_aer_stats_incr(struct pci_dev *pdev,
>   	u64 *counter = NULL;
>   	struct aer_stats *aer_stats = pdev->aer_stats;
>   
> +	trace_aer_event(pci_name(pdev), (info->status & ~info->mask),
> +			info->severity, info->tlp_header_valid, &info->tlp);
> +
>   	if (!aer_stats)
>   		return;
>   
> @@ -741,9 +744,6 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
>   out:
>   	if (info->id && info->error_dev_num > 1 && info->id == id)
>   		pci_err(dev, "  Error of this Agent is reported first\n");
> -
> -	trace_aer_event(dev_name(&dev->dev), (info->status & ~info->mask),
> -			info->severity, info->tlp_header_valid, &info->tlp);
>   }
>   
>   #ifdef CONFIG_ACPI_APEI_PCIEAER
> @@ -782,6 +782,9 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
>   
>   	info.status = status;
>   	info.mask = mask;
> +	info.tlp_header_valid = tlp_header_valid;
> +	if (tlp_header_valid)

I think you can skip this check. The trace call checks for valid flag before accessing
the tlp buffer. If you want to keep it, try to set it to NULL for !tlp_header_valid case.

> +		info.tlp = aer->header_log;
>   
>   	pci_dev_aer_stats_incr(dev, &info);
>   
> @@ -799,9 +802,6 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
>   
>   	if (tlp_header_valid)
>   		pcie_print_tlp_log(dev, &aer->header_log, dev_fmt("  "));
> -
> -	trace_aer_event(pci_name(dev), (status & ~mask),
> -			aer_severity, tlp_header_valid, &aer->header_log);
>   }
>   EXPORT_SYMBOL_NS_GPL(pci_print_aer, "CXL");
>   

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


