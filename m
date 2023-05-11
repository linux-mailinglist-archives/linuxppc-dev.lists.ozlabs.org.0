Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB53B6FFC90
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 00:08:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QHQyn4MKFz3fYy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 08:08:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EgIt2plO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EgIt2plO;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QHQxt3sLQz3c1K
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 May 2023 08:08:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683842882; x=1715378882;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=dcivrtBNBKYrwhHCG20eFak+R1jORc9y5Sw1snBi2S4=;
  b=EgIt2plOkBZR9sTE2YnOL3k8sn6nIm3jt6PtP624D6F5FcosZaaEivPl
   kZIBgId2SWhY+yAWMW/bRo5lKvxNESxGCYc2qFoGqhBfWK0AffGvFUt0v
   AsxTrqOGfKU3ENM1+hT7IOIWXMsa7xL1omQRhsmzfH1mT2dlTcWp96mDM
   7USmdiQgnuS5kLawJfC/oRl+HaHQE1ZH9MwywgJhItU1/ERg0hqAPaFIn
   ct6SD0RM1HUAwtQF7tDDmh9mf+UnxYTVUPVXz0BMzq8kzWWfrFymM94UQ
   q5ajH1uVqfOja+LTZNLS7Kf8JPkLwKj3lIuAWfKUPxv0X+oh5M6Ut+IWC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="378780015"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; 
   d="scan'208";a="378780015"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 15:07:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="824138929"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; 
   d="scan'208";a="824138929"
Received: from swalker-mobl1.amr.corp.intel.com (HELO [10.209.63.194]) ([10.209.63.194])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 15:07:23 -0700
Message-ID: <35b33699-227d-d1f5-285a-e18ef8e91e57@linux.intel.com>
Date: Thu, 11 May 2023 15:07:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [PATCH v5 2/3] PCI/AER: Disable AER interrupt on suspend
Content-Language: en-US
To: Kai-Heng Feng <kai.heng.feng@canonical.com>, bhelgaas@google.com
References: <20230511133610.99759-1-kai.heng.feng@canonical.com>
 <20230511133610.99759-2-kai.heng.feng@canonical.com>
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20230511133610.99759-2-kai.heng.feng@canonical.com>
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
Cc: mika.westerberg@linux.intel.com, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, koba.ko@canonical.com, Oliver O'Halloran <oohall@gmail.com>, linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/11/23 6:36 AM, Kai-Heng Feng wrote:
> PCIe service that shares IRQ with PME may cause spurious wakeup on
> system suspend.
> 
> This is very similar to previous attempts to suspend AER and DPC [1],
> but this time disabling AER IRQ is to prevent immediate PME wakeup when
> AER shares the same IRQ line with PME.

IMHO, you don't need to mention the previous submission reason.

> 
> It's okay to disable AER because PCIe Base Spec 5.0, section 5.2 "Link
> State Power Management" states that TLP and DLLP transmission is
> disabled for a Link in L2/L3 Ready (D3hot), L2 (D3cold with aux power)
> and L3 (D3cold), hence we don't lose much here to disable AER IRQ during
> system suspend.

May be something like below?

PCIe services that share an IRQ with PME, such as AER or DPC, may cause a
spurious wakeup on system suspend. To prevent this, disable the AER
interrupt notification during the system suspend process.

As Per PCIe Base Spec 5.0, section 5.2, titled "Link State Power Management",
TLP and DLLP transmission are disabled for a Link in L2/L3 Ready (D3hot), L2
(D3cold with aux power) and L3 (D3cold) states. So disabling the AER notification
during suspend and re-enabling them during the resume process should not affect
the basic functionality.

> 
> [1] https://lore.kernel.org/linux-pci/20220408153159.106741-1-kai.heng.feng@canonical.com/
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=216295
> 
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
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
>  drivers/pci/pcie/aer.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 1420e1f27105..9c07fdbeb52d 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -1356,6 +1356,26 @@ static int aer_probe(struct pcie_device *dev)
>  	return 0;
>  }
>  
> +static int aer_suspend(struct pcie_device *dev)
> +{
> +	struct aer_rpc *rpc = get_service_data(dev);
> +	struct pci_dev *pdev = rpc->rpd;
> +
> +	aer_disable_irq(pdev);
> +
> +	return 0;
> +}
> +
> +static int aer_resume(struct pcie_device *dev)
> +{
> +	struct aer_rpc *rpc = get_service_data(dev);
> +	struct pci_dev *pdev = rpc->rpd;
> +
> +	aer_enable_irq(pdev);
> +
> +	return 0;
> +}
> +
>  /**
>   * aer_root_reset - reset Root Port hierarchy, RCEC, or RCiEP
>   * @dev: pointer to Root Port, RCEC, or RCiEP
> @@ -1420,6 +1440,8 @@ static struct pcie_port_service_driver aerdriver = {
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
