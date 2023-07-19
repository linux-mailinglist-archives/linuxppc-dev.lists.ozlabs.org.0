Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C41759EEE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 21:46:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=CBZILmta;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5mXY47dpz3c3l
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 05:46:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=CBZILmta;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0d::61c; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on061c.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5mWc5mYPz2ytP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 05:45:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cHxp/2o+BN7IoKg+bjrbOWM2gsNAcfeu/Mm5Rwpcgl3coGdeApXJwJq2+2NXh+L33xTRv90BIRyL5LPDawtSr8gWX5LSIoMj9+rLoZ1DMcbLI+LA4P3Ud2YF6unRe5Xt9HONsWvjgyQA7b/QqGbHGODjDPW/5rFJWoObrNqe5Pa0SsgqV8vfPvQgx7ufIQCx4Ru6MzkrTVWeDfPGQ/TGMStiL1PXn0Xe4Tkz6g1i+GGQSYUTYQlwEs3EMKJtNpGo34BI/Pt4z4uJiGN/1vKT0hOMJ/COgaOWXuf3+U/2GsHYn0PzTvJ/0mNS2GBLoKQYPt/y/RlYdlixyuAMfgmewQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n8PbF8S+sZQj9kU6VaGB8+VOwI6Yhy/P1Qo9pjeN4PU=;
 b=VanP5aELO0lCtEzuIWNp9uUFSOW3EjWw3t9w3o0mF+/418DbMEkCCFOg4Z2dJjQ/qEUHrsob944mn860sky4QmXz4hqKdZOGD2FCm+fq85Sk0m9I5SJl/J1cPSqTywkDh/3hmPrNQg5JjH9B49XSpLH/G4lklCK/Dh89a0xDYjYQuvut0jpVlz3WY+Ux2Evz7/lyQtfbSkt2kq2sZz1NLARHLp+wIl4Xvh2SbrJJShCkxagIcXGhdcDkCHoLoq8tTyIxSpVlXg164/tuWtiQs/x5WoIMmt5vbmxxy9AGx7YLgPkPJqtA3UDuUA083GFqR+u+iPoVOt2LlCTUJGNcew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n8PbF8S+sZQj9kU6VaGB8+VOwI6Yhy/P1Qo9pjeN4PU=;
 b=CBZILmtatef51DgKyEks/4Ftu/4eI0eJFXHz4rk4rQDRcV9fd78hDtJx/pNvg6PxxAhEMsN+Zx5NG5OkFGs5sOyySAVmCq7tTX+mPaFBYAQ28E5emS/O4tAQZuaD/tMsIVuh577kT3u0pBzMe5MCqKLFrPm9MeAakjIXXCnwCWI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by DU2PR04MB8792.eurprd04.prod.outlook.com (2603:10a6:10:2e3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Wed, 19 Jul
 2023 19:45:08 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::d0d5:3604:98da:20b1]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::d0d5:3604:98da:20b1%7]) with mapi id 15.20.6609.024; Wed, 19 Jul 2023
 19:45:08 +0000
Date: Wed, 19 Jul 2023 15:44:51 -0400
From: Frank Li <Frank.li@nxp.com>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH v3 1/2] PCI: layerscape: Add support for Link down
 notification
Message-ID: <ZLg9Mw/FvmMdNLjX@lizhi-Precision-Tower-5810>
References: <20230719155707.1948698-1-Frank.Li@nxp.com>
 <901fdc6a-a560-a431-adc9-aa73d7f69e7a@web.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <901fdc6a-a560-a431-adc9-aa73d7f69e7a@web.de>
