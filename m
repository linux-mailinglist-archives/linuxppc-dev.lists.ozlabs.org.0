Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAA816FEB3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 13:11:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SF5y5WrqzDqNX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 23:11:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=V8q2DGGw; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SDjL2KMPzDqbw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 22:53:58 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48SDjF6jSgz9txVC;
 Wed, 26 Feb 2020 12:53:53 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=V8q2DGGw; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id t871unOA5B4O; Wed, 26 Feb 2020 12:53:53 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48SDjF5h0Yz9txV6;
 Wed, 26 Feb 2020 12:53:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1582718033; bh=6vG0rup5AhQFG+005MTudCeahFqQe+VU9AdxRQQ/uh4=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=V8q2DGGwUSQ5X+2OVS145trChFfjKtYwlhvLn3p/ZPgxVgBTibx5ctohaZZ+BWOQ+
 fRmTEHCGzaUjleTAWvQk6YSqfOUMikWtDnBHqrOycnDPkaf9kdh5cEk4UA5myVTTOo
 z8HBVhwkQubPNcv7fRqvjQnAegT2U+tjMWSwJaxY=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0DAB08B847;
 Wed, 26 Feb 2020 12:53:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 4x-3og4IaD_W; Wed, 26 Feb 2020 12:53:54 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B27198B776;
 Wed, 26 Feb 2020 12:53:54 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 8ABDA65400; Wed, 26 Feb 2020 11:53:54 +0000 (UTC)
Message-Id: <6dac2b49207647f75cbf0e6771a545e691f0fd93.1582717645.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1582717645.git.christophe.leroy@c-s.fr>
References: <cover.1582717645.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 04/13] powerpc/ptrace: drop PARAMETER_SAVE_AREA_OFFSET
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 mikey@neuling.org
Date: Wed, 26 Feb 2020 11:53:54 +0000 (UTC)
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PARAMETER_SAVE_AREA_OFFSET is not used, drop it.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/ptrace/ptrace.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
index 3dd94c296ac7..22826c942eae 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -33,16 +33,6 @@
 #define CREATE_TRACE_POINTS
 #include <trace/events/syscalls.h>
 
-/*
- * The parameter save area on the stack is used to store arguments being passed
- * to callee function and is located at fixed offset from stack pointer.
- */
-#ifdef CONFIG_PPC32
-#define PARAMETER_SAVE_AREA_OFFSET	24  /* bytes */
-#else /* CONFIG_PPC32 */
-#define PARAMETER_SAVE_AREA_OFFSET	48  /* bytes */
-#endif
-
 struct pt_regs_offset {
 	const char *name;
 	int offset;
-- 
2.25.0

