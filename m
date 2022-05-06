Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C84351D26A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 09:38:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kvj980hYmz3cDx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 17:38:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Kvj8g43pPz3bqw
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 17:37:54 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 1E6A280152;
 Fri,  6 May 2022 03:37:44 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel] KVM: PPC: Book3s: PR: Enable default TCE hypercalls
Date: Fri,  6 May 2022 17:37:37 +1000
Message-Id: <20220506073737.3823347-1-aik@ozlabs.ru>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When KVM_CAP_PPC_ENABLE_HCALL was introduced, H_GET_TCE and H_PUT_TCE
were already implemented and enabled by default; however H_GET_TCE
was missed out on PR KVM (probably because the handler was in
the real mode code at the time).

This enables H_GET_TCE by default. While at this, this wraps
the checks in ifdef CONFIG_SPAPR_TCE_IOMMU just like HV KVM.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/kvm/book3s_pr_papr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/kvm/book3s_pr_papr.c b/arch/powerpc/kvm/book3s_pr_papr.c
index dc4f51ac84bc..a1f2978b2a86 100644
--- a/arch/powerpc/kvm/book3s_pr_papr.c
+++ b/arch/powerpc/kvm/book3s_pr_papr.c
@@ -433,9 +433,12 @@ int kvmppc_hcall_impl_pr(unsigned long cmd)
 	case H_REMOVE:
 	case H_PROTECT:
 	case H_BULK_REMOVE:
+#ifdef CONFIG_SPAPR_TCE_IOMMU
+	case H_GET_TCE:
 	case H_PUT_TCE:
 	case H_PUT_TCE_INDIRECT:
 	case H_STUFF_TCE:
+#endif
 	case H_CEDE:
 	case H_LOGICAL_CI_LOAD:
 	case H_LOGICAL_CI_STORE:
@@ -464,7 +467,10 @@ static unsigned int default_hcall_list[] = {
 	H_REMOVE,
 	H_PROTECT,
 	H_BULK_REMOVE,
+#ifdef CONFIG_SPAPR_TCE_IOMMU
+	H_GET_TCE,
 	H_PUT_TCE,
+#endif
 	H_CEDE,
 	H_SET_MODE,
 #ifdef CONFIG_KVM_XICS
-- 
2.30.2

