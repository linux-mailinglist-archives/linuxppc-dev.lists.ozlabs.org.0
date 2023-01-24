Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8E867904F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 06:48:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1GHG5XvNz3c7S
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 16:48:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rgnlu9rL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.93.78; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rgnlu9rL;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1GGL6TbCz3c6l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 16:47:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6WFpM+KGgVXCLK3CDkMqEyxAZeHDHBmj4F6eNRNycTGGJefFOz78c1+kmsG/nX3X8J8nVCQ/5XRUFJUJqu25gYNhBwVgBIhwFSrZ6/jR6OZ7BjOgyzzBXpS4NxEaWykgIPhj+5fbXAzTpOvQUJ88NeyPBSVAf8VC5Ya5o4vOKpzHjbf14WatO09CtGcoZcfZ7c2HJO//kOwiRzWI2Xyy/vesE4BtG2+pxP1/i6Pad9mzBexcR+cqoSq9jPUQdvAhaWtgqTAESiT6gxNhLInO5yCIee4ziqsz+ydQ6h7Hvhcma5fjNy6v1EnRvdZswUmcQ2De2N6dhJZk4MQ5Zs/Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OiXAsGxFz4TnMqFpYvIEfO7AjQpGiup8ce6UITBOatk=;
 b=R68VTLlUoRb/Or4yD471LhxYYBM99AXZWMElK1NEJDnpE3oN1QL6b/owl262A+Ow232Vbwd8odvoxxSA00gBN1kRZpL2j5PnGJCKVNrX7fGEoI67V3CMlwj3jU2j9AGLRHxYzE7P2Os8KGwcuFIjVln375S4sLyr3eyvXvfFwaMrLf8787HrxBRbA33hklRL3LUsDezVAmaqOJBXHK8sfdPjAInIES8p8bhvM2dMf344ywH0Zv5qWkvMTlcl/jWWBN6AHSf+CcHvcSQt4sNlf3D2VaI0y4rlbM2ZQGIB0VJMZhudMX8ayvu0v9Hq4Z+NM1PkMdF9Xx5ilnXH1FhuTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OiXAsGxFz4TnMqFpYvIEfO7AjQpGiup8ce6UITBOatk=;
 b=rgnlu9rLsxAYDcNmduxLEEeqHjkqyJS3VwgYTl7/AIDwfxlMSrj0wUWbB1hiNextRggFqomxQobZDTBP2aMhutu2VibNwARNt+b9Q7eMFhFJNMF9x+umjhMmRbG0FWe3HZ/YsLqRo2dBeFb7A3nzM9TE9FhPlqZ3CSRVYLdkksCs7Ty7EtoaZj2xPj6VvEE4/aJOTT9ibTj++8gnvdY+Sdyq/N0iN+4VhT5kxl3iAoydB+HNzwr0qDA5wQY6ZSys/hCtULqLO53ik4/AMCK03iWoGPL6Uqe/9aDpLpycnuwThsGaBx1cuZljMspBJmO5B/rHUR0Qr8sCNB1gSmTpVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by PH7PR12MB7793.namprd12.prod.outlook.com (2603:10b6:510:270::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 05:47:35 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::465a:6564:6198:2f4e]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::465a:6564:6198:2f4e%4]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 05:47:35 +0000
From: Alistair Popple <apopple@nvidia.com>
To: linux-mm@kvack.org,
	cgroups@vger.kernel.org
Subject: [RFC PATCH 12/19] kvm/book3s_64_vio: Convert account_locked_vm() to vm_account_pinned()
Date: Tue, 24 Jan 2023 16:42:41 +1100
Message-Id: <3ef4b18a0ff174fcb2c81f8fafe900b43216d473.1674538665.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.f52b9eb2792bccb8a9ecd6bc95055705cfe2ae03.1674538665.git-series.apopple@nvidia.com>
References: <cover.f52b9eb2792bccb8a9ecd6bc95055705cfe2ae03.1674538665.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0119.ausprd01.prod.outlook.com
 (2603:10c6:10:1b8::13) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|PH7PR12MB7793:EE_
