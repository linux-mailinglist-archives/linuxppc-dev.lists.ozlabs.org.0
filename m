Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5CE7781EC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Aug 2023 22:00:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=L7je6Q69;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=L7je6Q69;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RMHpH6R93z3cKK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Aug 2023 06:00:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=L7je6Q69;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=L7je6Q69;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=52.100.14.246; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=lists.ozlabs.org)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03hn2246.outbound.protection.outlook.com [52.100.14.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RMHnK5yd0z2yVc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Aug 2023 05:59:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vqCcQF6hv2Em4JG/lk5bs931CgYQ8CxKrn7ijFI12MQ=;
 b=L7je6Q69QJKRwqQc41DLNZ+BzwuzPNO2vfagwDV4u4BNvHelyojQajdmcjIaYXEFwALELNPJ6cJyNkVrI0VOG3TIpiFDiOXjXlJV4AuIBqSl+wfwRWZWVMFJs0ZK72meGv4F+YzIw9OziEtA4fA6/b9RMqODDfeDhtOvMkqrwW2chpXFlVS4IJlTCJfvHVpbLEu/O9+J81FTU49x/qLUIHRlVRz1dc7lSL0jNOg0YvhvZ0sSW24dy3efVmTncItxhmZ3/c/7feyhtlozrZsu4+AdlZdv79IQUcnoPdDJp6aXbcKaMISxkCUJgEIKTsrpi00p6aATYzimHkMDprVqCw==
Received: from DUZPR01CA0205.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::18) by DB8PR03MB6331.eurprd03.prod.outlook.com
 (2603:10a6:10:133::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 19:58:54 +0000
Received: from DB8EUR05FT058.eop-eur05.prod.protection.outlook.com
 (2603:10a6:10:4b6:cafe::9) by DUZPR01CA0205.outlook.office365.com
 (2603:10a6:10:4b6::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30 via Frontend
 Transport; Thu, 10 Aug 2023 19:58:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.80)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.80 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.80; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.80) by
 DB8EUR05FT058.mail.protection.outlook.com (10.233.238.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.19 via Frontend Transport; Thu, 10 Aug 2023 19:58:53 +0000
Received: from outmta (unknown [192.168.82.132])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 5B4A920086FC2;
	Thu, 10 Aug 2023 19:58:53 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown [104.47.13.58])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id B690E2008006E;
	Thu, 10 Aug 2023 19:58:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E+0nHigU1ylepqZjbpuXIdXaLEmykWPrF20NnnZpRoD1e6WJALNbKUgXn/AQK9m2jfoCWJBbO3U+G9bdyTfGneVpqyxy3z/V6OUTvSp861dZciM0Ui/B8VSVDxOG7M7JIUc6eQCBJZ3Dk+A0+djbKapzHgeSkazVzUql5Gq10SNDW33AusVtVHk9HS0ZQ9CpcTsX7p8JB335eGvifACDiMXHy1w0UuuVdInSgHUGU2ZNpgNyrua1D6VpQEOlfR6y7nynKM4AQzqcGgWj+H4y19E20sGuUxzNztdqx9DZwDlR9erjOASSLvp4phWzraaBuAGpnIySCdmAvw5C/7EhZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqCcQF6hv2Em4JG/lk5bs931CgYQ8CxKrn7ijFI12MQ=;
 b=bvPVx5OZcH5ByZULNq3iHCtOAJY+C8n1hI98q4FTfs1lFGXIH4em1z3Soa6kUgLntPOxiwzNHUBaHaFlOUXbPGlMsP9YiBF+tFiZPqjPQR5E7obb4MahO1GEJddCPeMBvI1za4Ql02G0NBJbiOZl9Sw8g9c+S2qAQ5obJaR0n+KowJn4l3ZPqIryFZ7o4LSh4dSRRrxv0nrSeymQnnvLaEFpa91hTWzOg8uMKYkQ/2VhNm+KpKL1pzcmWtJVoRtA5YlwF7TRrG8CB64R4QNLLfMPoS7TXQzvf/yi0SWgZ1B1leRWMhNd7nUvz/7ye6sghCeboNmxZHrg60N4yyAbJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vqCcQF6hv2Em4JG/lk5bs931CgYQ8CxKrn7ijFI12MQ=;
 b=L7je6Q69QJKRwqQc41DLNZ+BzwuzPNO2vfagwDV4u4BNvHelyojQajdmcjIaYXEFwALELNPJ6cJyNkVrI0VOG3TIpiFDiOXjXlJV4AuIBqSl+wfwRWZWVMFJs0ZK72meGv4F+YzIw9OziEtA4fA6/b9RMqODDfeDhtOvMkqrwW2chpXFlVS4IJlTCJfvHVpbLEu/O9+J81FTU49x/qLUIHRlVRz1dc7lSL0jNOg0YvhvZ0sSW24dy3efVmTncItxhmZ3/c/7feyhtlozrZsu4+AdlZdv79IQUcnoPdDJp6aXbcKaMISxkCUJgEIKTsrpi00p6aATYzimHkMDprVqCw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS2PR03MB8817.eurprd03.prod.outlook.com (2603:10a6:20b:550::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.19; Thu, 10 Aug
 2023 19:58:43 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::21bd:6579:b3d1:e5f7]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::21bd:6579:b3d1:e5f7%4]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 19:58:43 +0000
