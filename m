Return-Path: <linuxppc-dev+bounces-6105-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A99A3177A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2025 22:18:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YsvSV67yKz2ygS;
	Wed, 12 Feb 2025 08:18:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739308714;
	cv=none; b=fYvGY+9F/wD8RGNxXtCKdgwDU9duRI1bfxPC7kyyo30kWxTaoOvXcylhWUWYb9BnBM4iQ+xV+B20T7WkTAfROEyL8VwieVy57MWsEUmfUaCj+0DQAjgq9ZGAxsNVmkH2vzBaiaqAe9Nn1KsnXNrbhH60XOF+6E7CCrLieJWTk7fUTcMoMfKPIkDmmWrgf/xxvukKRmPXbilROn4o0JIhOEgCVcoPS8OFo2/RJmeuvdxQ24duCdfyfzi4IkSjbRQnO4CWKyKG6QwxWZ0nVg+ATM5Lh5xcSpYKSSnXzdgxrVr2qIPFDtDouKnjE573KwFVcc+WVlkSP4EZ/D2t1TGYfA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739308714; c=relaxed/relaxed;
	bh=Y1gctb2FBhvaJ97tSHMi8zp8o6ulfJviTC0QMh9XUug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QWt5uGsxl9eUTQK3iaJldHgYCmOtfOo2yvYc7Owi8IT1U8sFfstaWNnbyMuuIXhQn8ER9R00DT0z2Gt40EutdMYuB4J4r9TyWia9onXf75StTC8YeQTCBwQjp6Z/BxWqI3bz1/ce8mt5nXzPgqbz0Zi2AX/Gf0hh0RCdLJGoNV9GUeiLFkXrzzxclGW3Nb5f3BNMGWJLGkByHv+PD3pSFBCainJqogOdhgBogA2bdrT71fwU7dMK8AfXz35qYUeottpstgLsDSOINt5OVMdZMVhFn+5eTumxLuP/m0SpdjQyvwgeJL0Z6aifwLmKbphybzBd8E1ovsoVAadThC6DgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gYvwFg8b; dkim-atps=neutral; spf=none (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gYvwFg8b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YsvSS1GzTz2yWK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2025 08:18:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739308712; x=1770844712;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/okSp1SamebmoZvprrOXat3uYAeyx547q4FKA2bMGnY=;
  b=gYvwFg8b8rrG9QW2e2XTW3SyMtTGrkvChsBYezX2i3Nq9mo/70qOFKbD
   NpJBMKLuBQVPsksZl6t+/EZ1JtZKbF0qFgXmLsgChSKvyQHod6jRL9AxX
   0W6wqcqOP3hWk4IvJJXJpfl1BlV2iisdpMZ409Zxk/QG4HKm1Jd6O0+8d
   g4+wgyx7wRCNDB3bJDWZ2AouSAJyBsKXoNkLM1p5/D/xgVeI4fB2Vr3eg
   dw9xiBmKFsIW2M1YViwQ9dwpoojpTMJt4Sg0uHDzg5p89U4Wk5E3nEO88
   u4oFaLS/jUG8whqhHwnC0bDKob3+BgdpE963S7iV3aHOGxskzrSMqPiBl
   w==;
X-CSE-ConnectionGUID: Dw3a7d8MTKqSu+aJ5Ui9uA==
X-CSE-MsgGUID: /ztkfafsSsi2DXb54c1eAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="50584175"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="50584175"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 13:18:27 -0800
X-CSE-ConnectionGUID: 0FhQfMmPSm26Lwx7eLDwWA==
X-CSE-MsgGUID: FS4r2JZIQBuZVRFR80ozcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113516411"
Received: from jdoman-desk1.amr.corp.intel.com (HELO [10.124.222.44]) ([10.124.222.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 13:18:27 -0800
Message-ID: <f4d2579c-97ab-41d7-a496-7c711243517f@linux.intel.com>
Date: Tue, 11 Feb 2025 13:17:55 -0800
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] PCI/DPC: Rename pdev to err_port for dpc_handler
To: Shuai Xue <xueshuai@linux.alibaba.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 bhelgaas@google.com, kbusch@kernel.org
Cc: mahesh@linux.ibm.com, oohall@gmail.com, Jonathan.Cameron@huawei.com,
 terry.bowman@amd.com
References: <20250207093500.70885-1-xueshuai@linux.alibaba.com>
 <20250207093500.70885-2-xueshuai@linux.alibaba.com>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250207093500.70885-2-xueshuai@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On 2/7/25 1:34 AM, Shuai Xue wrote:
> The irq handler is registered for error port which recevie DPC
> interrupt. Rename pdev to err_port.
>
> No functional changes.
>
> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
> ---

I think you can combine patch 1 & 2 into a single patch. Change wise, it 
looks
fine to me.

Reviewed-by: Kuppuswamy Sathyanarayanan 
<sathyanarayanan.kuppuswamy@linux.intel.com>

>   drivers/pci/pcie/dpc.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> index 242cabd5eeeb..1a54a0b657ae 100644
> --- a/drivers/pci/pcie/dpc.c
> +++ b/drivers/pci/pcie/dpc.c
> @@ -346,21 +346,21 @@ static bool dpc_is_surprise_removal(struct pci_dev *pdev)
>   
>   static irqreturn_t dpc_handler(int irq, void *context)
>   {
> -	struct pci_dev *pdev = context;
> +	struct pci_dev *err_port = context;
>   
>   	/*
>   	 * According to PCIe r6.0 sec 6.7.6, errors are an expected side effect
>   	 * of async removal and should be ignored by software.
>   	 */
> -	if (dpc_is_surprise_removal(pdev)) {
> -		dpc_handle_surprise_removal(pdev);
> +	if (dpc_is_surprise_removal(err_port)) {
> +		dpc_handle_surprise_removal(err_port);
>   		return IRQ_HANDLED;
>   	}
>   
> -	dpc_process_error(pdev);
> +	dpc_process_error(err_port);
>   
>   	/* We configure DPC so it only triggers on ERR_FATAL */
> -	pcie_do_recovery(pdev, pci_channel_io_frozen, dpc_reset_link);
> +	pcie_do_recovery(err_port, pci_channel_io_frozen, dpc_reset_link);
>   
>   	return IRQ_HANDLED;
>   }

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


