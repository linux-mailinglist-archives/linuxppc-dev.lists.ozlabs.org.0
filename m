Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6128A90BD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Apr 2024 03:35:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TC5oOHJF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VKgLq4scFz3cRs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Apr 2024 11:34:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TC5oOHJF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Thu, 18 Apr 2024 11:34:20 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VKgL42Gbsz3cNV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Apr 2024 11:34:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713404060; x=1744940060;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Q4F2ZtxiPYMoJOfp7gavUjn2ZLtzD+aJZKEOROEWMGI=;
  b=TC5oOHJFaxnwCzQp5UyiizoBwGCR9zoqCAgP0SDQao/5jlVIvsNiSUjq
   Eut0k501AnSdde9RUWawCOQLlXbYJMwqDYc8GMP7yXi3yc41J+8g/xV1r
   TA0RkR4E7mSiu4Z3y+mNrS1zSXOJRJz4l14xIyf0HF1RdD0CXtFrC6VYZ
   GOTCfFqUy++DWjQVHpiVCms65F/mEN8yEU2NBallEojI7f1gGIYHP+X3s
   5mdvGfNOGasWyLU8cUCr9ES9cH7K8fr6RjfkfPKYgrdi+7tJNWXjffsD3
   Bo3+1v1EjiGu4u++ZwLSqoMj1jeuB70iISKSl/f+K1tJpIm58hecHsOxW
   w==;
X-CSE-ConnectionGUID: 3CWsyIMyTA2Zdv2kvmWwvA==
X-CSE-MsgGUID: smAzT3asR1GhP935HcAe8A==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8788888"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="8788888"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 18:33:11 -0700
X-CSE-ConnectionGUID: JgAsBTwcTbqB10eTts8YwA==
X-CSE-MsgGUID: m8jdm8yZQyevTr1lSoFbdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="22870961"
Received: from kglossop-mobl.amr.corp.intel.com (HELO [10.209.94.180]) ([10.209.94.180])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 18:33:11 -0700
Message-ID: <3b5b78e0-dc7e-4e9b-833d-bbb918ff1b2a@linux.intel.com>
Date: Wed, 17 Apr 2024 18:33:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] PCI/AER: Disable AER service on suspend
To: Kai-Heng Feng <kai.heng.feng@canonical.com>, bhelgaas@google.com
References: <20240416043225.1462548-1-kai.heng.feng@canonical.com>
 <20240416043225.1462548-2-kai.heng.feng@canonical.com>
Content-Language: en-US
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20240416043225.1462548-2-kai.heng.feng@canonical.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: kch@nvidia.com, regressions@lists.linux.dev, linux-pci@vger.kernel.org, mahesh@linux.ibm.com, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, oohall@gmail.com, hare@suse.de, bagasdotme@gmail.com, kbusch@kernel.org, gloriouseggroll@gmail.com, linuxppc-dev@lists.ozlabs.org, hch@lst.de, sagi@grimberg.me
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 4/15/24 9:32 PM, Kai-Heng Feng wrote:
> When the power rail gets cut off, the hardware can create some electric
> noise on the link that triggers AER. If IRQ is shared between AER with
> PME, such AER noise will cause a spurious wakeup on system suspend.
>
> When the power rail gets back, the firmware of the device resets itself
> and can create unexpected behavior like sending PTM messages. For this
> case, the driver will always be too late to toggle off features should
> be disabled.
>
> As Per PCIe Base Spec 5.0, section 5.2, titled "Link State Power
> Management", TLP and DLLP transmission are disabled for a Link in L2/L3
> Ready (D3hot), L2 (D3cold with aux power) and L3 (D3cold) states. So if
> the power will be turned off during suspend process, disable AER service
> and re-enable it during the resume process. This should not affect the
> basic functionality.
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=209149
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=216295
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=218090
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---

Looks good to me.

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

> v8:
>  - Add more bug reports.
>
> v7:
>  - Wording
>  - Disable AER completely (again) if power will be turned off
>
> v6:
> v5:
>  - Wording.
>
> v4:
> v3:
>  - No change.
>
> v2:
>  - Only disable AER IRQ.
>  - No more check on PME IRQ#.
>  - Use helper.
>
>  drivers/pci/pcie/aer.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index ac6293c24976..bea7818c2d1b 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -28,6 +28,7 @@
>  #include <linux/delay.h>
>  #include <linux/kfifo.h>
>  #include <linux/slab.h>
> +#include <linux/suspend.h>
>  #include <acpi/apei.h>
>  #include <acpi/ghes.h>
>  #include <ras/ras_event.h>
> @@ -1497,6 +1498,28 @@ static int aer_probe(struct pcie_device *dev)
>  	return 0;
>  }
>  
> +static int aer_suspend(struct pcie_device *dev)
> +{
> +	struct aer_rpc *rpc = get_service_data(dev);
> +	struct pci_dev *pdev = rpc->rpd;
> +
> +	if (pci_ancestor_pr3_present(pdev) || pm_suspend_via_firmware())
> +		aer_disable_rootport(rpc);
> +
> +	return 0;
> +}
> +
> +static int aer_resume(struct pcie_device *dev)
> +{
> +	struct aer_rpc *rpc = get_service_data(dev);
> +	struct pci_dev *pdev = rpc->rpd;
> +
> +	if (pci_ancestor_pr3_present(pdev) || pm_resume_via_firmware())
> +		aer_enable_rootport(rpc);
> +
> +	return 0;
> +}
> +
>  /**
>   * aer_root_reset - reset Root Port hierarchy, RCEC, or RCiEP
>   * @dev: pointer to Root Port, RCEC, or RCiEP
> @@ -1561,6 +1584,8 @@ static struct pcie_port_service_driver aerdriver = {
>  	.service	= PCIE_PORT_SERVICE_AER,
>  
>  	.probe		= aer_probe,
> +	.suspend	= aer_suspend,
> +	.resume		= aer_resume,
>  	.remove		= aer_remove,
>  };
>  

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

