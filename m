Return-Path: <linuxppc-dev+bounces-8585-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CEBAB71AB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 18:40:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZyJwy190Gz2yyT;
	Thu, 15 May 2025 02:40:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747240818;
	cv=none; b=CnCZXZw66IS/Nm++IYcXPv/i2us+ACPohG1LCiJAyl9vYFkSAZvCtmK78b4yLL4C1yGC9sfOjkJGZuqzIVRfI4bYRn5bIPYj8lN7jk7wkfwYcQdkC2AUR1jnnfS4+0jjQxZX24xkLz7/aXdvdshyjrrX8HdSHpzpt4kFFozFXZ12l5eOZygn2BqiXx2vCxnr10XCmE5T6jNFyF7XE9emtt2H/pd4bV6JmNZOpvcth4+QY3J0RgvgXzbhHma/OzdZMnOcljRTw4vo0p5shV1+CxKcr06XrnqZGBSXJio8fvzFeT8Ezu49xX0UK9WKJBmtJpRMpZOdtKL4kr3WX6g//g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747240818; c=relaxed/relaxed;
	bh=+4yJ06SsolOKo0n1KNhATc5mR4LtStAPg8hMk/tROHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WhzbGJ9F3bAbqYJE5Ab5dTJQopQXZathAqnfLuY0OHzdvpgC4L1T4EnOD02o9TW4X5VQHT0DTmmC+2Tyl9kgqTCD2CHZ/y+OgZ7D3+lkyBzo2Fq1AUWHKaJ5I68yYWKSHh5/iePFmIPQOIroXCd99sT18FsEWgKYoISG3em38KWJNXMCWPyIhaDmUxXt0CiOSGd/1wb6cPuVec1AtyciB15vAFt+WuaEDNqwl6rPqiyTMVaJy3oRxDjO4fZw0mhMgK6AYyL8qaw917yVF15GtaAc7vXkx9SxiGA/pYhWz53mYO0I6zzKi5+NzFoh8+vqXvJVDbDqu02dWiQOrzQ4jw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gNwQ3dZH; dkim-atps=neutral; spf=none (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gNwQ3dZH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Thu, 15 May 2025 02:40:15 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZyJwv3VSxz2yr6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 May 2025 02:40:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747240816; x=1778776816;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=BQxpe1gKe+N60hkJWYTw2nQy3pGjcVIp7WcxAHzbnzc=;
  b=gNwQ3dZH7NFgDZce/YMJ9V1Ii7RXJJmhjpnFWfgko2+ey5lp54zpMda0
   2WHRk+Gw6E4PylSZrm41qA6s0UrLyMvrGtgVSM7FnGG5qZqMe+mXVP7qo
   f7F5k0CXuUiuUnNDjyNfO2GfK6m2ToEZi2d1CXwANCPAW9WaQ4PoyBhqm
   KAJXiebEhSUuhcfws2mQqpVaft7KISBX9wMNWdZHiJdzjbOOxov/9q3yx
   Eh3fKsY86A5aPLhIMwhadeMASFtYNvW6UyKwNItbf4l/vQhcL89lKJYdN
   253iPSC0SZeTCsTZdYx7nrH/fACEYcHzRjQGrta9LNGqr1b9Axcb8p3X2
   A==;
X-CSE-ConnectionGUID: xwSQqER7SK6ywxUULPf47A==
X-CSE-MsgGUID: FDTHRvtFTG+wucfUqTE8nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49223611"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="49223611"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 09:39:07 -0700
X-CSE-ConnectionGUID: dL1HJHziTNqYT0Ugnl+VeQ==
X-CSE-MsgGUID: HT6VqRyKSneRimqS3nA3iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="138511665"
Received: from mgoodin-mobl3.amr.corp.intel.com (HELO [10.124.222.100]) ([10.124.222.100])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 09:39:06 -0700
Message-ID: <d46bd014-02d9-44ec-a29d-b925f268ee03@linux.intel.com>
Date: Wed, 14 May 2025 09:39:05 -0700
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
Subject: Re: [PATCH v4 1/5] PCI/ERR: Remove misleading TODO regarding kernel
 panic
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
 <20250508-pcie-reset-slot-v4-1-7050093e2b50@linaro.org>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250508-pcie-reset-slot-v4-1-7050093e2b50@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 5/8/25 12:10 AM, Manivannan Sadhasivam wrote:
> A PCI device is just another peripheral in a system. So failure to
> recover it, must not result in a kernel panic. So remove the TODO which
> is quite misleading.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Reviewed-by: Kuppuswamy Sathyanarayanan 
<sathyanarayanan.kuppuswamy@linux.intel.com>

>   drivers/pci/pcie/err.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> index 31090770fffcc94e15ba6e89f649c6f84bfdf0d5..de6381c690f5c21f00021cdc7bde8d93a5c7db52 100644
> --- a/drivers/pci/pcie/err.c
> +++ b/drivers/pci/pcie/err.c
> @@ -271,7 +271,6 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>   
>   	pci_uevent_ers(bridge, PCI_ERS_RESULT_DISCONNECT);
>   
> -	/* TODO: Should kernel panic here? */
>   	pci_info(bridge, "device recovery failed\n");
>   
>   	return status;
>
-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


