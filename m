Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BB477927E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Aug 2023 17:09:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=exgV0vds;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RMnJm2Gjqz3cSQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Aug 2023 01:09:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=exgV0vds;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7eaf::607; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on20607.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaf::607])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RMnHr4t2jz2yVN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Aug 2023 01:08:54 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j1GlsYQe+BQNlR5hjFovYtIvkpnhgDZH2g5zUYE1BEpLTu3qKUgKsNHNJH28yMYPI0GmN6drl9wfnXVqVMCPCjgrXi50LOlc6IbrcHjM79c7oq7SCfexL2UtYHbqxAnO+pBgLDrt/lyZZldoNOb3dtq0gTj3RSTdefy8tNQYVl6jbYtcr3fiqKQydwZgd9Bp7mzfmGROvcGtGfGkjT6JEaSWB6Y4PxYa559pm2DcJMeq4ERsfP/HCu9EoZ9VnAZBkF9+H2GwsjEPSR2E2Ap+RZPXsdQ7+vpFV9EShAgZHgVWmfilYYet6ZtO/HbcWSaBM2H9YZ9KH68D2SGiHNtI9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wdw11V7+ukn5xb0vqDPbVlMWFT2k6U4Os7pG0f4KL6Y=;
 b=VOMOaGp86NsCjvHaV8ig9dpputv2KuCcdQMBOT15wKcJ97ZsCznz9kpcVnID+4F4fm6PjaKLwNq8qYPbA/w57JTGM5HilaxXqZheiUhZ5vpgJWCHKax+Ud0ieQHz6LKi+1FLu9jgruUiza3mSTqI4fFdn0zkkEM6oGuNaXhta0mIbGSapVRYzx+o0Tu1qqGchpEYimejCpFSiOITuI3QBUf4W0uriGajYwMiSF0Z6vI6K288/ZouXvhF93/xWJqkxR/o7GYLIwN0JrmJamqQ7f8hQUxMZNRI14BjDwWq4BS1hu5/XmcOMSNHsuIjE9OQsLcEP07Q1QE93OgL2MHbDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdw11V7+ukn5xb0vqDPbVlMWFT2k6U4Os7pG0f4KL6Y=;
 b=exgV0vdsvoTQmqGO8yA4tyYAhrEgGk6yVS6jipwgsEEGUm/wh8v0d/yEX935nJVwsERpSg0CC8R/GrtYNYN3VnWV3pSfVKFd7ShKLnSTJBjCmjPj/xG1crQU/LT2J9dqrDtQNmm+pr52PP+hk5iMtXAbI5rFTEJw2jXDdFkjKig=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com (2603:10a6:208:16d::21)
 by PR3PR04MB7307.eurprd04.prod.outlook.com (2603:10a6:102:84::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.20; Fri, 11 Aug
 2023 15:08:31 +0000
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::d4ed:20a0:8c0a:d9cf]) by AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::d4ed:20a0:8c0a:d9cf%7]) with mapi id 15.20.6678.019; Fri, 11 Aug 2023
 15:08:31 +0000
Date: Fri, 11 Aug 2023 18:08:26 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v14 00/15] phy: Add support for Lynx 10G SerDes
Message-ID: <20230811150826.urp2hzl3tahesrjx@skbuf>
References: <20230429172422.vc35tnwkekfieoru@skbuf>
 <c81d23b6-ed22-0b37-d71b-ddce9d5d58eb@seco.com>
 <c2f928d2-25f6-0e31-9ab3-9d585968df1b@seco.com>
 <20230522150010.q5zndfwcuvrb6pg2@skbuf>
 <22a28a6f-2c84-a6b1-bb57-a269af34c993@seco.com>
 <20230610222123.mzmfjx7zfw4nh2lo@skbuf>
 <c702e2b6-cb0f-4ac9-86fe-a220284d45aa@seco.com>
 <20230612163353.dwouatvqbuo6h4ea@skbuf>
 <1dd01fe2-08a8-ec2f-1184-a58b2f55ba85@seco.com>
 <20230613142754.wr5njtjo4tbloqwu@skbuf>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613142754.wr5njtjo4tbloqwu@skbuf>
