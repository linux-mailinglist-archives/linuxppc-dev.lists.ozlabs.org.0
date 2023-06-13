Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6386E72E5BD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 16:29:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Ch6QiXAX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgWCF1hFcz30P0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 00:29:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Ch6QiXAX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0e::60b; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on060b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0e::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgWBH0HDlz2y1l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 00:28:21 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M63p+OtueD+fLur0A+gvpWSYPLjapcGYuKwCOoRdxEa1sclHJlQlMlZWL8OFiY0HskDWtdmp5ToyqE7IpcVASlks5lWRhNcuC8v+xwJlZlDFrpqRK2z89kAPoUqCnDNKkS/Y4Uv0q0g2hn9RXzLHONwD6lSEkGYC5Ook7xETmooirxmp86/Qh7eRg0b0MqGC7d/SLYe6kwueA6horYiW7NJ/6uDSRM3YbJ/jlck3+8qqLxCpTI6+RFSjqmwuHRuwgLKoAX4NMM9cyllGoVJ/REFgCpgW8NSvVf23e9F0ue+x41zZ+/0C1tUfX4BUfFPVNCfS8rqsvXaZrq7KeBNAIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3yqzD08utCEzs/KBhbd0tFml476ZMZlAHrteLHly8Ms=;
 b=W34eeVNbLk49OShmEYE+ro0ssrRAPzpErn4A1/ED/yMAcma8Sy6xMAuC428Sn6GjcTXBi6hysy0IRKDr+N0Yko0KNm/aXsQHvjpY1tF58kktiCVJsX0peSuXySnyoTMet5TmhNNM5hYH0q3f6rDjP06feEdEj42pREFeNd8yDrRNSUWC0riQRStPRexewUigjn2/BRYN8u4QIliACupIyvTE3W5vBFFja1MoPEM5FtxKFmemU/PNydm9mz5boSQW694xaXVnoMNMiq1Hfw5BYzfFifpbRYAPySq7Uy/MXUWR1qJ3OEZIRq4w7Pvs6NExTY+sVzrACJOJQLTD/OK53w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3yqzD08utCEzs/KBhbd0tFml476ZMZlAHrteLHly8Ms=;
 b=Ch6QiXAX0lPbjFVCkGmoK6AClvmwgMM8u3lHjARsAk0HxCf4CV8+x5vSB6hofuG3wO4TZPCDl04gwGqYjtPfGGfc6/W03cM/UG/TWk4KB6fyVIkLurnBTKJBOgjxqRPFc62lenx0XPjKAxOyrTqiahE7PR+WOqK5dDgXHynLMaw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com (2603:10a6:208:16d::21)
 by DU2PR04MB9212.eurprd04.prod.outlook.com (2603:10a6:10:2fb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Tue, 13 Jun
 2023 14:27:59 +0000
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::c40e:d76:fd88:f460]) by AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::c40e:d76:fd88:f460%4]) with mapi id 15.20.6455.045; Tue, 13 Jun 2023
 14:27:58 +0000
Date: Tue, 13 Jun 2023 17:27:54 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v14 00/15] phy: Add support for Lynx 10G SerDes
Message-ID: <20230613142754.wr5njtjo4tbloqwu@skbuf>
References: <7c7ab84b-3c4a-4e44-b5b5-4acf733a0246@seco.com>
 <20230429172422.vc35tnwkekfieoru@skbuf>
 <c81d23b6-ed22-0b37-d71b-ddce9d5d58eb@seco.com>
 <c2f928d2-25f6-0e31-9ab3-9d585968df1b@seco.com>
 <20230522150010.q5zndfwcuvrb6pg2@skbuf>
 <22a28a6f-2c84-a6b1-bb57-a269af34c993@seco.com>
 <20230610222123.mzmfjx7zfw4nh2lo@skbuf>
 <c702e2b6-cb0f-4ac9-86fe-a220284d45aa@seco.com>
 <20230612163353.dwouatvqbuo6h4ea@skbuf>
 <1dd01fe2-08a8-ec2f-1184-a58b2f55ba85@seco.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1dd01fe2-08a8-ec2f-1184-a58b2f55ba85@seco.com>
