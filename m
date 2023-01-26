Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7EE67D202
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 17:44:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2mlK23c7z3fGd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 03:44:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=EpXUKGM+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.7.44; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=EpXUKGM+;
	dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2044.outbound.protection.outlook.com [40.107.7.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2mkM20d5z3bk8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 03:43:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B09D3/hOqLMRC4T/F515GPVwSMiGqBB9oSLv7UJqIyTjbJxv9zg+N7sdEzqTEjAfw/UNJkbLtko9rCEsFGDONTVtq2MmMpe5BUkqzmf/9WFtfNidSahuBBhvKrT0FhnExia2cehBcAryuHp4tALYneUwmXlSeAGnPeYg+nrtbd0G3Cllil3THXGxHP/x2w5X6AaQMsXB+pt6LmC/XMgYU2gylV1SqXuMGkTu4dZcKCeMbJXxCSNk8AuplyMEZMipzXIhwMI/t+Tp5BbGMndcOgmWS90PHq1qbU9k6KWtEmeQBC6WepfyqGRogOUPOXJ6HGoUzuF7DVQZtF/2X+7ZLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2BnJYGi01KmqLdKa03xOZnEVuDd9ppG1HeBpRW5lbU=;
 b=QEeQKxv5a+G7bXTRXxL4kFwe6wr/VP4mYLqQjKlpT71cNMUg+B2BS9eHGaMLjZPXrkW2ISrvGWxo8HO32+cMxkLWN6RPQ71F+bfgIK4Ph6RLnM6XuSCwvUQGjHI3ZZ4iT27Q7VzBHzYELp3P4cmj7o9N0eScRFC0ncMsJ/B8yRopnsVgqLKKdCC5Rn7+gQFIzxAl6M/6R67gwCFcbwY519bsc9IoGwts3XGSMvLOkS7+U7/QPJkzzeSwTvCdq/4v7iNsedEjzWZC8cwZLffcWkP+d0GV6Hks+O0sInpT/jniWMAGlMXE9jZKKktm6TXN6aFm3VYL0TF8E612M8J4wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2BnJYGi01KmqLdKa03xOZnEVuDd9ppG1HeBpRW5lbU=;
 b=EpXUKGM+OBPobR917v2dFGYHBsDFJAuSJhSxk36kvS9G0jzetldhC2G415AUL6/ILbkz5stfneCGuoSYGU5kyC08LXtRvrDfL0iP46g8HdRIQAGWNyGbgG9jZ9ELDzg8nPACmd3KhC8+m4GY6ZoUV/BcGpgF43ogHgB7ZQJoCLkWRMz5pmEyifDx/W5NuNhuL1dtvZd6YCXl1lBSUwKplNQcwh1gpKUME9rY1OLhGe9jOuISUSZMxNNP0zTtgzaoOtP9B/dxap7oXXjMoOovKFhcE34vLh4sitY3+GsVrom+aRvnLQxn1ezI2zuZFwszMSc8YBhKG+2uG/l+1U5aEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by DU0PR03MB8244.eurprd03.prod.outlook.com (2603:10a6:10:31d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Thu, 26 Jan
 2023 16:43:31 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::6b03:ac16:24b5:9166]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::6b03:ac16:24b5:9166%2]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 16:43:31 +0000
