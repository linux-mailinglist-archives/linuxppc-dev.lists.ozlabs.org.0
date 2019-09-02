Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F0174A557E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 14:03:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MTJG3jDTzDqgG
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 22:03:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=andrew.murray@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 46MTGB3b6ZzDqNt
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2019 22:01:52 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B102B28;
 Mon,  2 Sep 2019 05:01:49 -0700 (PDT)
Received: from localhost (unknown [10.37.6.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 280923F246;
 Mon,  2 Sep 2019 05:01:49 -0700 (PDT)
Date: Mon, 2 Sep 2019 13:01:47 +0100
From: Andrew Murray <andrew.murray@arm.com>
To: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: Re: [PATCH v3 08/11] PCI: layerscape: Modify the MSIX to the
 doorbell mode
Message-ID: <20190902120147.GH9720@e119886-lin.cambridge.arm.com>
References: <20190902031716.43195-1-xiaowei.bao@nxp.com>
 <20190902031716.43195-9-xiaowei.bao@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190902031716.43195-9-xiaowei.bao@nxp.com>
User-Agent: Mutt/1.10.1+81 (426a6c1) (2018-08-26)
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
Cc: mark.rutland@arm.com, roy.zang@nxp.com, lorenzo.pieralisi@arm.com,
 arnd@arndb.de, devicetree@vger.kernel.org, jingoohan1@gmail.com,
 zhiqiang.hou@nxp.com, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, kishon@ti.com, minghuan.Lian@nxp.com,
 robh+dt@kernel.org, gregkh@linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org, gustavo.pimentel@synopsys.com,
 leoyang.li@nxp.com, shawnguo@kernel.org, mingkai.hu@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 02, 2019 at 11:17:13AM +0800, Xiaowei Bao wrote:
> dw_pcie_ep_raise_msix_irq was never called in the exisitng driver
> before, because the ls1046a platform don't support the MSIX feature
> and msix_capable was always set to false.
> Now that add the ls1088a platform with MSIX support, but the existing
> dw_pcie_ep_raise_msix_irq doesn't work, so use the doorbell method to
> support the MSIX feature.
> 
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>

Reviewed-by: Andrew Murray <andrew.murray@arm.com>

> ---
> v2: 
>  - No change
> v3:
>  - Modify the commit message make it clearly.
> 
>  drivers/pci/controller/dwc/pci-layerscape-ep.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> index 1e07287..5f0cb99 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -79,7 +79,8 @@ static int ls_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	case PCI_EPC_IRQ_MSI:
>  		return dw_pcie_ep_raise_msi_irq(ep, func_no, interrupt_num);
>  	case PCI_EPC_IRQ_MSIX:
> -		return dw_pcie_ep_raise_msix_irq(ep, func_no, interrupt_num);
> +		return dw_pcie_ep_raise_msix_irq_doorbell(ep, func_no,
> +							  interrupt_num);
>  	default:
>  		dev_err(pci->dev, "UNKNOWN IRQ type\n");
>  		return -EINVAL;
> -- 
> 2.9.5
> 
