Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB09F3EEFE9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 18:00:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gpwjm4s5Cz3bXj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 02:00:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpwjL1l61z2yR8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 02:00:18 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GpwjC12S7z9sTl;
 Tue, 17 Aug 2021 18:00:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5FYl5G2Uzyb6; Tue, 17 Aug 2021 18:00:15 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GpwjC06SKz9sRj;
 Tue, 17 Aug 2021 18:00:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D57258B7C3;
 Tue, 17 Aug 2021 18:00:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id n39-hyA9LvO3; Tue, 17 Aug 2021 18:00:14 +0200 (CEST)
Received: from po9473vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A6B088B7A9;
 Tue, 17 Aug 2021 18:00:14 +0200 (CEST)
Received: by po9473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 742D9667C7; Tue, 17 Aug 2021 16:00:14 +0000 (UTC)
Message-Id: <000a28c51808bbd802b505af42d2cb316c2be7d3.1629216000.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/ptrace: Make user_mode() common to PPC32 and PPC64
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 17 Aug 2021 16:00:14 +0000 (UTC)
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

Today we have:

	#ifdef __powerpc64__
	#define user_mode(regs) ((((regs)->msr) >> MSR_PR_LG) & 0x1)
	#else
	#define user_mode(regs) (((regs)->msr & MSR_PR) != 0)
	#endif

With ppc64_defconfig, we get:

	if (!user_mode(regs))
    14b4:	e9 3e 01 08 	ld      r9,264(r30)
    14b8:	71 29 40 00 	andi.   r9,r9,16384
    14bc:	41 82 07 a4 	beq     1c60 <.emulate_instruction+0x7d0>

If taking the ppc32 definition of user_mode(), the exact same code
is generated for ppc64_defconfig.

So, only keep one version of user_mode(), preferably the one not
using MSR_PR_LG which should be kept internal to reg.h.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/ptrace.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 14422e851494..fd60538737a0 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -197,11 +197,7 @@ static inline unsigned long frame_pointer(struct pt_regs *regs)
 	return 0;
 }
 
-#ifdef __powerpc64__
-#define user_mode(regs) ((((regs)->msr) >> MSR_PR_LG) & 0x1)
-#else
 #define user_mode(regs) (((regs)->msr & MSR_PR) != 0)
-#endif
 
 #define force_successful_syscall_return()   \
 	do { \
-- 
2.25.0

