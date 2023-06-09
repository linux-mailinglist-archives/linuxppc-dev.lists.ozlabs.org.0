Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCE872A2FD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 21:21:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qd9sk5nrcz3f8b
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 05:20:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=xVXWBzVJ;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=xVXWBzVJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe1a::31a; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=xVXWBzVJ;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=xVXWBzVJ;
	dkim-atps=neutral
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03hn2031a.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1a::31a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qd9rn10wGz3dvx
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 05:20:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/fZaCbyPA4PG9YwOAZW6PpKz0tRw29BfdhRN8WKwp3A=;
 b=xVXWBzVJnPizPru6r0oY2G/JSh717V7+ff0zJnL4CvlyYNYGDfyH20TCSxBJapM7ULazAvAnaV/tIePk2rw9I61RTgeIEwIJxvs/tp8tWeUn+e2hL3L0jZQEuzIqDWJuinfxKU/NU4RimB+igYEJbVuco/YNWCDUZ7uCHfn1du0iVA3w6T1sTYBfblHArHhvDhCZ19CptGCJ9V4hgcqdGXyWD6XQLcjjbkLPHV0g+O4DYqTrirjAc8NmmmOAZIdkuSVwpqSIKKbtZgrDeRddtmojZcRjOrPuZ5Vg44R8SpMJKOl2ZrTXqxq5BoS9oMhqEhG0/nIfDgiE3nBy4NwZbw==
Received: from AM5PR0402CA0021.eurprd04.prod.outlook.com
 (2603:10a6:203:90::31) by AS4PR03MB8277.eurprd03.prod.outlook.com
 (2603:10a6:20b:4ff::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Fri, 9 Jun
 2023 19:19:41 +0000
Received: from VI1EUR05FT040.eop-eur05.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::22) by AM5PR0402CA0021.outlook.office365.com
 (2603:10a6:203:90::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19 via Frontend
 Transport; Fri, 9 Jun 2023 19:19:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.86)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.86 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.86; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.86) by
 VI1EUR05FT040.mail.protection.outlook.com (10.233.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.29 via Frontend Transport; Fri, 9 Jun 2023 19:19:39 +0000
Received: from outmta (unknown [192.168.82.135])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id C864220081129;
	Fri,  9 Jun 2023 19:19:38 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown [104.47.14.55])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 1945120080073;
	Fri,  9 Jun 2023 19:23:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBhoh/W5NK9ejofCrVvdDxuaml2HhdgoL5jOJxMlhm4mcOYojGrnLzt3X7MrYAEvwEsEalPuf+K7vIJBGa2ijj0XT/KbGqG48Z9/uuwmw/Yw7qm5lRp06uHvrm+/t5Coe7fP65ssmmHmkuQ4aVeHQxIwCNCvXF7F2M3aO/Z6P6aSY4n7ai1vaklsUmFlVb22LorP3Fojq54SvrLYSaXbxlzNUHZ7wJjYgBxIfRTZk/MoPwpirjSIujlcCGJuzS1xisK5cfeVGBhVXxGbRV+HNf7qdB2eJRQOTKbE4vVz8fhqQ0ROsPWfs5mT1J3/PddX1G/gC/gGZrwjkvjoq6tubw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/fZaCbyPA4PG9YwOAZW6PpKz0tRw29BfdhRN8WKwp3A=;
 b=O8nqSJe4qRofFFYgr22+cI5zhIMqusbL8yowr3JVvhRzRijMMVGWiRd70gxXvRvI6np/jT8X+t/0rM1B1NjcbH0LS7M+7/bBt98zdgc5kbS+E0PRrvN7BZYc/8VABhEl82JryPuawEVgr9PuNaH7QttN8ePKwB3E3OrnJFhb1+J+WiyQYdGgIgTd16x/nhUmGy+gE1L3NW6NYvcKHWbt0wz5qAj5I5kHwMh/aRYUIpRZBWXCURQ+gB9N+HgzcUgsrbGBgg0q5/cCTQukqa6YZqPktgh8var3jZXP00YI32UYe7tU/co8yHV1douJmOtPIOAgHh4VvZc88Dx71s4f6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/fZaCbyPA4PG9YwOAZW6PpKz0tRw29BfdhRN8WKwp3A=;
 b=xVXWBzVJnPizPru6r0oY2G/JSh717V7+ff0zJnL4CvlyYNYGDfyH20TCSxBJapM7ULazAvAnaV/tIePk2rw9I61RTgeIEwIJxvs/tp8tWeUn+e2hL3L0jZQEuzIqDWJuinfxKU/NU4RimB+igYEJbVuco/YNWCDUZ7uCHfn1du0iVA3w6T1sTYBfblHArHhvDhCZ19CptGCJ9V4hgcqdGXyWD6XQLcjjbkLPHV0g+O4DYqTrirjAc8NmmmOAZIdkuSVwpqSIKKbtZgrDeRddtmojZcRjOrPuZ5Vg44R8SpMJKOl2ZrTXqxq5BoS9oMhqEhG0/nIfDgiE3nBy4NwZbw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by PA4PR03MB6958.eurprd03.prod.outlook.com (2603:10a6:102:e5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Fri, 9 Jun
 2023 19:19:27 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::d632:8122:75f7:7b0e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::d632:8122:75f7:7b0e%3]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 19:19:28 +0000
