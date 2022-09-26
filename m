Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5B25E9941
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 08:07:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbXNq2kYNz3fCp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 16:07:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=aIOZr/7Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.92.81; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=aIOZr/7Z;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2081.outbound.protection.outlook.com [40.107.92.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbXKB38QMz3bWD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 16:04:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cr0R+Nl5O2QQlbEAEgPF3TrFKc03o0NJrdaKm1WmuDsHl6Cqk8/UoLlZWTblENr68pCUCNRBhawXaqNozTN+VWv5gxQxkTCo5TGlKrGTm2k5Anlg4yI0iU5BXEPElJVdqi7heIyI0J66fqbH7NdC4QHqIxfqegfKoVgB67h1Oi4OQJbms1K9C34zdqdFHtg2NAqBoPgMuo2lZ+ip1adRpa7O2NXe/lDwR7ua9iqAyLsHXOjZlLg+Y3w5TVaPvK5T2yobInD1Qr4FdwcLwWRk79FW1l8DjOX3vKHmhfkUiw42uK6Zd3lYiyQwDa1vkgLjngyU4hz9GQcBu+EfZDmnkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d08BMP/s2kcQBXT/J7jAgkJORhk1QGK3D2rAwOAqqoE=;
 b=k0Avn6iK4OqY56ca0ndyGgQC7iJAZEQwPamQUrrpCKwtyMMhAlKl83OD2Q5Y4jqBN59B5S69sBAdmG1K/d1hfaG7LwRGrFf0phqqPmqnEQi7hcj/QZlrfQluokZ4s5XylHiMqZL8zuHio+8ekZkjAHhcIDs/qkpFkkUgNwTtzVI7HlO3/8Ex2U0p3BqtQYfc7bQBHFuXfK/F5CX7DqCm+GBsVusiOO20vyCjgCVTpKHUE637hrRwuFyw6YA3xaNMqrJbaJLYp5eZ2ur4vFxyKpErudYl17k3AD/hpj0EeqyNZQ2RMlc5I1PeYDtnjLXCXkJ8J1GHjKd10e9eaWnf+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d08BMP/s2kcQBXT/J7jAgkJORhk1QGK3D2rAwOAqqoE=;
 b=aIOZr/7ZnYUBvrGbZcWZJcZFJ4P/BXnLuPkvGhT6BkhrAhN+fweekWsAn/PzP7UGHv4dUZPymdbZGrSD6pOZ4ivlLGJ+lVYSoUMHMJCD3s4NKu/FjLh4vpFA2AuepL9Ix/SuBKyt8e0If2jO7yP4t61aarr5xEqk/CtwHd9Ijjt0dt6Rb9QNCB0uTqC5Wj8wXBC97MFNEQn/zBfWs18QjyMPXwvhJRb6oswEWb0+H3Qodb2NAdR/uLm4XvFKS9il8kiskd4ckWsjMsgDjqX3LqGmMHbUuQhDXZbZ2rZ2HkRt7kIvJhWpm3q/8ZzaTSkqEh47fOAeWaQmEXOFJH/ZPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by MW4PR12MB7359.namprd12.prod.outlook.com (2603:10b6:303:219::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 06:04:32 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::ed0:a520:ac8e:9966]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::ed0:a520:ac8e:9966%6]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 06:04:32 +0000
From: Alistair Popple <apopple@nvidia.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 4/7] mm/migrate_device.c: Add migrate_device_range()
Date: Mon, 26 Sep 2022 16:03:08 +1000
Message-Id: <10f8bded7368fcfafb501239dfd18e1160b5470d.1664171943.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.f15b25597fc3afd45b144df863eeca3b2c13f9f4.1664171943.git-series.apopple@nvidia.com>
References: <cover.f15b25597fc3afd45b144df863eeca3b2c13f9f4.1664171943.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY3PR01CA0084.ausprd01.prod.outlook.com
 (2603:10c6:0:19::17) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|MW4PR12MB7359:EE_
