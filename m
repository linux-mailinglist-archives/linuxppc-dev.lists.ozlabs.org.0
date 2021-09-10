Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 355DA40620E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Sep 2021 02:43:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5HDL1Kq1z3gNL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Sep 2021 10:43:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=t8tKRqY7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=t8tKRqY7; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5Gn96TwRz3cG1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Sep 2021 10:23:25 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 67D5D60FDA;
 Fri, 10 Sep 2021 00:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631233404;
 bh=lZkivQP3DofMjGxIe08apnirKRtBtazACpanOtt5U3E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=t8tKRqY7wX14GIZLP6o+linu0jCKEvJwTA1EOafPMSS461RogyBbf8NL1ZUMHeJ6i
 fFXy0ypOpkG7kMw9ism84p3Cy0+gUXSOC3wElLqf7X5jC6krEgVYmoklUCYyeHJLoy
 VwFJFrmeOm0RKlkAcrXXQLQ/NlP4niVHUrsJ+H1vEYzhLWeka1lm4vxIHzx2AufkZF
 aDODOkJIQoBCXpWythi1qDZLE2H7iQVj3xzZoKrBZuj/DB4El2YH38J5AScqXJR//o
 vMaHk+8Fb2JSitqEBEYAD3EE6XymTF/K6elyy/u3/F1Ax5EW4AtS0EcLxxiSQ2XN3J
 G8bbkB6rfsEWw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 10/19] powerpc/32: indirect function call use
 bctrl rather than blrl in ret_from_kernel_thread
Date: Thu,  9 Sep 2021 20:23:00 -0400
Message-Id: <20210910002309.176412-10-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910002309.176412-1-sashal@kernel.org>
References: <20210910002309.176412-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

[ Upstream commit 113ec9ccc8049c3772f0eab46b62c5d6654c09f7 ]

Copied from commit 89bbe4c798bc ("powerpc/64: indirect function call
use bctrl rather than blrl in ret_from_kernel_thread")

blrl is not recommended to use as an indirect function call, as it may
corrupt the link stack predictor.

This is not a performance critical path but this should be fixed for
consistency.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/91b1d242525307ceceec7ef6e832bfbacdd4501b.1629436472.git.christophe.leroy@csgroup.eu
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/entry_32.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index a2999cd73a82..ea1c00bc6ced 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -468,10 +468,10 @@ ret_from_fork:
 ret_from_kernel_thread:
 	REST_NVGPRS(r1)
 	bl	schedule_tail
-	mtlr	r14
+	mtctr	r14
 	mr	r3,r15
 	PPC440EP_ERR42
-	blrl
+	bctrl
 	li	r3,0
 	b	ret_from_syscall
 
-- 
2.30.2

