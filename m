Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8505D610546
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 00:01:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mz04T2w25z3cLR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 09:01:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=1kNHr4pl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.6.58; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=1kNHr4pl;
	dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60058.outbound.protection.outlook.com [40.107.6.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mz03V3Jzsz3bP1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 09:00:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MzLT5Ck5aQCXbymHq1pvbsmxW3kWoyjVTJfWmFhLeZ9zdUbfUj4MGtNKRDEuHAxRnQ2uEUjzZxbFKQvQCsoYNFXGERPXGUKbBYFfcpdnpE/t3DWQbao41q0E5nl1pmVHOjkKYifvNNLcps0nkJWWmWEaf6yoUXPHWrTZBjpODKy3ygudJ2sLcPHK4IL3Ao/3sqbsn8FemyV7UZQrM1FbLm3EaI3wW9k+C8VEIeCEnIGza0Q6m2ylP9PCXiRgsZkWK+ihSoMWTuNeepmzT+7OFCztZqkB7lwlnLASRfDjmurmAh39hOMl/hVHncALrCnzdqGLto8q/xyFdtDx2t11Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/oiGdJcywM3+glaTqHJKZ0IKkpLHg15QjctF18FkvPQ=;
 b=lKo1V6MzWxI3oDRCnAB4/kyVypr7CwXafmiFaE5mBURXSlrUsKbjGfdcSSmU9yFoSCgPSRqYR++J9y8zU7cYQByATb6Bqt6luMNQtz2Ktl0YIG5vWgwjUdqSPEwiUFAyop8gm6nOE9JJUZJW1BePq3HPq9Y9uuOzBsud39CfRJGDZL+BZzsLT6I6vwZx14CUmxnrdH59ZkZhb8YT0VAJdhdjeiDfVq9z55iZyGyoVxWFz9s5HxB3fqZIbDPPdA/2o5escUGCSNL1OFSflHDyfIiRYZ+PWIv1JmLN/rrxBnafbPR+hgt7C6r09ZipD/ZtjVZtii39glw45wGuaYpYww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oiGdJcywM3+glaTqHJKZ0IKkpLHg15QjctF18FkvPQ=;
 b=1kNHr4plQE7ZNFdPwEJ95K9hvXmOCFtx1S+FnjBQBlFub3TBK+AoVxCgLFL1lSK/Gs3IcpuCG8yLxRO889+a+eZpJhzZpP7cQOgGHDntjCwq8miuz1TY4AGxIUurgFqoCsrFQ2CfNdJWdTEghBBC5FENxqwf5NuDq3V4Hp4oZ3Kk780ZfopbSYCYIxuagKSg+QEhTYIpGHepYLKmZF+eCOip12hcrU0j9dJ/hD+EU92OFWmdUeIZE9YbfS/i/qtKrP7JK242dyrlkLf1FjXrob17wyeufOyZujqzfuEI4Zn2y650GIPEu8lbpCKeRoNgRgN7OCJy18Yg6Ry9HXD/aQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by AM9PR03MB7169.eurprd03.prod.outlook.com (2603:10a6:20b:266::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Thu, 27 Oct
 2022 21:59:55 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::9489:5192:ea65:b786]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::9489:5192:ea65:b786%7]) with mapi id 15.20.5769.015; Thu, 27 Oct 2022
 21:59:54 +0000
Message-ID: <eb9590e6-d26f-84d7-16d1-e00cc112fda9@seco.com>
Date: Thu, 27 Oct 2022 17:59:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v8 3/9] dt-bindings: clock: Add ids for Lynx 10g PLLs
Content-Language: en-US
To: Stephen Boyd <sboyd@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org
References: <20221027191113.403712-1-sean.anderson@seco.com>
 <20221027191113.403712-4-sean.anderson@seco.com>
 <20221027214947.3E375C433D7@smtp.kernel.org>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20221027214947.3E375C433D7@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0035.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::10) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|AM9PR03MB7169:EE_
