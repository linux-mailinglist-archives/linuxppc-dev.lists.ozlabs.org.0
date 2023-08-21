Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF33C783068
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Aug 2023 20:48:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=G498wZyN;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=G498wZyN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RV1hY57JRz3c1l
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 04:48:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=G498wZyN;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=G498wZyN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=52.100.7.217; helo=eur01-ve1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=lists.ozlabs.org)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01hn2217.outbound.protection.outlook.com [52.100.7.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RV1gc3CN3z2xpw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 04:47:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zNCJU90wtdhIbDDh5Y1bjNlVPiePBNBzQTqMz3RHFxg=;
 b=G498wZyNyqS6yWv+oYqpNIcWKVcy3qSHsnk9z1DHoEucg43pNjmxW8DdMYnA/ZHavM0PEWCp5DAJ7fYg2+xFJQKUzTV8744hxZm81NcPC4CT6GZs4Cvx4iDQlu3YfxFu5+4mhDmpu6rh9JH0q4pHh3OsuoWjmYXPfS5Iyg20GWE0hISgPE6e7SPuEr++yPnn1nr+RGGwF+WxPuIrRQ6IVlauFVh7/GDnS0UxvweK6XBIuHH8qkIp6C7Kianf66tkw8uFLCe9vKwUzSfr6qZcGbME/hDeeoGPvp0oR9VWSqWWu5ikhL1D7MK/7k1Fi6R347OyZLn6D2b99qEKTEik0w==
Received: from AM6P192CA0062.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::39)
 by PAVPR03MB9065.eurprd03.prod.outlook.com (2603:10a6:102:329::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 18:47:18 +0000
Received: from AM6EUR05FT038.eop-eur05.prod.protection.outlook.com
 (2603:10a6:209:82:cafe::4c) by AM6P192CA0062.outlook.office365.com
 (2603:10a6:209:82::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Mon, 21 Aug 2023 18:47:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.83)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.83; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.83) by
 AM6EUR05FT038.mail.protection.outlook.com (10.233.241.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6723.15 via Frontend Transport; Mon, 21 Aug 2023 18:47:17 +0000
Received: from outmta (unknown [192.168.82.135])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 4D302200813A8;
	Mon, 21 Aug 2023 18:47:17 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown [104.47.13.50])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 810DD2008006E;
	Mon, 21 Aug 2023 18:47:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ck54zoKAFg1AOuGimvUWY45TOKGBe2b/nVq0bXWBLTfGThOHuzR5L6HKiy13cNrC1VenL3Iug+nx8w8g64vlueQPpaMSyeD4Uc8/faz31y2OZMXjGoZzlhyqCoOQto78LvRbFDMAPqpXPTx2Hj1eXAbnfFamil6N9p3i9By4M/mtm6+ulsymGIVrZtv50sUhi24EjQwMo4mEgldDaxPnq7MCcdFBM8b3BwUNLevjVbsTaJ9oHTMxvuet5Sr6VrSPNQfwrZuBecw2GclSBzU4UtWVh29Q2P7BFJd5zAl0K+MXUpL/FFr2qecIfKoDUhCJHBMcPmLAW2CM8AEgKpm41w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zNCJU90wtdhIbDDh5Y1bjNlVPiePBNBzQTqMz3RHFxg=;
 b=nkpHl7V8GMkvBxRIYqCdfLZNQ0EAuvcGE1qUmS9SAApuKTTAJLMMvdPdhGKAy9WSGL4yhf8HEjDvZD0ouk4hZz+15s20wKQB3rfiGsH8fYI9v2Pc5SgJNxXGGdCDAgz9nxj7j5/G5e3seKgSLUfBLEkyzWC66s/wBqmeNkEVO1ABZjc4o+ap3Wl5HqqLB3Gco9Va9f2wTJexhMY8E7emir4FyZ5N3xQxd8jlE3AcwMUvfZ44siz9ODgnyZzPwYjJgpcOOAgqQHZX9jyLyaGLqzWFRw7tZOiIeOoOW5W6EHZ6//tVWdyTM7Daww6VOlFAXaV2fv2XUQ8vhOl4+Ao2QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zNCJU90wtdhIbDDh5Y1bjNlVPiePBNBzQTqMz3RHFxg=;
 b=G498wZyNyqS6yWv+oYqpNIcWKVcy3qSHsnk9z1DHoEucg43pNjmxW8DdMYnA/ZHavM0PEWCp5DAJ7fYg2+xFJQKUzTV8744hxZm81NcPC4CT6GZs4Cvx4iDQlu3YfxFu5+4mhDmpu6rh9JH0q4pHh3OsuoWjmYXPfS5Iyg20GWE0hISgPE6e7SPuEr++yPnn1nr+RGGwF+WxPuIrRQ6IVlauFVh7/GDnS0UxvweK6XBIuHH8qkIp6C7Kianf66tkw8uFLCe9vKwUzSfr6qZcGbME/hDeeoGPvp0oR9VWSqWWu5ikhL1D7MK/7k1Fi6R347OyZLn6D2b99qEKTEik0w==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AM7PR03MB6596.eurprd03.prod.outlook.com (2603:10a6:20b:1b0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 18:47:06 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::21bd:6579:b3d1:e5f7]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::21bd:6579:b3d1:e5f7%5]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 18:47:06 +0000