Message-ID: <aa602661-f7f6-ca63-d8a7-d6de0e924259@seco.com>
Date: Thu, 26 Jan 2023 11:43:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v9 06/10] arm64: dts: ls1046a: Add serdes bindings
Content-Language: en-US
To: Shawn Guo <shawnguo@kernel.org>
References: <20221230000139.2846763-1-sean.anderson@seco.com>
 <20221230000139.2846763-7-sean.anderson@seco.com>
 <20230125234638.GD20713@T480>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20230125234638.GD20713@T480>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0085.namprd03.prod.outlook.com
 (2603:10b6:208:329::30) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB8847:EE_|DU0PR03MB8244:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b69d7fe-cde0-4951-2d03-08daffbc7543
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	SbEECGG/AZnuhFK0nw5enJjRYsjA04qGzAsumim0OZTh1oNThNoo/f+R4lVrnb2h4tqtfeIbk8+JZoHBHfGjZ+nN7xSbrX2j7oiT5NouJoNeLYI5bjy1IlA9c9FWfgPGwOEmIHYi0rBscFFILI/i9M/eLfoM4W4V6TekqBQxtNVWXpsfAAsQyq+ZZIQeXTT7jMG0p4vKRHcmgMsmZmkneoech0mKgSu2yJysLkmq2aEjKYd85DMeSyUGJBeFnW+pyJ4f2mM9Oxx26bX4IvZsPANjGtfED7kzCdOsHzPM26TE/I+OPMr66WuUKSqks6K7PRL86o4crvDTgq+/L/3oQw76kIuM0m4X7fzQW4mQKKWNySDapX140M3395/00364nzrJPvoLEGNFwlSNf7L1hfdKuQ4t9JyfOi3OcygmB04+Pv1fg9frNMqfb0GLmp6Vi1+abrnShHrsV/LBLRsx6hXWqKG9X/iPRy8CQqv51mkiBSqjA9jXfMfYzsckA9+2ASw/2mooR6hECZYcXtYxC8Kyvlk7oS3LPzX6CMQs8SDmjrMaxUB8KTz4sDYXdtAnZZmK8MLOFcCYaYaTAj6niBKL93R2hvzNpX44sAAwhyfrh3XmjbWNxDg4kavTb4LiyBxm7oeL1VPxR+Hd+1KaAw1bVl7aDRdpfbI/Rwn6ezf7lFWB5yf2hrGk9luIgo662GffoYJ6HuHGCfz0cxPxmgdoD8M0eTfReItlYq8KffRu0LLO0WAKj65uo2QM3noI
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(346002)(39850400004)(366004)(396003)(376002)(451199018)(5660300002)(66476007)(66556008)(6916009)(8676002)(36756003)(4326008)(54906003)(66946007)(2616005)(316002)(86362001)(38350700002)(31696002)(38100700002)(8936002)(6666004)(41300700001)(83380400001)(478600001)(7416002)(26005)(6486002)(44832011)(52116002)(53546011)(31686004)(186003)(6512007)(2906002)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?c3pRVkg2clpoUjF3TjNWVVVlYW44cm56eFhtTDBWZEUrUVJTb25kdFRta01S?=
 =?utf-8?B?WkIvZklnWWRGMytmeFJ4b0wzcnk5ejhva1FmaWx2VENYRlNHRXZkdDB4NTFN?=
 =?utf-8?B?WFg4VVdxc2VWclJlbDdod3pyTnBCc0gvcElCQjc5dVVTR3pBc2toUC9IbnVT?=
 =?utf-8?B?ejVJR1ZFazZvcXk5MFhwbkRCeFlwVGVvc1U5REgrQjdKOVp2QXI1WUFHdE5G?=
 =?utf-8?B?ZjNKaHFuZ1BkN2hmdEhmaVRvSEt5VzJnU3c1MTVEdDlzbjhRSitkWVlvWUlu?=
 =?utf-8?B?ZkpTNXhWdjlxRG5jV1hHdDFLdFpKY0VRZjcrTFZDK2lXbi9LR05VSThKVDBk?=
 =?utf-8?B?N3JacHhNQ1I4UERBRUZCekJnN3pMSUhmbEVXVXd5cFI3UEhidXlXQkZEMEUv?=
 =?utf-8?B?QVZwOUNsdVpOSVBqRGpSdjl4eURRSHpHZWVCcWlOT1dmVzRPRmtxdmNJSG5V?=
 =?utf-8?B?QlhyVHhCdVlmV1Ezb3g3K1hUWTlHQ1JwNVdDL05NQW4wZ1BabXVkUEF3MFE3?=
 =?utf-8?B?ckxQNDJyTDR0RU15YjdneTdQSWNjSzZ2V2JGVTE0VkEwVTU4VytxMDNCd2dl?=
 =?utf-8?B?QlJna3pla0pHM2puQ3dDVHpSMnRRQVIzNXdDQzd6TFdPZnV6MVJLbmROWXNt?=
 =?utf-8?B?UU1xQU5ZSTN1SlQ4bGpLNlR5MmxSYWp0a3Z3S0dZTFJHa3dJY3J5SEVMRWwy?=
 =?utf-8?B?ZllWVFNVWjBJUXZuNmRWTkZib3ZOVzh4Wkk5NXNaeitTRTgrNlJLWjFjbEJU?=
 =?utf-8?B?V3EycWYwc2k2TUd0WTkwcGo1ei8yZCtsMVR5MHdGNlVGQ1JvaWM2cXZKd1or?=
 =?utf-8?B?MkNGRml3V3NwZXEyWHBKUTZzdFlyQ1VVVE5mRno4L0tWUEYraGlXN3Bpdkl3?=
 =?utf-8?B?QlA1SFBmWnZsMkpDNUhNRmVENWFxVVovb3NMSGNHVWJyK2h1S0xDNG1tNmRa?=
 =?utf-8?B?TjNJTVpKcUtDU1ROb2pJOW82QndOTVh0eVBYMTM3bE9NTUdIOERvalZOMHBm?=
 =?utf-8?B?STl2YzF0cVpNNlprNExIQmdBMUdvcGF4V3pESEhQZVRGTzRQejBsaEx5YnFC?=
 =?utf-8?B?dGtLT0RYV1E5U3ZkV0hkem5KYm9BSG9tTTRqNXBMNDdXMUJBRm1oaytEUjcx?=
 =?utf-8?B?bUVVT0Vmd3FOT3k5L1FJdGI2aU80Q0RRbEJQdURISDBFNVJETHdWZ0Vmd2hz?=
 =?utf-8?B?d29Ed2E0NnlFMDdBbVlkQm5kUjJVQWZXRkk2aDVKVzhSVnhGekZ3cExOQXNp?=
 =?utf-8?B?S3ozYzBvdTNsbWwrWXYzdWVQaTArMUNjSzFwbUZUbnREMmdaZ29wYUVHZzFL?=
 =?utf-8?B?enZLbmVINmhOQkt6ZlRHeHdUZjhQQk1tWXZBSm9waDlwNFA2Z2w1UEs5NEhn?=
 =?utf-8?B?U0hCaTN5S0lKNTF5ZlVyc1JOYmdHMjJpYkk2NVE5eUoxbm5IV3RSTzhhN3NO?=
 =?utf-8?B?cU5tejN5ZXJ4eE1TSlZUQng2VW5EUHdDei9kcTlDeEZuSHdjZkJYeDZSNU91?=
 =?utf-8?B?MDBXYkdZaU5ZVVdyV3R3TE1VUWZ0bXZMMFVvMWVycUVYR1RnV0d5S09XVlFY?=
 =?utf-8?B?Z3ZvYkNVaThQSHdOZkxLZlZzQWljVXNVMHU1ZW5MYWhLK0RZY1dWZG5IMkxZ?=
 =?utf-8?B?UVVhU3k5MXI3aTdUTVVRYVdFTStjRkIyZmtGWkNyMC90VWgzcGRDbXZTN1lm?=
 =?utf-8?B?dy9PLzUvamxXWng5MFh3ZHMxZmhMWDlDTVdqMmlDSW03UkFWZXdvTGN0WG40?=
 =?utf-8?B?NTRHTGpPRWpvenFtNzhIV0U3QUVFSEVjZmJUT0V1bU1JbzBnRkt3M29VYXg5?=
 =?utf-8?B?dU9QRXRJdjFEdmJLbENHQ0hrT0QxZk9KbHluRG1Ia3RQemFmcVlRKzRKejlm?=
 =?utf-8?B?emNPd3FZc2JReXZxdWE0b3RGR01KVlAxTGpKdGFRUGQwdHRyNDNhVWM5MDhq?=
 =?utf-8?B?UDEzY1FDRXYrOXUybWhDZ0hFL1ROQVlXQ2JHZTloa29EUi9ZekRjemNuQVlK?=
 =?utf-8?B?SStTZ1lFYUZ6aFhLZi9BQWlzN1U3dnVSb1BiWnF6b2p0Sno3QjhHZVRXSGVU?=
 =?utf-8?B?MHIwRW5Vc0JJZmZxVHgvdHlRWXpiNnd3NFZ3S1dKRHVTY0JBSExRRFB1THJJ?=
 =?utf-8?B?L0g0Vm9acFVVZ0RXTU5hdEp6aXBiUG5kQXdTaFlvYzEyOWlqdGVZU29GVHd1?=
 =?utf-8?B?Qnc9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b69d7fe-cde0-4951-2d03-08daffbc7543
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8847.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 16:43:31.4470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xXkyxwn4LFhqpPsIltJdpm7cC9e3RlIeCfl1MbKTZl6zQW4VPO4GtbA/eA0JtDmjQAcHw2qMGsicAVHGXY1HKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8244
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

