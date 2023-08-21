Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 310317835F6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 00:49:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=cDR3HYxT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RV7340Y7Cz3bwj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 08:49:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=cDR3HYxT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe16::61f; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe16::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RV7275Jtgz2yDY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 08:49:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4h054R6PuJZ80TxV0Ex+1HtYkgkZY9AFhUo42se0KQhRhGdJViMkL8amn5F6NfYx9noyh2vOsHBpbN1Gpc48YPmR3c/NTwTkDQksAHPWePV5J4ERP27LzXaVj8BGbjIjSvM/HMvHI8ljIUoi57S9bpXWCV6/tmJcAgOIFFbZ1s01bqo6nuIkkRNDcGayDUvQSU7YKD0shci9JRP0QTPxBd6uKx4PRfXKPRUEzO5h4AVzU+wQaafl5fInm3Wy577YCYTicw/mDW8uSVyXt1FWQExlZROVdMxfXdmAOE5r1gzR6Rhbw1owfpPV+ady79LlWjhoUGfC+Z3YWcDZxHUMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MOjONp43FhgrCFr3VoviClnt9T++FiCJ/+En2c2fKKQ=;
 b=A6NrGdVwHcLmmvnvmjih0znjmZ3yi+EnMQ9h0u/q+6Q6N5XXj/+7+6Bhpinusl7TavMz8HOxTTp3Yi5AKB4vhx3EXnwyogOvReuvjjmWzLFTGRbHgbKhdM5hGuXzCnhh1uUUcpIMkRvQc+er9Kxy0kdWTWch2XZ1XYXEZjHfRL27HPFhGtBLS85T+UKQ/s7QlIdomQo4JsPzpMg+j8QK1Iobd+WeunNJMvWp47+CXR6rusyprCr1HCK60hwhiGh2cA6Cbw/yQraessoqwDkms0AOjGsjnpk/PQWR+HqGPx61KtS2zsw5F6uiB2GkxKQ3t/ugjTNz9t8FVGpCFjR/qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOjONp43FhgrCFr3VoviClnt9T++FiCJ/+En2c2fKKQ=;
 b=cDR3HYxTz0Ld3In4fltr0ndu+qBAs7KootFG+VhgGc8l8zaYCuh2BIxbwMNQPgYs6YQhk+vCTslRA6uewMfQaXnl/yG54yqJzE8U2VF4JnXrLQkudyeYIkEl614dLgaJ/Nw9M0Jh4CrNyojsEckRb1QJrhZYQWGVzgUVWMyti/w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com (2603:10a6:208:16d::21)
 by AS1PR04MB9357.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 22:48:39 +0000
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::d4ed:20a0:8c0a:d9cf]) by AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::d4ed:20a0:8c0a:d9cf%7]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 22:48:39 +0000
Date: Tue, 22 Aug 2023 01:48:34 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v14 00/15] phy: Add support for Lynx 10G SerDes
Message-ID: <20230821224834.ppk4hmjyajupy7va@skbuf>
References: <20230613142754.wr5njtjo4tbloqwu@skbuf>
 <20230811150826.urp2hzl3tahesrjx@skbuf>
 <26623d0c-8a5a-614b-7df7-69214aaec524@seco.com>
 <20230811163637.bs7a46juasjgnmf4@skbuf>
 <20230821124952.mraqqp7pxlo56gkh@skbuf>
 <a2e3fcad-9857-f1b3-8ada-efb2013a4bf5@seco.com>
 <20230821181349.hls6pukp5d6rc5av@LXL00007.wbi.nxp.com>
 <73d59dd2-88f0-3c1a-0de2-de2e050cba5a@seco.com>
 <20230821195823.ns55h3livxgol7fp@skbuf>
 <a66c9abf-5351-62b6-5573-cae38e6768e2@seco.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a66c9abf-5351-62b6-5573-cae38e6768e2@seco.com>
