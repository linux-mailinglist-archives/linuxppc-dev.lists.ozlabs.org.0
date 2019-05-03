Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC81127F0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 08:43:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wMyh38Y1zDqW8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 16:43:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="QYIb4xuk"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wMvV1XpWzDqKD
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 16:40:21 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44wMvP2gb7z9tyt1;
 Fri,  3 May 2019 08:40:17 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=QYIb4xuk; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id kDtKsYuNxSjv; Fri,  3 May 2019 08:40:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44wMvP1TTkz9tysx;
 Fri,  3 May 2019 08:40:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556865617; bh=zJpKbWhCowhTRHfZ53KmsRJ1mIVebZ+JchC1KFAjbKo=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=QYIb4xukOtwgDVLs+pJZPTGbpVBeVlabgsshGCExJ05l3rCUJQAAdKDyTiwI800K9
 4t4Ir0LGSIe9PyJlxTAlo1N3gL/9UbFUlIRAY78PmbyumTS5YzhJg9pkADSCuFkOuG
 FiPKc2bhdxPJgNsujo92s2hlRkj+WmSFALMgeAsk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1E22C8B7F9;
 Fri,  3 May 2019 08:40:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id daFoRVdbv_D7; Fri,  3 May 2019 08:40:18 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.231.6])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EFBF78B75A;
 Fri,  3 May 2019 08:40:17 +0200 (CEST)
Received: by po16846vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id E78DB66204; Fri,  3 May 2019 06:40:17 +0000 (UTC)
Message-Id: <6fb61d1c9104b0324d4a9c445f431c0928c7ea25.1556865423.git.christophe.leroy@c-s.fr>
In-Reply-To: <298f344bdb21ab566271f5d18c6782ed20f072b7.1556865423.git.christophe.leroy@c-s.fr>
References: <298f344bdb21ab566271f5d18c6782ed20f072b7.1556865423.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 3/3] powerpc/module64: Use symbolic instructions names.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri,  3 May 2019 06:40:17 +0000 (UTC)
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

To increase readability/maintainability, replace hard coded
instructions values by symbolic names.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
v3: fixed warning by adding () in an 'if' around X | Y (unlike said in v2 history, this change was forgotten in v2)
v2: rearranged comments

 arch/powerpc/kernel/module_64.c | 53 +++++++++++++++++++++++++++--------------
 1 file changed, 35 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index c2e1b06253b8..b33a5d5e2d35 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -133,20 +133,27 @@ struct ppc64_stub_entry
  * the stub, but it's significantly shorter to put these values at the
  * end of the stub code, and patch the stub address (32-bits relative
  * to the TOC ptr, r2) into the stub.
+ *
+ * addis   r11,r2, <high>
+ * addi    r11,r11, <low>
+ * std     r2,R2_STACK_OFFSET(r1)
+ * ld      r12,32(r11)
+ * ld      r2,40(r11)
+ * mtctr   r12
+ * bctr
  */
-
 static u32 ppc64_stub_insns[] = {
-	0x3d620000,			/* addis   r11,r2, <high> */
-	0x396b0000,			/* addi    r11,r11, <low> */
+	PPC_INST_ADDIS | __PPC_RT(R11) | __PPC_RA(R2),
+	PPC_INST_ADDI | __PPC_RT(R11) | __PPC_RA(R11),
 	/* Save current r2 value in magic place on the stack. */
-	0xf8410000|R2_STACK_OFFSET,	/* std     r2,R2_STACK_OFFSET(r1) */
-	0xe98b0020,			/* ld      r12,32(r11) */
+	PPC_INST_STD | __PPC_RS(R2) | __PPC_RA(R1) | R2_STACK_OFFSET,
+	PPC_INST_LD | __PPC_RT(R12) | __PPC_RA(R11) | 32,
 #ifdef PPC64_ELF_ABI_v1
 	/* Set up new r2 from function descriptor */
-	0xe84b0028,			/* ld      r2,40(r11) */
+	PPC_INST_LD | __PPC_RT(R2) | __PPC_RA(R11) | 40,
 #endif
-	0x7d8903a6,			/* mtctr   r12 */
-	0x4e800420			/* bctr */
+	PPC_INST_MTCTR | __PPC_RS(R12),
+	PPC_INST_BCTR,
 };
 
 #ifdef CONFIG_DYNAMIC_FTRACE
@@ -704,18 +711,21 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 		         *	ld r2, ...(r12)
 			 *	add r2, r2, r12
 			 */
-			if ((((uint32_t *)location)[0] & ~0xfffc)
-			    != 0xe84c0000)
+			if ((((uint32_t *)location)[0] & ~0xfffc) !=
+			    (PPC_INST_LD | __PPC_RT(R2) | __PPC_RA(R12)))
 				break;
-			if (((uint32_t *)location)[1] != 0x7c426214)
+			if (((uint32_t *)location)[1] !=
+			    (PPC_INST_ADD | __PPC_RT(R2) | __PPC_RA(R2) | __PPC_RB(R12)))
 				break;
 			/*
 			 * If found, replace it with:
 			 *	addis r2, r12, (.TOC.-func)@ha
 			 *	addi r2, r12, (.TOC.-func)@l
 			 */
-			((uint32_t *)location)[0] = 0x3c4c0000 + PPC_HA(value);
-			((uint32_t *)location)[1] = 0x38420000 + PPC_LO(value);
+			((uint32_t *)location)[0] = PPC_INST_ADDIS | __PPC_RT(R2) |
+						    __PPC_RA(R12) | PPC_HA(value);
+			((uint32_t *)location)[1] = PPC_INST_ADDI | __PPC_RT(R2) |
+						    __PPC_RA(R12) | PPC_LO(value);
 			break;
 
 		case R_PPC64_REL16_HA:
@@ -769,12 +779,19 @@ static unsigned long create_ftrace_stub(const Elf64_Shdr *sechdrs,
 {
 	struct ppc64_stub_entry *entry;
 	unsigned int i, num_stubs;
+	/*
+	 * ld      r12,PACATOC(r13)
+	 * addis   r12,r12,<high>
+	 * addi    r12,r12,<low>
+	 * mtctr   r12
+	 * bctr
+	 */
 	static u32 stub_insns[] = {
-		0xe98d0000 | PACATOC, 	/* ld      r12,PACATOC(r13)	*/
-		0x3d8c0000,		/* addis   r12,r12,<high>	*/
-		0x398c0000, 		/* addi    r12,r12,<low>	*/
-		0x7d8903a6, 		/* mtctr   r12			*/
-		0x4e800420, 		/* bctr				*/
+		PPC_INST_LD | __PPC_RT(R12) | __PPC_RA(R13) | PACATOC,
+		PPC_INST_ADDIS | __PPC_RT(R12) | __PPC_RA(R12),
+		PPC_INST_ADDI | __PPC_RT(R12) | __PPC_RA(R12),
+		PPC_INST_MTCTR | __PPC_RS(R12),
+		PPC_INST_BCTR,
 	};
 	long reladdr;
 
-- 
2.13.3

