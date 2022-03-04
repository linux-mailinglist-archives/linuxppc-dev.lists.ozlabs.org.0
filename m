Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7422C4CD9A9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Mar 2022 18:04:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K9Djs3Gg3z3bdP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Mar 2022 04:04:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K9DjQ28hJz2yPF
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Mar 2022 04:04:22 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4K9DjG36j6z9sTG;
 Fri,  4 Mar 2022 18:04:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R3ggCHIdxGTF; Fri,  4 Mar 2022 18:04:18 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4K9DjG2HS4z9sT5;
 Fri,  4 Mar 2022 18:04:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 297878B77C;
 Fri,  4 Mar 2022 18:04:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Bjy1tppm__g1; Fri,  4 Mar 2022 18:04:18 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.204.129])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BA7098B779;
 Fri,  4 Mar 2022 18:04:17 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 224H48k01979764
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 4 Mar 2022 18:04:08 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 224H48Af1979763;
 Fri, 4 Mar 2022 18:04:08 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 3/4] powerpc/kexec: Declare kexec_paca static
Date: Fri,  4 Mar 2022 18:04:04 +0100
Message-Id: <094983ee851644165b7700c73cac63cfe20596cd.1646413435.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <3ed660a585df2080ea8412ec20fbf652f5bf013a.1646413435.git.christophe.leroy@csgroup.eu>
References: <3ed660a585df2080ea8412ec20fbf652f5bf013a.1646413435.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1646413443; l=1405; s=20211009;
 h=from:subject:message-id; bh=BelRQHIYqaH9NH0LDOIQxN0oX8SGogEJyDwWBBqo0EY=;
 b=cbuS6Jj7KS0TXCaKNfmHRet/oTaOR9lGuVyHD0ge2Qz0ddIFYpOCFKj8DBJbc4JYmMcnz9MVN1Nl
 NqvmzWxPB8lg1EBlepxuEOJ6qMC0QUshsit8b2GstDTZy4h13OYQ
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

kexec_paca is exclusively used in kexec/core_64.c

Declare is static.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/asm-prototypes.h | 2 --
 arch/powerpc/kexec/core_64.c              | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
index 283bfeb8bf4c..83ef106923e6 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -24,9 +24,7 @@ extern struct task_struct *secondary_current;
 void start_secondary(void *unused);
 
 /* kexec */
-struct paca_struct;
 struct kimage;
-extern struct paca_struct kexec_paca;
 void kexec_copy_flush(struct kimage *image);
 
 /* pseries hcall tracing */
diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index 635b5fc30b53..2d49dce129f2 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -291,7 +291,7 @@ static union thread_union kexec_stack __init_task_data =
  * For similar reasons to the stack above, the kexecing CPU needs to be on a
  * static PACA; we switch to kexec_paca.
  */
-struct paca_struct kexec_paca;
+static struct paca_struct kexec_paca;
 
 /* Our assembly helper, in misc_64.S */
 extern void kexec_sequence(void *newstack, unsigned long start,
-- 
2.34.1

