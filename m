Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C89E43E544
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 17:34:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg8kS2MTyz3c6k
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 02:34:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=KVOH1wz4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=amd.com
 (client-ip=40.107.102.57; helo=nam04-dm6-obe.outbound.protection.outlook.com;
 envelope-from=felix.kuehling@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=KVOH1wz4; 
 dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2057.outbound.protection.outlook.com [40.107.102.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg8jc3qfkz2xrx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Oct 2021 02:33:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XfJmGs0gvbWdlFt2dB/OlCjixfATVydUX7bhC1A+dPRbFycba/C5JfAG97RzAFQHB/mJ1YBeeS8aGClN7HgY+b7O8q5/nX0a1ORThl5EabjrYaG4S+y/SoUysl1jII9N9BdsLmWkXH+XI+LmMZ4oYshfN3mWtn+CzFTdP6fm0RvDptcqLF9m2i7DsMwXxFgAtHWLoznh1ZqjKn4HnaT3+xgJnQo6EMXwuoUwaw29nf398bLS49pqJEzKHLL3uvWbgb0vrh9mibwqWekcnUeJhrVGdNI+AZrT1sDg/t+7Xf4zey9BoKEB9ZUIq31iCOVGiW/FGPq3d/Uef3+jq20d+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOR3Ka4l2q1JbmCnc7J3ajeSGdxJo7On268zhEVeddI=;
 b=nySkrLKA0CSaA3q6+2v91vLu8B5z48YylmFTa/0NeHq+DdmWXwN+aesY+3bCjtUuX8wnyZdGncoJnsiwFOTi3Ol32aHJuCENoNkl230o8qHFQKZXvwlCJaR3MVWBZEuLd/8xNvWFI15rSGNpU/m1+IQpHRZb1LfIMx/q6qnR/D/Z60nFZD4X7Ac7qvyvBHUJOJEAV/f4KS6zwxJyJE8M7iMDA8QUnWFPcxgr+R50On1Kp4i+JtkH5cXzm3uw8hwzhmZAVEKas7R1HnJKIVhj1njxH24gGWOfJK2WHEYtGwXE/vpzWZTd8NURshAQ5FHXq3u7oBzh1MID0Hp/gkl65w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOR3Ka4l2q1JbmCnc7J3ajeSGdxJo7On268zhEVeddI=;
 b=KVOH1wz45ivJ9AdCezaetWLU1/DIBPWS1H4ZPtDAOsn92ElNNr+q2MfkTrxnmm/0d1zbqmgOSw6/c1UFyKVO9o8T82R0BqSQx5KsPm1lPstm50NSDOeG2BnGKNJitDMz10OZqH3NCrf/sO+wvUJs8nOPy82H5ahxlMFFp2A245c=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR1201MB2491.namprd12.prod.outlook.com (2603:10b6:3:eb::23)
 by DM6PR12MB3931.namprd12.prod.outlook.com (2603:10b6:5:1cb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Thu, 28 Oct
 2021 15:33:34 +0000
Received: from DM5PR1201MB2491.namprd12.prod.outlook.com
 ([fe80::d153:3aa6:4677:e29]) by DM5PR1201MB2491.namprd12.prod.outlook.com
 ([fe80::d153:3aa6:4677:e29%7]) with mapi id 15.20.4649.015; Thu, 28 Oct 2021
 15:33:34 +0000
Subject: Re: [PATCH] mm/migrate.c: Remove MIGRATE_PFN_LOCKED
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org
References: <20211025041608.289017-1-apopple@nvidia.com>
 <14d807ba-04f8-49cb-8094-bde1032f1eaf@amd.com> <2096706.TdNOD7Y7u4@nvdebian>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <130148f1-2676-16e2-b2a5-bf21f2a5481a@amd.com>
Date: Thu, 28 Oct 2021 11:33:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <2096706.TdNOD7Y7u4@nvdebian>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT3PR01CA0069.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::6) To DM5PR1201MB2491.namprd12.prod.outlook.com
 (2603:10b6:3:eb::23)
MIME-Version: 1.0
Received: from [192.168.2.100] (142.118.126.231) by
 YT3PR01CA0069.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:84::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Thu, 28 Oct 2021 15:33:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20defeaa-ac14-441c-97e7-08d99a284d65
X-MS-TrafficTypeDiagnostic: DM6PR12MB3931:
X-Microsoft-Antispam-PRVS: <DM6PR12MB39317CFB44B45A473C7BA7A192869@DM6PR12MB3931.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qXlkt4E23HY2ToNIboVMfWWooV64W7/5gVXCf5qoAXdnqvT183336K/6v/KnR3D74hi5CyO60H1NTQyUAjR5l4VzaAyOtxHcSh6rc4oVnOg0TkQ2upHKRsXLDtal20V6cJ2drmiQSzxgh032oGb03hy+8EKHdDw3fJxpC+MiEw2Sg6rp8ObaWrAo/C2AFwhMb5SAV6YjuU+gEHtBF6mQE1YanDS8ZPFzjDZPieT8pMyzQPEXmELPWgYJ94nY5XNGDUE3TZQVQB3sIGaQ5Lx9bgNKj86Chm3VRtVeeiGDJpnZZJHwtKrPkVj++9Cyf0a+12rTYmPKpgDSXUSfhIXMID0q8eanwiE1im4SCqsNOVlJfYufU4U9FP4RjPIwqXRQtJvvYbkatf2CM32mwBzq4W88ht5VkO9GgwYwYWRLxDM8CVOTTMN/wmzxNG9ILOG7DAooUzsILWEP2eoLDsq2Q3DpTy+0RTrcYHiIT3RBb7VtOkjvutvxZBzQ+rb9TVdidVgVwDNWR164r2YYixYrErRNCoLxHcZmUB52AHDuG7Oyrk1eQc2N5SUxfq0fL3eFQL7K/Y6CXo4JfVGZeSt2PsozkiNPfOpW3WymnID62y9fjWdMRbznoUtTHhGCkh4slQetQHmrnb//2a7W7cQY+rUWOkR2By546cLsVRIpxDL7We2QCVpVpmxzgZjzgR9vYpWp7og7safA++MtvQy1pedTlBRVYg7MK9TYYAR+9tkZ9v5l8LOYxUJlb7By2XQf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1201MB2491.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(5660300002)(16576012)(4001150100001)(8676002)(316002)(6486002)(31696002)(4326008)(8936002)(508600001)(86362001)(31686004)(66556008)(26005)(2616005)(66476007)(956004)(66946007)(30864003)(38100700002)(186003)(44832011)(36756003)(83380400001)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anI0dlBBY0hvejhiL2NJdjIwQ0pqQXlNbUVlalZIb3JoWm42TmdKd21qdG03?=
 =?utf-8?B?MHZ4OUY1d2J1aDlXVVlockI1SXhNWUVQdUNyVXROQjJFbE9aOFhoaUY2Z3Bv?=
 =?utf-8?B?eEFqWG1kODRWcW53VUZPRW5kSkdxTklDWjNBYWIxQXJiOUR4aXg0WGdKS0lI?=
 =?utf-8?B?Zmhxc2Z5RnhkUk1qdFZMVk5abU5mMFpDdDZvQ3hHaU1YMlNyS0Q1eStxTkhM?=
 =?utf-8?B?TEpPMWxxdkt2UmUvNUlFL3VCZlZZVUxjdkNKa1plOVpneVh1NjNkTVhmQ3hP?=
 =?utf-8?B?R3NhWmtqTis2bVlZNmRaM0pIdG5mcjRwd1lpUlpIN0xXY1I3SkVjOGo0bFdj?=
 =?utf-8?B?NEpCR0p1eEt6RGpoSm52MkloVjY1Rk02WkpFamRyempENFNDMEZhMENDN1Ix?=
 =?utf-8?B?MTJ5LzBkNGxmckZQSFYxZU4xbmpGMGRwdnlROUtoRU5HcmtFRU5WMzRMYmJE?=
 =?utf-8?B?bEt6Y01xZHZkd3JWU2pMWVNKWDdkRitKTkFYQTZUZXBjQnY0U24valdWS0xp?=
 =?utf-8?B?engwaU81U1VIUXZxV201dEtJY25xdTZZWmF3TmthbCt1NFR6dUhKV2RxUDlM?=
 =?utf-8?B?Y0RzY2xMeHZvN0pRbEVuNDBLY3RZNDRRZDRLRVFOVDJ0cjVkdFk3U0sycUI1?=
 =?utf-8?B?VHVINzJlakREVmt1S0NhaVhSbjBVQmVnWDliNnIxRDcwcUxUWmxxQktDMldp?=
 =?utf-8?B?VFdPYUdzQ1k3YjBtaVBLMWdOdVJFTTBKWWhvTEdOckJPVGI3OW1UMzI3QTNl?=
 =?utf-8?B?S0V6bUdMRk1VT1pFMjZHd0duMHJUaHJzUlVYSldsQmlMdDJmSkpQT29oRUta?=
 =?utf-8?B?NzRWcC9YR1Nkc2FZdzhmdFpBb1FJaHVYQWJ0OWNRZEEvUWJqZDF1WUlwdlI3?=
 =?utf-8?B?Mk10cmx3ODROWGpsNUxXaUZGTSs5QXdzaW9pWWNjVEpmVnZTK25GaWh5U2tU?=
 =?utf-8?B?TTlYbFpveE1PVE13b2E2QTJRd3Y0NzcxRDgzcFdvMW0rK2E1cG5hUkx1L0hC?=
 =?utf-8?B?dk1UNEErUWRtU1hZaWFDNUF6T1FnZ0lvYzBXQUdQMzdXQnl2dnNjdGpHdUdK?=
 =?utf-8?B?SWYzQ1ZKWkdPT1NUVkpUNW95RGMzLzNmT0RaZ0d4djhSTS9URjc4My83ZWZQ?=
 =?utf-8?B?Y3hvZmVWeENtUkdhSHZLWUVReVp4SEpEbXVDUkEvUTcyWHl6T0Iyc1c5ZmZK?=
 =?utf-8?B?bEVPb05CQUt0LzBkdUtsZnZLemJxZVhkcUs1SE5Bb3dFS0JHOFJrZUkxZzJj?=
 =?utf-8?B?MjZ2RHZXckl4QlZYQkUweEx4OTZiMHZ0c0RYVnNZNndWMEdza0FLNm9YcU12?=
 =?utf-8?B?TDNNcDlhcnllSGtmak9wZEFleVBva2g1S2dJQkYza3JqWXdnTzdBTHgwY2Iw?=
 =?utf-8?B?ellJK1k0VHpjaUJXeDYwRGFTZ1g2c3lMLzZFMTdjcUFZQndpWkNxU3RIeFRu?=
 =?utf-8?B?Y2h4RGtEcVNLUGFZek82SkdOMG5SY0ZFMFo5T2lDMVozeDh3dS9XQ2NpRHJp?=
 =?utf-8?B?eHRKbWQxM2NPN1JCL1lwMWxGQjV3VkU0VzZhRmxzQXQ0alptUkdXOXRmNm5Q?=
 =?utf-8?B?em9jWFBzVmpTTE9iZitmSjd1eE9zOVVWSFh5djRsVy9NZHRQdThJaFM5RlBS?=
 =?utf-8?B?bzNiUC9RUEJBRUJOWmZuS1JNUzhkOGhiQnQzR2pvdXg4S21qQTJYUnQ1OUxX?=
 =?utf-8?B?K3pOWHRmdWhLZjZaSVFsemZEd0wwNFZGaFgwZGM1Y1EvdjBRMmFldVhRMHRq?=
 =?utf-8?B?MXpGbnFCS2xCQmdrY05zYkRUNnozc1dzai9KZDVMQXpvOVdDbGdsb0ZvYU5L?=
 =?utf-8?B?a3ZwQXBGQkVudmlUak1PQm41dUd4RHczV0F6bWdiSkp6bURNbHZGUWZpaDlo?=
 =?utf-8?B?WGVDbjF6YnN1Z2VSbjB4SEg5UjN5UkdQdDZuR3h4dS9PTGhXUE03OC9hS3hw?=
 =?utf-8?B?WUU4c1FZcUF4VHk1RExHTzA5bTRHRkdEeXAzMFBRT1NjOHZmcjNKU3lqR0k3?=
 =?utf-8?B?U3VzakNpd29zUFlnOG14d2pXbnowTXBFcFV6MENwMnhjc3FLM29QRG1sNUh3?=
 =?utf-8?B?YndTQjArcklKcUd6V1ZMbVl1dng1blJrMGx3Wmp4RzE2TjhMZERUR2F2dnEw?=
 =?utf-8?B?SVFxaGk0d3dxMWpPSnRIU09HMGJvTVNQMFMrdXFLQk5hWkdVQjltVEFDMmxz?=
 =?utf-8?Q?Lym8GJYCYItWQiKAIgcRri8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20defeaa-ac14-441c-97e7-08d99a284d65
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1201MB2491.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 15:33:34.0017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yYhMvR7H3CS+zM+qsLftc54zoDUxNOs6hsL646ADQ/pSWORHnhR3ln1P1NfGGDXtzB3j6nXtn8ZSrrY+qmZsAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3931
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
Cc: rcampbell@nvidia.com, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org, jglisse@redhat.com,
 kvm-ppc@vger.kernel.org, ziy@nvidia.com, jhubbard@nvidia.com,
 alexander.deucher@amd.com, linuxppc-dev@lists.ozlabs.org, hch@lst.de,
 bskeggs@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Am 2021-10-27 um 9:42 p.m. schrieb Alistair Popple:
> On Wednesday, 27 October 2021 3:09:57 AM AEDT Felix Kuehling wrote:
>> Am 2021-10-25 um 12:16 a.m. schrieb Alistair Popple:
>>> MIGRATE_PFN_LOCKED is used to indicate to migrate_vma_prepare() that a
>>> source page was already locked during migrate_vma_collect(). If it
>>> wasn't then the a second attempt is made to lock the page. However if
>>> the first attempt failed it's unlikely a second attempt will succeed,
>>> and the retry adds complexity. So clean this up by removing the retry
>>> and MIGRATE_PFN_LOCKED flag.
>>>
>>> Destination pages are also meant to have the MIGRATE_PFN_LOCKED flag
>>> set, but nothing actually checks that.
>>>
>>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>> It makes sense to me. Do you have any empirical data on how much more
>> likely migrations are going to fail with this change due to contested
>> page locks?
> Thanks Felix. I do not have any empirical data on this but I've mostly seen
> migrations fail due to the reference count check failing rather than failure to
> lock the page. Even then it's mostly been due to thrashing on the same page, so
> I would be surprised if this change made any noticeable difference.

We have seen more page locking contention on NUMA systems that disappear
when we disable NUMA balancing. Probably NUMA balancing migrations
result in the page lock being more contended, which can cause HMM
migration of some pages to fail.

Also, for migrations to system memory, multiple threads page faulting
concurrently can cause contention. I was just helping debug such an
issue. Having migrations to system memory be only partially successful
is problematic. We'll probably have to implement some retry logic in the
driver to handle this.

Regards,
  Felix


>
>> Either way, the patch is
>>
>> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>
>>
>>> ---
>>>  Documentation/vm/hmm.rst                 |   2 +-
>>>  arch/powerpc/kvm/book3s_hv_uvmem.c       |   4 +-
>>>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |   2 -
>>>  drivers/gpu/drm/nouveau/nouveau_dmem.c   |   4 +-
>>>  include/linux/migrate.h                  |   1 -
>>>  lib/test_hmm.c                           |   5 +-
>>>  mm/migrate.c                             | 145 +++++------------------
>>>  7 files changed, 35 insertions(+), 128 deletions(-)
>>>
>>> diff --git a/Documentation/vm/hmm.rst b/Documentation/vm/hmm.rst
>>> index a14c2938e7af..f2a59ed82ed3 100644
>>> --- a/Documentation/vm/hmm.rst
>>> +++ b/Documentation/vm/hmm.rst
>>> @@ -360,7 +360,7 @@ between device driver specific code and shared common code:
>>>     system memory page, locks the page with ``lock_page()``, and fills in the
>>>     ``dst`` array entry with::
>>>  
>>> -     dst[i] = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
>>> +     dst[i] = migrate_pfn(page_to_pfn(dpage));
>>>  
>>>     Now that the driver knows that this page is being migrated, it can
>>>     invalidate device private MMU mappings and copy device private memory
>>> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
>>> index a7061ee3b157..28c436df9935 100644
>>> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
>>> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
>>> @@ -560,7 +560,7 @@ static int __kvmppc_svm_page_out(struct vm_area_struct *vma,
>>>  				  gpa, 0, page_shift);
>>>  
>>>  	if (ret == U_SUCCESS)
>>> -		*mig.dst = migrate_pfn(pfn) | MIGRATE_PFN_LOCKED;
>>> +		*mig.dst = migrate_pfn(pfn);
>>>  	else {
>>>  		unlock_page(dpage);
>>>  		__free_page(dpage);
>>> @@ -774,7 +774,7 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma,
>>>  		}
>>>  	}
>>>  
>>> -	*mig.dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
>>> +	*mig.dst = migrate_pfn(page_to_pfn(dpage));
>>>  	migrate_vma_pages(&mig);
>>>  out_finalize:
>>>  	migrate_vma_finalize(&mig);
>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>>> index 4a16e3c257b9..41d9417f182b 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>>> @@ -300,7 +300,6 @@ svm_migrate_copy_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
>>>  			migrate->dst[i] = svm_migrate_addr_to_pfn(adev, dst[i]);
>>>  			svm_migrate_get_vram_page(prange, migrate->dst[i]);
>>>  			migrate->dst[i] = migrate_pfn(migrate->dst[i]);
>>> -			migrate->dst[i] |= MIGRATE_PFN_LOCKED;
>>>  			src[i] = dma_map_page(dev, spage, 0, PAGE_SIZE,
>>>  					      DMA_TO_DEVICE);
>>>  			r = dma_mapping_error(dev, src[i]);
>>> @@ -580,7 +579,6 @@ svm_migrate_copy_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
>>>  			      dst[i] >> PAGE_SHIFT, page_to_pfn(dpage));
>>>  
>>>  		migrate->dst[i] = migrate_pfn(page_to_pfn(dpage));
>>> -		migrate->dst[i] |= MIGRATE_PFN_LOCKED;
>>>  		j++;
>>>  	}
>>>  
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
>>> index 92987daa5e17..3828aafd3ac4 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
>>> @@ -166,7 +166,7 @@ static vm_fault_t nouveau_dmem_fault_copy_one(struct nouveau_drm *drm,
>>>  		goto error_dma_unmap;
>>>  	mutex_unlock(&svmm->mutex);
>>>  
>>> -	args->dst[0] = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
>>> +	args->dst[0] = migrate_pfn(page_to_pfn(dpage));
>>>  	return 0;
>>>  
>>>  error_dma_unmap:
>>> @@ -602,7 +602,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
>>>  		((paddr >> PAGE_SHIFT) << NVIF_VMM_PFNMAP_V0_ADDR_SHIFT);
>>>  	if (src & MIGRATE_PFN_WRITE)
>>>  		*pfn |= NVIF_VMM_PFNMAP_V0_W;
>>> -	return migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
>>> +	return migrate_pfn(page_to_pfn(dpage));
>>>  
>>>  out_dma_unmap:
>>>  	dma_unmap_page(dev, *dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
>>> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
>>> index c8077e936691..479b861ae490 100644
>>> --- a/include/linux/migrate.h
>>> +++ b/include/linux/migrate.h
>>> @@ -119,7 +119,6 @@ static inline int migrate_misplaced_page(struct page *page,
>>>   */
>>>  #define MIGRATE_PFN_VALID	(1UL << 0)
>>>  #define MIGRATE_PFN_MIGRATE	(1UL << 1)
>>> -#define MIGRATE_PFN_LOCKED	(1UL << 2)
>>>  #define MIGRATE_PFN_WRITE	(1UL << 3)
>>>  #define MIGRATE_PFN_SHIFT	6
>>>  
>>> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
>>> index c259842f6d44..e2ce8f9b7605 100644
>>> --- a/lib/test_hmm.c
>>> +++ b/lib/test_hmm.c
>>> @@ -613,8 +613,7 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
>>>  		 */
>>>  		rpage->zone_device_data = dmirror;
>>>  
>>> -		*dst = migrate_pfn(page_to_pfn(dpage)) |
>>> -			    MIGRATE_PFN_LOCKED;
>>> +		*dst = migrate_pfn(page_to_pfn(dpage));
>>>  		if ((*src & MIGRATE_PFN_WRITE) ||
>>>  		    (!spage && args->vma->vm_flags & VM_WRITE))
>>>  			*dst |= MIGRATE_PFN_WRITE;
>>> @@ -1137,7 +1136,7 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
>>>  		lock_page(dpage);
>>>  		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
>>>  		copy_highpage(dpage, spage);
>>> -		*dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
>>> +		*dst = migrate_pfn(page_to_pfn(dpage));
>>>  		if (*src & MIGRATE_PFN_WRITE)
>>>  			*dst |= MIGRATE_PFN_WRITE;
>>>  	}
>>> diff --git a/mm/migrate.c b/mm/migrate.c
>>> index a6a7743ee98f..915e969811d0 100644
>>> --- a/mm/migrate.c
>>> +++ b/mm/migrate.c
>>> @@ -2369,7 +2369,6 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>>  		 * can't be dropped from it).
>>>  		 */
>>>  		get_page(page);
>>> -		migrate->cpages++;
>>>  
>>>  		/*
>>>  		 * Optimize for the common case where page is only mapped once
>>> @@ -2379,7 +2378,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>>  		if (trylock_page(page)) {
>>>  			pte_t swp_pte;
>>>  
>>> -			mpfn |= MIGRATE_PFN_LOCKED;
>>> +			migrate->cpages++;
>>>  			ptep_get_and_clear(mm, addr, ptep);
>>>  
>>>  			/* Setup special migration page table entry */
>>> @@ -2413,6 +2412,9 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>>  
>>>  			if (pte_present(pte))
>>>  				unmapped++;
>>> +		} else {
>>> +			put_page(page);
>>> +			mpfn = 0;
>>>  		}
>>>  
>>>  next:
>>> @@ -2517,15 +2519,17 @@ static bool migrate_vma_check_page(struct page *page)
>>>  }
>>>  
>>>  /*
>>> - * migrate_vma_prepare() - lock pages and isolate them from the lru
>>> + * migrate_vma_unmap() - replace page mapping with special migration pte entry
>>>   * @migrate: migrate struct containing all migration information
>>>   *
>>> - * This locks pages that have been collected by migrate_vma_collect(). Once each
>>> - * page is locked it is isolated from the lru (for non-device pages). Finally,
>>> - * the ref taken by migrate_vma_collect() is dropped, as locked pages cannot be
>>> - * migrated by concurrent kernel threads.
>>> + * Isolate pages from the LRU and replace mappings (CPU page table pte) with a
>>> + * special migration pte entry and check if it has been pinned. Pinned pages are
>>> + * restored because we cannot migrate them.
>>> + *
>>> + * This is the last step before we call the device driver callback to allocate
>>> + * destination memory and copy contents of original page over to new page.
>>>   */
>>> -static void migrate_vma_prepare(struct migrate_vma *migrate)
>>> +static void migrate_vma_unmap(struct migrate_vma *migrate)
>>>  {
>>>  	const unsigned long npages = migrate->npages;
>>>  	const unsigned long start = migrate->start;
>>> @@ -2534,32 +2538,12 @@ static void migrate_vma_prepare(struct migrate_vma *migrate)
>>>  
>>>  	lru_add_drain();
>>>  
>>> -	for (i = 0; (i < npages) && migrate->cpages; i++) {
>>> +	for (i = 0; i < npages; i++) {
>>>  		struct page *page = migrate_pfn_to_page(migrate->src[i]);
>>> -		bool remap = true;
>>>  
>>>  		if (!page)
>>>  			continue;
>>>  
>>> -		if (!(migrate->src[i] & MIGRATE_PFN_LOCKED)) {
>>> -			/*
>>> -			 * Because we are migrating several pages there can be
>>> -			 * a deadlock between 2 concurrent migration where each
>>> -			 * are waiting on each other page lock.
>>> -			 *
>>> -			 * Make migrate_vma() a best effort thing and backoff
>>> -			 * for any page we can not lock right away.
>>> -			 */
>>> -			if (!trylock_page(page)) {
>>> -				migrate->src[i] = 0;
>>> -				migrate->cpages--;
>>> -				put_page(page);
>>> -				continue;
>>> -			}
>>> -			remap = false;
>>> -			migrate->src[i] |= MIGRATE_PFN_LOCKED;
>>> -		}
>>> -
>>>  		/* ZONE_DEVICE pages are not on LRU */
>>>  		if (!is_zone_device_page(page)) {
>>>  			if (!PageLRU(page) && allow_drain) {
>>> @@ -2569,16 +2553,9 @@ static void migrate_vma_prepare(struct migrate_vma *migrate)
>>>  			}
>>>  
>>>  			if (isolate_lru_page(page)) {
>>> -				if (remap) {
>>> -					migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
>>> -					migrate->cpages--;
>>> -					restore++;
>>> -				} else {
>>> -					migrate->src[i] = 0;
>>> -					unlock_page(page);
>>> -					migrate->cpages--;
>>> -					put_page(page);
>>> -				}
>>> +				migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
>>> +				migrate->cpages--;
>>> +				restore++;
>>>  				continue;
>>>  			}
>>>  
>>> @@ -2586,80 +2563,20 @@ static void migrate_vma_prepare(struct migrate_vma *migrate)
>>>  			put_page(page);
>>>  		}
>>>  
>>> -		if (!migrate_vma_check_page(page)) {
>>> -			if (remap) {
>>> -				migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
>>> -				migrate->cpages--;
>>> -				restore++;
>>> -
>>> -				if (!is_zone_device_page(page)) {
>>> -					get_page(page);
>>> -					putback_lru_page(page);
>>> -				}
>>> -			} else {
>>> -				migrate->src[i] = 0;
>>> -				unlock_page(page);
>>> -				migrate->cpages--;
>>> +		if (page_mapped(page))
>>> +			try_to_migrate(page, 0);
>>>  
>>> -				if (!is_zone_device_page(page))
>>> -					putback_lru_page(page);
>>> -				else
>>> -					put_page(page);
>>> +		if (page_mapped(page) || !migrate_vma_check_page(page)) {
>>> +			if (!is_zone_device_page(page)) {
>>> +				get_page(page);
>>> +				putback_lru_page(page);
>>>  			}
>>> -		}
>>> -	}
>>> -
>>> -	for (i = 0, addr = start; i < npages && restore; i++, addr += PAGE_SIZE) {
>>> -		struct page *page = migrate_pfn_to_page(migrate->src[i]);
>>> -
>>> -		if (!page || (migrate->src[i] & MIGRATE_PFN_MIGRATE))
>>> -			continue;
>>>  
>>> -		remove_migration_pte(page, migrate->vma, addr, page);
>>> -
>>> -		migrate->src[i] = 0;
>>> -		unlock_page(page);
>>> -		put_page(page);
>>> -		restore--;
>>> -	}
>>> -}
>>> -
>>> -/*
>>> - * migrate_vma_unmap() - replace page mapping with special migration pte entry
>>> - * @migrate: migrate struct containing all migration information
>>> - *
>>> - * Replace page mapping (CPU page table pte) with a special migration pte entry
>>> - * and check again if it has been pinned. Pinned pages are restored because we
>>> - * cannot migrate them.
>>> - *
>>> - * This is the last step before we call the device driver callback to allocate
>>> - * destination memory and copy contents of original page over to new page.
>>> - */
>>> -static void migrate_vma_unmap(struct migrate_vma *migrate)
>>> -{
>>> -	const unsigned long npages = migrate->npages;
>>> -	const unsigned long start = migrate->start;
>>> -	unsigned long addr, i, restore = 0;
>>> -
>>> -	for (i = 0; i < npages; i++) {
>>> -		struct page *page = migrate_pfn_to_page(migrate->src[i]);
>>> -
>>> -		if (!page || !(migrate->src[i] & MIGRATE_PFN_MIGRATE))
>>> +			migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
>>> +			migrate->cpages--;
>>> +			restore++;
>>>  			continue;
>>> -
>>> -		if (page_mapped(page)) {
>>> -			try_to_migrate(page, 0);
>>> -			if (page_mapped(page))
>>> -				goto restore;
>>>  		}
>>> -
>>> -		if (migrate_vma_check_page(page))
>>> -			continue;
>>> -
>>> -restore:
>>> -		migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
>>> -		migrate->cpages--;
>>> -		restore++;
>>>  	}
>>>  
>>>  	for (addr = start, i = 0; i < npages && restore; addr += PAGE_SIZE, i++) {
>>> @@ -2672,12 +2589,8 @@ static void migrate_vma_unmap(struct migrate_vma *migrate)
>>>  
>>>  		migrate->src[i] = 0;
>>>  		unlock_page(page);
>>> +		put_page(page);
>>>  		restore--;
>>> -
>>> -		if (is_zone_device_page(page))
>>> -			put_page(page);
>>> -		else
>>> -			putback_lru_page(page);
>>>  	}
>>>  }
>>>  
>>> @@ -2700,8 +2613,8 @@ static void migrate_vma_unmap(struct migrate_vma *migrate)
>>>   * it for all those entries (ie with MIGRATE_PFN_VALID and MIGRATE_PFN_MIGRATE
>>>   * flag set).  Once these are allocated and copied, the caller must update each
>>>   * corresponding entry in the dst array with the pfn value of the destination
>>> - * page and with the MIGRATE_PFN_VALID and MIGRATE_PFN_LOCKED flags set
>>> - * (destination pages must have their struct pages locked, via lock_page()).
>>> + * page and with MIGRATE_PFN_VALID. Destination pages must be locked via
>>> + * lock_page().
>>>   *
>>>   * Note that the caller does not have to migrate all the pages that are marked
>>>   * with MIGRATE_PFN_MIGRATE flag in src array unless this is a migration from
>>> @@ -2770,8 +2683,6 @@ int migrate_vma_setup(struct migrate_vma *args)
>>>  
>>>  	migrate_vma_collect(args);
>>>  
>>> -	if (args->cpages)
>>> -		migrate_vma_prepare(args);
>>>  	if (args->cpages)
>>>  		migrate_vma_unmap(args);
>>>  
>
>
