Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D32919C8B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 03:01:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VKZmzpLR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8gHN0FqNz79G7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 11:01:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VKZmzpLR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2416::601; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2416::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8g8t6S3Hz3fqV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2024 10:55:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPxmlkzGguSOeBKDSjRlRzBYZvyhX1o49Ivq8KTJ7Ma/7Ut58TLppylM6tt8hVIzCFbcImPcRMrmvovuEIIv5e65UCg+aasDzMVUpQRajXEAmdAh/3vQOWNCpiIseuqqXx1wuMuAeWa/+Ep5Sp4G455amvouNpn5S9GYyy9vpxs8Pm3tJvO5ZHh5W6/M3kbWiY3LeUShO79JOZUf5IYyQrCnx7wQJowDs8K5FTBlVlYmqVQo5AFyDSkLg/KuUJ70OLe14Pnnd9AefNdEMfVt4+e8+kOU+818gx+LV8ibnt7VFYWEn4oAUjd2Wh8Ag1pRUS098wM5GFQHuRy9HmQGnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ELGyXLM0Cq2wdznU6H0lBS0YOvX3MhPfm7JPiof8KDM=;
 b=iQE4IrJhzlHduQjlzroYjhFkfv8o797JsAH3ZgXdlYl4d7bh+llEltbbS74mNYai1LFOyJDiLyqQ4oQ5OiIsczjEVFQOFGPYI9yxF2wfmq0K0dZ3p77Rgx6Tgr2hwz7A0Vk+Jt0y3ZTFPGMqwv8Fl1A5z4pHUJ4IaSkapmEd/YFwTv8hRJ3Kbz62iAPyaAOew+L4zpa5YYRVA+2e5Y59cbospiGHgbhsq3tzVCt3bI+HpH4x+koFA7zMbV63VsDzlrl+asxU8xzzpKdsiywHYjY/54KdHGHF89EXXE4iLkNs895ghC3D5CXRYx+RQZN9o1nkmdoLQkgAxx5wxd+o5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ELGyXLM0Cq2wdznU6H0lBS0YOvX3MhPfm7JPiof8KDM=;
 b=VKZmzpLRDExQu/dLY9ZscPjy5gApBh7HORysMJ3miyM53jFhfzIENwMnbGJOEDBxBJ8SC9Sa6aYhokF7cgdwf/0ushUm4Ed6XB4aNsVDNkRlHwFdgsjMdYJx5MPwfDP/4y3uwV/5niar1+AAW257BAWR6is21WlPf8nUu/d2BPI/m+KeuhxWZpWe3xlliJEbCehoqZOwliaaRxRAD8LlH8BoUftF93fSy22uxiy0Vd6ezsoTKSeYgTBMCgEtGK42rHOsXRoS+XsjQCnaB6c611wCNbWG5lcISpoCbczWcTCtVsT5vOrxcgZ4hI6SBJ8nx+YsbtPGrUE1r+UxdE9K9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 MW6PR12MB7071.namprd12.prod.outlook.com (2603:10b6:303:238::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.32; Thu, 27 Jun 2024 00:55:15 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%6]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 00:55:15 +0000
From: Alistair Popple <apopple@nvidia.com>
To: dan.j.williams@intel.com,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	logang@deltatee.com,
	bhelgaas@google.com,
	jack@suse.cz,
	jgg@ziepe.ca
Subject: [PATCH 08/13] huge_memory: Allow mappings of PMD sized pages
Date: Thu, 27 Jun 2024 10:54:23 +1000
Message-ID: <eb7e3e2a64da5cfaaa990ec2d37200fadc81465a.1719386613.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.66009f59a7fe77320d413011386c3ae5c2ee82eb.1719386613.git-series.apopple@nvidia.com>
References: <cover.66009f59a7fe77320d413011386c3ae5c2ee82eb.1719386613.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0091.ausprd01.prod.outlook.com
 (2603:10c6:10:111::6) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|MW6PR12MB7071:EE_
