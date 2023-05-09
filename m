Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A23836FCA32
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 17:27:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QG28n5qlhz3fQ7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 01:27:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=cMtscebg;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=cMtscebg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe0e::31f; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=cMtscebg;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=cMtscebg;
	dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04hn031f.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0e::31f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QG27q6Lckz3fKw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 01:26:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JoqOLvSCFEngoiPIXjctzfUit5wPUXfOT6bdgf2jF3E=;
 b=cMtscebgvkBTM1aCKpj9LTtJ9i7P6dEzT2Zmozm+bb6DkV5Zh/PsB3BFUwzlbxS4eG1e+xZAK2ea3im8gVph+OXFayEgARxeV7pGrzgwOuVnbLSR0Ql3EknH35NyMLp7ceep9/U0ofWw19QDrNHQK4Yhy4IXA0hWQ/nvRLMj5n1ur8AUWtRK+xySvRh816yNgAP96LWqbRrZioWQe8avgJHMBbZrtERkMECM3PqtkCtisPoqWJ3fHXCQZkHLFmjMLwgos17ksg3+qFrTlBQb821/gcaPR0LGpDpXmuoKqxosiCXpxyEfK1CLxUcOFI/oknNftFddbx6lldF95B+MmQ==
Received: from FR3P281CA0053.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::6) by
 PA4PR03MB6990.eurprd03.prod.outlook.com (2603:10a6:102:e8::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.33; Tue, 9 May 2023 15:26:25 +0000
Received: from VI1EUR05FT034.eop-eur05.prod.protection.outlook.com
 (2603:10a6:d10:4a:cafe::6f) by FR3P281CA0053.outlook.office365.com
 (2603:10a6:d10:4a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18 via Frontend
 Transport; Tue, 9 May 2023 15:26:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.85)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.85 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.85; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.85) by
 VI1EUR05FT034.mail.protection.outlook.com (10.233.242.247) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6387.18 via Frontend Transport; Tue, 9 May 2023 15:26:24 +0000
Received: from outmta (unknown [192.168.82.132])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 583992008008D;
	Tue,  9 May 2023 15:26:24 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (unknown [104.47.11.42])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 491E420080073;
	Tue,  9 May 2023 15:27:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACAdih1vEBxZc8ESdnGa8ukPwO0XyOcdn+SB/S4ZvyIaeE7tYmuSczDfj37BxuJb26MMjEF9LyNIDkHsyup6simTvOo4E/+bfLT0fenFoaR1mOOuk2SGhNt4+wKirW09H4IfynhNzLbg4wImno3Mmmw9DAP4Yy0E0ufD9f/LCmQv8qCPdc+fEuzChIatlrltcpL59JR3ueHN6kpP7JKmBtKfSqYxdxl/RfffaAx84CXxGbKKOVvtS02HgJiBdTrgfz+tsh27wjRdkSVwGIVwYBr0A4vahUQ4gfphv6x/DkMrAhBrLsVJyv2yJZxM0SPq3Czb4I2kaq7QbTH1XSwH4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JoqOLvSCFEngoiPIXjctzfUit5wPUXfOT6bdgf2jF3E=;
 b=LidUgZvhUAegMPUjTFLknRZu1muOq4Y1VTqbj/jgVEEOns5R6tzQnuctydZNZbJ3OR+4oHX3utGObJ26K73clV5AKqj05qJHZRoQLm75akGr4vYrCVgGfVJBQPznQWAgoU4JbJnz9H9LVJEQMfBsMEJeIk3A0M6h/evD0Ke4awx7/rbWP6v4cZWgzFeP0vO3C+jtoqT9bLfy9CSyMs0lteO4F9KeM9o5Fdcg1UrBV7Ei9G2VJEY7UydP8ZtMtv6eEtls+yi37KCIlDhbfSF+oxbmrQE7NRaSsIsv1VUS8ncdhEd9dLKkvOHJpcW49hjx4bVaOuWefZmIZ0e/aOLtjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JoqOLvSCFEngoiPIXjctzfUit5wPUXfOT6bdgf2jF3E=;
 b=cMtscebgvkBTM1aCKpj9LTtJ9i7P6dEzT2Zmozm+bb6DkV5Zh/PsB3BFUwzlbxS4eG1e+xZAK2ea3im8gVph+OXFayEgARxeV7pGrzgwOuVnbLSR0Ql3EknH35NyMLp7ceep9/U0ofWw19QDrNHQK4Yhy4IXA0hWQ/nvRLMj5n1ur8AUWtRK+xySvRh816yNgAP96LWqbRrZioWQe8avgJHMBbZrtERkMECM3PqtkCtisPoqWJ3fHXCQZkHLFmjMLwgos17ksg3+qFrTlBQb821/gcaPR0LGpDpXmuoKqxosiCXpxyEfK1CLxUcOFI/oknNftFddbx6lldF95B+MmQ==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by GV1PR03MB8127.eurprd03.prod.outlook.com (2603:10a6:150:22::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 15:26:18 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::d632:8122:75f7:7b0e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::d632:8122:75f7:7b0e%3]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 15:26:18 +0000
