Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42032782989
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Aug 2023 14:51:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=gyzTM8W5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RTsmg17l9z3cCG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Aug 2023 22:51:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=gyzTM8W5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0c::62b; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on062b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0c::62b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RTslM5fByz3bYt
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Aug 2023 22:50:21 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BeCdMNx7FHNLc5Wn/ole7owsspyTeCy3sqlyiQ4GLfhhcV+L5mV/rOm+OtkxveyzSjYDFElzIUtlac/dla2V+3R1q41GIcw1TWRRPswn26DHft/AhSYSAL+cY24fkngD8VSi3/0FijrPS0u2TR6SSFCsjcaKTIQq3qbeXWIBV0zJcsuMemEPPuwwMhuU1lmbYx1rCx1v3PKHLZIvXNrvjCC2Yl+lRvatjpE1o+WNRnhaFN4HdW1GWuisxhJJdvPsZljFX+V7cu1MTFrJVHi2PaVmWjsoZzSjNm8jT1d2SJzaf08cyHuFlIxerOXEfP8XCFXFS08vFvwvn4nek0gB2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zs6s55fVitXrQYIu+Oy3xSV/pAgy+l5kuucvbv3wTx0=;
 b=WSS8MBUfBTl1WhXoXYIVIhGlYRcM3i9Ps33BST8Jovb6uxT94K8Xvsc8sY7qXoeSvi+AxtjwXGRf9kf+BO/RCwtwFVmoHQUcMFS6oaw9zq6bKwJ+GupgokEPFEkds2EVzj3barfXNCHXayu0da0i1D4SxossQhLQJmLC8DXHTyZoRLbPrds94EHbKAT7npih2BUiAPuKZQmgvjSgup/vqah1vnSmh6Ov4vQxmLcivpUaP01rXditKpa1O0xCWjXV5lrxID2bJZR26aY0qEOU6VjvbzhRDjqDpYCMikaP/b8Lt+qnnUrsQkDZ+mhZtN1hP2LEJRS8DIt9+adY2sAP+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zs6s55fVitXrQYIu+Oy3xSV/pAgy+l5kuucvbv3wTx0=;
 b=gyzTM8W5dEW43RU/v/3zKPzoTr8TWE3A5ziL5jzUANSuQlpEQQBauJU3sL719YRQc7eZUXxwxEM2dGihwfbEEGSXNLJvV8HuVVaxbWMb8B3ERQoeS595TTfdGmGokawdzvcp3U8DWvjxq7ycpqHzwAA3LU697lrxkdRNLnlPypw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com (2603:10a6:208:16d::21)
 by DU0PR04MB9672.eurprd04.prod.outlook.com (2603:10a6:10:31d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 12:49:57 +0000
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::d4ed:20a0:8c0a:d9cf]) by AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::d4ed:20a0:8c0a:d9cf%7]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 12:49:57 +0000
Date: Mon, 21 Aug 2023 15:49:52 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v14 00/15] phy: Add support for Lynx 10G SerDes
Message-ID: <20230821124952.mraqqp7pxlo56gkh@skbuf>
References: <20230522150010.q5zndfwcuvrb6pg2@skbuf>
 <22a28a6f-2c84-a6b1-bb57-a269af34c993@seco.com>
 <20230610222123.mzmfjx7zfw4nh2lo@skbuf>
 <c702e2b6-cb0f-4ac9-86fe-a220284d45aa@seco.com>
 <20230612163353.dwouatvqbuo6h4ea@skbuf>
 <1dd01fe2-08a8-ec2f-1184-a58b2f55ba85@seco.com>
 <20230613142754.wr5njtjo4tbloqwu@skbuf>
 <20230811150826.urp2hzl3tahesrjx@skbuf>
 <26623d0c-8a5a-614b-7df7-69214aaec524@seco.com>
 <20230811163637.bs7a46juasjgnmf4@skbuf>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230811163637.bs7a46juasjgnmf4@skbuf>
