Return-Path: <linuxppc-dev+bounces-8793-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1785CABE6F6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 00:29:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b28PH6B7Qz3000;
	Wed, 21 May 2025 08:29:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747780179;
	cv=none; b=nq8Y++BpPIGYAP8Fe/tTxuiflXN71rI6j9e1oLRoliqXM+B6DvOE/fVVK1zK1sbTnVzJ5L4xidOPGouFLeZr2GTjTxDWLheyNcpbSWM3X7zYVyQNZlcWlfJH0fJjwH2kMzNy7dwhPjd/fBm0PxTxL4kQO6pmxGH8QwvWyYsuEoyMlHMaLZMIe4RE8Ep4wx42hEatTKlYjT/g9WWI46+w1hQEcdn6ef4c4sb2GLGavQd0vd29CH0I8Qz06yo2BOQu6MhbLK1UQD4rcVsuw7OC/tujZuF7Ommp7tuWwWxq1VGAInTIklFlPHcoG7EsdcH8FqwMgKymIhSG4e3cf5hj6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747780179; c=relaxed/relaxed;
	bh=jd3xCt6wfZnfHIZtsclpxhe85w+milqtMykPiSrjvuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=knZ3SRGMIvcdErOdy9cAt6RE8Bzmd9ZTAznRaUlS+XI+HT4nNMYLY1Rt4fOd7UUOZRJMAGfx3cihcqlkAuXH1BwHVMdjzwIOFG7MEJpYENuTOrXH9NLfdRHsHgWZ0QwJ102axUxztR+NEmGLbYi1LsR+SfxWPN3SPZIphx9H7OTENUOw7r+wWTEWWMIDOMm3YwVgfY2oY/lE0KJ+NyTddR8T6f0Vcw9Ft2RB20p2zEOrKQjtCDZI/P5mCrCUOktEmsThiDArj/nVRtPXe5/EEz18PebAKkpuXBLag0jcuW8owVj5Sds/3C6Q04zCPJDFzFqsWgf2nVKpvQ7Aw3YjsQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MsBQNUM0; dkim-atps=neutral; spf=none (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MsBQNUM0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b28PG72hlz2yvv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 08:29:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747780179; x=1779316179;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wgWpekly3nOQnzx0glseL92nX1qAz0Bb6kjWvhZ76XI=;
  b=MsBQNUM0nueqysaW96MmOuCW2X40G/lyVH+J/SDEym+tcr0J1Fyw2O6i
   pbF1euj+H0SlXi0LHDFlG/FCUoqiqYZl0VpXE+RrTLGJaSCFdv0d6khs8
   WVRXBc+ljQyrGfIb2pXJSmbDdCSvGAYBzCpoQ1oVl/tmZzZJ6PqTyHE98
   8o28oX+VuWVtrO3u+oN8IsgwRorVOfshKYM/0k26TQ6T5qHo+8DW7AHvz
   0WcL/1wMkHtAOurFSyMEZfUFsWms/+6+AGZFnmP62U2FS6dzVkct/cq2w
   fJWPqGDitOBFcGuClGUpeV5cYB/w/vCOlrhi1c3NOThMFdCcrMJ59yY/Y
   A==;
X-CSE-ConnectionGUID: oHbOVzJFRriUMRsrEl5NfA==
X-CSE-MsgGUID: yTNbm8dkRH+kW9hqQcJC+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="52363394"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="52363394"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 15:29:37 -0700
X-CSE-ConnectionGUID: /+ByA43/TeSBzowsjH/SMQ==
X-CSE-MsgGUID: TGAgNdesQjObaoTcB0oDlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="163108869"
Received: from iweiny-desk3.amr.corp.intel.com (HELO [10.124.222.89]) ([10.124.222.89])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 15:29:36 -0700
Message-ID: <0582ea17-186a-4910-871a-77f2b51e3b1e@linux.intel.com>
Date: Tue, 20 May 2025 15:29:35 -0700
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
Subject: Re: [PATCH v7 09/17] PCI/AER: Simplify pci_print_aer()
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
 linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
References: <20250520215047.1350603-1-helgaas@kernel.org>
 <20250520215047.1350603-10-helgaas@kernel.org>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250520215047.1350603-10-helgaas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 5/20/25 2:50 PM, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
>
> Simplify pci_print_aer() by initializing the struct aer_err_info "info"
> with a designated initializer list (it was previously initialized with
> memset()) and using pci_name().
>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> Tested-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> ---

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>   drivers/pci/pcie/aer.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index e6693f910a23..d845079429f0 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -765,7 +765,10 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
>   {
>   	int layer, agent, tlp_header_valid = 0;
>   	u32 status, mask;
> -	struct aer_err_info info;
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


