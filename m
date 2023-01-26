Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEF667D39D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 18:55:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2pKQ1BZkz3fHF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 04:55:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=p5Gj1mLQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.22.70; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=p5Gj1mLQ;
	dkim-atps=neutral
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2070.outbound.protection.outlook.com [40.107.22.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2pJR1sLrz3fCJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 04:55:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hjpyKjPtMZnfPW6amQmZe7A3humYZmP/ZAEmLCv2o6RIzw8dPwtKw2k07fmER0qpRv/dkYPruluYFCgJOBWSbsoBnd54uRqFsle/v2cdPrR0jtnb+TS8jZMJoWmWHKi0JcXsO/+pukDIEMBqkTPw9bRnIXsIu8Tvdek4RwgI/0tHTFXGwpZZ+LANALhE44DD7rNmvUwmqDtCD7T9mTXDRosXx/FIIs5kIcOMxf2q89eiSrzyKKQBqfOG9eNz4R7QD+bpjptc8x6UGCiJYHaAVhTKj+G+tIoXXgbmDs0FKuaxdw1Ee0GiIPB2yvzYFO33ERaKJs8fn42yu7nAAhinKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3g8X3kjIPTZQBMK6EsNhgJ6adGclJFxtdyXchZwPt6k=;
 b=Tujne/Bp3GJl+JCd9lUkH+/it7Eb8mUd7XMC1sUE/KNNOGXHqlJfD/IzF7EvuHICmvMApHVJFEmW1uVO2efo8/CxmeErYt3cf5nNJv3M4RU6CmyAO5CX4WtP+X/GW1aodOZATdBHnhcFtxmBuxYRmXZ343j9/p8gSGbwgYTHOHOcUZ7ZSZQZ9D1VphiY1q9JLrEaFSzv4RfNxpAdDqQiNyNfRBrlbBtFKrsBQC1VkQliGcD71wRsMyjp34J4h5Px15I51AeDQUP9V1WxQivc23jZD7KN64A7P36gglFmq58/xrk9jAVlu+ejTY/sT3H8LFUd+As7moAG4SWplzI7gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3g8X3kjIPTZQBMK6EsNhgJ6adGclJFxtdyXchZwPt6k=;
 b=p5Gj1mLQ+FOC8U0sHOjVMhxhqzh2h/R1JPZIm8qz33y3e9Xiu0Hp1JuG7CR7OzYnC25e+2WSg6APFd+XL2oBunZctxgFgDvEYh1M/47jx5A/BEHleHCBiN57OJ3EnAIyeqT0yiwAC0MkkPjBaPeKvArKh5jdFG3Bp+6RsfykckE420fRNOmTaZ4qpLdOToKGvT15ArVX3AdbIS+e1o/dsXDil6JnzDL4PbxajPcU1TJLdwHr/H6cD20vVf1jaHQaQ9btCujNwXC5vR6f7q/PpcQDad/d7hdgHqBljb6+AdrMP1CRD0mR/UBH3q5tGL7wgK1Kfx+n7TpS4au2lk98KQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS8PR03MB9769.eurprd03.prod.outlook.com (2603:10a6:20b:61e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 17:54:40 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::6b03:ac16:24b5:9166]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::6b03:ac16:24b5:9166%2]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 17:54:40 +0000
Message-ID: <098f9ff1-7a13-3469-939f-eb96b81e6454@seco.com>
Date: Thu, 26 Jan 2023 12:54:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v9 08/10] arm64: dts: ls1088a: Add serdes bindings
Content-Language: en-US
To: Shawn Guo <shawnguo@kernel.org>
References: <20221230000139.2846763-1-sean.anderson@seco.com>
 <20221230000139.2846763-9-sean.anderson@seco.com>
 <20230125234845.GE20713@T480>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20230125234845.GE20713@T480>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0334.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::9) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB8847:EE_|AS8PR03MB9769:EE_
