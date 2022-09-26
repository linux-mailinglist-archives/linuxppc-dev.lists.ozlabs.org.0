Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA015E993E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 08:07:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbXN11skjz3f9S
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 16:07:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GzDSeBW0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.92.81; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GzDSeBW0;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2081.outbound.protection.outlook.com [40.107.92.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbXK93XQqz3c7k
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 16:04:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PVQOQfCndOJVthReXuUupKxCeQveXeBJ+akXW3ZPIq5d2fqmfmNjggggBZVWbtYMQBTU5ZVJ/eflvtu+4083KaK89kVtGViBe5aDBg/Snt1At4UgeQ1EA8odduP1DnD32p3aok7ogoqDshQ/sfAwUTtTL5zpt2AZ4dR/WmSYx98u2X8jjezgEs+60YiRz0tm2EM6OGDF92Mum6+0u4nOs6gC0laFdw2LTYKvvzI3TctkbaZInrOtVxJ4nBSEggEk8h1C/LqOrZO6bNZCIkG5KGJhgvj7HQ/qPaKmoN2KCUhHQtFj/1aFX5lO1cXVo6lDOpKMy58MNZmTpixUlfDPQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T2nyLQ4qEscDa+MQJ+rQdk5h/V1O/8PSiaS2mr2fBRs=;
 b=OFda/YtFDUqKwQ/ovIwKtpRiO+wTKxk9paC8CGRnDkAMbojwXcTqBwONnCs9HSNwLURC1FM1rW7hoDELYjThjc3lBT8P2lN+HISXKiuzAH4z+dnn/W/ol+gG20EyAOgiBTX38ffgJKUr+YgPcJRq/M+kxKL3q/EfrG7c65Rr+XrOEOGPWB+NIgnAeHsZUwv6OCe44a6Gam6IgJQLD81t8FcnloUJHpHjFP6QjcaKsDLfqhYWbe09d8ybBFff7ujBO1ztfjKdFvo6iJ4+rts2HwEw3FKpMIGAOsm/IluDrJGSkG6nJ6EPoXG8vzUBGLMinAqBYA4nLyuUa2CcSiY0iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2nyLQ4qEscDa+MQJ+rQdk5h/V1O/8PSiaS2mr2fBRs=;
 b=GzDSeBW0ravMarrXCC+0qgL8AsF0bDTvVVs6Pn5VuJxs9duFEmlZHq9fBgJyjz7dpgH1WrBJPLp8k4vHwBukLFetzIZEmhtq9VaS7q07Y9MRt9kNskXS7T7T6qRsb+JXANsF/aWwKBmSABRLg/SSRq+KflMIa2ZHDGRltoJp3XQpYtjp8GyToH792TosU2XFA3QsQGMAOWgZIcw8uyXJdUTjTOCIUQmYC9G6Qfirh9QTt2mzHZYQI92WuB0yCJUX7NAjFvBXvotG8V3t4Rumyr1Tetinwwvk9qDPnrtAK7kkSsSHBWM6v/onhEMuZuroSvzL5D1UIwxMwVORbx5ZzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by MW4PR12MB7359.namprd12.prod.outlook.com (2603:10b6:303:219::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 06:04:25 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::ed0:a520:ac8e:9966]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::ed0:a520:ac8e:9966%6]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 06:04:25 +0000
From: Alistair Popple <apopple@nvidia.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 3/7] mm/migrate_device.c: Refactor migrate_vma and migrate_deivce_coherent_page()
Date: Mon, 26 Sep 2022 16:03:07 +1000
Message-Id: <200f8aa4de38b2185f9637ba615acbf0f5b7506b.1664171943.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.f15b25597fc3afd45b144df863eeca3b2c13f9f4.1664171943.git-series.apopple@nvidia.com>
References: <cover.f15b25597fc3afd45b144df863eeca3b2c13f9f4.1664171943.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0014.ausprd01.prod.outlook.com
 (2603:10c6:10:e8::19) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|MW4PR12MB7359:EE_
