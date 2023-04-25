Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F53E6EE89F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 21:51:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5XgT0J0pz3f8t
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 05:51:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=gu2x2vMO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0d::62a; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=gu2x2vMO;
	dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on062a.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::62a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5XfZ04C1z3bNn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 05:50:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O6VPW9W20IGEHF3jZ0eHMH5zA5a9XP2oJWSoC/cXSXCfVXtOywqAfUgVVSJ4hzSss2N1r++OAPPVOdfe97GY6RQttefX3y7nXeeF3hJRQQppU2jJQEedOoW3hJojbL82T5Aw0yWMcTEziuXTsUsi0TgwH7+vGS6mzxiiMrZB9EFwvtbpiPSNIkXR5w2Xpw5KzeWOFw0tY9F9RWDJW+qsnTPCrIlMjDlRiLib8srmuAc4J++7MFtlRPH70Oh1WsdgMDQ3x3hWzBZk+pAAavHGHa2sOXKK1qH3UWbXYraQ8VgDTITbiMsLdJeKbe7aajaDhFNUcf8l2Zz7CPBeqs9xnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPUSvF7LN1rVFVxFdogdQ2h+NrHGM3qeAPXi8cgk6bY=;
 b=nwG8WZapTJyOykVmzvZrEqhC4KAEZZ2m0fbmH4S8uSWZ11FpG15FEyO4ojDuHHyKimyl/Ym9NgfrE9XA4IQwOnEZDVtXhwh2Z4B5Aggj0rP5juzBPzXb2y4s7lS8GS9JCzbYecLUX5MiZA30p4QPkWsaeWREqKfMOy+43VKDir58X7pBRF+lnylbDjbS8uFGXrtr1K2q++QHv/BlXheIXm8E+FFRSh5WfGW+xqDXYS2BCawuf9ZwoGxf2IR+RDMiSO9HRDrpDRWc7DPgb+xflPrFWmJSV+T+sNTdmuLLel4cFwaiZFKAZBc+O95TlRlIsvL49qyds8JY75ZluK7NKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPUSvF7LN1rVFVxFdogdQ2h+NrHGM3qeAPXi8cgk6bY=;
 b=gu2x2vMOrkc/tXkm/xP+3QbdGfzdlCMyW3KLM8D5dl0DbSf5f41RE6Oeb4ZeOYNQ+raV2L+sg6aJv+V7PF8g6FidA7WwVv7WsmPI4HPIV5XSK9gw5sp4QPwTXUDpEAs4lr5dvxTIPJkgO82D4kDg+FO8MlaJCw81HoVpcdR1GVE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com (2603:10a6:208:16d::21)
 by PA4PR04MB7663.eurprd04.prod.outlook.com (2603:10a6:102:e9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Tue, 25 Apr
 2023 19:50:07 +0000
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::245a:9272:b30a:a21c]) by AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::245a:9272:b30a:a21c%3]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 19:50:06 +0000
Date: Tue, 25 Apr 2023 22:50:02 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v14 00/15] phy: Add support for Lynx 10G SerDes
Message-ID: <20230425195002.fls5cmwolyrslpad@skbuf>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413160607.4128315-1-sean.anderson@seco.com>
X-ClientProxiedBy: AM0PR06CA0141.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::46) To AM0PR04MB6452.eurprd04.prod.outlook.com
 (2603:10a6:208:16d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6452:EE_|PA4PR04MB7663:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f959091-4d7c-4a30-3640-08db45c644e6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:  xooMwcBQ0eonaiXtYvJPguQzI61gN3Vhekhw5v6JVsWgyWj+3ZwCdak1WIwn3Cl/7bj9UlBFqBvWPXo/POwExlb9dmUgI8UDzic5aOj60hkee4allPlfD/a2M64/rE8140jfRcmWyH1E4BLsK5JNP6Jk/ZSD9mkrIikAl65Sqt9akuX3J0qPcE+KoI2s5GWbkeelYRcXNIwGTuWVIQ5X3tM5VkGSHXDwqkwtif1G2QaUuTvtzbCxRJLfeYV8jR4gWdW5QU2Rt8Kl8z/tJUmpIvb8TvTbDRe36aPFx7gZH1B+HPKwB562t5E+qbwAXQpX7pYN8jKjoOdNU7zQ5nLYJ0rF202DpelRDoMTfAouliVjI3HHPjRmluZj5ithj56lFZ/OdIoYSU6auNdaUeBZ5XR7+S+5PG1cmQFB8Q5dB3mdGto1Dfihrs4lnZ5F7etcXipaSPnWtncAQN8PlShAXYasCfr0RvLmJOx8AxgCqbYpDWi83jXnTFl3yPKQoFsttRLEvNbb7vVd+gMJcBTraiGKJ45AUklPOR0hGGRZTZgcpv0LDhbDcHdT/1kIZIqE
X-Forefront-Antispam-Report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6452.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(376002)(136003)(39860400002)(346002)(366004)(396003)(451199021)(38100700002)(66899021)(83380400001)(33716001)(44832011)(478600001)(186003)(7416002)(54906003)(2906002)(6666004)(6486002)(26005)(9686003)(6506007)(1076003)(6512007)(8936002)(41300700001)(316002)(5660300002)(4326008)(66556008)(66476007)(66946007)(6916009)(8676002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:  =?us-ascii?Q?B7+8Y6IO8WS/ulvfXdLmfVNgnB3muD82SLwVgv4XTuthjwWdcmtM3DWoO4jK?=
 =?us-ascii?Q?+z6nOmf2ZJJvTbw8iQPJ1nq1Ztqo+vIvrgBJ42nUlXWnCPxmdIWb8HA1C3EE?=
 =?us-ascii?Q?ch2aHMQTgJ61Hyfoe9ejaqReUvQXek/7ff3lG8QzNpukWLBaFwoxg38zTru6?=
 =?us-ascii?Q?AdL5WHJ+f9hH2wvbI18RdTMv4eIvovl44SaUls2NL4z/pusB6gPNcGLWSG9f?=
 =?us-ascii?Q?NvK8nbP2Lyo4WUIOfi1SNqzlBwShpQEbZJetzUGOUy8q0G3FLgrZINQ3Mblm?=
 =?us-ascii?Q?4GzaSK9nevtaE/8GX6k9oVv7ewYudtOCIsLYKXBiYf0P280XbR/enhqU6Cia?=
 =?us-ascii?Q?udgp+Trv61g6GVICTC/YYFGREZLjorRfYLYp/tuhuoyrkCMpr10sboaCgrdU?=
 =?us-ascii?Q?03m9a24YaGrs8p+Pza4k+xSa/n9sR0OCsacKPzQPuyuX/NO1fOfLn80xeF9t?=
 =?us-ascii?Q?CYK5IV75u0a04V+Jp5NGPd5R83kYwzMGt1F2rrNMuaeFNsoUk7nvqj4DMt8y?=
 =?us-ascii?Q?1fM7cnRVeYg7mvAmXjr1fLpwTgh7tmGOlqt9YjSEaNaVB0F+k/otiPtrX/Uu?=
 =?us-ascii?Q?fmEyxG5J3q9tUHHqjH94J1kNfMGeNw2PM1Iy2E7CmzQRUaS3KWc88AeDjKRF?=
 =?us-ascii?Q?o53IK4fnoFQ9qvZCMuiN5wDctcgwsAndyMlj6a355O1x2VIMwvyZXx8XTouK?=
 =?us-ascii?Q?5nKMwrqgbduFvXvNYnL8euD5lS160vBQQjAcfvW8l/BvGajSSaY5PLRkWNbY?=
 =?us-ascii?Q?CeF9f5SESzWrIv8ltux70cD+YtsEjlg2iRZWgXVvw+KhbK27gtJIUmxXybY2?=
 =?us-ascii?Q?0CrtbtA6bp0gjj0Kd5/DiAC43lHSq0gE3v3zzUfeuO4L9IKISzzMkvrQR9Dl?=
 =?us-ascii?Q?mxaFUcEZPcc/3TmENKX7X7aW9CWKSwlbUrgcUrkSRrE0NgKHGliNRqUGIta6?=
 =?us-ascii?Q?cAo0LkhKOcwJzEt9U9oNeQKujp4EvBmoRJ0LATbWQfvpO/2YD7Y/CT+iOP2e?=
 =?us-ascii?Q?5Ez7V+LCFm6ipPx9pvEqlrzwCaichW3iVwoQlbM3gUImlcWowOj/4v+QEvMr?=
 =?us-ascii?Q?bhg19rWKhdwnRnhz2mxo0eBf6lS+9xlVOK35F1eHbdU10G8ze9at4WGRqPG0?=
 =?us-ascii?Q?vHVZ+jbIQanCidWbi5Cp1+W9hkU7aPkw16t/pL42IsTlxcg2LTdF7QkgYik0?=
 =?us-ascii?Q?lk/i+jRbeCZwEphPgyCxcb8UZ3G4C0ek+pwFXY3LLqpCvyNSslveMHFraCRA?=
 =?us-ascii?Q?RvV894WmE2bVtzuW1UY1nYLXSIzraDoqPMY3PCMDOu22ojAyrsTElQpb8tRE?=
 =?us-ascii?Q?ZcgzmCX26dRiqnm0IuEAoTTW6B2VMRqnf/STz4Cr1/ozFrDSYKS38qe4+V/a?=
 =?us-ascii?Q?u+LCJeC1w3IiANyHS8suhXS13kEct58XbMuf9SFE6O/RogWlA/m0PQgQGuJu?=
 =?us-ascii?Q?xbmtZVVS4gcboAO38DznCTOXTN/pjpEm7jD46aDIIZODu23R6XrLQN4lFmCu?=
 =?us-ascii?Q?fdEH9RT7pn+xPZEuAr8DbBRs0vfAQNz8bYWKnamsA4wj+D3LirYt50I1vSXo?=
 =?us-ascii?Q?xuCNMTszig+W6neBpY3Zs7+JQxmUjkHlzGr1MJTY86Bdu2lSVHDC0B2pEUIw?=
 =?us-ascii?Q?xQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f959091-4d7c-4a30-3640-08db45c644e6
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6452.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 19:50:06.7432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: swUwIdu9MFW3wNDDG0JS1oWSz4QPBZAsK1sHz79U/OQp91CL1K/E/B6LMRanoGJ++/Z0APfUKPGrDVryOU9PVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7663
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
Cc: =?utf-8?Q?Fern=C3=A1ndez?= Rojas <noltari@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Michael Turquette <mturquette@baylibre.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jonas Gorski <jonas.gorski@gmail.com>, linux-phy@lists.infradead.org, linux-clk@vger.kernel.org, Kishon Vijay Abraham I <kishon@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Sean Anderson <sean.anderson@seco.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-doc@vger.kernel.org, Camelia Alexandra Groza <camelia.groza@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, linuxppc-dev@lists.ozlabs.org, Li Yang <leoyang.li@nxp.com>, Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Thu, 13 Apr 2023 12:05:52 -0400, Sean Anderson wrote:
> This series is ready for review by the phy maintainers. I have addressed
> all known feedback and there are no outstanding issues.
> 
> Major reconfiguration of baud rate (e.g. 1G->10G) does not work.
> 
> There are several stand-alone commits in this series. Please feel free
> to pick them as appropriate. In particular, commits 1, 3, 4, 12, 13, and
> 14 are all good candidates for picking.
> 
> - Although this is untested, it should support 2.5G SGMII as well as
>   1000BASE-KX. The latter needs MAC and PCS support, but the former
>   should work out of the box.
> - It allows for clock configurations not supported by the RCW. This is
>   very useful if you want to use e.g. SRDS_PRTCL_S1=0x3333 and =0x1133
>   on the same board. This is because the former setting will use PLL1
>   as the 1G reference, but the latter will use PLL1 as the 10G
>   reference. Because we can reconfigure the PLLs, it is possible to
>   always use PLL1 as the 1G reference.

I am an engineer working for NXP and I have access to the majority of
hardware that includes the Lynx 10G SERDES, as well as to block guides
that are not visible to customers, and to people from the hardware
design and validation teams.

I have an interest in adding a driver for this SERDES to support dynamic
Ethernet protocol reconfiguration, and perhaps the internal PHY for
copper backplane modes (1000Base-KX, 10GBase-KR) and its link training
procedure - although the latter will need more work.

I would like to thank you for starting the effort, but please, stop
submitting code for modes that are untested, and do not submit features
that do not work. If you do not have the time to fix up the loose ends
for this patch submission now, you won't have the time to debug
regressions on boards you might not even have access to, which worked
fine previously due to the static RCW/PBL configuration.

I have downloaded your patches, and although I have objections to some
of them already, I will be in the process of evaluating, testing,
changing them, for the coming weeks, perhaps even more. Please consider
this a NACK for the current patch set due to the SERDES related material,
although the unrelated patches (like "dt-bindings: Convert gpio-mmio to
yaml") can and should have been submitted separately, so they can be
analyzed by their respective maintainers based on their own merit and
not as part of an overall problematic set.
