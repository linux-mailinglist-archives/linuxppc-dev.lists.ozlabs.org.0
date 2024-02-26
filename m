Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8856F867E20
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 18:21:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=VZ3z/tnf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tk6qG2PZZz3vg9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 04:21:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=VZ3z/tnf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::601; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tk6pY5RPjz30YR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 04:21:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nqf/dc6XYPzG5qnovIL561zxXwoxyHj+BXAWC3gPkXKCqkJs7Q1pSvQEOHjtGpFevai6Xhb4m8OFC7nxwOuGi+j3yWP/QBDnltsG6kJIvcltNOf4+0D0x4y9xReUfXzDpAjec0qT+5LCahiKC6SBlGfyTJYuIVOw0RwOTN13oMPKzX5ujSDFeMdILnoY0kduW+Gx8xBLwOSp7NKtoS8JT24U/AkFhUdVh0/XyKeFGVn+VctY6w3a12zYwp7rLln5oehJknXO2slM++W1CRJLxsd1fkEhQDdJ5o4mLw7uhiA9e/BnoVAHJ7NM3vFYLaHjs76IIBr5ip3BYHU9rVVkkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WBxHNZuKo1Y2iV2CuKr4O2uc6J5H171VqLwqHaS1cro=;
 b=DHkWbFj5R+r9HbEKeSWHS150RtA2lumGxXgpup1jPrsnZNBvwzilhKSGS8Aqa0xai6Ej/nxMZn6lzPwkkV8Ysl6+rP6vEkqhelrGh/K65Tc3CubGupgv0lmt9TGQ+6LaJNE6v4DtSz7sEeSWwohoDhRQ3BSKr7xwSYeKpcqy5kKrBP9nP1fE+JOCTu4WNuCGbsSlkqGwflacqvtl6EkIQnwRZFf62Uv+Uqtxdm4fC7vC2jxz/QoSTHQMTCXXxZfbFEJqw63PqEi0xKP8RYiD4LBp7RdgwKXiNNvd624vWXZysTIfcIJl7EPqTOpBr7riRVFwvcWJ/tWtcz9pCjyPOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WBxHNZuKo1Y2iV2CuKr4O2uc6J5H171VqLwqHaS1cro=;
 b=VZ3z/tnfGughzppcodSHrLSnfVjmVZuqHasVHFp+nUq9cuNRpoNGfuV7rzMX515/WUWdrtsCDb2JWGhk+EU/YnZwFlX3IglMLorJ4CVbzBkgwSvZBUPrnME8iMFl+a6GoXTE5AXZk45RwEPfQQrXUOAKn7B7UWiPxaVq0WiEF6c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB8032.eurprd04.prod.outlook.com (2603:10a6:102:ba::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 17:20:51 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9af4:87e:d74:94aa]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9af4:87e:d74:94aa%7]) with mapi id 15.20.7316.032; Mon, 26 Feb 2024
 17:20:50 +0000
Date: Mon, 26 Feb 2024 12:20:41 -0500
From: Frank Li <Frank.li@nxp.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v8 09/10] PCI: qcom-ep: Use the generic
 dw_pcie_ep_linkdown() API to handle LINK_DOWN event
Message-ID: <ZdzIada1H95ike0t@lizhi-Precision-Tower-5810>
References: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
 <20240224-pci-dbi-rework-v8-9-64c7fd0cfe64@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240224-pci-dbi-rework-v8-9-64c7fd0cfe64@linaro.org>
X-ClientProxiedBy: SN7PR18CA0024.namprd18.prod.outlook.com
 (2603:10b6:806:f3::33) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB8032:EE_
