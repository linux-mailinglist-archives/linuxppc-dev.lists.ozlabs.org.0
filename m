Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC6767F0AA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 22:52:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3WX33KmGz3fHC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 08:52:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=sFmhiMGd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.7.75; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=sFmhiMGd;
	dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2075.outbound.protection.outlook.com [40.107.7.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3WW20Xq3z3bk8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 08:51:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UlVtse+pfqFmtmh+sGuhpouYJKiBLb6qERwUDnL/enW8KBkbL393BXUZoiG3k+PEtCJjK0VD6zxHoTfAZc6i6Z3XcOwQA+qRrDcq10BmgQiRf2RZiW/dXRg4Z2bnKBm28IPX0iOsBT4c/nyceOxmlwjJut8GUAt5Q7GxTNqwOW3ysPywLwX2HRTUNFqzf2nO6w2uMnfb7xa4cjdxwNrIhL7fnr1odDrENyeqmQyPMHyjT9HB8l+5MtXnN5627ZPVmQ++C4/jPsg6Xd51qJ1+RhNrONrAOZGxkzYtmIiP69aEZ28hN038IaWUsQm5jO3zH0qUamatTScHJwy04I2n7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6tzxQ3JUzyfd0A3uNhdeNB2jyzJk8fziRNZIRwYmBzI=;
 b=G/H9y8sBz77u0fUBZEgIn3la3xN7AHNHZ0GMTEhZ+4GQIYFpC73dz/3B+67MSe0Yk5xZGNU39y2NQYq9JM78xAqn6/XYpAlauqpRYy3229qn6ZdWKz5hv6c3Jjr+kTl9U8NlQyRyRHHjKwX8ydJyPk+CpSHXmpx660Jt39zcW5FzVjvI8iG1n82U58ylVypkn/XGrlKbEsSjpPBBUAK7jUP8V7TU4KI2W9laKHSjcxDlB9yeAIqX9Ojei5xvJg0QYwY7c3yp2Juu0Jw7NfuJbhRSfOaKoctwWgiJduVNEJZNf+KEkSOCSA3fOEz5zw+57K0nBvj/G/ImaiFSkwCo+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6tzxQ3JUzyfd0A3uNhdeNB2jyzJk8fziRNZIRwYmBzI=;
 b=sFmhiMGdgELYaoqqJU7oITSdJkD8qdKPbzZuUPbWqtJSYztC4o6RgAWTgcdJ0wjG2fnJKV2LhNDSkiCeVJ+p1XUe5rfwn/bIvnioVGE+F+0x6DZRVf/3pdQV3tHjbs+ag21MdoAAdyh04xG/vLjbOel0s/lX0w9Evx2+3TDrmD4i5w9ZK+nu5YMkwgsi5Z9sD0iZcI+b+AnEaMrxzc6vgxFM7Euy4KzXAOSd5fm23BB/pRiVpJ2IIN1dCwIujgAIrtz57hCeTrTupcm/PMipgwU32FSpd9WzC3+mG9MfdRv9E59aMHh67ri8LXJUQj5lr0HXPBv9XxMckS7+clQV6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by PAVPR03MB9041.eurprd03.prod.outlook.com (2603:10a6:102:321::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Fri, 27 Jan
 2023 21:51:17 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::6b03:ac16:24b5:9166]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::6b03:ac16:24b5:9166%2]) with mapi id 15.20.6043.022; Fri, 27 Jan 2023
 21:51:17 +0000
Message-ID: <363e3221-721b-6547-0955-f964e2ef17b1@seco.com>
Date: Fri, 27 Jan 2023 16:51:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v9 04/10] clk: Add Lynx 10G SerDes PLL driver
Content-Language: en-US
To: Stephen Boyd <sboyd@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 linux-phy@lists.infradead.org
References: <20221230000139.2846763-1-sean.anderson@seco.com>
 <20221230000139.2846763-5-sean.anderson@seco.com>
 <1abf9cb3e1fb1f01976c903cd8723b0f.sboyd@kernel.org>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <1abf9cb3e1fb1f01976c903cd8723b0f.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR08CA0002.namprd08.prod.outlook.com
 (2603:10b6:208:239::7) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB8847:EE_|PAVPR03MB9041:EE_
