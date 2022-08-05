Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6DA58ACFC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Aug 2022 17:21:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lzq794SHMz3bsK
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Aug 2022 01:21:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=BAtsBOUg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.22.49; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=BAtsBOUg;
	dkim-atps=neutral
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2049.outbound.protection.outlook.com [40.107.22.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lzq6Q2Bljz2yn3
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Aug 2022 01:20:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MNRuIcrMCSFSpk3cVxt/bR14xW+v18BhgJj7jC+PB2gWTCJBcLzRq2MyYgoT2G28yZXZjVWRbE929hhflSC242r8ljojp3o43CJ2HBOgWPJgyDNELdh1pLm5XmrkSu1EVlUHmL75WFUUL8TGFM945G8Io6XEulOdEApe8mBS7YXvCgqDWYGxLtJFUp3lOPXRNINGvIElHrsTQrDEcSnUzbXiFiNn5NjoH5qvmG3YT/Lz2ePH5PJmEatACIwoOop2U4hCA+fZrS5cZEXmuEj0uU+BcLR4CSEqAurg/bkXMdzzf8x7E6BH0hfYYQhCpdHNhm/emr3rq7h6fkuq3E6wsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NAY/d7GMqx+qHlDgwqhc0tak9uXwOI62ktBgfA6xH2s=;
 b=VKCKedMCGl1YXt/8qBp1PIh3ySF3RO4uT96DzyR2+mFSu6eb9COzzAPpO9Yio9s2ucYKoXLiQqTkx/lJ9iLsVH024kkrhMyyBOfZj5kLc7REfLW0fQHbuna/5HWDrRb1FsnFnJQDyuRvfHMXBV4Iog5h9Feyy+1GnoHzuQNT+6Z5tqNB2NALKUrEuFBSikV8pPhvwWREAmvGujvLYuOWmYbqojJRS5XPIS7GeX0UN8paDkWDbnDlowgmF+yQvpfDUOUtIS2lOR4BAleK0l1EqLarj0HpBocuZT6hkxA0kX/PuuRLRV//AvIEtbHuQb8BNCKVhu+t1g5Ug1W2kKh4Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NAY/d7GMqx+qHlDgwqhc0tak9uXwOI62ktBgfA6xH2s=;
 b=BAtsBOUgGPihz2m46LaDruezEGkPGB/sYcjHf6zywG4DFOpZJaqWK/0FyZGTp9IopelKWdP5Htq3NnCDbj7/+QmgzQmTUZhTs+hhESLTzZ5uKCvzdEaFEOZkrY4uV/2TwisV85jBE0xrapzo82QomG0N+Z1LXT61meflZ6LkhRnb8kS9GAcVj28E+K5xqt8u8icsZcDvVOVY0aAeo2uTkknUsEyvwspOYD11r2y1VOfrpX+a3typUrJ6zF2lDEKYLmB1UjKJMFknizNJdBq+1ZQ6QT7h/z5tPaf8fbazrgpRB8J9TIzSUGSE5FQWErQWyH4weA50bX+kkFwuc1sgBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by AM9PR03MB6866.eurprd03.prod.outlook.com (2603:10a6:20b:286::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 5 Aug
 2022 15:20:11 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2%4]) with mapi id 15.20.5504.014; Fri, 5 Aug 2022
 15:20:11 +0000
Subject: Re: [PATCH v4 2/8] dt-bindings: phy: Add Lynx 10G phy binding
To: Rob Herring <robh@kernel.org>
References: <20220804220602.477589-1-sean.anderson@seco.com>
 <20220804220602.477589-3-sean.anderson@seco.com>
 <1659708590.965354.1802482.nullmailer@robh.at.kernel.org>
