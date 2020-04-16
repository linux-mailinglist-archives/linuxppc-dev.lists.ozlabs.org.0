Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E46311AB669
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 05:56:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492lkm63GRzDrDr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 13:56:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492lhV0ysPzDqxl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 13:54:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gibson.dropbear.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=bTVyTWXt; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1007)
 id 492lhT5D9zz9sSG; Thu, 16 Apr 2020 13:54:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1587009241;
 bh=N+Rkt9wuCYS4FEyEbyG/lYRvAzSD8Ldu8HQrt/sWwA8=;
 h=From:To:Cc:Subject:Date:From;
 b=bTVyTWXtJf65JlTGFZFv3iB72pyKSAPmL2me0VFJoGPEZnk+9bQ1QQoAV9qbOIevz
 OQr9Pzdpb+Hzls3faBa2n10igsRhrGJ8SBFlx0KGqMXNEAtnE/SWKEzRR4vC66uEdS
 RtKWixkTcV7ryq25/d09i2MrKURNbBB7gDQs6ggc=
From: David Gibson <david@gibson.dropbear.id.au>
To: paulus@samba.org,
	mpe@ellerman.id.au
Subject: [PATCH] KVM: PPC: Handle non-present PTEs in
 kvmppc_book3s_hv_page_fault()
Date: Thu, 16 Apr 2020 13:53:58 +1000
Message-Id: <20200416035358.261056-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.25.2
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
Cc: groug@kaod.org, kvm-ppc@vger.kernel.org, linux-kernel@vger.kernel.org,
 clg@kaod.org, linuxppc-dev@lists.ozlabs.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since cd758a9b57ee "KVM: PPC: Book3S HV: Use __gfn_to_pfn_memslot in HPT
page fault handler", it's been possible in fairly rare circumstances to
load a non-present PTE in kvmppc_book3s_hv_page_fault() when running a
guest on a POWER8 host.

Because that case wasn't checked for, we could misinterpret the non-present
PTE as being a cache-inhibited PTE.  That could mismatch with the
corresponding hash PTE, which would cause the function to fail with -EFAULT
a little further down.  That would propagate up to the KVM_RUN ioctl()
generally causing the KVM userspace (usually qemu) to fall over.

This addresses the problem by catching that case and returning to the guest
instead.

Fixes: cd758a9b57ee "KVM: PPC: Book3S HV: Use __gfn_to_pfn_memslot in HPT page fault handler"
Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1820402
Suggested-by: Paul Mackerras <paulus@samba.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 arch/powerpc/kvm/book3s_64_mmu_hv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index 6404df613ea3..394fca8e630a 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -616,6 +616,11 @@ int kvmppc_book3s_hv_page_fault(struct kvm_run *run, struct kvm_vcpu *vcpu,
 	}
 	pte = *ptep;
 	local_irq_enable();
+	if (!pte_present(pte)) {
+		if (page)
+			put_page(page);
+		return RESUME_GUEST;
+	}
 	hpa = pte_pfn(pte) << PAGE_SHIFT;
 	pte_size = PAGE_SIZE;
 	if (shift)
-- 
2.25.2

