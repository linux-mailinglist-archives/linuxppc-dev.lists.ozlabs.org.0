Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BC070C15E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 May 2023 16:43:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQ0Z31k52z3drM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 00:43:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=QduOxHXq;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=QduOxHXq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe1a::32b; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=QduOxHXq;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=QduOxHXq;
	dkim-atps=neutral
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03hn2032b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1a::32b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQ0Y65Ht9z3bT5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 00:42:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2vwI/Tgc3elQbSgBEA1vZoVrm+SiySCizDDNzYjRS4=;
 b=QduOxHXqCnagtGZdkwXWj+Jdhd6ViVj7caVvo1zauV7unfNc6KanHpcBmZkHuLS6NAkom59NB82htusUcquZcrfOvdAh8KvkwXUwyZvKHIR7pCSN7zXMfEqr9Wc8imw5b9KM7dnJj92kV8ZL6SSZqnaJosonDbSRtNP5mOpZs/Tge4sOVI1qg+9lrbSCZFPSA0riMekM3m279RrJQt3XeI7ot8dElKbDAypHnLKLtMm6ibSmpI3kT3Wj2xBikLnTtPm/yty/U0sQmzwR6DWxvHdmQWvjC1ZAV52WPOpckAPp4O0Vt935QEkSChPoUgaH5Eu1d5/R90H+pq6b4Ok5nw==
Received: from DB6PR0802CA0046.eurprd08.prod.outlook.com (2603:10a6:4:a3::32)
 by DU0PR03MB9104.eurprd03.prod.outlook.com (2603:10a6:10:467::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.27; Mon, 22 May
 2023 14:42:24 +0000
Received: from DB8EUR05FT015.eop-eur05.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::d7) by DB6PR0802CA0046.outlook.office365.com
 (2603:10a6:4:a3::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28 via Frontend
 Transport; Mon, 22 May 2023 14:42:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.83)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.83; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.83) by
 DB8EUR05FT015.mail.protection.outlook.com (10.233.238.127) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.12 via Frontend Transport; Mon, 22 May 2023 14:42:24 +0000
Received: from outmta (unknown [192.168.82.133])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id AD2FA2008008E;
	Mon, 22 May 2023 14:42:23 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown [104.47.2.55])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id BEDBB20080073;
	Mon, 22 May 2023 14:44:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XrRJH95z5wI5/z17DDYDdrft0P8xgr8KhgI8kxom8Q5LI/EGSxA9rHQH9ZkUEe63u7Y0t4xG84F66ySM5E57cB1TmJ4PztqVRJz/meP1hQZR4HQe7bjjl2UONTYK9hJR8HzTiT94q/waHvT/B78JXrc6arRVwb1YVIt4fTc8LexMhnhfkdqCYrIfhswtZK90K70qzk9QkJI/4pceddQvPA5sNhueIRkdjnamBJP7YopfF3uayyxd6bH4GZWRh4Iq2v3u2qX4AJ0poRkjB/omaTZQckNH3/cp6A0Jduon1KOkZV32Df2daweXmOH6LHgvGDMEx7yqfni29Wh6ZVjvuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d2vwI/Tgc3elQbSgBEA1vZoVrm+SiySCizDDNzYjRS4=;
 b=UcnowEsFz1hkpU7+Z7/4DzUnCUHOCQPCiGkT7wukfn0UOjdDMqmdgtAM860pXGKnNHAXPHgrgwutlbZ+5cn5diE1iKBF2rojEaDwRfa3OgkHHs3uZLh+J+iD9o+Cw/YCA+Bxgn3aad8eIM+A7CnvFSmeeIEYFYOy3vpsnvUtGz11QgTQpSRI0iSufFOuDqnvNPYclBBRWkxtfeyExgli32qjm2j026FE7oYXePTxk/dJbih69Rua8Nyj5nc3L5n2AzWOlul8DNnvTHRGwmFcQ29+IwN2w9oCATFNlTsQaoZf1jFbiGm2KmtjEbKzajW33hQuXaDJF4xK7GcFD1KXsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2vwI/Tgc3elQbSgBEA1vZoVrm+SiySCizDDNzYjRS4=;
 b=QduOxHXqCnagtGZdkwXWj+Jdhd6ViVj7caVvo1zauV7unfNc6KanHpcBmZkHuLS6NAkom59NB82htusUcquZcrfOvdAh8KvkwXUwyZvKHIR7pCSN7zXMfEqr9Wc8imw5b9KM7dnJj92kV8ZL6SSZqnaJosonDbSRtNP5mOpZs/Tge4sOVI1qg+9lrbSCZFPSA0riMekM3m279RrJQt3XeI7ot8dElKbDAypHnLKLtMm6ibSmpI3kT3Wj2xBikLnTtPm/yty/U0sQmzwR6DWxvHdmQWvjC1ZAV52WPOpckAPp4O0Vt935QEkSChPoUgaH5Eu1d5/R90H+pq6b4Ok5nw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by VI1PR03MB6207.eurprd03.prod.outlook.com (2603:10a6:800:131::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 14:42:12 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::d632:8122:75f7:7b0e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::d632:8122:75f7:7b0e%3]) with mapi id 15.20.6411.028; Mon, 22 May 2023
 14:42:11 +0000
