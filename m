Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3AF6D3C88
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Apr 2023 06:42:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PqdXZ1Hfgz3chV
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Apr 2023 14:42:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=L3dFgnRq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PqdWk5vm0z3bhL
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Apr 2023 14:41:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=L3dFgnRq;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PqdWc12NMz4x4r;
	Mon,  3 Apr 2023 14:41:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1680496876;
	bh=AJ+M0yLGP/wyTIKjs+7s4MYh/6gISoFpB8MLIEaLvgQ=;
	h=From:To:Subject:Date:From;
	b=L3dFgnRqDTSBbFeXl468KBQdIC2G/ZKYq5llRpLNHjVV4YssFYOHXUKL6fGGdrV41
	 I2SFNYalOog5hbG12NQlrgdULtKtCl/re/1xd0bYfD9xhmXr9o1Ovg/S9gj4waPIoG
	 6GlBDij4Oi/SH3zJw2WYaIzQNTsepJwYCFsOQ2bUOVr9df/fRcTI52JgCq33CZEwp6
	 +9ddWLqoE/4Ws7EYhlgMNfK/FhMhA9MXct6gDzUtn/L6BPCJGcifb6P3ZOtRp4tg6+
	 ZJP9gk0soxzJQinBaBGzOKpwlSrf1rt0GtQiWWg3MzfamvLFuyCHpZh8Ee+3Ip62xx
	 9dsKYE0LGJFVg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] KVM: PPC: BookE: Fix W=1 warnings
Date: Mon,  3 Apr 2023 14:41:11 +1000
Message-Id: <20230403044111.3090468-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix various W=1 warnings in booke.c:

  arch/powerpc/kvm/booke.c:626:6: error: no previous prototype for ‘kvmppc_watchdog_func’ [-Werror=missing-prototypes]
    626 | void kvmppc_watchdog_func(struct timer_list *t)
        |      ^~~~~~~~~~~~~~~~~~~~
  arch/powerpc/kvm/booke.c:1008:5: error: no previous prototype for ‘kvmppc_handle_exit’ [-Werror=missing-prototypes]
   1008 | int kvmppc_handle_exit(struct kvm_vcpu *vcpu, unsigned int exit_nr)
        |     ^~~~~~~~~~~~~~~~~~
  arch/powerpc/kvm/booke.c:1949:6: error: no previous prototype for ‘kvm_guest_protect_msr’ [-Werror=missing-prototypes]
   1949 | void kvm_guest_protect_msr(struct kvm_vcpu *vcpu, ulong prot_bitmap, bool set)
        |      ^~~~~~~~~~~~~~~~~~~~~
  arch/powerpc/kvm/booke.c:1009: warning: Function parameter or member 'vcpu' not described in 'kvmppc_handle_exit'
  arch/powerpc/kvm/booke.c:1009: warning: Function parameter or member 'exit_nr' not described in 'kvmppc_handle_exit'

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/r/202304020827.3LEZ86WB-lkp@intel.com/
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kvm/booke.c | 7 ++++---
 arch/powerpc/kvm/booke.h | 3 +++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index 01adffb24667..5908f2cc6a81 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -623,7 +623,7 @@ static void arm_next_watchdog(struct kvm_vcpu *vcpu)
 	spin_unlock_irqrestore(&vcpu->arch.wdt_lock, flags);
 }
 
-void kvmppc_watchdog_func(struct timer_list *t)
+static void kvmppc_watchdog_func(struct timer_list *t)
 {
 	struct kvm_vcpu *vcpu = from_timer(vcpu, t, arch.wdt_timer);
 	u32 tsr, new_tsr;
@@ -1000,7 +1000,7 @@ static int kvmppc_resume_inst_load(struct kvm_vcpu *vcpu,
 	}
 }
 
-/**
+/*
  * kvmppc_handle_exit
  *
  * Return value is in the form (errcode<<2 | RESUME_FLAG_HOST | RESUME_FLAG_NV)
@@ -1946,7 +1946,8 @@ static int kvmppc_booke_add_watchpoint(struct debug_reg *dbg_reg, uint64_t addr,
 	dbg_reg->dbcr0 |= DBCR0_IDM;
 	return 0;
 }
-void kvm_guest_protect_msr(struct kvm_vcpu *vcpu, ulong prot_bitmap, bool set)
+
+static void kvm_guest_protect_msr(struct kvm_vcpu *vcpu, ulong prot_bitmap, bool set)
 {
 	/* XXX: Add similar MSR protection for BookE-PR */
 #ifdef CONFIG_KVM_BOOKE_HV
diff --git a/arch/powerpc/kvm/booke.h b/arch/powerpc/kvm/booke.h
index be9da96d9f06..9c5b8e76014f 100644
--- a/arch/powerpc/kvm/booke.h
+++ b/arch/powerpc/kvm/booke.h
@@ -109,4 +109,7 @@ static inline void kvmppc_clear_dbsr(void)
 {
 	mtspr(SPRN_DBSR, mfspr(SPRN_DBSR));
 }
+
+int kvmppc_handle_exit(struct kvm_vcpu *vcpu, unsigned int exit_nr);
+
 #endif /* __KVM_BOOKE_H__ */
-- 
2.39.2

