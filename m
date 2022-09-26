Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C61205EB51F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 01:08:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mbz2M4RjSz3c6x
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 09:08:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=CYegn+Gc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=40.107.237.76; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=felix.kuehling@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=CYegn+Gc;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mbz1b5vrcz2xh0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 09:07:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iEtuLduRjCHXKLKox8v3K3qlNtlmdj8mNYjqRSBwmaMN9XI7wt/Rbl9AtL47qReQSJ17iHN/PhdFJtaPea36SqkND+ZSBGpfgE7b2coJtcPZYpaeEClelds9zr5TPmZeJr57srZHAJ66DvCYwSEdEqAFPrMappG+2l5xLd+5OgjJKsK1o9cN06jTTnKRQDMSLgevkTcESxeV37nnQYscKq1ITZcQTHCXNfyOcXBT/yArFX9PfmJuBK37STP7hrsYO75scC013VYPqeNUhIjrpdLvwd1nyjDbo73Eqma6gwjp+sh8zqzj685VbpQ0W4uVA2fnLvHsRBwcrnzr/Amrrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f4jruuo5f0/woYUgGnhOuFCup3VKmC6SqKASccIIV8A=;
 b=jh2QHKM6/iuBk4RjWrKudVaNBk6nEpN4VmkTeTAS6d/n03ud35m7H7+8dJ6i6qGa7eHM5D7XnYB2Bmic9WHOoPiocceoZTyWatVuMFBpGzmmRINwfs1eOq2fI3KB//mxvSgwmFQmKXUkcMzeHfHJpoA43IVx0r9yRz5PyBNVmU3FGBUl1fdYV9ydKcV9OgJ513Xu+QFo4/e5i0ewkJHd8Wx/ZaN0tnyOTU1QbdShuLLzdEq6H/TG55IiZ7G2tItqc+zP1qRAiNoIMSaINoqdI7lbiRhz+0/LzOQKupOI5kfgRAznXQsyqOdftVVMyVk6LhDR44YH+VtTit+aA/3jdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f4jruuo5f0/woYUgGnhOuFCup3VKmC6SqKASccIIV8A=;
 b=CYegn+GcrDZ/NoaJJSpmDc+ichLCkg70fJwS1+btPQFGKN6mccW65i1hOFWLM7GxlWC+SuCKuUTpKi3FNVpr1mzphqqKvK7+wm4e8tQnAPtYfjXqe4VnVEk3vQbjKCGDkWSHDStlI9+wSiFvos9ub9Jb3CCGXrtKQxygfBxsz+w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MN0PR12MB5955.namprd12.prod.outlook.com (2603:10b6:208:37e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 23:07:26 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::3de4:456f:800d:e013]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::3de4:456f:800d:e013%5]) with mapi id 15.20.5654.026; Mon, 26 Sep 2022
 23:07:26 +0000
Message-ID: <7ca6ec0c-7e5e-3b24-8f8d-650df357130c@amd.com>
Date: Mon, 26 Sep 2022 19:07:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 6/7] nouveau/dmem: Evict device private memory during
 release
Content-Language: en-US
To: Lyude Paul <lyude@redhat.com>, Alistair Popple <apopple@nvidia.com>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
References: <cover.f15b25597fc3afd45b144df863eeca3b2c13f9f4.1664171943.git-series.apopple@nvidia.com>
 <072e1ce590fe101a4cdbd5e91b1702efebb6d0fd.1664171943.git-series.apopple@nvidia.com>
 <881735bda9b1ba0ecf3648af201840233508f206.camel@redhat.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <881735bda9b1ba0ecf3648af201840233508f206.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:610:59::25) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|MN0PR12MB5955:EE_