Message-ID: <73d59dd2-88f0-3c1a-0de2-de2e050cba5a@seco.com>
Date: Mon, 21 Aug 2023 14:46:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v14 00/15] phy: Add support for Lynx 10G SerDes
Content-Language: en-US
To: Ioana Ciornei <ioana.ciornei@nxp.com>
References: <20230610222123.mzmfjx7zfw4nh2lo@skbuf>
 <c702e2b6-cb0f-4ac9-86fe-a220284d45aa@seco.com>
 <20230612163353.dwouatvqbuo6h4ea@skbuf>
 <1dd01fe2-08a8-ec2f-1184-a58b2f55ba85@seco.com>
 <20230613142754.wr5njtjo4tbloqwu@skbuf>
 <20230811150826.urp2hzl3tahesrjx@skbuf>
 <26623d0c-8a5a-614b-7df7-69214aaec524@seco.com>
 <20230811163637.bs7a46juasjgnmf4@skbuf>
 <20230821124952.mraqqp7pxlo56gkh@skbuf>
 <a2e3fcad-9857-f1b3-8ada-efb2013a4bf5@seco.com>
 <20230821181349.hls6pukp5d6rc5av@LXL00007.wbi.nxp.com>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20230821181349.hls6pukp5d6rc5av@LXL00007.wbi.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0098.namprd05.prod.outlook.com
 (2603:10b6:a03:334::13) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AM7PR03MB6596:EE_|AM6EUR05FT038:EE_|PAVPR03MB9065:EE_
X-MS-Office365-Filtering-Correlation-Id: 47bc2e08-9127-4494-2ef1-08dba2770b39
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  xwk09tLYl18JVqR7zOIHumybf3mRxgeeQPm6D2anQArpLfCEmcS1pCXO2jWQz9xMJ1y8c4nQMKEbCj0AmRDdpaw27XYdFaOwZPZK3MAOvmx6Ed+ngS455B183XJJuM2ftR/P+sR/jRlBxvb4TYVset5Top7f5oyUcuU4QkdmViFtydjgVlkUWXtxpmd/KIdH8vMymhrzpGjQ/B8jtmo4bzT1WpAKPUQo7Z/VQQbIFjIlCouMtBMPBzBk2+3odG1sbVt4bA+R4IXiK7+bfbONCYbbTN6ibcnW0hmNwo/MKd16gtbfZjN8Y6u06a96HDuCORGNPqVXjmaKmDAFl/Gzstmyq5XWfs9TFuojIR/Cq7NIC+OSKDCuOgFxepI/0Fa7jBxpaPMNmkJxe0BwWkDSUc/51bwwkAhdaJID/6Y6NCL6xs++lPw6xEHGjCbVf/GJY9yXTf021/cH2KgHZOMohbdk8/jfF1fYi965IL7nDnTFJfpAQ7ecgqysg7/fu/aKQq0DrPwsJ45by3KlbGgO6cI/HvhD2Mm9XyULq82p1/rZrELbCpkGn1qVNdr4C5XNPDYC6s29NTvl6ZcHqfjSfhmy8noCxfEiSV2gFPpcMREpstIk05YoIWZ0UcsYawYqH6+eMPNQVivIPrUjin586kPSlpK5/Ftd+9cEYLavUEZpKGjT5CBpc9Zpp8oQAMVz
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(39850400004)(346002)(366004)(186009)(1800799009)(451199024)(54906003)(6916009)(66476007)(66556008)(316002)(66946007)(6512007)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(6666004)(38100700002)(38350700002)(53546011)(52116002)(6506007)(6486002)(83380400001)(2906002)(7416002)(86362001)(31686004)(31696002)(44832011)(5660300002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6596
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  AM6EUR05FT038.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	5f5d2449-7c6b-4ae6-84ee-08dba277044b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	fNdHSq5tLXxasAcP6Cy0rKVLQZnp6th/MW6vQIKqjGZz+6QmcIVu0Nx9+3i6xZFs+rh061+MfXVQqylV5jfkZZczpo2+jL4RzBZfUMvsZGc57KUh9rPdmp/6GAbgOavMPtcn9wAoeNfCmndHhScZN9j+QM9uPDOT5PEsTybTOqex4f0h73qTQhAiKbEF+rY47ybOuhm/dIr/ob6e/WSCLaTZ0pwxN1scz+sedkHuSBGJT5ZYMrrCtMEshBwUtrEh6+LovxhiOEa8R1UoWRR4yddnbEAbg3tXiH9CxLcGo1XO/H3JZdV5F/R4JuGZ/y1u2+ZkVjACDVZu2l7Ah81yyNJw9dGy8V0bV8llzuX6oA0gTsjLU9WT6wOcnqRUWg1AhIZvmYQiifLarNiiuZw7UqnNBLsasbnXVvEH9wjbWnAWHMZPqArWYpMQu16BERyq+v89f6uBEAjtiuLqkiIk1wyoXBKsVvvzXwEVVHy+IpkDXBjXqAGbmweKCl0KyvAoXlRoZ1fGz7JOR2tvEoCdADEt8Qjbzeol5s5oHuQC8DRqx2CSY0gQ2c67DfUp6TSzBxW8sX2TMP1Tn4YO/Uds8d74ivFwOlgknjSXVrosD4vn800LlSdDdA57fpy4Mdx+nROXCjSkCRu9aFkbpZNjYmXXYbQVq4A1npQjiMNrQ+WcOiuH6SoMNEk9azYEAa4bV8bly+eMgNZ0zA1Sbx/QXUsujpmQlUeF78966CPTVuNulSMEnSe7zP/4RU1xQu2EjbFi2YpO1s7SVTlkkaR5a/TLWbfpspsagz3SwxNGHevRpf0isEzA2L3b5N1vorQSMBm2IPvUecAFSylU0jRAsA==
X-Forefront-Antispam-Report: 	CIP:20.160.56.83;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(39850400004)(1800799009)(186009)(5400799018)(451199024)(82310400011)(40470700004)(46966006)(36840700001)(40460700003)(8676002)(8936002)(4326008)(44832011)(5660300002)(7596003)(34070700002)(36860700001)(2616005)(82740400003)(86362001)(356005)(7636003)(336012)(6666004)(6506007)(26005)(53546011)(6486002)(83380400001)(6512007)(478600001)(47076005)(41300700001)(31696002)(70206006)(70586007)(54906003)(316002)(2906002)(40480700001)(6916009)(36756003)(7416002)(31686004)(43740500002)(12100799039);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 18:47:17.5693
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47bc2e08-9127-4494-2ef1-08dba2770b39
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.83];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	AM6EUR05FT038.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9065
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

