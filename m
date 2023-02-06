Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F134868B6C7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 08:50:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9JMr5X7dz3cg0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 18:50:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VT3h3Buu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e83::628; helo=nam02-dm3-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VT3h3Buu;
	dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on20628.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e83::628])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9JLM26Ncz3cNf
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Feb 2023 18:49:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ScbFAXZwDSHDQYWfo+yBKa5EfS66fkePVN0KUmOunWodLhHCV4ULVvfwNauI0zQ2eBvnik0jEi90CMzWz5DR1c6Cz2v8NQaBE+tWBt7nr4z0CWa10xiznBdgp1Nm+k1z4xDUJ7ye12qJ7T+J4cEtfuMMrxPdgZ3XbBqw6GRxD/ZwtvmU5PvrZGd1TDzht3yybqzIY3WAfqqINM5HegVLwJ+xrvke7Cb//NFdGo4yyK1cll0HqzKuL5jQ3bDL7w+1MLnYchBhYmlkXkwOAb1VEKqP6k55wRdeIn1vd7jSMr0Otg5wbt/EgYcaeFtLjUUsCOnTXcifHQvh3wCKcJH/mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4aNGQ6CEFF/Iwo4DWZWCLfPBaTkYJe6nei2IWX2bVLk=;
 b=LqvQqbW1VJRiXVEeYE2GmDfVFnPTJiQFDnWiyaE2fKtllJZNL8ZrjRiGcS+1GgtroJtApXou7U1szAKFuscrS8aTGqqBt1H1R4fte3aXwMG2Fm8ZpDmj7WmM3I542Qd5Itnh10o4X0h/BC6C2Dke/IswXSCFqovNS6UHd3FJwaDpvMHShncjv/gUFDEsj+ZCtlv29xxAX+8YqNctu7D42Y8wWdhoKx2wFvKSnwhCzUNWDZgMSg5ZTDnhECuel5n0D2Z6CYfCro/c3uCQnvcaAwRFbg2s7k6sgVTccfZQlbemI34922wSM58l57WYsgNnbpIEbY1eC4nSpEToU8vadA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4aNGQ6CEFF/Iwo4DWZWCLfPBaTkYJe6nei2IWX2bVLk=;
 b=VT3h3BuuFakyBa1tv3zMLWgdy0gFVM4xRbhSGmYmbGmqzVcCtyci/LlF1QBXJUbYcfqQfRAGEzvCGyS97l5/O8gteE7GX0CdtPbs52p6BURnxvnjHJspqYOjLDaThTCu4IvpaqqjDxhkgNVXSsp9lkSnDOTmiGW5EtiOkLLfcHwq6/fZSwaW5ITif9x+5mFkec0S+WcCxKzehbDCIKbbn/BUXbT/NNndSJ4xwCA2g+piUzTPeaOveLcnKjI/epZ6yyBYT86+NrBi/q8u9ZzZfezDPbPUSCaxiY05/P+coJEKaaS0S864sYfyKsSPOyxFPjBpmlmG4Jslgofey51zyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by DM4PR12MB5118.namprd12.prod.outlook.com (2603:10b6:5:391::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.31; Mon, 6 Feb
 2023 07:49:07 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::4bd4:de67:b676:67df]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::4bd4:de67:b676:67df%6]) with mapi id 15.20.6064.032; Mon, 6 Feb 2023
 07:49:07 +0000
From: Alistair Popple <apopple@nvidia.com>
To: linux-mm@kvack.org,
	cgroups@vger.kernel.org
Subject: [PATCH 08/19] vfio/spapr_tce: Convert accounting to pinned_vm
Date: Mon,  6 Feb 2023 18:47:45 +1100
Message-Id: <f3363c545df56a835b9bf145a5a305b5e852b811.1675669136.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.c238416f0e82377b449846dbb2459ae9d7030c8e.1675669136.git-series.apopple@nvidia.com>
References: <cover.c238416f0e82377b449846dbb2459ae9d7030c8e.1675669136.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYXPR01CA0088.ausprd01.prod.outlook.com
 (2603:10c6:0:2e::21) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|DM4PR12MB5118:EE_
