Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 814A372CBA3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 18:35:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Y3O10OXy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qfy3418Plz30dy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 02:35:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Y3O10OXy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0c::627; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on0627.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0c::627])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qfy244l1cz309t
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 02:34:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CjRBUw4tiClAAp7SL5yi1O5JJ+57Y78EG0SfdWKp6qNQFI/jDYF7iS3t3DQF0wenB4Q1F+yZ9nglz88jFwiQUvZI7ZC+mageEFSKoxmj1ffa/HnzhxxkX1sDF3XPXL6qychrBTwD7smUJnVLIg7CqiSq4ltkHGWclJpmBXZMJ5ikn5jeJiVvEPT0/8jujrBktoDdWeoZdEIxh1PR9GfEcjv0iU661eYX6hL3GUoSOD6XMm/NONroMG1WrIYOjdB2dskH8QHiD8XHcYrNLSy+5rW1+ExQ5mNdvS0dddNZkWrpN0PjEtXwk1z25QSMJfBWVR/hTOEdgLiPSeQNs6escQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qXbWUPHkRYAVrza4JoqfRbRmSJN7rs/mFLANhna3mR0=;
 b=IKpVu2f4K53Rl1L31/sIYy8nFu2JYDvX9gxj0jO17dGIbeUoYpLndwPQBkVx+V9kVjEZ2PdUuoGn4SUHhA4lGuVx+4MRvz//+2wyEe+KLyfeQlKhQOp13v0TvgkeBX+IGF3PetFIcQS3tXp7uH0pXNXSLKByx4X2OBTFvb6pPG13I5ATA0XHYMckBfQM5f2E3Jz45Hagk35vAajxpr+tSXhxMovzU4E3LfmxpbSz8EQ7omb9SIgt1ug9SjHHTOc8RL6g4uwwC3fjesDvWt3kxzxLSvI++ZUJuG6TYqLt3PaxC7gMmVLCOpObO0sYMumzClCpOuYzKnTT3HqfKru2Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXbWUPHkRYAVrza4JoqfRbRmSJN7rs/mFLANhna3mR0=;
 b=Y3O10OXyeHrD+uV30t7GwZAY02f8/k45gIDPNIIltX3Y/UpHPm/J9RG3xtVCsmQIELEy3SXWzgnFGLkhJ10tWxoRYjRc9wTAI8ysCLZdd5ETFkwEhGvPFUrx4P6X5LdULVGmvxp06KRgXfsCws06jeUE567gDujmF9wr8ctKo9I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com (2603:10a6:208:16d::21)
 by PAXPR04MB9349.eurprd04.prod.outlook.com (2603:10a6:102:2b8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 12 Jun
 2023 16:33:58 +0000
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::c40e:d76:fd88:f460]) by AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::c40e:d76:fd88:f460%4]) with mapi id 15.20.6455.045; Mon, 12 Jun 2023
 16:33:57 +0000
Date: Mon, 12 Jun 2023 19:33:53 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v14 00/15] phy: Add support for Lynx 10G SerDes
Message-ID: <20230612163353.dwouatvqbuo6h4ea@skbuf>
References: <20230426105140.t4yqv6irtjcwptm5@skbuf>
 <7c7ab84b-3c4a-4e44-b5b5-4acf733a0246@seco.com>
 <7c7ab84b-3c4a-4e44-b5b5-4acf733a0246@seco.com>
 <20230429172422.vc35tnwkekfieoru@skbuf>
 <c81d23b6-ed22-0b37-d71b-ddce9d5d58eb@seco.com>
 <c2f928d2-25f6-0e31-9ab3-9d585968df1b@seco.com>
 <20230522150010.q5zndfwcuvrb6pg2@skbuf>
 <22a28a6f-2c84-a6b1-bb57-a269af34c993@seco.com>
 <20230610222123.mzmfjx7zfw4nh2lo@skbuf>
 <c702e2b6-cb0f-4ac9-86fe-a220284d45aa@seco.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c702e2b6-cb0f-4ac9-86fe-a220284d45aa@seco.com>
