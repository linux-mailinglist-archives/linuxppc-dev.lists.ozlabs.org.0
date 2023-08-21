Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8227782FA1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Aug 2023 19:47:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=qo2hK3DK;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=qo2hK3DK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RV0L44qstz3bTN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 03:47:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=qo2hK3DK;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=qo2hK3DK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=52.100.13.203; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03hn2203.outbound.protection.outlook.com [52.100.13.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RV0K61zHkz2xr6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 03:46:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Do0ES/R4n0uKe8HW7ooeCtg6QCSVQDmGAwLgHrpy2s=;
 b=qo2hK3DKcSN8kSGUGh3SUObYI6ZgezLMsYtJ1yL3uVTlv/2KWJNjMQrG8a293gtXG/N5Qu4uDO8tpUi/QkTKp4DpjQUeAxEd9dRpRdjMppI2IH80M6yQWlERtcw6lGZjNkXVw7Q6brB6S56fglGsmJO/6M0cUtes9mQVVH6/kg9/+2R7W9crsCfsI43mgdagYCdfD8nXK4WRE6N91sn3JeEwzaoXA+EB8C1FVQxl8mvC5rolsM32thiSHRm+Aph2T82fXYm4c0ZzHGFci9LvWj2p0yjq7tiAyx8vfO8QG+PuTmXEKKC/UZcfgGeqNjuPD3n6JMSb3f1IX+IdgZxQrA==
Received: from DU2PR04CA0224.eurprd04.prod.outlook.com (2603:10a6:10:2b1::19)
 by AS8PR03MB9045.eurprd03.prod.outlook.com (2603:10a6:20b:5b8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 17:46:11 +0000
Received: from DB8EUR05FT056.eop-eur05.prod.protection.outlook.com
 (2603:10a6:10:2b1:cafe::b) by DU2PR04CA0224.outlook.office365.com
 (2603:10a6:10:2b1::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Mon, 21 Aug 2023 17:46:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.84)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.84 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.84; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.84) by
 DB8EUR05FT056.mail.protection.outlook.com (10.233.238.156) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6723.11 via Frontend Transport; Mon, 21 Aug 2023 17:46:11 +0000
Received: from outmta (unknown [192.168.82.132])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id D9AE920080096;
	Mon, 21 Aug 2023 17:46:10 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown [104.47.12.52])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 33DAC2008006F;
	Mon, 21 Aug 2023 17:46:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZOst99BlDDp+GIduCzISKJNhVdR2foWYn8UQNFVZivpMW/SE0Wjg25lRUDiX34YNLh7MoO1YuGuwEY6PrQkdUOHBKEmJbW1XhJ59HhhylEbw4GnHk/umHRzGAqeTioYKhrwYnp9QCkjCFQq12GZsil186Irm/6z4S7eVv13kB8I/NTfIGCYpslHfN1QhLVVh4VGfMDhHXALBFbTxSZBZxw44NVf6xG16veTN2mLD5oJ0QOO7yqbSwo0asLIDidwfAyFo53Xf04Pjrp3Q8HLxbEx9i66dz7tWszSKq8CjBza5uJPdT0g/utfGoQms4R9SEone5cRLX63mQ9CsaPp00w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Do0ES/R4n0uKe8HW7ooeCtg6QCSVQDmGAwLgHrpy2s=;
 b=aHipUbkd6MTJx4te2M6jswJNueUCMZT0OIQvq0izZBz8isKZJf17VEAKDW+a6ohIuH6ourEAaOkc+kas+5tmV7hk58uFd1RAz+QzHBihpXqoh5buA8l9C1d21q2LJYkUz5fcreNo6gK8e1HsSMDBXmzJ15VoXcxBNxFbZiY9qNcgphoeBahPaco9eOwRp38HTMcsqkalMVMX9Jv77qzTVwHn9ytT5sFC5AeuSftXp9m0G397YrvBaD3mhU/pQleHCV424rxpLmqDk75MV+NprGdps0/0Mp+4RgnKqYClM7jzS6ynW0ODPTmt/qVPLq3z4v4WRlei35l1wlxbNc23vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Do0ES/R4n0uKe8HW7ooeCtg6QCSVQDmGAwLgHrpy2s=;
 b=qo2hK3DKcSN8kSGUGh3SUObYI6ZgezLMsYtJ1yL3uVTlv/2KWJNjMQrG8a293gtXG/N5Qu4uDO8tpUi/QkTKp4DpjQUeAxEd9dRpRdjMppI2IH80M6yQWlERtcw6lGZjNkXVw7Q6brB6S56fglGsmJO/6M0cUtes9mQVVH6/kg9/+2R7W9crsCfsI43mgdagYCdfD8nXK4WRE6N91sn3JeEwzaoXA+EB8C1FVQxl8mvC5rolsM32thiSHRm+Aph2T82fXYm4c0ZzHGFci9LvWj2p0yjq7tiAyx8vfO8QG+PuTmXEKKC/UZcfgGeqNjuPD3n6JMSb3f1IX+IdgZxQrA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by PR3PR03MB6377.eurprd03.prod.outlook.com (2603:10a6:102:74::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 17:45:59 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::21bd:6579:b3d1:e5f7]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::21bd:6579:b3d1:e5f7%5]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 17:45:59 +0000
