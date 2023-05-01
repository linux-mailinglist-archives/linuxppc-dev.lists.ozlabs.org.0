Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D41436F3270
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 May 2023 17:05:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q962V51Hsz3ch2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 May 2023 01:05:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=KwljsIek;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=KwljsIek;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe02::318; helo=eur01-db5-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=KwljsIek;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=KwljsIek;
	dkim-atps=neutral
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01hn0318.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe02::318])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q961R6S0Lz2ym7
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 May 2023 01:04:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujz8Vaq/WC5zF0heXU3NhJ1NR+Vd0wOizthEMi9rrZ4=;
 b=KwljsIek9oPb+XOZLdnjWbwPwHMrkzii2vqftw5/MekXR1eknie1yHZvI056IOPmauBoOfm3G/hiJejkdUnCGZur8kfG5h/UYIZSY8dkt6unSB8eb5sAc1DRE3pX4e+UTkUOgndU4jCFS/yOgWlNc+O2llIq5J36wJWWu/wFYkHyY/TLqizDbiMpanFD5TBYtbJuPdUo9TC4Y+Ioi0+IAn9MbfnvxOjpcxhJe0+j1SednxERJPnfBhT9xrqP9aWj1xRIMD4QCO3pR+4IfuUYd8u4QlnrcrCKtgTm+T9zCZcSZ73Gl5QbYCO/fJ7v19WLTvH9juUAVrHNUPo4UqJI9w==
Received: from AM5PR0602CA0018.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::28) by AM9PR03MB6708.eurprd03.prod.outlook.com
 (2603:10a6:20b:2da::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 15:03:49 +0000
Received: from VI1EUR05FT048.eop-eur05.prod.protection.outlook.com
 (2603:10a6:203:a3:cafe::9b) by AM5PR0602CA0018.outlook.office365.com
 (2603:10a6:203:a3::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30 via Frontend
 Transport; Mon, 1 May 2023 15:03:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.82)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.82 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.82; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.82) by
 VI1EUR05FT048.mail.protection.outlook.com (10.233.243.188) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.19 via Frontend Transport; Mon, 1 May 2023 15:03:48 +0000
Received: from outmta (unknown [192.168.82.135])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 3A71620080097;
	Mon,  1 May 2023 15:03:48 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown [104.47.14.51])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 3CD9B20080073;
	Mon,  1 May 2023 15:03:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iYa2o5sxqmQOyEI8l817AkKtpB4e79g3LzCVCzgkt4Er4K61KWmymdCINhPwJSS5jxCyBetHtPy8BaITFK/y8RR40UGfMmHk64o4IL9boZTswjOK0ZWiVckAlKtXDlL7I0SAiWQcMhqgJwzIEpFOxE7lnAPNdeKqkiWsuVpB/nVUBszj9jcR6ZOxisHsyGo3GFMLUxiB1gJN7OpYv8QXKuwIm7QJ0rBKr3XFAxL2eRt+vdTmQPPMChcwyit6aSB4TgcO0jI4ZMGpOTEeG2TBZdvTj2sKmNNXgKxIsFqerWHrU0L6HkZCPPVoKttBddpQnR6iZNYYdp9+kTk/aqsjgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujz8Vaq/WC5zF0heXU3NhJ1NR+Vd0wOizthEMi9rrZ4=;
 b=ZIU4OCsVaQ4oaGOlBgidL/v59szT2sFBRixz1aA4tCi87MfTZqswb1iHtaIk9kNJytkVs5RvRNW8V+4+hi4Q8nB9je2BQF3NI1Zx2g2iBy+RHn69BIteE9Sn193haky0QEwSV4uB8s5P7QsyfnwHZPjcMcbb+RUl3E8fGNiOwq64lXXsoshMlCxwHwBbbVeOFE7uDH/djgW535LAXyo/W4pf2HORq+uDrs6lnRN9PQ0Dsmd8AeCCrb7AiDR7EH0p9IB5XhgDmGv3zeKBjE9Wh/X+6mQT3VmBEHq5nmaOsKpDOjfqhET1z8qke0CXNNv0llGlXq/oisjGx+Gk0/YrDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujz8Vaq/WC5zF0heXU3NhJ1NR+Vd0wOizthEMi9rrZ4=;
 b=KwljsIek9oPb+XOZLdnjWbwPwHMrkzii2vqftw5/MekXR1eknie1yHZvI056IOPmauBoOfm3G/hiJejkdUnCGZur8kfG5h/UYIZSY8dkt6unSB8eb5sAc1DRE3pX4e+UTkUOgndU4jCFS/yOgWlNc+O2llIq5J36wJWWu/wFYkHyY/TLqizDbiMpanFD5TBYtbJuPdUo9TC4Y+Ioi0+IAn9MbfnvxOjpcxhJe0+j1SednxERJPnfBhT9xrqP9aWj1xRIMD4QCO3pR+4IfuUYd8u4QlnrcrCKtgTm+T9zCZcSZ73Gl5QbYCO/fJ7v19WLTvH9juUAVrHNUPo4UqJI9w==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS2PR03MB9720.eurprd03.prod.outlook.com (2603:10a6:20b:60c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 15:03:40 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::d632:8122:75f7:7b0e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::d632:8122:75f7:7b0e%3]) with mapi id 15.20.6340.026; Mon, 1 May 2023
 15:03:40 +0000
