Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CF1779412
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Aug 2023 18:14:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=RdjQe4iF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RMpl9517Mz3cHr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Aug 2023 02:14:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=RdjQe4iF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe02::62e; helo=eur01-db5-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on062e.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe02::62e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RMpkD5Fbzz2yLV
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Aug 2023 02:13:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zni3qrFZFWkDVyW4zV8hJkAEcT4Fu9lYgSY/D7KGb3F9jVg7/5vw4M/eupywVcW7Z/7iCScfaNnOqoe6VsbUmeYVKZ6bhsZvTuL85bZ0W4chxlIiTBQ8scB7utn2LK2OK7gND9e2nktV5qNjSqZPWB0mDieYJP4CsT9TqzIg/HtmzWJHVdflky/NgR5E4JwW4BjGGnCT1MfXnzGk517oVWyQ6xZTiQ6oy3uA2omYQEGpY5zPK1fzSJ5VSO8fjlPm+1ud1KfwvuGX6WgCG+VB+OCVxSO3z7mxcX3d5xNygly1duFk3dD65l2CF3w9OVwMuKUgkXLdzH7c5oothpcziA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/zyraIzlVVjUxIwXTpq11nPlcUyxnYxp7v5L8xh5zMI=;
 b=QKcpiEJ+7Xk7t2oLFOeKvwK1CSjoQ2zQft7A/VLOMX6gk8ZQdVQ8IMr3U6Hy4sxYPy8wJsiKU9Y7+Kr+wrdp6vF6hknCeGvycquDQn5IzqfZhHnKHraYpvm7uX3ORH1pWxZoUmQtf6F9odffnANN2chWQ8xw+zZamExSjuyME4hTnZogz3wPPeQxh7m0K5c7jQrin7f3RoNkz5Q7v5aTMmoGsAkunK9JxNVARGvliPj+nN2hXNOxU66jMQth3n38bHOtYoP3fYe0oIZJbqp+2rJlX2VSrANO0LIN1VUQqfAcQSkBZ+Jupo6aoCiCXEYWyuy1JiTuYrcrZjdByHPb4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/zyraIzlVVjUxIwXTpq11nPlcUyxnYxp7v5L8xh5zMI=;
 b=RdjQe4iFHUIhRlz+RDlBuiCtGR2WdY5CnnHs4y6d7MdUIhYG//p5X47bXf23HxqqBtG0HqTi34I9lf0vxOxvZ5DsE6aBmaK5a4/eoJ1nH4LMw1u+JdNluxSs8QEqtVCQ43R0GLepriSEliruxeEq7TeXKatax8V4zbyaq8Z7FZ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com (2603:10a6:208:16d::21)
 by DB9PR04MB8137.eurprd04.prod.outlook.com (2603:10a6:10:244::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Fri, 11 Aug
 2023 16:12:57 +0000
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::d4ed:20a0:8c0a:d9cf]) by AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::d4ed:20a0:8c0a:d9cf%7]) with mapi id 15.20.6678.019; Fri, 11 Aug 2023
 16:12:57 +0000
Date: Fri, 11 Aug 2023 19:12:52 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v14 00/15] phy: Add support for Lynx 10G SerDes
Message-ID: <20230811161252.qjicg2l6sbndtgy2@skbuf>
References: <c2f928d2-25f6-0e31-9ab3-9d585968df1b@seco.com>
 <20230522150010.q5zndfwcuvrb6pg2@skbuf>
 <22a28a6f-2c84-a6b1-bb57-a269af34c993@seco.com>
 <20230610222123.mzmfjx7zfw4nh2lo@skbuf>
 <c702e2b6-cb0f-4ac9-86fe-a220284d45aa@seco.com>
 <20230612163353.dwouatvqbuo6h4ea@skbuf>
 <1dd01fe2-08a8-ec2f-1184-a58b2f55ba85@seco.com>
 <20230613142754.wr5njtjo4tbloqwu@skbuf>
 <20230810102631.bvozjer3t67r67iy@skbuf>
 <b1df425f-1ea4-0465-674c-25f3ed9b73d4@seco.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1df425f-1ea4-0465-674c-25f3ed9b73d4@seco.com>
