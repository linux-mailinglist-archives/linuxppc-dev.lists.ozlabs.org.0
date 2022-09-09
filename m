Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCAA5B3B74
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 17:06:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPK8V0YkQz3c2L
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Sep 2022 01:06:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=DhbysmXC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.22.53; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=DhbysmXC;
	dkim-atps=neutral
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2053.outbound.protection.outlook.com [40.107.22.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPK7f2S6Lz30KY
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Sep 2022 01:06:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=odKdI70Y2wYV97vhqEHjGHypOeZmP6BoYB7li0L54iO3sIttEYCY7FpcuxvS7e/twn0GUgIONl7qQJfFFVxjH6CAxNaUPH2O63k5rshqfK9SU5Hvbm20P0pjMDbYvOY3qT9rc4kjsgDjjxDw8IJXr5NHhbXJKgRKNMIbJe7xA5xrcTsGZMTkF7NAP8dEuCu7FFlqN8IzdZbvn8UzGd+KlLljqAoO7fXGDK9AiKUlw7W4op0iM2BlQYfcV8dKYbG1Dv5NRIQQbTx4SFdkYu8WJfr/ZWiLQPD6OtFZ3IkOFexr2RIZWGK1gLviSnUJ+KDkej+MWpTAo9NrGJzTgSU41g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5efQus/rTcyTbzGhLaocm7fA9h80cmBpq8E3eklwd6Q=;
 b=L6Lv2i3hHGVRQ9m2/eP45a0cPPk5edEofqWyBgGC/tGKnIjzum3YvMCrDwSg0fneeUnF9XTylxCBSvGoJuMU+fIjB0lFJ1bBSY+GNeDCzzt79P3kUkQe9Ha6PLJVeG6h87zjM9haciraoVm12WR25yjoiKbwGgM+fquSlWTrI9fIqdLUsr9KsByCoobijG7ToovNKxb+waHVGsStkVUbrgaaI4l9GELqIKeA1Ms5bCeUB3y8IsQ/Cb4epc+DDtlFREXrrnuQXummGTX/5zDlshCkJE59fcQgcL82UWgO4a6ZM9dj7pgoGk4oiNIL7tVNALC5b7+P11OkYHKOpCboEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5efQus/rTcyTbzGhLaocm7fA9h80cmBpq8E3eklwd6Q=;
 b=DhbysmXC3yIky5RHBiEUAQS0BCWjYiuK7AxSdio2wdpSVD59S3ESmpW1VmKzwJ6MfHTOv30PJPYjZqWKYulYhLZcn/lfrUTf0RYiRSfAbPUxmrPuIM9xKvmSCqqsN9uRqgpWB2grn671O5bzihYLfyfDaDLki9pIWiIimmOQX0372xRWQRKJgH6vPwiENzhewbgJAK7nZFApcf0wpYEDG2xReR0Lr3IyaJOsBnDfQFMxXevojtLmAIC9xBE25e/G97Rmx0IigR4oku1YOVkXU/aQRaoG4y6GDMvBkI/qf2imCZXX82GDGl7KaBGttJwDTowvXxzr+1VphojbyyHFjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by PR3PR03MB6442.eurprd03.prod.outlook.com (2603:10a6:102:70::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Fri, 9 Sep
 2022 15:05:37 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2%4]) with mapi id 15.20.5588.018; Fri, 9 Sep 2022
 15:05:36 +0000
Subject: Re: [PATCH v5 0/8] phy: Add support for Lynx 10G SerDes
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-phy@lists.infradead.org
References: <20220902213721.946138-1-sean.anderson@seco.com>
From: Sean Anderson <sean.anderson@seco.com>
Message-ID: <de50858e-0056-fd72-2b67-27bf597b3366@seco.com>
Date: Fri, 9 Sep 2022 11:05:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20220902213721.946138-1-sean.anderson@seco.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR14CA0027.namprd14.prod.outlook.com
 (2603:10b6:208:23e::32) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a860e0b0-de2c-4324-1107-08da9274c03f
