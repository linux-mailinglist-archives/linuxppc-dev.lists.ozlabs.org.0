Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1BC148CB8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 18:06:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4845BZ1DYczDqb0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jan 2020 04:05:58 +1100 (AEDT)
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
 header.s=mail header.b=A3qsmNly; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48458M12VkzDqbh
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jan 2020 04:04:00 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48458B3zJfz9v0MC;
 Fri, 24 Jan 2020 18:03:54 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=A3qsmNly; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id PlrBI8ncfS8t; Fri, 24 Jan 2020 18:03:54 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48458B1zkFz9v0M8;
 Fri, 24 Jan 2020 18:03:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579885434; bh=mrhcIGGf29wPqKelAuVacdgsgYagP0iavvcKEGj+5FI=;
 h=From:Subject:To:Cc:Date:From;
 b=A3qsmNlyynmqC5scs6xaMpM8BusLtOt/41xLmy7BykDfEOf4zxA3bllbpVQoyOXhk
 Eb+sQYh0jfA/rV3WrY5uwNVoadrNFv5HZHgZrvhPd65yfhokdfuNAydFR/8nJkP5cf
 KZZHCT1tLe8KSp+agMP7XVYhGic0VJP3i5gNbmpI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 680488B86A;
 Fri, 24 Jan 2020 18:03:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id FQF1SzBxpfT8; Fri, 24 Jan 2020 18:03:54 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 46D5E8B86B;
 Fri, 24 Jan 2020 18:03:49 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 3C582651F6; Fri, 24 Jan 2020 17:03:48 +0000 (UTC)
Message-Id: <872477f7c7552d3bb7baf0b302398fcd42c5fcfd.1579885334.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/32: Add missing context synchronisation with
 CONFIG_VMAP_STACK
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 24 Jan 2020 17:03:48 +0000 (UTC)
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

After reactivation of data translation by modifying MSR[DR], a isync
is required to ensure the translation is effective.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
Rebased on powerpc/merge-test

@mpe: If not too late:
- change to head_32.h should be squashed into "powerpc/32: prepare for CONFIG_VMAP_STACK"
- change to head_32.S should be squashed into "powerpc/32s: Enable CONFIG_VMAP_STACK"

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/head_32.S | 1 +
 arch/powerpc/kernel/head_32.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/powerpc/kernel/head_32.S b/arch/powerpc/kernel/head_32.S
index cb7864091641..0493fcac6409 100644
--- a/arch/powerpc/kernel/head_32.S
+++ b/arch/powerpc/kernel/head_32.S
@@ -277,6 +277,7 @@ MachineCheck:
 #ifdef CONFIG_VMAP_STACK
 	li	r11, MSR_KERNEL & ~(MSR_IR | MSR_RI) /* can take DTLB miss */
 	mtmsr	r11
+	isync
 #endif
 #ifdef CONFIG_PPC_CHRP
 	mfspr	r11, SPRN_SPRG_THREAD
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 73a035b40dbf..a6a5fbbf8504 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -43,6 +43,7 @@
 	.ifeq	\for_rtas
 	li	r11, MSR_KERNEL & ~(MSR_IR | MSR_RI) /* can take DTLB miss */
 	mtmsr	r11
+	isync
 	.endif
 	subi	r11, r1, INT_FRAME_SIZE		/* use r1 if kernel */
 #else
@@ -123,6 +124,7 @@
 #ifdef CONFIG_VMAP_STACK
 	li	r9, MSR_KERNEL & ~(MSR_IR | MSR_RI) /* can take DTLB miss */
 	mtmsr	r9
+	isync
 #endif
 	tovirt_vmstack r12, r12
 	tophys_novmstack r11, r11
-- 
2.25.0

