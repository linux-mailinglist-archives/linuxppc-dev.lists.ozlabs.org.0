Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5AE1FE954
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 05:27:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nS771Zp5zDq61
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 13:27:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=lizeebCy; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nPJZ6rDSzDqCx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 11:20:46 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2B1A920CC7;
 Thu, 18 Jun 2020 01:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592443244;
 bh=lCLf/7txuOzO4w3g0o+tTyZgWWrmV82cU1jSdV72LV0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lizeebCytyRRmrbVu36FaeEL4wUMtscyCUDC5U9uPgHBq4G72G+mjpdm3j9VZJtLI
 J/5t4o/3Or0UgjBPkkyLPHSrLw4iY/CR/qTP8SLRLAuI1lKRABhYeE+Q4BFHHU1Sqf
 PTNMMqHJq//3FXvRMjx1TS9rIhW8qP6JCH55343U=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 195/266] KVM: PPC: Book3S HV: Ignore kmemleak
 false positives
Date: Wed, 17 Jun 2020 21:15:20 -0400
Message-Id: <20200618011631.604574-195-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618011631.604574-1-sashal@kernel.org>
References: <20200618011631.604574-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Qian Cai <cai@lca.pw>,
 linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Qian Cai <cai@lca.pw>

[ Upstream commit 0aca8a5575544bd21b3363058afb8f1e81505150 ]

kvmppc_pmd_alloc() and kvmppc_pte_alloc() allocate some memory but then
pud_populate() and pmd_populate() will use __pa() to reference the newly
allocated memory.

Since kmemleak is unable to track the physical memory resulting in false
positives, silence those by using kmemleak_ignore().

unreferenced object 0xc000201c382a1000 (size 4096):
 comm "qemu-kvm", pid 124828, jiffies 4295733767 (age 341.250s)
 hex dump (first 32 bytes):
   c0 00 20 09 f4 60 03 87 c0 00 20 10 72 a0 03 87  .. ..`.... .r...
   c0 00 20 0e 13 a0 03 87 c0 00 20 1b dc c0 03 87  .. ....... .....
 backtrace:
   [<000000004cc2790f>] kvmppc_create_pte+0x838/0xd20 [kvm_hv]
   kvmppc_pmd_alloc at arch/powerpc/kvm/book3s_64_mmu_radix.c:366
   (inlined by) kvmppc_create_pte at arch/powerpc/kvm/book3s_64_mmu_radix.c:590
   [<00000000d123c49a>] kvmppc_book3s_instantiate_page+0x2e0/0x8c0 [kvm_hv]
   [<00000000bb549087>] kvmppc_book3s_radix_page_fault+0x1b4/0x2b0 [kvm_hv]
   [<0000000086dddc0e>] kvmppc_book3s_hv_page_fault+0x214/0x12a0 [kvm_hv]
   [<000000005ae9ccc2>] kvmppc_vcpu_run_hv+0xc5c/0x15f0 [kvm_hv]
   [<00000000d22162ff>] kvmppc_vcpu_run+0x34/0x48 [kvm]
   [<00000000d6953bc4>] kvm_arch_vcpu_ioctl_run+0x314/0x420 [kvm]
   [<000000002543dd54>] kvm_vcpu_ioctl+0x33c/0x950 [kvm]
   [<0000000048155cd6>] ksys_ioctl+0xd8/0x130
   [<0000000041ffeaa7>] sys_ioctl+0x28/0x40
   [<000000004afc4310>] system_call_exception+0x114/0x1e0
   [<00000000fb70a873>] system_call_common+0xf0/0x278
unreferenced object 0xc0002001f0c03900 (size 256):
 comm "qemu-kvm", pid 124830, jiffies 4295735235 (age 326.570s)
 hex dump (first 32 bytes):
   c0 00 20 10 fa a0 03 87 c0 00 20 10 fa a1 03 87  .. ....... .....
   c0 00 20 10 fa a2 03 87 c0 00 20 10 fa a3 03 87  .. ....... .....
 backtrace:
   [<0000000023f675b8>] kvmppc_create_pte+0x854/0xd20 [kvm_hv]
   kvmppc_pte_alloc at arch/powerpc/kvm/book3s_64_mmu_radix.c:356
   (inlined by) kvmppc_create_pte at arch/powerpc/kvm/book3s_64_mmu_radix.c:593
   [<00000000d123c49a>] kvmppc_book3s_instantiate_page+0x2e0/0x8c0 [kvm_hv]
   [<00000000bb549087>] kvmppc_book3s_radix_page_fault+0x1b4/0x2b0 [kvm_hv]
   [<0000000086dddc0e>] kvmppc_book3s_hv_page_fault+0x214/0x12a0 [kvm_hv]
   [<000000005ae9ccc2>] kvmppc_vcpu_run_hv+0xc5c/0x15f0 [kvm_hv]
   [<00000000d22162ff>] kvmppc_vcpu_run+0x34/0x48 [kvm]
   [<00000000d6953bc4>] kvm_arch_vcpu_ioctl_run+0x314/0x420 [kvm]
   [<000000002543dd54>] kvm_vcpu_ioctl+0x33c/0x950 [kvm]
   [<0000000048155cd6>] ksys_ioctl+0xd8/0x130
   [<0000000041ffeaa7>] sys_ioctl+0x28/0x40
   [<000000004afc4310>] system_call_exception+0x114/0x1e0
   [<00000000fb70a873>] system_call_common+0xf0/0x278

Signed-off-by: Qian Cai <cai@lca.pw>
Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kvm/book3s_64_mmu_radix.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 2d415c36a61d..43b56f8f6beb 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -353,7 +353,13 @@ static struct kmem_cache *kvm_pmd_cache;
 
 static pte_t *kvmppc_pte_alloc(void)
 {
-	return kmem_cache_alloc(kvm_pte_cache, GFP_KERNEL);
+	pte_t *pte;
+
+	pte = kmem_cache_alloc(kvm_pte_cache, GFP_KERNEL);
+	/* pmd_populate() will only reference _pa(pte). */
+	kmemleak_ignore(pte);
+
+	return pte;
 }
 
 static void kvmppc_pte_free(pte_t *ptep)
@@ -363,7 +369,13 @@ static void kvmppc_pte_free(pte_t *ptep)
 
 static pmd_t *kvmppc_pmd_alloc(void)
 {
-	return kmem_cache_alloc(kvm_pmd_cache, GFP_KERNEL);
+	pmd_t *pmd;
+
+	pmd = kmem_cache_alloc(kvm_pmd_cache, GFP_KERNEL);
+	/* pud_populate() will only reference _pa(pmd). */
+	kmemleak_ignore(pmd);
+
+	return pmd;
 }
 
 static void kvmppc_pmd_free(pmd_t *pmdp)
-- 
2.25.1

