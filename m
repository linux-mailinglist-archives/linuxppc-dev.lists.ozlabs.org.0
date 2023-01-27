Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC1D67EA7F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 17:12:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3MzW2bk9z3fHX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 03:12:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=kRSJYL5Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.8.82; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=kRSJYL5Z;
	dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2082.outbound.protection.outlook.com [40.107.8.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3MyX4TJSz3fCW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 03:11:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OTYjyVz6ehW3fFHKzRUXl9f8Tjvuq+S0MgyKDuIskp+UK9zGEf/taGxsNIAxmF38cthq1CoPi6NBAiSWeSBIuw7Em9WlGqImtLHIJpShO9y3uqj+1g2pobizoWWyra9aShBw5jAkOJIoIBWBbO3mT/XIznRj4sra7EgW2M3322VZbm4kT5RrpyBdPmDuTJEXseFNxCQLx7TcDeSAK9UO+Sx5I8iyYBiqkozLdLqidu2Y8Tn36VtJgwGUsxsiKOB2dcM7dMSE5e/JjOTdupW8ULnpsjuFmH6OtyuflUthvOv4dtFc37aveNFZ6cWbKmio50JHOeX+JZdlTdwXd3dxfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=piP1oJ1R48JdRpBIHsO8vpfRD0Az2uyL0w0yoMYALeM=;
 b=M2W/AfPbVUp5Nv4KPZ1ee9bv5ZrFI57dB4QH7m4zpScavpbRGR5q0M5HY5DaL6CdNaltjWLq0oSX3FIVF3jWXCPjNnXEPZ/oFgkJKIwBDV9myX/HoIR2c99jR1qA4RpOZJZwo5WzKpzn2Jp3khACgIGFQHZtQvjsTyHvNRWHyufA0bs+XKy6SiEuhxIFpsnaVNkR2tSGkf8tsk9K12mgU2lTL4mxqDu7/9PGJP89RavhcPYYrgfHEMmgKQ8Uygp1PcH24AblitYTPFDrVCIAV78mRf1iCoZBbVhDoAxIOjFECH9ltzWo1RWeHQU6mSX2ONdIXNoxxDqCnNqdAmS6Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=piP1oJ1R48JdRpBIHsO8vpfRD0Az2uyL0w0yoMYALeM=;
 b=kRSJYL5Z2LWXgZHryHq3j6biEJbtDBs1NwkDqcJZ533oP7+Br5bVwaU58IcPanCe0kpD4bEcB7boyVb1ZwjxsiDZyn4P4dKRmim40Hk91aJhsa1dLJBOqP+3rELS1UhnuXZr4/WJdVciQiwEM4TzMc1o1TBXdA+MbLJx/So4RKhW3bWEZbwYFAsSFmGz7RmTGwK8ZBrcRHawsk3ZYdEaIePnZ7rrBnyoo64JGbXKk0AEx331NjCQPde4HRwln24D+FSXot2J9UBJrudSqXbjxWj110fa9mW/GQblR2QLjKFG6EqwwBdNRp5XBCY/3vvwaMOs3Hcw7sdaXfLUneMdDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS4PR03MB8316.eurprd03.prod.outlook.com (2603:10a6:20b:507::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 16:11:10 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::6b03:ac16:24b5:9166]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::6b03:ac16:24b5:9166%2]) with mapi id 15.20.6043.022; Fri, 27 Jan 2023
 16:11:10 +0000
