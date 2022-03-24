Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2114E5CEF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Mar 2022 02:50:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KP7Tr3xsXz3bPB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Mar 2022 12:50:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=meizu.com (client-ip=112.91.151.210; helo=mail.meizu.com;
 envelope-from=baihaowen@meizu.com; receiver=<UNKNOWN>)
Received: from mail.meizu.com (edge07.meizu.com [112.91.151.210])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KP7TM4PGbz2yns
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Mar 2022 12:50:11 +1100 (AEDT)
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by mz-mail11.meizu.com
 (172.16.1.15) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 24 Mar
 2022 09:49:58 +0800
Received: from meizu.meizu.com (172.16.137.70) by IT-EXMB-1-125.meizu.com
 (172.16.1.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 24 Mar
 2022 09:49:57 +0800
From: Haowen Bai <baihaowen@meizu.com>
To: <mpe@ellerman.id.au>, <benh@kernel.crashing.org>, <paulus@samba.org>
Subject: [PATCH] powerpc/xmon: Fix warning comparing pointer to 0
Date: Thu, 24 Mar 2022 09:49:56 +0800
Message-ID: <1648086596-26899-1-git-send-email-baihaowen@meizu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.137.70]
X-ClientProxiedBy: IT-EXMB-1-125.meizu.com (172.16.1.125) To
 IT-EXMB-1-125.meizu.com (172.16.1.125)
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
Cc: Haowen Bai <baihaowen@meizu.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Avoid pointer type value compared with 0 to make code clear.

Signed-off-by: Haowen Bai <baihaowen@meizu.com>
---
 arch/powerpc/xmon/spu-dis.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/xmon/spu-dis.c b/arch/powerpc/xmon/spu-dis.c
index 4b0a4e6..6078aa5 100644
--- a/arch/powerpc/xmon/spu-dis.c
+++ b/arch/powerpc/xmon/spu-dis.c
@@ -34,7 +34,7 @@ init_spu_disassemble (void)
       int o = spu_opcodes[i].opcode;
       if (o >= SPU_DISASM_TBL_SIZE)
 	continue; /* abort (); */
-      if (spu_disassemble_table[o] == 0)
+      if (!spu_disassemble_table[o])
 	spu_disassemble_table[o] = &spu_opcodes[i];
     }
 }
@@ -48,30 +48,30 @@ get_index_for_opcode (unsigned int insn)
 
   /* Init the table.  This assumes that element 0/opcode 0 (currently
    * NOP) is always used */
-  if (spu_disassemble_table[0] == 0)
+  if (!spu_disassemble_table[0])
     init_spu_disassemble ();
 
-  if ((index = spu_disassemble_table[opcode & 0x780]) != 0
+  if ((index = spu_disassemble_table[opcode & 0x780]) != NULL
       && index->insn_type == RRR)
     return index;
 
-  if ((index = spu_disassemble_table[opcode & 0x7f0]) != 0
+  if ((index = spu_disassemble_table[opcode & 0x7f0]) != NULL
       && (index->insn_type == RI18 || index->insn_type == LBT))
     return index;
 
-  if ((index = spu_disassemble_table[opcode & 0x7f8]) != 0
+  if ((index = spu_disassemble_table[opcode & 0x7f8]) != NULL
       && index->insn_type == RI10)
     return index;
 
-  if ((index = spu_disassemble_table[opcode & 0x7fc]) != 0
+  if ((index = spu_disassemble_table[opcode & 0x7fc]) != NULL
       && (index->insn_type == RI16))
     return index;
 
-  if ((index = spu_disassemble_table[opcode & 0x7fe]) != 0
+  if ((index = spu_disassemble_table[opcode & 0x7fe]) != NULL
       && (index->insn_type == RI8))
     return index;
 
-  if ((index = spu_disassemble_table[opcode & 0x7ff]) != 0)
+  if ((index = spu_disassemble_table[opcode & 0x7ff]) != NULL)
     return index;
 
   return NULL;
@@ -89,7 +89,7 @@ print_insn_spu (unsigned long insn, unsigned long memaddr)
 
   index = get_index_for_opcode (insn);
 
-  if (index == 0)
+  if (!index)
     {
       printf(".long 0x%lx", insn);
     }
-- 
2.7.4