X-MS-Office365-Filtering-Correlation-Id: 0df7500c-3156-4f48-0760-08daa013e0a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	U88tjZ5bjFHikN4GVaVC8CRBUSqgM1I8lZvP7n+r8WFU37jaeqOogEQ1qLZy42WCF8OyjwUpckJP0TB3DkDssZTQvuFF7Ren/orHqyKxDk8sH/di6XKOQP7XxrRe8FgANemacFa8SYujPTQPKkL68t5O6exrFBh+dUt+4TOkOJBAez+GuNw+IXMf9LA6OFdsogGQFYqYPvc5n4d7hxT3MP27d7VEMjpkO9R04S6dnICuRfdHpJ746TVemwLgOZ9QvSLH+LAsOdrfTEFwI2xkSdjrxDmO1lu5kVWcK3mSNBbTQWMgokS5SLRxC4HzRJiSVyxqO7UYgB0AckOXc1FZYJH1xoxaTtypGHqhFUPUMiPyVjrBAHBEvhtGkhkPD15OXFrT3N6ndMTNnrh00m9k8ceSYmfGlp0JvW65M1gCuhuQf/tQK0ry5binRcgE3W9XjxNov2aAu5Qhb6MnP9booaOZBV5r63JNqeJkl3y61Jz88od3wvUZcvRph7K98F9iMHE9k74jY7I79Dr3ybEDIKTNpwTpEIirqcxQ1yEaRzPQkOdRdd6XnSFV+3BfxQnZmn4HOLtsk6w3GHcswNeg1kFpGjcOd1l5/tmW04YNjTPv5MH+7Vg4ND+CMcgiAjgEbDoAZpC3Px4MtC8S+GtQawwMZUOOoQIWqBteyntouCdp/jzzpyiSgeJ1kebyjuO0hIboxVy75v+90W4HtNied+9DjI0J8uo67Rw+ddYMGV6X/9P5A0i7TXac+VTEMbSR
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5115.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(346002)(39860400002)(396003)(376002)(451199015)(6506007)(53546011)(36916002)(41300700001)(478600001)(6486002)(83380400001)(6512007)(966005)(26005)(186003)(2616005)(2906002)(7416002)(44832011)(6666004)(316002)(110136005)(54906003)(66556008)(66946007)(8936002)(4326008)(8676002)(66476007)(5660300002)(38100700002)(31696002)(86362001)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?NlRJWE5XcXlhLzM5Uis1UmNRU3NqbHZVejlTZmxteVBDLytIQ2lEVm11aXRI?=
 =?utf-8?B?N3NSdzFHK0dKdGs3UmhpYXNzeG1MR0FTdDdhMWZyUndabG41dVpreW1JMUFS?=
 =?utf-8?B?eENMTXkxQ2J1cmVwZGpObVkwMXVOQ25qclQzY294bUdGcXdOdXRacUs3dHhp?=
 =?utf-8?B?cFZkUjlpUWluVWxsR2hOczIvSHBjVmFDNjZMb2tKVEZTK3pycCtvS1VhdE5G?=
 =?utf-8?B?ZzF5aElPRUhyM3BWbHZCUTZGU3k1NHVNUXJYaUdIeVRFWlZyWUZEYlBLRmg2?=
 =?utf-8?B?OEZkYkpOVVUvSDQ1bnhkcmVaLzNlbFZUdjN2RkRvR0RTb3R0VTBrUzdCVUdJ?=
 =?utf-8?B?NnVhcWVCdW91bVp5MFJqNUpPd295RnYyV1luQjNlRmVUci9XTGl0RVFUcnBq?=
 =?utf-8?B?WHhJTGgvUll4WlFReFpwekxZeGU4enVGZXRpNVMrVHNQeHlJY2xnUGdvalVQ?=
 =?utf-8?B?YlVqckY5S3FWNVVoNWV4S1BEZW9meEpTbDh4MVNVR3RKamRNRTJ5SGU3b3NR?=
 =?utf-8?B?a2l2Q2xwbkRUbGdPN2NsMmkvVmZpN3FNbjltaXJoNVRxV21vblhHTUFjSEZB?=
 =?utf-8?B?ZEhMcWJMc3JBMTZTT0x2QUFBdm5leHpHTGFMaFFMbXFKU1VacnVwMGh4NmRN?=
 =?utf-8?B?V2xHTFR5VXlyQkpnYlhVbWQrOGtYRUVEWGVZTEthL1N5dWc1dUdSQVQ4K0Zr?=
 =?utf-8?B?NjJYNzBkMXBtbFdlcVFoazdHRXNPT1FuN1l2czdiYll3MUsxd1h6Z29xYXky?=
 =?utf-8?B?MmQwUHFKRFpuVmxZQ1kwT1dmTlQ1ODZFd0s3WFdXd3VCdXZxeUJ0THJnWmdJ?=
 =?utf-8?B?OHR5RG1jQUM5dEJ1eWJJaXFHQnpOL1Y0UXJzTzNRVmVrMXBRRS9NQURGb0J2?=
 =?utf-8?B?bnBqRDVZWS93aWJYRFllaGxlb0d2Q0JKSjJRK0dqLys1ZU1hbmxyOS82R2ly?=
 =?utf-8?B?bHlJSmF0cVUxdm5tbzZLL3lJUFhHU1VYQmVaZEc4UXlFVHFyUW5zR2QxZkFr?=
 =?utf-8?B?ZEt4Q0RyN1Npb0NGZkFUZ3NWanpxOEY3bkFKQVBObFJNYUN6SCsyRGxOZElL?=
 =?utf-8?B?QlJhL2t1VWJmcElUTVVLcHE2d0hwOHUwNHdheVh4dHJUNi95ZkpTaWJvT3VV?=
 =?utf-8?B?VFVJdjlENEpRZGF6aG9mMks4WXFEdUxUbjVxU0pwMFhvbVdJUXU0RVljZWhZ?=
 =?utf-8?B?SE5CNlZrcEY3ejRxT1c2bXhjbkljc2xnRkdQdzQvMGFLL1RSR3Q5SFJXL2pz?=
 =?utf-8?B?NHRFYTB0dzk3WTNBcWdQNFltbFNPSTlxRzFqUFpFUDI5ZFNVUFQzMVVMdnBy?=
 =?utf-8?B?S3JxRXBJRmtQWEFQcnJsM3NMUFVWaWN1Vy9paVk2bmphajRUM3NicUMzWXNa?=
 =?utf-8?B?QXFLN3BnRUppaGRBemRpSEd6Rk5wd0tYNHNiRzlUNHRyOTlIdGpRZER2UFFX?=
 =?utf-8?B?WWsxNXc1Nzc0aXI5WU1ZZkcwZE1kaTRQbmhMa3oyUzBTL3BHWTB4SDZnU0Z3?=
 =?utf-8?B?ck9pTnVyWEhneFBpOUliQ0VTYTB0OGRKeTlGeUtqU29rTUpNRlNFZnVoaHZT?=
 =?utf-8?B?RnRWREh2dlRXTlJVMGk4QVdIL1VjdWM4clQrZnRobzNoSU90WHFPYXlXOXRq?=
 =?utf-8?B?LytOcTZWWFRUcGxjelZISEhQVytuNFY5RENrVUpPSGpxcHR6Tkd6am1oYWhZ?=
 =?utf-8?B?anU2cFpyV0RybEJUdFBxRzBjdUQyYzJtaGVqcEVhemVIN0Q0UmFtYkc0ZlNw?=
 =?utf-8?B?YlNRbVhPdGNIclkzL2k1c01sdFJLOG1jTHEyY3ZLVC95bWVOUngwWnUzMEx3?=
 =?utf-8?B?bTlyQW54Qy9ZMkRSUnBJWk45Q3FJNUMrQzcvYlVVZ2xCUUtqOXdMWWI0RDdk?=
 =?utf-8?B?ZDV4OS8vdFdIeCtWYzFuNndiS05HcjhhdklHMTJWNExua0k1aXBiRkV4Y2Q5?=
 =?utf-8?B?bWdkVHlxcE1SMXFwbS9IMDBxS0JHUml1bHpxKzNSMm5GaEcrZEZ0WE4rQTZZ?=
 =?utf-8?B?c2NOZTNPVmtqVXc2RG1ycXB1NUVOZk9kcnJ2R3NVSFdyaFp0bng3ZzFjdW90?=
 =?utf-8?B?TVJkR3oxY0REM0k2bEhicTBsakFieG53VzdNNW5XbG9wZy9DVkFTZUVFQjNN?=
 =?utf-8?Q?OWT7ARtwlbYB9gX89NMxg0mAG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0df7500c-3156-4f48-0760-08daa013e0a8
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 23:07:26.2151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RqAqrbl7tiG4eXbeHTHignijr6ihu5B8xvJyJryUpPi9Fy3cBFwu5NAtB7EetiUdssvxXddADbsVh6L0j2/D1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5955
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
Cc: Alex Sierra <alex.sierra@amd.com>, Ralph Campbell <rcampbell@nvidia.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>, Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, Alex Deucher <alexander.deucher@amd.com>, Dan Williams <dan.j.williams@intel.com>, amd-gfx@lists.freedesktop.org, linuxppc-dev@lists.ozlabs.org, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2022-09-26 17:35, Lyude Paul wrote:
> On Mon, 2022-09-26 at 16:03 +1000, Alistair Popple wrote:
>> When the module is unloaded or a GPU is unbound from the module it is
>> possible for device private pages to be left mapped in currently running
>> processes. This leads to a kernel crash when the pages are either freed
>> or accessed from the CPU because the GPU and associated data structures
>> and callbacks have all been freed.
>>
>> Fix this by migrating any mappings back to normal CPU memory prior to
>> freeing the GPU memory chunks and associated device private pages.
>>
>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>>
>> ---
>>
>> I assume the AMD driver might have a similar issue. However I can't see
>> where device private (or coherent) pages actually get unmapped/freed
>> during teardown as I couldn't find any relevant calls to
>> devm_memunmap(), memunmap(), devm_release_mem_region() or
>> release_mem_region(). So it appears that ZONE_DEVICE pages are not being
>> properly freed during module unload, unless I'm missing something?
> I've got no idea, will poke Ben to see if they know the answer to this

