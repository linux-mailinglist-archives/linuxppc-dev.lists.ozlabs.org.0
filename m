Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2BC51EB17
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 May 2022 04:46:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kwpb72bGFz3cF0
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 May 2022 12:46:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cdjrlc.com (client-ip=106.55.201.188; helo=smtpbg.qq.com;
 envelope-from=wangborong@cdjrlc.com; receiver=<UNKNOWN>)
X-Greylist: delayed 139 seconds by postgrey-1.36 at boromir;
 Sun, 08 May 2022 12:45:47 AEST
Received: from smtpbg.qq.com (smtpbg136.qq.com [106.55.201.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KwpZg3bcjz3bhR
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 May 2022 12:45:45 +1000 (AEST)
X-QQ-mid: bizesmtp66t1651977607t5j9ik6z
Received: from localhost.localdomain ( [125.69.42.80])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sun, 08 May 2022 10:40:05 +0800 (CST)
X-QQ-SSF: 01000000002000E0S000B00A0000000
X-QQ-FEAT: 7zplUpjHcnrMz5odkXxNlKjMgcSI34LHNMTkXMtsnZiYvjPMp7kMA2oWwDw6c
 TJyqM+/RXHIZFYX5eTrjQQHe29VhIljOLYmqMC65lODj/J8h8b1vB/Tdj/cyfGkT5a+naGH
 x3CDh4PFGVHmsntgVIZUDEiJ8H0Sg5eVrdyBFKqacPp9yvROmNQOLDU9FxwIWd3nttOU6an
 xMk9Hl0yHlvIIb9Ea4Qd0fwXotq1mh+dS/Yk18cPN4798PyaRkUPc2LQ2iyatA+/tJX+uLw
 0x6A4vbvOgh/u3CtsFfSnlomhG+y8q5NAqvtx7G+U00VxZSxNFHFtqM7J2u/beLyGKjEPQI
 8Ah9UwFL28vcqts8A8=
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: mpe@ellerman.id.au
Subject: [PATCH] KVM: PPC: Book3S HV: Fix typo in a comment
Date: Sun,  8 May 2022 10:40:01 +0800
Message-Id: <20220508024001.107483-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam7
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
Cc: maz@kernel.org, aik@ozlabs.ru, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, paulus@samba.org, clg@kaod.org,
 Jason Wang <wangborong@cdjrlc.com>, aneesh.kumar@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, kernel.noureddine@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The double `the' in the comment in line 212 is repeated. Remove one
of them from the comment.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 arch/powerpc/kvm/book3s_xive_native.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/book3s_xive_native.c
index f81ba6f84e72..5271c33fe79e 100644
--- a/arch/powerpc/kvm/book3s_xive_native.c
+++ b/arch/powerpc/kvm/book3s_xive_native.c
@@ -209,7 +209,7 @@ static int kvmppc_xive_native_reset_mapped(struct kvm *kvm, unsigned long irq)
 
 	/*
 	 * Clear the ESB pages of the IRQ number being mapped (or
-	 * unmapped) into the guest and let the the VM fault handler
+	 * unmapped) into the guest and let the VM fault handler
 	 * repopulate with the appropriate ESB pages (device or IC)
 	 */
 	pr_debug("clearing esb pages for girq 0x%lx\n", irq);
-- 
2.35.1

