Return-Path: <linuxppc-dev+bounces-6715-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE72AA4F158
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Mar 2025 00:20:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6s961Jzlz3bpn;
	Wed,  5 Mar 2025 10:20:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741130409;
	cv=none; b=TvcI4CSYclqeJLnSpw/QyaCsmPI8E3uac/ZABkJn7XEPrz1mdFfHsckXEhnAYg6J9wNEYRcAnxyxOtvxWoTOjoWlqak8Bp7dAaVl01Cpv9juM/jSjIysaBGpEdvRvmeESm2M9862+qJGlZSkXwXmNfTGxDCBwWXBiRrhePjFasTg0WqFG1j4lwxIZe7LGQkHQcEoat0slq3TFk3gh/AC+yjcZ8AbG0S2QzB+UpsagddDh2JOWBuJuRDxJ+umha0DACfi5Em3m4Ts8hbMmMb986N9kD8qbPaOP89fE0NJBlR1jZVrCF29PxKS+iSdxIkyhUsS+VHhJkd7UpRAiNIazg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741130409; c=relaxed/relaxed;
	bh=PKsVFWS4c2/qLLHyKaqUKNnty7K2qpKF8XK36u42t7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JipIvM9SoNTIeSTYzQX4or8sAPizKOzGUGIFA1DdiWU2vzB0s/JaI4fWtuQv38PfPZkHIoHPefo4EpXzfssFDGGK741LL9YyxisH2TYEHFIaUiojlVVTrwCaIQCXnP4dkkEwcGLxURkuoSL2KPbDEpKHolhVxgjDf6d7pCkRyUMvIQ7or3D8QAsibHBks8n6SyGyRnPShi5z/IkTcA+g3yoR14msEIty1YKd5/llTJzX0/pst5TpEQNntI1yVwCrqNk0ncqPkwnjbKoQC8lVMar14/RELsj0nrCIM8YTKgx6nszVD/AMalLMW33SQpsm8Lo+eePgOH8ZKuILmmFqdQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6s942r4Sz309v
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Mar 2025 10:20:06 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Z6rn82bvXz9stM;
	Wed,  5 Mar 2025 00:02:52 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wPfy1sCZaY9s; Wed,  5 Mar 2025 00:02:52 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Z6rn81Bh0z9stL;
	Wed,  5 Mar 2025 00:02:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E81738B776;
	Wed,  5 Mar 2025 00:02:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id qWXKjmuiIl6W; Wed,  5 Mar 2025 00:02:51 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 168D68B763;
	Wed,  5 Mar 2025 00:02:50 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	Danny Tsen <dtsen@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Breno Leitao" <leitao@debian.org>,
	Nayna Jain <nayna@linux.ibm.com>,
	Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	linux-crypto@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [PATCH] crypto: powerpc: Mark ghashp8-ppc.o as an OBJECT_FILES_NON_STANDARD
Date: Wed,  5 Mar 2025 00:02:39 +0100
Message-ID: <7aa7eb73fe6bc95ac210510e22394ca0ae227b69.1741128786.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
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
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741129359; l=2686; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=rxbY0OYKeF/ruyA697I5bCATkY6ZUvEuwEmFs1kOfUM=; b=QegfBkLIMtIn2pXyrwu9vHSHXI1g41Q0dNFUgkY3G903IcJVCl4645/HlUnQUPo95ItBmd33F HV13MubBCESC5ol+ngCq5l7/E9HpbAJBINPc6EkQXB1p97B+QaF8T8m
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The following build warning has been reported:

  arch/powerpc/crypto/ghashp8-ppc.o: warning: objtool: .text+0x22c: unannotated intra-function call

This happens due to commit bb7f054f4de2 ("objtool/powerpc: Add support
for decoding all types of uncond branches")

Disassembly of arch/powerpc/crypto/ghashp8-ppc.o shows:

 arch/powerpc/crypto/ghashp8-ppc.o:     file format elf64-powerpcle

 Disassembly of section .text:

 0000000000000140 <gcm_ghash_p8>:
   140:    f8 ff 00 3c     lis     r0,-8
 ...
   20c:    20 00 80 4e     blr
   210:    00 00 00 00     .long 0x0
   214:    00 0c 14 00     .long 0x140c00
   218:    00 00 04 00     .long 0x40000
   21c:    00 00 00 00     .long 0x0
   220:    47 48 41 53     rlwimi. r1,r26,9,1,3
   224:    48 20 66 6f     xoris   r6,r27,8264
   228:    72 20 50 6f     xoris   r16,r26,8306
   22c:    77 65 72 49     bla     1726574 <gcm_ghash_p8+0x1726434>      <==
 ...

It corresponds to the following code in ghashp8-ppc.o :

 _GLOBAL(gcm_ghash_p8)
    lis    0,0xfff8
 ...
    blr
 .long    0
 .byte    0,12,0x14,0,0,0,4,0
 .long    0
 .size    gcm_ghash_p8,.-gcm_ghash_p8

 .byte 71,72,65,83,72,32,102,111,114,32,80,111,119,101,114,73,83,65,32,50,46,48,55,44,32,67,82,89,80,84,79,71,65,77,83,32,98,121,32,60,97,112,112,114,111,64,111,112,101,110,115,115,108,46,111,114,103,62,0
 .align    2
 .align    2

In fact this is raw data that is after the function end and that is
not text so shouldn't be disassembled as text. But ghashp8-ppc.S is
generated by a perl script and should have been marked as
OBJECT_FILES_NON_STANDARD.

Now that 'bla' is understood as a call instruction, that raw data
is mis-interpreted as an infra-function call.

Mark ghashp8-ppc.o as a OBJECT_FILES_NON_STANDARD to avoid this
warning.

Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Closes: https://lore.kernel.org/all/8c4c3fc2-2bd7-4148-af68-2f504d6119e0@linux.ibm.com
Cc: Danny Tsen <dtsen@linux.ibm.com>
Fixes: 109303336a0c ("crypto: vmx - Move to arch/powerpc/crypto")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/crypto/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/crypto/Makefile b/arch/powerpc/crypto/Makefile
index 9b38f4a7bc15..2f00b22b0823 100644
--- a/arch/powerpc/crypto/Makefile
+++ b/arch/powerpc/crypto/Makefile
@@ -51,3 +51,4 @@ $(obj)/aesp8-ppc.S $(obj)/ghashp8-ppc.S: $(obj)/%.S: $(src)/%.pl FORCE
 OBJECT_FILES_NON_STANDARD_aesp10-ppc.o := y
 OBJECT_FILES_NON_STANDARD_ghashp10-ppc.o := y
 OBJECT_FILES_NON_STANDARD_aesp8-ppc.o := y
+OBJECT_FILES_NON_STANDARD_ghashp8-ppc.o := y
-- 
2.47.0


