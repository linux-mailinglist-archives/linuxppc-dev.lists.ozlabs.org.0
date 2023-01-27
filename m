Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9552567EB4B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 17:43:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3NgY3YWRz3fJS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 03:43:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=kdLS8JZE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.7.80; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=kdLS8JZE;
	dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2080.outbound.protection.outlook.com [40.107.7.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3NfZ2zR9z2yNX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 03:42:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVfO6WP00NtQK4CQ22FHvjrxpODHl7X5YM9yNLT+YYDCvUc2TajEWL8q/4KRKxX3fnX00ZnQCe2qrDAa7JVwgbJfitg4hRD0X8b+IjFJuESgUTjCqyqNX2qYt2t65vMf+r4CahYqZaphZb1qBSxwTQ9XjRIHbGynDOYHrpIKlNY8IBeoiI2pzUndXybDcbGaRY4wkOSLI4kr2cNnVaglv+SSKe7WGDLweKt+SBSNQ9JLPiMFbxdBcaIyvmDZoDwILqPorzjpG6ZtG847IbhcxJyW0gsDmm6SfK8n9ChrvOCy9vO7F9p22m8JF1MAFHCy/NZXCyW4HQoSDFcrsmXCkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2cLTzsOXzM0m5QASMXn7q4xN/UWBIvVsUctaplkBqhI=;
 b=JC+n0MNp++YCvVTYWW+h3SLGTKSMj1v0qcNbAWKE8AF2uf7dreBzqtsgAJXD9jRdzlJY/BP5fb0Yu2beELWlsyBpggBzP845qTbFqYE6z/1VWb1qgW3voPZ6Fb4fZ4Bz4Tb4MLVtHS9GykC+ckaudYVD8VHbXlx+d6GzNEjr3rDDql445T25bmiHZfFfoVLIMQGZSWPRXWtvIyCYBKv78C+UNeQ0yd2Ttu+oKrRhlZQ/BzaVM5W96AJetUaee5aLWXybENuLKCtfz6a83c6YWB4xVJYNtRzeC9Vqq3YuH6Hp7YqOOAqfYQ2/fSfwrsIMgFbsZ+xSPe14C7btk+Woyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2cLTzsOXzM0m5QASMXn7q4xN/UWBIvVsUctaplkBqhI=;
 b=kdLS8JZEe6lry5X305H19Fo1L91NK7lj4a0uTKpEHSx2t7YwfkVIb9odo2TVtGfMnt133L2wanTEXavCr9SYlXCpwcJgz3N5eMXSHVM5pemy8SQ38U3ej82uqR2mfhFgSHXadL8T0m62N3/0efhnhZgbENxlnoCHP/vF428me+MlpA7ZuW8oSVXwml8UTLPar9/qMOJ0w1f4LaDdM3fw2OFX3yeE5zRnz4TXXeIuuimBd4VihpihsFIbH3lXUgkel1n6/E0rF+WdXK7Bw/g3BtEGRPzyll1le4EWeNkMkKfxeOOXcjFTfrnDPZvDIF0vyaDPcWXOHVLGPJb3oNotIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS8PR03MB10084.eurprd03.prod.outlook.com (2603:10a6:20b:628::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.28; Fri, 27 Jan
 2023 16:42:23 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::6b03:ac16:24b5:9166]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::6b03:ac16:24b5:9166%2]) with mapi id 15.20.6043.022; Fri, 27 Jan 2023
 16:42:23 +0000