Message-ID: <b1df425f-1ea4-0465-674c-25f3ed9b73d4@seco.com>
Date: Thu, 10 Aug 2023 15:58:36 -0400
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
 <20230810102631.bvozjer3t67r67iy@skbuf>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20230810102631.bvozjer3t67r67iy@skbuf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:208:91::28) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS2PR03MB8817:EE_|DB8EUR05FT058:EE_|DB8PR03MB6331:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e373062-55ba-45c2-7528-08db99dc3959
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  S0iRWEe62bA5dDWDr5o6L3Lm6+hS2QxfM3vadQ4zg8MFI014MS2geCPHP944K1uRzxBsNwXCcPWY7H2S2bfcASFexwKN3A9lW3UdRBfLMieGUydCGVnMhLkWHOm5urk8WKOXQDKYU95ylF3qF8O/uoSJ6U0UF/L0588ZOhkEpvfoRPyo6yl2SUFI1stM6r9wE8FkeECPYxjLnJmdQDD563TArt9pGwgo3Qyjx2ST+zHZ6DN7KaSmlNfF3iVokZJM79K2KyBTEpHommugyKjYSqkZaJ5Q4M7rQ8KTMJtpNRpHx/MXXsfrWxCTDvH5UBf6hr1vV8ihZpSXAQXkRCP52+mfHLOaO7M3Fky9o55j27tWSQHr2hZ9vbdwPA/5H3W0ZXJ+ivH4andoG8iztzAAV82iJq5MOdfkz3Lx7wIyGvgsQoVI5+17BcVXHl4sW2zAWgcKZA/oJIrkKwJoCkizLaE3wnBSiJ15akhiZ4So/pHd3dQglAkd8DpccDIbW3zhcLktw791BgPslR/0mjjeNUsLtwERIU1eu0Sdl5A5c+t4MbpWNhcc4u4EGBhsKgDsqk0n5I/REq4ppKHf+Kwba4PmEBIrpVAd0ywznJjELixHR0DunIoWCM0tFXuSoiMwqlioRfdOdad+xfA42auR5kK0/n5SoJAcE/iy7Bp5sCw=
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(376002)(346002)(39850400004)(366004)(186006)(1800799006)(451199021)(6506007)(26005)(52116002)(6486002)(966005)(6512007)(38350700002)(38100700002)(478600001)(54906003)(83380400001)(316002)(6916009)(66476007)(66556008)(66946007)(4326008)(53546011)(2616005)(6666004)(31686004)(41300700001)(8676002)(8936002)(66899021)(44832011)(30864003)(2906002)(5660300002)(7416002)(86362001)(31696002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB8817
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB8EUR05FT058.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	bab5a91e-a95a-4c54-6bf3-08db99dc332b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	pTQLGyQbYrZa8c9PDzdrY+9yG90T+YXvKcdY0iGpx6TrySefMCZrE1rQ7y92wPZYhhviisX2mKyoyyXnp3mZDL4KxBSxtWeyXe1JbN266CsbgduD1STXFS58fGdS4L9H2Zb8ufYvkLtrBRfV5dLDY0znQZE5I+L2xv382hTqxWgDtJi/lviULNb3YJiksymCtPGd1eoHtz1MdPFjG0sPfWNQ2DN6wmZuD2q4gs7Bm57Hi9OiaWTSP/2P7wu1WZ7M8yjXAD7uAMjAZacxnSmCNrkSvSXHxK56/p4Iz3rrSumqE9LTdooxpmjAPqE4po0HRYvL8pXD6DGKmNRIvtB6MwLEysKmIyBdF+f9+VD26wUTOAaSZ0vAAqLl/FnuHpNMeABII93VUpe9VQ1p35/Jc1iR7gvj30mED1m3+uJUjdq7WGL4ZQnTKi4rAuRAt7OIhrVwSyZveG5O2/a4JmR192gOKM624kdvcQs3vwtwGZShDlthtOaeOhZeKep4N/BOTGEFAqKB4aWPA4F4TvestL6M/bKliKxaJNsVTXQM9M8qonlwFHDWzWVZOSEt5lNxeAEOZ+l8UuZlhJ/trgyUT7Ct4gtJMpns31EKmXWZbVH0lwMj9Joj8MJqzMnclZb4/lVjiUWrLoR4E7Fo6mcZYONEWDU5+Qu7K026DY6rWpUz4lI8h3oSb+GpmtiRoNco0ZoLCRPMpZ/nsYHWobtNC89hAmE955NKsRxnin1PdHj81fkqqxjAu/RF1hpoJEVG4OQg7gxuD2A17TY/8On/v4nDBjMq4aXE/C+I/RQCcGvPgJmud2rC3qpW8l4datd8
X-Forefront-Antispam-Report: 	CIP:20.160.56.80;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(396003)(136003)(376002)(39850400004)(346002)(186006)(82310400008)(1800799006)(5400799015)(451199021)(46966006)(40470700004)(36840700001)(4326008)(6916009)(47076005)(36860700001)(31686004)(70586007)(70206006)(66899021)(41300700001)(83380400001)(2616005)(40480700001)(5660300002)(6486002)(31696002)(7636003)(7416002)(54906003)(8676002)(86362001)(6666004)(8936002)(7596003)(356005)(2906002)(478600001)(82740400003)(30864003)(6512007)(966005)(40460700003)(6506007)(26005)(36756003)(53546011)(34070700002)(316002)(44832011)(336012)(43740500002)(12100799036);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 19:58:53.6138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e373062-55ba-45c2-7528-08db99dc3959
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.80];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB8EUR05FT058.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB6331
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

