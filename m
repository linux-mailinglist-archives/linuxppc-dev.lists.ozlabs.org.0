Return-Path: <linuxppc-dev+bounces-15330-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 595E0CF8E99
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 15:56:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlvPS6xzjz2yN1;
	Wed, 07 Jan 2026 01:56:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.107.130.23 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767711372;
	cv=pass; b=EpH4+qxDcscu9zX6ZSzlHYGjuWVVZhAx6XI5vE2/4O6Wok0DtptHz1NnK08OfsiNlYRTEpDZ8BwWzyQJqI51YOlXerQA7x3JLmtFMZvNr+RyGkMer4s32T7hnVkwiSdLkq6fbvpnQhafGr15PMVHD20tH+XL2ECm9TzdQ9+WZkKdlSxOlWlGmk4hbSpNkQAqg3qliaFuL0+ZDtRB4TSMriYRrgRKNz+RLpcPAlL05H2OAwCGbpprFyjvL8MoFr2W+bu2LdFDaSPqQp32fwBcCcim5Ym2TTgbf2DZMiTW2xgeK5NRHD3rGu0OSeL6/Hn8LAnhnih80nd4dkxO0uEqgQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767711372; c=relaxed/relaxed;
	bh=i5ZqWswtW6iqsdeNPzX7hUI8uvm/O8ALl+ZnG/DAlxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jo9/V4YBNqVEmTela4kMLEJCOANeSloEdTjsIxJ/K+20AqMaz9eLaBk3oL59d7GXwRXPzyu0JBRocmlRdeDON5sVE2eZjPxmV8TEU3SM+/9RZTURa6HBlTCPVC+229k4hIQHimUYvXdqb3czLUoGq8I0gtCWoW1qa7+AidwLyeS/GYFZta/TsgKmzPiKl4Jm82iEUwtDEABHn9/0TJ5Gip6IBYXnco0BiLr8IITDGKc6ZlS+TvcF4XZ/iHFEAkrhhvZUzjBaP4+BhOckrDntW5+K30QkoMo6fskXYueDt9c+QeMre3VsaDOExrsdkne4AkTe8uA8MfM2fTFfKcwKCA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=HJfK3w7a; dkim-atps=neutral; spf=pass (client-ip=40.107.130.23; helo=mrwpr03cu001.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=HJfK3w7a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.130.23; helo=mrwpr03cu001.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011023.outbound.protection.outlook.com [40.107.130.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlvPS0SxCz2xGY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 01:56:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g3qnMHMkwHbLX5kzJ9uVDW+Bqfw4S1MB/9xrnonBsDxrg0AjSoYbmqSR4gwFeTafNUHRwqtLZF5mJb0iGChKDKbkz5WmyZKfuex90Y4jGTG0IoUMoY5JyeAjUiVLiKSUCR8yI1M6a1Avq0eRQeaB8MaJwYPCT7rkjPleicR2WfTqyVp4JMKaU/0mmlwoQt3615NbadJ23Z74i88ugVtpXLDhZMwaYRKYQjyLp9Wxx0jLCjR/+l5XwyjC44DHdcyq84eNVpTjjK40JfHIlXfl2tu3XQAoCc5IXv4/wsX4a/NuCCrdEqgBsFmJyrioWMxWnet7s7rK7eLPPKuM2EFKvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5ZqWswtW6iqsdeNPzX7hUI8uvm/O8ALl+ZnG/DAlxo=;
 b=zAJKjoJR8MH5fTfHOJn7/FM0eFHyqRHTg3Kxqk+AqScD9ZvdPbKPTwgBca8+gESuO7FiroPhKSY124ovq+CkQagtoizg3A3d4ewS/RhglkU1Zj43bkOXutATe7LNJIyfxLV6fymrKnohxFta0IZ0MOTZApKZuJ3Vtc1Zm7pP+kxBqd1wcKrX74T/BxDTSIUwxPIruuY2hZD0t5qCwQ8BJiCUhChTUMGyPsYaS72lEJbP7IrDGZGQOXOiE1Ll5dvU8fvLMPLyJRt5D2Emji/t+WyEctnD0jpvYmPWcmqKh2+qyn7e6eyv32kQszBuin3pEXNTDrouYxLdqXVfUdmFig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5ZqWswtW6iqsdeNPzX7hUI8uvm/O8ALl+ZnG/DAlxo=;
 b=HJfK3w7aYhYH4085B9Lzm/e2PqMI766XjeYKJD1ADxQpj8fJXZGK+/h76f4CvEzXllp/EmvMlsVYX8Xgpx5Cg5En2e1J6rwLQvdqbwKTv0yWkdE7EBW7c95MM4YzFAItbwOok42fPdT6ckSmGs5XSDY7F7ytKof0gax0+g5A8Q8aWXSwh+UxAdTHMcXFqWtXuV6YY9e09XmeQp7JHCdqYhVkz0rHtmCJsmXKetkj02ybRjf6A/lgZjzEWODwqtAbmWzwHvaTzWBneqf5uYYfyLlbFds3oc2vLl3UybqzoOLQJ9Y4waUxDQKcIcceTaYDpI+/lh/ySpV8Qn0rG2rnJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PAWPR04MB9912.eurprd04.prod.outlook.com (2603:10a6:102:387::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Tue, 6 Jan
 2026 14:55:30 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 14:55:30 +0000
Date: Tue, 6 Jan 2026 09:55:16 -0500
From: Frank Li <Frank.li@nxp.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Russell King <linux@armlinux.org.uk>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 09/11] dmaengine: fsl_raid: Simplify with scoped for
 each OF child loop
Message-ID: <aV0iVJgmqevN5UPV@lizhi-Precision-Tower-5810>
References: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
 <20260106-of-for-each-compatible-scoped-v2-9-05eb948d91f2@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106-of-for-each-compatible-scoped-v2-9-05eb948d91f2@oss.qualcomm.com>
X-ClientProxiedBy: SJ0PR13CA0084.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::29) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PAWPR04MB9912:EE_
X-MS-Office365-Filtering-Correlation-Id: 0105b925-eb16-4304-335c-08de4d33a2bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|7416014|376014|52116014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mMHeYiHpw93GMKacRRHZjmkV7EO/ZTeufxvw6e24u1rnupnbRAel1G3bSUnq?=
 =?us-ascii?Q?UXf67YjKzx1TebtpyDOBlotb/gVA44UxojFTE51ZnLTdafbUf6S3+5yfGlWk?=
 =?us-ascii?Q?cCvaHhU9co9AxDwsTrQDWwkmlAXB3FGUR3qov5BQNEt25Yds9psvVuJwUqWV?=
 =?us-ascii?Q?N1uSwj/J8LS2E9sRaWyUCjSS65gLhh4GGqcyzLvYs1o6Wxh0uKaxFVKN+4WW?=
 =?us-ascii?Q?KTFkTzzBhHd4Fxpc4dMNk4Yw/WQDwOPxNxOh7fHs6+QjZXXgU7G+87r4k6q9?=
 =?us-ascii?Q?L3c/uFX71nvdDHHTvVKGQri9pkVW7FgQrvSS3eemTXUxei4uUi/yXO6wd1IX?=
 =?us-ascii?Q?Pu3A/yAv6W72NfpaYQVMneNfwVyZSLhPiFxtoZowdXhp36rMoNo8QNhQ0dw8?=
 =?us-ascii?Q?MZ9yocPW0DrZcdgFwhMxkElldyYtgOcx/qaU8P7H/ynDffkL2j/99iMODENv?=
 =?us-ascii?Q?pfgMtHVxkZTMYWegAe5+CfffImbiAuE/QEWq0W9fcY/vdMTANcHD6GDSO4Ow?=
 =?us-ascii?Q?4M6cLYqQq5wHLJCY1UmIzH00e6M4KIljXK6tL2gga5lYJgQHe23mjobPk540?=
 =?us-ascii?Q?ExeW5CSI+bCIJrPjVq7UwVvAycpdxav64NjISn43om+x7AfcKrNAz5vQ/52E?=
 =?us-ascii?Q?YW+z21KRABgXXOuXoCC93ZLtjBstNObJ64tE58Y8lN5W8lXX+AGbKvJbv/Av?=
 =?us-ascii?Q?GIwnTJuepKfRFKxCUKh+YtA00U/b8h3Nj6rN/r7V18nS24sLB+UQSi1MOK7H?=
 =?us-ascii?Q?W7JPrb7ldIJQuBm1dfZWsMGvoOB3HPpKt1qgJgbIA475Zbgz9QYlpeP5AmWY?=
 =?us-ascii?Q?J/1ftWG+JrjrWPeUugxwRBgCU2bG3cNoHwKhcNfD+H7N/NtzEMCQ2H7wgPjJ?=
 =?us-ascii?Q?+3x6h+3Y5delpqt3c4f2K07Qn+jhfQk3HoCeD/1VJdwSsahU2MNu20FUCVtw?=
 =?us-ascii?Q?9OTsjkUYow4Ja6Lt4NKaDphmQDIgfJ91ljgLTNslsfB9wRz4ishh7NAKkcK5?=
 =?us-ascii?Q?br9dAGM7lZqL7/mMpnZN34PJKR/YeVGo15rS4hfvx4iazpExFCyHVoxwF3Rj?=
 =?us-ascii?Q?wEpnSV4sfdZ21VgVJGiA1dYnmE5MA6dKZZeEWBPurL3Bvm72NK+TfV6rS5fz?=
 =?us-ascii?Q?mjCxrCOzOoaXvV4Bpl9qtfOn5Xk+PW0oLJm2WOtLUg4BRzmbG94xtAM39J9K?=
 =?us-ascii?Q?Nrtv3nmQ5DiBc7esUqAnIIl3W7826VVZGKdpctImxs1+ch0nrPKrsYQKdI41?=
 =?us-ascii?Q?r3KYiANMVtFd3xD1hjPnEOxfmqU+IzEmG2WeuisGIqPvGlllMSQoJAYweU98?=
 =?us-ascii?Q?hHmNe4RrskUwwf1Iu9ODZjq8M05GYdBlgsLXi9lbh2wo4TzUIcmxL4Q3g5+k?=
 =?us-ascii?Q?x+xRQfSdgiWm1DOS3JPXBoeXz8p6MdQc61YEeJnxWoeWZTkDwxXxyx1/iIzm?=
 =?us-ascii?Q?pacAojhzS8xsCM7e//r+9zgFo0xIn9PCNs5DZFh6m6pZH1PYfksD/sflUBOI?=
 =?us-ascii?Q?dAENnicX4JswbxlzAWK+WVe6kRXjQ6hpteLt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(7416014)(376014)(52116014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tLSsCQRBAFL3PEzxRzXBJuMYo79msNOtlyNcen7JFncTSOXnrX6QCSzDRk1B?=
 =?us-ascii?Q?sqQCet9ba3/x2pxPIw4r2/65e1KD3k53Zj2GIhUBg5dmevEZa5SGVoiDZaTk?=
 =?us-ascii?Q?4VAHlXQ5oHA5d8giA+xzuirYSJ5IQ1iH5AcwJWhRScFHcfamEki5XWK8se9Z?=
 =?us-ascii?Q?yLlFo3FVAD8As5tN76lAOG2manHZ6ELSi6OHwGEDbMrbIkbEQ8WoKWFnrKUe?=
 =?us-ascii?Q?qxiBEBwbhIiP/qq9cjC4wFbbTKc3fbNvMi8niOTYRoCqWPJd2Wqdzp2kvNJ2?=
 =?us-ascii?Q?QdzkAHJLJZ4LxAl1bdhYe0eGEo6QTf3MdyOIJ+2bt1a7nqbURAGeZ1iTQz3a?=
 =?us-ascii?Q?eWRAgBlLdZHQOby95jdyu0FAoXPkypMr372f2RFQ09pXoCDU4429uiD8zq/s?=
 =?us-ascii?Q?bspmb32YmyBvzHhIY3EKMBMKhBpIPjk/eOkRp5kuQ+kh5Cl2bCh+UgtZyEvc?=
 =?us-ascii?Q?Os5Ywu9zxXiwUmB6jouSB8YWbK1mNUavQUHfnweMUZldVQsI+/zU+UbZa2+s?=
 =?us-ascii?Q?pbsyO/NPbTOJ1X/wHAYMi/D5XO83xklIyz7g5aXPfyr+cEvzFYqNSDuYMyEl?=
 =?us-ascii?Q?Zcywkrf2Jjwm3gnmaIN8qBCSUDM66V1dNPKQ898HFZV9BUEbO+Giu5X38n40?=
 =?us-ascii?Q?OCuUa1Zh5J/gTsD69XAIpik2zqmwjuLzf8oPwiPPmaKwq5wZWY1EpRSjR2yN?=
 =?us-ascii?Q?jzRhcWS9uab/z2cs+Az/I9k+4t5n21y019r0oMUl5HEkfVaiX4jLq7RV4Ekc?=
 =?us-ascii?Q?fJQBOKztEYVLhtdNS9nRyhV4A18VBHd8IcxjTmMopDOerU/lG5j3TDnuXI/e?=
 =?us-ascii?Q?JAofO0sSiwczMX+buKuPfxfOyEx58qhFD+DLpi/Udkd1y3tktDIAZikjvq9d?=
 =?us-ascii?Q?Cvmdy5OqgeLtMbZ2NmZ2P77oMKRGEEJreg43PGeriS2fFH+10R6P8Ve43QgZ?=
 =?us-ascii?Q?QntqDq7roel7SoXqBRwR97s1+eQTawj0fMv27PI1U/Hf1aYq8mAtmVzwrQ3+?=
 =?us-ascii?Q?4JjesTBX48TrUmJ5ohNLhICSgeHzp6LmZKPJSZUHW7DXBcxXbKpE1Hc37Ld4?=
 =?us-ascii?Q?0qms0WB+ukeHAGlDbrIKt8THGu+XMFNTP7aZWwTuwcbyh+eVPwe07ni3N/Sy?=
 =?us-ascii?Q?ygOVIyTyBs4HGkrk4fnDSx+JoeyA9pIaRtqqThpF+wscExLQALmgJi3G/O5b?=
 =?us-ascii?Q?B5OLvjdedCgU2AFjJUCgixvi4/P47534yqeXdd7mmyxiK2Kv+TQRjHzF3K/J?=
 =?us-ascii?Q?1SiRb6zLQzRE71VKFE2h0MJnVt8hBbX1rYdKM0vKpnVhvemdDeNDj92Eojvo?=
 =?us-ascii?Q?sOW7g9rQKCdpFIPFjzQWPHW7ytFtzdx0NiGNq2RNDtcrwX2+DCXws66cPXIa?=
 =?us-ascii?Q?BYiAHW2ik99lVXO16llpx2lmM4EBTyFOHJ3tAvVsM9dbW3hhwE5vKIRBaJ2a?=
 =?us-ascii?Q?ZZ9ioGFaDpITw+9o889grlIg+KzPhdkibltQNaNQQk2gEXpUFckEwPV6WhNd?=
 =?us-ascii?Q?XEvQ7lu9/798fJO3XU4wIv/61GF85kp5I8bUv2AlBk2NxbVSENbEJAttkeIv?=
 =?us-ascii?Q?9OM4j0ui74poYO7z3a57U/NS2KYXRpzLCoire9TiM4t+wC37EGvbhi4ru721?=
 =?us-ascii?Q?f39/hEb1uLfuu4BrvmoaK30HSggHk2NKYNWnZLJlA8jzixPLz2w9b4DRhYAP?=
 =?us-ascii?Q?XQH0KY/pr0NTjScfr7qSf57ZkDKC/2OlSQGxZjIwB4Tnylq8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0105b925-eb16-4304-335c-08de4d33a2bd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 14:55:30.3581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rEtPzRynVQYz9WRrx2THejGeL4sNBSpM+Io+24ISyy4yaHolnQzxiFH2IYuaro3Id+kEfpUULhsw4sF4MYRCVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9912
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jan 06, 2026 at 10:15:19AM +0100, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> ---
>
> Depends on the first patch.
> ---
>  drivers/dma/fsl_raid.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index 6aa97e258a55..6e6d7e0e475e 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -746,7 +746,6 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
>  static int fsl_re_probe(struct platform_device *ofdev)
>  {
>  	struct fsl_re_drv_private *re_priv;
> -	struct device_node *np;
>  	struct device_node *child;
>  	u32 off;
>  	u8 ridx = 0;
> @@ -823,11 +822,10 @@ static int fsl_re_probe(struct platform_device *ofdev)
>  	dev_set_drvdata(dev, re_priv);
>
>  	/* Parse Device tree to find out the total number of JQs present */
> -	for_each_compatible_node(np, NULL, "fsl,raideng-v1.0-job-queue") {
> +	for_each_compatible_node_scoped(np, NULL, "fsl,raideng-v1.0-job-queue") {
>  		rc = of_property_read_u32(np, "reg", &off);
>  		if (rc) {
>  			dev_err(dev, "Reg property not found in JQ node\n");
> -			of_node_put(np);
>  			return -ENODEV;
>  		}
>  		/* Find out the Job Rings present under each JQ */
>
> --
> 2.51.0
>

