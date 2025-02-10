Return-Path: <linuxppc-dev+bounces-6057-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F41EDA2F8F9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 20:39:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YsFJz5NXqz30Vf;
	Tue, 11 Feb 2025 06:39:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip="2a01:111:f403:2612::631"
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739216387;
	cv=fail; b=YvOdkOo/c+TlkUPMyWHNcJ1n5J8fpvHQivGuogjdj5RaNTc4UDSaa4zaJ6YPg3DRfXfAgYub+Jp/ETYLM35/xPD+d2d2870jC5feTDiAVIuTR/k1KdODX1EEXUALEfI/PSNkiCX/CxQyqE+wIIUbjfaGWcfUvKya3gF0USyzC6hJPfyp4Q4OIhs+aZX2cqCbw6VepFLLIfLY3N9ahVsgk0lBo0pDr8qtvT09/sFGFQB5eaIiurajvCBYPBHEXewKsBaMZ/qIZMnt8EKBUipcySvLsPlqqJVXtFxEae1Y+PRs4MzY8tenVyK9MKkBj5zTYh2HMxNc6m8bKkAoX8UXwA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739216387; c=relaxed/relaxed;
	bh=VTHW8RZr9iw8f/Bd/6ihKdwVYunVUAL5m1W5+eJ6LS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cyFjmkG8VNF4l6SinOegOMYNIVn/swPrM6rMMLAHX/PZx5ASgBKnkXhCLJiM89FwqhbgHP0dDEheGNcBBKWPl+PzW7gxnHmRflWrFZ5Bb7psmQUg6FyCSjm81ioytXX8HuyNZuejZDH5lNXDb8t7X6lUAeUDJaoIqdAyeqbVtlOZh+12EdwR7PxxZCyQJQ9lVBAK9sFZvSqWTtbVkEdrFrJOnVkEhIlkTsa2dNjqNS371qQ4MMzgjcdn1P5EM55EFt8g/CnzJifOpKWtZzjhCKHM51SgB1wvVjarzcSQwJfwoYn3PAQWxBmHfZpfReDOAS7Uyl3xQ+bozWmbY/Lm7Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=nxp.com; dkim=fail (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=cVWl0KC+ reason="signature verification failed"; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2612::631; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=cVWl0KC+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::631; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20631.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YsFJy5fgVz30VZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2025 06:39:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iAJpQ+2GjJJj0n1zqNUXSkOkUennzMxS6gF5iOgSLELEo2dDA+GqCsWyKBUBbvmjA+FosGF/mWshuMWARIIMpy+suK4MD6ZrB0+uABMy3ivSRVqZQ+3H+HVxS4GtrkleUel7puJ6/sIG7rOZYw4zqAuEWcrTp9zludI54JPuYMkeS5l9XSZy1dSK6ohqokcl9jvlV62A/7scoRkuGeEyGQgzzeF0PDcBXM0rHJWPZheG3sA0fsF9i1HFFy6GwfobHV4jUnqj4R7/Thc5Z95vAHXYUxOWJR5ytnzIFJZVkwS7awZMii1LeDNV6m6cXomKSnVEb6nv4WikPJ801rJHrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAmwXK8s2ViFQmlIUMzFtDUrgM6KezMlhSGOuLiVbQE=;
 b=pBKWSGke4Rez57EuVexYl14f/335/OO3qBheGPirbDVRC0zjI/eZvSUCjdeVJtNnIcLKbdXPMra8hNyWenWbp2Hl/fs0c5Gatnf+ucbt+cth7Y8D4Gq86w5pWlZ2jDCuAA2XeuH/8BIGc3l8TwRY17naw6kKq3JZK3R+c2CVHs23rsTRss4K3pAynutIytBz8C+GgKdez2LMAtko+GORTwBo2ol8NW55q6aQCxM6DhxmGr4PMOc+pkYrmY6YoVLg1yyJ//hGe3ySUTZZBQAWkhXnuN+rSyPYcmh2irG3trfcnQk1JuT2Qt1czCEFHFhmNjq2mb20j8NG2T8wI1AUnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAmwXK8s2ViFQmlIUMzFtDUrgM6KezMlhSGOuLiVbQE=;
 b=cVWl0KC+MxY1/HfspmyAtzgqj+yRGWu+dLLmZl3v/glIHoov1ulS8hjgD1UEA7APf2jxMuIbTcCKY42m5/Z5Wji72y3TwSWhvsg700iyqKKoH6VgtwFdZETvYAtelhNjds2wSu2yyCXnY3PL1JBQUcX2W6qm3F1SMBPXLTWDHxk5tsXMy02eCYXGcfm60ZfNgig5QrMUpMTaodQyuHY5uAIc8LUGtiZpA55aERFKVszIZQ49XvPlAe6CI5XPuYSMvAbbevXOG0/IQg6y6EN2D5k5i4Yjq4mFdI1WW52p/2yutSW8o7S3WkzKwAgwq4jrEHqORHMOOVgRrQBgMo9FnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB8122.eurprd04.prod.outlook.com (2603:10a6:10:25d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Mon, 10 Feb
 2025 19:39:27 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 19:39:27 +0000
Date: Mon, 10 Feb 2025 14:39:13 -0500
From: Frank Li <Frank.li@nxp.com>
To: j.ne@posteo.net
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk@kernel.org>, imx@lists.linux.dev,
	Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, Lee Jones <lee@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 05/12] dt-bindings: dma: Convert fsl,elo*-dma to YAML
Message-ID: <Z6pV4eauZj75+911@lizhi-Precision-Tower-5810>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-5-8137b0c42526@posteo.net>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250207-ppcyaml-v2-5-8137b0c42526@posteo.net>
X-ClientProxiedBy: BY3PR05CA0048.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::23) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
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
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a9a187b-6804-4a4d-74cc-08dd4a0aa174
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|1800799024|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?Z13eRVXqqrGBb+B2ovc8EN0jGjelZdXbNvTd3IgA2CMlD8AYbXJByqwOVJ?=
 =?iso-8859-1?Q?RamfIeWgVCZTUreTLloUYwEECqlnZ9Y6Ww6uRNJEf2FgjVZw6NCaKjYPcO?=
 =?iso-8859-1?Q?HUf7yPNdSaGhsb2OxYA6UIFw8mF5c5RX5cAMEatUkICzpiKvW1OgXvW8T8?=
 =?iso-8859-1?Q?aM2wEvFJkBQiVHZHanzD0T/IDhX8A0P86HFhT/a7Vlj/kHTPqN1lEgBeYs?=
 =?iso-8859-1?Q?4rRasMFATgO8DedovYkDW8HoMhdTH6Zb2kJu/W/TCr5wGWpqJbIofLBcwy?=
 =?iso-8859-1?Q?UHqrJ1TE72zbyGJoIvv+y278a+Chc5hqtOhVL158haHGLXNXMffghimhZF?=
 =?iso-8859-1?Q?0q/Oo65O4ymQ78lFMnsxlNjwj+p2Q8GNJBdNpDJGOPfE4UaZzU/T4sV3DO?=
 =?iso-8859-1?Q?LGwna3THjdu+Zw62Im2tjio6xED0jZaTJ5jfnr6hJmpsP2I3Bv2sYQy1uB?=
 =?iso-8859-1?Q?VofFUYMhAJlPnnRAXLJO20ZxyjNyBBIjwQ7echfaURVCtqwONL38VyRijD?=
 =?iso-8859-1?Q?xUS13lGa1veA13mmj35d1FVw77Itk/thrlZGx4udG2qIYeTy52xOg0FGfi?=
 =?iso-8859-1?Q?ZCJblRTMJe086NrjF0mkHXdE2hVRe4CM0Nn179jxz9QUYfzwebIaqZaJXu?=
 =?iso-8859-1?Q?5C2LI4gSbXX5tzQFOOyKzjgKw7HfSurLZr6YpauH1J121UiFxdDuGmK7ka?=
 =?iso-8859-1?Q?FRjg4sSokGJ8AQKFroLWIKRkOJt6iYgDCdkmeLuIP2zeLY6QRAh2XJuvbC?=
 =?iso-8859-1?Q?uXv/1nGwyp4DInmmourPFyutcOZOEO8UoTvA+0PbZNt3zK2+Q6lkCLztpi?=
 =?iso-8859-1?Q?8o9wRlpm9giH5u/TvJlN+6+StBhZJIk7unTC4w45QP+Qfn/UUhCvLo9H4U?=
 =?iso-8859-1?Q?1x2q3FyzdoQfqug2QGMEinX5veHDHkSImBV92reNAh/p8HqzNkePSS/Oeo?=
 =?iso-8859-1?Q?o2bmJronNk8d+dbEO3kDTewa8wMJ0CugtNgWkigwTD/2BgnKgyMpyESmM5?=
 =?iso-8859-1?Q?W/bodeuy+R1Lq++Yf8S33CQetkdDTgDbKn26DXXmDJRocTmOty166MXV2f?=
 =?iso-8859-1?Q?4f/Tk26kp6Dd5xS1et0qZUN963y7Zd+OqbHzb1bdjd0OUe7Lr+uDJzuuhI?=
 =?iso-8859-1?Q?cR6hcXEBX2jUPR2uU/XE8L0A/Q/DeIbqDEZZP6bHs1sIeiWcKUVeWmk4vJ?=
 =?iso-8859-1?Q?Lhri6VM7OKfw4LJJcp5JTu7jxMyiAFdTKnu0d0EFJ3vBYtNWyGWBtV630V?=
 =?iso-8859-1?Q?RYH18Z2P/iM45dWu63R7mBGZlg9OgTd95Icrrr5p2IUJs0kEER/oJcu86L?=
 =?iso-8859-1?Q?eVvRxiaYqOVLShXTHjPE74Hz69Z2PXkovRyhMKYGGeUgmPVxEgW1qQ4Pli?=
 =?iso-8859-1?Q?aA3wBmKczUwgnUIY6xim2PKEd9JnAu/GJpxgJVE697ZzTYMnEsuJIN7u4N?=
 =?iso-8859-1?Q?WlnPX39oKeWynIRs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(1800799024)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?TiK1F3ZA+N7z3JvoR1KuSdRVEXOvU/UJMDIy/TP0gzVJ6g/1uKKNXQpk3r?=
 =?iso-8859-1?Q?AV8fM12AO/cmTdNl3DXf6CAhoGaNvx+RrQQAdN12CTKo/rwkJTO9m34aPR?=
 =?iso-8859-1?Q?AUCbYD/NVo+Bc8ftDkBuRKyPMANUtpH3FkQK1VMiycvAwRt1H0vMl13Rt8?=
 =?iso-8859-1?Q?bNWGmOKbJJSXIKY0Twj3fL5P7/u8IECvZSy6ixafcDLDoW31ka3hkfRdfV?=
 =?iso-8859-1?Q?qGvFYcWFeOQvlh2i8kcQrcY5KkFRpmNTc8Jfa3G7si34fbJIU7nfpSm8Xt?=
 =?iso-8859-1?Q?GplVeavAw5ws3Fyvt39hVj8cirbX46E6vnI1I4ZW5SVC3QLubkCEPn4jQh?=
 =?iso-8859-1?Q?v9IS0sFqGjv+23gtVn70YaRj9vN0h2jqN3UhwuDUASAxtwKIzGZsnzkmbw?=
 =?iso-8859-1?Q?gkws5rSe4dTluUggq39NoY8LNrgx3nonV0pwnox10Ce1vf2hRA/spEqgAD?=
 =?iso-8859-1?Q?w+Qh5UYkSCi1MHds4nub10JucRyHGXXsHRErgg0oKaDtevmW/NxZQ7PzxT?=
 =?iso-8859-1?Q?sFGJuIHbnx+OvvlbaliuIAelrvtJ2PaUV9EqXzfeZGnCTCJDy/iZHHTmsT?=
 =?iso-8859-1?Q?jSin9VHqqUgJZPBcaj0EQ5ACcwbKfzIemb0av8UphJIbNgLE6rNKRoid7I?=
 =?iso-8859-1?Q?0xVl6U0QA3BSttFG0yPF+FVl6Z+XZLArVxnlVdF3srMNfn6gvmwG+lwQHs?=
 =?iso-8859-1?Q?1CUynWnGTasB87TPvV39dj2bjWlsTzICgVvwwDpo06ekgxshcpF2fIdLKs?=
 =?iso-8859-1?Q?mVg2m1f4AAZPpxGwtO7aJZ/GaCgmb6bxxd/BjNjwHr0dzZZQcu2UUgjuPX?=
 =?iso-8859-1?Q?EsPNlT0OzRV8kCGcIAww1PGiVV17F+PvjlWTuJZqNDW2tDb1GXcXwYhAL+?=
 =?iso-8859-1?Q?Dk6o3jBWv8WqdCbCV3o5DgZ/6pL+8GldB+Q7qs6lgWeMmSK4kWjroKQ05E?=
 =?iso-8859-1?Q?/hPh/vGvceaXbodHPCucwR9bKwCNCcYqzRAhy6RdKP7rfZV0ICv1xX6ghq?=
 =?iso-8859-1?Q?/4Z14WXW3y3meRQ2wTw/5JtlQamzCpSNpNPOXbH7wsd3fTlxlZrRd7Bp+u?=
 =?iso-8859-1?Q?mvgV3+5R5vQle0oNGyFSF12I8AgfLsn8f/Zy041ITEgbNQgtRNCuGHgztr?=
 =?iso-8859-1?Q?xUnFTMls7ZU2T/o/ZaNixaabcSGiZR5U5l4cO/po9mM/TEWa6U5iKiOKEg?=
 =?iso-8859-1?Q?53xBgIOaN9IZ0ZT8ff1xKD41EQ7J0iByMzo4FRTCt7H3sGO6MZPfACrRHl?=
 =?iso-8859-1?Q?/aHdz4a2pIhQgveEOdfp7D+kNfwOJKw4Bg+bO6hjV5jq1bCuhcdOXo27H7?=
 =?iso-8859-1?Q?EEoQ6eWX3iF57L/k7BgniYVIotRgDeV3bpkdwZHVxX81h8bEs7hnhGnWIj?=
 =?iso-8859-1?Q?sL+PeKpUjYSDiAWHMWFTnBvqtqWOGLiREW4sIyh84uJsMntgnimzTuDkCg?=
 =?iso-8859-1?Q?6HUGNBqhdP8GREq/gRYt62fhjJHA5aAejaVv3c/e95fSPb89nM882I+yrG?=
 =?iso-8859-1?Q?FJYwajMLWHPPVlZMYC5MhD9ttoxA4vk+fiIzIH8fqmaeMsxEshSZ9g7CFP?=
 =?iso-8859-1?Q?gWa+N9NkvYkMJJNXqneRfat/m2hd8YSdBpp9gv+u08QqaNerLiOv7tdCQ2?=
 =?iso-8859-1?Q?rIQCGAYInqqUVKQTUfTXd3ryrWgpZDOqYZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a9a187b-6804-4a4d-74cc-08dd4a0aa174
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 19:39:27.6968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xDbOgUH1H2xht5eGoiMgguOU8McRyV34gRLpnvirib3HBnmLpZiZdB0dythALSMWC8oYrbMuh8ZsBgeCGfR04w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8122
X-Spam-Status: No, score=1.6 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,FORGED_SPF_HELO,KHOP_HELO_FCRDNS,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Feb 07, 2025 at 10:30:22PM +0100, J. Neuschäfer via B4 Relay wrote:
> From: "J. Neuschäfer" <j.ne@posteo.net>
>
> The devicetree bindings for Freescale DMA engines have so far existed as
> a text file. This patch converts them to YAML, and specifies all the
> compatible strings currently in use in arch/powerpc/boot/dts.
>
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
>
> V2:
> - remove unnecessary multiline markers
> - fix additionalProperties to always be false
> - add description/maxItems to interrupts
> - add missing #address-cells/#size-cells properties
> - convert "Note on DMA channel compatible properties" to YAML by listing
>   fsl,ssi-dma-channel as a valid compatible value
> - fix property ordering in examples: compatible and reg come first
> - add missing newlines in examples
> - trim subject line (remove "bindings")
> ---
>  .../devicetree/bindings/dma/fsl,elo-dma.yaml       | 140 ++++++++++++++
>  .../devicetree/bindings/dma/fsl,elo3-dma.yaml      | 123 +++++++++++++
>  .../devicetree/bindings/dma/fsl,eloplus-dma.yaml   | 134 ++++++++++++++
>  .../devicetree/bindings/powerpc/fsl/dma.txt        | 204 ---------------------
>  4 files changed, 397 insertions(+), 204 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/dma/fsl,elo-dma.yaml b/Documentation/devicetree/bindings/dma/fsl,elo-dma.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..3d8be9973fb98891a73cb701c1f983a63f444837
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/fsl,elo-dma.yaml
> @@ -0,0 +1,140 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dma/fsl,elo-dma.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale Elo DMA Controller
> +
> +maintainers:
> +  - J. Neuschäfer <j.ne@posteo.net>
> +
> +description:
> +  This is a little-endian 4-channel DMA controller, used in Freescale mpc83xx
> +  series chips such as mpc8315, mpc8349, mpc8379 etc.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,mpc8313-dma
> +          - fsl,mpc8315-dma
> +          - fsl,mpc8323-dma
> +          - fsl,mpc8347-dma
> +          - fsl,mpc8349-dma
> +          - fsl,mpc8360-dma
> +          - fsl,mpc8377-dma
> +          - fsl,mpc8378-dma
> +          - fsl,mpc8379-dma
> +      - const: fsl,elo-dma
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      DMA General Status Register, i.e. DGSR which contains status for
> +      all the 4 DMA channels.

