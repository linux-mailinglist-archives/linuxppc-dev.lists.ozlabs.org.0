Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63671857929
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 10:47:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbnCT1dHDz3vcP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 20:47:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbnC14b8xz3btZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 20:46:50 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4TbnBr4fvVz9syV;
	Fri, 16 Feb 2024 10:46:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id peyhQNuAFxmK; Fri, 16 Feb 2024 10:46:44 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4TbnBr436jz9syQ;
	Fri, 16 Feb 2024 10:46:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 869688B787;
	Fri, 16 Feb 2024 10:46:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id gWjL-nAXy4fJ; Fri, 16 Feb 2024 10:46:44 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.102])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 065D78B765;
	Fri, 16 Feb 2024 10:46:43 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc/trace: Restrict hash_fault trace event to HASH MMU
Date: Fri, 16 Feb 2024 10:46:43 +0100
Message-ID: <85a86e51b4ab26ce4b592984cc0a0851a3cc9479.1708076780.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708076803; l=1035; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=jQSDNvlSvXj1/uFQqCpVwQ2VcEHhnQsmskPJnVBLVQ8=; b=dli5kkWpxgzKF1Gl+nepuo8w18O4GjGWcq5DVBCZqOiFGyRxV7GaeYH/vja+BiYbK6yV4tdfw zMq65olsweCDR2RGWVw9MXU7+sHsTFNo8ara9svxSgY9uQyJSNwJTqk
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

'perf list' on powerpc 8xx shows an event named "1:hash_fault".

This event is pointless because trace_hash_fault() is called only
from mm/book3s64/hash_utils.c

Only define it when CONFIG_PPC_64S_HASH_MMU is selected.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/trace.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/trace.h b/arch/powerpc/include/asm/trace.h
index 82cc2c6704e6..d9ac3a4f46e1 100644
--- a/arch/powerpc/include/asm/trace.h
+++ b/arch/powerpc/include/asm/trace.h
@@ -267,6 +267,7 @@ TRACE_EVENT_FN(opal_exit,
 );
 #endif
 
+#ifdef CONFIG_PPC_64S_HASH_MMU
 TRACE_EVENT(hash_fault,
 
 	    TP_PROTO(unsigned long addr, unsigned long access, unsigned long trap),
@@ -286,7 +287,7 @@ TRACE_EVENT(hash_fault,
 	    TP_printk("hash fault with addr 0x%lx and access = 0x%lx trap = 0x%lx",
 		      __entry->addr, __entry->access, __entry->trap)
 );
-
+#endif
 
 TRACE_EVENT(tlbie,
 
-- 
2.43.0