I guess we're relying on devm to release the region. Isn't the whole 
point of using devm_request_free_mem_region that we don't have to 
remember to explicitly release it when the device gets destroyed? I 
believe we had an explicit free call at some point by mistake, and that 
caused a double-free during module unload. See this commit for reference:

commit 22f4f4faf337d5fb2d2750aff13215726814273e
Author: Philip Yang <Philip.Yang@amd.com>
Date:   Mon Sep 20 17:25:52 2021 -0400

     drm/amdkfd: fix svm_migrate_fini warning
     
     Device manager releases device-specific resources when a driver
     disconnects from a device, devm_memunmap_pages and
     devm_release_mem_region calls in svm_migrate_fini are redundant.
     
     It causes below warning trace after patch "drm/amdgpu: Split
     amdgpu_device_fini into early and late", so remove function
     svm_migrate_fini.
     
     BUG: https://gitlab.freedesktop.org/drm/amd/-/issues/1718
     
     WARNING: CPU: 1 PID: 3646 at drivers/base/devres.c:795
     devm_release_action+0x51/0x60
     Call Trace:
         ? memunmap_pages+0x360/0x360
         svm_migrate_fini+0x2d/0x60 [amdgpu]
         kgd2kfd_device_exit+0x23/0xa0 [amdgpu]
         amdgpu_amdkfd_device_fini_sw+0x1d/0x30 [amdgpu]
         amdgpu_device_fini_sw+0x45/0x290 [amdgpu]
         amdgpu_driver_release_kms+0x12/0x30 [amdgpu]
         drm_dev_release+0x20/0x40 [drm]
         release_nodes+0x196/0x1e0
         device_release_driver_internal+0x104/0x1d0
         driver_detach+0x47/0x90
         bus_remove_driver+0x7a/0xd0
         pci_unregister_driver+0x3d/0x90
         amdgpu_exit+0x11/0x20 [amdgpu]
     
     Signed-off-by: Philip Yang <Philip.Yang@amd.com>
     Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

