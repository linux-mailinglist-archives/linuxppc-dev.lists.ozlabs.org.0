Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C984ECD63
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 21:42:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTGzY02R3z3c1y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 06:42:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CgY9udA0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CgY9udA0; dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTGyr1ffYz2yZZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Mar 2022 06:41:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648669300; x=1680205300;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Hhnn1DKnMB2M/y2bDdb4qAmNYodHX20Vw2Rm29bwANA=;
 b=CgY9udA0HUZuAXEtdR/ov+5GlAP3i3L+Vw1asl+0WYpdl1WtY/tcOwSr
 gQYo1tnjRJk1Tpqy+ArXWyGQUK3h8AHoXFHF3tFVjXt/J08ddKO0Nosuq
 t1tHSN/F/Axet1RDANsYuvQuPMh6kKdxqIoUS17qf+gqG41nJr9FASBUN
 drsvOoKIe8mUXH0AtuYUqjmHefeSPvDeRtYt6ytg7lJdbNkOKcEnyOmjo
 ihDtMiWOhajgwzGkciCYSHnGL45BwCSin1O7IeDIfr5wXBkv7qAOSmiEY
 X1Om/JajLOPsyoEPa8Uxeuwrr+7vLpp7k5VemoqDvbMHlf2KAOzhHZ3Ra Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="257209619"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="257209619"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 12:40:35 -0700
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="639844560"
Received: from ksanitha-mobl3.amr.corp.intel.com (HELO [10.209.123.221])
 ([10.209.123.221])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 12:40:34 -0700
Message-ID: <009c9c14-7669-9750-a787-1d220414423e@linux.intel.com>
Date: Wed, 30 Mar 2022 12:40:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v3 1/2] PCI/AER: Disable AER service when link is in L2/L3
 ready, L2 and L3 state
Content-Language: en-US
To: Kai-Heng Feng <kai.heng.feng@canonical.com>, bhelgaas@google.com
References: <20220329083130.817316-1-kai.heng.feng@canonical.com>
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20220329083130.817316-1-kai.heng.feng@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, koba.ko@canonical.com,
 Oliver O'Halloran <oohall@gmail.com>, mika.westerberg@linux.intel.com,
 baolu.lu@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/29/22 1:31 AM, Kai-Heng Feng wrote:
> On some Intel AlderLake platforms, Thunderbolt entering D3cold can cause
> some errors reported by AER:
> [   30.100211] pcieport 0000:00:1d.0: AER: Uncorrected (Non-Fatal) error received: 0000:00:1d.0
> [   30.100251] pcieport 0000:00:1d.0: PCIe Bus Error: severity=Uncorrected (Non-Fatal), type=Transaction Layer, (Requester ID)
> [   30.100256] pcieport 0000:00:1d.0:   device [8086:7ab0] error status/mask=00100000/00004000
> [   30.100262] pcieport 0000:00:1d.0:    [20] UnsupReq               (First)
> [   30.100267] pcieport 0000:00:1d.0: AER:   TLP Header: 34000000 08000052 00000000 00000000
> [   30.100372] thunderbolt 0000:0a:00.0: AER: can't recover (no error_detected callback)
> [   30.100401] xhci_hcd 0000:3e:00.0: AER: can't recover (no error_detected callback)
> [   30.100427] pcieport 0000:00:1d.0: AER: device recovery failed

Include details about in which platform you have seen it and whether
this is a generic power issue?

> 
> So disable AER service to avoid the noises from turning power rails
> on/off when the device is in low power states (D3hot and D3cold), as
> PCIe spec "5.2 Link State Power Management" states that TLP and DLLP

Also include PCIe specification version number.

> transmission is disabled for a Link in L2/L3 Ready (D3hot), L2 (D3cold
> with aux power) and L3 (D3cold).
> 
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=215453
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
> v3:
>   - Remove reference to ACS.
>   - Wording change.
> 
> v2:
>   - Wording change.
> 
>   drivers/pci/pcie/aer.c | 31 +++++++++++++++++++++++++------
>   1 file changed, 25 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 9fa1f97e5b270..e4e9d4a3098d7 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -1367,6 +1367,22 @@ static int aer_probe(struct pcie_device *dev)
>   	return 0;
>   }
>   
> +static int aer_suspend(struct pcie_device *dev)
> +{
> +	struct aer_rpc *rpc = get_service_data(dev);
> +
> +	aer_disable_rootport(rpc);
> +	return 0;
> +}
> +
> +static int aer_resume(struct pcie_device *dev)
> +{
> +	struct aer_rpc *rpc = get_service_data(dev);
> +
> +	aer_enable_rootport(rpc);
> +	return 0;
> +}
> +
>   /**
>    * aer_root_reset - reset Root Port hierarchy, RCEC, or RCiEP
>    * @dev: pointer to Root Port, RCEC, or RCiEP
> @@ -1433,12 +1449,15 @@ static pci_ers_result_t aer_root_reset(struct pci_dev *dev)
>   }
>   
>   static struct pcie_port_service_driver aerdriver = {
> -	.name		= "aer",
> -	.port_type	= PCIE_ANY_PORT,
> -	.service	= PCIE_PORT_SERVICE_AER,
> -
> -	.probe		= aer_probe,
> -	.remove		= aer_remove,
> +	.name			= "aer",
> +	.port_type		= PCIE_ANY_PORT,
> +	.service		= PCIE_PORT_SERVICE_AER,
> +	.probe			= aer_probe,
> +	.suspend		= aer_suspend,
> +	.resume			= aer_resume,
> +	.runtime_suspend	= aer_suspend,
> +	.runtime_resume		= aer_resume,
> +	.remove			= aer_remove,
>   };
>   
>   /**

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
