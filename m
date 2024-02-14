Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DC1854239
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 06:00:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=RNty4yVv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZQxS2gl7z3c1J
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 16:00:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=RNty4yVv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2416::601; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=kishon.vijayabraham@amd.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2416::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZQ184Pjdz30h8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 15:18:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mAq3YX+7DTY279auwMnj27kVSt2pzDBC8/iswqv+br/ZMdxmNHwl2+KQQKbiATKMAAEuUAAkeqrGB0tmsAo85rvftxB6LRhMjsqJ64ZLXqQGxWdMkcl4HDVEoCFJex2AznXi/hn0vxWDcS8lwfBb5BjRnLsw9Lmsp+GpfvoJFc1df/m4KPNMYpjzz6uTKBJYFrGkcbZ0K9QIED4KFQVzHt4WppQNKmBVgFp9IFOuslKt9EP0XMQ/05i8FHhawjEaywEr9BFC0NyJim2hH9kh+9Bfb/HlccrEeaFJODDdtzo1VAXlE24ddC/1JlIL0twp6ABzPmrFh691zYqMHinlNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rU2uQsJE00ho6XA6t1IulkKkiovT1fk000EV0BbvKbs=;
 b=Mkk+BTBzSitbPRVpwAub09X9aRruVzUsBNiZHj12X2gV7zDFRjrMPP+yOzEWVc7BibegPO2me5XvbuBBnvLmvuHCBbuF601W9OFeMLljgQ2rnLKe5Ce+k+vuQBtNSoHnDvUOJ+uv1xpWWc0c3IaITH5TGFUheXAReP14h5NgM/FyU5wmoTK/Rom4KFGjdrCs+fw0+Z6XXBQzgvFsEWTugjCzc8cnzsH7qRJk/b0yt1Ac4lV+3nXpkMQHBpyFp1Lb2slRFzHgla6XLXvL2cgocx+SefgFFvspESKG6aG9OiKIwj0wtyMKoRNm/n5Sko07BmlDKDYZfwmzAAFxy1yifQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rU2uQsJE00ho6XA6t1IulkKkiovT1fk000EV0BbvKbs=;
 b=RNty4yVvKxHeoyinQ258+wDNWeQ2RQHy3aKgpYmYxMWyPIrVfJh1l86sVY0lySC78P15wig1hdaEkP8WkAP9drs3+hyg0fNJzZ3r2AYBRiuoXGbKUhembYYHGQi1E0YIBPSvx2lRfujGBFBjsZdRcmLk+hH830dziEHy+32WDCo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5827.namprd12.prod.outlook.com (2603:10b6:208:396::19)
 by MW3PR12MB4412.namprd12.prod.outlook.com (2603:10b6:303:58::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Wed, 14 Feb
 2024 04:18:10 +0000
Received: from BL1PR12MB5827.namprd12.prod.outlook.com
 ([fe80::6bd9:3cc9:6012:5517]) by BL1PR12MB5827.namprd12.prod.outlook.com
 ([fe80::6bd9:3cc9:6012:5517%5]) with mapi id 15.20.7292.010; Wed, 14 Feb 2024
 04:18:10 +0000
Message-ID: <7a243a1e-6b47-bc2f-c538-b57db1c9c580@amd.com>
Date: Wed, 14 Feb 2024 09:47:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] PCI endpoint BAR hardware description cleanup
To: Niklas Cassel <cassel@kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>,
 Roy Zang <roy.zang@nxp.com>, Srikanth Thokala <srikanth.thokala@intel.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Jon Mason <jdmason@kudzu.us>,
 Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
