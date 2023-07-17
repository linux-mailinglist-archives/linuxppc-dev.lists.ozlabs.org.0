Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBB3755EB0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 10:44:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=silabs.onmicrosoft.com header.i=@silabs.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-silabs-onmicrosoft-com header.b=ZXH3HSCZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4Fxx1ccLz30Qk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 18:44:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=silabs.onmicrosoft.com header.i=@silabs.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-silabs-onmicrosoft-com header.b=ZXH3HSCZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=silabs.com (client-ip=2a01:111:f400:fe5a::605; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jerome.pouiller@silabs.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20605.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::605])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4Bzz0bb2z2yFG
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 16:31:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UvKffardhWAKeS4RrMNOMyomx6fR4OtOElBmatsj7C4bY3alsVkqphWvnGb0MeqluG16vSCph7C955RW2zh5DhmKaL7Lg1sJ14MSazagE8ZFDCvUm/uosLQh//ZWItJXlMumyIPyM0UtCD8ZOaiSLSNpUi2cxJEe4ZoI3dZfTOtuWqWuASTG2ZH6LImieC6YLudEdWkl/TiJNKfBqGHozWCa1+YvSq2aFNo3x1WSeJMXtDF94HCiWIIywjgiOstGk7T5zpRh2eVLJ5NKi8tHpDwGTPGMLGJb6xweSSN4TVuXvG2oHTGzpFHnjJGYvkP9SuJxxY73ATW3o/s7nyeYEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1wc8KkBQi9+RPUK5PL7znfDn9EhEdoDn3SfIPssDJ0=;
 b=Iq9di168AqAav88o183i29tY16HaUuFhJCTfpsijRkvRsyoYJKZqynmYM9xzPPc6yBZ+rbg4cHs+tXACK+mDHJTPCbHFpCVgg3eQtagI3poFNftcckq/TZGQz7d2kmDLuMTfdnLfbpJ/dN2rQKFW+LMyKH0C3M6123MPFEIsstbiRbKypQnDuNUUNMuMpKUqVD8U0GipoAopRBluLSjJq9thn/l7+huXxGJGGFCsOFOqlJVSr8neJf2vN1j6CZe8vM5Aya5FXrC6eDqVHbVq1yE5zFYMxUsrV9lFa37WFHyK3QNb/NXLPkCr2i7LUllHVkE9G3nWJgNywXsJEwgSSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=silabs.onmicrosoft.com; s=selector2-silabs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1wc8KkBQi9+RPUK5PL7znfDn9EhEdoDn3SfIPssDJ0=;
 b=ZXH3HSCZ26hW9fYRSGHXT+rMujbtwcfcWmUJ0Hops7uVvD7RLwpyjntzIEWbbsY5G6kWL8pdQNUmlGq0Q2+cucL5WzRj58IhloaSl9Xw9SOYilyOcQKR5UuOjhOcERa4lCfoLles9WxSFBmc2tKWCa+6zybQhKrV6mo9R4KVrJE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=silabs.com;
