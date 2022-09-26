Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4EA5E993A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 08:05:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbXL84JVCz3cjK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 16:05:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=D3PnLS03;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.94.55; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=D3PnLS03;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2055.outbound.protection.outlook.com [40.107.94.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbXJm48W6z2xG9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 16:04:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q9a0qDLOkXc+vRJZ8JHpqGBq0hA9i1uM+UHQVgzXdiTTKfQnd4QLWBZzaIgcsxwTpXXTgIVVyG9wfQ9Bo9dpkN9WQQy9wOongwe+FK6iy2Ax2L2/sWjp82IAw4mmb3GyGP6cRqEsGNpwBjsefnkwAPEDSu4dZdsU8eA6wjMlW9VEjOrp8AFjxr4oKXsi7DjOiPD9dT9sahBc9g+HbtEP2T1YTM5KZT7Hfq/PCGIgeP/11fCqwTJl4+6Spc5w19QfT42NuJJwkcfO91y8RaQBPlApVFBZGNlw5Z9PP7y2ATNo8GsNAm6bTkiswZy1TteN0liL4pZxvB7QtkuPhRsu+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LGvSvQQ/8+uu6w02L6um8al9WzJumDDzompERUivXTw=;
 b=lOCkGakNQvdJoowLeSIRYAl59mgFZul8wUib636MbcFtho81aUJDU3j8LYYt3S8F4SDuCdESUR1XhLSY4xdxzgMeV2Yq1sJHZ8b5JdigYJ4p0ZvJBfhaVEdjEhfa5J2T2k0bVJRXWwDAjCUcFCUXHeuioyZcTs/Zh5FO8FUE+z9SxEnQi1qcrpMjVReHbmyTZeTiu6kRx8OBnrkf7domNw5GO+tVa5t+J1ORW7IU5gbdVlxfGVXeNTWM6By8LtqA7fNNR/SuFiPxZTsflBmInybnqXujehW7Ln8W5AOsRWWli1vxK5xDhYZA7fv7vt02+OzW25mI4dPKNehIf4bTbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGvSvQQ/8+uu6w02L6um8al9WzJumDDzompERUivXTw=;
 b=D3PnLS03ct5XWRM3mB9nbwltWuK2YEqWekH35kUtFhM3vE6lClckYMDGC0X2YAhEqF0qmhh1duHo1kzt4PAlWFuU3ft2txwUydT1gCmKs7yC6867kXGGGbzYspe1jbwU5ADNFph5htC20XitaP7CQQ+3vYONZHAEu2g2zwSlgrX6G6SVdOEnrpn61ZElHmIFJXQ85n6/2utTf303OEzAqDTvgjdYtaBG1ETlchBYNN39uC7dqc+4djuQFRMT35YWeagLEQv7dp6ZyJ8ASNs5cUP9Nm4/y+3GKYY56jsPkizDoaUHQeEey85hVuGUW7mOKIiXL7WKaxMeMpsU6Zd2GQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by MW4PR12MB7359.namprd12.prod.outlook.com (2603:10b6:303:219::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 06:04:11 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::ed0:a520:ac8e:9966]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::ed0:a520:ac8e:9966%6]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 06:04:11 +0000
From: Alistair Popple <apopple@nvidia.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 1/7] mm/memory.c: Fix race when faulting a device private page
Date: Mon, 26 Sep 2022 16:03:05 +1000
Message-Id: <af2ea89799b08e0a5e592df0da0dcb9a5bf8533b.1664171943.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.f15b25597fc3afd45b144df863eeca3b2c13f9f4.1664171943.git-series.apopple@nvidia.com>
References: <cover.f15b25597fc3afd45b144df863eeca3b2c13f9f4.1664171943.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY2PR01CA0002.ausprd01.prod.outlook.com
 (2603:10c6:1:14::14) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|MW4PR12MB7359:EE_
