Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B4C53A7E4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 16:04:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCrVH3SBSz3flt
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jun 2022 00:04:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QYKOtV6k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QYKOtV6k;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCrLW27j6z3dPn
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jun 2022 23:57:23 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9A70761627;
	Wed,  1 Jun 2022 13:57:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4445C385A5;
	Wed,  1 Jun 2022 13:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654091841;
	bh=Z8axk3wY4vH8/Dseo94rtU2nY3WpgHiZ0Yz2/nELLWk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QYKOtV6kOeYSuP2syrB+g+x48Um7Wm1hWGhfa8nJcTO44fjNiPW3inZGDpVfD0Z0v
	 +8jyyB693Y9PXNnW/QLTFZsSaaUYcSd5vxfPim7hbGe9gWYZc58xmURrF6ZKIm4RR/
	 ZjnvUnn7DXRBdN86OLga0D7GVOcrhkUXVWONwzNMNmand2KJ72zjW+abWA/wL0KkTn
	 JhcISLTEiszEEPoyFciDcnJIFaVH7ZduyoMkPxm8V+Le44CwuX1kWmpSOQtC71DM7w
	 H6zB+GNcqXFpqQ0ZWl/gFOOVveKrN+7baLC3VoDvYEon47H5U7GQYWgwWVJERQlDAL
	 8dEg7Ns7G+w6A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 26/37] KVM: PPC: Book3S HV Nested: L2 LPCR should inherit L1 LPES setting
Date: Wed,  1 Jun 2022 09:56:11 -0400
Message-Id: <20220601135622.2003939-26-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220601135622.2003939-1-sashal@kernel.org>
References: <20220601135622.2003939-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Fabiano Rosas <farosas@linux.ibm.com>, aik@ozlabs.ru, Nicholas Piggin <npiggin@gmail.com>, bharata@linux.ibm.com, nathan@kernel.org, clg@kaod.org, seanjc@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nicholas Piggin <npiggin@gmail.com>

[ Upstream commit 2852ebfa10afdcefff35ec72c8da97141df9845c ]

The L1 should not be able to adjust LPES mode for the L2. Setting LPES
if the L0 needs it clear would cause external interrupts to be sent to
L2 and missed by the L0.

Clearing LPES when it may be set, as typically happens with XIVE enabled
could cause a performance issue despite having no native XIVE support in
the guest, because it will cause mediated interrupts for the L2 to be
taken in HV mode, which then have to be injected.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20220303053315.1056880-7-npiggin@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kvm/book3s_hv.c        | 4 ++++
 arch/powerpc/kvm/book3s_hv_nested.c | 3 +--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 7fa685711669..eba77096c443 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -5235,6 +5235,10 @@ static int kvmppc_core_init_vm_hv(struct kvm *kvm)
 		kvm->arch.host_lpcr = lpcr = mfspr(SPRN_LPCR);
 		lpcr &= LPCR_PECE | LPCR_LPES;
 	} else {
+		/*
+		 * The L2 LPES mode will be set by the L0 according to whether
+		 * or not it needs to take external interrupts in HV mode.
+		 */
 		lpcr = 0;
 	}
 	lpcr |= (4UL << LPCR_DPFD_SH) | LPCR_HDICE |
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 6c4e0e93105f..ddea14e5cb5e 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -261,8 +261,7 @@ static void load_l2_hv_regs(struct kvm_vcpu *vcpu,
 	/*
 	 * Don't let L1 change LPCR bits for the L2 except these:
 	 */
-	mask = LPCR_DPFD | LPCR_ILE | LPCR_TC | LPCR_AIL | LPCR_LD |
-		LPCR_LPES | LPCR_MER;
+	mask = LPCR_DPFD | LPCR_ILE | LPCR_TC | LPCR_AIL | LPCR_LD | LPCR_MER;
 
 	/*
 	 * Additional filtering is required depending on hardware
-- 
2.35.1

