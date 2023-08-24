Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BD97879BE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 22:56:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=YRVUDpnU;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=YRVUDpnU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWwNX6dX5z3c9c
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 06:56:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=YRVUDpnU;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=YRVUDpnU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=52.100.13.244; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03hn2244.outbound.protection.outlook.com [52.100.13.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWwMX43Ynz3c3b
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Aug 2023 06:55:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNug9JjPVrfiif0zjlA2eJ5XEnuv/GBqUbCrlYhFujI=;
 b=YRVUDpnULmXUyqbpFnvseF6hKCyMU1ud8CoQPmKlBZ89yZXLUPebfu1OHiRdpcDTkwJSmbNunDs6qdkwQYxIMmAGqy5PIeQcqK0CjpwPcrLwO4LdWM/934BPecIzwNvik5ox/4OsmzT5p4Lg97ovyLC0IOL8pc6WyZXRIO+mGi1RRfUqfaZP46OyVzvnD1MNXzlZ+dDxq6K2fkotpcF6ZAmA967QBRoGQU95nAMPvwk30Amc9LRtMGv4JMmrabwn/sq/vQ6U+wLAD66oEexVP46ktVo96n//txGGjMz0HjbRyMvoAPqDmkNB4ln31+UitI9J6vGqXEq1UkpNvtqUcA==
Received: from AM0PR03CA0108.eurprd03.prod.outlook.com (2603:10a6:208:69::49)
 by VI1PR03MB10064.eurprd03.prod.outlook.com (2603:10a6:800:1cb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 20:54:55 +0000
Received: from AM6EUR05FT010.eop-eur05.prod.protection.outlook.com
 (2603:10a6:208:69:cafe::95) by AM0PR03CA0108.outlook.office365.com
 (2603:10a6:208:69::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27 via Frontend
 Transport; Thu, 24 Aug 2023 20:54:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.84)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.84 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.84; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.84) by
 AM6EUR05FT010.mail.protection.outlook.com (10.233.240.157) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6723.17 via Frontend Transport; Thu, 24 Aug 2023 20:54:55 +0000
Received: from outmta (unknown [192.168.82.135])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id E5955200813A8;
	Thu, 24 Aug 2023 20:54:54 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown [104.47.0.52])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 3013B2008006E;
	Thu, 24 Aug 2023 20:54:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JByejy3xwhhYaGt1V0BN25ADigkIVTeLzI1aGTkBqbM6CoaOmNWjSo2Po/Ez7Zt2jUGEpsu/Hl/viPrV/O04iqw9a0uXNManl0CWcdh9jzE0/uwGKQVzdyH4L9zB1AAl+5ffi6XvyBvAX19k4HlIiP/NL4ec2EtIgrUxvVWkUiMzQjW24nWV8krTtdS2RfNkmIyrwtlLPLwJAt0om6s8Q9dreFQ54av/CJquYQV7bhusQh0zxrWD/xWLamPgzQJNrL6FfZbVH2RuiUMtySzw8QT+R2NHxL0pOiN14Aq7nTUwp6hiTrSIza8D1V6T7TEhz2airSTCjAwfY4PPJ5CfYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNug9JjPVrfiif0zjlA2eJ5XEnuv/GBqUbCrlYhFujI=;
 b=kBw1R+9eYRdI4oKq5jqAcYWUlx7QYAcnOKo219Ygb6u1+a8dbtH0MewXRi0tmwQA7sS0ZXUTs4PilMo8kjqBtfRwIEqJ1jteKnTAYa4KbJBe10yUmacZMGZ/61MDxN2go5qQ2TkKF6SNtojrqsJHQ7GISA7LhPYMC2N3iTFE8vjx1tr4M6qec7op+PIulpHftjRbVOYWKkL5ocDk021oKVJRdgBgTii6GaLFYmLR7iZzHlbKBAYsgidKLVswvLdj86PVa7uJOqpiKv8YjGOaX+wvaScGXi1s18HtSIbQysUBjdUXBMxu02DYnySM/YcDz6+GjRRWdr8U3h0l/XiAKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNug9JjPVrfiif0zjlA2eJ5XEnuv/GBqUbCrlYhFujI=;
 b=YRVUDpnULmXUyqbpFnvseF6hKCyMU1ud8CoQPmKlBZ89yZXLUPebfu1OHiRdpcDTkwJSmbNunDs6qdkwQYxIMmAGqy5PIeQcqK0CjpwPcrLwO4LdWM/934BPecIzwNvik5ox/4OsmzT5p4Lg97ovyLC0IOL8pc6WyZXRIO+mGi1RRfUqfaZP46OyVzvnD1MNXzlZ+dDxq6K2fkotpcF6ZAmA967QBRoGQU95nAMPvwk30Amc9LRtMGv4JMmrabwn/sq/vQ6U+wLAD66oEexVP46ktVo96n//txGGjMz0HjbRyMvoAPqDmkNB4ln31+UitI9J6vGqXEq1UkpNvtqUcA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS4PR03MB8410.eurprd03.prod.outlook.com (2603:10a6:20b:515::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 20:54:51 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::21bd:6579:b3d1:e5f7]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::21bd:6579:b3d1:e5f7%5]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 20:54:50 +0000