X-MS-Office365-Filtering-Correlation-Id: 3964bc42-4a06-48fe-d33e-08da9f84fad1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	IHX/JZWEIlTTIBWP7XMideMxSOFN9FvviwlpJu2dhYz3ns3c4PrV56w2onki0D0NLTu9BRKJwX4txMbBUTt+50GekQQvpOT5Lp7EJ6DP+7E8vy0oKScOy7gViQ0+hdXAZJDP60HfKwr0SyqOm+1f7gWFaY1OGKlSEUVt0DfiS+B8A2Rn0CPkmS9jfxEeOq9EuwFJkyFuqhkzxXptz2g/eqv+fOfQzqtheA5lSy/6DVyuViZdpIjB55y38nZ5F7P3G/mN7djZYZXJnJjGSwiJ1vMo06EpWGtGGadlLtKkbE9SCJ35R4UkOg2gE2JAHEMdLijii17KSi4BRaaHNDYHCHMmPm/H2WCqaCo+d1UWegbaGCzs/4Rio/2c9Di4ym6DUbaoDzG3KsuGyd3d912qE7EpSmlnY5G0SFjxkUPgXdRSDwdpJhymmUB3a17eh2Q2AX0fdKzx6sMNlf9MhY4RbHKHbJTc3OL+JXybPpuUALTVzJB8L5aSwIWQLuB9twCfJlmVcKxRM3pGIngTFgB2GH96WTZG/fQFNMj8cIteAhB2llVVZviHfWOztUExC1895tgVfnk1cnH/G6hXDFctBitBhV87xlhumXUwuJKD/aa0K+PtYPhLOKWs+sDa5YBR7cfUhx8ZpkcnnorhH7mMOMXzfRsGn2PB+IIYHB2MuoPuNS5/h9wy7+V3UtRfEsFgCR4rrct3AKRngi5KBVtJ3vcBmmAwxnoCvDCifuWPPLGhHNqQuMiTIPKZIOtLBosi
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199015)(8936002)(86362001)(7416002)(2906002)(5660300002)(83380400001)(6666004)(41300700001)(6512007)(186003)(107886003)(26005)(6506007)(478600001)(6486002)(2616005)(6916009)(66946007)(4326008)(66556008)(66476007)(8676002)(316002)(38100700002)(54906003)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?prPSBvwVeGYdERj5nJ6HdoyLM1vxvCXpiyn6oxagZY3ddDaZ/Z10G+Q0eJgj?=
 =?us-ascii?Q?4bgq458p8HY7CGLmJDlMaOLNXJFZyWmc0v3b3ypcobYDJ0Z52q0xByTw1tLg?=
 =?us-ascii?Q?UgUOJugvBa/QocYioBIM1xW7gbk9dELXYTwdw9nr79pU7ZGedMvL5r+U2BkZ?=
 =?us-ascii?Q?7Y9wkpoJxPoc7AsQHZhP3b133dRgWBCqvfxnrzyisGZMgStCq3S5PxDEYUhC?=
 =?us-ascii?Q?xyoWKfIMYIJzXxIoNoTXCejjE6qvo/q7bEHrzpsd/CAQxMjSYiq7Zwx4Ispt?=
 =?us-ascii?Q?P3m1KXgpqXgsKZHqdgNMxeb/CUYHyImJGVzuLK0Nfe4HbX4mZC1QTt4Fic6j?=
 =?us-ascii?Q?EiEnr1wFquo/JWM5F881CPXAMJDb376eYXjHu8a2+SJYrRnGCFmtGkJOh2nF?=
 =?us-ascii?Q?jDL/fSCdhg0GyKwzaxW27YX4jNmkOj/m3Ut8dmRWUxDK8FkNG4OCxso6faso?=
 =?us-ascii?Q?dMcNafnUVDA1/cALOwPHY/+X/HuyeeXTQtzE6hzFAqbbHGqllIPkzddvBC0T?=
 =?us-ascii?Q?9woGEN7lGQc9LpDE+J5YZGJOTOg7u17g3KIn3OrCsFuSqNwl2FYRUfCl8+eD?=
 =?us-ascii?Q?0c1jCmVHjf1n/mWzFddIKH07h3EjVwmX2cmTzLoKNKoVu/5sb1vL1872EH1p?=
 =?us-ascii?Q?tsRl9s7OGYXdXVWUz5zhGh4fvwPXFLWslWWnUlK8WOV09nTb7KborrmN7OfK?=
 =?us-ascii?Q?xtC4bYQiGzaPlqBnAHQ4HCmG8+2r/1xVkSHMJ1K4ITug0DucInzQHcLxaOSB?=
 =?us-ascii?Q?AK4frt4AD3z+l0VXC0lq+YPtLjzM+zXkYSiKgQdvgn1jPS8aSPw/lZPfDVS0?=
 =?us-ascii?Q?F/QD/ezH5nrbt0oEdyIUrLBoqjjQ61N6GiLA+Ym/hkDMOcwZwReWUe6HtX9Q?=
 =?us-ascii?Q?LMeGJGFP7WwMaLTKIGCkwXzeyzN3cIdDDCow4S8b5FvRCxUIBuIaCzmTrgAb?=
 =?us-ascii?Q?LOEMOe0MsXw0MW64h/pkmTbr4is9G3dsppCq7FVVSEWkyaEj586v7W1rvSwR?=
 =?us-ascii?Q?DfNe5X7zhojL4jIYsHaidmps/Hd6UZXYwMEGqV1N2hTlf8p+nl5Z/kqqVAiR?=
 =?us-ascii?Q?vZWrv89ommSJ4gHPFb3KSXr3Pu2/u8R+h/HgLwfRH0Ze0i3wJ0d74xub8f65?=
 =?us-ascii?Q?/N7tx7IVSzNRHuM/hLKTnE5VF7E2iJoGzkN3XUCDDnuw6nftkavFfc0dV2BB?=
 =?us-ascii?Q?BETHdZ59OTPQ3rBzph7rh7p5gsbGQ37z0b+ZJw95lqYK7y8PmHTzJuYr2H1z?=
 =?us-ascii?Q?MKQ5fx7SaTN2vbsCqbXInUc4+32ISWGIO2CaD0USLtDAzSEML9adZpXTfy9r?=
 =?us-ascii?Q?t/GdHz4KlV1Ugsd3aw0wPuPcPs68G3P4K8+Zux3/diXCUhPqwaJos9qcV9g7?=
 =?us-ascii?Q?wKLkXTe7zd0lE/ARusOOiHIMw++viLVZnwI4bEUJ1+p1a7LMnwJC7ONHQ/or?=
 =?us-ascii?Q?66Tt+GNw7owC2PsbKFLC68Sk0+0q5EGHZpvwmTEoG+dnwiZQ9G6Jal3VJ+xS?=
 =?us-ascii?Q?LE8k378dqFolpgcfaiG49JZLftDNkF/w5dDuh8aWJcM22qb3YtYSr/ZeyfUR?=
 =?us-ascii?Q?2c+m0+R29ivnAgOYGwLREANrfpdNgSfWxaHnUeUT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3964bc42-4a06-48fe-d33e-08da9f84fad1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 06:04:32.2182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V9g7NmcrjoVwuPIiA2tyFM780M4t8Vv5ZOyRYuKDb/PPS9PeEegJJ7JEadd0Gsjooitet1YQ4ga2vfVj2bAGhA==
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

