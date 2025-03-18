Return-Path: <linuxppc-dev+bounces-7185-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA15FA676F3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Mar 2025 15:55:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHFHv1gDQz2yrk;
	Wed, 19 Mar 2025 01:55:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::4" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742309707;
	cv=pass; b=Ye1FBLWv8JgsvXBXJrM+cqoUk+WLVR4yXzrb1NHO5PKRSjVs3tpCRC9ElNQZBBqEtrS0O0o6jojHiy1M2i1Hof7KOTeqehzbDvKpslKio+Yo9p52nmrFypJlGDwpHk1iQR2ts1G8GKYpaySyNODS87r/hdWzxOerETcTWnc3cIdEGiBk2BlV/RVICROlDg+seShuIHo8XrvB3KOtSKys1a3midYUwDYTzWTfF0TdLlxMLbI5pg/Swplg998c0epgfhps0nGv3hJd2dSj7ZJtGqB+eQMsat/bGlf63iAF5TeR8n31A7O/Phfod667mp3KpEwbBaoQuemANmFxzHW6rw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742309707; c=relaxed/relaxed;
	bh=81NENzVFZMpENusN0WH+IZfIHXQLkL8wE0sDbhp3OMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=R3AISYYDehzxtNgsDq5MIczcI7ZvZ8LbEYymmyEHVr7tVYlF4MFaamEL7jB2RX95c/HaGmFuWGS8NLIreEeM8D1ELG+BeyRF1CQ5mukxinQ01bQ/v4+GGO/rkKXGVkVPdjT3aQBA3PYxmqxPSikBvOpIo/X7DD/LynjuIuYIuyNDOHkND2D3ctng9MTJRsQ/NXs7fN0/ALV00coSpzfOduYjV3pD0OF6ZJPFH+bXuIfaKEDgLvhgAQM//T2IRcwjO+Karg+GRD3kwnOMDWlil1xgUDRa2H0HkT7X2j78woA4v973VtK2BHObB1lPVYkqQN7n1qmaE15hEetCwxqFYw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=dKbGHBUf; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::4; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=dKbGHBUf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::4; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazlp170130004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHFHs5cCMz2yjV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Mar 2025 01:55:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jcbW91enx2KVXr83N4LhP3COCE92LjPL2X8Hc3vtvGM2vcMj8GGNDZxfSao3ZdgwvQwzUeQ8WhvG81/HlPJKWZN5SREZ3xSEn3yfkKJYDp/tycL7MxuEGV18M2qfO0edf/OERhIGGg6DcG0dEkC59xsofHnUz8g4b5T3aC94HDp4mvqAtMVdsQU3kNpxlwPOk4i/dnKFlGJEjl13EyPmerS+j81ZSCB+/ifsFafrWAPS6xfDWMVjlE7sAlwonCpy+BRa7JR8AN999yOPz9xQObb5h34gqWKj67Al/9oksLx9/LMy+Q9CU2xM1/fPzsLvwDzS70aO80QK96NqtP40vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81NENzVFZMpENusN0WH+IZfIHXQLkL8wE0sDbhp3OMQ=;
 b=kK5x4vrkH+Zce4l9Vw0SqyFAAlh3EovzTF9JgosQZg2LSP/cam8ImUpxRf942bvMZqsrENVKj07HFwfIug5j3DVL6zAVXYUaaNm3em/VzEsDGrweoF+5e/isogyRY7vPlyVA9quj8L2gwvJK4WO/6QyWEt8t+Uwa8B9tCfRDs1rzGfC7SFl9qtXtLgbunbryqEAQXdkdEu9RZMZmnTPbFPUCabFJZ0cKNJZtCMEE2Oo4SfnT39z0pQefcZGqsqsGLhygo7RAJVxfRmWAo8e5TWWf766L+Vfjth6XhA7p2rfH8reI9pyHKQKb0qIbgczZd7vidFs/1hHgqRWZbn2fqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81NENzVFZMpENusN0WH+IZfIHXQLkL8wE0sDbhp3OMQ=;
 b=dKbGHBUfkec1zgkChn+iVYGIj7/Bol0KYKp6v2NJuLNKUmsuKkf8jgZ9CmypRuMux2awOt/h3TPMpB+4gRV4wobTzQ+AJXjN+SpgY3oe7LcDg2mseroOjrsthjELqDKSX7N//jBG/5AQW83QL2QTEU/6c6TMFm0Z25oVjzrd57YeC7cs49jnf0Rrzy5hJ9Alrb0k25jBfGr7lrzv2QbxWGyfc3XSI4aObMDhjSj7iorl5eb1P6Pf2gE4CwALect7upkd5dIMfF8E+c2bFRGvcJ3gzVPx9yxDfFXd+TEnvohIYAR4gI8nd/75llGXItwE7pkAAq8z7rL4hnwXNh/4Bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by GV1PR04MB10560.eurprd04.prod.outlook.com (2603:10a6:150:203::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 14:54:42 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 14:54:42 +0000
