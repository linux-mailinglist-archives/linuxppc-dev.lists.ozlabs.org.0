Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC22C9EA5B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 16:05:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HrHH0587zDqV6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 00:05:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JknwB+nW"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Hr5P6nnyzDqg7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 23:56:41 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id w16so14170563pfn.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 06:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aR6kO2pHZRpNBgzuCIodgHd8b9J+evVZ/8gKmqxD7sw=;
 b=JknwB+nWgRgDckujx8oGtvaKTkra+qD/txTy0rZmlG3kjBG8W2UAnaJl0+cY0K7Ej2
 bA7kKdL9NLqOinldt7e0R+D3bO6VCuHPo92jNad5ob5uSG2dJd7xOMwBFK9NUs05h2E/
 fHao44zNNuNuEGMwPQQ4yXxfRz17Uug1IHLpSinKYDlin5bTE25GJfjVxITbH6QyAAU/
 iycaQCeOt0e4tjd3/IDhDaFonr+7lbmoycU7UuGUXDBAVK6ZcDJIdHtdWb8rd/0mpLg8
 uh2cahrcMWmpDfd8AC5Kh87ex3s8XGR/EMHg8GySPC6LD8w29bC+nt6qvALGPHE0Avb2
 pAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aR6kO2pHZRpNBgzuCIodgHd8b9J+evVZ/8gKmqxD7sw=;
 b=Gdg3VAFxrnQqmIWvdr2s+BOESAphb8cES4gjd1ThK++9nar21txfOKN+zMVHl3aonX
 Yo6e61FGQrgwIJiHrURUBTc4oaw763iaJsTdY+q7wnnJbGBoIm32nGoIvmotPBWeJazX
 QiqUP/yka7xiFXqDJfvdlXM+nGUhRxUEMCVAe3IG0MfClDFvzksuzzE50CaYzqvWaDdY
 hteAAwqtgUtczAQLOrwBE6iVvzDsjSDJUljIR8LkJapKlmx5ULpZLJn7jV0n8iwblgf2
 AfZe0GRCy3ewRcMLF2CIsIPzht78yQU1neICjKm5HIL2AIaoi0kJOqwk5CHN1LoiQRog
 EzgA==
X-Gm-Message-State: APjAAAVJKDud2v5CgkqamNs9+oywuN5Jyf8HbAY4Uc/rWDh9lhaJXORb
 Ib36agg8Cuty7xmVGNG7CVhBQ+9d
X-Google-Smtp-Source: APXvYqyroZ2Vmuam+wBUj1CkTm+ZllL+sq87O9t4qPKv5ioXJPi8EWPGqZD32/HX+J1B29bnTOxanw==
X-Received: by 2002:a17:90a:3646:: with SMTP id
 s64mr25800668pjb.44.1566914198622; 
 Tue, 27 Aug 2019 06:56:38 -0700 (PDT)
Received: from bobo.local0.net (14-202-91-55.tpgi.com.au. [14.202.91.55])
 by smtp.gmail.com with ESMTPSA id m9sm15988764pfh.84.2019.08.27.06.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 06:56:38 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/4] powerpc: convert to copy_thread_tls
Date: Tue, 27 Aug 2019 23:55:45 +1000
Message-Id: <20190827135548.21457-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190827135548.21457-1-npiggin@gmail.com>
References: <20190827135548.21457-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 3033f14ab78c3 ("clone: support passing tls argument via C rather
than pt_regs magic") introduced the HAVE_COPY_THREAD_TLS option. Use it
to avoid a subtle assumption about the argument ordering of clone type
syscalls.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
No change since v1.

 arch/powerpc/Kconfig          | 1 +
 arch/powerpc/kernel/process.c | 9 +++++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index d8dcd8820369..7477a3263225 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -182,6 +182,7 @@ config PPC
 	select HAVE_STACKPROTECTOR		if PPC64 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r13)
 	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r2)
 	select HAVE_CONTEXT_TRACKING		if PPC64
+	select HAVE_COPY_THREAD_TLS
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DEBUG_STACKOVERFLOW
 	select HAVE_DYNAMIC_FTRACE
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 8fc4de0d22b4..24621e7e5033 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1600,8 +1600,9 @@ static void setup_ksp_vsid(struct task_struct *p, unsigned long sp)
 /*
  * Copy architecture-specific thread state
  */
-int copy_thread(unsigned long clone_flags, unsigned long usp,
-		unsigned long kthread_arg, struct task_struct *p)
+int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
+		unsigned long kthread_arg, struct task_struct *p,
+		unsigned long tls)
 {
 	struct pt_regs *childregs, *kregs;
 	extern void ret_from_fork(void);
@@ -1642,10 +1643,10 @@ int copy_thread(unsigned long clone_flags, unsigned long usp,
 		if (clone_flags & CLONE_SETTLS) {
 #ifdef CONFIG_PPC64
 			if (!is_32bit_task())
-				childregs->gpr[13] = childregs->gpr[6];
+				childregs->gpr[13] = tls;
 			else
 #endif
-				childregs->gpr[2] = childregs->gpr[6];
+				childregs->gpr[2] = tls;
 		}
 
 		f = ret_from_fork;
-- 
2.22.0

