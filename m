Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29523332506
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 13:13:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvvJ81FTcz3fW6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 23:13:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvvCT2k6gz3cSV
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 23:09:41 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DvvCP2QM1z9tyjL;
 Tue,  9 Mar 2021 13:09:37 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id tsSriGYLLBjN; Tue,  9 Mar 2021 13:09:37 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DvvCP17Npz9tyjF;
 Tue,  9 Mar 2021 13:09:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 830558B800;
 Tue,  9 Mar 2021 13:09:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id aV4NVXJZr7WB; Tue,  9 Mar 2021 13:09:38 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 344598B7FC;
 Tue,  9 Mar 2021 13:09:38 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 16E1C67555; Tue,  9 Mar 2021 12:09:38 +0000 (UTC)
Message-Id: <40631d732d33e0e50b89d97402fce9ede4123d80.1615291472.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1615291471.git.christophe.leroy@csgroup.eu>
References: <cover.1615291471.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 12/43] powerpc/32: Use fast instruction to set MSR RI in
 exception prolog on 8xx
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue,  9 Mar 2021 12:09:38 +0000 (UTC)
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

8xx has registers SPRN_NRI, SPRN_EID and SPRN_EIE for changing
MSR EE and RI.

Use SPRN_EID in exception prolog to set RI.

On an 8xx, it reduces the null_syscall test by 3 cycles.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_32.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index ac6b391f1493..25ee6b26ef5a 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -107,6 +107,8 @@
 #endif
 #ifdef CONFIG_40x
 	rlwinm	r9,r9,0,14,12		/* clear MSR_WE (necessary?) */
+#elif defined(CONFIG_PPC_8xx)
+	mtspr	SPRN_EID, r2		/* Set MSR_RI */
 #else
 #ifdef CONFIG_VMAP_STACK
 	li	r10, MSR_KERNEL & ~MSR_IR /* can take exceptions */
-- 
2.25.0

