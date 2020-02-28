Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3145A1739D9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 15:31:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TX5m5J3WzDrL1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Feb 2020 01:31:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ti.com
 (client-ip=198.47.19.142; helo=fllv0016.ext.ti.com;
 envelope-from=kishon@ti.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=wnesvm0w; 
 dkim-atps=neutral
X-Greylist: delayed 10353 seconds by postgrey-1.36 at bilbo;
 Sat, 29 Feb 2020 01:28:59 AEDT
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TX3H65LnzDqfS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Feb 2020 01:28:57 +1100 (AEDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01SBa53j013584;
 Fri, 28 Feb 2020 05:36:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582889765;
 bh=rLm5NTE1CYjmZGMxs2YV7x1c9JuFq3mregL37grduCo=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=wnesvm0wVu+YeZ8jTJAO9WrXhn894VT4/u5rRrMX9BPzZcnr7a/OQLigUuunWkn6/
 5SU0DVsrO9RSc5SbJ+ipZ87f8rf5C30jGJLV5pdzOIQCK+mAs+Yx0hEmyshMPxoBOa
 JSea5U5NQC9FApxu7lO7DJ/c8Kl1jILUwbFpQ714=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01SBa5i1115846;
 Fri, 28 Feb 2020 05:36:05 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 28
 Feb 2020 05:36:05 -0600
Received: from localhost.localdomain (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 28 Feb 2020 05:36:05 -0600
Received: from [10.24.69.159] (ileax41-snat.itg.ti.com [10.172.224.153])
 by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 01SBa0vP019981;
 Fri, 28 Feb 2020 05:36:00 -0600
Subject: Re: [PATCH v4 08/11] PCI: layerscape: Modify the MSIX to the doorbell
 mode
To: Xiaowei Bao <xiaowei.bao@nxp.com>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <shawnguo@kernel.org>, <leoyang.li@nxp.com>,
 <lorenzo.pieralisi@arm.com>, <minghuan.Lian@nxp.com>,
 <mingkai.hu@nxp.com>, <roy.zang@nxp.com>, <jingoohan1@gmail.com>,
 <gustavo.pimentel@synopsys.com>, <andrew.murray@arm.com>,
 <linux-pci@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>
References: <20190924021849.3185-1-xiaowei.bao@nxp.com>
 <20190924021849.3185-9-xiaowei.bao@nxp.com>
From: Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <55752e77-1094-4cbf-2822-e10b875b4dd9@ti.com>
Date: Fri, 28 Feb 2020 17:10:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20190924021849.3185-9-xiaowei.bao@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Xiaowei,

On 24/09/19 7:48 am, Xiaowei Bao wrote:
> dw_pcie_ep_raise_msix_irq was never called in the exisitng driver
> before, because the ls1046a platform don't support the MSIX feature
> and msix_capable was always set to false.
> Now that add the ls1088a platform with MSIX support, but the existing
> dw_pcie_ep_raise_msix_irq doesn't work, so use the doorbell method to
> support the MSIX feature.


It does work after [1]. So the commit message might not be exactly true.

[1] -> https://lore.kernel.org/r/20200225081703.8857-1-kishon@ti.com

Thanks
Kishon

> 
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> Reviewed-by: Andrew Murray <andrew.murray@arm.com>
> ---
> v2: 
>  - No change
> v3:
>  - Modify the commit message make it clearly.
> v4: 
>  - No change
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
> 