X-MS-Office365-Filtering-Correlation-Id: 0472a377-2ec6-4aa1-19de-08da9f84f695
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	MJNfzkfX352OnQ4a0y32Q4/Eqii82tc37khth2uh9Na1HYY5EY8YyrygXP6D9dpaB61Q9ERIc2zzgOPBiUFCH3Aa2p8IdIdfudoIFV+lDhREFkZvZPzajHumLS4kIPIIHuizkvPRJ/PKJ/Hsx0oGszNycBzG7Huf06t2TRrXQC/P3YsuD4Il4UTxfsItVzS8oZumMcPUe4atfEYNcU00zR9nHk0TYcgxj680d8GYa6KbQkLTTFmMMqfoyL2VVQLnHX3CvUZkBLuOTsxu9b1bsldp6cLt+n9lkcnU20wJgYuEA9lCMA8lVBEPKl9O4DZmLMcOJ5DV5dUxq7zFCVXM1nCJs2LK0Cs4eAO7ouQ7gWHOGy92xvzFwE9xUc4ydZHEOo+8lWIf9XtQ6LMkS1F0wzdLMLHx4traC4UDtxta3+z/mMlvnKgPNCMrkqNPHhq8UyLRUMsifMrlVsP6rWbF6FfV+X8kANtV/Bi+KiAnxeU9+p9rpkY0UUvxXeUa0o0wac7tcOwyxAJrAQLXj/fViMIVuynH+h5vqFaOxV6kkKsDvAb/4P/g37eiBkRQZANuWZ3tGz3BSnIOtLh5lZQwPkG2drhzZXLnKUGNgMabk0FnM2mk36sb8IklX3xI8Js9LG7uS5AP1gjt7/MMGCm3cWktB+e9MpNvyYQIL9hNa3GLOm4scoy12wBBOevAVj7Yt2w1UXpJpCqNrYjHQ0VRnop0Cw7ONsPo8nh4DdEtynkVwM2/+Y41Hv2MSwWZXrZD
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199015)(8936002)(86362001)(30864003)(7416002)(2906002)(5660300002)(83380400001)(6666004)(41300700001)(6512007)(186003)(107886003)(26005)(6506007)(478600001)(6486002)(2616005)(6916009)(66946007)(4326008)(66556008)(66476007)(8676002)(316002)(38100700002)(54906003)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?LbmnBwbCJGyr986N7rjFEolCrOyK3OIzk5zC3IE0hJl8ipOSdrZK8kJO9J6S?=
 =?us-ascii?Q?2STJhR6uFnOzI8BBT1JhFCxJ6g70Kqkvbv9BCpwWIQtEu2GEy2YdCkYqxe7v?=
 =?us-ascii?Q?GtNQ6qNVCPwzjlYBfhhGQ2AcCaA/PoQeaWSK2sUBlIWkp9auWnB5Mm4lALVb?=
 =?us-ascii?Q?Jl0jVN7h9IDIxlxqPEJrHwoM2+Vw8kQCNAaBPY0Igv4TZJHE64dwm0u+TWvz?=
 =?us-ascii?Q?Vj9wP+CavAWH7bLPFH/NKDmLnLfLVhdKiOlTF2yt0HBSe4vvjlJbsF8GluIa?=
 =?us-ascii?Q?UuplzT8Bq31Jhy+w2sbegozz7Q5NIbfaMSlTpUB0Xn1dRhRC5KZXD7ff/AVH?=
 =?us-ascii?Q?TGqqAnxlp/w20PeyPM9/XaFHYfTIoJ2F1YqBTSepKeWZxb0ZKti5NtWR3hZk?=
 =?us-ascii?Q?uIySMOLzi1cB5YIAWd7JlJk4SzLDHhoAytxWsH2GFm8WuZymfGaasEwCPYC0?=
 =?us-ascii?Q?fuS0MxjE9ukxKSwOxyc+us2dXOyg5NAaz9RDpbwHhB8jq3HfQvdnn2wDcXP4?=
 =?us-ascii?Q?xKCZ9frUX9gUEI1o1OpLjYOIBkKr6PWVDSV426grR5S8qmKflp79lByqYSXK?=
 =?us-ascii?Q?sS/hrOFk8ucUdb6IUlQ+z9lMMzXWuqWGIuvdl9n7HC6ps31qXOnH3duAA2Ua?=
 =?us-ascii?Q?cyVXsmIAY+6XJ3Lb3fQi62KxHj6rK+78U3M5ACLvdnAOk3Q+Vf4JqnvnWKxC?=
 =?us-ascii?Q?0ObrH1ZD/QUwvdrqL5XXPd4n35yCDk5XV/zZ7o+nRiWVYyk2zL3ABlAK+CEq?=
 =?us-ascii?Q?CXKfw78IIGfJDkjQhNToqwHWKW9oFG5Q+RrAvfy85ql0WdWoORUlBPCZiAcn?=
 =?us-ascii?Q?f2d2PTGn7jAMTcjjmEmf+dcsNe6mrkSFvbGIF07Eu03eYFTbTA2iLbR/uQLr?=
 =?us-ascii?Q?o1TtPUod14ErTvmB5+7HpuGNHU1soFSAkSF8zrGBeJE0ZeMuGEKDNx23KEcN?=
 =?us-ascii?Q?/OZDksc3LixvyvE0GJD9nksmd0vjs7Yybnkt28a2WZC/8grd80ccJh+iFKSW?=
 =?us-ascii?Q?2REdQooP+23Y8gTuCIIIxq1Qtkz3yY01kq2doMz3V4Uz/8FNfWhqtbB/COIz?=
 =?us-ascii?Q?qcZea4tIB4OEq1bcPJcJ/aX++6/5Jjpr8L3/NuJddxKMdaoCPswaaBWOmeSx?=
 =?us-ascii?Q?6KxGrM6afg1wdb8ISWdHxGXdIldKwmTjmuSDsaZtvTpoP22e16BqQrWYjvOO?=
 =?us-ascii?Q?lhrUdiYfkt/5hyAolPsFNhxIcr+ecGgtDshxMpFb8rXXaTAg3hoZW8s1Z8Su?=
 =?us-ascii?Q?H0f75MXueNIm1PZFV5wAt2s5bwElAEhzXjunlwlC9iu3Zyiqrps1mJ8wUAQs?=
 =?us-ascii?Q?p3RMYQfuk662ejcBU9oZxxoN+rrh0cE9wArxcc3raE8MEgVS0eHxSnYhAu6e?=
 =?us-ascii?Q?SWEGyg9E1TKpBwmrw5beC4m/bq+YKr0ns47y5lsBYtWXvA5iSJdLK3RIU/Q+?=
 =?us-ascii?Q?+QjUyeVA/hW4H1ZfGKrHV4ckhlu8M7vlPK6vQJQfj5fbxtbGPBFy0kUx2HPe?=
 =?us-ascii?Q?xLInfsZIk/0D8ehn54shCK9uKWDmpzKUzeJa+x4QKdlx8ebEOObYxC2aQpzK?=
 =?us-ascii?Q?KWewIlreHrhLC17gjk00es2QNMCXgBH5i/hzR+fK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0472a377-2ec6-4aa1-19de-08da9f84f695
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 06:04:25.1249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NpnwxzeytdL+DH95cv8XAWiQXik6svaaYNX/DdmEu4v1G6mn3LYnEeXPKPiSJCeBcPH0Hq/r+/lJmyXh3tWO/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7359
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
Cc: Alex Sierra <alex.sierra@amd.com>, Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Ralph Campbell <rcampbell@nvidia.com>, Lyude Paul <lyude@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Dan Williams <dan.j.williams@intel.com>, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, linuxppc-dev@lists.ozlabs.org, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

