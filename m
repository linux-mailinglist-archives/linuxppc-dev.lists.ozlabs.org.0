Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EC4611737
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 18:15:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzSLr6WCCz3drh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Oct 2022 03:15:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=NicFxIT7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.105.88; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=NicFxIT7;
	dkim-atps=neutral
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2088.outbound.protection.outlook.com [40.107.105.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzSKq14VXz3cGF
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Oct 2022 03:14:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mwTr3ue7u5bOdvzGth8eWGHZ1JlwdpVrG2ytOIBeO4NxcnibfYXm9tzs/FcTNkzAQg2Co4T143b2ELkYvotuumdAqsLmQKvIvH6yArfuzOh5ppmu3d6J2uWV7jqVNzYBp50OZaCFrlYDg4NtzxdsS3wn9o7qK24nnXOltSm7uYFifMNtc6w1wQC+qWmXyx/LJ4iZmcbBtj+RetnzDDQlIsZL+N3IT2eILUzd914+TXW1Uq5Ni1BNxUmEW1Xjw64ETTEV2jDvcASImD55AJWOCwcuDYn6Tjujtd4FfMwE4EvCnLMbnNUyi70V5PRNwgUYP27BYWRLygt51jo0/GvRpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PPJqyYcuQp9RA7SqYWWSz/CqCnMmTTWIN5HFvd6pvWg=;
 b=gcO6ercP70YPA8bNWkBfxiY3M5wXDOb2H3nh0BN7NbPErTm+nsonHG0K9k+o8f1rLz+0+dfbCHvwCBlkFSVNBZxSt9m8KYtyB8/NAED/lZdqgpzIqbUqG7MWOheUSNREYKktxHDwOZF5X+NnxyDy/TPuKEXOMRwUV425i6o+O9ihkG3yU9NeI2e45lMNZ4lLKuUByKhAFQqVMHEVWEkZp0XVd2joL5HThBewib1oCtgID3xHJKbtAe3SRJcpBfaVA0dgb+uWx01FwyZACD9pkcEpACgl7qjz7dLGpQ0t3uxfyQI2t50EUBN7eF8oJ81L/5kNKo+9xJlwubLJzeAqxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPJqyYcuQp9RA7SqYWWSz/CqCnMmTTWIN5HFvd6pvWg=;
 b=NicFxIT71uKm4T2bxID9XZkaOelafKZGH0Q9R7oPdPApsWPs/RvlY7l6RF4PyraSdz5RIXWM3eEaOMNBFgIx0KNLcI8avdZiDhwqMU7heSIwiIYDQRW/c5ViXKf5YR05/KgmlKy9UesvRn0EqasntcbwJOKE9E/JRtA5ggQ9HHN1fIJgVIWblOIuuEOtf1QRJh1p9fEDLWm/lAGKKelQJ2KHhHva0DqMRQFThLYK0Lf1PqxPUPrEQ3H9b713o6+jJE3jrhhbxG/uBBsCVAwX+0BOhPzT700FO9jryRzG5pqKDxWQhzxnpMcO8TtEdzCiPbFMLWRS7vSBAu9Rm52oXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by AM0PR03MB6290.eurprd03.prod.outlook.com (2603:10a6:20b:15f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Fri, 28 Oct
 2022 16:14:02 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::9489:5192:ea65:b786]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::9489:5192:ea65:b786%7]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 16:14:02 +0000