Message-ID: <72bd2b69-7dca-c253-2cb1-4b750b25949b@seco.com>
Date: Thu, 24 Aug 2023 16:54:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v14 00/15] phy: Add support for Lynx 10G SerDes
Content-Language: en-US
To: Ioana Ciornei <ioana.ciornei@nxp.com>
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
 <20230822145512.pc6qd4ovvnw4y3en@LXL00007.wbi.nxp.com>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20230822145512.pc6qd4ovvnw4y3en@LXL00007.wbi.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0134.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::19) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS4PR03MB8410:EE_|AM6EUR05FT010:EE_|VI1PR03MB10064:EE_
X-MS-Office365-Filtering-Correlation-Id: d44b5ba4-a991-47e7-7016-08dba4e45eb4
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  UUkFkkdlH5Y+I2x+N6v6Wx3Jz4XJdrqOrBC4QeEKB4U630D6IavYF0rzLHZsDYeuqJ+nLkCxjGrGjBFMKKdPKBhI7sW6ONmG1AqSm2NIAP/ZXiYtkckQ0NurMNrV0li9JQrEkfpQ6lwxEBtIU+JfB7+uplQDZ9+6KWPawVtq8ICPU7mUA4zVA9tx3e4fgl0dO7m32vIQkhkS5Xx4J0itYbGNotIoRSiA1ZHqKggiZq1HrftArwL271wGQxvjBSnWh/F39FD13wbXg52m/4OA+DjM6U7hx8K7xz/An2T1Dmd8MD7q3EFu1Ozbph/1xbopHB1KNmPxy5iYs/WD4vZLiqfNLjRYYT0dqt+6COLf7pILCAXrgMU3AAZOxJTZMBRCzZ/29FmDQYQiYdjpubD4LM84bkHOgXHvI4CAVvkIFwNFynIxFK7DKJluTc+LaBj3JhkHElmsX2vAOVboCAuZ9ZIKGrqEnhCEiyrmj1vZIjQL4jpy9sCcsN1W8CGDyWEEoz7rMB40qqumZ+ZuJ5asw/oblgQa8NLMuj245/WCHEctJrTfFyxCbTSQcYKAFIdx8eP8DEtjBcETjxCUtzvmkm6RZxkV556hOn0AuQfUqkhmTU+Ufmcw7Fa6Ioj4E+H9rWSdKOMTzX8AGaj05c9qdfs1jSx8mKXIQ+6lqYDtotE=
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(346002)(136003)(396003)(376002)(366004)(1800799009)(451199024)(186009)(44832011)(7416002)(83380400001)(6512007)(26005)(478600001)(2616005)(5660300002)(31686004)(966005)(2906002)(8936002)(4326008)(8676002)(38100700002)(38350700002)(6916009)(66476007)(66556008)(66946007)(86362001)(41300700001)(31696002)(54906003)(6506007)(52116002)(53546011)(6486002)(36756003)(316002)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8410
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  AM6EUR05FT010.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	5e0c302e-63ca-464c-57ee-08dba4e45bc1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	FnEEP9o2rJeWHy0waBUzcRajVlzWH4xOBtolpZ1WntA/aJaIcZ45x5FKVWU3BrVurdSK/YMdXUMEDFSM4lvQcfrjRqfcarxbfEMvG6eqHcklWamiCSGrDyPTmOGfqYCl1CN5EMacU2oqS2bueZSV0sqlH+Rc2KrhR+rSRnJzYZ69gJFkBwUDW+y6v1ZZHvI3JiOKU4STyduLVe1AbtPlA/VTzW6krKbXn7CfrZ+MVeUANWAwW4hXqGCsyhGMufC/cmqCDdm3RZ+TjEmXOx9zErWo3BQmbimVjZOra7KA7mwyRoo2DT1UJ9toNg3Bvo5TsM+MGV7u1eLvZJUDaWtm59mCeLLjcYUuFSzIffWYL7I0SkrEykJ9DUyUBqrC/ak9PLnqenVLa9npV18f4abDrfJtQpc4x03DXBa26QMz+4IPDp9eekbmYt6wGAwVQzxc25qqoRPHdSVK7ddPldsSpNZvIzMo3cVWq+I8gD6V1c3NyV7043sb+VO+TZ674pU5nutCMLADkXWmhXZeonGJYaNnExPlXjZh/aqajT8n55U0TEHpcRdtgR3kyEsC2VpHbJldl0N4SK2pXhebe63MDzGadiJIcpe6wO99cAbveUelDan1WV9yxo1ZXqfQkCSkNIrJzi540vRoe1U4VrbnUj/tsvW5G0R1Tq45SWb30Tvz32CyR6Mc4rIAGu3fl9HJ3JAIhy77te+F24lXP4lgBOFa2QjmFSN76FvnBt9313KnC+IvC5xjDG6R6TNZVirSx+K1daAieH1wr/cnE2pOpPdPehJpTOBesEL4x5qeNxU=
X-Forefront-Antispam-Report: 	CIP:20.160.56.84;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(39850400004)(376002)(1800799009)(5400799018)(82310400011)(186009)(451199024)(46966006)(36840700001)(2616005)(4326008)(8676002)(8936002)(83380400001)(5660300002)(34070700002)(336012)(36756003)(36860700001)(47076005)(7416002)(44832011)(40480700001)(26005)(82740400003)(7596003)(7636003)(6666004)(70206006)(70586007)(54906003)(6916009)(316002)(478600001)(966005)(31686004)(356005)(41300700001)(2906002)(6512007)(6486002)(53546011)(31696002)(86362001)(6506007)(43740500002)(12100799039);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 20:54:55.0970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d44b5ba4-a991-47e7-7016-08dba4e45eb4
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.84];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	AM6EUR05FT010.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB10064
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
Cc: =?UTF-8?B?RmVybuKUnMOtbmRleiBSb2phcw==?= <noltari@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Michael Turquette <mturquette@baylibre.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jonas Gorski <jonas.gorski@gmail.com>, linux-phy@lists.infradead.org, linux-clk@vger.kernel.org, Kishon Vijay Abraham I <kishon@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-doc@vger.kernel.org, Camelia Alexandra Groza <camelia.groza@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, linuxppc-dev@lists.ozlabs.org, Li Yang <leoyang.li@nxp.com>, Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/22/23 10:55, Ioana Ciornei wrote:
> On Mon, Aug 21, 2023 at 02:46:53PM -0400, Sean Anderson wrote:
>> On 8/21/23 14:13, Ioana Ciornei wrote:
>> > On Mon, Aug 21, 2023 at 01:45:44PM -0400, Sean Anderson wrote:
>> >> Well, we have two pieces of information we need
>> >> 
>> >> - What values do we need to program in the PCCRs to select a particular
>> >>   mode? This includes whether to e.g. set the KX bits.
>> >> - Implied by the above, what protocols are supported on which lanes?
>> >>   This is not strictly necessary, but will certainly solve a lot of
>> >>   headscratching.
>> >> 
>> >> This information varies between different socs, and different serdes on
>> >> the same socs. We can't really look at the RCW or the clocks and figure
>> >> out what we need to program. So what are our options?
>> >> 
>> >> - We can have a separate compatible for each serdes on each SoC (e.g.
>> >>   "fsl,lynx-10g-a"). This was rejected by the devicetree maintainers.
> 
> I previously took this statement at face value and didn't further
> investigate. After a bit of digging through the first versions of this
> patch set it's evident that you left out a big piece of information.
> 
> The devicetree maintainers have indeed rejected compatible strings of
> the "fsl,<soc-name>-serdes-<instance>" form but they also suggested to
> move the numbering to a property instead:
> 
> https://cas5-0-urlprotect.trendmicro.com:443/wis/clicktime/v1/query?url=https%3a%2f%2flore.kernel.org%2fall%2fdb9d9455%2d37af%2d1616%2d8f7f%2d3d752e7930f1%40linaro.org%2f&umid=2d629417-3b95-49e4-8cdb-34737cc93582&auth=d807158c60b7d2502abde8a2fc01f40662980862-895c2dfe1c33719569d44ae2b51e21f626f39d39
> 
> But instead of doing that, you chose to move all the different details
> that vary between SerDes blocks/SoCs from the driver to the DTS. I don't
> see that this was done in response to explicit feedback.
> 
>> >> - We can have one compatible for each SoC, and determine the serdes
>> >>   based on the address. I would like to avoid this...
>> > 
>> > To me this really seems like a straightforward approach.
>> 
>> Indeed it would be straightforward, but what's the point of having a
>> devicetree in the first place then? We could just go back to being a
>> (non-dt) platform device.
>> 
> 
> I am confused why you are now so adamant to have these details into the
> DTS. Your first approach was to put them into the driver, not the DTS:
> 
> https://cas5-0-urlprotect.trendmicro.com:443/wis/clicktime/v1/query?url=https%3a%2f%2flore.kernel.org%2fnetdev%2f20220628221404.1444200%2d5%2dsean.anderson%40seco.com%2f&umid=2d629417-3b95-49e4-8cdb-34737cc93582&auth=d807158c60b7d2502abde8a2fc01f40662980862-64ea8fa45172282f676b7463a5401e8a7c5bdcbf
> 
> And this approach could still work now and get accepted by the device
> tree maintainers. The only change that would be needed is to add a
> property like "fsl,serdes-block-id = <1>".

https://lore.kernel.org/linux-phy/1c2bbc12-0aa5-6d2a-c701-577ce70f7502@linaro.org/

Despite what he says in your link, I explicitly proposed doing exactly
that and he rejected it. I suspect that despite accusing me of
"twisting" the conversation, he did not clearly remember that
exchange...

That said, maybe we could do something like 

serdes: phy@1ea0000 {
	compatible = "fsl,ls1046a-serdes";
	reg = <0x1ea0000 0x1000>, <0x1eb0000 0x1000>;
};

--Sean