On 8/21/23 14:13, Ioana Ciornei wrote:
> On Mon, Aug 21, 2023 at 01:45:44PM -0400, Sean Anderson wrote:
>> Well, we have two pieces of information we need
>> 
>> - What values do we need to program in the PCCRs to select a particular
>>   mode? This includes whether to e.g. set the KX bits.
>> - Implied by the above, what protocols are supported on which lanes?
>>   This is not strictly necessary, but will certainly solve a lot of
>>   headscratching.
>> 
>> This information varies between different socs, and different serdes on
>> the same socs. We can't really look at the RCW or the clocks and figure
>> out what we need to program. So what are our options?
>> 
>> - We can have a separate compatible for each serdes on each SoC (e.g.
>>   "fsl,lynx-10g-a"). This was rejected by the devicetree maintainers.
>> - We can have one compatible for each SoC, and determine the serdes
>>   based on the address. I would like to avoid this...
> 
> To me this really seems like a straightforward approach.

Indeed it would be straightforward, but what's the point of having a
devicetree in the first place then? We could just go back to being a
(non-dt) platform device.

>> - We can stick all the details which vary between serdes/socs into the
>>   device tree. This is very flexible, since supporting new SoCs is
>>   mostly a matter of adding a new compatible and writing a new
>>   devicetree. On the other hand, if you have a bug in your devicetree,
>>   it's not easy to fix it in the kernel.
>> - Just don't support protocol switching. The 28G driver does this, which
>>   is why it only has one compatible. However, supporting protocol
>>   switching is a core goal of this driver, so dropping support is not an
>>   option.
>> 
> 
> The Lynx 28G SerDes driver does support protocol switching.
> How did you arrive at the opposite conclusion?

Sorry, it's been a while and I just did a quick look-over, and noticed
there was no configuration for different SoCs.

After further review, it seems the reason 28g can get away without this
is because there's a one-to-one mapping between protocol controllers and
lanes. Unfortunately, that regularity is not present for 10g.

--Sean

> The initial commit on the driver is even part of a patch set named
> "dpaa2-mac: add support for changing the protocol at runtime". In
> upstream it only supports the 1G <-> 10G transition but I have some
> patches on the way to also support 25G.
> 
> Ioana