From: Sean Anderson <sean.anderson@seco.com>
Message-ID: <3010b7c1-6018-7ebb-3e20-b885df0c4afc@seco.com>
Date: Fri, 5 Aug 2022 11:20:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1659708590.965354.1802482.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:208:c0::26) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90d50913-e906-4d35-1641-08da76f5fcf6
X-MS-TrafficTypeDiagnostic: AM9PR03MB6866:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	bELJ91OiwexK+6coHAaFI0ElBCZHitVkwAsVNZyioRCCSMbZ/5M7ImLrwetbdm8CKX6onwY+owDg7H1o37yPsyAfC4btIRz5kE5bMCJaoRZlCVYDDii21H+RvQP94yZnRroMg0+Faf1Y/YMrksKYaKR1d2mgiJuZqHJnCHyyBFh9PbiNuDTHcKY9aWwy81VhP41zc/GEmSeUuInFcjpb8rPYS9Dk7DPBbBpfG9/c0cxAnR1PzO0lnXbSfuYksuAB3g+u/QTlsC8PLQS7k/YYX2fsubg9BaM3ErZjISgS/f44239oGe4Ympu3pg+EHhELaYWLsBeWyyH1QxmNCPtOrvv/g4x1QY3GrUEjErOibb0npa+r5NV5R8s9skydLhJDaCQOj2iF91ni+67qKVH975vTwZDh5G3K/juOUe53WImM49YsLGIqx0oZ6+Y28Jfrz8cOVNQdOjbWQbs/fLI4QjD2x7VWNVrf6Nz0mjhxfNzNTAqRPGDO2o5+TqAOOPllPXwvpxDQJPYNZsQCOCHqYPvhzRF840qRrN3NH5TpZQov1MjYQuPKIoLv02zCnbFWjW21MYNe6RwuyAR60VlAzzgeYN2j+ef+M+9jUUJbKfaWRcr1Vg3CUoeTgZFfImVBMUtqcaNnoi7xcyxAJ9de3m7AN+Dt0uxvuIRiPB1CIypcolDXcKjYiUMdpbk9dcOhAse4JI2SdBzTm59ejmuZVCxbFmN3bZ0lD+rT2JZ/tI7IEvNumkoKJntzGlmqe6df8XM/0JJQ2Lf7XryoEFUxgWvGppb7y+Fs9Pys4U245pb6O9PYEf/LR8CqRVP1KX7sVpIcdLiORAsvSVZHnBteF+YV+mypClDCSEfijG0FzwxrGRyFVtvwu7k5VMzAZlVF
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(136003)(396003)(346002)(39850400004)(366004)(44832011)(7416002)(316002)(6916009)(5660300002)(54906003)(38100700002)(66946007)(36756003)(41300700001)(66476007)(8676002)(66556008)(4326008)(478600001)(8936002)(6486002)(31686004)(186003)(2616005)(6666004)(2906002)(6506007)(6512007)(26005)(52116002)(53546011)(83380400001)(38350700002)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?ckRDemFHVElkZTRFdDR5Ti84bFF6MDBCa3pkVm1yM3A4VVNXU3ZtdWVaUExS?=
 =?utf-8?B?c1hIZXZ1akhXWldZK01rQVRNUjRQSmJoYnE4QWhzTlE0Y0wxT3NDd1dSakJO?=
 =?utf-8?B?RVp1a1BFNjVBL0FCVmUvb2RCaFVFZ3VNNkZwWmNma09FWFNHemtQSkE0cVFT?=
 =?utf-8?B?eUpKcnJtaDNUU3hhemgyM1NSWnM0NExha0NpeW15dWFJSktIM3VDbjU5UXhl?=
 =?utf-8?B?c08vdlpmYmpzS2N4b0JSbzFmTERUaE1PT2VVbXFsUjhVNTZ4TVU0NVF1dUNl?=
 =?utf-8?B?cnpLczRWMjZkSU5BcVFGbFo5ekhQb2NXajRDMXBnWWNrbXpaTTNXNkdtY0pW?=
 =?utf-8?B?aWR0R2x3MmQyWTVUKzRKVkU2SWE4NFBQcURRdHVDSDJ3eWc1UEZuS1hLZHVS?=
 =?utf-8?B?OVlZYnQrcGJPUlk4aVdhL1FsdC9GYUVtZk4wSEVibEErZHVHNlZLbWlpK0R2?=
 =?utf-8?B?L3FYTFp1N0dtUThJcUVLYnJYOHBxdHk4N3preWtnU1FGS0JPMXNWZTQ2emlr?=
 =?utf-8?B?Z1JrNmcvQ29YdytRS2loK1ZLb3FkMVFiNnErZXFaSURzZW9LT1VLM3dwS3E0?=
 =?utf-8?B?bm9wMnMzNGpOcXl6OTZnZkNOZ29uQkVVcCtGRUxTMUlXR051TStlZXZuN1Yr?=
 =?utf-8?B?dFZ2a1JzdW83VXJqbUlTdVNjNHA0M0ZjY2VjQjdwZkpyaVVDd0p1dFBkb3BP?=
 =?utf-8?B?K1NUUUw4bGpPaTV1SmJidFJuWWpMVk93NEluak94OEJ1dFJyYTR5VkRIVjIv?=
 =?utf-8?B?MGJmK3pmc3hFcDZXRGhzUXVnOTh3bDRaeG16WmJUVFdBOXdnSjJPWXNIRWFp?=
 =?utf-8?B?YVdIVktMWUFTQmhUVGI2dFQxaGpIN2pZYTJSQnQvdFNrZUpCdHZwdVo2MVZj?=
 =?utf-8?B?Vm5wK3VOaTFZQ1JEYXZxVXlYUDh2SkxtQnB5RU9VMG04a3hCU0czaUpZaTRT?=
 =?utf-8?B?OENKQTZJT3QvSXBIaERSZWROUDRGMTYzdm5GNXFjd2tpTkxubDB3dVN0QkR2?=
 =?utf-8?B?eWhFNTZsQWw1VGk3VGk1SDZsZ3kvZ0JXWVZCMTNjclFpWlNHcDZKbXhsd1RN?=
 =?utf-8?B?cWNzZFpZaVU2N09oZ0ZVaTNobUhPUHY4bWZCUWh4b1JGTmE4bUhXQUhDRzg3?=
 =?utf-8?B?ZGdwWjRLN0tYek5uaEZLYmxqZWxkclMxbmFhM2RjYjFtRUpDaEYrNkdjS1NV?=
 =?utf-8?B?eExBMmlLNzNVT3d6THlRZmV0aDBFV3N6emxaUWFaVjJGamU0RzVGdFMrTmxY?=
 =?utf-8?B?VUxTUHRUQjFGaXhJekJFV3FCRDNtQkdadzlmWXA0Z3phVTAyVVNZSTVLYzRX?=
 =?utf-8?B?aDgrb3FFSG1mSlVieGNwdXZ5NnkxRUtvQUZFTVhCYWxlUjYvdWFwdzQyUU9N?=
 =?utf-8?B?eHlEcjBiSjROZU1VZzNPUWJ1SFBSL1NjdHRFY05SbGZuK3I2RjN2anJlNEVM?=
 =?utf-8?B?K1ZRL09KeXYwZG9lTVZ5bFJlT2E2Yk1OOWlTMmt0QWViNUgrc0hvbk8zMVlJ?=
 =?utf-8?B?b1JKbElQOEhVQnJzWXh5NEhzQ0dZT0J0QmE0d0pVbFNHWDd0WEVDWXpqNjZI?=
 =?utf-8?B?ekkrY0xEOEROMjNLMFdXZ0JBZHVNTmFsb1lMdHdQQzU5cisvbnd3WElwNWFN?=
 =?utf-8?B?cUhXQktveU84VU0ySU9QL1hoamRqSnZpY3hLQ29wR21DK2toenM4NHViMElU?=
 =?utf-8?B?UVZ0NngzMHJjaWUxbmZ0ZDRkV2pVa2U2RzVleEN0bXhQODYrSWZoaFozaFpS?=
 =?utf-8?B?K2RsZ0lUQXU0SzM4Rk1aallLTzk1WnplNWw3UXdoN2QyV1VldVlSQitycnZH?=
 =?utf-8?B?c1VrWEt0NjZYMUNITDlPVDZZK1MzMlM2S1lkM3hBcG4waWdFdTJCUmdxenNm?=
 =?utf-8?B?RWFLeDVSNERjdUZsUkhERnl3Q296ZlF0LzY3V0ZyTHUvVk0vOXhDQi9VT1V4?=
 =?utf-8?B?UFBaQTJMQUlBUzdlcXhjWGZhQ1REanBTMXhIMFRCZmhSbVJWRXlRbmp3d2pt?=
 =?utf-8?B?UW53aDd5WlJod2l1dUFlcmpGdWtPTSt6VVNVRW1NTlRUSUV1aVo2MUova0lJ?=
 =?utf-8?B?UG9GZzd1cFVDdmpXdU8vUFR3Q3VGT0dxMWNtc3IyVHZYMm45V0NxT2hPRjFq?=
 =?utf-8?B?TU5nQ29PMHpITFpBNnJySmU5WTN1OUpjc2VUMjZzZnRtS3Z1RTBwWVJQTS9q?=
 =?utf-8?B?Vmc9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d50913-e906-4d35-1641-08da76f5fcf6
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 15:20:11.0959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5KdZKSQAhnXQqltdMRWKOHyHyYDzizythdWELMDuWKPaeh/hQhq9iijaxOOJcSS86UuYIKttdbFlFd29RGOfCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6866
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 8/5/22 10:09 AM, Rob Herring wrote:
> On Thu, 04 Aug 2022 18:05:56 -0400, Sean Anderson wrote:
>> This adds a binding for the SerDes module found on QorIQ processors.
>> Each phy is a subnode of the top-level device, possibly supporting
>> multiple lanes and protocols. This "thick" #phy-cells is used due to
>> allow for better organization of parameters. Note that the particular
>> parameters necessary to select a protocol-controller/lane combination
>> vary across different SoCs, and even within different SerDes on the same
>> SoC.
>> 
>> The driver is designed to be able to completely reconfigure lanes at
>> runtime. Generally, the phy consumer can select the appropriate
>> protocol using set_mode.
>> 
>> There are two PLLs, each of which can be used as the master clock for
>> each lane. Each PLL has its own reference. For the moment they are
>> required, because it simplifies the driver implementation. Absent
>> reference clocks can be modeled by a fixed-clock with a rate of 0.
>> 
>> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>> ---
>> 
>> Changes in v4:
>> - Use subnodes to describe lane configuration, instead of describing
>>   PCCRs. This is the same style used by phy-cadence-sierra et al.
>> 
>> Changes in v3:
>> - Manually expand yaml references
>> - Add mode configuration to device tree
>> 
>> Changes in v2:
>> - Rename to fsl,lynx-10g.yaml
>> - Refer to the device in the documentation, rather than the binding
>> - Move compatible first
>> - Document phy cells in the description
>> - Allow a value of 1 for phy-cells. This allows for compatibility with
>>   the similar (but according to Ioana Ciornei different enough) lynx-28g
>>   binding.
>> - Remove minItems
>> - Use list for clock-names
>> - Fix example binding having too many cells in regs
>> - Add #clock-cells. This will allow using assigned-clocks* to configure
>>   the PLLs.
>> - Document the structure of the compatible strings
>> 
>>  .../devicetree/bindings/phy/fsl,lynx-10g.yaml | 236 ++++++++++++++++++
>>  1 file changed, 236 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
>> 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Error: Documentation/devicetree/bindings/phy/fsl,lynx-10g.example.dts:51.27-28 syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:383: Documentation/devicetree/bindings/phy/fsl,lynx-10g.example.dtb] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1404: dt_binding_check] Error 2
> 

This error occurs because the previous patch has not been applied.

--Sean