Message-ID: <01d344a6-5e54-9762-3737-05b930fc2fd7@seco.com>
Date: Fri, 27 Jan 2023 11:42:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v9 07/10] arm64: dts: ls1046ardb: Add serdes bindings
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>
References: <20221230000139.2846763-1-sean.anderson@seco.com>
 <20221230000139.2846763-8-sean.anderson@seco.com>
 <20230125234335.GC20713@T480> <8074f0be-8a70-a937-49f2-123e0bfc6218@seco.com>
 <20230127075248.GL20713@T480> <20a9070f-9673-2f51-97df-68e78c37d894@seco.com>
 <a3c3603f-7401-aeb2-4b58-86c3ca778c6c@linaro.org>
 <6ad9bc2a-910a-357c-fd7a-cf4ffe13ddb0@seco.com>
 <8da6b154-f799-4a33-d455-f42e30ad8940@linaro.org>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <8da6b154-f799-4a33-d455-f42e30ad8940@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR13CA0017.namprd13.prod.outlook.com
 (2603:10b6:208:160::30) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB8847:EE_|AS8PR03MB10084:EE_
X-MS-Office365-Filtering-Correlation-Id: 4568b238-e7cd-4bbe-c793-08db00857752
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	gsOCVLo7wqbHYCTUrJlZmus5kkQf+WFyWDhVA/nv81ltFqDTf5cJpT7Fg9+skOyLUP6VPoQ42n3B9WFfmmez+/hJDoxk06mDtDUb60bZVjtl0GgFUOUBncVIKv4wEsPsHVj4c5Sv6x6re/rNQQhHGvmWguKnNh/Kpnlb9pSbF3ehRvQ6NN4/fBYaQSDjH+YIeqHt8vH9me9d0Jq/Rck0AtlnvZr0GT8yYQkvuioIBz4XTrjmaqkL2IUYFF3ir2TTqN8mqvZjnu4htFlJt60sMeL91hTH/gUM7eaxohCtDOP5jNBpVxVr9Pbcrr1Lm6J4BzMkiBKgMhNTEyUNhN/Ll3PaCEHp+tZLUS5yCUwcN+XokC8P/CoAQ1Lr04JC3LmQqVQxKshyZ7YDPPNMm/J2f/sbFcdyMqhhR7kN9z4ntQrw/nwYCCRGyKSjk8d2xHYjYjh3XJt8ZLnxBReCclADE5vE8WQTRh4d2zh9VG0dH+h08WV6rauhYfo3BaCG/HD9RdpAKBRncX81umDgIZbWz/5Vcxt3jQSTu/sWgCBmlDZXNhZJzBcrpqTAPYpMYXIcQo1OgRATRWtAFdMwnnIvlxSJ1OIQ2CPuu8JiTUI+JWlj2mDX/JFjR53mM7Sgg6tsRZu1pPtq+BE7kdb3BwgDu6DEq2nhQj4Ul6wI3bvr+SmSzlB25DC1GyL6qq1m0oVzCnWfkTLrVk7/Y4i6xi9Q218dmMi5Vkq6GsURBf9t5KOT5zqr0RHhb2AlN87DF60TCspUs2bbWVKnJycb/MOidg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(39850400004)(396003)(376002)(346002)(136003)(451199018)(2616005)(86362001)(31696002)(38100700002)(44832011)(4326008)(186003)(5660300002)(26005)(478600001)(66946007)(8676002)(66556008)(6486002)(52116002)(54906003)(6666004)(6512007)(6506007)(110136005)(66476007)(38350700002)(53546011)(2906002)(41300700001)(316002)(8936002)(7416002)(36756003)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?WENRejY2dXpyS3QxaUVDRkdwaU1TcEtsNWdLSjRkb2lHdHlSa3d2NnpRYnpO?=
 =?utf-8?B?UTJBNU1GSGZGSmdMUGt4dFNqNW1jQzlXQ3B5TXVISksyOWxNd1IwY25ncnhj?=
 =?utf-8?B?NGZZL3l1THBCRmR2U1BjK0pIOVh0SjVNb2loQjNNNHQraDhZTzVZSDlUK0xT?=
 =?utf-8?B?c1F3c2xNTlUwdVZjb2xRMW9NNEhVWGtMN2Z3N0prSW41cjBZMFh1am1UaXpi?=
 =?utf-8?B?THkwOE00NWlENlhxaTc3VGFYdG16UFlCV0tjMXprUTlQQTRwRkl1ZkdtVE9k?=
 =?utf-8?B?Wm4wZkV1RCthU25DSlB4YlRlaG1qTkdwUW96OXVyekw4WXNnVGZpdjFpWDE3?=
 =?utf-8?B?QXhUdFA0YTZZQkxwUWNiOVR2Qks4SWxZdUtWSVB3RmtXd1YwMDZlRUlRUlgr?=
 =?utf-8?B?NWR3S0VoR2xHT2ZVUHZIZDdPQ0NNTlhRWkladmRsWURJTzdTYTNzc3BFc2dC?=
 =?utf-8?B?TGsrK0RiRXEyMFRUZnhmbnJ6c0NWMW1UUkFnTjhBY2h2UnhDc0ZKcEdCTEs0?=
 =?utf-8?B?aVpEK0k3RkJrcDk3dGs2NVNQNVJVaDRDVW1zMjE3UGVkekNTV2xTZ0VuYTN3?=
 =?utf-8?B?RzZOTEFSbGdDVHJVQzB2aTlabmRnRXhLQWhRTDRPZFJYVk80ZGdsK3R1Rll2?=
 =?utf-8?B?Zy9EQW14UWc3UlFkQzRKVldIOXhVNjVyWDdjZm81OXM1bGZkZnJuV1dVSU1i?=
 =?utf-8?B?ejdVTnAwUm5NS2pYTUhtZGZwWCtwNnZWdUdPd1lGczhKSFZSVTZrREVidDdk?=
 =?utf-8?B?VXhkUjVOTUNXeG5LN2VkUWo1cnpKajlXTUNCd0JsaFAzc3pTZ21NOUIrY0pE?=
 =?utf-8?B?bUpqNEVtdnZ4clFPcHdFUzA4c29XM0ZZd2VGTXF6REV6dGY4WVIvZkovbERB?=
 =?utf-8?B?cmZKNTB1UkJXOWZlYkxLTy9LekVGVmlkR1VUY1dUc081c1ArY3NHdlhyOUhi?=
 =?utf-8?B?d3MxMFlTRnUxdElFR2ZMWGJOVkhQakpnQTVEOFJOZWtHOVVMSXYwb3YwMUVK?=
 =?utf-8?B?czNnUldFK3Ntck9kM3h4Q1Jza08vb3N0L2JKVVdMdzFRL0NzTHcxQWFmTWxw?=
 =?utf-8?B?REFYeDdGT3EvZHdXQmVBTUlQUkw0MDdPUEFHNldSMU9XL1JnUUN3RFpOeW1q?=
 =?utf-8?B?WkhjMThEaVQzK2o2OXZ3dTlFVGJ4eDRES0VDd0VvaTI0a3N1L2gyK2lNa3Fw?=
 =?utf-8?B?T2MzOVk5aFU0dHBrZW1zOWU2Yk4wY2hEQW15ZnIwa1VPWE1KalRXNzlHMHI5?=
 =?utf-8?B?RnorcHc2VVdxcDJjZEZmR3lqNTBZU3AwL29Zd0Q2cTZoOHdYSHlVajN0RHFp?=
 =?utf-8?B?cHRRWVJEa2pMdGZtTGtaVTFQTGxsakR5bEk2cUFuR3JYS3FSdXpGakRaUnhv?=
 =?utf-8?B?YVk2YlIzQUJZMDBJaVArdlFFTEZuWm5va2lHcHdoZm0vZnhvZk9KYmJWam1U?=
 =?utf-8?B?Ni9NMkxNTmJMbjhRWjQrd2tzNm1iSERJeGdxcjhuODVmNWFER0E3NWhqOE8y?=
 =?utf-8?B?eUNKRm9uQURKTkY0d0UzTXg0bXYybnNENU9vT05kbkdDcy9rWGcvbkhVRWhx?=
 =?utf-8?B?K2FtK2VVa3BVejAycjVROTVqcUJ0YTBGVzJoMDJCY3pOQ0ZpWWxPclJ2TXoy?=
 =?utf-8?B?TU0vS1R0ZklwS0x1d3M1MmNJcGEvUUdSOXRWZFRoQXU5U1hUMkJWMzZPb0Vq?=
 =?utf-8?B?ZTRhMVVwR0g1M0x0bmU0b2pOWU5tRWVCSm94MTlzeXpxSFI5c2pYZGNwZXla?=
 =?utf-8?B?VjNJSElweDJOTWhrdEl6R1JQTHh4cDk2SFJaOHVnY0JCbE1oU2Q3R3Y5TVcx?=
 =?utf-8?B?cUpuV2R1T0haeitNdURmR29vMC90QVJ1dHNLUEZHYmdLb0VUZUljMUg0Mk5p?=
 =?utf-8?B?aVhyNjFSZnRIc1NuU0IvalRWMGdLUWpEWTZVWWlBdzhtbGFjNnNxU1VOWDFv?=
 =?utf-8?B?T3lqckxtZGQvem5vWmx2ekkwM0RvUUR0OUwvbzFIZ2lvOVBIZ0FxTHFVNjk0?=
 =?utf-8?B?aUNwYW1PYjlRcDdVVVBzdWJIVVRJd2NIS2t0VmQ0TTI2SVNJeEk0THhFalA1?=
 =?utf-8?B?NmNhSkYrRk0vY0hSY3pmR0pMSkZ6Nm5QbzZLb1ZnQ2VJYkZ2NXpWNzFLOWRV?=
 =?utf-8?B?b3Boa0xsbjczcGZFdEczYVBVWEJia3BkTHJ6WlRKU1hGMmxUYzhISFdPZy9i?=
 =?utf-8?B?VUE9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4568b238-e7cd-4bbe-c793-08db00857752
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8847.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 16:42:23.7183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ilm3/oL8ohP7ADTNP7NpjkAkaWuJD8xsznvZpKIC1J/hdNo2c+oXQ19ZfJugGCxvM9Xx55Ds9yk0+RMaj7n+9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB10084
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