Device drivers can use the migrate_vma family of functions to migrate
existing private anonymous mappings to device private pages. These pages
are backed by memory on the device with drivers being responsible for
copying data to and from device memory.

Device private pages are freed via the pgmap->page_free() callback when
they are unmapped and their refcount drops to zero. Alternatively they
may be freed indirectly via migration back to CPU memory in response to
a pgmap->migrate_to_ram() callback called whenever the CPU accesses
an address mapped to a device private page.

In other words drivers cannot control the lifetime of data allocated on
the devices and must wait until these pages are freed from userspace.
This causes issues when memory needs to reclaimed on the device, either
because the device is going away due to a ->release() callback or
because another user needs to use the memory.

Drivers could use the existing migrate_vma functions to migrate data off
the device. However this would require them to track the mappings of
each page which is both complicated and not always possible. Instead
drivers need to be able to migrate device pages directly so they can
free up device memory.

To allow that this patch introduces the migrate_device family of
functions which are functionally similar to migrate_vma but which skips
the initial lookup based on mapping.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 include/linux/migrate.h |  7 +++-
 mm/migrate_device.c     | 89 ++++++++++++++++++++++++++++++++++++++----
 2 files changed, 89 insertions(+), 7 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 82ffa47..582cdc7 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -225,6 +225,13 @@ struct migrate_vma {
 int migrate_vma_setup(struct migrate_vma *args);
 void migrate_vma_pages(struct migrate_vma *migrate);
 void migrate_vma_finalize(struct migrate_vma *migrate);
+int migrate_device_range(unsigned long *src_pfns, unsigned long start,
+			unsigned long npages);
+void migrate_device_pages(unsigned long *src_pfns, unsigned long *dst_pfns,
+			unsigned long npages);
+void migrate_device_finalize(unsigned long *src_pfns,
+			unsigned long *dst_pfns, unsigned long npages);
+
 #endif /* CONFIG_MIGRATION */
 
 #endif /* _LINUX_MIGRATE_H */
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index ba479b5..824860a 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -681,7 +681,7 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 	*src &= ~MIGRATE_PFN_MIGRATE;
 }
 
