Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 550643BE1E1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jul 2021 06:21:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GKR8C1q2Yz2yLs
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jul 2021 14:21:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
X-Greylist: delayed 425 seconds by postgrey-1.36 at boromir;
 Wed, 07 Jul 2021 14:21:30 AEST
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4GKR7t3G84z302g
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jul 2021 14:21:29 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 8F9D3AE80026;
 Wed,  7 Jul 2021 00:13:47 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel] KVM: PPC: Book3S HV: Make unique debugfs nodename
Date: Wed,  7 Jul 2021 14:13:44 +1000
Message-Id: <20210707041344.3803554-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently it is vm-$currentpid which works as long as there is just one
VM per the userspace (99.99% cases) but produces a bunch
of "debugfs: Directory 'vm16679' with parent 'kvm' already present!"
when syzkaller (syscall fuzzer) is running so only one VM is present in
the debugfs for a given process.

This changes the debugfs node to include the LPID which alone should be
system wide unique. This leaves the existing pid for the convenience of
matching the VM's debugfs with the running userspace process (QEMU).

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/kvm/book3s_hv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 1d1fcc290fca..0223ddc0eed0 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -5227,7 +5227,7 @@ static int kvmppc_core_init_vm_hv(struct kvm *kvm)
 	/*
 	 * Create a debugfs directory for the VM
 	 */
-	snprintf(buf, sizeof(buf), "vm%d", current->pid);
+	snprintf(buf, sizeof(buf), "vm%d-lp%ld", current->pid, lpid);
 	kvm->arch.debugfs_dir = debugfs_create_dir(buf, kvm_debugfs_dir);
 	kvmppc_mmu_debugfs_init(kvm);
 	if (radix_enabled())
-- 
2.30.2

