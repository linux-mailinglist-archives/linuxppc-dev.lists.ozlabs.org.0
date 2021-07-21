Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 451BA3D08E7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jul 2021 08:30:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GV5LW1kYPz3bh1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jul 2021 16:30:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=rbYf5/VV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=amd.com
 (client-ip=40.107.94.43; helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=christian.koenig@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=rbYf5/VV; 
 dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2043.outbound.protection.outlook.com [40.107.94.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GV5Kx4D3lz307P
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jul 2021 16:30:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BU9E0hxz+uYDEl++AJ2Abzhm+Eg6/GqNHTLeDAFexaEUxroIFu6EWZjOM/0gBYDzPKmbDx/7d91EdDYH26POuZ6GhbqHyZR6/YJOJn7vpLhzU7NkFrPxclrAbyUVyi+8rk3E1Ussn4ccOdcabWou8zIJ1VFOXdPOuQII0m/lk9ZNEO83yZO2O2ZfYe0729oR3xOGqH99YejHR+7wwFDzmzK76Oet8xIkUmWe+f/83qI0uXaQ8si7VjfEQlLa8bD0uVro1nz5agQk12Tb3wkehYzZlxgTkw6uMTvOleXnPZgCLJYDv7w9mb4Jdyv0ognFuicF7kRKJcIy2OtIBLuPXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0L3NYfxl7Jh+Aqaji4qWsO3N/pEbycEakUpEpBnKwIs=;
 b=VVZH755dUS+UVxTADN10jvF4tYl/hTXayqIP+H4VVov8yG1lNp0cvJczvngIwu5mmYBecd7ZZLqQT7zTjA+iUPB8kXDtS2dLKoONy+CHyAsLQJhnUtlHaCiTZqPJNG2DwUgE8s+pEYb4sSFERkdU+kuQCSgDLH09XKZoHXHOnEiSfpPRpb2zfMdng1rH2sxpzraaPHJpgQBoXeiifWZHfbfBXFB+2GcMIedZnzhKJUQaSJ8M5lY1J+BnSkX9f4WP7ZAp6D21NTcvKdH85cfnt+G2jYl4CFvXWh7vdf61zgr4bqEp12kQvaSOP8bMJ3uw7R0oDXXGjSZSbgSDKcRY+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0L3NYfxl7Jh+Aqaji4qWsO3N/pEbycEakUpEpBnKwIs=;
 b=rbYf5/VV9GZlaxBgyEcciIQW2qUrH9jY3wkHpX16+PSHmA9P/xw0E8hLMVRdjPdKPBEKxYtnLzO6OnxwFU8lvSjslHaem0M7/6Vew8POFfbeDcZEf0cjDREX78gke2Q1m/8J/BNz7/e0ScULE3mrc9ump9ClXHKdn32fRTwghyw=
Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4900.namprd12.prod.outlook.com (2603:10b6:208:1c1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 21 Jul
 2021 06:29:52 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 06:29:51 +0000
Subject: Re: [RFC v2 2/2] drm/amd/display: Use PPC FPU functions
To: Anson Jacob <Anson.Jacob@amd.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, christophe.leroy@csgroup.eu,
 linuxppc-dev@lists.ozlabs.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20210721044801.840501-1-Anson.Jacob@amd.com>
 <20210721044801.840501-3-Anson.Jacob@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <9094cea1-602e-6e71-4ff7-c06fd04af6c5@amd.com>
Date: Wed, 21 Jul 2021 08:29:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210721044801.840501-3-Anson.Jacob@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR3P191CA0048.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::23) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:9bcf:837a:d18c:dc66]
 (2a02:908:1252:fb60:9bcf:837a:d18c:dc66) by
 PR3P191CA0048.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.22 via Frontend Transport; Wed, 21 Jul 2021 06:29:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f18e7f81-4500-447b-248e-08d94c10f21a
X-MS-TrafficTypeDiagnostic: BL0PR12MB4900:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4900E41270466B9D4CF3E6F483E39@BL0PR12MB4900.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d3zUN2NI8QRMRyNReMs6ZzpRD3UTuY6vfbFiAoOsmMblbuMWPwevqkOTrk8GYEHeyZFmDbFq1kXT8wWxyvUawfij6ePhEt1nw0jixcXeq1HdJFJmGU1VBzm7oP/948NkZEUU0QIngTSLhmPENyxNcUpShoGGpagQjIPWsNNGiFCSaRT5WNfCvCqZ8Srh4ftkHrwDJjul+peCUfLPvY2rT+Kb+T4LqYu7jYzMmwzCnCd6M9unOmGrS0u7BRUQRmRjwTDR11CHs5tqZ6apn5mjAUP4a6/1M7LAXZZsotEEPvBL7NFMkEB0kggKHJNTk0znXCu4HEuqXD/7prw7lQUxBTJjHd5F4Jv2FGJLJFSoBPrahGgsxK7m/k6pioZY0n/GBYjNq0EBq302heXM7jNPtvznqwmeHuwAgJ4CqZrNlWvJQGesiaOWGOXLmf1vBhnGO3w48yAX4RkDTjnSTkZrZ4HJev4CF4G3tXv+pBtMYsw/xQGWraa8wBJGtdjAJ4gdUqM9xWcMLut7y2tq5kB5b09ZWllhmm76m2CF1Ct+VUIYcdmUjsS2YaRtjR2VWZRh8O9P2Xv6pRepmRNrsyjRde1IxZ6j8TZ4csN4ofFgzSLIvHjMda6qLPsGR2lTU1Fggs2gy5FzG+MdiEV2FhJoHyw4boBqeUl6nXjr3JAZ4CqCjICYt7HeWLJvwUHPDsNTrUyUbf1Wf5Mrp81VOJW4EzIegWBdfSPB3QBaiqKr0Jo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(31686004)(8936002)(5660300002)(316002)(478600001)(2906002)(6666004)(8676002)(66556008)(66476007)(66946007)(83380400001)(36756003)(4326008)(2616005)(6486002)(186003)(86362001)(31696002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDlaYng4bFNhN1c2MzhxQ2ptWU9MQzU5UDlJek5ITU5laHNRQ3d5T05TcFhs?=
 =?utf-8?B?b0Y2dlY4YklwRDRHdVp4Q0ZDOUprd1RzTmw0VktkK3FoUitmVzUxSUhVbWpY?=
 =?utf-8?B?cGlEUmRZUG9NdUhybEtCNFBJazZLZTlMSWpYRGYxVUFuQ1QxY3VKRmlSTXlF?=
 =?utf-8?B?Lyt1UFlYdEtUc0hUZUpCdHVITEZIdFhLM2dSdENlbWJzdExTWWlrb0pVODJ3?=
 =?utf-8?B?bFhmUG96Ukd5SzVGUGh3UStaRWk3M1IyMldxVWZlVjJ1c2JadjJXWEU0Ylk5?=
 =?utf-8?B?YTR2YzJsRmduVCs1OUFFenVIUkdpV2dQZ1lwZW9qczBSaHVmRkNMN04rdFlu?=
 =?utf-8?B?Ny9hRlBCWVFyc1FjZ0RGY2hBWjE2SDA4dnduaGVsTzFBbElxUTV6U3NhQXN2?=
 =?utf-8?B?ODQ0cEp1U3lIL0UwWlJVa3MvRlIzQytzVVBxNlk2YzlMUjlZVmhqa3lrS2FT?=
 =?utf-8?B?SzFvOUdtUU1jQ2FmUnVVV3ZQRFd0M2IxZFRIbnZDaSt2b2NOY3ZDRnFZL0ha?=
 =?utf-8?B?Wmo2NW1ncUFFbHBlU2laQlFzZldJYU93VzRRNWF3ZElEdDBUUHBqeHh2aGtw?=
 =?utf-8?B?MG13ZlRoSUdWaFhXaHNPUjZvWFhXQURHbXR0UVZXTUk0bE15cHl2bEEzRFg2?=
 =?utf-8?B?ZXJaK3F6dElhUHZtNkJ2RmxxZmtXTDdyRElObnFCSjdOck1wbkZsS2VJTUZh?=
 =?utf-8?B?SnVNK1dpRkt6dC9aQ0I4eEtyclhhTTRvbXZ1YWxpcThNZEZBQUdUK1RTTTNs?=
 =?utf-8?B?ajY2U0RXUkN0cittbDBMWXJ2QTl5dmdRUFBmMFV0NmZyUnVHckRDSmk0MURx?=
 =?utf-8?B?eDF6dkl4d2dIcit4aGVMTnU3SmNoazhZNzF0RWNmWUMzZWJtOUpzNWRPNmpH?=
 =?utf-8?B?bGpnOHBvZ1BiYlJZdnpmejRNcFlZbkc3dGdCWW1nam9nQ1N6V2NDZmtsZVZ0?=
 =?utf-8?B?VUgxQ1N1M0JuRjZqL3ZlQ3g0RjY1ak9CbzN2ZzFoTWVEYUNFYWZBbS9YNzZl?=
 =?utf-8?B?Y2hUTk5UMXRvcFJnMlM1T2tlMVpBYnJzS1ovSjVkK1R1d2dEZXZaNFNxMnRX?=
 =?utf-8?B?RitiS1ozWFBNUVJFMnJjb212dGxxenhtTjBQWDZEczNkNWVWQm1oZU5iaEVQ?=
 =?utf-8?B?MGY5aGIyRkRHUWRYa3hkS3lNMUNvdk05KzhRc0hxR3RvRGUvdFFYQ3lBMHo1?=
 =?utf-8?B?cHoralFJbXZLSTlSenZ0ak9nQlUzUldLNWpqZVRSbUpucDFjM2tLcENta3Ju?=
 =?utf-8?B?ejh3dVB2QWtySmZiWEpjMzNGRUdXbjc2VUVMVjltOEdFaWQreGtXYkF0N0lz?=
 =?utf-8?B?STFCcFZoNGFnSXh1SC9ZWXg4SDZCZ01qV0xHa3pKdGkvOHVnQm1YSTdRNTF0?=
 =?utf-8?B?RFVJYXExK0lsRlVvdS9xa1lXVnd5SzArS3k0ajl5aFVSQ0VZQWpDUmdkM0pX?=
 =?utf-8?B?cXlYbThoUnNxcUVIVEdhOEFhNU5Ia1d5Y2Z6ZVd6UlN0YVpvd0ZNODFnRVJH?=
 =?utf-8?B?SVhRem5FcFVsWHpVb1VhS0JJY0RtT1JDK0w5TW93SVhleEV6WWVYRGtjMlZ4?=
 =?utf-8?B?SXJTYStEMDVsYXFTc1JOdUhVL2YvMnJoaDIxOXNhYk4vRXFhMGN0akh1Smtm?=
 =?utf-8?B?WFpRYXphZXc0dTdwNitiY2xBZUxuM1phS0NTZ0JlYy9INDVzeWRDSklkSER0?=
 =?utf-8?B?OHcxY20vQno1MG4xUUVYdXNiWWNyNDNaQ29WWjhzV3RQVktWRng2dlBBUlB2?=
 =?utf-8?B?YVBhSHhIY3BnWnFlSGRvUERxV2RZRkJVeTVmTFErSFF4N2NPU3J2U0xZenAw?=
 =?utf-8?B?U1hIekpLTmVJVDZLNHpwVWgwYVZVM2ozMjRiNFBKb2dpcVh5eUtLMGxaNzZR?=
 =?utf-8?Q?VQlRUShQxBpWv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f18e7f81-4500-447b-248e-08d94c10f21a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 06:29:51.6372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n3sqKnhZ0gTjmw/XeINTeYnN8TEXJHK2tsJTwLEKmzSE3ESanNMI8GfnDIFXgeTf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4900
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
Cc: Sunpeng.Li@amd.com, Harry.Wentland@amd.com, qingqing.zhuo@amd.com,
 Rodrigo.Siqueira@amd.com, roman.li@amd.com,
 Christoph Hellwig <hch@infradead.org>, Aurabindo.Pillai@amd.com,
 Bhawanpreet.Lakha@amd.com, bindu.r@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Am 21.07.21 um 06:48 schrieb Anson Jacob:
> Use kernel_fpu_begin & kernel_fpu_end for PPC
>
> Depends on "ppc/fpu: Add generic FPU api similar to x86"
>
> v2:
> - Got rid of macro switch for PPC as header file with same
>    name as x86 is added by previous patch in the series
>
> Signed-off-by: Anson Jacob <Anson.Jacob@amd.com>
> CC: Christoph Hellwig <hch@infradead.org>
> CC: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> CC: Harry Wentland <harry.wentland@amd.com>
> CC: Christian König <christian.koenig@amd.com>

Looks good in general, but question is what about other architectures 
like ARM?

Regards,
Christian.

> ---
>   drivers/gpu/drm/amd/display/dc/os_types.h | 29 -----------------------
>   1 file changed, 29 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/os_types.h b/drivers/gpu/drm/amd/display/dc/os_types.h
> index 126c2f3a4dd3..47ef434f93d8 100644
> --- a/drivers/gpu/drm/amd/display/dc/os_types.h
> +++ b/drivers/gpu/drm/amd/display/dc/os_types.h
> @@ -51,38 +51,9 @@
>   #define dm_error(fmt, ...) DRM_ERROR(fmt, ##__VA_ARGS__)
>   
>   #if defined(CONFIG_DRM_AMD_DC_DCN)
> -#if defined(CONFIG_X86)
>   #include <asm/fpu/api.h>
>   #define DC_FP_START() kernel_fpu_begin()
>   #define DC_FP_END() kernel_fpu_end()
> -#elif defined(CONFIG_PPC64)
> -#include <asm/switch_to.h>
> -#include <asm/cputable.h>
> -#define DC_FP_START() { \
> -	if (cpu_has_feature(CPU_FTR_VSX_COMP)) { \
> -		preempt_disable(); \
> -		enable_kernel_vsx(); \
> -	} else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP)) { \
> -		preempt_disable(); \
> -		enable_kernel_altivec(); \
> -	} else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE)) { \
> -		preempt_disable(); \
> -		enable_kernel_fp(); \
> -	} \
> -}
> -#define DC_FP_END() { \
> -	if (cpu_has_feature(CPU_FTR_VSX_COMP)) { \
> -		disable_kernel_vsx(); \
> -		preempt_enable(); \
> -	} else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP)) { \
> -		disable_kernel_altivec(); \
> -		preempt_enable(); \
> -	} else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE)) { \
> -		disable_kernel_fp(); \
> -		preempt_enable(); \
> -	} \
> -}
> -#endif
>   #endif
>   
>   /*

