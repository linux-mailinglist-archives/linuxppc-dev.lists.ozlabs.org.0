Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1D643AA5F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 04:37:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hdbb43cbCz2yRf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 13:37:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DK/mF5j8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.237.72;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=rcampbell@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=DK/mF5j8; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdYMJ1Fsdz2xvf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 11:57:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eu0NMrII1gUYA22lbuk6C1KrC2pTUTqaUsLuz5Vzv92PFVOPxvuBiYgyWDLCTWsI8tGHgFssVScY47Nf0MWiyXyc5WisbrvDwVVUxJnW0+8RKflWkB/1SwDq2GzcTgfMWbPk5B/YAoHPtVk9zNxYyf+8CEbAgpuK5LMr1JKifRdt1FNvH9Gqp1f2iJuzajBRMJYIUfD7Ls8d1UqwLgyJzhZqNa/TBnHfLs8JDkfkiWyYS+9BKaMNjWtIR3y8IFw3CXta+88YAEvYsMd9q4k9b6z0b4LwKN6eoGYtextO1RDHMRQHbF/mcuvGrtO2uGozxxEORcHnUtL2FZXqTY5ZVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TYzq9i5jN3hDuz31Be1/qKrcqfMjuVMbBQ14xEEiLyc=;
 b=BC/yuMoGq49hvGzThogsp7iny+w9KyEYv/LMsXLD3d5N9ACShz/GnUB+OaNBbzO4ysI2nCAXH+BmHzspiB3smWxvV3SNB0Y4LjYejEawaG/eNqGw4W0LGIkrw6mz6q4skQzwiVbO0UuyJWg5cjxQ7By7ZBt9r7PuhSbqxJvoWrf33zSoRrmDwRO5ku56QcjIStwgVv60E+S12fDpoR8gqY0XAw8yuB+F1yoLs2Hly91Hzqz//NxzD2R7DzEjv1EcRiFQHXdpoz2M/RMHN5vH6d1Ng790pDXSYQoHHd0xdauQEE++QEh+RvEU5YzEOS1HqAzy1Flww0bZSBy1ZS4GNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TYzq9i5jN3hDuz31Be1/qKrcqfMjuVMbBQ14xEEiLyc=;
 b=DK/mF5j8JpykbcIYmo3CMVrRqB5lkaO9j+cZPscn041CiJnRJhLLiTyu9iI3hsqTp+G5EoBPccYKSqgTyBTbWQEGZDZ2dqXgnAjaZsJQRYxI8vKp+h7T9CKIjchxoEZkAGAoHAWT4IV+12tElzvIb1Xpo3WDljs5Rnf+oOhJJJC8JWjVFJIoHj5yhH2KmU5xlUcD4bJoALriv82yceeNy4MwbvH+AYaUqvjHritA/1SGWysLq1FVcHiFvKLIexYoF1xW58yiQIPsTu5BNngQ1wHD9jzCSOBjlu35G2bCL8LIiOcrW1t5lG/pSFjbkVTH7hzwV6i7Q9Sn3XkeFwbLEw==
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4344.namprd12.prod.outlook.com (2603:10b6:208:26e::11)
 by BL0PR12MB2338.namprd12.prod.outlook.com (2603:10b6:207:4c::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 00:57:10 +0000
Received: from MN2PR12MB4344.namprd12.prod.outlook.com
 ([fe80::c440:91f3:b2d4:9e9f]) by MN2PR12MB4344.namprd12.prod.outlook.com
 ([fe80::c440:91f3:b2d4:9e9f%7]) with mapi id 15.20.4628.020; Tue, 26 Oct 2021
 00:57:10 +0000
Message-ID: <f92e2dfe-f033-9b09-e83c-203052b491e1@nvidia.com>
Date: Mon, 25 Oct 2021 17:57:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] mm/migrate.c: Remove MIGRATE_PFN_LOCKED
Content-Language: en-US
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org
References: <20211025041608.289017-1-apopple@nvidia.com>
From: Ralph Campbell <rcampbell@nvidia.com>
In-Reply-To: <20211025041608.289017-1-apopple@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0105.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::46) To MN2PR12MB4344.namprd12.prod.outlook.com
 (2603:10b6:208:26e::11)