X-ClientProxiedBy: AM9P250CA0026.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::31) To AM0PR04MB6452.eurprd04.prod.outlook.com
 (2603:10a6:208:16d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6452:EE_|PR3PR04MB7307:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a5e9824-54b7-4660-efd7-08db9a7cd2dd
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:  kWCYsvn7NyIMh9t154Af8sWdP+IOj/20zYtbX6C+xQ5r5ddwlClJIgDk+SydZZJB+WwuIM4dXId6nFG/Pf8Ww/rbO3P9a2EFwrck7NocjGsAzToW26cMj2eh/SosAXcRMdL6XPHTkvajGEmN+oa1P/MRbBDh5P8Yi8N2wnSOgQDeITMYRb9k2ZsIFh85Zts1aHVARfa8QC2AgTFKTrMoflscn4anRkBjppgwEkWTQtO5mi3HkSXA3KpBpM9sXuOjMArlfCPQA2e8LhSnAz+xAZIGEW4BjGrPkPdMmrNw6Gs++N+b+XNR1DiMEVHhaDcKcwXS6tslB5RkztP+XlPxBkohny0up6ucw0EzkvPdLw2Sp5oAhyG6EOjHvL9EmeHaonchqipHNzpeSqZyGI5yz3z74s2x/9nN97bh7/W0RR1oVFBt5UOVApawo6O6+HBTwpLLHy9O9tqtVFiyw1oQ+EZL0j1XvqozmSZ2Tn6zGH44FkZNPI3AS50KlYAQ4oTTu9mqxJ5J6GU/GhdhxCogi3uRVU94uwZfFyTcn9+UWvB3auGwefK5NSUhd5mWKAnU
X-Forefront-Antispam-Report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6452.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(376002)(396003)(136003)(39860400002)(366004)(346002)(451199021)(1800799006)(186006)(9686003)(6512007)(478600001)(6666004)(6486002)(54906003)(1076003)(6506007)(26005)(83380400001)(7416002)(33716001)(44832011)(66476007)(5660300002)(66946007)(66556008)(4326008)(6916009)(2906002)(8936002)(8676002)(316002)(41300700001)(86362001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:  =?us-ascii?Q?JJefCEk82fH8JUL1Dhs43S6X20whSNqRrqMfBvKItcSkmUzIs/G4T5igEjok?=
 =?us-ascii?Q?tU7AiKmMY2jmyEGMdU3Gv6r1JeACs2WXlSQG9e9MiUL3xlpWNrAs8glT5AKL?=
 =?us-ascii?Q?L/u6ZtSJxMkN3yfHGGFWN53nVx28ef5S+n2CdntV15xSC6Nb8XBDjD9bIh/k?=
 =?us-ascii?Q?JhdjCYmDLibD4Inri2pXaL8MBQMkObRcdcZm/tvQnAH64fxe87eiH5WEGgm6?=
 =?us-ascii?Q?cTZRBOCWhJ3NftKhgvXMh2TUuQDhyDtnQNzk8Bpfcta24KoD7Jd0aLIqNwod?=
 =?us-ascii?Q?FNFFNMfLAEU5Ig4Edo7q4GcVflNjuKT6WKJzFcYX7GCxUbJc7MgU3kpJwbf5?=
 =?us-ascii?Q?UlIPjoKM3AOOB6zVA3EdCCEa67IP75I9TWEvI8tKpAfL3AHzEHP2eWBzNWt1?=
 =?us-ascii?Q?EqDpjUNfWYZQ4NTZm1Qj/JYnuT0dkYrBwSZQNHTiSgepmfCvh8ZY7MfH5AVz?=
 =?us-ascii?Q?ESWdCHMiDlxgrGFn70sHrtSTvVi4egEogIYPd5eFWwMFPpqcF8AqHf0SU+Li?=
 =?us-ascii?Q?5CLyknNT+Px5lygHVWhJ1lUWnZh5lMQWlrEH4ZuwGNq9doE0X63SzuClKseZ?=
 =?us-ascii?Q?cfbpB2AkcgEDBZAuWvyhc+t/I0VlO9l1kNdFdJGWcuVFG7uyxvG8zGv1CHPo?=
 =?us-ascii?Q?adKb2af73mQJKq1Vpa7MYicsMMgBmyZ6a/t5QgvIFHz7XygZKSOrzb6/gLKw?=
 =?us-ascii?Q?iykUsgdSgnS7bcBkV0ZGpOb7eetlWSLsMcvUPSr6pfP6CPs9VqNWpXyhmf3U?=
 =?us-ascii?Q?D+kKxAd16JYp1al5kZW1zq0er4GSR+d5lgCdVEfevkHVBwroq1UGwpDrvj3X?=
 =?us-ascii?Q?HpudwknC1GUb8IcT1uQTEIrQp/OJL0PnRIUp14uK89PVHyjkdjXpqK4Dc9AM?=
 =?us-ascii?Q?XEmwpWoljzLeSqzZ/SqvNuiK/S9KH8Jy2w2xLGWpiF0mhjAIbxNTIQXj1h2i?=
 =?us-ascii?Q?iYd38AqlAnrpLfwqlDS2cAuGUrmapNQ1MBzVTvxfDriA2kreAIlb3Y4kJsII?=
 =?us-ascii?Q?9kNnVUX9QmIijWAueBCct+hTqDyloev+b4iUy+bJukWeUgaRkmRTw3M4Lf56?=
 =?us-ascii?Q?hHWzVx2eWxsVr375hPfWfmhUxm3o10h1TConZeyzW2J21io0dAN1Vmf223N9?=
 =?us-ascii?Q?dijKvt5doYmK5haUDv+FvxPdQ3jf6+XhFeS/vwEpbAPxfzG1cUmCrTw15j5f?=
 =?us-ascii?Q?uGkJf7fy7hhNUqQ2Vx1TMpydXVLKjnF7SRGjgrp5kRCdErU63/bKX0td/stA?=
 =?us-ascii?Q?p06d4IbPWpfT79M9xcuRzAVc1Mq3aNYqj0c5CtFDSXXEAxeN1/ZrY3a7KB9C?=
 =?us-ascii?Q?8AbeH0tPeTFDp11LjHTgoEhPqsxyERrYuIwz6xsD/8XQLmDPvw5brTpIMy0s?=
 =?us-ascii?Q?gqfRlgZ/2sT03Hwi0mXsUoprJbDZqXXNDS0bn/b6mmR7FMQTsu93l5bRUaiP?=
 =?us-ascii?Q?K9l3A3aI186KdGo7CxTimN9tefHHrVYlw91pp+ATEfD3Uj5HpeK/RqL81YrA?=
 =?us-ascii?Q?LZF7xnkAL9SY1L9GcvJoCASMcu6NdvMNfjVlolLbMu0gxaBOyzEfGPZWc/Qq?=
 =?us-ascii?Q?bfrSU8mCo0/1wgLzyYHbtX3vZ72QtWMX0jNp5MiyczaPd5sXu2nMb8itaLER?=
 =?us-ascii?Q?wg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a5e9824-54b7-4660-efd7-08db9a7cd2dd
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6452.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 15:08:31.0822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: esgMkMeOCbPWyQk8yuCyCRhqwJK4I/wKiPcpiqF9nbXIaBF5zWi9h2Xr57+unDoHbCInjKUoq/V413rz0JNKnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7307
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

On Tue, Jun 13, 2023 at 05:27:54PM +0300, Vladimir Oltean wrote:
> > > At first sight you might appear to have a point related to the fact that
> > > PLL register writes are necessary, and thus this whole shebang is necessary.
> > > But this can all be done using PBI commands, with the added benefit that
> > > U-Boot can also use those SERDES networking ports, and not just Linux.
> > > You can use the RCW+PBL specific to your board to inform the SoC that
> > > your platform's refclk 1 is 156 MHz (something which the reset state
> > > machine seems unable to learn, with protocol 0x3333). You don't have to
> > > put that in the device tree. You don't have to push code to any open
> > > source project to expose your platform specific details. Then, just like
> > > in the case of the Lynx 28G driver on LX2160, the SERDES driver could
> > > just treat the PLL configuration as read-only, which would greatly
> > > simplify things and eliminate the need for a clk driver.
> > > 
> > > Here is an illustrative example (sorry, I don't have a board with the
> > > right refclk on that PLL, to verify all the way):
> > > 
> > > ... snip ...
> > 
> > (which of course complicates the process of building the PBIs...)
> 
> Maybe this is the language barrier, but what are you trying to say here?

I said that I don't understand. Can you please clarify what you were
trying to transmit with this comment?