Message-ID: <22a28a6f-2c84-a6b1-bb57-a269af34c993@seco.com>
Date: Fri, 9 Jun 2023 15:19:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v14 00/15] phy: Add support for Lynx 10G SerDes
Content-Language: en-US
To: Vladimir Oltean <vladimir.oltean@nxp.com>
References: <b7779674-c3ac-e0ab-3ca8-db1ec5953a97@seco.com>
 <20230426105140.t4yqv6irtjcwptm5@skbuf>
 <20230425195002.fls5cmwolyrslpad@skbuf>
 <b7779674-c3ac-e0ab-3ca8-db1ec5953a97@seco.com>
 <20230426105140.t4yqv6irtjcwptm5@skbuf>
 <7c7ab84b-3c4a-4e44-b5b5-4acf733a0246@seco.com>
 <7c7ab84b-3c4a-4e44-b5b5-4acf733a0246@seco.com>
 <20230429172422.vc35tnwkekfieoru@skbuf>
 <c81d23b6-ed22-0b37-d71b-ddce9d5d58eb@seco.com>
 <c2f928d2-25f6-0e31-9ab3-9d585968df1b@seco.com>
 <20230522150010.q5zndfwcuvrb6pg2@skbuf>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20230522150010.q5zndfwcuvrb6pg2@skbuf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR12CA0013.namprd12.prod.outlook.com
 (2603:10b6:208:a8::26) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|PA4PR03MB6958:EE_|VI1EUR05FT040:EE_|AS4PR03MB8277:EE_