Date: Tue, 18 Mar 2025 16:54:38 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 net-next 05/14] net: enetc: add debugfs interface to
 dump MAC filter
Message-ID: <20250318145438.h5bowwyopppnryw6@skbuf>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-6-wei.fang@nxp.com>
 <20250311053830.1516523-6-wei.fang@nxp.com>
 <20250317144843.wp432pgodn4vjejf@skbuf>
 <PAXPR04MB8510F67EFC80DFCC7B9F13B588DE2@PAXPR04MB8510.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8510F67EFC80DFCC7B9F13B588DE2@PAXPR04MB8510.eurprd04.prod.outlook.com>
X-ClientProxiedBy: VE1PR03CA0032.eurprd03.prod.outlook.com
 (2603:10a6:803:118::21) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|GV1PR04MB10560:EE_
X-MS-Office365-Filtering-Correlation-Id: 353890a8-b5bd-412c-93f6-08dd662cd092
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YuWr20bRlEXaAexCIaHdiLtXtUmjUEtv9+tDzEyrQXxDu4oMP91ext6jyQuJ?=
 =?us-ascii?Q?La5yoZLWT1P/CAG1USogCPMfw7Gyc93/PQqIW9HPbryk97uXKDuEiRAlBNrK?=
 =?us-ascii?Q?DRa5ET/zT2+TpjYWDRF7K9XZJHDa5SNyitUicjkcGRhrYLmcl21CC+cb0qKL?=
 =?us-ascii?Q?r18T19jToZTpQ/cxIR1t3AJy1HKAcfUTRvTUJiBesGfLAqAD8l+rBrDVmVIg?=
 =?us-ascii?Q?HPfJCJpLUeMfUwhIIaOY5rpqM3RGcd3U8KkR9wNKTcj55sv4agttOJZp5Bah?=
 =?us-ascii?Q?Apw0zyVxLAgVSO1+GbQZCZChhtaG065w3Hys3v6X3zo3SV/QeHCVOkbp5ell?=
 =?us-ascii?Q?jHsSk8v0QLXXm9qNXTvzlNKqSP8rH2q62PQvM2ivu3Nfkb8ZuaM0oFcsLuNC?=
 =?us-ascii?Q?aU7XLz0K+PgSLSEwJWLh1XfMlH6xIv9EoHHKKRLqGXZwVqw1yRQcMdBOI5Kr?=
 =?us-ascii?Q?RJOdruzFUfHFubMlMNXKLInQNRZ6jJ8uctOXbpNBSvi/xxnEd1+Osdn5P4Vx?=
 =?us-ascii?Q?64JzofApDnlalkMv4JTSWy5LuCIufLptflIrAU0JCTBoBvhcI+NXOCrqPMKP?=
 =?us-ascii?Q?EwBliJ/IqRRY9gFcPWzZJgVYBJ1F1lDHCnWADKceEN44YDeYVHWaUCsoXxx9?=
 =?us-ascii?Q?SrQxGchSJ5V5nOGS8LkIbOOZmRaMFAL9DXimIgXOlfCn0/AVfx5DZlHcX8UR?=
 =?us-ascii?Q?V9gF7Lp3q78ke9NDHagyGtEsDvjpbMP4SEhOg6O5dHb2mZNe0qH8TMGkohV0?=
 =?us-ascii?Q?s3y6XrFz4I8f2Zvtv4usC1mMMHsqRvJzSsOgY6H2UmZW9MbK/O/fATE3CYeF?=
 =?us-ascii?Q?y1FItVdAnP7/g9cQaPX8E3zjIrrxWxOy15e6feLCEOaURDi+suATIuYhZMMq?=
 =?us-ascii?Q?GpBpLB+9d67ty74db7UUpJvdI/cx5ybVGtYmOhK49I3HIixFoONZQ29Ar1WD?=
 =?us-ascii?Q?fYyuXniQDWth/tfPraTLoh+UJ6xcKi/pGT/fB0IF/eUFDI4NNQt8DZBEhHhr?=
 =?us-ascii?Q?l8xBf/dIpuofIPhiTkfAOn0GX70yw+sQDXql5eoXKUhscry4O1eLOIRYwpQ1?=
 =?us-ascii?Q?gGidrNElLdUZg2CSWraYjUeWLynooCiB+zrtronuoXSDr4VcDc6QsI2HoGRO?=
 =?us-ascii?Q?dTXR1byewdeRIlytJa8oAceXXwootfZF/AGi8MoMijUvX8q/4OJjG8WgTTCf?=
 =?us-ascii?Q?0iBoYi1eZpnKubsRLTEx5XHMQJOiIfQnb0/yyKNlqrboVekXnQX3KRALlUbM?=
 =?us-ascii?Q?cLVSv2eG6/knFZmuGm6e8h5ShbZ/Kb6R51QYxU7ZtIuO03J/OlLMpo2EnXBZ?=
 =?us-ascii?Q?sJmNBNb8j2Ek8CcVi1gh3szfXEpfTjf26Q8IlaDHM6YUaJNh0U05VM6JaY4r?=
 =?us-ascii?Q?I8rdWIFgkEMGyWKVOPQcuknw8W/J?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/ly4rLorJWxxz/HAwNgON+Zurwa4gUgxtdSBAxsIp855ggGQnD8q5wFWfUha?=
 =?us-ascii?Q?B/+xLTddsFJlXvjcGF6a1UOHJBnwhXVNJTKDfk8iFKXSVwi6e9XPgr+YEncS?=
 =?us-ascii?Q?ZrdwrFFeO7yZs0S5lRmJjoaEdfodHl8HIcvUMXNHLagJCyvC4fUVIHLlV74s?=
 =?us-ascii?Q?EbLc+NiCHXgXt6n+iDrizd8Gdj0he/ahEY/APztQhJ8w2dxSGlImpjtezVQQ?=
 =?us-ascii?Q?TVgM/8ExIXF3kTfBE9c2wScA858D32SBrIUH8Pf9WmkRPQ9olzk3DdVruAUI?=
 =?us-ascii?Q?TQ3VeUR92f5Ap/zO9p+GcLThwjsVDSqAnzBS7UL15jA2PY7/nPH0s9yqTQJd?=
 =?us-ascii?Q?11QEWuVeCyZEQL0qY45UhdHoPlaKbitYtwgPhzf1WAJPWFq/85hpeKCjHNah?=
 =?us-ascii?Q?jVObDJodwFqwlFZNNgpmFkCxoPZXrpWcdmHnkRvBFRjVyo/mmN2VxmDcwggj?=
 =?us-ascii?Q?Qa1B/Gxh8A2ly/PUGMKmLdCjxmVx3q9MJ5p7mMY3BRNs9yxyFHn3VqCJiRT1?=
 =?us-ascii?Q?08PK2mGgU87hwZZh4xpFgnZkkTqiQ23h07Lxo9TkkShX35lmrIY/0SVI/M6B?=
 =?us-ascii?Q?vyy/1pfwutUk7WVE0lELNzqB1fZitNJxN8lBy+MDxkITAfgoMmwyXOjH6205?=
 =?us-ascii?Q?kP2ugh7ZMcqVe6nDZ9AAdykZB89v6Py1r1rXCHgtUi+TIV5yzwLZD1+2Qo4A?=
 =?us-ascii?Q?vGGrzA8pwIoAGJ7Qay2VC6+y5A7UIcxJk5O8RV6KV/2NjYi8jvwrMrBAq8rB?=
 =?us-ascii?Q?02NeGnUltggsmHl2soH7yRMIHS1TW06gr3OtvKaiI1mrEGM4b9AQxoiH9x2n?=
 =?us-ascii?Q?dfGewsIuXvvqRRWBCANJaviD685cmCXcLa7064Yt1naWKGZwLJn3i+JNllSP?=
 =?us-ascii?Q?nc9onpyoaG4JpfDmwuLZwC2nriTIn984hGqg7kMkzxOjG5pAFH2j6ZA6EyBQ?=
 =?us-ascii?Q?k1cwMps5NnI3O88rnZoq4Tzo1lmvqqP+N8jgEJsuqNewSkKUEZuO1zjsE0OX?=
 =?us-ascii?Q?csgoqLTxhf4zImWnIDfIkI9h8tKA0NRlluAfqf44A5TJT2GT0eYAlz/ayYSm?=
 =?us-ascii?Q?qUB2yH5l/v8s0cMhAus8GJM2csIhzslPIF9ptF2Tquq6P1w/ini9ukhVEQ4P?=
 =?us-ascii?Q?c3cOxfhozQ2bIHA7COIgHTLWzmGii8eeMuDo8hrcCGE0wrdg09TwqvFlQS9Z?=
 =?us-ascii?Q?DB4Z9oS7ZxLOHw86216FHrqY+Qaur7DvujMMua5uktRCuQu/kwYyZeDYTkoZ?=
 =?us-ascii?Q?ST796Ox+fJtl2FDL/TGWympx4I0iOb/6mbxJ4y0ZPSGHpeyrBnUTQ1L3/y4h?=
 =?us-ascii?Q?Q3t95hajy9cBLrRNp5kaldSD9B/cb4zc5EHTm95HKheCqBURFoFlvsBSrKbS?=
 =?us-ascii?Q?Z5DHQ1yJqZK2svYrcm9jxgfyTWweu3D6QE8dc0vvcJUJyHN6BFo9iVGB+iBM?=
 =?us-ascii?Q?HUFZUlb6dLpcAoWwVjlCMNBZ2hL51ye+Y8SuTHdABQ/PWWMOisPXUC1Z4Snq?=
 =?us-ascii?Q?rAqsaM2PBxxodf8DGo3OAnm9AkTW+YPeG7ZSzYzb8BWTMQcusXZ/Tkw+0Pwv?=
 =?us-ascii?Q?6Fy5S+osteoZzxDmg1A+5U0IB+mwaABVlFgisUCWHOgdaSB/XXlJz6zKnoyi?=
 =?us-ascii?Q?hA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 353890a8-b5bd-412c-93f6-08dd662cd092
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 14:54:42.2908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PtS7YJT40mEghJIn8VM0heNqlNTR96eJGPh2ChZD2D6bhtly91mtApnSkTXG8H5YsSBC2f02+8GA42ymFi1EOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10560
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Mar 18, 2025 at 05:28:56AM +0200, Wei Fang wrote:
> > On Tue, Mar 11, 2025 at 01:38:21PM +0800, Wei Fang wrote:
> > > +static void enetc_show_si_mac_hash_filter(struct seq_file *s, int i)
> > > +{
> > > +	struct enetc_si *si = s->private;
> > > +	struct enetc_hw *hw = &si->hw;
> > > +	u32 hash_h, hash_l;
> > > +
> > > +	hash_l = enetc_port_rd(hw, ENETC4_PSIUMHFR0(i));
> > > +	hash_h = enetc_port_rd(hw, ENETC4_PSIUMHFR1(i));
> > > +	seq_printf(s, "SI %d unicast MAC hash filter: 0x%08x%08x\n",
> > > +		   i, hash_h, hash_l);
> > 
> > Maybe the ":" separator between the high and low 32 bits is clearer than "x".
> 
> I want it to be presented as a full 64-bit entry. If it is in the format
> of "%08x:%08x", it may be difficult to understand which is the high
> 32-bit and which is the low 32-bit.

Ah :-/ sorry, I made a mistake. I believed you're printing a literal "x"
as a separator between the high and the low word, which made no sense
(hence my comment). But the "x" was in fact the printf format specifier
for "hexadecimal" (sorry!). What I was saying is that ":" is a clearer
separator than "x", which of course makes no sense now.

Anyway, I made a second mistake, which is that I didn't mean to suggest
":" as a separator, but ",". I had misremembered...

The reason I had made that suggestion is prior experience with phylink,
which prints link mode masks with "%*pb" (the implementation is in the
"pointer()" function in lib/vsprintf.c). This is an error message which
many users may have seen before:

[   61.800079] mv88e6085 d0032004.mdio-mii:12 sfp: validation with support 00,00000000,00000000,00000000 failed: -EINVAL

I think the semantics are also widely accepted for this format, and it's
a little bit easier on the eye. I have searched many times in the past
through enum ethtool_link_mode_bit_indices based on the bits set in this
bitmap, and others may have done that too. It's known that bit zero is
the right-most bit.

But overall, printing the 64-bit number with no separator at all is not
unacceptable, either.

