Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 291DA4DEAB0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Mar 2022 21:40:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KLXnc60BRz3bZl
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Mar 2022 07:40:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gsE2X3NO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gsE2X3NO; dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KLXmz13Vyz2y6K
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Mar 2022 07:39:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647722387; x=1679258387;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SNTO9SP31MJ3IfcBEllmZc0kH+tF2DmXOvnp/cl1uDA=;
 b=gsE2X3NObX3vwv/d0Ad+Krp/RICUqsg2jn6Z4ie+LZnp8K2GuROKcOwI
 Wek0FfDW1Q5UCxJwwlrkL0aHIOtG6qiIdTlOFafoOqH3pkDx/ze+SQfPE
 V22nUN+VGHuGJaK4fflByp1F2MAZcZ1Ba5BX+cgKN5E1+4DaMKGe2oPdP
 cLcPh5Cq03eq8eGW1IH77z0nzrjjrhnhB/8Y8Ud7OZatFRR68p+/6Vptt
 ozKpCMpn2a64n57xThs8NhlJt69DTNhvy9WUYgT4+5ffWBtJyw4AzbujN
 7J4CrCO/xxQHMuAh+9XDzmAoEU0DECT2bCqX1ITv8BsdNcn2XslznqR1K Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10291"; a="343760784"
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; d="scan'208";a="343760784"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2022 13:38:41 -0700
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; d="scan'208";a="542656723"
Received: from llscottx-mobl1.amr.corp.intel.com (HELO [10.209.82.139])
 ([10.209.82.139])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2022 13:38:39 -0700
Message-ID: <427f19c6-32f0-684e-5fdd-2e5ed192b71d@linux.intel.com>
Date: Sat, 19 Mar 2022 13:38:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] PCI/AER: Disable AER service when link is in L2/L3
 ready, L2 and L3 state
Content-Language: en-US
To: Kai-Heng Feng <kai.heng.feng@canonical.com>, bhelgaas@google.com
References: <20220127025418.1989642-1-kai.heng.feng@canonical.com>
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20220127025418.1989642-1-kai.heng.feng@canonical.com>
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
Cc: Joerg Roedel <jroedel@suse.de>, koba.ko@canonical.com,
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Lalithambika Krishnakumar <lalithambika.krishnakumar@intel.com>,
 Oliver O'Halloran <oohall@gmail.com>, mika.westerberg@linux.intel.com,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 1/26/22 6:54 PM, Kai-Heng Feng wrote:
> Commit 50310600ebda ("iommu/vt-d: Enable PCI ACS for platform opt in
> hint") enables ACS, and some platforms lose its NVMe after resume from

Why enabling ACS makes platform lose NVMe? Can you add more details
about the problem?

> S3:
> [   50.947816] pcieport 0000:00:1b.0: DPC: containment event, status:0x1f01 source:0x0000
> [   50.947817] pcieport 0000:00:1b.0: DPC: unmasked uncorrectable error detected
> [   50.947829] pcieport 0000:00:1b.0: PCIe Bus Error: severity=Uncorrected (Non-Fatal), type=Transaction Layer, (Receiver ID)
> [   50.947830] pcieport 0000:00:1b.0:   device [8086:06ac] error status/mask=00200000/00010000
> [   50.947831] pcieport 0000:00:1b.0:    [21] ACSViol                (First)
> [   50.947841] pcieport 0000:00:1b.0: AER: broadcast error_detected message
> [   50.947843] nvme nvme0: frozen state error detected, reset controller
> 
> It happens right after ACS gets enabled during resume.
> 
> There's another case, when Thunderbolt reaches D3cold:
> [   30.100211] pcieport 0000:00:1d.0: AER: Uncorrected (Non-Fatal) error received: 0000:00:1d.0
> [   30.100251] pcieport 0000:00:1d.0: PCIe Bus Error: severity=Uncorrected (Non-Fatal), type=Transaction Layer, (Requester ID)
> [   30.100256] pcieport 0000:00:1d.0:   device [8086:7ab0] error status/mask=00100000/00004000
> [   30.100262] pcieport 0000:00:1d.0:    [20] UnsupReq               (First)
> [   30.100267] pcieport 0000:00:1d.0: AER:   TLP Header: 34000000 08000052 00000000 00000000
> [   30.100372] thunderbolt 0000:0a:00.0: AER: can't recover (no error_detected callback)

no callback message means one or more devices in the given port does not
support error handler. How is this related to ACS?

> [   30.100401] xhci_hcd 0000:3e:00.0: AER: can't recover (no error_detected callback)
> [   30.100427] pcieport 0000:00:1d.0: AER: device recovery failed
> 
> So disable AER service to avoid the noises from turning power rails
> on/off when the device is in low power states (D3hot and D3cold), as
> PCIe spec "5.2 Link State Power Management" states that TLP and DLLP
> transmission is disabled for a Link in L2/L3 Ready (D3hot), L2 (D3cold
> with aux power) and L3 (D3cold).
> 
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=209149
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=215453
> Fixes: 50310600ebda ("iommu/vt-d: Enable PCI ACS for platform opt in hint")
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
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
