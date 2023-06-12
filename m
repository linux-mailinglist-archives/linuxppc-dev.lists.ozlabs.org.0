Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3CB72D0E9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 22:47:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=Tc48mo7/;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=Tc48mo7/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qg3fZ4wkFz30Pm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 06:47:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=Tc48mo7/;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=Tc48mo7/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe1e::325; helo=eur01-he1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=lists.ozlabs.org)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01hn0325.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1e::325])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qg3dY4Rjvz2xq2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 06:46:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WZU4NJiEeTIJcT5/NpobxXlKuSOf9QTCkRWtL0wIgc=;
 b=Tc48mo7/ZFbGX/eFyHHQzkNSWu0aFCy7Y2o2PnjiJnEIueMvZo81iOXRomAEmsiiic5RUI5ibEWBcBZQ4hvKbSG2QPvsLaiftuQ0Tn8eAca09n+6n8uxc3Tzm3ngErhyX49BC4IzAxeEX31aR9D/kq+09PPNgHl8tJfYiVvxI762MP7BbOKtsbI/c/zaATULeXV2I7nEhdCoTup8PrJ6BnSX2KWnu+i2JkOk7MLGAS7AQiPV4EKhoeQ8QyB+MAWrH8Opx7+OXH/oDO8b+IuOAK0+M5cFNdi4GyqtBQ26qCUKT3J6C3RVJEyxcwe9hvgT+Rjyw85Eq0SqPinjfefU2A==
Received: from AS9PR05CA0328.eurprd05.prod.outlook.com (2603:10a6:20b:491::33)
 by AM9PR03MB7169.eurprd03.prod.outlook.com (2603:10a6:20b:266::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Mon, 12 Jun
 2023 20:46:31 +0000
Received: from AM6EUR05FT025.eop-eur05.prod.protection.outlook.com
 (2603:10a6:20b:491:cafe::3) by AS9PR05CA0328.outlook.office365.com
 (2603:10a6:20b:491::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.34 via Frontend
 Transport; Mon, 12 Jun 2023 20:46:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.86)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.86 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.86; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.86) by
 AM6EUR05FT025.mail.protection.outlook.com (10.233.240.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.22 via Frontend Transport; Mon, 12 Jun 2023 20:46:30 +0000
Received: from outmta (unknown [192.168.82.133])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 58D2220080091;
	Mon, 12 Jun 2023 20:46:30 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown [104.47.17.169])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 017C720080073;
	Mon, 12 Jun 2023 20:50:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fgVQWPC9f8Hn5+iijQit0ZuwcRzeuRXj9cPshQ6T0XY0BPiv0IzLMijap853wq5gc3kcMQ8bbmT1CaU6iUFSYxfK4divPCiss0IHorVKIolUMEdLpNwcVTDacRYOcn9SGiJLuhHULY08tqDJUPgLHIijXXDcE/y3tvxSjakxO7Nbrpwy4kB4NcGPQP5yjEXGwVUeoNhcqCW4XrSSemrk+vs1GQfc0Ude/yAW35gsff85W2y/h01pvU5f7t87jmCTzLJmtLfW/4Z/YbNohFtwPEQHtm4auSktFng5gf+OE3xJoHmAF29LeNHkCo0Xj5SSnFvWu/2S32x8Am8BrhxOxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WZU4NJiEeTIJcT5/NpobxXlKuSOf9QTCkRWtL0wIgc=;
 b=Ly44mz+slmfVl4f8GA3SP3Wvok7y6b217WJ7TsVXXUG2YKPusCRUHm9JGcnbpBdD74K4M3re8Tuf0T4qGFOS0daZJ6sPbUlPfEde2i0T/HxbC9fqylivt3pEYjIiDVrHts0QEPfbqErD9UFUa3u+WlKeHtJ2Cgu/kr88KxsYAUhyZBYFWja1hNGeAMWAa8xOmdFuAHnl+cS5etiWkRU2iKAOaVMm2ozW6Ly2wMnwazNKaPEQ2ev8M7SJHJxGOwGzgvidg9vA3Pg4eDZimn8Mm1uj4jncLAA9ZxNf0zRoGzCd/Y5xTtjPKbAChsyi/chlDxMNDcYNQV348rDBe7LiEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WZU4NJiEeTIJcT5/NpobxXlKuSOf9QTCkRWtL0wIgc=;
 b=Tc48mo7/ZFbGX/eFyHHQzkNSWu0aFCy7Y2o2PnjiJnEIueMvZo81iOXRomAEmsiiic5RUI5ibEWBcBZQ4hvKbSG2QPvsLaiftuQ0Tn8eAca09n+6n8uxc3Tzm3ngErhyX49BC4IzAxeEX31aR9D/kq+09PPNgHl8tJfYiVvxI762MP7BbOKtsbI/c/zaATULeXV2I7nEhdCoTup8PrJ6BnSX2KWnu+i2JkOk7MLGAS7AQiPV4EKhoeQ8QyB+MAWrH8Opx7+OXH/oDO8b+IuOAK0+M5cFNdi4GyqtBQ26qCUKT3J6C3RVJEyxcwe9hvgT+Rjyw85Eq0SqPinjfefU2A==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by PAXPR03MB7548.eurprd03.prod.outlook.com (2603:10a6:102:1db::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 12 Jun
 2023 20:46:22 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::d632:8122:75f7:7b0e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::d632:8122:75f7:7b0e%3]) with mapi id 15.20.6455.045; Mon, 12 Jun 2023
 20:46:21 +0000