X-MS-Office365-Filtering-Correlation-Id: d4a9ea4d-62d6-4d24-e89f-08db0816a035
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	iWUpf7QiSNpZ/BcD+AET9d7eIgcFareDzNOWhk99Dr/Ree6FI7pWqkP+D6TDXFKgY8TZ5XQ+RaPznI/kT55B3NJLbNkZrC6XyIUQ+uS+KzEPaNXGt0SPCwRVLF/egr6P5SexkJX9JwUJcKB6DKsLauOBEqRBUrgsWkSdBZRL0xisfwyTYcfgT4aUxOD6PveYHjh05ByLg2KqTXLbEZegTendZQWWSRguwakP8Pu4pSc7oSAKtf47yRVRj7sZvUKxHjmIEpwt1UXuONjAYH/+WTs8eDQTKj0+Oc96d5UOKXKIDxeYnAgNSeyKs3qWuwVmGdPoEdfHE8Bc0z2JrhYs44Z+51tYalcIMwPp2JWpLdeLtopMhcyR7CxIoEn/6FV/6Jp1+MQ5ymTSs91yipbEPNSwq00AGa1/MCqsZ+UT+zC3FmhhkdG6TjvRt9Q5e3Uj6xOskk3CW2y20+iqlSdM8liDU7ATBa+RDMqKOuczBmU5xlRR+4UIF1MlbNhlq2d2zlO9AF0Xat+u3C++9xus7by4OHqgYNtrtBtz723yxLGYW/72hska2T12DgReKGk+zTVqtepdD92mhiMdFY6VpIiUoEQN5D6+OhZR/0iCP0csDkfh2HsLjhte2EcaA2JjFmeXrzRdyu3g3649c31Alw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(366004)(396003)(346002)(136003)(451199018)(66946007)(66476007)(4326008)(41300700001)(8676002)(38100700002)(8936002)(6506007)(6512007)(26005)(316002)(54906003)(7416002)(66556008)(6666004)(5660300002)(478600001)(6486002)(83380400001)(15650500001)(186003)(2616005)(86362001)(36756003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?J1lKquI9iAaemJegDUiKMox/qBsp+Xu2+DY++QRpmFu2QoWhovc9ib2zZo1G?=
 =?us-ascii?Q?0eBx99eI1o60+2qoVPxEZsYAur9+TbUbor5EWDFYAuP2q7YyF9B6C64YH/30?=
 =?us-ascii?Q?1qDJdftQOmSC9O/wYd2RBUvPyPAtIjIj+4zEkJoFQcRlDv2hyMunJFFSTcWW?=
 =?us-ascii?Q?m2TSqAbQoCTBKJ4kD0c+LSHsF9HYlZfQlkh/8X1snQVDsd/zBgU7rZ3R1zTm?=
 =?us-ascii?Q?WVnm6jTDddQm7I4gRRnTHtyTGNe6NCMsB6eMHU6qgPaSF/A5iwsn3NnN6qUw?=
 =?us-ascii?Q?U0tRwF1twT38zBAO2NmATvUJHDJkW8PixdBPoO+gbsDzPdxnaZRdo+zpnOZh?=
 =?us-ascii?Q?vVx6SBtGJlT4Y2dySOAyVWVsbsqWpcs/tl1cd/zRfsC53ujuYWZ+q++5Hwyb?=
 =?us-ascii?Q?fvVAqsiviPHv7z1K1x2Vdda6TEeH6S2rMjBjkvZHTVJSeVuwfs4+tcrLpECx?=
 =?us-ascii?Q?V3HeiAy7oTrEv7IGbFVzF+C7KcRSaAM2SUv6gsQ0a+iGwqBPcsLyqxwZ3dCH?=
 =?us-ascii?Q?7CuC57njt7PrfshTdkcNSU5G2vDOW2buKTZxe6F9NA8BhDn+ALD379YY08km?=
 =?us-ascii?Q?Npy4kpS1ZSQcvorw1Kk38j2qw55ljmZ0NTHktplOQN0f4sKdOQ6Qudf8nkM4?=
 =?us-ascii?Q?Ndjr9+CHNdCNQl/eN5Pqc6J76tiB9XKevtclW8DcWajvicHkxDvmfAV9oQ6/?=
 =?us-ascii?Q?WykblpQINY8vH87IkUbowuOC+RVsWg2P75oMch5v2sQKse4G5uWvEgHg5oHo?=
 =?us-ascii?Q?ALR0nlWwzLO21bn9UK1xSQipB//zA8WKE4DL0JsNmHlR8KYRB34ytvK2+ls4?=
 =?us-ascii?Q?w8ZZtNKSR0uSnvuG3VsPsiN0p4Wi/L56Lqt/GYJ6Bl58SO8A2OV8gL4hfQxF?=
 =?us-ascii?Q?cTFbreeXUQ160Nt9x4dbwL+4QckFmppuSqIsZ3xtQuc63FiQ+NpwvWpIgw/n?=
 =?us-ascii?Q?p0Al11hPivOjhWvEFAYq6AcMDRaqLEaKN+FOREWiQ6CCHlCZ6HrY5flgoIQd?=
 =?us-ascii?Q?qsjJAOm/9Q8JeueN2rctmsBL4GkuebsbN4eXwBijfAbXafq44Q4x9GyPdBxL?=
 =?us-ascii?Q?HorrrYJ/tn5I0Tv8rf7gmFnF1Gwgoa9Z6U1qsBQN/Ys9PH7YQBWH4k0wLqER?=
 =?us-ascii?Q?EtpcSiPuGCwTi/GkR6g69bcmlTyOOzzLUnkc9KXHwQImA2mNPANldwc3PIAs?=
 =?us-ascii?Q?1ytmZjp0RQeEwDUswEAULDJudNK/+SvQEHw5pT1en25CnrWqJwf/RUfu5z0U?=
 =?us-ascii?Q?NIbJWPXyIIP7CmHy6+EEtc2EwZCOIvNZU1Sw8bYkESR21uXdb6dbYY3bW9cV?=
 =?us-ascii?Q?ZmmyVgDY2Rz2mjCsDjTMf1LFth/trwHqzeyDGpj46YlT44Tm1EIl+x/8/b+y?=
 =?us-ascii?Q?T4bvEi1owVKwMAgyHXUrIJSEWMReQAr/YxRNRwlPMQ+d/5kYPfdqtvRAPQQY?=
 =?us-ascii?Q?kWmWrEhzYYWR9Zf8I/2LwYnjCWbIy+234kzcnayjyKBTeqaQSvoIrUEu5N/x?=
 =?us-ascii?Q?xoYTRZC2RUNO56usZwjOJ3Xg6iwgmPyci3b7yOmY0q02UDrefLlnVT97xyfm?=
 =?us-ascii?Q?bwrDsxQTRGpDnGXMdzRSo1mAb+1+GPViNtvykK01?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4a9ea4d-62d6-4d24-e89f-08db0816a035
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 07:49:07.4497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 52T72HI+k1c4VKZrgbWoZZ7MGyhRNB9OFQRaWOU/PKhx3Et+QT3kFLjIAGrHRAdgJ7sUVRlsW6ZUl94FqMJZnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5118
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
Cc: Cornelia Huck <cohuck@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>, daniel@ffwll.ch, kvm@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>, jhubbard@nvidia.com, Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Alex Williamson <alex.williamson@redhat.com>, mkoutny@suse.com, jgg@nvidia.com, hannes@cmpxchg.org, surenb@google.com, tjmercier@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Convert from accounting pages against locked_vm to accounting them to
pinned_vm. This allows struct vm_account to be used to track the
mm_struct used to charge the pages. A future change also uses this to
track a cgroup for controlling pinned pages.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
Cc: kvm@vger.kernel.org
---
 arch/powerpc/mm/book3s64/iommu_api.c | 30 ++++++++++++++++++-----------
 drivers/vfio/vfio_iommu_spapr_tce.c  | 16 ++++++++++-----
 2 files changed, 30 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/iommu_api.c b/arch/powerpc/mm/book3s64/iommu_api.c
index 7fcfba1..338b111 100644
--- a/arch/powerpc/mm/book3s64/iommu_api.c
+++ b/arch/powerpc/mm/book3s64/iommu_api.c
@@ -18,6 +18,7 @@
 #include <asm/mmu_context.h>
 #include <asm/pte-walk.h>
 #include <linux/mm_inline.h>
+#include <linux/vm_account.h>
 
 static DEFINE_MUTEX(mem_list_mutex);
 
@@ -30,6 +31,7 @@ struct mm_iommu_table_group_mem_t {
 	unsigned long used;
 	atomic64_t mapped;
 	unsigned int pageshift;
+	struct vm_account vm_account;
 	u64 ua;			/* userspace address */
 	u64 entries;		/* number of entries in hpas/hpages[] */
 	/*
@@ -62,20 +64,24 @@ static long mm_iommu_do_alloc(struct mm_struct *mm, unsigned long ua,
 	unsigned int pageshift;
 	unsigned long entry, chunk;
 
-	if (dev_hpa == MM_IOMMU_TABLE_INVALID_HPA) {
-		ret = account_locked_vm(mm, entries, true);
-		if (ret)
-			return ret;
-
-		locked_entries = entries;
-	}
-
 	mem = kzalloc(sizeof(*mem), GFP_KERNEL);
 	if (!mem) {
 		ret = -ENOMEM;
 		goto unlock_exit;
 	}
 
+	vm_account_init_current(&mem->vm_account);
+	if (dev_hpa == MM_IOMMU_TABLE_INVALID_HPA) {
+		ret = vm_account_pinned(&mem->vm_account, entries);
+		if (ret) {
+			vm_account_release(&mem->vm_account);
+			kfree(mem);
+			return ret;
+		}
+
+		locked_entries = entries;
+	}
+
 	if (dev_hpa != MM_IOMMU_TABLE_INVALID_HPA) {
 		mem->pageshift = __ffs(dev_hpa | (entries << PAGE_SHIFT));
 		mem->dev_hpa = dev_hpa;
@@ -175,10 +181,11 @@ static long mm_iommu_do_alloc(struct mm_struct *mm, unsigned long ua,
 	unpin_user_pages(mem->hpages, pinned);
 
 	vfree(mem->hpas);
-	kfree(mem);
 
 unlock_exit:
-	account_locked_vm(mm, locked_entries, false);
+	vm_unaccount_pinned(&mem->vm_account, locked_entries);
+	vm_account_release(&mem->vm_account);
+	kfree(mem);
 
 	return ret;
 }
@@ -229,6 +236,7 @@ static void mm_iommu_do_free(struct mm_iommu_table_group_mem_t *mem)
 
 	mm_iommu_unpin(mem);
 	vfree(mem->hpas);
+	vm_account_release(&mem->vm_account);
 	kfree(mem);
 }
 
@@ -279,7 +287,7 @@ long mm_iommu_put(struct mm_struct *mm, struct mm_iommu_table_group_mem_t *mem)
 unlock_exit:
 	mutex_unlock(&mem_list_mutex);
 
-	account_locked_vm(mm, unlock_entries, false);
+	vm_unaccount_pinned(&mem->vm_account, unlock_entries);
 
 	return ret;
 }
diff --git a/drivers/vfio/vfio_iommu_spapr_tce.c b/drivers/vfio/vfio_iommu_spapr_tce.c
index 60a50ce..454ccc4 100644
--- a/drivers/vfio/vfio_iommu_spapr_tce.c
+++ b/drivers/vfio/vfio_iommu_spapr_tce.c
@@ -21,6 +21,7 @@
 #include <linux/sched/mm.h>
 #include <linux/sched/signal.h>
 #include <linux/mm.h>
+#include <linux/vm_account.h>
 #include "vfio.h"
 
 #include <asm/iommu.h>
@@ -67,6 +68,7 @@ struct tce_container {
 	bool def_window_pending;
 	unsigned long locked_pages;
 	struct mm_struct *mm;
+	struct vm_account vm_account;
 	struct iommu_table *tables[IOMMU_TABLE_GROUP_MAX_TABLES];
 	struct list_head group_list;
 	struct list_head prereg_list;
@@ -82,6 +84,7 @@ static long tce_iommu_mm_set(struct tce_container *container)
 	BUG_ON(!current->mm);
 	container->mm = current->mm;
 	mmgrab(container->mm);
+	vm_account_init_current(&container->vm_account);
 
 	return 0;
 }
@@ -291,7 +294,7 @@ static int tce_iommu_enable(struct tce_container *container)
 		return ret;
 
 	locked = table_group->tce32_size >> PAGE_SHIFT;
-	ret = account_locked_vm(container->mm, locked, true);
+	ret = vm_account_pinned(&container->vm_accounnt, locked);
 	if (ret)
 		return ret;
 
@@ -310,7 +313,7 @@ static void tce_iommu_disable(struct tce_container *container)
 	container->enabled = false;
 
 	BUG_ON(!container->mm);
-	account_locked_vm(container->mm, container->locked_pages, false);
+	vm_account_pinned(&container->vm_account, container->locked_pages);
 }
 
 static void *tce_iommu_open(unsigned long arg)
@@ -372,8 +375,10 @@ static void tce_iommu_release(void *iommu_data)
 		WARN_ON(tce_iommu_prereg_free(container, tcemem));
 
 	tce_iommu_disable(container);
-	if (container->mm)
+	if (container->mm) {
 		mmdrop(container->mm);
+		vm_account_release(&container->vm_account);
+	}
 	mutex_destroy(&container->lock);
 
 	kfree(container);
@@ -619,7 +624,8 @@ static long tce_iommu_create_table(struct tce_container *container,
 	if (!table_size)
 		return -EINVAL;
 
-	ret = account_locked_vm(container->mm, table_size >> PAGE_SHIFT, true);
+	ret = vm_account_pinned(&container->vm_account,
+				table_size >> PAGE_SHIFT);
 	if (ret)
 		return ret;
 
@@ -638,7 +644,7 @@ static void tce_iommu_free_table(struct tce_container *container,
 	unsigned long pages = tbl->it_allocated_size >> PAGE_SHIFT;
 
 	iommu_tce_table_put(tbl);
-	account_locked_vm(container->mm, pages, false);
+	vm_unaccount_pinned(&container->vm_account, pages);
 }
 
 static long tce_iommu_create_window(struct tce_container *container,
-- 
git-series 0.9.1
