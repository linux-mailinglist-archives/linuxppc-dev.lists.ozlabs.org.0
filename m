Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C5622C74B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 16:06:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCrbY2l2rzDscG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 00:06:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCqWF4ymlzF0fg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 23:17:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=BnoCTKiY; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BCqWF2DYqz9sSy; Fri, 24 Jul 2020 23:17:45 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BCqWF0YDCz9sTC; Fri, 24 Jul 2020 23:17:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595596665;
 bh=ZLSqpP8+akdOjm2BlY9de1c5AlCdXx2OjouxYzt5/u8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BnoCTKiYEuYx2ZRFzMzysPDppEK9/b8xV+RornqfmrcXt12I/PH2GZRwhOCfbnKWT
 OtW3R5acxDo9gvO46wIFc6wJVAdMalLO5G2EtFFfKmYa98nbmwOlhl0BS3jG023rkV
 thEUNFCUVm7zthzYE4XLD2sgfnRrqQeKsFKhKImCkZkQ+2n/I5XDPb6cr7Ld1shH5F
 /RKR1czZ2bzWPM2J1Vdxt0rd6IOcOgBk1E/zDDyyRHRjlrazb00MEw56vmdUUi2CXX
 Yab4Gil6Xmufhv24dNMyypQjV6eAP3HwBlYaNYQExvwLMzz5yfPawQcdHzuZuLBZMY
 lTkLBy+Ir0Fgg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 8/9] powerpc/kvm: Use correct CONFIG symbol in comment
Date: Fri, 24 Jul 2020 23:17:27 +1000
Message-Id: <20200724131728.1643966-8-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200724131728.1643966-1-mpe@ellerman.id.au>
References: <20200724131728.1643966-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This comment refers to the non-existent CONFIG_PPC_BOOK3S_XX, which
confuses scripts/checkkconfigsymbols.py.

Change it to use the correct symbol.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kvm/book3s_interrupts.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_interrupts.S b/arch/powerpc/kvm/book3s_interrupts.S
index f7ad99d972ce..607a9b99c334 100644
--- a/arch/powerpc/kvm/book3s_interrupts.S
+++ b/arch/powerpc/kvm/book3s_interrupts.S
@@ -26,7 +26,7 @@
 #define FUNC(name)		name
 #define GET_SHADOW_VCPU(reg)	lwz     reg, (THREAD + THREAD_KVM_SVCPU)(r2)
 
-#endif /* CONFIG_PPC_BOOK3S_XX */
+#endif /* CONFIG_PPC_BOOK3S_64 */
 
 #define VCPU_LOAD_NVGPRS(vcpu) \
 	PPC_LL	r14, VCPU_GPR(R14)(vcpu); \
-- 
2.25.1