On 1/25/23 18:46, Shawn Guo wrote:
> On Thu, Dec 29, 2022 at 07:01:35PM -0500, Sean Anderson wrote:
>> This adds bindings for the SerDes devices. They are disabled by default
> 
> s/bindings/descriptions?
> 
> The term "bindings" generally means the schema/doc in
> Documentation/devicetree/bindings/.

How about "nodes"?

--Sean

> Shawn
> 
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
>> - Describe modes in device tree
>> 
>> Changes in v2:
>> - Use one phy cell for SerDes1, since no lanes can be grouped
>> - Disable SerDes by default to prevent breaking boards inadvertently.
>> 
>>  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
>> index a01e3cfec77f..12adccd5caae 100644
>> --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
>> @@ -424,6 +424,24 @@ sfp: efuse@1e80000 {
>>  			clock-names = "sfp";
>>  		};
>>  
>> +		serdes1: serdes@1ea0000 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			#clock-cells = <1>;
>> +			compatible = "fsl,ls1046a-serdes", "fsl,lynx-10g";
>> +			reg = <0x0 0x1ea0000 0x0 0x2000>;
>> +			status = "disabled";
>> +		};
>> +
>> +		serdes2: serdes@1eb0000 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			#clock-cells = <1>;
>> +			compatible = "fsl,ls1046a-serdes", "fsl,lynx-10g";
>> +			reg = <0x0 0x1eb0000 0x0 0x2000>;
>> +			status = "disabled";
>> +		};
>> +
>>  		dcfg: dcfg@1ee0000 {
>>  			compatible = "fsl,ls1046a-dcfg", "syscon";
>>  			reg = <0x0 0x1ee0000 0x0 0x1000>;
>> -- 
>> 2.35.1.1320.gc452695387.dirty
>> 

