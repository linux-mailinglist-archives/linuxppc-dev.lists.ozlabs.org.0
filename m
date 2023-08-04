Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA3476FBBB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 10:11:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=oYULoz7s;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHJMS2ZHcz3cKh
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 18:11:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=oYULoz7s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:7eae::600; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=michal.simek@amd.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20600.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHGfC6DtKz2yVs
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Aug 2023 16:54:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MW2pkxokegBFezRT9Wxq0ANJMcmUiv19KHff05ITOWkc5M/k82dEOm7ZlS+pQGFidYJPfT6knkGDjsXBEPJxLiV/KopkvLwKFrLSNvfjlm5aeElP0Ho76yVw0sfXzTCs7Nr5xYieuy04bRN8HVs/qex8vHcm78lA2i0Mec5L9X96hvJWl/2W6yKQHCczr5HgD6LKDe0n2Q5X58NCoEpcZSVgGU6joyARAHY8F87tT7/0zEvswc5Elbj9G4Ko/cqXgPeRtc1WHwPefrsVbdCDCeD1BOE8OYMtx2EW3TaO1/UdjMcXj7FJpGEN+aSCNKJkcfvtWk5N9GpdPdtu+OOCvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2KEwsBEQ7qiNRWitlMpLSRZanyy2RY6Kv4qzvCqLpb8=;
 b=atgvMtCiHruuKOMDzw7Lxi3dz+ATkrv1FOLHTj/QA9yo3cBEQbmVkP3GhWaTXv60HKL99GOdMlD4jgBqVfC1hxdPP7mNU51JYbthAODgNRveUfZavTyVR6XLDc6Vr51WWksa1f9WiQnmSnxfSdgZt2qGF5sJzFZZTYj6MB7KMOG7rCOe9vQ/FNZiLAdkU2PcUPM+tQ+bLMS2szTaWrHiVIlZ2Oat/4FV5jEb5sQW+wZgJXuF+QDCGADksOvfxz0/OpPuKFUHZLYWjtKAmtUpLWUi4RLyomoKZ+ZLorVXcAYnu/k2YBLhrwJCzHq5cuErVj3O9BGf57W9/77KnqLiGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2KEwsBEQ7qiNRWitlMpLSRZanyy2RY6Kv4qzvCqLpb8=;
 b=oYULoz7s+zITkfbVrDZbutftXMJu0MduPo63QqIQw9ZI8JqbRrILsqzcCkknBqybbgX6xJec1KsO2x2wL0GwgalciJL+eNa7WJrUfahJvzIxRjWGbypGEJl0QSeHraNfYW5uL4E9N/qZVqhImF4F/AoA92b8baR3crD/NfGy9sk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4758.namprd12.prod.outlook.com (2603:10b6:a03:a5::28)
 by DM3PR12MB9285.namprd12.prod.outlook.com (2603:10b6:0:49::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6652.21; Fri, 4 Aug 2023 06:53:51 +0000
Received: from BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::dc36:145a:99ff:f834]) by BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::dc36:145a:99ff:f834%6]) with mapi id 15.20.6652.020; Fri, 4 Aug 2023
 06:53:51 +0000
Message-ID: <79a6d0f0-19db-5172-4102-ba74d359a07d@amd.com>
Date: Fri, 4 Aug 2023 08:53:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH -next 2/2] soc: xilinx: Do not check for 0 return after
 calling platform_get_irq()
Content-Language: en-US
To: Ruan Jinjie <ruanjinjie@huawei.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, qiang.zhao@nxp.com,
 leoyang.li@nxp.com, robh@kernel.org
References: <20230803104807.814005-1-ruanjinjie@huawei.com>
 <20230803104807.814005-3-ruanjinjie@huawei.com>
