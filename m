Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E19186B2A23
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 17:05:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXYt361Gbz3cdk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 03:04:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=EFI1fAnk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:7e1b::622; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=EFI1fAnk;
	dkim-atps=neutral
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20622.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1b::622])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXYs36JgBz3cMh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 03:04:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ALCbnx/smOEUD8fsEGhFxz5JxREqNJG20b3cNxCGL7L8tc0ytZEbIpN7r3RWwJ4L9l2akqeB3oUCjgOIF25M6bbe/Y3owLCzMwis0yZXgBXWxtmfgVDOP2NKjCTnxpexGcR4ggUEhUHI0OAB4xu4pmvrBJcsyMLW+yY0KCudZqOVYaUPl6slzvJGP3CZRIeVeJhbSYoqOkXf9yJnxFbWA3bvueOO6NTx8MSHb83kER8DRLfy6gubNeEoEfIDSip7t4wPW/OZJYo3RRKeN0udEKM+PyzQdYunIZ/JLt9zLZK6Oj8CclQaaAtUGx4GPJ/CqL4wd++Vx+jJsbXFOZ1Wrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MBzFW3D4ZBMThKsdB4MrbTfftRdYBzghjEmDWMVN+1E=;
 b=fC3R4OTBvaA05yd2hn/QBhIOI1oPhA+kNo3Qk0KVJmcOmjCHlEv5/0RAf1aZ8060LHQeEK+jYdge5OFG3uxn9qnnxCODTy6jLokFXFM4XzKtQgfF/7RxNGo3/CCf8QanrVuixDH6sylwB1G8VWriLZ8yjOmOYt/DqdEIzM+o6iD1LxXRQyFirGm7Z5tLsyzmQVmJBGTmRPZ5WqFovBvQUFzz6OswioGrBiDcP1dgOWfVsYsQOQzwWSkFU+GylCoFz2YRNmdrN9QhNSUBzxIlh92TBTq+oDsyxnIIWYMn7zrq+KwRathk2cfs5jxsOuiDSTQJtj17T9yhCyQT7kd45g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBzFW3D4ZBMThKsdB4MrbTfftRdYBzghjEmDWMVN+1E=;
 b=EFI1fAnk8itR0y22u5ancy4ptW6WRGnz1IPSAwk22Cekpc0mvKWArqSQO54zaFJB8HScXQgSWlRWcOXBY/lr3L//ja0TZ6b6aSWeKz7bAp9uBSExY/tACedNZ+vawluBIN7fhtdxQkPV18ZAsRqKBLCNJ1ar9bpA4p/i0VHavPeuMTm8HlSOpcmd+u1evAHN9RIWX9J1+51/9O2njxHF3hirruK5t80WyBWUozoEfWU3lH5WT+vlk9ZrEUDQmwaTNBoPemRlB6e7tC2A04bkryyBRiL7V35B2jnTfHhpFnQSEQ5kzLY3gLjHYtlE16QZEnl97B6bRs5k+LgXv8YMPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by PAVPR03MB9211.eurprd03.prod.outlook.com (2603:10a6:102:325::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Thu, 9 Mar
 2023 16:03:44 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%5]) with mapi id 15.20.6156.027; Thu, 9 Mar 2023
 16:03:44 +0000
Message-ID: <4fbd84ff-8a0c-669c-2f27-d542640ded24@seco.com>
Date: Thu, 9 Mar 2023 11:03:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v10 03/13] dt-bindings: Convert gpio-mmio to yaml
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20230306191535.1917656-1-sean.anderson@seco.com>
 <20230306191535.1917656-4-sean.anderson@seco.com>
 <20230308231018.GA4039466-robh@kernel.org>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20230308231018.GA4039466-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0386.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::31) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB8847:EE_|PAVPR03MB9211:EE_
