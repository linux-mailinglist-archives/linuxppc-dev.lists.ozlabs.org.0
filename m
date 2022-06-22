Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E49E5550A8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 18:02:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSp7c2RRcz3fLV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 02:02:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=chenzhongjin@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSnwG289Xz3cdB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jun 2022 01:53:02 +1000 (AEST)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LSnr14GrszSh5g;
	Wed, 22 Jun 2022 23:49:21 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 22 Jun 2022 23:52:45 +0800
Received: from ubuntu1804.huawei.com (10.67.175.36) by
 dggpemm500013.china.huawei.com (7.185.36.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 22 Jun 2022 23:52:45 +0800
From: Chen Zhongjin <chenzhongjin@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kbuild@vger.kernel.org>, <live-patching@vger.kernel.org>
Subject: [PATCH v5 21/33] arm64: kvm: Annotate unwind_hint for hyp entry
Date: Wed, 22 Jun 2022 23:49:08 +0800
Message-ID: <20220622154920.95075-22-chenzhongjin@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220622154920.95075-1-chenzhongjin@huawei.com>
References: <20220622154920.95075-1-chenzhongjin@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.175.36]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500013.china.huawei.com (7.185.36.172)
X-CFilter-Loop: Reflected
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
Cc: mark.rutland@arm.com, madvenka@linux.microsoft.com, michal.lkml@markovi.net, pasha.tatashin@soleen.com, peterz@infradead.org, catalin.marinas@arm.com, masahiroy@kernel.org, ndesaulniers@google.com, chenzhongjin@huawei.com, rmk+kernel@armlinux.org.uk, broonie@kernel.org, will@kernel.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Symbol __guest_enter and kvm_hyp_vector saved x0, x1 on stack.

Symbol __guest_exit and __guest_exit_panic is reached when resuming
EL2 execution, and the previous stack pointer gets restored.

Add adequate unwind hints.

Signed-off-by: Julien Thierry <jthierry@redhat.com>
Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
---
 arch/arm64/kvm/hyp/entry.S     | 5 +++++
 arch/arm64/kvm/hyp/hyp-entry.S | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm64/kvm/hyp/entry.S b/arch/arm64/kvm/hyp/entry.S
index 045d4481c820..81e30d56bf28 100644
--- a/arch/arm64/kvm/hyp/entry.S
+++ b/arch/arm64/kvm/hyp/entry.S
@@ -15,6 +15,7 @@
 #include <asm/kvm_mmu.h>
 #include <asm/kvm_mte.h>
 #include <asm/kvm_ptrauth.h>
+#include <asm/unwind_hints.h>
 
 	.text
 
@@ -22,6 +23,7 @@
  * u64 __guest_enter(struct kvm_vcpu *vcpu);
  */
 SYM_CODE_START(__guest_enter)
+	UNWIND_HINT_FUNC
 	// x0: vcpu
 	// x1-x17: clobbered by macros
 	// x29: guest context
@@ -88,6 +90,7 @@ SYM_INNER_LABEL(__guest_exit_panic, SYM_L_GLOBAL)
 	// vcpu x0-x1 on the stack
 
 	// If the hyp context is loaded, go straight to hyp_panic
+	UNWIND_HINT_FUNC
 	get_loaded_vcpu x0, x1
 	cbnz	x0, 1f
 	b	hyp_panic
@@ -110,6 +113,7 @@ SYM_INNER_LABEL(__guest_exit, SYM_L_GLOBAL)
 	// x1: vcpu
 	// x2-x29,lr: vcpu regs
 	// vcpu x0-x1 on the stack
+	UNWIND_HINT_FUNC sp_offset=16
 
 	add	x1, x1, #VCPU_CONTEXT
 
@@ -199,6 +203,7 @@ abort_guest_exit_end:
 	msr	daifset, #4	// Mask aborts
 	ret
 
+	UNWIND_HINT_FUNC
 	_kvm_extable	abort_guest_exit_start, 9997f
 	_kvm_extable	abort_guest_exit_end, 9997f
 9997:
diff --git a/arch/arm64/kvm/hyp/hyp-entry.S b/arch/arm64/kvm/hyp/hyp-entry.S
index 4a65262a4f3a..d72143c59707 100644
--- a/arch/arm64/kvm/hyp/hyp-entry.S
+++ b/arch/arm64/kvm/hyp/hyp-entry.S
@@ -151,6 +151,7 @@ SYM_CODE_END(\label)
 
 .macro valid_vect target
 	.align 7
+	UNWIND_HINT_FUNC
 661:
 	esb
 	stp	x0, x1, [sp, #-16]!
@@ -162,6 +163,7 @@ check_preamble_length 661b, 662b
 
 .macro invalid_vect target
 	.align 7
+	UNWIND_HINT_FUNC
 661:
 	nop
 	stp	x0, x1, [sp, #-16]!
@@ -209,6 +211,7 @@ SYM_CODE_END(__kvm_hyp_vector)
 .macro hyp_ventry	indirect, spectrev2
 	.align	7
 1:	esb
+	UNWIND_HINT_FUNC
 	.if \spectrev2 != 0
 	spectrev2_smccc_wa1_smc
 	.else
-- 
2.17.1