Hi Vladimir,

On 8/10/23 06:26, Vladimir Oltean wrote:
> Hi Sean,
> 
> On Tue, Jun 13, 2023 at 05:27:54PM +0300, Vladimir Oltean wrote:
>> The way things are supposed to work (*if* this works at all) is that the
>> reset state machine starts with a supported PLL / refclk configuration
>> that permits a certain subset of protocols, and the SERDES protocols can
>> be changed from the reset state, as desired, for the individual lanes.
>> 
>> What is self-inflicted is that the refclks on your board design are not
>> supportable by any reset state machine configuration, and wiring them
>> that way was a conscious decision. Did your company's board designers
>> receive the recommendation to disconnect RESET_REQ from NXP, and has NXP
>> said that the end result will be something that continues to be supportable?
>> I've searched the customer support database and the answer seems to be no.
>> In any case, if you have to disconnect RESET_REQ from the SoC to make
>> the driver in this form useful, then... yeah, no. You're obviously free
>> to do whatever you want with your products, but that's not how mainline
>> Linux works, it needs to be useful beyond you.

As explained previously (and noted by yourself below) 1G and 10G RCWs
have mutally-incompatible clocking requirements. Now that you have
documented an alternate solution, it is possible to boot up with one RCW
and switch to another. But without that it was not possible to have one
board support both RCWs (without e.g. a microcontroller or FPGA to
configure the clock generator before releasing the processor reset). I
do not think that the silicon should assert the reset request line if
the serdes doesn't lock, but it does and it can't really be disabled.

As it happens, our board is set up so that the reference clocks are
configured for 10G by default. During this boot, reset request is never
requested. If we did not have to support software configuration of the
serdes speed (to support 1G SFPs) we would not have to disconnect reset
request.

That said, I have evaluated the various reasons that reset request can
be asserted, and I have determined that for our product they are not
necessary. The only major limitation is the lack of a watchdog, but that
was not a requirement for us. Because of this, using a GPIO for reset is
sufficient and neatly avoids the issue.

We did not see the need to contact NXP support because we internally
came up with a reliable solution. I suspect that they would not have
suggested the solution you present below, but if you think otherwise I
will try them in the future :)

I would appreciate if you are not so derisive in your comments. I do not
like reading your emails because they are very abrasive.

>> If protocol switching works, I will maintain that your board should have
>> wired the refclks to PLLs the other way around (which is supported by
>> the RCW), and then proceed to do protocol switching to reach the desired
>> configuration.
> 
> It was quite a journey to piece everything together.
> 
> There is one thing to be mentioned right from the start, and that is
> that on some SoCs (including the LS1043A and LS1046A), the SerDes data
> path is partially controlled by the RCW, and thus, dynamically performing
> a major SerDes protocol reconfiguration requires a RCW override procedure
> (undocumented in the SerDes reconfiguration steps, but all the info you
> need is summarized below).
> 
> The DCFG block has a set of RCWSR0 - RCWSR15 read-only status registers
> relative to DCFG_CCSR. What we don't document in the SoC RM, but I got
> permission to say here, is that the DCFG block exposes a second set of
> Expert Mode registers in the DCSR address space (base address 2000_0000h).
> The DCFG_DCSR register region spans from offset 2_0000h to 2_05AC into
> the DCSR base address. At the exact same offsets into DCFG_DCSR as
> RCWSR0 - RCWSR15 are into DCFG_CCSR (aka 100h-13ch), one can find the
> shadow RCWCR0 - RCWCR15 (Reset Control Word Control Register) registers
> which are also writable. There is a one-to-one mapping between each
> register (and field) in RCWSR and RCWCR, so I won't detail the
> contents of the RCWCR registers, because we document RCWSR fully.
>
> RCW override means modifying some of the RCWCR registers. In this
> particular case, finalizing the major SerDes reconfiguration requires
> overriding SRDS_PRTCL_S1 in RCWCR5 with the new per-lane settings, to mux
> the correct PCS to the MAC. In the general case, random RCW overrides
> that don't come from the hardware validation team are unsupported by
> NXP, and you should expect the procedure to yield unpredictable results.

Good to see these finally documented (in some form or other). Perhaps
these could also be used to enable e.g. a UART in the hard-coded RCW
without requiring e.g. JTAG...