X-MS-Office365-Filtering-Correlation-Id: 18113e45-6450-4831-c598-08db00b09df2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	UvnkiqBHxSRwDK75b8sVk89q9Jl5fTAGzJr4ZAzRZV4tiAC2w8hCdDiO4GhXjjSVKVqV0sXVQPeZwNIq79UMeSPg1vyNrKJm6HpdoF+na+q9PJ152jgggFhXkI6otbO2CyQW93kpkrdQKIuvfCR1E/kN7Su2XQ/yDZa+D8RAWo53/wEuUEmOWC7eRT+n27pUoBIRUQxhHzgEEcJFMJL4TDE9PwhhCAb3C9VXXh8Iz/xb5O3z74sPAOqOQdLYLGMT7+vyH+9kYR4Xvy6D9uKuXMq/gg1s4yskSp86rZ5rWKi9Efy6jKXmcFWXnarVZNQ+FgFjyntMoU9qAWjK9V9Pv+dwfRRhf8NZxcyrQiukuw7Q19vI+xw8EtVg31xWpSwfsCA2kmNrAM/52PCz5WJNB/qCzbJiKGy6poDQQSdSlKcfO32tiKkHomoT9M+BaNBTAr2d0M7vS0GODafUnb01eDo8p34lHkrcPXw9UK5imYcmeHDBFLu5bzq4xH49iN3GKSaXxvk/RF3atrIFWEBWlgpn7CK2OG03FofLRDo+BRjrHEw/jbQajDXREZzCiJdrpKQCE1hSUdRyMl6vogOI6L5euwOREP3dGjMAQG4AXB47MJ9Yk4OddNoE7NXN6f+3LiPgS+kYuTbOxfigAHxVkGQCpRdBL43MFkRlYURHNY69s4pK5ywyE4WVzjcpQGCxymJhTb9idhp5x5YcCNc1FsXFZgT2bQki2wKyTE9giZqNVkknH9H+GxDmwCVyhLSftoTDz+UJOjehDKdnrRq1jkTHTxSsXuiGDJ/9dJAPD6k=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39850400004)(396003)(376002)(346002)(366004)(136003)(451199018)(66899018)(6512007)(86362001)(6506007)(66556008)(316002)(2616005)(8676002)(110136005)(31686004)(4326008)(53546011)(31696002)(66946007)(41300700001)(66476007)(6666004)(52116002)(6486002)(478600001)(44832011)(186003)(38350700002)(7416002)(38100700002)(54906003)(2906002)(26005)(83380400001)(36756003)(4001150100001)(8936002)(5660300002)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?WTNQMUJKNkF6d3Jiazl0WTNUT0xVeUNJZGRYNElEVVB5cHoyM3BYM1lzME9n?=
 =?utf-8?B?TUc5YnhsdytOZlkzSStlOVUrbWhzMElscU92dVRHT2F5dnZIZkRHbkJUd0w5?=
 =?utf-8?B?S1lUVW5RTk9UeUo3c1FZK3VoWDlBc3FuZFgrV3lMdENza2MrbzhGb0hMQzFk?=
 =?utf-8?B?Tno3QVd3eURpL0hPMlZGdm81YUo0WlRQNG5VU28wV0V3aXIzTnpibEhjQVp1?=
 =?utf-8?B?YnJzaFlmODVuaVd4bjQ1bkFUSzByUmxDVlk0K1E0RkVoWUgwM0FsSWZOejQr?=
 =?utf-8?B?Z2tJQnZ1ZmM1VGFPNzBWTGtkeXdWblg0eCtoTU5kWFowMVFzcXp2SC9Wa1lw?=
 =?utf-8?B?QWkrTDNoQmw2Znl5b2lSY0piNStGKzFFVDc5eUZ0NkhkaWxlZWlCSXFXNUp4?=
 =?utf-8?B?NllPZDMyTWVoVXpqVk05b2xFNG9ON2t4ZzdyOVBKbURqNHR2ZkRVVm5aV3cr?=
 =?utf-8?B?akVabDFtL0U3bnNvV3VjS29KaTYzUEtPajJKMkVYTW5YUi92dVBkWCs2RVZx?=
 =?utf-8?B?YW1RUmt3alc2SUMycThQcGsyWFNGSUU2QzZTYVNJbjRzdmJhUEhSeE41Q2JF?=
 =?utf-8?B?T0xxOEhRY2JUZitRZC96OWpEbGxyVzBMNDk1NVkzOW92dVNaa3U0NURWUmNX?=
 =?utf-8?B?REJQd3ZRMWRNUXRyR2J6SFJNWkltS0dCaWhIY0UyZGpBRHF2RFBDT2xCMEgr?=
 =?utf-8?B?cW8rbURHaFNNT0wrc2p5TnB1Y1BaaHRCUTBRdXlRWjJjRmVKejZ5cEVad0xY?=
 =?utf-8?B?cXJUMVdSVEM0Z2dIU2pWVEF0ODJoMVhBZkZoSW5Ic2huRkp5MktWVzdBeS9m?=
 =?utf-8?B?cU1udGdNL3hjSFdnWGxwSlJNc1llZmdtK3Y0S0Jzd2cvejBKUGdWM1RoNU82?=
 =?utf-8?B?YVdzWmxhUmQ4aTRaTE1tSjRHYVoxOCtobTlSdDV6WDBYaThhVkg2M2ZpWEE1?=
 =?utf-8?B?alErYWd0Z2JxS0lVYWRiM0pSZFk2bG55NmdHWjdsbG0yemx5T3dxSHNEY0cr?=
 =?utf-8?B?Nzkya2xOT25XV2dNTmlZV1FKSW5WZGFZMVNRTjJ2QkdDbEVJUUQrV0xENHBV?=
 =?utf-8?B?b2pXQXFSeEJ1TWxRZmRyakxtQUdBOUwzbjlEZllEMUpFWXJWM05qemtzcEpF?=
 =?utf-8?B?clFBRGlURUNVdWtISERHR2dwaFhYZkg3WWRKdTRObEVGM01UR3JERDJVZzQ1?=
 =?utf-8?B?MkJxSVdka2FqQjJwMU9FdE9pS3dDbVF2bUNHSWVqQy9FenF2dTdTTmVGVUJo?=
 =?utf-8?B?QTRVZ3dTckZqVGthSHNLb1UyOVRuanprWi9lb1FQWEd3SVltMnBORFhPMWZH?=
 =?utf-8?B?ZWRUdDAvT3RqdWRDVHh4dnRaa3FqblZreUQ2bllBM29meEhzbjVwMHp6cllJ?=
 =?utf-8?B?QzBoN2pkNXIwMWVwTUtMcWZQTkh5WW45M1hUakpJRkd3UVlpQ0xBWmRDaFl3?=
 =?utf-8?B?SzBOeDdVQjFDK3ZxWWlQcnhBVnBRRUsvbDhFYjRDVm1odGFVVDNtUXlvSTZl?=
 =?utf-8?B?UldHUXEwTVNrSXpDdUdCL29rbzN1SmQyZUphbTBuZnFSS2tUamxDQjZkYVhn?=
 =?utf-8?B?SjZQOE9UMGtnWXVuRzU0WEorV01LSzlVK2c1YlFWNHZQRnhvNDdIYWh5cW9s?=
 =?utf-8?B?ejBFWlRTaDV1amlWNENKbWVnMTZ6a0lzbm1DYkRIbC82Y2dYTjAwT0hGWnd0?=
 =?utf-8?B?NFZhRHVaMlVqR2xqakxqcEtkdkxadHB5ZDhzUmI1SHhpajFxQ1B2TWg5YndO?=
 =?utf-8?B?dHRDRnZnQkVEakJILytDNTd5Q05xa0N6NHVzQ3V0bHdGWEZLQm53cU4vSDZw?=
 =?utf-8?B?K0tzUHh3SDA3Q1NPRDZIbHEycjVkR09OcUdWajBJOXJBcGpOaEtJYUF2Ym1V?=
 =?utf-8?B?c05xNElmUGFwaFc0cE95REtaemhXMTM1SXVNOGZsVGwzRHVybW9LKy9SaUhS?=
 =?utf-8?B?N2Z5SGZVdG1QVms3Y28rQlo5MFZBdUlxOVgxTWY0VjdLK2x0eFROSDd1RG5l?=
 =?utf-8?B?cGZQNTgrVHpYd3FSS0N1YkpMd0hxRU4vT2ZPRHFzeEJubnhRQnJQN09vMCt6?=
 =?utf-8?B?dGFIZVhXMGpERit5TTZmakdHbzFNZnk4TzBYWTJydUdWcTlvSHF2eHFlUFMv?=
 =?utf-8?B?cmlXcUd1TmxFQjdRMTBjZk83NmtmUlpYYWZrSmR2bG1WSnpTKzlod1NHTFR3?=
 =?utf-8?B?NXc9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18113e45-6450-4831-c598-08db00b09df2
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8847.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 21:51:16.9747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KDyFhnMXrYkI7+YKmXItl2GBFUchr3rfcuggK/QzMp7B4AvOVafVatfiP9CcBiphuBzYY0KoagIAPAU6/hYIrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9041
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
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/27/23 15:59, Stephen Boyd wrote:
> Quoting Sean Anderson (2022-12-29 16:01:33)
>> This adds support for the PLLs found in Lynx 10G "SerDes" devices found on
>> various NXP QorIQ SoCs. There are two PLLs in each SerDes. This driver has
>> been split from the main PHY driver to allow for better review, even though
>> these PLLs are not present anywhere else besides the SerDes. An auxiliary
>> device is not used as it offers no benefits over a function call (and there
>> is no need to have a separate device).
>> 
>> The PLLs are modeled as clocks proper to let us take advantage of the
>> existing clock infrastructure.
> 
> What advantage do we gain?