X-MS-Office365-Filtering-Correlation-Id: d231346e-b3db-442b-2a29-08dc36ef47a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	d5cynMEtaZ8M4A9H4At3WKsqLgsu7Kgb0+oMF+d7MA4g2fmugaK7J/46l20jEf3ewtVvvm5JfsleTDq0x7J65uWxYdUxw3JM9WpCM4yRQfcJ8hkCfhFJ4rO0ffz48XNvUAPpaJtS/dsYi5cdb1wt28bZwvxjQgqwiJ6R2AIBtvnPnQ21JxMVRE1Dx9d66sAnXAtp6FgLuyzzWTGT1sThrDelKIfnHovtXMjxD4h17223LNEW9Su7H/F9qNkLHRGNmhJYg8a9vmdYy3RMXolxMfhI4/wpPZdA0PzuZbMxvkdUyRTgyyDH69ghXeQiQYBEgBkl5URK7Q7iRThvWE0yI04PfX/zLZ3FCNkbdUj7PefOPWM8bnbKsMfB6G3DVOYuAWCEj0rGuR1k03lNKXAsD0CZELzUI7jQ+q1GvIOtMv07lIOLSKgcCudHlY+D1gSi9NpsH053Fd1pEc3G0Z311jC7M77ZJI4DbxVxCWqKXX9NsUFMWxJSg7Rsj7wW/HRmbJViJUBEuAbm26ty7qBogL9VbzvR1OJG8y5vhna5UPB+JJfCk7wx5sHodiNh0AtoyZLF9lYaiWzvGQDPy7Q1IGPFatEckvZMEgPsXmoJPynoS2UrbDPjJc99Kg+vySmYFQ25RH/pNNQdVcQnxVzAgn/YGYAGpVNEJtFDPrxy17jXEQf/4gaab5qAaOTQJ5XoUDx08VmJv4h3SP9qenJxrjdwjzMS9dblOzCzOQEgNNE=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?huUkPVnpUyh0aM7Vpj2zyAhlYXP9oDGxLgnQakr5kwp6+PrtNJcZgr9X23pK?=
 =?us-ascii?Q?hVnA25mASHnuFlwCgKl6JSSwNEZ1d1yO0swFP4MkFnJLtzdPbphNU5e2PyAm?=
 =?us-ascii?Q?h+hDDV16wtTNLGHanPczqU48HCwpvr3d5Mg3zKEHRqLvmjLaJVHyIUa6VzTj?=
 =?us-ascii?Q?IIE1RqJd6Z2FbxoriEifwaKAaDcVh/8yhKRNjg7wr4zSxu4B5NCbGUH9b/m3?=
 =?us-ascii?Q?1OPkFypFd1hM8XAqrmE/65b0XJm05iz8SQoyJieJBxuPdnwvo+Id9fd3nl1Y?=
 =?us-ascii?Q?q7mx0SHLmnyW2l/UXIhfSOUmkXUxVI0yS7ydFtLwPEJzdJDJr4LBwK/LYfLg?=
 =?us-ascii?Q?0THzYQhdr+WTJh4+NO8Hva0x76dJCjrkPGtT39Swufnne6bgv8ir4VflqIOj?=
 =?us-ascii?Q?3e+Wah4YZoolwqk+OAnQSD3AHAbJ3NP6exM01Geg5QgKZFp/pibIrQHlMf0d?=
 =?us-ascii?Q?6ogPbEcH3MSo8gIuSAblZ9cQg5AeE6NEe1cCIXHqECVjcpZmPq+bz6eBN67z?=
 =?us-ascii?Q?XhP5Ob86xDYh4L32olVwaFGydJWzBqjnwsvR5mIGp0v7NB1dpPyOrmS+RdDa?=
 =?us-ascii?Q?KJfmIZ5EL4gVwH0SNQ5rs2YDh84dmOmWpmIjpW8SW2/h60fP5VWLyH52EES7?=
 =?us-ascii?Q?xUSrqgDKCe/u00J7pzbcBksepMNmcu8HkDEMiuC+ohw5+oqWveOcCrmAN4tQ?=
 =?us-ascii?Q?/HknUCE2p+KGgMpw1dDQAb5XbEywwLT+yCtaZG7U/VxYAS1fbLL6J/P9jdz0?=
 =?us-ascii?Q?codhTa9biX2PQGs+7i3wl94pWo5e8IvioX/wH1RNstFzCE5IFQPcmrkpPy1O?=
 =?us-ascii?Q?avFmBFGCUdmn011Z+/pJaHFViMe6JQltyk4j+kdSJRsCyyaQ7yLyLHPdoq6z?=
 =?us-ascii?Q?a3xaZ104PuGgNXN8/ccS3+Nnxi0babGJHqkE5j8cqudraGT57HM2BQ3MZ0GI?=
 =?us-ascii?Q?kPT+4LfRtLJbjXptcYUs4TxFjRVrUmngjnajzJEirGJYnCTE++Wk1JULwyLR?=
 =?us-ascii?Q?TwK6BLf/a/5KKPRscvDT6kzidXm4PtifEIcJworBd8CU4Mro6nfc0bUY9v4m?=
 =?us-ascii?Q?r2JOHMq4uxnIehng/ptQJotqzb0H7rXKpGT2j8cLTPFFGvA/72bYVqDnc+9Q?=
 =?us-ascii?Q?y7uLOQB1A3efwQWhNbRni2JvfSXo4HYqwsVDnLdXBe19kqAJID90ZV53Pwy1?=
 =?us-ascii?Q?40h4BEhLwowiJb2Uz0nDNYHUJhpGbZNbBGt+m/cFJBCwIImOQAF+onMG7O2G?=
 =?us-ascii?Q?Ctm1um6iIi3HIEb87CCF6BbXR1AEY4UcNxi+F/8a4caQiXPCQh593AJox2E+?=
 =?us-ascii?Q?UzyapEuOd6Wxsf5c3uLXt/OlARWh5BamX9x4PQlA9K1+UQrgAifwTWA2GCgq?=
 =?us-ascii?Q?B6UnL14AM2v7s9hNrnzzpfOw/97oVRJ4GHkzaj/y2qvQE9ZZ4mkkopTDaNyf?=
 =?us-ascii?Q?7Z00WNmLQLpJQJajl2F21gwI2waxzfrBYzD71yc70CSt9AG9TahFvUpk0EO4?=
 =?us-ascii?Q?ycbdqbePzWz+RDpf3rYMOEViStEJjbOoQegDkzRblO0mC7tvCeZAmutqhpV4?=
 =?us-ascii?Q?jNayz6POCTBY252sc+vQzviT/YYU5NqzV6GtZtoh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d231346e-b3db-442b-2a29-08dc36ef47a7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 17:20:50.9066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5qpDnloZGEdT1Wvh/qeTeurLfC/mYowsPCz603QEEtOFGsmbZQgZKFm+rZtpqnHIk4xKO/0F/OTenSFpkrx0pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8032
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

