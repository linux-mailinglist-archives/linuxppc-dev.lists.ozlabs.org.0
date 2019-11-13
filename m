Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A7603FA115
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 02:55:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CSP75C0hzF5NS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 12:55:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="1HvkMZIz"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CSJW1zC0zF63q
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 12:51:22 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8F25322466;
 Wed, 13 Nov 2019 01:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573609880;
 bh=nJkBAQLBBkqX8QZJrgLlumKcXjkCQC5TSG3sVUz0Rm0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=1HvkMZIz0bFiaQM+UFRgVcjZA/enNk9eUgscCjV/jYoszwQGTtiuZLZSScoa+p9fE
 IRvsWxR7omOXOd8YL/GSCqgxyFjaib5E0F+l2P6hOr1wK9a2s/k4Bs0r6WVGQxqF1y
 P9pQ1R+zAwno2kNA2ZzTm3FCEZ6/bodxV7f8ddm4=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 042/209] KVM: PPC: Inform the userspace about TCE
 update failures
Date: Tue, 12 Nov 2019 20:47:38 -0500
Message-Id: <20191113015025.9685-42-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191113015025.9685-1-sashal@kernel.org>
References: <20191113015025.9685-1-sashal@kernel.org>
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
 kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Alexey Kardashevskiy <aik@ozlabs.ru>

[ Upstream commit f7960e299f13f069d6f3d4e157d91bfca2669677 ]

We return H_TOO_HARD from TCE update handlers when we think that
the next handler (realmode -> virtual mode -> user mode) has a chance to
handle the request; H_HARDWARE/H_CLOSED otherwise.

This changes the handlers to return H_TOO_HARD on every error giving
the userspace an opportunity to handle any request or at least log
them all.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kvm/book3s_64_vio.c    | 8 ++++----
 arch/powerpc/kvm/book3s_64_vio_hv.c | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_vio.c b/arch/powerpc/kvm/book3s_64_vio.c
index 07a8004c3c237..65486c3d029b5 100644
--- a/arch/powerpc/kvm/book3s_64_vio.c
+++ b/arch/powerpc/kvm/book3s_64_vio.c
@@ -401,7 +401,7 @@ static long kvmppc_tce_iommu_do_unmap(struct kvm *kvm,
 	long ret;
 
 	if (WARN_ON_ONCE(iommu_tce_xchg(tbl, entry, &hpa, &dir)))
-		return H_HARDWARE;
+		return H_TOO_HARD;
 
 	if (dir == DMA_NONE)
 		return H_SUCCESS;
@@ -449,15 +449,15 @@ long kvmppc_tce_iommu_do_map(struct kvm *kvm, struct iommu_table *tbl,
 		return H_TOO_HARD;
 
 	if (WARN_ON_ONCE(mm_iommu_ua_to_hpa(mem, ua, tbl->it_page_shift, &hpa)))
-		return H_HARDWARE;
+		return H_TOO_HARD;
 
 	if (mm_iommu_mapped_inc(mem))
-		return H_CLOSED;
+		return H_TOO_HARD;
 
 	ret = iommu_tce_xchg(tbl, entry, &hpa, &dir);
 	if (WARN_ON_ONCE(ret)) {
 		mm_iommu_mapped_dec(mem);
-		return H_HARDWARE;
+		return H_TOO_HARD;
 	}
 
 	if (dir != DMA_NONE)
diff --git a/arch/powerpc/kvm/book3s_64_vio_hv.c b/arch/powerpc/kvm/book3s_64_vio_hv.c
index eb8b11515a7ff..d258ed4ef77c3 100644
--- a/arch/powerpc/kvm/book3s_64_vio_hv.c
+++ b/arch/powerpc/kvm/book3s_64_vio_hv.c
@@ -300,10 +300,10 @@ static long kvmppc_rm_tce_iommu_do_map(struct kvm *kvm, struct iommu_table *tbl,
 
 	if (WARN_ON_ONCE_RM(mm_iommu_ua_to_hpa_rm(mem, ua, tbl->it_page_shift,
 			&hpa)))
-		return H_HARDWARE;
+		return H_TOO_HARD;
 
 	if (WARN_ON_ONCE_RM(mm_iommu_mapped_inc(mem)))
-		return H_CLOSED;
+		return H_TOO_HARD;
 
 	ret = iommu_tce_xchg_rm(kvm->mm, tbl, entry, &hpa, &dir);
 	if (ret) {
@@ -501,7 +501,7 @@ long kvmppc_rm_h_put_tce_indirect(struct kvm_vcpu *vcpu,
 
 		rmap = (void *) vmalloc_to_phys(rmap);
 		if (WARN_ON_ONCE_RM(!rmap))
-			return H_HARDWARE;
+			return H_TOO_HARD;
 
 		/*
 		 * Synchronize with the MMU notifier callbacks in
-- 
2.20.1