> I don't know how much of the above steps is applicable to the other 10G Lynx
> SoCs (LS1088, LS2088 etc). Not all SoCs may require RCW override, and
> the RCW override procedure may not be the same. That is TBD, and we'd
> appreciate if support for other SoCs than the LS1046 to be added no
> earlier than when we have a validated SerDes reconfiguration procedure.
> 
> I believe this is enough information to permit the creation of a Linux
> driver on the DCFG_DCSR registers which permits RCW override at runtime.
> It seems this will be necessary at least on LS1046.
> 
> We should discuss who and when picks up your patches, removes the
> unsupported, untested and unnecessary code and adds the RCW override
> procedure.

Well, while I don't agree with your characterization (since this code
was indeed tested by me and was indeed necessary), I am glad to see that
you think there is a path forward.

> It can be you, it can also be someone from NXP. If it will be
> you, please let me know, because there are concrete implementation
> choices I want to leave comments on.

I can look into doing this. It will be in my free time, so it will
likely be a bit before I can update this series.

> There is also the previous observation from Ioana that you should not
> delete PHY interrupts without finding out why they don't work.

Well, if you have a better solution, please let me know. The interrupt
does not work in real hardware.

I was hampered in my efforts to determine the cause because the interrupt
passes through an FPGA to which I lack the HDL. So far, I have not seen
any argument against polling except that we do not understand the
problem yet. However, I have not seen any other analysis of the problem
either.

> Only what was thoroughly tested and is based on a hardware validated
> procedure should be submitted. This means only a 1G <-> 10G transition
> on LS1046 for now.
> 
> Nonetheless, below is a functional example of how NXP would recommend
> you to achieve the desired PLL mapping for any RCW-based SerDes protocol.
> My testing platform was the LS1046A-QDS with PLL1 at 100 MHz and PLL2 at
> 156.25 MHz. I believe that this should eliminate the need for a clk
> driver for the PLLs, and should make your Ethernet lanes usable much
> earlier than Linux. That being said, our position at NXP is that you
> don't need a clk driver for the PLLs, and I would like to see the clk
> portion removed from future patch revisions.

I have not had any issues with clocking. This is actually one of the
areas where the reference manual is sufficient to create a working
driver. Adding flexibility here is very useful, because we can solve
hardware problems in software. This can reduce e.g. board respins, and
allow for more interesting clocking solutions (such as allowing clock
generators which must be configured before use).