X-ClientProxiedBy: AS4P190CA0005.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::17) To AM0PR04MB6452.eurprd04.prod.outlook.com
 (2603:10a6:208:16d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6452:EE_|DB9PR04MB8137:EE_
X-MS-Office365-Filtering-Correlation-Id: 8af7bfce-601d-4346-9cb1-08db9a85d356
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:  0ZdRbOGNYWL8KEWvF0VQg3k//X9tDirUzZj+jb5LZs0fkQFFZvIbucUr1PQmJP/MOtr+/52w9JCuRTemoDtzT/NhmIsNMWz3b27FkdnKzhP19A8zO0PbTgZz5fLqMm+yItXNJcaLVy/6wnK9D7PKpx1GuElSIgBMCugobcQVHNpuACntCh8eqhVgNCcn86Zb52T+gRxVyj96wQjQqOtOcOOLdXFAnKsLcLyY50K9SJd9YVDOO8EsNB0Zab9AwvD+AnkpWn+T16QTcFqlwuxe3YAHrw/aiR9ix+kFNQyAK3a5rJ4VTM0Z4lF4ynl6CsLe+TYBCHaSDGsTKPsfvm+5P088B57jzGqZZXndPdHv6UuNedEtoy+U1A7VCRgA04wov0YXjQhDXo5N4OLlmCqcPU6mQcZ9VEtIuhUUxlxSHbzmRyvSlDQBVS5QETTshHgPLkOGPAgTSbs3vjsXKdfD3S8UolXUm2a9YODSjw0pkoOC53P9jAdafEvxCQA4wmk8sWlHS6+Muw8Ll68UE3FE3X87owJkeEMXHd1KNB79iG8=
X-Forefront-Antispam-Report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6452.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(396003)(366004)(376002)(346002)(39860400002)(136003)(451199021)(1800799006)(186006)(83380400001)(2906002)(54906003)(38100700002)(478600001)(86362001)(316002)(6506007)(41300700001)(26005)(1076003)(33716001)(6666004)(5660300002)(8936002)(6486002)(8676002)(44832011)(7416002)(6512007)(966005)(9686003)(66476007)(6916009)(66556008)(66946007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:  =?us-ascii?Q?R8aQJPlThnSHIzFMyDhoJneWx4Kz9BsMaeNFa1mGsqS5QPJj9ND1iUaOOYt+?=
 =?us-ascii?Q?2Z4guXzVHbR3P9xBaBDaItDvv8okOc+3bYkfzTEWSYQrFr0RUSljBZBX+W+K?=
 =?us-ascii?Q?nx8D1u0EXrQGvgdhJYL/quce6Qw5fkUECrEdt1/3i+KQW+Rd+hBYZXdzKD2z?=
 =?us-ascii?Q?CmUeugCNPBuE3VBV1MxVhLeterAUk07DswPmAiNcAQSNejcgQ4qTGoGi8GrT?=
 =?us-ascii?Q?KjtcBvbHo6dFMAefEoIzOS4xQpmuE7bGH/knHoUULQsEHksdF+l0glO9l4ka?=
 =?us-ascii?Q?m+9HFby/5jA8oCvbwlWhDwOTmGsAwU9W6/35+KXepqeMYY3w196gdCLYY9mO?=
 =?us-ascii?Q?4hviel4F3e5l/Xwo5Qj98NYUVvWYNp+IWXZ/rkma5vOVwIRtQQqylpZo1w8i?=
 =?us-ascii?Q?lMnIIaScCmWRZhWFPQVZVwNeoD2aojawOlyv3didgS1VW6TOB1LMsIzhFrhT?=
 =?us-ascii?Q?hKyOeKwI+e9iDr0namo36U58SWfKWkwmzlyMVNg+lxCh36MUDaW9Xj6CI0mV?=
 =?us-ascii?Q?f9J1H68EskW5Mg2R7AlbYCbpJZ/TrcFaovxWyO8YWn9YUSXRae3YzO8yLxCi?=
 =?us-ascii?Q?RNyJ3WzUGj8x16GWARBL6xYDQ8T/kt1CEEwErNfw5mhMKWSy4VIQ2N0tlH26?=
 =?us-ascii?Q?MZCV7octteUJ5KopF51OkaWxQQ2y+Lo8nktIBueOd3+MxqH4tAzExquy0TKS?=
 =?us-ascii?Q?zSfYmaapLadPvs/ddWRQtC5Ek0Sfh5vxstutYwHZF1082ivL4k2XeM+f+sS7?=
 =?us-ascii?Q?RclJTRcYI/+GQbQA8RKVkmcalXT/W+gtBimzJRleRNxQ4RwwQIgJJb8e5hCw?=
 =?us-ascii?Q?tjq2H6jzhm9OpME6wNcFSfbdU40gk6tBoANpRYmwIfIA6QpsBELWWgHU85uh?=
 =?us-ascii?Q?bEavCJk2u9WLN0nv9+gC/Cc/5fNpgSXRxviy1vz6vmmcPuJRYPZnDOAAdMj/?=
 =?us-ascii?Q?GKKCOiYYZDtd21XRmmxAbGlHSPpVO5nhRSFRti0cQtZGo9tvkoRbBLxBSyf1?=
 =?us-ascii?Q?9AqlJJF2FxZF/pCAzm0dE/IWrXlmGVELI4hqWSMpJ6OOyKoxboyJY3yw0AqF?=
 =?us-ascii?Q?zCquscYmeoTgwfxmOpDrZbyQPbJtc/5td4ZMNqr8NFxiPRtIKypBRf3tfmDE?=
 =?us-ascii?Q?xi4qwAQhhIB8bFPIvOOy8rPnMIBYsX6fn+jiWHp0CXsg3x4HitMskyjvSV/C?=
 =?us-ascii?Q?5/fM2lK01DAQYBrXZ27jPI4057s+qdyYVgiOGyEgnDAeeSbn1bu9ATJoYsAE?=
 =?us-ascii?Q?dJfEo59VW8fLoMszHn/pUmwMyglocTYQnDMKsHzcHnbKx9M4Y9FfzB3G+hHx?=
 =?us-ascii?Q?VYfzbGj2V+DjrHTOGgsDRmXHhlNo00w22b9jNjmap1nbRcXE25pgK0Wjs7Tw?=
 =?us-ascii?Q?J/Y8C8paIQYwIAGLsd+nwXMSEehJN8rKWTl/JyTEt+mF1Dg6kQEJMLJUP9Kk?=
 =?us-ascii?Q?j+NtkXvccfKjrM00WC/nNyYLIuYdBOLv5TD4Qj93uBG64rJ2YW5ZumZLF/9J?=
 =?us-ascii?Q?Xf7Fwl6y50780mrqZ+qvoj4IlJvTLfVOlUnd/zHcJh81y+JGbZQnvN3YOA4m?=
 =?us-ascii?Q?yiNTTcfvc3mJe/WcqsmI3AZ3Fr03wm3NBwK7vK3bl0ZqgDOvFKViCCdXo1uQ?=
 =?us-ascii?Q?iw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8af7bfce-601d-4346-9cb1-08db9a85d356
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6452.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 16:12:57.1822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WEy4p3h1J1b1O+F05dRfl9kHxuAkqf7XRskNeXzOfhZhJDcxDjMdAn9rX3k0iL4+z6Gzhi5C8KWa2cIpop+s6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8137
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

Hi Sean,

On Thu, Aug 10, 2023 at 03:58:36PM -0400, Sean Anderson wrote:
> As explained previously (and noted by yourself below) 1G and 10G RCWs
> have mutally-incompatible clocking requirements. Now that you have
> documented an alternate solution, it is possible to boot up with one RCW
> and switch to another. But without that it was not possible to have one
> board support both RCWs (without e.g. a microcontroller or FPGA to
> configure the clock generator before releasing the processor reset). I
> do not think that the silicon should assert the reset request line if
> the serdes doesn't lock, but it does and it can't really be disabled.
> 
> As it happens, our board is set up so that the reference clocks are
> configured for 10G by default. During this boot, reset request is never
> requested. If we did not have to support software configuration of the
> serdes speed (to support 1G SFPs) we would not have to disconnect reset
> request.
> 
> That said, I have evaluated the various reasons that reset request can
> be asserted, and I have determined that for our product they are not
> necessary. The only major limitation is the lack of a watchdog, but that
> was not a requirement for us. Because of this, using a GPIO for reset is
> sufficient and neatly avoids the issue.

I would like to pause here and highlight the existence of the so-called
XY problem: https://en.wikipedia.org/wiki/XY_problem

| The XY problem is a communication problem encountered in help desk,
| technical support, software engineering, or customer service situations
| where the question is about an end user's attempted solution (Y) rather
| than the root problem itself (X).

You admitted that you needed to solve problem X (software reconfiguration
of the SerDes speed between 1G and 10G), and that has led you to problem
Y (giving the PLLs some refclk frequencies which aren't supported at
power-on reset, and thus, are also not validated by NXP). You've presented
to the Linux mailing lists a driver which solves problem Y, but not X.

I gave you a solution to problem X which doesn't even trigger problem Y.

Furthermore, I gave you a solution to problem Y which is much simpler
than yours. On the 12th of June, in Message-ID: 20230612163353.dwouatvqbuo6h4ea@skbuf,
I explained that if you absolutely insist to use the unsupported PLL
refclks, you can use PBL commands to change the PLL settings (so that
they lock) at power-on reset time. The advantage is that both U-Boot and
Linux will work without having to make any modification to the PLLs,
just treat them as read-only.

As it happens, at NXP we also want to solve problem X in a generic way
(aka we need a procedure that works for all customers, and not just for
your board), and we want to do so in a way that the hardware validation
team agrees with. Thus, the SoC needs to accept the PLL refclks at
power-on reset time. The solution we came up with is the one presented
to you yesterday. It makes your PLL clk driver unnecessary. No one will
come after you if you keep it in your Linux tree and use it, but it is
unnecessary.

> > Nonetheless, below is a functional example of how NXP would recommend
> > you to achieve the desired PLL mapping for any RCW-based SerDes protocol.
> > My testing platform was the LS1046A-QDS with PLL1 at 100 MHz and PLL2 at
> > 156.25 MHz. I believe that this should eliminate the need for a clk
> > driver for the PLLs, and should make your Ethernet lanes usable much
> > earlier than Linux. That being said, our position at NXP is that you
> > don't need a clk driver for the PLLs, and I would like to see the clk
> > portion removed from future patch revisions.
> 
> I have not had any issues with clocking. This is actually one of the
> areas where the reference manual is sufficient to create a working
> driver. Adding flexibility here is very useful, because we can solve
> hardware problems in software. This can reduce e.g. board respins, and
> allow for more interesting clocking solutions (such as allowing clock
> generators which must be configured before use).

I am waiting for someone to come up with a real life use case that
justifies those "more interesting clocking solutions".

Please correct me if you think I am wrong, but as things stand, the
SerDes PLL clk driver is now a solution waiting for a problem. It can
wait for that problem out of tree.

> > There is also the previous observation from Ioana that you should not
> > delete PHY interrupts without finding out why they don't work.
> 
> Well, if you have a better solution, please let me know. The interrupt
> does not work in real hardware.
> 
> I was hampered in my efforts to determine the cause because the interrupt
> passes through an FPGA to which I lack the HDL. So far, I have not seen
> any argument against polling except that we do not understand the
> problem yet. However, I have not seen any other analysis of the problem
> either.

Out of respect for the topic at hand, ask for help in a separate thread,
open an NXP support ticket - do something to split it from the SerDes
work which it is unrelated with. You were told that part of the reason
for the NACK is the fact that you are grouping unrelated things together,
and you did nothing about it.

> > +SRDS_PRTCL_S1=4403
> > +SRDS_PRTCL_S2=21849
> 
> I know it is not typical for NXP RCWs, but your rcw tool supports using
> hex/binary prefixes. Thus, you could rewrite the above lines as
> 
> SRDS_PRTCL_S1=0x1133
> SRDS_PRTCL_S2=0x5559
> 
> IMO this is much easier to read, since it matches the documentation.

Ok, thanks.