X-MS-Office365-Filtering-Correlation-Id: 644c8d92-d59b-4b20-c401-08da9f84eebd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	6+otxxHTOJwFxPWNTiHzsHaE2r08cvn5nKNmDAzwAbCKlIVSRBUtdbCQkNrWsn6Pp8tTbCgzRGJiMSuu83RAJ3h87gXARPfh21boNJWuLtHbnH1m8CA33Z3FkjeyKdzJS/pJm+2yi8eB+/3yBXlRPFyxqnFEFGAG3uJ7ReoIyXyjibGPTUM4l3ev3O6+6O7hMpceD2YyVLw9HB/eAHC7WBZq93b2Akdkdbma9qmtq2p2Y95gxyUXywOBeQ3fpIZy085YRynyaaTwCPU5bRoJ1xZlO0cU/2b8NdyrXa/MEu6PFsefcneX35iR3u470IEVqCy7xJVr0TJGOKwttHkqNF5SwNKPOCAY4uX8CecfZIWJJJ9J/ERqtWaHsCfAowy/r4a89ZPhTLNZTp/gCO2QRBax/2q6JAX5ZfntYVpwODRWX79/wCqMdqczFzKXem760ZpvELXpFJ+chBr/7vWe3EvpbjR4naRnIXVlKW+g4vv5eucbw2iUnUjfu3spIBvcdSXSSBqHlYcZfEWiiFISywsb4tfKflPv4JsWfniKeefVviIlBak/WNQPOiAX3FqFJ3FPqB8miu6YwBZxYpfwJdVP0Afr+E213arkU/eS2o1w+8fyiuz38Y/ePd0Ovah12nTmkQaWg7uwG3Xbk25KtmxwYcSI3TSjnVMw0F0xGz2+dZnVaN4RH6rOxcp3VVRSbDYIrfa/zozoOVI58t3ZmuhkXbj9wk0yHz5KBPNXYbiPFsTEDjYbuPu8kpzABhV6
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199015)(8936002)(86362001)(30864003)(7416002)(2906002)(5660300002)(83380400001)(6666004)(41300700001)(6512007)(186003)(107886003)(26005)(6506007)(478600001)(6486002)(2616005)(6916009)(66946007)(4326008)(66556008)(66476007)(8676002)(316002)(38100700002)(54906003)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?tz9ujepzHaYaNWsugqbbpDMkdx3W5jUGSpasJ4H5HEYVXra5PfO8ZZhnZ1xx?=
 =?us-ascii?Q?N+IPOfK/Xu0ZaInoGy83mgFJe67FcVRrKRjfDppPPWoBOu7senQLtaL2hCFm?=
 =?us-ascii?Q?gwn2gn5Pp5T9cBW007JKIPfFYtGY3DJCr+754Rb3bwOt5gY4nug1DqOJ03ID?=
 =?us-ascii?Q?3heU2jMOsRTNOxsrINdDvlTBQDIGRupsaV8UJmS8yl74BuauvrMve3UdPdY/?=
 =?us-ascii?Q?akB6PGitIufbmfbmWtUosBYlMtSw7HVL6V2GZ4qDZ9s3eYY7p6IZ+SgQa5ry?=
 =?us-ascii?Q?517x4cCN86gFWtFp7CiFS8pLHcx1JQ4gX4jCO5/OxgMg0OQJ500jkHnBDLgy?=
 =?us-ascii?Q?hu8Q6y46+y8UDU8wFtdU7uMLOBUJF/X228ItkZ27SQ5lKlEffAOONSv24rO6?=
 =?us-ascii?Q?IxkuOZoDVv3FyW6tOnlRa1+Rulc9ff0fWWHLXyRGx2zotBzuYF5yqdP9fsBb?=
 =?us-ascii?Q?hAtTPHVyFfxSMgHw7VSSPGEtuggWU19qNtSZT5utPRaFwXHVfZg+43cTBv9J?=
 =?us-ascii?Q?V5h/Z+L12JIOWRNysrmJzUTqg0yORncWrW1KuIo8odbV6605D7isp1Hn+J45?=
 =?us-ascii?Q?ivVHOfXSwkhhTtS4NNMsn6QYCpRNa/8pEBjefXXygUZpos5UAfCMtkCwAzaJ?=
 =?us-ascii?Q?7ifE4eMj9caifYRRPJV0LbaZRpxtqvT0t4tDB25pRT899WZk6q10O7o10iW0?=
 =?us-ascii?Q?ChR3PEkbJO9/Fobv9sNEh7YZOMJO7SWZ8ItjTSnIg14SNp1/ZLeN8Ah8s9YP?=
 =?us-ascii?Q?q8PxshBZNj4Zh43HAO9fWD2kpxUKPHxLkMT3aXUzenoKFWFSoMfr8sBK2yK+?=
 =?us-ascii?Q?4fkhHOiwHisknyeaSEKfG+aAV0IK84aMK7hp1CS2ZL33749PtUnQpa3qoZV7?=
 =?us-ascii?Q?u7Xg4kBfGcMOzMmJ7hK0D1vqJnYn6KaaxOSS0dbvPOMPkqtPTOuI370N5bx4?=
 =?us-ascii?Q?H7azc5DoIYXG15nsEXeUkaK8MXnQpsh9qDn3KYY+6GswmeZ1UR1+hy1wacA7?=
 =?us-ascii?Q?yeDenW2LYbaamu0N7JqxBSloupPo4W0tF0QoVUK8csnGxsBWMu9f96JK62dV?=
 =?us-ascii?Q?D2KR9iUNxR3WZLzN2xGCE5ZmjtswnRCHpJtMu8Vd3tzH0DycY5TrolfiW1Kh?=
 =?us-ascii?Q?oMXxk1o3gQi/xQ2VAn1/BDShLp/96oiV9TUyjUbemc/oiIthEgqEz2F6D7MV?=
 =?us-ascii?Q?7Ilh7X4qRDbgglJ9n2fzf4SY0Kge2aEEjurZKNodt96dlRqWL0JHcAUMOUkv?=
 =?us-ascii?Q?drOkXkZ/nuEW0fiDuFrINjCHW/7BdqiEo3rmsu7spBtsA3ItgDY5f8xFFJYI?=
 =?us-ascii?Q?JglDR9+XAerMr75zSFEAOHvxGAQLlnZ6oHlsSv/XhjTz3hvcjBUSW9Bh3BW4?=
 =?us-ascii?Q?1fna/G+fd9hqmBuh4RqSkw5jpS/dfqa+tmyhUiYAnhxUGcNCNBodVg3mBld8?=
 =?us-ascii?Q?pU0zQuvvbgYDvosHqYmcziAbkr5n1ooZhKi8wr4kQlquxKILc5lGahx8DQQI?=
 =?us-ascii?Q?WXMDL5iZzxvhDXrmKSY3EN+vsAvvIe35E6G6x5jy/Rq5c6/BJpeHPtyXPXHJ?=
 =?us-ascii?Q?IDNtBLaPlMWk6hemACG/mgXzwwjzFuM+hf04B2Vf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 644c8d92-d59b-4b20-c401-08da9f84eebd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 06:04:11.8134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6v/VJDy9tvPcl44UFM+qQ7L/+Np8pVRfJTfssFIQGBmiPDVr4mlmi2Dmxe5pLriPY/SEMyJoDZMXHubC665EMw==
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