migrate_device_coherent_page() reuses the existing migrate_vma family of
functions to migrate a specific page without providing a valid mapping
or vma. This looks a bit odd because it means we are calling
migrate_vma_*() without setting a valid vma, however it was considered
acceptable at the time because the details were internal to
migrate_device.c and there was only a single user.

One of the reasons the details could be kept internal was that this was
strictly for migrating device coherent memory. Such memory can be copied
directly by the CPU without intervention from a driver. However this
isn't true for device private memory, and a future change requires
similar functionality for device private memory. So refactor the code
into something more sensible for migrating device memory without a vma.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 mm/migrate_device.c | 150 +++++++++++++++++++++++++--------------------
 1 file changed, 85 insertions(+), 65 deletions(-)

diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index f756c00..ba479b5 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -345,26 +345,20 @@ static bool migrate_vma_check_page(struct page *page, struct page *fault_page)
 }
 
 /*
- * migrate_vma_unmap() - replace page mapping with special migration pte entry
- * @migrate: migrate struct containing all migration information
- *
- * Isolate pages from the LRU and replace mappings (CPU page table pte) with a
- * special migration pte entry and check if it has been pinned. Pinned pages are
- * restored because we cannot migrate them.
- *
- * This is the last step before we call the device driver callback to allocate
- * destination memory and copy contents of original page over to new page.
+ * Unmaps pages for migration. Returns number of unmapped pages.
  */
