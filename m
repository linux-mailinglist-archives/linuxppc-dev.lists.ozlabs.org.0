Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 581715F3421
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Oct 2022 19:05:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mh6fm5rK5z3dqX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 04:05:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=ZJ8315zs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.6.49; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=ZJ8315zs;
	dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60049.outbound.protection.outlook.com [40.107.6.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mh6dk0zC1z308b
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Oct 2022 04:04:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dU7outLeS3j9ECTLkjoYtLluUZ5Tyz1LT2q6IqK++OSwO3/wbDES4/2QNIA5nLSPIaW6ZbVD7YFLCYYpPEJyI2ikm1Z7no3fR1QBy/BR/xJhjo8HirsAMIHwNfD68SMufHk9mxpZ3LqcAFzIzuZU1K2EL52c6l4RFhn4hW6aIxP0iUsujzJ77cs37sFD0K2597QFInhs85zOaUDR/MM/+ghlbrt0t5plhBHsom6cE5SZ8zO7c9BRzyHi4PyLHz/aFLpSMHGVviFrtPzHnmuNhkA2D3BWrb/j9HbUjdw1f/QEvjvEYz66f1TBQ6T3R99B0OPj+Udt2kdA1DJHoPvDSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cxeLe+0lxMmQauJsnvN6OQB1MsrOM7MuiM4Jm0w53qI=;
 b=GTXg+ovvUmRwSVswN9E5M432u3WMh0QQPxuT7S1Fn9gpSh9T6FVbBdUrLJMyOVKs2nYDO7locIqErB8AP42e8a2RcShObJ4IfY3BWrNKCsp4RmYFVXXPOdlj8cpPujLB03sLVZWq17B/Es3QhkjjCBV9J28VdwBjV0gdsIi0BmEpYPyBO6fU7tojzIGBMyRdsX/zNKzmKWOTAMSuOZszxryDBekbm5IjY5tAlxbFPFOa9GKyykGB3o4p3k6Y4xOiILqGww+vslYZ84wBtAtKwRBguHQBQFAWi0nPq1qe1xPACx3n4g9z3Ci/+/JtE68s3DytMkGIm4BXXWk3fziG9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxeLe+0lxMmQauJsnvN6OQB1MsrOM7MuiM4Jm0w53qI=;
 b=ZJ8315zslB4EX4tA9PI2zmOH31BI+nHwINOrAA18wsilbo0DgsoFNrEtmzssYostQck/Ib5Z4BStArLotZlfJPrhJDbfby+MDq7EY96MX35DmGq976E+tRBSoC7GdJsZJGtZe3HOChNb8YuCZz8BhDVWWQ6T5TMqy6VVQ0wOsx5CZy6OiSG7ZiIxrWrtaR2wgrbvR05K2ifz0HEBzLgrCuKyPGwsCpfhUo15FzMv3J+YMw7sDdkGPLbWjjSlAUeCf//SV7kZsJkKuF0s7Ykq2G+ZRKrwaA8AcoKn1naMt9z4x32ofqUJLkcI5SrUcEMNvQDPOD6BmBde7wu5+lkkhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by AS8PR03MB9818.eurprd03.prod.outlook.com (2603:10a6:20b:61a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 3 Oct
 2022 17:04:33 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d%6]) with mapi id 15.20.5676.028; Mon, 3 Oct 2022
 17:04:33 +0000
Subject: Re: [PATCH v6 4/8] phy: fsl: Add Lynx 10G SerDes driver
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>, Ioana Ciornei <ioana.ciornei@nxp.com>
References: <20220920202356.1451033-1-sean.anderson@seco.com>
 <20220920202356.1451033-5-sean.anderson@seco.com> <Yy6ptJXauuIv0d/8@matsya>
 <c1556a1a-ede9-bf9e-8b9d-9e504375393f@seco.com>
Message-ID: <4ffd78a4-e286-326d-54ae-eee088697e7f@seco.com>
Date: Mon, 3 Oct 2022 13:04:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <c1556a1a-ede9-bf9e-8b9d-9e504375393f@seco.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR0102CA0043.prod.exchangelabs.com
 (2603:10b6:208:25::20) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|AS8PR03MB9818:EE_
