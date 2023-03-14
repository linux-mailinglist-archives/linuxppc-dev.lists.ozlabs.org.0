Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 496846BA019
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 20:53:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pbkjq0tkVz3f3f
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 06:53:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=djQhNCfK;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=djQhNCfK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe0e::322; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=djQhNCfK;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=djQhNCfK;
	dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04hn0322.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0e::322])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pbkhq2bHJz3cM7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Mar 2023 06:52:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4pXu/NE0Lw6eDCwEZTFNktw8IlqQHakcV3xbVTQfS0=;
 b=djQhNCfKXEn5/3lbjM9C5mGD0Ily85IVZA2iUdLI3n6xyto2By04lPuHydIJ78Diuyyz6sgDf/gwMWgLbhGhrc9XBZXCULS3knFt1+I9WGC4pVFklwp/8BzviOa/m34UoYx5XDrguo8ZnAPRSaFj2/ve6qi7Lq57C56/pM/JmLLoK1FbEVW5oR1fxC/ClkLy6zPKS1UC3sNn+IR0r6MJh9BZXW7e5btMzhzO6IdkrCCvimLxhyi3njm8g/Kdudxryu1+guzJ0ij5yZ+5ZmzhgG5+N9WacfiTWeyOiLz3rhtmoUGXAFM64UkkVq8UQweCaJd0kXwqbnpW4Y7i7yoZNg==
