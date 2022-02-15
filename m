Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 943324B7459
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 19:32:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyqSn1Rf6z3cVF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 05:32:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyqSJ2ctpz3bWj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 05:31:57 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4JyqSB2KLhz9sSH;
 Tue, 15 Feb 2022 19:31:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vEPz7MoYcChe; Tue, 15 Feb 2022 19:31:54 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4JyqSB1NMXz9sS8;
 Tue, 15 Feb 2022 19:31:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 13C8D8B77C;
 Tue, 15 Feb 2022 19:31:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Hukjm0T6YJMZ; Tue, 15 Feb 2022 19:31:54 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.6.174])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B91368B763;
 Tue, 15 Feb 2022 19:31:53 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 21FIVibp146768
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 19:31:44 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 21FIVekA146765;
 Tue, 15 Feb 2022 19:31:40 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 1/4] powerpc/ftrace: Also save r1 in ftrace_caller()
Date: Tue, 15 Feb 2022 19:31:22 +0100
Message-Id: <ff535e86d3a69376a6d89168511d4e403835f18b.1644949750.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1644949837; l=958; s=20211009;
 h=from:subject:message-id; bh=+OAg1QzN1NMzv44Zc4NhQPMtO25ighAEmulpyJpzi0c=;
 b=Kh1iOWwIhYp3Z2Get6F5yyQrTLYSQ2xMN5f0BMD83MYtCy5UVrelHZPaV059aJhmeYRcZKc+o7aT
 TiwQEc3WA20xbgX+qBkm2EHwfRONuIg6jjKhPnZiQLc1qUHZtG2P
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Also save r1 in ftrace_caller()

r1 is needed during unwinding when the function_graph tracer
is active.

Reported-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Fixes: 830213786c49 ("powerpc/ftrace: directly call of function graph tracer by ftrace caller")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/trace/ftrace_mprofile.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/trace/ftrace_mprofile.S b/arch/powerpc/kernel/trace/ftrace_mprofile.S
index 56da60e98327..8443902d5a05 100644
--- a/arch/powerpc/kernel/trace/ftrace_mprofile.S
+++ b/arch/powerpc/kernel/trace/ftrace_mprofile.S
@@ -173,6 +173,10 @@ _GLOBAL(ftrace_caller)
 	beq	ftrace_no_trace
 #endif
 
+	/* Save previous stack pointer (r1) */
+	addi	r8, r1, SWITCH_FRAME_SIZE
+	PPC_STL	r8, GPR1(r1)
+
 	/* Get the _mcount() call site out of LR */
 	mflr	r7
 	PPC_STL     r7, _NIP(r1)
-- 
2.34.1

