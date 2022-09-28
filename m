Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5585EDBD0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 13:33:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McvW96V9Zz3c7t
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 21:33:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PWLcTa+6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.223.61; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PWLcTa+6;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McvVM6ZB4z2xJR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 21:32:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O7Ueh1K/fbzASTKGt96uk9snauPZ7rRoERM/cbTZl4y3PgRoASCIFY09LWfmDqP2EjEyp1UZEltE7J/W48cfeMLtNqvDHxhhB8InQn9Q9iWraavYehF7vShfk7nn0ruWerGloCDVmEkOVSwlqcN9fzHfMDh+kPe79wBUn1KHLSIdKiFGNDOvzVgevflq7XBcoNh9t6qSyQYVVKKhdjzDUDr3tewDCz65nfDAl74irxryx4DkAWl8QxRWml3RQTzbTM1F9n+7s9Zne3EEETlwUuLeIhVoopFXtt0no97Z7J3xC5hq2vjg8/m/ayIxftPwQRCrBflNJaX6QuP6lHRYaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=to8CWe3DpOILEdqvd0CkWpSDlh4LPqjI2W24vj2NZOU=;
 b=aTIQjKusl6xmwaV1i1QutoF/AapiopVCPjlPrh7Ubn9EWNM62dFjtwJdptCapo/yIVGx6vkgxdb577QgWsGS+3xOpoiRj+aukQCzJk2Q//BsGHBM6jX+DIFHro/B2sntWu7TPDhnUy537BBctsYt8reDXOYMDJEWFvwwoZqGsmZkICCQpZ0LYnzadWNYpw/nxL638AqZJ+NNzHigDk+rqlW0kk2PQ4DOs40duhatoifJGRsj+poVpcY8dZixnd54/l167dLstJCka3o+mj44EC36EHEFdFrS4fi3vGmJMSYltQLfnOI/fXk4zqcgUcVeCxaGtH0aetEUP+QIPSau0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=to8CWe3DpOILEdqvd0CkWpSDlh4LPqjI2W24vj2NZOU=;
 b=PWLcTa+6qJp35SD43kp1RzBX02p5QsfvbRDtM7cwfmDCAtnlXwoW6ovoAbv1Hcocklf6fEgEXILznSmV1SvRyVgvLPJ8KPXg0YSiDV9YeNAyAIZUhAPxXUw7nccUmFhtQ+7hFZGMTjKGbMhYv/GuPJqFSsTXlvnbOnDbYuW/cmz+WbsxIs233O/uoZhGuQAvDTv8LV39RkZPjsczc+zJaIVBoSqBVCrVRQyx8+61INKBrI59eLSKyT6+GWdWnJFzNFEzcFJVVnCZKfDTtinStIzfYWFBe3vma+z1K7Qg+glKQAY+JeVlyPQqzZ1nBovSXrx+stFuCp8Ew4u3bD9SZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by DM4PR12MB6469.namprd12.prod.outlook.com (2603:10b6:8:b6::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.24; Wed, 28 Sep 2022 11:32:05 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::4064:6c13:72e5:a936]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::4064:6c13:72e5:a936%5]) with mapi id 15.20.5654.026; Wed, 28 Sep 2022
 11:32:04 +0000
References: <cover.f15b25597fc3afd45b144df863eeca3b2c13f9f4.1664171943.git-series.apopple@nvidia.com>
 <ea208905d853a0fdc277c2b5e74742593e53f767.1664171943.git-series.apopple@nvidia.com>
 <d839ead12d782a184ca104d6b5f62184c0f178dd.camel@redhat.com>
User-agent: mu4e 1.6.9; emacs 27.1
From: Alistair Popple <apopple@nvidia.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 5/7] nouveau/dmem: Refactor nouveau_dmem_fault_copy_one()
Date: Wed, 28 Sep 2022 21:30:18 +1000
In-reply-to: <d839ead12d782a184ca104d6b5f62184c0f178dd.camel@redhat.com>
Message-ID: <87a66jpweq.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SYXPR01CA0081.ausprd01.prod.outlook.com
 (2603:10c6:0:2e::14) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|DM4PR12MB6469:EE_
