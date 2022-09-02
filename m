Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 528785AB9E7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 23:11:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MK9Zj1Yjhz3blj
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Sep 2022 07:11:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=x9XqzsRn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.21.66; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=x9XqzsRn;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2066.outbound.protection.outlook.com [40.107.21.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MK9Yt45GLz2xmm
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Sep 2022 07:10:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OEnsO7cax1GNg7tKOT3em+kae2ZsL4vTN6ByIubAVsFcoCJhnBH+OoBK2KOSuCqPqt18Gd7SHaBkcNQW2xuDnRmdcDuZPtaF0lAaLzARHVnqsQohFzmvkGAAfG9QQirNvxYj+ajfoExN7s/aFZHD1I8k6oLUSanz9sUw+IeaQawXIZb88EjNtWMP2kfSNahi8PAhJ1ev5o6wdBKjWS28VBf8lMcZpDEn03xTH+qJNppJVl8v+6NV2qGC5m5635vU5lSbkau/bry8N+Zo2eEifa2cQWwG3xEo7MbPtdFbPqJRZ7eLGFW00R4gftaZ8S9KQb7++XXp1uFGRGVan+uS7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8WHVNRIr0UswDVKSJoYH47c3nH5pleGc0jcHb3nRPE=;
 b=KvC/KPqHkM7TXwptMIYl+Wjzoq9kMzOdK87CeMmbhRyrA2DTu2XGgmXxOgs+lzDyBsPQjBWEYwtKnHOSRAEey6GFIVCHi6T4aJpLy4LZLR4IZOl7gBcND9ChxM9oqsb5FgYnfit5lhvEl+uxGd1kedBz0plX2zvi2v8l0tnGsUxCXDtdpRa4s3K0z3SOJ2+4wJ27VttuD0x/rmKS4KgS6RP3LU5I+y6eTX1Y+Q7JVpTGRHzx4VVIx8a8CXvcd6zXbWFgH6jT9ctv0JZ5E3fL1C1IDxtW5PuAmfEc/uFdGNr8xjrxusEx47J7rp+3RWwxx7mPm53OMHcQvNItXiaDGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8WHVNRIr0UswDVKSJoYH47c3nH5pleGc0jcHb3nRPE=;
 b=x9XqzsRnlJl5qP8lMT1Gom5Rm7yRz9xx+oIGMHpl1ZIAfPiRHb44ZQzy45jWItg4Enmzh0uF66gAcz42AzUOKweitg2DdTqrZmKUHwxhDIJZbw462AI48GT6QatlS8QDiu9DkZe9fXncIioYBBz9XjhpJSQebzlBKMbYn+/WKno7kdClNhia/kzGPc4GVVwjPpovkPC61qKsXzGcFGnmgVUS/YYSF34tOY90tttpSruLTh5pQk9O2YQKSZLyum1SfHqjk86Jxm03lAnD5+cYGdeU/7w4o962yE7Uh/142ok3fMHjwPvcSz/C3NiprsQxMsCDed6eCB9xRfZpkO0sVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by AM6PR03MB5078.eurprd03.prod.outlook.com (2603:10a6:20b:8d::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14; Fri, 2 Sep
 2022 21:10:36 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2%4]) with mapi id 15.20.5566.019; Fri, 2 Sep 2022
 21:10:36 +0000
Subject: Re: [PATCH v4 0/8] phy: Add support for Lynx 10G SerDes
To: Vinod Koul <vkoul@kernel.org>
References: <20220804220602.477589-1-sean.anderson@seco.com>
 <6d312336-4bfc-a8d4-783c-116a21284edf@seco.com> <YxJAPbfBpUpHeiqX@matsya>
From: Sean Anderson <sean.anderson@seco.com>
Message-ID: <4aba6730-dae8-f11f-8ad8-18dc1f1d6e45@seco.com>
Date: Fri, 2 Sep 2022 17:10:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <YxJAPbfBpUpHeiqX@matsya>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0079.namprd03.prod.outlook.com
 (2603:10b6:610:cc::24) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49a96e6d-0a82-4b15-3c1d-08da8d279448