X-MS-Office365-Filtering-Correlation-Id: a789dbd8-c67b-47ea-db4c-08dafdce7e42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	m3GfK3j4uYELDri/PZKP/QDb+cu8xfOpruywf9pGT78/nwH69NjtTkVZooEbnWZiKxFqCtAhXjLY11r0iP9FHPnmknNOjTctPIlfhASk2aLkBzc2d0pBV1Oo/ykUjlLUXAPuOZSavf7g5pHHZInMEOuotllMKhKfu8wyVqNk/X/UpQPrZMX75W04yw3zMSjOOPPV/2oL/ZOFeBVD4S5BFuRfQj2V95IhiU4+X2cHEGak8YXq8yxD0HsX21paTdNizAplRu/XD/d5pRbHCLgaKA82eI2lajEGBC4OPG+077TAAmZzW22nrzN8NTDAf0WGBj1qo7lDKgqql22IvvjEDVsOB+/hwh25fWeHYf2ijwHuYXMv6TLopA5wylD0zdMzylwTmX9LJPX0wYt1KFQmkXrLigQ8EInx2TGavklWtoQpVq8SVsazALz7kZeWhv8EZBKfKrh/da2yNXwAcmlYE6h2viz/ASpuKSbdAbu9VRw2/9Iph580Jpqie3Rd9u34gUDa3/Q9LZ4wcSDeLbQ5YWdJj0A+uL/sGzepcbVufraiU/G919apFwCBa22MXfTxh9iWkDN0idoxD6tjXg38JvhCM+H7Ba+64++CuC2vafCTriNTI8p/FXYS4fryMjIZ4/ivuIj8cimLsvq0V00pu/KI9HyRdMjddVYkd8gS9QHcTsWcB904/38XoS9JUzHOPQm36eXWoq27/3it9Rcylw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(366004)(376002)(39860400002)(451199015)(36756003)(316002)(4326008)(66556008)(66476007)(8676002)(86362001)(66946007)(186003)(54906003)(26005)(6512007)(6506007)(6666004)(83380400001)(6486002)(478600001)(2616005)(7416002)(5660300002)(8936002)(41300700001)(2906002)(15650500001)(38100700002)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?CYyHDDtdLOQb90LzVyUY4UE/9cWsAcZfB7PLijN5t8usFmfF6v5c4pv9/s13?=
 =?us-ascii?Q?oeP1swBWQJqpzxI0mOa8meFAHe7w30T7z4CfiQBE46Ym0WGEUqYq+ebIBboQ?=
 =?us-ascii?Q?xwpyGcvwEc/dIyHnKibvMMUX5xscg7x+ab6TQEdPsr2QVl+UZvv5T8xrjdi8?=
 =?us-ascii?Q?G4HGN21bIjwIHMLfseMLLu/P4zQ4CGCtUzuzEdBNV+Goe0Hvpw1Rc5LxXFit?=
 =?us-ascii?Q?UIcvX4ECyWw7RqevA59iYEOpqV5on+ZA7dWMDR75vL+n+UAuOHkD6SA9UiGS?=
 =?us-ascii?Q?TMGlwSX1HY4cN8Mf0lcG31aX4mBbj9czgxNwxdQi0JHwNiaNBU9zPwuO/XdN?=
 =?us-ascii?Q?fVZ5Y917SzYjVdJUO95onCn4LTIEXBWQpwVxLrd+Niis9l6nCecgTpkgdFZL?=
 =?us-ascii?Q?ieLs/6SSW0qQyFMzCnQNiK9sja4j9USoEE3A5nrQafVO1K59SCrgGCyZIHsR?=
 =?us-ascii?Q?CMQUSu1w2yk/dJcN6oyOkOpYSUpTwn4BBmwEVR0o4UAoJs1N39WiEE/+4CUl?=
 =?us-ascii?Q?cbbA5ajvHkfagVX9+tgGYS0v3mrmh5idC58IGR6wkM1WmRRzk6AkFMk94PPf?=
 =?us-ascii?Q?BwtffHvaCR2LwMXTJc+nuVx4LWg+JDxIo0c2k4IImnAo5I2IhsUkOAECjES2?=
 =?us-ascii?Q?tw1ZEJTzVIivRYL3jqN8YfnhUQX/rrwYFKn9ol638j80Aop6Jxm+UG/LwCn/?=
 =?us-ascii?Q?IXhgyKWkNt71xU96GRPr0fS3SQR43PGmN0R6FcY0BGO6knyZq7hLfEobmyh1?=
 =?us-ascii?Q?O/+q4lYFps06BGXPilCyLbsSZrovNMBS7Wnbv6ahnCJ0IlQhGpAcfXwUU7Vh?=
 =?us-ascii?Q?+rvE5dc5PPIG+gWS1OpfvyFaU5G3f+5sWpfrAYXkSzhebRG0LgAu//5sFHGQ?=
 =?us-ascii?Q?+996PJsYWfVjAenIN8/TbBWF3t8R0EZbxRER05oUkl7zaHEY6RZQeAZWnDq+?=
 =?us-ascii?Q?vtnApWiEfOqcFTveMcQQymKhZ5j+XM55HMxbcqDeqZKeEd+ZI899rJGnjyMP?=
 =?us-ascii?Q?17rsZWAn/tiMm5LLCjj0uj/y0YQStGJ5YB47WTO24cel1C3LyC0g4+ttMz6L?=
 =?us-ascii?Q?MKy7+RdNQIuMu3PSTiH+CpHjltrqB9nGv54ebtvWZ/qLVTMYqLcWJTW11HwI?=
 =?us-ascii?Q?/HoR8j0G2UthsLVmIvzFBUWMUu5hecsqSO8FA4y1LiQD0XsA8mr1C/oPBpWc?=
 =?us-ascii?Q?UMf6PN3cqKkQf54I7adepjCycJzJweymWze2drE64nsGwlBB4PIJm15NKOtJ?=
 =?us-ascii?Q?+aIpa/sNiKjsUlT4KTmEtZ3Qi6QbEjl7ixXWTMCbW/gBTGkcu7r/afSSuSnE?=
 =?us-ascii?Q?/HrV6JTCZOPc7pgpYYLrUUCjfWKe348NsCP0HY9OeNcW+/EPD+NGXJociqJV?=
 =?us-ascii?Q?akZkX4ICJCZ0cCWXea6ChWvz4KpZyi/vhkOJyf+/5nBGwwLj8LMypCc1akNo?=
 =?us-ascii?Q?LYeBsH6ry4sne1so4hF16or1LTx2y3WvMl5AJS4qxIPND7434xYmTgI8f1OG?=
 =?us-ascii?Q?Ov62C2sK1a6HTPZnmfvOOot0sRjVUjm+iYACFMLTbj3J7nBL6pBeSP+smya9?=
 =?us-ascii?Q?Hrx1CDnOKSxlOTikMLrHWugHyjKEV4HXojG4LDVL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a789dbd8-c67b-47ea-db4c-08dafdce7e42
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 05:47:35.1466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uSIxosOhyYnggBMrzxUpELFZCvLpxGU9zyZr5Jw4I8eeIkkwcbgdly1TteKS+fCCzoGIToCVbi3Q2ZvS2FdAGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7793
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
Cc: linuxppc-dev@lists.ozlabs.org, daniel@ffwll.ch, kvm@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>, jhubbard@nvidia.com, Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, mkoutny@suse.com, jgg@nvidia.com, hannes@cmpxchg.org, Paolo Bonzini <pbonzini@redhat.com>, surenb@google.com, tjmercier@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

