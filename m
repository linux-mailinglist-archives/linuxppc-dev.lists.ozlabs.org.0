Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF46F7834A2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Aug 2023 23:08:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=Kz310p7q;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=Kz310p7q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RV4nv46DKz3bq4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 07:08:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=Kz310p7q;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=Kz310p7q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=52.100.175.225; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05hn2225.outbound.protection.outlook.com [52.100.175.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RV4mw6ypGz2xm3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 07:07:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2nW6n8FYgTGaB2czyyuAu7bopoCC/YjzwHJjRjpZd4=;
 b=Kz310p7qAXhAHSDRYeBTO/HHLUAW4SfPEMi5ND7XHNH5K9loY/NXdsW/1D9No1n+3LFBS9Hlp9WUu9Mx7z/igTf7fV4r3siwePN+hZPscHuSqqWM48MCA0isDbncDkxS4+risjb/ey4UemEZGIa7jdg81DlwbED6Cx02ysO+QSIUjnok+sYkmufcyMC6rIu/C4+lBqo8hlmisowOD9j+bu7yomR7Vu4PQTBmJ8peYVFfXBkZk+vmjckFNJzafBdCeachP2B4AlKzCTmXKWfvoGyjgzjffBM1F5eXJBUGCwtD7cfT/eMcF/7k/xaIjiFY2se1EMoFcWqf7PUtZspomg==
Received: from AS9PR05CA0007.eurprd05.prod.outlook.com (2603:10a6:20b:488::27)
 by DB3PR0302MB9207.eurprd03.prod.outlook.com (2603:10a6:10:436::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 21:07:05 +0000
Received: from AM6EUR05FT053.eop-eur05.prod.protection.outlook.com
 (2603:10a6:20b:488:cafe::13) by AS9PR05CA0007.outlook.office365.com
 (2603:10a6:20b:488::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Mon, 21 Aug 2023 21:07:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.84)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.84 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.84; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.84) by
 AM6EUR05FT053.mail.protection.outlook.com (10.233.240.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6723.15 via Frontend Transport; Mon, 21 Aug 2023 21:07:03 +0000
Received: from outmta (unknown [192.168.82.135])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 6CB0A20080096;
	Mon, 21 Aug 2023 21:07:03 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown [104.47.12.51])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id E9CBF2008006E;
	Mon, 21 Aug 2023 21:06:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hm9tWjHG6vY0sYw/uduSE00Vj/KGm3gesl5jU0rLqRmKt9ctM4V3OvCJ8MqMUiv/Li2d43LvAlLrXMG2OD6xLdrcpu1Y578TalGtvkvn8ns4cB7X+uO3CpzY0ga946sBAFBsV/dMyNrOTC+FlyZokNTNWeWqjQhX+5gz1ofpsULVgWgMsG/Kz963n5/zaNpylWkkZw5P2a1gMUydjfgb8BliiYshGJyH9aKynGSs6tahvXVhyYbXaJBAKVMjXuEIY/F4kOVeMOfgjIM2NnNBr0dOWHzl6f++3XcRPsujXLZgZLk4CPEm/hcv9CFdRB89P8hFDe1lji7gppRKrVzXiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r2nW6n8FYgTGaB2czyyuAu7bopoCC/YjzwHJjRjpZd4=;
 b=LSWivH3285Ogt9DAD5Y3HdKIXEAvf3PqyoHEhbKkcZAxk7umqCOFoJ7GakV7+yi2vDKUIyigEiQrdKGpoghV/x3QHy9alIWc66oIS9+qCoS8f2yNK8HNDgU8ij3uqvAVAk2OVXPKa0PO30+qOALCATeWVxM3JVefCx+P7ICo0tjzWHTYkpowuns7eur7NaOkCFDFPj+4vketN6YEEMrqam1QwPMJ98GKkZRlxbrefMeQb4tY8B9gRCA+isBG/G6iOHQ+hxzsIQvm2/nCKa0ricUVapWfPB7P7yHwvGCX4QojXyKV7oczX6qEWAuKGARB81+T5OvQYN91MxD/h29DZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2nW6n8FYgTGaB2czyyuAu7bopoCC/YjzwHJjRjpZd4=;
 b=Kz310p7qAXhAHSDRYeBTO/HHLUAW4SfPEMi5ND7XHNH5K9loY/NXdsW/1D9No1n+3LFBS9Hlp9WUu9Mx7z/igTf7fV4r3siwePN+hZPscHuSqqWM48MCA0isDbncDkxS4+risjb/ey4UemEZGIa7jdg81DlwbED6Cx02ysO+QSIUjnok+sYkmufcyMC6rIu/C4+lBqo8hlmisowOD9j+bu7yomR7Vu4PQTBmJ8peYVFfXBkZk+vmjckFNJzafBdCeachP2B4AlKzCTmXKWfvoGyjgzjffBM1F5eXJBUGCwtD7cfT/eMcF/7k/xaIjiFY2se1EMoFcWqf7PUtZspomg==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AM9PR03MB6819.eurprd03.prod.outlook.com (2603:10a6:20b:2d9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 21:06:51 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::21bd:6579:b3d1:e5f7]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::21bd:6579:b3d1:e5f7%5]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 21:06:51 +0000
