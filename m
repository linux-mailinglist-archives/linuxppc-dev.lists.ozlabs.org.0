Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB666EF2CC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 12:53:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5wgt6Rtnz3cNj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 20:52:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=ElfS425D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7e1a::60b; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=ElfS425D;
	dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2060b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5wfx50xFz3cCy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 20:52:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NVyBuSuqtYuJ1+SKLJ6w6KtW0OOKrJEPl0vtqhEUbQPo92/RBtI/XQaFhgotgmKeBZYVtWwoofBTnpZW0TKwCxIgUVS/CShy1KMcPfMOi+Fg0F7t3RnYPqx7EDAHana9GADiI+zrTAnsHKjbH2vGeCuHBfNe04LhHcqzCzB4Z0uMw1LR1aut+LAbEAfSUzE0NnkbJ2znlVBrgPDU3CrgTjU98YCYbUWbrkxtt6n9bkBVSkkIpo+9uIMXn/IRCAbx3EGWoTKFlQ6GSwpSLQyPtyFK9eZVNMEkcLdsedz2nnpyiKf+ceHZTYPZnxGcVYBHiKfuBYyyyp6w5S5oCcnI1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZjGRh8inPp5EFI0g9PM/FLHT9+sxPrIk3ppjfCNHIw=;
 b=Hr7W+Wprj2qQ4JK9zU7NXPZA0A6YuwrAFdVzXdRaRymgKk2Yq9c2lhy+NerO+1If32YcXYJ0tIW7R75Ji0u/pG8zV3ZhnxMi8mYhljvvz1VWR4Cz39piBc6FNHtV4NiC4B4jPi7h1T2Gb8wcSfcf0Lko6rX2GsXAKJeYACA6YgrUzyPczBEWpzo4jBRWC4I2x1O2slF/EM2uLp/eBlxcXYUeJYhHDO25d2/+jItaPfv2Ce4RGC5uSq3bagDDJ2vXr/fchAX1VC/7SijB6xJ35YT2esoWMSej+pxA8izqtOcLyHjacWleAEHeeRjOZgpzO68wFu/4LsnU5w1cYXYCEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZjGRh8inPp5EFI0g9PM/FLHT9+sxPrIk3ppjfCNHIw=;
 b=ElfS425DorZV/j/Cj0UJynIRwM+bqt2Xs/xijptPH9P2IcB+txjlYXmqP+5mdQ8a8zTnqvc7678Y1lTalHnUoUJlEm3aLE4ekKXfNdZ+z4cgw8rJCKvIRycrlL4GFcS2hPgehKQ0LjE4m1jiR30BdxPY0wV7RPqPL9sku9nKrrM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com (2603:10a6:208:16d::21)
 by DU2PR04MB8870.eurprd04.prod.outlook.com (2603:10a6:10:2e1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 10:51:45 +0000
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::245a:9272:b30a:a21c]) by AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::245a:9272:b30a:a21c%3]) with mapi id 15.20.6340.021; Wed, 26 Apr 2023
 10:51:45 +0000
Date: Wed, 26 Apr 2023 13:51:40 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v14 00/15] phy: Add support for Lynx 10G SerDes
Message-ID: <20230426105140.t4yqv6irtjcwptm5@skbuf>
References: <20230425195002.fls5cmwolyrslpad@skbuf>
 <b7779674-c3ac-e0ab-3ca8-db1ec5953a97@seco.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7779674-c3ac-e0ab-3ca8-db1ec5953a97@seco.com>
