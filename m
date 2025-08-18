Return-Path: <linuxppc-dev+bounces-11083-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BC6B2A037
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Aug 2025 13:20:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c59Hm6Ct3z3cR2;
	Mon, 18 Aug 2025 21:20:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755516036;
	cv=none; b=I9Lvgtn4OrmJjYRtooldBfzWQXGYcHcG9GCSOc6TYzbyeWIVyotPoIXsHlWmoGCFLFOXqIfF8r909coF/ZU8to7kMflHHWSyylfKs/iWy2q4alZALZRd0N7Z64r57RPvmwLBWakEtS0C1KJ7Zj3KoRfJN0oDIR6l5r5Zk69L8txIi/Z2wKgxzlUy7/EhcGYLGadUkD3p2CGWdn/RSAEw+Pll5WRIy1uuatPQ3ov0fxLm1lIaa08D535zz1b6LoW9XqWLV3h+HdRAeJDnymRneoYx6205WhoWemhpGJ7jdIZmlePmbBff0fpUa/aOSAxVZJNVxAyHROyW8tJ7EksMlw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755516036; c=relaxed/relaxed;
	bh=LYZpd005wwqIky45Ar8bvo+dV9bm6MCfxvVzts1E25g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bE4BjKX7zYPmF7mxtuOc4xqsKnypj3NQqgalSffnDdoN8/YP2adrs2lepVf9yAxk5rgpCsp0j8lMZW5zdUwmFbPFGdEv2/5CkKqqr5ew+wVeKjnyL1Is5luzTQPTD8GjrZlY68mEqZv/NkYax48i57vavBgIANhVxyDqQ9VNJmWpRtR6vKUPQG7n9U3L5vOLai1Y8w0kYgooPqvpKBE28g0le7tG63Tw/Yt2/ueHXr4qL7fMkkxzxoh0BkKxpiM7jUh49wx4Lc3OK+EQ5ExbjTa2hs5UFxRIvEPmNrL8hfKT//bs9zOZn0NCQ0cJabG2l/Pt6KgLLlrBKLbJtN0e7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c59Hm1lmdz3cR1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Aug 2025 21:20:35 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c56mP4m2Cz9sSZ;
	Mon, 18 Aug 2025 11:26:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pttFIAfyVu3D; Mon, 18 Aug 2025 11:26:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c56mP46KLz9sSW;
	Mon, 18 Aug 2025 11:26:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7AE718B764;
	Mon, 18 Aug 2025 11:26:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id QY7z9oBXpkqJ; Mon, 18 Aug 2025 11:26:45 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 59E808B763;
	Mon, 18 Aug 2025 11:26:45 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/vdso: Include asm/syscalls.h for sys_ni_syscall()
Date: Mon, 18 Aug 2025 11:26:44 +0200
Message-ID: <e2215a515ae0e21393c50e2f38791a6567cf1dec.1755509195.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755509204; l=927; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=B2xTrP7XxJf/asaLGXkExB+P+o9oXtCOkG+Rjzjch4A=; b=MvOvpHDcpNakY3/k5gLa2Rt9NmmNBu672nMmufYfyFzV59YgUiDD33CN91oldIVO0FS3PLiVj BM2t8VdogtaBN6ye6dAmEYhhtq0tvY3kWyoax2ILakqlI6kpnEwE4un
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Include asm/syscalls.h to get the correct prototype for sys_ni_syscall()

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/vdso.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index 219d67bcf747..ab7c4cc80943 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -21,6 +21,7 @@
 #include <vdso/datapage.h>
 
 #include <asm/syscall.h>
+#include <asm/syscalls.h>
 #include <asm/processor.h>
 #include <asm/mmu.h>
 #include <asm/mmu_context.h>
@@ -40,8 +41,6 @@ static_assert(__VDSO_PAGES == VDSO_NR_PAGES);
 extern char vdso32_start, vdso32_end;
 extern char vdso64_start, vdso64_end;
 
-long sys_ni_syscall(void);
-
 static int vdso_mremap(const struct vm_special_mapping *sm, struct vm_area_struct *new_vma,
 		       unsigned long text_size)
 {
-- 
2.49.0


