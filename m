Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFDB77936D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Aug 2023 17:44:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=VvJTJ++t;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=VvJTJ++t;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RMp4q61Gyz3cPy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Aug 2023 01:44:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=VvJTJ++t;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=VvJTJ++t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=52.100.17.212; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=lists.ozlabs.org)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04hn2212.outbound.protection.outlook.com [52.100.17.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RMp3q5j61z2yD8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Aug 2023 01:43:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TxwwTIN3XUd+cebiGAu6zsxXxD+mfcUOmp2YX+RjkuQ=;
 b=VvJTJ++t/s0ZPjSvZjw5An8hFC555Zjd2irjCRAO+haHXFcmK9LA/dvCiFTKY9MIt93UA1kWjdKP1iFf873LCrqAzuIGdPYNf1xo5UQplmQuRSDnkPY0L+wSxWNcUw5TZYRB0ur3BoHRffSvAvbmnqHkUfeAtz9hid2I6ROedWnpDfhMPfXCCvjZF1BtQLGw7/DZmjKAvWpyBFtehohYIsRCvKnGHRV85+p5QaTSuXdVInEUSPqfLlABBzd8xXU9J6c111+9m6ornT3E0KXODPVZQL5R4Ox2Sd1bJ/icefPW2xcPS6nypPNhHtBww+mrWXKdmwm/O0UO79ECX9Cd1A==
Received: from DU2P250CA0002.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::7) by
 DU0PR03MB9255.eurprd03.prod.outlook.com (2603:10a6:10:470::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6652.30; Fri, 11 Aug 2023 15:43:12 +0000
Received: from DB8EUR05FT043.eop-eur05.prod.protection.outlook.com
 (2603:10a6:10:231:cafe::76) by DU2P250CA0002.outlook.office365.com
 (2603:10a6:10:231::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.31 via Frontend
 Transport; Fri, 11 Aug 2023 15:43:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.87)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.87 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.87; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.87) by
 DB8EUR05FT043.mail.protection.outlook.com (10.233.239.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.9 via Frontend Transport; Fri, 11 Aug 2023 15:43:12 +0000
Received: from outmta (unknown [192.168.82.132])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id C81D4200813A4;
	Fri, 11 Aug 2023 15:43:11 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown [104.47.14.50])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id A95C42008006E;
	Fri, 11 Aug 2023 15:43:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ja5y6HzEagaRyCoSYSjTdjzEfILZSEmq/ZCpmeE3MIh/HlJ2Wm5jflO+zFIH/LGyuZkUi7H2CcAw4AtJ8dLSxNgVz0lF00OXHqMVrPpGDfcCqxesUpmGX8n7ApwirE/mq5f8tyf0eLGM23dyGi+BiXlpecnPEiWu8ISrr4fUCMx/9T0UjTUds/a77HiY/9ORUxCG8FAvFnkGCbZ6T1IXU03XwWgXQSqJm0AzzDLsPnLPQqq7i4L9paidScYRxVCQctDVReaHFu7CZClWKw4gVgG8cSgWFbbbEAbvhh+S8NBSdTZhK9pnvK4h9xy4L14mLi15uvVhe7ArylGBzg4lMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TxwwTIN3XUd+cebiGAu6zsxXxD+mfcUOmp2YX+RjkuQ=;
 b=em1cWTaWmPqfREITtkSRockcrb0xVztJFUhTDXd4ZLuHf9kkZxjOlp/49j5CkSwbjTGJ9681h0mJiwPW4i1GI8MSh4p0VL9QCbcnu4aKYwpuMKIO6bRJTbIjwGN9YnWeIa3Ua6pTTek6W69Q5oRKOwXFFfnTf/y3qKrhc04qDfDP5aLQlQTEwu3Q/f8PngaGFvekHxFb2gyl6RtLhmlXaV8LtV5cguRuY21okaQfHfBQfk54zZVL6oznJVOr4vhfUeNkhdb0KJP/evGNS4kmgDT78vs/Yn/KIjMq8Ci4Rk4JcWnSvGYEUF4d9/2lp656JfUxrZ31RQvh2EHWH8kRVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TxwwTIN3XUd+cebiGAu6zsxXxD+mfcUOmp2YX+RjkuQ=;
 b=VvJTJ++t/s0ZPjSvZjw5An8hFC555Zjd2irjCRAO+haHXFcmK9LA/dvCiFTKY9MIt93UA1kWjdKP1iFf873LCrqAzuIGdPYNf1xo5UQplmQuRSDnkPY0L+wSxWNcUw5TZYRB0ur3BoHRffSvAvbmnqHkUfeAtz9hid2I6ROedWnpDfhMPfXCCvjZF1BtQLGw7/DZmjKAvWpyBFtehohYIsRCvKnGHRV85+p5QaTSuXdVInEUSPqfLlABBzd8xXU9J6c111+9m6ornT3E0KXODPVZQL5R4Ox2Sd1bJ/icefPW2xcPS6nypPNhHtBww+mrWXKdmwm/O0UO79ECX9Cd1A==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by PR3PR03MB6396.eurprd03.prod.outlook.com (2603:10a6:102:75::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.20; Fri, 11 Aug
 2023 15:43:07 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::21bd:6579:b3d1:e5f7]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::21bd:6579:b3d1:e5f7%4]) with mapi id 15.20.6652.029; Fri, 11 Aug 2023
 15:43:07 +0000
