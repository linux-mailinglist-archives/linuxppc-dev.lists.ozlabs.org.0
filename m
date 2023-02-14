Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B1B696BF3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 18:44:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGT9Q0Grpz3cdg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 04:44:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=ezST3nS7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:7e1b::62e; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=ezST3nS7;
	dkim-atps=neutral
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2062e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1b::62e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGT8P4Yrrz2yJT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 04:43:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nCBuE0FMFxp/e8qriTGTbnF0L90LxgZyvpxQVaXjo7FfAmqE3wARKay/gvvtfvyX+Lq1hnuKQ5hJ5648IGUt/osTxPXY7d5D0Sla4yZQwk2G20Vvfxf19gvaBuLjIeLPRRG8iw/+ZIbc3tP5mzjGIwtLJSGUDZ4bCN9GtLFWfApZvCXhq/DtsBu/uaoHpm0+6D3IBhdXDoHRDFEZK+qc3dGK17hOFbTLk693qcm8PFYJ9Ds/4V2M1W6XWfm4T0/jrIKawMcIaAWhUpS+AaNMZTZg78TEn01zeak+PBk9cRmpdQCHXiOuzY63MnNPJFRo2xlSUKHVge5hj/3Nzv1t4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g/Dv6CgFO/XpAZYvaf/OFsITuDAdIfG9hGnVeU/q4/I=;
 b=W2p6bBsW+TgJi3ppmGaOD0u2MSf6r4SIzNTwHj6CT9RJqHERrAIBinzDLZf3tZTbUY+s9/NrU/lKGquJ/SfRgSPMmR5eFPAitczWOa0HAYd953TzKIOKWSbIhn/ueWP6echVR5spV29Z88gv4x2X0C2aDCoIwUSwotn0VjnZm7nxRMs4f0bE+Z8UasKG2l3Fd5MtEqTVwxH8NF+wC9hlQF26u9Fq2RWf87gTS0bS8n0Bhtz1ztUpOQ9wUs+O9ao1nrUfnqP0i65GUhFWs4Gh8rQVJB9L/QEGHGqxPRpKHnX+klQAqW1ZDzznC+TDp/xS0H6O/dDAY6c849LL6jpjgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/Dv6CgFO/XpAZYvaf/OFsITuDAdIfG9hGnVeU/q4/I=;
 b=ezST3nS73aBDejjE02wNml8KwU8zfmHdBT6knLWh86dd9ZfSHp6AgiUKAoiY7x/jD7uwe08NySTEfBtRS9xDRClpIs7DCH10Ev98m7dSED2AhKKkwookxxFvpz9ktq8m7mCmYFnEYjUaIkSN/QgtoGaukFpq3i9SBKQ85cASOVIeb00RaBhNXMjzJrwcptmVkUfwFWInMfQajj1ng4dYt7ubBhEbxneqd8quEoNum9nKCjXBbENW1XKWthSBiqkwC5BXT2YxYIW/W9UPZrayvdpHvg3hzYIE/W6yZlEvEiqqvjrp9xy5WWlJdYPS9VnXrQDQGr19TEdN73cWOW3FbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AM7PR03MB6452.eurprd03.prod.outlook.com (2603:10a6:20b:1c2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 17:43:11 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::6b03:ac16:24b5:9166]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::6b03:ac16:24b5:9166%2]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 17:43:11 +0000
Message-ID: <45d1fdae-f6c0-ab19-f6a2-2499ead9289a@seco.com>
Date: Tue, 14 Feb 2023 12:43:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 1/1] PCI: layerscape: Set 64-bit DMA mask
Content-Language: en-US
To: Frank Li <Frank.Li@nxp.com>, Minghuan Lian <minghuan.Lian@nxp.com>,
 Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE"
 <linuxppc-dev@lists.ozlabs.org>,
 "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>,
 "moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20230112193621.1513505-1-Frank.Li@nxp.com>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20230112193621.1513505-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0165.namprd03.prod.outlook.com
 (2603:10b6:208:32f::9) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB8847:EE_|AM7PR03MB6452:EE_
