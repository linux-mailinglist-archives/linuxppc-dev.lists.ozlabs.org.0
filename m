Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB12A6F2574
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Apr 2023 19:25:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q7xFg5CWcz3f72
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Apr 2023 03:25:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Bkg3Qs+u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe1e::622; helo=eur01-he1-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Bkg3Qs+u;
	dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on0622.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1e::622])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q7xDk6wGvz3bjy
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Apr 2023 03:24:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n7rUas3oF7n9+Umxtkq91ZN6v2iWnfShTbhTwe1jh9Bc045GhtWMjFZ2ZONiEFwimFaFGyH9OBAR6Ob+WE3sswYPTe3xzVIy3eOXdh2ramGEMUPcB94YDx/AwjXB5vd3BcRrINhDVuVS8iJCMCFtosWneAcab9hP5vzXYCQstjdrwynsC3zAW+wPzLMsuzY9ayc6gWnf8zyPEUWJokmWlNoAtlgx1cesw1KKPIjVC2QeFHHBjVJaKNS92unQ3VJ8XJA4pgRqZspcV/w7WzkJhQ4GFx6PLgHtu1Gp9mYN8BB3i6cmU5Zk3eU6EwkETc4Til4q37YvHglfwDKAnKVvWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ndSbYzNodTYkKaX4YSKtyI5CMPNCIJNwjVnYTMb0wkw=;
 b=D8Pom4mE3KhlDEGCFMFM5RHGXZugokJAUUSMvVWW+XHS1e1G+HqGyqEm7zOfwn/Jgf02zklB0hDtgGmODzvzQIpWhHb2dZpQGCFmZw+dYZ+ovmFcb3rLFfIS8Eb68qE6OnQzMj8aXIJfvI07pQ0ACBZSaAvPB85STgDvI8lZpYjL4y4N1zPI8lYqMqd83IIdjSuf7+sCd7SjPMhxFjr09utSpHw/zESGqFMCUhobAxpn+Hzkjb3VPQX+d30bUHq/XEPlx/SQeMT1svt/doJHEK2nzuL7s8kxePB49C8GjTv+1Hre0VdAkT3zjG38Wxfl9rCqCJ5j3dpIZxJ6FNOGgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ndSbYzNodTYkKaX4YSKtyI5CMPNCIJNwjVnYTMb0wkw=;
 b=Bkg3Qs+ux88YQFe0tCD7C/IcV99RTd4z5ivHUucf9rdzQ9t4ySkcp4+t0QumF/YLGkHBDV2paN+ixDufF6v9izYEKKG4Tws3jbiVFBSO4ftq/Z82o3wEvAxiUko5z16YO3gi3htWck+x232xtDF+qOBiFvWuDMkaq1AHPnYJTbY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com (2603:10a6:208:16d::21)
 by VI1PR04MB7184.eurprd04.prod.outlook.com (2603:10a6:800:125::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.27; Sat, 29 Apr
 2023 17:24:27 +0000
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::245a:9272:b30a:a21c]) by AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::245a:9272:b30a:a21c%3]) with mapi id 15.20.6340.025; Sat, 29 Apr 2023
 17:24:26 +0000
Date: Sat, 29 Apr 2023 20:24:22 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v14 00/15] phy: Add support for Lynx 10G SerDes
Message-ID: <20230429172422.vc35tnwkekfieoru@skbuf>
References: <20230425195002.fls5cmwolyrslpad@skbuf>
 <b7779674-c3ac-e0ab-3ca8-db1ec5953a97@seco.com>
 <20230426105140.t4yqv6irtjcwptm5@skbuf>
 <20230425195002.fls5cmwolyrslpad@skbuf>
 <b7779674-c3ac-e0ab-3ca8-db1ec5953a97@seco.com>
 <20230426105140.t4yqv6irtjcwptm5@skbuf>
 <7c7ab84b-3c4a-4e44-b5b5-4acf733a0246@seco.com>
 <7c7ab84b-3c4a-4e44-b5b5-4acf733a0246@seco.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c7ab84b-3c4a-4e44-b5b5-4acf733a0246@seco.com>
 <7c7ab84b-3c4a-4e44-b5b5-4acf733a0246@seco.com>