> This patch is on top of https://cas5-0-urlprotect.trendmicro.com:443/wis/clicktime/v1/query?url=https%3a%2f%2fgithub.com%2fnxp%2dqoriq%2frcw%2ftree%2flf%2d6.1.22%2d2.0.0&umid=9173333f-cda0-48a2-a652-ccb5b892d77e&auth=d807158c60b7d2502abde8a2fc01f40662980862-d3ec43c9e78658dbb409cef29887d136eca21c6a
> 
> From 9f90d6805883f23a898f9d66826f89b7ba73afe3 Mon Sep 17 00:00:00 2001
> From: Vladimir Oltean <vladimir.oltean@nxp.com>
> Date: Thu, 25 May 2023 11:23:41 +0300
> Subject: [PATCH] LS1046A: implement a PBI-based SerDes protocol switching
>  mechanism
> 
> The LS1046A reset state machine is a bit limited in the SRDS_PRTCL_S1
> protocol combinations that it offers. For example, it offers protocol
> 0x3333 (4x SGMII) only with PLL mapping 2222, and that is good as long
> as dynamic protocol switching between 1G (SGMII) and 10G (XFI) isn't
> desired at runtime.
> 
> If that is taken into account as an additional constraint, then we need
> PLL2 (yes, specifically 2) to have a refclk of 156.25 MHz, and that is
> in conflict with the PLL mapping of the aforementioned 0x3333, because
> 1G (SGMII) can only work with a PLL refclk of 100 or 125 MHz, so that's
> what has to be fed into PLL 2.
> 
> Dynamic frequency switching of PLLs is hard and out of question.
> 
> It is desirable to be able to use PLL2 for the 156.25 MHz refclk
> frequency (for the 10G link modes), and PLL1 for the 100 MHz refclk
> frequency (for the 1G link modes). It turns out, this is possible, even
> if not 100% natively through the reset state machine built-in options.
> 
> The strategy is to pick a pair of SerDes refclk frequencies in the RCW
> that is correct for the given board (thus allowing the SerDes PLLs to
> lock, and the SoC to boot) as a first step. The SerDes protocol can be
> absolutely anything as long as the PLL frequencies are right, because as
> a second step, we'll be fixing up the SerDes lane registers for the
> desired final protocol, to appear as if we had that protocol natively.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
>  .../rcw_1600.rcw                              |  99 +++++++++++++++++
>  ls1046ardb/serdes_1133_to_3333.rcw            |  73 +++++++++++++
>  serdes_10g.rcw                                | 102 ++++++++++++++++++
>  3 files changed, 274 insertions(+)
>  create mode 100644 ls1046aqds/RR_FFSNPPPH_1133_5559_to_3333_5559/rcw_1600.rcw
>  create mode 100644 ls1046ardb/serdes_1133_to_3333.rcw
>  create mode 100644 serdes_10g.rcw
> 
> diff --git a/ls1046aqds/RR_FFSNPPPH_1133_5559_to_3333_5559/rcw_1600.rcw b/ls1046aqds/RR_FFSNPPPH_1133_5559_to_3333_5559/rcw_1600.rcw
> new file mode 100644
> index 000000000000..2bbc0163392d
> --- /dev/null
> +++ b/ls1046aqds/RR_FFSNPPPH_1133_5559_to_3333_5559/rcw_1600.rcw
> @@ -0,0 +1,99 @@
> +/*
> + * LS1046AQDS RCW for SerDes Protocol 0x3333_5559 derived from 0x1133_5559
> + *
> + * 42G configuration -- 2 RGMII + 4 SGMII (reconfigurable to XFI) + 3 PCIe + SATA
> + *
> + * Frequencies:
> + *
> + * Sys Clock: 100 MHz
> + * DDR_Refclock: 100 MHz
> + *
> + * Core		-- 1600 MHz (Mul 16)
> + * Platform	-- 600 MHz (Mul 6)
> + * DDR		-- 2100 MT/s (Mul 21)
> + * FMan		-- 700 MHz (CGA2 /2)
> + * XFI		-- 156.25 MHz (10.3125G)
> + * SGMII	-- 100 MHz (5G)
> + * PCIE		-- 100 MHz (5G)
> + * eSDHC	-- 1400 MHz (CGA2 /1)
> + *
> + * Hardware Accelerator Block Cluster Group A Mux Clock:
> + *   FMan        - HWA_CGA_M1_CLK_SEL = 6 - Async mode, CGA PLL 2 /2 is clock
> + *   eSDHC, QSPI - HWA_CGA_M2_CLK_SEL = 1 - Async mode, CGA PLL 2 /1 is clock
> + *
> + * Serdes Lanes vs Slot information
> + *  Serdes1 Lane 0 (D) - Starts as XFI9, switches to SGMII9
> + *  Serdes1 Lane 1 (C) - Starts as XFI10, switches to SGMII10
> + *  Serdes1 Lane 2 (B) - SGMII5, Slot 1
> + *  Serdes1 Lane 3 (A) - SGMII6, Slot 1
> + *
> + *  Serdes2 Lane 0 (A) - PCIe1 Gen2 x1, Slot 3
> + *  Serdes2 Lane 1 (B) - PCIe2 Gen2 x1, Slot 4
> + *  Serdes2 Lane 2 (C) - PCIe3 Gen2 x1, Slot 5
> + *  Serdes2 Lane 3 (D) - SATA
> + *
> + * PLL mapping: starts as 2211_2221, ends as 1111_2221
> + *
> + * Serdes 1:
> + *  PLL mapping: 1111
> + *  SRDS_PLL_REF_CLK_SEL_S1 : 0b'01
> + *    SerDes 1, PLL1[160] : 0 - 100MHz for SGMII and PCIe
> + *    SerDes 1, PLL2[161] : 1 - 156.25MHz for XFI
> + *  SRDS_PLL_PD_S1 : 0b'0
> + *    SerDes 1, PLL1 : 0 - not powered down
> + *    SerDes 1, PLL2 : 0 - not powered down
> + *  SRDS_DIV_PEX_S1 :
> + *    Only used for PEX, not used.
> + *
> + * Serdes 2:
> + *  PLL mapping: 2221
> + *  SRDS_PLL_REF_CLK_SEL_S2 : 0b'00
> + *    SerDes 2, PLL1[162] : 0 - 100MHz for SATA
> + *    SerDes 2, PLL2[163] : 0 - 100MHz for PCIe
> + *  SRDS_PLL_PD_S2 : 0b'00
> + *    SerDes 2, PLL1 : 0 - not powered down
> + *    SerDes 2, PLL2 : 0 - not powered down
> + *  SRDS_DIV_PEX_S2 : 0b'01
> + *    00 - train up to max rate of 8G
> + *    01 - train up to max rate of 5G
> + *    10 - train up to max rate of 2.5G
> + *
> + * DDR clock:
> + * DDR_REFCLK_SEL : 1 - DDRCLK pin provides the reference clock to the DDR PLL
> + *
> + */
> +
> +#include <../ls1046ardb/ls1046a.rcwi>
> +
> +SYS_PLL_RAT=6
> +MEM_PLL_RAT=21
> +CGA_PLL1_RAT=16
> +CGA_PLL2_RAT=14
> +SRDS_PRTCL_S1=4403
> +SRDS_PRTCL_S2=21849

I know it is not typical for NXP RCWs, but your rcw tool supports using
hex/binary prefixes. Thus, you could rewrite the above lines as

SRDS_PRTCL_S1=0x1133
SRDS_PRTCL_S2=0x5559

IMO this is much easier to read, since it matches the documentation.

> +SRDS_PLL_REF_CLK_SEL_S1=1
> +SRDS_PLL_REF_CLK_SEL_S2=0
> +SRDS_DIV_PEX_S1=1
> +SRDS_DIV_PEX_S2=1
> +DDR_FDBK_MULT=2
> +DDR_REFCLK_SEL=1
> +PBI_SRC=14

As another example, here you can do e.g.

PBI_SRC=0b1110

