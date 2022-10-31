Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5179C613A34
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 16:37:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1HMW1Jhzz3cJQ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Nov 2022 02:37:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=ijp/CZQ2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.105.85; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=ijp/CZQ2;
	dkim-atps=neutral
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2085.outbound.protection.outlook.com [40.107.105.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1HLW6gxfz2x9d
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Nov 2022 02:36:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TBkJ+peUK6Uxr3YXywGld3ww1iSIBHq/B+gMBDLWca1T7LytK+h3YTrVlWAaxmS3VV5uaRufffZ81z+x8//rokt9QhJtsagHFoeqEjKYI5Gos3zTq4Xd/nwhwTKApT+ovg7iRxcxQLFtHDa2Zqzb8zaK6h9QnaMWWOhADd7Pugqyv542m7DFsmcmvubNlhwGrcsTyuUFGJgikTM7bTUqgJgBrFoOcyA5U2updUV4Yke8M82HdAYWxhc5DMbMta+Gve7fz/Nfo3/La6XXCBuB4/JClHbmx82WoF0ayExAMdqwKVZqsmf1PN5YNbLlzoArNqiZ3NCtQbNdmVvqWbJzNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GlmN0TMeFl0fvy/eUckGxjHUQHPSD0L3a7MM2+fk7L0=;
 b=kBsdmLnau9Y3jN/p9etswafA7icAtSTAOOwBnkDVsOo+fSzi8ppQ5Q6kwQyoFeF1yTHNYSv+GnvSTmMs4KZi/BHODUfxj5zxmSubmGIuzw3U50xw/ep+SymQuUvwMuZEhMAqPpLpKHHybub2jcyEmqdIbpdwAr4sPryi9Atqg6VcCSF0y0d/uWW7kvGFJGI2Vktdv3HQsc66EQXNAPP0i+NLWBQUEWYa6LeENwfTh5msP4/IGUHg8IsPSHXecGV5fDgi+XsguEeNymcc1MYXfQ9Z0QzbDoP+BDNwgu+64MZGyTroYeMzzmoQb5/q3gQ7z4SKv30asUgkQ41QsaQhnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GlmN0TMeFl0fvy/eUckGxjHUQHPSD0L3a7MM2+fk7L0=;
 b=ijp/CZQ2XWJFF9mBvPqnESZNwqWa0Vx40r63QD11n2dbIcwVRNcIhb4S59sgdd47MTYB/+lB4U4rh6FQt6ejXeO+G/dg6rzHuJkHuK/eNj+TPhAdXbGvbrA+tIkRPjQh9XVojmn2FZPsmGkzr+K0XaFAmEzUiN5XQUR77+COgd8hNU78uLW321ikqAHXE5QXyIg6jdVabkFSD/28gcSqE4elOpZts3fAZnCTz4ASZVo5tC1B7u2fit9hnDJny/NGqGnj7eRzNTuOWDYV4iVTwlEJ12xqa7oL44Yt8reFfTDLQZMz4xH7otHj/zJmiKP665Q2kFuNBUvOl76cX5LTLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by AS8PR03MB8713.eurprd03.prod.outlook.com (2603:10a6:20b:54e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Mon, 31 Oct
 2022 15:35:57 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::9489:5192:ea65:b786]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::9489:5192:ea65:b786%7]) with mapi id 15.20.5769.015; Mon, 31 Oct 2022
 15:35:57 +0000
Message-ID: <f7d631ef-0d51-ce9a-7e9d-fcdd314ff279@seco.com>
Date: Mon, 31 Oct 2022 11:33:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v8 4/9] phy: fsl: Add Lynx 10G SerDes driver
Content-Language: en-US
To: Bagas Sanjaya <bagasdotme@gmail.com>
References: <20221027191113.403712-1-sean.anderson@seco.com>
 <20221027191113.403712-5-sean.anderson@seco.com> <Y1zuQvkyqtHOPGrk@debian.me>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <Y1zuQvkyqtHOPGrk@debian.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0308.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::13) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|AS8PR03MB8713:EE_