From: Michal Simek <michal.simek@amd.com>
In-Reply-To: <20230803104807.814005-3-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::17) To BYAPR12MB4758.namprd12.prod.outlook.com
 (2603:10b6:a03:a5::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4758:EE_|DM3PR12MB9285:EE_
X-MS-Office365-Filtering-Correlation-Id: 39570827-8e37-4e32-ed3e-08db94b78f75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	HjcdD94LeYF+9+833w5e1mQ9KkI9ydHwGOZDpGbCD59DZU2DHgW9f7eXFbV6bTS/auY35vd3JERD+OkfLaKCkcJBF2GDmTQjYMtkl3llnQmtWDuygtFf8JUQvXPKaIfvoNsMhUGTzlZc8vJWhXv4cQ/wGZw9cAr9iFv240ZMZmLD+al6MBhIEJDKHnFdByMynQVbsw6/iSGhGBt/p7QuP7j3FtsLO9P01btTocqIPNbiK9x6rfTbHcddzJeFPmsDI+XZLlXSwY5WYTg1U0WnqINDcI52Bx6M07YxDPI/lZElW+C7V3pHx31a4hBJX9o7uFx/D2f3ZdYoqnjNmgpCHYOWOz1+pl4V9/7wLvHPK4XulRokJ8tvoZM6xg8I54Sij3MLYsl8gJbsLywvdY2X85cJeomQl2fbelCSsIMbr/+KyeSXwilabZ4xMKpwYSY4NV/066zdzOWnoXnG5yJqWOwUtDX/CmcSioEqY4MdPtkDmQDMWw326QmxfGZoMsg++upxYTJq8dcNGwEOK8/1cvGTjVvSN7ECBCVGQ5/LStFWVMWDjcuGihDu+xRytMk7dnIru6WMBo9tCKnu1R92DGRR+Qn2WnAfIsTfT3Z8MWOkLEMNF+RmnnK7YubkYJ2l7zw6yyKDsZ/3xwplmLSCOw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4758.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(39860400002)(396003)(366004)(186006)(451199021)(1800799003)(44832011)(66476007)(66946007)(66556008)(2906002)(38100700002)(2616005)(53546011)(6506007)(83380400001)(86362001)(6512007)(31696002)(26005)(478600001)(36756003)(6486002)(6666004)(4744005)(8936002)(8676002)(5660300002)(41300700001)(31686004)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?NTE5OW9TUXRXK2d4RmlpWmlGQm1SanVDU1dCN25mWXlnbmFzTHp4L1hKa0RQ?=
 =?utf-8?B?ajBMSW44WmdCNWh2ZzIvUHZ4bEMxeGtkQlhRdmdqT01YSUFab0RrckljbnZz?=
 =?utf-8?B?N1AyWWpsYnBKREdJb2k4SFBZOUJDRitvRjZRUkl0dnFONUoxcE5LSEFaZUJE?=
 =?utf-8?B?ZG5ySEZOckdCTzhEcGVZK1NnbkhxUFZ4eWx3QTZjU0dyWmc3eFpZMCtWbTB2?=
 =?utf-8?B?elVHTnNXYlRNNFBONTNoSHBTTndVUDFtaitZZ3BnQ1dHZzh6QUtIZGNodjJN?=
 =?utf-8?B?RkZpNmppZHlnZkNaWm93VFRVTmNqY2ovN3NRTm45djdRbVpBb1F5bkk5TEl1?=
 =?utf-8?B?cWhiRVlITCtOeitPWVhZSVpZREExK3lJRXJMM09yVEM4blA5STREbDl3U1VR?=
 =?utf-8?B?L0JuWkJFSmdENGY0VXVrcW11NDNaNDJSanRkRWxhUXltdDJVcTh1bEVPbC9a?=
 =?utf-8?B?TkovM0hmV2w3VFVCanl5c2FYK0tjME40QlJEcWEwTnFrQ1VoRGtmRE1DM1o0?=
 =?utf-8?B?anpaQmF0RFM3eWZDc1JmelBCQWdLdmpzVzZzc2dPOVEraGo5eSs4aHlpajdK?=
 =?utf-8?B?VlBjc2crSzFvWTZCS010bjJQdVVCZ2N5UjM5SmtZdjVLWmtpSEE4YjlWUzNM?=
 =?utf-8?B?UTA4dXpDMXlVSTRzZGRyWG1GNE1RZXFMem9hRWUwRW5TUlgrWC9iK24zb1JH?=
 =?utf-8?B?anJVTGNOL2UyRm1nMWlWbkhOaTI4UWVSMFRlWWlOLzlvVjdtbWpkUmw2YTlJ?=
 =?utf-8?B?SUZaR1R6bVdSd0pEa2VMeXl3S2ZjRXlXaGh3WEJUSGcxaDY2M1ZieWVoeXRm?=
 =?utf-8?B?TllYNGhreUZRSWF5OUtNcE5mRm9hOVVBZEp1ZFhpMFhDMlFsL3ZJNGpoNkRO?=
 =?utf-8?B?V2kwRG5kNGowU0djelRoWlk0V2xhUjVGV0o3UittK0JoTkVjTmluNzVrWEY4?=
 =?utf-8?B?UGN0K1BLdy8wT3RTeFZpZ25nYXFsc0NGNTl6U0lFSm92RUZ3K29rRTA4Ty9o?=
 =?utf-8?B?Q0F0K0pXNzFhTVZucFU2S3dQNEdwWlBBanN4b3NFck4rZVI0WjFaQnBXaC9J?=
 =?utf-8?B?MHRKMUhNREphYVJBQmY3OUtRMmNQUDE2dk1nd2pkajB0N1Z5bHNOcDNkOURN?=
 =?utf-8?B?ckxKS0szV3lyL213Y2NnY1VVdk5vVHhOUitRRlBsQTVlNXVFRzBMVjlJMnNl?=
 =?utf-8?B?dU5rdW1Cd3k0YjdmNDZmWHppNWpXRkRBd1JUYVN0Y3R2OTIxakFIRmdEb3lk?=
 =?utf-8?B?Y3BHdG52aHlTY1Z0aExJK0JLZkJKMVpiajFxd29IUkllRmN0MHRhQWRLOHBz?=
 =?utf-8?B?Q1BxUjJPeHVhZXUvYWF0RExQczNQeS9XaFBRL1RPRGJVRGR5RGd6U0hSTkZu?=
 =?utf-8?B?eTFKRC9FUUJRQktlM04weDZsSFFNaEYxeFdzdHkyVjRva2FPUzNTdmg4NUtD?=
 =?utf-8?B?UnREdkVzcGxCSUE1d0cxM0IvUnR0WS96YnhoRU55V2VhVkJtaFZvVWpNNno1?=
 =?utf-8?B?UU5kQy92amd3ZUcrTmwxL3U4cmM2OE1pVmwrZ2hlQks5THNDV2h2L2ZVdklh?=
 =?utf-8?B?Q3ZrNlhMQlJ2SjAwaTlDWnVNaHphcWgvaDVDelY5L3Z2b3lxcHArZHI4NHBk?=
 =?utf-8?B?R2F4NlRzUUpkMkFwaWpIQmZYZkt4cDVFNnYyUllZcjlzK3B6aWt4L1pCdWl4?=
 =?utf-8?B?Z1RvYXRXajVwL2pQdHpYNFBId2puQ2ZpaUt4NUZGUmFoaUtDa3IyeGxiWnpF?=
 =?utf-8?B?Q2srWEhDTk9uWDY0ejh1MWNCMFVQOHhUZVEvMXRabG15RTdPRUlkSjlBRk13?=
 =?utf-8?B?aUdNTjdnVGVseDFUUWxYSFFFOHJVTEtwYkRVdWhXV3JEK2gyY0lKZzRwOWFj?=
 =?utf-8?B?amRKU05aS3BzSGhUald5b3psckdYWmJYb2U3eGF6aGY4blF0U3Y4dVp4a2xH?=
 =?utf-8?B?em9UUkYzWG5PVGxHMksvbU9LSUhnTzBQRlhzeGxXb09ZY1l3eWY5dytQcGdP?=
 =?utf-8?B?Sld3KzR0VW1RSTRFMDR1Vk8wQ3lickFoOWMxZ25Dd291WDZjc0pzbU1NbWRi?=
 =?utf-8?B?dUNHeEtna0dUbEVUcnhkOGkwVmhnUndHZ1V6VWN5S0JSWFNkemdEcVBaNm1i?=
 =?utf-8?Q?6m/ZZsUdbeXwH/g5sp8owRn7O?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39570827-8e37-4e32-ed3e-08db94b78f75
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4758.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 06:53:51.2330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: miOl+PWyD25Mltgp51AWtm5bAQsojz9xthhwUsKbvh+QqGAZoR71dY9VOkjm0jsO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9285
X-Mailman-Approved-At: Fri, 04 Aug 2023 18:10:46 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 8/3/23 12:48, Ruan Jinjie wrote:
> There is no possible for platform_get_irq() to
> return 0. Use the return value from platform_get_irq().
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---
>   drivers/soc/xilinx/zynqmp_power.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/xilinx/zynqmp_power.c b/drivers/soc/xilinx/zynqmp_power.c
> index 641dcc958911..eddfc8141a42 100644
> --- a/drivers/soc/xilinx/zynqmp_power.c
> +++ b/drivers/soc/xilinx/zynqmp_power.c
> @@ -242,8 +242,8 @@ static int zynqmp_pm_probe(struct platform_device *pdev)
>   		}
>   	} else if (of_property_present(pdev->dev.of_node, "interrupts")) {
>   		irq = platform_get_irq(pdev, 0);
> -		if (irq <= 0)
> -			return -ENXIO;
> +		if (irq < 0)
> +			return irq;
>   
>   		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
>   						zynqmp_pm_isr,

Applied this 2/2 patch.

Thanks,
Michal
