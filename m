Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAB21F604C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 05:07:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49j81425mXzDqld
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 13:07:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (unknown [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 49j7zV48DkzDqjY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jun 2020 13:06:14 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 842FBAE80021;
 Wed, 10 Jun 2020 23:03:47 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel] KVM: PPC: Fix nested guest RC bits update
Date: Thu, 11 Jun 2020 13:05:59 +1000
Message-Id: <20200611030559.75257-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Before commit 6cdf30375f82 ("powerpc/kvm/book3s: Use kvm helpers
to walk shadow or secondary table") we called __find_linux_pte() with
a page table pointer from a kvm_nested_guest struct but
now we rely on kvmhv_find_nested() which takes an L1 LPID and returns
a kvm_nested_guest pointer, however we pass a L0 LPID there and
the L2 guest hangs.

This fixes the LPID passed to kvmppc_hv_handle_set_rc().

Fixes: 6cdf30375f82 ("powerpc/kvm/book3s: Use kvm helpers to walk shadow or secondary table")
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/kvm/book3s_hv_nested.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 99011f1b772a..f36f0a2993c0 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -1234,7 +1234,7 @@ static long kvmhv_handle_nested_set_rc(struct kvm_vcpu *vcpu,
 
 	/* Set the rc bit in the pte of the shadow_pgtable for the nest guest */
 	ret = kvmppc_hv_handle_set_rc(kvm, true, writing,
-				      n_gpa, gp->shadow_lpid);
+				      n_gpa, gp->l1_lpid);
 	if (!ret)
 		ret = -EINVAL;
 	else
-- 
2.17.1

