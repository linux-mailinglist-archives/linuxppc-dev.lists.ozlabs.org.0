Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E39867D11
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 17:58:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=UZznTSeL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tk6Jv6ZbCz3vfg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 03:58:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=UZznTSeL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260e::601; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:260e::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tk6J948kCz2xFk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 03:58:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ODrLcScQRTcKU69FQeE4nbIChygtD6tTMSDYfRjO2xKmKMcg9Dn1Oc6lIYRJgnIcvdMjBxSPJE87BqttPz+y+wTHaxc68WLqz7wgotTRKp1vEMy8Ddoc7q00haO3NwVM6K8GFIEV1M5K+/+84qPZt6aFXHSQXmg/CuhddeQVjmznceds95924uviQ0qE1yFBIN40lwRIS6OORuIU+rS+4itpcINA8kcTJdTedAsVX7RR7cDlsruFcfR6XdoZBxy+ie8q0EGxshgaSczOg+/iIs2Vl2+S+lpC3HDaDYzMtAe9AVYusgGjeGh468edyMUJjmdc2/uyKs0pzVMt7ug8qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQkBszI2ikK0l+QFT5JOx10najA9lDtroWNOu5NtF0w=;
 b=hFtY0ChDxnO0Freq52+k7IUlkSUu9q+NdjoUYLnKdG+Scdt4NxMqeq8ZnwEljHfPhGnw72IGDLS8DCCY6sfCdcSbo6OiDkt7WqcsnW2R0MMVrrFAjtFAF5zY4ebV5L2Fn7gPkHiU0BF5lXJEzfYIb5hQKLTYizO60t2L3vViZt7T0t/CaftaYd2dhlPC+Zs4fyuERcQS+5p95bT0sS92ZzAphJ8bT8kvqgrFvH0LTiKnbkvVBfYfm1Rj/opQYg7uUXbXLKzHWoqIsG7w8tJKsQc1kMbtCz0imuZLIl63b6FQdARt13FPE8ZutuNmEK1eoWwtRbFXZZGupkN71DTh8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQkBszI2ikK0l+QFT5JOx10najA9lDtroWNOu5NtF0w=;
 b=UZznTSeL9sduGJAaPzgKeBJn0I4iNnaOzfQSPxn+6V+/E/SpREPH4mUhPAlRc8ONCQNwGQRWjUFNfUl9ABa6bWfy9ZJQo9lqlRb/gGSpmKV0K+JYNZeZDA4nQPBrspF2lzYwE9NuDnd2JA8/6WX7PQoZu4lYGJrelM4qcYrsTxw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB7867.eurprd04.prod.outlook.com (2603:10a6:10:1e5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.31; Mon, 26 Feb
 2024 16:57:58 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9af4:87e:d74:94aa]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9af4:87e:d74:94aa%7]) with mapi id 15.20.7316.032; Mon, 26 Feb 2024
 16:57:58 +0000
Date: Mon, 26 Feb 2024 11:57:45 -0500
From: Frank Li <Frank.li@nxp.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v8 04/10] PCI: dwc: ep: Fix DBI access failure for
 drivers requiring refclk from host
Message-ID: <ZdzDCcMjrNVFHg8S@lizhi-Precision-Tower-5810>
References: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
 <20240224-pci-dbi-rework-v8-4-64c7fd0cfe64@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240224-pci-dbi-rework-v8-4-64c7fd0cfe64@linaro.org>
