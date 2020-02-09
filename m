Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 155AD156A3F
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Feb 2020 14:00:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Fq0F4gzRzDqPQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2020 00:00:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=q0pvgGxm; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48FpvF6jfwzDqM7
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Feb 2020 23:56:23 +1100 (AEDT)
Received: from localhost (unknown [38.98.37.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E6F9720733;
 Sun,  9 Feb 2020 12:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581252981;
 bh=wEuQkILbzCrkndaHaGMt/QtlgcEM66cBemstNp3v6fc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q0pvgGxmXPCg+rjYkFKJt2HyuXWgGZhiT7YOmln8fKJBzYM12o/J5X1vbWBzh0oeF
 Lq/3rIDWIZgfAtdZxifVETZ/neuldW0mlzsYEYkBkP6uqbgHtUa1VwGzmeUklx18du
 uCFghsuR0sqpWrr+L2oCz8XA374intx0hYUB0BqE=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/6] powerpc: kvm: no need to check return value of
 debugfs_create functions
Date: Sun,  9 Feb 2020 11:58:57 +0100
Message-Id: <20200209105901.1620958-2-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200209105901.1620958-1-gregkh@linuxfoundation.org>
References: <20200209105901.1620958-1-gregkh@linuxfoundation.org>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Because of this cleanup, we get to remove a few fields in struct
kvm_arch that are now unused.

Cc: Paul Mackerras <paulus@ozlabs.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: kvm-ppc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/powerpc/include/asm/kvm_host.h    |  3 ---
 arch/powerpc/kvm/book3s_64_mmu_hv.c    |  5 ++---
 arch/powerpc/kvm/book3s_64_mmu_radix.c |  5 ++---
 arch/powerpc/kvm/book3s_hv.c           |  9 ++-------
 arch/powerpc/kvm/timing.c              | 13 +++----------
 5 files changed, 9 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 6e8b8ffd06ad..877f8aa2bc1e 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -308,8 +308,6 @@ struct kvm_arch {
 	pgd_t *pgtable;
 	u64 process_table;
 	struct dentry *debugfs_dir;
-	struct dentry *htab_dentry;
-	struct dentry *radix_dentry;
 	struct kvm_resize_hpt *resize_hpt; /* protected by kvm->lock */
 #endif /* CONFIG_KVM_BOOK3S_HV_POSSIBLE */
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
@@ -830,7 +828,6 @@ struct kvm_vcpu_arch {
 	struct kvmhv_tb_accumulator cede_time;	/* time napping inside guest */
 
 	struct dentry *debugfs_dir;
-	struct dentry *debugfs_timings;
 #endif /* CONFIG_KVM_BOOK3S_HV_EXIT_TIMING */
 };
 
diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index 6c372f5c61b6..8b4eac0c9dcd 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -2138,9 +2138,8 @@ static const struct file_operations debugfs_htab_fops = {
 
 void kvmppc_mmu_debugfs_init(struct kvm *kvm)
 {
-	kvm->arch.htab_dentry = debugfs_create_file("htab", 0400,
-						    kvm->arch.debugfs_dir, kvm,
-						    &debugfs_htab_fops);
+	debugfs_create_file("htab", 0400, kvm->arch.debugfs_dir, kvm,
+			    &debugfs_htab_fops);
 }
 
 void kvmppc_mmu_book3s_hv_init(struct kvm_vcpu *vcpu)
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 803940d79b73..1d75ed684b53 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -1376,9 +1376,8 @@ static const struct file_operations debugfs_radix_fops = {
 
 void kvmhv_radix_debugfs_init(struct kvm *kvm)
 {
-	kvm->arch.radix_dentry = debugfs_create_file("radix", 0400,
-						     kvm->arch.debugfs_dir, kvm,
-						     &debugfs_radix_fops);
+	debugfs_create_file("radix", 0400, kvm->arch.debugfs_dir, kvm,
+			    &debugfs_radix_fops);
 }
 
 int kvmppc_radix_init(void)
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 2cefd071b848..33be4d93248a 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -2258,14 +2258,9 @@ static void debugfs_vcpu_init(struct kvm_vcpu *vcpu, unsigned int id)
 	struct kvm *kvm = vcpu->kvm;
 
 	snprintf(buf, sizeof(buf), "vcpu%u", id);
-	if (IS_ERR_OR_NULL(kvm->arch.debugfs_dir))
-		return;
 	vcpu->arch.debugfs_dir = debugfs_create_dir(buf, kvm->arch.debugfs_dir);
-	if (IS_ERR_OR_NULL(vcpu->arch.debugfs_dir))
-		return;
-	vcpu->arch.debugfs_timings =
-		debugfs_create_file("timings", 0444, vcpu->arch.debugfs_dir,
-				    vcpu, &debugfs_timings_ops);
+	debugfs_create_file("timings", 0444, vcpu->arch.debugfs_dir, vcpu,
+			    &debugfs_timings_ops);
 }
 
 #else /* CONFIG_KVM_BOOK3S_HV_EXIT_TIMING */
diff --git a/arch/powerpc/kvm/timing.c b/arch/powerpc/kvm/timing.c
index bfe4f106cffc..8e4791c6f2af 100644
--- a/arch/powerpc/kvm/timing.c
+++ b/arch/powerpc/kvm/timing.c
@@ -207,19 +207,12 @@ static const struct file_operations kvmppc_exit_timing_fops = {
 void kvmppc_create_vcpu_debugfs(struct kvm_vcpu *vcpu, unsigned int id)
 {
 	static char dbg_fname[50];
-	struct dentry *debugfs_file;
 
 	snprintf(dbg_fname, sizeof(dbg_fname), "vm%u_vcpu%u_timing",
 		 current->pid, id);
-	debugfs_file = debugfs_create_file(dbg_fname, 0666,
-					kvm_debugfs_dir, vcpu,
-					&kvmppc_exit_timing_fops);
-
-	if (!debugfs_file) {
-		printk(KERN_ERR"%s: error creating debugfs file %s\n",
-			__func__, dbg_fname);
-		return;
-	}
+	debugfs_create_file(dbg_fname, 0666, kvm_debugfs_dir, vcpu,
+			    &kvmppc_exit_timing_fops);
+
 
 	vcpu->arch.debugfs_exit_timing = debugfs_file;
 }
-- 
2.25.0

