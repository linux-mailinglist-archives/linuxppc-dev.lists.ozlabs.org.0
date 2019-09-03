Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 109EEA6EC3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 18:29:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NC8D2VSWzDqTs
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 02:29:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="YV291SDY"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NC4t5zDxzDqTs
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 02:26:22 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6859C23789;
 Tue,  3 Sep 2019 16:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567527980;
 bh=y4mtFdd/M4192J/pE0CJUfdZ9vvIJgvFr2RKFhXHTls=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YV291SDY9wCYYkPSkFbLAutuTU7aH7htRIc6Yv5pmSG0gTP85J9Dedevt/1nVpmoH
 yicNQinrOXx66W2P/Z5qDltgTt1+ZbcVA2DAWG1zJFFWFVmNYkIECRJE4LhyqODCrl
 uIVP1xJGmD9yUJjf+XEs5qiDatqps3jBvMP4E2Eg=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 035/167] KVM: PPC: Book3S HV: Fix race between
 kvm_unmap_hva_range and MMU mode switch
Date: Tue,  3 Sep 2019 12:23:07 -0400
Message-Id: <20190903162519.7136-35-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190903162519.7136-1-sashal@kernel.org>
References: <20190903162519.7136-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Paul Mackerras <paulus@ozlabs.org>

[ Upstream commit 234ff0b729ad882d20f7996591a964965647addf ]

Testing has revealed an occasional crash which appears to be caused
by a race between kvmppc_switch_mmu_to_hpt and kvm_unmap_hva_range_hv.
The symptom is a NULL pointer dereference in __find_linux_pte() called
from kvm_unmap_radix() with kvm->arch.pgtable == NULL.

Looking at kvmppc_switch_mmu_to_hpt(), it does indeed clear
kvm->arch.pgtable (via kvmppc_free_radix()) before setting
kvm->arch.radix to NULL, and there is nothing to prevent
kvm_unmap_hva_range_hv() or the other MMU callback functions from
being called concurrently with kvmppc_switch_mmu_to_hpt() or
kvmppc_switch_mmu_to_radix().

This patch therefore adds calls to spin_lock/unlock on the kvm->mmu_lock
around the assignments to kvm->arch.radix, and makes sure that the
partition-scoped radix tree or HPT is only freed after changing
kvm->arch.radix.

This also takes the kvm->mmu_lock in kvmppc_rmap_reset() to make sure
that the clearing of each rmap array (one per memslot) doesn't happen
concurrently with use of the array in the kvm_unmap_hva_range_hv()
or the other MMU callbacks.

Fixes: 18c3640cefc7 ("KVM: PPC: Book3S HV: Add infrastructure for running HPT guests on radix host")
Cc: stable@vger.kernel.org # v4.15+
Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kvm/book3s_64_mmu_hv.c |  3 +++
 arch/powerpc/kvm/book3s_hv.c        | 15 +++++++++++----
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index 68e14afecac85..a488c105b9234 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -744,12 +744,15 @@ void kvmppc_rmap_reset(struct kvm *kvm)
 	srcu_idx = srcu_read_lock(&kvm->srcu);
 	slots = kvm_memslots(kvm);
 	kvm_for_each_memslot(memslot, slots) {
+		/* Mutual exclusion with kvm_unmap_hva_range etc. */
+		spin_lock(&kvm->mmu_lock);
 		/*
 		 * This assumes it is acceptable to lose reference and
 		 * change bits across a reset.
 		 */
 		memset(memslot->arch.rmap, 0,
 		       memslot->npages * sizeof(*memslot->arch.rmap));
+		spin_unlock(&kvm->mmu_lock);
 	}
 	srcu_read_unlock(&kvm->srcu, srcu_idx);
 }
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 083dcedba11ce..9595db30e6b87 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3813,12 +3813,15 @@ static int kvmppc_hv_setup_htab_rma(struct kvm_vcpu *vcpu)
 /* Must be called with kvm->lock held and mmu_ready = 0 and no vcpus running */
 int kvmppc_switch_mmu_to_hpt(struct kvm *kvm)
 {
+	kvmppc_rmap_reset(kvm);
+	kvm->arch.process_table = 0;
+	/* Mutual exclusion with kvm_unmap_hva_range etc. */
+	spin_lock(&kvm->mmu_lock);
+	kvm->arch.radix = 0;
+	spin_unlock(&kvm->mmu_lock);
 	kvmppc_free_radix(kvm);
 	kvmppc_update_lpcr(kvm, LPCR_VPM1,
 			   LPCR_VPM1 | LPCR_UPRT | LPCR_GTSE | LPCR_HR);
-	kvmppc_rmap_reset(kvm);
-	kvm->arch.radix = 0;
-	kvm->arch.process_table = 0;
 	return 0;
 }
 
@@ -3831,10 +3834,14 @@ int kvmppc_switch_mmu_to_radix(struct kvm *kvm)
 	if (err)
 		return err;
 
+	kvmppc_rmap_reset(kvm);
+	/* Mutual exclusion with kvm_unmap_hva_range etc. */
+	spin_lock(&kvm->mmu_lock);
+	kvm->arch.radix = 1;
+	spin_unlock(&kvm->mmu_lock);
 	kvmppc_free_hpt(&kvm->arch.hpt);
 	kvmppc_update_lpcr(kvm, LPCR_UPRT | LPCR_GTSE | LPCR_HR,
 			   LPCR_VPM1 | LPCR_UPRT | LPCR_GTSE | LPCR_HR);
-	kvm->arch.radix = 1;
 	return 0;
 }
 
-- 
2.20.1

