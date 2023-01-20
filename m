Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C376675A57
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 17:45:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nz52L0jSNz3fK1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Jan 2023 03:44:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=iHm2Eq6/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.15.82; helo=eur01-db5-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=iHm2Eq6/;
	dkim-atps=neutral
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2082.outbound.protection.outlook.com [40.107.15.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nz51K3Y85z3c8m
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jan 2023 03:44:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Scr5fd7eiu2ecT52N/QBLDS5wXrxjvHPUYnksXERLVz4AdCuJ1pMYU784VrCtOR53IYti+0SZsnLdUHdv1Mx0OEMU1Sg80Rkx7he7+WYxPtXxlowXc4LtnWq4BH9SZi6S9lgeGJchqFRq6XAR/0w6nvRll0xJdekBID0iE8bvfLIg0jxxq0qZVgnRV+RrzFnG5y16xoQcsKJechqw2PHtILkujwMuleY2sz87V++H6+ZVTXCR5Xt74bdIh0gKV4fUmM7FXdxhf1n+XUwsOkMFnZS6X0er4EW0zfrQrxHK2a0Hz1HTPMtQj8DApxPBYOo+Od3KXt9Mcvt7XbIyRwv7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3e9A/P3A19zEil+QaDcY6Sgruew8nJlQnQeUcdtGTi0=;
 b=l9yZOvN0wz68Xjlx14IIPcFrsqY02bHkQE06HnIK16quYLAjT/TjPh8JuyvG8fh+mvwcs5rEkSJ8qsPWl2HyOuhWQQOkYUW50L7JbIklyq1IrWiFTUOMvn+ek6QxUBaN2u6dWB8clWIuN96ldLVyY28ZWzRKV9AMKZHTM9o1fWtSnT8UZO3dI9pSJ9KaqxmbNOl62slOzFclnhJrQjdzgCggp97FEIPhjEs/2sPRsUeqLR/AkUTDBvyUeFNd1H/x+Moz56FqxYpHZYtUry58LjTWf+sYFSyoXrqyfrcdWAFBPQ9OD00A+oqhX9fzHK63apST5hSIx6FRxxTwXBM20Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3e9A/P3A19zEil+QaDcY6Sgruew8nJlQnQeUcdtGTi0=;
 b=iHm2Eq6/tnMsS7vrrPoQmz2M08dwDtkgIR8EpzERjQjkZIHukEcYeDzswJS+PmICHP6cKKauo59PmASp4LDaRlp60rgj59Trl6BiLgbuieliBhMHLpfSyO5E1SQIHUby11aZs4fdyO552On3To9OtdnkJ0ok5kCZIw5kxFpHyoVSIj1EVr6gw8nhHIZ39F0qi3fOsbF5GJWqw2CfZpt2+Teshl95p58ZD8GBG7owVa+SNz+R7LAnsyoGWViXcrKniM1syN0iS50waU4TOqR3xYY3Q80SupAdZla+KxMJ5vpkj+tNTaCuvt61gaTSFtVWDs1QqDcHpzM8SqVuQFuCIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by DB9PR03MB7581.eurprd03.prod.outlook.com (2603:10a6:10:2c4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Fri, 20 Jan
 2023 16:43:42 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::6b03:ac16:24b5:9166]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::6b03:ac16:24b5:9166%2]) with mapi id 15.20.6002.027; Fri, 20 Jan 2023
 16:43:41 +0000