Message-ID: <26623d0c-8a5a-614b-7df7-69214aaec524@seco.com>
Date: Fri, 11 Aug 2023 11:43:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v14 00/15] phy: Add support for Lynx 10G SerDes
Content-Language: en-US
To: Vladimir Oltean <vladimir.oltean@nxp.com>
References: <20230429172422.vc35tnwkekfieoru@skbuf>
 <c81d23b6-ed22-0b37-d71b-ddce9d5d58eb@seco.com>
 <c2f928d2-25f6-0e31-9ab3-9d585968df1b@seco.com>
 <20230522150010.q5zndfwcuvrb6pg2@skbuf>
 <22a28a6f-2c84-a6b1-bb57-a269af34c993@seco.com>
 <20230610222123.mzmfjx7zfw4nh2lo@skbuf>
 <c702e2b6-cb0f-4ac9-86fe-a220284d45aa@seco.com>
 <20230612163353.dwouatvqbuo6h4ea@skbuf>
 <1dd01fe2-08a8-ec2f-1184-a58b2f55ba85@seco.com>
 <20230613142754.wr5njtjo4tbloqwu@skbuf>
 <20230811150826.urp2hzl3tahesrjx@skbuf>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20230811150826.urp2hzl3tahesrjx@skbuf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR05CA0047.namprd05.prod.outlook.com
 (2603:10b6:208:335::28) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|PR3PR03MB6396:EE_|DB8EUR05FT043:EE_|DU0PR03MB9255:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f8d5f6a-55c5-4150-067b-08db9a81ab82
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  HRl4wAm3rbY3bQzux+49YFZafPjYD54zZKdIaiT3Z9fa0l0N8xMQJz4IeH1uWMvrjk+uYKmpoBYhJUdImt0ISFEMeH54DU9Bx+TICt2housmJ5ORI2zVJCy7SE12IEPbFMivnbyFGEmxQBxekaNzyQkAAHRkY7+KPwgtfGXs9SnMTbQIbcCj9Q0Uat38hWBqLcFCYlSm737nzZufl9B/Q3WrWONjWFWQzLtWFbyIkj+K1OodPG990WhbWrZ0UMnUBVfaD60m1IBLD2VtSRmLyZSlKOKR7MzHMO2qOGNn/q2KmHM/FPiFP+aemVp1r5Nozslj4HTlYG9SEPhZSW60PWjamxQEMe/P9R85Esa0WR3seC3Ud2mIK4GBsNWkXNXpW9gtpmIiHj043daCIsvbqG666FreHpdgxs/DEvMB01ZOcaVJ/mSSJj8nE0vxVKh2ICV4koIgzr6C9cYGFBM9dlv/EnRuAnnevGAP3mbMMoCpgSw6b8e3fXWB7A7kz/lPqFbhmA1viRwnaYyFQhVP1O2YMkePsO+J1Dw9wfg99sWiy5wVtL63Dy4rIux+/re3BrZeljDZFCSaIg1/AW+VGbSBD3+2azDYQCGihDswMkvtWyCQTIHBnaHnCU4Mvn6BNmGrP6PHJAGBK+ogxj7+YRGKHQe6x10BtDlH4beJ0tRTxtcXG9d6/35iL0rRsk+z
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(136003)(396003)(39850400004)(376002)(186006)(1800799006)(451199021)(31686004)(6512007)(52116002)(36756003)(31696002)(86362001)(38100700002)(38350700002)(53546011)(26005)(83380400001)(6506007)(2616005)(478600001)(6486002)(54906003)(6666004)(4326008)(6916009)(316002)(41300700001)(8936002)(8676002)(66476007)(44832011)(7416002)(2906002)(5660300002)(66946007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6396
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB8EUR05FT043.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	e9122305-3195-4875-930e-08db9a81a893
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	hQX0fMC1pqlF90SIP3440DtFtCGbvJYOxZflOTGqJH3hknMfnKFCGeBFLS7mmH0Nt0arnfjLi23u03RVa9U1hwjsxD691bpAX8zf8doaBmhMb0Zek/db7KhuoAVjkRLegGkEh8eo3T36kgk7Lhvk7Fl1h1g+Ih77IkmqqvZVNQOhOjG/x5YRVgT1PPOZGu2g0VeV4nAWMGRrYwOVAR9wk2d3i1jXwiPuc9hoLowrbpX+HLsPNN94dHhT9O22wIN7qo7YeyF6MGwCBlux7QoACuP9KwXYt67p95sTV0U0M0leS6pZqh56SZPPKEyXZSwpG+PoYGn9A8I4wBE8fjUYwSA7yvJNSZeTYspQu8w4q/GAEIQSmK0ZEuy9V3EioDWqkkKX4MLUiqaJXbJZpYL9/BN7pUkFnuO/7zdR4USj3IyVrUEuxBeMwagjc1pQCoDTsTGClr5kc6BirpjapLKuFzcqXw85dk+lP3rflndymPgVuzUKO3EejxNi+oYHC0cFcxrwJ6TAjWSwVcwolMKKIbNe3k5pVKzj9yMJeGxl2j0lsnemNrPx59DigCUw9AnJHmbyyCD8wKAJhoIZbs4WrA3HQP8YHVfxTW5auGgtrg4KW7mUbG8TnIFqNNQQB9zZMkJ6RbTF8Rrl7pJ2hmA1mlAmlX9sMpVPgEo/5A8bz8AHgk2782S7nSBQnKimOaGi23QguJ8t7CGJaq/sXywNyqWAFLTr1zYRNhJDolABCEVAsHje1cCSmLrs6A1lUC1U8Cv3KNmd/IcZ7oXiT18c1ampE+Kk74vuQIxMo2CLU5FBPv5FA5ii+FWW5cglyoYrBFTS9St4+Rl5phteoYo3Jw==
X-Forefront-Antispam-Report: 	CIP:20.160.56.87;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(39850400004)(346002)(136003)(396003)(376002)(451199021)(1800799006)(5400799015)(82310400008)(186006)(36840700001)(40470700004)(46966006)(316002)(478600001)(6512007)(36860700001)(7416002)(31696002)(2616005)(6666004)(5660300002)(44832011)(6486002)(47076005)(70206006)(70586007)(86362001)(31686004)(41300700001)(8676002)(8936002)(6916009)(4326008)(83380400001)(36756003)(2906002)(34020700004)(53546011)(6506007)(40460700003)(82740400003)(26005)(54906003)(40480700001)(7596003)(336012)(356005)(7636003)(43740500002)(12100799036);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 15:43:12.1003
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f8d5f6a-55c5-4150-067b-08db9a81ab82
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.87];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB8EUR05FT043.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9255
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