X-ClientProxiedBy: AM4PR07CA0007.eurprd07.prod.outlook.com
 (2603:10a6:205:1::20) To AM0PR04MB6452.eurprd04.prod.outlook.com
 (2603:10a6:208:16d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6452:EE_|DU2PR04MB9212:EE_
X-MS-Office365-Filtering-Correlation-Id: 02107575-476f-41bd-74e1-08db6c1a62d8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:  LCjZAoPw9Of4yxZcjufAjeKtXhjnb3SJB35cON3zs1klC0vsfdCdzAMYz/bUS5Zuw0QD2NYs2YihdLG9ZGB0NtDiO33fDp8ErPmpaasiBMcUI1AfetbIEuT4uZtlWqL40EMBxbxe81mll9PWyiKJpOoGr3GIFZ4Ptj5RBDfl+PLis7KyF8cvfwIMg3ECj/lZTqRDOXBqDxGfLtf+2IAF8sQAdN5hCKnVPUElmg60kUpZSi096QvbzCrWXiA2Dx8uGZrACZc65RinftmpKWdK2PEMqspBIrnlannXeesoq9KNGVEpM6nzJbhScApjZWNBoGJmlwLWhx5zQl0oJfroJW2ZyKLVIFFim70CvVF0/W+yAPd++s8JVhF/J0UUL7M8nICe/NNmyfuml2QW9mAY8gybtUybzVAQ2lbrhtkW0Fcx3EsNyqdQF0s6NLXFN265l4HoqXrhJG++qxHpOzSeaYnzQjMoLfjntwfFVcuVW4C19h5S6BtneW4uFpXlRkvqmXQav6iPqX6NrNvZ9myvhbxbZfvopnEE/UQT0Yq0LMXzeykQTysvqtaLnlP96KxE
X-Forefront-Antispam-Report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6452.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(376002)(136003)(396003)(39860400002)(366004)(346002)(451199021)(66556008)(66476007)(6916009)(8676002)(8936002)(5660300002)(66946007)(54906003)(4326008)(478600001)(6666004)(66899021)(41300700001)(6486002)(316002)(38100700002)(53546011)(186003)(6506007)(6512007)(1076003)(9686003)(44832011)(7416002)(26005)(83380400001)(86362001)(33716001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:  =?us-ascii?Q?gTD+YO9HLpBPpEod/cjNzDlONepQdrNlX4oEV6oeDqWh9u9ndKbBY5D7Sn9R?=
 =?us-ascii?Q?eqFpG7pLGY0jy+qwJGg9/XoY/ZOnl7iAM+I9jF8y2EWYeUILY/PpH8y16tcP?=
 =?us-ascii?Q?2Ba6sLgv+gZieYM/okLvOfA89rGwcBT7ENhW0xnAPszgiNfMCClCXZ2p+MeU?=
 =?us-ascii?Q?cqJD0aLCxoby7qHs019XM7xFHxn1BQDfurC/BXXFe8508QAFFhIPP1Y0K2N9?=
 =?us-ascii?Q?LCp7eymut+9iloBT9JN5wBA9BFc2yOy3r39ZakRf3mVN0/+d6SfubguA/P8+?=
 =?us-ascii?Q?9g88y4UjWnYvv4p/aZA3O36TacSi5vD16le8Gt+pYphu9v5h6XbSB1zQpjJg?=
 =?us-ascii?Q?NF4dqgGTAujS1cAFAWfg7DKbqvAND7fngeUwKnhEDpkq4QaesLs32MhDaYGo?=
 =?us-ascii?Q?Wnwhp9/tJs99/0adQAzw40+K15ifo/x90AX3FM6czBG3U/JTvPmb0UuAgUA8?=
 =?us-ascii?Q?IwI0V/X7G88S82iaLOMpHQw6r8CAw9l6b5HscdlnJyG9FXDogPan27t0E48x?=
 =?us-ascii?Q?BeYsU9qKMUltEuvo+LWtrggeH/IvNqTo8L7wO8uFmeSJ9Lnl+hhSpm3kgO2K?=
 =?us-ascii?Q?NasNOkbCpFXA1z0qc7mwkznoxXLftodJstz5YePIy3ibMqEdnZ2X4KF2zy2m?=
 =?us-ascii?Q?wzY5riphdQ6+5zWjQpgPK2SoxHFlPFf2FeblFsWKJrBbGEcxKqBURf12bugw?=
 =?us-ascii?Q?/EMPvLjR6GEAh+wTfKT8dTy2ppv5/Qs6TtLqLlSfqD237ZnevnbA8qZqM8/x?=
 =?us-ascii?Q?gc6Idhjb7GZGmY/3QuWKL21wTXAmCZrxGubyhCr7LONyeUz0XVxu4NSz2vvI?=
 =?us-ascii?Q?5jpU4ZIi244S00UEJjPM5X3o49QHF3wmJRqXqHAoixaUdDJLG9mUNLAoszBM?=
 =?us-ascii?Q?QljcSNioZlchtbKg9JJUmSc21w3Ok8TrtHBIiIqiynOuFl7lyjdoAF2HLnLA?=
 =?us-ascii?Q?VXCBJ7IBq70wFrbpOU/90SglQyqINx3A7zG/S+6GUCoAV07Ey7txlNS+cKEr?=
 =?us-ascii?Q?M4kuqkeicqdMuRsCAOQ0DgYAaij74IwguqC3h1Ohn5dBiN/a3ToR6X+3JMbm?=
 =?us-ascii?Q?eAI9F9a7gs38dL8DvnJOhOTZchzzvMN73K/UD7kdpY5FQSnxM5SHCuuicIqs?=
 =?us-ascii?Q?p1TF/HTcK1BfS98ZM7neUWqoyw5sLWILkOhHhZKyOKDvBGuIoDx2YBRfZlOJ?=
 =?us-ascii?Q?dLWDsfNsU22Kws/jitp9Kdyh+sqEvM0zVOFiPrfCtyyfcvO8W5g3q67W80o+?=
 =?us-ascii?Q?r6wAyj45/zza3xJ6liAadMIan12muMPywJn6pdB/5AeCA+xqK0VYojswl0x7?=
 =?us-ascii?Q?A5dtwK6AHHowut9SXH+6dOgVcOWmQEye7HEYvBigaVqeaOkzMENnt7OhLG9r?=
 =?us-ascii?Q?ZBykw8AeH1FAAIaem4IP7P6DHSnvf1xYhkEbidiBfoEM0YLktPPAYD6lDSYp?=
 =?us-ascii?Q?+fO4vzRt4Uze8GQasPSwlmwhIQRKA2Kd47efqKsgQxRi4boLMCSJIYwbmrIa?=
 =?us-ascii?Q?uQImnfQBiBoI8LZcNxBxe4C5HaVIiDD4Tg4E+oq1N5TsX60QORu8T0hLPxBI?=
 =?us-ascii?Q?BJq2VDRFmG9BNUKYvumzt1ouVyVyZoQCpNnNasji+Y6/PoSwo8KrgDXb0gpa?=
 =?us-ascii?Q?BA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02107575-476f-41bd-74e1-08db6c1a62d8
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6452.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 14:27:58.8559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UKkZVma6r9HCiNsIzVyqu3nOCytXYr3BnEmXMTgq8nOQxF49sljPGw7Cna2/YVOwaQwT+AeRbzPZv4/Z5yN2JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9212
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

On Mon, Jun 12, 2023 at 04:46:16PM -0400, Sean Anderson wrote:
> On 6/12/23 12:33, Vladimir Oltean wrote:
> > On Mon, Jun 12, 2023 at 10:35:21AM -0400, Sean Anderson wrote:
> >> > And if SERDES protocol switching was not physically possible, would this
> >> > patch set still have value?
> 
> More to the point, did you make any progress in this area?

Aha. It is two email exchanges later that you've thought of asking that.

No, I haven't made progress. Though I managed to get some extra pointers
and things to try out, and at this stage I am the limiting factor. I will
let you know once the investigation has reached a conclusion.

So many things depend on whether major SERDES protocol reconfiguration
is possible, that if I were you, my question would be just that, instead
of the equivalent of "Vladimir, when can my driver be merged ???".
I understand how incredibly frustrating it is that the responses are
coming in so slowly, and this is the reason why I am responding at all
to your pings even if I have essentially nothing new to say.

And it's not that you don't care whether protocol reconfiguration is
possible or not - you do, but at the same time you're overcome with this
strong attachment to your solution just because it is yours, that I
don't know how to deal with.

> 2222 also does not work, as outlined above.
> 
> The clocking is incompatible, and must be fixed by software.
> 
> The only thing self-inflicted is NXP's conflicting design.

The way things are supposed to work (*if* this works at all) is that the
reset state machine starts with a supported PLL / refclk configuration
that permits a certain subset of protocols, and the SERDES protocols can
be changed from the reset state, as desired, for the individual lanes.

What is self-inflicted is that the refclks on your board design are not
supportable by any reset state machine configuration, and wiring them
that way was a conscious decision. Did your company's board designers
receive the recommendation to disconnect RESET_REQ from NXP, and has NXP
said that the end result will be something that continues to be supportable?
I've searched the customer support database and the answer seems to be no.
In any case, if you have to disconnect RESET_REQ from the SoC to make
the driver in this form useful, then... yeah, no. You're obviously free
to do whatever you want with your products, but that's not how mainline
Linux works, it needs to be useful beyond you.

If protocol switching works, I will maintain that your board should have
wired the refclks to PLLs the other way around (which is supported by
the RCW), and then proceed to do protocol switching to reach the desired
configuration.

So you can see that many things change based on whether protocol reconfig
is possible or not. The patch set presented here looks exactly like the
product of someone infatuated with form over substance, and who misses
the overall picture. My belief is that if you shift your attitude from
"is the work done?" to "is the work generally useful?", the interactions
will improve by a lot.

> > Have you actually tested changing individual lanes from SGMII to SGMII 2.5?
> > I know it works on LS1028A, but I don't know if that's also true on LS1046A.
> > Your comments do say "LYNX_PROTO_SGMII25, /* Not tested */".
> 
> Not yet. 

Aha. So concretely, what makes you so confident with moving this forward?
You like the code to just be there, no?

It helps your board, I understand. But not everything has to stay in
mainline if it's not useful for others, and I've proposed an alternative
solution which I'm not sure how seriously you took.

> This driver would also be a good place to add the KR link training with
> NXP tried to upstream a few years ago.

Well, speaking as someone who is now also tasked with the copper backplane
support, believe me that I know that, and this is why I'm so desperate
with the logic you're trying to push forward. It's clear that we should
try to collaborate rather than try to push individualistic non-tested
non-solutions.

> > Assuming a start from SERDES protocol 3333 with PLL mapping 2222,
> > this protocol change implies powering on PLL 1 (reset state machine
> > wants it to be disabled) and moving those lanes from PLL 2 to PLL 1.
> > 
> > At first sight you might appear to have a point related to the fact that
> > PLL register writes are necessary, and thus this whole shebang is necessary.
> > But this can all be done using PBI commands, with the added benefit that
> > U-Boot can also use those SERDES networking ports, and not just Linux.
> > You can use the RCW+PBL specific to your board to inform the SoC that
> > your platform's refclk 1 is 156 MHz (something which the reset state
> > machine seems unable to learn, with protocol 0x3333). You don't have to
> > put that in the device tree. You don't have to push code to any open
> > source project to expose your platform specific details. Then, just like
> > in the case of the Lynx 28G driver on LX2160, the SERDES driver could
> > just treat the PLL configuration as read-only, which would greatly
> > simplify things and eliminate the need for a clk driver.
> > 
> > Here is an illustrative example (sorry, I don't have a board with the
> > right refclk on that PLL, to verify all the way):
> > 
> > ... snip ...
> 
> (which of course complicates the process of building the PBIs...)

Maybe this is the language barrier, but what are you trying to say here?

> > In short, I believe the reasons you have cited do not justify the
> > complexity of the solution that you propose.
> 
> The work is done,

:)

