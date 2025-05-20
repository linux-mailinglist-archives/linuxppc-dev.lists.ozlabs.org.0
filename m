Return-Path: <linuxppc-dev+bounces-8703-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BF6ABCBDF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 02:02:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1ZW10gh6z2ywC;
	Tue, 20 May 2025 10:02:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747699356;
	cv=none; b=YcQG1Me6Q1B0CSF0txH5SPNA0dW30uXfUX/NUIhG0Sapj4k6k3GHduxUCVTxHHxNQDV+2LGQVOAGKfotR81TgTC448EVHc1Gg1yEU4DNnPG6XhwO9qHC30ZSPV4k0/ZLFMye1p2pSoiqM2fhObNAUQFxxKSyAXbIP/xCvnvvpqOe74Aj+o4XOoXidF2H2J9nHGDHt3QkNihOoniAZ7WXZkaUqnqW3JUvGMKWTReJV0QNfY6RxAQJW4IHy65uUzPE6Ir/1v1OXyoBB+csEQPRq0GRty3ptyjFNLr994Kgul6Of6qc0wSPqvFIoC0T6wUIQirvMguMQ8c2BpOZJnp8PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747699356; c=relaxed/relaxed;
	bh=7ER4YxadtW4fv8svTbymHT9FcZCt/do+0YBteijO13o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QWE/bBfqab62xj0p+/jAV7QTU+/JrSGQkwX0S/tXcQzISjnVRb/FmktLdFkymzMiczs3ilxpg3EEks1Eb89F0DTNSkH8Weqs41b7bPsUgHOCyYb9a3bFWpvIXkrOw8vruQuU6UaejZ4hscMLtX+JYFkyIBpw4muOzRgmBU7AQgBCDfr3KDZ7XhWZCB0YDBV6OwQtDk7nLOPesGGdjQAU1XT2IsYB3r4nknfGLdohsLS/s8/LnUU9mBHlrEY2dNOLcRtnTJ8H6jY/fbwRlqY19l6V0kWydLS3mmqOeUCcOzlyW0q5EiL2P+0nOM4fmn5Np4olrbe6ldc/nvCw1s23lw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Zhr13ID3; dkim-atps=neutral; spf=none (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Zhr13ID3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1ZVx69FSz2yrN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 10:02:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747699354; x=1779235354;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=J43x42J+4FoAQ0Tp7uilc32NtEm5R2XUDI1KVaIDlTY=;
  b=Zhr13ID3iP59Z2vaHmJe3EAC7WT0U9rj2BsSRiwMgjamk6Oj9cbi8PVK
   DRi9y08zo/jZOl6cEUXDzmvS3P7CAmeZyCUrFP9XvkLq2SNLjrSFS91x3
   eXpJ7GXpoE2vsiB5eC/51yA+SwrWIP/sRW0o7Va5vTNiqYc0iEPInoW2R
   zlZeY3OMPeE/r18YzdTiRbsMDyKlPZfDwyiS+4JVutwJ86ZuF2iyU2qEk
   QzG4NZWRxGc70P5IXACCMVO8nkl5/ucEC8KEU0oFlNINEPaPQc3A5hjj8
   hGGTMnP1Sp0iaIVbrNlIpgtMKC/jMgh/WbL3ELpUQMxv9SXKQ/zNDBp0J
   Q==;
X-CSE-ConnectionGUID: n+ljfMVeQainO76EODO8gw==
X-CSE-MsgGUID: XTvvwTFERj6RIQRlzHadmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="61008290"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="61008290"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 17:02:29 -0700
X-CSE-ConnectionGUID: h7nQP4WzT+uoVKSWgwtLbA==
X-CSE-MsgGUID: vwaPAcRVRp+ujxE6ObiciA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139423280"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO [10.124.221.39]) ([10.124.221.39])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 17:02:28 -0700
Message-ID: <89d93eb8-ad95-4ac4-b0dc-44b37c458d91@linux.intel.com>
Date: Mon, 19 May 2025 17:02:28 -0700
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
Subject: Re: [PATCH v6 08/16] PCI/AER: Simplify pci_print_aer()
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
 <20250519213603.1257897-9-helgaas@kernel.org>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250519213603.1257897-9-helgaas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 5/19/25 2:35 PM, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
>
> Simplify pci_print_aer() by initializing the struct aer_err_info "info"
> with a designated initializer list (it was previously initialized with
> memset()) and using pci_name().
>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>   drivers/pci/pcie/aer.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 40f003eca1c5..73d618354f6a 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -765,7 +765,10 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
>   {
>   	int layer, agent, tlp_header_valid = 0;
>   	u32 status, mask;
> -	struct aer_err_info info;

You have cleaned up other stack allocations of struct aer_err_info to zero
initialization in your previous patches. Why not follow the same format
here? I don't think this function resets all fields of aer_err_info, right?

> +	struct aer_err_info info = {
> +		.severity = aer_severity,
> +		.first_error = PCI_ERR_CAP_FEP(aer->cap_control),
> +	};
>   
>   	if (aer_severity == AER_CORRECTABLE) {
>   		status = aer->cor_status;
> @@ -776,14 +779,11 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
>   		tlp_header_valid = status & AER_LOG_TLP_MASKS;
>   	}
>   
> -	layer = AER_GET_LAYER_ERROR(aer_severity, status);
> -	agent = AER_GET_AGENT(aer_severity, status);
> -
> -	memset(&info, 0, sizeof(info));
> -	info.severity = aer_severity;
>   	info.status = status;
>   	info.mask = mask;
> -	info.first_error = PCI_ERR_CAP_FEP(aer->cap_control);
> +
> +	layer = AER_GET_LAYER_ERROR(aer_severity, status);
> +	agent = AER_GET_AGENT(aer_severity, status);
>   
>   	pci_err(dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n", status, mask);
>   	__aer_print_error(dev, &info);
> @@ -797,7 +797,7 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
>   	if (tlp_header_valid)
>   		pcie_print_tlp_log(dev, &aer->header_log, dev_fmt("  "));
>   
> -	trace_aer_event(dev_name(&dev->dev), (status & ~mask),
> +	trace_aer_event(pci_name(dev), (status & ~mask),
>   			aer_severity, tlp_header_valid, &aer->header_log);
>   }
>   EXPORT_SYMBOL_NS_GPL(pci_print_aer, "CXL");

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