Message-ID: <c81d23b6-ed22-0b37-d71b-ddce9d5d58eb@seco.com>
Date: Mon, 1 May 2023 11:03:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v14 00/15] phy: Add support for Lynx 10G SerDes
Content-Language: en-US
To: Vladimir Oltean <vladimir.oltean@nxp.com>
References: <20230425195002.fls5cmwolyrslpad@skbuf>
 <b7779674-c3ac-e0ab-3ca8-db1ec5953a97@seco.com>
 <20230426105140.t4yqv6irtjcwptm5@skbuf>
 <20230425195002.fls5cmwolyrslpad@skbuf>
 <b7779674-c3ac-e0ab-3ca8-db1ec5953a97@seco.com>
 <20230426105140.t4yqv6irtjcwptm5@skbuf>
 <7c7ab84b-3c4a-4e44-b5b5-4acf733a0246@seco.com>
 <7c7ab84b-3c4a-4e44-b5b5-4acf733a0246@seco.com>
 <20230429172422.vc35tnwkekfieoru@skbuf>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20230429172422.vc35tnwkekfieoru@skbuf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0070.prod.exchangelabs.com (2603:10b6:a03:94::47)
 To DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS2PR03MB9720:EE_|VI1EUR05FT048:EE_|AM9PR03MB6708:EE_
X-MS-Office365-Filtering-Correlation-Id: 740ebef5-3fbb-40eb-a9f3-08db4a554496
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  oYDMIWYmn0bDW16ssgclvuP5oNqewTKMuAlxeR7PZdHaAnN6TCN8xnVpVT79QF0/zfgQuv1famjvyfAEZIldAD1G0BOESf+lWLz/yOjsWTvspZPVZnbLCEcHsUCBPfF9zS/8US4hOszUOVLJMoXRiA/nAvLR8haCvCMjv/pTevs/4xd9IiwKCTvh/uxy/1UafCnNSRsYk2nn3nKRpM/iA5Dm08xv+bmiePb0JkSJHvmGIdfm82+C5YfppC+d2rr7EJ3GkEWfLvKVs/Cn3PoRrBP/Q3hHD/dX39GYapIMPUvawX0eaQBg9YMv6iER4ogGDhA00ITPMM+GaPJqVIMIb4FtimTHQK2RHue5+gXTcxO78WBCRFk7OD4OESraYb3H8BzpvfeT+fXuZoJLLvO95a+wIpp3MDoWUdnploqA7zI1l5EVkV93PHWZ0iDEj2iyU9st8YXYsPVTVnUNiz5W2CsNoAHs4q3WZmVwY6+trRDU7g8AvRaX6Mv10MBJQJD7lcfxqV2hlRd8CDLCbt9PCQcRHrIykfpnyYGiH/hmqtv96PdF5JtmnSzlab8ca2B5pXVIezdGs06igBCXq/fBPZtX4dX8J73XI5O3apjrgpSKEdIAkzDbz37nUO4SfrJiOF9rZqHeoKCYuRgR4aCjcLROOmZZbSrUG8HMCW3N+hDLh7zMlI0BcazOFD5Juhbo
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(396003)(39840400004)(346002)(376002)(451199021)(66946007)(5660300002)(7416002)(8676002)(8936002)(44832011)(41300700001)(66899021)(316002)(36756003)(31696002)(86362001)(38350700002)(2906002)(38100700002)(31686004)(186003)(478600001)(2616005)(83380400001)(6486002)(52116002)(6666004)(53546011)(6506007)(6512007)(26005)(4326008)(54906003)(6916009)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9720
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT048.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	a825f5f8-6692-4cc6-bef2-08db4a553f5f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	rlWVjl/na7Cwrv2CArafhQVbiLB4Od4G4yi1TaQarJgzSwbVkuPxWo6CMAtGWoHwxslzG3CrYUH5VU65wLAxvdWs45AWDkra/5/tbokRtfMEQlf+qzll0MSKa2FjrstYYYqcshSA2005n0a0caEUfTHMIMYgmx4Ylnz5g2Zj63n9DNDHjPGJta2EwUMf/cjKCbG6suGG5+1GiYHWd9pvft6E2Ofo3oppG4KNanGMcYRmQpJ4KmJ8fFOHpmj6tIAP/OkucccZi7zL38OoWqTJ7bySGLDbg8PFV7crln6HgoekvA2P1XEuaG8LCTjD6ElyYtUIZQTFaKWKDrCdrt08qAN1KvY9ppOsts7jO7ZoKEO1Gm9dctjzOFZYB2jT7sfFTk/lZDe4sLPTFj0WkJ4isdBL2Yzt81aIxi/rYuE4/kHgcpTafsj/2VOjLf1Y6zvWsZeOPyEBlpZcLorri4HKJ3mR2cDU7Vp1pZKNR5riexUZbOluKKs1Z3tNIoe2Y9kR+7kdLEs1a511f05W2AWkcDgY/6mwae15C5KvjAxlKbBmcr8oao874GJIaORJw1gmJAEcIsET23wkPFuscsE1O9X9taORKVODg4ba16kzoj5LVfAYL1aiCT69ZcLCaQ/eX7DMh9r30DPzUaqWef8SIQWiSBDI1J0p+NGyez0WihnmW0Y4VOSW5Og0nrzUHGyEFkFdcmDUr4N5pmzIqq/UiBG5GugcbwTaI2MvDNNW4+23gPmNtXkPCRgQrHK9I7mW6vRqB7Xikx229fjGAEKlvg==
X-Forefront-Antispam-Report: 	CIP:20.160.56.82;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(136003)(346002)(396003)(39840400004)(376002)(5400799015)(451199021)(46966006)(36840700001)(6916009)(66899021)(31686004)(2616005)(316002)(6512007)(6506007)(4326008)(53546011)(40480700001)(82310400005)(8936002)(34020700004)(44832011)(8676002)(7416002)(31696002)(86362001)(5660300002)(186003)(70586007)(54906003)(26005)(70206006)(478600001)(41300700001)(36860700001)(83380400001)(47076005)(336012)(36756003)(7636003)(7596003)(356005)(2906002)(6486002)(6666004)(43740500002)(12100799030);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 15:03:48.5519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 740ebef5-3fbb-40eb-a9f3-08db4a554496
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.82];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT048.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6708
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