X-ClientProxiedBy: SJ0PR13CA0164.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::19) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB7867:EE_
X-MS-Office365-Filtering-Correlation-Id: 15cfa343-e722-4ed3-4370-08dc36ec156a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	oYDxwvYIVbMCP5UP9QvEgguRitmD6JnblbZ+H9lJ/y5W4zuQzwyI0nnTk9cyM+FftFujMBtJgpGtS7F4un5bEPWJDks5MdZ06uXqML7VQXpWJMQitHUdpZ7Zf+w3Snxg9/ftBG4oMZD4OH75TGJw4BUfvdHa97hYUUUFq9DCmgcA3dVY3Oj4VJ+By2glBX1D2ZT/6w15IUqhlWvEQQKG6hGDnNMPXQjqtiLXpYZZDsGt+KrB3uz2AIPE+wR8jvJZi04YjDjLSxHncFzPj0ZbU8CA/zV+3s1a5PBmorQ393wRHZutNWi8iEzqXPgHVSHyvB+UHwByIFqx5JMmle1WVQ8oiqd3rZB7xTn08ESRvL21pbSX6FAlRJwTe5GCpg+mbpAmDU0ULl6vbyK1P01Aijgi2s099vTtnle/B2bjjp9AWybWr81Z5yXuU+gUVrz6hYvAvOyvNMbdhN5SlBJ+HghEuEUx+bALXMMpf6ApoCp+ong1xKI+sESnxthoBQeIVk4a1RPhqymtvKVJNqm5FOianfGMT+6YejusyiUYYdpEFjGKoawju3thxGEbceFPkSO3NFpGTgYz+PpizD2oFMlg8gFXwogl4QkTu7akCx3oyGWlMMMzZTmLRr7VlI+Qfz7MEcmpwV/rg0spyM0yDzrNjrAFLHJYgdnB1lMx/SZfQRdfuhUKtpxTO8b4yRXnVrmMpLhxGZm1Vc+CMiYr19XeDOOw5jYY3AI7joQ7Xds=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?sosAojay8Pl/UkzYaIi7Up108DIL0XKHS1dK8g+HO6CpQBEVyT+D5QzyAFNI?=
 =?us-ascii?Q?fdY6WCiYSCoOQDQtSNR2Eo2E+6DuCrRNp1MFEN2wMk2uJIuu9MYxb9ZbsfD0?=
 =?us-ascii?Q?3qVYIShKppzW3eHL+mBkZTGa6jMuakdKnHiGXSJ2iR0MxRBwwGL9nbBAxZkG?=
 =?us-ascii?Q?vICYYrmXJlsOy9f0wzs799pQZ6GYrl5BdBYMwsnuf/dc/EHt8iGAABp8/BSI?=
 =?us-ascii?Q?/NNuvwSZGqAW4w4mSGDCFawC4+yznZaEo1gaSItGrX4lszlT6z3oFuo5/nI1?=
 =?us-ascii?Q?5F8M85rpsa5QxiLA+xweHfn/82DZEeuikRO5gSlxjKFRXb2nTiqyl3EII9hc?=
 =?us-ascii?Q?HhwfXM0TEt4LJBHvdBPDk+k0IcyobbXylW9Dlel1h8+dipS3P0WId59dDrez?=
 =?us-ascii?Q?mcxFgdNrLK1whLODgqIFY1uAJn974IE8s9FB6iyRlct4mGFYpjci0edwYsba?=
 =?us-ascii?Q?UWcFm9X3n0AXLPU+f3hde0Dos97JZYMZaecAN8u1NT3tprgS+3qpDGwQBBfo?=
 =?us-ascii?Q?YTmoRV4lUUrsCke+g6+ngtGSJGEKU2akDV5QMcQVXVc8med4KK9zlM2+C1fm?=
 =?us-ascii?Q?CuReECPpGBKZnK81TKL/vZ+EFQCQ4qS/NGyr+gACk7NRUICNgXSOAHuK7NWE?=
 =?us-ascii?Q?0KQtxy7EfqxadNUMimBt0uSAr4hBnSkyZzjXlEc0JyqktsNWoMO0cXT0CXIv?=
 =?us-ascii?Q?dt+x+agwnWvS2LreeWMJY0mLe1a8uxT+VU3+A4JPSxCV/1flHG2+qglIqXDW?=
 =?us-ascii?Q?dJvy86C++G2/I6kyIcDoltXf0ae58svRo9k9xdsYHA2tm1DaeFmnBzRlsZhh?=
 =?us-ascii?Q?4ZEhRHzGSq/CZSg8nR/72NdpJP1jLcuuWP6bFxO/shYX7zflfKGiL4EjY7d9?=
 =?us-ascii?Q?ZwdHzJ/58qtlAgDbvFyP/wASHPJnVRcA0upYAx6orm7V1wPPZgj7OhlB1hHS?=
 =?us-ascii?Q?897dzsx889etzO1RD2Lu/OtRxHbAKzYWzibBr8Oe24cOgP2Qw8dn7nbqSCFp?=
 =?us-ascii?Q?s3bvWQxPhfvBmibzrH1he5aRfzzYYbmjUmZudm8c2hbsWnLlo3oSJQO2Uu8e?=
 =?us-ascii?Q?O+ioZbEPgkTkWMAJP08qYsanoj65iDG3RZyxJzc+nN43j6XwEK05kOVxoMwv?=
 =?us-ascii?Q?tek/rowVMwG2VX0KGS/ClRGfNaQhuqt+0nagAlZuF+bOhh4crEl2T0urZo+O?=
 =?us-ascii?Q?l1oOHNiqw2Kr045VtmY1vc9Y9XU2hA6Vmy+cJkCcY2r9ngW11l/5dOF8oQVQ?=
 =?us-ascii?Q?78K2H/MGya4Fw3bQ+qaQX/cVdyw9Mh1GVD//BkSU76aOw6iSqItO4WIxTzXE?=
 =?us-ascii?Q?rNnYXF9FH3/04GviVqU1efShFqcuI4hNQoUc2ZOoJgI43wOPN+/e2BlFkGtg?=
 =?us-ascii?Q?HjmronURTb9H5V6oq5bvi5KNF/E8VGORlJONL7Xv0ZYL9zp7BLrqA6sLKQUy?=
 =?us-ascii?Q?aQ5SLiRI4RaIlevdpV8Qk8Rkwkp/dBhiYR4aMuaQt728b9U5GSzwnWhyu39M?=
 =?us-ascii?Q?oruS+LjsFqLtAb7vNP1mCHyuTI4cj58Y2to7rtzPJQsD5oLmfgLipHsK4yc+?=
 =?us-ascii?Q?1g+EtN6raIU31eUECtaDpQ/ZYg9lgJK/7aoy3RgF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15cfa343-e722-4ed3-4370-08dc36ec156a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 16:57:58.1767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YktT+QhBbpNeBuDy4PRyTu+wrMrTywip6wolBau+hZLp9rSbuRSA9KoNXKtXfOFIWLnY9xQIJac0Vw481dJ85A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7867
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Vignesh Raghavendra <vigneshr@ti.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, NXP Linux Team <linux-imx@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>, linux-arm-kernel@lists.infradead.org, Roy Zang <roy.zang@nxp.com>, Niklas Cassel <cassel@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Yoshihiro Shimoda <yoshih
 iro.shimoda.uh@renesas.com>, linux-kernel@vger.kernel.org, Vidya Sagar <vidyas@nvidia.com>, linux-renesas-soc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Feb 24, 2024 at 12:24:10PM +0530, Manivannan Sadhasivam wrote:
> The DWC glue drivers requiring an active reference clock from the PCIe host
> for initializing their PCIe EP core, set a flag called 'core_init_notifier'
> to let DWC driver know that these drivers need a special attention during
> initialization. In these drivers, access to the hw registers (like DBI)
> before receiving the active refclk from host will result in access failure
> and also could cause a whole system hang.
> 
> But the current DWC EP driver doesn't honor the requirements of the drivers
> setting 'core_init_notifier' flag and tries to access the DBI registers
> during dw_pcie_ep_init(). This causes the system hang for glue drivers such
> as Tegra194 and Qcom EP as they depend on refclk from host and have set the
> above mentioned flag.
> 
> To workaround this issue, users of the affected platforms have to maintain
> the dependency with the PCIe host by booting the PCIe EP after host boot.
> But this won't provide a good user experience, since PCIe EP is _one_ of
> the features of those platforms and it doesn't make sense to delay the
> whole platform booting due to PCIe requiring active refclk.
> 
> So to fix this issue, let's move all the DBI access from
> dw_pcie_ep_init() in the DWC EP driver to the dw_pcie_ep_init_complete()
> API. This API will only be called by the drivers setting
> 'core_init_notifier' flag once refclk is received from host. For the rest
> of the drivers that gets the refclk locally, this API will be called
> within dw_pcie_ep_init().
> 
> Fixes: e966f7390da9 ("PCI: dwc: Refactor core initialization code for EP mode")
> Co-developed-by: Vidya Sagar <vidyas@nvidia.com>
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/pci/controller/dwc/pcie-designware-ep.c | 120 ++++++++++++++----------
>  1 file changed, 71 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index 1205bfba8310..99d66b0fa59b 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -606,11 +606,16 @@ static unsigned int dw_pcie_ep_find_ext_capability(struct dw_pcie *pci, int cap)
>  int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	struct dw_pcie_ep_func *ep_func;
> +	struct device *dev = pci->dev;
> +	struct pci_epc *epc = ep->epc;
>  	unsigned int offset, ptm_cap_base;
>  	unsigned int nbars;
>  	u8 hdr_type;
> +	u8 func_no;
> +	int i, ret;
> +	void *addr;
>  	u32 reg;
> -	int i;
>  
>  	hdr_type = dw_pcie_readb_dbi(pci, PCI_HEADER_TYPE) &
>  		   PCI_HEADER_TYPE_MASK;
> @@ -621,6 +626,58 @@ int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep)
>  		return -EIO;
>  	}
>  
> +	dw_pcie_version_detect(pci);
> +
> +	dw_pcie_iatu_detect(pci);
> +
> +	ret = dw_pcie_edma_detect(pci);
> +	if (ret)
> +		return ret;
> +
> +	if (!ep->ib_window_map) {
> +		ep->ib_window_map = devm_bitmap_zalloc(dev, pci->num_ib_windows,
> +						       GFP_KERNEL);
> +		if (!ep->ib_window_map)
> +			goto err_remove_edma;
> +	}
> +
> +	if (!ep->ob_window_map) {
> +		ep->ob_window_map = devm_bitmap_zalloc(dev, pci->num_ob_windows,
> +						       GFP_KERNEL);
> +		if (!ep->ob_window_map)
> +			goto err_remove_edma;
> +	}
> +
> +	if (!ep->outbound_addr) {
> +		addr = devm_kcalloc(dev, pci->num_ob_windows, sizeof(phys_addr_t),
> +				    GFP_KERNEL);
> +		if (!addr)
> +			goto err_remove_edma;
> +		ep->outbound_addr = addr;
> +	}
> +
> +	for (func_no = 0; func_no < epc->max_functions; func_no++) {
> +
> +		ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
> +		if (ep_func)
> +			continue;
> +
> +		ep_func = devm_kzalloc(dev, sizeof(*ep_func), GFP_KERNEL);
> +		if (!ep_func)
> +			goto err_remove_edma;
> +
> +		ep_func->func_no = func_no;
> +		ep_func->msi_cap = dw_pcie_ep_find_capability(ep, func_no,
> +							      PCI_CAP_ID_MSI);
> +		ep_func->msix_cap = dw_pcie_ep_find_capability(ep, func_no,
> +							       PCI_CAP_ID_MSIX);
> +
> +		list_add_tail(&ep_func->list, &ep->func_list);
> +	}
> +
> +	if (ep->ops->init)
> +		ep->ops->init(ep);
> +
>  	offset = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_REBAR);
>  	ptm_cap_base = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_PTM);
>  
> @@ -655,14 +712,17 @@ int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep)
>  	dw_pcie_dbi_ro_wr_dis(pci);
>  
>  	return 0;
> +
> +err_remove_edma:
> +	dw_pcie_edma_remove(pci);
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_ep_init_complete);
>  
>  int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  {
>  	int ret;
> -	void *addr;
> -	u8 func_no;
>  	struct resource *res;
>  	struct pci_epc *epc;
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> @@ -670,7 +730,6 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct device_node *np = dev->of_node;
>  	const struct pci_epc_features *epc_features;
> -	struct dw_pcie_ep_func *ep_func;
>  
>  	INIT_LIST_HEAD(&ep->func_list);
>  
> @@ -688,26 +747,6 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  	if (ep->ops->pre_init)
>  		ep->ops->pre_init(ep);
>  
> -	dw_pcie_version_detect(pci);
> -
> -	dw_pcie_iatu_detect(pci);
> -
> -	ep->ib_window_map = devm_bitmap_zalloc(dev, pci->num_ib_windows,
> -					       GFP_KERNEL);
> -	if (!ep->ib_window_map)
> -		return -ENOMEM;
> -
> -	ep->ob_window_map = devm_bitmap_zalloc(dev, pci->num_ob_windows,
> -					       GFP_KERNEL);
> -	if (!ep->ob_window_map)
> -		return -ENOMEM;
> -
> -	addr = devm_kcalloc(dev, pci->num_ob_windows, sizeof(phys_addr_t),
> -			    GFP_KERNEL);
> -	if (!addr)
> -		return -ENOMEM;
> -	ep->outbound_addr = addr;
> -
>  	epc = devm_pci_epc_create(dev, &epc_ops);
>  	if (IS_ERR(epc)) {
>  		dev_err(dev, "Failed to create epc device\n");
> @@ -721,23 +760,6 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  	if (ret < 0)
>  		epc->max_functions = 1;
>  
> -	for (func_no = 0; func_no < epc->max_functions; func_no++) {
> -		ep_func = devm_kzalloc(dev, sizeof(*ep_func), GFP_KERNEL);
> -		if (!ep_func)
> -			return -ENOMEM;
> -
> -		ep_func->func_no = func_no;
> -		ep_func->msi_cap = dw_pcie_ep_find_capability(ep, func_no,
> -							      PCI_CAP_ID_MSI);
> -		ep_func->msix_cap = dw_pcie_ep_find_capability(ep, func_no,
> -							       PCI_CAP_ID_MSIX);
> -
> -		list_add_tail(&ep_func->list, &ep->func_list);
> -	}
> -
> -	if (ep->ops->init)
> -		ep->ops->init(ep);
> -
>  	ret = pci_epc_mem_init(epc, ep->phys_base, ep->addr_size,
>  			       ep->page_size);
>  	if (ret < 0) {
> @@ -753,25 +775,25 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  		goto err_exit_epc_mem;
>  	}
>  
> -	ret = dw_pcie_edma_detect(pci);
> -	if (ret)
> -		goto err_free_epc_mem;
> -
>  	if (ep->ops->get_features) {
>  		epc_features = ep->ops->get_features(ep);
>  		if (epc_features->core_init_notifier)
>  			return 0;
>  	}
>  
> +	/*
> +	 * NOTE:- Avoid accessing the hardware (Ex:- DBI space) before this
> +	 * step as platforms that implement 'core_init_notifier' feature may
> +	 * not have the hardware ready (i.e. core initialized) for access
> +	 * (Ex: tegra194). Any hardware access on such platforms result
> +	 * in system hang.
> +	 */
>  	ret = dw_pcie_ep_init_complete(ep);
>  	if (ret)
> -		goto err_remove_edma;
> +		goto err_free_epc_mem;
>  
>  	return 0;
>  
> -err_remove_edma:
> -	dw_pcie_edma_remove(pci);
> -
>  err_free_epc_mem:
>  	pci_epc_mem_free_addr(epc, ep->msi_mem_phys, ep->msi_mem,
>  			      epc->mem->window.page_size);
> 
> -- 
> 2.25.1
> 
