Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 254E877603D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Aug 2023 15:11:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RXXIuN93;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLVn25shKz3c5T
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Aug 2023 23:11:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RXXIuN93;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLVmB4ZFMz2xwG
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Aug 2023 23:10:34 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B8A9863A0B;
	Wed,  9 Aug 2023 13:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 835C9C433C8;
	Wed,  9 Aug 2023 13:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691586632;
	bh=VPYRR5y0iVxg93FJ4ki40+zbVk3xF5h4tykwjI0oDgE=;
	h=From:To:Cc:Subject:Date:From;
	b=RXXIuN93M8eZ/+Hfkchq8jhaWvrx55xUY8Pa/Ft/RWBjix/7zvMAtLGR3wSXBhA6U
	 qSOP+itl24FcEJan6xbseV2jRzxeRoTk0e+XGQu4ebFkywGRq1bd6KdKvP4J9l2S+T
	 Kf6KBmmFsWbY2JOWPPTAw0ny7f/ZbDY0QVnJ2baqVLX3OmHSSK+h/AdU9LIU6h2vdz
	 XmosAjLOm6TfahmXksZDkJy6qy8W3L/aa2NorXepa9zSjLIEMIz7AYyc64R+dvWsI0
	 XtsbN7MT2Ck2PcCKtXBp6G2DTFhdwj2KKHvfkTduQfOXvuj0aYFfeIMdsqL8oy/NwT
	 QZm4aI2AUG1pQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 1/2] powerpc: mark more local variables as volatile
Date: Wed,  9 Aug 2023 15:10:08 +0200
Message-Id: <20230809131024.2039647-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org, Hugh Dickins <hughd@google.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Maninder Singh <maninder1.s@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

A while ago I created a2305e3de8193 ("powerpc: mark local variables
around longjmp as volatile") in order to allow building powerpc with
-Wextra enabled on gcc-11.

I tried this again with gcc-13 and found two more of the same issues,
presumably based on slightly different optimization paths being taken
here:

arch/powerpc/xmon/xmon.c:3306:27: error: variable 'mm' might be clobbered by 'longjmp' or 'vfork' [-Werror=clobbered]
arch/powerpc/kexec/crash.c:353:22: error: variable 'i' might be clobbered by 'longjmp' or 'vfork' [-Werror=clobbered]

I checked a bunch of randconfigs and found only these two, so just
address them the same way as the others.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/kexec/crash.c | 2 +-
 arch/powerpc/xmon/xmon.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
index 252724ed666a3..ef5c2d25ec397 100644
--- a/arch/powerpc/kexec/crash.c
+++ b/arch/powerpc/kexec/crash.c
@@ -350,7 +350,7 @@ EXPORT_SYMBOL(crash_shutdown_unregister);
 
 void default_machine_crash_shutdown(struct pt_regs *regs)
 {
-	unsigned int i;
+	volatile unsigned int i;
 	int (*old_handler)(struct pt_regs *regs);
 
 	if (TRAP(regs) == INTERRUPT_SYSTEM_RESET)
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 3b6f524c790e3..9e12b75850d75 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -3303,7 +3303,7 @@ static void show_pte(unsigned long addr)
 {
 	unsigned long tskv = 0;
 	struct task_struct *volatile tsk = NULL;
-	struct mm_struct *mm;
+	struct mm_struct *volatile mm;
 	pgd_t *pgdp;
 	p4d_t *p4dp;
 	pud_t *pudp;
-- 
2.39.2

