Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4194240AD4C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 14:15:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H82Nz1TTYz309j
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 22:15:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eGqXq7Su;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eGqXq7Su; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H82JL2KQGz305L
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 22:11:30 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD1916112D;
 Tue, 14 Sep 2021 12:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631621488;
 bh=3Eo7aeQUKWhSuHa2Yy03uZkrXM9xu16VG+SpPZYmMqA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eGqXq7SuYLFaSMofX/n34tYQjKjRKyp2rUzLBToahvHZpcV5HQmhV2FBHm2Ccvydo
 l8eo30W842/61Yv9t4FWfZFFCGvufPKBQHi5kkzh+DiJf8bANhWqwVnOcsZQCs4tBo
 LwvK8qr+yFOoPIfEEsMV0GmzoMeSanwUR9HQH8m0w85cDn2VmVj9fvfvT0iJ6jkJVd
 V1Y5Zjr0h7fIov1IHkiMaS3YxTC0kg2/JZyRIPQGbQSIl6Qr03blMuKQ1zOpFsItLu
 KIGqTNePxnKgfiuTrnr+3WECWPE9NgfnPAYGBNCwFRbbCChEoiqOnPHALJhShPddgZ
 TOxAb7CtKizuQ==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH 7/8] riscv: rely on core code to keep thread_info::cpu
 updated
Date: Tue, 14 Sep 2021 14:10:35 +0200
Message-Id: <20210914121036.3975026-8-ardb@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210914121036.3975026-1-ardb@kernel.org>
References: <20210914121036.3975026-1-ardb@kernel.org>
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
Cc: Peter Zijlstra <peterz@infradead.org>, Paul Mackerras <paulus@samba.org>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-s390@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Keith Packard <keithpac@amazon.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that the core code switched back to using thread_info::cpu to keep
a task's CPU number, we no longer need to keep it in sync explicitly. So
just drop the code that does this.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/riscv/kernel/asm-offsets.c | 1 -
 arch/riscv/kernel/entry.S       | 5 -----
 arch/riscv/kernel/head.S        | 1 -
 3 files changed, 7 deletions(-)

diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index 90f8ce64fa6f..478d9f02dab5 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -33,7 +33,6 @@ void asm_offsets(void)
 	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
 	OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
 	OFFSET(TASK_TI_USER_SP, task_struct, thread_info.user_sp);
-	OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
 
 	OFFSET(TASK_THREAD_F0,  task_struct, thread.fstate.f[0]);
 	OFFSET(TASK_THREAD_F1,  task_struct, thread.fstate.f[1]);
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 98f502654edd..459eb1714353 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -544,11 +544,6 @@ ENTRY(__switch_to)
 	REG_L s9,  TASK_THREAD_S9_RA(a4)
 	REG_L s10, TASK_THREAD_S10_RA(a4)
 	REG_L s11, TASK_THREAD_S11_RA(a4)
-	/* Swap the CPU entry around. */
-	lw a3, TASK_TI_CPU(a0)
-	lw a4, TASK_TI_CPU(a1)
-	sw a3, TASK_TI_CPU(a1)
-	sw a4, TASK_TI_CPU(a0)
 	/* The offset of thread_info in task_struct is zero. */
 	move tp, a1
 	ret
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index fce5184b22c3..d5ec30ef6f5d 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -317,7 +317,6 @@ clear_bss_done:
 	call setup_trap_vector
 	/* Restore C environment */
 	la tp, init_task
-	sw zero, TASK_TI_CPU(tp)
 	la sp, init_thread_union + THREAD_SIZE
 
 #ifdef CONFIG_KASAN
-- 
2.30.2