On 8/11/23 11:08, Vladimir Oltean wrote:
> Hi Sean,
> 
> On Tue, Jun 13, 2023 at 05:27:54PM +0300, Vladimir Oltean wrote:
>> > > At first sight you might appear to have a point related to the fact that
>> > > PLL register writes are necessary, and thus this whole shebang is necessary.
>> > > But this can all be done using PBI commands, with the added benefit that
>> > > U-Boot can also use those SERDES networking ports, and not just Linux.
>> > > You can use the RCW+PBL specific to your board to inform the SoC that
>> > > your platform's refclk 1 is 156 MHz (something which the reset state
>> > > machine seems unable to learn, with protocol 0x3333). You don't have to
>> > > put that in the device tree. You don't have to push code to any open
>> > > source project to expose your platform specific details. Then, just like
>> > > in the case of the Lynx 28G driver on LX2160, the SERDES driver could
>> > > just treat the PLL configuration as read-only, which would greatly
>> > > simplify things and eliminate the need for a clk driver.
>> > > 
>> > > Here is an illustrative example (sorry, I don't have a board with the
>> > > right refclk on that PLL, to verify all the way):
>> > > 
>> > > ... snip ...
>> > 
>> > (which of course complicates the process of building the PBIs...)
>> 
>> Maybe this is the language barrier, but what are you trying to say here?
> 
> I said that I don't understand. Can you please clarify what you were
> trying to transmit with this comment?

Well, right now I produce my RCWs by generating a second RCW with e.g.
1133 replaced by 3333. But doing this is a more involved change. Just a
minor issue, really. That said, I don't think this is the best approach
moving forward. Much like many other platforms, users should be able to
plug in an SFP module and Linux should configure things appropriately.
An RCW approach requires some kind of configuration tool to swap out the
bootloaders, which isn't as good of a user experience.

--Sean
