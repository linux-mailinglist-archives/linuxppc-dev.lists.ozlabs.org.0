Return-Path: <linuxppc-dev+bounces-8586-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8060CAB71C9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 18:43:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZyK0b0m4sz2yys;
	Thu, 15 May 2025 02:43:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747241006;
	cv=none; b=P4gchTyD1vRo4lXfZjbhaSGYBDA+tFHAPFbKQMCu/A35133JULo6HLBMVXLmXwyU1MhLnNPHwgsHpyZp1sRTMT53ldim1Q+wQB2waMXgRe5BLP8dSCRJcFTR3J1KZ8aow9YxjlXBbMnCXI7ILiV3NUzLIhmFCtoFbCmL2zJNOPfXUxJKpDsEOFVWZUoK9VOGbvEhADu9d8QzKj6afIVkmbBK0uZHy4gG0nSG1OV3UDxziZ/T4GYlA1Lfo6m2xwjgjpVxHESBGWpwd7zU8d1Bt4kf4WdXG7UZUOmUKugwzREvE+FyM4iYEg1VbrHYjPbAY7q2KCAFzb6X7IGFJIy5Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747241006; c=relaxed/relaxed;
	bh=DujayChON/AUGWidMtNBzu42jr8bFOx+kpihLFCyMkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fT3uBxAAxLB/MXHhck1lJ7ccDQlna3poJzsKKfXB081FH6+YoBx3UlvfKIEiuEeA37apUJf5waAQ8XIaZ+O8O6wpaaqnyh123cPD+MiuUmFTzdL1wxtRRVMOnE9tkZDliZ/bZ0+Rl8xv+PjaUx3nk0c5nWaCmCBvaNkWLoY8MCin93Z07EWdeLx3dQf1r7oUUtASUEOYADqqlunFnuJNsxrZnheqmC+bblw6YxQFLZU2UyeYX8DOCG3XjbG8CbR1SOjrNWGF6di7QmGcW5TKS1NNX+okTf12ceMpED8QfC5xZvRwpqxLiaecBQ5FtEqr5Pp6TzPfSxttO6Q8t9UyhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EwojQ+dc; dkim-atps=neutral; spf=none (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EwojQ+dc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Thu, 15 May 2025 02:43:26 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZyK0Z0LpLz2yr6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 May 2025 02:43:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747241006; x=1778777006;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3a/AGcV2Rv7gzIvog99Z8j2jxhg8+75lupWlsqOGDM0=;
  b=EwojQ+dcbn1reP0Mn3GY8enqObmB+HYuHPZL/Z+aEZEd3QaqjuP9rWUr
   XlZ2CCzPcv+Crc4Ux5iA9kPbrocQ9Sc0RO0xa6arlyVEaa9v0hicZg1UV
   nidgpSfgZXTDe9nOcR1IIDqkl661hI3JHMaoBkGvBjzgbanwDKke2j2OM
   fhsMYCbkiKEXNkPrexr/jc2NoFgEOP5oNLwhwl9indsB2Mf3WtgkmNfX+
   ZpYVCKDNSBWVhQ3E/mcKxYuUnzhRbAu3iYYi3kILgGbM02vybM4mDKfJS
   5jdrAq1z0SkasKdTIvg40ZGhObbjtP2j0cYxeK5jezvHeeZzh1EyZPFsj
   Q==;
X-CSE-ConnectionGUID: cuWRkx4JTomWyVEbN9HROA==
X-CSE-MsgGUID: sTtyvhf9TQWgTueh+l5uPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="48262192"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="48262192"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 09:42:20 -0700
X-CSE-ConnectionGUID: v0zwh2NRShuM7ho+Ce271Q==
X-CSE-MsgGUID: rxO74IssSCOLhS1RUO3Gjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="138154268"
Received: from mgoodin-mobl3.amr.corp.intel.com (HELO [10.124.222.100]) ([10.124.222.100])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 09:42:17 -0700
Message-ID: <abe64cda-729e-44e2-bc1e-d43d3566980e@linux.intel.com>
Date: Wed, 14 May 2025 09:42:16 -0700
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
Subject: Re: [PATCH v4 2/5] PCI/ERR: Add support for resetting the slots in a
 platform specific way
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>,
 Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
 <20250508-pcie-reset-slot-v4-2-7050093e2b50@linaro.org>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250508-pcie-reset-slot-v4-2-7050093e2b50@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 5/8/25 12:10 AM, Manivannan Sadhasivam wrote:
> Some host bridge devices require resetting the slots in a platform specific
> way to recover them from error conditions such as Fatal AER errors, Link
> Down etc... So introduce pci_host_bridge::reset_slot callback and call it
> from pcibios_reset_secondary_bus() if available.
>
> The 'reset_slot' callback is responsible for resetting the given slot
> referenced by the 'pci_dev' pointer in a platform specific way and bring it
> back to the working state if possible. If any error occurs during the slot
> reset operation, relevant errno should be returned.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Looks good to me.

Reviewed-by: Kuppuswamy Sathyanarayanan 
<sathyanarayanan.kuppuswamy@linux.intel.com>

>   drivers/pci/pci.c      | 12 ++++++++++++
>   drivers/pci/pcie/err.c |  5 -----
>   include/linux/pci.h    |  1 +
>   3 files changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 4d7c9f64ea24ec754a135a2585c99489cfa641a9..13709bb898a967968540826a2b7ee8ade6b7e082 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -4982,7 +4982,19 @@ void pci_reset_secondary_bus(struct pci_dev *dev)
>   
>   void __weak pcibios_reset_secondary_bus(struct pci_dev *dev)
>   {
> +	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
> +	int ret;
> +
> +	if (host->reset_slot) {
> +		ret = host->reset_slot(host, dev);
> +		if (ret)
> +			pci_err(dev, "failed to reset slot: %d\n", ret);
> +
> +		return;
> +	}
> +
>   	pci_reset_secondary_bus(dev);
> +
>   }
>   
>   /**
> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> index de6381c690f5c21f00021cdc7bde8d93a5c7db52..b834fc0d705938540d3d7d3d8739770c09fe7cf1 100644
> --- a/drivers/pci/pcie/err.c
> +++ b/drivers/pci/pcie/err.c
> @@ -234,11 +234,6 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>   	}
>   
>   	if (status == PCI_ERS_RESULT_NEED_RESET) {
> -		/*
> -		 * TODO: Should call platform-specific
> -		 * functions to reset slot before calling
> -		 * drivers' slot_reset callbacks?
> -		 */
>   		status = PCI_ERS_RESULT_RECOVERED;
>   		pci_dbg(bridge, "broadcast slot_reset message\n");
>   		pci_walk_bridge(bridge, report_slot_reset, &status);
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 0e8e3fd77e96713054388bdc82f439e51023c1bf..8d7d2a49b76cf64b4218b179cec495e0d69ddf6f 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -599,6 +599,7 @@ struct pci_host_bridge {
>   	void (*release_fn)(struct pci_host_bridge *);
>   	int (*enable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
>   	void (*disable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
> +	int (*reset_slot)(struct pci_host_bridge *bridge, struct pci_dev *dev);
>   	void		*release_data;
>   	unsigned int	ignore_reset_delay:1;	/* For entire hierarchy */
>   	unsigned int	no_ext_tags:1;		/* No Extended Tags */
>
-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


