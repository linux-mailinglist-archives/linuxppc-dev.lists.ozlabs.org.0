Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B35AE59F1C9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 05:04:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MC9tk44MBz3c4x
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 13:04:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=siXFdNoA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.237.83; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=siXFdNoA;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2083.outbound.protection.outlook.com [40.107.237.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MC9sz5X9Lz2xKX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 13:04:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AdW0DkYsEOIg77//mxJwQGddBK6wMqquM2o/CFUVKcyovVCKw1ARNChirp2hnFEpb1rUf6xmAJKky4vD6vFb6MT95gqB/k89UnSJ3JhFh+puXuHVlNlw+e/TCSvBKuWolooY+5gRubrEtYWdWHC5dVpgx6GTDN20uQui0DqskhwNvSSLXkLHpNOx5kMeKr8/MHOonrZOxwHmaVMnGz/FYHNzVTmvu9goBoIMvsFZr75Llc2mvhYIyK0HIZUzTqGtKZpYnYVhkUT1GSROA0p5wejrQPQYeG4OleC6/ScVaSDeVyzAsTFX3eIaDrapVgoJyifd9rWOIhXdaRU8N1HG5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHYL5xlQbzG7KP6atpHLxTbv06P0UZ7cEpmWgty0z1Y=;
 b=FOTkkOLFM275t6xyOQR6Zj4l2VwPJhw29SDc6ZaBryDQXJRiOqt0x+6cbgJ4xyVFMCp1oXzo2LuPFTKyHkOpQi2o0XtztIz6jXExkS0chi1rtd7bsm+mgde4eoprmXHXclF8S1rBnKuT/ZWedTV9b4UPgp2McJQ8uBLOBGE9/U7PETG9wIEoYAbiru++Lib6c3iApit/yFPDCbqIzr24VAi9LOtulLTMWKUNgwVjzmRrXo4qyAqWjX6oXHU6FjQZesNXh+5x2JaE7BmMCKZNXkI1SiGPWAlqycUTOsNqQGMJUe4oEwDFnR/NLunnvU9CB9WvvFoHkFJpPTf7G0NMNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHYL5xlQbzG7KP6atpHLxTbv06P0UZ7cEpmWgty0z1Y=;
 b=siXFdNoAoPsDHz4/7EAKtkQumGPTA5QOYrSwakiDAH01+kXjOef0QmrQ5duBoUvpbPIu9FP33xmhMIMmq6SLLFv0VbWIurogWwRhW+glN6zk3yGeOfNx5VzwOlzf1Jkgf6oHL2wbFpMSLvwNcEhWYhV/Na7H6JWHabqPYPLLLXM0WCAo2wlWtfs1OBamCXd1puGDvVajtnYstfnI1PyTMAHRnU2J9po88Xqz19XVnFhfvGmbgy3HqHOtwtpd3WjGiUZGp5CDQ7e8K+o0tFF4IFPrgSrJ0efgoRIcVMpxSccgtS1VJpDZDvC8y7Zbz50fk9H1XhIysdGX/EfIn89N3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by LV2PR12MB5774.namprd12.prod.outlook.com (2603:10b6:408:17a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.23; Wed, 24 Aug
 2022 03:03:44 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::7432:2749:aa27:722c]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::7432:2749:aa27:722c%7]) with mapi id 15.20.5546.022; Wed, 24 Aug 2022
 03:03:43 +0000
From: Alistair Popple <apopple@nvidia.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Subject: [PATCH v3 1/3] mm/migrate_device.c: Flush TLB while holding PTL
Date: Wed, 24 Aug 2022 13:03:37 +1000
Message-Id: <3b01af093515ce2960ac39bb16ff77473150d179.1661309831.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0051.prod.exchangelabs.com (2603:10b6:a03:94::28)
 To BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08f87d09-fb37-4ef0-77b5-08da857d4121
