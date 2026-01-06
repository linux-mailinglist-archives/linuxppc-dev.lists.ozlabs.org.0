Return-Path: <linuxppc-dev+bounces-15328-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2B2CF8E70
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 15:54:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlvN15TXnz2xLR;
	Wed, 07 Jan 2026 01:54:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.72.71 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767711297;
	cv=pass; b=nqT1ikHLsreY9lO8hFq7xD6++HkR3lAAwZRZJvG3ithsK9OpWxlfGCr2rX1ZqdLdkTtNANdUGHEv48OaG0KUAgrsaX0G+Jpjx3RbGx0XzfQ73QnqtCovG729sIeeMt7dZQCtgt2TV3/DwunB4lRvEBooU84rJIkwdcDAXVO3PopF4Tr4jOI2CgNU/j15wConiv3ubcUIgboXOn40YPnAK0wsUEaQoxykMZRdsla3NcqJS4BPMVntpfO+Qp3Yi15Pd2nJp1LwDlvbik8mrGrw/B2S2Op8YkBkMGcAzRUjndIqudHry1b7+oC+Mp2h+2v3FdPIYeYZJ9RRyQLA+yCCKA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767711297; c=relaxed/relaxed;
	bh=1hDdH1nu5arQYKvg2xWz+eTPsfNJIvS8YOlNjVUI5CI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WlAj6lLYl2W3NIqrozAFMPCUrS1b2Wm0p8IkoeGtSksDCzFVYpBAVckwei9bx19oaUY9aCUeyqrXwV6nPVBdK3MmWXNUASl8L04L0gu9ClJErg8u24/makyWVgGwMCJ4Ii+VMfThr1oBsY/0klacDMiPcPPWPzGc51HJ/m1FIZkeGjMGkI/PqIOtjq2mzerauvWcxE/mxivEaKUsQZ0imWd2o9cwk5cnmsCF7Nn5UacULpix1LAfeo/sybxa4/mnYHANPOs+mNMiWw6y2//vJL5VZwnMAhtGydtsIi3IhqVXA7oiQmXfyM/T28R15Heq77rqzgtgPO3E2gHXAdBPtA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=LC72UMxW; dkim-atps=neutral; spf=pass (client-ip=52.101.72.71; helo=am0pr02cu008.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=LC72UMxW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=52.101.72.71; helo=am0pr02cu008.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013071.outbound.protection.outlook.com [52.101.72.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlvN02zDdz2xGY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 01:54:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DB59Dc+NzpwOrQpN7K5WwWaD7QxQ6kMJoBeFcNAFkE6nMJ9ZrOacCiy3Dn134v3QUJFb1D9rwgu1krLqpbTMYODMIbbMfLZgIdO7XnAgBhto8cf2abAHQTQwzsCz0ixu17T9l8o6/v9KvUO1bQgs63cP/KgvTfVFCBsyti1M0lklrNV2wY2KAYvycxdvGFSzaAGZsmgHmZvlqZdFS04pAYJj4ss8t/0WPIxIRCdYbGDy/+4us31r553hm9AZvKV/YmvstvEHd0MLD6H14Yui8JskU51Y22ssFleTM8wU5ugmsGtZG/+b0o+llNVAA6l54C616RwsufWGuatAbXl9lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hDdH1nu5arQYKvg2xWz+eTPsfNJIvS8YOlNjVUI5CI=;
 b=y1sLd9A1tk7+kkGRUYlHFkxFYBBWDmw3E3BTuCCA1rEpRaGhQL4ApYXoxsrQ5WE7bYl/lP/Uhw5s0rMwBWW1GGhSlCh19QXxYtI682t/d/airwFbK/wt7sBG5+YG5sjTv9Qr7LeA6YvtSkm0GmQUDXqfnCEJfoUWLnDe0tmlD9niV+rkBYm2ylN5ybTE00fa0C9gYczQeWPubmYdTRZjPCWot/JfAs5t0Ek+RqtmZFnEtOUbnOzlAIPlNgDik7M+d0IgSfTWwL1G6dzzh+IygWLNr7wJnHrL7GNz5mcMOhpwfHV3zmQoT9t7w//JQcnVInoLRjCg0GbPWHRRWvJ6zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hDdH1nu5arQYKvg2xWz+eTPsfNJIvS8YOlNjVUI5CI=;
 b=LC72UMxWorV8ZN/pQBMl1KJzTHQ1PdTOR9VCygXnkqPmp2f7Y7FBVFTKeVFmiamKyuYHjMPplYcS0Gedajh+vNhPmC8YHuRcSpaH5vQQaOFgXsxPy6tka8rhhHa2tOlVZ+pxPBFFve0z/PU/pBsk/ND4gyM7ia/tgG9T9nQ6HmWQX88tEc5Rqvwb8eyfYDkgMi9yD+htdDyPYxE+1INhx1cVnBWvIMfU6ZgqGDtIQUJ84FMGBGjhTeN74ZXZgPPqtQ73x66avGD5+s8rLRs2o5qpmpJp6fpl9457BBO1Fle2Ao3wh8qeYp5T9j9lCJf0ppjWzAZ/1aJVjieEvfasJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AS1PR04MB9333.eurprd04.prod.outlook.com (2603:10a6:20b:4df::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 14:54:14 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 14:54:14 +0000
Date: Tue, 6 Jan 2026 09:54:00 -0500
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
Subject: Re: [PATCH v2 07/11] clk: imx: imx27: Simplify with scoped for each
 OF child loop
Message-ID: <aV0iCGjODqJI5F5U@lizhi-Precision-Tower-5810>
References: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
 <20260106-of-for-each-compatible-scoped-v2-7-05eb948d91f2@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106-of-for-each-compatible-scoped-v2-7-05eb948d91f2@oss.qualcomm.com>
X-ClientProxiedBy: BYAPR07CA0038.namprd07.prod.outlook.com
 (2603:10b6:a03:60::15) To DU2PR04MB8951.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AS1PR04MB9333:EE_
X-MS-Office365-Filtering-Correlation-Id: f076a4b1-7815-4f38-51b8-08de4d337558
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|7416014|376014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3l223IbWcfeLB/rL9w7WKDhPNDwGQkHUqBkTKbjUGTXK3zXmL0qgkc5tJSnK?=
 =?us-ascii?Q?wo9qbvgUvnUZLTF0WJVlGcqQuZSpB+ki3/62eOqwMjSwqZcoP3HCNYvSsNeb?=
 =?us-ascii?Q?XbHg73uBbdZFfEHETb8m3XL/Cnn9r1uLm2W9Vw9396QdJJOHQo3fQ3aUSNOQ?=
 =?us-ascii?Q?GUBVXcAQamgojTs0xro4vbr+K77csbwXHwKM8TXvi1mtvXmkrVaRAFrcULdA?=
 =?us-ascii?Q?Yz++L1iEyFB1xOW9O4XNXDsJMFthmE6ybY9zSRwDZDrC9upRiVzMvyCCD2jp?=
 =?us-ascii?Q?Fjncqi260512pmaS8OzJ/dynCZBtVSfYj5mActYF0crfOVGi7Y9IcgZNWM/8?=
 =?us-ascii?Q?3CvGma+ZvaI8tnVoUFFF5Ghj9Bs43gjmWt6yqwd3PyUMX/RbDcLMTtEJ4WLw?=
 =?us-ascii?Q?fIICH3wRboFbJQW46r+i2trkg26jGJDsE4k6gP80AZCQ6ddrS4ktC/ZYdrJp?=
 =?us-ascii?Q?D4gT1BZyXLPkV9J/Ek+kkqYhBW7psaRHfkb0CGFYTOUB/Mzh39e3g36qNs2X?=
 =?us-ascii?Q?XWxDQ0G6aR2c4OyqpjkhSfNuNRx39bonwZKNukYfR1hMdcUwRDVB9FBp2J9b?=
 =?us-ascii?Q?vo5FSKFMrkKDCD9TeAxrnG6YclxR4VP1xoS2DjjBryiqpPpw7F46XQN4vzb5?=
 =?us-ascii?Q?+hCZT3gTjlgqTq+68VgeXxUWUMEzpJ7jWxYmVmGfDDWfi8k3z/Xf7gFB79O6?=
 =?us-ascii?Q?WU5tInmXwYTsHci990QbtX7MphfAfh9kfy7pxOmwPSwHXZbzoN7q1Fabo38i?=
 =?us-ascii?Q?XfDBdxCIvUUuIcMTpd3dg9hX4g3S/7OcK06uAANqF9hlzeYYzr/Nlyf09DtY?=
 =?us-ascii?Q?89bN9ADzIMO3xtjgIBEsz7sJx/8jlKUj3ELzQyi5sulb/mEQqe+9Qtzs1s/s?=
 =?us-ascii?Q?58qgoArdJkMaWlB/v2wsugIS1fYL/8TNY8jqVFYrTWeWPI8O9VYUIC65bo7/?=
 =?us-ascii?Q?bxFs6OQZANcg/z1Rl7P39CnHGCbdrDWeTGGTjZAelmkzXJaQvGtp7XGMMNuR?=
 =?us-ascii?Q?jvJ9X2K9fAOg54iJYtZFmeuoVu4jBNH19gQ/QoTyfcwZVVUgXdUh29reRC1a?=
 =?us-ascii?Q?/ByxO6CQ1fCVXGYD+mnypnW54xdwoyKhjuMCGnZwe6Yi5R5G7AgulK3+eOGp?=
 =?us-ascii?Q?ZY9caDwVaRwsT1zHg/T179U3Nf7sF/TvvW7Ujt8z1XgWXzlHJzM8XZM9JTtj?=
 =?us-ascii?Q?DqN2Y4knNuvs2kYS37H+Emk5sVNLQHVnHgtcSV9Hyhepj8/rV99mE/gFIlho?=
 =?us-ascii?Q?uT3/wlSw58DGwf6Ti/YRKQyE3SwXZjNd+hbw0GHh/2YWUpKLcX7fi6BnwsBT?=
 =?us-ascii?Q?8QVM93WAc9x7AyFP5mJwC0DLCeowOrcfOFLhd1kmFb67ReXwzPzyxKOlHlQh?=
 =?us-ascii?Q?OMwS/u97B9n+0l0kliQt1T9abRvI/QRxL+3YWYQa4fkdcL8i5x38oWjFu69w?=
 =?us-ascii?Q?Sm9soaPzH3oGpXcjjV9dZI0NDzQBVkv7HlrOPUuBxKCwG4xuZQUuFVdybAPs?=
 =?us-ascii?Q?qLWxbWmP1awtQiooo+LrALaBh+oHhjQvIe1I?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DKql+K3RO2qkLqbE0siTOvCdTn00z4GcG5Hxb0hm9Tpoqc0+sAdYC5rjW+uV?=
 =?us-ascii?Q?ifQTLG9UZVBiwKIARP7pi0IGs3XWgn9CmpOUkkJxh/2mdOYk8fwc/2IIaeOY?=
 =?us-ascii?Q?SrMnMdDIBZGtBoEPLshHdYDf535v/ALekiZzYTSfcMpaiE/3Gax5z0q1e9Uz?=
 =?us-ascii?Q?ti3fBDnieHXnmGv2tNhj6yqATY3welxmqV4qavtoAUNsz60VfAvsQUJJkvpP?=
 =?us-ascii?Q?F7qLQYdKRBzzjcw23v2gtyHZYjbAdaDfTfLanQffYF2PKWOgr0Gk1zPnjCXX?=
 =?us-ascii?Q?nvc2+xDS1QcTFHnKbwTbcdxA4B7yFIOGGEKqMC8mP0pToRzuBFfiUsz/6b8n?=
 =?us-ascii?Q?l+NtXtEFYU0rxVlGhh0wyZjg9PCaHU9DPovTLVU2iBgt/9/ZNVtUeXk6NH25?=
 =?us-ascii?Q?86jPJH6fon2b1refgRH1S1fOaZtD7IsfVqXlUO5idCLGYp/bN0HOznFmc8ch?=
 =?us-ascii?Q?r1VGE7N2i9j8SV5M0k5oxft9KnxgOinVBgkscxFR84Wc+FAbEERxOUfWmZ+J?=
 =?us-ascii?Q?RQ6UjlJ5s2c3MhaKh3zu3S/OuYeSUw+iR5SA+AE0Khsb+75Q8GUlejFJTpsW?=
 =?us-ascii?Q?EYGr+myHlmwBWcH0SXrkrLsGEb7enu2tUSuScyytANa2ikuiLW/d6Dltn9Hd?=
 =?us-ascii?Q?agOeXtKnzPFNVLj8Am0veO5tzZk22xrKxvP3CtKptswtfO7cdo21e8cO8jTH?=
 =?us-ascii?Q?2qOUOxsWhVwbdFRQKEdOKAiRfn8Pd545GfXMth0GsXeNZxYuDFrutCa6XqAV?=
 =?us-ascii?Q?Wt3P00boarvrnreWMZePMn+zp+s5LoBzmKl3es4d3ffTjvccu6v2/BoAhrvW?=
 =?us-ascii?Q?Pwgphc3MCa5XMO4z0iukVCa9uQLVth0RIDQOMjWPi85ePlSlLzFQo40lR64G?=
 =?us-ascii?Q?ge3vU+L4xBGkfHr8WqByeQprtiwkGoAGzOKucx31ND7Y4AvZK+P4CirEzkUW?=
 =?us-ascii?Q?XF/6wrGmPaUOlD8lEWmOEP8YtLs4dgHu6hPT+06kOghYZtYpWbtAWjkKfLNq?=
 =?us-ascii?Q?ksMpXQgOzS9nonV+3IzzHlCPaQU7KmGsK6W5yEggDzgKz+76lHBZAjY9nQKa?=
 =?us-ascii?Q?YAr9T2u1R8SfYqeFQ75hB5oU4hSdPWXRdUhVkRZd9xiMA5XGM84Dbon+GEyr?=
 =?us-ascii?Q?iKQFG4G1UL3PYFhNwthH7eEgQjE5mfv5DDT0uX+ZxfpSxB8/6Cc58gs8oqPw?=
 =?us-ascii?Q?IIu/qnNhZIc9IC6RF913wYq2bFIch6zqULNgWNgyTRanNFVEsR/j8IQvnz8a?=
 =?us-ascii?Q?+J1zWeSisDOsRCQlsV++qVAYCgQ4q6cFMQxAqY0kK6fbqxJY1U+URrv/Ev1z?=
 =?us-ascii?Q?rrEHzV1UfjJvMEQjrzg9BCkFHaTGRxYfivIwRPsDqHA3mFhzDEDTmAUblood?=
 =?us-ascii?Q?aVrrbuvAQLzpfZDJoRYbs8Cl8G4AZNqgh9/m8yOKci1SiPYxvdDgraiqFpNB?=
 =?us-ascii?Q?cqPVvq3ZQuLqkGNnuEu4pMUGejFDfgpyR5hRP2H3bYv/tsmiGtLY3spfuHDT?=
 =?us-ascii?Q?Uuu0inQf+7uXIZ8OPEb3+5+Y8qnzXkFA66NbJ++aGe2x3XGMWzh5Z1kEaY5c?=
 =?us-ascii?Q?EO5qDU5UQMfJBrehlGfVoGRA6eMT570U1W+WIUCS72LahoaoWJxaNn+LJMJB?=
 =?us-ascii?Q?r3CRyxv0KWELIN6BSPsNmx/88paONNJVVsinYvvNG9l7Sn1ms4A9RD28hM8j?=
 =?us-ascii?Q?NrZx3ZJtmuasVJdTw2y/kT2JDYXsmQxh+RSKTj2oRdpyfLfF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f076a4b1-7815-4f38-51b8-08de4d337558
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 14:54:14.1939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pr8KLBxxGK0fupajo5m50geFyijAeUfJJa2W55y1q0jsMRsem15SpbYYN9oThVEIQcaBT9BQhITAZOrp4X22tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9333
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jan 06, 2026 at 10:15:17AM +0100, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>
> Depends on first patch.
> ---
>  drivers/clk/imx/clk-imx27.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/imx/clk-imx27.c b/drivers/clk/imx/clk-imx27.c
> index 99618ded0939..f2f0d3fe5c52 100644
> --- a/drivers/clk/imx/clk-imx27.c
> +++ b/drivers/clk/imx/clk-imx27.c
> @@ -171,17 +171,14 @@ static void __init _mx27_clocks_init(unsigned long fref)
>
>  static void __init mx27_clocks_init_dt(struct device_node *np)
>  {
> -	struct device_node *refnp;
>  	u32 fref = 26000000; /* default */
>
> -	for_each_compatible_node(refnp, NULL, "fixed-clock") {
> +	for_each_compatible_node_scoped(refnp, NULL, "fixed-clock") {
>  		if (!of_device_is_compatible(refnp, "fsl,imx-osc26m"))
>  			continue;
>
> -		if (!of_property_read_u32(refnp, "clock-frequency", &fref)) {
> -			of_node_put(refnp);
> +		if (!of_property_read_u32(refnp, "clock-frequency", &fref))
>  			break;
> -		}
>  	}
>
>  	ccm = of_iomap(np, 0);
>
> --
> 2.51.0
>

