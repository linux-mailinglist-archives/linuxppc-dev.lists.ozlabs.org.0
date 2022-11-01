Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8FC615639
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 00:43:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N265p4bG3z3cMs
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 10:43:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=gNvrJLhT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.21.78; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=gNvrJLhT;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2078.outbound.protection.outlook.com [40.107.21.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N264q46qQz3cC0
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Nov 2022 10:42:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UPzseU6nS66mNv6VVmqRr+Ns2Z1GCs+JrsJRmPnc2R/Uii8xYUbogDjPVPTmfaxhnB5DFrkqrTvPIvD4fzvoNmyHiSWLFnPZ7xy3qzCKoNb4P+twKmcE7V2xPXYjiLh9MhAEaJUAresuvye0rWIYgFCy/Bg9Xn77DnnsriTB/se5Jr/C13/+gaEtUI6HwSBz8+V3T0pNedIwUmbtHds9omTzHcM+Cpk4NxVHsfV2y4z4bfBdFXmmztiP3t3sD0QL9sl4enmB1cGFQuE7ZD274qPtYzAxsmLTxBFTN+Jb62oekWaOapPWWheTFgxmqy5TvoSlGWB8qySbK2J2E82nGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BBIzxVa4CvfreV3mlobdSYEzdP5FnqM1QW1y2rrl8Dk=;
 b=hpV7gFbl4bA5uIGKxU8wy1D3rUOtXcAoizpa4hA6XQQmlATVFZqs6aFNDCvwxUe5gSeKV9K/88QqVd3C3tvDV5F+mb9IvwcX838eabW6oxgWbj9mfTgoXOYj/5maIXbl0PyF6kGmwlPHGgp/fLX8gtqd8hzH3fNQmXM2ntlDJNfwqYmL0ZFrN/bWttt20SNdlTu6bPVoJmmtMnoDfqZqsxmivksbVFx92ul8SrCURqCr5zRPnfwfmsHk08ksahPFIczV1gBoeO2Yx4y4KZAnRs16QEspWlxxl5Dt2wQhDrF4prslGxtflSELXV+VyMYEh+g4YCbcmNYQUgXWvNhDcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBIzxVa4CvfreV3mlobdSYEzdP5FnqM1QW1y2rrl8Dk=;
 b=gNvrJLhTxu6D+n8JDLBbhKEJY//5mcuqq7/RKnfIxPhp7lsTd/bu0hUIsen5IisRZAPxyOwK7QCpQaTyY4pFTbf54hi/PaPXnaAC4e7qq65H+pcxDJtJE4Fx4G0EbWDYaU8DZyUfxVPMzw+rM0ytgloGsVyLKeOQBeTohZPaTrrLaYBrOZtvGBf9UpR9/ahfiniK3AIzugOF7zBev89MW10emSDoFT7cSvj0xte8BaxqGklljiexlogpd2IbqXpDoI97NHL86Qgz1Qdz01+k8V4rIRBz+xk48YEZND/caGyNo4m3Kzf9sSZR4hfMOlNJ0ryRxxB+6P+32b42GYG1Kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from AM0PR03MB4964.eurprd03.prod.outlook.com (2603:10a6:208:fc::33)
 by AS8PR03MB8001.eurprd03.prod.outlook.com (2603:10a6:20b:428::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Tue, 1 Nov
 2022 23:41:58 +0000
Received: from AM0PR03MB4964.eurprd03.prod.outlook.com
 ([fe80::bebb:9559:edd8:5e79]) by AM0PR03MB4964.eurprd03.prod.outlook.com
 ([fe80::bebb:9559:edd8:5e79%7]) with mapi id 15.20.5769.021; Tue, 1 Nov 2022
 23:41:58 +0000
Message-ID: <e2890214-ea71-999e-5733-5c6f109dac12@seco.com>
Date: Tue, 1 Nov 2022 19:41:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v8 4/9] phy: fsl: Add Lynx 10G SerDes driver
Content-Language: en-US
To: Stephen Boyd <sboyd@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org
References: <20221027191113.403712-1-sean.anderson@seco.com>
 <20221027191113.403712-5-sean.anderson@seco.com>
 <20221027230331.19C2FC433D6@smtp.kernel.org>
 <5f00ede6-10f5-c11c-ee21-54460c1f98b0@seco.com>
 <20221101200757.4626BC433D6@smtp.kernel.org>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20221101200757.4626BC433D6@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR1501CA0035.namprd15.prod.outlook.com
 (2603:10b6:207:17::48) To AM0PR03MB4964.eurprd03.prod.outlook.com
 (2603:10a6:208:fc::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4964:EE_|AS8PR03MB8001:EE_
X-MS-Office365-Filtering-Correlation-Id: 2af6ed85-4089-40e9-0ebe-08dabc62aaef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	di/7fI8eSmPKpzX7OuCIYOs6CKB9Qi5C2zbuSwjauIuwh1fhkNCsMIkHggP2rLdvdG/+7uidAU8IjntYr92Y1FbmM21VhLl7AqFRN//YUmSzoda+shIWm4+mFOEF+2lcI+mJ6LuAW0+Oq4xFXihAy+bv+Zjsv8b1mhioRYuuSvFLayGwOK+V6gRwoRalMkj9yHdHJSHKMNn+sAn8xI5+kjodzfPBA52PaJOxwAfOE44SJve4IV49aAIYxrk4pDdj/x50HP+A0MvKL5Vo7wbkWhGJDQRexl26V8TMiyi5+KwIPQgfcZ5j6kYR405LOcjFQJf3ASr5RBqMOalOfRcxciL8CwQEJto5WqDcIuuzeY9TKyY+vid2rk3hv4/q5A1FkauOCOk8/5Y3vln9NL/dLhotg6LefW+1Xqt+P1NKobKgX3ifRzzAJyX06MF+uMGf7acq9GrVvU+59KaPPepxUwB2133v4lAs/N8v/5hg9/1+61mOx8gi4hEKou4D1/MxD2c4J94vwLdVVslhkVTpBqFnVd71Xv6RbVod0czkyYxiwXhpYfYamYFHdS6zx04WQuVaJ4OVasXdsHYUZLNYm8w3aOTOGYQqC6jt5uizRNHUd4Fuqss1wcndpWAyBGshcCuz+R6nd1MPfr/GU93x36U12aEEW2NxB57NwiAccK03bEULvcWrAhmpq8omdAbhPLgEMi/z20ReDmCNN3ah7kbxK/8NEUXCNndZv2H6A0WTr+2RAH39cxUMbggg1QQ9jJ/TZiS3bBtMB9ckzR2G0kfeQmxA6nx5+qP0pgCUbslQ+M6CBw2cW3d22QDzIsmmh5F7ESHLyhYIWxq9pc1cEg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4964.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39850400004)(366004)(396003)(346002)(376002)(136003)(451199015)(7416002)(5660300002)(41300700001)(8936002)(6512007)(26005)(38100700002)(38350700002)(44832011)(2616005)(186003)(2906002)(86362001)(31696002)(4001150100001)(36756003)(83380400001)(66899015)(31686004)(6486002)(52116002)(66476007)(66946007)(66556008)(53546011)(8676002)(4326008)(6506007)(110136005)(316002)(6666004)(54906003)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?NTJOVFQ2alFwWnBqQVg0dzZ0OW1YQU1MNW9PaytaMTcxM00xbUN0N2g5MHps?=
 =?utf-8?B?V25QOVJOSndoL1h6a1EySmt2ZjFnMkVHbmtyZURKOVFUUlZJSkZxdlgrOVpO?=
 =?utf-8?B?S0ZTTlJYeW1wTnJreWJRL2lET3JrQjlFcWxqb3gxT1JQK294MEpKUktPaCtl?=
 =?utf-8?B?K2RiRDRMeHFRb0NDWlpiSjMvb2h5VGNoaytKMkJCTGtIOEdsOCtJQ1QwdFdo?=
 =?utf-8?B?ZThjSW5rRlFjWTFuczNaaVFiNWExcWp2ZkZuU0o0ekJKRTJMek1WTzZNTWo3?=
 =?utf-8?B?N0lLemJ2L0dnWFlITnZPWUx4bStxcmNZSTU0TDM2WkszZEY1YW81bnF0QTdq?=
 =?utf-8?B?NFprQlQ4ekZ6aHdqRzhyMFRPcXdOaFVYNHN6Rzd4SFo5Rlg0VUNYUDhMd2V5?=
 =?utf-8?B?TjMxSVVwNGtqTmxoaEt0NjBTWGEzbFQvMkpJUFhRb0czdFQrNHRTNDZDUnFH?=
 =?utf-8?B?d21ydXlQYWV2Y0Y5NUd4Z2NBZnlQUFRteWhiTXFIdkNHeHdZSEZtT21pWFZS?=
 =?utf-8?B?eGN1Ukl2cHF4MTZDZjk2YWlYZDNiZ1dyNXNzNW5lMC9FOVQwQXBoS1dSOWdy?=
 =?utf-8?B?ZDVwZStybU9LaHloNEs5eGF0ZEZpQUNoanYvajFMd1huN0F6Q2hwaUlwV0Ns?=
 =?utf-8?B?emJHWTFDMlRRbWF3YlFnMUdoL3l1YURiemtxVmd2UHNwN0k1UjNpNVd4cnVm?=
 =?utf-8?B?OGthMEhMTGJ1QkN0OFdtTmRJQU5Wckw0ZVJRSlY2TXZMRG41SVdIQlpiNTQz?=
 =?utf-8?B?QWJXWFFtdmdXdnRoUTI2dW9qQWROR21WajYxUHJMSEtUSFZmY212UjlIejVr?=
 =?utf-8?B?TGdkbFJPSjVleU8ybnFweVNzb3FqRUNEMjVvUll4TU03eUtLYnhJV1RqVmQw?=
 =?utf-8?B?VGhSQS9VbHN3N3BRYzR1V1NuN1lYMVlMOHp3ZzNmY2dHSFRHVlFJdFd0SE14?=
 =?utf-8?B?ZlFzdS9QOWRGRHNSYWNLank0SU5wakowRzZTdjhQNWI0RGpEQmpGbG1GcWVJ?=
 =?utf-8?B?RGFJTll4enBjUXVnM01TNXVqejJtUDRuUThYVVBUdHo3dVkyN3YySGc5UlNl?=
 =?utf-8?B?eU9YM3ZUZm4ycEJSaVdaNkh2RklCTDNlS2RVbzJSNTRiclk1L2NBdTg2Vkpy?=
 =?utf-8?B?Y0ZHaDNHOXdsQzU0WWRnb3Y0TTQ0cHYwUGs5UHdvK0lkT2FkZ3ltTlZ0UGNa?=
 =?utf-8?B?S0JkemdoUGhmVEwzZWhRUW9FblE4UkM1WGRLNTZUcHFLbDl5VFIxMml4MzU3?=
 =?utf-8?B?M2dub2ZtcEd2d3dRa08yUWcrMmxydHFpclltd0RTS0diRnV0WkxXVGFxbFll?=
 =?utf-8?B?dTlvMGZwN0FLSW80eXNNNmo5bzVwbHc4NSsvTmFpMExaLzE3d0pkRWoyOVRH?=
 =?utf-8?B?UlJlZGtvcCt2MnVrRUVTL3MzQjVuOGg1ZlJwcks3cGJwVHpKbDlKTEtBMmJO?=
 =?utf-8?B?RWZqekkybXhRN3NLSW1vVk9OeThNdUNkYjNCaHhKOHArWVNhajRsSnZXZWpr?=
 =?utf-8?B?WVc0dVFXYXNpK1Njc2dlL2dZUVR4SFcxdjNBSk1ZQXphK05oMjQ5Rk9JVU5P?=
 =?utf-8?B?M0Q5K3hwY0tWc0FtNGJYK0xwOUl6WDdBRGNZbmJ4NkFhZTE3KzUyOGl4dmpm?=
 =?utf-8?B?VUt1YndvcnJ5VGlGM2d3NHZ5UE1wSnBhVVZLc2t4TzlYdGk2bXVRRit2b1px?=
 =?utf-8?B?WnBMY2JZNFBYQ3QwMXMwcUluRHBxei9mTDNKeVBaUEwyc201Wm9Bc3k5MTBo?=
 =?utf-8?B?YStzbEhvUGpGQVB6OFJZcW5oS2dJQVp4NitzWFdYZ0l0aHdUNHE4UUFQZVBY?=
 =?utf-8?B?NGdKMkprTG13enV4ajE3MVdtc3VQRTNvWWFtbEVBYjVEMWVRM0hPZFZ4VVZx?=
 =?utf-8?B?djFEa3FKR2hmSDYyTktxcUpHN2NFY0NDN3VuT2h6K2dGTlc4Uk1tME5WVzhW?=
 =?utf-8?B?b2VLOFFzQWJYQ2dUSWVWRE9BVXF6UlFaaXpyS1F5bFFlQ2ZjcXNIVW04T3No?=
 =?utf-8?B?SVBPWXFjRDRNTmIvMUc1S25lVU9EWkNiTHNkcWVzZUErSDZSSkRDaWUyanVL?=
 =?utf-8?B?Rkt1NWJzbHIwYzdhYmlCUEtmYUY0V0VkTk81bk5KbEh1UTk1eVdxMmVBZyt6?=
 =?utf-8?B?RC9SeE1HY1dUMzZQU3lWYUtMQzZWbDhpdURnU1BNcEZZTG5DMGx3MHJjNE02?=
 =?utf-8?B?cHc9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2af6ed85-4089-40e9-0ebe-08dabc62aaef
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4964.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 23:41:58.8831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tKJeldCuoQ7/S65fxBzJ3oVhiM5pgHZ3/IPCAlYOQiTkwTO9WTdLBtac2kDTeAtCqqa9neebarSMEPvyUsJhcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8001
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
Cc: devicetree@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Michael Turquette <mturquette@baylibre.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/1/22 16:07, Stephen Boyd wrote:
> Quoting Sean Anderson (2022-10-28 09:13:57)
>> On 10/27/22 19:03, Stephen Boyd wrote:
>> > Quoting Sean Anderson (2022-10-27 12:11:08)
>> >> diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
>> >> index 853958fb2c06..a6ccccf9e39b 100644
>> >> --- a/drivers/phy/freescale/Kconfig
>> >> +++ b/drivers/phy/freescale/Kconfig
>> >> @@ -47,3 +47,25 @@ config PHY_FSL_LYNX_28G
>> >>            found on NXP's Layerscape platforms such as LX2160A.
>> >>            Used to change the protocol running on SerDes lanes at runtime.
>> >>            Only useful for a restricted set of Ethernet protocols.
>> >> +
>> >> +config PHY_FSL_LYNX_10G
>> >> +       tristate "Freescale QorIQ Lynx 10G SerDes support"
>> >> +       depends on COMMON_CLK
>> > 
>> > Does something not compile if COMMON_CLK is disabled?
>> 
>> ld: drivers/phy/freescale/phy-fsl-lynx-10g-clk.o: in function `lynx_pll_round_rate':
>> phy-fsl-lynx-10g-clk.c:(.text+0x444): undefined reference to `clk_hw_round_rate'
>> ld: drivers/phy/freescale/phy-fsl-lynx-10g-clk.o: in function `lynx_clks_init':
>> phy-fsl-lynx-10g-clk.c:(.text+0x5eb): undefined reference to `devm_clk_hw_register'
>> ld: phy-fsl-lynx-10g-clk.c:(.text+0x625): undefined reference to `devm_clk_hw_register'
> 
> Cool thanks!
> 
>> 
>> >> diff --git a/drivers/phy/freescale/lynx-10g.h b/drivers/phy/freescale/lynx-10g.h
>> >> new file mode 100644
>> >> index 000000000000..75d9353a867b
>> >> --- /dev/null
>> >> +++ b/drivers/phy/freescale/lynx-10g.h
>> >> @@ -0,0 +1,16 @@
>> >> +/* SPDX-License-Identifier: GPL-2.0 */
>> >> +/*
>> >> + * Copyright (C) 2022 Sean Anderson <sean.anderson@seco.com>
>> >> + */
>> >> +
>> >> +#ifndef LYNX_10G
>> >> +#define LYNX_10G
>> >> +
>> >> +struct clk;
>> >> +struct device;
>> >> +struct regmap;
>> >> +
>> >> +int lynx_clks_init(struct device *dev, struct regmap *regmap,
>> > 
>> > Can you use auxiliary bus to register this clk controller instead and
>> > then move the clk file to drivers/clk/?
>> 
>> I don't want to have to deal with my clock driver getting unbound (aka
>> the user has come and decided to make my life harder). Dynamic binding
>> will only add complexity in this situation.
> 
> We have 'suppress_bind_attrs' for that. What dynamic binding are you
> thinking about?

Huh, neat. That may save me a lot of trouble in another subsystem.

This was actually my main objection. I'll have a look at this bus...

>> 
>> I don't know how much context you've picked up, but this driver
>> 
>> - Has one consumer, and is is the serdes.
>> - Is not accessible from outside the serdes.
>> - Does not share any code with other drivers.
>> - Has bits in its registers which can control the reset process of lanes
>>    using the PLLs.
>> 
>> These drivers are tightly coupled to each other. It is very likely IMO
>> that changes to one (bugs, features, etc) will affect the other. For
>> this reason, I think it makes sense to keep them in the same source
>> directory. I actually would have preferred to keep them in the same
>> file.
>> 
> 
> Using the auxiliary bus is about getting better code review on the
> subsystem specific parts of a device. I'm not going to be paying a lot
> of attention to the clk parts of this driver if it is outside
> drivers/clk. Making this change helps with better code review.
> 
> The Kconfig symbol could be the same for the clk part and the phy part,
> and this is already split to a different file. It seems that your
> argument for keeping the clk file in the phy directory is because
> they're part of the same phy device. Do you expect to get clk driver
> review on the clk parts with the clk implementation in a different
> directory?

...yes? Actually, I was mainly hoping for phy driver review (since I
consider these PLLs part of the serdes), but you seem to be much more
responsive, so I'll take what I can get.

>> >> +       for (i = 0; i < NUM_PLLS; i++) {
>> >> +               ret = lynx_clk_init(hw_data, dev, regmap, i);
>> >> +               if (ret)
>> >> +                       return ret;
>> >> +
>> >> +               plls[i] = hw_data->hws[LYNX10G_PLLa(i)]->clk;
>> >> +               ex_dlys[i] = hw_data->hws[LYNX10G_PLLa_EX_DLY(i)]->clk;
>> > 
>> > Use clk_hw_get_clk() please.
>> 
>> I don't want to do that, because then I'd have to generate the clock ID
>> again. And why do we even need a new clock consumer in the first place?
>> This is only for internal use by the driver; the consumer is the same as
>> the producer.
>> 
> 
> We want to get rid of the clk pointer stashed in clk_hw. Using
> clk_hw_get_clk() lets us easily change that and not need to change this
> driver. I don't quite understand why you need to generate a clock ID.
> Are you concerned about passing in the 'con_id' argument? That string
> can be anything.

Yeah, but it has to be unique (there are usually multiple serdes on the same
system), and it should be something useful (so e.g. clock_summary is useful).
So it needs to be generated at runtime, and I'm already doing it when I create
the clock.

IMO this would be much easier with numeric IDs; generating strings is a pain.

--Sean