X-MS-Office365-Filtering-Correlation-Id: fee584f1-e6a1-4ce0-c4c7-08db0eb2f11a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	xsQ2fpMJfajAwUXMA/0vVbft7crNpEvfaYRgF5kQPe9eNSyoTmwg1A4y2bgO1ixwj0liGVZqecaI9eDraBuho9dzKW3VLpN1eRfHls2tknIm65EVQbOSH8I7mzWHBeZYOIcYbQlDxWZW22FWshdtv4V5lVy2/6IlJJcYLq9fOJ/us9MbT2pQkkYJDOEf6/CTg440hggNmTdiOnUVNtYv160IPTXt//pgyth8PcR3/mxSDHZd7GLW5LJtXmLIX8iAqvVNfqw/iI/OIyJTrLPHw0qFLRkJmxOWnfBDxneXw01GqYA57izsSuOfRIcsWIIrI+ZRutcUm9ufhZ1ZlcYcDdNmyHp3Zqz5A7ufS95w+IDU1QaHHZ3GZ3cLumGQrX+NxTYcm5o4JBPTqOtGBivqG0ZLMcdFsUWYwgf0/3bslxDx4V4dIdBS9+EgiUhJWFSt/NFdBbMo9rMMzUvVS/Opu1RdBx3OH6ssS0OAvbf8KPaHA7Y5yjFdPxbsB/McRiK1kvn9MfhuTMNljq2hSFuWmiD1wadWxdtndOS82IQ1XlLwv+MGbjfzfJM8soKzKmJnBx4sqc/1HTnijuhH60/GSPDR8x6hs0MH0PljY565rpG24EKOj4IGQVM28vmoWJJOT1TDur4CzB9CXzOCF/4rS8b1jTFnAGxOOPkU2FavDBnv3EhPXV4RnB0wVD4pXjfW45bn1IqNGFXLmLYD6qEIKMGqVi+9Pa+w/Ic4M/OubArkQsXVQWl4SByAPU4ebCmgzNKUr9eu08W495DHGnk2PKdjez/cjvN08DQB3TefdlU=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39840400004)(346002)(136003)(396003)(376002)(366004)(451199018)(478600001)(53546011)(7416002)(8676002)(44832011)(66946007)(66476007)(66556008)(8936002)(2906002)(38100700002)(38350700002)(31696002)(4326008)(31686004)(52116002)(6486002)(316002)(5660300002)(41300700001)(86362001)(26005)(110136005)(186003)(6666004)(6512007)(6506007)(36756003)(2616005)(921005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?S1M2R0FVWnQvdkxNWm1kbEIxRU9IMGxRWFpuK21lUU5hMzZaeTROVjBFZXJr?=
 =?utf-8?B?QzBuSVNkTS8zNUJHdmJrS29Rdm5MRmhRQURKM1pzeCtDZEF3dTVJUm0vUlo2?=
 =?utf-8?B?dzFwOExzS25HcnFFODZZMGVPQWJudHJmcmIvcWlyODQzWDFmV1MrM2VSZ0Mw?=
 =?utf-8?B?OTdpMTAybXZ1QXlwb29IRkNqYTdYWmhMVXkrdGJQdmw0b3RSRmZFblJPSG9r?=
 =?utf-8?B?N09kRmRENlBPSkZPS280ZFkyMVpDVHJCSCtMclVKWk5iRXV4d2ZPOGRFTGZV?=
 =?utf-8?B?VDRMeTJodzFmRTA1TGRxZVhZeDVjRitPN2c3NzlWdUhjVDhJbXh6VUR0dGJJ?=
 =?utf-8?B?OC9iSEl3M0lnUGlxWG1ocnUvWXNrTzlQY0RkclBLaEZ1M1d2Tk16OUU2WG5s?=
 =?utf-8?B?TUdtV3RHa2wxSy9SVzdXZU9HTjBaSkt3YUwzNFI3elhIZWdHV1ZWVDBjZUtp?=
 =?utf-8?B?Zk9iUkdHYUUzZ2xmUi93d05zVmZFSEZBd0lzcGRtWW9OYVV6aWxSOXpUaFM0?=
 =?utf-8?B?bGpTWm1kNXh0b0x4L0kxdzgxREhSc01wZVphblQvY0FiSVBaQW1UYk5uS0Vv?=
 =?utf-8?B?SVBGaUlYb05zeit3VjY4OTIyNzRTVWdwZ04yNkdFZkgrMGZneWNRQ2FVSzBK?=
 =?utf-8?B?YXcrZVhuZ2NiSHgyVzBmZEEvNnV4aVVLTU5Fa2NoVHkxMGxiZFhCbGFYMHlI?=
 =?utf-8?B?TFExbXZROGJvNWZYeEU5b3I2SHo4dElJWDVuUnRFc1JnZm96cXdtRDdWTEEx?=
 =?utf-8?B?aUhHTFNNVG1STVc5WHBNcjhMMlZUS2NPQjNWd2FnRWhCd2NjRlFYNnFRQ01a?=
 =?utf-8?B?VFNUT1R6WlNieXI3SFhQcjgyelhPUStVaUUzTlZYOGw1azVBOCtxanNNV05G?=
 =?utf-8?B?VVBOdHNnY21CdnQxOVdxY204Y2pxSldwVWRJVDdkQjJHWTMzV0g4L3hFQ2E1?=
 =?utf-8?B?RzYrUjViYjl3UnlMcWM5YW9MODJ4ZnFDd0FwRFhwbXNKcFJaTEQyeC9idDZV?=
 =?utf-8?B?bFFNZUVmYjVSWXhYdTlaZTR4OHorbStuQkdydDJSRjdRdlBFV3FhQjJ6eUNC?=
 =?utf-8?B?MFB1akMzSmVqNU1yWExOaWpGZDlqR01SNHJ3TFFpc2RrRysxR2k3bVRlNzAy?=
 =?utf-8?B?OHlMN3N2S000THQzZ3dnek1SNmdMMVMyVXFkVzVzdStWVHBPOGRIcmIzSlE3?=
 =?utf-8?B?ZnhNa2xiMUtiaGxtNDRYemFiSGRtS3dOaklNSzZIL3EySzB6L3ZmbXdlS1c4?=
 =?utf-8?B?QVQ3WGxOcEtBY3NLaWJ6QkE4YWNrS0cwcDEyVzVvVnV5MHcrdUExano5QUJV?=
 =?utf-8?B?YVVHU094aERHcHB5bUd5Um9uYmtEYVZxTmZmSnBZU0w2b09xMFl4YjhQUlU4?=
 =?utf-8?B?N1J2V3lRd0lSTjJCRjlJTlEyS2FUa3VTVWREc2hHUTBQZjE4elhQZjVXVVVS?=
 =?utf-8?B?dGtodU5XVzllOXdXSjAyUkhXa1QrR1hBQUNqWFpiMzVleHpqUmVTVU5RWC9p?=
 =?utf-8?B?YVdUWkozNHdSMDlWRUh4Vzg3S1JvcUVWV0xKeWFkZ0FRb2pyOWFGOUprUTRz?=
 =?utf-8?B?SWVWRkFIeVk4bmU2YU1oTHdSV1BtRHdGVXdnVXpBZnZmbWtTd3kvNEpaZGd4?=
 =?utf-8?B?alJpdkVZaEppNzJKM0JBSTYzbU1ZdDN5M1MrdFo2K2J0ajhLSFVFeERoM1F3?=
 =?utf-8?B?SWtpWnBiTFpxbjE3NTJDdGlWYlZYamVlOWVjRDBYZmFveC9uL2QwcFpJL2lC?=
 =?utf-8?B?TUZwT3VuQTFpZlNpRGVFT0E4RGs1OGtRNnJDdjhPMytTamtDRUV4eEI4UUNQ?=
 =?utf-8?B?cTRXd1N3V3RsVndjNTZ0Z0JXVVM1dFhrdVhTWC9qYmswZnJndDR6NUs0WU43?=
 =?utf-8?B?MEhLMUFFejVyUnNZSUFCZG1QejlpS2xlenJPNWZadFJYUmVBZW1ya243c1A2?=
 =?utf-8?B?bnV6c0lVWDBHZHByWDI1NTJoeGxjUk16TVJQdkdiRGdkVWhPbjg1NVNjK1NB?=
 =?utf-8?B?dG4wS1RSUWk3bWR5VDJmTHA0ZHpoQ3ZTaDQwazZxY2FoMDh1OFRVeEFvM2Qw?=
 =?utf-8?B?VE5LNjNISkdybjIzY1BJVFh1V0dWY1Z1UjdRdU52N05SRHlUWFQza2swczlC?=
 =?utf-8?B?eXE2Rlo4R2pXaUUxeUppYWNoNkg4ekVDZTVFRXRTVVluVXpIR0ptWmx1UFo4?=
 =?utf-8?B?Wmc9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fee584f1-e6a1-4ce0-c4c7-08db0eb2f11a
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8847.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 17:43:11.6493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S6z6e/i4BGBrJmY9iUgLVN+ANkChG6H/vdIWmmlf72xlx8c8kSYRJmpMi07SvBgfNa1TEQfyxVR8F1vCpuZGww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6452
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
Cc: imx@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/12/23 14:36, Frank Li wrote:
> From: Guanhua Gao <guanhua.gao@nxp.com>
> 
> Set DMA mask and coherent DMA mask to enable 64-bit addressing.
> 
> Signed-off-by: Guanhua Gao <guanhua.gao@nxp.com>
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-layerscape-ep.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> index 1b884854c18e..c19e7ec58b05 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -261,6 +261,10 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
>  	pcie->max_width = (dw_pcie_readw_dbi(pci, PCIE_LINK_CAP) >>
>  			  MAX_LINK_W_SHIFT) & MAX_LINK_W_MASK;
>  
> +	/* set 64-bit DMA mask and coherent DMA mask */
> +	if (dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64)))
> +		dev_warn(dev, "Failed to set 64-bit DMA mask.\n");

Isn't this mandatory? Why not dev_err_probe and return the error?

--Sean

>  	platform_set_drvdata(pdev, pcie);
>  
>  	ret = dw_pcie_ep_init(&pci->ep);