On Sat, Feb 24, 2024 at 12:24:15PM +0530, Manivannan Sadhasivam wrote:
> Now that the API is available, let's make use of it. It also handles the
> reinitialization of DWC non-sticky registers in addition to sending the
> notification to EPF drivers.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/pci/controller/dwc/pcie-qcom-ep.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> index 2fb8c15e7a91..4e45bc4bca45 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> @@ -640,7 +640,7 @@ static irqreturn_t qcom_pcie_ep_global_irq_thread(int irq, void *data)
>  	if (FIELD_GET(PARF_INT_ALL_LINK_DOWN, status)) {
>  		dev_dbg(dev, "Received Linkdown event\n");
>  		pcie_ep->link_status = QCOM_PCIE_EP_LINK_DOWN;
> -		pci_epc_linkdown(pci->ep.epc);
> +		dw_pcie_ep_linkdown(&pci->ep);

Suppose pci_epc_linkdown() will call dw_pcie_ep_linkdown() ?
why need direct call dw_pcie_ep_linkdown() here?

Frank

>  	} else if (FIELD_GET(PARF_INT_ALL_BME, status)) {
>  		dev_dbg(dev, "Received BME event. Link is enabled!\n");
>  		pcie_ep->link_status = QCOM_PCIE_EP_LINK_ENABLED;
> 
> -- 
> 2.25.1
> 