Message-ID: <5f00ede6-10f5-c11c-ee21-54460c1f98b0@seco.com>
Date: Fri, 28 Oct 2022 12:13:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v8 4/9] phy: fsl: Add Lynx 10G SerDes driver
To: Stephen Boyd <sboyd@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org
References: <20221027191113.403712-1-sean.anderson@seco.com>
 <20221027191113.403712-5-sean.anderson@seco.com>
 <20221027230331.19C2FC433D6@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20221027230331.19C2FC433D6@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0399.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::14) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|AM0PR03MB6290:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ba184b4-bee2-472b-f317-08dab8ff6d67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ASf/mNMoU/R4a4HqwwU6MwyHfuQg6/z1615dFWtOOd4gui3bDpH17qAjJUZH9FSmKid3ieeRbYJC57ENdk1cfAsVfqtG8WTWzZ8wP1Cj3pQgJl9CTepUQ+zLoK9VvC5Vs4nIuA56vcPw5j2MNmVIm+IgeXYz/498Ip3DWsgWOQ8lH40E7ckGWd7hoVTIee0LCBnXhNpDUIQ/OxLGdfKBSadGtwMh12u02V+TeMlTXjVtIQuXZg0YcqDkaSLmaOjHBwCW8LZLw34teTNGpDqOtmfb1VjjSc8LtFh+s22n8fHh6rfeFAUryFWesKUlMmz0dL8qXfJOhjUI4l5R7Bs0LFHxNC/xWxltCnHBJ1uYO0/FqiUXBeLoTcU1NjVopLJCJDoYt6FJ3K8TAXOrOHbGLWTDy23k4ltXaqVcrU45AMNelMXhfOW1+0spYq6UO/c6kOvcfEZctOVyP1WBrUEAZZhHSAxPXbUKCjCnch0X1YJFlwc4e5LrYqNSEuVdE4TphuoVtKjIRNzRsrz0Dxs88bcNPFXQyxETTFJe2+AhcoS0rhMiotQPSaJp6YOafmmdDe9rekUwaUraUHJC2chNgUs3AQ1Z59pjCDkMNp4g9QNIiYHOU43sx/OQQ/pgp5rN4wXTzaisEY0hsXmF5PaWqR1fOpq3+R1UZZpI2JqNqaO5LbqL9NUodThX5uAhckghU5JeM9v4sVCopHlH0uFiis3FuAX2fo8LcIs7L7fDtwqXHikIA6+wIHsi2KwWOUjeEvIGz86JEtKP5VUc3UR9g0V33PjjtTxcqn9iJg5iNUsrP2tBmSZDRhl5oyP2wh3r3B+E1Fyx/MxcAxzcwd84PUoTgcpDKCN+0kcgjpRS5Ow=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(136003)(39850400004)(396003)(366004)(451199015)(186003)(31686004)(66899015)(36756003)(5660300002)(30864003)(31696002)(38350700002)(6486002)(8676002)(4326008)(38100700002)(44832011)(41300700001)(83380400001)(2906002)(7416002)(316002)(52116002)(53546011)(6666004)(4001150100001)(2616005)(8936002)(6512007)(478600001)(26005)(66476007)(86362001)(6506007)(54906003)(66556008)(110136005)(66946007)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?dGZVU2VUMnl5K2xpWnRTajBpUlJVajhaeGJ1azJza3l2MFF0cUxhZCs2aWt3?=
 =?utf-8?B?TUpyWHBBRzAyMm5USXc0b1pnaVRSQ3FxOHBJYzVNb2FvU1VoUUxuV2pFdDVJ?=
 =?utf-8?B?L1ZKb0lNRGowV0k0TjN3M2NjVUNsZWpjeHVBOHdINER4aEx6eHpPNFFUUzIy?=
 =?utf-8?B?enZ0Wkk4Q1NuNUNQcWF2eFRhVXIreC9ZZUt5bUR1eGNMTlFLMzkvVFB2R2Ri?=
 =?utf-8?B?dC9SSmNkWU5PdXBiQm5QZWhGa3BoSXkwc1B0emcrV25wbGtaeEJrc1RpVk00?=
 =?utf-8?B?bDkzeWNQcGhkSnA1RERycWJxSzRlTG9ySkRMQzhZa3JpbENBTzZtVDgzeFpN?=
 =?utf-8?B?dTVkMWQrNk5rNkd0REhadkcrZW16WUl1V3VUUWRmQmxtVjB6MVZ1M1g3SXp5?=
 =?utf-8?B?S3JmYkVwSktTb3ZwRkF4RFVkOWQvUEM5dkNmZ0w2cTUvbVRnU01PRVpKMVZu?=
 =?utf-8?B?WFBpVEtmNVROaEg0OHlabkxVNERjQnVOTkJycTFKbFRETHhOU1FKc1JWSmh5?=
 =?utf-8?B?ZzNpdjR1S3dxRnl2Smd4NEZYc3U2K0FZSzl4NVNGY2RRSnlzMy93SmJucm5u?=
 =?utf-8?B?ZkJrWXoySHdLMmhkcFlnTzBadmh3YkJzeTROOGNjZVI5WUtJTE5EazNwQzlJ?=
 =?utf-8?B?SW5vdEttTDhXMzlFdGllLzdiNkcvZnA1d2Joc3Bnai8wWjFtelpEK1ZoZ0pT?=
 =?utf-8?B?TXE4cW96dVg0U1M4d1NIOGg4SWhCNVlnV25VZEVibm1jYUtyZXgvRUo2WDlZ?=
 =?utf-8?B?TjVFdXZsd3hIblY0R0dndk94b1IzaWFkbzg1MTVrcG9maDVlb2gyUUdjVldW?=
 =?utf-8?B?NnVJcmRReGRwdCtDMndPUjlsUkFMYW9UbHRYTDU3ak5VRHdYdTZ3cGRuTWRu?=
 =?utf-8?B?SFh2b25LVkJpSFlmWVU4Z2lhaHg3OFlncXlWM2ovTXV2TzBrZStxZVVuWFNo?=
 =?utf-8?B?QjdLalpXNjI0allnMUM4eXBFYndheExnY1NTRUZ6VStHZzJSaC85aWw4dUw5?=
 =?utf-8?B?aEYrUy9ybHhuKzltTmthb2ZCS082TndqZ09BSU9SamhjN3hVemFya3BTblVU?=
 =?utf-8?B?MUhKaTgya0pYZTZIZTl3L09obHFJU1hqdXBXaHhXZEVGNEFpWVQweXA5Nm5E?=
 =?utf-8?B?aC9veHloOFZLUklzN1M5UXRJS0ZNaUpwWEdwR0ZkUHVHUTVHSURubjFzcUI2?=
 =?utf-8?B?RGNOZjlHSGgzY3pHN2wyTHUydWNkZmNSZDBGd0hYMWREMWlEeWxabDRzRjd0?=
 =?utf-8?B?NUd0aXBzRTVUVXdGQUhhK2NkOTFMSEF1UkM3MzN6SUdMM2wwR2xyWDR3NEg0?=
 =?utf-8?B?OUVkcWMyd1NzZFlONFIwcE9paWpwZFJMZHRJQ1dyUC9QbC9kallDY0pvR05G?=
 =?utf-8?B?cDVzTUI5WkxZR29lTkcwZHQ0UWlaa0FZMW02emxSQ25LbVArQ29QUm44RzJI?=
 =?utf-8?B?dXloV0lDTzFxcTVpU2pza0lQQnRlblA4eGhNUFBjMUxaajBZeGoxVGp2KzVC?=
 =?utf-8?B?WmhtZ2JRRVBwbmFjU1Z5UW1WL2RLck10WFAvcG1LRGZNUTlxRXhLbVVXcUVR?=
 =?utf-8?B?eG9sTCtRZjE5ZGlnYThyRkxiYmJETDVnTUJ4WXdNVGswbUFNOTVUOC85cXN3?=
 =?utf-8?B?NjJmclB6Zy9Nc1lJTjNOckxYSDRMWHh3YUNCTVFFTzRhR3BsNE9DVExJYm5P?=
 =?utf-8?B?aWNjZUxnOXRQZG1jYmMyaStVWUVlalpoaWZZM0xDdjJoM09KT1ZURDFVVkZ2?=
 =?utf-8?B?MUNtdkhzOUhkS1JZYXU1VXFTTnU0MjA0WUlPZXlBU0dDR2VIOWVBQWR5ZHlR?=
 =?utf-8?B?Q1lOTURvcU84UitYc0ZaQlhoNVBzeVRpMDJySWZBeUVNaFlLWGMzb04vMVhO?=
 =?utf-8?B?dUNHQUdqd0cwWERJa2pmMm84ejVDT0Y4QlRDWkZUcFd4dUNESkxaUWJNMnRY?=
 =?utf-8?B?WFVDbldOR0Y4SWFpWmtSaXZ0Y21tV0FlTUZvcVFuS1BzWlN2WThFenRmeG0w?=
 =?utf-8?B?ZjZhSjA1SXgxK1hnd0FVNHdLNitCTVJxUWVya1BjSFhDaGlGNXZBQW81MHpW?=
 =?utf-8?B?VjB5R2xOMUVrM21YSEV2eW4vK2d0OUc0WTZpV25WYlorcXBGYVBWV3BNU2Zt?=
 =?utf-8?B?WEFWUWZ4THRBLzg4d1E2RG05cHIyajY3ZktSOEt5ZmgrMWhndEgxakIwMk4x?=
 =?utf-8?B?UVE9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba184b4-bee2-472b-f317-08dab8ff6d67
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 16:14:02.1171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7g/tvMvNQHzpGL3LmXazeA/8Z6ii+zLk/SQnV1uzQECAjnOY3eKGTv4gylIQXVSZo7WNEh0eCg+LM0C+ePz97g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6290
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

