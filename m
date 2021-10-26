Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8EA43B69B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 18:11:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdxdS1tqQz2ywf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 03:11:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=oK9a5GIf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=amd.com
 (client-ip=40.107.236.55; helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=felix.kuehling@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=oK9a5GIf; 
 dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2055.outbound.protection.outlook.com [40.107.236.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hdxcf37sYz2xB0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 03:10:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BiDE8eaQhu/1hsy0NBGOdwkK5gKTngTwwoWqQOY0Nz+EjmkhuV4ZpmQcJobFndiSAmPC9Wxu2YrG5TaN7bsYOw18r9//IowKdpvO1s7NymLQBVdYRHHmOgNbv5Ug961Cz+GXbwD4TxYmmjp8VqfwlpCKJLAsWWn5cdEFeKfYjgbHsL8fZ2MpQ0zTzyrEHDS+CQYlXu/hasd5Y+TGRvVaLEgxjfhW2dUBDXcL4SGTuDJT+oIO2TiamVXFSLXlRoYNOqt0a5AMMrNm3cUgNMVnqNdmozZqqbMXtOPHCbu5oDqYGmrwJlshTk3kqkFGNhwYub2BFF/luozry5sEUe1JKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/j3iQWvhbgV+Ui/Yv2yn2kv7bUeyLawI76+a9CbgPU=;
 b=YCVBudUhHlMcbm8T2sCReyiJFkYP9neAER816xxOMr0dwpjFnSV7X7FpDj3JhcYCnBl0I14C5u+4z4W5S/Aw03LBjitIGFkxcumYZ2rE1NMrY5NgTXHvmBk9017tktWemUhj5fsPrhw8ikDUSQ4xVc1aBPGOA6XAD6sdvy6Mlo2KMWorOk89O7BAZ5jNl1sLKhfZK+CzS7OzK1jHUjydCvp83mQdUVQcPCT4xZ22PgftsXdoHsx/rLitm/pvGimtmrqjrDzG0IHqFi17r8a4/ZvibYPr9APp5ew1hniTsOh3rsaPeCRoSdtEQWmIWv2p+VdhnCoe4SPxTOYGj0oSYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/j3iQWvhbgV+Ui/Yv2yn2kv7bUeyLawI76+a9CbgPU=;
 b=oK9a5GIfXKj9QZA4mVznaduWfVv7HCIB/KW4yJ2rl6cvLEN23ijEPHif9CWxiKf1Ku/cSaXECIl9BwfU/ylylvvZpEUKaqTGx/sgzgsVBCOCDJMaYiztCug9Xfijm5buKobCmlKNasLkzj6pBNCdh0S3HDqJJT9P2SPmppyBkts=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR1201MB2491.namprd12.prod.outlook.com (2603:10b6:3:eb::23)
 by DM6PR12MB3401.namprd12.prod.outlook.com (2603:10b6:5:39::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 16:10:00 +0000
Received: from DM5PR1201MB2491.namprd12.prod.outlook.com
 ([fe80::d153:3aa6:4677:e29]) by DM5PR1201MB2491.namprd12.prod.outlook.com
 ([fe80::d153:3aa6:4677:e29%7]) with mapi id 15.20.4628.020; Tue, 26 Oct 2021
 16:10:00 +0000
Subject: Re: [PATCH] mm/migrate.c: Remove MIGRATE_PFN_LOCKED
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org
References: <20211025041608.289017-1-apopple@nvidia.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <14d807ba-04f8-49cb-8094-bde1032f1eaf@amd.com>
Date: Tue, 26 Oct 2021 12:09:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211025041608.289017-1-apopple@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: YQBPR0101CA0106.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::9) To DM5PR1201MB2491.namprd12.prod.outlook.com
 (2603:10b6:3:eb::23)
MIME-Version: 1.0
Received: from [192.168.2.100] (142.118.126.231) by
 YQBPR0101CA0106.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:5::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.22 via Frontend Transport; Tue, 26 Oct 2021 16:09:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed698679-2d1c-4774-ad2c-08d9989b0fc2
X-MS-TrafficTypeDiagnostic: DM6PR12MB3401:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3401AB0CB7ED99131D1B072C92849@DM6PR12MB3401.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QlaAXwgfGBhP2oyAL4Jk72FCZ6nNoKutXudRKnOwKSIFH+uajOiAEwa8T4jR2rtaJC0GsnZB6NJPc3cU5WRa6269OnDgFAD6UfqIDJ9XmtCWi2IOtPijjJE1/sXIY4x3IgR4+MkXSpzR/q68u+Hyu1hXjHKP/pz2p0IlbIXwMclgVmC7uIVnJC3kbCxLCox1SB6Z2pbsICwa57YkAv11f/YPAt9ynwtLN2zsaD90548FjEWHgW75yxADgjlWDYJfIUZdGWUb8oU73WW1JyOH96jVlRT+aVIJ7b4n4MaZYTrkYcr0D2u8BRYntvmByFTjyqQJu96tn5JxvrrKdo+YU2TIZW9mzvplgKhM6DAae63ylm38hWrJ8Lx6W2R7TXkmv+a5nlk68zGpMtQBqp5IkMVxcLrdNzkWPWfKYC7OQOKgK+uoesR8TywhZFG7wSP0SFgYoU1VZnsPGoepLHAm7yVqFgk6opcE8Fk92PkIHgwbzUh+VoA0l0unCbF1W9yuItJm6vfJXgs6KC9KSDfntgJufDQ3uOfJ1hhP2L7CdfeD9TBK0JOvxGvBktKoTCAzmLgQiew5WMxgzogh6qq7plbBmijAjBluLf2qrYy7Jo7vd3Lqlq3ZQSrStyRKrRv+6Sd60pqUs9vLl7JaKL5fiBfdXqHPYfNd3l5fHbGxvcvIzbYWVHUInYE+HD4FphKj4VptTr2dmi170yCzzdsXTmljHQbXh4sH201aIT8uaVLrlGhSxCLifo0zSUuRk+Qs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1201MB2491.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(4326008)(26005)(7416002)(66946007)(4001150100001)(6486002)(30864003)(2616005)(2906002)(36756003)(86362001)(8936002)(956004)(5660300002)(66556008)(186003)(38100700002)(8676002)(31686004)(44832011)(83380400001)(66476007)(508600001)(16576012)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alRaQTd2YmphS210dHJmSERMWmtKQWdHYWtadTNZeXI3bmNLTUNzNExrRnUx?=
 =?utf-8?B?N0RUS3RXMW5RV1Zoa2ovaHNlbENMcnNES0M2cmhCMCsvdjlhbzg2YmFzVlB0?=
 =?utf-8?B?ZytsdHhLdlJyR2FOZmNsOThvQkx1UGR5dGtiUFhkQXV2Yk53Q0hQWWhpN05C?=
 =?utf-8?B?QTBUazVIWFo5VzkvZTlmend0Vlloc0kxUkg3MnpIazR4YmNwRmZTbVhiRmlh?=
 =?utf-8?B?OVgzQTRJc1pmYmpLcW4zcFdFWGd4WC9jMHlsSFR2Ry9McndqanZ6SUg3Sndi?=
 =?utf-8?B?VlgzZVlWbHpjRU9LNTFoOE54L2lzT0VFR28vQmpTVEUrVENsbngrMzRiTzhO?=
 =?utf-8?B?M2JZQzRSdWprZDZiTFk5SjE2Zis2MkpaeXFlMTVoZkVSU1VORldvdTlmQWpL?=
 =?utf-8?B?TFhOQlArRCttMU5UMEtqeFVoOHg5eWZVVlRRcjNKNkVWR1NmajJMbC92dDZL?=
 =?utf-8?B?bTZXNkpHRHIxVmMrbEJKUEsvQUlCODlwN2VEVU1wQThubDZnUjBnN2dwTzZ4?=
 =?utf-8?B?M2ZRa0duU3IyMnltMlkvcDlMM0toMGl0WFViYjZlNG10NmlEa1BhMlorRjNs?=
 =?utf-8?B?NDJIbFBDK0ljcmtaNUVJSCs4YnFxSkFZN0x3MXJ4TGp4SG1yNFlyWlJjeWU0?=
 =?utf-8?B?SDJzTDZPSHI2ejdwMGtEcmRQcjNCWW03K3d6ZFI5b0haMjlNV2pPVTk4T1F0?=
 =?utf-8?B?Y0VJWHdOU2VENHdrRnJlNGVWQ2M5S1g5QWtETUE0Nkgyc1pHdHpPRW1Fc1BI?=
 =?utf-8?B?djB3dWpsS2pmVzV2c1RjWkFnQklqQy9WZnJ2U2ZHWnRmUHhkenRKY2JLMzJP?=
 =?utf-8?B?RjZ5Vm01WnRLVUdEby9TcDhZL3o4ZzcyTXNOclhnNkVIT0lyMkZMZGhzRUJw?=
 =?utf-8?B?VVpCcjVraUUvcUIyWFBkcU1iaHd6RjRDQlZ3eERrdUJ2TG41OU9sVFlXL2xo?=
 =?utf-8?B?bEg1b21WMXRQOXN4QTQ0SEtsaW00T2xzMjl1b293SlI1RjFOUmFOSk5VWU80?=
 =?utf-8?B?Vzc2R1dNOVBLbm5Wbkk5WVdtQTZTSzZvaDlFSnFTMDlyWjhGZlhaUTNnNEg5?=
 =?utf-8?B?V2RxNi9maTAxaFBtOVBNYXdERHFqNVhwMTFoMWEvSnF6cW5hWld6RG5aQzhI?=
 =?utf-8?B?bER1dFBBaUVkT3Q3Vis0QTE1NFoydWpPWFNNd3RjSFh3S08zaTJBVEI2V2Ev?=
 =?utf-8?B?SDI5eFlhcWNFcjhIeEVydEtRVVBxMDREeDgvYmR2YXF6cGhyNUhiQ2g1THZ0?=
 =?utf-8?B?V3pMaWZ3Z3JIWlNmZmREUGZlWHIzSlNJM2JRSXh0Zm0wS0hEbmFJVXVuYVBK?=
 =?utf-8?B?a3RxRjVxZkxEQmFZTkpQdzVHRlQraGl6ZjZ0RG5tSW5JRUFadjJzbUZxeE10?=
 =?utf-8?B?c0FUakRmcS9KSkc2bEo1Ty9OVkNUbzdJL2Q1Wk85TDZDYkJIVit4TjJ4Nm9l?=
 =?utf-8?B?cTlvK3dlN3cybTQrSHlTYzJ2Ny95VVdNbDBnQnl4dFJZdmJOOTZkNTdZVW5m?=
 =?utf-8?B?MFJBZERWekFvaHFkaDNydWk4UXRyc2RaN3BUeHNxZFBENkU3djBUWkhBMWV2?=
 =?utf-8?B?aW8rdWhCaVNZazE1eGdiblRHc3JtdXArVTdWTExCZjErOFFhczRydUM5ZWZM?=
 =?utf-8?B?L1ZScWVReDNJV3pJR1NwYXhUZzJKN0pxMDdmZXFVeUdqZm9LVm1NQWJ4a1Zk?=
 =?utf-8?B?ZnFBSzlkSHVzRjJVajhSWTRkZEFlRWZSU1ZPV1NiNFNZb2VuVTduVzZQcm9I?=
 =?utf-8?B?cUN6S1dZUllLdUxmWlZOckplOXc2aEZDWTM5ZXIzTUxqK2YyUC9XQkZ1MUYx?=
 =?utf-8?B?STkzamExMzcycnRsVjFGNFlNRXdWcVErV3ROZURXL2FBdm1vTVFoc1ljR2xt?=
 =?utf-8?B?aWdBMmN5a2tkeEQrcklIK0h0Z1R6b3ZvZzZJdXNQNFVzVThuVytVTVRLU2Jp?=
 =?utf-8?B?UWZXblV5c1QxMDlXRko1QUNIblpmQlpjSkF6Zk91bDNlb3pUN1F3NGowdXl4?=
 =?utf-8?B?Y1VEK1BrS3ZJMmp2MkxuWkFLTC9nWld3VklOZTJXc3NpbDZreUtSaXlmQnRQ?=
 =?utf-8?B?RGY4WGJNTFdtUGUrODh1a3EzbWt3dXdCQzZrTlB1eTdkdzhIc1oxdFNTRG9y?=
 =?utf-8?B?NnZmTU1iSjY1Um1OOGFVaVZWMkgrUVdOK2dLcklhN3hrZG02U09GUkxSYWs4?=
 =?utf-8?Q?sYviTuUqlGI2XDU9wfNIuoo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed698679-2d1c-4774-ad2c-08d9989b0fc2
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1201MB2491.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 16:10:00.4193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z8y0NOQPGdXJbFIljT9REhUhVKqi3f2xm5UBcPIW17WtxVowntGcyKofuV4f5l4guvP3VJTHCjZeUnE4QrHxWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3401
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

Am 2021-10-25 um 12:16 a.m. schrieb Alistair Popple:
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

It makes sense to me. Do you have any empirical data on how much more
likely migrations are going to fail with this change due to contested
page locks?

Either way, the patch is

Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>  Documentation/vm/hmm.rst                 |   2 +-
>  arch/powerpc/kvm/book3s_hv_uvmem.c       |   4 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |   2 -
>  drivers/gpu/drm/nouveau/nouveau_dmem.c   |   4 +-
>  include/linux/migrate.h                  |   1 -
>  lib/test_hmm.c                           |   5 +-
>  mm/migrate.c                             | 145 +++++------------------
>  7 files changed, 35 insertions(+), 128 deletions(-)
>
> diff --git a/Documentation/vm/hmm.rst b/Documentation/vm/hmm.rst
> index a14c2938e7af..f2a59ed82ed3 100644
> --- a/Documentation/vm/hmm.rst
> +++ b/Documentation/vm/hmm.rst
> @@ -360,7 +360,7 @@ between device driver specific code and shared common code:
>     system memory page, locks the page with ``lock_page()``, and fills in the
>     ``dst`` array entry with::
>  
> -     dst[i] = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
> +     dst[i] = migrate_pfn(page_to_pfn(dpage));
>  
>     Now that the driver knows that this page is being migrated, it can
>     invalidate device private MMU mappings and copy device private memory
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> index a7061ee3b157..28c436df9935 100644
> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> @@ -560,7 +560,7 @@ static int __kvmppc_svm_page_out(struct vm_area_struct *vma,
>  				  gpa, 0, page_shift);
>  
>  	if (ret == U_SUCCESS)
> -		*mig.dst = migrate_pfn(pfn) | MIGRATE_PFN_LOCKED;
> +		*mig.dst = migrate_pfn(pfn);
>  	else {
>  		unlock_page(dpage);
>  		__free_page(dpage);
> @@ -774,7 +774,7 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma,
>  		}
>  	}
>  
> -	*mig.dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
> +	*mig.dst = migrate_pfn(page_to_pfn(dpage));
>  	migrate_vma_pages(&mig);
>  out_finalize:
>  	migrate_vma_finalize(&mig);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index 4a16e3c257b9..41d9417f182b 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -300,7 +300,6 @@ svm_migrate_copy_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
>  			migrate->dst[i] = svm_migrate_addr_to_pfn(adev, dst[i]);
>  			svm_migrate_get_vram_page(prange, migrate->dst[i]);
>  			migrate->dst[i] = migrate_pfn(migrate->dst[i]);
> -			migrate->dst[i] |= MIGRATE_PFN_LOCKED;
>  			src[i] = dma_map_page(dev, spage, 0, PAGE_SIZE,
>  					      DMA_TO_DEVICE);
>  			r = dma_mapping_error(dev, src[i]);
> @@ -580,7 +579,6 @@ svm_migrate_copy_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
>  			      dst[i] >> PAGE_SHIFT, page_to_pfn(dpage));
>  
>  		migrate->dst[i] = migrate_pfn(page_to_pfn(dpage));
> -		migrate->dst[i] |= MIGRATE_PFN_LOCKED;
>  		j++;
>  	}
>  
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 92987daa5e17..3828aafd3ac4 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -166,7 +166,7 @@ static vm_fault_t nouveau_dmem_fault_copy_one(struct nouveau_drm *drm,
>  		goto error_dma_unmap;
>  	mutex_unlock(&svmm->mutex);
>  
> -	args->dst[0] = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
> +	args->dst[0] = migrate_pfn(page_to_pfn(dpage));
>  	return 0;
>  
>  error_dma_unmap:
> @@ -602,7 +602,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
>  		((paddr >> PAGE_SHIFT) << NVIF_VMM_PFNMAP_V0_ADDR_SHIFT);
>  	if (src & MIGRATE_PFN_WRITE)
>  		*pfn |= NVIF_VMM_PFNMAP_V0_W;
> -	return migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
> +	return migrate_pfn(page_to_pfn(dpage));
>  
>  out_dma_unmap:
>  	dma_unmap_page(dev, *dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> index c8077e936691..479b861ae490 100644
> --- a/include/linux/migrate.h
> +++ b/include/linux/migrate.h
> @@ -119,7 +119,6 @@ static inline int migrate_misplaced_page(struct page *page,
>   */
>  #define MIGRATE_PFN_VALID	(1UL << 0)
>  #define MIGRATE_PFN_MIGRATE	(1UL << 1)
> -#define MIGRATE_PFN_LOCKED	(1UL << 2)
>  #define MIGRATE_PFN_WRITE	(1UL << 3)
>  #define MIGRATE_PFN_SHIFT	6
>  
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index c259842f6d44..e2ce8f9b7605 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -613,8 +613,7 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
>  		 */
>  		rpage->zone_device_data = dmirror;
>  
> -		*dst = migrate_pfn(page_to_pfn(dpage)) |
> -			    MIGRATE_PFN_LOCKED;
> +		*dst = migrate_pfn(page_to_pfn(dpage));
>  		if ((*src & MIGRATE_PFN_WRITE) ||
>  		    (!spage && args->vma->vm_flags & VM_WRITE))
>  			*dst |= MIGRATE_PFN_WRITE;
> @@ -1137,7 +1136,7 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
>  		lock_page(dpage);
>  		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
>  		copy_highpage(dpage, spage);
> -		*dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
> +		*dst = migrate_pfn(page_to_pfn(dpage));
>  		if (*src & MIGRATE_PFN_WRITE)
>  			*dst |= MIGRATE_PFN_WRITE;
>  	}
> diff --git a/mm/migrate.c b/mm/migrate.c
> index a6a7743ee98f..915e969811d0 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -2369,7 +2369,6 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  		 * can't be dropped from it).
>  		 */
>  		get_page(page);
> -		migrate->cpages++;
>  
>  		/*
>  		 * Optimize for the common case where page is only mapped once
> @@ -2379,7 +2378,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  		if (trylock_page(page)) {
>  			pte_t swp_pte;
>  
> -			mpfn |= MIGRATE_PFN_LOCKED;
> +			migrate->cpages++;
>  			ptep_get_and_clear(mm, addr, ptep);
>  
>  			/* Setup special migration page table entry */
> @@ -2413,6 +2412,9 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  
>  			if (pte_present(pte))
>  				unmapped++;
> +		} else {
> +			put_page(page);
> +			mpfn = 0;
>  		}
>  
>  next:
> @@ -2517,15 +2519,17 @@ static bool migrate_vma_check_page(struct page *page)
>  }
>  
>  /*
> - * migrate_vma_prepare() - lock pages and isolate them from the lru
> + * migrate_vma_unmap() - replace page mapping with special migration pte entry
>   * @migrate: migrate struct containing all migration information
>   *
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
>   */
> -static void migrate_vma_prepare(struct migrate_vma *migrate)
> +static void migrate_vma_unmap(struct migrate_vma *migrate)
>  {
>  	const unsigned long npages = migrate->npages;
>  	const unsigned long start = migrate->start;
> @@ -2534,32 +2538,12 @@ static void migrate_vma_prepare(struct migrate_vma *migrate)
>  
>  	lru_add_drain();
>  
> -	for (i = 0; (i < npages) && migrate->cpages; i++) {
> +	for (i = 0; i < npages; i++) {
>  		struct page *page = migrate_pfn_to_page(migrate->src[i]);
> -		bool remap = true;
>  
>  		if (!page)
>  			continue;
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
>  		/* ZONE_DEVICE pages are not on LRU */
>  		if (!is_zone_device_page(page)) {
>  			if (!PageLRU(page) && allow_drain) {
> @@ -2569,16 +2553,9 @@ static void migrate_vma_prepare(struct migrate_vma *migrate)
>  			}
>  
>  			if (isolate_lru_page(page)) {
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
>  				continue;
>  			}
>  
> @@ -2586,80 +2563,20 @@ static void migrate_vma_prepare(struct migrate_vma *migrate)
>  			put_page(page);
>  		}
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
>  			}
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
>  			continue;
> -
> -		if (page_mapped(page)) {
> -			try_to_migrate(page, 0);
> -			if (page_mapped(page))
> -				goto restore;
>  		}
> -
> -		if (migrate_vma_check_page(page))
> -			continue;
> -
> -restore:
> -		migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
> -		migrate->cpages--;
> -		restore++;
>  	}
>  
>  	for (addr = start, i = 0; i < npages && restore; addr += PAGE_SIZE, i++) {
> @@ -2672,12 +2589,8 @@ static void migrate_vma_unmap(struct migrate_vma *migrate)
>  
>  		migrate->src[i] = 0;
>  		unlock_page(page);
> +		put_page(page);
>  		restore--;
> -
> -		if (is_zone_device_page(page))
> -			put_page(page);
> -		else
> -			putback_lru_page(page);
>  	}
>  }
>  
> @@ -2700,8 +2613,8 @@ static void migrate_vma_unmap(struct migrate_vma *migrate)
>   * it for all those entries (ie with MIGRATE_PFN_VALID and MIGRATE_PFN_MIGRATE
>   * flag set).  Once these are allocated and copied, the caller must update each
>   * corresponding entry in the dst array with the pfn value of the destination
> - * page and with the MIGRATE_PFN_VALID and MIGRATE_PFN_LOCKED flags set
> - * (destination pages must have their struct pages locked, via lock_page()).
> + * page and with MIGRATE_PFN_VALID. Destination pages must be locked via
> + * lock_page().
>   *
>   * Note that the caller does not have to migrate all the pages that are marked
>   * with MIGRATE_PFN_MIGRATE flag in src array unless this is a migration from
> @@ -2770,8 +2683,6 @@ int migrate_vma_setup(struct migrate_vma *args)
>  
>  	migrate_vma_collect(args);
>  
> -	if (args->cpages)
> -		migrate_vma_prepare(args);
>  	if (args->cpages)
>  		migrate_vma_unmap(args);
>  