When the CPU tries to access a device private page the migrate_to_ram()
callback associated with the pgmap for the page is called. However no
reference is taken on the faulting page. Therefore a concurrent
migration of the device private page can free the page and possibly the
underlying pgmap. This results in a race which can crash the kernel due
to the migrate_to_ram() function pointer becoming invalid. It also means
drivers can't reliably read the zone_device_data field because the page
may have been freed with memunmap_pages().

Close the race by getting a reference on the page while holding the ptl
to ensure it has not been freed. Unfortunately the elevated reference
count will cause the migration required to handle the fault to fail. To
avoid this failure pass the faulting page into the migrate_vma functions
so that if an elevated reference count is found it can be checked to see
if it's expected or not.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 arch/powerpc/kvm/book3s_hv_uvmem.c       | 15 ++++++-----
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 17 +++++++------
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 11 +++++---
 include/linux/migrate.h                  |  8 ++++++-
 lib/test_hmm.c                           |  7 ++---
 mm/memory.c                              | 16 +++++++++++-
 mm/migrate.c                             | 34 ++++++++++++++-----------
 mm/migrate_device.c                      | 18 +++++++++----
 9 files changed, 87 insertions(+), 41 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 5980063..d4eacf4 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -508,10 +508,10 @@ unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
 static int __kvmppc_svm_page_out(struct vm_area_struct *vma,
 		unsigned long start,
 		unsigned long end, unsigned long page_shift,
-		struct kvm *kvm, unsigned long gpa)
+		struct kvm *kvm, unsigned long gpa, struct page *fault_page)
 {
 	unsigned long src_pfn, dst_pfn = 0;
-	struct migrate_vma mig;
+	struct migrate_vma mig = { 0 };
 	struct page *dpage, *spage;
 	struct kvmppc_uvmem_page_pvt *pvt;
 	unsigned long pfn;
@@ -525,6 +525,7 @@ static int __kvmppc_svm_page_out(struct vm_area_struct *vma,
 	mig.dst = &dst_pfn;
 	mig.pgmap_owner = &kvmppc_uvmem_pgmap;
 	mig.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
+	mig.fault_page = fault_page;
 
 	/* The requested page is already paged-out, nothing to do */
 	if (!kvmppc_gfn_is_uvmem_pfn(gpa >> page_shift, kvm, NULL))
@@ -580,12 +581,14 @@ static int __kvmppc_svm_page_out(struct vm_area_struct *vma,
 static inline int kvmppc_svm_page_out(struct vm_area_struct *vma,
 				      unsigned long start, unsigned long end,
 				      unsigned long page_shift,
-				      struct kvm *kvm, unsigned long gpa)
+				      struct kvm *kvm, unsigned long gpa,
+				      struct page *fault_page)
 {
 	int ret;
 
 	mutex_lock(&kvm->arch.uvmem_lock);
-	ret = __kvmppc_svm_page_out(vma, start, end, page_shift, kvm, gpa);
+	ret = __kvmppc_svm_page_out(vma, start, end, page_shift, kvm, gpa,
+				fault_page);
 	mutex_unlock(&kvm->arch.uvmem_lock);
 
 	return ret;
@@ -736,7 +739,7 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma,
 		bool pagein)
 {
 	unsigned long src_pfn, dst_pfn = 0;
-	struct migrate_vma mig;
+	struct migrate_vma mig = { 0 };
 	struct page *spage;
 	unsigned long pfn;
 	struct page *dpage;
@@ -994,7 +997,7 @@ static vm_fault_t kvmppc_uvmem_migrate_to_ram(struct vm_fault *vmf)
 
 	if (kvmppc_svm_page_out(vmf->vma, vmf->address,
 				vmf->address + PAGE_SIZE, PAGE_SHIFT,
-				pvt->kvm, pvt->gpa))
+				pvt->kvm, pvt->gpa, vmf->page))
 		return VM_FAULT_SIGBUS;
 	else
 		return 0;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index b059a77..776448b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -409,7 +409,7 @@ svm_migrate_vma_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
 	uint64_t npages = (end - start) >> PAGE_SHIFT;
 	struct kfd_process_device *pdd;
 	struct dma_fence *mfence = NULL;
-	struct migrate_vma migrate;
+	struct migrate_vma migrate = { 0 };
 	unsigned long cpages = 0;
 	dma_addr_t *scratch;
 	void *buf;
@@ -668,7 +668,7 @@ svm_migrate_copy_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
 static long
 svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
 		       struct vm_area_struct *vma, uint64_t start, uint64_t end,
-		       uint32_t trigger)
+		       uint32_t trigger, struct page *fault_page)
 {
 	struct kfd_process *p = container_of(prange->svms, struct kfd_process, svms);
 	uint64_t npages = (end - start) >> PAGE_SHIFT;
@@ -676,7 +676,7 @@ svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
 	unsigned long cpages = 0;
 	struct kfd_process_device *pdd;
 	struct dma_fence *mfence = NULL;
-	struct migrate_vma migrate;
+	struct migrate_vma migrate = { 0 };
 	dma_addr_t *scratch;
 	void *buf;
 	int r = -ENOMEM;
@@ -699,6 +699,7 @@ svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
 
 	migrate.src = buf;
 	migrate.dst = migrate.src + npages;
+	migrate.fault_page = fault_page;
 	scratch = (dma_addr_t *)(migrate.dst + npages);
 
 	kfd_smi_event_migration_start(adev->kfd.dev, p->lead_thread->pid,
@@ -766,7 +767,7 @@ svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
  * 0 - OK, otherwise error code
  */
 int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm,
-			    uint32_t trigger)
+			    uint32_t trigger, struct page *fault_page)
 {
 	struct amdgpu_device *adev;
 	struct vm_area_struct *vma;
@@ -807,7 +808,8 @@ int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm,
 		}
 
 		next = min(vma->vm_end, end);
