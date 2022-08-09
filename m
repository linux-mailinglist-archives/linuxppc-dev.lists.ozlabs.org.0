Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD3A58DA7B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 16:44:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2G6k0lMpz3bl7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Aug 2022 00:44:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=0lpHbcAW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.14.55; helo=eur01-ve1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=0lpHbcAW;
	dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140055.outbound.protection.outlook.com [40.107.14.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2G5q4zTyz2ypH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Aug 2022 00:43:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXJbYznFM3g30JfdT3KCPN8n5njBL4TpRG5V79PaCxWMw4UIAEV/knZ+Qq73o39tDiPnyV8fR2axCHaGPTofFHRrZqBC/95BWQa4Ss7zaREWid5WI+u9+PvDN+q6QIynTapSm+wSGKhecsg5KnLUMMjtFgaE7U3PuwRJjBSjTNF7C59iUYv8XHAs9K9EeAL3QhaB8RpJ57ccgMr1C/rM/ehnNbaNqo9GEAKbeOTlfYlnhOZPchUritLNCmZFlYfngrSDOWCZsYIBdin1mPSNtmElqfCK99cXroWe5yrjNyn9uL1whXdw9fVMiH8gRL/E4PmUGEAco00EGMWhcEq7zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ux9qy82zliuVwPE1Nz9lDMb8zl37Y/mg0ffhQNwd1o=;
 b=PPQeuRtlWkj93Hn7j/XYekSEeRRU6zB5lAmnj6p9nDVxqzqrY8XWKGvtWCMCWfVkj3Sb2KdGBIz5QmMEhnTq42DjbDusRsofj8C8xcV9BvVTsSFoiP4DvmZQISOJEj7xPSH0x3czN7OzB96io9FL3sNZwC+AoCULJ39Y9AS65TzN1iUWuu2+ypADfgwoWWbEWbROPIE0P5BSOe47DRaMddHS7yduTTXzuH7rJizDZEs6sqtPotHq3rKxdgVzpfNPWrFPSl3kw7gk5X5F+QmZFNSMQUnltSh3TNgIoKFojUk1R+l3MloPSII4PG5VeCxSgbiI5gPfcMSpg1XXH0CAWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ux9qy82zliuVwPE1Nz9lDMb8zl37Y/mg0ffhQNwd1o=;
 b=0lpHbcAWyFnvpE49yFXn5xnldiSw4Nr4QIuMZB5Zx869MOeATioPe6KkjcVsGDFNTdgtZK/9FQWUZ31tVPr6drviMM8mQZjcGC8Gctzug+PmC7tf/OUSsriboQPpkAsCAc+TZDpabCvMRhdwCcjcLR/IgjMowtJtBRtgQuFkYIoKVdZi9V4uXMigKt1OB7MiTclkGYi4tUV1nH057prA2SLghLQe7e87kjPQtTIOsoeuC1lNAZtVUjQSN5mIXThuylRAKQ+KWea6o1aIsyUW8xYmGxJRQm3wRsPC2UiwiNP0TaNlcE0olaRlGrrmMvWvMSwYo416OM8icDiCfxpxkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by PR3PR03MB6378.eurprd03.prod.outlook.com (2603:10a6:102:5f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.21; Tue, 9 Aug
 2022 14:43:03 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2%4]) with mapi id 15.20.5504.019; Tue, 9 Aug 2022
 14:43:03 +0000
Subject: Re: [PATCH v4 3/8] dt-bindings: clock: Add ids for Lynx 10g PLLs
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-phy@lists.infradead.org
References: <20220804220602.477589-1-sean.anderson@seco.com>
 <20220804220602.477589-4-sean.anderson@seco.com>
 <bee3d724-1efb-d5c7-6698-c98a198e69fd@linaro.org>
 <b97f113b-f429-c8c5-96ee-7f1a68e16117@seco.com>
 <6aac8854-599e-c43f-0a49-0650fce91179@linaro.org>
 <04b08e1c-4af2-581e-7be5-96c5b7b00ae5@seco.com>
 <a387164a-d42c-fc1e-529c-6000aa2db33e@linaro.org>