X-MS-TrafficTypeDiagnostic: PR3PR03MB6442:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	8rQZsscWyBrT7Z8FNEx7fndxpi1KgcIdLxBXc5WOqvzHfL4ilY3VABnt1edHRRb4LUmVgAcSArCUBEiNtGjaSAQM/6deUb7BwgGDABSAGnqYhpWsyIgfTsWEQi/ts/gXupvB0n8qMULH3qXEfV562laC2CxoE2ePAoNsU8xfSC3ciCXs9fkqj9yuQzbb5Icsc/i0IQdojvNSCze3T5zEjMIygS20VxKHGpAXzhQul18lbqkFySzySpb9K/Y1RGMeVAO4eW6+XQPiT01uLqCfOZtMLuh5zbf0y8oQBJO+R9ryw6pWItDhpdgrES6WldKoiFhAKC3fujg0EOPKQYfefwpyGyi4UnkYYJU9Lcdr8P64RXOM+aPkMvc0e7WNiuH9lsewe92mLug5uQHiX2y+gVjWx5uI9bzRrjis7vlXUV5i8rv7lET/H/qhU9MJmch9PNwG7GcsAhras749Ux6lqg684an87I59piruXbyZkJaGvEGg46Co3cjpSe0TeUVsd7kw3B212A293T2cpQ3rE7p5SjrH8I08L/4rMQ6AVO/pnaAYfB7dw1wxwQiknX6nCFRZgTO8f8Xvir+3HswiHC5DBPEi2meiQ95GM2WciF0otlmEwhXTctit/QjJGOlG4YPLRX5riUieAmwcG6vjmwwjNPQv5nh6rARu5NbbRh9bHuKvriOtaWzejL/HdTZO2ffe0Y+MifvNqsUzDoJNntQfzgMHnMBsO/k4g0kXXrVplut9bMfFm/KiAl7ZAMHWn6iUBVYYXX8xE7A8YO11yWHF1Grh+dJ//2NXBYwwE4ULuNO+Ni338tdPUlDzelfqWRz3XCOQ2VzvuNs7LytheO03yXxkALnaReHs4mZgWB8=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(136003)(396003)(366004)(39850400004)(31686004)(316002)(86362001)(38350700002)(38100700002)(36756003)(478600001)(6486002)(110136005)(54906003)(966005)(31696002)(6506007)(186003)(41300700001)(6512007)(2616005)(53546011)(52116002)(6666004)(26005)(7416002)(44832011)(2906002)(83380400001)(8676002)(4326008)(66946007)(66556008)(66476007)(5660300002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?cEZzYWR1d1FMOFJyazU2YytjKzFybUVKY1N3Uk92aENQWlZOMjkyVWVDQkxo?=
 =?utf-8?B?ZUdFSmd5Q2lGQzBGZlFyTUNodkkrakFzb01SalNWUGdHdGhQYThzUmtiWDBz?=
 =?utf-8?B?Q3ZNaDRHWFFzSm5aRVVPa3VTNkRLK2tnK2ZQNTJKQTFPV1VMd0ZVVitYSThZ?=
 =?utf-8?B?SnA0QWpad3dCT1VwcXViTDgyemxDRWpuZWRPNCtqMjFHakpLQXd5SFFJTllF?=
 =?utf-8?B?RlhHS0hUa1l1bjFaUXk2NFpZSytMQjRxN094WXhYTGRENEtlc2FvQzlyVVZ2?=
 =?utf-8?B?NmJ2K25wVlloZTFrQUJmUk12UERvVkM3OUtpL3VXMjExQzZDRGlrSVVxeE93?=
 =?utf-8?B?L2svNkdYZVdJNUlDS2FibHR3R1pwTG83YzN2WG1MeU42dVg2MGZEWTBsMDhB?=
 =?utf-8?B?SlljczNhQjNXS0xGQzk5cFRxZHJMVFFVSEFDc2lza1RiWjVEZUdJek9pbkhN?=
 =?utf-8?B?ZXZGd2VGN1psUFdPTDNLNTBQUi9OVnNEWUR0bTl6aEN4aVBnSzJvQm5CTjNh?=
 =?utf-8?B?TUNrOUR3RU9qakNmOFBxRWxIQjFmZzI5YzIwc1ZZeTBNc1hNVERXbEkwdlUr?=
 =?utf-8?B?c0xwbTRtY0tWMGlhTWk2eVQ0ZWNGWlNidzY1VEQ3ZHpjWDVpMDBmZEtTc1Q2?=
 =?utf-8?B?UU9kcFdCbzNMVXRqT3NIMUk3YmRHN25aRTlzZ0ZvVEdYL09DMEgzNzZCRVJu?=
 =?utf-8?B?a05mY0xGRndNRlROOSt4QXd6WWJlaG94ek1yZkx0N1d6c3k0VzJPSXcxbkkx?=
 =?utf-8?B?WDJiaFM0emZXdm03QVVtdUxsTm9SSndpU3dnZHRZNFc2SGJtK21JT3ZldG11?=
 =?utf-8?B?Ty9zOS9qTWR2OCtnQVNoQ09ZTjU4Tnhyem5WTWVETllCN1c4TllvODg1Y2V0?=
 =?utf-8?B?SzI3U2U4aEk4WktsUnU4WDJCWXJYTnNkVXkzZ2pXU2tmWCtVeWZBL09jTlN6?=
 =?utf-8?B?U2xKM3pLM1pUOEdBU0d6b1dNUVVsb0dCZE1zaGtpNm84a3o3VFU4S2o1bDBE?=
 =?utf-8?B?WFpDcWVjSldSUE5ybDBMWTlzTmJ5RVNVVksxMmRkL09td3ZVTy84LzFKYVJ3?=
 =?utf-8?B?TFpDYk1XRWdRZ1VnMkRjTkttS0NRbDBFRFd3Z1N0L1JianNKTVBGMzR4YTFZ?=
 =?utf-8?B?N3VQbFhuT0plWmtCVCtiazN2WjRrN2FpbzJ5am9OWFVtS3JsUkI1MmdQS0da?=
 =?utf-8?B?Wk9qS2N1b1MvTVN4T2hLMUFUNEZIclROVzFGa21YZTF6Z0R3a1dtRFkyT3Fo?=
 =?utf-8?B?N3pVaGYvZ1VTc202SFZuSzhhMTExTFM1WVo4cnBSMEdpQlhXSzB0eGhKc3Av?=
 =?utf-8?B?dU5FakhjMW9acWo2MjZXVmdzMmVYVVBiWXRoV0kxb2hvZko5cHdtamY1R2Zq?=
 =?utf-8?B?Z1Q1bmY1ZHJNMDNrdU1FcHVmUi9IUUJaQ1JWUklPSmkxbHB6aTlBU2I5aEd4?=
 =?utf-8?B?VXA5TkN6SHRSUHlvY1EvOVdQenRvOGJKN0h1a3FoZUxpVU0xdHRBYS9Oblc4?=
 =?utf-8?B?K0RXZ0lRc3JqUmtUbm9oYkFRVnZQWUt6TmJrMy9GRnRxUGNqL0JTQkNBcS9i?=
 =?utf-8?B?ZVg3aFk1WGlzSUVGT0V6cmlUL0YzWStiRmFiNG9STjJJdS9vc2l2YUlpRVdj?=
 =?utf-8?B?MGNPTXJYVGtFMjIvTUsrUnJxc3ZPSUJEZncrRnV1MnFpZ1dVRG1CcEplQXNG?=
 =?utf-8?B?WEluWDNQZElwNTZFWFVzUnRtRzhQZjlFcEo0Mlkzb2x3WVlnM1hmbllTcjgy?=
 =?utf-8?B?UHdYclNnZ1N2QTNvcHdQcmI2aThMUkc4LzR6eUxLQjdCbE5YRVFNeE1lM21w?=
 =?utf-8?B?N0FLTjFjc3QzdUxPSVc2RUUreW8wTmpSdmNxMWMxKzcrSy9sdlVRWDhoZ09N?=
 =?utf-8?B?bHJRSndhdG5vZ1gxTXdOSVNjYVlyVXNTVCtoTXJXam52TXVRZzFTZEVtS3VC?=
 =?utf-8?B?cllMbERKc1B6RDhWdE9aYW96Z1dYMVNHNDJHM21DUWIwYkxLSVBkM0hwNjBy?=
 =?utf-8?B?TVNyL21zZ0hUaEE3eEY5ZGdRRG9TcDAvazFOeUlTZzZEK0x1T3ZrMTM5TXdO?=
 =?utf-8?B?eUFWMlpuZURKZmNFVXlWOUdxRklSZUUvNEhQSHliQWpCSUJ2OHRobm5Lejhv?=
 =?utf-8?B?YVZVZ203T3RPK080UTZMaG8ydkNzcGoyOVdMdUlnelR0L1dHU2tHYmkzNFJr?=
 =?utf-8?B?V3c9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a860e0b0-de2c-4324-1107-08da9274c03f
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 15:05:36.7597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TBjI26Ht+1NY/ppXG56sUEJ6nM7aZJmLtJUR/JECEcFIo/qaYdFExkkapT2W3iL0+QfKNghCFTTSwhHQquKtyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6442
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Vinod/Kishon,

