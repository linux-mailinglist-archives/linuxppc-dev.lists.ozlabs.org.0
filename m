Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEDD29A0AE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Oct 2020 01:36:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKt7747jDzDq9W
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Oct 2020 11:36:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=ufWOO/jw; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKs8F6lt1zDqQ8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Oct 2020 10:52:29 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E4EC621655;
 Mon, 26 Oct 2020 23:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603756346;
 bh=hDWv18K8FFoNMJrL7sEu3v5o+lDr5Vb/t6ZxAzE8q5Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ufWOO/jwnvNvm6hE1lCZlpksP4jKQCGmO6XF6bCqifkibm5eJtEE9T97Eykib/BIf
 9jk12Zc95y612OSLD22IQuf1q5jiy5x83OgTF1cyxug9BbGB3RzfModPGU/+75ngPZ
 1vabGujanw62jt/8M5N5mo59tVituQSv/HpZ9kjI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 018/132] powerpc/64s: handle ISA v3.1 local
 copy-paste context switches
Date: Mon, 26 Oct 2020 19:50:10 -0400
Message-Id: <20201026235205.1023962-18-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026235205.1023962-1-sashal@kernel.org>
References: <20201026235205.1023962-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, kvm-ppc@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nicholas Piggin <npiggin@gmail.com>

[ Upstream commit dc462267d2d7aacffc3c1d99b02d7a7c59db7c66 ]

The ISA v3.1 the copy-paste facility has a new memory move functionality
which allows the copy buffer to be pasted to domestic memory (RAM) as
opposed to foreign memory (accelerator).

This means the POWER9 trick of avoiding the cp_abort on context switch if
the process had not mapped foreign memory does not work on POWER10. Do the
cp_abort unconditionally there.

KVM must also cp_abort on guest exit to prevent copy buffer state leaking
between contexts.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Acked-by: Paul Mackerras <paulus@ozlabs.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20200825075535.224536-1-npiggin@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/process.c           | 16 +++++++++-------
 arch/powerpc/kvm/book3s_hv.c            |  7 +++++++
 arch/powerpc/kvm/book3s_hv_rmhandlers.S |  8 ++++++++
 3 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 4650b9bb217fb..fcae69ac9acaa 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1231,15 +1231,17 @@ struct task_struct *__switch_to(struct task_struct *prev,
 		restore_math(current->thread.regs);
 
 		/*
-		 * The copy-paste buffer can only store into foreign real
-		 * addresses, so unprivileged processes can not see the
-		 * data or use it in any way unless they have foreign real
-		 * mappings. If the new process has the foreign real address
-		 * mappings, we must issue a cp_abort to clear any state and
-		 * prevent snooping, corruption or a covert channel.
+		 * On POWER9 the copy-paste buffer can only paste into
+		 * foreign real addresses, so unprivileged processes can not
+		 * see the data or use it in any way unless they have
+		 * foreign real mappings. If the new process has the foreign
+		 * real address mappings, we must issue a cp_abort to clear
+		 * any state and prevent snooping, corruption or a covert
+		 * channel. ISA v3.1 supports paste into local memory.
 		 */
 		if (current->mm &&
-			atomic_read(&current->mm->context.vas_windows))
+			(cpu_has_feature(CPU_FTR_ARCH_31) ||
+			atomic_read(&current->mm->context.vas_windows)))
 			asm volatile(PPC_CP_ABORT);
 	}
 #endif /* CONFIG_PPC_BOOK3S_64 */
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 6bf66649ab92f..1928b86d6e6b5 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3485,6 +3485,13 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 	 */
 	asm volatile("eieio; tlbsync; ptesync");
 
+	/*
+	 * cp_abort is required if the processor supports local copy-paste
+	 * to clear the copy buffer that was under control of the guest.
+	 */
+	if (cpu_has_feature(CPU_FTR_ARCH_31))
+		asm volatile(PPC_CP_ABORT);
+
 	mtspr(SPRN_LPID, vcpu->kvm->arch.host_lpid);	/* restore host LPID */
 	isync();
 
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 71943892c81c6..092ef0ee29753 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -1830,6 +1830,14 @@ END_FTR_SECTION_IFSET(CPU_FTR_P9_RADIX_PREFETCH_BUG)
 2:
 #endif /* CONFIG_PPC_RADIX_MMU */
 
+	/*
+	 * cp_abort is required if the processor supports local copy-paste
+	 * to clear the copy buffer that was under control of the guest.
+	 */
+BEGIN_FTR_SECTION
+	PPC_CP_ABORT
+END_FTR_SECTION_IFSET(CPU_FTR_ARCH_31)
+
 	/*
 	 * POWER7/POWER8 guest -> host partition switch code.
 	 * We don't have to lock against tlbies but we do
-- 
2.25.1

