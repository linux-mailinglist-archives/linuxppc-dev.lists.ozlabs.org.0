Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C39B5A6F65
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 23:45:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHLT42WK1z3cgh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 07:45:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=DiJGRBGQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.20.85; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=DiJGRBGQ;
	dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2085.outbound.protection.outlook.com [40.107.20.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHLSL1RFdz3cCN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 07:44:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ij1JhTWqWYW4WLMPQcimjNAaeyfGo6yjMhyX7++qcgOTaL1Xo0rsnzo1Oi7PU+veR8Lad0cNytbplAnXMY8Ub3QKQKbgv1duqAlfl6uMS3o4rBDX0D7S//wlwtz/YqUPezI0DBiK433yRy2+bFAHk9WuBH7pHCuZ/1cokeCV36eF9ZnxWDLFf7V76YJK7HM6Hj8rZhfT+8+VgoIRPg2Fr2JnGSQmCNsAVpUUlqHz7q8ueopHdNV0+abkyP+IV02Nm14all08EnTVNnH7JpCDqnrADZ55e9zMSGw+N3F1uVOhzLk5ZBvmaM24brlJAAF0fkGOEXiDJFlh38xZxJsCQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l8nRW8qiSaihFYrxtkA3NcgTgw+m5QYOoTn0gekMg9g=;
 b=JsT3jk6l0r91hm6vQVzESPjtE+gs2yQ19FoZE9sPCAH98PapzcP0fhE884InoYQ2cjWb1+XHOM3OLcfvVW0vPbGi1ddwK+irzIH8VebPDZaQYPh1vHLAgfUy63PfPmWiO07SqiZ+g5NeoX7Ec9uZgtO7HISDNtT0MKszym5jVJ3HR+Z6w7UJplFheREWJRV/XdXMiEEcXFARuuHoRtsqPj61SsfI2HtER8A0ZClPhufgModADD4lFzRnBX4Hw/OObOaA+FPEmeK2YSqQ1eEq7BPnSTnTlESTIsPt5AcGKvb5ItsBWn06mbL8vxQMLEd2OlCtCYck/qq0u8JHKOEtyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8nRW8qiSaihFYrxtkA3NcgTgw+m5QYOoTn0gekMg9g=;
 b=DiJGRBGQitb0PgnPoHZuzxQQtJpcyPpBKsJtKHkeN2weMvsJ29Gn5NbWETq/1fq2TwlPKDYv2tfpD5RzMDYeA0TynSL2tQ2YE9llcmAhefpmtd0tVMMVDX4vEG1Mjl8W2KPZiAIBVt/BUfFUzVXFbsDgdoXdAMcSQXrqYPE8XgRr+5EBPcInp2mw/FXvnYejP5jF4wnqBNl/oazxaTEDP89i9MKk1J1LPBwvSrTVv5gCPSa4kzZhf4DuKF/msvid/5cwKUmkmmnf5dtf7btr2Np30m7cH1C9ojyhDRhdnGVLsaqnd7N690eRnGI1QoDvnFydKF+yKwBsOCPNSHypvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by AS8PR03MB7987.eurprd03.prod.outlook.com (2603:10a6:20b:42a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Tue, 30 Aug
 2022 21:44:29 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2%4]) with mapi id 15.20.5566.019; Tue, 30 Aug 2022
 21:44:29 +0000
Subject: Re: [PATCH v4 0/8] phy: Add support for Lynx 10G SerDes
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-phy@lists.infradead.org
References: <20220804220602.477589-1-sean.anderson@seco.com>
From: Sean Anderson <sean.anderson@seco.com>
Message-ID: <6d312336-4bfc-a8d4-783c-116a21284edf@seco.com>
Date: Tue, 30 Aug 2022 17:44:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20220804220602.477589-1-sean.anderson@seco.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR17CA0017.namprd17.prod.outlook.com
 (2603:10b6:610:53::27) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b236204-133c-4bc6-a7ba-08da8ad0d11a
