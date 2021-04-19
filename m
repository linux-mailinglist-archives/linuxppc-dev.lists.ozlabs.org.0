Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDB536412D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 14:02:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FP55q2mxxz30GD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 22:02:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CHYfao/W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=CHYfao/W; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FP55Q1FVwz2xYd
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 22:01:45 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FP55P16ZXz9tlB; Mon, 19 Apr 2021 22:01:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1618833705;
 bh=Zk/xJ1WJy0d9ipj/dDcSW2umjEfymDbl/vAyn+8IIZo=;
 h=From:To:Cc:Subject:Date:From;
 b=CHYfao/WngBzEEa4m3SGxvVoMqUc9VaU3ctho9ZrQZ6cwEoGVa0X5iakv2lbLnMdc
 jSfUThmcH4vusHrIgNSiUXB4fd/SZlgSuu5NkGueWyVPKb/wvRf2yfHXaz6BuUTP0O
 jkjOJe11nen+oREvSAxaViniH2T2KIb59dQHrjqOQ9HhD3f/uxyrk0UInhIvXfK2JF
 yinrDOL3RUlwLf6mmva+hKteMi5hd3YMMMkR6IHqMotTWEGGamvhp/vyMtCDJ48ZFZ
 63auToQ8Axi0QCqBDJuKdw2ly0FVMXEdharvCUYinIR2rkvbTfDS7V9EoPckici/Df
 +XVgwNo4FfMrw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/kvm: Fix PR KVM with KUAP/MEM_KEYS enabled
Date: Mon, 19 Apr 2021 22:01:39 +1000
Message-Id: <20210419120139.1455937-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Cc: aneesh.kumar@linux.ibm.com, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The changes to add KUAP support with the hash MMU broke booting of KVM
PR guests. The symptom is no visible progress of the guest, or possibly
just "SLOF" being printed to the qemu console.

Host code is still executing, but breaking into xmon might show a stack
trace such as:

  __might_fault+0x84/0xe0 (unreliable)
  kvm_read_guest+0x1c8/0x2f0 [kvm]
  kvmppc_ld+0x1b8/0x2d0 [kvm]
  kvmppc_load_last_inst+0x50/0xa0 [kvm]
  kvmppc_exit_pr_progint+0x178/0x220 [kvm_pr]
  kvmppc_handle_exit_pr+0x31c/0xe30 [kvm_pr]
  after_sprg3_load+0x80/0x90 [kvm_pr]
  kvmppc_vcpu_run_pr+0x104/0x260 [kvm_pr]
  kvmppc_vcpu_run+0x34/0x48 [kvm]
  kvm_arch_vcpu_ioctl_run+0x340/0x450 [kvm]
  kvm_vcpu_ioctl+0x2ac/0x8c0 [kvm]
  sys_ioctl+0x320/0x1060
  system_call_exception+0x160/0x270
  system_call_common+0xf0/0x27c

Bisect points to commit b2ff33a10c8b ("powerpc/book3s64/hash/kuap:
Enable kuap on hash"), but that's just the commit that enabled KUAP with
hash and made the bug visible.

The root cause seems to be that KVM PR is creating kernel mappings that
don't use the correct key, since we switched to using key 3.

We have a helper for adding the right key value, however it's designed
to take a pteflags variable, which the KVM code doesn't have. But we can
make it work by passing 0 for the pteflags, and tell it explicitly that
it should use the kernel key.

With that changed guests boot successfully.

Fixes: d94b827e89dc ("powerpc/book3s64/kuap: Use Key 3 for kernel mapping with hash translation")
Cc: stable@vger.kernel.org # v5.11+
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kvm/book3s_64_mmu_host.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_host.c b/arch/powerpc/kvm/book3s_64_mmu_host.c
index e452158a18d7..5ac66be1cb3c 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_host.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_host.c
@@ -12,6 +12,7 @@
 #include <asm/kvm_ppc.h>
 #include <asm/kvm_book3s.h>
 #include <asm/book3s/64/mmu-hash.h>
+#include <asm/book3s/64/pkeys.h>
 #include <asm/machdep.h>
 #include <asm/mmu_context.h>
 #include <asm/hw_irq.h>
@@ -133,6 +134,7 @@ int kvmppc_mmu_map_page(struct kvm_vcpu *vcpu, struct kvmppc_pte *orig_pte,
 	else
 		kvmppc_mmu_flush_icache(pfn);
 
+	rflags |= pte_to_hpte_pkey_bits(0, HPTE_USE_KERNEL_KEY);
 	rflags = (rflags & ~HPTE_R_WIMG) | orig_pte->wimg;
 
 	/*
-- 
2.25.1