X-MS-Office365-Filtering-Correlation-Id: ff4ce1c9-b01e-4cc4-e8d1-08dabb559a1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	vYnZhOMtFPJW7rVQFfgrIt21m9rI+Q2Y/nqygnEAB5IxaAd2Ik2jC2S7TjusO4coCFgfaTvJlgXAqLIYF5OHvcb1hBnW7JKaexCUdoFhkzqpl9bZ1BJ62AK1SM8UhIPBTUDbLmL7YO/cO+P2tC3KSQB/9qb6DJZUnONqTm+1xzw0NWVH+q0bDI9GgaJzoFV0f9cTOMRuKXtRVTmzxrOp9Xp9k5M4PdSR1zkIctdN9fHA27EOiPq/vtJ5MsB7FsthXEnNq5tX33fjAoXCf74O2Se9iRTVey1SFE+p+xCrXiYHEu4OX0EIcFdlh+GiPm5TqSMh9qiO+zBkunIwxSMlVwB8NL8Hckam3vnTDf9A85tHA+xKBeS5GW3I2t6/fU40d+JFRqyda4UYsPPm+adBVrvuB4J8pEpBTIz96tLX9Gmypeq4KOZu8ntloR2ZnPb9TiKOIU2iiCoYJHQ79HMd7z1OfUbQSa+vWW2RBhNRrWPays4MFErYsD+GHLtZ0xKVM1HDNq9Kg6DfxLQRvehzErZQIP1n/98ypJhfk7vlbKjlg0CFzl45VNV7PciLjJ/tHtBusbI5IE4yQKtrpiiHu/4oeO35fsigYICHyKRo3yqXONX7ci/gOUFX3Iyh/B3Sas0N1MUtsacgOL9Cqyn0OXgLOj8QIoX15qLhy4SdL71ixlZJLJC2V99vmPTFD8zUHaKwovsQiCx+vYjCvymgUUenvE0qTdToUZFnQCPl4PbPAxYVU0qGSaApuMUafRj1+uI8ImA84s+KX4ouuv6owZ+7lP5B6mF8icLPdrQ/huO51vgPQIfXt//EguViaMIa6ejnTorzrDpOvRRwIZX78w==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(39840400004)(136003)(396003)(376002)(451199015)(8936002)(83380400001)(41300700001)(5660300002)(66556008)(66476007)(7416002)(86362001)(2906002)(186003)(52116002)(6506007)(2616005)(38350700002)(478600001)(44832011)(6512007)(6486002)(53546011)(26005)(38100700002)(54906003)(66946007)(4326008)(6666004)(316002)(31686004)(6916009)(8676002)(31696002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?RzNoZGxVTFBWZm1qSDM5ZXFrZHQzT0lYMitXSnc3MFhSN0VrWEQxVDBlYjBs?=
 =?utf-8?B?NEUwblJiWWYrTFQzM0Y1WGZVRENtREJXUkdISnlObHYxK2sycm4wY0s4QWQw?=
 =?utf-8?B?OFNWVEowR3hRaks5ZHJXekVFOG1IdWZjclRQNTR2aU92UTRFa01pZndsL00z?=
 =?utf-8?B?MXE5QmxVckFOM2V3aW5rczJ4am9JdGZNdThvMnk1MWRHb2dnZ3RqNDZ5NjBx?=
 =?utf-8?B?SENmTjRPLzljbVVaYXYzdmU0cGhwWURzaXFyakFvd21WOC84Y3RwcE5CVlYx?=
 =?utf-8?B?YWJoWENFR1R3bHh5T25ydUNTMGZPZEJ3aHUxSmJ0NGt5L3BOQXBkSDRYbWxS?=
 =?utf-8?B?VzBKYzNGY2dEOWxnLzljb1hMSUZjVWd5V3BTQTJXV2xSUjhoT2hQalRFZDhV?=
 =?utf-8?B?TjBLeEJ0UTkyMDJ4bGtodWtrMjFJamt0ZTRJTjNKOVovdmxwUG1OOVYyRm5K?=
 =?utf-8?B?TUhHcW1hUGR6K2orTWcvZDNHZ0htZnZTRWxIZmt0M0xKNEcwRVVjM3NqMjNZ?=
 =?utf-8?B?enZyRTVJT3RlZU9NektyakNEU21ab3RwSGNYNUc2Wlc3bTloQ1dNcFl4YU5o?=
 =?utf-8?B?emZXNjVnckNnUk95VXc1bUsybS9sQk1ySk9zVmQxYmtwcmRnYWJ2bldQUmlR?=
 =?utf-8?B?UzRQZjhvZDk5dEJwSDIvSEJjY0tURTB5bVZqdmwvTmhGL2pYSVNoTEFXemlq?=
 =?utf-8?B?NjZyMmMydDRDRWVkc0ZFa3RZMTZVNFhuWDV4UmQzWERrMGJTNXFpZFgyN3kx?=
 =?utf-8?B?T0FOS1J5YkR6MW1IcmlidDV4T01tby9UN0luTC9xTTNJTzNrTjEvNXlRYWV4?=
 =?utf-8?B?ZFdTT1diMmMxS3JGd3A3RVZwS0NIRUhWYUJyZHBOY21MUi9sdm5aaWpTZDRz?=
 =?utf-8?B?MVdxY3EyWmE0RXhRQUxFOWIrSWV4OWNzeWJHNmtwbzE3K3d4YTM3UlBUcW0z?=
 =?utf-8?B?RlFSNXhQQlROZjFnSEZtSDRhSDBLdjVRaHhudlgwdFVLTWZNNmJVMGpQVGpQ?=
 =?utf-8?B?cmlXTmZTcTZnZHZBQ1M5aWZ0N0ZLR1ZFTEdUVVJrQTdoakd1a3pCN1NmcEFn?=
 =?utf-8?B?bnREbEZkbzBya3VRblVLeWw0OWtKVVFibWhpWGdlenZlaUZ4M3M4cy9Oa2Uy?=
 =?utf-8?B?VkFnWTNXS3hKaGNlMy9rTEZKd0JtaTJ1OW5mb1dIcUF5YU5oYjkreG5aK2VJ?=
 =?utf-8?B?dXN3cUJxbzVOZkY5dzRLcC9tQWtYajlPc09GM1NZeDlaREVvL3ZPY29qQ2E5?=
 =?utf-8?B?RFBlb2xLMWlaSVlBc2R2aHZScjdERU8rSzBSdm0wOXZnYjd3Y3h2ZVJ0NDcy?=
 =?utf-8?B?YWtaQ0tBLzYyWE1GV3M4NDVIVzllbmt5T055ZEVTbmJNM1ppVWhzdHJxMzVC?=
 =?utf-8?B?cWpvTHN1a09mZWxUdkpLb21SVXFDR1ZqUkhMTDdxYW02cjRrcWEyUGZEVjBk?=
 =?utf-8?B?L1NlRUVGVjlXV3NoY0NqZWFoaHBTWEdLWk1ocVgvOC8vM0lTNGE2cDRKOHc3?=
 =?utf-8?B?RjlHSTRKdWNwVW1hMm1WdWR6bzZBOXpyNnNRakVNNEpVcDhUcEFXOUxMb1E0?=
 =?utf-8?B?aFk4NWY2SUtUSWs0K1RxWlBsUXd2dEpodjBWVzlYbWpRc2pHdXArL0NwZ0Vo?=
 =?utf-8?B?RnpKaDU5Sy9GMU8wZnhsc1dvSldBMDdoWFlKc0doSGZVYUNVZHJFLzRSZjh4?=
 =?utf-8?B?d0J5QlVHK0txckREb0tVQ1F1MkU4Tml2dnE0dXp5MFZtOEZvcGtWbUxDaU0y?=
 =?utf-8?B?S0twRWFNWDB2eHJhMDdycEVGV0ZkSjR2dVhEQWV3OFZOQnZtQWdNWnYyK1l6?=
 =?utf-8?B?TzZsQXdJcHVUN1RNand6M0hSVVRNazdMS2laTUswQjlDbllSUUhHVTJRU2I2?=
 =?utf-8?B?UnJCYVpEMkZWWjRta3RPNkJPWWVxaVRwUk5rTFNlZmIwNVNlUklxNkQ3Mkxy?=
 =?utf-8?B?UzcwUTVKakFGck1NYmg1OU5zbEhNUnBSdkErZ0NuZTN6ZHRnd2ZQOWRINHFC?=
 =?utf-8?B?ZVI4NWdyMFdJMGk3SVdLcm5iNkJvc3VMWE1tQVlCQnJmb3RFYnp0SlFnSGZm?=
 =?utf-8?B?U09QWllmb0ZreVJrZmFZQ1RadWtTd3lpYWI5Q2didmpMSXJvdC9BaVVYaEZW?=
 =?utf-8?B?cmNuRmFXRTY0ME9hUjJNWi9ZdlZXSUhTU2JKdllybFdWK0MxdlZzWmdScDZw?=
 =?utf-8?B?elE9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff4ce1c9-b01e-4cc4-e8d1-08dabb559a1b
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 15:35:57.0355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TFw0Kulf2y7/9K4SZTx3Lu9710TGdJYYVFAl4YjEjZeVco+AQ4cbLGf6sAuZ76YMkf6KoM4OOrbgwLrreS2OLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8713
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/29/22 05:11, Bagas Sanjaya wrote:
> On Thu, Oct 27, 2022 at 03:11:08PM -0400, Sean Anderson wrote:
>>  .. only::  subproject and html
>> diff --git a/Documentation/driver-api/phy/lynx_10g.rst b/Documentation/driver-api/phy/lynx_10g.rst
>> new file mode 100644
>> index 000000000000..ebbf4dd86726
>> --- /dev/null
>> +++ b/Documentation/driver-api/phy/lynx_10g.rst
>> @@ -0,0 +1,58 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +===========================
>> +Lynx 10G Phy (QorIQ SerDes)
>> +===========================
>> +
>> +Using this phy
>> +--------------
>> +
>> +:c:func:`phy_get` just gets (or creates) a new :c:type:`phy` with the lanes
>> +described in the phandle. :c:func:`phy_init` is what actually reserves the
>> +lanes for use. Unlike some other drivers, when the phy is created, there is no
>> +default protocol. :c:func:`phy_set_mode <phy_set_mode_ext>` must be called in
>> +order to set the protocol.
>> +
>> +Supporting SoCs
>> +---------------
>> +
>> +Each new SoC needs a :c:type:`struct lynx_conf <lynx_conf>`, containing the
>> +number of lanes in each device, the endianness of the device, and the helper
>> +functions to use when selecting protocol controllers. For example, the
>> +configuration for the LS1046A is::
> 
> Did you mean struct lynx_cfg as in below snippet?