X-ClientProxiedBy: FR2P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::13) To AM0PR04MB6452.eurprd04.prod.outlook.com
 (2603:10a6:208:16d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6452:EE_|AS1PR04MB9357:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d1bafe0-f523-4a6e-b300-08dba298c2a1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:  UeS7rZkZeGqmV3P3XeAoGT0pC49nCWBgOzmTDuOMwHpR0jiKrmT9liGmUn9kYTUe1+Rs/srgPXOpiERYcNXdcivRjjSIlN/LurkJS7n0iTllCFI+UDXNbRS4mMQb9PK1J9Cz7336LIi30EO2TjSvBHf1SEKLVUa0y0EZgoeICe26xRO05k5/AZpxuVWLBEI+T0EGpLMjHHopP7Oi3TKvEhLpEooN2rVcrQOhfKT9XfWRT4abrhVEsRyOR0mYCkPTw49a4XjLUZNzQoP14Pt3QhVn9/c9I75q+FUE4iuS4NdkufugFUg8xI59NAoMb+DkkJpRjqNuiOCKjecP/i/mwRdctODoaU7hs8K428hG1Tib0Vayy8qJRwc4DqYUBu/oyB3FWd8CV4MveXU4yeEIF0B4/l8TwxZxF1fZv4oEg/94aTdOQ6rBEulu93ioEzpRlywrN72E13gekjbyxes9kHG/lAW98iHV1ukt++6It6Z1j0w6b5uv2ZdcgYftJVSqEnE2YPbT+3IyofGoBpSNckS/vO1bt7MLSsB//nJLTyk=
X-Forefront-Antispam-Report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6452.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(376002)(136003)(346002)(39860400002)(366004)(186009)(1800799009)(451199024)(54906003)(6916009)(66476007)(66556008)(9686003)(316002)(6512007)(66946007)(66899024)(8676002)(8936002)(4326008)(1076003)(33716001)(41300700001)(966005)(478600001)(6666004)(38100700002)(53546011)(6506007)(6486002)(83380400001)(2906002)(7416002)(86362001)(44832011)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:  =?us-ascii?Q?wqS+VRN0lRKpPoE+BxhPLFY57wWIeUpkSA96UMSAhDthBy5Oae6Lqbg2qMLw?=
 =?us-ascii?Q?vDKDR49/cAw92cXQyuTbLSkslrL/ZfE2LFHycvbdaNXDeMoiPhiAjvu1YLDd?=
 =?us-ascii?Q?sc4xQzPgtFS6kF9/ZszuMoiYZcHJ5EkKgIig7/V50WeH2NrUK2JyqmaWZbMJ?=
 =?us-ascii?Q?JjiKu6Q62wR+jh0jedow00bPlFztlxj5118x6x8f9zqrFf30h+mhhnLVgjWT?=
 =?us-ascii?Q?JDZdQtSQL+mH97FTRoix0icxOJze+9/odcsu6srT1Kfw+Zkxlt1P6JC8UJPe?=
 =?us-ascii?Q?JyhqJW6XtQq/kXaqyQT+TQ067U7rdcrTOogl2xJGrhpbhzHPUtJklcpqJpHU?=
 =?us-ascii?Q?gTwol2UY7VKt2Y6hLh3+hVIkDaJ4ewmo7hHg1NA3U3iznmbgoUJG31HIb0Xx?=
 =?us-ascii?Q?YM+CPdwRQ4kmwVT6ODDHq7vNLEnip2gqKW0JtPKJZBN4NJNyGK9BsDW+XUAT?=
 =?us-ascii?Q?lxspgle91OLkJ8SSkKk6gE9bhLfR9EM/joUFCd5oD+0YQbdgCebhVBIWKe01?=
 =?us-ascii?Q?0jdUobgxwmZbPwvUSfeLwxpBkD7CRXo+1AulqJeTNKZuEPqiiHIt4b8JFwdU?=
 =?us-ascii?Q?6A7KVXdn+G+yLLrXB7gvFTec+Rtns4KO2YH4VjjTCLRY+hT20enxUDSDx4Ou?=
 =?us-ascii?Q?qkKBlimIDJQH2GzQIUvG1rrQsZdn5HuGsHyNuCkMk1GfohPo0vRLwQD8+dYA?=
 =?us-ascii?Q?7+gd/wjFG+vkv/1eWUHLVdXxL9F+X79RDD9mgJcojHXngVvhiC1LRHh7mlqb?=
 =?us-ascii?Q?55lrNAB+fDX5xWB47vbypbpakcRUpW4xTZf2moDcbIXCmrHjUTch4FvuVn1n?=
 =?us-ascii?Q?w2ciT31pFhFJH/x+5oOImNxPHB48eD30EOZKOxbztEhH5ticU3S2i4wZkOnQ?=
 =?us-ascii?Q?eaE0qo7FRJEJ4dp7tVZ/00Gw+VcxAFIIiVu4w7GnBRoNsWYbB7Buk1xCt7ke?=
 =?us-ascii?Q?tdQMLKncgKlh3dH9oDtadh8gVXscbultZWYL7pMGS/iR9Jwn2L+LJlIfHU6p?=
 =?us-ascii?Q?CuwplvNP0cD6USDRFPN20dtJewuaPraU43D/rezZhYTwZd5D20P/M/whUzXg?=
 =?us-ascii?Q?EBZj+0cl2HV2a0RAuyqeKf6yjjMmkzIvZPOBAa5bw/pFbhEL7885yXHMFiMC?=
 =?us-ascii?Q?ENmaAEWvgc+Pbr/r4nNvcHWkHsu9G7/k72oRTichp+iDrPJmL3hqoNuvlnH/?=
 =?us-ascii?Q?z57kQRWhAhd55kLoeUin0nCp6ZsVSUdYoXp1+iXfPz3R0h+OGywCII4JPnql?=
 =?us-ascii?Q?Cc/7CcISzTE0YJZJ4FHYBRlHr3NP4EqYr83CCKYKRQSqy7DRuX+dsLTkasbG?=
 =?us-ascii?Q?sAr88pGvCM7fmhhYKyrc/NuAU43Uq2LbPiNb04RxG7Iddj9hoXMWKVY0Oy0C?=
 =?us-ascii?Q?5QizKw3gBuodwgjfNvhINmB4JURg7aaZGhvtH7S/XaBA2fKtSwt/2EpN1zVC?=
 =?us-ascii?Q?gScphzmNPA5HqrFClvA4Xp58x1+ejW+cOubd+DkVh85prfwHky06GOV8OC6t?=
 =?us-ascii?Q?EVd5Ma3kMXfrxEhsOfpConkpzdT7czL7OFxcxGUxrNiTwJ6dXJff6I17m4ty?=
 =?us-ascii?Q?xrKZ+k4JUeZdG41K+FvUj52vSF6uCDiiTwRzVau7CeE9rAOUTJnXueaiwSex?=
 =?us-ascii?Q?2g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d1bafe0-f523-4a6e-b300-08dba298c2a1
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6452.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 22:48:39.0063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tjqWj1TeWUylLP03gTz7TmsnO+/s9+FLT1mYwGyScspy7D223t7RwfG8kEOh0Ka2t5sMnTquFs5LoXIUTX9Epw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9357
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

On Mon, Aug 21, 2023 at 05:06:46PM -0400, Sean Anderson wrote:
> On 8/21/23 15:58, Vladimir Oltean wrote:
> > On Mon, Aug 21, 2023 at 02:46:53PM -0400, Sean Anderson wrote:
> >> After further review, it seems the reason 28g can get away without this
> >> is because there's a one-to-one mapping between protocol controllers and
> >> lanes. Unfortunately, that regularity is not present for 10g.
> >> 
> >> --Sean
> > 
> > There are some things I saw in your phy-fsl-lynx-10g.c driver and device
> > tree bindings that I don't understand (the concept of lane groups)
> 
> Each lane group corresponds to a phy device (struct phy). For protocols
> like PCIe or XAUI which can use multiple lanes, this lets the driver
> coordinate configuring all lanes at once in the correct order.

For PCIe I admit that I don't know. I don't even know if there's any
valid (current or future) use case for having the PCIe controller have a
phandle to the SerDes. Everything else below in my reply assumes Ethernet.

> > and
> > I'm not sure if they're related with what you're saying here, so if you
> > could elaborate a bit more (ideally with an example) on the one-to-one
> > mapping and the specific problems it causes, it would be great.
> 
> For e.g. the LS2088A, SerDes1 lanes H-A use SG1-8 and XFI1-8. SerDes2
> lanes A-H use SG9-16 and XFI9-16. Each lane has its own controller, and
> the mapping is 1-to-1. In the PCCRs, each controller uses the same
> value, and is mapped in a regular way. So you can go directly from the
> lane number to the right value to mask in the PCCR, with a very simple
> translation scheme.
> 
> For e.g. the LS1046A, SerDes1 lane D uses XFI.9 (aka XFIA) and lane C
> uses XFI.10 (aka XFIB). This is the opposite of how SerDes1 lanes A-D
> use SGMII.9, .10, .5, and .6 (aka SGMIIA-D).
> 
> For e.g. the T4240, SerDes1 lanes A-H use sg1.5, .6, .10, .9, .1, .2,
> .3, .4 (aka SGMII E, F, H, G, A, B, C, D).
> 
> For e.g. the B4860, SerDes lanes A uses sgmii1 or sgmii5 and B uses
> sgmii2 or sgmii6. The MAC selected is determined based on the value
> programmed into PCCR2.

It's so exceedingly unlikely that B4860 will gain support for anything
new, that it's not even worth talking about it, or even considering it
in the design of a new driver. Just forget about it.

Let's concentrate on the Layerscapes, and on the T series to the extent
that we're not going out of our way to support them with a fairly simple
design.

In the Lynx 10G block guide that I have, PCCR2 is a register that does
something completely different from Ethernet. I'm not sure if B4860 has
a Lynx 10G block and not something else.

> While I appreciate that your hardware engineers did a better job for
> 28g, many 10g serdes arbitrarily map lanes to protocol controllers.
> I think the mapping is too irregular to tame, and it is better to say
> "if you want this configuration, program this value".

Ok, but that's a lateral argument (or I'm not understanding the connection).