X-MS-Office365-Filtering-Correlation-Id: d7589067-86d3-44ae-f300-08daa5615816
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	kaR3J9//DaEstGGunK8lqvb57fYoYRBPqSG6u0yCA2q3d4n8HV+eRBvYXbRcdWnJbpJ2iC+JWOKgfcx8WqaAr5Jw5qaFvKiYZzWfeUCcu1ZhneLrus3LmrlsxXT/uRbls47KX3gTtxFH/OrrfVKdekY2gX1cxn63QJIxg7dy1hVkHN30BCf/tB5C1kaz+A2Tkydokv4DQScTDw/IfhWcy0Fo6L6TWXc0qEJNBpUSixewAd2q1KxCbTnj5MWUrzYxtfnDWhfaw3rcQzXd8akra/OeAYqe2IwNAin+bBZC0Bidc8Cj45o93w31Mw8RTDxyfZPMVpfWEafRrx11rJ83FimRVDFmrYw9AHpFH5Ydm4zwICjL3exI4cCjMh9ceBM0NaqokYeAYGMvsecWk8DYpPrtkTzhRFeuXIHkA7L92u0S4f7yv6omYRRqpxs3hvijOD0+6fj1hWCJqyrVoIsFkAR9F86MSqxgVWSneOld9W/KTDHI2WTvCrsoDim5SVAtgmhf2QFfFYTq/OPCwKR8hOfOogNdEhS3EM0f2GetSaF9JRLTRiwUNpa33s2/oUzwGGDPPoxQBJf0IpD2oCpthXshsRLXe8sdKjBmiLoH7JcuFWaZa81InAs0NadRMZfrWwBYfSoWm8q/v9gbRgBSG20NtaTfhiw+UyEbwiGoTkek9zL6aYnpAJOUNQ2F995eT5/gyqHx2gmPyksWVQzVtG8bZYdq7GSbT2peb0hbS7Qc68vXC0aGuc+8u2sFKmC0l3laZrYmZrPwM4pIR5EsH3ibZKUS+epblZvQXUwmGFz7wzSYvJGMQCjbL7+Ub/FeA3MFtC61hhHOuQ6vaqP6+DWfVE5c+ELHdot2b9kcuY+aQDl7uzcovBxJjk+VD/b/
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39850400004)(136003)(346002)(366004)(376002)(451199015)(30864003)(53546011)(26005)(52116002)(6506007)(6512007)(36756003)(2906002)(66946007)(7416002)(66476007)(44832011)(6666004)(38100700002)(8936002)(5660300002)(66556008)(8676002)(4326008)(41300700001)(31696002)(86362001)(38350700002)(186003)(2616005)(478600001)(54906003)(6486002)(966005)(45080400002)(316002)(110136005)(31686004)(83380400001)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?SGJmdlFIVWtwcEJhMVNMblRsSFZiRnd6WVRZRUVzMW9hUHg4SWdSeG9Pek40?=
 =?utf-8?B?WDIyKzN6d01QMU9FUUErT2FkL2g1enhyeTI1LzYxUnNJM1FXN09PaWM2SEFG?=
 =?utf-8?B?S2tISUdOZVZPZEhTLzBQOGNHRkNiV3Q0M3BpQlFvVDQvZGYvdU9zTU8raDhP?=
 =?utf-8?B?MklxTnlTeDVzRG9zQlVOOGJPb2NkU0tpMlBRcktCWTlMTEVWcGR5emIxMjRH?=
 =?utf-8?B?d3FUREp1dkZqS0cxN1JiT1hBaXg0aHNLZVkvSVp5ZUZLVTFjUUN3V0VyeHUr?=
 =?utf-8?B?andJWVZ4TDFtbXJEV0wrclIxT3dNSVJMTHlVVlFVb1A4dGFTUmZEbUhtakdk?=
 =?utf-8?B?UjF4R1lrRUc0WGQ5azRzcXh0ektmejI3Ly9PT2ZQeDcxWVpJdkJVVzdkU1FL?=
 =?utf-8?B?ZnloN1NRcG5XMDN2YWZKSVlqemVPNGEyQzhXTGFLN0VQejhaVEFjYmlXZEty?=
 =?utf-8?B?MExHK0FHbXloMkZqbS9SZEpTUmUxb29QTlBBK0Z5a0pWNjB3SXJzWnQxdWxE?=
 =?utf-8?B?SmQxT2dXTkozUkljb04xakY5bjJDVzJhZ1FYMVhXTFEyMURMWDNvc2RhZDJQ?=
 =?utf-8?B?RW9EZXllZDlpQ3Bta1plYjhaM0NNMUN6bVpLOFQ2MGM0eEdWUGpneFZvbE9V?=
 =?utf-8?B?STd6WHl0WkRqaDNlbkpUMDRCa24vaW1kVTAyNVNnYnY0Ynd3Yy9BdUU1WEFh?=
 =?utf-8?B?ZXA2RU1iUW5ubDVORTBNWVBvei8wc3pqMjdIdysyRnEwWndEM0tqMm51a0h2?=
 =?utf-8?B?NHEwZUczeUJRam9qVFRRWHhSUGpGS1hmKzRMTUNDUklVakk1M0lBTE54N1U4?=
 =?utf-8?B?VUNpZG5UU2t6dXYxaTNsVnRmcUFidlIvcFJoNGg1QU4rKzVVcnVuaUU2cEdS?=
 =?utf-8?B?blc5Nlk5L2pNQm1nd1JoZGxNRmdlenhneU9Uek1WWTRJMGNBdFFpNGpmUWFX?=
 =?utf-8?B?Q1BxeEdERkJUVlB2MTZjZGhBNGlIazc5dmhlVlNSeEVubmlJQVJqVVFYdWRr?=
 =?utf-8?B?a0s1YmZUTFowMStGdlBmQWFSSHJFN01qTTg3SXIwRUViemVpK2J4TGxOVkow?=
 =?utf-8?B?NkVJaUpsMEpwVEl5YzA4ZmlSQ0ZJUnlNSGNHVlZ4MHYwMUJ2Z3FvZDJOT2li?=
 =?utf-8?B?ekVqVk13MjhiRnRXUVBnYUJoRCtCeDFxRG8rMmpHbVl3cEdtODlaNEdjTnUv?=
 =?utf-8?B?Y0psbEVUTkVaTEFCWGs1WU9BeHZLSXlWL3lKU1R2MG83ckh0bmdYanN6cjNS?=
 =?utf-8?B?SzRmblRtYzZKVjRFeWVXNlRCUDAwNHp5NDZ6TzFydGpJby9pb1o1T0pISVNH?=
 =?utf-8?B?V1BtOTczQU9FNWpTR2RXMDFDYktoUEswM2FjTnp1cWpMQXh4ak5MN1JXZ3ZC?=
 =?utf-8?B?WTlwV0dDWk1WM3hFbk9XWGZqZStSV3FyZ1hzTDVOMU1UbnVreEp6TkszbXJt?=
 =?utf-8?B?SFNJcWNZdnJDRTZRWHJ0NU9wL1RIOC9oRHpLZ0hpd2Y1VFA5MElOa3RMK1Zn?=
 =?utf-8?B?WFFrcTR4Z3RvM3U4NTY4ekRUTjFmaTdOU3dZTVNOYVREZUduQkI4TVBHam4y?=
 =?utf-8?B?YmF6Tnhna3BoODc4bzlxUnVhcDVweHhneFFQNHRoYkxWNFpyRmF5dmFOMHI4?=
 =?utf-8?B?YldiZVlHQ1dzQ1ZFTDJBTVFmbEhRUVpGdElIL3ppVjVVb0VpOElDSU5wYUVa?=
 =?utf-8?B?dEZqTzdsYjV0OC93NFR1TFdHdlJpcFNxWThYN0pPdDhSSThRZ2pLM2FiSDZJ?=
 =?utf-8?B?Y0tWMDlNRW5TajlmamNKUnNkUmdqNm5VRW1WcFBuaklHVjRKSGM3QlNwSWE3?=
 =?utf-8?B?UGRtNUZCNHRFdkdTV3A2STNyZFZOdFl5eDNsVW1sc040U1p4Q3NIUDFDUFNj?=
 =?utf-8?B?SWxyV0UwaElFYWgyVnIvamRWVjVhWWtmMHlYdXJTMzUyV1g4NnRBVVlUSXNO?=
 =?utf-8?B?SnNjZERaNm5SdklUeTZVSmZacmR1UVgrdW9JelRFa3pzeUZhcnBXZFZSbzlM?=
 =?utf-8?B?aUF1Um5DeEM2NVVqeU96NDBkczVFUGpBcG1kSFdZeVJYUmdWSUcyWm1JcjI2?=
 =?utf-8?B?eHdraVFnSm5ZVWlRVVZJeU5sS1VmcTJrM0VGTW5GZkxBemNWbUdzTWtOOFNH?=
 =?utf-8?B?bDZ6V2k1dDJOWW5wL3lZMkxjM2Vpc0l3YnNVb0FCU2Y0NnpIWFhxenMxcjdT?=
 =?utf-8?B?a1E9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7589067-86d3-44ae-f300-08daa5615816
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2022 17:04:33.7312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IzhqPf0+4Wje9jTks3zguUoV+xdKzaPROeik5d+6ORemEojWJGgHdafn/9O/xblW/oKSAldaE/SDuXKse/Xxqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9818
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Vinod/Ioana,

Ioana, last time you commented [1], you said you were interested in testing
this out on some other SoCs. Did you ever end up doing that? I've you've had
a chance to look at this driver more closely, do you have any suggestions for
dynamic reconfiguration?

[1] https://lore.kernel.org/netdev/GV1PR04MB9055F41AD598F85648B54EE2E0AE9@GV1PR04MB9055.eurprd04.prod.outlook.com/