MIME-Version: 1.0
Received: from [IPV6:2601:646:8e80:c510::b850] (2601:646:8e80:c510::b850) by
 BYAPR05CA0105.namprd05.prod.outlook.com (2603:10b6:a03:e0::46) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.12 via Frontend Transport; Tue, 26 Oct 2021 00:57:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31f356d6-27e4-48a2-d961-08d9981b8a27
X-MS-TrafficTypeDiagnostic: BL0PR12MB2338:
X-Microsoft-Antispam-PRVS: <BL0PR12MB23386FF92B70E8CDEBFB2AD5C2849@BL0PR12MB2338.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yse1a2hpKEVn/oXBz8pKEyGVeAmOJpGL8YHAIjHt/zEpy3AKMbw75W663OnPCkbFKNlm/NH4DdurtzNb8W5HUBgHgAjRDMJXfISH5gGHct14reEjRJIutArSV0qVc/YkebkTULj3p64BxVrsN+gVCH44G9argw0WB4Ryy6hSpgNwC6G8D+fm5eoFYCH4BnEAo6+LK8tCGte4aMF6+e5sYSlwV+kA9EpUV3OLST6EWUoL8ozK8XRpNGfTUo2M2EB8ODVDI1lFO9oO/mh1dRN1I15hOMU7hAL4P7qBgpGZK19K7W1AQb0ZIvh8o4oldc+7USEEE34vGoxTafdbjWuOyR5fhpcziCYLxusHUfIi/C7mYFDCbOtbuJKEsnXrW7igFxi3kP8JI7QICM+tI53VSWQ4l2EXStS5Wd2GOEbvbn/5M7/8yospW7gOXTNyZ2zPBR40nFP853Nx7JDBLcUy5rpu3resRKL+A0S9lEVvYcKjbP+YLfGTJYY+5Azx41j2QfOvXRPaU2CacO4I2Xm2YjCUALFNj3DLOFv8fXLHfUTy7BeqV5v3IqY2dZ44UX6S7dQ9D0G8WLqnjeOIybF33X3wLsDDrs26zM/iHA4/xojx2SfoNlbO/FK7Th5O+d0qdEynxPc7GKtCn29BtQfYfsUrobgsRP1Xo+Mdqf0iTiwZMgZ4Yitgyno3592zFnYU/EhFE24hzm+aDfL4PAW/9MzF/vHEOuz5BnUGgE3G8sA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4344.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(66476007)(8936002)(83380400001)(2616005)(8676002)(31696002)(66556008)(66946007)(5660300002)(7416002)(2906002)(31686004)(508600001)(4326008)(38100700002)(53546011)(186003)(86362001)(30864003)(316002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzBCUXhNeFk4K2trRnhRZHdKbHI0SUQwV2RRalRHcVpKWDAwWXd5Ylh6OG9Y?=
 =?utf-8?B?bEFLS0lyc2pKWHN0ZFBEbU1BZzI1R0NzazBNTVVMYkhTL1ZYblpaUElaUEsy?=
 =?utf-8?B?bnVuR3p0UmJuK25EcHZJSVQ5R2ZWWnVMcjVhdTFVaW5tNWRNT3FOcFArWVdP?=
 =?utf-8?B?WXNTRExXY1NYREcydDM3djMrTkx5bHNabnNmZUtxNHhma0pwelBwQ2NyTCs1?=
 =?utf-8?B?aURYNEN1eXpyOFZlTzFhdDJXRWNVRUg4UXlDdzFMc1F1VHBxaWtTa0grUThD?=
 =?utf-8?B?ME5UOUZnOXhhQUhFS2V1QytKMVZIWFZrQjZQTTFOM2JuTWpKVEh6MTJQT1Y1?=
 =?utf-8?B?bTVSMWtYSy9aUi9icTE1ejRwOXZKbm11MThzKzErZlNGS3RVanVJZnNyOVVw?=
 =?utf-8?B?Zk5GejNTb2V1TmM0NENjbzkrWkZtWUhHNXZwdEp3QjhTdjdGc25ETFBVT3hK?=
 =?utf-8?B?ZUZwaDVwS2NLbEhpekdXYzRqZnlSNE1KTTM3OHEzWmlhRkxzOC9lUE8yUVFM?=
 =?utf-8?B?aHZMNmVJV25HYVdwbHJsUW45Y3hrNTZiNGxSNWJERzBqeFdHTy9iWGNua2ZD?=
 =?utf-8?B?cGxVRXE3ZjN3UVpWbGJrMWtmaFlTc2JOd1htdlR1WE94T0dmSmQ3bXdTSnNI?=
 =?utf-8?B?eDJJSDExZjlWSXQyNkJBblVxbWxROE50azZtVTBZRE9QY1VLcXFQYWdNSVd3?=
 =?utf-8?B?S0dHbStocW9MZ2Y5YXFldFFSa09ROHNUazhMZ1J3bEtvNXJtSjl5bFhINSs4?=
 =?utf-8?B?TE8xOW1wdmZ5KzZ3UFlmZDd3eUkxc01wMmJPeVpDODQyQkhielhJZ0NwbVVY?=
 =?utf-8?B?M1VZazVMbXMvVDBtZXRCMzNmT1JTZ1g3SVZ3V3BoUnBCYWZ3VmFTVU0vc0JI?=
 =?utf-8?B?ZWlpRyt5SEozSEhvM29JdkNUUlUzNHRDMkN4MGs4U0RsaG0wNVZ0ZFU5U3B4?=
 =?utf-8?B?VUtabnZuVUR6MVhFeCtISmpvbkl1eGdrc0pkNXM5KzJtSGtrZll3QURUbnFE?=
 =?utf-8?B?TExJc0dIRHZmeE5uK0RJZGxVL2lVU0RVRXBXRXpKK0Z1dWlHRmhpMGNQOXEv?=
 =?utf-8?B?dDd1c1FHaTVBMEU1UlMwOVV2cUoxQWthZk11SzczT0t2ZGphbGtTSWM2eDA2?=
 =?utf-8?B?Ky9leTk3M05VUGc2WVVXNklUMXkzZGF0cC9CVDk5aklya01sNGZCdkdldnA1?=
 =?utf-8?B?SUMvVy9HbE1ocXpSazQyS1N4K0ZRUktNN3hnSGlZTDlzNkYyd3JSNDl6ZjVM?=
 =?utf-8?B?VlNYM1JZK0thb3ZncEpQa2hTRzVVNUcyc3BsT2ozbW9Xd01Oc2Y5QmFJZE1Q?=
 =?utf-8?B?ZHhaUlRNeHFpNGpZdVhtRDNSeVdRck9ZbnlmUUlxUDVRbEpNcUpGVVZJTEtB?=
 =?utf-8?B?TWt4NlRhUWpHeEtZMjJiSlZJejFVbEkzNHlRKzFreXA2TmtNditaUFVsYVh4?=
 =?utf-8?B?emN2dXM0MVArSjV5eXJCNXFWajJ6RUFJa1M0OVIzZ0hueXpMMGZsQUZmdzd2?=
 =?utf-8?B?NmxLd2gzZm5GZHE4dDQ2NE9SaUJra0JSL3BFY3I3NU5tckRXMWZFWEM2bHRu?=
 =?utf-8?B?eFJZS2IvUzhPVFRNb1dGdTdXd29JVHVJaVBpRldKN093RTZCL2lMN0UrOVB0?=
 =?utf-8?B?RFZQYUVWaDVlMEtGdVVyZUZkcEhPVXRSbVlPdVdaU2Y3czBWd0R4MGJJVEds?=
 =?utf-8?B?MDhhdDN6OGpNcEVEeDdwbytHb2NDUkNUQnY0NE5RSTdHUXJlSU12NWdFd3Vo?=
 =?utf-8?B?aW9zK2pyZUcxb0NEZ1dDTjJvNHBnYzhIdENEak9uOCtSUnFkMlhYLy9xR1Fl?=
 =?utf-8?B?aHBTRnhZWjJGQldFcFc2Z2JJRmxxMEJSc2k5Y1dSbXFRSXZsdG1YQU1MZExw?=
 =?utf-8?B?MGlaeFBkK2NYZE1EdmNvSHBsRnRyazRXVVZmcm9RS2FmR0t1U1dCVkkrYlE3?=
 =?utf-8?B?aHN3MlE2MmFqK1p5TklKQnJGNktLc2Z4QWwyR2JzWk1GVHJNZmVMVkV3QS95?=
 =?utf-8?B?VGZaTzBlOFJwZUdSZzN5VnlZRjRxcjE3RElvOHFyakdZNWFyeGVWU2lGeG04?=
 =?utf-8?B?TmFIbzY3dkFKb1RvVVhoc2JibkV3TUZ4WkxpbEdoM25NYUFOeGI5RjFLSWRO?=
 =?utf-8?B?NzZjQU1HWjFST29EU05WVlRYUmJ0cmpQbmd3OUdzeWtwQ2thbEZpOU1IMFMz?=
 =?utf-8?Q?p7/epvmql3ekHPIRtMsj7mIXa+JXxfBUc7vbo7Wg8vu2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f356d6-27e4-48a2-d961-08d9981b8a27
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4344.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 00:57:10.0993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /elEt7RWTyK3pOpN4hp/yWJ8YdhTzm1n3NHN/lzDrxlQRcCOMJJtRXvrlu/qzQEzDMvrAqVAYzGRay/eBhT8eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2338
X-Mailman-Approved-At: Tue, 26 Oct 2021 13:37:12 +1100
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
Cc: amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Felix.Kuehling@amd.com, linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, dri-devel@lists.freedesktop.org,
 ziy@nvidia.com, jhubbard@nvidia.com, alexander.deucher@amd.com,
 linuxppc-dev@lists.ozlabs.org, hch@lst.de, bskeggs@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 10/24/21 21:16, Alistair Popple wrote:
> MIGRATE_PFN_LOCKED is used to indicate to migrate_vma_prepare() that a
> source page was already locked during migrate_vma_collect(). If it
> wasn't then the a second attempt is made to lock the page. However if
> the first attempt failed it's unlikely a second attempt will succeed,
> and the retry adds complexity. So clean this up by removing the retry
> and MIGRATE_PFN_LOCKED flag.
>
> Destination pages are also meant to have the MIGRATE_PFN_LOCKED flag
> set, but nothing actually checks that.
>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>

You can add:
Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>

> ---
>   Documentation/vm/hmm.rst                 |   2 +-
>   arch/powerpc/kvm/book3s_hv_uvmem.c       |   4 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |   2 -
>   drivers/gpu/drm/nouveau/nouveau_dmem.c   |   4 +-
>   include/linux/migrate.h                  |   1 -
>   lib/test_hmm.c                           |   5 +-
>   mm/migrate.c                             | 145 +++++------------------
>   7 files changed, 35 insertions(+), 128 deletions(-)
>
> diff --git a/Documentation/vm/hmm.rst b/Documentation/vm/hmm.rst
> index a14c2938e7af..f2a59ed82ed3 100644
> --- a/Documentation/vm/hmm.rst
> +++ b/Documentation/vm/hmm.rst
> @@ -360,7 +360,7 @@ between device driver specific code and shared common code:
>      system memory page, locks the page with ``lock_page()``, and fills in the
>      ``dst`` array entry with::
>   
> -     dst[i] = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
> +     dst[i] = migrate_pfn(page_to_pfn(dpage));
>   
>      Now that the driver knows that this page is being migrated, it can
>      invalidate device private MMU mappings and copy device private memory
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> index a7061ee3b157..28c436df9935 100644
> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> @@ -560,7 +560,7 @@ static int __kvmppc_svm_page_out(struct vm_area_struct *vma,
>   				  gpa, 0, page_shift);
>   
>   	if (ret == U_SUCCESS)
> -		*mig.dst = migrate_pfn(pfn) | MIGRATE_PFN_LOCKED;
> +		*mig.dst = migrate_pfn(pfn);
>   	else {
>   		unlock_page(dpage);
>   		__free_page(dpage);
> @@ -774,7 +774,7 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma,
>   		}
>   	}
>   
> -	*mig.dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
> +	*mig.dst = migrate_pfn(page_to_pfn(dpage));
>   	migrate_vma_pages(&mig);
>   out_finalize:
>   	migrate_vma_finalize(&mig);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index 4a16e3c257b9..41d9417f182b 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -300,7 +300,6 @@ svm_migrate_copy_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
>   			migrate->dst[i] = svm_migrate_addr_to_pfn(adev, dst[i]);
>   			svm_migrate_get_vram_page(prange, migrate->dst[i]);
>   			migrate->dst[i] = migrate_pfn(migrate->dst[i]);
> -			migrate->dst[i] |= MIGRATE_PFN_LOCKED;
>   			src[i] = dma_map_page(dev, spage, 0, PAGE_SIZE,
>   					      DMA_TO_DEVICE);
>   			r = dma_mapping_error(dev, src[i]);
> @@ -580,7 +579,6 @@ svm_migrate_copy_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
>   			      dst[i] >> PAGE_SHIFT, page_to_pfn(dpage));
>   
>   		migrate->dst[i] = migrate_pfn(page_to_pfn(dpage));
> -		migrate->dst[i] |= MIGRATE_PFN_LOCKED;
>   		j++;
>   	}
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 92987daa5e17..3828aafd3ac4 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -166,7 +166,7 @@ static vm_fault_t nouveau_dmem_fault_copy_one(struct nouveau_drm *drm,
>   		goto error_dma_unmap;
>   	mutex_unlock(&svmm->mutex);
>   
> -	args->dst[0] = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
> +	args->dst[0] = migrate_pfn(page_to_pfn(dpage));
>   	return 0;
>   
>   error_dma_unmap:
> @@ -602,7 +602,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
>   		((paddr >> PAGE_SHIFT) << NVIF_VMM_PFNMAP_V0_ADDR_SHIFT);
>   	if (src & MIGRATE_PFN_WRITE)
>   		*pfn |= NVIF_VMM_PFNMAP_V0_W;
> -	return migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
> +	return migrate_pfn(page_to_pfn(dpage));
>   
>   out_dma_unmap:
>   	dma_unmap_page(dev, *dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> index c8077e936691..479b861ae490 100644
> --- a/include/linux/migrate.h
> +++ b/include/linux/migrate.h
> @@ -119,7 +119,6 @@ static inline int migrate_misplaced_page(struct page *page,
>    */
>   #define MIGRATE_PFN_VALID	(1UL << 0)
>   #define MIGRATE_PFN_MIGRATE	(1UL << 1)
> -#define MIGRATE_PFN_LOCKED	(1UL << 2)
>   #define MIGRATE_PFN_WRITE	(1UL << 3)
>   #define MIGRATE_PFN_SHIFT	6
>   
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index c259842f6d44..e2ce8f9b7605 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -613,8 +613,7 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
>   		 */
>   		rpage->zone_device_data = dmirror;
>   
> -		*dst = migrate_pfn(page_to_pfn(dpage)) |
> -			    MIGRATE_PFN_LOCKED;
> +		*dst = migrate_pfn(page_to_pfn(dpage));
>   		if ((*src & MIGRATE_PFN_WRITE) ||
>   		    (!spage && args->vma->vm_flags & VM_WRITE))
>   			*dst |= MIGRATE_PFN_WRITE;
> @@ -1137,7 +1136,7 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
>   		lock_page(dpage);
>   		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
>   		copy_highpage(dpage, spage);
> -		*dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
> +		*dst = migrate_pfn(page_to_pfn(dpage));
>   		if (*src & MIGRATE_PFN_WRITE)
>   			*dst |= MIGRATE_PFN_WRITE;
>   	}
> diff --git a/mm/migrate.c b/mm/migrate.c
> index a6a7743ee98f..915e969811d0 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -2369,7 +2369,6 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>   		 * can't be dropped from it).
>   		 */
>   		get_page(page);
> -		migrate->cpages++;

Why not move the get_page() into the "if (trylock_page())" instead
of calling put_page() in the else case.

>   
>   		/*
>   		 * Optimize for the common case where page is only mapped once
> @@ -2379,7 +2378,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>   		if (trylock_page(page)) {
>   			pte_t swp_pte;
>   
> -			mpfn |= MIGRATE_PFN_LOCKED;
> +			migrate->cpages++;
>   			ptep_get_and_clear(mm, addr, ptep);

I was looking at try_to_migrate_one() and looking at the differences with
the code here to insert the migration PTE and noticed that instead of
ptet_get_and_clear() it has:
	pteval = ptep_clear_flush(vma, address, pvmw.pte);

	/* Move the dirty bit to the page. Now the pte is gone. */
	if (pte_dirty(pteval))
		set_page_dirty(page);
	update_hiwater_rss(mm);

I know that is pre-existing, probably a separate patch if it is an issue.

>   
>   			/* Setup special migration page table entry */
> @@ -2413,6 +2412,9 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>   
>   			if (pte_present(pte))
>   				unmapped++;
> +		} else {
> +			put_page(page);
> +			mpfn = 0;
>   		}
>   
>   next:
> @@ -2517,15 +2519,17 @@ static bool migrate_vma_check_page(struct page *page)
>   }
>   
>   /*
> - * migrate_vma_prepare() - lock pages and isolate them from the lru
> + * migrate_vma_unmap() - replace page mapping with special migration pte entry
>    * @migrate: migrate struct containing all migration information
>    *
> - * This locks pages that have been collected by migrate_vma_collect(). Once each
> - * page is locked it is isolated from the lru (for non-device pages). Finally,
> - * the ref taken by migrate_vma_collect() is dropped, as locked pages cannot be
> - * migrated by concurrent kernel threads.
> + * Isolate pages from the LRU and replace mappings (CPU page table pte) with a
> + * special migration pte entry and check if it has been pinned. Pinned pages are
> + * restored because we cannot migrate them.
> + *
> + * This is the last step before we call the device driver callback to allocate
> + * destination memory and copy contents of original page over to new page.
>    */
> -static void migrate_vma_prepare(struct migrate_vma *migrate)
> +static void migrate_vma_unmap(struct migrate_vma *migrate)
>   {
>   	const unsigned long npages = migrate->npages;
>   	const unsigned long start = migrate->start;
> @@ -2534,32 +2538,12 @@ static void migrate_vma_prepare(struct migrate_vma *migrate)
>   
>   	lru_add_drain();
>   
> -	for (i = 0; (i < npages) && migrate->cpages; i++) {
> +	for (i = 0; i < npages; i++) {
>   		struct page *page = migrate_pfn_to_page(migrate->src[i]);
> -		bool remap = true;
>   
>   		if (!page)
>   			continue;
>   
> -		if (!(migrate->src[i] & MIGRATE_PFN_LOCKED)) {
> -			/*
> -			 * Because we are migrating several pages there can be
> -			 * a deadlock between 2 concurrent migration where each
> -			 * are waiting on each other page lock.
> -			 *
> -			 * Make migrate_vma() a best effort thing and backoff
> -			 * for any page we can not lock right away.
> -			 */
> -			if (!trylock_page(page)) {
> -				migrate->src[i] = 0;
> -				migrate->cpages--;
> -				put_page(page);
> -				continue;
> -			}
> -			remap = false;
> -			migrate->src[i] |= MIGRATE_PFN_LOCKED;
> -		}
> -
>   		/* ZONE_DEVICE pages are not on LRU */
>   		if (!is_zone_device_page(page)) {
>   			if (!PageLRU(page) && allow_drain) {
> @@ -2569,16 +2553,9 @@ static void migrate_vma_prepare(struct migrate_vma *migrate)
>   			}
>   
>   			if (isolate_lru_page(page)) {
> -				if (remap) {
> -					migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
> -					migrate->cpages--;
> -					restore++;
> -				} else {
> -					migrate->src[i] = 0;
> -					unlock_page(page);
> -					migrate->cpages--;
> -					put_page(page);
> -				}
> +				migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
> +				migrate->cpages--;
> +				restore++;
>   				continue;
>   			}
>   
> @@ -2586,80 +2563,20 @@ static void migrate_vma_prepare(struct migrate_vma *migrate)
>   			put_page(page);
>   		}
>   
> -		if (!migrate_vma_check_page(page)) {
> -			if (remap) {
> -				migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
> -				migrate->cpages--;
> -				restore++;
> -
> -				if (!is_zone_device_page(page)) {
> -					get_page(page);
> -					putback_lru_page(page);
> -				}
> -			} else {
> -				migrate->src[i] = 0;
> -				unlock_page(page);
> -				migrate->cpages--;
> +		if (page_mapped(page))
> +			try_to_migrate(page, 0);
>   
> -				if (!is_zone_device_page(page))
> -					putback_lru_page(page);
> -				else
> -					put_page(page);
> +		if (page_mapped(page) || !migrate_vma_check_page(page)) {
> +			if (!is_zone_device_page(page)) {
> +				get_page(page);
> +				putback_lru_page(page);
>   			}
> -		}
> -	}
> -
> -	for (i = 0, addr = start; i < npages && restore; i++, addr += PAGE_SIZE) {
> -		struct page *page = migrate_pfn_to_page(migrate->src[i]);
> -
> -		if (!page || (migrate->src[i] & MIGRATE_PFN_MIGRATE))
> -			continue;
>   
> -		remove_migration_pte(page, migrate->vma, addr, page);
> -
> -		migrate->src[i] = 0;
> -		unlock_page(page);
> -		put_page(page);
> -		restore--;
> -	}
> -}
> -
> -/*
> - * migrate_vma_unmap() - replace page mapping with special migration pte entry
> - * @migrate: migrate struct containing all migration information
> - *
> - * Replace page mapping (CPU page table pte) with a special migration pte entry
> - * and check again if it has been pinned. Pinned pages are restored because we
> - * cannot migrate them.
> - *
> - * This is the last step before we call the device driver callback to allocate
> - * destination memory and copy contents of original page over to new page.
> - */
> -static void migrate_vma_unmap(struct migrate_vma *migrate)
> -{
> -	const unsigned long npages = migrate->npages;
> -	const unsigned long start = migrate->start;
> -	unsigned long addr, i, restore = 0;
> -
> -	for (i = 0; i < npages; i++) {
> -		struct page *page = migrate_pfn_to_page(migrate->src[i]);
> -
> -		if (!page || !(migrate->src[i] & MIGRATE_PFN_MIGRATE))
> +			migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
> +			migrate->cpages--;
> +			restore++;
>   			continue;
> -
> -		if (page_mapped(page)) {
> -			try_to_migrate(page, 0);
> -			if (page_mapped(page))
> -				goto restore;
>   		}
> -
> -		if (migrate_vma_check_page(page))
> -			continue;
> -
> -restore:
> -		migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
> -		migrate->cpages--;
> -		restore++;
>   	}
>   
>   	for (addr = start, i = 0; i < npages && restore; addr += PAGE_SIZE, i++) {
> @@ -2672,12 +2589,8 @@ static void migrate_vma_unmap(struct migrate_vma *migrate)
>   
>   		migrate->src[i] = 0;
>   		unlock_page(page);
> +		put_page(page);
>   		restore--;
> -
> -		if (is_zone_device_page(page))
> -			put_page(page);
> -		else
> -			putback_lru_page(page);
>   	}
>   }
>   
> @@ -2700,8 +2613,8 @@ static void migrate_vma_unmap(struct migrate_vma *migrate)
>    * it for all those entries (ie with MIGRATE_PFN_VALID and MIGRATE_PFN_MIGRATE
>    * flag set).  Once these are allocated and copied, the caller must update each
>    * corresponding entry in the dst array with the pfn value of the destination
> - * page and with the MIGRATE_PFN_VALID and MIGRATE_PFN_LOCKED flags set
> - * (destination pages must have their struct pages locked, via lock_page()).
> + * page and with MIGRATE_PFN_VALID. Destination pages must be locked via
> + * lock_page().
>    *
>    * Note that the caller does not have to migrate all the pages that are marked
>    * with MIGRATE_PFN_MIGRATE flag in src array unless this is a migration from
> @@ -2770,8 +2683,6 @@ int migrate_vma_setup(struct migrate_vma *args)
>   
>   	migrate_vma_collect(args);
>   
> -	if (args->cpages)
> -		migrate_vma_prepare(args);
>   	if (args->cpages)
>   		migrate_vma_unmap(args);
>   
