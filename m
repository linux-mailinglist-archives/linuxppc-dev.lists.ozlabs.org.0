Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1075C4C80B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 09:14:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TtNy4RytzDqHP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 17:14:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TrmT5kcRzDqXg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 16:01:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.b="UWQ8mUCs"; 
 dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 45TrmR2nPPz9sBp;
 Thu, 20 Jun 2019 16:01:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1561010487;
 bh=glw+2Td0oj/mdyoNqtydbZ/PHo9y+XS8MVB4rgGAwdY=;
 h=From:To:Cc:Subject:Date:From;
 b=UWQ8mUCsEbEnHRzuGYhHXMHaAPZMVt9UnTg3EP3ILgq+OvpmJBUGXKmMcrDoPOlp+
 uLHGP9MVwxoo1WpENcE27tjnBSTBbe/vgnc4HTWmUETUGEARZoPmujK3MSNpRDLPde
 YcDHw8DrorWVhxXp7SnC1WRUnK0DDCzDH70WMSzSzs+TCP4Gr8ZR3BXr2TgKfXX4WE
 TADLVZC3wKndLUwqzIEP3dO7zlRCGUPLgi3OQeESbwosJ6TQ/T0c/kjwBW4OfOgrDp
 c/SJXA9HYFCMjSlrzi0Sc3SH9TxJJByseaGLO1EGISQ+9hOK0DfjUq3CDV/Mx4xyTz
 txTRjd6bnt1KA==
Received: by neuling.org (Postfix, from userid 1000)
 id D6E8A2A2091; Thu, 20 Jun 2019 16:00:54 +1000 (AEST)
From: Michael Neuling <mikey@neuling.org>
To: mpe@ellerman.id.au
Subject: [PATCH] KVM: PPC: Book3S HV: Fix CR0 setting in TM emulation
Date: Thu, 20 Jun 2019 16:00:40 +1000
Message-Id: <20190620060040.26945-1-mikey@neuling.org>
X-Mailer: git-send-email 2.21.0
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
Cc: mikey@neuling.org, linuxppc-dev@lists.ozlabs.org, sjitindarsingh@gmail.com,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When emulating tsr, treclaim and trechkpt, we incorrectly set CR0. The
code currently sets:
    CR0 <- 00 || MSR[TS]
but according to the ISA it should be:
    CR0 <-  0 || MSR[TS] || 0

This fixes the bit shift to put the bits in the correct location.

Tested-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Signed-off-by: Michael Neuling <mikey@neuling.org>
---
 arch/powerpc/kvm/book3s_hv_tm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_tm.c b/arch/powerpc/kvm/book3s_hv_tm.c
index 888e2609e3..31cd0f327c 100644
--- a/arch/powerpc/kvm/book3s_hv_tm.c
+++ b/arch/powerpc/kvm/book3s_hv_tm.c
@@ -131,7 +131,7 @@ int kvmhv_p9_tm_emulation(struct kvm_vcpu *vcpu)
 		}
 		/* Set CR0 to indicate previous transactional state */
 		vcpu->arch.regs.ccr = (vcpu->arch.regs.ccr & 0x0fffffff) |
-			(((msr & MSR_TS_MASK) >> MSR_TS_S_LG) << 28);
+			(((msr & MSR_TS_MASK) >> MSR_TS_S_LG) << 29);
 		/* L=1 => tresume, L=0 => tsuspend */
 		if (instr & (1 << 21)) {
 			if (MSR_TM_SUSPENDED(msr))
@@ -175,7 +175,7 @@ int kvmhv_p9_tm_emulation(struct kvm_vcpu *vcpu)
 
 		/* Set CR0 to indicate previous transactional state */
 		vcpu->arch.regs.ccr = (vcpu->arch.regs.ccr & 0x0fffffff) |
-			(((msr & MSR_TS_MASK) >> MSR_TS_S_LG) << 28);
+			(((msr & MSR_TS_MASK) >> MSR_TS_S_LG) << 29);
 		vcpu->arch.shregs.msr &= ~MSR_TS_MASK;
 		return RESUME_GUEST;
 
@@ -205,7 +205,7 @@ int kvmhv_p9_tm_emulation(struct kvm_vcpu *vcpu)
 
 		/* Set CR0 to indicate previous transactional state */
 		vcpu->arch.regs.ccr = (vcpu->arch.regs.ccr & 0x0fffffff) |
-			(((msr & MSR_TS_MASK) >> MSR_TS_S_LG) << 28);
+			(((msr & MSR_TS_MASK) >> MSR_TS_S_LG) << 29);
 		vcpu->arch.shregs.msr = msr | MSR_TS_S;
 		return RESUME_GUEST;
 	}
-- 
2.21.0