Message-ID: <d230c641-7270-c768-fd48-9012c01621b2@seco.com>
Date: Tue, 9 May 2023 11:26:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v14 06/15] clk: Add Lynx 10G SerDes PLL driver
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>
References: <20230413160607.4128315-1-sean.anderson@seco.com>
 <20230413160607.4128315-7-sean.anderson@seco.com> <ZFi9t84UoIfUyHhi@matsya>
 <1012f955-180e-0013-cc13-1da10991b5f5@seco.com> <ZFpD4I2LK9YIQQat@matsya>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <ZFpD4I2LK9YIQQat@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0055.namprd03.prod.outlook.com
 (2603:10b6:208:32d::30) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|GV1PR03MB8127:EE_|VI1EUR05FT034:EE_|PA4PR03MB6990:EE_
X-MS-Office365-Filtering-Correlation-Id: 65119b38-35b3-476e-40ae-08db50a1c02b
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  UhkazhCa5wLCCEJATmFJlK8PD5EB3FQOIKmpe59bVMJZdXyahwNJDzDj53tezswJkShuZaomYMp5KrllOMhAB154NG8iay1uDKQyn/7M0Y8+qEBBgjwH9RfvxIpRPTGaU5WirmGPaGjfr/wWWrH88eqxdhNOZHTCu7kdv6FcoHw8pvniQJadZVTeyx2n4scskLk/fV3XVDqUu416alt7PIYsHCgACgW+ENJu/RM95jneW5fsGlb9zBvrunpH/jZcPwyhMan31axeULisB9+aQazSDVC3wziylnXvbTYLqQFUf6lk223gdgbjn62kk2AOtEy/wL7q24iEyIo77C4mlMxlhXtiItutx4USwXURTDR61ELmrOEbcXaLv47TxUUaSEg8SdWzpa2K11+ECh++K/czsEQForGXwxJfzfV+xiraXkfzA6rE7CA+oFjvtpFGNY+dBzWMt+AJ+11m5Sv4Fw1rAFtG5q/K8M+0ixvwX84SVjQE1XACHYqegHBfFuLr9Q30ES4Yibu8Ig9A9P/hn6QA/PJH6LB/fBEsm5v4LN3qBfxwHzaorCCsWq99XZaJ7DcHNskC6osQj4fSEEA6rt5fpZLCx61i5ckNMiqizdkDz/qc38Whc64riK2fyKRYp1IbG2M2kf/3TA8wUE5u3kVpI1oUFdq3gm9bz+O0vYOJFm9g0R/TLkAhYs3Yh4bi
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(396003)(366004)(136003)(376002)(346002)(451199021)(2616005)(83380400001)(6666004)(186003)(53546011)(2906002)(6506007)(6512007)(4326008)(66946007)(66556008)(316002)(54906003)(66476007)(41300700001)(6916009)(478600001)(7416002)(5660300002)(44832011)(26005)(52116002)(6486002)(8936002)(8676002)(38100700002)(38350700002)(86362001)(36756003)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8127
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT034.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	73860d62-a591-4c2f-877f-08db50a1bc4c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	MoPgvUM2ll3bfF1OGL/wwhfFlgiJBtWXZhhMPOFluhhMAKFs5ZE3WVxAIf3kZ3derAZm+k1HZ0QqzbkT+g55TQrjriaxjs5hcSzg8SyoWLZ33x2cAY8nh+TizIfDupXXM7qHvygoRnsB68b8EYfvQ5Ansn1Q9SnthLzynjnZ0++AnRHZ8jyvlJpz5UQBfaraMuQY7JLpSxGWR9KrlnIOEaPKccuiBPdgIt9ngWKf0MOjuJdj8uLLlMNulDebVhoV/e0UBvxrxx3gCQ1ISEDHvfzNCgCHqO/aGWoWXzedxJ9FGU7lyXu5YyUIYnF6pM9kT4r2RP+hnVboJnH3qrWvYRxgNj8DdLUYOGtoss3gWK1Qp2kVRiArnOyD+ncQBUzQ5+hSWr+K5aS7VV3M715/tLwEjBMs7Gp6esRo1RqG//w55GJDUkBkfJSdqrQQsNnyBx770UL/FFeG7wDtbjNCu4JqtAZMbHBa1NpLbS4yaj1Hh3XYSJj0Trrn15347V2BlvcTUn8COmx8wD2k87UoPyAOB7gLMsV9030HCCS1adUinQgH8w6yPIQM8zniGa1JUY23A3GdV3/wJ5v/3TNVTDjEsGsIr98bqZK3ChQPlLfklzM2IabvwmrO5wVHdhXzrtJpgXpYdju7Lub9w9KBbRyq6XzUhfu4OLVs5xfyJzblYUAQH2wgcPpV8orYnpXgRsHIjg7s4ExqwrWPkCo/ZGhAhPBA4uIdtlOaoDR/BtV94dGQH72KgbBqQ1pWgY5eBhkqYQhwdKomtEBP48azRGQREegC2sOWanJfFu2ryJA=
X-Forefront-Antispam-Report: 	CIP:20.160.56.85;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(39850400004)(396003)(346002)(136003)(376002)(451199021)(5400799015)(46966006)(36840700001)(40470700004)(36860700001)(36756003)(6666004)(47076005)(316002)(83380400001)(34070700002)(54906003)(70206006)(70586007)(4326008)(478600001)(6916009)(6486002)(2616005)(6506007)(26005)(186003)(53546011)(6512007)(2906002)(86362001)(40480700001)(356005)(31696002)(40460700003)(82310400005)(82740400003)(41300700001)(7596003)(7416002)(7636003)(5660300002)(8936002)(8676002)(336012)(44832011)(31686004)(43740500002)(12100799030);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 15:26:24.6292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65119b38-35b3-476e-40ae-08db50a1c02b
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.85];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT034.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6990
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/9/23 09:00, Vinod Koul wrote:
> On 08-05-23, 11:31, Sean Anderson wrote:
>> On 5/8/23 05:15, Vinod Koul wrote:
> 
>> >> +int lynx_clks_init(struct device *dev, struct regmap *regmap,
>> >> +		   struct clk *plls[2], struct clk *ex_dlys[2], bool compat);
>> > 
>> > so you have an exported symbol for clk driver init in phy driver header?
>> > can you please explain why..?
>> 
>> So that it can be called at the appropriate time during the phy's probe function.
>> 
>> This is really an integral part of the phy driver, but I was directed to split it
>> off and put it in another subsystem's directory.
> 
> That is right clock should be belong to clk driver. IIUC the hardware is
> phy along with clocks and you are doing the clk init. I think that may
> not be correct model, you should really have a device tree node to
> represent the clock and the phy node
> 
> 
> What stops this from being modelled as it is in the hardware?

It *is* modeled as it is in hardware. With just the serdes compatible,
we have all the information we need to create the clocks. So we do so.
There's no need for a separate device just to create four clocks.

These clocks cannot be used by any other device (except possibly by
putting a lane into test mode). So there is no benefit from making them
a separate device, except an increase in complexity due to ordering and
dynamic lookup. By doing things this way we know that either there was
an error or the clocks all exist, and the lifetime of the clocks matches
the serdes.

--Sean
