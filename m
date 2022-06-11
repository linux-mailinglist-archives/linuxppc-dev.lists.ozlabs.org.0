Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1265476AD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 18:56:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LL3rV1l7Kz3dtk
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Jun 2022 02:56:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LL3qk6qcCz3cFd
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jun 2022 02:55:46 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LL3qc4l1kz9tSH;
	Sat, 11 Jun 2022 18:55:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 54irvjHsnLrs; Sat, 11 Jun 2022 18:55:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LL3qb02SMz9tSJ;
	Sat, 11 Jun 2022 18:55:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E074A8B768;
	Sat, 11 Jun 2022 18:55:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ZtZubZVjpOjl; Sat, 11 Jun 2022 18:55:38 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.6.192])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9D4638B77C;
	Sat, 11 Jun 2022 18:55:38 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 25BGtQqR742066
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 11 Jun 2022 18:55:26 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 25BGtQR1742065;
	Sat, 11 Jun 2022 18:55:26 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>, jejb@linux.ibm.com,
        martin.petersen@oracle.com
Subject: [PATCH 2/2] powerpc: Move prom_init() out of asm-prototypes.h
Date: Sat, 11 Jun 2022 18:55:16 +0200
Message-Id: <e111e4f0addb0fa810d5f6a71d3b8e62c0b53492.1654966508.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <3b1dfb19a2c3265fb4abc2bfc7b6eae9261a998b.1654966508.git.christophe.leroy@csgroup.eu>
References: <3b1dfb19a2c3265fb4abc2bfc7b6eae9261a998b.1654966508.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1654966513; l=1938; s=20211009; h=from:subject:message-id; bh=fAU2YJdaMaOCNND6abnDDcAnCp5BkcWZrEWb3FSr2r4=; b=M0hlhV7MqNO1F1MezaSEWaQWJ4ODhBlt/ywxnrufJ0TCozr+u4yi5MIx1ahy7GJ+pRPUeNmT+I5+ vP5IxmV/BwZJt8oFInL4YdYaoDNr6lO53jkSLvmXxZtlMyCoxf+E
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is the end of the work started with commit 76222808fc25 ("powerpc:
Move C prototypes out of asm-prototypes.h")

Now that asm/machdep.h doesn't include asm/setup.h anymore, there are
no conflicts anymore with the function prom_init() defined in
drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.o

So we can move it to asm/setup.h

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/asm-prototypes.h | 6 ------
 arch/powerpc/include/asm/setup.h          | 5 +++++
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
index d995c65d18ab..3b2bbc273055 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -34,12 +34,6 @@ int64_t __opal_call(int64_t a0, int64_t a1, int64_t a2, int64_t a3,
 		    int64_t a4, int64_t a5, int64_t a6, int64_t a7,
 		    int64_t opcode, uint64_t msr);
 
-/* prom_init (OpenFirmware) */
-unsigned long __init prom_init(unsigned long r3, unsigned long r4,
-			       unsigned long pp,
-			       unsigned long r6, unsigned long r7,
-			       unsigned long kbase);
-
 /* misc runtime */
 extern u64 __bswapdi2(u64);
 extern s64 __lshrdi3(s64, int);
diff --git a/arch/powerpc/include/asm/setup.h b/arch/powerpc/include/asm/setup.h
index 8fa37ef5da4d..14a0b8af738e 100644
--- a/arch/powerpc/include/asm/setup.h
+++ b/arch/powerpc/include/asm/setup.h
@@ -85,6 +85,11 @@ void __init machine_init(u64 dt_ptr);
 void __init early_setup(unsigned long dt_ptr);
 void early_setup_secondary(void);
 
+/* prom_init (OpenFirmware) */
+unsigned long __init prom_init(unsigned long r3, unsigned long r4,
+			       unsigned long pp, unsigned long r6,
+			       unsigned long r7, unsigned long kbase);
+
 #endif /* !__ASSEMBLY__ */
 
 #endif	/* _ASM_POWERPC_SETUP_H */
-- 
2.35.3