X-MS-Office365-Filtering-Correlation-Id: 92094327-e588-49a8-be8b-08db691e78a1
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  6Ce6HHma1hB09kOrIu9Ym+j4Woj0JyQMeDohkGIa7BJgl6ZGDJFvemumKBR59xcRLZ3aovgJv6Y5qpFObqe3VIeD1rNxPHL/+Epyi5xJ7PO1Bai5ZO5wp+FWzAjXiPKeLFCy3BhT09DMxdbfJ6imJrny1DydwvBDGZczppGWDJ7UmgZvgP4eZ/ij7YbKpVgpjrp+Pi+n3DxgTTGGbKngMc6fk7uVLYR+4VHq27gkPvx7fe8og4qJbvHdFYX8GBYDeb/0p6YCqPVMXykCWfoT48FIDC+VfOx5rMlh6csnBeQ3i9UDV3M3wLXbcjEUg8azeXgkGl9vc6nLkVFTRww9f1Pu1EzJUK6I1kIvQ7mpOm1rPqNb/rEY7QGjKSE+idMqFfbjuyRqpKcqzYvwxi9o/x69mG4D12Mg4L+bQ7q46uwIUMjygahn6EL+8ynN/GbOFwBORp4FqwfKOqKGV29O7Pndy2eFK6pbK2XwFDVSzUzW1X/9cwY5oAHNbPIfvPyiCdisSKbMgTWP4Fx9fmvkiJ9wl3fSuQJ78+hcUmXjAWxG2r87Euj+WnGXS/CBshXgzL4nbVnAjHo0+sn22vFELPfDtvUNoUwsaMr+gXSWbZjK9aEZtdj0ZlCNejYXnN8sjFLk4NUgrmsi3GXxFeFWhQXKxJH3e0YA6Rgj3ormC1UXS3HIvT+Aj6rRhQ4HudKZ
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(136003)(39850400004)(346002)(396003)(451199021)(6506007)(26005)(6512007)(53546011)(31686004)(7416002)(44832011)(4744005)(186003)(2906002)(86362001)(36756003)(8936002)(5660300002)(316002)(41300700001)(31696002)(2616005)(8676002)(6916009)(66946007)(66556008)(38350700002)(54906003)(6666004)(4326008)(38100700002)(478600001)(6486002)(66476007)(52116002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6958
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT040.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	9eee2c1e-4197-4ae6-4ab8-08db691e7205
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	4m6ryoUHJhAC+d6Rdq3lNxv+1lXjFYrYyJvJ/T0+DLAHUYqab4B+YZwebwqN9uvwGrbR8HIkFP8gJ09NbwT1sRHRWdHS3dZEw/MwXH+STae/aBMwnhIW1ZRlzmPMP3MWWu0giHB1beOEVx3cftwWarOiYgNZXLQquEoBy30BCjKwyh31+KcvuUCNcOek/ibAeD8blwmc3QPo0xCmYLc2cK/kllqpIFGDYXVKLVf5x+1H64H3EyBkvbwPjXsQe8xPP+IwIAz0vGGI/vJI9Vx/lyyK6ygsA4epDVklV8tqIss6zoBhZmLk+dy0bBZZV7f9OwImXfsP/P2BwuakpTj4aB/8FtgaOIEnEMZ1M/9Agxn8G9XLYkYvSul4mekGvow44YXgvENyZVhyhAlIadlP5TBzbQpX4ami1BuRZkHtmJdyDr8UEZvk+zW9ebh6qwk0cXV6cAcsP0M5hBiHu8WTh8RlEqfMXYfog7jIw4xjqNZKa+qAvDfjk9V9ziBRuiMwawyIoC+zPLFldC6e5k6UIX/qeOudnp1cDOia8ov/HcByuSZbu0nWtPC5j2GyHJeYyfkjBhKT/kS7rVB0LYCKu0UnWYyBIs8KQQYGj/6QA50d7G1cP7gCEDBJH9rGJF3EpB/z8XZeC1polHKr7Cxp6obfhxYTtA9hK6IqcONW/y4Epd6Uxwh6oZFuMDRX+t/QhjXtMc/epMmluBWCCQC9+8aI0k3W0krw+QWWOMKNOoNXJOsSqKi9ypr9m9FHaA6MhvE8NyUvYdIs4FTSkimphIkvT7J5zIDA8afV+MQ5bW32q+oBj5BiRPjD5BkqCFM3IEQd9DR8nlv4o2o/Rslr+w==
X-Forefront-Antispam-Report: 	CIP:20.160.56.86;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(376002)(346002)(136003)(39850400004)(396003)(451199021)(5400799015)(40470700004)(46966006)(36840700001)(40460700003)(31686004)(47076005)(6666004)(70586007)(316002)(70206006)(54906003)(6916009)(4326008)(86362001)(478600001)(36756003)(31696002)(36860700001)(336012)(26005)(6506007)(6512007)(34020700004)(186003)(53546011)(44832011)(8676002)(41300700001)(82310400005)(8936002)(7416002)(2906002)(4744005)(5660300002)(6486002)(40480700001)(7596003)(2616005)(82740400003)(356005)(7636003)(43740500002)(12100799033);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 19:19:39.6077
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92094327-e588-49a8-be8b-08db691e78a1
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.86];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT040.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8277
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

On 5/22/23 11:00, Vladimir Oltean wrote:
> On Mon, May 22, 2023 at 10:42:04AM -0400, Sean Anderson wrote:
>> Have you had a chance to review this driver?
> 
> Partially / too little (and no, I don't have an answer yet). I am
> debugging a SERDES protocol change procedure from XFI to SGMII.

I'd just like to reiterate that, like I said in the cover letter, I
believe this driver still has value even if it cannot yet perform
protocol switching.

Please send me your feedback, and I will try and incorporate it into the
next revision. Previously, you said you had major objections to the
contents of this series, but you still have not listed them.

--Sean