References: <20240210012634.600301-1-cassel@kernel.org>
Content-Language: en-US
From: Kishon Vijay Abraham I <kvijayab@amd.com>
In-Reply-To: <20240210012634.600301-1-cassel@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2P287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::18) To BL1PR12MB5827.namprd12.prod.outlook.com
 (2603:10b6:208:396::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5827:EE_|MW3PR12MB4412:EE_
X-MS-Office365-Filtering-Correlation-Id: e9a49421-e5b3-4755-5cfd-08dc2d13f3d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	cdaub462hYD/s3XhuV1zRhqm5LbaYSJyedNpVPKjkL/X7Df3DpxWLrwdSeOb1WGB6SOQ1f4wnd9lSRC8EkjIe43V5hZatibk21PBJ7VHGtj77lhxisryMus0YA3HL/O5yjedLHJaDPKWNp+LH4tmlTOX9nrWkvTfyEq4gLA++F8kLNROBpG56pOfYOYdsab9Xdc4J031iHv1c+EJHq2fB4cmlNfn2s7Els4qVGgAu8lLaVgcWJiJSPQpvvcbJk8RDgsDN/w7GGAFmtk83EXoqHjQMMrExo2FT+et0s/smPMR2CC6UUvFXkFwSHdKz1ydUCTIm71jzC7soJ7Bk03WClzyQuMkEK1E3xJ+RB1OY8j7QkC76HmzxC3HD70xDhS5F/LxsOEymjHr/lepqB6gsXx1P/4DIQJc94q+U2qrCBoN1DtiUVN7BMBdf/c3Rjx9TBIJKaCZl9hcUrM9EQqAI5vergApVHq0gXyvAwyM5J5LQ32NWlSB4WchfuLIEF6+pcFaM/igtbI3+4E6a3gqztCkZ+Czwutr1qWLBPoY4ujr+WyZHeAE7bF+/QNlGVivTTKXItkl+btSZbHQlM/N8Q==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(366004)(136003)(396003)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(2906002)(7416002)(7406005)(6666004)(6486002)(36756003)(26005)(6512007)(6506007)(53546011)(966005)(478600001)(8936002)(38100700002)(2616005)(31696002)(66946007)(66476007)(4326008)(8676002)(66556008)(83380400001)(5660300002)(921011)(54906003)(110136005)(316002)(31686004)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?MmsvdU1LOU01WU5JTDVuK1hoYUpiRkkyTzQycTBnMExCdGltd2VUVTZVekFM?=
 =?utf-8?B?eU8xQzhQTzZjUERvamUrTi9qZDJQRy91U1VrTER0ZFpzbDg2b3g1YlJIVERx?=
 =?utf-8?B?Mkx6WGlWbVdFUmt3ZC8rMTQvZ3haeGp4R2ppSjFZdE5xZWg3U2lTK1c5RFVq?=
 =?utf-8?B?eFRsbExIdllvTzNUK2ZHR1dNQ3FvWFlEVkFzUzI1WHNNME1POUFjR2xZSU1T?=
 =?utf-8?B?RnRaZ1N1alVGWHFuYVdkeFJ1akF4NzdwNWptcFRJZEhGWWpZYWs1aForZDB1?=
 =?utf-8?B?VHJDdGdMeEhhWTFNeWJKenJJNU9GYy85UGdwNVNmU0dFSGNnVnMxcWY5YThv?=
 =?utf-8?B?Z3hNcjFzbXhMeFlweFI3YmkyeVo3V2hVaU4xVmZORnA2dDl4UFI3QUZSVlpr?=
 =?utf-8?B?NzZhQzFuRi9lbTZqd05JRVpPdXVJbDZvVGRYSUNLM2xqdEczZEpWSTRJbDFT?=
 =?utf-8?B?RS9aTHpKbDNyWm4yMzU5T0FzbjNtb2hjMUc2aDdNcFoxckNOamZ1YjlldUtJ?=
 =?utf-8?B?ZVJiZjhscDJTbGkrSkpjWnVDZVdFNW1hZnIxQjNlc3A5Rm82b0EyblJVNCtY?=
 =?utf-8?B?b2xGWWkyMnZkU3dHenRveWhsWm9YRWRKSUpVdlYrQSt5K2V2V1JrSE5DcUl1?=
 =?utf-8?B?dFA3d2FuY2tKeVErbFBNZ2JKOG1ETjlCSVN3RE5aVUpiSmlBSXkyc3czUnVE?=
 =?utf-8?B?d1F0SENxY2RDcTlVZmVTZFo2eFhDRTdycUxuSjNlOUJmT05nL1d1bTAyTFB2?=
 =?utf-8?B?WkdsWDQ3UHR0ZW1XU2Nua3BSZ1JIclA4OVkyQThsS2pZc3lLblg5VmFCRHRk?=
 =?utf-8?B?QXIrTzFKNXlmbFFoUG50emRoMC9jVzFuMHBPYzJMVUlGNEowdFU1azZlK3Ja?=
 =?utf-8?B?UGw3cjg2ZHFkaXFLVUxVTnVSdGRuSWVXaUwyOWR1eVBnQmtrUkorVURMbHlw?=
 =?utf-8?B?dXZjMytHN0V2V0dweHNrckRxSVdxNERkZ0xDNGpGdS9mc0dQOTZSMmRrbjVG?=
 =?utf-8?B?MDJCWm9iQUFxanZqMmEwbGRETGZsOWdTeUdsdWV2YlgrN0tXeGtSUHRMa1hj?=
 =?utf-8?B?NWxCYkFPdm55cDhJRDZGZGpVYkE5NzM5WjVHWko2UTJyYlcxSnR1cEtDMk5U?=
 =?utf-8?B?ZXA3bXo1T0UvVnMzTW5aVlVmeHFvM2dYckY2YWFMbXZLcDdycWVtS1BKR2lj?=
 =?utf-8?B?WW5TUDMyTVhDY1JXUTU1a1JoQ2VDVXRxOG9JbDliamxvOWhpQkNGVU5hU2F1?=
 =?utf-8?B?c1VvdDJiRFBVcVJQY2FNSzVBclI3dEVyUkxtWFE5czAzV1JVOUtLbUFTSkc2?=
 =?utf-8?B?amZuSzBVbmhwdDZpdllUZmxSYWlJTis3eWNBSm1KRE11OFR0MHd3cHBwemFF?=
 =?utf-8?B?aFI4TXNYR3RTdktsQmFpaElVclc1R1JZVVl4WEhYQ3JyRnpVUzBKTlF3STZp?=
 =?utf-8?B?MTlQMjFoRXQyT0xydW1ndEovYVBXZUJ1MzBlb2dab0JuSU95dGZOR2t6MmxY?=
 =?utf-8?B?WGtNdHVJeTVXb3RHNGR2VVlHUFpoNXROdWFKWGgzZ1p2T2FDUzBibmQ3WFI4?=
 =?utf-8?B?dVY1ZDNraElrSWFWTW1mTFM3NkVyNlVJSklEblZFckdxVnl6RFRKVGk4Z2Zs?=
 =?utf-8?B?ODVyMjNpSFJrNEZrUG1Id3V0cFhlOWhuZVFoNldEMS9kMTVNMzNCWWZoYXUx?=
 =?utf-8?B?dUtOVWJxamk4Z1hUbEs4TFBkZXFLNHk2WFZhOGFzUnpmbWlwRG01anNPU0M3?=
 =?utf-8?B?bGsrTzg4cmE3Qk9hQmJkR1NiSUdYTk82ais0OXhzOTlPdDJZSkVMc1FIWSth?=
 =?utf-8?B?OGZvRjYzRzRXc0hKWmREeXdyRmhpTGRjYjFIZFd5d2U0WXhoQmJiZTdveW44?=
 =?utf-8?B?TXEyMWhrbHQzR3oxNXJWYUhIVTBCZUxFeFhhcG0yY0RicVRUejFNcVBMeFk5?=
 =?utf-8?B?anIyZ2RwTlQxL21GVFhKRUc0T3IrMTZxMW9CeEFlZXR0UDN2eFFLUzNFdzdp?=
 =?utf-8?B?UDVKc2VOZERSNnNmVy9sZHBaZWcwREN0MUJ6cEswMkNEbXZxL2V5dzNkbUpz?=
 =?utf-8?B?OEQxNzhCOVpNNzJndVFzZWUvMXE3QmRQNitrb3Uwd0dzbXlSR1FZaDliY1Bn?=
 =?utf-8?Q?4WoiQdno9LmL13786n56rUw14?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a49421-e5b3-4755-5cfd-08dc2d13f3d6
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 04:18:10.1135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bl0UgFGDon3aNRDMqfzIhy9ciAWw6SL7J0vQleU7dlchoOOBCSAG+s0HP5W6V42fytiHisWJX06th5ujNiW8fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4412
X-Mailman-Approved-At: Wed, 14 Feb 2024 15:59:49 +1100
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
Cc: linux-pci@vger.kernel.org, ntb@lists.linux.dev, Frank Li <Frank.Li@nxp.com>, linux-renesas-soc@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>, linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Niklas,

On 2/10/2024 6:56 AM, Niklas Cassel wrote:
> The series is based on top of:
> https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/log/?h=endpoint
> 
> 
> Hello all,
> 
> This series cleans up the hardware description for PCI endpoint BARs.
> 
> The problems with the existing hardware description:
> -The documentation is lackluster.
> -Some of the names are confusingly similar, e.g. fixed_64bit and
>   fixed_size, even though these are for completely unrelated things.
> -The way that the BARs are defined in the endpoint controller drivers
>   is messy, because the left hand side is not a BAR, so you can mark a
>   BAR as e.g. both fixed size and reserved.
> 
> This series tries to address all the problems above.
> 
> Personally, I think that the code is more readable, both the endpoint
> controller drivers, but also pci-epc-core.c.

Thank you for cleaning this up!

FWIW:
Reviewed-by: Kishon Vijay Abraham I <kishon@kernel.org>
> 
> (Oh, and as you can probably guess, I will be sending out a patch series
> that adds BAR_RESIZABLE to enum pci_epc_bar_type in the coming week(s).)
> 
> 
> Kind regards,
> Niklas
> 
> 
> Niklas Cassel (2):
>    PCI: endpoint: Clean up hardware description for BARs
>    PCI: endpoint: Drop only_64bit on reserved BARs
> 
>   drivers/pci/controller/dwc/pci-imx6.c         |  3 +-
>   drivers/pci/controller/dwc/pci-keystone.c     | 12 +++---
>   .../pci/controller/dwc/pci-layerscape-ep.c    |  5 ++-
>   drivers/pci/controller/dwc/pcie-keembay.c     |  8 +++-
>   drivers/pci/controller/dwc/pcie-rcar-gen4.c   |  4 +-
>   drivers/pci/controller/dwc/pcie-tegra194.c    | 10 +++--
>   drivers/pci/controller/dwc/pcie-uniphier-ep.c | 15 ++++++--
>   drivers/pci/controller/pcie-rcar-ep.c         | 14 ++++---
>   drivers/pci/endpoint/functions/pci-epf-ntb.c  |  4 +-
>   drivers/pci/endpoint/functions/pci-epf-test.c |  8 ++--
>   drivers/pci/endpoint/functions/pci-epf-vntb.c |  2 +-
>   drivers/pci/endpoint/pci-epc-core.c           | 25 +++++-------
>   drivers/pci/endpoint/pci-epf-core.c           | 15 ++++----
>   include/linux/pci-epc.h                       | 38 ++++++++++++++++---
>   14 files changed, 105 insertions(+), 58 deletions(-)
> 