Message-ID: <a2e3fcad-9857-f1b3-8ada-efb2013a4bf5@seco.com>
Date: Mon, 21 Aug 2023 13:45:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v14 00/15] phy: Add support for Lynx 10G SerDes
Content-Language: en-US
To: Vladimir Oltean <vladimir.oltean@nxp.com>
References: <20230522150010.q5zndfwcuvrb6pg2@skbuf>
 <22a28a6f-2c84-a6b1-bb57-a269af34c993@seco.com>
 <20230610222123.mzmfjx7zfw4nh2lo@skbuf>
 <c702e2b6-cb0f-4ac9-86fe-a220284d45aa@seco.com>
 <20230612163353.dwouatvqbuo6h4ea@skbuf>
 <1dd01fe2-08a8-ec2f-1184-a58b2f55ba85@seco.com>
 <20230613142754.wr5njtjo4tbloqwu@skbuf>
 <20230811150826.urp2hzl3tahesrjx@skbuf>
 <26623d0c-8a5a-614b-7df7-69214aaec524@seco.com>
 <20230811163637.bs7a46juasjgnmf4@skbuf>
 <20230821124952.mraqqp7pxlo56gkh@skbuf>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20230821124952.mraqqp7pxlo56gkh@skbuf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::29) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|PR3PR03MB6377:EE_|DB8EUR05FT056:EE_|AS8PR03MB9045:EE_
X-MS-Office365-Filtering-Correlation-Id: d8d6eeaf-d0cc-4a1d-74c4-08dba26e81de
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  1TSxz1u6DyWY9KWp8JodjdZTADc7VOUh0LN3rDh6oxvTxE6jfasxaA3mcHjD6Yao43WpEZ29hm1mLli1htFZv/YU8GNF7+7rQRO7BizTddh8v2kmH1800zW/9SW1fpoIOJ2pAyO+0kJUHAsLLKj9L1/A3Np09JdGJX0hgJRrN+OLGTGosadKgRoMSi6/ZaioVzcxSLeqi25+Pk8naYk4/NzH8UQtBDUU48H5d9TLE13lSL8gJjRW6D3CFpc5k0YmTehCMLM/ssphkGKa7B7zXxv10cGH6Z5k3lXbk9T/RYNL/o/8UT+TJthqsq9s/xi2XLr5dV3K56s84NmA8xaZqrxHrvy2VvJA9M0PiMrNWxrMMUDJK7rBiScIa7Y2ey4ZEIAMTPb/NLY6ULZznJrRy3S3S9IX61Btvm1Kmxm80l3KD8uXPA0vRqN5Ks5HDmvustfp40huwSS10EsBXZAHzvQkilxm7080w8d5BHZ379yl3QbpE0UrH+7p18G7I24o7c5akZP0pZNcoVYU4DA6dPBl6ldDmW1Xv0FutyzPq0bCYKm99BTtSo4VQDjiDMcmAc2fs2fz0/HV6WEjAcsX/XjjfjerKZ9oY8Ed6zdQOi3mcVLD+wfcH1r6Ey/x3DQ97eNazUKTx8RAwYCCc9mUGY1bPXp7NvDAJ00sQfiOo46LoobQ1dt24nKZdYTQR50M
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(136003)(346002)(366004)(396003)(376002)(451199024)(1800799009)(186009)(36756003)(316002)(54906003)(66476007)(66556008)(66946007)(6916009)(2906002)(31686004)(7416002)(44832011)(5660300002)(4326008)(8936002)(8676002)(26005)(6506007)(52116002)(6512007)(53546011)(6486002)(41300700001)(83380400001)(478600001)(6666004)(38100700002)(31696002)(38350700002)(2616005)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6377
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB8EUR05FT056.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	066c17d3-cd3d-484b-a868-08dba26e7a76
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	19vnDFT8CPB1Fctn+EcmraMhqke7NBuQh10Ir/UBpkiX1/bHtD1OLmPpOD8sFriwz5SVNae3ujzvjlJHrHD9GS6TL7QDvaSIigAMklVFhikagLXQIJy/nAKQ5S0yYJHQ/dGuvIZ64DiqLPRxq2nTWh8lrdUVCFzK8WsBtZni7ozk1s5aR6jnWVanspNKfL+RezyOHSLkKDvmCP8rhvvr7ftbqo5z0BistCNAoo0qu9W7sA9n7a7mEQMEOHxC5kmrnrZUkblEsGuStw5FZ5lMyDnYcB6aIpPdhIWKKaQSawVEc5mXVJ4575tAEfw068tu2zU5CBI49cabi75+17Am5RPyAXqQ6LlOYWeetKguFgwcpo8txHMXCn5TekoNaO2Zj8IEHPi4gmSamqRBNM2ED9wDm3vpZqsDEW8bfWJhfsN3jh0k5RGX2VhoyHmJoRWH4gpBYOHv8GIF65kyQybFcZfTIUqguGVEZNx0rmu2JHL6e+ARJoL4/8VnxztZYWisjmRuwUNY8asWpltaFsPZFFU/kiGuhQrxIG8Z7aovgNW2w6tTpHb5H9T82g+llu16e0dscJv1zZLVEjpJ+9wKVt8/Odl4p85wWpqQ1j9ClqmrWzlj0hXfhAuOMo/Rl4cqHV/al1o7A8wuqvLnkXRBLU37wjXbeY/jE/2ai7Fn2o2paEaquMpW17FiVSCsgkFIvNOkoJ+D7Z2zisBKekqVqhpiXzToHwwBxCnmPfVnGGoKp26zP9Pm4nUnVMYabAU6EwkCEV+IUuu3tE1YyMl9mPWxivGgpvATCLyB0Kjpe8bDiARPRcjt/3sxcheAQZcprMdp1TdJcqlHiWk+roI0hQ==
X-Forefront-Antispam-Report: 	CIP:20.160.56.84;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(39850400004)(346002)(186009)(1800799009)(82310400011)(451199024)(5400799018)(46966006)(36840700001)(40470700004)(54906003)(6916009)(70586007)(70206006)(316002)(6512007)(8676002)(34070700002)(8936002)(2616005)(4326008)(7636003)(36756003)(41300700001)(40460700003)(7596003)(356005)(82740400003)(478600001)(6666004)(53546011)(6506007)(40480700001)(6486002)(83380400001)(2906002)(7416002)(86362001)(31686004)(47076005)(36860700001)(31696002)(336012)(44832011)(5660300002)(26005)(43740500002)(12100799039);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 17:46:11.1061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8d6eeaf-d0cc-4a1d-74c4-08dba26e81de
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.84];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB8EUR05FT056.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9045
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