From: Sean Anderson <sean.anderson@seco.com>
Message-ID: <39c3c2f0-5efd-aae5-b89b-9a1883f27177@seco.com>
Date: Tue, 9 Aug 2022 10:42:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <a387164a-d42c-fc1e-529c-6000aa2db33e@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0412.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::27) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 449bfaed-0d22-4419-5ecf-08da7a1575bb
X-MS-TrafficTypeDiagnostic: PR3PR03MB6378:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	g2uPtOGSy7qi/WxNZs6dwJ1FeNqJkUPGBoIxdN3ZTqKXil/eEUiiHMRCoiPq/3ho1vXVvJZ7klvLO8tibzFq6mecODBP79dnLDQTE6oo5kxIehD5Z/Sui9sD/d4uJxvMVlPOiGT/A5sM/4jKjS1+2UtfMFQ1IJYLmbmVyrLj2lKJkO3NBAoM5fYNxf3UAPOOkrzbBpkQ9ERx/Mk3QyZCuJU240y3zmQTjWfaYzeLKmj3DpamqZdM+H7X0y1S/Zi6DK1BhLmv/67cH1LpDq5SH2e/zb08/kEu56FEW16ecIc9nzKFKWy8zIFEDUwcfAPurttqHaxa9uIY6OJLQr5w5ypP5g4dWwbjXiCZcYBK8bsXjssHndSChDV92JlwPSZvhkA+bUtcJ3fGovFT9q7ZxVzCwmUL9t2yvcIUDQGBGJDk3Qk+VHQKVohdHYhU0m0nTwWTk3MGmHlrn5I7gHon9KgZeo8TjGMwyiB8LgHn8jIznhhP9A6heTq/hEbLbgR8vowqnrWaKfxH3SPOxGFgee8nJ9WUlc1eDmEK167dl2dJtYw2sqCfiiMhzRkp5+Wj9yMQgK7scxIHwHWcF3MWwoV6tMNtzM2QM/AHn9BQBEE3amYAGQ6p502vwlYXSKlBkgM/Zh66AZQawC2ngQ1wrHZYpq7ErxfhLjFGK0WJxJoV4uUGqLPerFO/CBLcbd0V3Frwwqf7B5uHAUj2tCya7Pp5q7x7wPbB3S8MRjwJVrBPqqHkt2oLSbOrhqZ923tqa3xqUPLrVWB+XnZArkUDvINlq9eFlRFjZiulD6yt91zgwnPr/b+229v8bn7ZAy5lcHHt4VyTsY8ZYUBWZVUE5LjD+kvSm9roXR/yb/aoRIw=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(366004)(376002)(346002)(39850400004)(86362001)(31696002)(38350700002)(38100700002)(31686004)(54906003)(8676002)(66556008)(66476007)(66946007)(110136005)(4326008)(316002)(44832011)(5660300002)(2616005)(7416002)(6486002)(8936002)(6512007)(26005)(6506007)(53546011)(186003)(41300700001)(83380400001)(6666004)(52116002)(478600001)(2906002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?bVhOTUpjNmFNeHY1d1JzMzUxcFYyS3ovWTFDTVoram1oU0VSL3kwTllXczU0?=
 =?utf-8?B?UEpFM3RucWMwU0t2alZyWTZidzRJaVNTVmptT2tVcU8wVGdCS0FVVldqL2du?=
 =?utf-8?B?aEZDVnpRVEpYS3pDSVFUTDJ2UmxzbTRNbzhsc051VHBQdDVRRmJ1enRmVnc3?=
 =?utf-8?B?TkJ0YUxQeFZDWS9wbFpJNFpNenNqbW91cTJwck1jbTFhb2NRUTV1Yk9wMjFp?=
 =?utf-8?B?MmpZN2R2S0RNZkplV1djWC9IYzlEeHpXNXpOZnNiQkgxS1hidzdlRFJFTjhp?=
 =?utf-8?B?SXhieEdzbVNwUWVKMi9uSWNyS1pyeHMva0tMbmhiRGhwQU51THZaRHRTaHdu?=
 =?utf-8?B?L0x6ellrc2d4QS9GRmwyOC9zM1BqenZPNnV2UUFMTHpKa1VpcVdOOVhIQ2Jn?=
 =?utf-8?B?ZHYrYWhRcXFGL01NdXRnR1FQczRuelArellMUXNZVGxIYjJvOGtxbWE1OWNn?=
 =?utf-8?B?YTVMSWxBWVlBZGNYV2dJRHg2ZWdCSkZBaGdpUFRLQWVZQklRdk9CT0tPdkhU?=
 =?utf-8?B?VTBBK1RPbk9BbGR4cTlrT3lmWlRsMGZjd2N4QkZJUUJCN1hnNzc0NlVRQ25Q?=
 =?utf-8?B?dlRScnJTRDBoNVFjUUJxVXpsNFdqWFVUTDRPTU9zUlVlanNkWXFST2w2OCtE?=
 =?utf-8?B?Mm5SR25YOXg2Y1hSMVhhYkU4c0NVS0VrN28raVcySDVXM3grdXorbkZpYTJQ?=
 =?utf-8?B?RksyVkxBVnUyblVvVFFIZ3lOSHNhUXNSeWdHajd1c0dyVktMVitUUkpmMUky?=
 =?utf-8?B?RFVYY0l4Y2VVRERLWm5XSEo0YVVmL1M3VDJrVWhXNHpKQ0ZTM2NNQ3RVZ2hW?=
 =?utf-8?B?YXREWFdTS2NhRzJJVE00ZXNPbmdCTU04eE5UTGVUcmpIaElVQ2FubFpoL3Nm?=
 =?utf-8?B?OW5wSU1IOW9JWUhnRk5PUkh5OHZiU3R5RWlFR3krb0xNOEEyczkxWWpMVFI0?=
 =?utf-8?B?OEM3bXhkVnY5NjdBSlpzU3l5M3hVYVh3ZXdFUXZRYnpHVis0WHFSMG84bVM0?=
 =?utf-8?B?M09NT1BBdlpOTHdhUkUvM2VKTHBIRUZIdk5NaG4wY3FtcitwWmxjTFFoVnIy?=
 =?utf-8?B?UDNjZCsrY0pwa3NUamtvWWhLU0R5ekdLRVQ1bGV4eUhLbHdFNGFwWmd0Y05Y?=
 =?utf-8?B?bU1vamg5TlY3TXNpZy9sM2tNakYzYkwvUGpHUW1GeVRoWnphQ0RpZ0MydGZ0?=
 =?utf-8?B?ai9tR2YrU3d0OHl1TUJKUU1pZHpweThlQzc2M1ZPVDB2SnBDR0N2Mm1RNjlk?=
 =?utf-8?B?dDh2bjZDQjVBMjNaKzllN3pubURNQk9YQTZ3dVZadDhHS0VkM213UTZld2xW?=
 =?utf-8?B?dEVydUNneFJ6TDZSZkMyNzdKNXNGSi92OHA5MGdSVmVkeXRRcFlIYm5xek5p?=
 =?utf-8?B?OXJGeVRYWmJHZUNKaklOZnd4V2tEMjFTeTJBU3V5N3JDaDFTaDU4RlZkTUlQ?=
 =?utf-8?B?WEtRNCtsREhETnc0eWxBWFl0Mjd2TW1oZTFaRzdZMi96cEQ0OExnSFAwVjdy?=
 =?utf-8?B?SnhSeVdaQzdQcStDbDVPTUNRaDhpQk5YRHFJUncrMzZyOTVja0xwbnYyNTdJ?=
 =?utf-8?B?ME9EV1hvdDNYZzhPZXh4WHRIMnJ3UHRtb1RKOFJGb0YvZHpSdDZIb2tRMGpK?=
 =?utf-8?B?cEhvT1RGV2tXR0tBRzRQR1NwOG9odEQxQkp6WFlBUFppdGF1STFVbVlGSlFF?=
 =?utf-8?B?TittQ3pvZktuM1VmWGhOVkNmZG11YUJ3WGlQNGxnN2tyMnZwMFpKK3RmVnZD?=
 =?utf-8?B?bEtwOThjVGkyNHZKTk1Od1pyYk93b3VmYnkzTTJtQzM5b3BVQ0RZdDFIZjF4?=
 =?utf-8?B?QU9aM3RzU3p3QkJlMkVWUTloZktrejRXZ0NLeHBIZ1A3UEROVXpwbE82TE1N?=
 =?utf-8?B?WmpkRUFGamFHbERodVI2aTZxWjBFNDIrMWlrNmlKRkxGWVFBd2RvY0JTdjV1?=
 =?utf-8?B?RndsS1puNGh6bTBObGxuTytXeXNjN2wyT1o1NnJsbmJWR3Q0WklKbm54ejE1?=
 =?utf-8?B?V2RqVmhjRWR0Q3Q5TjFKenI4M2dzOCtSeTlqZDRWNWg0VGZ1N2RKOTV2YmlJ?=
 =?utf-8?B?OGJLZEZ1MjBxTHdxRFhJWWN1WUFseU50bHYwWVRHVmxPeDhhK2FZOW5QRi9l?=
 =?utf-8?B?MWx4YkRUb28xZFdZZEdxNExRcTh1WjE4U0RuM1g1ZVFNRXJ1RVp5Z2x4WWxT?=
 =?utf-8?B?clE9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 449bfaed-0d22-4419-5ecf-08da7a1575bb
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 14:43:03.1804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yq3bYqo+8Yx2AW85/CPRN1xyq9zvcp/s5aA7i+MMxZRnEPijoWIkcPsLrcNIuOhJYQlIILOgeUs/C4NxZkLRJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6378
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



On 8/9/22 1:21 AM, Krzysztof Kozlowski wrote:
> On 08/08/2022 18:16, Sean Anderson wrote:
>> 
>>> This entry here is not
>>> parsed for any tools and only sometimes people look at it. The questions
>>> are directed via entry in maintainers file or via git history, so you
>>> can put company email just there.
>> 
>> As I understand it, the email is simply informative. There are literally
>> hundreds of examples of mixing a "personal" copyright with a company email.
>> It is easy to find if you grep. If you are so opposed to it, then I will
>> remove the email and simply use my name.
> 
> No, no problem for me.
> 
>> 
>>>>
>>>>>> + */
>>>>>> +
>>>>>> +#ifndef __DT_BINDINGS_CLK_LYNX_10G_H
>>>>>> +#define __DT_BINDINGS_CLK_LYNX_10G_H
>>>>>> +
>>>>>> +#define LYNX10G_CLKS_PER_PLL 2
>>>>>> +
>>>>>> +#define LYNX10G_PLLa(a)		((a) * LYNX10G_CLKS_PER_PLL)
>>>>>> +#define LYNX10G_PLLa_EX_DLY(a)	((a) * LYNX10G_CLKS_PER_PLL + 1)
>>>>>
>>>>> These do not look like proper IDs for clocks for bindings. Numbering
>>>>> starts from 0 or 1 and any "a" needs to be clearly explained. What do
>>>>> you bind here?
>>>>
>>>> This matches "a" is the index of the PLL. E.g. registers PLL1RSTCTL etc.
>>>> This matches the notation used in the reference manual.
>>>
>>> This is a file for bindings, not for storing register values. There is
>>> no single need to store register values (offsets, indexes) as bindings
>>> as it is not appropriate. Therefore if you do not use it as an ID, just
>>> remove the bindings header.
>> 
>> This *is* just for IDs, as stated in the commit message. The above example
>> was only to illustrate that the clock controlled via the PLL1RSTCTL register
>> (among others) would have an ID of LYNX10G_PLLa(0).
>> 
>> If you doubt it, review the driver.
> 
> Indeed, thanks. Except the driver, where is the DTS user of these
> bindings? It's neither in bindings example, nor in the DTS patches.

The primary purpose is to allow using assigned-clocks. The reference manual
for the processor may specify that certain PLLs must be used with a certain
rate when in some configuration (this is not necessary for the LS1046A or
LS1088A, but there are restrictions for e.g. the LS1043A). Using
assigned-clock-rates allows specifying which PLL is to be used at which rate
(especially if it differs from the bootloader). Of course, the driver could
adjust this later, but it will always use the configured PLL rate before
reconfiguring anything.

--Sean
