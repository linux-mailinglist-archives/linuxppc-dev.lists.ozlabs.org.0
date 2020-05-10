Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BD41CC6F9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 May 2020 07:18:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49KXQs2xX9zDqlQ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 May 2020 15:18:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=ZQroANp8; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49KXNF1gBjzDqFm
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 May 2020 15:16:13 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id z80so803176qka.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 09 May 2020 22:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eZQOBtTOiht/0OTixgCTPb48WYjmKFlAenmS+UqHqNA=;
 b=ZQroANp8fgUbLE8O4nFaXlsn7+z6JZjkWLsveqku+AYSLiUyGrfjpC2D7qEkXrb0nV
 T1EgclBvDaia3VA+43Ew95hkDX2T6KgjVwcCfslouE+D1RS7CLU7qWtdj1yOiqASSZVW
 m477xibSv/upulyLQtawU1erZ0Ths74iNxOsBZhfdKWwn2g7EioloXZwbH61oI2q3B1x
 wwCYrnVj3QN+D2gJYSRxT8ofiSkYD8J/qMwawq6ciCszISikJhlxzwAFnmr6D+Z3IB2F
 MOrLayOAYJzfUxBysfxc/aLCiXqc/jRBWiyvWvURGPYrPv36G+atA+WWIhcGhKSFKUq9
 fniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eZQOBtTOiht/0OTixgCTPb48WYjmKFlAenmS+UqHqNA=;
 b=G2DHIjPyFh1Uf1SQmX1sKmAB4VYyF+81naDauOGvJDL4o+k5nCxsQyoV8U5+DsVG/D
 21Wf5qHRdG/kx7gIqijZrgZEyJ01to1W1ZsjT7jYnjJzhOKhp6rSROzKlH0B9RJbZOCN
 gRoU1iGhQVGfOXKuNDH0vlxYCnNpZ4KyUXdrgDM6Df7HEU0nGbqRk5ZkoHNyC6Suff5c
 YME8Y5JI6ryRrFOSSyxnuD3DeQgSQjEWsxvaGMbRkps+Jq+/jtj4VO/npYrp9ebBl1N0
 5z+5IeAVexUhc5tNSJ4z9l56gcHNvuYgaBC6Mi9MDHLndeGHHh/7Xb4A2WQ462d7G6lx
 NLEw==
X-Gm-Message-State: AGi0PuZGRUFEcd8nNZwstFhg7YtG5oAdkTi9OhSxmYfJznsY7um09mfs
 5x+kZ1J1frxUVPyibk1buL96mg==
X-Google-Smtp-Source: APiQypKtHcNmHWehOq6GSOMUk4uYVa07dxCSGKOqz6ZDcs8RxJ31wkL9eoYr3glZoE0oMzDU3ZNJug==
X-Received: by 2002:a37:4b02:: with SMTP id y2mr8924162qka.178.1589087769424; 
 Sat, 09 May 2020 22:16:09 -0700 (PDT)
