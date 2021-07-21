Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FBB3D0B70
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jul 2021 11:25:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GV9Dj1Lyqz30Gx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jul 2021 19:25:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ITMXl1Lj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=amd.com
 (client-ip=40.107.243.87; helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=christian.koenig@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ITMXl1Lj; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2087.outbound.protection.outlook.com [40.107.243.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GV9D76m87z2xZh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jul 2021 19:25:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VR4AIM7ShQJuQYBNgodzglRnHZiI/NKh1Ek/gt6aAnH6QjLfAm0Edlinhbs7heaB+2S6IDAgf4FTawQybEGfxkWNxR23+3WUMIy5ANTLLEjGFGYOcjr4kV1q9zKf4y2CD5MMvr8BjcAVmkCDePMcgf1nG5r5CoOmEualZolKAujY743Z8BHOr46pi5B0SgR2EfKnI8mF3iZtYoPF5VYZD0TVOK4khhSSQl70ndBR2ZTERMnyEk/PjgUHgWWlXXWEBuOv5bukbi2jwTybcJO9QkaGw6pTzbpzk8tIZpxjUoiDZPZguPuT68bYft7elgmkV0ERNuWt7/E2XWYuLIpGrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1BFGaixkxZdkRR2bddfb1VJH22Pl3oS1qYDHoyyY2c=;
 b=PRTWW2eGTYteEeSEYvnrJQvwlU1yhb/l9Qr514rcTXAFelbbx/qRqVEYlWXahQkCrP41kDaZgMrfOLov27hoYDY4icmAGOWcfJ9LDjTfNwQnrdtj9Mv6OqYOCOZ5GR3/Xq7PWfb7B+ajpWKv5QE5dLipvM7szud0lVS6N0THhqjjmwreqTqbhQSzG/b8EDzOJlV2gsvZyR8fYb0c69WEBmBhexaT/5yFjn7oualNRvhAFaMnY+9MyGu8xtR14oDrEjFMPtSKafoXxE4Wmh+Xh2JFSBfo7HaiPctGZEW3jMeCbB0ObBz3Na/LkmlNPT2xy7FSOvi++GQjuYBe4M5QRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1BFGaixkxZdkRR2bddfb1VJH22Pl3oS1qYDHoyyY2c=;
 b=ITMXl1LjKHbNxOvFA5UZxE+JuSOXwRBhu4MsU48dMDaCyUbOgNuoKT+7YuTsVnRwpU9IcFYuJq3yiRTf2Pgkqhx3m7VpE/eAw/TaW68fVWQ/sZBKEHff0vn7+lqZTIBPyX8KECqBaqPSmhd4KIGbgDhph5gHKkp0caTD7PfSjeE=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4047.namprd12.prod.outlook.com (2603:10b6:208:1de::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Wed, 21 Jul
 2021 09:25:04 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 09:25:04 +0000
Subject: Re: [RFC v2 2/2] drm/amd/display: Use PPC FPU functions
To: Christoph Hellwig <hch@infradead.org>
References: <20210721044801.840501-1-Anson.Jacob@amd.com>
 <20210721044801.840501-3-Anson.Jacob@amd.com>
 <9094cea1-602e-6e71-4ff7-c06fd04af6c5@amd.com>
 <YPfECUtD0SRCjrSm@infradead.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <6d49b3b3-7772-3559-dc1d-246915e72512@amd.com>
Date: Wed, 21 Jul 2021 11:24:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YPfECUtD0SRCjrSm@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM3PR05CA0095.eurprd05.prod.outlook.com
 (2603:10a6:207:1::21) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:9bcf:837a:d18c:dc66]
 (2a02:908:1252:fb60:9bcf:837a:d18c:dc66) by
 AM3PR05CA0095.eurprd05.prod.outlook.com (2603:10a6:207:1::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.22 via Frontend Transport; Wed, 21 Jul 2021 09:25:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 160c28df-4443-4e1b-fa77-08d94c296bf1
X-MS-TrafficTypeDiagnostic: MN2PR12MB4047:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB40475FF107E5AA7E36F8561E83E39@MN2PR12MB4047.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7fS2kfSLXE7hBbPbuloY18kQnj/8WaWjKxqw46pnV80T2sFnc75fT7UZgDng15OYhL/7pWUyzlFOO7scVI37PBQROqXG3m51DzsMoNA2G+Jvb5pVpCHhBA+/wKiSVq3T/oGw2xaV6HNKqFl/7MQJB6apw116tbT5jXeI1SzvvG6GNyqw8POo6KxH3BV53QbKnRmdYns8ld36YaBWgNsa1OjrwkG172ncpXSjZqmg1rlblwQ+J+Pfuz2ZcXKVpeOqZcu7qBCN1xjG5eh0ki1GPCDI6QTCnqGGlFIanJdFLRLSz0oFZ7xQqM5fomhxA5Ty3vgzg7b9he6HOO/jDFclj63LsH9SlrONIBW1QO27bcQuk9Xy4vPgkHPEAKwMKsCBXZyTrdnj/PMrE1tcWF/v9Prb4Ea/F6mPgDr8xtx3ncVxc0EsbUAt9aksyanoIr2Wj4gDW1T0JT7JIiKRvQazoAfOlQkz+xlUSzvDy90aU5hWWYd1YW9XbqOP3vzdQUCMjXdIUxH9IDoooWWi9WUO3geo/YKvF22pVEGO7posG7wqnOWSuEEO5i3x7oCP/3NFr91jl64BtM+sRqFmNvrI342WFx4DmI0FAmiwtFI2M+/tn1Q2HzAtab9hyU7SJhFMfPx4betMG8VfOZeieogXeRymcJMhyINep3G7sC3QiR9jbySzA7TPd2WjsN69iWfPnoJt+zhQ6MGJlSMDhdr7BdrzIz9kVtaydHFVd04JuPE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(31696002)(66556008)(66946007)(38100700002)(316002)(36756003)(6666004)(31686004)(4744005)(8676002)(2616005)(6916009)(508600001)(66476007)(8936002)(6486002)(5660300002)(186003)(4326008)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2FKZHJXTXR0Wi8yNEJZb3lURHdVdUdaOXpEZnR3aEdLK1BIWnpQRjJIVlNM?=
 =?utf-8?B?V0xnOVJYeEhKRWN3Q1Y0SEszK2R0Y0NHMGdnaDBlMDhaTHFlWFhINDhDTTFn?=
 =?utf-8?B?S3A5QjlXcVd4Z2taTno1ejhmd0d6RjB5RE5ncStDbVQxeWZ3Q0IyNSsvUFlt?=
 =?utf-8?B?Vk1lazYyTHZsYXFONTQvMmxHZEhmUFcrZE5FWFcrblVkRWpPVy82ZEdEeU1E?=
 =?utf-8?B?QXN5NXdGMlBVcm1BV0wvanhORE1WRzIzeGtWSUMvZlpEM1JxMDVZb1FFczJ3?=
 =?utf-8?B?dDRLcjJoVkp6MGU0MG1TNy9Ca3VnSjBkK3dqSTY1MG4yQzVNMXNHN09jSHlN?=
 =?utf-8?B?dnJVM2xvV0lMcTgwQVR1dElJK3dNT1MyMkJZYVFmdk5SM3BCc2ptNWZ5MVdJ?=
 =?utf-8?B?QWF3MzRHd09zVXN0Y003OHd3b2tyS1lBNlByaTFFanVTNS9ZVWI4MWhnUEhW?=
 =?utf-8?B?cWZnbWFoM1QrTEFjU2VVYlZjNTRBMytHMWFCaXVKSVpqZ2h5Z0cyRjlUbTBG?=
 =?utf-8?B?VjduSTFhNGVaS25yekNJcnZuUjc1a2NxQXMvenV6bUNlOUNHRzBhVnFNY1ZV?=
 =?utf-8?B?ZWxzL1NzVFJhZlFMeWNSVGtXUDZEVER5cDB6ejVva1lOM1FsNGxIczdrQVNm?=
 =?utf-8?B?ek1meHBpcmFINUV2TGhoQWZiZDVtbHJGL2l6cUxEVXNpUnBlaTVHUXpUWDll?=
 =?utf-8?B?cVNSVk1YTFp0YXF2c09FN1oyaXVaeFhCbnhxQk5oTmgwekJQUzRKTFdoMjVK?=
 =?utf-8?B?WnpYRTIxM0JYdlk5S0hCN0F2Uld0SEhBTnd3aFZ0em9lZWJZcFBEbUNaekl6?=
 =?utf-8?B?dUVSZVdvbFlDQ1ZVQVpISW45Y3R6eVA5bXhXOUw2eTFyQzBtWW1ENzlQUUcz?=
 =?utf-8?B?dWkxa3hwdkd5dzVaRlNKSENiYVJFTXVGOVhFOXdGeGZjVTRuWFppeElOQnVv?=
 =?utf-8?B?ZGEzR0ErZEI5azZONmhraFcvTGpIaEN4OUZ2T1pLVmV1UFhBUjJld0ZtZmVC?=
 =?utf-8?B?WFlPWUxJYnNKelRKTi81MmxoRFE2cktKOFNoZlBqanRoRWlQeEVxUzNIWlVa?=
 =?utf-8?B?VjMxVWwxMXNtNGZLdVZxeUVwcHpZVUVVK0RRQ1c4aDBaS2t0RGF6ZVVDT3ZY?=
 =?utf-8?B?RlBKcEtQYlVxSnNaRkRIVStNTW51OUtlNThkMUswdHljUW5PeWNkcHFNU3ly?=
 =?utf-8?B?dyt3YVE1bWJhWnZFSnRVM1lRQko1UFowNk1saDVaUTE2QU0zdURWWEprSUM1?=
 =?utf-8?B?emcyTE96UUQ1Um1MK1dtWWxMaS82Uk1BenJmTUQ3TmsvZ2EwNXNXSzhRNE1F?=
 =?utf-8?B?Z1NqMFcwK2lnVm5ONGhDbXpHeXRkZjFkZjJyYUZpRER6Q2tlcmFLR2pRU25a?=
 =?utf-8?B?UmRkZ3cvNHZnbEJtS3dIYXZiT3pqRjhta3VFSzZFQVJxTzBRNU9EZ1V4bGdL?=
 =?utf-8?B?Q3JIZnV1T3VGaHdCR2ZkbVMwOWxjSHluNU5WRXkrTGYwMWt0aElKVmxmTHJH?=
 =?utf-8?B?dVNCRzNUVzNoUmxCQVdSbk1zVW1PSWZjSXdZM1QycWx6N3lBVVI4V3Fld2dn?=
 =?utf-8?B?c3FJdDVrWWk5Y2hQZ1NIREdRbHJ6elRqeWdwajJueGlESnhsTlY2VlRmN1Bp?=
 =?utf-8?B?TGVKcm9nWnlPb1lFYWxkNzR1WWxDdjRKdnQremtPVEl1ZGFJbkdYSWdza0FZ?=
 =?utf-8?B?bnI1TU9kdmt3YStTN2g1bE14NkpaTUpCL0NrTlFvOW1qekpKTjZQVUZUd1ZC?=
 =?utf-8?B?akJrdjRObXhXT1VKaTNIbnRZMzBIbjdya21iRjNDRVpVNGNxVGEwZWFTYUUz?=
 =?utf-8?B?ZjZPTzM5MVdzWGVLZ0c5bFlRRjZXd2IxRC9za3NZMWM5QmtpMEt3VWJMZFhs?=
 =?utf-8?Q?FHIUHct5xVUFS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 160c28df-4443-4e1b-fa77-08d94c296bf1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 09:25:03.9915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jIfUKgUySIpNV2CRMff7hWXg31NJud1KnkdDomdjvhCKrVbUvhZ/yutnKbxmi2s8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4047
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
Cc: Harry.Wentland@amd.com, Anson Jacob <Anson.Jacob@amd.com>,
 qingqing.zhuo@amd.com, Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 roman.li@amd.com, Bhawanpreet.Lakha@amd.com, Sunpeng.Li@amd.com,
 Aurabindo.Pillai@amd.com, paulus@samba.org, amd-gfx@lists.freedesktop.org,
 linuxppc-dev@lists.ozlabs.org, bindu.r@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Am 21.07.21 um 08:51 schrieb Christoph Hellwig:
> On Wed, Jul 21, 2021 at 08:29:43AM +0200, Christian K??nig wrote:
>> Looks good in general, but question is what about other architectures like
>> ARM?
> DRM_AMD_DC_DCN currently requires X86 || PPC64.

And exactly that's the problem I'm noting here. At least officially AMD 
claims that we support ARM and some very brave still use the hardware 
together with MIPS as well.

> Maybe a good think would be to add a new KERNEL_FPU_API Kconfig symbol,
> selected by x86 and powerpc (I think ppc32 should be fine too now) so
> that we get these arch dependencies out of the driver.

Good idea.

Christian.