The handling of rate changes, locking, etc is all done by the clock
subsystem. We can use the existing debugfs stuff as well. And everything
is organized by existing API boundaries.

>> I have not given the same treatment to the
>> per-lane clocks because they need to be programmed in-concert with the rest
>> of the lane settings. One tricky thing is that the VCO (PLL) rate exceeds
>> 2^32 (maxing out at around 5GHz). This will be a problem on 32-bit
>> platforms, since clock rates are stored as unsigned longs. To work around
>> this, the pll clock rate is generally treated in units of kHz.
> 
> This looks like a disadvantage. Are we reporting the frequency in kHz to
> the clk framework?

It is, and yes.

>> 
>> The PLLs are configured rather interestingly. Instead of the usual direct
>> programming of the appropriate divisors, the input and output clock rates
>> are selected directly. Generally, the only restriction is that the input
>> and output must be integer multiples of each other. This suggests some kind
>> of internal look-up table. The datasheets generally list out the supported
>> combinations explicitly, and not all input/output combinations are
>> documented. I'm not sure if this is due to lack of support, or due to an
>> oversight. If this becomes an issue, then some combinations can be
>> blacklisted (or whitelisted). This may also be necessary for other SoCs
>> which have more stringent clock requirements.
> 
> I'm wondering if a clk provider should be created at all here. Who is
> the consumer of the clk? The phy driver itself? Does the clk provided
> need to interact with other clks in the system? Or is the clk tree
> wholly self-contained?

