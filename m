Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B1D245C34
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 08:02:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVNjP2rsSzDqL0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 16:02:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVNPC63KGzDqNk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 15:47:59 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BVNP36Zdkz9tytn;
 Mon, 17 Aug 2020 07:47:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Q31TzKBgDRfA; Mon, 17 Aug 2020 07:47:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BVNP35csXz9tytl;
 Mon, 17 Aug 2020 07:47:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9216E8B772;
 Mon, 17 Aug 2020 07:47:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id szLHl23uqWEw; Mon, 17 Aug 2020 07:47:56 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.104])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6CE298B75B;
 Mon, 17 Aug 2020 07:47:56 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 6210965CDD; Mon, 17 Aug 2020 05:47:56 +0000 (UTC)
Message-Id: <03ba6b52344ca7c336df2bc6e3d31d736c804ae2.1597643221.git.christophe.leroy@csgroup.eu>
In-Reply-To: <0eb61cf0dc66d781d47deb2228498cd61d03a754.1597643221.git.christophe.leroy@csgroup.eu>
References: <0eb61cf0dc66d781d47deb2228498cd61d03a754.1597643221.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 2/4] powerpc/process: Remove useless #ifdef CONFIG_ALTIVEC
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 17 Aug 2020 05:47:56 +0000 (UTC)
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

cpu_has_feature(CPU_FTR_ALTIVEC) returns false when CONFIG_ALTIVEC is
not set.

There is no need to enclose the test in an #ifdef CONFIG_ALTIVEC.
Remove it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/process.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index b64d71188715..360415689f8a 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -409,10 +409,8 @@ static int __init init_msr_all_available(void)
 #ifdef CONFIG_PPC_FPU
 	msr_all_available |= MSR_FP;
 #endif
-#ifdef CONFIG_ALTIVEC
 	if (cpu_has_feature(CPU_FTR_ALTIVEC))
 		msr_all_available |= MSR_VEC;
-#endif
 	if (cpu_has_feature(CPU_FTR_VSX))
 		msr_all_available |= MSR_VSX;
 #ifdef CONFIG_SPE
@@ -446,10 +444,8 @@ void giveup_all(struct task_struct *tsk)
 	if (usermsr & MSR_FP)
 		__giveup_fpu(tsk);
 #endif
-#ifdef CONFIG_ALTIVEC
 	if (usermsr & MSR_VEC)
 		__giveup_altivec(tsk);
-#endif
 #ifdef CONFIG_SPE
 	if (usermsr & MSR_SPE)
 		__giveup_spe(tsk);
-- 
2.25.0