Message-ID: <a66c9abf-5351-62b6-5573-cae38e6768e2@seco.com>
Date: Mon, 21 Aug 2023 17:06:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v14 00/15] phy: Add support for Lynx 10G SerDes
Content-Language: en-US
To: Vladimir Oltean <vladimir.oltean@nxp.com>
References: <20230612163353.dwouatvqbuo6h4ea@skbuf>
 <1dd01fe2-08a8-ec2f-1184-a58b2f55ba85@seco.com>
 <20230613142754.wr5njtjo4tbloqwu@skbuf>
 <20230811150826.urp2hzl3tahesrjx@skbuf>
 <26623d0c-8a5a-614b-7df7-69214aaec524@seco.com>
 <20230811163637.bs7a46juasjgnmf4@skbuf>
 <20230821124952.mraqqp7pxlo56gkh@skbuf>
 <a2e3fcad-9857-f1b3-8ada-efb2013a4bf5@seco.com>
 <20230821181349.hls6pukp5d6rc5av@LXL00007.wbi.nxp.com>
 <73d59dd2-88f0-3c1a-0de2-de2e050cba5a@seco.com>
 <20230821195823.ns55h3livxgol7fp@skbuf>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20230821195823.ns55h3livxgol7fp@skbuf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0127.namprd03.prod.outlook.com
 (2603:10b6:208:32e::12) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AM9PR03MB6819:EE_|AM6EUR05FT053:EE_|DB3PR0302MB9207:EE_
