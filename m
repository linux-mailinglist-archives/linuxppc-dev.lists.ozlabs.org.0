Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5259C765FE5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 00:49:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=corigine.onmicrosoft.com header.i=@corigine.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-corigine-onmicrosoft-com header.b=cx9+Al/x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBmDF1Lxbz3cR0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 08:49:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=corigine.onmicrosoft.com header.i=@corigine.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-corigine-onmicrosoft-com header.b=cx9+Al/x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=corigine.com (client-ip=2a01:111:f400:fe59::71f; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=simon.horman@corigine.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2071f.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::71f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBVZj0bpSz2yFQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 22:34:35 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gIzDErRAV5ji97O0zTJ+L/lxEt0Re1609iN4/MFUqc/iKx+98QdUDueJQ2O4xQ0XNKBZwetuwu1Z5AcM/ZTwjv8rAgHV8cIA+MIvfIIxm4aobbuYqex0z2QtHZ57/uXlHIJ3t+nionlBeN2BjrP1xkdxMwzg/VGL2Y/VhTLvJGZpduorYcZuoQhmyehAmX2xkFp7NmFNTivBDVoUEN24Xxiu+j/DnLQdKzGKMLNbc+55Lw4F/fiTMSXWKP5ZyPk9uNgmxXV76ZCES0a9/uPmKBBdFnFn0O2qsitEcWCMhUy3RFcRcGMYhOTZnjcz4Z7DgAfK0DpN3i2Xyr/TVCx7QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QL4me+7eoEUDPPolV082EW//OfXkead99x3Pkk70I/M=;
 b=iQoI9knXh4j+xHQ6pwd4wJcr97JFflug3yjyGu4OS49rtoNQxU+13dMHrJdQ5lOD1ONsmyKxzsPTJaOGwAf13bqCsNSHfcfWyrGCaSrqoPVunw24LRUv7LKaTcwUPTck5UexLm/BiPrfZKusrKRtzXtEqRKIR1rqOOxEhyJf+P/jH5vNreXNbbWPjorY9roAjcIiEfCTfcOsgIptLl69+h2+0UxpsHoNobtY+H2dEb99Lpg9fmsj5oeBmI5wWtTOXE3lE01kE/JJ7jiBHPDAVo9+XupiUX5bErM32TSHkZP6+YMNMRw2EvJbSKoio69VCoBKTKRxY0U7FP5fASBSFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QL4me+7eoEUDPPolV082EW//OfXkead99x3Pkk70I/M=;
 b=cx9+Al/xirTXm23GwmAjZ8MOhkEJVlvmsK72TBWfrK//cNVpdYg3sbUMz33VL3PTBRc+Tx1u17ljDziQ3zdJ6UNwviU4ByWcMGI2tb+XuA3uEHYCuQUEq6tEu8u/ITyWyDkDyuBG7g1GoH1ouYP8HJxlK+79FKLM9Nlz9K0FbU4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by CH0PR13MB4715.namprd13.prod.outlook.com (2603:10b6:610:de::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 12:34:11 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::fde7:9821:f2d9:101d]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::fde7:9821:f2d9:101d%7]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 12:34:11 +0000
Date: Thu, 27 Jul 2023 14:33:52 +0200
From: Simon Horman <simon.horman@corigine.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH net-next v3] net: Explicitly include correct DT includes
Message-ID: <ZMJkMMLOcs3uyX8x@corigine.com>
References: <20230727014944.3972546-1-robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727014944.3972546-1-robh@kernel.org>
X-ClientProxiedBy: AS4P195CA0050.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:65a::8) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|CH0PR13MB4715:EE_
X-MS-Office365-Filtering-Correlation-Id: 849540a0-3eb2-40bd-ed82-08db8e9dc75c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	zC4iiaZzXGN+CVkGITa21od1fYonNkgFgUBFr5yag5ZfZdIDzjHp/u6C9clrx5Eb10rniZ0uZU0YxRM9JYeobtqS4DwXQY/dqK6aZHDgBsNquDBluT5H/spf/d1G5oXFgcZM7WVjlOwHk0Gyvg4GyOcKUOmKYXqQ9yE0L11OvwsCZUQehmLQ15/GS75yJP3ae1yJcrbGezHjsRN6yHJ2WASj2lZ2Xdt8k/0808MULj6iRdlYLdPd6r8zUhlcfwyJmEQm+ERVjbwibe1NS2Xpfxb1RNdbidjmQOCihE5LpY8hOK12huzWRwCiB+vxY0jP0dTcUZgh8zuhQetrQ4wUS5thrwBgIsNE55j/mgODVd4IZ+QTBlqHx6BdtEJDWSINgXfoMhYKE1APWJBz4wNcWchXmjwCIbdOxuY/bwi+PSyCguhX0p6uA8l3SfojN0sFZ1ZX2d+bnxrvlXXUv6iPv6Faf/jDnGoXk2R19bUR2BQV+Ag+GhxNB4z9m5+pewua2RTnCDyL+hGiyDrCd282aVatd6SoHhlFvDzSPzuykZa1QGY66lL9lq0zEfxCT+4Sn5mpMT60qq8KzmDXcs0t0l7qkfbUd5ajuqriOq/wlro=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR13MB4842.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(136003)(39840400004)(396003)(376002)(451199021)(6512007)(6486002)(6666004)(186003)(83380400001)(36756003)(2616005)(86362001)(38100700002)(6506007)(6916009)(4326008)(2906002)(66476007)(66556008)(66946007)(4744005)(316002)(5660300002)(7406005)(7416002)(44832011)(7366002)(7336002)(41300700001)(8936002)(8676002)(478600001)(54906003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?/yyDPbEP8pBOd96E1nSCH/qCgn3Hr7U3pByWjyK9x3gglh5Ksb0nzhZxmqOj?=
 =?us-ascii?Q?DvYin5NLWMKjIOCD+ATzYhwuznp3Eub1v1/33D6MKb89J8Lct7A+lKikeGM6?=
 =?us-ascii?Q?sTdImcRa08F7OKGYZGfTgDr5VGmAQXDIzEvt4vy2r0FLAwWqDdgjsNtrdJv5?=
 =?us-ascii?Q?XIA/4N+tlF6Xit5kyoyxijcagcvQfV3/+fTai7DLxt6/V6hk9FpKReopglh2?=
 =?us-ascii?Q?KQEkciEv/SUMh8z3Ld17iO6zTDHyQ2xrv32aYUSIMe1OQmHiflsDtwyDT04A?=
 =?us-ascii?Q?kWCIFcQdWqEP2poTBrzjoelcqWD+Pf1nBMV7f0FcdfaWDa5JBjoeCbp0LyW7?=
 =?us-ascii?Q?4O1Dm1xGv9vnKyyDot40SjKX15A76nUli6nWXdJ1+foAAurRwxKczM7rNF8X?=
 =?us-ascii?Q?ybMLIHcNJeWwj4kZXlHVfCi17fTmm5LmvBzPh9knRN/q0M8LwqOcLrs82cUa?=
 =?us-ascii?Q?nGidGmUmK396GLm2tlVBnb0O9PJkG3SmWBU9PORPNvwtn6MDKIvgmgmqHV9K?=
 =?us-ascii?Q?n8yuOGXwxCyQUnkhg/0mjHaYer54TBTJWeB/yDiPY6km5+/PsiScM6GpG+q9?=
 =?us-ascii?Q?SnaXpiB0wA///zihMDEKUPb0vKiO90XhqxfOWK21pANSIxHvmEIqBhThZun6?=
 =?us-ascii?Q?DmHNCPYfIJYReElnmIzUohHMh1QFTiVbV+8frU+uzvPKzIH0nzjZx5kfAthx?=
 =?us-ascii?Q?7NuKpwgAuU4mXtoxHkBAsMn2dJLWcCE2mBBqFbfdPIaAciRtwMumUlWXMD2a?=
 =?us-ascii?Q?QxRNrAspj91C/Le0XTU31Vu5mVkqjfusnY/s3wa3qSaAdelUpPFMuWCMSxi1?=
 =?us-ascii?Q?ZUEjBv9froVpdlQ650QzyJ72uMCkY1vA/NaerVuub9Q9M61LZyb/fFWRZMuF?=
 =?us-ascii?Q?rFVFx577dF0BIcUSRKPZpMm4mM9ym4L2LEzQy15bIjXUe5ZnkOXysC1/V3Pn?=
 =?us-ascii?Q?sqPuKITyeAWITNHSzGGgipvcvQ9ktM9CBW88WeH/c5L3pm53hi5TME2orQo9?=
 =?us-ascii?Q?cwNjgzWSwG6ullyr2hNCdrWdu4ySDfHwWynufC/E/p0JBM5Xz03mKOHUC/+Z?=
 =?us-ascii?Q?CVj+f0vh1+wPy7gPxEKQZ4x2mBFvbk4Hqw9voUSijie30cXVX8FWp1/o0RzK?=
 =?us-ascii?Q?EIg+aEGiHsnMsV9gnNMrdFxSSsFSiVrOXNv9myl9oMdfWL3Oyjx+g1nQHn+6?=
 =?us-ascii?Q?SEOXRLD0+ZBZSurqzbFR67l9GK2m0x8zttbDhlRO6S8AHUL/v9kJbhP6nGrm?=
 =?us-ascii?Q?slLFYNqOWTf6aGnTGF980I87OrATAUpw6fk/nRq/G8hFQiPQYtJdxnYw+HTL?=
 =?us-ascii?Q?7FdAy8DI1ZtT3onu6USTMzxl1tvhDC3JZWjHAgYggfa4Fekygflyl3JUr1e1?=
 =?us-ascii?Q?2KUWzCrawK0ZcBLMf7d8J2q83tezXxp1eRJwUVGYxUcHTIwMq5vDeL9hyeHB?=
 =?us-ascii?Q?4kiryPHMIQGkQcFTGW9m/2ee6zM7wq/B73wnE6gzP3uGkPyR9YJrjKC/sAa8?=
 =?us-ascii?Q?CkrnLI9sx1WoswH6GLImPFGyGtSue/aprFpJpfnCv5iu8Gf25JsffwdKih8n?=
 =?us-ascii?Q?Iylm9G6xD2PBb/u3gUHV8dD6hvFzFxqHLQ7BMAX4VhGkJr8kAuf1WFz/yLND?=
 =?us-ascii?Q?kwz7NqyNFsrLFJKTitYj4YuBlG5U3Alev5r7ivbIFXnibPhaah6B9xRDuQis?=
 =?us-ascii?Q?OL8qPg=3D=3D?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 849540a0-3eb2-40bd-ed82-08db8e9dc75c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 12:34:11.1035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 80rNwJ7GWW1rA2/2LFEasklTPljFCwxg9JzU8bIJFrxNMNZOXmckCBV3igX2kL1dPYz3G60/sGfNk0AzE36I0YKnoLoycspImi4HNCtQsjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR13MB4715
X-Mailman-Approved-At: Fri, 28 Jul 2023 08:48:48 +1000
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>, A ndrew Lunn <andrew@lunn.ch>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Jonathan Hunter <jonathanh@nvidia.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>, Sean Anderson <sean.anderson@seco.com>, Kevin Hilman <khilman@baylibre.com>, Madalin Bucur <madalin.bucur@nxp.com>, Jose Abreu <joabreu@synopsys.com>, NXP Linux Team <linux-imx@nxp.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-omap@vger.kernel.org, Alex Elder <elder@kernel.org>, Douglas Miller <dougmill@linux.ibm.com>, linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-wpan@vger.kernel.org, Claudiu Beznea <claudiu.beznea@microchip.com>, Alexandre Belloni <alexandre.bello
 ni@bootlin.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Chris Snook <chris.snook@gmail.com>, Eric Dumazet <edumazet@google.com>, Thierry Reding <thierry.reding@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Stefan Schmidt <stefan@datenfreihafen.org>, Yisen Zhuang <yisen.zhuang@huawei.com>, Steve Glendinning <steve.glendinning@shawell.net>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, linux-amlogic@lists.infradead.org, Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, Mirko Lindner <mlindner@marvell.com>, Neil Armstrong <neil.armstrong@linaro.org>, UNGLinuxDriver@microchip.com, linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-mediatek@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>, Taras Chorny i <taras.chornyi@plvision.eu>, Emil Renner Berthing <kernel@esmil.dk>, Andreas 
 Larsson <andreas@gaisler.com>, linux-tegra@vger.kernel.org, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Fabio Estevam <festevam@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Shenwei Wang <shenwei.wang@nxp.com>, Samin Guo <samin.guo@starfivetech.com>, Francois Romieu <romieu@fr.zoreil.com>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Bhupesh Sharma <bhupesh.sharma@linaro.org>, John Crispin <john@phrozen.org>, Salil Mehta <salil.mehta@huawei.com>, Sergey Shtylyov <s.shtylyov@omp.ru>, Timur Tabi <timur@kernel.org>, linux-sunxi@lists.linux.dev, linux-oxnas@groups.io, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Alexander Aring <alex.aring@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>, Clark Wang <xiaoning.wang@nxp.com>, Alex Elder <elder@linaro.org>, Ja
 kub Kicinski <kuba@kernel.org>, Richard Cochran <richardcochran@gmail.com>, Keyur Chudgar <keyur@os.amperecomputing.com>, Wei Fang <wei.fang@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, Marcin Wojtas <mw@semihalf.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, Li Yang <leoyang.li@nxp.com>, Stephen Hemminger <stephen@networkplumber.org>, Vinod Koul <vkoul@kernel.org>, linuxppc-dev@lists.ozlabs.org, Felix Fietkau <nbd@nbd.name>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 26, 2023 at 07:49:39PM -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Acked-by: Alex Elder <elder@linaro.org>
> Reviewed-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> Reviewed-by: Wei Fang <wei.fang@nxp.com>
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Simon Horman <simon.horman@corigine.com>