Message-ID: <1dd01fe2-08a8-ec2f-1184-a58b2f55ba85@seco.com>
Date: Mon, 12 Jun 2023 16:46:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v14 00/15] phy: Add support for Lynx 10G SerDes
Content-Language: en-US
To: Vladimir Oltean <vladimir.oltean@nxp.com>
References: <20230426105140.t4yqv6irtjcwptm5@skbuf>
 <7c7ab84b-3c4a-4e44-b5b5-4acf733a0246@seco.com>
 <7c7ab84b-3c4a-4e44-b5b5-4acf733a0246@seco.com>
 <20230429172422.vc35tnwkekfieoru@skbuf>
 <c81d23b6-ed22-0b37-d71b-ddce9d5d58eb@seco.com>
 <c2f928d2-25f6-0e31-9ab3-9d585968df1b@seco.com>
 <20230522150010.q5zndfwcuvrb6pg2@skbuf>
 <22a28a6f-2c84-a6b1-bb57-a269af34c993@seco.com>
 <20230610222123.mzmfjx7zfw4nh2lo@skbuf>
 <c702e2b6-cb0f-4ac9-86fe-a220284d45aa@seco.com>
 <20230612163353.dwouatvqbuo6h4ea@skbuf>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20230612163353.dwouatvqbuo6h4ea@skbuf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR01CA0001.prod.exchangelabs.com (2603:10b6:208:71::14)
 To DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|PAXPR03MB7548:EE_|AM6EUR05FT025:EE_|AM9PR03MB7169:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d57c4d5-9fe1-400d-a7fd-08db6b8619dd
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  yG1q7L0l7oznMaSKWRKnF3rtdsluiuP1mylk+HTUGMno0sfPBbTVBKNnYs+EMIbxZLQyQXksyKMkq5XUDpTi1fIn3RshOzNj97iGn9Ev39WyKk6kcg7RFLA4cMGsrdQJJ9hO3UQqaj+WzXPAy6viI5U7YBjxhcGC5QSZggmP14ubZGx3V5ycY9CUYdI+Ub8E4ULP/PNJooZrzxJjeyejEMluFqQc0JyJBDPIWrscv0FYt4+Xz9PbVzTkUMvQI2R7CaZGhQU76ihwXyo8sLa8zpnGP69cRZzdr87xyn2oLIChC/IwirkcKBGVsoKDeqQL+TEfFVyqTAvyy/K695nvXrWaZ0v7p5GNBM8rChF0uSa6ETeQGlZqfKZSXhwsrCnEK64w+0JK3fYwAem8r6newS6CIzB+9O7SK1mu/0Y7lDe25cfDKvn2+2dAn1OnyIbBTfVVml4o7UeMPp4pJ2w/is1GJi0AXy+xuOZJCitZQAdbsHbPsUV4DITUxwF+vQSa481UHorL9nXnmpNtrhDlipbdcJ6U9gRi6gi+OYpwVpyoBT3idyMgYrG0Sa87oeFeWri4fq8sugwN9rOM+mx7eUKfcDZTW/5u4V26yZXCm6lSRIaI2/G5QjJ2JO0mdGA1D5bujJh/tp5qWGEvQRNJnr6sUE5T/kFg8ozctGH9BtPBcB22pqroAasbDDZuqAIV
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(39850400004)(136003)(376002)(396003)(451199021)(52116002)(6486002)(6666004)(36756003)(83380400001)(2616005)(38350700002)(31696002)(38100700002)(86362001)(6506007)(53546011)(6512007)(26005)(186003)(2906002)(54906003)(66476007)(4326008)(44832011)(316002)(7416002)(6916009)(66556008)(31686004)(41300700001)(5660300002)(478600001)(66946007)(8936002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7548
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  AM6EUR05FT025.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	05a29540-3560-4880-6556-08db6b861464
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	0Z2XC+ceVo9ELcdMdE2tCD7pTL8elkK28UMCjeLKN0WhRADQouwI13GaebuhbGuBWnMH4dyp/xI3R9X2KZrza74L8CR7lfB81EhdE96eefkWTOimPLX1VnmCwU5skf7PB4JCC7A2f2bLfFDI90E92bBDllFW+8+fxRd4BIWfi1scng5hL2aA7ECr5U7jcUxJWpdBAvcO7LGo9FqNXNybORYeO86yzoyKIE5Vuq+UPjMUVERuguG4YjL6bRu4y31AtkaKXf1XMqCZ0WROecMmn3ZpTWoUtlEd1qjF1TvYb1XzvAwrB5AExZmBf+r4XR+xZs6ZSN+c2nbDZsH/L4Ewvuksa2Ihd646MjKAHlB+q+475zr77L0RTW6S30hdsY3EiK+0/RechjTERJ7JrO2T1Ycm/6I5jUl12Od6+AbiNcWM82xtwMGUkc9JjdH92BI5kSICB+AymgFiHdfJV7VE8Q/jWih28zXmtdv0ODZmNDtFyjI+ye5hRTOw/9HMCBGwtPdRCfEQCA4z7uuhblrXQkyLKEhrUQjYriezjZ8WuWB2jfWC7u2tYxpBWw7oYGy3KqyyoP7z8mKUsQTFY5AdO50EDGGcLED2VoWomhqpN5wdP9orZNRfIQqm4/XSPouKM2+aosfpEGNXg+d2MMVhizVj0/JV57Jb43X9YGZjCZx2GSpuCl6MLLggbQo00dunbVUwycgYJfOUe1XiIq9kgO9dVmELcfmoQuC9+bgNGhc08CWITZwltYf4MubTGxg4tryXL8gNUwDTJzrde51AUY9c4d5wvE78dm49WXS8clz6B2J/x60njljlc7sbiZJ/5AN1sHv/+Y52vx0/aIjuIA==
X-Forefront-Antispam-Report: 	CIP:20.160.56.86;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(136003)(346002)(39850400004)(396003)(376002)(5400799015)(451199021)(40470700004)(36840700001)(46966006)(5660300002)(40480700001)(6486002)(54906003)(7636003)(82740400003)(7596003)(356005)(6916009)(41300700001)(8936002)(8676002)(4326008)(70586007)(70206006)(316002)(2616005)(478600001)(186003)(36860700001)(83380400001)(6666004)(6512007)(336012)(6506007)(26005)(53546011)(34070700002)(47076005)(40460700003)(31696002)(86362001)(82310400005)(7416002)(44832011)(2906002)(36756003)(31686004)(43740500002)(12100799033);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 20:46:30.6334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d57c4d5-9fe1-400d-a7fd-08db6b8619dd
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.86];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	AM6EUR05FT025.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7169
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