Message-ID: <444e3a17-464f-c487-fedb-9c749c5f599e@seco.com>
Date: Fri, 20 Jan 2023 11:43:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v9 00/10] phy: Add support for Lynx 10G SerDes
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>
References: <20221230000139.2846763-1-sean.anderson@seco.com>
 <0024c780-ff9c-a9d3-8773-28e6b21bcc43@seco.com> <Y8gkMlqfPZic7reK@matsya>
 <17e428ae-7789-a1ab-3ccd-90b3b9a088f1@seco.com> <Y8pLjLWjv0nJa+ww@matsya>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <Y8pLjLWjv0nJa+ww@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0001.namprd10.prod.outlook.com
 (2603:10b6:a03:255::6) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB8847:EE_|DB9PR03MB7581:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ec08bbe-f758-4638-2d44-08dafb057cdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	CpQ941SeTt42V1l22AOMureB+txBVkq3WnbVAOdVKEhvh0HL4In7D90fwetorqeGnuzH0IgY0rcVS+76+80huUkYtnS36xnMT+UOzNwwUx8MvRVFJCRxyRsTPQnwaStY56PrhBQFVHKx5Jwza1Y9AbYgPWuecnUTJKEuK7P4NKHMqebi79el1fl/o9z8bYbTSt5i4zCrN9gAaPwXZHXLtUX4QHA7Wuq3wEbB4VYykXd/OWUmsX8Id0c4jZc/JSv3v+N97il/YM+m5QODRzIywr6FrLbNyaprd0QM7wxFltef3W0tSgTCEoYuJiWVWSczYS6bRJjPatmAG+hMuwX9ht7HXh19jqOB9gAsLnHvIkQPziQKI5PzTxsqvhQ6DXXMASotve+AEX/Z23XzqBBuQ5vyaZxfZXev9TDJpF3tgRTMvlfy6FbTY8IpmRFDGb5Ayi0Pog5WUh2yBTR5Esl925tRimNZK/n8A4da+1McGMGq3DkPCfgoaPUwAPlvY3J07Nj+uhewvp/2EjBwG9byZb9aRMH/3mgZgYxjj+OzKogtsDs23wBKKhlDK61qVlI4DWUNdbquIGh+A0SMWOpHyerwa6wZZ49sctkXN7mwhgVbeExhhnPgIaGpgJ/0NBomzfJrBwAjQzT21H2kjYKpNgaJfpLdT6Q9hIw/TsQc+1HLWNPMUNGGndfPyBR0R2skroKbv/iBb5MB9HFZ+k9Pol8swsiqTaavDlfg4axBumdfwKwJ/ebuMShg5DGomqZ+WYyA8QmocR7v20/KddV9yw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(346002)(136003)(39850400004)(376002)(451199015)(31686004)(83380400001)(36756003)(478600001)(52116002)(6486002)(31696002)(86362001)(38100700002)(38350700002)(6506007)(26005)(53546011)(4326008)(44832011)(41300700001)(6916009)(6512007)(2616005)(6666004)(186003)(8676002)(2906002)(54906003)(66946007)(66556008)(66476007)(8936002)(5660300002)(7416002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?TVVzUEY3TGp5RkhYUnZsZFZhVTNlR2R3UHFUbnFoWGdUcG01OEJzVEVKL1dx?=
 =?utf-8?B?RmxUZWhyYmNRM1puUkRDdmdiSGZMZGVkemtLYmU0WEYwTnBwNTJ2cXlOSnRD?=
 =?utf-8?B?OU4yMVkxMnBGSjlSd0xndHlORVkwQU90OE1ZUWdlMkRSVjlyTWJYc0VWSkNU?=
 =?utf-8?B?d0RzY1FVQm11ZG1XaWFEUnVHRXNWUWZ0cDU4OU9uLzJieHpEa2h6ZXV0cXRk?=
 =?utf-8?B?ZXZ0VFNhWXBld3BTRTg1V1VtRE1lUE5VaWhTRFd4dk9VR3ZvRWQ1UDVma0hh?=
 =?utf-8?B?c1p2OG00NUw2VVdGeU9WNzhtOHBzOE50ZU1acmh1WVpxcEhxOHU2Znh5RVRx?=
 =?utf-8?B?MVJ4WnAybFkxck9yb2FNTW1xVkx5T2svUzNucFdNTllRZDNybCt3cmcvMVdh?=
 =?utf-8?B?V2sxdnRvdkxJVDdSM2M1V0lrWVYwQk52YlhNbll5WWkrK1AxUlpiTFFEbEFO?=
 =?utf-8?B?a1hTTHdyb2ppNkJ5ZDNxeS82QzQ1Yk5CZ0dtSlRKVENscHd0cHNjT01XcUFh?=
 =?utf-8?B?NE5pYmJzT3JjZHhKVEVmTE0vOW5jSTQrS0FqTzN3TlpWUnozREZ5MVJ4K0po?=
 =?utf-8?B?ZE1LM0RaM2NOS21SWStjNTNTRWJhaGJVQThZNGVvMGwvNkZZRGUwWndVdDNZ?=
 =?utf-8?B?Y1RjeHBXaTMzNzlFZjNEYTJ0N3d0UWc5QlJCYTg2bDY3TnNsQSszRVE0a2Yv?=
 =?utf-8?B?UkZsKzBZbElFSnU5RForVkdVMXlzUjJVWFljV2RKMlMzbHVpelhkRDlTZnEz?=
 =?utf-8?B?bFVyQXFBcm53TWc0d2hPdGNMNVFKZU9tbFRyZzBHK1NMRDBiNVRuNitWVENH?=
 =?utf-8?B?dmpmakYrUTYrTm1naHllT0FiN2hydHh4MHg2NzRWdmpXRjRsUjVjbzdRR0o1?=
 =?utf-8?B?d29RVG13a0VkdzBPVXUvd1FTQ0c1RFJtMFRSTTJuUmk4Zmt1akw1cjFnZ3JU?=
 =?utf-8?B?NG9ma0VPNllYMVNoZGZMRk9FSG5SS3NoL01lS1NXWitBTnBtUFhjOEorcTJn?=
 =?utf-8?B?cUkyVmNHbDlUYmZaMHdBelpPRUFZelVJOXdqUWk5Z2NhdG4vRkRxYTF5MFJ6?=
 =?utf-8?B?dGF6VjViVUNNQlhTMGwyeWs5MjRPSXR4eTg5R0FnbmhtMWVFSTAyRk1IdVV1?=
 =?utf-8?B?YmhieUlPbWgzQWJvbmlTUnNhcGtCbldIaXhTampYWXVzYkpmNTBUKzBocFJo?=
 =?utf-8?B?T2U3WjRTOTZrVUdUVExwU3ZpYjh6cEJGd01LN1hkNTdSNXRoblR3ak1tMjZx?=
 =?utf-8?B?b1F2WGRveWVrMVh0aVJuQ21FMkhUQ3JFU2hTM1BiZVRlSCtPbE82Mnd6V2Jx?=
 =?utf-8?B?UkxrQlB5eVl6Z2c1ejBLRFBxM21jUU5wdGZaVHJMVWhNZHp3dVlDTTRPWGNU?=
 =?utf-8?B?cjJHTmRJb1BBOXc3SXFYcGU1MGRFWHN3Q0FpcWNuYVBJY1Eva2ZqTWlSMHFp?=
 =?utf-8?B?ZCtUaVFHUGNWY09VRjl0a2ZXaUt5RTVZbnBWZHNWT2FwYlZrUUs0dlZNV3Nu?=
 =?utf-8?B?Vnl6ZVFwVjkxNHNaZVRoVmR1ekIrcGRkeS8wTEcyZU43cmZTRytyS1pWL2tM?=
 =?utf-8?B?b2h4MUQ4U2xjNDF2ai93U3pSRGovdDRKSXpVRU1UR2ZyclZKSDdNOWpqK0xS?=
 =?utf-8?B?VTJiTUE5YUJCcXltZlRTcjRiNTFBYkhrUWdNYVNtTWNObGtGOEV2RjRxWmdC?=
 =?utf-8?B?Qy9DeDRodWtQVC96SnRmMnEzcmc4OFdwN1liWkJzeTFZU1RhRWd3SWJRdWdZ?=
 =?utf-8?B?c1ovOGpFUGxLRktnalIyM05obzFDL3VFUC84V1dybytLRytXSEpHWEp0L013?=
 =?utf-8?B?M1VSckF1RVZaeEdxcFhCRTNJSTZYVFpIblZYT3k4OHh1WUJZdDlEVEFKLy82?=
 =?utf-8?B?Ujc4eGMyck9HMExoeG81c3NreHY2MjdFUkhsdE9sSU1qY2NRWEVDS3k4cUpV?=
 =?utf-8?B?Rkc2TEhLVDFacVkwUHdvNUFLbUdxeXVXL3d0RGIxaklxdjllQm16Uis3cWkz?=
 =?utf-8?B?OWpSd1l4dGZENENFNDdjQkNuanU4NG9wUmxZZnRsNjdmUmtjaFR2dXEwOEk4?=
 =?utf-8?B?bFAveUM2b2xFVmdueUZvd0F2d0l2eUZ5a05FOGhNZXFrNE9TRnFoZ2sxSnF1?=
 =?utf-8?B?WmgrNGRhZ29HUWV6b1QydVJ3NzB6dGpzWjRaMjZuRHAzWG1oNG9uanl3SHlE?=
 =?utf-8?B?eXc9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ec08bbe-f758-4638-2d44-08dafb057cdf
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8847.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 16:43:41.7255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pK2++aIYazR2bfIIPmi+rUJ8hOTlfgs2WO+mLfYJSM9cyD07hnEva6hMTRwxtJNHmViQ9kNUKefh1cPn0PhBcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7581
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/20/23 03:06, Vinod Koul wrote:
> On 19-01-23, 11:22, Sean Anderson wrote:
>> On 1/18/23 11:54, Vinod Koul wrote:
>> > On 17-01-23, 11:46, Sean Anderson wrote:
>> >> 
>> >> I noticed that this series is marked "changes requested" on patchwork.
>> >> However, I have received only automated feedback. I have done my best
>> >> effort to address feedback I have received on prior revisions. I would
>> >> appreciate getting another round of review before resending this series.
>> > 
>> > Looking at the series, looks like kernel-bot sent some warnings on the
>> > series so I was expecting an updated series for review
>> > 
>> 
>> Generally, multiple reviewers will comment on a patch, even if another
>> reviewer finds something which needs to be changed. This is a one-line
>> fix, so I would appreciate getting more substantial feedback before
>> respinning. Every time I send a new series I have to rebase and test on
>> hardware. It's work that I would rather do when there is something to be
>> gained.
> 
> I review to apply, if I can apply, I would typically skip this
> 

It is much more efficient to conduct reviews in parallel. So e.g. the
bindings can be reviewed at the same time as the driver, at the same
time as the device tree changes. This way, I can get a series applied
after max(N, M, ...) revisions, where I would otherwise need N revisions
to get the bindings ready, M revisions to get the driver ready, etc.
But what's happening is that I have to make N + M + ... revisions! I am
very frustrated by your refusal to review anything until there are no
other comments, since it unnecessarily extends the process of getting a
series applied. I have been trying to get this series applied since
June, with nine revisions, and you have reviewed it *twice*! I think the
driver is in a good state and is ready to be applied (aside from the one
known issue), but I have no idea if you agree with that assessment.

--Sean
