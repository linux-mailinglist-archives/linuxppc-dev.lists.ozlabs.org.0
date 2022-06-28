Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9278155BF52
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 10:03:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXHCB6lSgz3dpB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 18:03:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru; envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXHBm11qvz2ypn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 18:02:38 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
	by ozlabs.ru (Postfix) with ESMTP id 91B8A80191;
	Tue, 28 Jun 2022 04:02:29 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel] KVM: PPC: Do not warn when userspace asked for too big TCE table
Date: Tue, 28 Jun 2022 18:02:28 +1000
Message-Id: <20220628080228.1508847-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Frederic Barrat <fbarrat@linux.ibm.com>, kvm@vger.kernel.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

KVM manages emulated TCE tables for guest LIOBNs by a two level table
which maps up to 128TiB with 16MB IOMMU pages (enabled in QEMU by default)
and MAX_ORDER=11 (the kernel's default). Note that the last level of
the table is allocated when actual TCE is updated.

However these tables are created via ioctl() on kvmfd and the userspace
can trigger WARN_ON_ONCE_GFP(order >= MAX_ORDER, gfp) in mm/page_alloc.c
and flood dmesg.

This adds __GFP_NOWARN.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---

We could probably switch to vmalloc() to allow even bigger
emulated tables which we do not really want the userspace
to create though.

---
 arch/powerpc/kvm/book3s_64_vio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_64_vio.c b/arch/powerpc/kvm/book3s_64_vio.c
index d6589c4fe889..40864373ef87 100644
--- a/arch/powerpc/kvm/book3s_64_vio.c
+++ b/arch/powerpc/kvm/book3s_64_vio.c
@@ -307,7 +307,7 @@ long kvm_vm_ioctl_create_spapr_tce(struct kvm *kvm,
 		return ret;
 
 	ret = -ENOMEM;
-	stt = kzalloc(struct_size(stt, pages, npages), GFP_KERNEL);
+	stt = kzalloc(struct_size(stt, pages, npages), GFP_KERNEL | __GFP_NOWARN);
 	if (!stt)
 		goto fail_acct;
 
-- 
2.30.2