-static void migrate_vma_unmap(struct migrate_vma *migrate)
+static unsigned long migrate_device_unmap(unsigned long *src_pfns,
+					  unsigned long npages,
+					  struct page *fault_page)
 {
-	const unsigned long npages = migrate->npages;
 	unsigned long i, restore = 0;
 	bool allow_drain = true;
+	unsigned long unmapped = 0;
 
 	lru_add_drain();
 
 	for (i = 0; i < npages; i++) {
-		struct page *page = migrate_pfn_to_page(migrate->src[i]);
+		struct page *page = migrate_pfn_to_page(src_pfns[i]);
 		struct folio *folio;
 
 		if (!page)
@@ -379,8 +373,7 @@ static void migrate_vma_unmap(struct migrate_vma *migrate)
 			}
 
 			if (isolate_lru_page(page)) {
-				migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
-				migrate->cpages--;
+				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
 				restore++;
 				continue;
 			}
@@ -394,34 +387,54 @@ static void migrate_vma_unmap(struct migrate_vma *migrate)
 			try_to_migrate(folio, 0);
 
 		if (page_mapped(page) ||
-		    !migrate_vma_check_page(page, migrate->fault_page)) {
+		    !migrate_vma_check_page(page, fault_page)) {
 			if (!is_zone_device_page(page)) {
 				get_page(page);
 				putback_lru_page(page);
 			}
 
-			migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
-			migrate->cpages--;
+			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
 			restore++;
 			continue;
 		}
+
+		unmapped++;
 	}
 
 	for (i = 0; i < npages && restore; i++) {
-		struct page *page = migrate_pfn_to_page(migrate->src[i]);
+		struct page *page = migrate_pfn_to_page(src_pfns[i]);
 		struct folio *folio;
 
-		if (!page || (migrate->src[i] & MIGRATE_PFN_MIGRATE))
+		if (!page || (src_pfns[i] & MIGRATE_PFN_MIGRATE))
 			continue;
 
 		folio = page_folio(page);
 		remove_migration_ptes(folio, folio, false);
 
-		migrate->src[i] = 0;
+		src_pfns[i] = 0;
 		folio_unlock(folio);
 		folio_put(folio);
 		restore--;
 	}