X-ClientProxiedBy: FR3P281CA0186.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::13) To AM0PR04MB6452.eurprd04.prod.outlook.com
 (2603:10a6:208:16d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6452:EE_|DU2PR04MB8870:EE_
X-MS-Office365-Filtering-Correlation-Id: b1af915b-226d-4c46-ca90-08db46443a1e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:  Ni/GpH9Rawu6XWT+SkBBkpBSKRvRVzCf3CEEfXT1H/XXQY9jkV4I7US0KFkNt50Bqwx8o/EXV2TJRPUt9Isj9+YsrrVmsQeG59lWeDWk7c2Qa8PQ1nfEQOT6dEJMUgIIOp6eNsQVuXVOd03uCaqDSL8vsYNUDP2hpsDjSzB0kB8z4r5XY4Raovm2q9RiuynFusTddxZd8x6lz/W+p/wohwIlceHJH6jmMZsJ1ZuxTsm7i5SVTfkMVbMh2LLHcc74+DwH1ucOQB2YH6bT8mA597N8WgrUbbnPjFf5ujOrUXBogtIAGJ3v8QypOxmRCrJuDiM3fXl6aCILnYjqnkZG6Ry5qoE9w9oqgDzr1PiH0PHAXDuS9gcXPkldAFfJ9liq7UAStXNqazgIFqAIfkY4uOv6FF3t6mFVlfGQbPt7KjaD+V7zU3mTiSbrr1dWE3q0qPXQb4QkuOIGe9govAc7cjD1mK6Sh26udpiraaZQCUP0TpIIVKZ8zQQRflV3T3emM4EdCq1XXf6gQxy7GHRsjP+SwMVeFKn990/LVtdjdFY=
X-Forefront-Antispam-Report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6452.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(136003)(366004)(396003)(346002)(39860400002)(376002)(451199021)(54906003)(83380400001)(478600001)(6486002)(26005)(9686003)(6506007)(6512007)(1076003)(966005)(6666004)(316002)(6916009)(41300700001)(4326008)(186003)(66476007)(66556008)(66946007)(5660300002)(7416002)(44832011)(2906002)(38100700002)(8676002)(8936002)(33716001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:  =?us-ascii?Q?C3TcgZS1oxKSnB0C/yBIbtEJisb7XgZjMWBSBRBhSfXlNJSScQ/yRVuDtka4?=
 =?us-ascii?Q?OvT2KQsBZlUa8+p/kBVa7YSm5++sHaC3nmSsP1VWpmzK+PhougQGS7DCOoRM?=
 =?us-ascii?Q?XW+uYkf8VyoH8x+QGahDViIdd00mwF+vYw5TlAeR4NrLIY2u+k5qEOP5dehz?=
 =?us-ascii?Q?yZRSwiZ56C2XTi6XeZbzigHF6gCweKVzdRMHJYm3BG+BYMy4BdQ0vxi5G2RQ?=
 =?us-ascii?Q?l4hjS3yYGgHvx22juw+dDUniKwxNbilela1+MDtnG0M7tFa4fDUuUiKELFrp?=
 =?us-ascii?Q?c2JXfSa9OjBrz0DbAOVrAoolN9rfnRgmvvQYUTy8IXn5pkXk82gB6YGLc8V5?=
 =?us-ascii?Q?iUEQxMCbL1vjMNyJYS30OvHCETW8JCh67qOU2Ume19K922PVTDszjk7jKvhG?=
 =?us-ascii?Q?4gOtASGxNazefOAIkd1t+RRnH3DviC17xHaC3pHI38hEfoNHGQfqLQriIJuc?=
 =?us-ascii?Q?QHWur7+u8qccluYSJAeG6mc+4gSdV9HUVBI/X1J0IO/etUk4d1aXBfS+69iq?=
 =?us-ascii?Q?igSB1E3xqqYoGbFJig1WC03w21UXiyDqa/BjIqKH3rVJoKdJpjokbixHvipQ?=
 =?us-ascii?Q?KRU1phzhpMoIwymVK4UGNOOHUI74ixJ7N1Mb5UFasWr/diAD7EpmgLyUwyhI?=
 =?us-ascii?Q?/uWQNL1kUhfS0J43W5GLCITgmqVEZ1XuKOuwQn/7PU7//S/4aLKWd+9BdqTU?=
 =?us-ascii?Q?GJjsslemsrefsrtf/TBfO0loVWMKqCPo3nhCIjq1G6RaRoXYpq9kD/DTa6Z+?=
 =?us-ascii?Q?XvI4VnWjiU2DDIIyWNHiQpzW1HYuYsAw8kgZzKVigap3IoMLeF0OQGpmZ0wS?=
 =?us-ascii?Q?hsfDQCNTkJxbncleNr0FSHwd3JK8bHuP396eV4bAjgHvbMBDn40SOAembyBm?=
 =?us-ascii?Q?ZJ5i7LB3phub0ek12JnSn4awoMb9wctMKLeaSiMWjeBdOdh7ak1lunSTv1sT?=
 =?us-ascii?Q?kOP9wiOWTRXkF+ggz6m9nX3qg7HcVTvx4lRIEpPKSZCPSq0mXZqLyJB5/QAm?=
 =?us-ascii?Q?mS6oeJXyn2VCzpjNUZGSJRz3GCLBHCq8dH+K8wzpph2406m5v4VDmuGw9HMt?=
 =?us-ascii?Q?o9ZNTV82hJIRXeKasGVOthpP+9Ul32o+g82OFA7bB9NiRfurczXSYEUvGiIY?=
 =?us-ascii?Q?C7We9iQqOp54OOg+8Dkhq/upT2R7SLfY/3/Y6VqxARtIQvsXo/VH1cja8u9P?=
 =?us-ascii?Q?rFJpA7wxqwmeZ/gSW9VDhU885Rjo+i3chdxAk/eUgzZAAi0JSfPrsoPwPaMp?=
 =?us-ascii?Q?TR7uR5AMJaQB9mYVEmx9X+EL7Q6IiiIWN1c8eKaGteRSNQM+gIqEQW4Psixo?=
 =?us-ascii?Q?V/Ku/9RjLbaArJil7g+ikenGRwzko3DhRLVl2nqFsjtJ+Gw6OyocfuWPJad5?=
 =?us-ascii?Q?FGmfMvp7fL5YeHLD4HIIAi4Vn4+kr21CzvoQ6Z9nRrV/737cdY2U9vmJLxKa?=
 =?us-ascii?Q?XwUMQGPG/2A5Sro4RBbRT03Dho26cLVWQfSszZs8i5IdvQMwHy+cQj8QYbBf?=
 =?us-ascii?Q?DuBlZb7r8l8SMOVLutACtTr4jLxZxfGMK7CBNdc4csMcuSccYILHvJvUUZRN?=
 =?us-ascii?Q?L5TWX8brvNbuQD3pVK6UzKQUTuab59GMSPNkdxCltLiTFyj62VTYTxLfq64N?=
 =?us-ascii?Q?Wg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1af915b-226d-4c46-ca90-08db46443a1e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6452.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 10:51:45.1960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eIe2lzPc/ieA6HFcFWKuw/SpOrC+nDnToRuHL6TaRHl1kvojxh3Y0PQ5LNmWCM6M6hOMMKjSa+t+dIQCyx+SQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8870
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

On Tue, Apr 25, 2023 at 04:22:32PM -0400, Sean Anderson wrote:
> The features which do not work (major protocol changes) are disabled :)
> 
> If it would cause this series to be immediately merged, I would remove
> KX/KR and 2.5G which are the only untested link modes.
> 
> That said, PCS support is necessary for these modes, so it is not even
> possible to select them.
> 
> > If you do not have the time to fix up the loose ends
> > for this patch submission now
> 
> I have time to fix up any loose ends preventing this series from being
> applied. However, I am not very sympathetic to larger requests, since
> there has been extensive time to supply feedback already.
> 
> > , you won't have the time to debug
> > regressions on boards you might not even have access to, which worked
> > fine previously due to the static RCW/PBL configuration.
> 
> I have gotten no substantive feedback on this driver. I have been
> working on this series since June last year, and no one has commented on
> the core algotithms thus far. My capacity for making large changes has
> decreased because the project funding the development has ended. I
> appreciate that you are taking interest now, but frankly I think it is
> rather past time...
> 
> > I have downloaded your patches, and although I have objections to some
> > of them already, I will be in the process of evaluating, testing,
> > changing them, for the coming weeks, perhaps even more. Please consider
> > this a NACK for the current patch set due to the SERDES related material,
> > although the unrelated patches (like "dt-bindings: Convert gpio-mmio to
> > yaml") can and should have been submitted separately, so they can be
> > analyzed by their respective maintainers based on their own merit and
> > not as part of an overall problematic set.
> 
> This patchset has been ready to merge for several revisions now. I do
> not consider it problematic. However, I do consider the (nonexistant)
> review process for this subsystem extremely problematic.

To be very clear, the "larger request" which you are unsympathetic to is
to wait. I didn't ask you to change anything.

I need to catch up with 14 rounds of patches from you and with the
discussions that took place on each version, and understand how you
responded to feedback like "don't remove PHY interrupts without finding
out why they don't work" and "doesn't changing PLL frequencies on the
fly affect other lanes that use those PLLs, like PCIe?". The cognitive
dissonance between this and you saying that the review process for this
subsystem is absent is mind boggling. You are sufficiently averse to
feedback that's not the feedback you want to hear, that it's hard to
find a common ground.

It's naive to expect that the silicon vendor will respond positively to
a change of such magnitude as this one, which was written using the
"works for me" work ethics, but which the silicon vendor will have to
work with, afterwards. The only reason I sent my previous email was to
announce you in advance that I have managed to carve out a sufficient
amount of time to explore the topic in detail, and to stop you from
pushing this forward in this state. I thought you would understand the
concept of engineers being unable to easily reserve large chunks of time
for a given project, after all, you brought this argument with your own
company...

Even if the SERDES and PLL drivers "work for you" in the current form,
I doubt the usefulness of a PLL driver if you have to disconnect the
SoC's reset request signal on the board to not be stuck in a reboot loop.
https://lore.kernel.org/linux-arm-kernel/d3163201-2012-6cf9-c798-916bab9c7f72@seco.com/
Even so, I have not said anything definitive, I have just requested time
to take your proposal at face value, and understand whether there is any
other alternative.

I would advise you to consider whether your follow-up emails on this
topic encourage a collaborative atmosphere.

I will come back when I have tested the driver in a reasonable amount of
setups.
