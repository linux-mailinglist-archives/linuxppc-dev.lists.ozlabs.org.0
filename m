Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A699E1AB715
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 07:06:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492nHc6HQ0zDrF5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 15:06:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492nDp6JK8zDr8V
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 15:03:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=CMjVIBuA; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 492nDp3Rfhz9sSG; Thu, 16 Apr 2020 15:03:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1587013418; bh=ezMMwkByK2qZyRKxM4BFNkkLAWHC+jA69OSNgaQhgbc=;
 h=Date:From:To:Cc:Subject:From;
 b=CMjVIBuASwAcDOMMj7oJiM3jwgXLZge7hHE1uCcAlkF9v6v2mv20mbE8W5cKSaZV9
 ouc+wKbBOOZuAtIhol8gUN6iROYWWiNFtkAILfyEXCJclcYVJ26fyUQMeSz8/8bzjF
 HsrwEbMFAZTjuCI3urNFQTUaWIqBm0t9YZZTWP6LaN4/eAMrstp0pbEU7K9YhCjLez
 nnSAJRdiX5njMqBAvkSHmr/Df3u7eFKEjDwsb3T1AW41iVgiCn9STeyQCdDb1gXT03
 OxLpDiwb8mJPTxc6fMbZnmDuwaa96fKPA2DnLDq4uCINbQiIhP33idhnnwhaq+viwD
 y7KRNUKE4cFXQ==
Date: Thu, 16 Apr 2020 15:03:35 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: kvm@vger.kernel.org, kvm-ppc@vger.kernel.org
Subject: [PATCH] KVM: PPC: Book3S HV: Handle non-present PTEs in page fault
 functions
Message-ID: <20200416050335.GB10545@blackberry>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, groug@kaod.org
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
instead, letting it fault again, and retrying the whole page fault from
the beginning.

For completeness, this fixes the radix page fault handler in the same
way.  For radix this didn't cause any obvious misbehaviour, because we
ended up putting the non-present PTE into the guest's partition-scoped
page tables, leading immediately to another hypervisor data/instruction
storage interrupt, which would go through the page fault path again
and fix things up.

Fixes: cd758a9b57ee "KVM: PPC: Book3S HV: Use __gfn_to_pfn_memslot in HPT page fault handler"
Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1820402
Reported-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
---
This is a reworked version of the patch David Gibson sent recently,
with the fix applied to the radix case as well. The commit message
is mostly stolen from David's patch.

 arch/powerpc/kvm/book3s_64_mmu_hv.c    | 9 +++++----
 arch/powerpc/kvm/book3s_64_mmu_radix.c | 9 +++++----
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index 3aecec8..20b7dce 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -604,18 +604,19 @@ int kvmppc_book3s_hv_page_fault(struct kvm_run *run, struct kvm_vcpu *vcpu,
 	 */
 	local_irq_disable();
 	ptep = __find_linux_pte(vcpu->arch.pgdir, hva, NULL, &shift);
+	pte = __pte(0);
+	if (ptep)
+		pte = *ptep;
+	local_irq_enable();
 	/*
 	 * If the PTE disappeared temporarily due to a THP
 	 * collapse, just return and let the guest try again.
 	 */
-	if (!ptep) {
-		local_irq_enable();
+	if (!pte_present(pte)) {
 		if (page)
 			put_page(page);
 		return RESUME_GUEST;
 	}
-	pte = *ptep;
-	local_irq_enable();
 	hpa = pte_pfn(pte) << PAGE_SHIFT;
 	pte_size = PAGE_SIZE;
 	if (shift)
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 134fbc1..7bf94ba 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -815,18 +815,19 @@ int kvmppc_book3s_instantiate_page(struct kvm_vcpu *vcpu,
 	 */
 	local_irq_disable();
 	ptep = __find_linux_pte(vcpu->arch.pgdir, hva, NULL, &shift);
+	pte = __pte(0);
+	if (ptep)
+		pte = *ptep;
+	local_irq_enable();
 	/*
 	 * If the PTE disappeared temporarily due to a THP
 	 * collapse, just return and let the guest try again.
 	 */
-	if (!ptep) {
-		local_irq_enable();
+	if (!pte_present(pte)) {
 		if (page)
 			put_page(page);
 		return RESUME_GUEST;
 	}
-	pte = *ptep;
-	local_irq_enable();
 
 	/* If we're logging dirty pages, always map single pages */
 	large_enable = !(memslot->flags & KVM_MEM_LOG_DIRTY_PAGES);
-- 
2.7.4

