Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F29467EAC7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 17:23:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3NDr14nSz3fJh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 03:23:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=VM/Gtbhb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.13.85; helo=eur01-he1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=VM/Gtbhb;
	dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2085.outbound.protection.outlook.com [40.107.13.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3NCr5tgCz3cKM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 03:23:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9MFAngcTnUiMDfq7HlC08M9CrAiNKh/re8cIC5n+gATftb7umXuioVVJLeCWQS5PxQ0RK3dCw1IHaIzr38noa+LhpM8XjZJbBaESwWZDeA87nmEDsfFxBWc34f7EmfmNt0YhGtGNEc+DXaDsII9YkD/mVBXPPlJHqqI4vQHTr8mRYSSdNMC/vXyfIgujLxCOXUQO9vjI8l4J0xC7uH6XSTY6poZ2vabRKAKYvh6G59LsXPKQZco6YzbrIZJvrRbVSHOHU+XxFESPXj4TdumURSSrlwrtLFuZBHj99aHdDkth6A6Qym3dI0BnNIe1v19IP+HlyUovVWHrV1mzCjEiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LkcLyPk7mdF+wxSNJ5Xe+jyklL2TNrJ/OcyFoh/Pz2Y=;
 b=ZSKGTz6Y8ziTUE/0hnl4tgAlv4IIuFPderSY54ldRWgN2e3+zvp5ioCj5J+taKWxYvuMhkgBIXLQhQLQ5mVzKJkwgXHGxsvd11dJQXKG4CZjwuAEu3BAcIWA3DEGkeYsLE8haLseYsYFgGJTUoOKpjNCwZxYd7VrmHYNU1bmq82xohT9wVZdD9zAXYOOj7wx8G/I1oaIbieM4CAtUWtuWTHBSfWCuRCXlPGi+fSK3FK90OhcWH1WJBA2xLoGw7grxz/pdegPE/R+Oj3UWHEtAwb0gT1ZwN0Kl81IOKTvmhjtQj91TTPF8R8Qya81nS7e288LTCactdqi7OjBSBavfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkcLyPk7mdF+wxSNJ5Xe+jyklL2TNrJ/OcyFoh/Pz2Y=;
 b=VM/GtbhbimZ0rkiWyY6Dlfg8EZLF6DtdMnmH0NgVoY8dWrMNfit8VKHEmDu1BNAQxFHhFZXLv5dhoxMYDlCsm1emzXdz9XDsvl+dPAPCWFk2hLKaiR9S0E+QGYbCTydlnBYHy5AVzrHeNJ4Dzp94eb1dwj+2vq2y1ApJNwol4SH9itN8avLREKVoLVoAmk0LEdennYAKRU0OIz5FNDf90A6sJxAiLEiSiGMTMUuhdjjVrEoVY1w9BWTnUGCff5P1+GOBU3mNlrZovaUq/xxldJj37wdZqfWA+Cu1XQQk2gyReNHxxUA23J14WligLw4oxYgdL4e4dgh0IcHy8Rc1vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by GV1PR03MB9871.eurprd03.prod.outlook.com (2603:10a6:150:3d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23; Fri, 27 Jan
 2023 16:22:42 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::6b03:ac16:24b5:9166]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::6b03:ac16:24b5:9166%2]) with mapi id 15.20.6043.022; Fri, 27 Jan 2023
 16:22:42 +0000
Message-ID: <6ad9bc2a-910a-357c-fd7a-cf4ffe13ddb0@seco.com>
Date: Fri, 27 Jan 2023 11:22:38 -0500
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
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <a3c3603f-7401-aeb2-4b58-86c3ca778c6c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0155.namprd03.prod.outlook.com
 (2603:10b6:208:32f::13) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB8847:EE_|GV1PR03MB9871:EE_