X-MS-TrafficTypeDiagnostic: AS8PR03MB7987:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	lJ3lHYVxq8ip8g6ZIo64iRMD1imEDaZ8IR4d8JLZi/mnH99tbeUcdpjzKYaNOMDLQVmXUW2ABxBInzCeoXtWyR+Iw3D9WEItVisj0nA/WsdkzfCUH4F6SvNG/tECcpvP45UJ2KQcd+eM4DSvLsGK9xe1q6YxfyZhconFkQMXU2x5GhIPYwucN5Jj03qLYNPg/2HjJM5exaLMDahTuexpnABwhfM92MuruqXsnWkc9xo8XpvrDtQ+f7RcRAAAV4+Dz54B47qhDVUH9z72L3SXJoHaXATDYtTRTIwgkSg3qfNqtaTTH+BcYr+EEzdKYtIFkMrZOqKWeF6yaO6fpL+LFnVmATdo/p6MlwcAgM8HzR3DHx8R/4ka20SLmqSDxFaEDgty3oHuCMBbdsQR1wksdPn1maH/zhRJepaRa/o7CgRLxhl6t8eFJQdOTVH3pnazDFMiX+b2f1F7KSqwe6IljhgMGEMDkakjDGspvIG8+1Gy5/CTkdBGjUyGbzh2g2Ma6bW3o6FNfU9HgaDl/4AAHS2dCFjyNoq7F1J1E49ef5TjkwQwGtD7Qo9JMKYazo9TRFWNRMs2KFnV+llj6O6LDZxnmn/TPZLNjOb/Wwvz5Y/iPM+/qCLf5FMMNncDPiFsXy1DZZ7nzFEfiIwcgaOiSUZBg41sQOig0AevB3IX1OhzOUulGoZhCOXTzAyNG4ZY3A9Uk6AUOa00EQ68QfprNbUU9mWOtcQVSfDsbApjw4gYokDoc2yyIqZ1R7mQTP1KncjC2XERjzskfjvzMVwqxgbS5o3rYgtHMZGOjRym/SVTsx1HlkJuXiNCS3VWMjNSLgRVMftexjPnKKeC2wEEBQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39850400004)(346002)(136003)(376002)(366004)(6512007)(26005)(36756003)(31686004)(110136005)(38100700002)(54906003)(316002)(31696002)(38350700002)(6486002)(8936002)(8676002)(41300700001)(7416002)(4326008)(6666004)(478600001)(66476007)(66946007)(2906002)(6506007)(52116002)(66556008)(83380400001)(53546011)(86362001)(5660300002)(186003)(44832011)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?WitLckZpYW5ic0pzdGVQTTZHS2t1aHFzNm13M0NwdDVBV05QYmJob3NmM204?=
 =?utf-8?B?Z21DSTRCZ1lySU1TQVVsRU1COUsyWXBkUHdhamVCUTB3ZFRlUUFnVGRqdmw1?=
 =?utf-8?B?Wk9ENTdjM3Brc3BsNE9yV0JKMFZvQi8rWVNXamFISnQ5VmRFd05haFBra3FM?=
 =?utf-8?B?ZHhraDU3R2ZmbE1DOHZrSmVnRU14TkQ5MDBIK3R2SUFyNmRoNGxuQW52cTRp?=
 =?utf-8?B?NWxWZldCcUNoaTRZQXVrSTdiZVFRTmpLOUdDNTFTSldMRE81WUJKamFJamhQ?=
 =?utf-8?B?NU9QZ3QrWjV6dGQ3elduRWg5WGJOOWVYUUFkbXVjekFQL0VHM3AyNlJTNGhr?=
 =?utf-8?B?U2xTNnFGR1BYUlNNNkZic3hEYzdCUzBhRGg2OUQxdmlaR0ovZmlvYXVQTDVJ?=
 =?utf-8?B?ZCtTeGRNSy9MN3Fxck1mWnR0R0wrUzBOeWdhWndlWS91Z2I3a2lRSTdIOWZa?=
 =?utf-8?B?dy9iSGg0RkRSWXJwSURDOVhSRVlRUXR5YndmZUd4WXlNRXRWVFVxQWpmYS95?=
 =?utf-8?B?M2c0NEVoazRqYzFMeHlzckpWK1VVOU1aRnZXSjVPTnNWeXZ1Y1UzR0R5MGta?=
 =?utf-8?B?WTY1d3M5N1crYVNMVktyOWlHMGluSkFPVWsxRS9VRFNEUXZMOVdUSDZUVmM1?=
 =?utf-8?B?Y0V4M2xHVy9MdmU2S2toRExEaEc0TmM1Z2orSExVZzRDMFVIREJaSlRyU3JI?=
 =?utf-8?B?L1dOSlZCeEx3L0NxQTJHeDJrTkNadStBOTkra2FZaFRJd0ZSYUc4VVIxc2RO?=
 =?utf-8?B?NFY0V250dlFSM1IvRnFTOFdFMXJVbzVQRzJDQ0Z0aUw4TjZjOWRmMHpjK1NX?=
 =?utf-8?B?L01ocWpZWUdoM3p6SmROQkRDUmxzVmlkVjgzakpSL2REOGVIN2JvaWhGcFF1?=
 =?utf-8?B?QSttMEo0eFRLR25SSWRrMTFWYU5NdFJRWG9PUmVvbXBGaTlsbzhEUnRlci9x?=
 =?utf-8?B?cVRZM0s5Z1RKV0pkbXFoUVdHdWNCM09hOUkzOG4wM1F5NS81ODJHUlhmQld2?=
 =?utf-8?B?eDVzQzcreWkrd2IxeDZ2R1Rsa0IvTVNHMEI4a3ZBUWRBYnBqWVRpaFVHN1dm?=
 =?utf-8?B?ZS9peXRXN050Wlo4Q29YcGk1bFI2bEZ4UDRuV1NyYXJlTmtwYTdFcnJSRnBV?=
 =?utf-8?B?UXlxa2hSVThKTXczRUcxOVUxQnNXZkFtWjhaVXllMWJSMjh2bjBlQmlrOXdG?=
 =?utf-8?B?QjhGekFLd1J3ZUNQZXZKdCtDbHlYUFZBeTkxUTV2cGxiQlVrNHR0clpBd1d4?=
 =?utf-8?B?ZW1KSjZ0dFNMZUdqQU8zZ01Vb1hDcGd3QVZ4U2dpQ3c4elVMS2ZDM0JUaVVq?=
 =?utf-8?B?MjNPUllyK0lPVlJ2cmJ6OG9TZEUybWJsSnhkK1lERlU2MUQ3VGpBR1IvTjdn?=
 =?utf-8?B?anh6YitTNEQyREd4dFJTRUtUdlpNSDdoN2l0L2liRkpPSm9QaDlsY2pXdDJq?=
 =?utf-8?B?ZWM2ZlJEdnE2KzBTSTBKNE0xUTRGbzJoSWJONWFYbUFFZ3dtNmo5Z2M4bkRX?=
 =?utf-8?B?RDdjM0I3eVVvT2VpVG02YWNTc3QwRElSV0pqbllKd3poZDR6MHQ2cjRKQTFK?=
 =?utf-8?B?Z3lBakpuRGR1dm53TUhnM09mNjdyM21WbVJJTTlqMjIwdzROeTVYN3djNmFS?=
 =?utf-8?B?OVhNZW9rL2FFdkRlVldmeDlwV0hGRitKeVo1aW5aM01TanlUc2ZqT1dmV3dm?=
 =?utf-8?B?eldNa2ZhMXFhWktSR2ZBYUpZd0hHbzVGRWVZd3NiY3dWR0l5VXk4K3hscGlC?=
 =?utf-8?B?eFRYSkpzaDZ0ZGxndTlQb1dYRHkwSWhCeFNpUXVtcndNd0pUTXZjSUY4ZGdF?=
 =?utf-8?B?Q29qeXA2Z2Z1WUN5dFFLa0JwR2ZWTTZHdzBzVlJPRXFVMUI2RkdxdVFiWExR?=
 =?utf-8?B?Qi9oaHFYbEhHZ3VBZHE1U0JzZzdQam41dFFJUTFhRFhWR3dtUDNzOE0yRy9S?=
 =?utf-8?B?ZnlkWXN2aUx2ZTR4VUZ5Y3BZekFwU011N3JmMjhGeTNFdS9FQTh3YXNMSC9O?=
 =?utf-8?B?RjdXSnZVaUVDZm5MMkgzVDk4eUMrcUVRT1JGZDVIc1VBNFNlalFGL0orOEp6?=
 =?utf-8?B?MmtRUTlVejJEc0NwY0pkKzJOTzhXRkkreS96QlJ1czJGTThmVXdCd1lSYmV3?=
 =?utf-8?B?N0lpd2ZOa2FBQnJnNTNjWmhmWEl3YllOQWJKU2lvc1dJZjJ3SjZNNUw0MXhv?=
 =?utf-8?B?Rmc9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b236204-133c-4bc6-a7ba-08da8ad0d11a
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2022 21:44:29.4861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zBqFd/MlO6gnCfSdi+I3BoOPf5GAa/qoanqqT8R4XDZg2LKnQo1Uds0waunRtRBh5wwgwqmfJLwQbWi78lhZSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7987
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



On 8/4/22 6:05 PM, Sean Anderson wrote:
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
> I suspect this driver is around 95% complete, but unfortunately, I no
> longer have time to investigate this further.
> 
> To facilitate testing, this series was prepared on top of
> next-next/master. I can rebase it onto another branch if that is
> necessary.
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
>  MAINTAINERS                                   |    6 +
>  .../boot/dts/freescale/fsl-ls1046a-rdb.dts    |  112 ++
>  .../arm64/boot/dts/freescale/fsl-ls1046a.dtsi |   18 +
>  .../boot/dts/freescale/fsl-ls1088a-rdb.dts    |  161 +++
>  .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi |   18 +
>  drivers/phy/freescale/Kconfig                 |   20 +
>  drivers/phy/freescale/Makefile                |    3 +
>  drivers/phy/freescale/lynx-10g.h              |   16 +
>  drivers/phy/freescale/phy-fsl-lynx-10g-clk.c  |  501 +++++++
>  drivers/phy/freescale/phy-fsl-lynx-10g.c      | 1163 +++++++++++++++++
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

ping?

Vinod/Kishon: any comments on the driver itself?
