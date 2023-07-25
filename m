Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E96CE7627AA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 02:13:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=corigine.onmicrosoft.com header.i=@corigine.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-corigine-onmicrosoft-com header.b=iWLcOQAv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9ZBN62zHz3cbY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 10:13:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=corigine.onmicrosoft.com header.i=@corigine.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-corigine-onmicrosoft-com header.b=iWLcOQAv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=corigine.com (client-ip=2a01:111:f400:7eab::716; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=simon.horman@corigine.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20716.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eab::716])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9Nzq0mQ7z30g1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 03:19:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LF7Nt6FB54q9wLFnqMh+KWU1gJu2w+VXEFT+Gm94jWu76pxreZZ42rFXlkaJb+GNCigmcyVQvmiuCO/YDeivI8ObDfEqE0S3SxV/rRC/8jtTrn2apAseZWp4ErUG8ViGJzltV0PSelcUrCXZIAJvV4Te4DXlqKNnKyZOLVs1XySvgghFn5PlFQqSnpZZJlhGB7PKxKqYQAiQTmX5jhRPDp51xn9oX/Axx6LJ3r9er5D1fqsXk8YHB/0yq85S0+90m7HSLGtI7kCTVONx5DIPQlIgBmmNMWWwRazUPAsQhGocwYcWGH214ck1IjO+xDNwFb5Zk/IHtI45wOyu29ybfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DK9uHbsc3t+xogfPMg7kjIX+FMiUQnAapwvPyCJgoZE=;
 b=eP1EQBOCMbwlXLnRG3kxplC03+6yeHSsUw+juRtBXR2VWTLrq1pCCBMBYzR1k5ap//eHMNw4tV42/4NctcgD1ikw+EnFdBake1vW4pGOi26cmrLsBxN9KAYmM9zMBmv11K0XSg+4RHOzf8DmQqnqpFJ37OIr+utEWdLQ8RB06ol0cCo2jfuQW5zmyNd/ELruim0F/HUO1oRFPcGg4Qoc3ST9u5GUPY3ycJfb08LjXJSVh9WUx9/bQI1exCbeYsm1NeKhI+5sKP140CsdY0GLY9wc+Jjp/nvqDMF37JRnH5sqhp/dUyT8bePQQIsoSk8theP7N+O8zS+qw7lZ3vFgcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DK9uHbsc3t+xogfPMg7kjIX+FMiUQnAapwvPyCJgoZE=;
 b=iWLcOQAvTSLwBrWinNqq3nQPLzctyuRnuYCRVRCvK3cOJ6AQ3tgZhLdAKI4UbrjqqcnpOOG74Hg2P9faH4x+ZI6+tw6/QxRittc7DjZuA1/w/EPO2EBIOeyWnnDo8YwRtGHxKLataoAEul08W3ISPGzjmY4tYNw/KU6hCNMTd20=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by SN7PR13MB6065.namprd13.prod.outlook.com (2603:10b6:806:32f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 17:18:38 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::fde7:9821:f2d9:101d]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::fde7:9821:f2d9:101d%7]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 17:18:38 +0000