It's wholly self-contained, aside from an undocumented mode where you
can output a fixed frequency (for testing). The provider exists so you
can use assigned-clocks to ensure a particular PLL is used for a
particular frequency. This prevents a problem where e.g. you have
reference clocks for 100 Hz and 156.25 Hz, one lane requests 5 GHz and
the PLL with the 156.25 Hz clock gets used. Then, later another lane
requests 5.15625 GHz and the remaining 100 Hz PLL can't provide it. To
prevent this, you can assign the PLLs their rates up front and the lanes
will use the existing rates. Most of the time this should be done by the
RCW, but there are cases where the RCW can't set up the clocks properly.

> Can the phy consumer configure the output frequency directly via
> phy_configure() or when the phy is enabled? I'm thinking the phy driver
> can call clk_set_rate() on the parent 'rfclk' before or after setting
> the bits to control the output rate,

This is what currently happens. See lynx_set_mode in the next patch.

> and use clk_round_rate() to figure
> out what input frequencies are supported for the output frequency
> desired. This would avoid kHz overflowing 32-bits, and the big clk lock
> getting blocked on some other clk in the system changing rates.

Can you describe this in a bit more detail? Are you suggesting to skip
the clock framework?

> BTW, what sort of phy is this? Some networking device?

From the Kconfig in the next commit:

This adds support for the Lynx "SerDes" devices found on various QorIQ
SoCs. There may be up to four SerDes devices on each SoC, and each
device supports up to eight lanes. The SerDes is configured by
default by the RCW, but this module is necessary in order to support
some modes (such as 2.5G SGMII or 1000BASE-KX), or clock setups (as
only as subset of clock configurations are supported by the RCW).
The hardware supports a variety of protocols, including Ethernet,
SATA, PCIe, and more exotic links such as Interlaken and Aurora. This
driver only supports Ethernet, but it will try not to touch lanes
configured for other protocols.

>> 
>> diff --git a/drivers/clk/clk-fsl-lynx-10g.c b/drivers/clk/clk-fsl-lynx-10g.c
>> new file mode 100644
>> index 000000000000..61f68b5ae675
>> --- /dev/null
>> +++ b/drivers/clk/clk-fsl-lynx-10g.c
>> @@ -0,0 +1,509 @@
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
> Is this include used? If not, please remove.

OK

>> +#include <linux/clk-provider.h>
>> +#include <linux/device.h>
>> +#include <linux/bitfield.h>
>> +#include <linux/math64.h>
>> +#include <linux/phy/lynx-10g.h>
>> +#include <linux/regmap.h>
>> +#include <linux/slab.h>
>> +#include <linux/units.h>
>> +#include <dt-bindings/clock/fsl,lynx-10g.h>
>> +
>> +#define PLL_STRIDE     0x20
>> +#define PLLa(a, off)   ((a) * PLL_STRIDE + (off))
>> +#define PLLaRSTCTL(a)  PLLa(a, 0x00)
>> +#define PLLaCR0(a)     PLLa(a, 0x04)
>> +
>> +#define PLLaRSTCTL_RSTREQ      BIT(31)
>> +#define PLLaRSTCTL_RST_DONE    BIT(30)
>> +#define PLLaRSTCTL_RST_ERR     BIT(29)
> [...]
>> +
>> +static int lynx_clk_init(struct clk_hw_onecell_data *hw_data,
>> +                        struct device *dev, struct regmap *regmap,
>> +                        unsigned int index)
>> +{
>> +       const struct clk_hw *ex_dly_parents;
>> +       struct clk_parent_data pll_parents[1] = { };
>> +       struct clk_init_data pll_init = {
>> +               .ops = &lynx_pll_clk_ops,
>> +               .parent_data = pll_parents,
>> +               .num_parents = 1,
>> +               .flags = CLK_GET_RATE_NOCACHE | CLK_SET_RATE_PARENT |
> 
> Why is the nocache flag used?

PCIe rate selection can automatically modify the frequency of the
PLL. From the reference manual:

| For PCIe 8 Gbaud, the auto-negotiation also involves a combination of
| switching PLL selects, and/or reconfiguring a PLL. There are two
| scenarios for PLL reconfiguration:
|
| * PCIe starts on any PLL which runs at 5GHz, and the other PLL is off.
| PHY wrapper will switch to the other PLL as part of Gen 3 speed
| switch. In this case, both PLLs must be supplied with valid reference
| clocks.
| * PCIe starts on any PLL which runs at 5GHz, and the other PLL is
| being used for other protocols. PHY wrapper will reconfigure the
| current 5GHz PLL as part of Gen 3 speed switch. PCIe stays on the same
| PLL in this case. This also applies to the scenario where one PCIe
| port runs on all lanes.

As far as I know there's no way to configure or disable this. PCIe isn't
implemented yet, but it would likely need some way to mark PLLs for
exclusive use (not just exclusive rate). I figured it would be better
not to cache the rate so that things like the above would get detected
properly.

--Sean

>> +                        CLK_OPS_PARENT_ENABLE,
>> +       };
>> +       struct clk_init_data ex_dly_init = {
>> +               .ops = &lynx_ex_dly_clk_ops,
>> +               .parent_hws = &ex_dly_parents,
>> +               .num_parents = 1,
>> +       };
>> +       struct lynx_clk *clk;
>> +       int ret;
