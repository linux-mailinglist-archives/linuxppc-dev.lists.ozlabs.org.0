Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4657775C2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Aug 2023 12:27:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=c9yRqqBm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RM3606wqfz3cJl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Aug 2023 20:27:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=c9yRqqBm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe1a::601; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1a::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RM35334g6z30Py
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Aug 2023 20:27:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CuiWmyxJvaV+LKKaioM5DIFy8SMZ4h83C0TdpubwpEeCBFiQENppfADSSGmsA+lWDozJIR9iDBXfo78s+eqm8GVX+j797SY/61fyPbnlkMXhToSeisBw3Ipyd1eRa4AvbNNBI8xxkmq+qQWDeUzVgQKw3rKw6ZA8+SQeYMnR3fmoSFvuto4a8m++RJ4XUurscNfQL6GQLT8/hXc+1ch2dI5rz9HYXUTZ8D+7ws2dCx7NLMVPwyF0fPL4WK+4Pd8iW3IHHBhrEeLlfnTXKxfF6Sqz55i04W9ns8I6RaEADzBCurx9Q2f9c9zg7gQokj9e+PIub6lORpT28sjo8TxWvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9zplDN4/XtZWlRjuYF+KyXUrllXAoUOG9nOkVpItwpc=;
 b=bFeRpf8BEam2mK8PuOAGDH9s567eKmu9qEkyVc3mRHvH8C+kIY5bWwHLfVn1pS/E9+d/LNNuCcLten832JueBks/UOBKHGRX3aqqdRk7IMo69b+SWoN7EcgXsFSlSDq+NAQfnH0cBmbd9ZiLMCwh7YPTgDgLAFhjwy6lxD5iIq5TYY+kY3AYMwvmrVfggYgNHwtl/lEUsZm9Hgtz5niNvl7WQsfPZ/jKltDIUnti8REM/mcKNcdZJlNq+k70bVCGCZ4IvgSNjIs3M1jBvLuHDKH4g31B1QVBC6FFGJBKw9bVzaVr8e3UapgWimYBFY1tWsRFvIrEVnUmTS0yD4L4EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9zplDN4/XtZWlRjuYF+KyXUrllXAoUOG9nOkVpItwpc=;
 b=c9yRqqBmAifhHy+YFwWe9KryQ2vqpdZfzbVu00rTsBpcCrbO/NCoRhXMgONIgvYeaWbevGPd31TxzFrH05RVYTM4qkSGIOmZlpbJDe8PgtpMOhfounDODSuYuPDFGDSRfUGX/bA+k4QmtdKWmSVSiHJQtnJ6nG8veIJAAuQDk4I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com (2603:10a6:208:16d::21)
 by VI1PR04MB10028.eurprd04.prod.outlook.com (2603:10a6:800:1db::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 10:26:36 +0000
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::d4ed:20a0:8c0a:d9cf]) by AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::d4ed:20a0:8c0a:d9cf%6]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 10:26:36 +0000
Date: Thu, 10 Aug 2023 13:26:31 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v14 00/15] phy: Add support for Lynx 10G SerDes
Message-ID: <20230810102631.bvozjer3t67r67iy@skbuf>
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
X-ClientProxiedBy: AS4P191CA0029.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d9::12) To AM0PR04MB6452.eurprd04.prod.outlook.com
 (2603:10a6:208:16d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6452:EE_|VI1PR04MB10028:EE_
X-MS-Office365-Filtering-Correlation-Id: 0080df83-faa6-4031-a04f-08db998c467f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:  bC/bxInuDu0EhJmTZfjKmThhdplPX53WUBjf0lYBeR9UzEGo0X1AC6ckX7qi0PkjQMgRIUhVYA8L6henevluvW1zbJJLelbSf6R6ZDHEIawOuoIulz9FEFNdYBuRGuh5HNrDlAcW082/j6LSfzx5gHzKkWWiz5aJKXnJ9j3u+tLBI6znVOqxfz94fj/3kG/7nUPUSpdTHBfNRcgpbrj2uBAt8JXbwM3CBCOqmjDsQ2JVt/Hdz/SFQq1+W0QtcTlRbzM7K1AhmvROS/NSxX4Tog5PZE5Jm+g5GdH12fzEWKgczizn5C1S5Mng69o1/wZ1RRjEPYb0HYmbGYaER5L5kmfW3CyWsh5W4XvEP3zJQKoxgZ79hgidi7RftqwaL2CegVgtx+4nvkhU5EH4+GLByZTN02el4FjKF9RuWMijQcveZdhHgFrjfGlIpFdGMFm2IrhcgOFPLonqBULO3QgV8wVcnOTo8AolPPV0JK55AoXcFqU6AckN+3ekQ9C+F3SiHzeDQqCAuJ2O+WNM7jap3Xij2W4Rlo0ccfxQjESqTz8=
X-Forefront-Antispam-Report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6452.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(366004)(396003)(136003)(346002)(39860400002)(376002)(451199021)(186006)(1800799006)(2906002)(54906003)(966005)(6512007)(9686003)(7416002)(4326008)(30864003)(66556008)(66946007)(38100700002)(6916009)(83380400001)(66476007)(478600001)(86362001)(66899021)(316002)(5660300002)(41300700001)(8936002)(8676002)(6486002)(44832011)(6666004)(53546011)(1076003)(26005)(6506007)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:  =?us-ascii?Q?8hHQ14eVQu/ACYyNu1rft4DwPoo22mDLiWYPsSz6f/b68QUh4wMgBPFkiiZ3?=
 =?us-ascii?Q?xyERvpH/toRICwhjawDieTV+DnLF7wrwOXj2Dr47c13Od7/3JFR1qF7m9WYH?=
 =?us-ascii?Q?mvRahcwBztYg8CsIJ65b0vDy3qf6JFD/VCf2LFJE1DPpokE2cb+tAevPI7nB?=
 =?us-ascii?Q?TyVKGKmEmXFRfCSnMO7lOQ0oTJyf+tyJdaLTnyo3IbygxkBfiYdml0eaXi44?=
 =?us-ascii?Q?9Wli9HzdMrL4VyzQlXeR2107SNvy8MEYx3XNUd26LPpuvobnC2ZWRf8yxHY0?=
 =?us-ascii?Q?KnJm9nhoGcPVFzlnzXJSeB6qskS6m97XB+yKLY63DpZ8qwTksWqx+uMNEz3r?=
 =?us-ascii?Q?950KqAY+CbNuGU59D5k1B3Sp6VB2v569LNJZ7Bw9uUD5DCvWJQwXLvTCnJOQ?=
 =?us-ascii?Q?f/QMKLcIRVun4kmJsWQ4DwwCsHVrZV0UF9g0UkliXp5+8DfDzciDgXs3dN2Y?=
 =?us-ascii?Q?fXNdrLw8z17pu69HGWWazCwxKiIiaR94lx6mhNGC9CRyUitVRlKqTR0LnysC?=
 =?us-ascii?Q?H2GtU2UBtWCBZJeuf32F3u6N3h3x+3GSzF4M9UvoXKP5gTtGmtHOoEZeeLzH?=
 =?us-ascii?Q?EfyqhlxzvUqSJCUiMFmd48GCRFGoBfyTLSsOUQ2uRfcfkGhr/lSN/OV2tK8T?=
 =?us-ascii?Q?3EZHzh5aGT3Drwgg1yTU7JRYlWfEejtI3BJwRMEsurFpHvmsLk6eX8xOzn6g?=
 =?us-ascii?Q?+3KlaBDQLz209rf7K4HddErj/bYTrMSNsRJYKTFM5blRGjPWvn4j6JNg1pzI?=
 =?us-ascii?Q?LWfg/T3sJ1EMUboNXB974Z5ucM1PR8TajOJNhpif3Q2/xqVDjRSqhQnX5b0K?=
 =?us-ascii?Q?jzFmcinfJj434nRWUwsH6SRz2kgjEkxe1d7pjj/ek9MoLj5/M2Us5RzTuNJs?=
 =?us-ascii?Q?O3vDYGUCJDtAGeEKpXUyhXfeWuoF8qVJROC8KWOpyuoXC1ErD9qCE8UtiVDZ?=
 =?us-ascii?Q?sjdVnMeP3UrUXuUE8DfrfmtiMxwG6eTL41pBbtEAP+w8tIGzxlQrbHq6NLhR?=
 =?us-ascii?Q?E+MLgZV5/FldDWqWYAMIms6UEV5dnNW7yBItKLQLCZjxEsqh25xIVlCUb3Tr?=
 =?us-ascii?Q?8qjLt6nbkeKup1H0KGmK6YruObv5V+gdduJ2OJq713XsZanvy3pkPRulPMb2?=
 =?us-ascii?Q?gtQLnUPWzaykaFZ20FA8YilQQgkEy3mtMq1yH5v3chdd5eyXOcULJJf95OFM?=
 =?us-ascii?Q?MxraGzylxfHHF6iI2nUkVyhHycXrvdxz7XrA3qMbi8qaSLtw+ezDork2an/H?=
 =?us-ascii?Q?CgcMgUhaTmFFwu43znFrrTEd5SVetuZ/nZ8TnWhpuauuBq69ejsP1Ib0K5nu?=
 =?us-ascii?Q?bAbHdlGP6dDmCfHzA8IO2GTRtQx4dgzjJ7Lgg1eYJux2ZBwkfHkko7inogBf?=
 =?us-ascii?Q?ybHmJ4BB0aJTSU9sfa5Fkn3bRoJIq8B64O9AheA8ZAlLY8UVgSSTYudBCGlo?=
 =?us-ascii?Q?9Z+li1uCOMwsvdObM1ROyRW0m8DsPw+k41yEDRXTbpEcT31dlP4JPe04sJrI?=
 =?us-ascii?Q?gGc3CcPNeE8pl0s2YeE9IjEvbTS/pGC7Ehjrxq2WMyU+tH7GLlp1CcU2Ztbb?=
 =?us-ascii?Q?PKnCmt4F1OjPj3zWPufP9UdvM9Mb/EXQ/9bpDNPO6Zgp9sJHor5fdoadOGI1?=
 =?us-ascii?Q?wQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0080df83-faa6-4031-a04f-08db998c467f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6452.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 10:26:36.3698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7KZbIvjz/Ga/vOEtZ4kuhrCWH0KQkfDLkgRdko8/SxUed8H15s4Jc3Nm9RiZX9WlzKVpDu/3LqW00W30KfQ6xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10028
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
> The way things are supposed to work (*if* this works at all) is that the
> reset state machine starts with a supported PLL / refclk configuration
> that permits a certain subset of protocols, and the SERDES protocols can
> be changed from the reset state, as desired, for the individual lanes.
> 
> What is self-inflicted is that the refclks on your board design are not
> supportable by any reset state machine configuration, and wiring them
> that way was a conscious decision. Did your company's board designers
> receive the recommendation to disconnect RESET_REQ from NXP, and has NXP
> said that the end result will be something that continues to be supportable?
> I've searched the customer support database and the answer seems to be no.
> In any case, if you have to disconnect RESET_REQ from the SoC to make
> the driver in this form useful, then... yeah, no. You're obviously free
> to do whatever you want with your products, but that's not how mainline
> Linux works, it needs to be useful beyond you.
> 
> If protocol switching works, I will maintain that your board should have
> wired the refclks to PLLs the other way around (which is supported by
> the RCW), and then proceed to do protocol switching to reach the desired
> configuration.

It was quite a journey to piece everything together.

There is one thing to be mentioned right from the start, and that is
that on some SoCs (including the LS1043A and LS1046A), the SerDes data
path is partially controlled by the RCW, and thus, dynamically performing
a major SerDes protocol reconfiguration requires a RCW override procedure
(undocumented in the SerDes reconfiguration steps, but all the info you
need is summarized below).

The DCFG block has a set of RCWSR0 - RCWSR15 read-only status registers
relative to DCFG_CCSR. What we don't document in the SoC RM, but I got
permission to say here, is that the DCFG block exposes a second set of
Expert Mode registers in the DCSR address space (base address 2000_0000h).
The DCFG_DCSR register region spans from offset 2_0000h to 2_05AC into
the DCSR base address. At the exact same offsets into DCFG_DCSR as
RCWSR0 - RCWSR15 are into DCFG_CCSR (aka 100h-13ch), one can find the
shadow RCWCR0 - RCWCR15 (Reset Control Word Control Register) registers
which are also writable. There is a one-to-one mapping between each
register (and field) in RCWSR and RCWCR, so I won't detail the
contents of the RCWCR registers, because we document RCWSR fully.

RCW override means modifying some of the RCWCR registers. In this
particular case, finalizing the major SerDes reconfiguration requires
overriding SRDS_PRTCL_S1 in RCWCR5 with the new per-lane settings, to mux
the correct PCS to the MAC. In the general case, random RCW overrides
that don't come from the hardware validation team are unsupported by
NXP, and you should expect the procedure to yield unpredictable results.

I don't know how much of the above steps is applicable to the other 10G Lynx
SoCs (LS1088, LS2088 etc). Not all SoCs may require RCW override, and
the RCW override procedure may not be the same. That is TBD, and we'd
appreciate if support for other SoCs than the LS1046 to be added no
earlier than when we have a validated SerDes reconfiguration procedure.

I believe this is enough information to permit the creation of a Linux
driver on the DCFG_DCSR registers which permits RCW override at runtime.
It seems this will be necessary at least on LS1046.

We should discuss who and when picks up your patches, removes the
unsupported, untested and unnecessary code and adds the RCW override
procedure. It can be you, it can also be someone from NXP. If it will be
you, please let me know, because there are concrete implementation
choices I want to leave comments on. There is also the previous
observation from Ioana that you should not delete PHY interrupts without
finding out why they don't work.

Only what was thoroughly tested and is based on a hardware validated
procedure should be submitted. This means only a 1G <-> 10G transition
on LS1046 for now.

Nonetheless, below is a functional example of how NXP would recommend
you to achieve the desired PLL mapping for any RCW-based SerDes protocol.
My testing platform was the LS1046A-QDS with PLL1 at 100 MHz and PLL2 at
156.25 MHz. I believe that this should eliminate the need for a clk
driver for the PLLs, and should make your Ethernet lanes usable much
earlier than Linux. That being said, our position at NXP is that you
don't need a clk driver for the PLLs, and I would like to see the clk
portion removed from future patch revisions.

This patch is on top of https://github.com/nxp-qoriq/rcw/tree/lf-6.1.22-2.0.0

From 9f90d6805883f23a898f9d66826f89b7ba73afe3 Mon Sep 17 00:00:00 2001
From: Vladimir Oltean <vladimir.oltean@nxp.com>
Date: Thu, 25 May 2023 11:23:41 +0300
Subject: [PATCH] LS1046A: implement a PBI-based SerDes protocol switching
 mechanism

The LS1046A reset state machine is a bit limited in the SRDS_PRTCL_S1
protocol combinations that it offers. For example, it offers protocol
0x3333 (4x SGMII) only with PLL mapping 2222, and that is good as long
as dynamic protocol switching between 1G (SGMII) and 10G (XFI) isn't
desired at runtime.

If that is taken into account as an additional constraint, then we need
PLL2 (yes, specifically 2) to have a refclk of 156.25 MHz, and that is
in conflict with the PLL mapping of the aforementioned 0x3333, because
1G (SGMII) can only work with a PLL refclk of 100 or 125 MHz, so that's
what has to be fed into PLL 2.

Dynamic frequency switching of PLLs is hard and out of question.

It is desirable to be able to use PLL2 for the 156.25 MHz refclk
frequency (for the 10G link modes), and PLL1 for the 100 MHz refclk
frequency (for the 1G link modes). It turns out, this is possible, even
if not 100% natively through the reset state machine built-in options.

The strategy is to pick a pair of SerDes refclk frequencies in the RCW
that is correct for the given board (thus allowing the SerDes PLLs to
lock, and the SoC to boot) as a first step. The SerDes protocol can be
absolutely anything as long as the PLL frequencies are right, because as
a second step, we'll be fixing up the SerDes lane registers for the
desired final protocol, to appear as if we had that protocol natively.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 .../rcw_1600.rcw                              |  99 +++++++++++++++++
 ls1046ardb/serdes_1133_to_3333.rcw            |  73 +++++++++++++
 serdes_10g.rcw                                | 102 ++++++++++++++++++
 3 files changed, 274 insertions(+)
 create mode 100644 ls1046aqds/RR_FFSNPPPH_1133_5559_to_3333_5559/rcw_1600.rcw
 create mode 100644 ls1046ardb/serdes_1133_to_3333.rcw
 create mode 100644 serdes_10g.rcw

diff --git a/ls1046aqds/RR_FFSNPPPH_1133_5559_to_3333_5559/rcw_1600.rcw b/ls1046aqds/RR_FFSNPPPH_1133_5559_to_3333_5559/rcw_1600.rcw
new file mode 100644
index 000000000000..2bbc0163392d
--- /dev/null
+++ b/ls1046aqds/RR_FFSNPPPH_1133_5559_to_3333_5559/rcw_1600.rcw
@@ -0,0 +1,99 @@
+/*
+ * LS1046AQDS RCW for SerDes Protocol 0x3333_5559 derived from 0x1133_5559
+ *
+ * 42G configuration -- 2 RGMII + 4 SGMII (reconfigurable to XFI) + 3 PCIe + SATA
+ *
+ * Frequencies:
+ *
+ * Sys Clock: 100 MHz
+ * DDR_Refclock: 100 MHz
+ *
+ * Core		-- 1600 MHz (Mul 16)
+ * Platform	-- 600 MHz (Mul 6)
+ * DDR		-- 2100 MT/s (Mul 21)
+ * FMan		-- 700 MHz (CGA2 /2)
+ * XFI		-- 156.25 MHz (10.3125G)
+ * SGMII	-- 100 MHz (5G)
+ * PCIE		-- 100 MHz (5G)
+ * eSDHC	-- 1400 MHz (CGA2 /1)
+ *
+ * Hardware Accelerator Block Cluster Group A Mux Clock:
+ *   FMan        - HWA_CGA_M1_CLK_SEL = 6 - Async mode, CGA PLL 2 /2 is clock
+ *   eSDHC, QSPI - HWA_CGA_M2_CLK_SEL = 1 - Async mode, CGA PLL 2 /1 is clock
+ *
+ * Serdes Lanes vs Slot information
+ *  Serdes1 Lane 0 (D) - Starts as XFI9, switches to SGMII9
+ *  Serdes1 Lane 1 (C) - Starts as XFI10, switches to SGMII10
+ *  Serdes1 Lane 2 (B) - SGMII5, Slot 1
+ *  Serdes1 Lane 3 (A) - SGMII6, Slot 1
+ *
+ *  Serdes2 Lane 0 (A) - PCIe1 Gen2 x1, Slot 3
+ *  Serdes2 Lane 1 (B) - PCIe2 Gen2 x1, Slot 4
+ *  Serdes2 Lane 2 (C) - PCIe3 Gen2 x1, Slot 5
+ *  Serdes2 Lane 3 (D) - SATA
+ *
+ * PLL mapping: starts as 2211_2221, ends as 1111_2221
+ *
+ * Serdes 1:
+ *  PLL mapping: 1111
+ *  SRDS_PLL_REF_CLK_SEL_S1 : 0b'01
+ *    SerDes 1, PLL1[160] : 0 - 100MHz for SGMII and PCIe
+ *    SerDes 1, PLL2[161] : 1 - 156.25MHz for XFI
+ *  SRDS_PLL_PD_S1 : 0b'0
+ *    SerDes 1, PLL1 : 0 - not powered down
+ *    SerDes 1, PLL2 : 0 - not powered down
+ *  SRDS_DIV_PEX_S1 :
+ *    Only used for PEX, not used.
+ *
+ * Serdes 2:
+ *  PLL mapping: 2221
+ *  SRDS_PLL_REF_CLK_SEL_S2 : 0b'00
+ *    SerDes 2, PLL1[162] : 0 - 100MHz for SATA
+ *    SerDes 2, PLL2[163] : 0 - 100MHz for PCIe
+ *  SRDS_PLL_PD_S2 : 0b'00
+ *    SerDes 2, PLL1 : 0 - not powered down
+ *    SerDes 2, PLL2 : 0 - not powered down
+ *  SRDS_DIV_PEX_S2 : 0b'01
+ *    00 - train up to max rate of 8G
+ *    01 - train up to max rate of 5G
+ *    10 - train up to max rate of 2.5G
+ *
+ * DDR clock:
+ * DDR_REFCLK_SEL : 1 - DDRCLK pin provides the reference clock to the DDR PLL
+ *
+ */
+
+#include <../ls1046ardb/ls1046a.rcwi>
+
+SYS_PLL_RAT=6
+MEM_PLL_RAT=21
+CGA_PLL1_RAT=16
+CGA_PLL2_RAT=14
+SRDS_PRTCL_S1=4403
+SRDS_PRTCL_S2=21849
+SRDS_PLL_REF_CLK_SEL_S1=1
+SRDS_PLL_REF_CLK_SEL_S2=0
+SRDS_DIV_PEX_S1=1
+SRDS_DIV_PEX_S2=1
+DDR_FDBK_MULT=2
+DDR_REFCLK_SEL=1
+PBI_SRC=14
+IFC_MODE=37
+HWA_CGA_M1_CLK_SEL=6
+DRAM_LAT=1
+UART_BASE=7
+IRQ_OUT=1
+LVDD_VSEL=1
+TVDD_VSEL=0
+DVDD_VSEL=2
+EVDD_VSEL=2
+IIC2_EXT=1
+SYSCLK_FREQ=600
+HWA_CGA_M2_CLK_SEL=1
+
+#include <../ls1046ardb/cci_barrier_disable.rcw>
+#include <../ls1046ardb/usb_phy_freq.rcw>
+#include <../ls1046ardb/uboot_address.rcw>
+#include <../ls1046ardb/serdes_sata.rcw>
+#include <../ls1046ardb/a009531.rcw>
+#include <../ls1046ardb/serdes_1133_to_3333.rcw>
diff --git a/ls1046ardb/serdes_1133_to_3333.rcw b/ls1046ardb/serdes_1133_to_3333.rcw
new file mode 100644
index 000000000000..ffd548a73675
--- /dev/null
+++ b/ls1046ardb/serdes_1133_to_3333.rcw
@@ -0,0 +1,73 @@
+/*
+ * Change protocols on SerDes1 from 1133 to 3333, and their PLL mappings from
+ * 2211 to 1111. This is useful because, although the reset state machine has a
+ * native 0x3333 SerDes protocol option, the PLL mapping of that is 2222.
+ * This non-native option frees up PLL 2, and it can be provisioned e.g. with a
+ * 156.25 MHz for any lanes that might want to switch to XFI at runtime.
+ */
+
+#define SRDS_BASE		0xea0000 /* SerDes 1 relative to CCSR_BASE */
+#include <../serdes_10g.rcw>
+
+/* For writing outside the CCSR space (in DCSR), an indirect access method is
+ * used. The SCFG_ALTCBAR register (field ALTCFG) holds the upper 24 bits of
+ * the 48-bit address, and the awrite PBL instruction gets the lower 24 bits of
+ * the address that is relative to that. Here we work with 32-bit addresses,
+ * so we only care about the upper 8 bits.
+ */
+#define SCFG_ALTCBAR		0x570158
+#define ALTCFG(x)		(((x) << 8) & 0xffffff00)
+#define DCFG_DCSR_RCWCR5	0x20140110
+#define RCWCR5_SRDS_PRTCL_S1(x)	(((x) << 16) & 0xffff0000)
+#define RCWCR5_SRDS_PRTCL_S2(x)	((x) & 0xffff)
+#define upper_8_bits(x)		(((x) & 0xff000000) >> 24)
+#define lower_24_bits(x)	((x) & 0xffffff)
+
+#define GCR0_SGMII_FROM_PLL1	RPLL_LES(1) | RRAT_SEL(2) | \
+				TPLL_LES(1) | TRAT_SEL(2) | \
+				FIRST_LANE(1) | PROTS(1)
+
+.pbi
+
+write LNmGCR0(2), RRST_B(0) | TRST_B(0)
+write LNmGCR0(3), RRST_B(0) | TRST_B(0)
+
+wait 50
+
+write LNmGCR0(2), GCR0_SGMII_FROM_PLL1
+write LNmGCR0(3), GCR0_SGMII_FROM_PLL1
+
+write LNmGCR1(2), REIDL_TH(1) | REIDL_EX_SEL(3) | REIDL_ET_MSB(1) | \
+		  ISLEW_RCTL(1) | OSLEW_RCTL(1)
+write LNmGCR1(3), REIDL_TH(1) | REIDL_EX_SEL(3) | REIDL_ET_MSB(1) | \
+		  ISLEW_RCTL(1) | OSLEW_RCTL(1)
+
+write LNmRECR0(2), GK2OVD_EN(1) | GK2OVD(15) | GK3OVD_EN(1) | GK3OVD(15)
+write LNmRECR0(3), GK2OVD_EN(1) | GK2OVD(15) | GK3OVD_EN(1) | GK3OVD(15)
+
+write LNmTECR0(2), ADPT_EQ(48) | AMP_RED(6)
+write LNmTECR0(3), ADPT_EQ(48) | AMP_RED(6)
+
+/* LS1046A requires RCW override to reconfigure the mux between
+ * the PCS and the MAC.
+ */
+write SCFG_ALTCBAR, ALTCFG(upper_8_bits(DCFG_DCSR_RCWCR5))
+flush
+awrite lower_24_bits(DCFG_DCSR_RCWCR5), RCWCR5_SRDS_PRTCL_S1(0x3333) | \
+					RCWCR5_SRDS_PRTCL_S2(0x5559)
+
+/* PCCRB: 0x21000000 -> 0x00000000 */
+write PCCRB, XFIA_CFG(0) | XFIB_CFG(0)
+
+/* PCCR8: 0x11000000 -> 0x11110000 */
+write PCCR8, SGMIIA_CFG(1) | SGMIIB_CFG(1) | SGMIIC_CFG(1) | SGMIID_CFG(1)
+
+write SGMIIaCR1(2), SGMII_MDEV_PORT(0) | SGPCS_EN(1)
+write SGMIIaCR1(3), SGMII_MDEV_PORT(0) | SGPCS_EN(1)
+
+wait 120
+
+write LNmGCR0(2), GCR0_SGMII_FROM_PLL1 | RRST_B(1) | TRST_B(1)
+write LNmGCR0(3), GCR0_SGMII_FROM_PLL1 | RRST_B(1) | TRST_B(1)
+
+.end
diff --git a/serdes_10g.rcw b/serdes_10g.rcw
new file mode 100644
index 000000000000..714d53fde8af
--- /dev/null
+++ b/serdes_10g.rcw
@@ -0,0 +1,102 @@
+/*
+ * Registers for the Lynx 10G SerDes block.
+ *
+ * Must be included by an SoC-specific header that defines the
+ * SRDS_BASE value.
+ */
+
+#define PLLnRSTCTL(n)		(SRDS_BASE + (0x20 * (n)))
+#define PLLnCR0(n)		(SRDS_BASE + (0x20 * (n)) + 0x0004)
+#define  POFF(x)		(((x) << 31) & 0x80000000)
+#define  REFCLK_SEL(x)		(((x) << 28) & 0x70000000)
+#define  REFCLK_EN(x)		(((x) << 27) & 0x08000000)
+#define  FRATE_SEL(x)		(((x) << 16) & 0x000f0000)
+#define  DLYDIV_SEL(x)		((x) & 0x00000003)
+#define PCCR8			(SRDS_BASE + 0x0220)
+#define  SGMIIA_KX(x)		(((x) << 31) & 0x80000000)
+#define  SGMIIA_CFG(x)		(((x) << 28) & 0x70000000)
+#define  SGMIIB_KX(x)		(((x) << 27) & 0x08000000)
+#define  SGMIIB_CFG(x)		(((x) << 24) & 0x07000000)
+#define  SGMIIC_KX(x)		(((x) << 23) & 0x00800000)
+#define  SGMIIC_CFG(x)		(((x) << 20) & 0x00700000)
+#define  SGMIID_KX(x)		(((x) << 19) & 0x00080000)
+#define  SGMIID_CFG(x)		(((x) << 16) & 0x00070000)
+#define  SGMIIE_KX(x)		(((x) << 15) & 0x00008000)
+#define  SGMIIE_CFG(x)		(((x) << 12) & 0x00007000)
+#define  SGMIIF_KX(x)		(((x) << 11) & 0x00000800)
+#define  SGMIIF_CFG(x)		(((x) << 8) & 0x00000700)
+#define  SGMIIG_KX(x)		(((x) << 7) & 0x00000080)
+#define  SGMIIG_CFG(x)		(((x) << 4) & 0x00000070)
+#define  SGMIIH_KX(x)		(((x) << 3) & 0x00000008)
+#define  SGMIIH_CFG(x)		((x) & 0x00000007)
+#define PCCRB			(SRDS_BASE + 0x022c)
+#define  XFIA_CFG(x)		(((x) << 28) & 0x70000000)
+#define  XFIB_CFG(x)		(((x) << 24) & 0x07000000)
+#define  XFIC_CFG(x)		(((x) << 20) & 0x00700000)
+#define  XFID_CFG(x)		(((x) << 16) & 0x00070000)
+#define  XFIE_CFG(x)		(((x) << 12) & 0x00007000)
+#define  XFIF_CFG(x)		(((x) << 8) & 0x00000700)
+#define  XFIG_CFG(x)		(((x) << 4) & 0x00000070)
+#define  XFIH_CFG(x)		((x) & 0x00000007)
+#define LNmGCR0(m)		(SRDS_BASE + (0x40 * (m)) + 0x0800)
+#define  RPLL_LES(x)		(((x) << 31) & 0x80000000)
+#define  RRAT_SEL(x)		(((x) << 28) & 0x30000000)
+#define  TPLL_LES(x)		(((x) << 27) & 0x08000000)
+#define  TRAT_SEL(x)		(((x) << 24) & 0x03000000)
+#define  RRST_B(x)		(((x) << 22) & 0x00400000)
+#define  TRST_B(x)		(((x) << 21) & 0x00200000)
+#define  RX_PD(x)		(((x) << 20) & 0x00100000)
+#define  TX_PD(x)		(((x) << 19) & 0x00080000)
+#define  IF20BIT_EN(x)		(((x) << 18) & 0x00040000)
+#define  FIRST_LANE(x)		(((x) << 16) & 0x00010000)
+#define  GCR0_RSV		0x1000
+#define  PROTS(x)		(((x) << 7) & 0x00000f80)
+#define LNmGCR1(m)		(SRDS_BASE + (0x40 * (m)) + 0x0804)
+#define  RDAT_INV(x)		(((x) << 31) & 0x80000000)
+#define  TDAT_INV(x)		(((x) << 30) & 0x40000000)
+#define  OPAD_CTL(x)		(((x) << 26) & 0x04000000)
+#define  REIDL_TH(x)		(((x) << 20) & 0x00700000)
+#define  REIDL_EX_SEL(x)	(((x) << 18) & 0x000C0000)
+#define  REIDL_ET_SEL(x)	(((x) << 16) & 0x00030000)
+#define  REIDL_EX_MSB(x)	(((x) << 15) & 0x00008000)
+#define  REIDL_ET_MSB(x)	(((x) << 14) & 0x00004000)
+#define  REQ_CTL_SNP(x)		(((x) << 13) & 0x00002000)
+#define  REQ_CDR_SNP(x)		(((x) << 12) & 0x00001000)
+#define  TRSTDIR(x)		(((x) << 7) & 0x00000080)
+#define  REQ_BIN_SNP(x)		(((x) << 6) & 0x00000040)
+#define  ISLEW_RCTL(x)		(((x) << 4) & 0x00000030)
+#define  GCR1_RSV		0x8
+#define  OSLEW_RCTL(x)		((x) & 0x3)
+#define LNmRECR0(m)		(SRDS_BASE + (0x40 * (m)) + 0x0810)
+#define  RXEQ_BST(x)		(((x) << 28) & 0x10000000)
+#define  GK2OVD(x)		(((x) << 24) & 0x0f000000)
+#define  GK3OVD(x)		(((x) << 16) & 0x000f0000)
+#define  GK2OVD_EN(x)		(((x) << 15) & 0x00008000)
+#define  GK3OVD_EN(x)		(((x) << 14) & 0x00004000)
+#define  OSETOVD_EN(x)		(((x) << 13) & 0x00002000)
+#define  BASE_WAND(x)		(((x) << 10) & 0x00000c00)
+#define  OSETOVD(x)		((x) & 0x0000007F)
+#define LNmTECR0(m)		(SRDS_BASE + (0x40 * (m)) + 0x0818)
+#define  TEQ_TYPE(x)		(((x) << 28) & 0x30000000)
+#define  SGN_PREQ(x)		(((x) << 26) & 0x04000000)
+#define  RATIO_PREQ(x)		(((x) << 22) & 0x03C00000)
+#define  SGN_POST1Q(x)		(((x) << 21) & 0x00200000)
+#define  RATIO_PST1Q(x)		(((x) << 16) & 0x001F0000)
+#define  ADPT_EQ(x)		(((x) << 8) & 0x00003F00)
+#define  AMP_RED(x)		((x) & 0x0000003f)
+#define LNmTTLCR0(m)		(SRDS_BASE + (0x40 * (m)) + 0x0820)
+#define LNmTCSR0(m)		(SRDS_BASE + (0x40 * (m)) + 0x0830)
+#define LNmTCSR1(m)		(SRDS_BASE + (0x40 * (m)) + 0x0834)
+#define LNmTCSR2(m)		(SRDS_BASE + (0x40 * (m)) + 0x0838)
+#define LNmTCSR3(m)		(SRDS_BASE + (0x40 * (m)) + 0x083c)
+#define SGMIIaCR0(a)		(SRDS_BASE + (0x10 * (a)) + 0x1800)
+#define  RST_SGM(x)		(((x) << 31) & 0x80000000)
+#define  PD_SGM(x)		(((x) << 30) & 0x40000000)
+#define SGMIIaCR1(a)		(SRDS_BASE + (0x10 * (a)) + 0x1804)
+#define  SGMII_MDEV_PORT(x)	(((x) << 27) & 0xf8000000)
+#define  SGPCS_EN(x)		(((x) << 11) & 0x00000800)
+#define XFIaCR0(a)		(SRDS_BASE + (0x10 * (a)) + 0x1980)
+#define  RST_XFI(x)		(((x) << 31) & 0x80000000)
+#define  PD_XFI(x)		(((x) << 30) & 0x40000000)
+#define XFIaCR1(a)		(SRDS_BASE + (0x10 * (a)) + 0x1984)
+#define  XFI_MDEV_PORT(x)	(((x) << 27) & 0xf8000000)
--
2.34.1

> > This driver would also be a good place to add the KR link training with
> > NXP tried to upstream a few years ago.
> 
> Well, speaking as someone who is now also tasked with the copper backplane
> support, believe me that I know that, and this is why I'm so desperate
> with the logic you're trying to push forward. It's clear that we should
> try to collaborate rather than try to push individualistic non-tested
> non-solutions.

Speaking of this, I will send an RFC in the upcoming days which proposes
a model for the copper backplane PHY support on LX2160A and its already
existing Lynx 28G SerDes driver.

I will concern myself with porting that support on Lynx 10G only once
the model I propose turns out to be acceptable for both the network PHY
as well as the generic PHY maintainers.