X-ClientProxiedBy: AS4P195CA0004.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::19) To AM0PR04MB6452.eurprd04.prod.outlook.com
 (2603:10a6:208:16d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6452:EE_|PAXPR04MB9349:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fdb6c60-cfe6-45b4-1ec4-08db6b62d1d1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:  Kf8Xnx1cWtmSx/xL77Iza4LLYqQicdU5Yvcxf5qS2CftKERt1F2q/CoYvkn2KYbXIrgdPTQVD15jjD+bx7ZvYOB3LOz8WBsscQ+D5DF1RSy7pGAwG0Vysx1jZFvOXkylRvstrUZGNXn2TMOBEzeWDE45+FKDNzoXhQ0eGfjcIu5unjxSdvYNdoP0mllW/4W/Kx8d50eYmEjUtRo0QHi9+UpGdEybP9bJJN30POrCb9EWGizq3Zhe+fgdkgtVG8+41tngEL9fhRFn2fduwNXiXGF0ZOBa66gCx3g5GzMCNBXisFEM5Tb0DpVMC1+wMPI/PJfpnkgbLo6AJLc2UeCH3t4QhJVr2Y0b0eCAw+b17WbYMkyxicUouFm4wyYOS0AIo1it0H/yl1U0h/zJ+cvQqwEjjrT6zH9w1ZOmE+jnoxTgEATc8VdAf/VyYz1t4t3R4vrE+nO3TiLuk0QpW1RIg0Wo+g/LOyKWM9UVAhTOJBQSzrtZteVaU2qQRKo/uVM92MTMMPvbyb48lOBA4ZUGcupYuYk2K9a2VnFB9JOJJ9oiZaKMqxUV22RXiGs+oD2wsFE6r/8jWfIqCtzghtTnEtJ8S08YbwxzfHkdJhW0vgw=
X-Forefront-Antispam-Report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6452.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(451199021)(186003)(83380400001)(2906002)(86362001)(33716001)(38100700002)(1076003)(5660300002)(316002)(6486002)(41300700001)(6666004)(8936002)(7416002)(8676002)(54906003)(478600001)(66476007)(66946007)(9686003)(6506007)(6916009)(4326008)(66556008)(6512007)(26005)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:  =?us-ascii?Q?fy1hh+r0YRDXXgyxW/vzfZvGVmHXqGxH+o64DaWa4DvnnO4vKX3Ou7HdpLz6?=
 =?us-ascii?Q?44RjWdHByRvtHKMxFtEW76/ABwqCjbTHdOql2yLu66Hpwmm+SmooDe4twVgF?=
 =?us-ascii?Q?TH8D8pkqrUNThZ1HsoaUFG8qzlsd831GjrPlg/Q1YXUGCeMVUHQIc09nzzdQ?=
 =?us-ascii?Q?6vjWvSqtKs5/Xnd/YxOBMsERISE7urq1UZ4yVP4SkIsn+qm8ROShHVotrYVn?=
 =?us-ascii?Q?QitAhUkrk2h6kg3iK9kIAuvCD04w2KbMeAZllmDtnSCcPMlw5qsLqDJToy51?=
 =?us-ascii?Q?R3fgmH7OWSNEm6rodFJQ/BO0BXZANKo1wPXMhgA8IBDbGP8r8C9QeYogT5fo?=
 =?us-ascii?Q?Wx5hKguUeijpVbLzoWD+kM21YveMM4FMqcQ7XSgiG3+nRW5nXnlnKpzfz74m?=
 =?us-ascii?Q?7i37Kv2vS4coXb94L9UOY+t+0FmYPNp8mmCam0LqEDaMWVXw3pUI4c6oMd4p?=
 =?us-ascii?Q?4fkesf5BJBIocKsLj6AmzRcAbJIWphEaFsfKN8rklUTt9HMwL1P8DfJGuBUS?=
 =?us-ascii?Q?GNmu9YRtlnVJlASVyU/iFSVAvS1m+cOtkzmwkO+0keqAT6gDgp8b6hOMEuJq?=
 =?us-ascii?Q?9zasZHKALhbG3N4m+BSOwpvk/2r8sWo8IfYvfLBHMx/ETHLeli+X1+4q5z46?=
 =?us-ascii?Q?XzyhPept+4pUQqmQipL+U6UDbxVf1R27i0NaG0HBR0TD4Xg+uBFkckm2mA5E?=
 =?us-ascii?Q?I5FkdBKfyCHsccHKWhCbuPx9/uCDCxhjMixAvN7mR0sd/Biaf59uA4LVCYUg?=
 =?us-ascii?Q?NJAjFvPoDJZJSqxNCp7rsAQrNa437/I/jVhQW4LhjMWgvSomCmXeCssYg4bC?=
 =?us-ascii?Q?6pbalNeanDmy1kN128/RgcVY1LipFvL8wpSIranm7GWV6p3xMFX6B5V593mI?=
 =?us-ascii?Q?0AfyRnUuQ2aBRQhxWIE9JsQdps6BXyv6gFFXOdGbWX3MxDxAwY7EClaB/41z?=
 =?us-ascii?Q?QgVVDtUZzTX5xo2CNH8dDxfRvRYXUlRT7EUz0KXeiythRILSPLdsG3dn/7r1?=
 =?us-ascii?Q?41d+GjcBI5E9QW6LwKmq5dn4Ps75NijHbQdYZaaKuBl0jiqEjzCwYfmpP6lk?=
 =?us-ascii?Q?fYnVMQceMWVzP+9BJBDp58EISpWpJ5vSo0/3AUuPHsEFaQ6wwnJ/EoTwCjXy?=
 =?us-ascii?Q?o0TsUIiXAboSCQG4kQmy6qZKgR8dBdjH/C4tOY1dFw5/4pvZkvhKW4xa4Uhz?=
 =?us-ascii?Q?7XHAul2JEpP28zgwVnpAe1/tSa81w4SXSzEFsRzF/pDicorzHOE54E58BHms?=
 =?us-ascii?Q?u6tR121T4KL72FfSADn3kimmEXKICDGdhJNEaqHd7lr8eqIOtjAvkEZ9C5R7?=
 =?us-ascii?Q?hYfxxs9VvBtjgS0O5sMjqxGl31VXSrK0HvEOWYeMxeTqejCpPkehcNaVMTaF?=
 =?us-ascii?Q?QOCpvYdNckfoFIrLVlHd4cpVdQiRPEueKjV2uaSY1OvoHCgUNnpY8K+GnE3t?=
 =?us-ascii?Q?r+owYZIcvYv00RriDndrhGmX0U9XxXGt75vPi7wqkG97ppyjOKvfeBEmeA+a?=
 =?us-ascii?Q?uwgrNkmLD63fEz7NuotgaNWvNls0CbSsIm0gQmgFPNKeyINK52oZ5Ntr8ZQq?=
 =?us-ascii?Q?Vs2op7rrDnOgnft1bir0CPdnvTbrxX+mkytLYljV8WhdiwXNxzzxCzl9j3ca?=
 =?us-ascii?Q?Fg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fdb6c60-cfe6-45b4-1ec4-08db6b62d1d1
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6452.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 16:33:57.5908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5yWugnnAZ+FXV7NdoxJbZpc7VVAiN1jjMeRePk0vRTi4FKrQpFKVpV+RfBy/F5ATe/zvl0D7yMpgsb002G98gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9349
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

On Mon, Jun 12, 2023 at 10:35:21AM -0400, Sean Anderson wrote:
> > And if SERDES protocol switching was not physically possible, would this
> > patch set still have value?
> 
> Yes. To e.g. set up SGMII25 or to fix the clocking situation.

Let me analyze the reasons one by one.

The clocking situation only exists due to a hope that protocol changing
would be possible. If you were sure it wasn't possible, your board would
have had refclks set up for protocol 3333 via the supported PLL mapping 2222.
In essence, I consider this almost a non-argument, as it fixes a
self-inflicted problem.

Have you actually tested changing individual lanes from SGMII to SGMII 2.5?
I know it works on LS1028A, but I don't know if that's also true on LS1046A.
Your comments do say "LYNX_PROTO_SGMII25, /* Not tested */".

Assuming a start from SERDES protocol 3333 with PLL mapping 2222,
this protocol change implies powering on PLL 1 (reset state machine
wants it to be disabled) and moving those lanes from PLL 2 to PLL 1.

At first sight you might appear to have a point related to the fact that
PLL register writes are necessary, and thus this whole shebang is necessary.
But this can all be done using PBI commands, with the added benefit that
U-Boot can also use those SERDES networking ports, and not just Linux.
You can use the RCW+PBL specific to your board to inform the SoC that
your platform's refclk 1 is 156 MHz (something which the reset state
machine seems unable to learn, with protocol 0x3333). You don't have to
put that in the device tree. You don't have to push code to any open
source project to expose your platform specific details. Then, just like
in the case of the Lynx 28G driver on LX2160, the SERDES driver could
just treat the PLL configuration as read-only, which would greatly
simplify things and eliminate the need for a clk driver.