needn't maxItems
items:
  - description: DMA ...

> +
> +  cell-index:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Controller index. 0 for controller @ 0x8100.
> +
> +  ranges: true
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  interrupts:
> +    maxItems: 1
> +    description: Controller interrupt.

Needn't description because no any additional informaiton.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +patternProperties:
> +  "^dma-channel@.*$":
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      compatible:
> +        oneOf:
> +          # native DMA channel
> +          - items:
> +              - enum:
> +                  - fsl,mpc8315-dma-channel
> +                  - fsl,mpc8323-dma-channel
> +                  - fsl,mpc8347-dma-channel
> +                  - fsl,mpc8349-dma-channel
> +                  - fsl,mpc8360-dma-channel
> +                  - fsl,mpc8377-dma-channel
> +                  - fsl,mpc8378-dma-channel
> +                  - fsl,mpc8379-dma-channel
> +              - const: fsl,elo-dma-channel
> +
> +          # audio DMA channel, see fsl,ssi.yaml
> +          - const: fsl,ssi-dma-channel
> +
> +      reg:
> +        maxItems: 1
> +
> +      cell-index:
> +        description: DMA channel index starts at 0.
> +
> +      interrupts:
> +        maxItems: 1
> +        description:
> +          Per-channel interrupt. Only necessary if no controller interrupt has
> +          been provided.
> +
> +additionalProperties: false