X-MS-Office365-Filtering-Correlation-Id: 78eef31f-0652-49bf-9ee5-08daa1451157
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Yu5RUUOtnzpq7r/F2K05vkaQCqBFprbWtRh+8ACpScPcGrL/WpH3aHDjnWGsSs8t9aLJaWNSfSHrtJ4B3RXxI0y9DZMOEJUQgRMibBHl9bs4rtWKmrBWwzhRd11mkSelLxRi91Dsx8o07WQCkdPhydc9TcZU3rOqRoNCBaPbcGII2PSv4HwwAbWtQmOb2Rz5hE0wPqf1J6J7r3I8G01hD2UMvX/0ZhbtE0bk9voHqsILW9vYg9X4WEZtAxrDt2rIuGAOXCP0Hjj8+GwiEVCxjvU0uHC24LQe7bdGf/LZsevRDoPJ2Vd3wahp/WkchliQNJeag+sP42qBWn63XXNKXxkLIu3/dazutaRL9+uQ9zWFLQjNe2nkYpjRsJQDq19zBBQbCxp8zLnkpahEwmlJIwCqJcXdr3g5ADYXHuHID/0qYMcrj4GgnHyZt6vg37YMWY0m13f8G976qH5QYzfIJpHPKwp1Z35SjchVWOSzzMvaCNDHLoRrybtIuRGm9DH1N8IoPPX3FqiCPjNEkGXoKNxvqXDeUxyORZEbQ7kGAedoRp4+GtG95f0hXOYcSnsQLdXhwh9VGILhwMg4E4V5Bx+EK0fkoHfmfUhXxw7dxcuLgtxaPF4CvtGJ3pwLCvZ6oqFYQSGirUvYasge9KCK34chLl9VHRwOSAAcVbWwsAWSnq7T6hhpAi/SumrvocHVrddokaebBbhqWp0Htd95Lg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(376002)(346002)(366004)(451199015)(38100700002)(316002)(86362001)(54906003)(6916009)(6486002)(5660300002)(66946007)(186003)(83380400001)(7416002)(8936002)(478600001)(4326008)(66476007)(8676002)(66556008)(9686003)(2906002)(41300700001)(6512007)(26005)(6506007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?NIc0Poe3/aWkjXaUJSxUZAbRLdTB5s+3kNF7FiSP2KI/cWrbdRf2ZT6dVPhd?=
 =?us-ascii?Q?Lb+5ZScGZqf20xbWIM7q2bzn7lkSugNMLw32S06e7wsaZTOSf3Jvzl4+/Iai?=
 =?us-ascii?Q?22uDJigA0iova9qInRvC4P2rCa82hgjxGz1J/gDzcJSLJ6lkfA5193JpI7Bf?=
 =?us-ascii?Q?xT03bvJLrtPbUYdwDUTO6qlrV+GgzP/2TXiA81+E2OYjsnhS5CPZHviKdBZb?=
 =?us-ascii?Q?mIv11qbMYfUri7Wx31Nm3R9mJJj1BfUR+B6RyNg7D08biZePffoOIFvtgRIY?=
 =?us-ascii?Q?mZLQAx+vNDHdHS5GO89J6BXIw7fbUNidiChIVc/DF9AgFxL6impqd5QFPCwn?=
 =?us-ascii?Q?Q1YHRtRgg6J6dAYKHhk/FW7Ntp+Gbk91D6ok+suk8bZ6qTE59v9TURDKTbis?=
 =?us-ascii?Q?LXtR/c9uYUHq1GZes7SaevdOM4dBhPP1SorhWx/mryLgIov5xuvF0+LThkw8?=
 =?us-ascii?Q?jwvBQzMIPC+bBZJ6dZMEA7fv2OVjKrjVcWaw6Hv6RbOEtxUZrXLxj0uKkRq3?=
 =?us-ascii?Q?4APZzOpUT8A77hqH9fcMjQvpETdVurZVOkyShMs93zj3z0SNzQX9Kx+mCdeO?=
 =?us-ascii?Q?okeTR+NAA03lAYgZ8lMZa+1g8BhkTL8ZElw0QKd7k2d11nGazWEYtYOOwmcr?=
 =?us-ascii?Q?Hlfl34Gtrm8Pt8o1F4cVio3+po9DlfZDSaIVXvmBs+HtzHDhooSfgLMWBM7V?=
 =?us-ascii?Q?Edmi8MTuYL+YGTP1KadOsXAut23aU0iFWtlbBZgDCvC9bYs3givn+tJEuuWr?=
 =?us-ascii?Q?UqQCEUDMKKjRot467RvISlML9rgCjiDL17NyUgBESgPbAFmDKRnEsw46dcFK?=
 =?us-ascii?Q?Lop6gk0arQfgmanVL65N+P8dI8Cd4N52qa/qqzQmflPbuOjpgr1ASsJUoe3k?=
 =?us-ascii?Q?pMaM2b2j1ybCIN+xQgC4UtSpKQtm4zRUvvh9A+EDnknn+JZam9ZdJVJaoVyc?=
 =?us-ascii?Q?1eXt6j9/dymYLJ/CtmInL+P/O7+ejeZPUDG1AqwXtchp/Vi86zJMuWneyuZS?=
 =?us-ascii?Q?bAjjdaPd5ehNjyvGF6dU1hKT5Uk6so4iy0Kny31doXjWOpsAJechdGIC6WsO?=
 =?us-ascii?Q?QjRWGavYqOM6QplEJUwqoitqANHy6q1HfY/rV3IlvvOgMRR//Xqwjqb5wuiI?=
 =?us-ascii?Q?Pyp5ebGln2nDNhwNc+NgQ9W5zC/F7x1+yyjMZt8G5wp6Vr7uYmgAG2VWs/Rk?=
 =?us-ascii?Q?EaTiYAvcntZeDs7d7X6yyhp3hfy+7J+MxL+MlXm7W/jjcq88si2P2Wu9UKnk?=
 =?us-ascii?Q?OTaGoJsLgcr+90avC6kp6l+sX0Mx2N9Ss7rIKJNKBZElWZtqDuJ0+bpbmQzR?=
 =?us-ascii?Q?yGEh2o+N2yfjz21kEwYNFCfu7VVMdP4cyL+Kna10SKI4Tg8qZNOMdedJJ65v?=
 =?us-ascii?Q?3WSjz0FHsra2+L+jZymqs7+7NwHQiTRYxaxmaIQYHIw896DfWURgjsV2jlDW?=
 =?us-ascii?Q?EhRIUvkyAhOGwOGEY+rNd78mvjYDdEG46jT0ijTS3B10Rjj3sLRgBwNElWlR?=
 =?us-ascii?Q?gNpP83f0QnjexGCbvcvw6RvNQwx137EDUz5k0pXZF3iKyWP6jEuXGwKYg7JQ?=
 =?us-ascii?Q?MY7Bx62eEu9TksSKHh0eGW4Gpx9lBrRcG9Wna0cB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78eef31f-0652-49bf-9ee5-08daa1451157
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 11:32:04.6647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NyO3P1hBMXZujEc4N5yYHFkfYuzOE9I0U2QkUZ3yN0afLoYqoa89V1KCqCC9Kz8p0nhFBK9n9Pmp+ilO64M/kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6469
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
Cc: Alex Sierra <alex.sierra@amd.com>, Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, amd-gfx@lists.freedesktop.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Dan Williams <dan.j.williams@intel.com>, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Lyude Paul <lyude@redhat.com> writes:

> On Mon, 2022-09-26 at 16:03 +1000, Alistair Popple wrote:
>> nouveau_dmem_fault_copy_one() is used during handling of CPU faults via
>> the migrate_to_ram() callback and is used to copy data from GPU to CPU
>> memory. It is currently specific to fault handling, however a future
>> patch implementing eviction of data during teardown needs similar
>> functionality.
>>
>> Refactor out the core functionality so that it is not specific to fault
>> handling.
>>
>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>> ---
>>  drivers/gpu/drm/nouveau/nouveau_dmem.c | 59 +++++++++++++--------------
>>  1 file changed, 29 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> index f9234ed..66ebbd4 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> @@ -139,44 +139,25 @@ static void nouveau_dmem_fence_done(struct nouveau_fence **fence)
>>  	}
>>  }
>>
>> -static vm_fault_t nouveau_dmem_fault_copy_one(struct nouveau_drm *drm,
>> -		struct vm_fault *vmf, struct migrate_vma *args,
>> -		dma_addr_t *dma_addr)
>> +static int nouveau_dmem_copy_one(struct nouveau_drm *drm, struct page *spage,
>> +				struct page *dpage, dma_addr_t *dma_addr)
>>  {
>>  	struct device *dev = drm->dev->dev;
>> -	struct page *dpage, *spage;
>> -	struct nouveau_svmm *svmm;
>> -
>> -	spage = migrate_pfn_to_page(args->src[0]);
>> -	if (!spage || !(args->src[0] & MIGRATE_PFN_MIGRATE))
>> -		return 0;
>>
>> -	dpage = alloc_page_vma(GFP_HIGHUSER, vmf->vma, vmf->address);
>> -	if (!dpage)
>> -		return VM_FAULT_SIGBUS;
>>  	lock_page(dpage);
>>
>>  	*dma_addr = dma_map_page(dev, dpage, 0, PAGE_SIZE, DMA_BIDIRECTIONAL);
>>  	if (dma_mapping_error(dev, *dma_addr))
>> -		goto error_free_page;
>> +		return -EIO;
>>
>> -	svmm = spage->zone_device_data;
>> -	mutex_lock(&svmm->mutex);
>> -	nouveau_svmm_invalidate(svmm, args->start, args->end);
>>  	if (drm->dmem->migrate.copy_func(drm, 1, NOUVEAU_APER_HOST, *dma_addr,
>> -			NOUVEAU_APER_VRAM, nouveau_dmem_page_addr(spage)))
>> -		goto error_dma_unmap;
>> -	mutex_unlock(&svmm->mutex);
>> +					 NOUVEAU_APER_VRAM,
>> +					 nouveau_dmem_page_addr(spage))) {
>> +		dma_unmap_page(dev, *dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
>> +		return -EIO;
>> +	}
>
> Feel free to just align this with the starting (, as long as it doesn't go
> above 100 characters it doesn't really matter imho and would look nicer that
> way.
>
> Otherwise:
>
> Reviewed-by: Lyude Paul <lyude@redhat.com>

Thanks! I'm not sure I precisely understood your alignment comment above
but feel free to let me know if I got it wrong in v2.

> Will look at the other patch in a moment
>
>>
>> -	args->dst[0] = migrate_pfn(page_to_pfn(dpage));
>>  	return 0;
>> -
>> -error_dma_unmap:
>> -	mutex_unlock(&svmm->mutex);
>> -	dma_unmap_page(dev, *dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
>> -error_free_page:
>> -	__free_page(dpage);
>> -	return VM_FAULT_SIGBUS;
>>  }
>>
>>  static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
>> @@ -184,9 +165,11 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
>>  	struct nouveau_drm *drm = page_to_drm(vmf->page);
>>  	struct nouveau_dmem *dmem = drm->dmem;
>>  	struct nouveau_fence *fence;
>> +	struct nouveau_svmm *svmm;
>> +	struct page *spage, *dpage;
>>  	unsigned long src = 0, dst = 0;
>>  	dma_addr_t dma_addr = 0;
>> -	vm_fault_t ret;
>> +	vm_fault_t ret = 0;
>>  	struct migrate_vma args = {
>>  		.vma		= vmf->vma,
>>  		.start		= vmf->address,
>> @@ -207,9 +190,25 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
>>  	if (!args.cpages)
>>  		return 0;
>>
>> -	ret = nouveau_dmem_fault_copy_one(drm, vmf, &args, &dma_addr);
>> -	if (ret || dst == 0)
>> +	spage = migrate_pfn_to_page(src);
>> +	if (!spage || !(src & MIGRATE_PFN_MIGRATE))
>> +		goto done;
>> +
>> +	dpage = alloc_page_vma(GFP_HIGHUSER, vmf->vma, vmf->address);
>> +	if (!dpage)
>> +		goto done;
>> +
>> +	dst = migrate_pfn(page_to_pfn(dpage));
>> +
>> +	svmm = spage->zone_device_data;
>> +	mutex_lock(&svmm->mutex);
>> +	nouveau_svmm_invalidate(svmm, args.start, args.end);
>> +	ret = nouveau_dmem_copy_one(drm, spage, dpage, &dma_addr);
>> +	mutex_unlock(&svmm->mutex);
>> +	if (ret) {
>> +		ret = VM_FAULT_SIGBUS;
>>  		goto done;
>> +	}
>>
>>  	nouveau_fence_new(dmem->migrate.chan, false, &fence);
>>  	migrate_vma_pages(&args);