On 10/27/22 19:03, Stephen Boyd wrote:
> Quoting Sean Anderson (2022-10-27 12:11:08)
>> diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
>> index 853958fb2c06..a6ccccf9e39b 100644
>> --- a/drivers/phy/freescale/Kconfig
>> +++ b/drivers/phy/freescale/Kconfig
>> @@ -47,3 +47,25 @@ config PHY_FSL_LYNX_28G
>>            found on NXP's Layerscape platforms such as LX2160A.
>>            Used to change the protocol running on SerDes lanes at runtime.
>>            Only useful for a restricted set of Ethernet protocols.
>> +
>> +config PHY_FSL_LYNX_10G
>> +       tristate "Freescale QorIQ Lynx 10G SerDes support"
>> +       depends on COMMON_CLK
> 
> Does something not compile if COMMON_CLK is disabled?

ld: drivers/phy/freescale/phy-fsl-lynx-10g-clk.o: in function `lynx_pll_round_rate':
phy-fsl-lynx-10g-clk.c:(.text+0x444): undefined reference to `clk_hw_round_rate'
ld: drivers/phy/freescale/phy-fsl-lynx-10g-clk.o: in function `lynx_clks_init':
phy-fsl-lynx-10g-clk.c:(.text+0x5eb): undefined reference to `devm_clk_hw_register'
ld: phy-fsl-lynx-10g-clk.c:(.text+0x625): undefined reference to `devm_clk_hw_register'

>> +       depends on ARCH_LAYERSCAPE || PPC || COMPILE_TEST
>> +       select GENERIC_PHY
>> +       select REGMAP_MMIO
>> +       help
>> +         This adds support for the Lynx "SerDes" devices found on various QorIQ
>> +         SoCs. There may be up to four SerDes devices on each SoC, and each
>> +         device supports up to eight lanes. The SerDes is configured by
>> +         default by the RCW, but this module is necessary in order to support
>> +         some modes (such as 2.5G SGMII or 1000BASE-KX), or clock setups (as
>> +         only as subset of clock configurations are supported by the RCW).
>> +         The hardware supports a variety of protocols, including Ethernet,
>> +         SATA, PCIe, and more exotic links such as Interlaken and Aurora. This
>> +         driver only supports Ethernet, but it will try not to touch lanes
>> +         configured for other protocols.
>> +
>> +         If you have a QorIQ processor and want to dynamically reconfigure your
>> +         SerDes, say Y. If this driver is compiled as a module, it will be
>> +         named phy-fsl-lynx-10g-drv.
>> diff --git a/drivers/phy/freescale/Makefile b/drivers/phy/freescale/Makefile
>> index cedb328bc4d2..1f18936507e0 100644
>> --- a/drivers/phy/freescale/Makefile
>> +++ b/drivers/phy/freescale/Makefile
>> @@ -3,4 +3,7 @@ obj-$(CONFIG_PHY_FSL_IMX8MQ_USB)        += phy-fsl-imx8mq-usb.o
>>   obj-$(CONFIG_PHY_MIXEL_LVDS_PHY)       += phy-fsl-imx8qm-lvds-phy.o
>>   obj-$(CONFIG_PHY_MIXEL_MIPI_DPHY)      += phy-fsl-imx8-mipi-dphy.o
>>   obj-$(CONFIG_PHY_FSL_IMX8M_PCIE)       += phy-fsl-imx8m-pcie.o
>> +phy-fsl-lynx-10g-drv-y                 += phy-fsl-lynx-10g.o
>> +phy-fsl-lynx-10g-drv-y                 += phy-fsl-lynx-10g-clk.o
>> +obj-$(CONFIG_PHY_FSL_LYNX_10G)         += phy-fsl-lynx-10g-drv.o
>>   obj-$(CONFIG_PHY_FSL_LYNX_28G)         += phy-fsl-lynx-28g.o
>> diff --git a/drivers/phy/freescale/lynx-10g.h b/drivers/phy/freescale/lynx-10g.h
>> new file mode 100644
>> index 000000000000..75d9353a867b
>> --- /dev/null
>> +++ b/drivers/phy/freescale/lynx-10g.h
>> @@ -0,0 +1,16 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (C) 2022 Sean Anderson <sean.anderson@seco.com>
>> + */
>> +
>> +#ifndef LYNX_10G
>> +#define LYNX_10G
>> +
>> +struct clk;
>> +struct device;
>> +struct regmap;
>> +
>> +int lynx_clks_init(struct device *dev, struct regmap *regmap,
> 
> Can you use auxiliary bus to register this clk controller instead and
> then move the clk file to drivers/clk/?

I don't want to have to deal with my clock driver getting unbound (aka
the user has come and decided to make my life harder). Dynamic binding
will only add complexity in this situation.

I don't know how much context you've picked up, but this driver

- Has one consumer, and is is the serdes.
- Is not accessible from outside the serdes.
- Does not share any code with other drivers.
- Has bits in its registers which can control the reset process of lanes
   using the PLLs.

These drivers are tightly coupled to each other. It is very likely IMO
that changes to one (bugs, features, etc) will affect the other. For
this reason, I think it makes sense to keep them in the same source
directory. I actually would have preferred to keep them in the same
file.

>> +                  struct clk *plls[2], struct clk *ex_dlys[2]);
>> +
>> +#endif /* LYNX 10G */
>> diff --git a/drivers/phy/freescale/phy-fsl-lynx-10g-clk.c b/drivers/phy/freescale/phy-fsl-lynx-10g-clk.c
>> new file mode 100644
>> index 000000000000..6ec32bdfb9dd
>> --- /dev/null
>> +++ b/drivers/phy/freescale/phy-fsl-lynx-10g-clk.c
>> @@ -0,0 +1,503 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2022 Sean Anderson <sean.anderson@seco.com>
>> + *
>> + * This file contains the implementation for the PLLs found on Lynx 10G phys.
>> + *
>> + * XXX: The VCO rate of the PLLs can exceed ~4GHz, which is the maximum rate
>> + * expressable in an unsigned long. To work around this, rates are specified in
>> + * kHz. This is as if there was a division by 1000 in the PLL.
>> + */
>> +
>> +#include <linux/clk.h>
> 
> Ideally clk.h isn't included in a clk provider. This allows us to easily
> identify drivers that are both a consumer (clk.h) and a provider
> (clk-provider.h). A provider/consumer is rare.

I don't see why it would be rare. Most clocks will use some external
clock as their reference, so they are (therefore) consumers. Although as
discussed below, apparently you can get the clock core to do this for
you...

>> +#include <linux/clk-provider.h>
>> +#include <linux/device.h>
>> +#include <linux/bitfield.h>
>> +#include <linux/math64.h>
>> +#include <linux/regmap.h>
>> +#include <linux/slab.h>
>> +#include <linux/units.h>
>> +#include <dt-bindings/clock/fsl,lynx-10g.h>
>> +
>> +#include "lynx-10g.h"
>> +
>> +#define PLL_STRIDE     0x20
>> +#define PLLa(a, off)   ((a) * PLL_STRIDE + (off))
>> +#define PLLaRSTCTL(a)  PLLa(a, 0x00)
>> +#define PLLaCR0(a)     PLLa(a, 0x04)
>> +
>> +#define PLLaRSTCTL_RSTREQ      BIT(31)
>> +#define PLLaRSTCTL_RST_DONE    BIT(30)
>> +#define PLLaRSTCTL_RST_ERR     BIT(29)
>> +#define PLLaRSTCTL_PLLRST_B    BIT(7)
>> +#define PLLaRSTCTL_SDRST_B     BIT(6)
>> +#define PLLaRSTCTL_SDEN                BIT(5)
>> +
>> +#define PLLaRSTCTL_ENABLE_SET  (PLLaRSTCTL_RST_DONE | PLLaRSTCTL_PLLRST_B | \
>> +                                PLLaRSTCTL_SDRST_B | PLLaRSTCTL_SDEN)
>> +#define PLLaRSTCTL_ENABLE_MASK (PLLaRSTCTL_ENABLE_SET | PLLaRSTCTL_RST_ERR)
>> +
>> +#define PLLaCR0_POFF           BIT(31)
>> +#define PLLaCR0_RFCLK_SEL      GENMASK(30, 28)
>> +#define PLLaCR0_PLL_LCK                BIT(23)
>> +#define PLLaCR0_FRATE_SEL      GENMASK(19, 16)
>> +#define PLLaCR0_DLYDIV_SEL     GENMASK(1, 0)
>> +
>> +#define PLLaCR0_DLYDIV_SEL_16          0b01
>> +
>> +/**
>> + * struct lynx_clk - Driver data for the PLLs
>> + * @pll: The PLL clock
>> + * @ex_dly: The "PLLa_ex_dly_clk" clock
>> + * @ref: Our reference clock
>> + * @dev: The serdes device
>> + * @regmap: Our registers
>> + * @idx: Which PLL this clock is for
>> + */
>> +struct lynx_clk {
>> +       struct clk_hw pll, ex_dly;
>> +       struct clk_hw *ref;
>> +       struct device *dev;
>> +       struct regmap *regmap;
>> +       unsigned int idx;
>> +};
>> +
>> +static u32 lynx_read(struct lynx_clk *clk, u32 reg)
>> +{
>> +       unsigned int ret = 0;
>> +
>> +       WARN_ON_ONCE(regmap_read(clk->regmap, reg, &ret));
>> +       return ret;
>> +}
>> +
>> +static void lynx_write(struct lynx_clk *clk, u32 val, u32 reg)
>> +{
>> +       WARN_ON_ONCE(regmap_write(clk->regmap, reg, val));
>> +}
>> +
>> +static struct lynx_clk *lynx_pll_to_clk(struct clk_hw *hw)
>> +{
>> +       return container_of(hw, struct lynx_clk, pll);
>> +}
>> +
>> +static struct lynx_clk *lynx_ex_dly_to_clk(struct clk_hw *hw)
>> +{
>> +       return container_of(hw, struct lynx_clk, ex_dly);
>> +}
>> +
>> +static void lynx_pll_stop(struct lynx_clk *clk)
>> +{
>> +       u32 rstctl;
>> +
>> +       rstctl = lynx_read(clk, PLLaRSTCTL(clk->idx));
>> +       rstctl &= ~PLLaRSTCTL_SDRST_B;
>> +       lynx_write(clk, rstctl, PLLaRSTCTL(clk->idx));
>> +
>> +       ndelay(50);
>> +
>> +       rstctl = lynx_read(clk, PLLaRSTCTL(clk->idx));
>> +       rstctl &= ~(PLLaRSTCTL_SDEN | PLLaRSTCTL_PLLRST_B);
>> +       lynx_write(clk, rstctl, PLLaRSTCTL(clk->idx));
>> +
>> +       ndelay(100);
>> +}
>> +
>> +static void lynx_pll_disable(struct clk_hw *hw)
>> +{
>> +       struct lynx_clk *clk = lynx_pll_to_clk(hw);
>> +       u32 cr0;
>> +
>> +       dev_dbg(clk->dev, "disable pll%d\n", clk->idx);
>> +
>> +       lynx_pll_stop(clk);
>> +
>> +       cr0 = lynx_read(clk, PLLaCR0(clk->idx));
>> +       cr0 |= PLLaCR0_POFF;
>> +       lynx_write(clk, cr0, PLLaCR0(clk->idx));
>> +}
>> +
>> +static int lynx_pll_reset(struct lynx_clk *clk)
>> +{
>> +       int ret;
>> +       u32 rstctl = lynx_read(clk, PLLaRSTCTL(clk->idx));
>> +
>> +       rstctl |= PLLaRSTCTL_RSTREQ;
>> +       lynx_write(clk, rstctl, PLLaRSTCTL(clk->idx));
>> +       ret = read_poll_timeout(lynx_read, rstctl,
>> +                               rstctl & (PLLaRSTCTL_RST_DONE | PLLaRSTCTL_RST_ERR),
>> +                               100, 5000, true, clk, PLLaRSTCTL(clk->idx));
>> +       if (rstctl & PLLaRSTCTL_RST_ERR)
>> +               ret = -EIO;
>> +       if (ret) {
>> +               dev_err(clk->dev, "pll%d reset failed\n", clk->idx);
>> +               return ret;
>> +       }
>> +
>> +       rstctl |= PLLaRSTCTL_SDEN | PLLaRSTCTL_PLLRST_B | PLLaRSTCTL_SDRST_B;
>> +       lynx_write(clk, rstctl, PLLaRSTCTL(clk->idx));
>> +       return 0;
>> +}
>> +
>> +static int lynx_pll_prepare(struct clk_hw *hw)
>> +{
>> +       struct lynx_clk *clk = lynx_pll_to_clk(hw);
>> +       u32 rstctl = lynx_read(clk, PLLaRSTCTL(clk->idx));
>> +       u32 cr0 = lynx_read(clk, PLLaCR0(clk->idx));
>> +
>> +       /*
>> +        * "Enabling" the PLL involves resetting it (and all attached lanes).
>> +        * Avoid doing this if we are already enabled.
>> +        */
>> +       if (!(cr0 & PLLaCR0_POFF) &&
>> +           (rstctl & PLLaRSTCTL_ENABLE_MASK) == PLLaRSTCTL_ENABLE_SET) {
>> +               dev_dbg(clk->dev, "pll%d already prepared\n", clk->idx);
>> +               return 0;
>> +       }
>> +
>> +       dev_dbg(clk->dev, "prepare pll%d\n", clk->idx);
>> +
>> +       cr0 &= ~PLLaCR0_POFF;
>> +       lynx_write(clk, cr0, PLLaCR0(clk->idx));
>> +
>> +       return lynx_pll_reset(clk);
>> +}
>> +
>> +static int lynx_pll_is_enabled(struct clk_hw *hw)
>> +{
>> +       struct lynx_clk *clk = lynx_pll_to_clk(hw);
>> +       u32 cr0 = lynx_read(clk, PLLaCR0(clk->idx));
>> +       bool enabled = !(cr0 & PLLaCR0_POFF);
>> +
>> +       dev_dbg(clk->dev, "pll%d %s enabled\n", clk->idx,
>> +               enabled ? "is" : "is not");
>> +
>> +       return enabled;
>> +}
>> +
>> +static const u32 rfclk_sel_map[8] = {
>> +       [0b000] = 100000000,
>> +       [0b001] = 125000000,
>> +       [0b010] = 156250000,
>> +       [0b011] = 150000000,
>> +};
>> +
>> +/**
>> + * lynx_rfclk_to_sel() - Convert a reference clock rate to a selector
>> + * @rate: The reference clock rate
>> + *
>> + * To allow for some variation in the reference clock rate, up to 100ppm of
>> + * error is allowed.
>> + *
>> + * Return: An appropriate selector for @rate, or -%EINVAL.
>> + */
>> +static int lynx_rfclk_to_sel(u32 rate)
> 
> Should rate be unsigned long? Or you really want 32-bits here?

Probably should be unsigned long.

>> +{
>> +       int ret;
>> +
>> +       for (ret = 0; ret < ARRAY_SIZE(rfclk_sel_map); ret++) {
>> +               u32 rfclk_rate = rfclk_sel_map[ret];
>> +               /* Allow an error of 100ppm */
>> +               u32 error = rfclk_rate / 10000;
>> +
>> +               if (rate > rfclk_rate - error && rate < rfclk_rate + error)
> 
> Does
> 
> 	if (abs(rate - rfclk_rate) < error)
> 
> work?

I think so.

> I'm kinda surprised that we don't have a within_tolerance(x,
> margin) macro in math.h that would make it look like:
> 
> 	if (within_tolerance(rate - rfclk_rate, error))

Ditto for the abs_diff macro used in the other half of this driver.

>> +                       return ret;
>> +       }
>> +
>> +       return -EINVAL;
>> +}
>> +
>> +static const u32 frate_sel_map[16] = {
>> +       [0b0000] = 5000000,
>> +       [0b0101] = 3750000,
>> +       [0b0110] = 5156250,
>> +       [0b0111] = 4000000,
>> +       [0b1001] = 3125000,
>> +       [0b1010] = 3000000,
>> +};
>> +
>> +/**
>> + * lynx_frate_to_sel() - Convert a VCO clock rate to a selector
>> + * @rate_khz: The VCO frequency, in kHz
>> + *
>> + * Return: An appropriate selector for @rate_khz, or -%EINVAL.
>> + */
>> +static int lynx_frate_to_sel(u32 rate_khz)
>> +{
>> +       int ret;
>> +
>> +       for (ret = 0; ret < ARRAY_SIZE(frate_sel_map); ret++)
>> +               if (frate_sel_map[ret] == rate_khz)
>> +                       return ret;
>> +
>> +       return -EINVAL;
>> +}
>> +
>> +static u32 lynx_pll_ratio(u32 frate_sel, u32 rfclk_sel)
>> +{
>> +       u64 frate;
>> +       u32 rfclk, error, ratio;
>> +
>> +       frate = frate_sel_map[frate_sel] * (u64)HZ_PER_KHZ;
>> +       rfclk = rfclk_sel_map[rfclk_sel];
>> +
>> +       if (!frate || !rfclk)
>> +               return 0;
>> +
>> +       ratio = div_u64_rem(frate, rfclk, &error);
>> +       if (!error)
>> +               return ratio;
>> +       return 0;
>> +}
>> +
>> +static unsigned long lynx_pll_recalc_rate(struct clk_hw *hw,
>> +                                         unsigned long parent_rate)
>> +{
>> +       struct lynx_clk *clk = lynx_pll_to_clk(hw);
>> +       u32 cr0 = lynx_read(clk, PLLaCR0(clk->idx));
>> +       u32 frate_sel = FIELD_GET(PLLaCR0_FRATE_SEL, cr0);
>> +       u32 rfclk_sel = FIELD_GET(PLLaCR0_RFCLK_SEL, cr0);
>> +       u32 ratio = lynx_pll_ratio(frate_sel, rfclk_sel);
>> +       unsigned long ret;
>> +
>> +       /* Ensure that the parent matches our rfclk selector */
>> +       if (rfclk_sel == lynx_rfclk_to_sel(parent_rate))
>> +               ret = mult_frac(parent_rate, ratio, HZ_PER_KHZ);
>> +       else
>> +               ret = 0;
>> +
>> +       dev_dbg(clk->dev, "recalc pll%d new=%llu parent=%lu\n", clk->idx,
>> +               (u64)ret * HZ_PER_KHZ, parent_rate);
>> +       return ret;
>> +}
>> +
>> +static long lynx_pll_round_rate(struct clk_hw *hw, unsigned long rate_khz,
>> +                               unsigned long *parent_rate)
>> +{
>> +       int frate_sel, rfclk_sel;
>> +       struct lynx_clk *clk = lynx_pll_to_clk(hw);
>> +       u32 ratio;
>> +
>> +       dev_dbg(clk->dev, "round pll%d new=%llu parent=%lu\n", clk->idx,
>> +               (u64)rate_khz * HZ_PER_KHZ, *parent_rate);
>> +
>> +       frate_sel = lynx_frate_to_sel(rate_khz);
>> +       if (frate_sel < 0)
>> +               return frate_sel;
>> +
>> +       /* Try the current parent rate */
>> +       rfclk_sel = lynx_rfclk_to_sel(*parent_rate);
>> +       if (rfclk_sel >= 0) {
>> +               ratio = lynx_pll_ratio(frate_sel, rfclk_sel);
>> +               if (ratio)
>> +                       return mult_frac(*parent_rate, ratio, HZ_PER_KHZ);
>> +       }
>> +
>> +       /* Try all possible parent rates */
>> +       for (rfclk_sel = 0;
>> +            rfclk_sel < ARRAY_SIZE(rfclk_sel_map);
>> +            rfclk_sel++) {
>> +               unsigned long new_parent_rate;
>> +
>> +               ratio = lynx_pll_ratio(frate_sel, rfclk_sel);
>> +               if (!ratio)
>> +                       continue;
>> +
>> +               /* Ensure the reference clock can produce this rate */
>> +               new_parent_rate = rfclk_sel_map[rfclk_sel];
>> +               new_parent_rate = clk_hw_round_rate(clk->ref, new_parent_rate);
>> +               if (rfclk_sel != lynx_rfclk_to_sel(new_parent_rate))
>> +                       continue;
>> +
>> +               *parent_rate = new_parent_rate;
>> +               return mult_frac(new_parent_rate, ratio, HZ_PER_KHZ);
>> +       }
>> +
>> +       return -EINVAL;
>> +}
>> +
>> +static int lynx_pll_set_rate(struct clk_hw *hw, unsigned long rate_khz,
>> +                          unsigned long parent_rate)
>> +{
>> +       int frate_sel, rfclk_sel;
>> +       struct lynx_clk *clk = lynx_pll_to_clk(hw);
>> +       u32 ratio, cr0 = lynx_read(clk, PLLaCR0(clk->idx));
>> +
>> +       dev_dbg(clk->dev, "set rate pll%d new=%llu parent=%lu\n", clk->idx,
>> +               (u64)rate_khz * HZ_PER_KHZ, parent_rate);
>> +
>> +       frate_sel = lynx_frate_to_sel(rate_khz);
>> +       if (frate_sel < 0)
>> +               return frate_sel;
>> +
>> +       rfclk_sel = lynx_rfclk_to_sel(parent_rate);
>> +       if (rfclk_sel < 0)
>> +               return rfclk_sel;
>> +
>> +       ratio = lynx_pll_ratio(frate_sel, rfclk_sel);
>> +       if (!ratio)
>> +               return -EINVAL;
>> +
>> +       lynx_pll_stop(clk);
>> +       cr0 &= ~(PLLaCR0_RFCLK_SEL | PLLaCR0_FRATE_SEL);
>> +       cr0 |= FIELD_PREP(PLLaCR0_RFCLK_SEL, rfclk_sel);
>> +       cr0 |= FIELD_PREP(PLLaCR0_FRATE_SEL, frate_sel);
>> +       lynx_write(clk, cr0, PLLaCR0(clk->idx));
>> +       /* Don't bother resetting if it's off */
>> +       if (cr0 & PLLaCR0_POFF)
>> +               return 0;
>> +       return lynx_pll_reset(clk);
>> +}
>> +
>> +static const struct clk_ops lynx_pll_clk_ops = {
>> +       .prepare = lynx_pll_prepare,
>> +       .disable = lynx_pll_disable,
>> +       .is_enabled = lynx_pll_is_enabled,
>> +       .recalc_rate = lynx_pll_recalc_rate,
>> +       .round_rate = lynx_pll_round_rate,
>> +       .set_rate = lynx_pll_set_rate,
>> +};
>> +
>> +static void lynx_ex_dly_disable(struct clk_hw *hw)
>> +{
>> +       struct lynx_clk *clk = lynx_ex_dly_to_clk(hw);
>> +       u32 cr0 = lynx_read(clk, PLLaCR0(clk->idx));
>> +
>> +       cr0 &= ~PLLaCR0_DLYDIV_SEL;
>> +       lynx_write(clk, PLLaCR0(clk->idx), cr0);
>> +}
>> +
>> +static int lynx_ex_dly_enable(struct clk_hw *hw)
>> +{
>> +       struct lynx_clk *clk = lynx_ex_dly_to_clk(hw);
>> +       u32 cr0 = lynx_read(clk, PLLaCR0(clk->idx));
>> +
>> +       cr0 &= ~PLLaCR0_DLYDIV_SEL;
>> +       cr0 |= FIELD_PREP(PLLaCR0_DLYDIV_SEL, PLLaCR0_DLYDIV_SEL_16);
>> +       lynx_write(clk, PLLaCR0(clk->idx), cr0);
>> +       return 0;
>> +}
>> +
>> +static int lynx_ex_dly_is_enabled(struct clk_hw *hw)
>> +{
>> +       struct lynx_clk *clk = lynx_ex_dly_to_clk(hw);
>> +
>> +       return lynx_read(clk, PLLaCR0(clk->idx)) & PLLaCR0_DLYDIV_SEL;
>> +}
>> +
>> +static unsigned long lynx_ex_dly_recalc_rate(struct clk_hw *hw,
>> +                                            unsigned long parent_rate)
>> +{
>> +       return parent_rate / 16;
>> +}
>> +
>> +static const struct clk_ops lynx_ex_dly_clk_ops = {
>> +       .enable = lynx_ex_dly_enable,
>> +       .disable = lynx_ex_dly_disable,
>> +       .is_enabled = lynx_ex_dly_is_enabled,
>> +       .recalc_rate = lynx_ex_dly_recalc_rate,
>> +};
>> +
>> +static int lynx_clk_init(struct clk_hw_onecell_data *hw_data,
>> +                        struct device *dev, struct regmap *regmap,
>> +                        unsigned int index)
>> +{
>> +       const struct clk_hw *pll_parents, *ex_dly_parents;
>> +       struct clk_init_data pll_init = {
>> +               .ops = &lynx_pll_clk_ops,
>> +               .parent_hws = &pll_parents,
>> +               .num_parents = 1,
>> +               .flags = CLK_GET_RATE_NOCACHE | CLK_SET_RATE_PARENT |
>> +                        CLK_OPS_PARENT_ENABLE,
>> +       };
>> +       struct clk_init_data ex_dly_init = {
>> +               .ops = &lynx_ex_dly_clk_ops,
>> +               .parent_hws = &ex_dly_parents,
>> +               .num_parents = 1,
>> +       };
>> +       struct clk *ref;
>> +       struct lynx_clk *clk;
>> +       char *ref_name;
>> +       int ret;
>> +
>> +       clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
>> +       if (!clk)
>> +               return -ENOMEM;
>> +
>> +       clk->dev = dev;
>> +       clk->regmap = regmap;
>> +       clk->idx = index;
>> +
>> +       ref_name = kasprintf(GFP_KERNEL, "ref%d", index);
>> +       pll_init.name = kasprintf(GFP_KERNEL, "%s.pll%d_khz", dev_name(dev),
>> +                                 index);
>> +       ex_dly_init.name = kasprintf(GFP_KERNEL, "%s.pll%d_ex_dly_khz",
>> +                                    dev_name(dev), index);
>> +       if (!ref_name || !pll_init.name || !ex_dly_init.name) {
>> +               ret = -ENOMEM;
>> +               goto out;
>> +       }
>> +
>> +       ref = devm_clk_get(dev, ref_name);
>> +       if (IS_ERR(clk->ref)) {
>> +               ret = PTR_ERR(clk->ref);
>> +               dev_err_probe(dev, ret, "could not get %s\n", ref_name);
>> +               goto out;
>> +       }
>> +
>> +       clk->ref = __clk_get_hw(ref);
> 
> Please don't use __clk_get_hw() for this. Instead use struct
> clk_parent_data and set a DT index in the index member to map to this
> clk.

OK

>> +       pll_parents = clk->ref;
>> +       clk->pll.init = &pll_init;
>> +       ret = devm_clk_hw_register(dev, &clk->pll);
>> +       if (ret) {
>> +               dev_err_probe(dev, ret, "could not register %s\n",
>> +                             pll_init.name);
>> +               goto out;
>> +       }
>> +
>> +       ex_dly_parents = &clk->pll;
>> +       clk->ex_dly.init = &ex_dly_init;
>> +       ret = devm_clk_hw_register(dev, &clk->ex_dly);
>> +       if (ret)
>> +               dev_err_probe(dev, ret, "could not register %s\n",
>> +                             ex_dly_init.name);
>> +
>> +       hw_data->hws[LYNX10G_PLLa(index)] = &clk->pll;
>> +       hw_data->hws[LYNX10G_PLLa_EX_DLY(index)] = &clk->ex_dly;
>> +
>> +out:
>> +       kfree(ref_name);
>> +       kfree(pll_init.name);
>> +       kfree(ex_dly_init.name);
>> +       return ret;
>> +}
>> +
>> +#define NUM_PLLS 2
>> +#define NUM_CLKS (NUM_PLLS * LYNX10G_CLKS_PER_PLL)
>> +
>> +int lynx_clks_init(struct device *dev, struct regmap *regmap,
>> +                  struct clk *plls[2], struct clk *ex_dlys[2])
>> +{
>> +       int ret, i;
>> +       struct clk_hw_onecell_data *hw_data;
>> +
>> +       hw_data = devm_kzalloc(dev, struct_size(hw_data, hws, NUM_CLKS),
>> +                              GFP_KERNEL);
>> +       if (!hw_data)
>> +               return -ENOMEM;
>> +       hw_data->num = NUM_CLKS;
>> +
>> +       for (i = 0; i < NUM_PLLS; i++) {
>> +               ret = lynx_clk_init(hw_data, dev, regmap, i);
>> +               if (ret)
>> +                       return ret;
>> +
>> +               plls[i] = hw_data->hws[LYNX10G_PLLa(i)]->clk;
>> +               ex_dlys[i] = hw_data->hws[LYNX10G_PLLa_EX_DLY(i)]->clk;
> 
> Use clk_hw_get_clk() please.

I don't want to do that, because then I'd have to generate the clock ID
again. And why do we even need a new clock consumer in the first place?
This is only for internal use by the driver; the consumer is the same as
the producer.

--Sean

>> +       }
>> +
>> +       ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, hw_data);
>> +       if (ret)
>> +               dev_err_probe(dev, ret, "could not register clock provider\n");
>> +
>> +       return ret;
>> +}
> 

