Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E397043D887
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 03:28:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hfny959H8z3bmS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 12:28:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fMzW0XOd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.102.50;
 helo=nam04-dm6-obe.outbound.protection.outlook.com;
 envelope-from=apopple@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=fMzW0XOd; 
 dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2050.outbound.protection.outlook.com [40.107.102.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfnxM0LCZz2x9B
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 12:27:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S7/CbHHrAHY4xHdxxIAjsxJ+wTXMUTD95BG6MOLsMZUlzaha+ZDHMRFvM2GIuGDc8jfB+vVKoE7/2ONOZW60LeqyzgazfOKsr5I81sy5ADeus+iSP022BFWk5//KejHNwGBT7c3mMio192ah7FaTzJUNZHOXW472Bs3abwDQwn7nPutKmbQmudePUikd3MIoLHXGoKl5pc4T6Q6vnyotF769znqfUA7ZXOp5dlquZK7JN4fdipOVf6oMI9mrzPdLUsaRb8M8sLwYcdlClnt0obm1JH+c7y3B4SrjWMm+xCO28J/XIw19HPAuNNsONZ3tUNN42Le/HXPOY7VDaq3BbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zeDSaVZu7SpBRH4t8WvPfUTxkwmTudj7wiROmHXcUxk=;
 b=A6992NjeQ8zLaSkxX05goNANprxRPjWgbO1f9cZVGuDfl7E+n1FfpG4/tiApSGAZ8bIzt3jvuiunw5NCOR3Myh1Q4p/Ivc24oFCBFzeUg7SBbLH9RwaLUe6tl9Khqew6V9/h4bbDb0RBJbAcJp7NTuZ6fSmgevOEGeXQ4vFX2WD3QyZYUOHAPxhn9e1qKC5ltRdX7uwudbHKpozWfzs4oUxifqBfq4g3fM/m7g1vl5895uv0eKKiY2zH4QSeRyIHtIWZ4nRcujgUUXFedeMKe3VK7lYgcTVzlYmVD5VeeFnqPD5piX4gz+d1/aZ7ZCz91mQb2J4goO21UmfdZyvenA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zeDSaVZu7SpBRH4t8WvPfUTxkwmTudj7wiROmHXcUxk=;
 b=fMzW0XOdFDfs9GFPB7LdffsyN3OmtpqdaPBuUoGuRDevDZqPRLGB0yUdENHiWuJ5NCVbR7KHvoU/NL++5TmRBe718K7Z1s2Dsd3ww86+j1r5xAFjRA6i2fuylJ7YTB2OxVJ35/XWiwZntzBzZkCUd+S7kA7WBX0bFC4WRHJWanxapzbtu8kzhaI3egrRIJUE4V6Da6s7Ya73I0AJksJW9oItzeQnIxfZiVfbDDLTo72u24Dch8OPGei11NJI8u9h2e3AFfmq5x+SOdDAX5CFhYGdsxTN8/qw2/ZIL2x9RkMNT5ruUOtqkiREvylzbJEnwongyyFx9+ZOL6vkgFueOA==
Received: from DM5PR06CA0030.namprd06.prod.outlook.com (2603:10b6:3:5d::16) by
 CH2PR12MB3782.namprd12.prod.outlook.com (2603:10b6:610:23::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14; Thu, 28 Oct 2021 01:27:24 +0000
Received: from DM6NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:5d:cafe::db) by DM5PR06CA0030.outlook.office365.com
 (2603:10b6:3:5d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Thu, 28 Oct 2021 01:27:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; lists.freedesktop.org; dkim=none (message not
 signed) header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT067.mail.protection.outlook.com (10.13.172.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4649.14 via Frontend Transport; Thu, 28 Oct 2021 01:27:23 +0000
Received: from nvdebian.localnet (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 28 Oct
 2021 01:27:19 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>, Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH] mm/migrate.c: Remove MIGRATE_PFN_LOCKED
Date: Thu, 28 Oct 2021 12:27:17 +1100
Message-ID: <2564177.V13TkMiDjn@nvdebian>
In-Reply-To: <f92e2dfe-f033-9b09-e83c-203052b491e1@nvidia.com>
References: <20211025041608.289017-1-apopple@nvidia.com>
 <f92e2dfe-f033-9b09-e83c-203052b491e1@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 872876ee-ae33-4e26-2a6b-08d999b21822
X-MS-TrafficTypeDiagnostic: CH2PR12MB3782:
X-Microsoft-Antispam-PRVS: <CH2PR12MB37825D4DE245EC748763A514DF869@CH2PR12MB3782.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PnAFK9NyPO+UIoxcVwvk3ds3DO4FeMSLfPb9OrNdH0oN8W6kpeieo26JWTXAHZtwpftmSQoixCmp/thMkCTbvy9RatHb+PlE7PYgRd3e5/m5GTI+3CsVWnBhHedAvPHU2QSDW8607PH0km7kuKR/YF17LSrnxsGHyDfTKB1/9YJr5mPg+FhXQ8aOEwvsF/8fGd/j7tswYjifwVvtbcbcP0Odq9ceT02UPYTEX5NpbgOf9OUUyPN2lrXCga/9+vFICKLRQhTVAJ9gJ1doD84VaqWHKwEGI2EGeKcCsMVkV0UslKpFzUMZQZA/I6sMGLIefhAAlVOnHUNY4XQ7cZQlOtj8+6Tod9NjJsVVDavxR/6JRsqz4BeO+PH+MPsN1Xh2AInvXiRlgU2lkDqSRSZE7BT6F6esV4w2WwIbCvg6f2lJOsxz9c1o+D+ut6GBA+F79vndooJ7f01GWd3kUoTUFaVk7w+v5LSgXgJuVnpv5UKaNk8RH6yGTERIvRvFVgmP+Q+L0gAWxSPzzc6KHm8mt5vFWcnbNIK/S7jSKJfSO+1v/FLdnjR6EMOHClcw4q5CETD8ZNtnRKBdP00RLTg+LQ7pwd2uWz1jAahBPDsuXW4ulGg6LU8LGbKevZIxUbWgO2wXIOx4tNPBckZv2uU0JDtZOYQUDSQiu4e+Syp63EGlOoQVwz31C+6XYO4tv/i8Z2fYvpHDjUomAuvTGxvFvlE355Zq0rYGCiyycttbDtM=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(110136005)(356005)(33716001)(53546011)(508600001)(82310400003)(8936002)(7416002)(54906003)(9686003)(9576002)(7636003)(36860700001)(4326008)(2906002)(426003)(26005)(70586007)(16526019)(186003)(6636002)(70206006)(86362001)(8676002)(83380400001)(336012)(5660300002)(316002)(47076005)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 01:27:23.6187 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 872876ee-ae33-4e26-2a6b-08d999b21822
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3782
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

On Tuesday, 26 October 2021 11:57:06 AM AEDT Ralph Campbell wrote:
> 
> On 10/24/21 21:16, Alistair Popple wrote:
> > MIGRATE_PFN_LOCKED is used to indicate to migrate_vma_prepare() that a
> > source page was already locked during migrate_vma_collect(). If it
> > wasn't then the a second attempt is made to lock the page. However if
> > the first attempt failed it's unlikely a second attempt will succeed,
> > and the retry adds complexity. So clean this up by removing the retry
> > and MIGRATE_PFN_LOCKED flag.
> >
> > Destination pages are also meant to have the MIGRATE_PFN_LOCKED flag
> > set, but nothing actually checks that.
> >
> > Signed-off-by: Alistair Popple <apopple@nvidia.com>
> 
> You can add:
> Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>

Thanks!

> >   
> >   		/*
> >   		 * Optimize for the common case where page is only mapped once
> > @@ -2379,7 +2378,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >   		if (trylock_page(page)) {
> >   			pte_t swp_pte;
> >   
> > -			mpfn |= MIGRATE_PFN_LOCKED;
> > +			migrate->cpages++;
> >   			ptep_get_and_clear(mm, addr, ptep);
> 
> I was looking at try_to_migrate_one() and looking at the differences with
> the code here to insert the migration PTE and noticed that instead of
> ptet_get_and_clear() it has:
> 	pteval = ptep_clear_flush(vma, address, pvmw.pte);
> 
> 	/* Move the dirty bit to the page. Now the pte is gone. */
> 	if (pte_dirty(pteval))
> 		set_page_dirty(page);
> 	update_hiwater_rss(mm);
> 
> I know that is pre-existing, probably a separate patch if it is an issue.

I don't think it is an issue today because migrate_vma only supports private,
non-shared pages. At some point though it may be extended to support
file-backed pages and this would be easy to miss so will put a patch together.

> >   
> >   			/* Setup special migration page table entry */
> > @@ -2413,6 +2412,9 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >   
> >   			if (pte_present(pte))
> >   				unmapped++;
> > +		} else {
> > +			put_page(page);
> > +			mpfn = 0;
> >   		}
> >   
> >   next:
> > @@ -2517,15 +2519,17 @@ static bool migrate_vma_check_page(struct page *page)
> >   }
> >   
> >   /*
> > - * migrate_vma_prepare() - lock pages and isolate them from the lru
> > + * migrate_vma_unmap() - replace page mapping with special migration pte entry
> >    * @migrate: migrate struct containing all migration information
> >    *
> > - * This locks pages that have been collected by migrate_vma_collect(). Once each
> > - * page is locked it is isolated from the lru (for non-device pages). Finally,
> > - * the ref taken by migrate_vma_collect() is dropped, as locked pages cannot be
> > - * migrated by concurrent kernel threads.
> > + * Isolate pages from the LRU and replace mappings (CPU page table pte) with a
> > + * special migration pte entry and check if it has been pinned. Pinned pages are
> > + * restored because we cannot migrate them.
> > + *
> > + * This is the last step before we call the device driver callback to allocate
> > + * destination memory and copy contents of original page over to new page.
> >    */
> > -static void migrate_vma_prepare(struct migrate_vma *migrate)
> > +static void migrate_vma_unmap(struct migrate_vma *migrate)
> >   {
> >   	const unsigned long npages = migrate->npages;
> >   	const unsigned long start = migrate->start;
> > @@ -2534,32 +2538,12 @@ static void migrate_vma_prepare(struct migrate_vma *migrate)
> >   
> >   	lru_add_drain();
> >   
> > -	for (i = 0; (i < npages) && migrate->cpages; i++) {
> > +	for (i = 0; i < npages; i++) {
> >   		struct page *page = migrate_pfn_to_page(migrate->src[i]);
> > -		bool remap = true;
> >   
> >   		if (!page)
> >   			continue;
> >   
> > -		if (!(migrate->src[i] & MIGRATE_PFN_LOCKED)) {
> > -			/*
> > -			 * Because we are migrating several pages there can be
> > -			 * a deadlock between 2 concurrent migration where each
> > -			 * are waiting on each other page lock.
> > -			 *
> > -			 * Make migrate_vma() a best effort thing and backoff
> > -			 * for any page we can not lock right away.
> > -			 */
> > -			if (!trylock_page(page)) {
> > -				migrate->src[i] = 0;
> > -				migrate->cpages--;
> > -				put_page(page);
> > -				continue;
> > -			}
> > -			remap = false;
> > -			migrate->src[i] |= MIGRATE_PFN_LOCKED;
> > -		}
> > -
> >   		/* ZONE_DEVICE pages are not on LRU */
> >   		if (!is_zone_device_page(page)) {
> >   			if (!PageLRU(page) && allow_drain) {
> > @@ -2569,16 +2553,9 @@ static void migrate_vma_prepare(struct migrate_vma *migrate)
> >   			}
> >   
> >   			if (isolate_lru_page(page)) {
> > -				if (remap) {
> > -					migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
> > -					migrate->cpages--;
> > -					restore++;
> > -				} else {
> > -					migrate->src[i] = 0;
> > -					unlock_page(page);
> > -					migrate->cpages--;
> > -					put_page(page);
> > -				}
> > +				migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
> > +				migrate->cpages--;
> > +				restore++;
> >   				continue;
> >   			}
> >   
> > @@ -2586,80 +2563,20 @@ static void migrate_vma_prepare(struct migrate_vma *migrate)
> >   			put_page(page);
> >   		}
> >   
> > -		if (!migrate_vma_check_page(page)) {
> > -			if (remap) {
> > -				migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
> > -				migrate->cpages--;
> > -				restore++;
> > -
> > -				if (!is_zone_device_page(page)) {
> > -					get_page(page);
> > -					putback_lru_page(page);
> > -				}
> > -			} else {
> > -				migrate->src[i] = 0;
> > -				unlock_page(page);
> > -				migrate->cpages--;
> > +		if (page_mapped(page))
> > +			try_to_migrate(page, 0);
> >   
> > -				if (!is_zone_device_page(page))
> > -					putback_lru_page(page);
> > -				else
> > -					put_page(page);
> > +		if (page_mapped(page) || !migrate_vma_check_page(page)) {
> > +			if (!is_zone_device_page(page)) {
> > +				get_page(page);
> > +				putback_lru_page(page);
> >   			}
> > -		}
> > -	}
> > -
> > -	for (i = 0, addr = start; i < npages && restore; i++, addr += PAGE_SIZE) {
> > -		struct page *page = migrate_pfn_to_page(migrate->src[i]);
> > -
> > -		if (!page || (migrate->src[i] & MIGRATE_PFN_MIGRATE))
> > -			continue;
> >   
> > -		remove_migration_pte(page, migrate->vma, addr, page);
> > -
> > -		migrate->src[i] = 0;
> > -		unlock_page(page);
> > -		put_page(page);
> > -		restore--;
> > -	}
> > -}
> > -
> > -/*
> > - * migrate_vma_unmap() - replace page mapping with special migration pte entry
> > - * @migrate: migrate struct containing all migration information
> > - *
> > - * Replace page mapping (CPU page table pte) with a special migration pte entry
> > - * and check again if it has been pinned. Pinned pages are restored because we
> > - * cannot migrate them.
> > - *
> > - * This is the last step before we call the device driver callback to allocate
> > - * destination memory and copy contents of original page over to new page.
> > - */
> > -static void migrate_vma_unmap(struct migrate_vma *migrate)
> > -{
> > -	const unsigned long npages = migrate->npages;
> > -	const unsigned long start = migrate->start;
> > -	unsigned long addr, i, restore = 0;
> > -
> > -	for (i = 0; i < npages; i++) {
> > -		struct page *page = migrate_pfn_to_page(migrate->src[i]);
> > -
> > -		if (!page || !(migrate->src[i] & MIGRATE_PFN_MIGRATE))
> > +			migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
> > +			migrate->cpages--;
> > +			restore++;
> >   			continue;
> > -
> > -		if (page_mapped(page)) {
> > -			try_to_migrate(page, 0);
> > -			if (page_mapped(page))
> > -				goto restore;
> >   		}
> > -
> > -		if (migrate_vma_check_page(page))
> > -			continue;
> > -
> > -restore:
> > -		migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
> > -		migrate->cpages--;
> > -		restore++;
> >   	}
> >   
> >   	for (addr = start, i = 0; i < npages && restore; addr += PAGE_SIZE, i++) {
> > @@ -2672,12 +2589,8 @@ static void migrate_vma_unmap(struct migrate_vma *migrate)
> >   
> >   		migrate->src[i] = 0;
> >   		unlock_page(page);
> > +		put_page(page);
> >   		restore--;
> > -
> > -		if (is_zone_device_page(page))
> > -			put_page(page);
> > -		else
> > -			putback_lru_page(page);
> >   	}
> >   }
> >   
> > @@ -2700,8 +2613,8 @@ static void migrate_vma_unmap(struct migrate_vma *migrate)
> >    * it for all those entries (ie with MIGRATE_PFN_VALID and MIGRATE_PFN_MIGRATE
> >    * flag set).  Once these are allocated and copied, the caller must update each
> >    * corresponding entry in the dst array with the pfn value of the destination
> > - * page and with the MIGRATE_PFN_VALID and MIGRATE_PFN_LOCKED flags set
> > - * (destination pages must have their struct pages locked, via lock_page()).
> > + * page and with MIGRATE_PFN_VALID. Destination pages must be locked via
> > + * lock_page().
> >    *
> >    * Note that the caller does not have to migrate all the pages that are marked
> >    * with MIGRATE_PFN_MIGRATE flag in src array unless this is a migration from
> > @@ -2770,8 +2683,6 @@ int migrate_vma_setup(struct migrate_vma *args)
> >   
> >   	migrate_vma_collect(args);
> >   
> > -	if (args->cpages)
> > -		migrate_vma_prepare(args);
> >   	if (args->cpages)
> >   		migrate_vma_unmap(args);
> >   
> 