On 8/21/23 08:49, Vladimir Oltean wrote:
> Hi Sean,
> 
> On Fri, Aug 11, 2023 at 07:36:37PM +0300, Vladimir Oltean wrote:
>> Let me explain that approach, because your mention of "swapping out the
>> bootloaders" makes it appear as if you are not visualising what I am
>> proposing.
>> 
>> The Lynx SerDes family has 2 PLLs, and more lanes (4 or 8). Each lane
>> uses one PLL or the other, to derive its protocol frequency. Through the
>> RCW, you provision the 2 PLL frequencies that may be used by the lanes
>> at runtime.
>> 
>> The Lynx 28G SerDes driver reads the PLL frequencies in
>> lynx_28g_pll_read_configuration(), and determines the interface modes
>> supportable by each PLL (this is used by phylink). But it never changes
>> those PLL frequencies, since that operation is practically impossible in
>> the general sense (PLLs are shared by multiple lanes, so changing a PLL
>> frequency disrupts all lanes that use it).
> 
> Is my high-level feedback clear and actionable to you? I am suggesting
> to keep the look and feel the same between the lynx-10g and lynx-28g
> drivers, and to not use "fsl,type" protocols listed in the device tree
> as the immutable source of information for populating mode->protos, but
> instead the current PLL frequency configuration. So this implies that I
> am requesting that the dt-bindings should not contain a listing of the
> supported protocols.

Well, we have two pieces of information we need

- What values do we need to program in the PCCRs to select a particular
  mode? This includes whether to e.g. set the KX bits.
- Implied by the above, what protocols are supported on which lanes?
  This is not strictly necessary, but will certainly solve a lot of
  headscratching.

This information varies between different socs, and different serdes on
the same socs. We can't really look at the RCW or the clocks and figure
out what we need to program. So what are our options?

- We can have a separate compatible for each serdes on each SoC (e.g.
  "fsl,lynx-10g-a"). This was rejected by the devicetree maintainers.
- We can have one compatible for each SoC, and determine the serdes
  based on the address. I would like to avoid this...
- We can stick all the details which vary between serdes/socs into the
  device tree. This is very flexible, since supporting new SoCs is
  mostly a matter of adding a new compatible and writing a new
  devicetree. On the other hand, if you have a bug in your devicetree,
  it's not easy to fix it in the kernel.
- Just don't support protocol switching. The 28G driver does this, which
  is why it only has one compatible. However, supporting protocol
  switching is a core goal of this driver, so dropping support is not an
  option.

I'm open to any other suggestions you have, but this was the best way I
could figure out to get this information to the driver in a way which
would be acceptable to the devicetree folks.

--Sean