Date: Tue, 25 Jul 2023 19:18:19 +0200
From: Simon Horman <simon.horman@corigine.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] net: Explicitly include correct DT includes
Message-ID: <ZMAD25Yp6gCNq+wH@corigine.com>
References: <20230724212222.809909-1-robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724212222.809909-1-robh@kernel.org>
X-ClientProxiedBy: AM8P190CA0030.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::35) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|SN7PR13MB6065:EE_
X-MS-Office365-Filtering-Correlation-Id: bfcfba55-28cc-4df2-90e5-08db8d332f15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	kVQINs0kkXBcwE8L5iyOtORfoG1Pd+xFjXPZ9LRODBMiMliUBEuEzEk3iVcrwXKJr8rAFVdqJgeYwWq3+TV/i2ltvCUcGsy44uTPpGg5JtJ7CMraHfl6jGw89N+GIsjdGq4JZQph/OOpvGT53zWj/oqmZs2uzXtxyilKNz2sCNftNLMJ4RV1Mi2crDarzhCjmPBkBf5nCS/Jd5kiSku0NYbM7aW3VWgo+9vPYlkKLvLKr7vcpQbCn0j767wjiVt23thNz4d1fnu/9/LPRR5CqYzqRvtGQCtMe7UIiztvNr9h5AMHeL2lt8Mv81bRppZSJp9rhsL/1lUQLPu+Sdvw+ripgZyplCZwKH09doFEnYxxRysQUMBtjmH4q2+BF/wJLxTrl7HbvqNiRVq4re5QsMYOtov0PLBOx9LZuRFtfAiccM82LIYKODAUhugvNIxxKWTGDstNffrm53GfCp0E1i2vK7Ko3fADdxq2o05WX3yw+l5hMzdytBW9aRHjrVmCuCauG88JwzTkLRp0X/pfjvk/HI5XJPKRtIKzqNmD3fSK/+JC7Im0wf9PyVOeNSgkCcCQUdxWrmpCEUyUTRHctqiBrREvZpt+9ce9mGQ9tp0VcTVfP5PIEWZi7iuxn7vnJFIUN9TouT6oWhL+TPvOUfhhKAml3+smPtF/DuFOglg=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR13MB4842.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39840400004)(376002)(366004)(136003)(396003)(346002)(451199021)(36756003)(7416002)(86362001)(44832011)(2906002)(4744005)(7336002)(7366002)(7406005)(83380400001)(186003)(6506007)(6512007)(38100700002)(6486002)(54906003)(6666004)(8936002)(4326008)(66476007)(6916009)(66946007)(316002)(66556008)(41300700001)(5660300002)(478600001)(8676002)(2616005)(67856001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?SfivlBpK0iZL4CHmNzCFK8GVBuqJNnfG4tpEURiqDu2qUXtgl7nra0Hl3D+D?=
 =?us-ascii?Q?TDl4OSMSGsMUhHcrQPQYgZmjub7iJvXyRmU0c6PMsUxeMubBTLInPEPVXSaZ?=
 =?us-ascii?Q?46kYdQ81k5PiHsUNt1cuGOPLckPycvCVspi4dEE+GSwu2XoHLUoLn6Z8TxQM?=
 =?us-ascii?Q?HUEihQTj9OP0wEP5xtFHjg3kfyrH/4b1/kvVWz3nQFcLVp+2x/dU4/zSByLY?=
 =?us-ascii?Q?Ml+v0Om2OULiq5Jo78qdrpSvryOkq12+781HITllpTWk9PHXHCztg6ikUiCv?=
 =?us-ascii?Q?45W3YrcmJ2Mb8W+jTO3TcthkrOS+GGeNfb2EErqLS3l8JW2MgTcF3hqhesbe?=
 =?us-ascii?Q?YL1GaWZrMwMhTjoGN8wjsy+ea21hb/MeUv8Uhc84IJ2A7E7JMWqRZ4ZI5Gvf?=
 =?us-ascii?Q?EwSYJOU64pTev1BBJc3MyPdhFHm0NCcI6+/9Llq/HQ2dxJco5pRucO8WU3Rx?=
 =?us-ascii?Q?+enuinJ32jB0VCQC5wqDVjB8I1vDjjYFfIfddoCh6TZZqfRtzN4fzcw4uDvp?=
 =?us-ascii?Q?wN/g0Hx3dGTLPKbhsemzhN+FSBEKiza8x9s3+wt5JMhkkswN8jrVPUuxnn/x?=
 =?us-ascii?Q?uXqnVvbEi5s9UtXQRB/WsAPhlFwdAG6CvhJTe/xYe7bVvwXOaJAYZZF4d44x?=
 =?us-ascii?Q?s200Q9lqq7JKWM0XdQNPBCtYSffBQaHT08jE0nIEMY7vbtdFmu1burl65/D/?=
 =?us-ascii?Q?dtPHiddakpgiDlKp+zv1YdTboPlh5R5EgsDVS/BSO/PWWlsIT5FNpaOtoRhv?=
 =?us-ascii?Q?jR+KQgaDDPT0WBA/IHTNuPL+45ik1WWeadVU7fKub1nCQeImkrQW819PJPC0?=
 =?us-ascii?Q?Md2ORPW/WwbYip4HTGS/3F/nldVG6cetrnhtFtVGArjETFpW4KhlsgW9PF5N?=
 =?us-ascii?Q?3R3M/WA7bxAtq5u1lVdf1twMXF17S/TFETgrgi17HbsHxi7nXpEZq8RNCt2j?=
 =?us-ascii?Q?zpOfMfZV94NkGGwgngDvxRVOur4wRX00X4pJC/nAz0efGlmwcYaBH6crG7NH?=
 =?us-ascii?Q?8K64RPHBI1BMYvWLDVHQuqk2izUM9QGQ9NMB0k6fF9yeaJaO5LeU3Bst1M+S?=
 =?us-ascii?Q?aWmKs2heLOdTBf+q5Wvi3Nk6nrMs2EqkueXsT41hKbHbhSSA4nJm9yu1uAWX?=
 =?us-ascii?Q?DIVXYTJBDPH1596HPDfvtoZ9mtlXKi9RAH7z0fDuFrrQOWNCNLVNSjupm1xy?=
 =?us-ascii?Q?lxEuDpJJ6qu0sE8H/HfxiEaPhTjg2NdctqN4qs4mLiTXab6LZu0EQNaG+UgY?=
 =?us-ascii?Q?lzkD2lfgG0+w0PQsHE+DJHBA9+5ELRG7JG1YQpZxp2sjbh4tSyYMp59tYIhD?=
 =?us-ascii?Q?siBaFJMRClIq8mS6BGLguvZbj9kqz13UBvaJFJHcP7Ow2rilh0ZcLEqRebfE?=
 =?us-ascii?Q?IHr67O0wg5qCkiBBSmfEmGU+xCJTBOhrzDI8qhvKaKRa/7qYHjjbpsB9PthE?=
 =?us-ascii?Q?nug7ecTlHhsgIGSNAo3XloesemLot0X0ll3JQAvzY8Hd8HK0PCFfqppuS4tW?=
 =?us-ascii?Q?6nfKKrkFu+eud8HUI1sTSX+HtrhKSDtIiC39S6S9OsMjDNGHuyeHJaAGFpMk?=
 =?us-ascii?Q?siYEUNMlx5SSwJZBGNC3dq2ZnwNHg4M/BHkwRA7JxbOPQtd8CJZL+WSV4SHT?=
 =?us-ascii?Q?bOaJpZYxTvRK6B4jYROZVzhxTWieF3ci+kudBTmhCkorYkQqvxK9aSUbBN0J?=
 =?us-ascii?Q?8TI0IA=3D=3D?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfcfba55-28cc-4df2-90e5-08db8d332f15
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 17:18:37.9129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CmON8172SiVviYEIWeRrGW6MJ4deG0a05MA6FmZOqw9dmoxdn9FmRvCA/R2Xs9SiafbJX7u1l23Wdh8sbM72MM5p0IuZ+rHjJg9KTwW5wUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR13MB6065
X-Mailman-Approved-At: Wed, 26 Jul 2023 10:11:06 +1000
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

On Mon, Jul 24, 2023 at 03:22:16PM -0600, Rob Herring wrote:

...

>  90 files changed, 88 insertions(+), 92 deletions(-)

Hi Rob,

I suppose that it's reasonable to take this patch through netdev.
But it does have a pretty wide surface, and netdev moves a lot.

As it stands the patch doesn't apply due to a conflict
in dwmac-qcom-ethqos.c

-- 
pw-bot: changes-requested