X-MS-Office365-Filtering-Correlation-Id: bba96670-cd2a-4ae7-22f5-08dc9643ce36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?rMz4qfOllfl6MVcIcIJSn5oSOmaCRN+QV0HJlp5WBTuLHSmxyGHUE3KPTnit?=
 =?us-ascii?Q?8AOF4/Sn70E6wDhqujfbZxkdMaGBLnbA7CjG9HBDDcKffpyG4eAvSVt2wlMR?=
 =?us-ascii?Q?Om/OwjRESSNYZECvrC0HLkPxFmVBT9fb1yXXdsx+dZI2ZeTCqpOuZpPCMOwB?=
 =?us-ascii?Q?yPcLcyJ9XVkk8f/+zC2RdGYa6AET0pUuSIslPRswM2v4RER7hQ2Tu2M5Yzqt?=
 =?us-ascii?Q?uVBtF+zngV4nmvxjQxmjQaajr6AHnJbxfpAg0GJYgWEaYGL/V9U6ONjRbXsN?=
 =?us-ascii?Q?DJBU0cMEVGTsU7Fk3Nt5dWE0OS+p3ZzRZ/4kQ2YGnm+u8gFynYn8GPs/IdY0?=
 =?us-ascii?Q?JGpAIU0dXZbrV8kgEUaWVtku8MX+xCwobb7ba0dCmLglE9J+hiaDsf+F8pMQ?=
 =?us-ascii?Q?O6KLe0ryuO0w42UoYoPHovioO8Cen1Hm+2MaAmyLbMZyHeu1KMbdwsEjov8j?=
 =?us-ascii?Q?GEqhqm7V+ZSJvq410WOAR/LVkjKPcoxW9SSzUIvgsM6yJWI7irZPoT8agTZh?=
 =?us-ascii?Q?f1Qip6SP8EHyMUef0fIADLxGrZnCgL5edkhGLLc955VwWc+kc92Yr9PTJtlv?=
 =?us-ascii?Q?hSbjkBMMSqM9mtS/XcB9GPvWZ3cVUra4Z1Xqb7rMaiMYWfLPNGrB1kJf/Hn5?=
 =?us-ascii?Q?mVwzFr/hIdFFNKAJKPV6WEZSC3cEJNWylJLd5j5B7dwGFboh0YhJd+DcWdp/?=
 =?us-ascii?Q?K3x7PNjGEcGD6wAdk4ax3bRmTjANEIRgrXPRz4Wn6PYMj2isBV/cFy6Q9iGv?=
 =?us-ascii?Q?taGJTYavNbFfcivVRJMXTyma1TIGPAP9d7KvYP+MUS9j3fpWEmJfAN95FNob?=
 =?us-ascii?Q?8CV8MUyiMmhP/il4SWj9S+YrPdPlyJ6FWfdr9M+qvCxNHma+Cd+rwi7E/w+D?=
 =?us-ascii?Q?dHEnG5+n5izmdFX8G/5yqUeUvVvmHUQ6l8gt4CvtsjtWgZFEOXueZtlW7vuj?=
 =?us-ascii?Q?6KRwewqli0KjcS8V7jzbb7WSVKOIzU3ibpPD/87KCcwHEtCnGleYnJmYEzIJ?=
 =?us-ascii?Q?JY5SUOxa9y/0DqLtsKRus9hrNbwhss4OplS6hPkUfgPH76AyFD3hLdYvcLin?=
 =?us-ascii?Q?yi5WVNw+bL7ZbQAn+L58nTW/7bkpgIB66n/YFJQUyzX45ZKnAKRj+WOdL4m/?=
 =?us-ascii?Q?s6xwexdTQ8kZ9977QMZ3yasxmrcdstFnOCD6STEAoEjE5zd3MH0Rc2dheD1/?=
 =?us-ascii?Q?3Cc0+hBBGNQZor6xvqilEixDNproSRbnwRMCK2PVQFdrbl5xgbZ9ntCdfxOC?=
 =?us-ascii?Q?VnOhzdZ4HcubqMfm8g0yc3w4XD2dHu0jXNvlnk6ue4gu0TAg3yOCBXlWhSC9?=
 =?us-ascii?Q?egomegPk+FGZWQkEExfRbwMUBrJkVofq08li9XCg/qBjrQ=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?8dpcV1iU12kDyqeVQWbA3AwxyrevQihuWYk9QJhMeBaWOtnocqkHU6TkP5vp?=
 =?us-ascii?Q?jgB8AgQFXV377ForlLsHvPb5oHRJti9YhbfeFw3mF1CXn99NYNHD0M7fCdXp?=
 =?us-ascii?Q?sXp5ki3CJjrSAtYoaoigEBbqV7BFlrDLkkCVp40GiJ8Dz87lCPg5HNIbw/D3?=
 =?us-ascii?Q?m6osgrcMl6BjeKINf2Au31cDalT11/Zjj9K4pPR3BqajuuMS9DcRqNhGGBA8?=
 =?us-ascii?Q?I/8nqhhsPyJZq56xQQpQGuIu0nf0kVdM/NI6307xMQrT0ubrf8FPBJ8LGqdG?=
 =?us-ascii?Q?2TqCurtRPPxwONBTxG0FqKcSSzfhVk5tpgcZs1JyZh0EE7HFNaIo+9nr8KHM?=
 =?us-ascii?Q?L3RU63UzbvqQD0tm9JFCaSN0CL9E/H+Hp67RJftHWsc+fsZ1iPsxATa5ullY?=
 =?us-ascii?Q?+FDDZI5hnphDEf02UYtM2qOGwKBqIB2fl340bCYb92kh6zjTUr9kTrvThsur?=
 =?us-ascii?Q?sjyphh07ALezlVpShHTooenTHuNvO9JQrJMau516Zfz8AmkJq6SbCdNaM3Oo?=
 =?us-ascii?Q?5l05ZPSbcsnhYh0V3zR7IaJ1ff+oHxuZFrXGVXM+PTMYO21LguKYDkTx+478?=
 =?us-ascii?Q?sSFnXG7swPHjZSgbI6TvhwbBrfll9VZdTpTe9L2TIIxGL8u5LOhr+5XqrvJD?=
 =?us-ascii?Q?AC0TDKai57p6QPn2vGt7yKdPS0iI4jAk17YGqkLYNO8N7yr6HEVFZyD8QKgu?=
 =?us-ascii?Q?/B1ox99xbDtx/Jx+/S1TIDVjuBeJyGtTxKtkvAorOge4oFVsWOWmJ+5YD9L+?=
 =?us-ascii?Q?Gytg456gnWG4D9uuXhc7csOLnbkNCa8fpPoBVlfLZ+vjUQJw4R23OllnjY2j?=
 =?us-ascii?Q?w+KdWeC9jEP98qUyDHRkXYbpqMj95gJIx73/hJwEJ/yOz6xFcOONlNYjkvE7?=
 =?us-ascii?Q?rsO4MR7Hl9VJ8ujKVbNrYczRY1SG2oJ3DRTIZ27fJNTYuKDy39znfBL0Z9DR?=
 =?us-ascii?Q?srvEAqUURkyjvJnLyu2OGbCxpNPJns/+KuC0OzJs9owFCox8YEV+n+0ix2gV?=
 =?us-ascii?Q?e4QJp2BvrjjLLIgOkwtyePzZktBCa1fjPnEfF/wwsZKgakGVmuDxwXuHXwrR?=
 =?us-ascii?Q?wUJiBOFIu/1DO3y12wq5zVgL3T7u1+h45cVGXKkoHFmdDGYpkIaKA+K78+p3?=
 =?us-ascii?Q?EU+PD6SPzwGqV8NvVu2myUGUNER+Q4mTeUftX9O02EIlB0HnkPN7ldcApNTk?=
 =?us-ascii?Q?8qYDLh2r3+mxa6VMHlmIK0oE7qOoqQYnel63KjlBNNgCOohi8dT3QNqNiFzI?=
 =?us-ascii?Q?4at8hihOywcwAiR1OIhH2VTLXak4AyiOEVWBPY+P+xVvKWS6Eo7wEL9LTncx?=
 =?us-ascii?Q?zVKHZGhp7tRzf0v0+nz7TKuKizTw5cd4XEv7FOQT+sB7Gu8XMgbbxV5DmbQW?=
 =?us-ascii?Q?mloXPGONUwVvtOwtsXdYjG7eTTiXe0O9qkXFqrpuMnPHIGVc+gzseLJqn3E0?=
 =?us-ascii?Q?55lz9TulFwi22Vz4IWQWpTC/bo/h9zahF10rlLzXlbo80sjuvpeBwL2F5wOd?=
 =?us-ascii?Q?l9Bz3Mb3TlcrQ0Mqo0cRUDE6Nx95Sld0LYPIzMK73VUw52CqGFTpRE/NXp1W?=
 =?us-ascii?Q?vPsBsyhOHzScfQiE+6xOZYVJWs8dROHgUT5m33RS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bba96670-cd2a-4ae7-22f5-08dc9643ce36
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 00:55:14.9269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6uCbDxtUlB0klJGjloN6NA003Q5dpU0Ewjx4TLFfVzS0yT4d9Rm+IFvq9CH+xf2vUGJRyewEJBu0Ei9t/LSBEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7071
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
Cc: linmiaohe@huawei.com, nvdimm@lists.linux.dev, Alistair Popple <apopple@nvidia.com>, david@redhat.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com, david@fromorbit.com, peterx@redhat.com, linux-mm@kvack.org, will@kernel.org, hch@lst.de, linux-doc@vger.kernel.org, willy@infradead.org, djwong@kernel.org, linux-ext4@vger.kernel.org, ira.weiny@intel.com, jhubbard@nvidia.com, npiggin@gmail.com, linux-cxl@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tytso@mit.edu, linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently DAX folio/page reference counts are managed differently to
normal pages. To allow these to be managed the same as normal pages
introduce dax_insert_pfn_pmd. This will map the entire PMD-sized folio
and take references as it would for a normally mapped page.

