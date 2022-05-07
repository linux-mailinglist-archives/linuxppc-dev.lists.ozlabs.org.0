Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C2751E4D4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 08:50:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KwJ3K45fhz3fDq
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 16:50:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KwJ005yNnz3cNR
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 16:47:28 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KwHzN12gPz9sW3;
 Sat,  7 May 2022 08:46:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QBB-2eQMafJ9; Sat,  7 May 2022 08:46:56 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KwHzD6KXJz9sW5;
 Sat,  7 May 2022 08:46:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C71528B76C;
 Sat,  7 May 2022 08:46:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id FxYAWW5LnbVz; Sat,  7 May 2022 08:46:48 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 16E7A8B79E;
 Sat,  7 May 2022 08:46:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2476kfJS1320551
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sat, 7 May 2022 08:46:41 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2476kfxl1320550;
 Sat, 7 May 2022 08:46:41 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, naveen.n.rao@linux.vnet.ibm.com
Subject: [PATCH v2 20/25] powerpc/inst: Add __copy_inst_from_kernel_nofault()
Date: Sat,  7 May 2022 08:46:22 +0200
Message-Id: <1f3702890d6dbd64702b61834753bcc96851c18c.1651905939.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1651905939.git.christophe.leroy@csgroup.eu>
References: <cover.1651905939.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1651905981; l=1534; s=20211009;
 h=from:subject:message-id; bh=uNUWZzzzPfrKXF6jD9unCulUYAF0cNf3EZC4MAgTHXc=;
 b=L0lpde8ZDnb7npFNMSNTj9Dt8qe//otr8UF+WlQS+vNmnDP1f7F02Jm0Ukb3eSNHUyjmH9WqrQDU
 tb15LRfeDNLLuWwY1aeNJvByhys0MQlPvwWTXo45bOlP+PdWGVeA
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On the same model as get_user() versus __get_user(),
introduce __copy_inst_from_kernel_nofault() which doesn't
check address.

To be used by callers that have already checked that the adress
is a kernel address.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/inst.h | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
index 80b6d74146c6..b49aae9f6f27 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -158,13 +158,10 @@ static inline char *__ppc_inst_as_str(char str[PPC_INST_STR_LEN], ppc_inst_t x)
 	__str;				\
 })
 
-static inline int copy_inst_from_kernel_nofault(ppc_inst_t *inst, u32 *src)
+static inline int __copy_inst_from_kernel_nofault(ppc_inst_t *inst, u32 *src)
 {
 	unsigned int val, suffix;
 
-	if (unlikely(!is_kernel_addr((unsigned long)src)))
-		return -ERANGE;
-
 /* See https://github.com/ClangBuiltLinux/linux/issues/1521 */
 #if defined(CONFIG_CC_IS_CLANG) && CONFIG_CLANG_VERSION < 140000
 	val = suffix = 0;
@@ -181,4 +178,12 @@ static inline int copy_inst_from_kernel_nofault(ppc_inst_t *inst, u32 *src)
 	return -EFAULT;
 }
 
+static inline int copy_inst_from_kernel_nofault(ppc_inst_t *inst, u32 *src)
+{
+	if (unlikely(!is_kernel_addr((unsigned long)src)))
+		return -ERANGE;
+
+	return __copy_inst_from_kernel_nofault(inst, src);
+}
+
 #endif /* _ASM_POWERPC_INST_H */
-- 
2.35.1

