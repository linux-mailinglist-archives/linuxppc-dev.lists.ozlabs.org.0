Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D639E55E577
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 16:50:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXSFq5pNGz3f41
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 00:50:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXSDJ49JGz3cdD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 00:49:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LXSD0114rz9tV2;
	Tue, 28 Jun 2022 16:49:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I0RiUS9g9W9p; Tue, 28 Jun 2022 16:49:20 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LXSCy4Xjfz9tV1;
	Tue, 28 Jun 2022 16:49:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7C4698B78B;
	Tue, 28 Jun 2022 16:49:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id dhMhwcRmvI9q; Tue, 28 Jun 2022 16:49:18 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.132])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 267988B765;
	Tue, 28 Jun 2022 16:49:18 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 25SEnDFi2928218
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Jun 2022 16:49:13 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 25SEnDpr2928217;
	Tue, 28 Jun 2022 16:49:13 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>, dja@axtens.net
Subject: [PATCH v1 5/6] powerpc/64e: Reorganise virtual memory
Date: Tue, 28 Jun 2022 16:48:58 +0200
Message-Id: <54ef01673bf14228106afd629f795c83acb9a00c.1656427701.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <8d6c5859a45935d6e1a336da4dc20be421e8cea7.1656427701.git.christophe.leroy@csgroup.eu>
References: <8d6c5859a45935d6e1a336da4dc20be421e8cea7.1656427701.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1656427736; l=2573; s=20211009; h=from:subject:message-id; bh=++EPzV4vloMpYqGx/28Aw/HwNOhJ8+EhMtdYTqoW0xY=; b=5DLGHrl92qjqKx0KepWMCe7d2dvgR7Bcp9ZFYNM+qsRclSKVOXV3qrfhF9Pr9refzdGGpggjXv+9 Yz1HMlnJDuDOVwjxMzictmmTRhYVLA5op1vPfiioygufMdaf4H+1
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Reduce the size of IO map in order to leave the last
quarter of virtual MAP for KASAN shadow mapping.

This gives the following layout.

   +------------------------+  Kernel virtual map end (0xc000200000000000)
   |                        |
   |    16TB (unused)       |
   |                        |
   +------------------------+  Kernel IO map end
   |                        |
   |    16TB of IO map      |
   |                        |
   +------------------------+  Kernel IO map start
   |                        |
   |    16TB of vmemmap     |
   |                        |
   +------------------------+  Kernel vmemmap start
   |                        |
   |    16TB of vmap        |
   |                        |
   +------------------------+  Kernel virt start (0xc000100000000000)
   |                        |
   |    64TB of linear mem  |
   |                        |
   +------------------------+  Kernel linear (0xc.....)

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/nohash/64/pgtable.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/64/pgtable.h b/arch/powerpc/include/asm/nohash/64/pgtable.h
index 76a144b58f9b..88906d9194c5 100644
--- a/arch/powerpc/include/asm/nohash/64/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/64/pgtable.h
@@ -38,15 +38,16 @@
 #define VMALLOC_END	(VMALLOC_START + VMALLOC_SIZE)
 
 /*
- * The second half of the kernel virtual space is used for IO mappings,
+ * The third quarter of the kernel virtual space is used for IO mappings,
  * it's itself carved into the PIO region (ISA and PHB IO space) and
  * the ioremap space
  *
  *  ISA_IO_BASE = KERN_IO_START, 64K reserved area
  *  PHB_IO_BASE = ISA_IO_BASE + 64K to ISA_IO_BASE + 2G, PHB IO spaces
- * IOREMAP_BASE = ISA_IO_BASE + 2G to VMALLOC_START + PGTABLE_RANGE
+ * IOREMAP_BASE = ISA_IO_BASE + 2G to KERN_IO_START + KERN_IO_SIZE
  */
 #define KERN_IO_START	(KERN_VIRT_START + (KERN_VIRT_SIZE >> 1))
+#define KERN_IO_SIZE	(KERN_VIRT_SIZE >> 2)
 #define FULL_IO_SIZE	0x80000000ul
 #define  ISA_IO_BASE	(KERN_IO_START)
 #define  ISA_IO_END	(KERN_IO_START + 0x10000ul)
@@ -54,7 +55,7 @@
 #define  PHB_IO_END	(KERN_IO_START + FULL_IO_SIZE)
 #define IOREMAP_BASE	(PHB_IO_END)
 #define IOREMAP_START	(ioremap_bot)
-#define IOREMAP_END	(KERN_VIRT_START + KERN_VIRT_SIZE - FIXADDR_SIZE)
+#define IOREMAP_END	(KERN_IO_START + KERN_IO_SIZE - FIXADDR_SIZE)
 #define FIXADDR_SIZE	SZ_32M
 
 /*
-- 
2.36.1