Some maintainers (Mark Brown for sure, from my personal experience) prefer
that expert-level knowledge of hardware should be hardcoded into the kernel
driver based on known stuff such as the SoC-specific compatible string.
I certainly share the same view.

With your case, I think that argument is even more pertinent, because
IIUC, the lane group protocols won't be put in the SoC .dtsi (so as to
be written only once), but in the board device trees (since the
available protocols invariably depend upon the board provisioning).
So, non-expert board device tree writers will have to know what's with
the PCCR stuff. Pretty brain-intensive.

> > I may be off with my understanding of the regularity you are talking about,
> > but the LX2160 (and Lynx 28G block) also has multi-lane protocols like 40G,
> > 100G, assuming that's what you are talking about. I haven't started yet
> > working on those for the mtip_backplane driver, but I'm not currently
> > seeing a problem with the architecture where a phy_device represents a
> > single lane that's part of a multi-lane port, and not an entire group.
> 
> Resetting one lane in a group will reset the rest, which could confuse
> the driver. Additionally, treating the lanes as one phy lets us set the
> reset direction and first lane bits correctly.

Yeah, in theory that is probably correct, but in practice can't we hide
our head in the sand and say that the "phys" phandles have to have the
lanes in the same order as LNmGCR0[1STLANE] expects them (which is also
the "natural" order as the SoC RM describes it)? With a "for" loop
implementation in the MAC, that would work just fine 100% of the time.
Doing more intricate massaging of the "phys" in the consumer, and you're
just asking for trouble. My 2 cents.