X-MS-Office365-Filtering-Correlation-Id: 0430817a-007b-4f9a-0922-08dab8669471
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	sm0DrFETVPR0OZKqtOid/VM4rk1FVJGKK7nYacwHpbGZOQxiHNFdtorHggPhsJhrIlK2dOkcvOtDD6QMa7oh/7IdNbcct4rh4ZlHlzWaqa0Aj7NO+KSEv2FlaUlWt/M34ikScfv9PvwmBEN9xplsYxmi/lIbVO0lAszJh2bByKXGemtzrom3W2iGhbx80ckHoxKqNM2n8pBQYoDxHEDSjdm3ZIS0PJ7p2l9WBqiRDa/KvnZ1v980cjud7ZSTEejOpczgtB8Hk+xUnJKLy5Gdb7FHZ6FlgtwDPqgtgDv9NwPZ0z1X8GnKyoyLsIV/SAkc8Iadl6SG9Ua1m2o+wvxG0P3MxqqTxhP5URpjWDdb1TR8KVwJVVloWboA3b7DJ5nLGZ+Nx8QvHfPixB1nXLEkJZjqlIidl3S7itjzVk3+dWzpn773ObbQ8+wDMIrrWVfzh2CONorSD29YNEIr0v2Kc2KMSvMmOObTGslaYA6HQm8+ipeOqBtCEMwWtZjCa5u0OACCAlAomgNaEJBiLkJJtas9c9KkjyM5fADioGg2bdm5g1vY7D5k5UaqXE2b2LCUEz8toPnGJGxGvSkhUMw9AACQpruaErU1Ui20sDGfOMT2SH6PhfqGC2ykWnK4Jv+ctFXiWTZH5aEVhVXjlrdehLRkHFhitawhckoheS34+YjvRXFN21UR4oiTQb7cYDdUiRpsaerU1QIdnP3VBZRHaZIj5UwTIl/ifJLwnXsEa50w4e6T6NfFp+5Eod2DbfwUdA7mF1u8XK6hlvdEr9rCcGHRs8DQioPNBwD9bYzosOYPRStQBeCz6s2BDnwRlkZLCBogXmDVEVwlUVEZFaM4DQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(376002)(346002)(136003)(39850400004)(451199015)(478600001)(6486002)(2616005)(186003)(41300700001)(110136005)(52116002)(44832011)(86362001)(54906003)(6506007)(26005)(8936002)(38350700002)(6512007)(4744005)(36756003)(38100700002)(83380400001)(66476007)(31686004)(66946007)(31696002)(5660300002)(53546011)(7416002)(2906002)(6666004)(66556008)(4001150100001)(316002)(4326008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?NVI5VEN5NWNFN3pzNTdya0FObStMY3FMNHRoMWl5TWtaMzAyaWFtbi9aZ2pB?=
 =?utf-8?B?WDh0ZjdZclJ5TDBteGFBTHZMRFdrUWxzWmdNZzA1bTdQTm5WK1ZRZVYyTE04?=
 =?utf-8?B?RDFCK2Y0azRvbTlHYlVibW1XcUU4YmdiZmJCYW9yM1h5MDgxZnlBVy9rM1Fx?=
 =?utf-8?B?Ny9COUkxN0t2UWRxa2N0Sjd6YU1WbGQyNS84MUdOQUZVMEh5TkVPeUZZZTN5?=
 =?utf-8?B?OGU5L2duV1h2OS96MUhXK1JIQzJidHRWQ2lNcy81Ymltajh4MnMxSHB4eE1j?=
 =?utf-8?B?OTg1Q3N4OTdRL3ZIV29hU2Nqak91MENjY25HdnNpVE4xNlM5a1N1OThjODBB?=
 =?utf-8?B?UGVERUsrREUyeUU2cmRqeGc0dGpGcVlURm1PRE82M2Q1TjlhemNJV0lhYU5I?=
 =?utf-8?B?RGc1dU9kRitwQWdhNW5ESUxKQnJBNk5sbUppWDNta3BxSmxQOTJta05nNE4w?=
 =?utf-8?B?NVhXWG1rUnVINytndXBLc1JPYmlmU1B0djF1ODB5NDBxM0lkYTA2WEpsWnJj?=
 =?utf-8?B?NFdERW5KOUpsUnRydi9La3ZOTm95L2VETXhNamhlZVB4Z2NoZXliTG5Scm1o?=
 =?utf-8?B?blZxY00weWFVcVd6NEVYUktzWFNmL1RxRHFMdjVablZXZUNpdDNsdDVpQ1JU?=
 =?utf-8?B?U2VONU1KWnV0UU95ekgybHZ3b3cxYUJFbmFQZGc2ZTRhV2F0OER0SDFJT1lH?=
 =?utf-8?B?ZXlNdWc2WWxWVlhUL2RrWTIxM3VLWFBMdWZ1U2ZIaHRLN3MvZEs4dzl6NXVR?=
 =?utf-8?B?cklsbGUyNUpGV2tRSDR2UXJuNWFmc1o1TFF3OFg1b1lFQll3VjRyVFYzc0c4?=
 =?utf-8?B?RVp3allMTjhXN2kxMmpCeFRCSTB5SWNpUGw1WnB6RFJmYW9pNXRnbjZtTlBr?=
 =?utf-8?B?T0xrUTJmRTJsalhXMDZqdnJhVWF4YStNRXNCcDhzNFFXaEN3c3hiQUpiODlJ?=
 =?utf-8?B?cTBWZGo1eGxWcmtrNXAwZTVvTUphUWRWWDBXUG0xSjUrVjZzYkJvMUd4MjNO?=
 =?utf-8?B?Q254eUNWOS8xMEROZUU2WXRUeVVtcmhyczZYRHd4OVpNYS9ZYkZwRnVGSGNZ?=
 =?utf-8?B?YW50U3ptSUVvdWxvTExDV0tTcVRaVHJsUks5VXJKYzZtVGtFdEk2Wm1EaTJF?=
 =?utf-8?B?TEhaRnZGWFhzVEZlYWFyaGVOd1psVGk5Z3dLbCtSSVBLYWJTLzIxSlA0QXpi?=
 =?utf-8?B?MFJRTmhidFdoSWYzNG4wQTBId0F6Y3pPRlVwZEhuK2dVVlUrUE9VZjBwL3Jo?=
 =?utf-8?B?UXBjdS9oMUJ4MlQ4VGFNck40dk55cWs1OXVBUklHVEdnZWtuN0NycnlZT0hZ?=
 =?utf-8?B?SjZKWGprbWN6b2VCT3ZIbCs2d3ptQVdTTmxLSG0reGhkQUFidjBrb3RJWEpP?=
 =?utf-8?B?WlQ4ZGc0WHhDRWpiMFBoUmJkb295bksrSXJIazZuM3JWN3BVbHY1YTUvQ3JB?=
 =?utf-8?B?d0VVOHhVNS9ld0J6ck9DSnN1NTZXbGtqSGZGTjFFNEhMbmxEUDVwd0NuNmsz?=
 =?utf-8?B?RTAxbEJDai9MMFJib0luOTVPU2libExpVmhjMFBMODhCZGNmclYzNzQ0d3Fo?=
 =?utf-8?B?bU8yWitVeGJEanhLSmFaSlc0RURVWmwrVlZVaEoveXdIY05vVVcwR3BXQWZs?=
 =?utf-8?B?aCtVNWFXU0owdTM2bEtpNHpBMG5rZ1ppV3JuWWRTeWNEYTIwQkxSWXJIcita?=
 =?utf-8?B?WVJTTm1ZVFJkNUxpcGs3TFFJdE1zTjN0RXVZUE80OFhndmV0TFZrK1BuTngv?=
 =?utf-8?B?Mit6anlLM3ZPbnU1Z3BDeC96ZTRtVUNOM2N6eTFzeG5icXE3Z3JscnNFN0da?=
 =?utf-8?B?a3c1ME5HZithR3ZROFFKRENrS1JyQTVDUkxrTUovWjdnYmpUWmRpTmZQMW1C?=
 =?utf-8?B?dXV2dFZVK2VZY252TmxEaE8zRElRQlBzYWNFZzNzdDdJOU5pNmFPNTdKdXJV?=
 =?utf-8?B?dzVpQ3BUMzZGL1dnNnpvUTE5Mm9EWW1VNEZGZ2JXREpqcFA0K3hGWWczbHZ0?=
 =?utf-8?B?ZElFY3k1TVdyTE9pVHFSbFUwRUlGVm1EQ2QwaURJcnc5clhXVlE5c21IYUM0?=
 =?utf-8?B?VzZFQzAwWUZ3K2pwSkQ4b05XSm1BQ2F0OWd2bGxSelVvZmdGb3JodWcySmVi?=
 =?utf-8?B?YU5COHpVd3lSRzl3VThOcGRubG4wejFzNXRYRVhoc0sydGxJdWVvNVhxZVJG?=
 =?utf-8?B?Qnc9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0430817a-007b-4f9a-0922-08dab8669471
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 21:59:54.6238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M1IXDnBo86MVUoi4yy1Kh1RhgEKeZE/gatQc0tjVEuzRaScevHv3ny/W/ifJa3oYw6rDdFvKyXwq8fWNYcdQqw==
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
Cc: devicetree@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/27/22 17:49, Stephen Boyd wrote:
> Quoting Sean Anderson (2022-10-27 12:11:07)
>> This adds ids for the Lynx 10g SerDes's internal PLLs. These may be used
>> with assigned-clock* to specify a particular frequency to use. For
>> example, to set the second PLL (at offset 0x20)'s frequency, use
>> LYNX10G_PLLa(1). These are for use only in the device tree, and are not
>> otherwise used by the driver.
>> 
>> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>> Acked-by: Rob Herring <robh@kernel.org>
>> ---
> 
> Acked-by: Stephen Boyd <sboyd@kernel.org>

Whoops, looks like I forgot to pick this up in v5.

There's also an (internal) clock driver in the next patch if you want to
look that over.

--Sean