X-MS-Office365-Filtering-Correlation-Id: b4fcb59c-1682-4da4-1c6d-08dba28a91ce
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  fiEzCXRKn520O4ko1UVQ7syguPx20Sfe24hSvnkPX5RqC8+ynzBsf1pcTMEKYyLDmcMoUiCKRSCARQUKonJRI2FftQN8n84yl+FnJm7k0/RzhzayBFHASEcyAcnF0v1u0LGhrfwiIqae9ZaXBK74ayRM5ZuImtxblwsi+prDANx2SG/1iItMv4ZYFRR4cJ10HhCgt8khgtzBzkAvAOHKgL475/tCfaK/KaXoDB5EbNUf9ujTSad81e0EKE1nErG37sgfA3dwVWeOA/KkEJCg/ujBsq0bzFIy5g0RKDSUWbZiSA2NNW4MmdjPmoJvKFPVR5zLPBS9BdXNniexneiM2x1uUz01FhXrFcBJaWzznA/E152RWEZgWDY7Q6QEsoChcVsjEJZrWTSCo728/FUYDlNwaWkVZ410vfXko+0v0ogjFuS3BJ2yXo2Woxic4cNR9zOD4oqBPUMZ1k+YTXSqPqnR1Fp9XPnB8oDKDlf2AxE9Maqc/O/DGtiKW+KnNe2l9JrljaJy086d7HEBxoFpOaWC3Qwmi20GEROKWqKCBMeWRL4hTZr85PumLYO5mv5P3Q38bPUfW0ZXqmC18fFMdKjKhl3nxwPfFNunxxB+d+LYC1Hh2ipVYpcitGI0NiXWB6zBTx5EsUaf2MunbcdiqvSLWzaoj90qMAm4Kj/mbbM=
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(39850400004)(346002)(366004)(186009)(1800799009)(451199024)(54906003)(6916009)(66476007)(66556008)(316002)(66946007)(6512007)(66899024)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(966005)(478600001)(6666004)(38100700002)(38350700002)(53546011)(52116002)(6506007)(6486002)(83380400001)(2906002)(7416002)(86362001)(31686004)(31696002)(44832011)(5660300002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6819
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  AM6EUR05FT053.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	df68f686-9e76-4d87-a038-08dba28a8a33
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	rwU0hfXF19WBRbQzDDsZeQOOiDRThf3dJQV7sFOF8MOVSPi9SZompW4mjYnpnox2+FmBXWsIfUDrpQkuBQ+A01brlqdrfkb9maQA3S7rSFnKTVtioDhsv8+LwJFay320w5aL0CGS9YIEZ+lWqKitBqY9iJbF95qYAJFzExO/DNnXfgWA2PfQitElXttnsun+xAJB1DUMzcoN4/hSg/Seg2ba/Syq3rxN8dOtQIgy9RABS891s61aJZf9YXmHPwekbJKNnf1hsSPvDyDPZM2HUDFh3ybx30w2bkHuULamYMag/GP9qu4HbBUHVG4SmmvOrt/mNgkHWkXrm+DM6PAFW85wUaFXJGuH9XtJwINSSaC17LI09h1Ca61JjxACnrE/Xgk7gJM7M8qw9B+3YrsLL1buoISKsVigZPNcP6LUW4mcRRM12G3NRGlmBQQS7pLFkHuau4HKPa1nrCjMGwFho1Fv2rOV5XLtaaXAUA1PICotXunoonaYekKpWEplsKxTR5TYDAX9jxCDFhWGFDh4TLgvtSQ/nC1SqH60Wa3+mc61u70QtrIgZWOcokjkvaXGDBdV2vfY/9XMnaqLXYnjZdB//tyjm3dxurKDu+Dn47mGlX5m/DXsQb5vPr9JCbPS9hPVwXzRB99TmPvcMSbhmoJn+8PUrKcrfrCVl6NHryodjquYF8NT/NLL6Xu9ia8aWD884+lphdy+ACsKF5KA8yvXHXnoOObX5H5aGVZ2vBxLaDYtQfQTJ5N5UM9rG8HYX9rDnwUxtfG6/eVFOAKCJI9N4yDMT6gu1/PdrZWsCc4=
X-Forefront-Antispam-Report: 	CIP:20.160.56.84;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(396003)(39850400004)(82310400011)(451199024)(5400799018)(1800799009)(186009)(46966006)(36840700001)(2906002)(7416002)(53546011)(6486002)(40480700001)(6506007)(83380400001)(5660300002)(44832011)(336012)(26005)(86362001)(31686004)(36860700001)(31696002)(47076005)(8676002)(34070700002)(2616005)(8936002)(4326008)(70206006)(316002)(6512007)(6916009)(54906003)(70586007)(66899024)(966005)(478600001)(356005)(82740400003)(7596003)(6666004)(36756003)(41300700001)(7636003)(43740500002)(12100799039);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 21:07:03.7979
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4fcb59c-1682-4da4-1c6d-08dba28a91ce
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.84];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	AM6EUR05FT053.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9207
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
Cc: =?UTF-8?B?RmVybuKUnMOtbmRleiBSb2phcw==?= <noltari@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Michael Turquette <mturquette@baylibre.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jonas Gorski <jonas.gorski@gmail.com>, linux-phy@lists.infradead.org, linux-clk@vger.kernel.org, Kishon Vijay Abraham I <kishon@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-doc@vger.kernel.org, Camelia Alexandra Groza <camelia.groza@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, linuxppc-dev@lists.ozlabs.org, Li Yang <leoyang.li@nxp.com>, Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/21/23 15:58, Vladimir Oltean wrote:
> On Mon, Aug 21, 2023 at 02:46:53PM -0400, Sean Anderson wrote:
>> After further review, it seems the reason 28g can get away without this
>> is because there's a one-to-one mapping between protocol controllers and
>> lanes. Unfortunately, that regularity is not present for 10g.
>> 
>> --Sean
> 
> There are some things I saw in your phy-fsl-lynx-10g.c driver and device
> tree bindings that I don't understand (the concept of lane groups)