Sure, it's the same kind of ask of a board device tree writer as "hey,
please give me a good PCCR value", but I honestly think that the head
scratching will be much less severe.

> > In my imagination, there are 2 cases:
> > - all 4 lanes are managed by the single dpaa2-mac consumer (which has 4
> >   phandles, and iterates over them with a "for" loop)
> > - each of the 4 lanes is managed by the respective backplane AN/LT core,
> >   and thus, there's one phandle to each lane
> 
> By doing the grouping in the driver, we also simplify the consumer
> implementation. The MAC can always use a single phy, without worrying
> about the actual number of lanes. This matches the hardware, since the
> MAC is going to talk XGMII (or whatever) to the protocol controller
> anyway.

XGMII is the link between the MAC and the PCS, but the "phys" phandle to
the SerDes gives insight to the MAC driver way beyond the PCS layer.
That kinda invalidates the idea that "you don't need to worry about the
actual number of lanes". When you're a MAC driver with an XLAUI link and
you need insight into the PMA/PMD layer, you'd better not be surprised
about the fact that there are 4 lanes, at the very least?

> I think it will be a lot easier to add multi-lane support with this
> method because it gives the driver more information about what's going
> on. The driver can control the whole configuration/reset process and the
> timing.

Also, I'm thinking that if you support multi-lane (which dpaa2-mac currently
doesn't, even in LSDK), you can't avoid multiple "phys" phandles in dpaa2-mac,
and a "for" loop, eventually, anyway. That's because if your lanes have protocol
retimers on them, those are going to be modeled as generic PHYs too. And those
will not be bundled in these "groups", because they might be one chip per lane.

The retimer thing isn't theoretical, but, due to reasons independent of NXP,
we lack the ability to provide an upstream user of the "lane retimer as
generic PHY" functionality in dpaa2-mac. So it stays downstream for now.
https://github.com/nxp-qoriq/linux/commit/627c5f626a13657f46f68b90882f329310e0e22f

So, if you're thinking of easing the work of the consumer side, I'm not
sure that the gains will be that high.

Otherwise, I will repeat the idea that lynx-10g and lynx-28g should be
treated in unison, because some drivers (dpaa2-mac, mtip_backplane) will
have to interface with both, and I don't really believe that major deviations
in software architecture between the 2 SerDes drivers are justifiable in
any way (multi-protocol handled differently, for example).