X-MS-Office365-Filtering-Correlation-Id: fccce392-ac6c-48a0-2348-08daffc665f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	DeBumu+bceg4O4NMUlRK2h+noFF33diVYKj+cBWVJ5fd5+EGMGIM+2i6P8YOTn4wGRddK9ITjEegCwmx8lx4bR5VrePpkfMXwhv9jDi+6TDUfxOKL9D2xS5ILQfT429CiG8EgHWeaF/2owarJm7DScMlcugeZ8Vc3hIAzGJeKPtaU6WGfcsgHmFZvSo9na1xVMeeAeNt8ZcpGRh+LqgdcbaFknlFvv1ixZBLUlsFMYnWxjcs/W4fJV6k0olDmU8RW2AQDj6MjCtswOto+dhk8yugqs5GAVAZ7fvJBESBuR8sMrFpH/EU6uuv1vQhtGrySi6AwWWfd9AB1UHUrng7TOad2Jkcf3j2e7RZtMV8fq7Vx013vB3X+kAkKw03+zenPc4MfygbBN22B6HhM9d5C7kTMMFyXFAMYJnil5iYosV+WjXWm+vtdlQOlx7otYtlZUa2kwSaU3JpWNvi+rOH2MmjaGkw6PJCab++Tha4qmrfm/oCDE5gUJM/7zEda3LbmfhKR9ysnN3YZLJ8x9T9JaHnDsRdf2XnvxwE2NQIGlsjayLXOWe0XUcoRJC9s/Pus/7rmWZLYRjnWl1TDKqZQarLj7/fN6We8IqOUhdn74M6V1MEOyYpVcyA2bkRGz+o1WPqLeFCWrzSg6gEx6mQvukQjBoMgz3yZckTiNnqs6AkUjvHCejQK4N0uHJwyt/4YSBw3tCMlwETfFK+gJYZNSxY8ZeFQ/zQ1gpEf3WWfqsOZcrNSeS3G308G/5wz7o5
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(366004)(396003)(346002)(39850400004)(376002)(451199018)(52116002)(6486002)(478600001)(186003)(31686004)(26005)(6512007)(2616005)(83380400001)(6666004)(316002)(54906003)(41300700001)(8676002)(38100700002)(38350700002)(6506007)(53546011)(86362001)(36756003)(5660300002)(7416002)(44832011)(8936002)(4326008)(66946007)(6916009)(31696002)(66556008)(66476007)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?OXY1SnRKandRRTZMUjFObXBhV3VZbFhCMzRWUHpjYW9VOUR3TWdxK3B0U0hE?=
 =?utf-8?B?RjhHTGpKL1MxWnBDbWIwL09CZVBiSlJVZ3Y4QzdCTXZLb3pOd2krcGh5c2li?=
 =?utf-8?B?UWRsNzNRZ1BoNHhROFFFSmRWeERuTGp0QjhBYm5PN3BoaFNPSkRRc0tteGZr?=
 =?utf-8?B?dUpZNCt1cWRJa3daOGIyQnpxRDV6TzZFTDZ5alBDMVQ5L1JuL3FGcXdidjZE?=
 =?utf-8?B?QThaK1dtcTExU3QyeDFteDVQZElOSkIvRktxaTJ1WGViMWpoZXNtL2lQODRw?=
 =?utf-8?B?c2doSzZCdmQ0SkpLMVNGQTUrSHZHdnRSS1hCdDhnTjduUmpGRW9vM05Ibk5i?=
 =?utf-8?B?NTJMcGg3M1RHbksraVVobVk5RDFEZVp6WjVyY2E3YkYvU00wdEpRaFc5akFl?=
 =?utf-8?B?V1dzcmpNYVU3TFFERGh0N2RZTklyM0pzNmFuZTBEbmlXeU5HN0E3SGdSQWhn?=
 =?utf-8?B?QVJVa2lWUzhJVHkwc0VPallyQ3ZBaUpXVThnUFdvdnBGT2d3d1dnRGdmTnN3?=
 =?utf-8?B?eVBZSmlxRER5blpTZ1hMNnZTVWduRlNEajlxa0NoR0ZjRnZPclpwWWFObjRi?=
 =?utf-8?B?M2VSWVdmK254K0wvQXZWYnRxMlpEck02aVJqZ2xSZVN5d3IwcFRkUFd5cDFy?=
 =?utf-8?B?TDRYU3ROb3IwVzZua3pML1RhbndaM3RFdU5DR0lKU1BHdSttczJGSWJRVjV0?=
 =?utf-8?B?L0VvVkJIRWpyVHB6a0pRUDI2eFN2NGRjdkVwNmdybXdCNXBmdWtUMXhlZENX?=
 =?utf-8?B?bG9yOUI3ajNjMHhCUG9qT2x1OE4ybmcwRGxwSm4vNVluSFh2NklCZkIyU0hz?=
 =?utf-8?B?bFozZ3lvYWt6SWpwbVkraFQ5aHZSditEZHJNZEFQZTlleWtPNExKbWxOTzEr?=
 =?utf-8?B?Ni9zRWVSUTRqbWNwWXVldXQyZnU5bE9PSE1NdHEzYWQ0bDYzenpxQUF5N1dF?=
 =?utf-8?B?S0JaTnFScVpGNTFhNmlRcmNkYzlGNnBYRzM3UFo4TWN6eU1yZ3RoTk1DamRP?=
 =?utf-8?B?bWd5UmVrOVZ2aGFCZ2FGZXY1cHgxay9aVThsanhiQjJyalB3OC9rQy9KL0Vq?=
 =?utf-8?B?VGZseWc4M1ZKbW5RWFl1bG8rUTBaYlFhNGhTWjU0akdrMWtCY2FJbXU5OE5I?=
 =?utf-8?B?ZE1EbGNsT3E1MDlmelNmZ3VzMVY1K01pUnp6OWtqMlgzblJ2WUV6dXk3REgy?=
 =?utf-8?B?RnFLVTJUYnY4cGtwSzE3aWZPb3JtRlcxOUMzNDFWWG02Z29WK0VSVklQOHgv?=
 =?utf-8?B?UnkzUFpwZm1kQnZnNlVZanRBbHZOZHlJdGYzZXlJd1p0Q0lOZ2djb29qMjQ0?=
 =?utf-8?B?ZU9wY1h1RktQb1podllJSXI4a3VLd2NUbnFEUkFnNGIrd2x5QTRvQUZPYTFx?=
 =?utf-8?B?Z09LZnFlUnhVSFRCUjgxYlBQK3RRUy9lOW9uaENJUjdsa2xwZ3U2QkFndytS?=
 =?utf-8?B?TVprM2NjdTVqVTM3ckYzTFUxOTFma3ZwT2FnTzdoSEE2YlM2cXpRZkl4SHFm?=
 =?utf-8?B?bC9pVmY4SDZUMmhJVzByS1NMV3ZKdE1scXRFU21lK0tzQjZPZk1CUFpJNmRt?=
 =?utf-8?B?VFJTTXVDcTJCZFYyUURrdWk2UEpWSmhtSUZnOHQxZGxnSUg4SWtVWVR1b3Iy?=
 =?utf-8?B?RWdjTHdTQ3o0Q24rdHl1YlVZcGJOU2NmaTlReElBQU1hNVVFTHcvU0hSQ0cv?=
 =?utf-8?B?SDJFTlFVQXJUWnhLajZpSVpwTlF5aW9zc2lRUUtUWHBTZm1SS1ZJakJkQUUx?=
 =?utf-8?B?SHZETnZnREdNR3hSa20wM2hWVGVGM1d3N0NuZ1pRZmgzVjl4SDVSbk1jODNQ?=
 =?utf-8?B?a3Y0WG9payt0SmRaWEhqN2w2MjVyc2hEN09xY0YwZHFBRTUzaDNCZzlSQkU3?=
 =?utf-8?B?bFo3ckpzcVNya3FTWTVWTHhlUzdmT2VhTjZYa05WU09vajVBcFVrMFFtT0VM?=
 =?utf-8?B?WkRhNHROcXJBMHRBUGhCSTRhY3JHSHNTeDhsb2RHVERpZDNxRloyYUJkL1Mr?=
 =?utf-8?B?clpzcUc0K1hHRGRPYTRRMTdSc2FNc1prUlh5eHJSN0hNTEdWaFhZKzZYWStq?=
 =?utf-8?B?U1I4ZDBQWTZlL282UGRRZ0x4Yi93RVAxUWU0VDViWGo3UENUbXhTeUxHSnMz?=
 =?utf-8?B?Sm1Rc2VxWHVFUmd3bm1udWdqTmNTZkJSdGc2WEdkVkJ0aFp5YnozakFLVDcx?=
 =?utf-8?B?S3c9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fccce392-ac6c-48a0-2348-08daffc665f6
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8847.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 17:54:40.7302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gC6+6SwugpjVvp22CAZuwNGztGkWWMao7HUqWrMK85jKTYQPeQgXN/2Rr9gddklL8jvJhMNboTWvsX/cctSiDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9769
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Li Yang <leoyang.li@nxp.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/25/23 18:48, Shawn Guo wrote:
> On Thu, Dec 29, 2022 at 07:01:37PM -0500, Sean Anderson wrote:
>> This adds bindings for the SerDes devices. They are disabled by default
>> to prevent any breakage on existing boards.
>> 
>> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>> ---
>> 
>> (no changes since v4)
>> 
>> Changes in v4:
>> - Convert to new bindings
>> 
>> Changes in v3:
>> - New
>> 
>>  arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
>> index 260d045dbd9a..ecf9d830e36f 100644
>> --- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
>> @@ -238,6 +238,24 @@ reset: syscon@1e60000 {
>>  			reg = <0x0 0x1e60000 0x0 0x10000>;
>>  		};
>>  
>> +		serdes1: serdes@1ea0000 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			#clock-cells = <1>;
>> +			compatible = "fsl,ls1088a-serdes", "fsl,lynx-10g";
>> +			reg = <0x0 0x1ea0000 0x0 0x2000>;
> 
> Can we start the properties with compatible (and reg) like most of other
> device nodes?

Sure.

--Sean

>> +			status = "disabled";
>> +		};
>> +
>> +		serdes2: serdes@1eb0000 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			#clock-cells = <1>;
>> +			compatible = "fsl,ls1088a-serdes", "fsl,lynx-10g";
>> +			reg = <0x0 0x1eb0000 0x0 0x2000>;
>> +			status = "disabled";
>> +		};
>> +
>>  		isc: syscon@1f70000 {
>>  			compatible = "fsl,ls1088a-isc", "syscon";
>>  			reg = <0x0 0x1f70000 0x0 0x10000>;
>> -- 
>> 2.35.1.1320.gc452695387.dirty
>> 

