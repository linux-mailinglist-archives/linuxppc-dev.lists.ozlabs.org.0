Return-Path: <linuxppc-dev+bounces-8701-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06769ABCBBE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 01:49:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1ZD26ZLWz2ywh;
	Tue, 20 May 2025 09:49:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747698578;
	cv=none; b=a1+LxPmbgYp1Ps8zOPwSpzO5rbwvsmGcMB8hrkOcnzwAe4veb2kUgEHDWK+fMjjitPLyJaWaTksibj/E6lP2uHlOWwpZeRCaepxpaV1sygFlSZ53DR2TIqiFLByNoloyemg9cY1x+n8xTL4hVWqj+wMq5pIIZWXgbQl+8GjYXy+vaXqmqIc847LhFOW7C2+yzAIgLwgJCfUhZgn4PAVCuZNchapaOjMjBZUOdd10zXzRJYPszFmykcTPtyy/ktYInHxjp9f0fVa2YZlTQK6F3KDqtirqFzFFJlFqgSA9P2T+wzr5W04kHeLpEGd3moUjIoXLXsStylZo7V1+sYceQg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747698578; c=relaxed/relaxed;
	bh=KSnytXbRf0iT9JrDmbF3XYBHEgWePJczOsCqr4z+qjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WbQbK54eWZI0wuV6e9k1OhesNW/8b5rJ14qLdbMbeZvppxxLDC2q5fUuRVO/nsEXm1C/UHL7tKMkBkGIzkcHh9R4efkD6J2CZjKcMIhQ4BCSG2fJlXZLfZeCnzrgWsiRJfKtAuvYxHeNwPmouQbvc3cEMovw8hHgtD3/GtgX2kUnKYC80YEr26ZQkGXTO/rz+h0r3dfoaNJhzGak3YroFW+71tUtIN2rf1Dl/DGHt8y2R/iQN/0Rdc4+V/44qomJpnCFMdb8RultGWU7IPE7zc9/TCu/I87U8fffJTCHycaABY8d5Z5BMvp+22nR75Ob+3NVuAcLBTtH0/KO6wu/5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FREIE8Qe; dkim-atps=neutral; spf=none (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FREIE8Qe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1ZD16z96z2ywR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 09:49:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747698579; x=1779234579;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=O84k9EnJyyrZuf5S6CNnSfQgF+n7riYthWXWhPrZbyM=;
  b=FREIE8QeSlaDJzDKKTiqHrgWE8uo/s4pmUKoWn4BFbDDR0lFZ82AofWW
   Ya86TqZSxmGVpMovhoRx2UkfBvEkkxaWBvuZXvIvF4R2FT9RIE2xjw80i
   ruScfPqjgMHl8rDdVlO7gKznoiJn9zgC8Xm+c/XFp2NK5+oLArQ8rLLg+
   v5nCCVR1ouExlVb2RvwDL+eY7uiVSEtQjkCLHRn8+ukairaFrBhivtjKA
   JpiBfqKaChITuTIlzAOiBWIBe+Z00IOGrfIL0Qcg6Di+giLrg4GvEPzbB
   Pi5vro3fcmqEClF0qk8+5+AMA3GLHO0xx3Aza8wd//zxgeYwMEyg5UI8v
   Q==;
X-CSE-ConnectionGUID: 2SAarjyoT0SoZZGVhQvcrA==
X-CSE-MsgGUID: UBkYDrdTRi2Tt6iDDDVPtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49597449"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49597449"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 16:49:36 -0700
X-CSE-ConnectionGUID: 9jiAD3WuT0C4XQE2d1Yunw==
X-CSE-MsgGUID: R0u7aAmeTsa+JZ3syAFdsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="162811269"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO [10.124.221.39]) ([10.124.221.39])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 16:49:34 -0700
Message-ID: <4a21d39b-fd88-4699-80dd-21abe7aa5053@linux.intel.com>
Date: Mon, 19 May 2025 16:49:34 -0700
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
Subject: Re: [PATCH v6 06/16] PCI/AER: Move aer_print_source() earlier in file
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
 <20250519213603.1257897-7-helgaas@kernel.org>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250519213603.1257897-7-helgaas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 5/19/25 2:35 PM, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
>
> Move aer_print_source() earlier in the file so a future change can use it
> from aer_print_error(), where it's easier to rate limit it.
>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>   drivers/pci/pcie/aer.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index eb42d50b2def..95a4cab1d517 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -696,6 +696,18 @@ static void __aer_print_error(struct pci_dev *dev,
>   	pci_dev_aer_stats_incr(dev, info);
>   }
>   
> +static void aer_print_source(struct pci_dev *dev, struct aer_err_info *info,
> +			     const char *details)
> +{
> +	u16 source = info->id;
> +
> +	pci_info(dev, "%s%s error message received from %04x:%02x:%02x.%d%s\n",
> +		 info->multi_error_valid ? "Multiple " : "",
> +		 aer_error_severity_string[info->severity],
> +		 pci_domain_nr(dev->bus), PCI_BUS_NUM(source),
> +		 PCI_SLOT(source), PCI_FUNC(source), details);
> +}
> +
>   void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
>   {
>   	int layer, agent;
> @@ -733,18 +745,6 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
>   			info->severity, info->tlp_header_valid, &info->tlp);
>   }
>   
> -static void aer_print_source(struct pci_dev *dev, struct aer_err_info *info,
> -			     const char *details)
> -{
> -	u16 source = info->id;
> -
> -	pci_info(dev, "%s%s error message received from %04x:%02x:%02x.%d%s\n",
> -		 info->multi_error_valid ? "Multiple " : "",
> -		 aer_error_severity_string[info->severity],
> -		 pci_domain_nr(dev->bus), PCI_BUS_NUM(source),
> -		 PCI_SLOT(source), PCI_FUNC(source), details);
> -}
> -
>   #ifdef CONFIG_ACPI_APEI_PCIEAER
>   int cper_severity_to_aer(int cper_severity)
>   {

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


