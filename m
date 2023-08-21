Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5C57831AC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Aug 2023 21:59:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=ru0g7N0Z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RV3Gj0zGsz3c1K
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 05:59:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=ru0g7N0Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe13::603; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on20603.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe13::603])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RV3Fn0nxtz2xVn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 05:58:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CbNz5YEedylV/dAjvzcDf+lesfJfwQyFHifk0Ed6VglTMTqy7i6mjjqsGlKBSYrlwd4Mig5peuFAPBIZ1KlHPlINcVfllpvVSGjU9Qaq0lI6wcPSra7mtwJwNhbCXiZ4TMea4aM4toyCX3C4+lmZ3xP642YZnrXPssv12F870HmcsCYBRrnZXuXwcJybXocw1UcQdxyT1dffeegEAJH6l0PMcVonEEojgkO7IiDZlAV8v9ZWMeRrJDdbXESIeZ+EMYRynZ0cKrn4uuDuSo6yowW5d67Q5ifoe015vHY5IH5nb97ivL/7iqTwNvmot/Fvs1eVRI9yrciSJLvt2yxLeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Uw2dqzeVz3mOz3X5TWJk+1gvqybhGGEkQvrrY8vXHk=;
 b=Q6YbmuzweNKMNqE6GEEGc3D7m7l1Ts5ZmsCRzUB0KMIF5am1/i7f4OXxRLcEbRc3MpiSOqkD8SxJ/6cY49j/vGd2gE4XURsTmY4IaplU27n2u8Apj+C5syrs/FI5TAyIta/sJU93OmEpqokljSkAqfRqNhhGnQv79pVNOD2J232zZp3Ud8A4eLOdZBOv9FI03KzPQezfvXcvJqA+n8866P49c3DpU6JOfVaWmr4qpxl25k7wn5Y16Ml/FwjQHPWGfzlQ/DeQttxE7rUI9R72xHEUSYR7mKQAJe236IVe1pAUA3mLmk6HLZ4ksQ4v+9l4B/c8e0wefV+ZYh0mOPH9sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Uw2dqzeVz3mOz3X5TWJk+1gvqybhGGEkQvrrY8vXHk=;
 b=ru0g7N0ZFuudho4dvhNNZ9B5VmEr6yKkrxxYArDLfQPN0nm2hXQMcAS6iwVW/QENtZZ8xOl+w9kqhZL9knJTT0hHC1QYskqM8YTPTPaMRPoZZL7DavslnxhKov8UFvrMJA2GYuyorVOk6eR1akxLuBbX7tA3aM90pdeGYg5IT8Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com (2603:10a6:208:16d::21)
 by PAXPR04MB8173.eurprd04.prod.outlook.com (2603:10a6:102:1ca::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 19:58:28 +0000
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::d4ed:20a0:8c0a:d9cf]) by AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::d4ed:20a0:8c0a:d9cf%7]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 19:58:28 +0000
Date: Mon, 21 Aug 2023 22:58:23 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v14 00/15] phy: Add support for Lynx 10G SerDes
Message-ID: <20230821195823.ns55h3livxgol7fp@skbuf>
References: <20230612163353.dwouatvqbuo6h4ea@skbuf>
 <1dd01fe2-08a8-ec2f-1184-a58b2f55ba85@seco.com>
 <20230613142754.wr5njtjo4tbloqwu@skbuf>
 <20230811150826.urp2hzl3tahesrjx@skbuf>
 <26623d0c-8a5a-614b-7df7-69214aaec524@seco.com>
 <20230811163637.bs7a46juasjgnmf4@skbuf>
 <20230821124952.mraqqp7pxlo56gkh@skbuf>
 <a2e3fcad-9857-f1b3-8ada-efb2013a4bf5@seco.com>
 <20230821181349.hls6pukp5d6rc5av@LXL00007.wbi.nxp.com>
 <73d59dd2-88f0-3c1a-0de2-de2e050cba5a@seco.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73d59dd2-88f0-3c1a-0de2-de2e050cba5a@seco.com>
