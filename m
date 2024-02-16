Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1126F858221
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 17:10:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HJaT5BWS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tbxjd71jDz3vZj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Feb 2024 03:10:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HJaT5BWS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.178; helo=out-178.mta0.migadu.com; envelope-from=oliver.upton@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 556 seconds by postgrey-1.37 at boromir; Sat, 17 Feb 2024 03:09:49 AEDT
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tbxhs1C8bz2yq4
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Feb 2024 03:09:48 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1708099199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7Gmt3BZeS8RFm72X8X8sJg3/SSmmSkJFO1q6nTV3Suo=;
	b=HJaT5BWS4uxFC6UFeVy4nov0HxfRiVDg9bNe5LZ0a3KwXko3RYLdUg1GNNAml18SbfPs+/
	gtkxdGq5pZ1pqrZPBN/puEMYAhm2RHO71RmUhlriBMq+Hy/5a9BDI65VGOgKmLqYLWDvkP
	xWLCC0GZQbLkbnUKZ5z8fkXpOrIsAyk=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvm@vger.kernel.org
Subject: [PATCH] KVM: Get rid of return value from kvm_arch_create_vm_debugfs()
Date: Fri, 16 Feb 2024 15:59:41 +0000
Message-ID: <20240216155941.2029458-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Cc: Marc Zyngier <maz@kernel.org>, Sebastian Ene <sebastianene@google.com>, linux-kernel@vger.kernel.org, aneesh.kumar@kernel.org, kvmarm@lists.linux.dev, Oliver Upton <oliver.upton@linux.dev>, Nicholas Piggin <npiggin@gmail.com>, Sean Christopherson <seanjc@google.com>, naveen.n.rao@linux.ibm.com, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The general expectation with debugfs is that any initialization failure
is nonfatal. Nevertheless, kvm_arch_create_vm_debugfs() allows
implementations to return an error and kvm_create_vm_debugfs() allows
that to fail VM creation.

Change to a void return to discourage architectures from making debugfs
failures fatal for the VM. Seems like everyone already had the right
idea, as all implementations already return 0 unconditionally.

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---

Compile-tested on arm64, powerpc, and x86 since I don't trust myself to
even get this simple patch right.

 arch/powerpc/kvm/powerpc.c | 3 +--
 arch/x86/kvm/debugfs.c     | 3 +--
 include/linux/kvm_host.h   | 2 +-
 virt/kvm/kvm_main.c        | 8 ++------
 4 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 23407fbd73c9..d32abe7fe6ab 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -2538,9 +2538,8 @@ void kvm_arch_create_vcpu_debugfs(struct kvm_vcpu *vcpu, struct dentry *debugfs_
 		vcpu->kvm->arch.kvm_ops->create_vcpu_debugfs(vcpu, debugfs_dentry);
 }
 
-int kvm_arch_create_vm_debugfs(struct kvm *kvm)
+void kvm_arch_create_vm_debugfs(struct kvm *kvm)
 {
 	if (kvm->arch.kvm_ops->create_vm_debugfs)
 		kvm->arch.kvm_ops->create_vm_debugfs(kvm);
-	return 0;
 }
diff --git a/arch/x86/kvm/debugfs.c b/arch/x86/kvm/debugfs.c
index 95ea1a1f7403..999227fc7c66 100644
--- a/arch/x86/kvm/debugfs.c
+++ b/arch/x86/kvm/debugfs.c
@@ -189,9 +189,8 @@ static const struct file_operations mmu_rmaps_stat_fops = {
 	.release	= kvm_mmu_rmaps_stat_release,
 };
 
-int kvm_arch_create_vm_debugfs(struct kvm *kvm)
+void kvm_arch_create_vm_debugfs(struct kvm *kvm)
 {
 	debugfs_create_file("mmu_rmaps_stat", 0644, kvm->debugfs_dentry, kvm,
 			    &mmu_rmaps_stat_fops);
-	return 0;
 }
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 7e7fd25b09b3..9a45f673f687 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1507,7 +1507,7 @@ bool kvm_arch_dy_runnable(struct kvm_vcpu *vcpu);
 bool kvm_arch_dy_has_pending_interrupt(struct kvm_vcpu *vcpu);
 int kvm_arch_post_init_vm(struct kvm *kvm);
 void kvm_arch_pre_destroy_vm(struct kvm *kvm);
-int kvm_arch_create_vm_debugfs(struct kvm *kvm);
+void kvm_arch_create_vm_debugfs(struct kvm *kvm);
 
 #ifndef __KVM_HAVE_ARCH_VM_ALLOC
 /*
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 10bfc88a69f7..c681149c382a 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1150,10 +1150,7 @@ static int kvm_create_vm_debugfs(struct kvm *kvm, const char *fdname)
 				    &stat_fops_per_vm);
 	}
 
-	ret = kvm_arch_create_vm_debugfs(kvm);
-	if (ret)
-		goto out_err;
-
+	kvm_arch_create_vm_debugfs(kvm);
 	return 0;
 out_err:
 	kvm_destroy_vm_debugfs(kvm);
@@ -1183,9 +1180,8 @@ void __weak kvm_arch_pre_destroy_vm(struct kvm *kvm)
  * Cleanup should be automatic done in kvm_destroy_vm_debugfs() recursively, so
  * a per-arch destroy interface is not needed.
  */
-int __weak kvm_arch_create_vm_debugfs(struct kvm *kvm)
+void __weak kvm_arch_create_vm_debugfs(struct kvm *kvm)
 {
-	return 0;
 }
 
 static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)

base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
-- 
2.44.0.rc0.258.g7320e95886-goog

