Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 719BA7794CC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Aug 2023 18:37:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=FAueCnQ5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RMqGQ1rf3z3cRv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Aug 2023 02:37:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=FAueCnQ5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0d::622; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on0622.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::622])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RMqFX6NcRz2xdt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Aug 2023 02:37:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R7qlf5+CBJolznk5z8jBhU9177kMpCwCrtXRLbmKYR9ryeFNPWu4QIUrNPiSrIx/SUSRm6MgF37Z/NaM5bKlDeRrUg/u4QjWAKjamUcbAVFhyrGnanp7RgjUiTGJmJO9txLeO4vbOISsbEPdtkIJMlNiSL8JLoMB6+cbr7xJJ3ombkJLHQGHR98bq+6EF0f+Y0HgblJhebuznWtBq41s141c3yZcy+GlSZ05QlKsB/JdmFv1YiOF+HuXPjUwLkzoiqsHDu8y7cn8Kn+GjSxBOsUL2rBZl09ZHYwgm6/2SODahMXN3iK6NOKT2zNxPdflfPHUzXfY98Kb12BnX/Hmpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9rlq09SQ2NPUKvLrjk5pHZAY8JPK2Ko2QBD5z/uedc=;
 b=HkUOb+4iGOMzVQb5r9ArxGouBdBz9olumd4mDpWkRCw4sdwpnkYDI/V7j5mgid3H7iiwi3MMXuV8OTNBpcIrYRMTK5j4tJmYlGlRU1eZEm6BhjUCMtBa53Q0LwsKBtGZ3RZyrFWarnvSku8DlCpewdL99nI4lBlreWrOe52Wb8WcPk7hVxz0JGATnjp8kwN2r7YL885FI2ezr1EmUOt8Pcj95Z1VFXlFfHu0NMzxj84Xt1SFSLVywlHFvYXzn/7CRiey/2hUh6+Ux9BePOyCEweKccj+ojcg8ZFnXYZW3ZVM0rT7khiT8JRxRvF4neu5oplZPy7wS/VeMlVHYbdewg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9rlq09SQ2NPUKvLrjk5pHZAY8JPK2Ko2QBD5z/uedc=;
 b=FAueCnQ5+Pb/k1eYoIhy0qn0Gtp0CTbO8NLKFVlpaFhV7GTEw/obtKq/cqbtR5KCSO0MaAB6wtBCqXGmPqh1dNbOOveJplbBGm6oCLxBJZVVwfuDuxFQ2dsjvhS+c4o8LBG7tADERmRD+D9yKb3kcpYcM8myceD5Eck+Q+dnHOA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com (2603:10a6:208:16d::21)
 by VE1PR04MB7472.eurprd04.prod.outlook.com (2603:10a6:800:1b2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Fri, 11 Aug
 2023 16:36:41 +0000
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::d4ed:20a0:8c0a:d9cf]) by AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::d4ed:20a0:8c0a:d9cf%7]) with mapi id 15.20.6678.019; Fri, 11 Aug 2023
 16:36:41 +0000
Date: Fri, 11 Aug 2023 19:36:37 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v14 00/15] phy: Add support for Lynx 10G SerDes
Message-ID: <20230811163637.bs7a46juasjgnmf4@skbuf>
References: <c2f928d2-25f6-0e31-9ab3-9d585968df1b@seco.com>
 <20230522150010.q5zndfwcuvrb6pg2@skbuf>
 <22a28a6f-2c84-a6b1-bb57-a269af34c993@seco.com>
 <20230610222123.mzmfjx7zfw4nh2lo@skbuf>
 <c702e2b6-cb0f-4ac9-86fe-a220284d45aa@seco.com>
 <20230612163353.dwouatvqbuo6h4ea@skbuf>
 <1dd01fe2-08a8-ec2f-1184-a58b2f55ba85@seco.com>
 <20230613142754.wr5njtjo4tbloqwu@skbuf>
 <20230811150826.urp2hzl3tahesrjx@skbuf>
 <26623d0c-8a5a-614b-7df7-69214aaec524@seco.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26623d0c-8a5a-614b-7df7-69214aaec524@seco.com>