which better matches the documentation.

> +IFC_MODE=37
> +HWA_CGA_M1_CLK_SEL=6
> +DRAM_LAT=1
> +UART_BASE=7
> +IRQ_OUT=1
> +LVDD_VSEL=1
> +TVDD_VSEL=0
> +DVDD_VSEL=2
> +EVDD_VSEL=2
> +IIC2_EXT=1
> +SYSCLK_FREQ=600
> +HWA_CGA_M2_CLK_SEL=1
> +
> +#include <../ls1046ardb/cci_barrier_disable.rcw>
> +#include <../ls1046ardb/usb_phy_freq.rcw>
> +#include <../ls1046ardb/uboot_address.rcw>
> +#include <../ls1046ardb/serdes_sata.rcw>
> +#include <../ls1046ardb/a009531.rcw>
> +#include <../ls1046ardb/serdes_1133_to_3333.rcw>
> diff --git a/ls1046ardb/serdes_1133_to_3333.rcw b/ls1046ardb/serdes_1133_to_3333.rcw
> new file mode 100644
> index 000000000000..ffd548a73675
> --- /dev/null
> +++ b/ls1046ardb/serdes_1133_to_3333.rcw
> @@ -0,0 +1,73 @@
> +/*
> + * Change protocols on SerDes1 from 1133 to 3333, and their PLL mappings from
> + * 2211 to 1111. This is useful because, although the reset state machine has a
> + * native 0x3333 SerDes protocol option, the PLL mapping of that is 2222.
> + * This non-native option frees up PLL 2, and it can be provisioned e.g. with a
> + * 156.25 MHz for any lanes that might want to switch to XFI at runtime.
> + */
> +
> +#define SRDS_BASE		0xea0000 /* SerDes 1 relative to CCSR_BASE */
> +#include <../serdes_10g.rcw>
> +
> +/* For writing outside the CCSR space (in DCSR), an indirect access method is
> + * used. The SCFG_ALTCBAR register (field ALTCFG) holds the upper 24 bits of
> + * the 48-bit address, and the awrite PBL instruction gets the lower 24 bits of
> + * the address that is relative to that. Here we work with 32-bit addresses,
> + * so we only care about the upper 8 bits.
> + */
> +#define SCFG_ALTCBAR		0x570158
> +#define ALTCFG(x)		(((x) << 8) & 0xffffff00)
> +#define DCFG_DCSR_RCWCR5	0x20140110
> +#define RCWCR5_SRDS_PRTCL_S1(x)	(((x) << 16) & 0xffff0000)
> +#define RCWCR5_SRDS_PRTCL_S2(x)	((x) & 0xffff)
> +#define upper_8_bits(x)		(((x) & 0xff000000) >> 24)
> +#define lower_24_bits(x)	((x) & 0xffffff)
> +
> +#define GCR0_SGMII_FROM_PLL1	RPLL_LES(1) | RRAT_SEL(2) | \
> +				TPLL_LES(1) | TRAT_SEL(2) | \
> +				FIRST_LANE(1) | PROTS(1)
> +
> +.pbi
> +
> +write LNmGCR0(2), RRST_B(0) | TRST_B(0)
> +write LNmGCR0(3), RRST_B(0) | TRST_B(0)
> +
> +wait 50
> +
> +write LNmGCR0(2), GCR0_SGMII_FROM_PLL1
> +write LNmGCR0(3), GCR0_SGMII_FROM_PLL1
> +
> +write LNmGCR1(2), REIDL_TH(1) | REIDL_EX_SEL(3) | REIDL_ET_MSB(1) | \
> +		  ISLEW_RCTL(1) | OSLEW_RCTL(1)
> +write LNmGCR1(3), REIDL_TH(1) | REIDL_EX_SEL(3) | REIDL_ET_MSB(1) | \
> +		  ISLEW_RCTL(1) | OSLEW_RCTL(1)
> +
> +write LNmRECR0(2), GK2OVD_EN(1) | GK2OVD(15) | GK3OVD_EN(1) | GK3OVD(15)
> +write LNmRECR0(3), GK2OVD_EN(1) | GK2OVD(15) | GK3OVD_EN(1) | GK3OVD(15)
> +
> +write LNmTECR0(2), ADPT_EQ(48) | AMP_RED(6)
> +write LNmTECR0(3), ADPT_EQ(48) | AMP_RED(6)
> +
> +/* LS1046A requires RCW override to reconfigure the mux between
> + * the PCS and the MAC.
> + */
> +write SCFG_ALTCBAR, ALTCFG(upper_8_bits(DCFG_DCSR_RCWCR5))
> +flush
> +awrite lower_24_bits(DCFG_DCSR_RCWCR5), RCWCR5_SRDS_PRTCL_S1(0x3333) | \
> +					RCWCR5_SRDS_PRTCL_S2(0x5559)
> +
> +/* PCCRB: 0x21000000 -> 0x00000000 */
> +write PCCRB, XFIA_CFG(0) | XFIB_CFG(0)
> +
> +/* PCCR8: 0x11000000 -> 0x11110000 */
> +write PCCR8, SGMIIA_CFG(1) | SGMIIB_CFG(1) | SGMIIC_CFG(1) | SGMIID_CFG(1)
> +
> +write SGMIIaCR1(2), SGMII_MDEV_PORT(0) | SGPCS_EN(1)
> +write SGMIIaCR1(3), SGMII_MDEV_PORT(0) | SGPCS_EN(1)
> +
> +wait 120
> +
> +write LNmGCR0(2), GCR0_SGMII_FROM_PLL1 | RRST_B(1) | TRST_B(1)
> +write LNmGCR0(3), GCR0_SGMII_FROM_PLL1 | RRST_B(1) | TRST_B(1)
> +
> +.end
> diff --git a/serdes_10g.rcw b/serdes_10g.rcw
> new file mode 100644
> index 000000000000..714d53fde8af
> --- /dev/null
> +++ b/serdes_10g.rcw
> @@ -0,0 +1,102 @@
> +/*
> + * Registers for the Lynx 10G SerDes block.
> + *
> + * Must be included by an SoC-specific header that defines the
> + * SRDS_BASE value.
> + */
> +
> +#define PLLnRSTCTL(n)		(SRDS_BASE + (0x20 * (n)))
> +#define PLLnCR0(n)		(SRDS_BASE + (0x20 * (n)) + 0x0004)
> +#define  POFF(x)		(((x) << 31) & 0x80000000)
> +#define  REFCLK_SEL(x)		(((x) << 28) & 0x70000000)
> +#define  REFCLK_EN(x)		(((x) << 27) & 0x08000000)
> +#define  FRATE_SEL(x)		(((x) << 16) & 0x000f0000)
> +#define  DLYDIV_SEL(x)		((x) & 0x00000003)
> +#define PCCR8			(SRDS_BASE + 0x0220)
> +#define  SGMIIA_KX(x)		(((x) << 31) & 0x80000000)
> +#define  SGMIIA_CFG(x)		(((x) << 28) & 0x70000000)
> +#define  SGMIIB_KX(x)		(((x) << 27) & 0x08000000)
> +#define  SGMIIB_CFG(x)		(((x) << 24) & 0x07000000)
> +#define  SGMIIC_KX(x)		(((x) << 23) & 0x00800000)
> +#define  SGMIIC_CFG(x)		(((x) << 20) & 0x00700000)
> +#define  SGMIID_KX(x)		(((x) << 19) & 0x00080000)
> +#define  SGMIID_CFG(x)		(((x) << 16) & 0x00070000)
> +#define  SGMIIE_KX(x)		(((x) << 15) & 0x00008000)
> +#define  SGMIIE_CFG(x)		(((x) << 12) & 0x00007000)
> +#define  SGMIIF_KX(x)		(((x) << 11) & 0x00000800)
> +#define  SGMIIF_CFG(x)		(((x) << 8) & 0x00000700)
> +#define  SGMIIG_KX(x)		(((x) << 7) & 0x00000080)
> +#define  SGMIIG_CFG(x)		(((x) << 4) & 0x00000070)
> +#define  SGMIIH_KX(x)		(((x) << 3) & 0x00000008)
> +#define  SGMIIH_CFG(x)		((x) & 0x00000007)
> +#define PCCRB			(SRDS_BASE + 0x022c)
> +#define  XFIA_CFG(x)		(((x) << 28) & 0x70000000)
> +#define  XFIB_CFG(x)		(((x) << 24) & 0x07000000)
> +#define  XFIC_CFG(x)		(((x) << 20) & 0x00700000)
> +#define  XFID_CFG(x)		(((x) << 16) & 0x00070000)
> +#define  XFIE_CFG(x)		(((x) << 12) & 0x00007000)
> +#define  XFIF_CFG(x)		(((x) << 8) & 0x00000700)
> +#define  XFIG_CFG(x)		(((x) << 4) & 0x00000070)
> +#define  XFIH_CFG(x)		((x) & 0x00000007)
> +#define LNmGCR0(m)		(SRDS_BASE + (0x40 * (m)) + 0x0800)
> +#define  RPLL_LES(x)		(((x) << 31) & 0x80000000)
> +#define  RRAT_SEL(x)		(((x) << 28) & 0x30000000)
> +#define  TPLL_LES(x)		(((x) << 27) & 0x08000000)
> +#define  TRAT_SEL(x)		(((x) << 24) & 0x03000000)
> +#define  RRST_B(x)		(((x) << 22) & 0x00400000)
> +#define  TRST_B(x)		(((x) << 21) & 0x00200000)
> +#define  RX_PD(x)		(((x) << 20) & 0x00100000)
> +#define  TX_PD(x)		(((x) << 19) & 0x00080000)
> +#define  IF20BIT_EN(x)		(((x) << 18) & 0x00040000)
> +#define  FIRST_LANE(x)		(((x) << 16) & 0x00010000)
> +#define  GCR0_RSV		0x1000
> +#define  PROTS(x)		(((x) << 7) & 0x00000f80)
> +#define LNmGCR1(m)		(SRDS_BASE + (0x40 * (m)) + 0x0804)
> +#define  RDAT_INV(x)		(((x) << 31) & 0x80000000)
> +#define  TDAT_INV(x)		(((x) << 30) & 0x40000000)
> +#define  OPAD_CTL(x)		(((x) << 26) & 0x04000000)
> +#define  REIDL_TH(x)		(((x) << 20) & 0x00700000)
> +#define  REIDL_EX_SEL(x)	(((x) << 18) & 0x000C0000)
> +#define  REIDL_ET_SEL(x)	(((x) << 16) & 0x00030000)
> +#define  REIDL_EX_MSB(x)	(((x) << 15) & 0x00008000)
> +#define  REIDL_ET_MSB(x)	(((x) << 14) & 0x00004000)
> +#define  REQ_CTL_SNP(x)		(((x) << 13) & 0x00002000)
> +#define  REQ_CDR_SNP(x)		(((x) << 12) & 0x00001000)
> +#define  TRSTDIR(x)		(((x) << 7) & 0x00000080)
> +#define  REQ_BIN_SNP(x)		(((x) << 6) & 0x00000040)
> +#define  ISLEW_RCTL(x)		(((x) << 4) & 0x00000030)
> +#define  GCR1_RSV		0x8
> +#define  OSLEW_RCTL(x)		((x) & 0x3)
> +#define LNmRECR0(m)		(SRDS_BASE + (0x40 * (m)) + 0x0810)
> +#define  RXEQ_BST(x)		(((x) << 28) & 0x10000000)
> +#define  GK2OVD(x)		(((x) << 24) & 0x0f000000)
> +#define  GK3OVD(x)		(((x) << 16) & 0x000f0000)
> +#define  GK2OVD_EN(x)		(((x) << 15) & 0x00008000)
> +#define  GK3OVD_EN(x)		(((x) << 14) & 0x00004000)
> +#define  OSETOVD_EN(x)		(((x) << 13) & 0x00002000)
> +#define  BASE_WAND(x)		(((x) << 10) & 0x00000c00)
> +#define  OSETOVD(x)		((x) & 0x0000007F)
> +#define LNmTECR0(m)		(SRDS_BASE + (0x40 * (m)) + 0x0818)
> +#define  TEQ_TYPE(x)		(((x) << 28) & 0x30000000)
> +#define  SGN_PREQ(x)		(((x) << 26) & 0x04000000)
> +#define  RATIO_PREQ(x)		(((x) << 22) & 0x03C00000)
> +#define  SGN_POST1Q(x)		(((x) << 21) & 0x00200000)
> +#define  RATIO_PST1Q(x)		(((x) << 16) & 0x001F0000)
> +#define  ADPT_EQ(x)		(((x) << 8) & 0x00003F00)
> +#define  AMP_RED(x)		((x) & 0x0000003f)
> +#define LNmTTLCR0(m)		(SRDS_BASE + (0x40 * (m)) + 0x0820)
> +#define LNmTCSR0(m)		(SRDS_BASE + (0x40 * (m)) + 0x0830)
> +#define LNmTCSR1(m)		(SRDS_BASE + (0x40 * (m)) + 0x0834)
> +#define LNmTCSR2(m)		(SRDS_BASE + (0x40 * (m)) + 0x0838)
> +#define LNmTCSR3(m)		(SRDS_BASE + (0x40 * (m)) + 0x083c)
> +#define SGMIIaCR0(a)		(SRDS_BASE + (0x10 * (a)) + 0x1800)
> +#define  RST_SGM(x)		(((x) << 31) & 0x80000000)
> +#define  PD_SGM(x)		(((x) << 30) & 0x40000000)
> +#define SGMIIaCR1(a)		(SRDS_BASE + (0x10 * (a)) + 0x1804)
> +#define  SGMII_MDEV_PORT(x)	(((x) << 27) & 0xf8000000)
> +#define  SGPCS_EN(x)		(((x) << 11) & 0x00000800)
> +#define XFIaCR0(a)		(SRDS_BASE + (0x10 * (a)) + 0x1980)
> +#define  RST_XFI(x)		(((x) << 31) & 0x80000000)
> +#define  PD_XFI(x)		(((x) << 30) & 0x40000000)
> +#define XFIaCR1(a)		(SRDS_BASE + (0x10 * (a)) + 0x1984)
> +#define  XFI_MDEV_PORT(x)	(((x) << 27) & 0xf8000000)
> --
> 2.34.1
> 
>> > This driver would also be a good place to add the KR link training with
>> > NXP tried to upstream a few years ago.
>> 
>> Well, speaking as someone who is now also tasked with the copper backplane
>> support, believe me that I know that, and this is why I'm so desperate
>> with the logic you're trying to push forward. It's clear that we should
>> try to collaborate rather than try to push individualistic non-tested
>> non-solutions.
> 
> Speaking of this, I will send an RFC in the upcoming days which proposes
> a model for the copper backplane PHY support on LX2160A and its already
> existing Lynx 28G SerDes driver.
> 
> I will concern myself with porting that support on Lynx 10G only once
> the model I propose turns out to be acceptable for both the network PHY
> as well as the generic PHY maintainers.

Well, as far as I know this driver is only a few changes from being
acceptable to these maintainers as well :)

--Sean