On 1/27/23 11:41, Krzysztof Kozlowski wrote:
> On 27/01/2023 17:22, Sean Anderson wrote:
>> On 1/27/23 11:15, Krzysztof Kozlowski wrote:
>>> On 27/01/2023 17:11, Sean Anderson wrote:
>>>>>>>>
>>>>>>>>  .../boot/dts/freescale/fsl-ls1046a-rdb.dts    | 112 ++++++++++++++++++
>>>>>>>>  drivers/phy/freescale/Kconfig                 |   1 +
>>>>>>>
>>>>>>> The phy driver Kconfig change shouldn't be part of this patch.
>>>>>>
>>>>>> I put it here for bisectability, since this is the point where we need
>>>>>> to enable it. But I can do this in a separate patch if you want.
>>>>>
>>>>> From DT ABI perspective, it's already broken anyway if you need to change
>>>>> kernel and DT atomically.
>>>>
>>>> AIUI new kernels must work with old device trees, but new device trees need not
>>>> work with old kernels. So a change like this is fine, since the kernel won't
>>>> touch the serdes if it isn't supplied.
>>>
>>> You used the argument "bisectability". If the patchset is not
>>> bisectable, the ABI is broken.
>> 
>> Well, because Shawn wants it in a separate patch I am just going to enable
>> the driver by default on Layerscape before adding the device nodes. That way we have
>> 
>> 1. Base state, driver not enabled and node is disabled
>> 2. Driver enabled but not used because the node is disabled
>> 3. Driver enabled and bound to node
>> 
>> So there is never a case where the node is bound but the driver isn't enabled
>> (which would cause the ethernet drivers to fail to probe).
> 
> Then there is no bisectability issues and the Kconfig patch should have
> been squashed here... Mentioning bisectability and that squash just
> confuses.

The Kconfig is currently squashed, but I am going to split it off as requested.

--Sean