Received: from AS9PR06CA0760.eurprd06.prod.outlook.com (2603:10a6:20b:484::15)
 by AS8PR03MB9844.eurprd03.prod.outlook.com (2603:10a6:20b:617::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 19:52:36 +0000
Received: from AM6EUR05FT017.eop-eur05.prod.protection.outlook.com
 (2603:10a6:20b:484:cafe::29) by AS9PR06CA0760.outlook.office365.com
 (2603:10a6:20b:484::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26 via Frontend
 Transport; Tue, 14 Mar 2023 19:52:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.85)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.85 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.85; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.85) by
 AM6EUR05FT017.mail.protection.outlook.com (10.233.241.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.11 via Frontend Transport; Tue, 14 Mar 2023 19:52:35 +0000
Received: from outmta (unknown [192.168.82.132])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id A94C72008026E;
	Tue, 14 Mar 2023 19:52:35 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (unknown [104.47.11.232])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id C69A52008006F;
	Tue, 14 Mar 2023 19:51:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VbR+fg26Maj778QU0VbVt7OBDdzkHq1q+R1bZIeq7pOfAbr/l5A3WAvwnfqEVqlQwXNPu0RFXcezzYumfC6V/lzHw/ZNh6s2cdG4kt/iQ4EQxW3fK9NgJrom+kkGPz7LMHmIEDhXgkLeqsrqcimno8KTXHXehA5HkieWC7allr7EcQ5E657/N84P5TIkHibB531A1KmYuIdBE255FT8mIyss6a8tJPuzdrYdBZnDNOs49h2wfckRIxYupAQ/GjXxwXMT/WDopQ7K6SCxqXv1ACBOfdHTr9cAHlWenjg7T1YR/q3kTbHE/fJqc7OFZ9Xir6ReLz2YeCGOjL7Ow7odiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4pXu/NE0Lw6eDCwEZTFNktw8IlqQHakcV3xbVTQfS0=;
 b=DZyvktgUb1FKXEyO69Vm0V8OxPoIjvX+jok88eWpfkIAC5w5x7gjc8SD7BSs+UnLuLpM0L+Sc1CEu2HL5CLoPY6xW5JsVyZ4X2t9PxIkqNt9nvXFkwqrQKKEBRt0Z75LO4KDqr29cEopAAhcwpZu3ewf8bL9brtAV/6/aMVlEZ6MsIOTW3k/NAERB4G467LVXCmkmiPZFM8+cMJCdeFp9cZlawOF3BITwZ6p/Dgz46PgyRToKtbYPRt+w9zy0dN8fM54u7uuijVZf1MbJBLN5EnfTvwrZCbnxBykehcXKW728GEl1fs0ZH9hdnRPrqWB6NBDR9+uQcotKOymE9Oq/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4pXu/NE0Lw6eDCwEZTFNktw8IlqQHakcV3xbVTQfS0=;
 b=djQhNCfKXEn5/3lbjM9C5mGD0Ily85IVZA2iUdLI3n6xyto2By04lPuHydIJ78Diuyyz6sgDf/gwMWgLbhGhrc9XBZXCULS3knFt1+I9WGC4pVFklwp/8BzviOa/m34UoYx5XDrguo8ZnAPRSaFj2/ve6qi7Lq57C56/pM/JmLLoK1FbEVW5oR1fxC/ClkLy6zPKS1UC3sNn+IR0r6MJh9BZXW7e5btMzhzO6IdkrCCvimLxhyi3njm8g/Kdudxryu1+guzJ0ij5yZ+5ZmzhgG5+N9WacfiTWeyOiLz3rhtmoUGXAFM64UkkVq8UQweCaJd0kXwqbnpW4Y7i7yoZNg==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AM9PR03MB7427.eurprd03.prod.outlook.com (2603:10a6:20b:267::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 19:52:27 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%4]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 19:52:27 +0000
Message-ID: <b7f45fc2-85f5-ad29-2dc4-bc059cac022e@seco.com>
Date: Tue, 14 Mar 2023 15:52:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v11 03/13] dt-bindings: Convert gpio-mmio to yaml
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 linux-phy@lists.infradead.org
References: <20230313161138.3598068-1-sean.anderson@seco.com>
 <20230313161138.3598068-4-sean.anderson@seco.com>
 <684eb04d-aeaa-07e1-34d6-783e85e379f0@linaro.org>
 <3c19e6d2-4df2-6187-36d5-98ceef07235a@seco.com>
 <ad56ca5e-03f7-5e3d-6547-91c64fdb08d3@linaro.org>
 <7c7311ad-fbdf-3c7e-dab5-28a562fb7e8d@seco.com>
 <a7fbaea5-927a-e4e8-d990-66b53d586d47@linaro.org>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <a7fbaea5-927a-e4e8-d990-66b53d586d47@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR01CA0007.prod.exchangelabs.com (2603:10b6:208:71::20)
 To DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AM9PR03MB7427:EE_|AM6EUR05FT017:EE_|AS8PR03MB9844:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f340bd5-5320-4257-5d57-08db24c5a895
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  xYEOoA1JBrkDEzwPLPXnFm5wczfYmNlZkuziDJM7O9RLkCv7Fso/YLRo/9ihLfCDfY9ShKCvn/hyuiays4TozEy3oGL+iN1/GMUjEitqjT3i3ZoyHDdATn+SbJH9Ac0L0zLtwNYiZFzsrTVgPgv5RByIFFxL5jAhYltEbGxMspRVsGMaiQeTB+eE+izxhZjvTXnlqokBer8+1A8BFm61WlJtNNoHbhc7mk5dYfMhiHSUleCu0BzRGLPxWt/WVlX8PJMWKz09I+MbnfXhu0CvClxmFbNkjima0Nycio/pZOk0nG7d1Dyyoc0T69oym3e6kTaXYr01rteGDZXXHdy4Jf0uAV4xlJrNfEh1Kb0Sz7SGN5Gq1Xq7S32ZHChVV3/k1C1n1WoWzopsECGGGyhhVOLYfRfiCr84ZM6ZnBkFj8voGPU/xXWrM50UVqY3urTu9IVHHA52jg05xn61qinFpmbCVCfKQfoxN+jSG6SOUlS1O7yWnOkmCcDdW5UdoYELUjmdFzVrIjW/qq3K0Nc306/xKKeqU4FTAq5vEcFTsKZSEIXxQ4xSFG+xPy4ZlL+UMQCvpdMZ+HgoGOKtkkoiQl+yGKc4D1FD5yOAGoNITDfMK2AUsLOO61ALtfaizEG0JPnkAfFV3ajDNsdUzb6bR+lRRwn1i80u7DyDcBUMT2JcudUXYuBoYrI1cb2GK78u0OA0ttLJHOuEC2kdQZXV+ZhSeO6V2wtouilGRsX8P4BXnItcR7Ux/0bywIc3HDOnvFm2v9UWBYZawT1sYVKE9Q==
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(39850400004)(366004)(396003)(136003)(346002)(451199018)(38350700002)(38100700002)(31686004)(4326008)(41300700001)(316002)(83380400001)(66946007)(54906003)(110136005)(66556008)(8676002)(66476007)(8936002)(5660300002)(7416002)(52116002)(2616005)(478600001)(86362001)(44832011)(31696002)(6506007)(53546011)(6512007)(26005)(2906002)(186003)(6666004)(6486002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7427
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  AM6EUR05FT017.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	4c4fb119-af33-4a32-9bd5-08db24c5a367
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	2yXXmF/NpgnfOnVmpGn4Yh9FRejT8Wvfr+P/Q5Wc2aINXjHLRqlDXQkctwHZdzBvMacexgx+op6zG/iGdo3FC1rHHCVfkDsVMRgdKAy0SszhKZkkC97iboRWKivaYLkuGhSQicnf3uICc694X3qsEKbC71mKpTPIP2bd343IC7AXBM2Y+Z0FWe7OnQCM1ZoKBPkAr4YgFFMZgFp/MFFRz+9/759lLTgAaequ6vxmbbTa6SZ9z2vAYqQJEC9DJTF7lQ0cLf0BX8f3RtUdwPSuV+kzVMxf1kQd0jNCNeBVC6vu/UxOoCage6TuRQ8M18tyJuuQXMdCZbB8/xQMI+by9Wh+NxCMRp9z5pNLQSgqlwhmsK3Lj/PLSmYg9BoLvq5Mx92fY15rXRlAxg4B6aaImrBdMfjeoT45f2hSixr+EIShDg+ms7tzG2N44ugEtMsckRCx4TV9iKmtyIf+a2/jSMULItPX2mUa2R6JcfwrYJWPRYkm0URfVgAV6IbLNgjAZ3jEA2A+oPJiK+zJy8+xEP4ihp1KNJf22wdQhJrDNerCYVkFmG0GrmEhqG2y1y0sr7lZ0qV6C0tUrKPBFelD87PBWuVggu/MpiTZ2g38A9k1n5EFHv2seq1Qtj3FFKzb9ltA6zQ2+6PgvyTBtTvckIbuAvEQNwqY8cBAXvuS0k13Fk3yS8//0LZjwrLHsyZDpfh1DxUb6SLT2FF2Yyy1tySqHOrqxT2sh9KJA3VsFmjAJqrf88TBVz4EYVnJgrfj+bxtxlOiITfjVFmYWxTbM+XyR+BSCJly6Jq0kdl2/28=
X-Forefront-Antispam-Report: 	CIP:20.160.56.85;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(136003)(376002)(346002)(39850400004)(396003)(5400799012)(451199018)(46966006)(40470700004)(36840700001)(31686004)(336012)(5660300002)(4326008)(8936002)(40460700003)(186003)(53546011)(2616005)(7416002)(6512007)(41300700001)(6506007)(36756003)(86362001)(31696002)(82310400005)(316002)(26005)(47076005)(2906002)(36860700001)(34020700004)(83380400001)(356005)(44832011)(110136005)(8676002)(40480700001)(6486002)(70206006)(54906003)(478600001)(7636003)(6666004)(70586007)(82740400003)(7596003)(43740500002)(12100799021);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 19:52:35.8106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f340bd5-5320-4257-5d57-08db24c5a895
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.85];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	AM6EUR05FT017.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9844
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
Cc: devicetree@vger.kernel.org, =?UTF-8?Q?Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, Jonas Gorski <jonas.gorski@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/14/23 15:45, Krzysztof Kozlowski wrote:
> On 14/03/2023 19:50, Sean Anderson wrote:
>> On 3/14/23 14:32, Krzysztof Kozlowski wrote:
>>> On 14/03/2023 19:09, Sean Anderson wrote:
>>>> On 3/14/23 13:56, Krzysztof Kozlowski wrote:
>>>>> On 13/03/2023 17:11, Sean Anderson wrote:
>>>>> +  reg-names:
>>>>>> +    minItems: 1
>>>>>> +    maxItems: 5
>>>>>> +    items:
>>>>>> +      enum:
>>>>>
>>>>> Why this is in any order? Other bindings were here specific, your 'reg'
>>>>> is also specific/fixed.
>>>>
>>>> Some devicetrees have dirout first, and other have dat first. There is no
>>>> mandatory order, and some registers can be included or left out as is
>>>> convenient to the devicetree author.
>>>>
>>>> reg is not specific/fixed either. It is just done that way for
>>>> convenience (and to match the names here).
>>>
>>> The items have order and usually we require strict order from DTS,
>>> unless there is a reason. If there is no reason, use fixed order and
>>> then fix the DTS.
>> 
>> The items do not have order. That is the whole point of having a
>> separate names property. The DTs are not "broken" for taking advantage
>> of a longstanding feature. There is no advantage to rewriting them to
>> use a fixed order, especially when there is no precedent. This is just
>> an area where json schema cannot completely validate devicetrees.
> 
> I don't understand "there is no precedent".There is - we rewrite
> hundreds of DTS. Just look at mine and other people commits.

There is no precedent for a fixed order of registers for this device.
We have always used reg-names to interpret regs.

> The reg-names are helper and entries were always expected to be ordered

This is not the case for this device. Registers may be in any order, and
some registers may be omitted (and not always the same ones). reg-names is the
only way to determine which registers are present.

--Sean