On 6/12/23 12:33, Vladimir Oltean wrote:
> On Mon, Jun 12, 2023 at 10:35:21AM -0400, Sean Anderson wrote:
>> > And if SERDES protocol switching was not physically possible, would this
>> > patch set still have value?

More to the point, did you make any progress in this area?

>> Yes. To e.g. set up SGMII25 or to fix the clocking situation.
> 
> Let me analyze the reasons one by one.
> 
> The clocking situation only exists due to a hope that protocol changing
> would be possible. If you were sure it wasn't possible, your board would
> have had refclks set up for protocol 3333 via the supported PLL mapping 2222.
> In essence, I consider this almost a non-argument, as it fixes a
> self-inflicted problem.

2222 also does not work, as outlined above.

The clocking is incompatible, and must be fixed by software.

The only thing self-inflicted is NXP's conflicting design.

> Have you actually tested changing individual lanes from SGMII to SGMII 2.5?
> I know it works on LS1028A, but I don't know if that's also true on LS1046A.
> Your comments do say "LYNX_PROTO_SGMII25, /* Not tested */".

Not yet. 

This driver would also be a good place to add the KR link training with
NXP tried to upstream a few years ago.

> Assuming a start from SERDES protocol 3333 with PLL mapping 2222,
> this protocol change implies powering on PLL 1 (reset state machine
> wants it to be disabled) and moving those lanes from PLL 2 to PLL 1.
> 
> At first sight you might appear to have a point related to the fact that
> PLL register writes are necessary, and thus this whole shebang is necessary.
> But this can all be done using PBI commands, with the added benefit that
> U-Boot can also use those SERDES networking ports, and not just Linux.
> You can use the RCW+PBL specific to your board to inform the SoC that
> your platform's refclk 1 is 156 MHz (something which the reset state
> machine seems unable to learn, with protocol 0x3333). You don't have to
> put that in the device tree. You don't have to push code to any open
> source project to expose your platform specific details. Then, just like
> in the case of the Lynx 28G driver on LX2160, the SERDES driver could
> just treat the PLL configuration as read-only, which would greatly
> simplify things and eliminate the need for a clk driver.
> 
> Here is an illustrative example (sorry, I don't have a board with the
> right refclk on that PLL, to verify all the way):
> 
> ... snip ...

(which of course complicates the process of building the PBIs...)

> In short, I believe the reasons you have cited do not justify the
> complexity of the solution that you propose.

The work is done, and it is certainly more flexible than what you
propose. E.g. imagine a clock which needs to be configured before it has
the correct frequency. Such a thing is difficult to do in a PBI solution,
but is trivial in Linux.

--Sean
