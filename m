Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99703406389
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Sep 2021 02:49:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5HMc3JQ4z3gxW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Sep 2021 10:49:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hoxot8uU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hoxot8uU; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5GpB5yQcz3dgx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Sep 2021 10:24:18 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 791D1610A3;
 Fri, 10 Sep 2021 00:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631233457;
 bh=/3PyN0Qj3YLPH/F6yY8D0aSJtt251I6XUp7vJyGCqWU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hoxot8uU4jWmv+pDQ0AqzcnSRAdV//lNfZ0UKDhyUhsVmL144cnlyMO0QMuYCXGvS
 Bjh5m5zIDzQ9oWnczW/EtkDguPuC9kxQ14pOn4MiC+CWrDEuftvCK4b9P10tbFaG6P
 CxLXD5L81BYf02ijW5eqGUoI5GEODlYAOOooTuZAjh0iB0MutOz618xRqMn7ZefMpR
 CySAXtWo6braHY8u6uTHkv48FPPPxQveNPRJehQ3l7ezfvYpAHWope3FKd9O10GPuj
 OxRoHXG457RXAaEkJnzcOouyekOouQdjLOCymhYKinQWXBI9yjnSytxpF91DmLw/L8
 T/VyDymuEkbXg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 10/14] KVM: PPC: Book3S HV: Initialise vcpu MSR
 with MSR_ME
Date: Thu,  9 Sep 2021 20:23:59 -0400
Message-Id: <20210910002403.176887-10-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910002403.176887-1-sashal@kernel.org>
References: <20210910002403.176887-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 kvm-ppc@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nicholas Piggin <npiggin@gmail.com>

[ Upstream commit fd42b7b09c602c904452c0c3e5955ca21d8e387a ]

It is possible to create a VCPU without setting the MSR before running
it, which results in a warning in kvmhv_vcpu_entry_p9() that MSR_ME is
not set. This is pretty harmless because the MSR_ME bit is added to
HSRR1 before HRFID to guest, and a normal qemu guest doesn't hit it.

Initialise the vcpu MSR with MSR_ME set.

Reported-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20210811160134.904987-2-npiggin@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kvm/book3s_hv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 54c6ba87a25a..ba72bf95c80e 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1651,6 +1651,7 @@ static struct kvm_vcpu *kvmppc_core_vcpu_create_hv(struct kvm *kvm,
 	spin_lock_init(&vcpu->arch.vpa_update_lock);
 	spin_lock_init(&vcpu->arch.tbacct_lock);
 	vcpu->arch.busy_preempt = TB_NIL;
+	vcpu->arch.shregs.msr = MSR_ME;
 	vcpu->arch.intr_msr = MSR_SF | MSR_ME;
 
 	kvmppc_mmu_book3s_hv_init(vcpu);
-- 
2.30.2