On 4/29/23 13:24, Vladimir Oltean wrote:
> On Wed, Apr 26, 2023 at 10:50:17AM -0400, Sean Anderson wrote:
>> > I need to catch up with 14 rounds of patches from you and with the
>> > discussions that took place on each version, and understand how you
>> > responded to feedback like "don't remove PHY interrupts without finding
>> > out why they don't work"
>> 
>> All I can say is that
>> 
>> - It doesn't work on my board
>> - The traces are on the bottom of the PCB
>> - The signal goes through an FPGA which (unlike the LS1046ARDB) is closed-source
> 
> I don't understand the distinction you are making here. Are the sources
> for QIXIS bit streams public for any Layerscape board?

Correct. The sources for the LS1046ARDB QIXIS are available for download.

>> - The alternative is polling once a second (not terribly intensive)
> 
> It makes a difference to performance (forwarded packets per second), believe it or not.

I don't. Please elaborate how link status latency from the phy affects performance.

>> 
>> I think it's very reasonable to make this change. Anyway, it's in a separate
>> patch so that it can be applied independently.
> 
> Perhaps better phrased: "discussed separately"...
> 
>> > Even if the SERDES and PLL drivers "work for you" in the current form,
>> > I doubt the usefulness of a PLL driver if you have to disconnect the
>> > SoC's reset request signal on the board to not be stuck in a reboot loop.
>> 
>> I would like to emphasize that this has *nothing to do with this driver*.
>> This behavior is part of the boot ROM (or something like it) and occurs before
>> any user code has ever executed. The problem of course is that certain RCWs
>> expect the reference clocks to be in certain (incompatible) configurations,
>> and will fail the boot without a lock. I think this is rather silly (since
>> you only need PLL lock when you actually want to use the serdes), but that's
>> how it is. And of course, this is only necessary because I was unable to get
>> major reconfiguration to work. In an ideal world, you could always boot with
>> the same RCW (with PLL config matching the board) and choose the major protocol
>> at runtime.
> 
> Could you please tell me what are the reference clock frequencies that
> your board provides at boot time to the 2 PLLs, and which SERDES
> protocol out of those 2 (1133 and 3333) boots correctly (no RESET_REQ
> hacks necessary) with those refclks? I will try to get a LS1046A-QDS
> where I boot from the same refclk + SERDES protocol configuration as
> you, and use PBI commands in the RCW to reconfigure the lanes (PLL
> selection and protocol registers) for the other mode, while keeping the
> FRATE_SEL of the PLLs unmodified.

 From table 31-1 in the RM, the PLL mapping for 1133 is 2211, and the
 PLL mapping for 3333 is 2222. As a consequence, for 1133, PLL 2 must be
 156.25 MHz and PLL 1 must be either 100 or 125 MHz. And for 3333, PLL 2
 must be either 100 or 125 MHz, and PLL 1 should be shut down (as it is
 unused). This conflict for PLL 2 means that the same reference clock
 configuration cannot work for both 1133 and 3333. In one of the
 configurations, SRDS_RST_RR will be set in RSTRQSR1. On our board,
 reference clock 1 is 156.25 MHz, and reference clock 2 is 125 MHz.
 Therefore, 3333 will fail to boot. Unfortunately, this reset request
 occurs before any user-configurable code has run (except the RCW), so
 it is not possible to fix this issue with e.g. PBI.

 --Sean
 not 