Here is an illustrative example (sorry, I don't have a board with the
right refclk on that PLL, to verify all the way):

Add this to ./serdes_10g.rcw in the root of the qoriq-rcw repository:

/*
 * Registers for the Lynx 10G SERDES block.
 *
 * Must be included by an SoC-specific header that defines the
 * SRDS_BASE value.
 */

#define PLLnRSTCTL(n)		(SRDS_BASE + (0x20 * (n)))
#define PLLnCR0(n)		(SRDS_BASE + (0x20 * (n)) + 0x0004)
#define  POFF(x)		(((x) << 31) & 0x80000000)
#define  REFCLK_SEL(x)		(((x) << 28) & 0x70000000)
#define  REFCLK_EN(x)		(((x) << 27) & 0x08000000)
#define  FRATE_SEL(x)		(((x) << 16) & 0x000f0000)
#define  DLYDIV_SEL(x)		((x) & 0x00000003)
#define PCCR8			(SRDS_BASE + 0x0220)
#define  SGMIIA_KX(x)		(((x) << 31) & 0x80000000)
#define  SGMIIA_CFG(x)		(((x) << 28) & 0x70000000)
#define  SGMIIB_KX(x)		(((x) << 27) & 0x08000000)
#define  SGMIIB_CFG(x)		(((x) << 24) & 0x07000000)
#define  SGMIIC_KX(x)		(((x) << 23) & 0x00800000)
#define  SGMIIC_CFG(x)		(((x) << 20) & 0x00700000)
#define  SGMIID_KX(x)		(((x) << 19) & 0x00080000)
#define  SGMIID_CFG(x)		(((x) << 16) & 0x00070000)
#define  SGMIIE_KX(x)		(((x) << 15) & 0x00008000)
#define  SGMIIE_CFG(x)		(((x) << 12) & 0x00007000)
#define  SGMIIF_KX(x)		(((x) << 11) & 0x00000800)
#define  SGMIIF_CFG(x)		(((x) << 8) & 0x00000700)
#define  SGMIIG_KX(x)		(((x) << 7) & 0x00000080)
#define  SGMIIG_CFG(x)		(((x) << 4) & 0x00000070)
#define  SGMIIH_KX(x)		(((x) << 3) & 0x00000008)
#define  SGMIIH_CFG(x)		((x) & 0x00000007)
#define PCCRB			(SRDS_BASE + 0x022c)
#define  XFIA_CFG(x)		(((x) << 28) & 0x70000000)
#define  XFIB_CFG(x)		(((x) << 24) & 0x07000000)
#define  XFIC_CFG(x)		(((x) << 20) & 0x00700000)
#define  XFID_CFG(x)		(((x) << 16) & 0x00070000)
#define  XFIE_CFG(x)		(((x) << 12) & 0x00007000)
#define  XFIF_CFG(x)		(((x) << 8) & 0x00000700)
#define  XFIG_CFG(x)		(((x) << 4) & 0x00000070)
#define  XFIH_CFG(x)		((x) & 0x00000007)
#define LNmGCR0(m)		(SRDS_BASE + (0x40 * (m)) + 0x0800)
#define  RPLL_LES(x)		(((x) << 31) & 0x80000000)
#define  RRAT_SEL(x)		(((x) << 28) & 0x30000000)
#define  TPLL_LES(x)		(((x) << 27) & 0x08000000)
#define  TRAT_SEL(x)		(((x) << 24) & 0x03000000)
#define  RRST_B(x)		(((x) << 22) & 0x00400000)
#define  TRST_B(x)		(((x) << 21) & 0x00200000)
#define  RX_PD(x)		(((x) << 20) & 0x00100000)
#define  TX_PD(x)		(((x) << 19) & 0x00080000)
#define  IF20BIT_EN(x)		(((x) << 18) & 0x00040000)
#define  FIRST_LANE(x)		(((x) << 16) & 0x00010000)
#define  GCR0_RSV		0x1000
#define  PROTS(x)		(((x) << 7) & 0x00000f80)
#define LNmGCR1(m)		(SRDS_BASE + (0x40 * (m)) + 0x0804)
#define  RDAT_INV(x)		(((x) << 31) & 0x80000000)
#define  TDAT_INV(x)		(((x) << 30) & 0x40000000)
#define  OPAD_CTL(x)		(((x) << 26) & 0x04000000)
#define  REIDL_TH(x)		(((x) << 20) & 0x00700000)
#define  REIDL_EX_SEL(x)	(((x) << 18) & 0x000C0000)
#define  REIDL_ET_SEL(x)	(((x) << 16) & 0x00030000)
#define  REIDL_EX_MSB(x)	(((x) << 15) & 0x00008000)
#define  REIDL_ET_MSB(x)	(((x) << 14) & 0x00004000)
#define  REQ_CTL_SNP(x)		(((x) << 13) & 0x00002000)
#define  REQ_CDR_SNP(x)		(((x) << 12) & 0x00001000)
#define  TRSTDIR(x)		(((x) << 7) & 0x00000080)
#define  REQ_BIN_SNP(x)		(((x) << 6) & 0x00000040)
#define  ISLEW_RCTL(x)		(((x) << 4) & 0x00000030)
#define  GCR1_RSV		0x8
#define  OSLEW_RCTL(x)		((x) & 0x3)
#define LNmRECR0(m)		(SRDS_BASE + (0x40 * (m)) + 0x0810)
#define  RXEQ_BST(x)		(((x) << 28) & 0x10000000)
#define  GK2OVD(x)		(((x) << 24) & 0x0f000000)
#define  GK3OVD(x)		(((x) << 16) & 0x000f0000)
#define  GK2OVD_EN(x)		(((x) << 15) & 0x00008000)
#define  GK3OVD_EN(x)		(((x) << 14) & 0x00004000)
#define  OSETOVD_EN(x)		(((x) << 13) & 0x00002000)
#define  BASE_WAND(x)		(((x) << 10) & 0x00000c00)
#define  OSETOVD(x)		((x) & 0x0000007F)
#define LNmTECR0(m)		(SRDS_BASE + (0x40 * (m)) + 0x0818)
#define  TEQ_TYPE(x)		(((x) << 28) & 0x30000000)
#define  SGN_PREQ(x)		(((x) << 26) & 0x04000000)
#define  RATIO_PREQ(x)		(((x) << 22) & 0x03C00000)
#define  SGN_POST1Q(x)		(((x) << 21) & 0x00200000)
#define  RATIO_PST1Q(x)		(((x) << 16) & 0x001F0000)
#define  ADPT_EQ(x)		(((x) << 8) & 0x00003F00)
#define  AMP_RED(x)		((x) & 0x0000003f)
#define LNmTTLCR0(m)		(SRDS_BASE + (0x40 * (m)) + 0x0820)
#define LNmTCSR0(m)		(SRDS_BASE + (0x40 * (m)) + 0x0830)
#define LNmTCSR1(m)		(SRDS_BASE + (0x40 * (m)) + 0x0834)
#define LNmTCSR2(m)		(SRDS_BASE + (0x40 * (m)) + 0x0838)
#define LNmTCSR3(m)		(SRDS_BASE + (0x40 * (m)) + 0x083c)
#define SGMIIaCR1(a)		(SRDS_BASE + (0x10 * (a)) + 0x1804)
#define  SGMII_MDEV_PORT(x)	(((x) << 27) & 0xf8000000)
#define  SGPCS_EN(x)		(((x) << 11) & 0x00000800)
#define XFIaCR1(a)		(SRDS_BASE + (0x10 * (a)) + 0x1984)
#define  XFI_MDEV_PORT(x)	(((x) << 27) & 0xf8000000)

Add this to ./ls1046ardb/serdes_pll1_power_on.rcw in the same repo
(and finish the writes):

/*
 * Assuming that the SoC starts from SERDES1 protocol 0x3333, power on PLL 1,
 * which is required by the reset state machine to be disabled.
 */

#define SRDS_BASE		0xea0000 /* SERDES 1 */
#include <../serdes_10g.rcw>

.pbi

write PLLnCR0(0), POFF(0) | REFCLK_SEL(2) | REFCLK_EN(0)
wait 2500

write PLLnRSTCTL(0), ...

.end

Add this at the end of your board RCW:

#include <../ls1046ardb/serdes_pll1_power_on.rcw>


In short, I believe the reasons you have cited do not justify the
complexity of the solution that you propose.
