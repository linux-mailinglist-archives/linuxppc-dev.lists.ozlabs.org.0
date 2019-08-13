Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4018D8AE1A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 06:51:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4670ff1q3QzDqQR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 14:51:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ti.com
 (client-ip=198.47.23.248; helo=lelv0143.ext.ti.com;
 envelope-from=kishon@ti.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ti.com header.i=@ti.com header.b="vZT9vUuH"; 
 dkim-atps=neutral
X-Greylist: delayed 660 seconds by postgrey-1.36 at bilbo;
 Tue, 13 Aug 2019 14:49:42 AEST
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4670ck3HL5zDqJt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2019 14:49:40 +1000 (AEST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7D4cMHO075138;
 Mon, 12 Aug 2019 23:38:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1565671102;
 bh=Ew8tzQEV3bzDzArZx0dSvuT8DgjzVr1McyreXZiBsSc=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=vZT9vUuHjeJfqpbHC4JPY+yhxRma4e4qSkeST+7paoKsG84W2UZByMArh6fPFnWJq
 dIgNfQbSX2IfvtZnQIUuh1wRrWHV1Cl2fSl/20zrLzPmdAg0BUy5hJ4UdsWDpJTgAV
 ZryYQFfcBi+I0FwLxytw7j2IyY14hveNKE/bPrU8=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7D4cMeS030426
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 12 Aug 2019 23:38:22 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 12
 Aug 2019 23:38:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 12 Aug 2019 23:38:21 -0500
Received: from [172.24.190.233] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7D4cDdj022723;
 Mon, 12 Aug 2019 23:38:14 -0500
Subject: Re: [PATCHv4 1/2] PCI: layerscape: Add the bar_fixed_64bit property
 in EP driver.
To: Xiaowei Bao <xiaowei.bao@nxp.com>, <lorenzo.pieralisi@arm.com>,
 <bhelgaas@google.com>, <minghuan.Lian@nxp.com>, <mingkai.hu@nxp.com>,
 <roy.zang@nxp.com>, <l.stach@pengutronix.de>, <tpiepho@impinj.com>,
 <leonard.crestez@nxp.com>, <andrew.smirnov@gmail.com>,
 <yue.wang@amlogic.com>, <hayashi.kunihiko@socionext.com>,
 <dwmw@amazon.co.uk>, <jonnyc@amazon.com>, <linux-pci@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-arm-kernel@lists.infradead.org>
References: <20190813025317.48290-1-xiaowei.bao@nxp.com>
From: Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <4a456d72-f5b5-e860-0215-dd215e2edf09@ti.com>
Date: Tue, 13 Aug 2019 10:06:20 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813025317.48290-1-xiaowei.bao@nxp.com>
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



On 13/08/19 8:23 AM, Xiaowei Bao wrote:
> The PCIe controller of layerscape just have 4 BARs, BAR0 and BAR1
> is 32bit, BAR3 and BAR4 is 64bit, this is determined by hardware,

Do you mean BAR2 instead of BAR3 here?

Thanks
Kishon

> so set the bar_fixed_64bit with 0x14.
> 
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> ---
> v2:
>  - Replace value 0x14 with a macro.
> v3:
>  - No change.
> v4:
>  - send the patch again with '--to'.
> 
>  drivers/pci/controller/dwc/pci-layerscape-ep.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> index be61d96..227c33b 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -44,6 +44,7 @@ static int ls_pcie_establish_link(struct dw_pcie *pci)
>  	.linkup_notifier = false,
>  	.msi_capable = true,
>  	.msix_capable = false,
> +	.bar_fixed_64bit = (1 << BAR_2) | (1 << BAR_4),
>  };
>  
>  static const struct pci_epc_features*
> 