X-ClientProxiedBy: VI1PR09CA0181.eurprd09.prod.outlook.com
 (2603:10a6:800:120::35) To AM0PR04MB6452.eurprd04.prod.outlook.com
 (2603:10a6:208:16d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6452:EE_|DU0PR04MB9672:EE_
X-MS-Office365-Filtering-Correlation-Id: d96696c9-0319-4667-6165-08dba2451f54
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:  NfGcKxWJpQQG9Jxzs+whd2/MEllUZt4Q1hWO1EO1aVGVzdCQSkcFYI8xkxrEgKEW5cvBVBymToeby2sVVQ1BTBgncz7AZD9gpl51T+KZ7i2R+KtD8LK8PgAgAkSu1qNmLMAhHmTKR6OlYN0tNhAbXAPb3Qs+yPd+X0C/szPOgS5hMoUuGaHw2//e7oyjxS1NMAHZJLCCV3iaDoTj7WUKQ/WpYEvGfxctbBpzoZWIe7uaPDSEST2rAKjAfYeIlhCpeN3bbam2WGXiSlDxCNlcz4DcnZpyHt5O35G4+e6U6oISaar3Hg+V79fF8YjI/oMIOGwvqY2wMlGUVBhUrwoHMETLz8njREN3z3d+ZNf6IMGz59ymtbZlxtoUZgPseNM8+gfIbp5d5vM05spOQjhsEjG1B7WRCdmxUIqxxyf7cBSkMe2KJ6elVAqIpR0rexbQlD90TLrXrutu2OhrsAevtPTHB/JzmlMPNcKWmmWDlJvr7JdFMLo1c1GbKgpyqwlTqPEu7qJS5MbrCQwe2zyFFJ1gWo2+p0uONayDKcv/tRL3eBogRXJXT60ELZXxSv+e
X-Forefront-Antispam-Report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6452.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199024)(186009)(1800799009)(1076003)(6666004)(6512007)(6486002)(9686003)(26005)(6506007)(83380400001)(33716001)(7416002)(8936002)(5660300002)(44832011)(8676002)(4326008)(2906002)(54906003)(478600001)(41300700001)(316002)(66556008)(66476007)(6916009)(66946007)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:  =?us-ascii?Q?zKGNHHPXOuVPgpijVwf0Jwq8gfAYeWmKPsXDUIuwNtRm2D39l0oSG64+Am3d?=
 =?us-ascii?Q?VVadqAAKmhxfG8yHoK5/8JwijafdSBSZRFobsFrrTSHEdC4xfNMBxQY0bxHJ?=
 =?us-ascii?Q?RdmVTTJwdN8gtyrh95LqFab8R7Ybx2FwAIQXBmp79r1YlBQlb7ZWNB2EGPAJ?=
 =?us-ascii?Q?enbWkPN1vVH+yxbYUnFGMnVBSCGQLkswvgOzpKKPiPJNGOCA3lQUYxfBCoJG?=
 =?us-ascii?Q?yOPUkO3h9dICCluy872p62/xeRHmQRObjJoh6L36FCamdnS0KrJoV4uIJCgV?=
 =?us-ascii?Q?X26qPKF1z0E6yNqaCRCa/uw40PN03OD8bd2+AcOm29Jj4ShSX0HqLOlxg6xx?=
 =?us-ascii?Q?5GIzoLjOWa/ZEGVB7iDL5/94NWSpFULZjwiIPhFEr5/s4uvU0N9BFDxXjfLK?=
 =?us-ascii?Q?JdrU/q8LR8/lpJGhd/0L7Mqqq4mRM1sLMN9gj+18BiU2loQ9lzwotd8BZ+MN?=
 =?us-ascii?Q?6kpxG4bFZ44k/v54++bHkWmXQqfha3jDsM4DkCGZJ6O345piXWRBf7CylNDI?=
 =?us-ascii?Q?OtRTY1N77bY49evaD7GgrgqbRzM8PKwVdOdXL5G+sC62Uin39S1tMTg5IHP7?=
 =?us-ascii?Q?tn0wF3NLj7lUHqL6OQY679OeCUEhAA/ttm7qttkk0+HM1xljRJDzne25PptB?=
 =?us-ascii?Q?N7mgmpLSuvQU38zILVUGL9cry+Qnbbzogr1iY9SErD3i3PryxuzIxNhduytb?=
 =?us-ascii?Q?mQOxRy9ocTryDDH9Fip8TdSns+g95cvHdZu9BPYtoKAHrbJfvANyKWIEmt80?=
 =?us-ascii?Q?Kia/kH8vbqHMhvtmVZkN+QheZzw2UawSbGQi4ZI0I8lyoZ3cgCSFmCPKpjUN?=
 =?us-ascii?Q?TmCVGjU+luK1lOZs3rcJUm8q0ZOjL3yd5TwT+TVlcE6etitD9PHDykmRKGBi?=
 =?us-ascii?Q?U87DhVfQBtAF+IwZG4/msqSY7u2ttwE9RDXUwAfd9ARK3R9x44jCALPeoNLR?=
 =?us-ascii?Q?bypD7HiX8bwajcgYp/GTpALzwP71qzO3ws4+GMGL6kynlJaBqkNfe3frF21Q?=
 =?us-ascii?Q?XQ6WOutZtZnSMsnhqEnSxrgreLsNKT/sQZ4IPgi/7vewVVMwadNdVzI0K5cI?=
 =?us-ascii?Q?9V50wMhSksRD0V+AKxjLRMKNKPSB+gFVe2skG4oQHJXxv2R7BBrMUUfANQnu?=
 =?us-ascii?Q?mMOFguJD3458xkfKrNPLPt1PzuBCGXR7eBPLs9hm2TacJO/rGwa57PJ9Xo7W?=
 =?us-ascii?Q?KGL3ybrrVHavI8ntmhW1XGQhdu5M7lZr+wk3TdE/B7iq573Erxq2Wtj26i+5?=
 =?us-ascii?Q?a25GvNvqPNBGmt/awXtjkRLWyzm6NcK7FIBgwXciD57qO8NQKPHnrY0da6CS?=
 =?us-ascii?Q?vZl3KQqnecXKIWuGD1W7RZLAuFn5o/+cTCOcHZ5M/dEXZ0+WthhAOZbKj7t+?=
 =?us-ascii?Q?sMBF8w+8NMjvonpZ1d13MpHoiREXbVEhb3KjqItpBtYEdCUovMUKC0g9YOU7?=
 =?us-ascii?Q?CTv6vUf3CrhAh114F5uP2v84z5wy8cpPVLM1Pn+Mf3eVyT1A8iZqmh9MmQh8?=
 =?us-ascii?Q?6eWAvf0lCM1ATjzk/DGcOxBmiaqaLDuWkVEUn4cMRvFAqAng6RDHjVaCVKyW?=
 =?us-ascii?Q?vXphqSN6eJnPazfZqU9I4RvvmlhJJ3WyBJ9MYd6/0T3j1+U3BH22HWzmo/4J?=
 =?us-ascii?Q?yw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d96696c9-0319-4667-6165-08dba2451f54
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6452.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 12:49:56.9682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xv9vHEnH1Pe9CI2ar/lCrnDp5+UoAI/PW2hyvwAQPm6cyCPL0CjllBuYHIGH8/Pr7zmPuan4fx28kAS/hkWSQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9672
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

On Fri, Aug 11, 2023 at 07:36:37PM +0300, Vladimir Oltean wrote:
> Let me explain that approach, because your mention of "swapping out the
> bootloaders" makes it appear as if you are not visualising what I am
> proposing.
> 
> The Lynx SerDes family has 2 PLLs, and more lanes (4 or 8). Each lane
> uses one PLL or the other, to derive its protocol frequency. Through the
> RCW, you provision the 2 PLL frequencies that may be used by the lanes
> at runtime.
> 
> The Lynx 28G SerDes driver reads the PLL frequencies in
> lynx_28g_pll_read_configuration(), and determines the interface modes
> supportable by each PLL (this is used by phylink). But it never changes
> those PLL frequencies, since that operation is practically impossible in
> the general sense (PLLs are shared by multiple lanes, so changing a PLL
> frequency disrupts all lanes that use it).

Is my high-level feedback clear and actionable to you? I am suggesting
to keep the look and feel the same between the lynx-10g and lynx-28g
drivers, and to not use "fsl,type" protocols listed in the device tree
as the immutable source of information for populating mode->protos, but
instead the current PLL frequency configuration. So this implies that I
am requesting that the dt-bindings should not contain a listing of the
supported protocols.