X-MS-Office365-Filtering-Correlation-Id: 50de237c-7647-434c-bec5-08db20b7dbc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	83O6ltIldWTsDkxp0qFDA5Yk/RwWUyCZOdXTssY1ubVcX9nUB2x/NX7oOpcMxQw02uwugujGPafK/68MxGy/Dzo6VfVYByWjFQDU3PMvXSHvPaZvt0G6zkpRdTMH+P6f3cVUUAoogA1gZDPaXnatd/YeyynyCvUR2RCEN81RpZIqI1cP2KkXHtFDrqQcgtQt9JGqzQdmo70TXjRJP1UyWdP7JBHvvIQ7IHGa5T1R+6vrFsoFumcbhUtwETFj8tz+LDV+fIdd4nwpRubC3l2VhSorUuq6LCWxR+QXOXyDzEeIMN93LNUWhAXhLltfWHlcuc9QJToy4jbIVOI5WRQvBXlG8BtneQ7P9rGK1Gl7OAS1lL7hHVX/PKlyKGDC+/IInCRrkOIzDHt0O/yhVc2ijqNbxM3gacXrtzv2IseGmAGMTQUqYOP2+YzWpcdu/HEJ8RbzpxslAyg5HnMMwGevhcZZ/sYGmdegivdtDn7a02rh9/5h8qo13ggImnsVcMIO51wCqraSj5f0IQU4UOlc63FJ2YIyb+RK4t8U6TOxHIt46MPVo68BOoklL+Marl76iDLfsf/0OJMDfKEG9yM1W/Cp/+RiEsxKXFCovn3Ng9TdU/JukEWZbWYld25uCcSz5DyZrowHsQIEAdZ9wEp7s+PmaP3XuIotZotkF+4hoegJzK4lNRWxb5WrSTArwdCU7TIr7pl8XWiJyeJCvbvbsMg5/PMbIf/PTfoTgGzkjrc8OCUM4iNObv8E8F4fisUk
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(39850400004)(346002)(376002)(396003)(136003)(451199018)(6506007)(54906003)(316002)(2616005)(83380400001)(31696002)(66574015)(36756003)(38100700002)(478600001)(6666004)(6512007)(966005)(52116002)(86362001)(38350700002)(53546011)(6486002)(186003)(5660300002)(41300700001)(44832011)(26005)(8936002)(31686004)(2906002)(66946007)(8676002)(7416002)(66476007)(6916009)(4326008)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?UE1MMGRyZmZMZk03SW8zN3lWQzVLa2thNDE0bmhqV2RzcXY3Qjg1OGFMaFRK?=
 =?utf-8?B?OW1HTkl6Ri9NMjFkcWxXbFMxd3NQd3BMOU5sdlZpRHdJbGNFQXdkV09CMTRI?=
 =?utf-8?B?RGs0bWswWFF6anVMTnpWWVk3OG41QXVUOUVoSDYvTVRUdkJKcENkcFlUeUk3?=
 =?utf-8?B?ckRwS1lXbzhOcDR1Z0RPeHEyZDhrZG54dG1FRm1LKzRySVJGRVY0emRuWEVF?=
 =?utf-8?B?QTZIYnlqcGhZNmxmM01SWU1MalVWZkFBekxtenRMa2lxSXJvVEIwaCt4WDhq?=
 =?utf-8?B?c1pqd0JvOXdLTGVGd1p0U25mZFlaVWd5WWJobEtNWTdPWmFVSTVlRi9SQkdI?=
 =?utf-8?B?c3FYeWV3ZWZBYnUwS25DNjhCSEhhMkpKNWJoRk04bVJkeGRuL3J3UkZ0TTNi?=
 =?utf-8?B?QUFKQUxFdnJ4Vno2NnBVQ2JqNCtBUTNKUERGU0R6RmRESVFXSWlOVkVjSUVC?=
 =?utf-8?B?OE5KYzlPd29aZ2crWkdweExhU3lkSGpDMHQyY3RIUHBET0VwNnlzZi9iQjhj?=
 =?utf-8?B?OVc3QVVhaEYyNy9pSG9ZMmVKVXRxa2VvbnJ1bGcrQ0JIWmQ5NEUzdGhuQVlz?=
 =?utf-8?B?VlRXT1pYZUxKdGhSdE1PN2tLekV6Vm42dndzRFJXdEtQdCszQlc1VUN2RXdC?=
 =?utf-8?B?NjVBS2lKK09QcDBBVjVYdnloa09rYzBoZSt2dXpBR1dHb2VxKy80b08xNkxr?=
 =?utf-8?B?N0ZHK0NQR0s2ZTVaK0JwL3pXbXRtMUVwN0M4czF6dUpzd2E3b3ZqTHZTY05n?=
 =?utf-8?B?K0RXS3E4Zmoxd3p0ZjJIMlBqejlDUWlac2pUTlEwWkNFc2tMSGluTUNEU3R0?=
 =?utf-8?B?ZHEwaXowemU2K0VOT2VkUUhFNWptd3dlZDloRjI1MDd4VTR1UnY5RDJxNndJ?=
 =?utf-8?B?cVJzMjBqVnU4b1p2T1N2SkhlOHI1R1crOFI4Z3Q5T3ZsTVZGbU9rSXdvUWYv?=
 =?utf-8?B?RjNXWmZEdkRBVHdnSVc1YmptazExTDJyRWJ0OElZd2FBOFB4UE9PdW1LY3Rp?=
 =?utf-8?B?S3RRUmhjanN1ZWdLT1llNmtyQTl1QndZM21FVHozWi90VjBUWUE4aU5naHJm?=
 =?utf-8?B?cVM0WU0wd2RKdnJtamt5VlJTQmtSbXJqTStnaGZpL2ZDeW1rMjhkS3JFOEJq?=
 =?utf-8?B?QzE5RXRvR0VJUys1Z1J0VExYRHQvZENlQkhxRXVnc2xUZ1VINDNUN214d055?=
 =?utf-8?B?RS94NEJBRFo5M2FOZ0RDQlB0ZDhsU2FTaFcxcWhnbzdDdkZ2Wk5lbmowKzVK?=
 =?utf-8?B?aEprbll4Y2M3ZG9lUnhyWlppMnNjUGVna01OU25aMWNKeDJEaEQ0cTZpcitz?=
 =?utf-8?B?UmgvZEd5U0lkLzlkU2VwV0QrY21wL1dUWmlMOGFCSEhQUU8xSmFsR3hoWEpU?=
 =?utf-8?B?MUpJMVUvcUprSmFNaVYvdHNSNlNBU01FUTJsZHVtUDlqQzZSd1RjZ1pZa1d1?=
 =?utf-8?B?a2tBS1JxVmJpc0pZdk9MVjRubzB0QzVraXZOUnU4RGE1c0JqMFFwWEI1a2pB?=
 =?utf-8?B?eUMxRU5CYnc0T1V4VWtEbFRja0lJT3lkdTk4OUYybjVNVDRHQmJmNnFaYW5T?=
 =?utf-8?B?ajYxQUlndzJORlFQUGNVSnphNStGNjljY1d0eXdSSkZISEIzOXNFa0hrb3p3?=
 =?utf-8?B?MHUyL1RsRGh3ZDBOSUlMQUQxcjJrNDBEOW5NR20yMEtGTlM5OXhMcWgwb3Jh?=
 =?utf-8?B?c29xR2JoeHA4UkFRdVppWXU2K1ViUEdaZE9mQURTM0hRb3Z4VVlmWEtyNGFj?=
 =?utf-8?B?SlRmZjJJcE5mTXFnb2EvQmZEdXBOK05sdHZhWkhNUnRPTm9uQWYvRkJPWUcw?=
 =?utf-8?B?emlCTXRuMW1KckU1RldyQjJ0YXZVZlEwZ29wM1gycmRWb1JNd0tjMmFZSzhT?=
 =?utf-8?B?ZmtwZG1ZTUdqTkZRZFRVVkJ1VnExcDVNdG5ENk1zOXlUSTVMN2M1bUVmK0VG?=
 =?utf-8?B?NnoyY2pNamprMzZSSGtLamJTbkFGanl1VFZLVDZXSUxyUjdCdDU3cGZLU3ph?=
 =?utf-8?B?TDZydThxOFBXQUlRUXpSeG5jTE1HNVRKM0tZaUJKTk1ickpIQ2xBNFp6Nmlw?=
 =?utf-8?B?TDkxbkhRaVRYYlpZME1MN0NjM3FtNjErSG9HTmdDUlFWT3o2cy9NSGl4RERv?=
 =?utf-8?B?dWhjOWxNaEtIUk13aC94MHJ4a0J2eDdOcjRHejdMcFMzeGh4SmJxMmluNzdi?=
 =?utf-8?B?b3c9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50de237c-7647-434c-bec5-08db20b7dbc9
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8847.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 16:03:44.3623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vpxjVuQMjpDNELPdFubUJlKWrhUb5iij9K0988IUjUjlWodH4e5+qrNK1L3wz90SnvkjX7kMhHTZRlXZUmasrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9211
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, =?UTF-8?Q?Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Jonas Gorski <jonas.gorski@gmail.com>, linux-gpio@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/8/23 18:10, Rob Herring wrote:
> On Mon, Mar 06, 2023 at 02:15:25PM -0500, Sean Anderson wrote:
>> This is a generic binding for simple MMIO GPIO controllers. Although we
>> have a single driver for these controllers, they were previously spread
>> over several files. Consolidate them. The register descriptions are
>> adapted from the comments in the source. There is no set order for the
>> registers, so I have not specified one.
>> 
>> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>> ---
>> 
>> Changes in v10:
>> - New
>> 
>>  .../bindings/gpio/brcm,bcm6345-gpio.yaml      |  16 +--
>>  .../devicetree/bindings/gpio/gpio-mmio.yaml   | 136 ++++++++++++++++++
>>  .../bindings/gpio/ni,169445-nand-gpio.txt     |  38 -----
>>  .../devicetree/bindings/gpio/wd,mbl-gpio.txt  |  38 -----
>>  4 files changed, 137 insertions(+), 91 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
>>  delete mode 100644 Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt
>>  delete mode 100644 Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt
>> 
>> diff --git a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml b/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
>> index 4d69f79df859..e11f4af49c52 100644
>> --- a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
>> +++ b/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
>> @@ -4,7 +4,7 @@
>>  $id: http://devicetree.org/schemas/gpio/brcm,bcm6345-gpio.yaml#
>>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>>  
>> -title: Broadcom BCM6345 GPIO controller
>> +title: Broadcom BCM63xx GPIO controller
>>  
>>  maintainers:
>>    - Álvaro Fernández Rojas <noltari@gmail.com>
>> @@ -18,8 +18,6 @@ description: |+
>>  
>>    BCM6338 have 8-bit data and dirout registers, where GPIO state can be read
>>    and/or written, and the direction changed from input to output.
>> -  BCM6345 have 16-bit data and dirout registers, where GPIO state can be read
>> -  and/or written, and the direction changed from input to output.
>>    BCM6318, BCM6328, BCM6358, BCM6362, BCM6368 and BCM63268 have 32-bit data
>>    and dirout registers, where GPIO state can be read and/or written, and the
>>    direction changed from input to output.
>> @@ -29,7 +27,6 @@ properties:
>>      enum:
>>        - brcm,bcm6318-gpio
>>        - brcm,bcm6328-gpio
>> -      - brcm,bcm6345-gpio
>>        - brcm,bcm6358-gpio
>>        - brcm,bcm6362-gpio
>>        - brcm,bcm6368-gpio
>> @@ -63,17 +60,6 @@ required:
>>  additionalProperties: false
>>  
>>  examples:
>> -  - |
>> -    gpio@fffe0406 {
>> -      compatible = "brcm,bcm6345-gpio";
>> -      reg-names = "dirout", "dat";
>> -      reg = <0xfffe0406 2>, <0xfffe040a 2>;
>> -      native-endian;
>> -
>> -      gpio-controller;
>> -      #gpio-cells = <2>;
>> -    };
>> -
>>    - |
>>      gpio@0 {
>>        compatible = "brcm,bcm63268-gpio";
>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
>> new file mode 100644
>> index 000000000000..fd5c7055d542
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
>> @@ -0,0 +1,136 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Generic MMIO GPIO
>> +
>> +maintainers:
>> +  - Linus Walleij <linus.walleij@linaro.org>
>> +  - Bartosz Golaszewski <brgl@bgdev.pl>
>> +
>> +description: |
> 
> Don't need '|' unless you want line endings preserved. Elsewhere too.

OK

>> +  Some simple GPIO controllers may consist of a single data register or a pair
>> +  of set/clear-bit registers. Such controllers are common for glue logic in
>> +  FPGAs or ASICs. Commonly, these controllers are accessed over memory-mapped
>> +  NAND-style parallel busses.
>> +
>> +properties:
>> +  big-endian:
>> +    true
> 
> big-endian: true

OK

>> +
>> +  compatible:
>> +    enum:
>> +      - brcm,bcm6345-gpio # Broadcom BCM6345 GPIO controller
>> +      - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
>> +      - ni,169445-nand-gpio # National Instruments 169445 GPIO NAND controller
>> +
>> +  '#gpio-cells':
>> +    const: 2
>> +
>> +  gpio-controller:
>> +    true
> 
> ditto.

OK

--Sean