X-MS-TrafficTypeDiagnostic: LV2PR12MB5774:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	d1bLfB3VMOtxkzQTyYajEB5kio3ZmMlhvFfUilRhhrts4Bg1hLOkzBW+EEJN6wqJlIvngisgZLrS6bRPOA14ng+82v+Hvop3/a3dOugZF2Ned9Ydrtm6vp5u10Pox038ujo9NPzxLBfzh0O0FD7Et0tF2+kM23pFZSHvVodqlXA+lbu1/umu42Ufjslvz5o4VgxX0dea0pVi33vBZXIQHinEg1Wr2HKf48N2ax098hMRmNqtELlMK6KYobjvAN7KASx8hSHakj11Q9n/TZXiE1i7EM7JpTeToid4hOaPTb+Nku87Rlb59jyAnmJP2adMW9/eiJ6B4Wd3PjkEf9R/2s/+XiNDPsBG/VZFammbBWi8PJi798hKa1FZDz4tEoEpHp7UXSR+3kzJyRf+eTlQpYgvtSDKCCwhramFkbn9ZibjxOqQORAgn09umDfVt2kKJ8AK6/qQ1c7HgQo7IvCKOZEqig8MEHVonMqB/5xRS7TVNcoJZFzncbu74PxqS8EW7Q2s+uCSiIdb0eDMNjlDY+KAaDZNGGH5YZlEPFxg2Bc+15paOVd2aYoS19/e01CXqCFoHm9FNIq71GysLWlY95oXHL9iWtHA3uildg2Fl5Z/+uTBpUhOW0PKl9WY/IKwWCLxDP5glpQ5l2oVVXhHFfKJk3eRVSc+T0KJIf3gmsVndW0b5a71Q9UnAZNO3w3OgSZhAwIIV3B0r7TUxMvvvQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(376002)(136003)(396003)(346002)(39860400002)(83380400001)(478600001)(66556008)(66476007)(66946007)(2616005)(4326008)(186003)(8676002)(36756003)(8936002)(41300700001)(6666004)(6512007)(2906002)(6486002)(6506007)(26005)(86362001)(7416002)(5660300002)(316002)(54906003)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Keez3Uw1PgtXxZMrJrj4m3GtkuiTQwbvwlstuOSRhPhqgFqdPB2sgTl954/Q?=
 =?us-ascii?Q?gW+jG9b1+39MF4z5face1WanZKd9YxebTgRxa8YJsGuwLDGlt0ZVjEVCzn62?=
 =?us-ascii?Q?7aY7iRiiHndp22teRBXXQgKgfLHeMlvq3GLon5tlPSzbwpr3rEPz4vlyUDRc?=
 =?us-ascii?Q?ie4PyXMoYNNKxdxjoQceruNXAzJ/HUrrir98+A16/nRlDui0lvgirSrFsG2M?=
 =?us-ascii?Q?x92M5FnhYTN1bCGVPJsKc4jRkzvIj34RiiMyIXjFhBR4dL9qHbBGhmb0Pnf3?=
 =?us-ascii?Q?gcQ45DZv4i9i6F1XjWUs7wQ94EYA3pW86T5ZfWE5L1JI14sHdAwa+eGgWZyh?=
 =?us-ascii?Q?dZPiDnm9fdSbxTEvgrHPDf4Bwiu+jGX8dr7A79gtl8AAtQQkopj4r5V7D5TS?=
 =?us-ascii?Q?f5JRE66mHXWefgD+MiTChMRt96suko6WuUqV/F4Y90GtdeVaE6Uy7x5s/vhY?=
 =?us-ascii?Q?FKO6BDOPrZLg+lZRI4oTxHAZJttUN0ymXQuQbgbqXVYuqzRfXNWKnr7K37Fq?=
 =?us-ascii?Q?gugm4NjHW0s7RcoS5h6pRlur+Joo+F19mWJ4l5p5HHtlONZYz5NSTYbPDfsF?=
 =?us-ascii?Q?m0TOLjZg+D+7kYtm+A4Q0LcQp3IcwPD480wbfB/KwVq0TAR2TiCJz5MYSZyu?=
 =?us-ascii?Q?9wWPUqlZaj8/JoDTOPTckw/OkbPKUckP46dF52uzCZjS7QzvNBPAPBNB4cyU?=
 =?us-ascii?Q?LwAFu5JLHJ39oJgT3u8iCXBzMMqYSyxJi2dibwMkTrR3Fgt0EWazNpOW+QSI?=
 =?us-ascii?Q?Xt9IgN91Aje5/cp+rawkpMdH0tx/8Ty3h+guXHCJozLN6bJFRAyOFwAPSL9e?=
 =?us-ascii?Q?MombugePL4gULN+vzXCY+pPYapKufNVA2C2d7qAJNTothaTUapwjk5NEhV/U?=
 =?us-ascii?Q?9A4hM+4jPtwYL1cBpsW4WCLS+cDKOoQ/Ws5kkHMy+aXWhYg71F7Q8AALRwdH?=
 =?us-ascii?Q?MO1UTt+3qzt0RhEdts/k76uezmRcUy8wbAnO5u+ryWHGpru8dnPjZ20KCioc?=
 =?us-ascii?Q?w+9JovRUUxlqTNoL9m8Qb7XsdWs3NAgzVCdbttADoE7iQBI0ko5XYOB0KFz6?=
 =?us-ascii?Q?kj4731Yrq5lOdeSpHDJVLY2vyA2TbPuN/FymxAYtpF8KXTWDG0vBxe1bJLba?=
 =?us-ascii?Q?qUEOzhMyNNZ5IE1UKCkxtml0JfC7Lc5QxLg1XY+9A70qckYJIyAS65HfV2L1?=
 =?us-ascii?Q?tivg5usP/b1w9JlbIar2CiXOQ3ZKPt6q+SF77y/L35MElrVMGsaoztPlNLJv?=
 =?us-ascii?Q?XI111+319ms/oUpiRoP67MYsNbAgEHNhQzN+Hr4XvV5NxKGXJVDqlw8OsVqD?=
 =?us-ascii?Q?adFZokOeBgog+HIKwF3fzJ6rcTRjDaPu4iS6pl4LjnDGuT/qWcMMLsjnYJUJ?=
 =?us-ascii?Q?190hqkcS/p10xzyvp0VnNMcQjkA39672Y1GOXWZTXkLboXG0Lyn6E9F6srgr?=
 =?us-ascii?Q?kh1jnNVfxGi0jBoPb8nJULIC5yDP2BFEJYzGL6mYaDmm93Cczy+8bPu7jqav?=
 =?us-ascii?Q?82zm/VFipv6VpoGS5inR7kSB3qTyRggVH330Sy0ymEND6DPUw/2aBIm3vThM?=
 =?us-ascii?Q?ECkvw5CVz8JeHwh8Z6a3yDmV6GZx/73oHlRX87XU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08f87d09-fb37-4ef0-77b5-08da857d4121
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 03:03:43.8652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ou4Q8qPVeCW9mvvbVbeOjjoXhRH3C4R2GIBiRywMYu+XdC3hx3W+k5SnZ8J9j486RlLlsqGZh4JiqckMLQwMag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5774
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
Cc: "Sierra Guiza, Alejandro \(Alex\)" <alex.sierra@amd.com>, Ralph Campbell <rcampbell@nvidia.com>, linuxppc-dev@lists.ozlabs.org, Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>, David Hildenbrand <david@redhat.com>, Nadav Amit <nadav.amit@gmail.com>, Felix Kuehling <Felix.Kuehling@amd.com>, Alistair Popple <apopple@nvidia.com>, LKML <linux-kernel@vger.kernel.org>, Peter Xu <peterx@redhat.com>, Logan Gunthorpe <logang@deltatee.com>, Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, stable@vger.kernel.org, huang ying <huang.ying.caritas@gmail.com>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When clearing a PTE the TLB should be flushed whilst still holding the
PTL to avoid a potential race with madvise/munmap/etc. For example
consider the following sequence:

  CPU0                          CPU1
  ----                          ----

  migrate_vma_collect_pmd()
  pte_unmap_unlock()
                                madvise(MADV_DONTNEED)
                                -> zap_pte_range()
                                pte_offset_map_lock()
                                [ PTE not present, TLB not flushed ]
                                pte_unmap_unlock()
                                [ page is still accessible via stale TLB ]
  flush_tlb_range()

In this case the page may still be accessed via the stale TLB entry
after madvise returns. Fix this by flushing the TLB while holding the
PTL.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reported-by: Nadav Amit <nadav.amit@gmail.com>
Fixes: 8c3328f1f36a ("mm/migrate: migrate_vma() unmap page from vma while collecting pages")
Cc: stable@vger.kernel.org

---

Changes for v3:

 - New for v3
---
 mm/migrate_device.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 27fb37d..6a5ef9f 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -254,13 +254,14 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 		migrate->dst[migrate->npages] = 0;
 		migrate->src[migrate->npages++] = mpfn;
 	}
-	arch_leave_lazy_mmu_mode();
-	pte_unmap_unlock(ptep - 1, ptl);
 
 	/* Only flush the TLB if we actually modified any entries */
 	if (unmapped)
 		flush_tlb_range(walk->vma, start, end);
 
+	arch_leave_lazy_mmu_mode();
+	pte_unmap_unlock(ptep - 1, ptl);
+
 	return 0;
 }
 

base-commit: ffcf9c5700e49c0aee42dcba9a12ba21338e8136
-- 
git-series 0.9.1