This is distinct from the current mechanism, vmf_insert_pfn_pmd, which
simply inserts a special devmap PMD entry into the page table without
holding a reference to the page for the mapping.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 include/linux/huge_mm.h |  1 +-
 mm/huge_memory.c        | 70 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 71 insertions(+)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index b98a3cc..9207d8e 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -39,6 +39,7 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 
 vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write);
 vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write);
+vm_fault_t dax_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write);
 vm_fault_t dax_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write);
 
 enum transparent_hugepage_flag {
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index e1f053e..a9874ac 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1202,6 +1202,76 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write)
 }
 EXPORT_SYMBOL_GPL(vmf_insert_pfn_pmd);
 
+vm_fault_t dax_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write)
+{
+	struct vm_area_struct *vma = vmf->vma;
+	unsigned long addr = vmf->address & PMD_MASK;
+	pmd_t *pmd = vmf->pmd;
+	struct mm_struct *mm = vma->vm_mm;
+	pmd_t entry;
+	spinlock_t *ptl;
+	pgtable_t pgtable = NULL;
+	struct folio *folio;
+	struct page *page;
+
+	if (addr < vma->vm_start || addr >= vma->vm_end)
+		return VM_FAULT_SIGBUS;
+
+	if (arch_needs_pgtable_deposit()) {
+		pgtable = pte_alloc_one(vma->vm_mm);
+		if (!pgtable)
+			return VM_FAULT_OOM;
+	}
+
+	track_pfn_insert(vma, &vma->vm_page_prot, pfn);
+
+	ptl = pmd_lock(mm, pmd);
+	if (!pmd_none(*pmd)) {
+		if (write) {
+			if (pmd_pfn(*pmd) != pfn_t_to_pfn(pfn)) {
+				WARN_ON_ONCE(!is_huge_zero_pmd(*pmd));
+				goto out_unlock;
+			}
+			entry = pmd_mkyoung(*pmd);
+			entry = maybe_pmd_mkwrite(pmd_mkdirty(entry), vma);
+			if (pmdp_set_access_flags(vma, addr, pmd, entry, 1))
+				update_mmu_cache_pmd(vma, addr, pmd);
+		}
+
+		goto out_unlock;
+	}
+
+	entry = pmd_mkhuge(pfn_t_pmd(pfn, vma->vm_page_prot));
+	if (pfn_t_devmap(pfn))
+		entry = pmd_mkdevmap(entry);
+	if (write) {
+		entry = pmd_mkyoung(pmd_mkdirty(entry));
+		entry = maybe_pmd_mkwrite(entry, vma);
+	}
+
+	if (pgtable) {
+		pgtable_trans_huge_deposit(mm, pmd, pgtable);
+		mm_inc_nr_ptes(mm);
+		pgtable = NULL;
+	}
+
+	page = pfn_t_to_page(pfn);
+	folio = page_folio(page);
+	folio_get(folio);
+	folio_add_file_rmap_pmd(folio, page, vma);
+	add_mm_counter(mm, mm_counter_file(folio), HPAGE_PMD_NR);
+	set_pmd_at(mm, addr, pmd, entry);
+	update_mmu_cache_pmd(vma, addr, pmd);
+
+out_unlock:
+	spin_unlock(ptl);
+	if (pgtable)
+		pte_free(mm, pgtable);
+
+	return VM_FAULT_NOPAGE;
+}
+EXPORT_SYMBOL_GPL(dax_insert_pfn_pmd);
+
 #ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
 static pud_t maybe_pud_mkwrite(pud_t pud, struct vm_area_struct *vma)
 {
-- 
git-series 0.9.1