Received: from IA1PR11MB7773.namprd11.prod.outlook.com (2603:10b6:208:3f0::21)
 by LV2PR11MB6024.namprd11.prod.outlook.com (2603:10b6:408:17a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 06:30:49 +0000
Received: from IA1PR11MB7773.namprd11.prod.outlook.com
 ([fe80::14b1:be6e:19a3:2eca]) by IA1PR11MB7773.namprd11.prod.outlook.com
 ([fe80::14b1:be6e:19a3:2eca%6]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 06:30:48 +0000
From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jerome.pouiller@silabs.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Chandrasekar Ramakrishnan <rcsekar@samsung.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 Kurt Kanzenbach <kurt@linutronix.de>,
 Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com,
 =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Daniel Golle <daniel@makrotopia.org>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Cla udiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alvin =?utf-8?B?xaBpcHJhZ2E=?= <alsi@bang-olufsen.dk>,
 George McCollister <george.mccollister@gmail.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 Keyur Chudgar <keyur@os.amperecomputing.com>,
 Chris Snook <chris.snook@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Madalin Bucur <madalin.bucur@nxp.com>, Wei Fang <wei.fang@nxp.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
 NXP Linux Team <linux-imx@nxp.com>, Sean Anderson <sean.anderson@seco.com>,
 Pantelis Antoniou <pantelis.antoniou@gmail.com>,
 Li Yang <leoyang.li@nxp.com>, Yisen Zhuang <yisen.zhuang@huawei.com>,
 Salil Mehta <salil.mehta@huawei.com>,
 Douglas Miller <dougmill@linux.ibm.com>, Marcin Wojtas <mw@semihalf.com>,
 Russell King <linux@armlinux.org.uk>,
 Tara s Chornyi <taras.chornyi@plvision.eu>,
 Mirko Lindner <mlindner@marvell.com>,
 Stephen Hemminger <stephen@networkplumber.org>, Felix Fietkau <nbd@nbd.name>,
 John Crispin <john@phrozen.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Horatiu Vultur <horatiu.vultur@microchip.com>, Timur Tabi <timur@kernel.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 Steve Glendinning <steve.glendinning@shawell.net>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Vinod Ko ul <vkoul@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Samin Guo <samin.guo@starfivetech.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Kevin Brace <kevinbrace@bracecomputerlab.com>,
 Francois Romieu <romieu@fr.zoreil.com>, Michal Simek <michal.simek@amd.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Alexander Aring <alex.aring@gmail.com>,
 Stefan Schmidt <stefan@datenfreihafen.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Alex Elder <elder@kernel.org>,
 =?ISO-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
 Loic Poulain <loic.poulain@linaro.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] net: Explicitly include correct DT includes
Date: Mon, 17 Jul 2023 08:30:31 +0200
Message-ID: <2688370.mvXUDI8C0e@pc-42>
Organization: Silicon Labs
In-Reply-To: <20230714174809.4060885-1-robh@kernel.org>
References: <20230714174809.4060885-1-robh@kernel.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-ClientProxiedBy: PA7P264CA0117.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34c::20) To IA1PR11MB7773.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7773:EE_|LV2PR11MB6024:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a8f7b5d-b37e-42c8-eae2-08db868f5b99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	HmsSFtzDKDm4bf+iB0vxdboe6Bh1TMimswadzrJ+jMhZQ/qs45jW4pzV4AmGvGw/kIPAFmDld3lk9FGMUAXnCAi6nSAMbCNiaIttMkamYL+1GtepqFhuxPwNICbQINWPFYQUMiLm3FbhTASELzYDNLFOQCibQAY9cgrgdJsdafU4JgCh8XYfULfzmm3BqpGWPTNjxLhCCc4ptrDxzPTlT7gKoaL16bu5KOM415tp5DQtHgnVL0ED0yp9/OgGep+CguUkjIcUbfg2jH7JPmisdHpE1rspXB2CVyZfrRzaP5+jcMxDU0HEVn1gj07LRKmwZCjYbhaK4uAdcNR8AxKlbxLhBKiC8lUC2uh+7OCpKr6/XdO4pxHGXzjjHgfqQFu9399ExL23MZg4UHNlanzEWu8wdHlwxCTuzuDR/GgZOdtkitoTLj+FeTgI0IazhiFFmdw1WQEJo//cQZ1vFYyK+mXbsQ8ljBRUu4H2N4XeEf2BOSlDSk2d9ExQ0uBb+Rtib4/F5j0NVvzqrDEJOUUmHy6nd1BTz6ZqYSgtXmxkPgduf5xNXtkhZ9H7x4O1zuH0xJyGgvBKusRNg6tx3toYOvkdT7nefI7pqJb47pbhfZO8qRWLFymwDzwQpgpny53N
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7773.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(396003)(136003)(346002)(366004)(376002)(39850400004)(451199021)(6666004)(110136005)(921005)(38100700002)(36916002)(6486002)(52116002)(478600001)(41300700001)(5660300002)(8936002)(8676002)(316002)(66946007)(66476007)(4326008)(66556008)(186003)(83380400001)(6512007)(9686003)(6506007)(1191002)(66574015)(86362001)(33716001)(7406005)(7336002)(7416002)(7366002)(7276002)(2906002)(39026012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?iso-8859-1?Q?hv/GN7ECH3e9RGU4XsUJVJOVUIxWXmhQlluU65H4l937+sSENqO6knZU0A?=
 =?iso-8859-1?Q?OetttNnA4XxJr3/LiZTf0MvQJ2dQQdhUfVnJY4+jNSIOS7G3k5Zg/Y5HEN?=
 =?iso-8859-1?Q?ivLlfKOJZeBNX9pqGV5BERw2tffatQ1gvTJl+D54UJRwS/oWpLliph46xm?=
 =?iso-8859-1?Q?fJkJEEZr2dwtQmXDmI8fJj0087nGpWGVCDNNFFmBEDFgO9QMMfYquMHjuR?=
 =?iso-8859-1?Q?OMuqImac91p3F6vmA0Ck9MZB+S6C/GQ+mPyGA5GyVe67JPRJ0dbX+bc/Zs?=
 =?iso-8859-1?Q?+OZsScta/qpUiwl7tWk/xQZSFpN1yMv9DBW6f/zv23rHEMkFR5VOGwEBNh?=
 =?iso-8859-1?Q?WXLMMWEyWkuBT7vcmSGrQfQVOVPemf7lFD3Sxoysktkj5k4DobCpr5I/ge?=
 =?iso-8859-1?Q?7rGf4pNvsVD37dw1R6+NUwCDESiyH5Uuu0t78NHug0xXjwI8gW+jS+wC/H?=
 =?iso-8859-1?Q?dC7RcggCrjjRjC1YNLJqyhLHPlbagLXubitKEQqUX2D7HLiRzlahyLBSdb?=
 =?iso-8859-1?Q?FtdexSj2FXk5XHYh0j5CDcFAZ11Z4dtkDNSf84gD+2kAhJdqs5n43WFa2l?=
 =?iso-8859-1?Q?Lv89bwqxhpvqNx9PuiyACIvtslenzzxvSb0Z4k61V+jFQo4GV7gTe0FBnh?=
 =?iso-8859-1?Q?CgABprFw9qA+2ABd7oLNAKsF9U2nlgobv88Axb4YlUqpOkce3v+mVfabDN?=
 =?iso-8859-1?Q?mf4PaKXC0CzfUvAwveXs2I2Ry/8vGmd1avDZDXmDGtQH7+BeAHMpYQWkQm?=
 =?iso-8859-1?Q?kWpuyLErv88auxjg1CcthqSxpfnI0Y/tHifjDNxTV+q5kt9CGV8vFubfvT?=
 =?iso-8859-1?Q?PfgJwKehecpS29LFGovC1hPlI6BxVnNqgzvpVVjgF+E22iGrj33kw6k3PM?=
 =?iso-8859-1?Q?2jDRhBmHmKHmpU94v/in1+RG01xbO6MUIyRmth5VtOi8H+GGvaAsFsJlRu?=
 =?iso-8859-1?Q?ut1gijglewVJWvmBWGmfaSrlowzJNQeN6quHpCW1G5WVa870DgdVeyzl8b?=
 =?iso-8859-1?Q?/d0ZOa3YJyvnR98+Av0MamPthiYxtvBuNlfS4B2ITY0O0odDRGZ0ufmqt8?=
 =?iso-8859-1?Q?Ss6y2EwFB9xTK7CJCzc683Bjv2alcMHVJoll+wXZ65FyVlk8KxTPiZNFZP?=
 =?iso-8859-1?Q?/yT8+BKZOLYpQGT6WkdlwW5gjbfA9eBXa3YlxYWACCXhyBQ/t6la3nHavW?=
 =?iso-8859-1?Q?JviUEwEMjhJXyw7ONWO9ALXOduvHUBNqq27c2zhiR8xwj8CiTJVRJq5EDY?=
 =?iso-8859-1?Q?Yu1DLfc8XAGCEL/+s9sz4v+L67/IEhdaxGncfUTpCHBcC/VONkxE7Hqk7Z?=
 =?iso-8859-1?Q?Pyvxy4roP2Sy9b11PKGnVx22WOQbFYIHjiMzudO80GZ5mJDMNut6EOhFpO?=
 =?iso-8859-1?Q?yFMYKMmRnGF0qA5UbPRKKS1wvqjFuErai7SnS/FioxTKALC0xwX/siB399?=
 =?iso-8859-1?Q?IGPuG+Z4fOG+jaky+SsHkAAp/0SmobZu588M1xUV8QEECqZI2sJ8FbObdw?=
 =?iso-8859-1?Q?cPOVTA6UowTgS3IuOrSfHoJYdGEILfgXS4SO+/F8/5rQZil8NPKTW/5+cN?=
 =?iso-8859-1?Q?ghecsDy+Ccqv5wkl3f1RrdjLdfc2GYN9b5HEoXAjzyfjLBMI6m3ZgF5fGD?=
 =?iso-8859-1?Q?ebB/NPdsiiV2rFc1MHq1GOCkPhRee8SllKeUHCZ9m4MDAxLVO88aWjgw1W?=
 =?iso-8859-1?Q?IXgJdoKRNyHMc9FdgxeFrOkWx62keCks3Cu+Ohux?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a8f7b5d-b37e-42c8-eae2-08db868f5b99
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7773.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 06:30:48.0778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bW3KiBDtURw3n4QatED5B+2KwgrzeeY+2cRJssRySOu/Zxr2bLiGZT/W7NWVT5YyU4nfoayivyK2WV+jtuJbSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6024
X-Mailman-Approved-At: Mon, 17 Jul 2023 18:42:53 +1000
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
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, linux-can@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-wpan@vger.kernel.org, linux-mediatek@lists.infradead.org, ath11k@lists.infradead.org, wcn36xx@lists.infradead.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-oxnas@groups.io, linuxppc-dev@lists.ozlabs.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Friday 14 July 2023 19:48:00 CEST Rob Herring wrote:
>=20
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/net/can/bxcan.c                                 | 1 -
>  drivers/net/can/ifi_canfd/ifi_canfd.c                   | 1 -
>  drivers/net/can/m_can/m_can.c                           | 1 -
>  drivers/net/can/m_can/m_can.h                           | 1 -
>  drivers/net/can/rcar/rcar_canfd.c                       | 1 -
>  drivers/net/can/sja1000/sja1000_platform.c              | 1 -
>  drivers/net/can/sun4i_can.c                             | 1 -
>  drivers/net/can/ti_hecc.c                               | 1 -
>  drivers/net/dsa/b53/b53_mdio.c                          | 1 +
>  drivers/net/dsa/b53/b53_mmap.c                          | 1 +
>  drivers/net/dsa/hirschmann/hellcreek.c                  | 1 -
>  drivers/net/dsa/hirschmann/hellcreek_ptp.c              | 1 +
>  drivers/net/dsa/lan9303-core.c                          | 1 +
>  drivers/net/dsa/microchip/ksz8863_smi.c                 | 3 +++
>  drivers/net/dsa/microchip/ksz_common.c                  | 2 +-
>  drivers/net/dsa/mt7530-mmio.c                           | 3 ++-
>  drivers/net/dsa/mv88e6xxx/chip.c                        | 2 +-
>  drivers/net/dsa/ocelot/felix_vsc9959.c                  | 1 +
>  drivers/net/dsa/ocelot/seville_vsc9953.c                | 3 ++-
>  drivers/net/dsa/qca/qca8k-leds.c                        | 1 +
>  drivers/net/dsa/realtek/realtek-mdio.c                  | 2 +-
>  drivers/net/dsa/realtek/realtek-smi.c                   | 1 -
>  drivers/net/dsa/sja1105/sja1105_main.c                  | 1 -
>  drivers/net/dsa/vitesse-vsc73xx-core.c                  | 1 -
>  drivers/net/dsa/xrs700x/xrs700x.c                       | 2 +-
>  drivers/net/ethernet/aeroflex/greth.c                   | 4 ++--
>  drivers/net/ethernet/amd/sunlance.c                     | 2 +-
>  drivers/net/ethernet/apm/xgene-v2/main.h                | 1 +
>  drivers/net/ethernet/arc/emac_main.c                    | 2 +-
>  drivers/net/ethernet/atheros/ag71xx.c                   | 3 ++-
>  drivers/net/ethernet/cadence/macb_main.c                | 1 -
>  drivers/net/ethernet/cirrus/cs89x0.c                    | 1 -
>  drivers/net/ethernet/ezchip/nps_enet.c                  | 5 ++---
>  drivers/net/ethernet/freescale/dpaa/dpaa_eth.c          | 3 ++-
>  drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c      | 2 ++
>  drivers/net/ethernet/freescale/enetc/enetc_ierb.c       | 2 +-
>  drivers/net/ethernet/freescale/fec_mpc52xx.c            | 4 ++--
>  drivers/net/ethernet/freescale/fec_mpc52xx_phy.c        | 3 ++-
>  drivers/net/ethernet/freescale/fec_ptp.c                | 1 -
>  drivers/net/ethernet/freescale/fman/fman.c              | 1 +
>  drivers/net/ethernet/freescale/fman/fman_port.c         | 1 +
>  drivers/net/ethernet/freescale/fman/mac.c               | 2 ++
>  drivers/net/ethernet/freescale/fs_enet/mac-fcc.c        | 1 -
>  drivers/net/ethernet/freescale/fs_enet/mac-fec.c        | 1 -
>  drivers/net/ethernet/freescale/fs_enet/mac-scc.c        | 1 -
>  drivers/net/ethernet/freescale/fsl_pq_mdio.c            | 1 +
>  drivers/net/ethernet/freescale/gianfar.c                | 2 +-
>  drivers/net/ethernet/freescale/gianfar_ethtool.c        | 2 ++
>  drivers/net/ethernet/freescale/ucc_geth.c               | 3 ++-
>  drivers/net/ethernet/freescale/xgmac_mdio.c             | 4 ++--
>  drivers/net/ethernet/hisilicon/hns/hns_dsaf_ppe.c       | 3 ---
>  drivers/net/ethernet/hisilicon/hns/hns_dsaf_rcb.c       | 4 ----
>  drivers/net/ethernet/ibm/ehea/ehea_main.c               | 1 +
>  drivers/net/ethernet/ibm/emac/core.c                    | 1 +
>  drivers/net/ethernet/ibm/emac/core.h                    | 1 -
>  drivers/net/ethernet/ibm/emac/mal.c                     | 2 ++
>  drivers/net/ethernet/ibm/emac/rgmii.c                   | 2 ++
>  drivers/net/ethernet/ibm/emac/tah.c                     | 2 ++
>  drivers/net/ethernet/ibm/emac/zmii.c                    | 2 ++
>  drivers/net/ethernet/korina.c                           | 2 +-
>  drivers/net/ethernet/marvell/mvmdio.c                   | 2 +-
>  drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c         | 1 -
>  drivers/net/ethernet/marvell/prestera/prestera_rxtx.c   | 3 ---
>  drivers/net/ethernet/marvell/sky2.c                     | 1 -
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c             | 3 ++-
>  drivers/net/ethernet/mediatek/mtk_star_emac.c           | 1 -
>  drivers/net/ethernet/mediatek/mtk_wed.c                 | 1 +
>  drivers/net/ethernet/mediatek/mtk_wed_wo.c              | 3 +--
>  drivers/net/ethernet/microchip/lan966x/lan966x_main.c   | 3 ++-
>  drivers/net/ethernet/mscc/ocelot_fdma.c                 | 1 -
>  drivers/net/ethernet/mscc/ocelot_vsc7514.c              | 3 ++-
>  drivers/net/ethernet/ni/nixge.c                         | 5 ++---
>  drivers/net/ethernet/qualcomm/emac/emac-sgmii.c         | 2 ++
>  drivers/net/ethernet/qualcomm/emac/emac.c               | 1 -
>  drivers/net/ethernet/qualcomm/qca_spi.c                 | 1 -
>  drivers/net/ethernet/qualcomm/qca_uart.c                | 1 -
>  drivers/net/ethernet/renesas/ravb_main.c                | 3 +--
>  drivers/net/ethernet/renesas/rswitch.c                  | 3 +--
>  drivers/net/ethernet/renesas/sh_eth.c                   | 2 --
>  drivers/net/ethernet/smsc/smsc911x.c                    | 1 -
>  drivers/net/ethernet/socionext/sni_ave.c                | 3 ++-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c         | 1 -
>  drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c     | 1 -
>  drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c    | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c     | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-oxnas.c       | 1 -
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 1 -
>  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c          | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c    | 4 +++-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c         | 1 -
>  drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c       | 1 -
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c       | 3 ++-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c       | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c    | 3 ++-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c   | 1 -
>  drivers/net/ethernet/sun/niu.c                          | 2 +-
>  drivers/net/ethernet/sun/sunbmac.c                      | 2 +-
>  drivers/net/ethernet/sun/sungem.c                       | 1 +
>  drivers/net/ethernet/sun/sunhme.c                       | 3 ++-
>  drivers/net/ethernet/sun/sunqe.c                        | 2 +-
>  drivers/net/ethernet/ti/am65-cpsw-nuss.c                | 1 +
>  drivers/net/ethernet/ti/cpsw-common.c                   | 1 -
>  drivers/net/ethernet/ti/cpsw-phy-sel.c                  | 1 -
>  drivers/net/ethernet/ti/davinci_mdio.c                  | 1 -
>  drivers/net/ethernet/via/via-rhine.c                    | 2 +-
>  drivers/net/ethernet/via/via-velocity.c                 | 2 +-
>  drivers/net/ethernet/xilinx/ll_temac.h                  | 1 +
>  drivers/net/ethernet/xilinx/ll_temac_main.c             | 4 +---
>  drivers/net/ethernet/xilinx/ll_temac_mdio.c             | 2 +-
>  drivers/net/ethernet/xilinx/xilinx_axienet_main.c       | 3 ++-
>  drivers/net/ethernet/xilinx/xilinx_emaclite.c           | 4 ++--
>  drivers/net/ieee802154/ca8210.c                         | 1 -
>  drivers/net/ipa/ipa_main.c                              | 2 +-
>  drivers/net/pcs/pcs-rzn1-miic.c                         | 1 +
>  drivers/net/phy/marvell-88x2222.c                       | 1 -
>  drivers/net/phy/mediatek-ge-soc.c                       | 2 --
>  drivers/net/wireless/ath/ath10k/ahb.c                   | 2 +-
>  drivers/net/wireless/ath/ath11k/qmi.c                   | 1 -
>  drivers/net/wireless/ath/wcn36xx/main.c                 | 3 +--
>  drivers/net/wireless/intersil/orinoco/airport.c         | 2 +-
>  drivers/net/wireless/mediatek/mt76/mt7915/soc.c         | 1 -
>  drivers/net/wireless/silabs/wfx/bus_sdio.c              | 2 +-
>  net/core/of_net.c                                       | 1 +
>  124 files changed, 110 insertions(+), 120 deletions(-)
>=20
[...]
> diff --git a/drivers/net/wireless/silabs/wfx/bus_sdio.c b/drivers/net/wir=
eless/silabs/wfx/bus_sdio.c
> index 51a0d58a9070..909d5f346a01 100644
> --- a/drivers/net/wireless/silabs/wfx/bus_sdio.c
> +++ b/drivers/net/wireless/silabs/wfx/bus_sdio.c
> @@ -10,7 +10,7 @@
>  #include <linux/mmc/sdio_func.h>
>  #include <linux/mmc/card.h>
>  #include <linux/interrupt.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/of_irq.h>
>  #include <linux/irq.h>
>  #include <linux/align.h>

For 'drivers/net/wireless/silabs/wfx/bus_sdio.c':

Reviewed-by: J=E9r=F4me Pouiller <jerome.pouiller@silabs.com>

--=20
J=E9r=F4me Pouiller