-static void migrate_device_pages(unsigned long *src_pfns,
+static void __migrate_device_pages(unsigned long *src_pfns,
 				unsigned long *dst_pfns, unsigned long npages,
 				struct migrate_vma *migrate)
 {
@@ -703,6 +703,9 @@ static void migrate_device_pages(unsigned long *src_pfns,
 		if (!page) {
 			unsigned long addr;
 
+			if (!(src_pfns[i] & MIGRATE_PFN_MIGRATE))
+				continue;
+
 			/*
 			 * The only time there is no vma is when called from
 			 * migrate_device_coherent_page(). However this isn't
@@ -710,8 +713,6 @@ static void migrate_device_pages(unsigned long *src_pfns,
 			 */
 			VM_BUG_ON(!migrate);
 			addr = migrate->start + i*PAGE_SIZE;
-			if (!(src_pfns[i] & MIGRATE_PFN_MIGRATE))
-				continue;
 			if (!notified) {
 				notified = true;
 
@@ -767,6 +768,22 @@ static void migrate_device_pages(unsigned long *src_pfns,
 }
 
 /**
+ * migrate_device_pages() - migrate meta-data from src page to dst page
+ * @src_pfns: src_pfns returned from migrate_device_range()
+ * @dst_pfns: array of pfns allocated by the driver to migrate memory to
+ * @npages: number of pages in the range
+ *
+ * Equivalent to migrate_vma_pages(). This is called to migrate struct page
+ * meta-data from source struct page to destination.
+ */
+void migrate_device_pages(unsigned long *src_pfns, unsigned long *dst_pfns,
+			unsigned long npages)
+{
+	__migrate_device_pages(src_pfns, dst_pfns, npages, NULL);
+}
+EXPORT_SYMBOL(migrate_device_pages);
+
+/**
  * migrate_vma_pages() - migrate meta-data from src page to dst page
  * @migrate: migrate struct containing all migration information
  *
@@ -776,12 +793,22 @@ static void migrate_device_pages(unsigned long *src_pfns,
  */
 void migrate_vma_pages(struct migrate_vma *migrate)
 {
-	migrate_device_pages(migrate->src, migrate->dst, migrate->npages, migrate);
+	__migrate_device_pages(migrate->src, migrate->dst, migrate->npages, migrate);
 }
 EXPORT_SYMBOL(migrate_vma_pages);
 
-static void migrate_device_finalize(unsigned long *src_pfns,
-				unsigned long *dst_pfns, unsigned long npages)
+/*
+ * migrate_device_finalize() - complete page migration
+ * @src_pfns: src_pfns returned from migrate_device_range()
+ * @dst_pfns: array of pfns allocated by the driver to migrate memory to
+ * @npages: number of pages in the range
+ *
+ * Completes migration of the page by removing special migration entries.
+ * Drivers must ensure copying of page data is complete and visible to the CPU
+ * before calling this.
+ */
+void migrate_device_finalize(unsigned long *src_pfns,
+			unsigned long *dst_pfns, unsigned long npages)
 {
 	unsigned long i;
 
@@ -825,6 +852,7 @@ static void migrate_device_finalize(unsigned long *src_pfns,
 		}
 	}
 }
+EXPORT_SYMBOL(migrate_device_finalize);
 
 /**
  * migrate_vma_finalize() - restore CPU page table entry
@@ -843,6 +871,53 @@ void migrate_vma_finalize(struct migrate_vma *migrate)
 }
 EXPORT_SYMBOL(migrate_vma_finalize);
 
+/**
+ * migrate_device_range() - migrate device private pfns to normal memory.
+ * @src_pfns: array large enough to hold migrating source device private pfns.
+ * @start: starting pfn in the range to migrate.
+ * @npages: number of pages to migrate.
+ *
+ * migrate_vma_setup() is similar in concept to migrate_vma_setup() except that
+ * instead of looking up pages based on virtual address mappings a range of
+ * device pfns that should be migrated to system memory is used instead.
+ *
+ * This is useful when a driver needs to free device memory but doesn't know the
+ * virtual mappings of every page that may be in device memory. For example this
+ * is often the case when a driver is being unloaded or unbound from a device.
+ *
+ * Like migrate_vma_setup() this function will take a reference and lock any
+ * migrating pages that aren't free before unmapping them. Drivers may then
+ * allocate destination pages and start copying data from the device to CPU
+ * memory before calling migrate_device_pages().
+ */
+int migrate_device_range(unsigned long *src_pfns, unsigned long start,
+			unsigned long npages)
+{
+	unsigned long i, pfn;
+
+	for (pfn = start, i = 0; i < npages; pfn++, i++) {
+		struct page *page = pfn_to_page(pfn);
+
+		if (!get_page_unless_zero(page)) {
+			src_pfns[i] = 0;
+			continue;
+		}
+
+		if (!trylock_page(page)) {
+			src_pfns[i] = 0;
+			put_page(page);
+			continue;
+		}
+
+		src_pfns[i] = migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
+	}
+
+	migrate_device_unmap(src_pfns, npages, NULL);
+
+	return 0;
+}
+EXPORT_SYMBOL(migrate_device_range);
+
 /*
  * Migrate a device coherent page back to normal memory. The caller should have
  * a reference on page which will be copied to the new page if migration is
@@ -873,7 +948,7 @@ int migrate_device_coherent_page(struct page *page)
 		dst_pfn = migrate_pfn(page_to_pfn(dpage));
 	}
 
-	migrate_device_pages(&src_pfn, &dst_pfn, 1, NULL);
+	migrate_device_pages(&src_pfn, &dst_pfn, 1);
 	if (src_pfn & MIGRATE_PFN_MIGRATE)
 		copy_highpage(dpage, page);
 	migrate_device_finalize(&src_pfn, &dst_pfn, 1);
-- 
git-series 0.9.1
