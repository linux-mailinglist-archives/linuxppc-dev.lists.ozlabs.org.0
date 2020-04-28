Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C471BBDB2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 14:36:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BLjR0nRqzDqsd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 22:36:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BLcL3ldxzDqq0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 22:31:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=eRm6jJkJ; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49BLcK0VjJz9sSb; Tue, 28 Apr 2020 22:31:45 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49BLcJ4vXTz9sSX; Tue, 28 Apr 2020 22:31:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1588077104;
 bh=wy03yepSpqsjCBPSF2K+kZ5N+dnTm77fuwzYpQt9v3w=;
 h=From:To:Subject:Date:From;
 b=eRm6jJkJVkRNtDm54jMAHcLetomVHw81B2TDCjgUGT2jLXfy4PdQCihdNl5kcMW2g
 36+yvIKzbuVNjt+mE+xaILpKFf0Nz0J2v0ss5dVM97XvIUi5++6mrQyopfjmNlldVw
 7MlB5SPqI8xTD6biX24gS8PCpzvXGzI4EXMH5wplCrNMzGOxNZzD+4qsrCNCERsT3h
 zOhN27Aeog9UUl+SEs2cfwmrAoQHT8NBaBGrQY3zQriDdOEHxYQvL8klst1a3gyg5R
 6wzAWziDC4GftvB2vcaypoKwEghfemTB/jGPalGu4YXJz7FcUiZ8EZCamwOPCxAfMc
 0zsr5FyHj8rPw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc: Drop unneeded cast in task_pt_regs()
Date: Tue, 28 Apr 2020 22:31:52 +1000
Message-Id: <20200428123152.73566-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There's no need to cast in task_pt_regs() as tsk->thread.regs should
already be a struct pt_regs. If someone's using task_pt_regs() on
something that's not a task but happens to have a thread.regs then
we'll deal with them later.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/processor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index bfa336fbcfeb..8e855c78d780 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -307,7 +307,7 @@ struct thread_struct {
 }
 #endif
 
-#define task_pt_regs(tsk)	((struct pt_regs *)(tsk)->thread.regs)
+#define task_pt_regs(tsk)	((tsk)->thread.regs)
 
 unsigned long get_wchan(struct task_struct *p);
 
-- 
2.25.1