On 9/2/22 5:37 PM, Sean Anderson wrote:
> This adds support for the Lynx 10G SerDes found on the QorIQ T-series
> and Layerscape series. Due to limited time and hardware, only support
> for the LS1046ARDB is added in this initial series. There is a sketch
> for LS1088ARDB support, but it is incomplete.
> 
> Dynamic reconfiguration does not work. That is, the configuration must
> match what is set in the RCW. From my testing, SerDes register settings
> appear identical. The issue appears to be between the PCS and the MAC.
> The link itself comes up at both ends, and a mac loopback succeeds.
> However, a PCS loopback results in dropped packets. Perhaps there is
> some undocumented register in the PCS?
> 
> I suspect this driver is around 95% complete, but, unfortunately, I no
> longer have time to investigate this further.
> 
> Changes in v5:
> - Update commit description
> - Dual id header
> - Remove references to PHY_INTERFACE_MODE_1000BASEKX to allow this
>   series to be applied directly to linux/master.
> - Add fsl,lynx-10g.h to MAINTAINERS
> 
> Changes in v4:
> - Add 2500BASE-X and 10GBASE-R phy types
> - Use subnodes to describe lane configuration, instead of describing
>   PCCRs. This is the same style used by phy-cadence-sierra et al.
> - Add ids for Lynx 10g PLLs
> - Rework all debug statements to remove use of __func__. Additional
>   information has been provided as necessary.
> - Consider alternative parent rates in round_rate and not in set_rate.
>   Trying to modify out parent's rate in set_rate will deadlock.
> - Explicitly perform a stop/reset sequence in set_rate. This way we
>   always ensure that the PLL is properly stopped.
> - Set the power-down bit when disabling the PLL. We can do this now that
>   enable/disable aren't abused during the set rate sequence.
> - Fix typos in QSGMII_OFFSET and XFI_OFFSET
> - Rename LNmTECR0_TEQ_TYPE_PRE to LNmTECR0_TEQ_TYPE_POST to better
>   reflect its function (adding post-cursor equalization).
> - Use of_clk_hw_onecell_get instead of a custom function.
> - Return struct clks from lynx_clks_init instead of embedding lynx_clk
>   in lynx_priv.
> - Rework PCCR helper functions; T-series SoCs differ from Layerscape SoCs
>   primarily in the layout and offset of the PCCRs. This will help bring a
>   cleaner abstraction layer. The caps have been removed, since this handles the
>   only current usage.
> - Convert to use new binding format. As a result of this, we no longer need to
>   have protocols for PCIe or SATA. Additionally, modes now live in lynx_group
>   instead of lynx_priv.
> - Remove teq from lynx_proto_params, since it can be determined from
>   preq_ratio/postq_ratio.
> - Fix an early return from lynx_set_mode not releasing serdes->lock.
> - Rename lynx_priv.conf to .cfg, since I kept mistyping it.
> 
> Changes in v3:
> - Manually expand yaml references
> - Add mode configuration to device tree
> - Rename remaining references to QorIQ SerDes to Lynx 10G
> - Fix PLL enable sequence by waiting for our reset request to be cleared
>   before continuing. Do the same for the lock, even though it isn't as
>   critical. Because we will delay for 1.5ms on average, use prepare
>   instead of enable so we can sleep.
> - Document the status of each protocol
> - Fix offset of several bitfields in RECR0
> - Take into account PLLRST_B, SDRST_B, and SDEN when considering whether
>   a PLL is "enabled."
> - Only power off unused lanes.
> - Split mode lane mask into first/last lane (like group)
> - Read modes from device tree
> - Use caps to determine whether KX/KR are supported
> - Move modes to lynx_priv
> - Ensure that the protocol controller is not already in-use when we try
>   to configure a new mode. This should only occur if the device tree is
>   misconfigured (e.g. when QSGMII is selected on two lanes but there is
>   only one QSGMII controller).
> - Split PLL drivers off into their own file
> - Add clock for "ext_dly" instead of writing the bit directly (and
>   racing with any clock code).
> - Use kasprintf instead of open-coding the snprintf dance
> - Support 1000BASE-KX in lynx_lookup_proto. This still requires PCS
>   support, so nothing is truly "enabled" yet.
> - Describe modes in device tree
> - ls1088a: Add serdes bindings
> 
> Changes in v2:
> - Rename to fsl,lynx-10g.yaml
> - Refer to the device in the documentation, rather than the binding
> - Move compatible first
> - Document phy cells in the description
> - Allow a value of 1 for phy-cells. This allows for compatibility with
>   the similar (but according to Ioana Ciornei different enough) lynx-28g
>   binding.
> - Remove minItems
> - Use list for clock-names
> - Fix example binding having too many cells in regs
> - Add #clock-cells. This will allow using assigned-clocks* to configure
>   the PLLs.
> - Document the structure of the compatible strings
> - Rename driver to Lynx 10G (etc.)
> - Fix not clearing group->pll after disabling it
> - Support 1 and 2 phy-cells
> - Power off lanes during probe
> - Clear SGMIIaCR1_PCS_EN during probe
> - Rename LYNX_PROTO_UNKNOWN to LYNX_PROTO_NONE
> - Handle 1000BASE-KX in lynx_proto_mode_prep
> - Use one phy cell for SerDes1, since no lanes can be grouped
> - Disable SerDes by default to prevent breaking boards inadvertently.
> 
> Sean Anderson (8):
>   dt-bindings: phy: Add 2500BASE-X and 10GBASE-R
>   dt-bindings: phy: Add Lynx 10G phy binding
>   dt-bindings: clock: Add ids for Lynx 10g PLLs
>   phy: fsl: Add Lynx 10G SerDes driver
>   arm64: dts: ls1046a: Add serdes bindings
>   arm64: dts: ls1088a: Add serdes bindings
>   arm64: dts: ls1046ardb: Add serdes bindings
>   [WIP] arm64: dts: ls1088ardb: Add serdes bindings
> 
>  .../devicetree/bindings/phy/fsl,lynx-10g.yaml |  236 ++++
>  Documentation/driver-api/phy/index.rst        |    1 +
>  Documentation/driver-api/phy/lynx_10g.rst     |   66 +
>  MAINTAINERS                                   |    7 +
>  .../boot/dts/freescale/fsl-ls1046a-rdb.dts    |  112 ++
>  .../arm64/boot/dts/freescale/fsl-ls1046a.dtsi |   18 +
>  .../boot/dts/freescale/fsl-ls1088a-rdb.dts    |  161 +++
>  .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi |   18 +
>  drivers/phy/freescale/Kconfig                 |   20 +
>  drivers/phy/freescale/Makefile                |    3 +
>  drivers/phy/freescale/lynx-10g.h              |   16 +
>  drivers/phy/freescale/phy-fsl-lynx-10g-clk.c  |  501 +++++++
>  drivers/phy/freescale/phy-fsl-lynx-10g.c      | 1162 +++++++++++++++++
>  include/dt-bindings/clock/fsl,lynx-10g.h      |   14 +
>  include/dt-bindings/phy/phy.h                 |    2 +
>  15 files changed, 2337 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
>  create mode 100644 Documentation/driver-api/phy/lynx_10g.rst
>  create mode 100644 drivers/phy/freescale/lynx-10g.h
>  create mode 100644 drivers/phy/freescale/phy-fsl-lynx-10g-clk.c
>  create mode 100644 drivers/phy/freescale/phy-fsl-lynx-10g.c
>  create mode 100644 include/dt-bindings/clock/fsl,lynx-10g.h
> 

I noticed in patchwork [1] that this entire series is marked as "Changes
Requested," despite having received only automated feedback on one patch
in the series. I am concerned about this because last time this occurred
[2], the series received no feedback for a month. I suspect this is
because series marked "Changes Requested" are hidden in patchwork by
default. Can you change the status of this series back to new? Or should
I just resend again?

--Sean

[1] https://patchwork.kernel.org/project/linux-phy/list/?series=673741&state=*
[2] https://patchwork.kernel.org/project/linux-phy/list/?series=665484&state=*