On 9/26/22 11:35 AM, Sean Anderson wrote:
> 
> 
> On 9/24/22 2:54 AM, Vinod Koul wrote:
>> On 20-09-22, 16:23, Sean Anderson wrote:
>>> This adds support for the Lynx 10G "SerDes" devices found on various NXP
>>> QorIQ SoCs. There may be up to four SerDes devices on each SoC, each
>>> supporting up to eight lanes. Protocol support for each SerDes is highly
>>> heterogeneous, with each SoC typically having a totally different
>>> selection of supported protocols for each lane. Additionally, the SerDes
>>> devices on each SoC also have differing support. One SerDes will
>>> typically support Ethernet on most lanes, while the other will typically
>>> support PCIe on most lanes.
>>> 
>>> There is wide hardware support for this SerDes. It is present on QorIQ
>>> T-Series and Layerscape processors. Because each SoC typically has
>>> specific instructions and exceptions for its SerDes, I have limited the
>>> initial scope of this module to just the LS1046A and LS1088A.
>>> Additionally, I have only added support for Ethernet protocols. There is
>>> not a great need for dynamic reconfiguration for other protocols (except
>>> perhaps for M.2 cards), so support for them may never be added.
>>> 
>>> Nevertheless, I have tried to provide an obvious path for adding support
>>> for other SoCs as well as other protocols. SATA just needs support for
>>> configuring LNmSSCR0. PCIe may need to configure the equalization
>>> registers. It also uses multiple lanes. I have tried to write the driver
>>> with multi-lane support in mind, so there should not need to be any
>>> large changes. Although there are 6 protocols supported, I have only
>>> tested SGMII and XFI. The rest have been implemented as described in
>>> the datasheet. Most of these protocols should work "as-is", but
>>> 10GBASE-KR will need PCS support for link training.
>>> 
>>> The PLLs are modeled as clocks proper. This lets us take advantage of
>>> the existing clock infrastructure. I have not given the same treatment
>>> to the per-lane clocks because they need to be programmed in-concert
>>> with the rest of the lane settings. One tricky thing is that the VCO
>>> (PLL) rate exceeds 2^32 (maxing out at around 5GHz). This will be a
>>> problem on 32-bit platforms, since clock rates are stored as unsigned
>>> longs. To work around this, the pll clock rate is generally treated in
>>> units of kHz.
>>> 
>>> The PLLs are configured rather interestingly. Instead of the usual direct
>>> programming of the appropriate divisors, the input and output clock rates
>>> are selected directly. Generally, the only restriction is that the input
>>> and output must be integer multiples of each other. This suggests some kind
>>> of internal look-up table. The datasheets generally list out the supported
>>> combinations explicitly, and not all input/output combinations are
>>> documented. I'm not sure if this is due to lack of support, or due to an
>>> oversight. If this becomes an issue, then some combinations can be
>>> blacklisted (or whitelisted). This may also be necessary for other SoCs
>>> which have more stringent clock requirements.
>>> 
>>> The general API call list for this PHY is documented under the driver-api
>>> docs. I think this is rather standard, except that most drivers configure
>>> the mode (protocol) at xlate-time. Unlike some other phys where e.g. PCIe
>>> x4 will use 4 separate phys all configured for PCIe, this driver uses one
>>> phy configured to use 4 lanes. This is because while the individual lanes
>>> may be configured individually, the protocol selection acts on all lanes at
>>> once. Additionally, the order which lanes should be configured in is
>>> specified by the datasheet.  To coordinate this, lanes are reserved in
>>> phy_init, and released in phy_exit.
>>> 
>>> This driver was written with reference to the LS1046A reference manual.
>>> However, it was informed by reference manuals for all processors with
>>> mEMACs, especially the T4240 (which appears to have a "maxed-out"
>>> configuration). The earlier P-Series processors appear to be similar, but
>>> have a different overall register layout (using "banks" instead of
>>> separate SerDes). Perhaps this those use a "5G Lynx SerDes."
>>> 
>>> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>>> ---
>>> 
>>> Changes in v6:
>>> - Update MAINTAINERS to include new files
>>> - Include bitfield.h and slab.h to allow compilation on non-arm64
>>>   arches.
>>> - Depend on COMMON_CLK and either layerscape/ppc
>>> 
>>> Changes in v5:
>>> - Remove references to PHY_INTERFACE_MODE_1000BASEKX to allow this
>>>   series to be applied directly to linux/master.
>>> - Add fsl,lynx-10g.h to MAINTAINERS
>>> 
>>> Changes in v4:
>>> - Rework all debug statements to remove use of __func__. Additional
>>>   information has been provided as necessary.
>>> - Consider alternative parent rates in round_rate and not in set_rate.
>>>   Trying to modify out parent's rate in set_rate will deadlock.
>>> - Explicitly perform a stop/reset sequence in set_rate. This way we
>>>   always ensure that the PLL is properly stopped.
>>> - Set the power-down bit when disabling the PLL. We can do this now that
>>>   enable/disable aren't abused during the set rate sequence.
>>> - Fix typos in QSGMII_OFFSET and XFI_OFFSET
>>> - Rename LNmTECR0_TEQ_TYPE_PRE to LNmTECR0_TEQ_TYPE_POST to better
>>>   reflect its function (adding post-cursor equalization).
>>> - Use of_clk_hw_onecell_get instead of a custom function.
>>> - Return struct clks from lynx_clks_init instead of embedding lynx_clk
>>>   in lynx_priv.
>>> - Rework PCCR helper functions; T-series SoCs differ from Layerscape SoCs
>>>   primarily in the layout and offset of the PCCRs. This will help bring a
>>>   cleaner abstraction layer. The caps have been removed, since this handles the
>>>   only current usage.
>>> - Convert to use new binding format. As a result of this, we no longer need to
>>>   have protocols for PCIe or SATA. Additionally, modes now live in lynx_group
>>>   instead of lynx_priv.
>>> - Remove teq from lynx_proto_params, since it can be determined from
>>>   preq_ratio/postq_ratio.
>>> - Fix an early return from lynx_set_mode not releasing serdes->lock.
>>> - Rename lynx_priv.conf to .cfg, since I kept mistyping it.
>>> 
>>> Changes in v3:
>>> - Rename remaining references to QorIQ SerDes to Lynx 10G
>>> - Fix PLL enable sequence by waiting for our reset request to be cleared
>>>   before continuing. Do the same for the lock, even though it isn't as
>>>   critical. Because we will delay for 1.5ms on average, use prepare
>>>   instead of enable so we can sleep.
>>> - Document the status of each protocol
>>> - Fix offset of several bitfields in RECR0
>>> - Take into account PLLRST_B, SDRST_B, and SDEN when considering whether
>>>   a PLL is "enabled."
>>> - Only power off unused lanes.
>>> - Split mode lane mask into first/last lane (like group)
>>> - Read modes from device tree
>>> - Use caps to determine whether KX/KR are supported
>>> - Move modes to lynx_priv
>>> - Ensure that the protocol controller is not already in-use when we try
>>>   to configure a new mode. This should only occur if the device tree is
>>>   misconfigured (e.g. when QSGMII is selected on two lanes but there is
>>>   only one QSGMII controller).
>>> - Split PLL drivers off into their own file
>>> - Add clock for "ext_dly" instead of writing the bit directly (and
>>>   racing with any clock code).
>>> - Use kasprintf instead of open-coding the snprintf dance
>>> - Support 1000BASE-KX in lynx_lookup_proto. This still requires PCS
>>>   support, so nothing is truly "enabled" yet.
>>> 
>>> Changes in v2:
>>> - Rename driver to Lynx 10G (etc.)
>>> - Fix not clearing group->pll after disabling it
>>> - Support 1 and 2 phy-cells
>>> - Power off lanes during probe
>>> - Clear SGMIIaCR1_PCS_EN during probe
>>> - Rename LYNX_PROTO_UNKNOWN to LYNX_PROTO_NONE
>>> - Handle 1000BASE-KX in lynx_proto_mode_prep
>>> 
>>>  Documentation/driver-api/phy/index.rst       |    1 +
>>>  Documentation/driver-api/phy/lynx_10g.rst    |   66 +
>>>  MAINTAINERS                                  |    7 +
>>>  drivers/phy/freescale/Kconfig                |   21 +
>>>  drivers/phy/freescale/Makefile               |    3 +
>>>  drivers/phy/freescale/lynx-10g.h             |   16 +
>>>  drivers/phy/freescale/phy-fsl-lynx-10g-clk.c |  503 ++++++++
>>>  drivers/phy/freescale/phy-fsl-lynx-10g.c     | 1162 ++++++++++++++++++
>>>  8 files changed, 1779 insertions(+)
>>>  create mode 100644 Documentation/driver-api/phy/lynx_10g.rst
>>>  create mode 100644 drivers/phy/freescale/lynx-10g.h
>>>  create mode 100644 drivers/phy/freescale/phy-fsl-lynx-10g-clk.c
>>>  create mode 100644 drivers/phy/freescale/phy-fsl-lynx-10g.c
>>> 
>>> diff --git a/Documentation/driver-api/phy/index.rst b/Documentation/driver-api/phy/index.rst
>>> index 69ba1216de72..c9b7a4698dab 100644
>>> --- a/Documentation/driver-api/phy/index.rst
>>> +++ b/Documentation/driver-api/phy/index.rst
>>> @@ -7,6 +7,7 @@ Generic PHY Framework
>>>  .. toctree::
>>>  
>>>     phy
>>> +   lynx_10g
>>>     samsung-usb2
>>>  
>>>  .. only::  subproject and html
>>> diff --git a/Documentation/driver-api/phy/lynx_10g.rst b/Documentation/driver-api/phy/lynx_10g.rst
>>> new file mode 100644
>>> index 000000000000..6e85dcd8fd71
>>> --- /dev/null
>>> +++ b/Documentation/driver-api/phy/lynx_10g.rst
>>> @@ -0,0 +1,66 @@
>>> +.. SPDX-License-Identifier: GPL-2.0
>>> +
>>> +===========================
>>> +Lynx 10G Phy (QorIQ SerDes)
>>> +===========================
>>> +
>>> +Using this phy
>>> +--------------
>>> +
>>> +The general order of calls should be::
>>> +
>>> +    [devm_][of_]phy_get()
>>> +    phy_init()
>>> +    phy_power_on()
>>> +    phy_set_mode[_ext]()
>>> +    ...
>>> +    phy_power_off()
>>> +    phy_exit()
>>> +    [[of_]phy_put()]
>>> +
>>> +:c:func:`phy_get` just gets (or creates) a new :c:type:`phy` with the lanes
>>> +described in the phandle. :c:func:`phy_init` is what actually reserves the
>>> +lanes for use. Unlike some other drivers, when the phy is created, there is no
>>> +default protocol. :c:func:`phy_set_mode <phy_set_mode_ext>` must be called in
>>> +order to set the protocol.
>> 
>> This should be added/update to Generic phy documenetation and point that
>> from here please
> 
> Not all phy consumers follow this order. phy_set_mode is optional for
> some phys. Same for phy_power_on/phy_init. I know that for this phy,
> these functions must be called in this order, but is this correct for
> all the other phys?
> 
>>> +
>>> +Supporting SoCs
>>> +---------------
>>> +
>>> +Each new SoC needs a :c:type:`struct lynx_conf <lynx_conf>`, containing the
>>> +number of lanes in each device, the endianness of the device, and the helper
>>> +functions to use when selecting protocol controllers. For example, the
>>> +configuration for the LS1046A is::
>>> +
>>> +    static const struct lynx_cfg ls1046a_cfg = {
>>> +        .lanes = 4,
>>> +        .endian = REGMAP_ENDIAN_BIG,
>>> +        .mode_conflict = lynx_ls_mode_conflict,
>>> +        .mode_apply = lynx_ls_mode_apply,
>>> +        .mode_init = lynx_ls_mode_init,
>>> +    };
>>> +
>>> +In addition, you will need to add a device node as documented in
>>> +``Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml``.  This lets the
>>> +driver know which lanes are available to configure.
>>> +
>>> +Supporting Protocols
>>> +--------------------
>>> +
>>> +Each protocol is a combination of values which must be programmed into the lane
>>> +registers. To add a new protocol, first add it to :c:type:`enum lynx_protocol
>>> +<lynx_protocol>`. Add a new entry to `lynx_proto_params`, and populate the
>>> +appropriate fields. Modify `lynx_lookup_proto` to map the :c:type:`enum
>>> +phy_mode <phy_mode>` to :c:type:`enum lynx_protocol <lynx_protocol>`. Update
>>> +the ``mode_conflict``, ``mode_apply``, and ``mode_init`` helpers are updated to
>>> +support your protocol.
>>> +
>>> +You may need to modify :c:func:`lynx_set_mode` in order to support your
>>> +protocol. This can happen when you have added members to :c:type:`struct
>>> +lynx_proto_params <lynx_proto_params>`. It can also happen if you have specific
>>> +clocking requirements, or protocol-specific registers to program.
>>> +
>>> +Internal API Reference
>>> +----------------------
>>> +
>>> +.. kernel-doc:: drivers/phy/freescale/phy-fsl-lynx-10g.c
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index d6b617bfd1bd..216a75e2eb2e 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -11974,6 +11974,13 @@ S:	Maintained
>>>  W:	http://linux-test-project.github.io/
>>>  T:	git git://github.com/linux-test-project/ltp.git
>>>  
>>> +LYNX 10G SERDES DRIVER
>>> +M:	Sean Anderson <sean.anderson@seco.com>
>>> +S:	Maintained
>>> +F:	Documentation/driver-api/phy/lynx_10g.rst
>>> +F:	drivers/phy/freescale/*lynx-10g*
>>> +F:	include/dt-bindings/clock/fsl,lynx-10g.h
>>> +
>>>  LYNX 28G SERDES PHY DRIVER
>>>  M:	Ioana Ciornei <ioana.ciornei@nxp.com>
>>>  L:	netdev@vger.kernel.org
>>> diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
>>> index 853958fb2c06..40d3bfb36076 100644
>>> --- a/drivers/phy/freescale/Kconfig
>>> +++ b/drivers/phy/freescale/Kconfig
>>> @@ -47,3 +47,24 @@ config PHY_FSL_LYNX_28G
>>>  	  found on NXP's Layerscape platforms such as LX2160A.
>>>  	  Used to change the protocol running on SerDes lanes at runtime.
>>>  	  Only useful for a restricted set of Ethernet protocols.
>>> +
>>> +config PHY_FSL_LYNX_10G
>>> +	tristate "Freescale QorIQ Lynx 10G SerDes support"
>>> +	depends on COMMON_CLK
>>> +	depends on ARCH_LAYERSCAPE || PPC || COMPILE_TEST
>>> +	select GENERIC_PHY
>>> +	select REGMAP_MMIO
>>> +	help
>>> +	  This adds support for the Lynx "SerDes" devices found on various QorIQ
>>> +	  SoCs. There may be up to four SerDes devices on each SoC, and each
>>> +	  device supports up to eight lanes. The SerDes is configured by default
>>> +	  by the RCW, but this module is necessary in order to support dynamic
>>> +	  reconfiguration (such as to support 1G and 10G ethernet on the same
>>> +	  interface). The hardware supports a variety of protocols, including
>>> +	  Ethernet, SATA, PCIe, and more exotic links such as Interlaken and
>>> +	  Aurora. This driver only supports Ethernet, but it will try not to
>>> +	  touch lanes configured for other protocols.
>>> +
>>> +	  If you have a QorIQ processor and want to dynamically reconfigure your
>>> +	  SerDes, say Y. If this driver is compiled as a module, it will be
>>> +	  named phy-fsl-lynx-10g-drv.
>>> diff --git a/drivers/phy/freescale/Makefile b/drivers/phy/freescale/Makefile
>>> index cedb328bc4d2..1f18936507e0 100644
>>> --- a/drivers/phy/freescale/Makefile
>>> +++ b/drivers/phy/freescale/Makefile
>>> @@ -3,4 +3,7 @@ obj-$(CONFIG_PHY_FSL_IMX8MQ_USB)	+= phy-fsl-imx8mq-usb.o
>>>  obj-$(CONFIG_PHY_MIXEL_LVDS_PHY)	+= phy-fsl-imx8qm-lvds-phy.o
>>>  obj-$(CONFIG_PHY_MIXEL_MIPI_DPHY)	+= phy-fsl-imx8-mipi-dphy.o
>>>  obj-$(CONFIG_PHY_FSL_IMX8M_PCIE)	+= phy-fsl-imx8m-pcie.o
>>> +phy-fsl-lynx-10g-drv-y			+= phy-fsl-lynx-10g.o
>>> +phy-fsl-lynx-10g-drv-y			+= phy-fsl-lynx-10g-clk.o
>> 
>> You should use a single line for this or even better:
>> 
>> obj-$(CONFIG_PHY_FSL_LYNX_10G)               += phy-fsl-lynx-10g.o phy-fsl-lynx-10g-clk.o
> 
> Doesn't this create two modules?
> 
>>> +obj-$(CONFIG_PHY_FSL_LYNX_10G)		+= phy-fsl-lynx-10g-drv.o
>>>  obj-$(CONFIG_PHY_FSL_LYNX_28G)		+= phy-fsl-lynx-28g.o
>>> diff --git a/drivers/phy/freescale/lynx-10g.h b/drivers/phy/freescale/lynx-10g.h
>>> new file mode 100644
>>> index 000000000000..75d9353a867b
>>> --- /dev/null
>>> +++ b/drivers/phy/freescale/lynx-10g.h
>>> @@ -0,0 +1,16 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * Copyright (C) 2022 Sean Anderson <sean.anderson@seco.com>
>>> + */
>>> +
>>> +#ifndef LYNX_10G
>>> +#define LYNX_10G
>>> +
>>> +struct clk;
>>> +struct device;
>>> +struct regmap;
>> 
>> why do you want to forward declaration for these?
>> 
>>> +
>>> +int lynx_clks_init(struct device *dev, struct regmap *regmap,
>>> +		   struct clk *plls[2], struct clk *ex_dlys[2]);
> 
> These structs are used here.
> 
>>> +#endif /* LYNX 10G */
>>> diff --git a/drivers/phy/freescale/phy-fsl-lynx-10g-clk.c b/drivers/phy/freescale/phy-fsl-lynx-10g-clk.c
>>> new file mode 100644
>>> index 000000000000..6ec32bdfb9dd
>>> --- /dev/null
>>> +++ b/drivers/phy/freescale/phy-fsl-lynx-10g-clk.c
>>> @@ -0,0 +1,503 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Copyright (C) 2022 Sean Anderson <sean.anderson@seco.com>
>>> + *
>>> + * This file contains the implementation for the PLLs found on Lynx 10G phys.
>>> + *
>>> + * XXX: The VCO rate of the PLLs can exceed ~4GHz, which is the maximum rate
>>> + * expressable in an unsigned long. To work around this, rates are specified in
>>> + * kHz. This is as if there was a division by 1000 in the PLL.
>>> + */
>>> +
>>> +#include <linux/clk.h>
>>> +#include <linux/clk-provider.h>
>>> +#include <linux/device.h>
>>> +#include <linux/bitfield.h>
>>> +#include <linux/math64.h>
>>> +#include <linux/regmap.h>
>>> +#include <linux/slab.h>
>>> +#include <linux/units.h>
>>> +#include <dt-bindings/clock/fsl,lynx-10g.h>
>>> +
>>> +#include "lynx-10g.h"
>>> +
>>> +#define PLL_STRIDE	0x20
>>> +#define PLLa(a, off)	((a) * PLL_STRIDE + (off))
>>> +#define PLLaRSTCTL(a)	PLLa(a, 0x00)
>>> +#define PLLaCR0(a)	PLLa(a, 0x04)
>>> +
>>> +#define PLLaRSTCTL_RSTREQ	BIT(31)
>>> +#define PLLaRSTCTL_RST_DONE	BIT(30)
>>> +#define PLLaRSTCTL_RST_ERR	BIT(29)
>>> +#define PLLaRSTCTL_PLLRST_B	BIT(7)
>>> +#define PLLaRSTCTL_SDRST_B	BIT(6)
>>> +#define PLLaRSTCTL_SDEN		BIT(5)
>>> +
>>> +#define PLLaRSTCTL_ENABLE_SET	(PLLaRSTCTL_RST_DONE | PLLaRSTCTL_PLLRST_B | \
>>> +				 PLLaRSTCTL_SDRST_B | PLLaRSTCTL_SDEN)
>>> +#define PLLaRSTCTL_ENABLE_MASK	(PLLaRSTCTL_ENABLE_SET | PLLaRSTCTL_RST_ERR)
>>> +
>>> +#define PLLaCR0_POFF		BIT(31)
>>> +#define PLLaCR0_RFCLK_SEL	GENMASK(30, 28)
>>> +#define PLLaCR0_PLL_LCK		BIT(23)
>>> +#define PLLaCR0_FRATE_SEL	GENMASK(19, 16)
>>> +#define PLLaCR0_DLYDIV_SEL	GENMASK(1, 0)
>>> +
>>> +#define PLLaCR0_DLYDIV_SEL_16		0b01
>>> +
>>> +/**
>>> + * struct lynx_clk - Driver data for the PLLs
>>> + * @pll: The PLL clock
>>> + * @ex_dly: The "PLLa_ex_dly_clk" clock
>>> + * @ref: Our reference clock
>>> + * @dev: The serdes device
>>> + * @regmap: Our registers
>>> + * @idx: Which PLL this clock is for
>>> + */
>>> +struct lynx_clk {
>>> +	struct clk_hw pll, ex_dly;
>>> +	struct clk_hw *ref;
>>> +	struct device *dev;
>>> +	struct regmap *regmap;
>>> +	unsigned int idx;
>>> +};
>>> +
>>> +static u32 lynx_read(struct lynx_clk *clk, u32 reg)
>>> +{
>>> +	unsigned int ret = 0;
>>> +
>>> +	WARN_ON_ONCE(regmap_read(clk->regmap, reg, &ret));
>>> +	return ret;
>>> +}
>>> +
>>> +static void lynx_write(struct lynx_clk *clk, u32 val, u32 reg)
>>> +{
>>> +	WARN_ON_ONCE(regmap_write(clk->regmap, reg, val));
>>> +}
>>> +
>>> +static struct lynx_clk *lynx_pll_to_clk(struct clk_hw *hw)
>>> +{
>>> +	return container_of(hw, struct lynx_clk, pll);
>>> +}
>>> +
>>> +static struct lynx_clk *lynx_ex_dly_to_clk(struct clk_hw *hw)
>>> +{
>>> +	return container_of(hw, struct lynx_clk, ex_dly);
>>> +}
>>> +
>>> +static void lynx_pll_stop(struct lynx_clk *clk)
>>> +{
>>> +	u32 rstctl;
>>> +
>>> +	rstctl = lynx_read(clk, PLLaRSTCTL(clk->idx));
>>> +	rstctl &= ~PLLaRSTCTL_SDRST_B;
>>> +	lynx_write(clk, rstctl, PLLaRSTCTL(clk->idx));
>>> +
>>> +	ndelay(50);
>>> +
>>> +	rstctl = lynx_read(clk, PLLaRSTCTL(clk->idx));
>>> +	rstctl &= ~(PLLaRSTCTL_SDEN | PLLaRSTCTL_PLLRST_B);
>>> +	lynx_write(clk, rstctl, PLLaRSTCTL(clk->idx));
>>> +
>>> +	ndelay(100);
>>> +}
>>> +
>>> +static void lynx_pll_disable(struct clk_hw *hw)
>>> +{
>>> +	struct lynx_clk *clk = lynx_pll_to_clk(hw);
>>> +	u32 cr0;
>>> +
>>> +	dev_dbg(clk->dev, "disable pll%d\n", clk->idx);
>>> +
>>> +	lynx_pll_stop(clk);
>>> +
>>> +	cr0 = lynx_read(clk, PLLaCR0(clk->idx));
>>> +	cr0 |= PLLaCR0_POFF;
>>> +	lynx_write(clk, cr0, PLLaCR0(clk->idx));
>>> +}
>>> +
>>> +static int lynx_pll_reset(struct lynx_clk *clk)
>>> +{
>>> +	int ret;
>>> +	u32 rstctl = lynx_read(clk, PLLaRSTCTL(clk->idx));
>>> +
>>> +	rstctl |= PLLaRSTCTL_RSTREQ;
>>> +	lynx_write(clk, rstctl, PLLaRSTCTL(clk->idx));
>>> +	ret = read_poll_timeout(lynx_read, rstctl,
>>> +				rstctl & (PLLaRSTCTL_RST_DONE | PLLaRSTCTL_RST_ERR),
>>> +				100, 5000, true, clk, PLLaRSTCTL(clk->idx));
>>> +	if (rstctl & PLLaRSTCTL_RST_ERR)
>>> +		ret = -EIO;
>>> +	if (ret) {
>>> +		dev_err(clk->dev, "pll%d reset failed\n", clk->idx);
>>> +		return ret;
>>> +	}
>>> +
>>> +	rstctl |= PLLaRSTCTL_SDEN | PLLaRSTCTL_PLLRST_B | PLLaRSTCTL_SDRST_B;
>>> +	lynx_write(clk, rstctl, PLLaRSTCTL(clk->idx));
>>> +	return 0;
>>> +}
>>> +
>>> +static int lynx_pll_prepare(struct clk_hw *hw)
>>> +{
>>> +	struct lynx_clk *clk = lynx_pll_to_clk(hw);
>>> +	u32 rstctl = lynx_read(clk, PLLaRSTCTL(clk->idx));
>>> +	u32 cr0 = lynx_read(clk, PLLaCR0(clk->idx));
>>> +
>>> +	/*
>>> +	 * "Enabling" the PLL involves resetting it (and all attached lanes).
>>> +	 * Avoid doing this if we are already enabled.
>>> +	 */
>>> +	if (!(cr0 & PLLaCR0_POFF) &&
>>> +	    (rstctl & PLLaRSTCTL_ENABLE_MASK) == PLLaRSTCTL_ENABLE_SET) {
>>> +		dev_dbg(clk->dev, "pll%d already prepared\n", clk->idx);
>>> +		return 0;
>>> +	}
>>> +
>>> +	dev_dbg(clk->dev, "prepare pll%d\n", clk->idx);
>>> +
>>> +	cr0 &= ~PLLaCR0_POFF;
>>> +	lynx_write(clk, cr0, PLLaCR0(clk->idx));
>>> +
>>> +	return lynx_pll_reset(clk);
>>> +}
>>> +
>>> +static int lynx_pll_is_enabled(struct clk_hw *hw)
>>> +{
>>> +	struct lynx_clk *clk = lynx_pll_to_clk(hw);
>>> +	u32 cr0 = lynx_read(clk, PLLaCR0(clk->idx));
>>> +	bool enabled = !(cr0 & PLLaCR0_POFF);
>>> +
>>> +	dev_dbg(clk->dev, "pll%d %s enabled\n", clk->idx,
>>> +		enabled ? "is" : "is not");
>>> +
>>> +	return enabled;
>>> +}
>>> +
>>> +static const u32 rfclk_sel_map[8] = {
>>> +	[0b000] = 100000000,
>>> +	[0b001] = 125000000,
>>> +	[0b010] = 156250000,
>>> +	[0b011] = 150000000,
>>> +};
>>> +
>>> +/**
>>> + * lynx_rfclk_to_sel() - Convert a reference clock rate to a selector
>>> + * @rate: The reference clock rate
>>> + *
>>> + * To allow for some variation in the reference clock rate, up to 100ppm of
>>> + * error is allowed.
>>> + *
>>> + * Return: An appropriate selector for @rate, or -%EINVAL.
>>> + */
>>> +static int lynx_rfclk_to_sel(u32 rate)
>>> +{
>>> +	int ret;
>>> +
>>> +	for (ret = 0; ret < ARRAY_SIZE(rfclk_sel_map); ret++) {
>>> +		u32 rfclk_rate = rfclk_sel_map[ret];
>>> +		/* Allow an error of 100ppm */
>>> +		u32 error = rfclk_rate / 10000;
>>> +
>>> +		if (rate > rfclk_rate - error && rate < rfclk_rate + error)
>>> +			return ret;
>>> +	}
>>> +
>>> +	return -EINVAL;
>>> +}
>>> +
>>> +static const u32 frate_sel_map[16] = {
>>> +	[0b0000] = 5000000,
>>> +	[0b0101] = 3750000,
>>> +	[0b0110] = 5156250,
>>> +	[0b0111] = 4000000,
>>> +	[0b1001] = 3125000,
>>> +	[0b1010] = 3000000,
>>> +};
>>> +
>>> +/**
>>> + * lynx_frate_to_sel() - Convert a VCO clock rate to a selector
>>> + * @rate_khz: The VCO frequency, in kHz
>>> + *
>>> + * Return: An appropriate selector for @rate_khz, or -%EINVAL.
>>> + */
>>> +static int lynx_frate_to_sel(u32 rate_khz)
>>> +{
>>> +	int ret;
>>> +
>>> +	for (ret = 0; ret < ARRAY_SIZE(frate_sel_map); ret++)
>>> +		if (frate_sel_map[ret] == rate_khz)
>>> +			return ret;
>>> +
>>> +	return -EINVAL;
>>> +}
>>> +
>>> +static u32 lynx_pll_ratio(u32 frate_sel, u32 rfclk_sel)
>>> +{
>>> +	u64 frate;
>>> +	u32 rfclk, error, ratio;
>>> +
>>> +	frate = frate_sel_map[frate_sel] * (u64)HZ_PER_KHZ;
>>> +	rfclk = rfclk_sel_map[rfclk_sel];
>>> +
>>> +	if (!frate || !rfclk)
>>> +		return 0;
>>> +
>>> +	ratio = div_u64_rem(frate, rfclk, &error);
>>> +	if (!error)
>>> +		return ratio;
>>> +	return 0;
>>> +}
>>> +
>>> +static unsigned long lynx_pll_recalc_rate(struct clk_hw *hw,
>>> +					  unsigned long parent_rate)
>>> +{
>>> +	struct lynx_clk *clk = lynx_pll_to_clk(hw);
>>> +	u32 cr0 = lynx_read(clk, PLLaCR0(clk->idx));
>>> +	u32 frate_sel = FIELD_GET(PLLaCR0_FRATE_SEL, cr0);
>>> +	u32 rfclk_sel = FIELD_GET(PLLaCR0_RFCLK_SEL, cr0);
>>> +	u32 ratio = lynx_pll_ratio(frate_sel, rfclk_sel);
>>> +	unsigned long ret;
>>> +
>>> +	/* Ensure that the parent matches our rfclk selector */
>>> +	if (rfclk_sel == lynx_rfclk_to_sel(parent_rate))
>>> +		ret = mult_frac(parent_rate, ratio, HZ_PER_KHZ);
>>> +	else
>>> +		ret = 0;
>>> +
>>> +	dev_dbg(clk->dev, "recalc pll%d new=%llu parent=%lu\n", clk->idx,
>>> +		(u64)ret * HZ_PER_KHZ, parent_rate);
>>> +	return ret;
>>> +}
>>> +
>>> +static long lynx_pll_round_rate(struct clk_hw *hw, unsigned long rate_khz,
>>> +				unsigned long *parent_rate)
>>> +{
>>> +	int frate_sel, rfclk_sel;
>>> +	struct lynx_clk *clk = lynx_pll_to_clk(hw);
>>> +	u32 ratio;
>>> +
>>> +	dev_dbg(clk->dev, "round pll%d new=%llu parent=%lu\n", clk->idx,
>>> +		(u64)rate_khz * HZ_PER_KHZ, *parent_rate);
>>> +
>>> +	frate_sel = lynx_frate_to_sel(rate_khz);
>>> +	if (frate_sel < 0)
>>> +		return frate_sel;
>>> +
>>> +	/* Try the current parent rate */
>>> +	rfclk_sel = lynx_rfclk_to_sel(*parent_rate);
>>> +	if (rfclk_sel >= 0) {
>>> +		ratio = lynx_pll_ratio(frate_sel, rfclk_sel);
>>> +		if (ratio)
>>> +			return mult_frac(*parent_rate, ratio, HZ_PER_KHZ);
>>> +	}
>>> +
>>> +	/* Try all possible parent rates */
>>> +	for (rfclk_sel = 0;
>>> +	     rfclk_sel < ARRAY_SIZE(rfclk_sel_map);
>>> +	     rfclk_sel++) {
>>> +		unsigned long new_parent_rate;
>>> +
>>> +		ratio = lynx_pll_ratio(frate_sel, rfclk_sel);
>>> +		if (!ratio)
>>> +			continue;
>>> +
>>> +		/* Ensure the reference clock can produce this rate */
>>> +		new_parent_rate = rfclk_sel_map[rfclk_sel];
>>> +		new_parent_rate = clk_hw_round_rate(clk->ref, new_parent_rate);
>>> +		if (rfclk_sel != lynx_rfclk_to_sel(new_parent_rate))
>>> +			continue;
>>> +
>>> +		*parent_rate = new_parent_rate;
>>> +		return mult_frac(new_parent_rate, ratio, HZ_PER_KHZ);
>>> +	}
>>> +
>>> +	return -EINVAL;
>>> +}
>>> +
>>> +static int lynx_pll_set_rate(struct clk_hw *hw, unsigned long rate_khz,
>>> +			   unsigned long parent_rate)
>>> +{
>>> +	int frate_sel, rfclk_sel;
>>> +	struct lynx_clk *clk = lynx_pll_to_clk(hw);
>>> +	u32 ratio, cr0 = lynx_read(clk, PLLaCR0(clk->idx));
>>> +
>>> +	dev_dbg(clk->dev, "set rate pll%d new=%llu parent=%lu\n", clk->idx,
>>> +		(u64)rate_khz * HZ_PER_KHZ, parent_rate);
>>> +
>>> +	frate_sel = lynx_frate_to_sel(rate_khz);
>>> +	if (frate_sel < 0)
>>> +		return frate_sel;
>>> +
>>> +	rfclk_sel = lynx_rfclk_to_sel(parent_rate);
>>> +	if (rfclk_sel < 0)
>>> +		return rfclk_sel;
>>> +
>>> +	ratio = lynx_pll_ratio(frate_sel, rfclk_sel);
>>> +	if (!ratio)
>>> +		return -EINVAL;
>>> +
>>> +	lynx_pll_stop(clk);
>>> +	cr0 &= ~(PLLaCR0_RFCLK_SEL | PLLaCR0_FRATE_SEL);
>>> +	cr0 |= FIELD_PREP(PLLaCR0_RFCLK_SEL, rfclk_sel);
>>> +	cr0 |= FIELD_PREP(PLLaCR0_FRATE_SEL, frate_sel);
>>> +	lynx_write(clk, cr0, PLLaCR0(clk->idx));
>>> +	/* Don't bother resetting if it's off */
>>> +	if (cr0 & PLLaCR0_POFF)
>>> +		return 0;
>>> +	return lynx_pll_reset(clk);
>>> +}
>>> +
>>> +static const struct clk_ops lynx_pll_clk_ops = {
>>> +	.prepare = lynx_pll_prepare,
>>> +	.disable = lynx_pll_disable,
>>> +	.is_enabled = lynx_pll_is_enabled,
>>> +	.recalc_rate = lynx_pll_recalc_rate,
>>> +	.round_rate = lynx_pll_round_rate,
>>> +	.set_rate = lynx_pll_set_rate,
>>> +};
>>> +
>>> +static void lynx_ex_dly_disable(struct clk_hw *hw)
>>> +{
>>> +	struct lynx_clk *clk = lynx_ex_dly_to_clk(hw);
>>> +	u32 cr0 = lynx_read(clk, PLLaCR0(clk->idx));
>>> +
>>> +	cr0 &= ~PLLaCR0_DLYDIV_SEL;
>>> +	lynx_write(clk, PLLaCR0(clk->idx), cr0);
>>> +}
>>> +
>>> +static int lynx_ex_dly_enable(struct clk_hw *hw)
>>> +{
>>> +	struct lynx_clk *clk = lynx_ex_dly_to_clk(hw);
>>> +	u32 cr0 = lynx_read(clk, PLLaCR0(clk->idx));
>>> +
>>> +	cr0 &= ~PLLaCR0_DLYDIV_SEL;
>>> +	cr0 |= FIELD_PREP(PLLaCR0_DLYDIV_SEL, PLLaCR0_DLYDIV_SEL_16);
>>> +	lynx_write(clk, PLLaCR0(clk->idx), cr0);
>>> +	return 0;
>>> +}
>>> +
>>> +static int lynx_ex_dly_is_enabled(struct clk_hw *hw)
>>> +{
>>> +	struct lynx_clk *clk = lynx_ex_dly_to_clk(hw);
>>> +
>>> +	return lynx_read(clk, PLLaCR0(clk->idx)) & PLLaCR0_DLYDIV_SEL;
>>> +}
>>> +
>>> +static unsigned long lynx_ex_dly_recalc_rate(struct clk_hw *hw,
>>> +					     unsigned long parent_rate)
>>> +{
>>> +	return parent_rate / 16;
>>> +}
>>> +
>>> +static const struct clk_ops lynx_ex_dly_clk_ops = {
>>> +	.enable = lynx_ex_dly_enable,
>>> +	.disable = lynx_ex_dly_disable,
>>> +	.is_enabled = lynx_ex_dly_is_enabled,
>>> +	.recalc_rate = lynx_ex_dly_recalc_rate,
>>> +};
>>> +
>>> +static int lynx_clk_init(struct clk_hw_onecell_data *hw_data,
>>> +			 struct device *dev, struct regmap *regmap,
>>> +			 unsigned int index)
>>> +{
>>> +	const struct clk_hw *pll_parents, *ex_dly_parents;
>>> +	struct clk_init_data pll_init = {
>>> +		.ops = &lynx_pll_clk_ops,
>>> +		.parent_hws = &pll_parents,
>>> +		.num_parents = 1,
>>> +		.flags = CLK_GET_RATE_NOCACHE | CLK_SET_RATE_PARENT |
>>> +			 CLK_OPS_PARENT_ENABLE,
>>> +	};
>>> +	struct clk_init_data ex_dly_init = {
>>> +		.ops = &lynx_ex_dly_clk_ops,
>>> +		.parent_hws = &ex_dly_parents,
>>> +		.num_parents = 1,
>>> +	};
>>> +	struct clk *ref;
>>> +	struct lynx_clk *clk;
>>> +	char *ref_name;
>>> +	int ret;
>>> +
>>> +	clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
>>> +	if (!clk)
>>> +		return -ENOMEM;
>>> +
>>> +	clk->dev = dev;
>>> +	clk->regmap = regmap;
>>> +	clk->idx = index;
>>> +
>>> +	ref_name = kasprintf(GFP_KERNEL, "ref%d", index);
>>> +	pll_init.name = kasprintf(GFP_KERNEL, "%s.pll%d_khz", dev_name(dev),
>>> +				  index);
>>> +	ex_dly_init.name = kasprintf(GFP_KERNEL, "%s.pll%d_ex_dly_khz",
>>> +				     dev_name(dev), index);
>>> +	if (!ref_name || !pll_init.name || !ex_dly_init.name) {
>>> +		ret = -ENOMEM;
>>> +		goto out;
>>> +	}
>>> +
>>> +	ref = devm_clk_get(dev, ref_name);
>>> +	if (IS_ERR(clk->ref)) {
>>> +		ret = PTR_ERR(clk->ref);
>>> +		dev_err_probe(dev, ret, "could not get %s\n", ref_name);
>>> +		goto out;
>>> +	}
>>> +
>>> +	clk->ref = __clk_get_hw(ref);
>>> +	pll_parents = clk->ref;
>>> +	clk->pll.init = &pll_init;
>>> +	ret = devm_clk_hw_register(dev, &clk->pll);
>>> +	if (ret) {
>>> +		dev_err_probe(dev, ret, "could not register %s\n",
>>> +			      pll_init.name);
>>> +		goto out;
>>> +	}
>>> +
>>> +	ex_dly_parents = &clk->pll;
>>> +	clk->ex_dly.init = &ex_dly_init;
>>> +	ret = devm_clk_hw_register(dev, &clk->ex_dly);
>>> +	if (ret)
>>> +		dev_err_probe(dev, ret, "could not register %s\n",
>>> +			      ex_dly_init.name);
>>> +
>>> +	hw_data->hws[LYNX10G_PLLa(index)] = &clk->pll;
>>> +	hw_data->hws[LYNX10G_PLLa_EX_DLY(index)] = &clk->ex_dly;
>>> +
>>> +out:
>>> +	kfree(ref_name);
>>> +	kfree(pll_init.name);
>>> +	kfree(ex_dly_init.name);
>>> +	return ret;
>>> +}
>>> +
>>> +#define NUM_PLLS 2
>>> +#define NUM_CLKS (NUM_PLLS * LYNX10G_CLKS_PER_PLL)
>>> +
>>> +int lynx_clks_init(struct device *dev, struct regmap *regmap,
>>> +		   struct clk *plls[2], struct clk *ex_dlys[2])
>>> +{
>>> +	int ret, i;
>>> +	struct clk_hw_onecell_data *hw_data;
>>> +
>>> +	hw_data = devm_kzalloc(dev, struct_size(hw_data, hws, NUM_CLKS),
>>> +			       GFP_KERNEL);
>>> +	if (!hw_data)
>>> +		return -ENOMEM;
>>> +	hw_data->num = NUM_CLKS;
>>> +
>>> +	for (i = 0; i < NUM_PLLS; i++) {
>>> +		ret = lynx_clk_init(hw_data, dev, regmap, i);
>>> +		if (ret)
>>> +			return ret;
>>> +
>>> +		plls[i] = hw_data->hws[LYNX10G_PLLa(i)]->clk;
>>> +		ex_dlys[i] = hw_data->hws[LYNX10G_PLLa_EX_DLY(i)]->clk;
>>> +	}
>>> +
>>> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, hw_data);
>>> +	if (ret)
>>> +		dev_err_probe(dev, ret, "could not register clock provider\n");
>>> +
>>> +	return ret;
>>> +}
>> 
>> Why is this not a clock driver in drivers/clk/ ?
> 
> Because it is closely integrated with the phy. IMO it should really live
> in the very same file as the phy driver itself, due to how closely
> related they are. AFAIK there are no other hardware consumers of these
> PLLs other than the SerDes.
> 
>>> +#define abs_diff(a, b) ({ \
>>> +	typeof(a) _a = (a); \
>>> +	typeof(b) _b = (b); \
>>> +	_a > _b ? _a - _b : _b - _a; \
>>> +})
>> 
>> are you sure there is not existing helper which can help you with this?
> 
> From what I can tell, there is no existing helper. Maybe there should be.
> 
> --Sean

Are my above responses satisfactory? I noticed that they are fairly similar to
what you remarked last time [2]. In several cases I gave similar responses, but
you never acknowledged them. I am worried that we are talking past each other...

--Sean

[2] https://lore.kernel.org/linux-phy/YsPWMYjyu2nyk+w8@matsya/
