Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2401939F5F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jun 2019 13:58:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45LdG91XKGzDqxX
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jun 2019 21:58:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="g60DYRQq"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Lcz46VDwzDqkb
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jun 2019 21:45:36 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D4EB5214D8;
 Sat,  8 Jun 2019 11:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559994333;
 bh=aTAjHWnmhBwOH3nrTA/x1z+5nFP+4mKcGJ6YvIg1hFE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g60DYRQq/UheYBRq8vgPy7zRU3I5n1eHpvz5W4Y9SLov41cUVrwOUfJn5agSzJsUL
 VGidpNPRtzIWt26KT60+qSyv/l4FG9UJCSogc3XkKAoB1hq+RWqi9qIUJwojniSWyA
 /P7/8gR4RRcpPSKKlPb+ermynlCzdU0ql/H4anlo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 36/49] KVM: PPC: Book3S: Use new mutex to
 synchronize access to rtas token list
Date: Sat,  8 Jun 2019 07:42:17 -0400
Message-Id: <20190608114232.8731-36-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190608114232.8731-1-sashal@kernel.org>
References: <20190608114232.8731-1-sashal@kernel.org>
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

[ Upstream commit 1659e27d2bc1ef47b6d031abe01b467f18cb72d9 ]

Currently the Book 3S KVM code uses kvm->lock to synchronize access
to the kvm->arch.rtas_tokens list.  Because this list is scanned
inside kvmppc_rtas_hcall(), which is called with the vcpu mutex held,
taking kvm->lock cause a lock inversion problem, which could lead to
a deadlock.

To fix this, we add a new mutex, kvm->arch.rtas_token_lock, which nests
inside the vcpu mutexes, and use that instead of kvm->lock when
accessing the rtas token list.

This removes the lockdep_assert_held() in kvmppc_rtas_tokens_free().
At this point we don't hold the new mutex, but that is OK because
kvmppc_rtas_tokens_free() is only called when the whole VM is being
destroyed, and at that point nothing can be looking up a token in
the list.

Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/include/asm/kvm_host.h |  1 +
 arch/powerpc/kvm/book3s.c           |  1 +
 arch/powerpc/kvm/book3s_rtas.c      | 14 ++++++--------
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index bccc5051249e..2b6049e83970 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -299,6 +299,7 @@ struct kvm_arch {
 #ifdef CONFIG_PPC_BOOK3S_64
 	struct list_head spapr_tce_tables;
 	struct list_head rtas_tokens;
+	struct mutex rtas_token_lock;
 	DECLARE_BITMAP(enabled_hcalls, MAX_HCALL_OPCODE/4 + 1);
 #endif
 #ifdef CONFIG_KVM_MPIC
diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index 87348e498c89..281f074581a3 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -840,6 +840,7 @@ int kvmppc_core_init_vm(struct kvm *kvm)
 #ifdef CONFIG_PPC64
 	INIT_LIST_HEAD_RCU(&kvm->arch.spapr_tce_tables);
 	INIT_LIST_HEAD(&kvm->arch.rtas_tokens);
+	mutex_init(&kvm->arch.rtas_token_lock);
 #endif
 
 	return kvm->arch.kvm_ops->init_vm(kvm);
diff --git a/arch/powerpc/kvm/book3s_rtas.c b/arch/powerpc/kvm/book3s_rtas.c
index 2d3b2b1cc272..8f2355138f80 100644
--- a/arch/powerpc/kvm/book3s_rtas.c
+++ b/arch/powerpc/kvm/book3s_rtas.c
@@ -146,7 +146,7 @@ static int rtas_token_undefine(struct kvm *kvm, char *name)
 {
 	struct rtas_token_definition *d, *tmp;
 
-	lockdep_assert_held(&kvm->lock);
+	lockdep_assert_held(&kvm->arch.rtas_token_lock);
 
 	list_for_each_entry_safe(d, tmp, &kvm->arch.rtas_tokens, list) {
 		if (rtas_name_matches(d->handler->name, name)) {
@@ -167,7 +167,7 @@ static int rtas_token_define(struct kvm *kvm, char *name, u64 token)
 	bool found;
 	int i;
 
-	lockdep_assert_held(&kvm->lock);
+	lockdep_assert_held(&kvm->arch.rtas_token_lock);
 
 	list_for_each_entry(d, &kvm->arch.rtas_tokens, list) {
 		if (d->token == token)
@@ -206,14 +206,14 @@ int kvm_vm_ioctl_rtas_define_token(struct kvm *kvm, void __user *argp)
 	if (copy_from_user(&args, argp, sizeof(args)))
 		return -EFAULT;
 
-	mutex_lock(&kvm->lock);
+	mutex_lock(&kvm->arch.rtas_token_lock);
 
 	if (args.token)
 		rc = rtas_token_define(kvm, args.name, args.token);
 	else
 		rc = rtas_token_undefine(kvm, args.name);
 
-	mutex_unlock(&kvm->lock);
+	mutex_unlock(&kvm->arch.rtas_token_lock);
 
 	return rc;
 }
@@ -245,7 +245,7 @@ int kvmppc_rtas_hcall(struct kvm_vcpu *vcpu)
 	orig_rets = args.rets;
 	args.rets = &args.args[be32_to_cpu(args.nargs)];
 
-	mutex_lock(&vcpu->kvm->lock);
+	mutex_lock(&vcpu->kvm->arch.rtas_token_lock);
 
 	rc = -ENOENT;
 	list_for_each_entry(d, &vcpu->kvm->arch.rtas_tokens, list) {
@@ -256,7 +256,7 @@ int kvmppc_rtas_hcall(struct kvm_vcpu *vcpu)
 		}
 	}
 
-	mutex_unlock(&vcpu->kvm->lock);
+	mutex_unlock(&vcpu->kvm->arch.rtas_token_lock);
 
 	if (rc == 0) {
 		args.rets = orig_rets;
@@ -282,8 +282,6 @@ void kvmppc_rtas_tokens_free(struct kvm *kvm)
 {
 	struct rtas_token_definition *d, *tmp;
 
-	lockdep_assert_held(&kvm->lock);
-
 	list_for_each_entry_safe(d, tmp, &kvm->arch.rtas_tokens, list) {
 		list_del(&d->list);
 		kfree(d);
-- 
2.20.1

