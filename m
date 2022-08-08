Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA7158CB20
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 17:17:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1fvG5sH6z304m
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 01:17:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=g54tD311;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.21.49; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=g54tD311;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2049.outbound.protection.outlook.com [40.107.21.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1ftS0cG7z2xZB
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Aug 2022 01:16:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KjfqkgrCw55INK1EaMr4b8hWOhJzVMoLrpW8vCzTm//jO4SVlCrFrl8oB1+Rt1C9RxLlbUGnVnB0czpvZ1Rdeau9ntsQLclzYkRJiqoRa7xhQQRYHjfr47+q0w5T6q89jvvfcMwlT6SFlqHmdZ5PR7cf1zySoEobtWCsOCej/O240P4YbVB+At+SivsRSNAFmLr1mx+qtX8QHHNR8TNWYu3m+LzGkAvRF+NQbcacOCfgjQh3KxWNff9X0Aqva0yoEZcnVzJGMe+pFCZVz1MH5uiVxF5CAk9cTNQc/eqC5EyIOQ6qep7tHzEhzcACCSYi44DFjZCoXDnug/mrqJcYlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xaZYEqXdWU6P2QHexEQdv5Srqj8UoZWKYBa0SZ+B0fA=;
 b=nySMtBEBitxOmeYv+K+F/qNYX5x9q9lcvwObqChQw6SCozT5Cn0KUP/mVHdqrC9muM784UW1+SxIwS9ELyCPIbsR+Aft2Eb0kR+rk8BppXXL074mzjcUzHsq17zZK0/dKK0u6+yGM8eDKEz/V5/Ex448gRyjv6qndMBHZNGPoJZdkC1gZd0VPfuhYPrnzH/4AjpAFHyzOZVMKeiagfP4Uov/AvU/XFs/A2SYpvv/Eacr9Z6GjjfBi7/Mss42FrELamzKJ+YYHMq2rVqstRSUI4MrLmAyb8DqVOyj0iw9YPxvCUNOkEtZXP/2CqaVKSEhKG5P6v27f61BBxZSoBg8Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xaZYEqXdWU6P2QHexEQdv5Srqj8UoZWKYBa0SZ+B0fA=;
 b=g54tD311MYWIG3a4P/8xXhCM9TfxsKyJEE+J37HYuGHY5Yv9TC3hRk+DdfL76iHkk4XUn8tz4ljihbCLDvVApUX0V5DgzVra6UizqfXH4xVzNPMATvqFWEc6GVMszQ5QOvoTFEH7BrgH8H+xZViTqy1EvGsb19OfBmmme5PrSW3f+oWYOQkUWS5rkhHXH05Z+Z1ww0uM2f35kgfZkDo7MMvCvAivjCPTG9wjAL/2siNv64OwuYsuFgsLRLvO8tV7G7sGHOCNExgJVOixoUmf8SyFy9P+lT5GFNGEtJikTaWCcxlKfd5BeOsSFEZEJ1JDwY7GvHhjPG3m/QI+r4IQMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by AM0PR03MB6164.eurprd03.prod.outlook.com (2603:10a6:20b:15b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.20; Mon, 8 Aug
 2022 15:16:08 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2%4]) with mapi id 15.20.5504.019; Mon, 8 Aug 2022
 15:16:08 +0000
Subject: Re: [PATCH v4 3/8] dt-bindings: clock: Add ids for Lynx 10g PLLs
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-phy@lists.infradead.org
References: <20220804220602.477589-1-sean.anderson@seco.com>
 <20220804220602.477589-4-sean.anderson@seco.com>
 <bee3d724-1efb-d5c7-6698-c98a198e69fd@linaro.org>
 <b97f113b-f429-c8c5-96ee-7f1a68e16117@seco.com>
 <6aac8854-599e-c43f-0a49-0650fce91179@linaro.org>
From: Sean Anderson <sean.anderson@seco.com>
Message-ID: <04b08e1c-4af2-581e-7be5-96c5b7b00ae5@seco.com>
Date: Mon, 8 Aug 2022 11:16:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <6aac8854-599e-c43f-0a49-0650fce91179@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR1501CA0005.namprd15.prod.outlook.com
 (2603:10b6:207:17::18) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f54c330b-3498-4c06-40b8-08da7950eb54