-		r = svm_migrate_vma_to_ram(adev, prange, vma, addr, next, trigger);
+		r = svm_migrate_vma_to_ram(adev, prange, vma, addr, next, trigger,
+			fault_page);
 		if (r < 0) {
 			pr_debug("failed %ld to migrate prange %p\n", r, prange);
 			break;
@@ -851,7 +853,7 @@ svm_migrate_vram_to_vram(struct svm_range *prange, uint32_t best_loc,
 	pr_debug("from gpu 0x%x to gpu 0x%x\n", prange->actual_loc, best_loc);
 
 	do {
-		r = svm_migrate_vram_to_ram(prange, mm, trigger);
+		r = svm_migrate_vram_to_ram(prange, mm, trigger, NULL);
 		if (r)
 			return r;
 	} while (prange->actual_loc && --retries);
@@ -938,7 +940,8 @@ static vm_fault_t svm_migrate_to_ram(struct vm_fault *vmf)
 		goto out_unlock_prange;
 	}
 
-	r = svm_migrate_vram_to_ram(prange, mm, KFD_MIGRATE_TRIGGER_PAGEFAULT_CPU);
+	r = svm_migrate_vram_to_ram(prange, mm, KFD_MIGRATE_TRIGGER_PAGEFAULT_CPU,
+				vmf->page);
 	if (r)
 		pr_debug("failed %d migrate 0x%p [0x%lx 0x%lx] to ram\n", r,
 			 prange, prange->start, prange->last);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
index b3f0754..a5d7e6d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
@@ -43,7 +43,7 @@ enum MIGRATION_COPY_DIR {
 int svm_migrate_to_vram(struct svm_range *prange,  uint32_t best_loc,
 			struct mm_struct *mm, uint32_t trigger);
 int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm,
-			    uint32_t trigger);
+			    uint32_t trigger, struct page *fault_page);
 unsigned long
 svm_migrate_addr_to_pfn(struct amdgpu_device *adev, unsigned long addr);
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 11074cc..9139e5a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -2913,13 +2913,15 @@ svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
 				 */
 				if (prange->actual_loc)
 					r = svm_migrate_vram_to_ram(prange, mm,
-					   KFD_MIGRATE_TRIGGER_PAGEFAULT_GPU);
+					   KFD_MIGRATE_TRIGGER_PAGEFAULT_GPU,
+					   NULL);
 				else
 					r = 0;
 			}
 		} else {
 			r = svm_migrate_vram_to_ram(prange, mm,
-					KFD_MIGRATE_TRIGGER_PAGEFAULT_GPU);
+					KFD_MIGRATE_TRIGGER_PAGEFAULT_GPU,
+					NULL);
 		}
 		if (r) {
 			pr_debug("failed %d to migrate svms %p [0x%lx 0x%lx]\n",
@@ -3242,7 +3244,8 @@ svm_range_trigger_migration(struct mm_struct *mm, struct svm_range *prange,
 		return 0;
 
 	if (!best_loc) {
-		r = svm_migrate_vram_to_ram(prange, mm, KFD_MIGRATE_TRIGGER_PREFETCH);
+		r = svm_migrate_vram_to_ram(prange, mm,
+					KFD_MIGRATE_TRIGGER_PREFETCH, NULL);
 		*migrated = !r;
 		return r;
 	}
@@ -3303,7 +3306,7 @@ static void svm_range_evict_svm_bo_worker(struct work_struct *work)
 		mutex_lock(&prange->migrate_mutex);
 		do {
 			r = svm_migrate_vram_to_ram(prange, mm,
-						KFD_MIGRATE_TRIGGER_TTM_EVICTION);
+					KFD_MIGRATE_TRIGGER_TTM_EVICTION, NULL);
 		} while (!r && prange->actual_loc && --retries);
 
 		if (!r && prange->actual_loc)
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 22c0a0c..82ffa47 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -62,6 +62,8 @@ extern const char *migrate_reason_names[MR_TYPES];
 #ifdef CONFIG_MIGRATION
 
 extern void putback_movable_pages(struct list_head *l);
+int migrate_folio_extra(struct address_space *mapping, struct folio *dst,
+		struct folio *src, enum migrate_mode mode, int extra_count);
 int migrate_folio(struct address_space *mapping, struct folio *dst,
 		struct folio *src, enum migrate_mode mode);
 extern int migrate_pages(struct list_head *l, new_page_t new, free_page_t free,
@@ -212,6 +214,12 @@ struct migrate_vma {
 	 */
 	void			*pgmap_owner;
 	unsigned long		flags;
+
+	/*
+	 * Set to vmf->page if this is being called to migrate a page as part of
+	 * a migrate_to_ram() callback.
+	 */
+	struct page		*fault_page;
 };
 
 int migrate_vma_setup(struct migrate_vma *args);
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index e3965ca..89463ff 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -907,7 +907,7 @@ static int dmirror_migrate_to_system(struct dmirror *dmirror,
 	struct vm_area_struct *vma;
 	unsigned long src_pfns[64] = { 0 };
 	unsigned long dst_pfns[64] = { 0 };
-	struct migrate_vma args;
+	struct migrate_vma args = { 0 };
 	unsigned long next;
 	int ret;
 
@@ -968,7 +968,7 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 	unsigned long src_pfns[64] = { 0 };
 	unsigned long dst_pfns[64] = { 0 };
 	struct dmirror_bounce bounce;
-	struct migrate_vma args;
+	struct migrate_vma args = { 0 };
 	unsigned long next;
 	int ret;
 
@@ -1334,7 +1334,7 @@ static void dmirror_devmem_free(struct page *page)
 
 static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 {
-	struct migrate_vma args;
+	struct migrate_vma args = { 0 };
 	unsigned long src_pfns = 0;
 	unsigned long dst_pfns = 0;
 	struct page *rpage;
@@ -1357,6 +1357,7 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 	args.dst = &dst_pfns;
 	args.pgmap_owner = dmirror->mdevice;
 	args.flags = dmirror_select_device(dmirror);
+	args.fault_page = vmf->page;
 
 	if (migrate_vma_setup(&args))
 		return VM_FAULT_SIGBUS;
diff --git a/mm/memory.c b/mm/memory.c
index b994784..65d3977 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3742,7 +3742,21 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 			ret = remove_device_exclusive_entry(vmf);
 		} else if (is_device_private_entry(entry)) {
 			vmf->page = pfn_swap_entry_to_page(entry);
-			ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
+			vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd,
+					vmf->address, &vmf->ptl);
+			if (unlikely(!pte_same(*vmf->pte, vmf->orig_pte))) {
+				spin_unlock(vmf->ptl);
+				goto out;
+			}
+
+			/*
+			 * Get a page reference while we know the page can't be
+			 * freed.
+			 */
+			get_page(vmf->page);
+			pte_unmap_unlock(vmf->pte, vmf->ptl);
+			vmf->page->pgmap->ops->migrate_to_ram(vmf);
+			put_page(vmf->page);
 		} else if (is_hwpoison_entry(entry)) {
 			ret = VM_FAULT_HWPOISON;
 		} else if (is_swapin_error_entry(entry)) {
diff --git a/mm/migrate.c b/mm/migrate.c
index ce6a58f..e3f78a7 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -620,6 +620,25 @@ EXPORT_SYMBOL(folio_migrate_copy);
  *                    Migration functions
  ***********************************************************/
 
+int migrate_folio_extra(struct address_space *mapping, struct folio *dst,
+		struct folio *src, enum migrate_mode mode, int extra_count)
+{
+	int rc;
+
+	BUG_ON(folio_test_writeback(src));	/* Writeback must be complete */
+
+	rc = folio_migrate_mapping(mapping, dst, src, extra_count);
+
+	if (rc != MIGRATEPAGE_SUCCESS)
+		return rc;
+
+	if (mode != MIGRATE_SYNC_NO_COPY)
+		folio_migrate_copy(dst, src);
+	else
+		folio_migrate_flags(dst, src);
+	return MIGRATEPAGE_SUCCESS;
+}
+
 /**
  * migrate_folio() - Simple folio migration.
  * @mapping: The address_space containing the folio.
@@ -635,20 +654,7 @@ EXPORT_SYMBOL(folio_migrate_copy);
 int migrate_folio(struct address_space *mapping, struct folio *dst,
 		struct folio *src, enum migrate_mode mode)
 {
-	int rc;
-
-	BUG_ON(folio_test_writeback(src));	/* Writeback must be complete */
-
-	rc = folio_migrate_mapping(mapping, dst, src, 0);
-
-	if (rc != MIGRATEPAGE_SUCCESS)
-		return rc;
-
-	if (mode != MIGRATE_SYNC_NO_COPY)
-		folio_migrate_copy(dst, src);
-	else
-		folio_migrate_flags(dst, src);
-	return MIGRATEPAGE_SUCCESS;
+	return migrate_folio_extra(mapping, dst, src, mode, 0);
 }
 EXPORT_SYMBOL(migrate_folio);
 
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 7235424..f756c00 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -313,14 +313,14 @@ static void migrate_vma_collect(struct migrate_vma *migrate)
  * folio_migrate_mapping(), except that here we allow migration of a
  * ZONE_DEVICE page.
  */
-static bool migrate_vma_check_page(struct page *page)
+static bool migrate_vma_check_page(struct page *page, struct page *fault_page)
 {
 	/*
 	 * One extra ref because caller holds an extra reference, either from
 	 * isolate_lru_page() for a regular page, or migrate_vma_collect() for
 	 * a device page.
 	 */
-	int extra = 1;
+	int extra = 1 + (page == fault_page);
 
 	/*
 	 * FIXME support THP (transparent huge page), it is bit more complex to
@@ -393,7 +393,8 @@ static void migrate_vma_unmap(struct migrate_vma *migrate)
 		if (folio_mapped(folio))
 			try_to_migrate(folio, 0);
 
-		if (page_mapped(page) || !migrate_vma_check_page(page)) {
+		if (page_mapped(page) ||
+		    !migrate_vma_check_page(page, migrate->fault_page)) {
 			if (!is_zone_device_page(page)) {
 				get_page(page);
 				putback_lru_page(page);
@@ -505,6 +506,8 @@ int migrate_vma_setup(struct migrate_vma *args)
 		return -EINVAL;
 	if (!args->src || !args->dst)
 		return -EINVAL;
+	if (args->fault_page && !is_device_private_page(args->fault_page))
+		return -EINVAL;
 
 	memset(args->src, 0, sizeof(*args->src) * nr_pages);
 	args->cpages = 0;
@@ -735,8 +738,13 @@ void migrate_vma_pages(struct migrate_vma *migrate)
 			continue;
 		}
 
-		r = migrate_folio(mapping, page_folio(newpage),
-				page_folio(page), MIGRATE_SYNC_NO_COPY);
+		if (migrate->fault_page == page)
+			r = migrate_folio_extra(mapping, page_folio(newpage),
+						page_folio(page),
+						MIGRATE_SYNC_NO_COPY, 1);
+		else
+			r = migrate_folio(mapping, page_folio(newpage),
+					page_folio(page), MIGRATE_SYNC_NO_COPY);
 		if (r != MIGRATEPAGE_SUCCESS)
 			migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
 	}
-- 
git-series 0.9.1