book3s_64_vio currently accounts for pinned pages with
account_locked_vm() which charges the pages to mm->locked_vm. To make
this consistent with other drivers switch to using
vm_account_pinned().

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
Cc: kvm@vger.kernel.org
---
 arch/powerpc/kvm/book3s_64_vio.c | 10 +++++-----
 include/linux/kvm_host.h         |  1 +
 virt/kvm/kvm_main.c              |  3 +++
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_vio.c b/arch/powerpc/kvm/book3s_64_vio.c
index 95e738e..ecd1deb 100644
--- a/arch/powerpc/kvm/book3s_64_vio.c
+++ b/arch/powerpc/kvm/book3s_64_vio.c
@@ -273,8 +273,8 @@ static int kvm_spapr_tce_release(struct inode *inode, struct file *filp)
 		}
 	}
 
-	account_locked_vm(kvm->mm,
-		kvmppc_stt_pages(kvmppc_tce_pages(stt->size)), false);
+	vm_unaccount_pinned(&kvm->vm_account,
+		kvmppc_stt_pages(kvmppc_tce_pages(stt->size)));
 
 	kvm_put_kvm(stt->kvm);
 
@@ -301,8 +301,8 @@ long kvm_vm_ioctl_create_spapr_tce(struct kvm *kvm,
 		(args->offset + args->size > (ULLONG_MAX >> args->page_shift)))
 		return -EINVAL;
 
-	npages = kvmppc_tce_pages(args->size);
-	ret = account_locked_vm(mm, kvmppc_stt_pages(npages), true);
+	npages = kvmppc_tce_pages(size);
+	ret = vm_account_pinned(&kvm->vm_account, kvmppc_stt_pages(npages));
 	if (ret)
 		return ret;
 
@@ -347,7 +347,7 @@ long kvm_vm_ioctl_create_spapr_tce(struct kvm *kvm,
 
 	kfree(stt);
  fail_acct:
-	account_locked_vm(mm, kvmppc_stt_pages(npages), false);
+	vm_unaccount_pinned(&kvm->vm_account, kvmppc_stt_pages(npages));
 	return ret;
 }
 
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 4f26b24..25ed390 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -717,6 +717,7 @@ struct kvm {
 	 */
 	struct mutex slots_arch_lock;
 	struct mm_struct *mm; /* userspace tied to this vm */
+	struct vm_account vm_account;
 	unsigned long nr_memslot_pages;
 	/* The two memslot sets - active and inactive (per address space) */
 	struct kvm_memslots __memslots[KVM_ADDRESS_SPACE_NUM][2];
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 9c60384..770d037 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1142,6 +1142,7 @@ static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
 	KVM_MMU_LOCK_INIT(kvm);
 	mmgrab(current->mm);
 	kvm->mm = current->mm;
+	vm_account_init_current(&kvm->vm_account);
 	kvm_eventfd_init(kvm);
 	mutex_init(&kvm->lock);
 	mutex_init(&kvm->irq_lock);
@@ -1258,6 +1259,7 @@ static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
 out_err_no_srcu:
 	kvm_arch_free_vm(kvm);
 	mmdrop(current->mm);
+	vm_account_release(&kvm->vm_account);
 	module_put(kvm_chardev_ops.owner);
 	return ERR_PTR(r);
 }
@@ -1327,6 +1329,7 @@ static void kvm_destroy_vm(struct kvm *kvm)
 	preempt_notifier_dec();
 	hardware_disable_all();
 	mmdrop(mm);
+	vm_account_release(&kvm->vm_account);
 	module_put(kvm_chardev_ops.owner);
 }
 
-- 
git-series 0.9.1
