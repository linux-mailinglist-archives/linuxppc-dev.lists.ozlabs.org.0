Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC51E569E79
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 11:20:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdrVZ1mLTz3c6K
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 19:20:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=inspur.com (client-ip=210.51.61.248; helo=ssh248.corpemail.net; envelope-from=wangdeming@inspur.com; receiver=<UNKNOWN>)
Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdrV64n8Sz3c01
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 19:20:00 +1000 (AEST)
Received: from ([60.208.111.195])
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id CIB00150;
        Thu, 07 Jul 2022 17:19:50 +0800
Received: from localhost.localdomain (10.200.104.82) by
 jtjnmail201611.home.langchao.com (10.100.2.11) with Microsoft SMTP Server id
 15.1.2507.9; Thu, 7 Jul 2022 17:19:51 +0800
From: Deming Wang <wangdeming@inspur.com>
To: <mpe@ellerman.id.au>
Subject: [PATCH] KVM: PPC: Use the arg->size directly for kvm_vm_ioctl_create_spapr_tce
Date: Sun, 3 Jul 2022 13:29:32 -0400
Message-ID: <20220703172932.11329-1-wangdeming@inspur.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.200.104.82]
tUid: 20227071719503b43df983e69e9535cfd506721407631
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
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
Cc: Deming Wang <wangdeming@inspur.com>, paulus@samba.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use arg->size directly may be better for code readability.Because, the
variable of size has not been found for special purpose  at present.
Also,We can reduce the use of a variable.

Signed-off-by: Deming Wang <wangdeming@inspur.com>
---
 arch/powerpc/kvm/book3s_64_vio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_vio.c b/arch/powerpc/kvm/book3s_64_vio.c
index d6589c4fe889..5f74ffb88e82 100644
--- a/arch/powerpc/kvm/book3s_64_vio.c
+++ b/arch/powerpc/kvm/book3s_64_vio.c
@@ -294,14 +294,14 @@ long kvm_vm_ioctl_create_spapr_tce(struct kvm *kvm,
 	struct kvmppc_spapr_tce_table *stt = NULL;
 	struct kvmppc_spapr_tce_table *siter;
 	struct mm_struct *mm = kvm->mm;
-	unsigned long npages, size = args->size;
+	unsigned long npages;
 	int ret;
 
 	if (!args->size || args->page_shift < 12 || args->page_shift > 34 ||
 		(args->offset + args->size > (ULLONG_MAX >> args->page_shift)))
 		return -EINVAL;
 
-	npages = kvmppc_tce_pages(size);
+	npages = kvmppc_tce_pages(args->size);
 	ret = account_locked_vm(mm, kvmppc_stt_pages(npages), true);
 	if (ret)
 		return ret;
@@ -314,7 +314,7 @@ long kvm_vm_ioctl_create_spapr_tce(struct kvm *kvm,
 	stt->liobn = args->liobn;
 	stt->page_shift = args->page_shift;
 	stt->offset = args->offset;
-	stt->size = size;
+	stt->size = args->size;
 	stt->kvm = kvm;
 	mutex_init(&stt->alloc_lock);
 	INIT_LIST_HEAD_RCU(&stt->iommu_tables);
-- 
2.27.0