+
+	return unmapped;
+}
+
+/*
+ * migrate_vma_unmap() - replace page mapping with special migration pte entry
+ * @migrate: migrate struct containing all migration information
+ *
+ * Isolate pages from the LRU and replace mappings (CPU page table pte) with a
+ * special migration pte entry and check if it has been pinned. Pinned pages are
+ * restored because we cannot migrate them.
+ *
+ * This is the last step before we call the device driver callback to allocate
+ * destination memory and copy contents of original page over to new page.
+ */
+static void migrate_vma_unmap(struct migrate_vma *migrate)
+{
+	migrate->cpages = migrate_device_unmap(migrate->src, migrate->npages,
+					migrate->fault_page);
 }
 
 /**
@@ -668,41 +681,36 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 	*src &= ~MIGRATE_PFN_MIGRATE;
 }
 
-/**
- * migrate_vma_pages() - migrate meta-data from src page to dst page
- * @migrate: migrate struct containing all migration information
- *
- * This migrates struct page meta-data from source struct page to destination
- * struct page. This effectively finishes the migration from source page to the
- * destination page.
- */
-void migrate_vma_pages(struct migrate_vma *migrate)
+static void migrate_device_pages(unsigned long *src_pfns,
+				unsigned long *dst_pfns, unsigned long npages,
+				struct migrate_vma *migrate)
 {
-	const unsigned long npages = migrate->npages;
-	const unsigned long start = migrate->start;
 	struct mmu_notifier_range range;
-	unsigned long addr, i;
+	unsigned long i;
 	bool notified = false;
 
-	for (i = 0, addr = start; i < npages; addr += PAGE_SIZE, i++) {
-		struct page *newpage = migrate_pfn_to_page(migrate->dst[i]);
-		struct page *page = migrate_pfn_to_page(migrate->src[i]);
+	for (i = 0; i < npages; i++) {
+		struct page *newpage = migrate_pfn_to_page(dst_pfns[i]);
+		struct page *page = migrate_pfn_to_page(src_pfns[i]);
 		struct address_space *mapping;
 		int r;
 
 		if (!newpage) {
-			migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
+			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
 			continue;
 		}
 
 		if (!page) {
+			unsigned long addr;
+
 			/*
 			 * The only time there is no vma is when called from
 			 * migrate_device_coherent_page(). However this isn't
 			 * called if the page could not be unmapped.
 			 */
-			VM_BUG_ON(!migrate->vma);
-			if (!(migrate->src[i] & MIGRATE_PFN_MIGRATE))
+			VM_BUG_ON(!migrate);
+			addr = migrate->start + i*PAGE_SIZE;
+			if (!(src_pfns[i] & MIGRATE_PFN_MIGRATE))
 				continue;
 			if (!notified) {
 				notified = true;
@@ -714,7 +722,7 @@ void migrate_vma_pages(struct migrate_vma *migrate)
 				mmu_notifier_invalidate_range_start(&range);
 			}
 			migrate_vma_insert_page(migrate, addr, newpage,
-						&migrate->src[i]);
+						&src_pfns[i]);
 			continue;
 		}
 
@@ -727,18 +735,18 @@ void migrate_vma_pages(struct migrate_vma *migrate)
 			 * device private or coherent memory.
 			 */
 			if (mapping) {
-				migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
+				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
 				continue;
 			}
 		} else if (is_zone_device_page(newpage)) {
 			/*
 			 * Other types of ZONE_DEVICE page are not supported.
 			 */
-			migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
+			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
 			continue;
 		}
 
-		if (migrate->fault_page == page)
+		if (migrate && migrate->fault_page == page)
 			r = migrate_folio_extra(mapping, page_folio(newpage),
 						page_folio(page),
 						MIGRATE_SYNC_NO_COPY, 1);
@@ -746,7 +754,7 @@ void migrate_vma_pages(struct migrate_vma *migrate)
 			r = migrate_folio(mapping, page_folio(newpage),
 					page_folio(page), MIGRATE_SYNC_NO_COPY);
 		if (r != MIGRATEPAGE_SUCCESS)
-			migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
+			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
 	}
 
 	/*
@@ -757,28 +765,30 @@ void migrate_vma_pages(struct migrate_vma *migrate)
 	if (notified)
 		mmu_notifier_invalidate_range_only_end(&range);
 }
-EXPORT_SYMBOL(migrate_vma_pages);
 
 /**
- * migrate_vma_finalize() - restore CPU page table entry
+ * migrate_vma_pages() - migrate meta-data from src page to dst page
  * @migrate: migrate struct containing all migration information
  *
- * This replaces the special migration pte entry with either a mapping to the
- * new page if migration was successful for that page, or to the original page
- * otherwise.
- *
- * This also unlocks the pages and puts them back on the lru, or drops the extra
- * refcount, for device pages.
+ * This migrates struct page meta-data from source struct page to destination
+ * struct page. This effectively finishes the migration from source page to the
+ * destination page.
  */