Message-ID: <20a9070f-9673-2f51-97df-68e78c37d894@seco.com>
Date: Fri, 27 Jan 2023 11:11:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v9 07/10] arm64: dts: ls1046ardb: Add serdes bindings
Content-Language: en-US
To: Shawn Guo <shawnguo@kernel.org>
References: <20221230000139.2846763-1-sean.anderson@seco.com>
 <20221230000139.2846763-8-sean.anderson@seco.com>
 <20230125234335.GC20713@T480> <8074f0be-8a70-a937-49f2-123e0bfc6218@seco.com>
 <20230127075248.GL20713@T480>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20230127075248.GL20713@T480>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR01CA0058.prod.exchangelabs.com (2603:10b6:208:23f::27)
 To DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB8847:EE_|AS4PR03MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c78007f-ba2b-4cc6-2dee-08db00811a93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	udWF1/CgGymhAHIrhQpSrh9jYfBugE3BQtlVT5ISOO37bmirYFq1Y6QeixPbOCn1wgJgNW44FrScRsDHcHfTWhaYUoB3IWJ+7HBfN4Oyhupou+Q0AgNaKHicedRqPwrux3+W518YfmNOD2W1YXF8KfF7AHQNLZTfqUR6OAOnsU6tNdrGE5oCYev5PLSglgLDrfRmqqIsD/YpAaJYqRjVgHVZeE48sSpM2Bk2SXE5fI9A0hfe/gajLAGYGHiDlqkiGvV9SQ6MNGed6kjrXvrro/WpPS+ycmh3SzsNnvzaN8GEGVZ6WaoivcRR4PPsGF4mKAr4r3IWcHT9xSvpcWy/A0U7UTDsbEFki1wInD7JptuoicF086B38lD3TL57aQIIS0nj5KIagrV+1hTr/ayaBhkfTGy37E+2mT6JEwwgfwH/BxCK2lNQrWnSy5Ih9X0X86Ye4XIUeqyZn1gErLKdKXRLGTrtYLK8cVBmtlpLzvjq16LKIuQm75C+2Tsgwh5PrO+QhaeQY7EJsmC22ggG27teMjkjg2vrvp8gV9Gd9TwnPjSzPv7P9ipg1LcBtsgWDA2tiYpuYkrq6T9urLAxzP0hdiRfLJgCAR0Q9EI3lfShYgMCfwcoK5mD70u3mL2Gn5zHjDjV95/Nw4hUobF6osEXMEVPza8K361qnNd2dbaop4isC/6U8aAv/hZNpZG1txxJs3uVJrkvo+JLM8P/8H/7AIKshTFjWHopFXx5BHsliNt4bUsC7XwS+fziR0L8L5UPtkJddkAbnXj1f75ZxfIurA3zVkT+Yhgj2DrYWvA=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(376002)(366004)(39850400004)(346002)(396003)(451199018)(41300700001)(6666004)(26005)(8936002)(86362001)(316002)(66556008)(83380400001)(31696002)(36756003)(54906003)(38100700002)(6916009)(4326008)(66946007)(8676002)(52116002)(38350700002)(966005)(6512007)(2616005)(186003)(53546011)(6486002)(478600001)(6506007)(66476007)(31686004)(44832011)(7416002)(2906002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?eWt5U2tJTWZVWERIL2tuTU5lRk9Fc2VicGFiOWQ0QTVTNHJ6VldhbHZWVjgr?=
 =?utf-8?B?MHA0VFlBZ0hvRFdQVkRvMkpZU1k2eHdwa0paNGlWc0p6clUwRVFWYk5tN3Bn?=
 =?utf-8?B?OUwrMkNtRVhtY01ZTkJNcThXRmJ1RU5xcnhrQkZoZU1DWVJUZis5UVpEZ2tu?=
 =?utf-8?B?OTdxZTlvYVI2aWVWbTZtOWRJTW5UZStmSDZaaCtPN0FkNVNObHoyTzZ3Yjlm?=
 =?utf-8?B?MkwzR1hZRHpVd3BZSE5SQ0d0YTlnZnFsRTJTME1DWnNYd0RUelcwbktZSjc5?=
 =?utf-8?B?WGViSFhIbVh0TTZFeEJXVm9WZjNtcWFCeWNkOWlXSXdBZmRkRTZyR3JoZktO?=
 =?utf-8?B?MVBheWJnRU1ROUlmTnJJM1V1OUxjSGk0ejFWMTNKYkNqTXBvYks4eGRyQk5i?=
 =?utf-8?B?WjN5ZFYxd3JrdDkwVFdQTVhmTE5yQjZmcFgvYVJ3VnF3VUlwMzZQMlpOS0Ey?=
 =?utf-8?B?Uy9JZ2VUR3BiYlRJbllUL1dwTGluZXU5SWdMVzdXc0J2QVhjbW00aTZYZVRx?=
 =?utf-8?B?QndqVEhsS0MrM21BVTZZb3RNOVBXQjZKVmtLVEJZL284aGs2TmZLUmszc3I4?=
 =?utf-8?B?WkFrcnpxa3d0TGxoTWwxWkk1dWtpRlV5Qk43NmtielBRcnAwSVU2aTBzZmNG?=
 =?utf-8?B?NzdBakpraE4yYzIyZW5FOVBMQURGamhLMFQxZzF1d1BsQjh2TG9WOWpFczVs?=
 =?utf-8?B?OXc5RnY0Tk9FWW5rZzhoMU5nMUpsQTRtSFU3SmE3NVFmc0Rid3lpQWh6dUpN?=
 =?utf-8?B?ZGVxMEdHMnR6SWFtMzVpazBkdElWaFhOUnJEY3BlMjlmWXJNS2dBVXVQUDN3?=
 =?utf-8?B?UCt0UENyUFB5Wis4eWtWRFdzSFU0ZEowYXdQamE5dmk1R21MUFV4TXltaXpV?=
 =?utf-8?B?REJxUEM2R0xoMFAvTHRrMEhGVmdsOWNlYW1HcVVLQTZkUUd0cHJRY2NMNURP?=
 =?utf-8?B?bmVQUUN3b1ZhcWgxd3pSZHd5NXUyejdjNXJGSnRzL3dRT0FYNzRzaUk2cVdZ?=
 =?utf-8?B?YldzTGdqcU16ZnBOdDQ1SUVrRXkzTDVsSDVTNi94Y0tyNll0Mmx6dURqY1Vl?=
 =?utf-8?B?bG1RU0dyZ25pa0g3OUFNNWx4K1UyWDVCZDlTLzhnTW1zbDNUWjBpdGxlNUNJ?=
 =?utf-8?B?MnNJQjlNZVI0bTExeTkzaW55b0dxZDFSQk1adEZrZTdldnUzNk4va0l4eUxV?=
 =?utf-8?B?bEhLQlpsN3krTHFsZUJscm1WWWYzVzQ4UTJCWHhONVhzOUk2R0ZQYlpjOWRh?=
 =?utf-8?B?S2JYMzRKTUhKaWplNngzVUtFWGdXS3VTN3kyVytnZ2lpMnBPdXY2Kzd2TDJX?=
 =?utf-8?B?U0d3a3JRdnBVcWJCMWYzZG1JNG1JTXRPbkxNdEQwK0ZUVHlpZkNJVjF1WTNs?=
 =?utf-8?B?V0UyR0doV3B4aDM2VzhhUXQ3VEZDa1U0UzdhY1czdldMaHNMWFFCTnZlaklY?=
 =?utf-8?B?Um55VEVaUkNsMXFoMVpwUWZVOVU5YU9LYzlvbWRGMGdGTFdna0ppeTZuUHRu?=
 =?utf-8?B?ZGxWU0hCU2l5SmJlUEVTTUp0QWZXK3ljRUZ3WkFMVzFuOGFUejRyNTNTZjJ0?=
 =?utf-8?B?ZXc4MXR1eXR6d1h6V3hwc3hFaXduK0s4ZmlBdy9DUVpMZmI0VUZldnlGT0g1?=
 =?utf-8?B?OGdvb0pIV0JlWmFHRkVSVHZWY3Z2MDFHaE5tL29xTFVNSE9PU1A3Nm1pVnll?=
 =?utf-8?B?L0RkZE55ei9YdkdxY2U3ZHBob1NvZ3ZiWU00QzdoamVzNnpKa0loUC9YSzBj?=
 =?utf-8?B?dUdXZ0ZnR0Iya3Nuc0tjUWFBdTg2MWRNMFY3TGYrWHVjVzFabzVVRXlUQlBO?=
 =?utf-8?B?eFR1T2V5UU9oYkZGTTMrOTJKV04rMjV1T1NZcFkrVWlUZXd2dk5FeVBBbmRo?=
 =?utf-8?B?ZllwQldNUTl1M3BvRHpPTm8vOEhXYmxHeXo5WUdCdkVGdlBWWHBPaTlWZ241?=
 =?utf-8?B?UzFVQXBzUDhjY1NZTG1ucTZ3NHhlbG9ZbHU1Vmw5VllNWkRqcGtoUEVlUFpn?=
 =?utf-8?B?YlNkZC9wTEgrWncxdUs4OU1jV2orWXA2VDJlcWJtb2llam1tc3FEdXZWNmpN?=
 =?utf-8?B?cHVwQm5VejhCRDl2emJvbXcyaVZnNnJTY1BjZG54MWpCWUZQVDQ3cyt2bXdo?=
 =?utf-8?B?MTgzRkpIUTVDdkt6Tm9nWUtXQlIza3hEbVJneHFkT3YrKzUzaVc1ZlpuUEVS?=
 =?utf-8?B?d2c9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c78007f-ba2b-4cc6-2dee-08db00811a93
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8847.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 16:11:10.1722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nNf38P3DX2O448NnJ7Q7ROudXwasn6i4kFgH19XD+TrSFBZTwpoiJsM4c63BAWHr4scL5opDRLhqDozmy7BpLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8316
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Li Yang <leoyang.li@nxp.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/27/23 02:52, Shawn Guo wrote:
> On Thu, Jan 26, 2023 at 11:48:53AM -0500, Sean Anderson wrote:
>> On 1/25/23 18:43, Shawn Guo wrote:
>> > On Thu, Dec 29, 2022 at 07:01:36PM -0500, Sean Anderson wrote:
>> >> This adds appropriate bindings for the macs which use the SerDes. The
>> >> 156.25MHz fixed clock is a crystal. The 100MHz clocks (there are
>> >> actually 3) come from a Renesas 6V49205B at address 69 on i2c0. There is
>> >> no driver for this device (and as far as I know all you can do with the
>> >> 100MHz clocks is gate them), so I have chosen to model it as a single
>> >> fixed clock.
>> >> 
>> >> Note: the SerDes1 lane numbering for the LS1046A is *reversed*.
>> >> This means that Lane A (what the driver thinks is lane 0) uses pins
>> >> SD1_TX3_P/N.
>> >> 
>> >> Because this will break ethernet if the serdes is not enabled, enable
>> >> the serdes driver by default on Layerscape.
>> >> 
>> >> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>> >> ---
>> >> This depends on [1].
>> >> 
>> >> [1] https://lore.kernel.org/netdev/20220804194705.459670-4-sean.anderson@seco.com/
>> >> 
>> >> Changes in v9:
>> >> - Fix name of phy mode node
>> >> - phy-type -> fsl,phy
>> >> 
>> >> Changes in v8:
>> >> - Rename serdes phy handles to use _A, _B, etc. instead of _0, _1, etc.
>> >>   This should help remind readers that the numbering corresponds to the
>> >>   physical layout of the registers, and not the lane (pin) number.
>> >> 
>> >> Changes in v6:
>> >> - XGI.9 -> XFI.9
>> >> 
>> >> Changes in v4:
>> >> - Convert to new bindings
>> >> 
>> >>  .../boot/dts/freescale/fsl-ls1046a-rdb.dts    | 112 ++++++++++++++++++
>> >>  drivers/phy/freescale/Kconfig                 |   1 +
>> > 
>> > The phy driver Kconfig change shouldn't be part of this patch.
>> 
>> I put it here for bisectability, since this is the point where we need
>> to enable it. But I can do this in a separate patch if you want.
> 
> From DT ABI perspective, it's already broken anyway if you need to change
> kernel and DT atomically.

AIUI new kernels must work with old device trees, but new device trees need not
work with old kernels. So a change like this is fine, since the kernel won't
touch the serdes if it isn't supplied.

--Sean