X-ClientProxiedBy: BY5PR13CA0002.namprd13.prod.outlook.com
 (2603:10b6:a03:180::15) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|DU2PR04MB8792:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e6f16d7-2b0d-4d7a-9f98-08db8890a5ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	O5dNhDMqtbhRR2yEgxbXQW26olbQMg9KnhjHbXUtXb5RdamyK4ptcuvMXtkEgEAiPxbd9YE1g1mkYZP+WT9lhETAwcZbVsdN+/dsansgrolm/Oa4PRW4lvO3DGa0pAxHef5z8C/YcAiAX0YnZ09gPQn+zEbdPo/fKHOGqwLRIbCuCYm+y4dvypqqUne/copG2UXrZs8k69utUemst0kdLPzqU5lQE7YSk0FTZQez2YE6isBCIovT8+AjyzudDH6iS9zBv5PPU724LiQ9SXRb67OWSEl0afRAE5JbCY7Ho5b75InPgaMnlSPhckLGAD1KeMYe4+ip7Ig2G8074fbwl/1BlscOZ/IEVYOeE/81VtgH3UhlrOkx+DSFAsRz1pUzThbzG25VpkL1T6hMyYaYLSTxjsIoGyY6zfg9+zbJsKyI43shDjWo7GPF7U4eglqaa8EwK+N2t+dCSwBZca93aKrXUrM2R/b005xRLOkQLEqzoGdkzY4oZmdqN59pD/DQQEm5hD8dA68xBqGIkOz8lolzcwtdAcGipo3Aee52Wgwfotn5F5Jvq0Hf+QBBspFJ+Ni89EnMTWWm2sziTFWXxjJ0+mGmOcv5hJARZfBHcSSD+Tme62CYOp2ZhpihQ2Ye
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(136003)(346002)(39860400002)(396003)(376002)(366004)(451199021)(52116002)(54906003)(478600001)(186003)(6506007)(26005)(6666004)(6486002)(83380400001)(66556008)(66946007)(9686003)(6512007)(66476007)(6916009)(38350700002)(38100700002)(4326008)(8936002)(5660300002)(8676002)(7416002)(15650500001)(4744005)(41300700001)(2906002)(316002)(86362001)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?dW1MVkJnNlc4RGZmamUvcHdBWTNGWk1Bc2pnWGd1NjNVbEhtSnd1MmhNSUdy?=
 =?utf-8?B?Vm5QcGcwYjZnMEE1cjhyZ08zMFlwNUtZVmROVkNrL1VQK0JuUUJKblJZT0k3?=
 =?utf-8?B?UUdhbFBXQUZXWTZsNU5HTVhscGJFSFRkemE1R1RmeDl6eTdVcU1aOUFYbWJJ?=
 =?utf-8?B?V1YxaVAyNmdMS05zZWZ2dUZsY0ExcS96TndjR1JReFhJeXRpRHYvUTJMMSsw?=
 =?utf-8?B?alZSSXlEVkhYUFBpL1UzWGJUcTJSTlAwdWRNWDdIQ20zY1BteHFVTHhkak55?=
 =?utf-8?B?V3FKeWNwWjh6TEJYSlZvdkUrN3FEcXV0RGJQQ3FWdUJjcitoK1FkZnBTWnFS?=
 =?utf-8?B?MEpkK3YwejUyT01Vd3RQVkhoY09kNit3U2xwODJSMHRFZWxRdDZISHVYTjBq?=
 =?utf-8?B?Nk9rb0dCUkhwd21MaFZyRWVZOW1XdWZLVDlpbyt6OVBWZGF5eTFmTjNJdzVM?=
 =?utf-8?B?T1BBUzhSTnRmMjBrODgrQTBieXp2WUswbXV6Uzl6VFlBb1dHT2JnQktVdE9l?=
 =?utf-8?B?Snp6S3BzaGJxTWZ0QURyY1g5QlF5VVdUb0JrZmdoSFdZMWM3WTljNForZmdh?=
 =?utf-8?B?ek4rTzFSbDJrcFhMUzc1OERrWjF1YlM5V00zRzJuMC8wdFNKcFJNVC9oQXNL?=
 =?utf-8?B?STh3UWl6SHJ2VjNUQzVvVUc1UmkyUzVjeWc0aEZlMFkvYUord1V4NWZqYWZ3?=
 =?utf-8?B?MjVvS0pkbldydWFBL3ptZGM2M0k0bDFacW9jcitXRGVQMDZGVVkxL1cvS0Fu?=
 =?utf-8?B?ZkFvMC8xTmFrNTBEdllCbER0WmFhOFp5RTdSbFFLL3BRQi9LQ3V5MHZ3Q1pI?=
 =?utf-8?B?bFVONm0yWThqUXZxc0NyUUh1aVJIbjkrWXRYL0tJQmI2cTJpblFMd2F3VHJk?=
 =?utf-8?B?QzRwTkNsTU0zay9KMDM3VGlUOWRINFpkNkVuTXc3M2pXQUEvaU1UQ1BDK1Yv?=
 =?utf-8?B?RHNVWmo5MjZzd2cyeDY3SHpRVUdRNUY2d3VNQzd6cjNuaEZ6TkJtRGVlTzF0?=
 =?utf-8?B?MWJma0JWcldTdGEyWnFiRWJIMmltRjNIMzkwdzNpTW9nR0NUU2VqSDk2QWt1?=
 =?utf-8?B?NVFrczFPZGRVV2ZNNkVhdTdFVjM3aVRHajVGR3hoSllUTklQTTIzWGtpekVp?=
 =?utf-8?B?bk5tamFLVzN2TUxKWUZqbGFmZm9Db0Zuc2tndmV3ZE1NYzdHUEhaTXFLUW9Z?=
 =?utf-8?B?U1BLaGswMVFDY1JlYktBNVcvNVI3NVQxSDMvOXZ2UFo4T1BKVmwwRCtKTGhs?=
 =?utf-8?B?TXBuaEltWExjTitNTjN3ZjkrU2txbjFiL0hGNUd2L2owQy9hSmtSbjlaQkg4?=
 =?utf-8?B?eFYvSlhBM1JNZ3QzMXpOVlVyUXlmakRBY2QzRmJER252TFVKRGlaemZRUTF5?=
 =?utf-8?B?ZTRzMHZkQVRFQ1J5WU41R1pkQlJNQUlMdld1Z0dlMFlzcTd4alRsVHlUOGcw?=
 =?utf-8?B?NlJvYmJpQ3M0cFBHbGh2Mnd0NGFlZml6VklVREdxeE5qZ2xzVndud1lYWFZX?=
 =?utf-8?B?cjZQSHNTSkdqQ01IRDhYd1lFdFpsSS9oekFsaklERWlML01wQ3hJcC9ZcEFW?=
 =?utf-8?B?ZzduQldqdXRFQjdrSmJCQlFCMEV1WEh6QmdDb1o4azNkSGwwQXU4cmdzSU8w?=
 =?utf-8?B?QS9ERFp6bUVia2JBd1lqcXoyMGdEWWJ0SFNUVm9jTTNvS20rL0h5L2pFOTM4?=
 =?utf-8?B?MVhOOXBWbzdROW96VkpXQnlQSDdGam90ZUl4dUJubFNIMk45OXRLT3QyOGty?=
 =?utf-8?B?OHBmZ2kwMC9SRU9CYXNXSDZEUmtTYkxCbzBxUXoxZWlWUFFRMytmTzBvK1Vu?=
 =?utf-8?B?bW9HREFIcmsyQU9GREdUN0pEbXFiQmxhRmxsUFlIY3FRMFI3Q0NMSHdpeC9m?=
 =?utf-8?B?eElEU2tPK2FyQkU5ODlBVkdWTysyUkg2cmVtdlBabDBMbENYb2QzL1FteVMy?=
 =?utf-8?B?dG5TWERVeXF2NUkxbFROalJLeHRhUTRoSnhzczhMcVpIQmVVR1V0SE5GOVBm?=
 =?utf-8?B?dkR2eTJJQW1GUFdxdUtoVzRhT3czd0RWV09IZmZPMUFScTJEVHNNRkxKcUl2?=
 =?utf-8?B?NDVxa2szblhRbXpqb2tWNTRlaExNSjRic0o3REtHSFZ5T1B1YUNYNGY4VGxD?=
 =?utf-8?Q?BTEA=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e6f16d7-2b0d-4d7a-9f98-08db8890a5ea
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 19:45:08.7322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: esJpOleAmvHF5hVq8FhooU21x5jdL06ng3VDEeE0f3R4uhvbKiggw/v0N8DQo14Lw9YO5aC1vETi5Bqw/1t+cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8792
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
Cc: Rob Herring <robh@kernel.org>, imx@lists.linux.dev, Xiaowei Bao <xiaowei.bao@nxp.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, linux-pci@vger.kernel.org, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Manivannan Sadhasivam <mani@kernel.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 19, 2023 at 09:27:23PM +0200, Markus Elfring wrote:
> > Add support to pass …
> 
> Why did you omit a cover letter for the discussed patch series once more?

Your comments is 
"Will a cover letter become helpful also for the presented small patch series?"

According to my understand it is optional. I don't think cover letter will
help this case. Patch 1 and 2 is that independent at all. 

I sent these together just because easy to test once.

Maintainer can pick any one individually. 

Cover letter just annoise people here.

Frank


> 
> Do you care for consequences according to message threading?
> 
> Regards,
> Markus