X-MS-TrafficTypeDiagnostic: AM6PR03MB5078:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	k4a8P/uAJAPI/C6cc/s90t1F+Lh0YLk8BT3PvzrEHhAAuQ2qZEBeKnIrVGpkiFQ3GIoaXMe882irLE4pjJhZPcpcRcvC+PcboPT7j5YFMVxgEVIqVU6KParikxMKJ9jHTfpSps8DwX2JpOhaOwNkCqbFsrwcMZNqNbiz5zCA2i8i1lXPDBsPYYZpK8t8xU2xGkMPjR8MwRV8/Eh/8lvX/LwyNtFttB5aWabGiyBFrOFLIjybNv87QsLQBcOkGZFVUjOKf70OlD7aVh8xXhCZePUXBlD+sLKI2CUWNEUpAyzIelUk86ZWMigYaY+Ud6XdL17OnBl++9z+2EXZc/l7TXL/Qr7zIJXjM1MIf2uS8SeUDkU8mUa1TfoPjKTNTTJVCL3m2WeJt7bESQWuzSPkdYA/lg68st7mxUk9JBj/a3+rit7OcglTpgmpikGCKi29cx37qBjgabWNaa2HAgLLwT/SnIwPyLmIBdslTVG1aHcsnuUOb0XaRWqWp///dkj+vk8ca9Z6KaL8Gq2xyBoGMdGFo9NtzlHnAF/ep6gB1kgYyYLFMH/E3QuGAbs5TyJyNBj84qeh1YoSw93N02CmUSwyQsWmI0G6jl7u87boLS80I+Z8VtbJeibRwE5Rt/G70B9zkN2/W0tWKn8d/Pmf/w8rktQ9Dx8vLkFJD0PJv1VYEp4GaoAFqCISYXDf9poa7I+q5p59zpUk2MNQBbhHh36HgYNZ++n6tugt9NEKrWmmM75fU+hNuEHFN2EdeIhHB12SvoI7zFHA/Ir+18NQzT4nArdhy/5CvFHmE80iSqPBmd0S4TUHfMSOsHXeuKlquCIIAvDe4Ej6o1CGWc/o9a/QcYqX3khkxxumKv0z+H4=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(376002)(136003)(346002)(39850400004)(4326008)(86362001)(83380400001)(31696002)(38100700002)(38350700002)(31686004)(66476007)(478600001)(66556008)(66946007)(5660300002)(6666004)(7416002)(8936002)(41300700001)(6916009)(54906003)(6486002)(966005)(316002)(2906002)(6512007)(26005)(2616005)(186003)(36756003)(8676002)(4744005)(53546011)(52116002)(44832011)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?d215andnWnk4R2xXU3J0WmFvZEc4eWZBU3FkZUZKTUtpZ0JIRWg0ankxVDdP?=
 =?utf-8?B?SmpROFJGejZBc3QwWi94NHIvVVc0NTZmdUZtY2htSFVZeXJCVVZJTGhYanVD?=
 =?utf-8?B?cld3ci9hTW9pZ3RnTE1LdUxqSk52TDhkZU5uUGw0YTYxckxqUGhyL0QxRG9h?=
 =?utf-8?B?dUtYazEwNFhhVjVOL0Zaek5rTzdObjk3bVZFVnVUcFhYRUFNd21ReFRmbHRu?=
 =?utf-8?B?VmFLUlJLbWhLdGpxbjM5bVU1S0xzZnNQWnRncStGTHBtOFJoUXhFUzF3RW42?=
 =?utf-8?B?ZkorSHo0L2pLR3N2bEFxR09XM1RXWnNTczJjeGdNL0llUDlNUWVudG1Xem1u?=
 =?utf-8?B?V0J1UFNnTmNteTRzOWNEWnV3RWNEWHpNQWcvb0JwR1pmSlVPczViNkk0ejFt?=
 =?utf-8?B?YkNCdGRmVTJlZmJxZFM3cSsyK05HRDJSTUd6RXR5bzJmdDdOWWpEVDhYZVdM?=
 =?utf-8?B?Wmw3bkhkWEVleVFCVFpPdjFueXdQVFp4d1k2M3VEOWFoTXNkSUlDbDV2N3Vh?=
 =?utf-8?B?SVhwbGFMaDJENWwrbUM4dGx1aDFVWWxZdlE1V0haOFo3TUEwUGF0ZVM0VTYx?=
 =?utf-8?B?Tjgrb0E4VlJrRGV3d1dYQTFLeitPaFBzWEtXcWtIR3F1VTkwWG9NbEgyOGo5?=
 =?utf-8?B?a3VkelJ0aDJxaEt2OTRoNk11WGN4aWJiblh2MDJPbU5pSVlWVFJuUDg1MFpl?=
 =?utf-8?B?YWtsNDhmd0I2alBkVHFQSDUwUlgzT1p4MmhpMURCRmxYUmtwakVhZHVYOE1u?=
 =?utf-8?B?THhIcWtPUlU5dm8vcmkxV2pYUjhqQnlRQUNualYvaTlUam9FUWF2VkVHcTNM?=
 =?utf-8?B?ZnN5dGwwV1FUdEw5cW9BUjhaekxmbW4yZDdVOGNuNUhUQ2lsN3owdmdzejdW?=
 =?utf-8?B?a2NCcXMybzQvK1hXS3piblU2QjNlbENIOW1EOTMwT2FZcEFyVkdWYXVnOHQy?=
 =?utf-8?B?UGlmTWZIUEJGUWdKcVcrTjJMdXpTcjJWaXRURjFxRU5nd0FMRTRiUktOM3d1?=
 =?utf-8?B?a0RKNHR2UHNkbWVBa2VaQlNsWVVEQzBxZjM4VlV2R1V3L3lFZTBYMzNXN0Jx?=
 =?utf-8?B?L2M5dEI5bkV3aTBreW1RZ25tS3pKK003eU1lQ3gzOTJsL3BBVWtIUUVJcFVR?=
 =?utf-8?B?RjZFQjN6YUdSYVkvWCt1bnNUSmNEYVlnTWJIajhldGZOUksvN1ZCeFl6WVFy?=
 =?utf-8?B?dEVwTVNwTDE3d0ZpU1MyK1JoSmh4TVhpVVNBM0djOVlCN3VhUTZsb0V5S3lz?=
 =?utf-8?B?R2Q0dDZrUW9GTFV5MUZjVXdhMHdueFpaVUMrQnlKdXVId2FzZFdoUzRiS0dF?=
 =?utf-8?B?Yk9zaTBGYkNVVW1BS0xGZUV2QkdRUDVydUtMeXF1aHRSSENva0hxa1BwQnZh?=
 =?utf-8?B?cjYwSEtlZ0w2VXpuWm1oOWhmZWJuQTlKdjNvRzhMNFFvZ0N6TG56S0R0dHh0?=
 =?utf-8?B?UlBKa3hFVG90VWt6VE1YQ2R0dmxZVDZ3NXdrd3dOVDBvM0JqMkhCV2JFaUVi?=
 =?utf-8?B?NVFnRkR6NnNmdXQzcS9DTWh4RDhYQ3gwZ0YvaUNTQkR5VWN2a0VHUHpVN0pr?=
 =?utf-8?B?amFzaU1rdzJDbzZiNERxbTRjdTZGbjhnTXA3Tk5Wai9ya1A3RHQxUTlQTDUz?=
 =?utf-8?B?WE92QkdIOGsyNjBLRVJhMndkZnpDQTZWUEVvbHZQdGF4UHVzY3ovd1BNSzZp?=
 =?utf-8?B?QUJNQ2FGK2ljYXJJQWx2MTVyV2dTemxjYzF2TUJhLzIrY2tDNll6K1pRZU9F?=
 =?utf-8?B?bTNkWGRGS011REIyTDhGazA2ZEFhTHdHMGR0TzJQOEtUengxZ3o3bjhjOFRy?=
 =?utf-8?B?UWw3RXRlZ1JnVXZCZVF0aEVMTnZKVXBESWRnWFNSb0luVGRldFRRYlgyT0tz?=
 =?utf-8?B?RzlEOWQzMzFZL1djbE5Ecm5ZTUdUNmtiekxCUWxCdGo3eGdGSkpocFhqaE1Z?=
 =?utf-8?B?eHJUT2RhNHB3NnVrZ1hPbzZBYVBrOVRtRjcwdndkYmtiS3Q3eW1lUkJWZjJ2?=
 =?utf-8?B?UFNQdVlGL3dORWpWeTMyZDhLbVBZQWc1ZWloZFgyTWovQ1IrZHc0MklOQzdp?=
 =?utf-8?B?SjVRYXN2ZTZ3NlVHMmQzU0hvSCt5a3ZiaDNTZGRacTJsUVpYOHh2WnRoQWp0?=
 =?utf-8?B?eWxOdTdUNmpLaUZYQjNML3Y0Q1BrbmxQTXZkS1d6aFBlN04ybkhuZGtlWDlQ?=
 =?utf-8?B?V0E9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a96e6d-0a82-4b15-3c1d-08da8d279448
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 21:10:35.9536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c6KUjpG7hZ3DsSA9KDpjaiK+Uw7NhMttAlsk3ybuFxbAPSqBxedyB0YNo+aR5HszL6Aho11Vl3mG8G7xWw8QEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB5078
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, Li Yang <leoyang.li@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Vinod,

On 9/2/22 1:41 PM, Vinod Koul wrote:
> On 30-08-22, 17:44, Sean Anderson wrote:
> 
>> 
>> ping?
>> 
>> Vinod/Kishon: any comments on the driver itself?
> 
> Not sure why this is not in my queue or pw, can you please rebase and
> resend

It's marked as "changes requested" [1]. However, I am not aware of any
requested changes other than Krzysztof's request to dual license the id
header. Nevertheless, I will resend as you requested.

--Sean

[1] https://patchwork.kernel.org/project/linux-phy/list/?series=665484