Message-ID: <c2f928d2-25f6-0e31-9ab3-9d585968df1b@seco.com>
Date: Mon, 22 May 2023 10:42:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v14 00/15] phy: Add support for Lynx 10G SerDes
Content-Language: en-US
From: Sean Anderson <sean.anderson@seco.com>
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
 <c81d23b6-ed22-0b37-d71b-ddce9d5d58eb@seco.com>
In-Reply-To: <c81d23b6-ed22-0b37-d71b-ddce9d5d58eb@seco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0133.namprd03.prod.outlook.com
 (2603:10b6:208:32e::18) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|VI1PR03MB6207:EE_|DB8EUR05FT015:EE_|DU0PR03MB9104:EE_
X-MS-Office365-Filtering-Correlation-Id: bded69d8-d67d-4523-c7c1-08db5ad2c1ac
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  b5BR8exlDfMTmg3+NtYaL/G5fg4TGgcciq+5zhgnli84AVfW4FUamK3M5gLSaVBnvhHUQNZFF9EmNc3NqFDNH5s3XpzGh79AiTi/fO+E8nx8OEl/riMZzp+enuWVD7yR4eYP5V/C95yQHdNmSE0fhCTcF1mrzu1qroEcC0tRGvqs1JQiUePXuyHNX5Bc/oE0G3DzfwH0Wgse1pVQXQfxcrD/m/sf/D0MU0X3ftAR0HwqharN0LfQkiwBsY7CbMIqBAIvraLzBUs+cqWgrsspzFHSpafK5B+JU2gM//s3so8FhYgH/5Cijh8+GLiqZzMNRNqaVSpP/ab438VCSwyUn33uB+YDT416FOCCPQpeCL7zwZhyc36zpSs2H0xmy3TJp8Z7SbYPrpLBE/umhzzOMvnkrliGH8AHhDyemPXELrIOGN/YUdaIgDNIGvh+EXfUEWnPvj55EfB7le/Q9jFveZxmObnhSv8Lv6O7OypuX5YWIqtLtVKbs8NcVTaym54suP7jF1AjNfCPqlkqyATzPo3Yx9Nk2fxZbUYZVt+eo4vCDBH9/vPioppwNUGsPF1ODuxlENmgdYXHwR4RvDjp8cbhhxtLIrfYPZyo9uL3ihbPbsxOMDld6eRPOUXloIz9hVyQhNKOI3NLF58C4J61pujLOGm3YMxCeGlUQUhG6BU4JLtDOu6eA8JgSEPAkf73
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(136003)(396003)(39850400004)(346002)(451199021)(38350700002)(38100700002)(66899021)(31696002)(86362001)(36756003)(53546011)(44832011)(6512007)(6506007)(8936002)(8676002)(7416002)(2616005)(2906002)(31686004)(54906003)(186003)(316002)(4326008)(6916009)(26005)(41300700001)(5660300002)(66476007)(6666004)(6486002)(52116002)(478600001)(66556008)(66946007)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6207
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB8EUR05FT015.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	5ba8d480-0ef6-4c41-55d7-08db5ad2ba19
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	YPOfUrKvrGScIiuQksw21Bk8Jnfm5E1IwmRPLCfSIeasXETXDHC/AfovP+5pTDDW7mHTOHOKN9Yxo9KYLZddObMku4IuX3VUqFmRVCPIPwBrI+5eVgaZsQBnt9eqWMG+P57uF29DUeCXcWoaP0zICtfG9Pz7elc2NbB0xrvzlkjO3zNYpkKeRMXk8Z6dk/ggnvrLvODI8j6US7KixlNS6+wz00T5t95KMVYKnmTvVU0pPrLCJ0eDBW6SdeVnJOf+lYYCdEjNiHZZitHpC7LEVBlfLVtMFJC+SoCbHWfwPdfQD4yyvi9W2QCwll/FbA/BwdcmS2AMJgPM/JJ7OuaGDSej5zI3yMWAGYWdwdEB+SIEIcfYmy9ufzOQbS22ENeXOyj96KIbsOuiPrIqhBsrDzeMEISk/lTZegJgT+pm1icv5sx2tAQv65ajqsrN2lRgl1yo4oUHxw+MLPd1hFOpn8iis4m2NJ5FibgGaDzpD21PhXnh8JiCR9pVQlB73a22sfj/qkLl7veydAllozPeKMnPERIwHT6RdRrUh8kGKoqVR00pObIRt0H3Q24KyTNXL67L/Wu0W22dfV4U/RJ5q+NTzUyhr/3W5MY0CwCaKXmAab7S1Fy/4fu/rI0ROWH6R5f77Z/Jg5ulG7Pz6ReGl+OdBeV7UKexmUc9wGGlR3hID4BwjaumFWHRWciOjEgAlLrXRu+SnjNMCqV69ULilDIGnIcYHXokn0YB9Esr2dWJEzSphxB2omBOH1uO5/bfg6FrLvRyFtP2TIVdyxs+gfxoEI6UCmjiTRjKOAb0iei6AkAlMEAsWZwbJMnTQsQhLIcAn9yqVqeCqEk1XiVsCw==
X-Forefront-Antispam-Report: 	CIP:20.160.56.83;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(136003)(396003)(376002)(346002)(39850400004)(451199021)(5400799015)(46966006)(40470700004)(36840700001)(7416002)(44832011)(5660300002)(40460700003)(8676002)(8936002)(36860700001)(83380400001)(47076005)(2906002)(186003)(336012)(2616005)(36756003)(356005)(7596003)(7636003)(82740400003)(31696002)(34070700002)(86362001)(40480700001)(82310400005)(53546011)(6512007)(26005)(6506007)(54906003)(31686004)(316002)(6666004)(478600001)(6916009)(4326008)(70206006)(6486002)(70586007)(66899021)(41300700001)(43740500002)(12100799033);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 14:42:24.1077
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bded69d8-d67d-4523-c7c1-08db5ad2c1ac
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.83];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB8EUR05FT015.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9104
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