X-MS-TrafficTypeDiagnostic: AM0PR03MB6164:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	t4ZMMUhLGy2wlGycgg3zhxd/OyDBp376EhWkV+pCzeFRtA9dHCGUiR4oJYTQBVmApru17FiXVlfyr3GowCzjl5hrBNaae84/1/PaTKqlMIcoMnJKNleM/J0BPpELoGaJhX+ZeSGbiFlpj1mM1C5vQcGDceqzqRsQLiHyU1AorSuhiznR7QPAKS61Upb6gnjel+FN9PQJxpr3Rvtf0Q9Dg/usycZcqhshDfQjyyh1gDN3JUXCk4eSV+YDcCS4hRXQGJCEiaajtzEzLDsDgJn/5jbfyO7CN4NjKG1MrXYLW3KaF3pwNAqVKj9tZYemXltznaokTHj98zziD1/ATRS59goMl4zVPtfrqUfmn+BwzwvBGT7qfQuHkHKvThwoNixL1VPfA+rDlRvRkS3aCwYHZQibvUodP+AZ/Xlh5jnvMMgYhaHgkpfFQpXeSs5yeTz9tNbFj0vxH/r1s5I3H3hV2gZCgGTmrsPrEDVw7QUj8ciW9TMMz0E+Yght7trlcwcy2WdXWSaZDPTeA3Vf93eLMq62HpOA4sGDR+/aDkcgasT5gWwodX/RWCPKZik5QPh0mBWdMX4LMTnttFh9OpgbgxwLrkq9fzi0rjgUo+CpFKdph1lU6c8UbUzgsGnj1RI45rHIY0TsSdNH9imvcOE3VRDrAAtHCd0i/q7u3Dkk+A0tfKFP580vQK4jElA8WALZE6OGCGiKSzVWyAtAdvfp4mwFpgSEOCAgFHGIhTB4nchV865/MrSYHljO1ikAU+Po+LaDJuLcEqW9rnKjH088tZ0+o4dCSfxPZ7aGOQ2vJ8s+3tsgeO8B8Uj88Bv+21WPY634ejIta6RhU8ec6JlS2qDOHI3MX+456rRYro5ls7Q=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39850400004)(366004)(376002)(136003)(396003)(346002)(41300700001)(6666004)(66946007)(83380400001)(6512007)(26005)(52116002)(6506007)(53546011)(4326008)(31696002)(8676002)(66556008)(66476007)(186003)(86362001)(6486002)(316002)(110136005)(54906003)(478600001)(36756003)(2616005)(44832011)(2906002)(31686004)(38350700002)(5660300002)(7416002)(38100700002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?U1VEYk1qY3V5UVJ0ZTlCa0hRcHFJS0dTUTRaUkxPcG1xVkhkWWtubUFRZE14?=
 =?utf-8?B?OHpGeWE4N25oaGZQRXJxWTBYMFdWREJCMExXaXRzOVR2eUg3eGtMc3JlWjJP?=
 =?utf-8?B?SCtJdVFoK0EvcXgzaHFKTk41YXZFOGtCeHpZaEphVU5oYXdXNTZSRlJINlZ1?=
 =?utf-8?B?VUlpRW1FS1VuTFBJSFFSVjJpMHB1Q3BEU2VJcFZkak83T2xiOUxSMFQ4UXY5?=
 =?utf-8?B?N2wzd05xTXI5SDFobmc0RXNDcm14TmZodDU2UWZVSGVJQzlTK01GZ2NwNEt3?=
 =?utf-8?B?RkE0S2F5Z1pLdnNNL294QWtMczJXbE5FOU0wTk0wSGc0WjgvdlpqcjJwR1lM?=
 =?utf-8?B?d1ByZGZSa0hrWGdVblJTVnZUSHpaRVNSb2dNWjRQbnJ2cUNQbVBkajc1Q3dh?=
 =?utf-8?B?VDhTaEJTd21GUFdTY1Z5cGJYcjhIaDZaM3p4M3k4aEhPb0hvN0l2UnhSRlBJ?=
 =?utf-8?B?MkdNUm5KemtrQXIrUVFNK1pUdVEvbnphRWNEZXRWR3JPT1RZYnFmZU5xUzlu?=
 =?utf-8?B?Y1lpdi9JNXBqL1JDb3Vtc3BwRzQ5VVoycXBwOEsvZVZpWUt1NFJOOTVxOGN4?=
 =?utf-8?B?bzNJYzdRQ0VrOTkvZ1MzTXFneXdGdHZROWdSeEhxdC8rcnhLeG4rZC94anhq?=
 =?utf-8?B?NWpZL2pacEJqN3lhS3BWV1ZjcEFMNHhUaTZsS3NMNnFqcDlHdm1EeGVuQkJp?=
 =?utf-8?B?SUFZd01zSWoyb2k5d040VUJpazNscnFHMXl2Zi9wSUlIcStCdU95dkZ0T25U?=
 =?utf-8?B?cHNXV1lkcUJkU3cxK1lBaUdGb2FHMzhiTXBiaFFlVmJOUXVTclY1T3lQWmY2?=
 =?utf-8?B?UHBMRWRQbHJwVUJmYXpHclVxemlueVNFQjFPTVRralRZUk9SbWZwZjRpL3R4?=
 =?utf-8?B?M1dWNHhPeFpDVGNmY0N2T1E2T1VOTFVINWNxWHFoaFVQcXByTzRzaklYUHN1?=
 =?utf-8?B?Uy9HZERtOXYwQU9aS1pUMFZYbitLVGRHeVZZNzNtaWFVaCtFMDBVcmdoYkRk?=
 =?utf-8?B?MEdNK2NKbzZod1NmM1paOVZGbWF6RDRCa0NTcmpUMXlDQ1VMcWJ1RnVMOTZv?=
 =?utf-8?B?UmU1QnArT2QrejBEMUdDVG5BeHF1T2U1cUZRNXN2V1JvMTE2Z2VtZExSS3ZL?=
 =?utf-8?B?YkVrWlJUVmNCVno2U2pjaDI5U1VxZy9zUjZTRTMyL2NudkRQZE5ZbkN6SDRN?=
 =?utf-8?B?RVVIVStxYXhiZXBiR2RSMEk0QlRIRlJzK2NDSHVLK0RnNC8xOFFqMTRFNWxW?=
 =?utf-8?B?VjlIR0R4cDFaRGZINWlZWVpXcjJFbHMxbHFBWVR1a2lJdDQ4ZmkvV0kyaU5m?=
 =?utf-8?B?MWhacGdGc2s4TTl6NDJMZ2NPU2FlRmN4V3FqV1cwODJOUkRMRUhFQTFOU2Rp?=
 =?utf-8?B?VmtXMFdNRGpXeE1zVWZkWVdyZG1rL3FGZk5OVVNHQlhtNm5ITEdUV1JHSHZ0?=
 =?utf-8?B?eTM4UkswcHZ5Z25ZZHBrcWg2cmdUejdkMUZBelhDdDlBWUcrb05IZmlYSmt0?=
 =?utf-8?B?eS9RYWkvOU9KQ2FmazVNR0pWUTREYzVUMnc4bG83Mmp2WFEzcHdTSlU3cHhx?=
 =?utf-8?B?aTJFUlRyczNtRWJQUHFzeUh1T3dtVS9wb2paR0l3dFZ2d1FqZy9BOFRvTVQv?=
 =?utf-8?B?VDI1TkZRKzg2QzMva1BtU0k4Y1hVZ0VBWjc3czdyWHh1bWVTajJDbWpqZTho?=
 =?utf-8?B?NWYxNVl3ODY3ajBXYjFrZzM5ZjVOdjMyR0c5TTJjbksvNktHbHA1RnRZNWxi?=
 =?utf-8?B?T1ZaUVI3aGpDYnVkV2lud3kxQlRTMWFwNXVUY29QOVk3b0NVSkp4UUJ1NHZJ?=
 =?utf-8?B?dDZxT211QStxUG1HbzNCSzZJdkFROXhubjg5ejRIU283Sm1kOUNvd1lOdUZF?=
 =?utf-8?B?V29uMlRkNzc1Nkd0S2xQeVJEOFlNdDF6QXRQVUpoeTdhSkpDR0VkaTZIamx4?=
 =?utf-8?B?cEUxbk5sS3FZTFlVRmpFQmJoT092RE9WSGtMYjlmU0xJdjhweVdvMHhSWFRj?=
 =?utf-8?B?SmxYVHVqMjVSbUoxVkE2NjFLWEF0OUdMaEtxVWFhTGd3NlpoOXJneFMyVnRO?=
 =?utf-8?B?TGtMZ3E3NzlnajNzWGZYWmh1MHVWZVNpb2pvbWlJK3FEMFNTZ1hiNjJWd1ZE?=
 =?utf-8?B?V0FRVk80dndUZUY2cmxuaGRwVHBMWmM1OE56TS9IV0JjS3BvakRtSWJMeHhx?=
 =?utf-8?B?Tnc9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f54c330b-3498-4c06-40b8-08da7950eb54
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 15:16:08.0264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: onPvGUP13skZYCLhVsIeQo1Ch5wTPSU4+RyBr8GqdfxsdWaXN2TBQ8RG4N8x2l/PT8aNx0LFuJ9/C4P0INJ/Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6164
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 8/8/22 1:46 AM, Krzysztof Kozlowski wrote:
> On 05/08/2022 17:17, Sean Anderson wrote:
>> 
>> 
>> On 8/5/22 2:53 AM, Krzysztof Kozlowski wrote:
>>> On 05/08/2022 00:05, Sean Anderson wrote:
>>>> This adds ids for the Lynx 10g SerDes's internal PLLs. These may be used
>>>> witn assigned-clock* to specify a particular frequency to use.
>>>>
>>>> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>>>> ---
>>>>
>>>> Changes in v4:
>>>> - New
>>>>
>>>>  include/dt-bindings/clock/fsl,lynx-10g.h | 14 ++++++++++++++
>>>>  1 file changed, 14 insertions(+)
>>>>  create mode 100644 include/dt-bindings/clock/fsl,lynx-10g.h
>>>>
>>>> diff --git a/include/dt-bindings/clock/fsl,lynx-10g.h b/include/dt-bindings/clock/fsl,lynx-10g.h
>>>> new file mode 100644
>>>> index 000000000000..f5b955658106
>>>> --- /dev/null
>>>> +++ b/include/dt-bindings/clock/fsl,lynx-10g.h
>>>> @@ -0,0 +1,14 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>
>>> This should be dual license.
>> 
>> This is just matching what the majority (263 out of 326) clock dt-bindings headers do.
> 
> Then please license it just like bindings, so dual license with BSD.

OK

>> 
>>>> +/*
>>>> + * Copyright (C) 2022 Sean Anderson <sean.anderson@seco.com>
>>>
>>> It's confusing to see personal copyrights with company email. Either the
>>> copyright is attributed to your employer or to you. If to you, use
>>> private email.
>> 
>> I hold the copyright, and I would like inquiries to be directed to my work
>> email (as I don't have this hardware at home).
> 
> OK, I guess I won't be the only one confused :).

You're the first person to comment on this.

> This entry here is not
> parsed for any tools and only sometimes people look at it. The questions
> are directed via entry in maintainers file or via git history, so you
> can put company email just there.

As I understand it, the email is simply informative. There are literally
hundreds of examples of mixing a "personal" copyright with a company email.
It is easy to find if you grep. If you are so opposed to it, then I will
remove the email and simply use my name.

>> 
>>>> + */
>>>> +
>>>> +#ifndef __DT_BINDINGS_CLK_LYNX_10G_H
>>>> +#define __DT_BINDINGS_CLK_LYNX_10G_H
>>>> +
>>>> +#define LYNX10G_CLKS_PER_PLL 2
>>>> +
>>>> +#define LYNX10G_PLLa(a)		((a) * LYNX10G_CLKS_PER_PLL)
>>>> +#define LYNX10G_PLLa_EX_DLY(a)	((a) * LYNX10G_CLKS_PER_PLL + 1)
>>>
>>> These do not look like proper IDs for clocks for bindings. Numbering
>>> starts from 0 or 1 and any "a" needs to be clearly explained. What do
>>> you bind here?
>> 
>> This matches "a" is the index of the PLL. E.g. registers PLL1RSTCTL etc.
>> This matches the notation used in the reference manual.
> 
> This is a file for bindings, not for storing register values. There is
> no single need to store register values (offsets, indexes) as bindings
> as it is not appropriate. Therefore if you do not use it as an ID, just
> remove the bindings header.

This *is* just for IDs, as stated in the commit message. The above example
was only to illustrate that the clock controlled via the PLL1RSTCTL register
(among others) would have an ID of LYNX10G_PLLa(0).

If you doubt it, review the driver.

--Sean