Furthermore, I guess we are assuming that nobody is using the GPU when 
the module is unloaded. As long as any processes have /dev/kfd open, you 
won't be able to unload the module (except by force-unload). I suppose 
with ZONE_DEVICE memory, we can have references to device memory pages 
even when user mode has closed /dev/kfd. We do have a cleanup handler 
that runs in an MMU-free-notifier. In theory that should run after all 
the pages in the mm_struct have been freed. It releases all sorts of 
other device resources and needs the driver to still be there. I'm not 
sure if there is anything preventing a module unload before the 
free-notifier runs. I'll look into that.

Regards,
   Felix


>
>> ---
>>   drivers/gpu/drm/nouveau/nouveau_dmem.c | 48 +++++++++++++++++++++++++++-
>>   1 file changed, 48 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> index 66ebbd4..3b247b8 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> @@ -369,6 +369,52 @@ nouveau_dmem_suspend(struct nouveau_drm *drm)
>>   	mutex_unlock(&drm->dmem->mutex);
>>   }
>>   
>> +/*
>> + * Evict all pages mapping a chunk.
>> + */
>> +void
>> +nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
>> +{
>> +	unsigned long i, npages = range_len(&chunk->pagemap.range) >> PAGE_SHIFT;
>> +	unsigned long *src_pfns, *dst_pfns;
>> +	dma_addr_t *dma_addrs;
>> +	struct nouveau_fence *fence;
>> +
>> +	src_pfns = kcalloc(npages, sizeof(*src_pfns), GFP_KERNEL);
>> +	dst_pfns = kcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL);
>> +	dma_addrs = kcalloc(npages, sizeof(*dma_addrs), GFP_KERNEL);
>> +
>> +	migrate_device_range(src_pfns, chunk->pagemap.range.start >> PAGE_SHIFT,
>> +			npages);
>> +
>> +	for (i = 0; i < npages; i++) {
>> +		if (src_pfns[i] & MIGRATE_PFN_MIGRATE) {
>> +			struct page *dpage;
>> +
>> +			/*
>> +			 * _GFP_NOFAIL because the GPU is going away and there
>> +			 * is nothing sensible we can do if we can't copy the
>> +			 * data back.
>> +			 */
> You'll have to excuse me for a moment since this area of nouveau isn't one of
> my strongpoints, but are we sure about this? IIRC __GFP_NOFAIL means infinite
> retry, in the case of a GPU hotplug event I would assume we would rather just
> stop trying to migrate things to the GPU and just drop the data instead of
> hanging on infinite retries.
>
>> +			dpage = alloc_page(GFP_HIGHUSER | __GFP_NOFAIL);
>> +			dst_pfns[i] = migrate_pfn(page_to_pfn(dpage));
>> +			nouveau_dmem_copy_one(chunk->drm,
>> +					migrate_pfn_to_page(src_pfns[i]), dpage,
>> +					&dma_addrs[i]);
>> +		}
>> +	}
>> +
>> +	nouveau_fence_new(chunk->drm->dmem->migrate.chan, false, &fence);
>> +	migrate_device_pages(src_pfns, dst_pfns, npages);
>> +	nouveau_dmem_fence_done(&fence);
>> +	migrate_device_finalize(src_pfns, dst_pfns, npages);
>> +	kfree(src_pfns);
>> +	kfree(dst_pfns);
>> +	for (i = 0; i < npages; i++)
>> +		dma_unmap_page(chunk->drm->dev->dev, dma_addrs[i], PAGE_SIZE, DMA_BIDIRECTIONAL);
>> +	kfree(dma_addrs);
>> +}
>> +
>>   void
>>   nouveau_dmem_fini(struct nouveau_drm *drm)
>>   {
>> @@ -380,8 +426,10 @@ nouveau_dmem_fini(struct nouveau_drm *drm)
>>   	mutex_lock(&drm->dmem->mutex);
>>   
>>   	list_for_each_entry_safe(chunk, tmp, &drm->dmem->chunks, list) {
>> +		nouveau_dmem_evict_chunk(chunk);
>>   		nouveau_bo_unpin(chunk->bo);
>>   		nouveau_bo_ref(NULL, &chunk->bo);
>> +		WARN_ON(chunk->callocated);
>>   		list_del(&chunk->list);
>>   		memunmap_pages(&chunk->pagemap);
>>   		release_mem_region(chunk->pagemap.range.start,