Each lane group corresponds to a phy device (struct phy). For protocols
like PCIe or XAUI which can use multiple lanes, this lets the driver
coordinate configuring all lanes at once in the correct order.

> and
> I'm not sure if they're related with what you're saying here, so if you
> could elaborate a bit more (ideally with an example) on the one-to-one
> mapping and the specific problems it causes, it would be great.

For e.g. the LS2088A, SerDes1 lanes H-A use SG1-8 and XFI1-8. SerDes2
lanes A-H use SG9-16 and XFI9-16. Each lane has its own controller, and
the mapping is 1-to-1. In the PCCRs, each controller uses the same
value, and is mapped in a regular way. So you can go directly from the
lane number to the right value to mask in the PCCR, with a very simple
translation scheme.

For e.g. the LS1046A, SerDes1 lane D uses XFI.9 (aka XFIA) and lane C
uses XFI.10 (aka XFIB). This is the opposite of how SerDes1 lanes A-D
use SGMII.9, .10, .5, and .6 (aka SGMIIA-D).

For e.g. the T4240, SerDes1 lanes A-H use sg1.5, .6, .10, .9, .1, .2,
.3, .4 (aka SGMII E, F, H, G, A, B, C, D).

For e.g. the B4860, SerDes lanes A uses sgmii1 or sgmii5 and B uses
sgmii2 or sgmii6. The MAC selected is determined based on the value
programmed into PCCR2.

While I appreciate that your hardware engineers did a better job for
28g, many 10g serdes arbitrarily map lanes to protocol controllers.
I think the mapping is too irregular to tame, and it is better to say
"if you want this configuration, program this value".

> I may be off with my understanding of the regularity you are talking about,
> but the LX2160 (and Lynx 28G block) also has multi-lane protocols like 40G,
> 100G, assuming that's what you are talking about. I haven't started yet
> working on those for the mtip_backplane driver, but I'm not currently
> seeing a problem with the architecture where a phy_device represents a
> single lane that's part of a multi-lane port, and not an entire group.

Resetting one lane in a group will reset the rest, which could confuse
the driver. Additionally, treating the lanes as one phy lets us set the
reset direction and first lane bits correctly.

> In my imagination, there are 2 cases:
> - all 4 lanes are managed by the single dpaa2-mac consumer (which has 4
>   phandles, and iterates over them with a "for" loop)
> - each of the 4 lanes is managed by the respective backplane AN/LT core,
>   and thus, there's one phandle to each lane

By doing the grouping in the driver, we also simplify the consumer
implementation. The MAC can always use a single phy, without worrying
about the actual number of lanes. This matches the hardware, since the
MAC is going to talk XGMII (or whatever) to the protocol controller
anyway.

I think it will be a lot easier to add multi-lane support with this
method because it gives the driver more information about what's going
on. The driver can control the whole configuration/reset process and the
timing.

> I sketched some dt-bindings for the second case here, so I guess it must
> be the first scenario that's somehow problematic?
> https://cas5-0-urlprotect.trendmicro.com:443/wis/clicktime/v1/query?url=https%3a%2f%2fpatchwork.kernel.org%2fproject%2fnetdevbpf%2fpatch%2f20230817150644.3605105%2d9%2dvladimir.oltean%40nxp.com%2f&umid=9e644233-009e-4197-a266-5d9a85eb1148&auth=d807158c60b7d2502abde8a2fc01f40662980862-cc1d5330d84af8fa40745b165a44849db50f8a67

Yes, no issues with the second case.

--Sean