-void migrate_vma_finalize(struct migrate_vma *migrate)
+void migrate_vma_pages(struct migrate_vma *migrate)
+{
+	migrate_device_pages(migrate->src, migrate->dst, migrate->npages, migrate);
+}
+EXPORT_SYMBOL(migrate_vma_pages);
+
+static void migrate_device_finalize(unsigned long *src_pfns,
+				unsigned long *dst_pfns, unsigned long npages)
 {
-	const unsigned long npages = migrate->npages;
 	unsigned long i;
 
 	for (i = 0; i < npages; i++) {
 		struct folio *dst, *src;
-		struct page *newpage = migrate_pfn_to_page(migrate->dst[i]);
-		struct page *page = migrate_pfn_to_page(migrate->src[i]);
+		struct page *newpage = migrate_pfn_to_page(dst_pfns[i]);
+		struct page *page = migrate_pfn_to_page(src_pfns[i]);
 
 		if (!page) {
 			if (newpage) {
@@ -788,7 +798,7 @@ void migrate_vma_finalize(struct migrate_vma *migrate)
 			continue;
 		}
 
-		if (!(migrate->src[i] & MIGRATE_PFN_MIGRATE) || !newpage) {
+		if (!(src_pfns[i] & MIGRATE_PFN_MIGRATE) || !newpage) {
 			if (newpage) {
 				unlock_page(newpage);
 				put_page(newpage);
@@ -815,6 +825,22 @@ void migrate_vma_finalize(struct migrate_vma *migrate)
 		}
 	}
 }
+
+/**
+ * migrate_vma_finalize() - restore CPU page table entry
+ * @migrate: migrate struct containing all migration information
+ *
+ * This replaces the special migration pte entry with either a mapping to the
+ * new page if migration was successful for that page, or to the original page
+ * otherwise.
+ *
+ * This also unlocks the pages and puts them back on the lru, or drops the extra
+ * refcount, for device pages.
+ */
+void migrate_vma_finalize(struct migrate_vma *migrate)
+{
+	migrate_device_finalize(migrate->src, migrate->dst, migrate->npages);
+}
 EXPORT_SYMBOL(migrate_vma_finalize);
 
 /*
@@ -825,25 +851,19 @@ EXPORT_SYMBOL(migrate_vma_finalize);
 int migrate_device_coherent_page(struct page *page)
 {
 	unsigned long src_pfn, dst_pfn = 0;
-	struct migrate_vma args;
 	struct page *dpage;
 
 	WARN_ON_ONCE(PageCompound(page));
 
 	lock_page(page);
 	src_pfn = migrate_pfn(page_to_pfn(page)) | MIGRATE_PFN_MIGRATE;
-	args.src = &src_pfn;
-	args.dst = &dst_pfn;
-	args.cpages = 1;
-	args.npages = 1;
-	args.vma = NULL;
 
 	/*
 	 * We don't have a VMA and don't need to walk the page tables to find
 	 * the source page. So call migrate_vma_unmap() directly to unmap the
 	 * page as migrate_vma_setup() will fail if args.vma == NULL.
 	 */
-	migrate_vma_unmap(&args);
+	migrate_device_unmap(&src_pfn, 1, NULL);
 	if (!(src_pfn & MIGRATE_PFN_MIGRATE))
 		return -EBUSY;
 
@@ -853,10 +873,10 @@ int migrate_device_coherent_page(struct page *page)
 		dst_pfn = migrate_pfn(page_to_pfn(dpage));
 	}
 
-	migrate_vma_pages(&args);
+	migrate_device_pages(&src_pfn, &dst_pfn, 1, NULL);
 	if (src_pfn & MIGRATE_PFN_MIGRATE)
 		copy_highpage(dpage, page);
-	migrate_vma_finalize(&args);
+	migrate_device_finalize(&src_pfn, &dst_pfn, 1);
 
 	if (src_pfn & MIGRATE_PFN_MIGRATE)
 		return 0;
-- 
git-series 0.9.1