Yes.

>> +
>> +    static const struct lynx_cfg ls1046a_cfg = {
>> +        .lanes = 4,
>> +        .endian = REGMAP_ENDIAN_BIG,
>> +        .mode_conflict = lynx_ls_mode_conflict,
>> +        .mode_apply = lynx_ls_mode_apply,
>> +        .mode_init = lynx_ls_mode_init,
>> +    };
>> +
>> +The ``mode_`` functions will generally be common to all SoCs in a series (e.g.
>> +all Layerscape SoCs or all T-series SoCs).
>> +
>> +In addition, you will need to add a device node as documented in
>> +``Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml``. This lets the
>> +driver know which lanes are available to configure.
>> +
>> +Supporting Protocols
>> +--------------------
>> +
>> +Each protocol is a combination of values which must be programmed into the lane
>> +registers. To add a new protocol, first add it to :c:type:`enum lynx_protocol
>> +<lynx_protocol>`. Add a new entry to `lynx_proto_params`, and populate the
>> +appropriate fields. Modify `lynx_lookup_proto` to map the :c:type:`enum
>> +phy_mode <phy_mode>` to :c:type:`enum lynx_protocol <lynx_protocol>`. Update
>> +the ``mode_conflict``, ``mode_apply``, and ``mode_init`` helpers are updated to
>> +support your protocol.
>> +
> 
> These lynx_ keywords should be in double backticks to be consistent
> (rendered as inline code).
> 

OK

> Also, don't forget to add conjunctions:
> 
> "... Then modify ``lynx_lookup_proto`` ... Finally, update the ...
> helpers ..."

Personally, I like to be conservative with connectives when describing
sequences. I do agree that a "finally" would help here.

--Sean

>> +You may need to modify :c:func:`lynx_set_mode` in order to support your
>> +protocol. This can happen when you have added members to :c:type:`struct
>> +lynx_proto_params <lynx_proto_params>`. It can also happen if you have specific
>> +clocking requirements, or protocol-specific registers to program.
>> +
>> +Internal API Reference
>> +----------------------
>> +
>> +.. kernel-doc:: drivers/phy/freescale/phy-fsl-lynx-10g.c
> 
> Otherwise LGTM, thanks.
> 