X-ClientProxiedBy: AM0PR06CA0108.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::49) To AM0PR04MB6452.eurprd04.prod.outlook.com
 (2603:10a6:208:16d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6452:EE_|PAXPR04MB8173:EE_
X-MS-Office365-Filtering-Correlation-Id: 11a6bbbd-784b-4ed9-98f1-08dba280fc52
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:  y1xxVW3z5kJ7ohSZmxlKkJZt7qj4mTZxmBSaxQZnxISI8z+5IN17b224EA4hH9NmiJBPuFaMR3I2FfkPWNqxU6N+2Z0JKCopw3u3lkI5LLYeogScZJwHoF6iWsqdkgoNfZab+m21h0DCVgfrqkzlwkzSVQHDN1GUIydj34okQ17Ixo+GefeZIfyDJDc/bZ+oWLl8WUsaH1UZ3sTI1huL4fboDKw1Z/SZqoOJ9OQWA00q1B5csOWjfl2RMJiGrmdyHQosu8yi8QjQhlgnHmYJiF4N5i2rjDHSFCINYZ+QeDaZn7TflXicTtvocUWGlpc6sD+fWtHeXK0sP9MPU0d02Dj08sDXGY8yLCDdv6PTsKN0sAUB9U76aFVM/hGoTc2hdmEM1XBdnej/eros+rbkXoQerT2sA0nPydig9/VcUPs66owUSQ3gmk/pFYN8hkXZTguAdhAMgHbSBbHfzIHBq7isgyoxENZRRtIfsVBCs51fEYWq0mL0XcYsHyDH6kNsPWHAJ+Ykvym2y7Rv4HqvbrEB+09xc2j7iwKDY2AC80w=
X-Forefront-Antispam-Report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6452.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(376002)(396003)(136003)(39860400002)(346002)(186009)(1800799009)(451199024)(1076003)(26005)(9686003)(6512007)(66899024)(86362001)(38100700002)(83380400001)(33716001)(41300700001)(316002)(8936002)(8676002)(66946007)(6916009)(66476007)(54906003)(66556008)(2906002)(44832011)(5660300002)(4326008)(7416002)(6666004)(6486002)(6506007)(966005)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:  =?us-ascii?Q?PXXVgPOj0v1x3m2uWPaunKNURW5jaRA+dutMJteJzhFPjkJrUR6cHKQGgvD0?=
 =?us-ascii?Q?f6YLa5qzDAeydEJb6IwV3UinVcDJ6M2FinDWK9PHMzDCy0fSfhdPtJXH1sRd?=
 =?us-ascii?Q?EJjUQO/o5P4yx3skSDrZivpPXrfC1hCIxwARaU9mriAeD1Iu0J4j1Yioda4E?=
 =?us-ascii?Q?G9QpXkzHpDPVKQg2vLFPbotVw2osACQ42xpv0ajWId3T/ibG93+3xSYQ8FTI?=
 =?us-ascii?Q?TwRg6Xudw3agOx7leEe4ISZjrE8jCJpJAzUGAf2S/vHildh4xs+L6kHnZ9R/?=
 =?us-ascii?Q?nw6iSQey24d9QKTbxQK0PEKa7pTgdLWN+F1Np/K9UHc1b2Drv3vVQ2T5IUdv?=
 =?us-ascii?Q?3/mO10PjnuRYWhI4AP/p6wicNq5FUK3xHh+3nb8NX67AUu2hqU1PQeHHPcfG?=
 =?us-ascii?Q?rqAgxgjhGeR0fS1j6e9VtgEEQnoD96lio3A1nvjiEYrxN1xjIuvb6ek4JQtb?=
 =?us-ascii?Q?LeSxQA0fHo7ZToAH46fClcUe9w/4oDZGXpHCl+C1JfWv4i13EvgYtB/L4NO+?=
 =?us-ascii?Q?sQZ7RlFGuwHJr3ZQadgJSzrfapfAnFYtXpGfahOVk6bbRwYVyE3LWXNQHU1P?=
 =?us-ascii?Q?x2QguDcrNN23UIQ+FTJOFGddKcaIUVdFO8dv3CIGowsL9jdOI6qWJP/DKg3V?=
 =?us-ascii?Q?jPi/qvBAENoubges2GyD3FeK20cb6qUHt7IczMnXsuX9KhI6cW93eJTxpkEQ?=
 =?us-ascii?Q?u/J0H1JJZB+/6llaCdRtcF+jPg9z+Qwtw1qeqN0CDbEdHeoICmEq62qjUmpk?=
 =?us-ascii?Q?m5v2W/mYFYyLJp8IWoHVMjQSeH7KdcGL8894ixoSkxG8O8T8Q00pznCSNna7?=
 =?us-ascii?Q?Iuvw+AKTFeMsg0GZG0dBMUnaG0iDsG3u03onIR1/Bq+J9fFIC1XLnUmFAtlw?=
 =?us-ascii?Q?FTzHRbL4ODHxbqxX2hQ5hNkrjNk5RMA1kCgs4Vw96pWBwB0Y7WVPOKX2BB26?=
 =?us-ascii?Q?J7ftV2ca9VL/L4zS/gyuLIB6sZAnKyy5BrD8o77MEsIdA2r/550dPniZB5Se?=
 =?us-ascii?Q?UVomiV/1Dtp9UKDvVn143szZT8mlFoEdOUDIcJxmWOuMRxl5xNjSG7bmarQT?=
 =?us-ascii?Q?1fmEnvXwsHbwnR7xA6+vmTVI7Ha4cEvxwTTZmgCygFZx7Tik8uPHGXRLwSXQ?=
 =?us-ascii?Q?wCxDGQWkfLWU7CD9oSX1kJsQrZdHLj42a844Zq8j1laL/BW9Tqa5xwm1Q/7c?=
 =?us-ascii?Q?EcLq8caD0TxHJf4fqHzfQdGTiZkwxMeYdsVDyQF4dvc7xqMXIAilFbgVlXnM?=
 =?us-ascii?Q?VQhyZ2pNox+/1KVjSJKszTXua7SaXE6C39L4zgWbNfn1x2FiDYcXJTDGkr/Z?=
 =?us-ascii?Q?62+ZyuKfjn0TBHcVzz6mC+cYbScjKvh3h+/ooLxG/ft7NU+q1BXUCYlpomST?=
 =?us-ascii?Q?ygzg/g6/35oKn+ZgiERI+TCbni5mZ21eX09qRLnGCjlZ6pK55i2nIH4LfUK1?=
 =?us-ascii?Q?KwUp8QNIREGf9jUUwwvs/9fClsllCIf++rcM61OQfX3Q2qPEAIsVrMnSuQBm?=
 =?us-ascii?Q?1aC3v5pAj9T0Y8ufC0+ZI5Tw3CfG/wy9LIsVDnBGozBzHdpsr5rY+LL3JQdW?=
 =?us-ascii?Q?zVxqmHLutUxFJzhgVSH6a+sJ9kxXC3FIq+AOz28G/lKbEJUcfnZHlc7Q1yLx?=
 =?us-ascii?Q?3g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11a6bbbd-784b-4ed9-98f1-08dba280fc52
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6452.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 19:58:27.7888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9dbcWDFzHB+CsIrdjgF5uvkQWBEYcGDwncaG2Y7ijQsZ+WvxGjsM/EMYwPgD4dfgtAI8+A3JQ6j9zBCNNPCqcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8173
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

On Mon, Aug 21, 2023 at 02:46:53PM -0400, Sean Anderson wrote:
> After further review, it seems the reason 28g can get away without this
> is because there's a one-to-one mapping between protocol controllers and
> lanes. Unfortunately, that regularity is not present for 10g.
> 
> --Sean

There are some things I saw in your phy-fsl-lynx-10g.c driver and device
tree bindings that I don't understand (the concept of lane groups), and
I'm not sure if they're related with what you're saying here, so if you
could elaborate a bit more (ideally with an example) on the one-to-one
mapping and the specific problems it causes, it would be great.

I may be off with my understanding of the regularity you are talking about,
but the LX2160 (and Lynx 28G block) also has multi-lane protocols like 40G,
100G, assuming that's what you are talking about. I haven't started yet
working on those for the mtip_backplane driver, but I'm not currently
seeing a problem with the architecture where a phy_device represents a
single lane that's part of a multi-lane port, and not an entire group.

In my imagination, there are 2 cases:
- all 4 lanes are managed by the single dpaa2-mac consumer (which has 4
  phandles, and iterates over them with a "for" loop)
- each of the 4 lanes is managed by the respective backplane AN/LT core,
  and thus, there's one phandle to each lane

I sketched some dt-bindings for the second case here, so I guess it must
be the first scenario that's somehow problematic?
https://patchwork.kernel.org/project/netdevbpf/patch/20230817150644.3605105-9-vladimir.oltean@nxp.com/
