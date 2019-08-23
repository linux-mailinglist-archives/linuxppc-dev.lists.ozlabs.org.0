Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F819A623
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 05:41:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46F6dr3BY6zDrgY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 13:41:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ti.com
 (client-ip=198.47.23.248; helo=lelv0143.ext.ti.com;
 envelope-from=kishon@ti.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ti.com header.i=@ti.com header.b="JWV4ioQF"; 
 dkim-atps=neutral
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46F6bv0FWPzDrfL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 13:40:08 +1000 (AEST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7N3dsco056152;
 Thu, 22 Aug 2019 22:39:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1566531594;
 bh=81SSEYa5Fp4dwV5qila9E6vwCoCXnItQiSYD67zCfW8=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=JWV4ioQFP6IoggZOdMcyoaMP1ZYasXYOhchN4C+7LKmF5GWY/fxycdv4+VTJvOnBp
 CG/i6CCa5N2V806C2ZUm4j1Uvw9GWhxQp1m80ztT3LFuMkB56p1qu+TsGUuUsqEtiH
 l2geahbl0GLEirpyHJqBtlG/34hOoHWZDlmJRhBY=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7N3dsgV012046
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 22 Aug 2019 22:39:54 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 22
 Aug 2019 22:39:54 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 22 Aug 2019 22:39:54 -0500
Received: from [172.24.190.233] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7N3dmoK102238;
 Thu, 22 Aug 2019 22:39:49 -0500
Subject: Re: [PATCH v2 06/10] PCI: layerscape: Modify the way of getting
 capability with different PEX
To: Xiaowei Bao <xiaowei.bao@nxp.com>, "bhelgaas@google.com"
 <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org"
 <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>,
 "lorenzo.pieralisi@arm.co" <lorenzo.pieralisi@arm.com>, "arnd@arndb.de"
 <arnd@arndb.de>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "M.h. Lian" <minghuan.lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy
 Zang <roy.zang@nxp.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "andrew.murray@arm.com"
 <andrew.murray@arm.com>
References: <20190822112242.16309-1-xiaowei.bao@nxp.com>
 <20190822112242.16309-6-xiaowei.bao@nxp.com>
 <0c02ac52-e4b1-8071-bf9e-d10b28fc9029@ti.com>
 <AM5PR04MB3299DE7B57F31EA405E4FCBCF5A40@AM5PR04MB3299.eurprd04.prod.outlook.com>
From: Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <11e9b2c3-f4d0-2f82-bb14-45c38a1419e4@ti.com>
Date: Fri, 23 Aug 2019 09:09:46 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <AM5PR04MB3299DE7B57F31EA405E4FCBCF5A40@AM5PR04MB3299.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

Hi,

(Fixed Lorenzo's email address. All the patches in the series have wrong email id)

On 23/08/19 8:09 AM, Xiaowei Bao wrote:
> 
> 
>> -----Original Message-----
>> From: Kishon Vijay Abraham I <kishon@ti.com>
>> Sent: 2019年8月22日 19:44
>> To: Xiaowei Bao <xiaowei.bao@nxp.com>; bhelgaas@google.com;
>> robh+dt@kernel.org; mark.rutland@arm.com; shawnguo@kernel.org; Leo Li
>> <leoyang.li@nxp.com>; lorenzo.pieralisi@arm.co; arnd@arndb.de;
>> gregkh@linuxfoundation.org; M.h. Lian <minghuan.lian@nxp.com>; Mingkai
>> Hu <mingkai.hu@nxp.com>; Roy Zang <roy.zang@nxp.com>;
>> jingoohan1@gmail.com; gustavo.pimentel@synopsys.com;
>> linux-pci@vger.kernel.org; devicetree@vger.kernel.org;
>> linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
>> linuxppc-dev@lists.ozlabs.org; andrew.murray@arm.com
>> Subject: Re: [PATCH v2 06/10] PCI: layerscape: Modify the way of getting
>> capability with different PEX
>>
>> Hi,
>>
>> On 22/08/19 4:52 PM, Xiaowei Bao wrote:
>>> The different PCIe controller in one board may be have different
>>> capability of MSI or MSIX, so change the way of getting the MSI
>>> capability, make it more flexible.
>>
>> please use different pci_epc_features table for different boards.
> Thanks, I think that it will be more flexible to dynamically get MSI or MSIX capability,
> Thus, we will not need to define the pci_epc_feature for different boards.

Is the restriction because you cannot have different compatible for different
boards?

Thanks
Kishon

>>
>> Thanks
>> Kishon
>>>
>>> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
>>> ---
>>> v2:
>>>  - Remove the repeated assignment code.
>>>
>>>  drivers/pci/controller/dwc/pci-layerscape-ep.c | 26
>>> +++++++++++++++++++-------
>>>  1 file changed, 19 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c
>>> b/drivers/pci/controller/dwc/pci-layerscape-ep.c
>>> index 4e92a95..8461f62 100644
>>> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
>>> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
>>> @@ -22,6 +22,7 @@
>>>
>>>  struct ls_pcie_ep {
>>>  	struct dw_pcie		*pci;
>>> +	struct pci_epc_features	*ls_epc;
>>>  };
>>>
>>>  #define to_ls_pcie_ep(x)	dev_get_drvdata((x)->dev)
>>> @@ -40,25 +41,26 @@ static const struct of_device_id
>> ls_pcie_ep_of_match[] = {
>>>  	{ },
>>>  };
>>>
>>> -static const struct pci_epc_features ls_pcie_epc_features = {
>>> -	.linkup_notifier = false,
>>> -	.msi_capable = true,
>>> -	.msix_capable = false,
>>> -};
>>> -
>>>  static const struct pci_epc_features*  ls_pcie_ep_get_features(struct
>>> dw_pcie_ep *ep)  {
>>> -	return &ls_pcie_epc_features;
>>> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>>> +	struct ls_pcie_ep *pcie = to_ls_pcie_ep(pci);
>>> +
>>> +	return pcie->ls_epc;
>>>  }
>>>
>>>  static void ls_pcie_ep_init(struct dw_pcie_ep *ep)  {
>>>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>>> +	struct ls_pcie_ep *pcie = to_ls_pcie_ep(pci);
>>>  	enum pci_barno bar;
>>>
>>>  	for (bar = BAR_0; bar <= BAR_5; bar++)
>>>  		dw_pcie_ep_reset_bar(pci, bar);
>>> +
>>> +	pcie->ls_epc->msi_capable = ep->msi_cap ? true : false;
>>> +	pcie->ls_epc->msix_capable = ep->msix_cap ? true : false;
>>>  }
>>>
>>>  static int ls_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no, @@
>>> -118,6 +120,7 @@ static int __init ls_pcie_ep_probe(struct platform_device
>> *pdev)
>>>  	struct device *dev = &pdev->dev;
>>>  	struct dw_pcie *pci;
>>>  	struct ls_pcie_ep *pcie;
>>> +	struct pci_epc_features *ls_epc;
>>>  	struct resource *dbi_base;
>>>  	int ret;
>>>
>>> @@ -129,6 +132,10 @@ static int __init ls_pcie_ep_probe(struct
>> platform_device *pdev)
>>>  	if (!pci)
>>>  		return -ENOMEM;
>>>
>>> +	ls_epc = devm_kzalloc(dev, sizeof(*ls_epc), GFP_KERNEL);
>>> +	if (!ls_epc)
>>> +		return -ENOMEM;
>>> +
>>>  	dbi_base = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>> "regs");
>>>  	pci->dbi_base = devm_pci_remap_cfg_resource(dev, dbi_base);
>>>  	if (IS_ERR(pci->dbi_base))
>>> @@ -139,6 +146,11 @@ static int __init ls_pcie_ep_probe(struct
>> platform_device *pdev)
>>>  	pci->ops = &ls_pcie_ep_ops;
>>>  	pcie->pci = pci;
>>>
>>> +	ls_epc->linkup_notifier = false,
>>> +	ls_epc->bar_fixed_64bit = (1 << BAR_2) | (1 << BAR_4),
>>> +
>>> +	pcie->ls_epc = ls_epc;
>>> +
>>>  	platform_set_drvdata(pdev, pcie);
>>>
>>>  	ret = ls_add_pcie_ep(pcie, pdev);
>>>