Hi Vladmir,

On 5/1/23 11:03, Sean Anderson wrote:
> On 4/29/23 13:24, Vladimir Oltean wrote:
>> On Wed, Apr 26, 2023 at 10:50:17AM -0400, Sean Anderson wrote:
>>> > I need to catch up with 14 rounds of patches from you and with the
>>> > discussions that took place on each version, and understand how you
>>> > responded to feedback like "don't remove PHY interrupts without finding
>>> > out why they don't work"
>>> 
>>> All I can say is that
>>> 
>>> - It doesn't work on my board
>>> - The traces are on the bottom of the PCB
>>> - The signal goes through an FPGA which (unlike the LS1046ARDB) is closed-source
>> 
>> I don't understand the distinction you are making here. Are the sources
>> for QIXIS bit streams public for any Layerscape board?
> 
> Correct. The sources for the LS1046ARDB QIXIS are available for download.
> 
>>> - The alternative is polling once a second (not terribly intensive)
>> 
>> It makes a difference to performance (forwarded packets per second), believe it or not.
> 
> I don't. Please elaborate how link status latency from the phy affects performance.
> 
>>> 
>>> I think it's very reasonable to make this change. Anyway, it's in a separate
>>> patch so that it can be applied independently.
>> 
>> Perhaps better phrased: "discussed separately"...
>> 
>>> > Even if the SERDES and PLL drivers "work for you" in the current form,
>>> > I doubt the usefulness of a PLL driver if you have to disconnect the
>>> > SoC's reset request signal on the board to not be stuck in a reboot loop.
>>> 
>>> I would like to emphasize that this has *nothing to do with this driver*.
>>> This behavior is part of the boot ROM (or something like it) and occurs before
>>> any user code has ever executed. The problem of course is that certain RCWs
>>> expect the reference clocks to be in certain (incompatible) configurations,
>>> and will fail the boot without a lock. I think this is rather silly (since
>>> you only need PLL lock when you actually want to use the serdes), but that's
>>> how it is. And of course, this is only necessary because I was unable to get
>>> major reconfiguration to work. In an ideal world, you could always boot with
>>> the same RCW (with PLL config matching the board) and choose the major protocol
>>> at runtime.
>> 
>> Could you please tell me what are the reference clock frequencies that
>> your board provides at boot time to the 2 PLLs, and which SERDES
>> protocol out of those 2 (1133 and 3333) boots correctly (no RESET_REQ
>> hacks necessary) with those refclks? I will try to get a LS1046A-QDS
>> where I boot from the same refclk + SERDES protocol configuration as
>> you, and use PBI commands in the RCW to reconfigure the lanes (PLL
>> selection and protocol registers) for the other mode, while keeping the
>> FRATE_SEL of the PLLs unmodified.
> 
>  From table 31-1 in the RM, the PLL mapping for 1133 is 2211, and the
>  PLL mapping for 3333 is 2222. As a consequence, for 1133, PLL 2 must be
>  156.25 MHz and PLL 1 must be either 100 or 125 MHz. And for 3333, PLL 2
>  must be either 100 or 125 MHz, and PLL 1 should be shut down (as it is
>  unused). This conflict for PLL 2 means that the same reference clock
>  configuration cannot work for both 1133 and 3333. In one of the
>  configurations, SRDS_RST_RR will be set in RSTRQSR1. On our board,
>  reference clock 1 is 156.25 MHz, and reference clock 2 is 125 MHz.
>  Therefore, 3333 will fail to boot. Unfortunately, this reset request
>  occurs before any user-configurable code has run (except the RCW), so
>  it is not possible to fix this issue with e.g. PBI.

Have you had a chance to review this driver?

--Sean
