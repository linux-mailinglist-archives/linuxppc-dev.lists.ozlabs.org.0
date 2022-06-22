Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E0B554272
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 07:53:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSXc66h4xz3bxZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 15:53:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru; envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSXbg4NLwz30Qt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jun 2022 15:52:45 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
	by ozlabs.ru (Postfix) with ESMTP id 7F7478218B;
	Wed, 22 Jun 2022 01:52:37 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel] KVM: PPC: Book3s: Fix warning about xics_rm_h_xirr_x
Date: Wed, 22 Jun 2022 15:52:35 +1000
Message-Id: <20220622055235.1139204-1-aik@ozlabs.ru>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This fixes "no previous prototype":

arch/powerpc/kvm/book3s_hv_rm_xics.c:482:15:
warning: no previous prototype for 'xics_rm_h_xirr_x' [-Wmissing-prototypes]

Reported by the kernel test robot.

Fixes: b22af9041927 ("KVM: PPC: Book3s: Remove real mode interrupt controller hcalls handlers")
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/kvm/book3s_xics.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kvm/book3s_xics.h b/arch/powerpc/kvm/book3s_xics.h
index 8e4c79e2fcd8..08fb0843faf5 100644
--- a/arch/powerpc/kvm/book3s_xics.h
+++ b/arch/powerpc/kvm/book3s_xics.h
@@ -143,6 +143,7 @@ static inline struct kvmppc_ics *kvmppc_xics_find_ics(struct kvmppc_xics *xics,
 }
 
 extern unsigned long xics_rm_h_xirr(struct kvm_vcpu *vcpu);
+extern unsigned long xics_rm_h_xirr_x(struct kvm_vcpu *vcpu);
 extern int xics_rm_h_ipi(struct kvm_vcpu *vcpu, unsigned long server,
 			 unsigned long mfrr);
 extern int xics_rm_h_cppr(struct kvm_vcpu *vcpu, unsigned long cppr);
-- 
2.30.2

