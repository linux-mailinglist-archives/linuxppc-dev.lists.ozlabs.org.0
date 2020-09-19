Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 074BB270B5E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 09:13:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bthl316kszDqwT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 17:13:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=huawei.com;
 envelope-from=jingxiangfeng@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BthjQ6qHLzDqsG
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 17:12:19 +1000 (AEST)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 064361527795F6012CE4;
 Sat, 19 Sep 2020 15:12:16 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Sat, 19 Sep 2020 15:12:07 +0800
From: Jing Xiangfeng <jingxiangfeng@huawei.com>
To: <paulus@ozlabs.org>, <mpe@ellerman.id.au>, <benh@kernel.crashing.org>
Subject: [PATCH] KVM: PPC: Book3S: Remove redundant initialization of variable
 ret
Date: Sat, 19 Sep 2020 15:12:30 +0800
Message-ID: <20200919071230.125798-1-jingxiangfeng@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, jingxiangfeng@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The variable ret is being initialized with '-ENOMEM' that is meaningless.
So remove it.

Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
---
 arch/powerpc/kvm/book3s_64_vio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_64_vio.c b/arch/powerpc/kvm/book3s_64_vio.c
index 1a529df0ab44..b277a75cd1be 100644
--- a/arch/powerpc/kvm/book3s_64_vio.c
+++ b/arch/powerpc/kvm/book3s_64_vio.c
@@ -283,7 +283,7 @@ long kvm_vm_ioctl_create_spapr_tce(struct kvm *kvm,
 	struct kvmppc_spapr_tce_table *siter;
 	struct mm_struct *mm = kvm->mm;
 	unsigned long npages, size = args->size;
-	int ret = -ENOMEM;
+	int ret;
 
 	if (!args->size || args->page_shift < 12 || args->page_shift > 34 ||
 		(args->offset + args->size > (ULLONG_MAX >> args->page_shift)))
-- 
2.17.1