X-MS-Office365-Filtering-Correlation-Id: 111ca23c-dd93-4c03-f84c-08db0082b77b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	giB6ijtN+LC11Gy6KcNmiYYXkIdoVynoe0w4bFIyWg6cekpHPJvo2KEsMTiyK3YXGgu2X68kZkPZhw5TEufUeb1Ig8SiIMNN9zXnrjKsTl7cpFRzO8WnFhJtMFIUYOi+Xu0pzJZsGXwr3vV7I/w5Q7GDvbZvQJltVH0s4UAAQrIoMrXXNvIALXum1ii5buXi2k8HoT87ZviLl9/zY38VGDmVnaFnzdOFDc6tIm/w0oMabGximvXg9mwE9GaFuL2BzgoHPacZ9bzPhGBD1jSUpciga2PPqWMMKX7TEhFI6qwdu1Q+6c/JA2IBdgypih60fs1w881XTQYgKbIGAmGjUIlJzd65ndgqOg9QdbnU1e/RqC0VnqtJAHU+zdiQse/0JQ6mE5E++N40XaWMzvGMouUo0RPatgyRwgurZQ2NNlb9irJJkKAi0UjG7p2m3VYkJbitny2mNvNif4rKaktAw9w2dEIOdWUFf0QMHcI2lHyIsYHbZD/a0aSWxsy/+TEgamX1x+ZoCCwk7tuo3WKw+1hHQLqMbzrlkX59r8yGD/qFT9W3yBRyeG41VYNSIhEC7F/fIdjHTG8tho0Y5jNvG2k+Fiph/Qoul05w3GbRFTXhWhGRHrbvep+h+Zisdlsgsjza8hl42LXb61Mk4GTdZWiiefJx5p3BTXH8pjgY+9AJBtpDWJQEEpobrjKvLkKutf8pJmhLHNql3lwdoAkoYiR98IetRxUmc/LhDPc0kHZMXNf6BbNFj9u0GNDU5GWceiJdyZz4vyTGYBL6YHJTlg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(136003)(366004)(376002)(39850400004)(396003)(451199018)(186003)(6512007)(26005)(5660300002)(478600001)(53546011)(7416002)(36756003)(2616005)(316002)(83380400001)(52116002)(44832011)(8936002)(6486002)(41300700001)(31696002)(2906002)(6666004)(31686004)(110136005)(66556008)(66946007)(66476007)(54906003)(38100700002)(86362001)(4326008)(38350700002)(8676002)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?YVlyUHdpenZrWkxGODZ3TnByMmx2a2RzZkdDZ2taUThwRXdWelIrYm1kYzlT?=
 =?utf-8?B?VjZDMFYxSFUwZVpGOW1ibXpNT2o2OWVsTmQvbFhwR0NuNS9saTErVHhJQm9z?=
 =?utf-8?B?dkFJRDVTRnR4MUw2NXhRQTdSa3Yra2llekg4eTZ2ZDBscEJQa2NXU2w2anZ4?=
 =?utf-8?B?OFF2QnplcmNLS3o0SXlrYVJSeTY5UVlDenpNT0tzNXl0TEN2V21ac2pRUHV0?=
 =?utf-8?B?OXBIbFJGNUNiWEdpZmRORDdmblRDSWw3VUVQbTA2WkpTOStzOVd4RDBEelU5?=
 =?utf-8?B?NlV4Qzl1cDBGemFXNEo4cXliN3lKQkJiL0JxUTNpa0FYb0JJcUtHMWhXYnIw?=
 =?utf-8?B?U0R3OTFhYzNhQ2RqTVViL1kwVjIra0k2VWJXOHBtYnBCb05SRmdYSkdyMGda?=
 =?utf-8?B?c3k0d3hsU2QzRW9IWWU4TDBlZnlvVUN0V25ZendoaG54VVZ2YmFOc1JLaTB1?=
 =?utf-8?B?RjJGNjdxZ3dpSnUyRHJkQ1IvNUYxMnhBOWxLOVdqRDNmSC9QTXF1NGxYVUpG?=
 =?utf-8?B?YVB2S0J1dlp2d0Z0M0o4a1FVQnFra0JxWGVVN0lOTmhlMGUyM1JFODVQWXJ6?=
 =?utf-8?B?dTRYaE9VdEgyRER5NXVGUnBKMGVjMnFOc3R1TFFJemR5bFJmRStIdStXczZY?=
 =?utf-8?B?Q1Zndy83cnd2YjhvM0w2a1ZWaUtRdm1SWnRIVTRMSG9UTndlQXdIWVQxWEtK?=
 =?utf-8?B?a1F3Q0RHdGxOV3FQMmpVWW0rM2VUZ2NYODlpajBxaXpDZmROUmNhcUdreUc4?=
 =?utf-8?B?VGhNd0p4QlVKM240K1cwMmZXZGJHaTE4Q0VSelhORU9MZzdacDBxcFY2MnJS?=
 =?utf-8?B?Sm1DZFdSZ3duMnYrdHM3aU42cHJGTGlWQnhUQU9xMy9nbWhGNzlueXpla1RO?=
 =?utf-8?B?NEhaVjdNRmhLWGlibFZmNytQN3J1MG84bzRFY2l0dUtvdFAzT21hR0NrTy9a?=
 =?utf-8?B?T1BEb05MWHd3TmtmdGxxV0lrVDFMa2lmZzc4N3A4K2haaTJYbVRiN0N2bExx?=
 =?utf-8?B?TFNPZ2hRVWpXd2NBOXNSRmo4bG4yUUF1Sm81bGVNMFJJWDV3R21yVU0zZzhK?=
 =?utf-8?B?eVE1d2JHYWU5Ny9uRjRzOEF2MUxvOWtJWjJxdmdHSzJDWU9xcHQ4cEl2T3Ex?=
 =?utf-8?B?L1U4dXRPcjRXRnFEZ0E4RTZuZ0pUYmI2TkR3dk80S0o3VkR6RGlOL2NjQVgx?=
 =?utf-8?B?VGVwWHI1Mjk2RkppdVFYS3RyZk1uUHFsWWJCWnZvTzdORXBna01ZbXZHSEIw?=
 =?utf-8?B?QmRWdEI3TC82V0hWb2QxQWg0RUlMYndJQzJaZDZYeXJGb3JvMGxQa0dKVzM5?=
 =?utf-8?B?ZGJ6djNNNGR6UGo0cGpTRkp0S2tZOEVQcGFvRWpCc3R3bk1YQzdUVHI2TjRx?=
 =?utf-8?B?RStzVkJna1NqUHVlZHBIRTdadVB3cGMvRStmdCtVL2xLQndETTErU1JKbXlU?=
 =?utf-8?B?OHp1NDFWZU0yelJEMDNsbDN3aERmdW1xY0JwUkZXODQ4OENOWnFreWpNL3JK?=
 =?utf-8?B?ck9CaHkyM3c5VVpEMlYzaXJjVXFZWnMvaGY1eUNja2FCTW9YZHJ3RVB0aFVt?=
 =?utf-8?B?MDBSU0IyWDRVYTkxb2dlc0d4V3d3RkdRRG8vNERQMmFSUGx0aGF0aVVBSEk3?=
 =?utf-8?B?NWlxQUE1eTAyUUZxK1dYWldqRDBRYjBiajJ5eWk4NEJUdGIzZE1VdWI2eDlM?=
 =?utf-8?B?Y0t0aUhTbWY1MlhjeEppK25icDQxZCtVclhHQW0vU2dMZlFOTVJhcm1PaHND?=
 =?utf-8?B?SCtYQjNseGpzS2ZPK3RGbEw0R1ErRHpkN2p6S0JRdm5SNndsMm5zTUtac0Rh?=
 =?utf-8?B?S0t2TG5oUGsrL3FTNThEQzhKcXZSTVYrR09YQUdEVXQ0UHNaMnZrRlNpODE2?=
 =?utf-8?B?ZEI0NVRBSzZFQnBQZDlFeTByMDdzZ0lRc0taSXpIcHNJWlgwWkVVUUErVnlv?=
 =?utf-8?B?eFkzTWJtS0ZoODhPL1VxVC9IZ0dwUlI5MkdGQm92U3NJZVJxTGFWNklVbUg0?=
 =?utf-8?B?Q3Nsb1lQUlhnZi9RNFdENVVrbVZwU2NqT2g4ZS9wWmFKb0drZitHTUJoODZW?=
 =?utf-8?B?Rk9hYytQcW5HL3Y5aWtKVG1Ya3R6cFNzQzJKRE5UVzNLMzF2TDNicTFNNm15?=
 =?utf-8?B?TnlTdXZSMi9SamNqVE11Q1VKQTJ2Nlh5Ty9VUElISW8zSEs1MTRQVVY0cG1Q?=
 =?utf-8?B?eVE9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 111ca23c-dd93-4c03-f84c-08db0082b77b
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8847.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 16:22:42.8722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O1iqsFKdc/XOm9Uf0U6q1uxH3Dpca0RtXpip1Ucvvfi7eXpEVrPzCfmRejoXyWs5JAadz3r8MgfDqfVE+B7NwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB9871
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