Received: from ovpn-112-80.rdu2.redhat.com
 (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id 127sm5215177qkj.59.2020.05.09.22.16.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 09 May 2020 22:16:08 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/mm/book3s64/iommu: fix some RCU-list locks
Date: Sun, 10 May 2020 01:15:59 -0400
Message-Id: <20200510051559.1959-1-cai@lca.pw>
X-Mailer: git-send-email 2.21.0 (Apple Git-122.2)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: paulmck@kernel.org, aik@ozlabs.ru, linux-kernel@vger.kernel.org,
 paulus@samba.org, Qian Cai <cai@lca.pw>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It is safe to traverse mm->context.iommu_group_mem_list with either
mem_list_mutex or the RCU read lock held. Silence a few RCU-list false
positive warnings and fix a few missing RCU read locks.

 arch/powerpc/mm/book3s64/iommu_api.c:330 RCU-list traversed in non-reader section!!

 other info that might help us debug this:

 rcu_scheduler_active = 2, debug_locks = 1
 2 locks held by qemu-kvm/4305:
  #0: c000000bc3fe4d68 (&container->lock){+.+.}-{3:3}, at: tce_iommu_ioctl.part.9+0xc7c/0x1870 [vfio_iommu_spapr_tce]
  #1: c000000001501910 (mem_list_mutex){+.+.}-{3:3}, at: mm_iommu_get+0x50/0x190

 ====
 arch/powerpc/mm/book3s64/iommu_api.c:132 RCU-list traversed in non-reader section!!

 other info that might help us debug this:

 rcu_scheduler_active = 2, debug_locks = 1
 2 locks held by qemu-kvm/4305:
  #0: c000000bc3fe4d68 (&container->lock){+.+.}-{3:3}, at: tce_iommu_ioctl.part.9+0xc7c/0x1870 [vfio_iommu_spapr_tce]
  #1: c000000001501910 (mem_list_mutex){+.+.}-{3:3}, at: mm_iommu_do_alloc+0x120/0x5f0

 ====
 arch/powerpc/mm/book3s64/iommu_api.c:292 RCU-list traversed in non-reader section!!

 other info that might help us debug this:

 rcu_scheduler_active = 2, debug_locks = 1
 2 locks held by qemu-kvm/4312:
  #0: c000000ecafe23c8 (&vcpu->mutex){+.+.}-{3:3}, at: kvm_vcpu_ioctl+0xdc/0x950 [kvm]
  #1: c000000045e6c468 (&kvm->srcu){....}-{0:0}, at: kvmppc_h_put_tce+0x88/0x340 [kvm]

 ====
 arch/powerpc/mm/book3s64/iommu_api.c:424 RCU-list traversed in non-reader section!!

 other info that might help us debug this:

 rcu_scheduler_active = 2, debug_locks = 1
 2 locks held by qemu-kvm/4312:
  #0: c000000ecafe23c8 (&vcpu->mutex){+.+.}-{3:3}, at: kvm_vcpu_ioctl+0xdc/0x950 [kvm]
  #1: c000000045e6c468 (&kvm->srcu){....}-{0:0}, at: kvmppc_h_put_tce+0x88/0x340 [kvm]

Signed-off-by: Qian Cai <cai@lca.pw>
---
 arch/powerpc/mm/book3s64/iommu_api.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/iommu_api.c b/arch/powerpc/mm/book3s64/iommu_api.c
index fa05bbd1f682..bf0108b6f445 100644
--- a/arch/powerpc/mm/book3s64/iommu_api.c
+++ b/arch/powerpc/mm/book3s64/iommu_api.c
@@ -129,7 +129,8 @@ static long mm_iommu_do_alloc(struct mm_struct *mm, unsigned long ua,
 
 	mutex_lock(&mem_list_mutex);
 
-	list_for_each_entry_rcu(mem2, &mm->context.iommu_group_mem_list, next) {
+	list_for_each_entry_rcu(mem2, &mm->context.iommu_group_mem_list, next,
+				lockdep_is_held(&mem_list_mutex)) {
 		/* Overlap? */
 		if ((mem2->ua < (ua + (entries << PAGE_SHIFT))) &&
 				(ua < (mem2->ua +
@@ -289,6 +290,7 @@ struct mm_iommu_table_group_mem_t *mm_iommu_lookup(struct mm_struct *mm,
 {
 	struct mm_iommu_table_group_mem_t *mem, *ret = NULL;
 
+	rcu_read_lock();
 	list_for_each_entry_rcu(mem, &mm->context.iommu_group_mem_list, next) {
 		if ((mem->ua <= ua) &&
 				(ua + size <= mem->ua +
@@ -297,6 +299,7 @@ struct mm_iommu_table_group_mem_t *mm_iommu_lookup(struct mm_struct *mm,
 			break;
 		}
 	}
+	rcu_read_unlock();
 
 	return ret;
 }
@@ -327,7 +330,8 @@ struct mm_iommu_table_group_mem_t *mm_iommu_get(struct mm_struct *mm,
 
 	mutex_lock(&mem_list_mutex);
 
-	list_for_each_entry_rcu(mem, &mm->context.iommu_group_mem_list, next) {
+	list_for_each_entry_rcu(mem, &mm->context.iommu_group_mem_list, next,
+				lockdep_is_held(&mem_list_mutex)) {
 		if ((mem->ua == ua) && (mem->entries == entries)) {
 			ret = mem;
 			++mem->used;
@@ -421,6 +425,7 @@ bool mm_iommu_is_devmem(struct mm_struct *mm, unsigned long hpa,
 	struct mm_iommu_table_group_mem_t *mem;
 	unsigned long end;
 
+	rcu_read_lock();
 	list_for_each_entry_rcu(mem, &mm->context.iommu_group_mem_list, next) {
 		if (mem->dev_hpa == MM_IOMMU_TABLE_INVALID_HPA)
 			continue;
@@ -437,6 +442,7 @@ bool mm_iommu_is_devmem(struct mm_struct *mm, unsigned long hpa,
 			return true;
 		}
 	}
+	rcu_read_unlock();
 
 	return false;
 }
-- 
2.21.0 (Apple Git-122.2)