X-ClientProxiedBy: VE1PR03CA0015.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::27) To AM0PR04MB6452.eurprd04.prod.outlook.com
 (2603:10a6:208:16d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6452:EE_|VI1PR04MB7184:EE_
X-MS-Office365-Filtering-Correlation-Id: 94f0f769-9fb5-47da-8e9c-08db48d69501
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:  E5aZWncaXsgygy356pERVhy6wTS39jGzuH06AFsCuT5s28dFT8DNOEPN0qz4XdaaAl639yy2zSJloCdd04me1FKSdU36MZkAyx0zNS+qyJGPCsW6G2joWOVs8/gqfN6O0YkJoTyOF3pP5ewLeH95wFtbGzTe9LNOVAYC23Kmt+vBQdv5SRV+Gjgwo00JY59LN1Ad8upJw3mYeUcWDi8S9gb29P3NveL3CwqPcF15az6LZRfuc4ri8m7puYnwsTDRrTMLVkTcruuuzqJ++9719Ax8ZP1rM6tKLj3bf5UUgA0dLJOGIZQVlGvdo0IM0DZf3znIFvLo+IM36yYEDbYllMnNBoYxr78qXnyYfHztXCCdtB/rwB4+SWrr85LGNilhSgxTiLMmFFnVZnRldcNxDTcTp8eeDIJmzu2u6oDff0MhQ16C8kYqfJ1eLmkXDfm3djkuzhefozID6KsAGmFcm0/21FQt8n+BP2QD1za+N8G2zAIwfD4k6ie5ZsAHzGszPc+wi/hYb8h2LAhEtUjHWkKhrwT7oBfNXaYHlhkvS7XveHxvHJ1pQ0VuN0LXBwv2
X-Forefront-Antispam-Report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6452.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(376002)(39850400004)(396003)(366004)(136003)(346002)(451199021)(33716001)(316002)(4326008)(9686003)(6512007)(6506007)(186003)(1076003)(41300700001)(83380400001)(26005)(478600001)(66946007)(54906003)(6916009)(6486002)(6666004)(66476007)(66556008)(38100700002)(2906002)(86362001)(8936002)(8676002)(7416002)(44832011)(5660300002)(66899021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:  =?us-ascii?Q?VKfvHVUrBADhmr5uEXY9a+0ELdviCvG4bWkZqPNPfKhEixN96qv3ve2tFMXx?=
 =?us-ascii?Q?GhYl1GyqaR1QWL+e02+ZLxOe69VaLwYbg/mkjGj3duKCBEiPBFPwfayVRS8J?=
 =?us-ascii?Q?nLDkt2bJc9eMnOrmEldb2AF4XpbVbqG/xG1rZEfQ786tpQHtja4kKJHMKunP?=
 =?us-ascii?Q?RrNbiKDbVbKBJXoEmatQMEs9GmviQKFHQb17htuH6Dio17ba/9zgf/LVLIpD?=
 =?us-ascii?Q?To7oz+b8hHJNqKG2X+bqXuGixupm+Ek5BzHhz4v5U+KIjhwj3J5U8xeT3U5K?=
 =?us-ascii?Q?TLusdP2hcmNX9Y4fZgOKG5srb8904Fklcwn+TvBvgK/UneZPhtpXzOYZsOm7?=
 =?us-ascii?Q?PIp1cApySA5+Y+I6UDs3M3+9XFryLDzGxUwbMjA+qGlQTk7HZZ7MZIeqLS+k?=
 =?us-ascii?Q?7aGUyrMkOMxFGdNpo3G1BbRMrIXiyHMhJA9gOBPRdiR+ULhNDnMj6xDDLoC+?=
 =?us-ascii?Q?VkCPtUNlGQQLhorkmS3/5zGW4YftkxXjjBfd64P/sqccjJKryoD5Xk/hJcf2?=
 =?us-ascii?Q?GTDNWYOQtcOJRAvijrlJEGe2Lv7iLNPscV7SNjxpwsSBXGtW5e6qMXip1we4?=
 =?us-ascii?Q?e0mm39YEeU0HR3Xy2FAe2/nZ+/JeyCfsREyKVXnMtC2hPapv3G5FosTljTDJ?=
 =?us-ascii?Q?UIPHXoiKErjIlX1XXJsJ+0na+jYi6q3xg79cGRIAAmpjIgpWwdF08boqLU9F?=
 =?us-ascii?Q?M7rZRl9R++UvKbPMiZsxtrYLrjhqCEHCVt8/ZRhzA35jRwyaWF84iC9/NkM7?=
 =?us-ascii?Q?qBESYAdz6LY88V83pqOtGWp5rHwiakQiLffr9LSo5yaSKsmznfnKzPYQi7TR?=
 =?us-ascii?Q?yjgVBu3DSLvapuRI/TyESjP4vTk/wiFKNPSAEMLwvv5sb0LqWuHsdHt+EUf4?=
 =?us-ascii?Q?MJeNpqZI/jBljMbeldrl5xWiTsxd7gU9eojvlIpwQgU4ehxWRscv5MYSvIU6?=
 =?us-ascii?Q?DHboRK8WJ8k92QkfRe07Hy6O+k/rKd1EoikKy7lZVQNO5KhZPlrzDx2Q6QA8?=
 =?us-ascii?Q?U+ptlgIaTOd0Pqe07R4G8p2EZVntghxszAiSew6SbFWEuMartWEu0KcfWpcN?=
 =?us-ascii?Q?FTzfPUmBEjS653hTKW9+2Zoyks4i/yO79jRSACGIBo2qapPzvQ8ZQDG+7X0a?=
 =?us-ascii?Q?Ch7yejRwyMK31E9xLN2242K/TvgARUC1A8gzTY4+nrTSr7UoFS5D+rcwnLGt?=
 =?us-ascii?Q?EdaoN6Zwr54m7Phd4oZJG2JVYlk3uIrBlyeQfe1tZUfbldWKXCRLT2Jhzr5Y?=
 =?us-ascii?Q?wfziGanYLJHMpYo/GCtomqwFrchIQcCMCjhGzaPciePIWUhSQNJEOne+70/I?=
 =?us-ascii?Q?2CRq8KzPHCejV9m8hJ/wC26OO7dOXn2XqYdDenWx8wltbDOZxutt/GI6/+Ap?=
 =?us-ascii?Q?UxLP5tgPoP8EqexhuzW5Tvkq3EaLMIx5ZxnWVv8/hjpnLVwEbqK3I2kHsre5?=
 =?us-ascii?Q?0H3rVrPBgjQxvZGebPfhh/FmK/+1V0AU+nJ1/daKFI8AF0ht2OYfLnXVmGZS?=
 =?us-ascii?Q?s9/t2791j8OnjhYfr5q/cgVn1TecoMx3SNqmjhSK03aG5UuE2o8TWjcv+6vz?=
 =?us-ascii?Q?hrt9yIcAnM0QEspnUa5SDiF7xwphvJhKe7yFuv7OyaiyS0RddOToxtpDrh39?=
 =?us-ascii?Q?xQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94f0f769-9fb5-47da-8e9c-08db48d69501
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6452.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2023 17:24:26.6041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 38ASD5X7MPyUL4krgQNgZ03/VM1G7YUyWTXoX/8LxfYcsyY5EO4I9le/Ekx8Q/wDW2O4ir+i5OS8lplyQqkxLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7184
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
Cc: =?utf-8?B?RmVybuKUnMOtbmRleg==?= Rojas <noltari@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Michael Turquette <mturquette@baylibre.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jonas Gorski <jonas.gorski@gmail.com>, linux-phy@lists.infradead.org, linux-clk@vger.kernel.org, Kishon Vijay Abraham I <kishon@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-doc@vger.kernel.org, Camelia Alexandra Groza <camelia.groza@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, linuxppc-dev@lists.ozlabs.org, Li Yang <leoyang.li@nxp.com>, Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 26, 2023 at 10:50:17AM -0400, Sean Anderson wrote:
> > I need to catch up with 14 rounds of patches from you and with the
> > discussions that took place on each version, and understand how you
> > responded to feedback like "don't remove PHY interrupts without finding
> > out why they don't work"
> 
> All I can say is that
> 
> - It doesn't work on my board
> - The traces are on the bottom of the PCB
> - The signal goes through an FPGA which (unlike the LS1046ARDB) is closed-source

I don't understand the distinction you are making here. Are the sources
for QIXIS bit streams public for any Layerscape board?

> - The alternative is polling once a second (not terribly intensive)

It makes a difference to performance (forwarded packets per second), believe it or not.

> 
> I think it's very reasonable to make this change. Anyway, it's in a separate
> patch so that it can be applied independently.

Perhaps better phrased: "discussed separately"...

> > Even if the SERDES and PLL drivers "work for you" in the current form,
> > I doubt the usefulness of a PLL driver if you have to disconnect the
> > SoC's reset request signal on the board to not be stuck in a reboot loop.
> 
> I would like to emphasize that this has *nothing to do with this driver*.
> This behavior is part of the boot ROM (or something like it) and occurs before
> any user code has ever executed. The problem of course is that certain RCWs
> expect the reference clocks to be in certain (incompatible) configurations,
> and will fail the boot without a lock. I think this is rather silly (since
> you only need PLL lock when you actually want to use the serdes), but that's
> how it is. And of course, this is only necessary because I was unable to get
> major reconfiguration to work. In an ideal world, you could always boot with
> the same RCW (with PLL config matching the board) and choose the major protocol
> at runtime.

Could you please tell me what are the reference clock frequencies that
your board provides at boot time to the 2 PLLs, and which SERDES
protocol out of those 2 (1133 and 3333) boots correctly (no RESET_REQ
hacks necessary) with those refclks? I will try to get a LS1046A-QDS
where I boot from the same refclk + SERDES protocol configuration as
you, and use PBI commands in the RCW to reconfigure the lanes (PLL
selection and protocol registers) for the other mode, while keeping the
FRATE_SEL of the PLLs unmodified.