On 1/27/23 11:15, Krzysztof Kozlowski wrote:
> On 27/01/2023 17:11, Sean Anderson wrote:
>>>>>>
>>>>>>  .../boot/dts/freescale/fsl-ls1046a-rdb.dts    | 112 ++++++++++++++++++
>>>>>>  drivers/phy/freescale/Kconfig                 |   1 +
>>>>>
>>>>> The phy driver Kconfig change shouldn't be part of this patch.
>>>>
>>>> I put it here for bisectability, since this is the point where we need
>>>> to enable it. But I can do this in a separate patch if you want.
>>>
>>> From DT ABI perspective, it's already broken anyway if you need to change
>>> kernel and DT atomically.
>> 
>> AIUI new kernels must work with old device trees, but new device trees need not
>> work with old kernels. So a change like this is fine, since the kernel won't
>> touch the serdes if it isn't supplied.
> 
> You used the argument "bisectability". If the patchset is not
> bisectable, the ABI is broken.

Well, because Shawn wants it in a separate patch I am just going to enable
the driver by default on Layerscape before adding the device nodes. That way we have

1. Base state, driver not enabled and node is disabled
2. Driver enabled but not used because the node is disabled
3. Driver enabled and bound to node

So there is never a case where the node is bound but the driver isn't enabled
(which would cause the ethernet drivers to fail to probe).

--Sean
