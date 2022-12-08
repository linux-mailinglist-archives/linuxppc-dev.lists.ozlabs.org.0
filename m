Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 955C2647349
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 16:38:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSdb33qQcz3bym
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Dec 2022 02:38:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=pfMvuv5h;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe12::630; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=pfMvuv5h;
	dkim-atps=neutral
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on20630.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe12::630])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSdZ35hP8z3bfQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Dec 2022 02:37:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y9kphbdSsZ9b0dft95gPArwf4wtGQ3yQtg4ZSBu4GRPIZGSkv3eUZAgCK9MlqG3X07GLbeUL8rqytv1pN+xpmnfX0hlvEJCAbI6bMYb16ML5eqnOUIhIcMM6flh4N1XSxowsWfTOprJGmYa1O/OJcLLyQp2idEdIVz1IM2GIPrs0MkQfbJb/4H24U3b38jajlSDSkJBFpbfiN4BInwckfkPecB0wTsujii4I8nmv4et83pBQBz9cmypH+EiOOpMWj2IdEIR7VSGs2ko6fp8k7IRIXw99KPfwkFwsi3iB7QY8R1NolBgg9ox/6+R80EfYInqG7PnDZslvvxDRfCCl1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5I5xcRaF8L3+CpoQNYe4Us5Sbm9Pb+Sf5SDlAS2uY14=;
 b=hDB+iTJD/3F3lDncOB0s1Ke1BDv9Xf1fFzY2ZDrMpHQWTmH31jI2Ij/9UFnsS6aIvdJCPtPBe+uggOGs+FAOQnUEhgzqNrRKB+l5yG2K7Zsr2D4ZPsZGOA0wyxvMZ52spxJsKPYADFGRdReDBmmHAnXf+klV87lxB/XtGvRareADvS+Iy/VGwaloEExZA4Q+8d3pRXzuh0irNYWJyiwO4geS93kVXsfbcFCp4KseZ28Sqrn4R2RRc8WNLL5nNyvM3fB6xxhHGnMBcDVqJJVmmcrH9dD8WmlkBfU3XLGlDm5vstUz1BaxbilThaShYFX2goH2cpVIUaS6kONvPlQAGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5I5xcRaF8L3+CpoQNYe4Us5Sbm9Pb+Sf5SDlAS2uY14=;
 b=pfMvuv5hx16lG4s5p8KSw/6mv9X+OxTz7TrpAUVhQLdSZHEWRc3/cJrkCeM/jvJUmH12NfkjxeXU3CHIPiBbT4grazA0uEuPE2miPI4d/8m1ZTzuQ2xppPLaenvN7zF6nGDNdQ8NhcB3iwCma+peJ/7cGAW1IFioGygBUYrO9DFjpeZLftpVrztarHFasBCHE49//yZA5teoWHJe3sRzveorG0tjgL6CyZRZd74KUQSUxSY0u31ejWwmQeI1ImLOQSToPRNXnDn90qd8PrTqtaL7JbXF/YMc+I6s3JuUNW2p7CWGZCLjrds8mEPMFFbx6b79luUbry+Mu24I9CaKNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by PR3PR03MB6665.eurprd03.prod.outlook.com (2603:10a6:102:7d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Thu, 8 Dec
 2022 15:36:53 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb%7]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 15:36:52 +0000
Message-ID: <8b42763d-5fc3-3853-c421-227494c0144a@seco.com>
Date: Thu, 8 Dec 2022 10:36:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v8 4/9] phy: fsl: Add Lynx 10G SerDes driver
Content-Language: en-US
To: Stephen Boyd <sboyd@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org
References: <20221027191113.403712-1-sean.anderson@seco.com>
 <20221027191113.403712-5-sean.anderson@seco.com>
 <20221027230331.19C2FC433D6@smtp.kernel.org>
 <5f00ede6-10f5-c11c-ee21-54460c1f98b0@seco.com>
 <d13ff3b2-79f0-2a72-c9da-2c310c4e3bb8@seco.com>
 <20221101201020.B6180C433C1@smtp.kernel.org>
 <45463950-7a4f-758d-d6a1-b8fdf9bfd319@seco.com>
 <20221207021742.A3596C433C1@smtp.kernel.org>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20221207021742.A3596C433C1@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0092.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::7) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB8847:EE_|PR3PR03MB6665:EE_