> and it is certainly more flexible than what you propose. E.g. imagine
> a clock which needs to be configured before it has the correct
> frequency. Such a thing is difficult to do in a PBI solution, but is
> trivial in Linux.

So "a clock which needs to be configured" means a programmable clock
generator that provides the refclk to the PLL, correct?

With QorIQ/Layerscape SoCs, I imagine that case would typically be done
by a board CPLD during the boot sequence, because if the PLL refclks
don't have the right frequency, the main SoC doesn't start. You've hacked
the RESET_REQ signal so you don't have that problem. But surprise -
others haven't - so it's not exactly a relevant argument in favor.

It's clear that the hardware has limitations that have impact upon the
way in which both boards and software is designed. Because you don't
know whether protocol reconfig is possible, you don't know *if* it is
possible, *under what circumstances* it will be possible. What if XFI
only works with 156 MHz provided to PLL 2, and not to PLL 1? You're
trying to push a non-final solution as a final solution.

The programmable refclk generator that is reconfigured at runtime is
another can of worms, which I'm not sure can be feasibly implemented on
this hardware given the fact that multiple lanes share one PLL, and
there are many more lanes (4 or 8) than PLLs (2). Again, I need to see
some practical functionality that this patch set provides.

Do you _actually_ have a programmable clock generator that the CPLD
can't program, or is this a "what if" situation?

More to the point of the "flexibility" that you claim. You haven't
addressed my point of networking over the SERDES ports in U-Boot.
You don't need that - I'm clear with that, otherwise we'd be having this
conversation on the U-Boot mailing lists - but what if others, wanting
to follow your solution, would? Would you see that as an opportunity to
write even more code?