Need ref to dma-common.yaml?

> +
> +examples:
> +  - |
> +    dma@82a8 {
> +        compatible = "fsl,mpc8349-dma", "fsl,elo-dma";
> +        reg = <0x82a8 4>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges = <0 0x8100 0x1a4>;
> +        interrupt-parent = <&ipic>;
> +        interrupts = <71 8>;
> +        cell-index = <0>;
> +
> +        dma-channel@0 {
> +            compatible = "fsl,mpc8349-dma-channel", "fsl,elo-dma-channel";
> +            reg = <0 0x80>;
> +            cell-index = <0>;
> +            interrupt-parent = <&ipic>;
> +            interrupts = <71 8>;

'8',  use predefine MACRO for irq type.

Frank

> +        };
> +
> +        dma-channel@80 {
> +            compatible = "fsl,mpc8349-dma-channel", "fsl,elo-dma-channel";
> +            reg = <0x80 0x80>;
> +            cell-index = <1>;
> +            interrupt-parent = <&ipic>;
> +            interrupts = <71 8>;
> +        };
> +
> +        dma-channel@100 {
> +            compatible = "fsl,mpc8349-dma-channel", "fsl,elo-dma-channel";
> +            reg = <0x100 0x80>;
> +            cell-index = <2>;
> +            interrupt-parent = <&ipic>;
> +            interrupts = <71 8>;
> +        };
> +
> +        dma-channel@180 {
> +            compatible = "fsl,mpc8349-dma-channel", "fsl,elo-dma-channel";
> +            reg = <0x180 0x80>;
> +            cell-index = <3>;
> +            interrupt-parent = <&ipic>;
> +            interrupts = <71 8>;
> +        };
> +    };
> +

...

> --
> 2.48.0.rc1.219.gb6b6757d772
>
>

