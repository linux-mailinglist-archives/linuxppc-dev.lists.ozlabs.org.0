Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FE527845
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 10:42:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458jg43GfXzDq8v
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 18:42:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="qHg2rjE3"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458jbm3VYmzDqbY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 18:39:32 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 458jbg5PJgz9tybB;
 Thu, 23 May 2019 10:39:27 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=qHg2rjE3; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id OWyPUnGABWAd; Thu, 23 May 2019 10:39:27 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 458jbg45Bxz9tyb8;
 Thu, 23 May 2019 10:39:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1558600767; bh=IkYWeZ4tDG4CTAbPN5POqn8JSBG26w6X70unKoUvBPM=;
 h=From:Subject:To:Cc:Date:From;
 b=qHg2rjE3OqyRKas86pc9/NGYDIII6/uVB0IAX3H9hHyYs9na347WtU7xnQmxxOrHI
 ATgiOEP0CmRJyc0GQhr0RTlSB6F3LJ8EQpqEubQW6WWat7ntmekc1NbfJ/+4mmPk4I
 DElM4EKV4T+9+2nW8XFF4YxEP/PAOS8nLw0ptvio=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 948398B851;
 Thu, 23 May 2019 10:39:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 1AzVhv0qAqSB; Thu, 23 May 2019 10:39:28 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 537F68B77D;
 Thu, 23 May 2019 10:39:28 +0200 (CEST)
Received: by po16846vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 12F2168517; Thu, 23 May 2019 08:39:27 +0000 (UTC)
Message-Id: <97664671a229a4240bfb22f69ec4743e837c2b83.1558600628.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/32: fix build failure on book3e with KVM
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 23 May 2019 08:39:27 +0000 (UTC)
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

Build failure was introduced by the commit identified below,
due to missed macro expension leading to wrong called function's name.

arch/powerpc/kernel/head_fsl_booke.o: In function `SystemCall':
arch/powerpc/kernel/head_fsl_booke.S:416: undefined reference to `kvmppc_handler_BOOKE_INTERRUPT_SYSCALL_SPRN_SRR1'
Makefile:1052: recipe for target 'vmlinux' failed

The called function should be kvmppc_handler_8_0x01B(). This patch fixes it.

Reported-by: Paul Mackerras <paulus@ozlabs.org>
Fixes: 1a4b739bbb4f ("powerpc/32: implement fast entry for syscalls on BOOKE")
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/head_booke.h     | 4 ++--
 arch/powerpc/kernel/head_fsl_booke.S | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index bfeb469e8106..dec0912a6508 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -83,7 +83,7 @@ END_BTB_FLUSH_SECTION
 	SAVE_4GPRS(3, r11);						     \
 	SAVE_2GPRS(7, r11)
 
-.macro SYSCALL_ENTRY trapno intno
+.macro SYSCALL_ENTRY trapno intno srr1
 	mfspr	r10, SPRN_SPRG_THREAD
 #ifdef CONFIG_KVM_BOOKE_HV
 BEGIN_FTR_SECTION
@@ -94,7 +94,7 @@ BEGIN_FTR_SECTION
 	mfspr	r11, SPRN_SRR1
 	mtocrf	0x80, r11	/* check MSR[GS] without clobbering reg */
 	bf	3, 1975f
-	b	kvmppc_handler_BOOKE_INTERRUPT_\intno\()_SPRN_SRR1
+	b	kvmppc_handler_\intno\()_\srr1
 1975:
 	mr	r12, r13
 	lwz	r13, THREAD_NORMSAVE(2)(r10)
diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kernel/head_fsl_booke.S
index 6621f230cc37..2b39f42c3676 100644
--- a/arch/powerpc/kernel/head_fsl_booke.S
+++ b/arch/powerpc/kernel/head_fsl_booke.S
@@ -413,7 +413,7 @@ interrupt_base:
 
 	/* System Call Interrupt */
 	START_EXCEPTION(SystemCall)
-	SYSCALL_ENTRY   0xc00 SYSCALL
+	SYSCALL_ENTRY   0xc00 BOOKE_INTERRUPT_SYSCALL SPRN_SRR1
 
 	/* Auxiliary Processor Unavailable Interrupt */
 	EXCEPTION(0x2900, AP_UNAVAIL, AuxillaryProcessorUnavailable, \
-- 
2.13.3