X-MS-Office365-Filtering-Correlation-Id: d3af0bde-735a-497b-448f-08dad93206b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	bS0eFpD/eJrArJkz1QJLEL5ll4OnC5NZ+7stbRNu63YEBQC9SdeSGVqCVeVWUY0DfSj/dA53QCy58xdiNYGI415v4SIogMwPxeuZ0r9sKLv+HA8Ixkt9Yj3P4ZXV0DJoGb1/WE/vaMX7QtNiv7DSLOEGrUzZKUNhm4MjtEw54rRQeast33zZfFRr/0FJlN2d290vD/aevFEVC+k/j8zxsaMC4AqaQJKsB3CvcwHqypvBA0D9bfzBikhq5oWsr/yhlwkkRVL4dKpJWizxVfXCPvyamxZaZPnAhpFj7q5hA57x5iLLLbPLjicgJdBxWX4SobhuwcwsAEc9i8VyRedXACKXvkIz4nKZuUKLZFyPaLDYAOOnDhzWyIDr+5JVlbtVJADXxKrHaKVLuZelAhvBdwRs3GfaiNHsD3FqheV0j9Bf4wscnP6OeB2JPEOmoTaLNx6/yrYqQb2G+o7BgZVax+6J7kwZ9P6ZK/7EMgPf1Mw2pbOyWuS3qHT1DJiyat1gunV4m6vo5EjXQRW06W4cIHrY9TaAbpEJbBR9pL17P9yc7ANEoKJG+WjI4E/lUzoR25WzfCc3JVCuJ1OpaAqpSzrsL+4OCEpHVWvAVeYIIrLZJuGMzfNWf1hOr9r7WPnGp901IzUieazCM+thXb1pGUkrpN9XPa+gpM560Qv9F57fjPwLL7tzGfajuvx9OV9WpfMXMnsr+SLpkJxPwzBBmoUD61jrRUFtYDNYK5QjiEdBrwZVbd0iyw3sUrl/kabi5+WCODhSofpVMi3eRxzFfg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39850400004)(346002)(366004)(376002)(136003)(451199015)(8936002)(83380400001)(31696002)(38100700002)(38350700002)(44832011)(7416002)(86362001)(5660300002)(4326008)(2906002)(8676002)(41300700001)(6512007)(53546011)(52116002)(26005)(6666004)(186003)(6506007)(316002)(110136005)(478600001)(6486002)(54906003)(66476007)(2616005)(66946007)(66556008)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?SXYrZHhJTnltMTlnRnprbm8yNjRsMnh0dGlWa2JOK21WUWVSNldPRlB5V1VZ?=
 =?utf-8?B?c3Z6ajdzZkZBRDdpZkYvSjhaNkpLQVRiVHgyTE9KSnRyRmZxeHRyWUtxY0ox?=
 =?utf-8?B?dFdEcjI0T0JCSHRqTFo2aGtTeG5XWWZSamJ1SWJOMWJKUllWMHZpRHpCeFBI?=
 =?utf-8?B?YzEwNTVNUGNlMUQrU3U0bmZ5ZW9wa0pqS3FlNWdhR1BzSEVPTEE1MHBWSGRw?=
 =?utf-8?B?N3p2U3dHcENXMFdId1grOXZhbGp3dStBREoyYmlSVkMzdG45OWxiMmJHV2ZH?=
 =?utf-8?B?T1AySnllNDJDNGkxVitxZmE2Y2MvMlVwdGExLzZEaG1mejYyNGl2TGk3bVFL?=
 =?utf-8?B?RGRialRpNGNMcXJCNDg4SDMwQmhvWVJJMzBNazNReE12VWhxNUQraXRFZzNF?=
 =?utf-8?B?SE04MWQ3NldOQW1wbDBDVStVT2NoRFZ0RlAzU3dZNk5pd0Q0enk3bStEOG54?=
 =?utf-8?B?bjM1bGZNMFYwcjROQ1RVcGhPOXZ3N0JzUGFEbW94OWkyYUgyVEFveGQ3cHhT?=
 =?utf-8?B?dzdwdE9RbGJRSUZQU0tOdWgxblZYSzhVeUk2LzBudWthU3VuRHhPVVNNMkEy?=
 =?utf-8?B?Z2h3Q28rYjhmZHNTU3ArVnhwVHlNQmpMSTk2d2hZVjBhTVcwU0FRNmkxNU5n?=
 =?utf-8?B?bDZ0ZG1pL1pSdmNHcGU1SC9MM0tBc3IvMStGd08wWjJ4OGczYjRqajg4TkJO?=
 =?utf-8?B?RTR3WWtCUzNWMVhGbjZTZ0JhZ3hJOXJaWTkrY0ZiN0szWmRYUXh1OXFPVlhX?=
 =?utf-8?B?ZlBiaU1vVTlTdnkwd2lPUVAwNklaUkFtZzFOYTlpM0lTeFNQNVBKWDhTcEgz?=
 =?utf-8?B?QUYwN1ZLcml0ZnJNOEVLWm1jUGVUcGVpdmh0cjFpcG9aNTlHc2pPdlN0WEhG?=
 =?utf-8?B?NDVucGJrN3hmOUU2RGQzK2RzajVadCt5Rm0yTGgrQW5rVE5GZGFqWmZrZVRN?=
 =?utf-8?B?aGZjU3kvYTRaMVBENkV4NXFtZitteXRjYllBZW04ZDZmYmhmdGVwRkJDSWor?=
 =?utf-8?B?VTdKalQ3TUJGaHZsRzdIK251Q1RJRTFxV24vblJlTEY0WVY2Rk5GNCtGRG1o?=
 =?utf-8?B?Z3dpSW9maEVUdzRyVldSd0ZNYlFtbE9lZExaL2JoTWJRdnRaUi9WS0dSYTRo?=
 =?utf-8?B?cU1oRnE1OFJiQWZrSlIrMGFyNjUvU3ZENGhRQ1VKOFNaOXczY3JlcGhpUm9r?=
 =?utf-8?B?aStWYkdKOWEwM1FSMnpTMzRCNHo0NUpqYjl6WWIxK0JGWnBtS3oyREMxelBE?=
 =?utf-8?B?b1Y3ZXg5ci9PSU9yNXJ3SXlmbkJRLzlSOEVLRFgzM0xyRUNhUWx2eHByVGcy?=
 =?utf-8?B?KzZtOTZNYVpiVVJhR0pFSi9XU1RhSEc1MjE2UlNhdlJtbmY3dHNkM3hOV1l5?=
 =?utf-8?B?S1hmQ3Y0UmZmR3pWT2tzSVh3V0MrMzB2cHhFc1hFSzR1Y3krMkNvUEdYZEN0?=
 =?utf-8?B?R2FRWTc5NDVsaVR6MUtDSEpwa0lWTkxIZzFWTUtZSWJ3ZXVxZWxCZ3FvZE9E?=
 =?utf-8?B?djZXMzhKbkdHT1E4alFQZkJUbVJ6WGpXL2d6ZUppWlAwWnFoK3JLeDJvdWVn?=
 =?utf-8?B?RlJham02RUFPQmgreHMyb05tVkdUN3JvSTAxYkpHQUR0cVZ4R0tHZmNOb2Zm?=
 =?utf-8?B?aXprcnFGK3RCbVBJQXIvTHpuUi9xbFcrcjd2clYvSm5PTk5weStVbjllTFBG?=
 =?utf-8?B?a2J4Qk5BTDUwK1ArQkV5Rjk5NFpJNGREV00zREt4cmhXRkZsVm5SNTlFS2sz?=
 =?utf-8?B?OWNzQ25PVXgraThOa1pGRC8yaUZ5NjVtOFd1ZnFSdGkwVnVKN3JMcmRaMm1M?=
 =?utf-8?B?dkN3VEpaOWQxSytEM0lTTS84UWFlSkMxS0dpeW1MYjN5bzMvbXFmR1grTlFJ?=
 =?utf-8?B?cXptNDlkcE4weFN4VXhRNldZQm9zaDFpeFIzajdCM25aSDgyOFdDUUpRdUlT?=
 =?utf-8?B?MHNaZXlBcjVkMFl4c0hwc0ZSVlJ3ZlRiaDFqeTZ0UGluK3lqVkUxZjJNWVJT?=
 =?utf-8?B?ZDk1ZlkvUHNtWXVhUkp6QXFCV1RPeWc2WjZmT0NCYXdGTlV1Mm84V3BoNG5j?=
 =?utf-8?B?Zkx5bVNnMkpaTHduK0tTaFA1eURsdElKWVZuS2JsN2xBeEZvVlA5U0hQOUZ1?=
 =?utf-8?B?TkM5ZXI4R0FDOHlPU3VuMVBGUktqZThpbEhnMUt6U1A4ZDdvV0ZTYkVzNS9J?=
 =?utf-8?B?Tnc9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3af0bde-735a-497b-448f-08dad93206b1
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8847.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 15:36:52.6309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ao1fYTFHzGMMCBmau9NPohj3LEpseNLU3oFwa4CPl/UC6tDiVAHZwN9FdzqEy6xabul4INN15zQAU7C869jbxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6665
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
Cc: devicetree@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Michael Turquette <mturquette@baylibre.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/6/22 21:17, Stephen Boyd wrote:
> Quoting Sean Anderson (2022-11-01 16:27:21)
>> On 11/1/22 16:10, Stephen Boyd wrote:
>> >> 
>> >> Oh, I remember why I did this. I need the reference clock for clk_hw_round_rate,
>> >> which is AFAICT the only correct way to implement round_rate.
>> >> 
>> > 
>> > Is the reference clk the parent of the clk implementing
>> > clk_ops::round_rate()?
>> 
>> Yes. We may be able to produce a given output with multiple reference
>> rates. However, the clock API provides no mechanism to say "Don't ask
>> for the parent clock to be rate X, you just tried it and the parent
>> clock can't support it." So instead, we loop over the possible reference
>> rates and pick the first one which the parent says it can round to.
>> 
> 
> Sorry, I'm lost. Why can't you loop over possible reference rates in
> determine_rate/round_rate clk op here?

This is what I do currently, but you need to have the parent clock to do
so. With your suggested method, we never actually get a struct clk(_hw)
which we can query for rate support.

--Sean
