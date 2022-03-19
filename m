Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF084DEAB3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Mar 2022 21:41:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KLXqS3Yjnz3bNn
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Mar 2022 07:41:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y+7iQ6KC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Y+7iQ6KC; dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KLXpq5JXQz2x9V
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Mar 2022 07:41:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647722483; x=1679258483;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Nd8cTOZCZJMffvQJDvB7Hp7HuDrz3fS77J4g0WJHxjQ=;
 b=Y+7iQ6KC8RIEZKSG9MGiKNxddjO83y9trPLE2+kI6V4Pafu4Mw3Zf7EO
 Aqun1yX63GxjB1N5QZnsJiEFMAbkagCus8yGvsj98dbBjN6rXQg2G76gL
 k5MD4VcURuNNQ+Isnq0YkU6XhgUCzcu7ijeexkXQsYsQSH6BOtFSqH0nK
 mKrva/QoTJlFQ9fsFJq1cuIJbZkEAFHBNlBwX2VGgm3Asl5Z8YDsTRspc
 6M43sYSt0NcFliI0mT3XmdsEkpA3u5KOjH9rzz+y0J7sUqcIBvs/p5e3r
 Cpiee2K0vIlJui26bua+MWaSnPUu3EXqdch6GbI+2d4ljpGRHzbzRSzvi Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10291"; a="254894998"
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; d="scan'208";a="254894998"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2022 13:40:21 -0700
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; d="scan'208";a="542657573"
Received: from llscottx-mobl1.amr.corp.intel.com (HELO [10.209.82.139])
 ([10.209.82.139])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2022 13:40:20 -0700
Message-ID: <aa810b71-89b2-f18e-5564-d65ed421b8d9@linux.intel.com>
Date: Sat, 19 Mar 2022 13:40:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/2] PCI/DPC: Disable DPC service when link is in L2/L3
 ready, L2 and L3 state
Content-Language: en-US
To: Kai-Heng Feng <kai.heng.feng@canonical.com>, bhelgaas@google.com
References: <20220127025418.1989642-1-kai.heng.feng@canonical.com>
 <20220127025418.1989642-2-kai.heng.feng@canonical.com>
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20220127025418.1989642-2-kai.heng.feng@canonical.com>
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
Cc: linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, koba.ko@canonical.com,
 Oliver O'Halloran <oohall@gmail.com>, mika.westerberg@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 1/26/22 6:54 PM, Kai-Heng Feng wrote:
> Since TLP and DLLP transmission is disabled for a Link in L2/L3 Ready,
> L2 and L3 (i.e. device in D3hot and D3cold), and DPC depends on AER, so

Better description about the problem would be helpful. I know you
have included a log in AER patch. But a quick summary of the problem
in this patch will make it easier to read the patch.

> also disable DPC here.
> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
> v2:
>   - Wording change.
>   - Empty line dropped.
> 
>   drivers/pci/pcie/dpc.c | 60 +++++++++++++++++++++++++++++++-----------
>   1 file changed, 44 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> index 3e9afee02e8d1..414258967f08e 100644
> --- a/drivers/pci/pcie/dpc.c
> +++ b/drivers/pci/pcie/dpc.c
> @@ -343,13 +343,33 @@ void pci_dpc_init(struct pci_dev *pdev)
>   	}
>   }
>   
> +static void dpc_enable(struct pcie_device *dev)
> +{
> +	struct pci_dev *pdev = dev->port;
> +	u16 ctl;
> +
> +	pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, &ctl);
> +	ctl = (ctl & 0xfff4) | PCI_EXP_DPC_CTL_EN_FATAL | PCI_EXP_DPC_CTL_INT_EN;
> +	pci_write_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, ctl);
> +}
> +
> +static void dpc_disable(struct pcie_device *dev)
> +{
> +	struct pci_dev *pdev = dev->port;
> +	u16 ctl;
> +
> +	pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, &ctl);
> +	ctl &= ~(PCI_EXP_DPC_CTL_EN_FATAL | PCI_EXP_DPC_CTL_INT_EN);
> +	pci_write_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, ctl);
> +}
> +
>   #define FLAG(x, y) (((x) & (y)) ? '+' : '-')
>   static int dpc_probe(struct pcie_device *dev)
>   {
>   	struct pci_dev *pdev = dev->port;
>   	struct device *device = &dev->device;
>   	int status;
> -	u16 ctl, cap;
> +	u16 cap;
>   
>   	if (!pcie_aer_is_native(pdev) && !pcie_ports_dpc_native)
>   		return -ENOTSUPP;
> @@ -364,10 +384,7 @@ static int dpc_probe(struct pcie_device *dev)
>   	}
>   
>   	pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CAP, &cap);
> -	pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, &ctl);
> -
> -	ctl = (ctl & 0xfff4) | PCI_EXP_DPC_CTL_EN_FATAL | PCI_EXP_DPC_CTL_INT_EN;
> -	pci_write_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, ctl);
> +	dpc_enable(dev);
>   	pci_info(pdev, "enabled with IRQ %d\n", dev->irq);
>   
>   	pci_info(pdev, "error containment capabilities: Int Msg #%d, RPExt%c PoisonedTLP%c SwTrigger%c RP PIO Log %d, DL_ActiveErr%c\n",
> @@ -380,22 +397,33 @@ static int dpc_probe(struct pcie_device *dev)
>   	return status;
>   }
>   
> -static void dpc_remove(struct pcie_device *dev)
> +static int dpc_suspend(struct pcie_device *dev)
>   {
> -	struct pci_dev *pdev = dev->port;
> -	u16 ctl;
> +	dpc_disable(dev);
> +	return 0;
> +}
>   
> -	pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, &ctl);
> -	ctl &= ~(PCI_EXP_DPC_CTL_EN_FATAL | PCI_EXP_DPC_CTL_INT_EN);
> -	pci_write_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, ctl);
> +static int dpc_resume(struct pcie_device *dev)
> +{
> +	dpc_enable(dev);
> +	return 0;
> +}
> +
> +static void dpc_remove(struct pcie_device *dev)
> +{
> +	dpc_disable(dev);
>   }
>   
>   static struct pcie_port_service_driver dpcdriver = {
> -	.name		= "dpc",
> -	.port_type	= PCIE_ANY_PORT,
> -	.service	= PCIE_PORT_SERVICE_DPC,
> -	.probe		= dpc_probe,
> -	.remove		= dpc_remove,
> +	.name			= "dpc",
> +	.port_type		= PCIE_ANY_PORT,
> +	.service		= PCIE_PORT_SERVICE_DPC,
> +	.probe			= dpc_probe,
> +	.suspend		= dpc_suspend,
> +	.resume			= dpc_resume,
> +	.runtime_suspend	= dpc_suspend,
> +	.runtime_resume		= dpc_resume,
> +	.remove			= dpc_remove,
>   };
>   
>   int __init pcie_dpc_init(void)

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