X-ClientProxiedBy: AS4P189CA0010.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d7::14) To AM0PR04MB6452.eurprd04.prod.outlook.com
 (2603:10a6:208:16d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6452:EE_|VE1PR04MB7472:EE_
X-MS-Office365-Filtering-Correlation-Id: c1664b26-e7aa-4ca2-1cf6-08db9a89245e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:  vCRq3sXcSCpEBjWdt724pVi7gOm6oLzSVeOYYxxqNCYLLYBhwuaqrRBZ1VOh3Ah8BcDbQykVffFt9AKM267vbr2C46Z5nTjGMugMhxxnIQVg8tj74ZxQARg1BFjtnbE7FQvseO4TcHoC2IolBilnQEYzxIvyFvXmLMBm8Mqlo7cWUveD+rwf+rlwfO0D3SKtQ8Vck5sTMnTFCq/GngsC6OOokmq3iRJvUBKFc801xkXFvFVE4/BFgAEj3ylnpByeyi9wY9v+6zN94n4CbNJ5m/Qhsi5nBI1oFuxk07M1Q9a8c2EMMHXeqx+8PmRtP8u+ZAOfi2eL3uLByyU2VotF5IQ6yzreSkfrrw97gHyBwYO8gzgCdeQM7GVCEYiOYWDAEcp9vh2th5o7qQ9UUTapn13dg5hAH7V15c5yYGPKOSfppvmCEE7MN08DYFURigd6kk9x0+ZSxg+iNiePziquc54txIXxjPHZMvi8Do0GymA7JCd+UIU28Me0VbZjPxx4+WdXQk/L3eMgfBJh2ey78896X4HNWeBUxXmpsubArLqlTxU4Ixs2ee0CqewvLjmj
X-Forefront-Antispam-Report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6452.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(136003)(396003)(376002)(366004)(39860400002)(346002)(186006)(1800799006)(451199021)(54906003)(66556008)(6916009)(478600001)(6666004)(6506007)(66946007)(26005)(66476007)(1076003)(6512007)(6486002)(9686003)(4326008)(2906002)(33716001)(44832011)(41300700001)(316002)(7416002)(8936002)(38100700002)(8676002)(5660300002)(86362001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:  =?us-ascii?Q?pNfspORCemIgbS58CaHpdVHUfKsfbCvUkz4qFO1DrvFe7dUpte/GSTFu6fHz?=
 =?us-ascii?Q?5/UZ1HeZMfFIQO8cBXcKe6lGO9LMqIkSytNOQTsnoald8lv+bAe+Dbh/OlX7?=
 =?us-ascii?Q?WN0EbX2KtnMoT6iMQbggPbpzw/p8q/+Npq/hSiKpDJ2EvNLMJ2h/BF0Ierc2?=
 =?us-ascii?Q?ayL5IFD8WzDrlGgNQMIwqSUHRO2FZk29COpRbYJULoOrslmNz0shaNsIuJem?=
 =?us-ascii?Q?hmpdGFqLKWLVgHWYSIFv+NTScYo5emV69BZDs0mjq5R7g4QCLuqYwddabVpi?=
 =?us-ascii?Q?pwu8kULyTwWhlFLdwZ1LO8OUz5CsYm9rOr+JjdCqUgI09quJl+c7g7zcXMio?=
 =?us-ascii?Q?dGJBYKpd+3Ny7BVSs3nx99sBF9ZZSK+pC7ri+Q8pbm87hg4VMkXq4VeIx4Sa?=
 =?us-ascii?Q?0xOT99L8/7DENezYJvAIrBAeWC5zdSdFCk1SS6BVX7Y2EaHnIjVtgbbfewPL?=
 =?us-ascii?Q?p5glNrilroEJb950Usj0B3NwgRiK5NX040X1qbSDZzVtNlDQwCt3c2z+KHk4?=
 =?us-ascii?Q?clswbfQxQPp7Dimi2/Dk0DxQAsAKo35ktrCb5WXFP+a4hDdcOIx300bAMSKa?=
 =?us-ascii?Q?/l4shv6nHQvupORN8Kx71em8BHYg81i0GqkhjpyLpiNh9nYxcsKaqummUZlB?=
 =?us-ascii?Q?xIpVV+HAcCZ931jAxSoi3XdZKKJKl6nZ88qe6g7rjnIaNactjkFswr2ZTxMp?=
 =?us-ascii?Q?prGpus/w9t+OXinISVxtHX+DBMwyE7ykLPZ7ZotE/Fs+Q4wYvHrprg6g5Nqg?=
 =?us-ascii?Q?OFyM0RZ1dHmbTvlwHJqRaY+ayu4qfLQbhuZEPq8aH0+ktfaTN925mZ+Tx1zl?=
 =?us-ascii?Q?BVQg8MpUCZXmWxB6yX09gFM1Bk1uEObYYMaoNjSq+dOVR/+YqVLzJa+VSr7c?=
 =?us-ascii?Q?kT6fB7nR0oZbNQiX+kaGHr1Jxt7eR72ub2I5xpcw1w3wnIPgGGCo6KeZKHBN?=
 =?us-ascii?Q?5AwbVrQih0OIYMsQVhG8z9FBvLSR0y32aOHub7Vdnwl01xtJKvM1aMOMDVeT?=
 =?us-ascii?Q?T8XOyX/93yS4Cd3ElvkT0ePD7iFBp0Pc1M9/It/2VoWirq45arHdYwmm90MF?=
 =?us-ascii?Q?gthPZk64gDEYcYBlNUdgMVxtGDLt7ee3R7lRad75WRHyhursKQcaPFm7jog+?=
 =?us-ascii?Q?qjWXpAbJY9qmeF4djAy9kEWNE7Lm//zBynaF5pTxexDCBdYLlcs5CVjDLu6w?=
 =?us-ascii?Q?Y1tAp+wWETiKXSQrr7jK2/hLW5mQV4R8YO4yinWCzPv+JyusbV6oylXa6rcH?=
 =?us-ascii?Q?X8D3xbiPflMzcsy4LEggm46T36MfT2lvdncz+yk+kl2HqDDqEH/K1oX/KiHx?=
 =?us-ascii?Q?V5MM0WYT7KXY+vdgoi0JEHvzghi+XJYoQ2pirJUf7jW//3UZvq27WhwAQ6Bd?=
 =?us-ascii?Q?PkP4U6rrS2g6gmZjDtjI1lUb2GW1hei0VmWQhxLPVMk+7dNtuKUIG+33jmhP?=
 =?us-ascii?Q?GHCNPmTPq6reZPDJp0Y1OtydSW19nqB4qm+Y3NULoFTh1bxKiVy6nZVNuYog?=
 =?us-ascii?Q?SI3iKdexdv+Yz1L0R+8FgIFxHm1LGOJQ04Wnrb0GUgc+mJApzCKxQlh39EUW?=
 =?us-ascii?Q?VseEIyWtvb6X8/zFYbq2bTA3BuvUwy9dRckKPHIgomxBuRIraHkQUkyHPIzm?=
 =?us-ascii?Q?eQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1664b26-e7aa-4ca2-1cf6-08db9a89245e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6452.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 16:36:41.6072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cIYLBRg4Xj5TLEj32xvV+29Qh3Aw3Q1JCcakJaX8C1Z2v9QDj3GTnGJ/e4/ewsKPwiP6qWLESxIP1PdCnENWGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7472
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

On Fri, Aug 11, 2023 at 11:43:01AM -0400, Sean Anderson wrote:
> >> > > Here is an illustrative example (sorry, I don't have a board with the
> >> > > right refclk on that PLL, to verify all the way):
> >> > > 
> >> > > ... snip ...
> >> > 
> >> > (which of course complicates the process of building the PBIs...)
> >> 
> >> Maybe this is the language barrier, but what are you trying to say here?
> > 
> > I said that I don't understand. Can you please clarify what you were
> > trying to transmit with this comment?
> 
> Well, right now I produce my RCWs by generating a second RCW with e.g.
> 1133 replaced by 3333. But doing this is a more involved change. Just a
> minor issue, really.

Ok, so a comment related to your private build environment, and not a
counter-argument to the solution. It wasn't clear.

> That said, I don't think this is the best approach moving forward.
> Much like many other platforms, users should be able to plug in an SFP
> module and Linux should configure things appropriately. An RCW
> approach requires some kind of configuration tool to swap out the
> bootloaders, which isn't as good of a user experience.

I am quite familiar with the SFP use case you are talking about. SolidRun
requested that on LX2160 with the Lynx 28G driver, and that works fine
there. What I am proposing is for the exact same approach to be used
with Lynx 10G as well.

Let me explain that approach, because your mention of "swapping out the
bootloaders" makes it appear as if you are not visualising what I am
proposing.

The Lynx SerDes family has 2 PLLs, and more lanes (4 or 8). Each lane
uses one PLL or the other, to derive its protocol frequency. Through the
RCW, you provision the 2 PLL frequencies that may be used by the lanes
at runtime.

The Lynx 28G SerDes driver reads the PLL frequencies in
lynx_28g_pll_read_configuration(), and determines the interface modes
supportable by each PLL (this is used by phylink). But it never changes
those PLL frequencies, since that operation is practically impossible in
the general sense (PLLs are shared by multiple lanes, so changing a PLL
frequency disrupts all lanes that use it).

So, you see, the RCW approach that I am proposing is not the RCW
approach that you are thinking about. I was never suggesting to swap the
bootloader when the user plugs in a different SFP. I am just suggesting
that the RCW is provisioned for 2 different PLL frequencies, and those PLL
frequencies give you 2 networking protocol speed options. Depending on
what each lane needs (the information comes from phylink), you can move
each lane to one PLL or the other, at runtime, in the Linux SerDes driver,
to support the speeds of 1G and 10G, or 10G and 25G. You can't get more
than 2 speeds at the same time with just 2 PLLs, and this is an
intrinsic limitation of the fact that there are just 2 PLLs.

If the RCW and board do not provision the PLL frequencies for more
than 1 lane speed, then no dynamic protocol switching is possible, and
the supported_interfaces of each lane contains a single bit: the
reset-time protocol.
