Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2074B3AFCB5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 07:31:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8FPG6LDVz309T
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 15:31:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=DUJobmKU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DUJobmKU; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8FNp34BPz2yWG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 15:30:49 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id bb20so7231608pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 22:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JlIZKXO69QtGQlPiZa88L0vxWmZDsHPmtA+5U4BAEjE=;
 b=DUJobmKU6vcvxc5I7FzE7oG7sPuZcpgLrkrsgiDvtXwNqEQDkZ3dlnKK17RHipOpH8
 ERh5BFgEFLO1r6dmcyoXCpFJhMFXdJDuwNQaV7P569xSf5E5dVNyE3BkvsU0J7p/ecO7
 PF7Dzlt49uE7GyX46WOHnzp6jdkjlyTml4V8scfYQIFScyyvJA/8Sl8X644/U9KgLXhi
 9pKLkASiKnyku5Q0XxzkIy8qh0YGvOyYwiTvV4Q6KCaaJBqwba/QCV8cTKLi5IFW5ZOy
 jBcJnrG731RlSfzBEEfPRahhz8pvgk2EttNPhMHFGNlf8NjeKah3T6OhacM3FCENjRcX
 tihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JlIZKXO69QtGQlPiZa88L0vxWmZDsHPmtA+5U4BAEjE=;
 b=X0+iExiG1yncnakjH2xAg9eZ0nDbXSzzn18JMJErs4IqTPPduWZDoxjrnsSWH0GZTv
 AGtjw9cwi2woBTnDOKkXLu3IQiyIfu+JaHTL2Pzdoh5bN9EIeigkdk9vcxvEqkf+WAH8
 /ZspPlN5Tc3NcMJWZ/xau8JjeuSx3L/1LQIq5g0S7xhAnuVO/FS/u83iC52MgfW4dAP4
 o2IEWvnVrNLMqnHhG8UysVQed1LNddcSv85ECkZrxR9TrI1Kc5piG0oS2ArjVxMbu9Ws
 nTcZ7vvEocDQlh3xMTixW9FdSdYmowmBFmsdyW/kED5hekRlCt6IBW+l4BS7r5114M3I
 txaA==
X-Gm-Message-State: AOAM532/A4CC2Kfn9aDID7JJ6Taa2EDf8n0+yLz8I/QL4MgQ3ZEfU5QZ
 dvEZIShane4aa6BHz99IRNjUV6Xm4qE=
X-Google-Smtp-Source: ABdhPJxw+vlaG5h+AulkqmhQnYVAYLQi6SoSbT8jTqE3ZHDrL/poY3N6Yz7CpKdbt11xf6shGvm0yg==
X-Received: by 2002:a17:902:d909:b029:11b:870f:ddad with SMTP id
 c9-20020a170902d909b029011b870fddadmr21288279plz.81.1624339843753; 
 Mon, 21 Jun 2021 22:30:43 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id f21sm912004pjp.39.2021.06.21.22.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 22:30:43 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s: Fix copy-paste data exposure into newly created
 tasks
Date: Tue, 22 Jun 2021 15:30:36 +1000
Message-Id: <20210622053036.474678-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Haren Myneni <haren@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

copy-paste contains implicit "copy buffer" state that can contain
arbitrary user data (if the user process executes a copy instruction).
This could be snooped by another process if a context switch hits while
the state is live. So cp_abort is executed on context switch to clear
out possible sensitive data and prevent the leak.

cp_abort is done after the low level _switch(), which means it is never
reached by newly created tasks, so they could snoop on this buffer
between their first and second context switch.

Fix this by doing the cp_abort before calling _switch. Add some
comments which should make the issue harder to miss.

Cc: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Cc: Haren Myneni <haren@linux.ibm.com>
Fixes: 07d2a628bc000 ("powerpc/64s: Avoid cpabort in context switch when
possible")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/process.c | 48 +++++++++++++++++++++++------------
 1 file changed, 32 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 89e34aa273e2..1138f035ce74 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1213,6 +1213,19 @@ struct task_struct *__switch_to(struct task_struct *prev,
 			__flush_tlb_pending(batch);
 		batch->active = 0;
 	}
+
+	/*
+	 * On POWER9 the copy-paste buffer can only paste into
+	 * foreign real addresses, so unprivileged processes can not
+	 * see the data or use it in any way unless they have
+	 * foreign real mappings. If the new process has the foreign
+	 * real address mappings, we must issue a cp_abort to clear
+	 * any state and prevent snooping, corruption or a covert
+	 * channel. ISA v3.1 supports paste into local memory.
+	 */
+	if (new->mm && (cpu_has_feature(CPU_FTR_ARCH_31) ||
+			atomic_read(&new->mm->context.vas_windows)))
+		asm volatile(PPC_CP_ABORT);
 #endif /* CONFIG_PPC_BOOK3S_64 */
 
 #ifdef CONFIG_PPC_ADV_DEBUG_REGS
@@ -1261,30 +1274,33 @@ struct task_struct *__switch_to(struct task_struct *prev,
 #endif
 	last = _switch(old_thread, new_thread);
 
+	/*
+	 * Nothing after _switch will be run for newly created tasks,
+	 * because they switch directly to ret_from_fork/ret_from_kernel_thread
+	 * etc. Code added here should have a comment explaining why that is
+	 * okay.
+	 */
+
 #ifdef CONFIG_PPC_BOOK3S_64
+	/*
+	 * This applies to a process that was context switched while inside
+	 * arch_enter_lazy_mmu_mode(), to re-activate the batch that was
+	 * deactivated above, before _switch(). This will never be the case
+	 * for new tasks.
+	 */
 	if (current_thread_info()->local_flags & _TLF_LAZY_MMU) {
 		current_thread_info()->local_flags &= ~_TLF_LAZY_MMU;
 		batch = this_cpu_ptr(&ppc64_tlb_batch);
 		batch->active = 1;
 	}
 
-	if (current->thread.regs) {
+	/*
+	 * Math facilities are masked out of the child MSR in copy_thread.
+	 * A new task does not need to restore_math because it will
+	 * demand fault them.
+	 */
+	if (current->thread.regs)
 		restore_math(current->thread.regs);
-
-		/*
-		 * On POWER9 the copy-paste buffer can only paste into
-		 * foreign real addresses, so unprivileged processes can not
-		 * see the data or use it in any way unless they have
-		 * foreign real mappings. If the new process has the foreign
-		 * real address mappings, we must issue a cp_abort to clear
-		 * any state and prevent snooping, corruption or a covert
-		 * channel. ISA v3.1 supports paste into local memory.
-		 */
-		if (current->mm &&
-			(cpu_has_feature(CPU_FTR_ARCH_31) ||
-			atomic_read(&current->mm->context.vas_windows)))
-			asm volatile(PPC_CP_ABORT);
-	}
 #endif /* CONFIG_PPC_BOOK3S_64 */
 
 	return last;
-- 
2.23.0

