Return-Path: <linuxppc-dev+bounces-4308-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5744E9F6425
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 11:57:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCrFG0qrmz30fm;
	Wed, 18 Dec 2024 21:55:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734519346;
	cv=none; b=iFXyTOsIcgD0mqgG0CDvbdPIfGSlqCwrXxwd2K2EBqAeXhwqP8m5ePosxM4z8ROfoo8+q7xbYpikrQhxtevKZAY9Et0X4ZIDXNDGfgOmqq5JRVkcxiAPiO7vMWFWO6yO0hGEZDA2DhChRIjAapexMy1v9NLy2dyrdE0iLLB3sR/OG3dU37sfjFV2agR68BRLoIR3PwBXIudAvUeQNwRVE2O+VtWEW6PLYxGSyKkPHU17gJdxr6z2bwuiD+W51V9PKm+diR03g/k2t6gNTkvCWwzIGkjecdpu4ki2pNckqIdv3KH4QD19Se4Or9Q6UnKrH09sfcUn3P3pPWR0bwNPWA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734519346; c=relaxed/relaxed;
	bh=0bJzDQpGk8UXBA1HTd/AIQkDvWLBohj3yf18cbAcX5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HUPZgmDBv+oZPkuVCqMTuqEvoALvRHkGBaYVxNETKFHpWNisDd54hhTScxp4dx3u4r9RJL8R1p8BCrNLQqtzpKHSKiswoNuXCQwYvPBhVAzj/R5sPVLYWjgjAwUUr4KLc5tCamsjeDNqrMSY7UkCmR5pLUQEdO0LHgDVVfntz5/HgXD6I7suaKmqdI360UOlyuwfXu8OnC5NxBfun/8mhx+22GgWb4vs4daJV5zzlmLaFFoM5NOW526ecXhRMSwgbSLyJJvc6W9RmLJK2Wrehsge7pzBwojLpqrAJhgqStODtC3QCm3Z2MznhD2u/nY0ZPWpuEPGl/OM02nKRONKYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=bxRxbakh; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=bxRxbakh;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCrF35wWkz2ykt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 21:55:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1734519329;
	bh=0bJzDQpGk8UXBA1HTd/AIQkDvWLBohj3yf18cbAcX5U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bxRxbakh8c2AOZNr8LY/iQimFf1ZgrLoRhgeve8T8jkse7O7jB3ER0K7Aa3+eF3Pn
	 ahilj7Unc4ZV6t02XKeLXbWdHDyMw8ZLQLg9glrRfcOldUZBX9P7Q4B/ca1we46E3e
	 IIDMz+LJXRgcaUWC1aoUId4iWyDs5Z9FmeMO934ETAeDXvx9tQrAulygMQXCFLRX/4
	 jIpf0/u5u6lSiW4N7S3/3xkIwOqB3GpeuZk2g7gtvuLvBkK9b4wGk6rFMMJnpW2jP2
	 gNjbPELiM/7UJXDwP3Giz2wlU37mdQD0meVdroKhO9RGm9xLHI8L3/pl/qRq16gGa1
	 eTMYTpJLYGpEw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YCrDx2kLQz4xf9;
	Wed, 18 Dec 2024 21:55:29 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <arnd@arndb.de>,
	<jk@ozlabs.org>,
	<segher@kernel.crashing.org>
Subject: [PATCH v2 06/25] powerpc/xmon: Remove SPU debug and disassembly
Date: Wed, 18 Dec 2024 21:54:54 +1100
Message-ID: <20241218105523.416573-6-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218105523.416573-1-mpe@ellerman.id.au>
References: <20241218105523.416573-1-mpe@ellerman.id.au>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Now that the IBM Cell Blade support is removed, the xmon SPU support is
effectively unusable. That is because PS3 doesn't implement udbg_getc
which is required to send input to xmon.

So remove the xmon SPU support.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
v2: Unchanged.

 arch/powerpc/include/asm/xmon.h        |   2 -
 arch/powerpc/platforms/cell/spu_base.c |   2 -
 arch/powerpc/xmon/Makefile             |   5 +-
 arch/powerpc/xmon/spu-dis.c            | 237 ---------------
 arch/powerpc/xmon/spu-insns.h          | 399 -------------------------
 arch/powerpc/xmon/spu-opc.c            |  34 ---
 arch/powerpc/xmon/spu.h                | 115 -------
 arch/powerpc/xmon/xmon.c               | 273 -----------------
 8 files changed, 1 insertion(+), 1066 deletions(-)
 delete mode 100644 arch/powerpc/xmon/spu-dis.c
 delete mode 100644 arch/powerpc/xmon/spu-insns.h
 delete mode 100644 arch/powerpc/xmon/spu-opc.c
 delete mode 100644 arch/powerpc/xmon/spu.h

diff --git a/arch/powerpc/include/asm/xmon.h b/arch/powerpc/include/asm/xmon.h
index f2d44b44f46c..535cdb1e411a 100644
--- a/arch/powerpc/include/asm/xmon.h
+++ b/arch/powerpc/include/asm/xmon.h
@@ -12,13 +12,11 @@
 
 #ifdef CONFIG_XMON
 extern void xmon_setup(void);
-void __init xmon_register_spus(struct list_head *list);
 struct pt_regs;
 extern int xmon(struct pt_regs *excp);
 extern irqreturn_t xmon_irq(int, void *);
 #else
 static inline void xmon_setup(void) { }
-static inline void xmon_register_spus(struct list_head *list) { }
 #endif
 
 #if defined(CONFIG_XMON) && defined(CONFIG_SMP)
diff --git a/arch/powerpc/platforms/cell/spu_base.c b/arch/powerpc/platforms/cell/spu_base.c
index dea6f0f25897..2c07387201d0 100644
--- a/arch/powerpc/platforms/cell/spu_base.c
+++ b/arch/powerpc/platforms/cell/spu_base.c
@@ -23,7 +23,6 @@
 #include <asm/spu.h>
 #include <asm/spu_priv1.h>
 #include <asm/spu_csa.h>
-#include <asm/xmon.h>
 #include <asm/kexec.h>
 
 const struct spu_management_ops *spu_management_ops;
@@ -772,7 +771,6 @@ static int __init init_spu_base(void)
 		fb_append_extra_logo(&logo_spe_clut224, ret);
 
 	mutex_lock(&spu_full_list_mutex);
-	xmon_register_spus(&spu_full_list);
 	crash_register_spus(&spu_full_list);
 	mutex_unlock(&spu_full_list_mutex);
 	spu_add_dev_attr(&dev_attr_stat);
diff --git a/arch/powerpc/xmon/Makefile b/arch/powerpc/xmon/Makefile
index d778011060a8..d74b147126b7 100644
--- a/arch/powerpc/xmon/Makefile
+++ b/arch/powerpc/xmon/Makefile
@@ -16,7 +16,4 @@ ccflags-$(CONFIG_CC_IS_CLANG) += -Wframe-larger-than=4096
 
 obj-y			+= xmon.o nonstdio.o spr_access.o xmon_bpts.o
 
-ifdef CONFIG_XMON_DISASSEMBLY
-obj-y			+= ppc-dis.o ppc-opc.o
-obj-$(CONFIG_SPU_BASE)	+= spu-dis.o spu-opc.o
-endif
+obj-$(CONFIG_XMON_DISASSEMBLY) += ppc-dis.o ppc-opc.o
diff --git a/arch/powerpc/xmon/spu-dis.c b/arch/powerpc/xmon/spu-dis.c
deleted file mode 100644
index 4b0a4e640f08..000000000000
--- a/arch/powerpc/xmon/spu-dis.c
+++ /dev/null
@@ -1,237 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/* Disassemble SPU instructions
-
-   Copyright 2006 Free Software Foundation, Inc.
-
-   This file is part of GDB, GAS, and the GNU binutils.
-
- */
-
-#include <linux/string.h>
-#include "nonstdio.h"
-#include "ansidecl.h"
-#include "spu.h"
-#include "dis-asm.h"
-
-/* This file provides a disassembler function which uses
-   the disassembler interface defined in dis-asm.h.   */
-
-extern const struct spu_opcode spu_opcodes[];
-extern const int spu_num_opcodes;
-
-#define SPU_DISASM_TBL_SIZE (1 << 11)
-static const struct spu_opcode *spu_disassemble_table[SPU_DISASM_TBL_SIZE];
-
-static void
-init_spu_disassemble (void)
-{
-  int i;
-
-  /* If two instructions have the same opcode then we prefer the first
-   * one.  In most cases it is just an alternate mnemonic. */
-  for (i = 0; i < spu_num_opcodes; i++)
-    {
-      int o = spu_opcodes[i].opcode;
-      if (o >= SPU_DISASM_TBL_SIZE)
-	continue; /* abort (); */
-      if (spu_disassemble_table[o] == 0)
-	spu_disassemble_table[o] = &spu_opcodes[i];
-    }
-}
-
-/* Determine the instruction from the 10 least significant bits. */
-static const struct spu_opcode *
-get_index_for_opcode (unsigned int insn)
-{
-  const struct spu_opcode *index;
-  unsigned int opcode = insn >> (32-11);
-
-  /* Init the table.  This assumes that element 0/opcode 0 (currently
-   * NOP) is always used */
-  if (spu_disassemble_table[0] == 0)
-    init_spu_disassemble ();
-
-  if ((index = spu_disassemble_table[opcode & 0x780]) != 0
-      && index->insn_type == RRR)
-    return index;
-
-  if ((index = spu_disassemble_table[opcode & 0x7f0]) != 0
-      && (index->insn_type == RI18 || index->insn_type == LBT))
-    return index;
-
-  if ((index = spu_disassemble_table[opcode & 0x7f8]) != 0
-      && index->insn_type == RI10)
-    return index;
-
-  if ((index = spu_disassemble_table[opcode & 0x7fc]) != 0
-      && (index->insn_type == RI16))
-    return index;
-
-  if ((index = spu_disassemble_table[opcode & 0x7fe]) != 0
-      && (index->insn_type == RI8))
-    return index;
-
-  if ((index = spu_disassemble_table[opcode & 0x7ff]) != 0)
-    return index;
-
-  return NULL;
-}
-
-/* Print a Spu instruction.  */
-
-int
-print_insn_spu (unsigned long insn, unsigned long memaddr)
-{
-  int value;
-  int hex_value;
-  const struct spu_opcode *index;
-  enum spu_insns tag;
-
-  index = get_index_for_opcode (insn);
-
-  if (index == 0)
-    {
-      printf(".long 0x%lx", insn);
-    }
-  else
-    {
-      int i;
-      int paren = 0;
-      tag = (enum spu_insns)(index - spu_opcodes);
-      printf("%s", index->mnemonic);
-      if (tag == M_BI || tag == M_BISL || tag == M_IRET || tag == M_BISLED
-	  || tag == M_BIHNZ || tag == M_BIHZ || tag == M_BINZ || tag == M_BIZ
-          || tag == M_SYNC || tag == M_HBR)
-	{
-	  int fb = (insn >> (32-18)) & 0x7f;
-	  if (fb & 0x40)
-	    printf(tag == M_SYNC ? "c" : "p");
-	  if (fb & 0x20)
-	    printf("d");
-	  if (fb & 0x10)
-	    printf("e");
-	}
-      if (index->arg[0] != 0)
-	printf("\t");
-      hex_value = 0;
-      for (i = 1;  i <= index->arg[0]; i++)
-	{
-	  int arg = index->arg[i];
-	  if (arg != A_P && !paren && i > 1)
-	    printf(",");
-
-	  switch (arg)
-	    {
-	    case A_T:
-	      printf("$%lu",
-				     DECODE_INSN_RT (insn));
-	      break;
-	    case A_A:
-	      printf("$%lu",
-				     DECODE_INSN_RA (insn));
-	      break;
-	    case A_B:
-	      printf("$%lu",
-				     DECODE_INSN_RB (insn));
-	      break;
-	    case A_C:
-	      printf("$%lu",
-				     DECODE_INSN_RC (insn));
-	      break;
-	    case A_S:
-	      printf("$sp%lu",
-				     DECODE_INSN_RA (insn));
-	      break;
-	    case A_H:
-	      printf("$ch%lu",
-				     DECODE_INSN_RA (insn));
-	      break;
-	    case A_P:
-	      paren++;
-	      printf("(");
-	      break;
-	    case A_U7A:
-	      printf("%lu",
-				     173 - DECODE_INSN_U8 (insn));
-	      break;
-	    case A_U7B:
-	      printf("%lu",
-				     155 - DECODE_INSN_U8 (insn));
-	      break;
-	    case A_S3:
-	    case A_S6:
-	    case A_S7:
-	    case A_S7N:
-	    case A_U3:
-	    case A_U5:
-	    case A_U6:
-	    case A_U7:
-	      hex_value = DECODE_INSN_I7 (insn);
-	      printf("%d", hex_value);
-	      break;
-	    case A_S11:
-	      print_address(memaddr + DECODE_INSN_I9a (insn) * 4);
-	      break;
-	    case A_S11I:
-	      print_address(memaddr + DECODE_INSN_I9b (insn) * 4);
-	      break;
-	    case A_S10:
-	    case A_S10B:
-	      hex_value = DECODE_INSN_I10 (insn);
-	      printf("%d", hex_value);
-	      break;
-	    case A_S14:
-	      hex_value = DECODE_INSN_I10 (insn) * 16;
-	      printf("%d", hex_value);
-	      break;
-	    case A_S16:
-	      hex_value = DECODE_INSN_I16 (insn);
-	      printf("%d", hex_value);
-	      break;
-	    case A_X16:
-	      hex_value = DECODE_INSN_U16 (insn);
-	      printf("%u", hex_value);
-	      break;
-	    case A_R18:
-	      value = DECODE_INSN_I16 (insn) * 4;
-	      if (value == 0)
-		printf("%d", value);
-	      else
-		{
-		  hex_value = memaddr + value;
-		  print_address(hex_value & 0x3ffff);
-		}
-	      break;
-	    case A_S18:
-	      value = DECODE_INSN_U16 (insn) * 4;
-	      if (value == 0)
-		printf("%d", value);
-	      else
-		print_address(value);
-	      break;
-	    case A_U18:
-	      value = DECODE_INSN_U18 (insn);
-	      if (value == 0 || 1)
-		{
-		  hex_value = value;
-		  printf("%u", value);
-		}
-	      else
-		print_address(value);
-	      break;
-	    case A_U14:
-	      hex_value = DECODE_INSN_U14 (insn);
-	      printf("%u", hex_value);
-	      break;
-	    }
-	  if (arg != A_P && paren)
-	    {
-	      printf(")");
-	      paren--;
-	    }
-	}
-      if (hex_value > 16)
-	printf("\t# %x", hex_value);
-    }
-  return 4;
-}
diff --git a/arch/powerpc/xmon/spu-insns.h b/arch/powerpc/xmon/spu-insns.h
deleted file mode 100644
index 7e1126a19909..000000000000
--- a/arch/powerpc/xmon/spu-insns.h
+++ /dev/null
@@ -1,399 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/* SPU ELF support for BFD.
-
-   Copyright 2006 Free Software Foundation, Inc.
-
-   This file is part of BFD, the Binary File Descriptor library.
-
- */
-
-/* SPU Opcode Table
-
--=-=-= FORMAT =-=-=-
-                                             		                                             
-       +----+-------+-------+-------+-------+  		       +------------+-------+-------+-------+
-RRR    | op |  RC   |  RB   |  RA   |  RT   |		RI7    | op         |  I7   |  RA   |  RT   |
-       +----+-------+-------+-------+-------+		       +------------+-------+-------+-------+
-        0  3       1       1       2       3		        0          1       1       2       3 
-                   0       7       4       1		                   0       7       4       1 
-
-       +-----------+--------+-------+-------+		       +---------+----------+-------+-------+
-RI8    | op        |   I8   |  RA   |  RT   |		RI10   | op      |   I10    |  RA   |  RT   |
-       +-----------+--------+-------+-------+		       +---------+----------+-------+-------+
-        0         9        1       2       3		        0       7          1       2       3 
-                           7       4       1		                           7       4       1 
-
-       +----------+-----------------+-------+		       +--------+-------------------+-------+
-RI16   | op       |       I16       |  RT   |		RI18   | op     |       I18         |  RT   |
-       +----------+-----------------+-------+		       +--------+-------------------+-------+
-        0        8                 2       3		        0      6                   2       3 
-                                   4       1		                                   4       1 
-
-       +------------+-------+-------+-------+		       +-------+--+-----------------+-------+
-RR     | op         |  RB   |  RA   |  RT   |		LBT    | op    |RO|       I16       |  RO   |
-       +------------+-------+-------+-------+		       +-------+--+-----------------+-------+
-        0          1       1       2       3		        0     6  8                 2       3 
-                   0       7       4       1		                                   4       1 
-
-							       +------------+----+--+-------+-------+
-							LBTI   | op         | // |RO|  RA   |  RO   |
-							       +------------+----+--+-------+-------+
-							        0          1    1  1       2       3
-							                   0    5  7       4       1
-
--=-=-= OPCODE =-=-=-
-
-OPCODE field specifies the most significant 11bit of the instruction. Some formats don't have 11bits for opcode field, and in this
-case, bit field other than op are defined as 0s. For example, opcode of fma instruction which is RRR format is defined as 0x700,
-since 0x700 -> 11'b11100000000, this means opcode is 4'b1110, and other 7bits are defined as 7'b0000000.
-
--=-=-= ASM_FORMAT =-=-=-
-
-RRR category						RI7 category                               
-	ASM_RRR		mnemonic RC, RA, RB, RT		        ASM_RI4         mnemonic RT, RA, I4
-							        ASM_RI7         mnemonic RT, RA, I7
-
-RI8 category						RI10 category                               
-	ASM_RUI8	mnemonic RT, RA, UI8		        ASM_AI10        mnemonic RA, I10    
-							        ASM_RI10        mnemonic RT, RA, R10
-							        ASM_RI10IDX     mnemonic RT, I10(RA)
-
-RI16 category						RI18 category                           
-	ASM_I16W	mnemonic I16W			        ASM_RI18        mnemonic RT, I18
-	ASM_RI16	mnemonic RT, I16
-	ASM_RI16W	mnemonic RT, I16W
-
-RR category						LBT category                                    
-	ASM_MFSPR	mnemonic RT, SA			        ASM_LBT         mnemonic brinst, brtarg 
-	ASM_MTSPR	mnemonic SA, RT			                                                
-	ASM_NOOP	mnemonic			LBTI category                                   
-	ASM_RA		mnemonic RA			        ASM_LBTI        mnemonic brinst, RA     
-	ASM_RAB		mnemonic RA, RB
-	ASM_RDCH	mnemonic RT, CA
-	ASM_RR		mnemonic RT, RA, RB
-	ASM_RT		mnemonic RT
-	ASM_RTA		mnemonic RT, RA
-	ASM_WRCH	mnemonic CA, RT
-
-Note that RRR instructions have the names for RC and RT reversed from
-what's in the ISA, in order to put RT in the same position it appears
-for other formats.
-
--=-=-= DEPENDENCY =-=-=-
-
-DEPENDENCY filed consists of 5 digits. This represents which register is used as source and which register is used as target.
-The first(most significant) digit is always 0. Then it is followd by RC, RB, RA and RT digits.
-If the digit is 0, this means the corresponding register is not used in the instruction.
-If the digit is 1, this means the corresponding register is used as a source in the instruction.
-If the digit is 2, this means the corresponding register is used as a target in the instruction.
-If the digit is 3, this means the corresponding register is used as both source and target in the instruction.
-For example, fms instruction has 00113 as the DEPENDENCY field. This means RC is not used in this operation, RB and RA are
-used as sources and RT is the target.
-
--=-=-= PIPE =-=-=-
-
-This field shows which execution pipe is used for the instruction
-
-pipe0 execution pipelines:
-	FP6	SP floating pipeline
-	FP7	integer operations executed in SP floating pipeline
-	FPD	DP floating pipeline
-	FX2	FXU pipeline
-	FX3	Rotate/Shift pipeline
-	FXB	Byte pipeline
-	NOP	No pipeline
-
-pipe1 execution pipelines:
-	BR	Branch pipeline
-	LNOP	No pipeline
-	LS	Load/Store pipeline
-	SHUF	Shuffle pipeline
-	SPR	SPR/CH pipeline
-
-*/
-
-#define _A0() {0}
-#define _A1(a) {1,a}
-#define _A2(a,b) {2,a,b}
-#define _A3(a,b,c) {3,a,b,c}
-#define _A4(a,b,c,d) {4,a,b,c,d}
-
-/*    TAG		FORMAT	OPCODE	MNEMONIC	ASM_FORMAT	DEPENDENCY	PIPE	COMMENT				*/
-/*									0[RC][RB][RA][RT]					*/
-/*									1:src, 2:target						*/
-
-APUOP(M_BR,		RI16,	0x190,	"br",		_A1(A_R18),	00000,	BR)	/* BRel          IP<-IP+I16 */
-APUOP(M_BRSL,		RI16,	0x198,	"brsl",		_A2(A_T,A_R18),	00002,	BR)	/* BRelSetLink   RT,IP<-IP,IP+I16 */
-APUOP(M_BRA,		RI16,	0x180,	"bra",		_A1(A_S18),	00000,	BR)	/* BRAbs         IP<-I16 */
-APUOP(M_BRASL,		RI16,	0x188,	"brasl",	_A2(A_T,A_S18),	00002,	BR)	/* BRAbsSetLink  RT,IP<-IP,I16 */
-APUOP(M_FSMBI,		RI16,	0x194,	"fsmbi",	_A2(A_T,A_X16),	00002,	SHUF)	/* FormSelMask%I RT<-fsm(I16) */
-APUOP(M_LQA,		RI16,	0x184,	"lqa",		_A2(A_T,A_S18),	00002,	LS)	/* LoadQAbs      RT<-M[I16] */
-APUOP(M_LQR,		RI16,	0x19C,	"lqr",		_A2(A_T,A_R18),	00002,	LS)	/* LoadQRel      RT<-M[IP+I16] */
-APUOP(M_STOP,		RR,	0x000,	"stop",		_A0(),		00000,	BR)	/* STOP          stop */
-APUOP(M_STOP2,		RR,	0x000,	"stop",		_A1(A_U14),	00000,	BR)	/* STOP          stop */
-APUOP(M_STOPD,		RR,	0x140,	"stopd",	_A3(A_T,A_A,A_B),         00111,	BR)	/* STOPD         stop (with register dependencies) */
-APUOP(M_LNOP,		RR,	0x001,	"lnop",		_A0(),		00000,	LNOP)	/* LNOP          no_operation */
-APUOP(M_SYNC,		RR,	0x002,	"sync",		_A0(),		00000,	BR)	/* SYNC          flush_pipe */
-APUOP(M_DSYNC,		RR,	0x003,	"dsync",	_A0(),		00000,	BR)	/* DSYNC         flush_store_queue */
-APUOP(M_MFSPR,		RR,	0x00c,	"mfspr",	_A2(A_T,A_S),	00002,	SPR)	/* MFSPR         RT<-SA */
-APUOP(M_RDCH,		RR,	0x00d,	"rdch",		_A2(A_T,A_H),	00002,	SPR)	/* ReaDCHannel   RT<-CA:data */
-APUOP(M_RCHCNT,		RR,	0x00f,	"rchcnt",	_A2(A_T,A_H),	00002,	SPR)	/* ReaDCHanCouNT RT<-CA:count */
-APUOP(M_HBRA,		LBT,	0x080,	"hbra",		_A2(A_S11,A_S18),	00000,	LS)	/* HBRA          BTB[B9]<-M[I16] */
-APUOP(M_HBRR,		LBT,	0x090,	"hbrr",		_A2(A_S11,A_R18),	00000,	LS)	/* HBRR          BTB[B9]<-M[IP+I16] */
-APUOP(M_BRZ,		RI16,	0x100,	"brz",		_A2(A_T,A_R18),	00001,	BR)	/* BRZ           IP<-IP+I16_if(RT) */
-APUOP(M_BRNZ,		RI16,	0x108,	"brnz",		_A2(A_T,A_R18),	00001,	BR)	/* BRNZ          IP<-IP+I16_if(RT) */
-APUOP(M_BRHZ,		RI16,	0x110,	"brhz",		_A2(A_T,A_R18),	00001,	BR)	/* BRHZ          IP<-IP+I16_if(RT) */
-APUOP(M_BRHNZ,		RI16,	0x118,	"brhnz",	_A2(A_T,A_R18),	00001,	BR)	/* BRHNZ         IP<-IP+I16_if(RT) */
-APUOP(M_STQA,		RI16,	0x104,	"stqa",		_A2(A_T,A_S18),	00001,	LS)	/* SToreQAbs     M[I16]<-RT */
-APUOP(M_STQR,		RI16,	0x11C,	"stqr",		_A2(A_T,A_R18),	00001,	LS)	/* SToreQRel     M[IP+I16]<-RT */
-APUOP(M_MTSPR,		RR,	0x10c,	"mtspr",	_A2(A_S,A_T),	00001,	SPR)	/* MTSPR         SA<-RT */
-APUOP(M_WRCH,		RR,	0x10d,	"wrch",		_A2(A_H,A_T),	00001,	SPR)	/* ChanWRite     CA<-RT */
-APUOP(M_LQD,		RI10,	0x1a0,	"lqd",		_A4(A_T,A_S14,A_P,A_A),	00012,	LS)	/* LoadQDisp     RT<-M[Ra+I10] */
-APUOP(M_BI,		RR,	0x1a8,	"bi",		_A1(A_A),		00010,	BR)	/* BI            IP<-RA */
-APUOP(M_BISL,		RR,	0x1a9,	"bisl",		_A2(A_T,A_A),	00012,	BR)	/* BISL          RT,IP<-IP,RA */
-APUOP(M_IRET,  		RR,	0x1aa,	"iret",	        _A1(A_A), 	00010,	BR)	/* IRET          IP<-SRR0 */
-APUOP(M_IRET2, 		RR,	0x1aa,	"iret",	        _A0(),	 	00010,	BR)	/* IRET          IP<-SRR0 */
-APUOP(M_BISLED,		RR,	0x1ab,	"bisled",	_A2(A_T,A_A),	00012,	BR)	/* BISLED        RT,IP<-IP,RA_if(ext) */
-APUOP(M_HBR,		LBTI,	0x1ac,	"hbr",		_A2(A_S11I,A_A),	00010,	LS)	/* HBR           BTB[B9]<-M[Ra] */
-APUOP(M_FREST,		RR,	0x1b8,	"frest",	_A2(A_T,A_A),	00012,	SHUF)	/* FREST         RT<-recip(RA) */
-APUOP(M_FRSQEST,	RR,	0x1b9,	"frsqest",	_A2(A_T,A_A),	00012,	SHUF)	/* FRSQEST       RT<-rsqrt(RA) */
-APUOP(M_FSM,		RR,	0x1b4,	"fsm",		_A2(A_T,A_A),	00012,	SHUF)	/* FormSelMask%  RT<-expand(Ra) */
-APUOP(M_FSMH,		RR,	0x1b5,	"fsmh",		_A2(A_T,A_A),	00012,	SHUF)	/* FormSelMask%  RT<-expand(Ra) */
-APUOP(M_FSMB,		RR,	0x1b6,	"fsmb",		_A2(A_T,A_A),	00012,	SHUF)	/* FormSelMask%  RT<-expand(Ra) */
-APUOP(M_GB,		RR,	0x1b0,	"gb",		_A2(A_T,A_A),	00012,	SHUF)	/* GatherBits%   RT<-gather(RA) */
-APUOP(M_GBH,		RR,	0x1b1,	"gbh",		_A2(A_T,A_A),	00012,	SHUF)	/* GatherBits%   RT<-gather(RA) */
-APUOP(M_GBB,		RR,	0x1b2,	"gbb",		_A2(A_T,A_A),	00012,	SHUF)	/* GatherBits%   RT<-gather(RA) */
-APUOP(M_CBD,		RI7,	0x1f4,	"cbd",		_A4(A_T,A_U7,A_P,A_A),	00012,	SHUF)	/* genCtl%%insD  RT<-sta(Ra+I4,siz) */
-APUOP(M_CHD,		RI7,	0x1f5,	"chd",		_A4(A_T,A_U7,A_P,A_A),	00012,	SHUF)	/* genCtl%%insD  RT<-sta(Ra+I4,siz) */
-APUOP(M_CWD,		RI7,	0x1f6,	"cwd",		_A4(A_T,A_U7,A_P,A_A),	00012,	SHUF)	/* genCtl%%insD  RT<-sta(Ra+I4,siz) */
-APUOP(M_CDD,		RI7,	0x1f7,	"cdd",		_A4(A_T,A_U7,A_P,A_A),	00012,	SHUF)	/* genCtl%%insD  RT<-sta(Ra+I4,siz) */
-APUOP(M_ROTQBII,	RI7,	0x1f8,	"rotqbii",	_A3(A_T,A_A,A_U3),	00012,	SHUF)	/* ROTQBII       RT<-RA<<<I7 */
-APUOP(M_ROTQBYI,	RI7,	0x1fc,	"rotqbyi",	_A3(A_T,A_A,A_S7N),	00012,	SHUF)	/* ROTQBYI       RT<-RA<<<(I7*8) */
-APUOP(M_ROTQMBII,	RI7,	0x1f9,	"rotqmbii",	_A3(A_T,A_A,A_S3),	00012,	SHUF)	/* ROTQMBII      RT<-RA<<I7 */
-APUOP(M_ROTQMBYI,	RI7,	0x1fd,	"rotqmbyi",	_A3(A_T,A_A,A_S6),	00012,	SHUF)	/* ROTQMBYI      RT<-RA<<I7 */
-APUOP(M_SHLQBII,	RI7,	0x1fb,	"shlqbii",	_A3(A_T,A_A,A_U3),	00012,	SHUF)	/* SHLQBII       RT<-RA<<I7 */
-APUOP(M_SHLQBYI,	RI7,	0x1ff,	"shlqbyi",	_A3(A_T,A_A,A_U5),	00012,	SHUF)	/* SHLQBYI       RT<-RA<<I7 */
-APUOP(M_STQD,		RI10,	0x120,	"stqd",		_A4(A_T,A_S14,A_P,A_A),	00011,	LS)	/* SToreQDisp    M[Ra+I10]<-RT */
-APUOP(M_BIHNZ,		RR,	0x12b,	"bihnz",	_A2(A_T,A_A),	00011,	BR)	/* BIHNZ         IP<-RA_if(RT) */
-APUOP(M_BIHZ,		RR,	0x12a,	"bihz",		_A2(A_T,A_A),	00011,	BR)	/* BIHZ          IP<-RA_if(RT) */
-APUOP(M_BINZ,		RR,	0x129,	"binz",		_A2(A_T,A_A),	00011,	BR)	/* BINZ          IP<-RA_if(RT) */
-APUOP(M_BIZ,		RR,	0x128,	"biz",		_A2(A_T,A_A),	00011,	BR)	/* BIZ           IP<-RA_if(RT) */
-APUOP(M_CBX,		RR,	0x1d4,	"cbx",		_A3(A_T,A_A,A_B),		00112,	SHUF)	/* genCtl%%insX  RT<-sta(Ra+Rb,siz) */
-APUOP(M_CHX,		RR,	0x1d5,	"chx",		_A3(A_T,A_A,A_B),		00112,	SHUF)	/* genCtl%%insX  RT<-sta(Ra+Rb,siz) */
-APUOP(M_CWX,		RR,	0x1d6,	"cwx",		_A3(A_T,A_A,A_B),		00112,	SHUF)	/* genCtl%%insX  RT<-sta(Ra+Rb,siz) */
-APUOP(M_CDX,		RR,	0x1d7,	"cdx",		_A3(A_T,A_A,A_B),		00112,	SHUF)	/* genCtl%%insX  RT<-sta(Ra+Rb,siz) */
-APUOP(M_LQX,		RR,	0x1c4,	"lqx",		_A3(A_T,A_A,A_B),		00112,	LS)	/* LoadQindeX    RT<-M[Ra+Rb] */
-APUOP(M_ROTQBI,		RR,	0x1d8,	"rotqbi",	_A3(A_T,A_A,A_B),		00112,	SHUF)	/* ROTQBI        RT<-RA<<<Rb */
-APUOP(M_ROTQMBI,	RR,	0x1d9,	"rotqmbi",	_A3(A_T,A_A,A_B),		00112,	SHUF)	/* ROTQMBI       RT<-RA<<Rb */
-APUOP(M_SHLQBI,		RR,	0x1db,	"shlqbi",	_A3(A_T,A_A,A_B),		00112,	SHUF)	/* SHLQBI        RT<-RA<<Rb */
-APUOP(M_ROTQBY,		RR,	0x1dc,	"rotqby",	_A3(A_T,A_A,A_B),		00112,		SHUF)	/* ROTQBY        RT<-RA<<<(Rb*8) */
-APUOP(M_ROTQMBY,	RR,	0x1dd,	"rotqmby",	_A3(A_T,A_A,A_B),		00112,		SHUF)	/* ROTQMBY       RT<-RA<<Rb */
-APUOP(M_SHLQBY,		RR,	0x1df,	"shlqby",	_A3(A_T,A_A,A_B),		00112,	SHUF)	/* SHLQBY        RT<-RA<<Rb */
-APUOP(M_ROTQBYBI,	RR,	0x1cc,	"rotqbybi",	_A3(A_T,A_A,A_B),		00112,		SHUF)	/* ROTQBYBI      RT<-RA<<Rb */
-APUOP(M_ROTQMBYBI,	RR,	0x1cd,	"rotqmbybi",	_A3(A_T,A_A,A_B),		00112,		SHUF)	/* ROTQMBYBI     RT<-RA<<Rb */
-APUOP(M_SHLQBYBI,	RR,	0x1cf,	"shlqbybi",	_A3(A_T,A_A,A_B),		00112,	SHUF)	/* SHLQBYBI      RT<-RA<<Rb */
-APUOP(M_STQX,		RR,	0x144,	"stqx",		_A3(A_T,A_A,A_B),		00111,	LS)	/* SToreQindeX   M[Ra+Rb]<-RT */
-APUOP(M_SHUFB,		RRR,	0x580,	"shufb",	_A4(A_C,A_A,A_B,A_T),	02111,	SHUF)	/* SHUFfleBytes  RC<-f(RA,RB,RT) */
-APUOP(M_IL,		RI16,	0x204,	"il",		_A2(A_T,A_S16),	00002,	FX2)	/* ImmLoad       RT<-sxt(I16) */
-APUOP(M_ILH,		RI16,	0x20c,	"ilh",		_A2(A_T,A_X16),	00002,	FX2)	/* ImmLoadH      RT<-I16 */
-APUOP(M_ILHU,		RI16,	0x208,	"ilhu",		_A2(A_T,A_X16),	00002,	FX2)	/* ImmLoadHUpper RT<-I16<<16 */
-APUOP(M_ILA,		RI18,	0x210,	"ila",		_A2(A_T,A_U18),	00002,	FX2)	/* ImmLoadAddr   RT<-zxt(I18) */
-APUOP(M_NOP,		RR,	0x201,	"nop",		_A1(A_T),		00000,	NOP)	/* XNOP          no_operation */
-APUOP(M_NOP2,		RR,	0x201,	"nop",		_A0(),		00000,	NOP)	/* XNOP          no_operation */
-APUOP(M_IOHL,		RI16,	0x304,	"iohl",		_A2(A_T,A_X16),	00003,	FX2)	/* AddImmeXt     RT<-RT+sxt(I16) */
-APUOP(M_ANDBI,		RI10,	0x0b0,	"andbi",	_A3(A_T,A_A,A_S10B),	00012,	FX2)	/* AND%I         RT<-RA&I10 */
-APUOP(M_ANDHI,		RI10,	0x0a8,	"andhi",	_A3(A_T,A_A,A_S10),	00012,	FX2)	/* AND%I         RT<-RA&I10 */
-APUOP(M_ANDI,		RI10,	0x0a0,	"andi",		_A3(A_T,A_A,A_S10),	00012,	FX2)	/* AND%I         RT<-RA&I10 */
-APUOP(M_ORBI,		RI10,	0x030,	"orbi",		_A3(A_T,A_A,A_S10B),	00012,	FX2)	/* OR%I          RT<-RA|I10 */
-APUOP(M_ORHI,		RI10,	0x028,	"orhi",		_A3(A_T,A_A,A_S10),	00012,	FX2)	/* OR%I          RT<-RA|I10 */
-APUOP(M_ORI,		RI10,	0x020,	"ori",		_A3(A_T,A_A,A_S10),	00012,	FX2)	/* OR%I          RT<-RA|I10 */
-APUOP(M_ORX,		RR,	0x1f0,	"orx",		_A2(A_T,A_A),		00012,	BR)	/* ORX           RT<-RA.w0|RA.w1|RA.w2|RA.w3 */
-APUOP(M_XORBI,		RI10,	0x230,	"xorbi",	_A3(A_T,A_A,A_S10B),	00012,	FX2)	/* XOR%I         RT<-RA^I10 */
-APUOP(M_XORHI,		RI10,	0x228,	"xorhi",	_A3(A_T,A_A,A_S10),	00012,	FX2)	/* XOR%I         RT<-RA^I10 */
-APUOP(M_XORI,		RI10,	0x220,	"xori",		_A3(A_T,A_A,A_S10),	00012,	FX2)	/* XOR%I         RT<-RA^I10 */
-APUOP(M_AHI,		RI10,	0x0e8,	"ahi",		_A3(A_T,A_A,A_S10),	00012,	FX2)	/* Add%Immed     RT<-RA+I10 */
-APUOP(M_AI,		RI10,	0x0e0,	"ai",		_A3(A_T,A_A,A_S10),	00012,	FX2)	/* Add%Immed     RT<-RA+I10 */
-APUOP(M_SFHI,		RI10,	0x068,	"sfhi",		_A3(A_T,A_A,A_S10),	00012,	FX2)	/* SubFrom%Imm   RT<-I10-RA */
-APUOP(M_SFI,		RI10,	0x060,	"sfi",		_A3(A_T,A_A,A_S10),	00012,	FX2)	/* SubFrom%Imm   RT<-I10-RA */
-APUOP(M_CGTBI,		RI10,	0x270,	"cgtbi",	_A3(A_T,A_A,A_S10B),	00012,	FX2)	/* CGT%I         RT<-(RA>I10) */
-APUOP(M_CGTHI,		RI10,	0x268,	"cgthi",	_A3(A_T,A_A,A_S10),	00012,	FX2)	/* CGT%I         RT<-(RA>I10) */
-APUOP(M_CGTI,		RI10,	0x260,	"cgti",		_A3(A_T,A_A,A_S10),	00012,	FX2)	/* CGT%I         RT<-(RA>I10) */
-APUOP(M_CLGTBI,		RI10,	0x2f0,	"clgtbi",	_A3(A_T,A_A,A_S10B),	00012,	FX2)	/* CLGT%I        RT<-(RA>I10) */
-APUOP(M_CLGTHI,		RI10,	0x2e8,	"clgthi",	_A3(A_T,A_A,A_S10),	00012,	FX2)	/* CLGT%I        RT<-(RA>I10) */
-APUOP(M_CLGTI,		RI10,	0x2e0,	"clgti",	_A3(A_T,A_A,A_S10),	00012,	FX2)	/* CLGT%I        RT<-(RA>I10) */
-APUOP(M_CEQBI,		RI10,	0x3f0,	"ceqbi",	_A3(A_T,A_A,A_S10B),	00012,	FX2)	/* CEQ%I         RT<-(RA=I10) */
-APUOP(M_CEQHI,		RI10,	0x3e8,	"ceqhi",	_A3(A_T,A_A,A_S10),	00012,	FX2)	/* CEQ%I         RT<-(RA=I10) */
-APUOP(M_CEQI,		RI10,	0x3e0,	"ceqi",		_A3(A_T,A_A,A_S10),	00012,	FX2)	/* CEQ%I         RT<-(RA=I10) */
-APUOP(M_HGTI,		RI10,	0x278,	"hgti",		_A3(A_T,A_A,A_S10),	00010,	FX2)	/* HaltGTI       halt_if(RA>I10) */
-APUOP(M_HGTI2,		RI10,	0x278,	"hgti",		_A2(A_A,A_S10),	00010,	FX2)	/* HaltGTI       halt_if(RA>I10) */
-APUOP(M_HLGTI,		RI10,	0x2f8,	"hlgti",	_A3(A_T,A_A,A_S10),	00010,	FX2)	/* HaltLGTI      halt_if(RA>I10) */
-APUOP(M_HLGTI2,		RI10,	0x2f8,	"hlgti",	_A2(A_A,A_S10),	00010,	FX2)	/* HaltLGTI      halt_if(RA>I10) */
-APUOP(M_HEQI,		RI10,	0x3f8,	"heqi",		_A3(A_T,A_A,A_S10),	00010,	FX2)	/* HaltEQImm     halt_if(RA=I10) */
-APUOP(M_HEQI2,		RI10,	0x3f8,	"heqi",		_A2(A_A,A_S10),	00010,	FX2)	/* HaltEQImm     halt_if(RA=I10) */
-APUOP(M_MPYI,		RI10,	0x3a0,	"mpyi",		_A3(A_T,A_A,A_S10),	00012,	FP7)	/* MPYI          RT<-RA*I10 */
-APUOP(M_MPYUI,		RI10,	0x3a8,	"mpyui",	_A3(A_T,A_A,A_S10),	00012,	FP7)	/* MPYUI         RT<-RA*I10 */
-APUOP(M_CFLTS,		RI8,	0x3b0,	"cflts",	_A3(A_T,A_A,A_U7A),	00012,	FP7)	/* CFLTS         RT<-int(RA,I8) */
-APUOP(M_CFLTU,		RI8,	0x3b2,	"cfltu",	_A3(A_T,A_A,A_U7A),	00012,	FP7)	/* CFLTU         RT<-int(RA,I8) */
-APUOP(M_CSFLT,		RI8,	0x3b4,	"csflt",	_A3(A_T,A_A,A_U7B),	00012,	FP7)	/* CSFLT         RT<-flt(RA,I8) */
-APUOP(M_CUFLT,		RI8,	0x3b6,	"cuflt",	_A3(A_T,A_A,A_U7B),	00012,	FP7)	/* CUFLT         RT<-flt(RA,I8) */
-APUOP(M_FESD,		RR,	0x3b8,	"fesd",		_A2(A_T,A_A),	00012,	FPD)	/* FESD          RT<-double(RA) */
-APUOP(M_FRDS,		RR,	0x3b9,	"frds",		_A2(A_T,A_A),	00012,	FPD)	/* FRDS          RT<-single(RA) */
-APUOP(M_FSCRRD,		RR,	0x398,	"fscrrd",	_A1(A_T),		00002,	FPD)	/* FSCRRD        RT<-FP_status */
-APUOP(M_FSCRWR,		RR,	0x3ba,	"fscrwr",	_A2(A_T,A_A),	00010,	FP7)	/* FSCRWR        FP_status<-RA */
-APUOP(M_FSCRWR2,	RR,	0x3ba,	"fscrwr",	_A1(A_A),		00010,	FP7)	/* FSCRWR        FP_status<-RA */
-APUOP(M_CLZ,		RR,	0x2a5,	"clz",		_A2(A_T,A_A),	00012,	FX2)	/* CLZ           RT<-clz(RA) */
-APUOP(M_CNTB,		RR,	0x2b4,	"cntb",		_A2(A_T,A_A),	00012,	FXB)	/* CNT           RT<-pop(RA) */
-APUOP(M_XSBH,		RR,	0x2b6,	"xsbh",		_A2(A_T,A_A),	00012,	FX2)	/* eXtSignBtoH   RT<-sign_ext(RA) */
-APUOP(M_XSHW,		RR,	0x2ae,	"xshw",		_A2(A_T,A_A),	00012,	FX2)	/* eXtSignHtoW   RT<-sign_ext(RA) */
-APUOP(M_XSWD,		RR,	0x2a6,	"xswd",		_A2(A_T,A_A),	00012,	FX2)	/* eXtSignWtoD   RT<-sign_ext(RA) */
-APUOP(M_ROTI,		RI7,	0x078,	"roti",		_A3(A_T,A_A,A_S7N),	00012,	FX3)	/* ROT%I         RT<-RA<<<I7 */
-APUOP(M_ROTMI,		RI7,	0x079,	"rotmi",	_A3(A_T,A_A,A_S7),	00012,	FX3)	/* ROT%MI        RT<-RA<<I7 */
-APUOP(M_ROTMAI,		RI7,	0x07a,	"rotmai",	_A3(A_T,A_A,A_S7),	00012,	FX3)	/* ROTMA%I       RT<-RA<<I7 */
-APUOP(M_SHLI,		RI7,	0x07b,	"shli",		_A3(A_T,A_A,A_U6),	00012,	FX3)	/* SHL%I         RT<-RA<<I7 */
-APUOP(M_ROTHI,		RI7,	0x07c,	"rothi",	_A3(A_T,A_A,A_S7N),	00012,	FX3)	/* ROT%I         RT<-RA<<<I7 */
-APUOP(M_ROTHMI,		RI7,	0x07d,	"rothmi",	_A3(A_T,A_A,A_S6),	00012,	FX3)	/* ROT%MI        RT<-RA<<I7 */
-APUOP(M_ROTMAHI,	RI7,	0x07e,	"rotmahi",	_A3(A_T,A_A,A_S6),	00012,	FX3)	/* ROTMA%I       RT<-RA<<I7 */
-APUOP(M_SHLHI,		RI7,	0x07f,	"shlhi",	_A3(A_T,A_A,A_U5),	00012,	FX3)	/* SHL%I         RT<-RA<<I7 */
-APUOP(M_A,		RR,	0x0c0,	"a",		_A3(A_T,A_A,A_B),		00112,	FX2)	/* Add%          RT<-RA+RB */
-APUOP(M_AH,		RR,	0x0c8,	"ah",		_A3(A_T,A_A,A_B),		00112,	FX2)	/* Add%          RT<-RA+RB */
-APUOP(M_SF,		RR,	0x040,	"sf",		_A3(A_T,A_A,A_B),		00112,	FX2)	/* SubFrom%      RT<-RB-RA */
-APUOP(M_SFH,		RR,	0x048,	"sfh",		_A3(A_T,A_A,A_B),		00112,	FX2)	/* SubFrom%      RT<-RB-RA */
-APUOP(M_CGT,		RR,	0x240,	"cgt",		_A3(A_T,A_A,A_B),		00112,	FX2)	/* CGT%          RT<-(RA>RB) */
-APUOP(M_CGTB,		RR,	0x250,	"cgtb",		_A3(A_T,A_A,A_B),		00112,	FX2)	/* CGT%          RT<-(RA>RB) */
-APUOP(M_CGTH,		RR,	0x248,	"cgth",		_A3(A_T,A_A,A_B),		00112,	FX2)	/* CGT%          RT<-(RA>RB) */
-APUOP(M_CLGT,		RR,	0x2c0,	"clgt",		_A3(A_T,A_A,A_B),		00112,	FX2)	/* CLGT%         RT<-(RA>RB) */
-APUOP(M_CLGTB,		RR,	0x2d0,	"clgtb",	_A3(A_T,A_A,A_B),		00112,	FX2)	/* CLGT%         RT<-(RA>RB) */
-APUOP(M_CLGTH,		RR,	0x2c8,	"clgth",	_A3(A_T,A_A,A_B),		00112,	FX2)	/* CLGT%         RT<-(RA>RB) */
-APUOP(M_CEQ,		RR,	0x3c0,	"ceq",		_A3(A_T,A_A,A_B),		00112,	FX2)	/* CEQ%          RT<-(RA=RB) */
-APUOP(M_CEQB,		RR,	0x3d0,	"ceqb",		_A3(A_T,A_A,A_B),		00112,	FX2)	/* CEQ%          RT<-(RA=RB) */
-APUOP(M_CEQH,		RR,	0x3c8,	"ceqh",		_A3(A_T,A_A,A_B),		00112,	FX2)	/* CEQ%          RT<-(RA=RB) */
-APUOP(M_HGT,		RR,	0x258,	"hgt",		_A3(A_T,A_A,A_B),		00110,	FX2)	/* HaltGT        halt_if(RA>RB) */
-APUOP(M_HGT2,		RR,	0x258,	"hgt",		_A2(A_A,A_B),	00110,	FX2)	/* HaltGT        halt_if(RA>RB) */
-APUOP(M_HLGT,		RR,	0x2d8,	"hlgt",		_A3(A_T,A_A,A_B),		00110,	FX2)	/* HaltLGT       halt_if(RA>RB) */
-APUOP(M_HLGT2,		RR,	0x2d8,	"hlgt",		_A2(A_A,A_B),	00110,	FX2)	/* HaltLGT       halt_if(RA>RB) */
-APUOP(M_HEQ,		RR,	0x3d8,	"heq",		_A3(A_T,A_A,A_B),		00110,	FX2)	/* HaltEQ        halt_if(RA=RB) */
-APUOP(M_HEQ2,		RR,	0x3d8,	"heq",		_A2(A_A,A_B),	00110,	FX2)	/* HaltEQ        halt_if(RA=RB) */
-APUOP(M_FCEQ,		RR,	0x3c2,	"fceq",		_A3(A_T,A_A,A_B),		00112,	FX2)	/* FCEQ          RT<-(RA=RB) */
-APUOP(M_FCMEQ,		RR,	0x3ca,	"fcmeq",	_A3(A_T,A_A,A_B),		00112,	FX2)	/* FCMEQ         RT<-(|RA|=|RB|) */
-APUOP(M_FCGT,		RR,	0x2c2,	"fcgt",		_A3(A_T,A_A,A_B),		00112,	FX2)	/* FCGT          RT<-(RA<RB) */
-APUOP(M_FCMGT,		RR,	0x2ca,	"fcmgt",	_A3(A_T,A_A,A_B),		00112,	FX2)	/* FCMGT         RT<-(|RA|<|RB|) */
-APUOP(M_AND,		RR,	0x0c1,	"and",		_A3(A_T,A_A,A_B),		00112,	FX2)	/* AND           RT<-RA&RB */
-APUOP(M_NAND,		RR,	0x0c9,	"nand",		_A3(A_T,A_A,A_B),		00112,	FX2)	/* NAND          RT<-!(RA&RB) */
-APUOP(M_OR,		RR,	0x041,	"or",		_A3(A_T,A_A,A_B),		00112,	FX2)	/* OR            RT<-RA|RB */
-APUOP(M_NOR,		RR,	0x049,	"nor",		_A3(A_T,A_A,A_B),		00112,	FX2)	/* NOR           RT<-!(RA&RB) */
-APUOP(M_XOR,		RR,	0x241,	"xor",		_A3(A_T,A_A,A_B),		00112,	FX2)	/* XOR           RT<-RA^RB */
-APUOP(M_EQV,		RR,	0x249,	"eqv",		_A3(A_T,A_A,A_B),		00112,	FX2)	/* EQuiValent    RT<-!(RA^RB) */
-APUOP(M_ANDC,		RR,	0x2c1,	"andc",		_A3(A_T,A_A,A_B),		00112,	FX2)	/* ANDComplement RT<-RA&!RB */
-APUOP(M_ORC,		RR,	0x2c9,	"orc",		_A3(A_T,A_A,A_B),		00112,	FX2)	/* ORComplement  RT<-RA|!RB */
-APUOP(M_ABSDB,		RR,	0x053,	"absdb",	_A3(A_T,A_A,A_B),		00112,	FXB)	/* ABSoluteDiff  RT<-|RA-RB| */
-APUOP(M_AVGB,		RR,	0x0d3,	"avgb",		_A3(A_T,A_A,A_B),		00112,	FXB)	/* AVG%          RT<-(RA+RB+1)/2 */
-APUOP(M_SUMB,		RR,	0x253,	"sumb",		_A3(A_T,A_A,A_B),		00112,	FXB)	/* SUM%          RT<-f(RA,RB) */
-APUOP(M_DFA,		RR,	0x2cc,	"dfa",		_A3(A_T,A_A,A_B),		00112,	FPD)	/* DFAdd         RT<-RA+RB */
-APUOP(M_DFM,		RR,	0x2ce,	"dfm",		_A3(A_T,A_A,A_B),		00112,	FPD)	/* DFMul         RT<-RA*RB */
-APUOP(M_DFS,		RR,	0x2cd,	"dfs",		_A3(A_T,A_A,A_B),		00112,	FPD)	/* DFSub         RT<-RA-RB */
-APUOP(M_FA,		RR,	0x2c4,	"fa",		_A3(A_T,A_A,A_B),		00112,	FP6)	/* FAdd          RT<-RA+RB */
-APUOP(M_FM,		RR,	0x2c6,	"fm",		_A3(A_T,A_A,A_B),		00112,	FP6)	/* FMul          RT<-RA*RB */
-APUOP(M_FS,		RR,	0x2c5,	"fs",		_A3(A_T,A_A,A_B),		00112,	FP6)	/* FSub          RT<-RA-RB */
-APUOP(M_MPY,		RR,	0x3c4,	"mpy",		_A3(A_T,A_A,A_B),		00112,	FP7)	/* MPY           RT<-RA*RB */
-APUOP(M_MPYH,		RR,	0x3c5,	"mpyh",		_A3(A_T,A_A,A_B),		00112,	FP7)	/* MPYH          RT<-(RAh*RB)<<16 */
-APUOP(M_MPYHH,		RR,	0x3c6,	"mpyhh",	_A3(A_T,A_A,A_B),		00112,	FP7)	/* MPYHH         RT<-RAh*RBh */
-APUOP(M_MPYHHU,		RR,	0x3ce,	"mpyhhu",	_A3(A_T,A_A,A_B),		00112,	FP7)	/* MPYHHU        RT<-RAh*RBh */
-APUOP(M_MPYS,		RR,	0x3c7,	"mpys",		_A3(A_T,A_A,A_B),		00112,	FP7)	/* MPYS          RT<-(RA*RB)>>16 */
-APUOP(M_MPYU,		RR,	0x3cc,	"mpyu",		_A3(A_T,A_A,A_B),		00112,	FP7)	/* MPYU          RT<-RA*RB */
-APUOP(M_FI,		RR,	0x3d4,	"fi",		_A3(A_T,A_A,A_B),		00112,	FP7)	/* FInterpolate  RT<-f(RA,RB) */
-APUOP(M_ROT,		RR,	0x058,	"rot",		_A3(A_T,A_A,A_B),		00112,	FX3)	/* ROT%          RT<-RA<<<RB */
-APUOP(M_ROTM,		RR,	0x059,	"rotm",		_A3(A_T,A_A,A_B),		00112,	FX3)	/* ROT%M         RT<-RA<<Rb */
-APUOP(M_ROTMA,		RR,	0x05a,	"rotma",	_A3(A_T,A_A,A_B),		00112,	FX3)	/* ROTMA%        RT<-RA<<Rb */
-APUOP(M_SHL,		RR,	0x05b,	"shl",		_A3(A_T,A_A,A_B),		00112,	FX3)	/* SHL%          RT<-RA<<Rb */
-APUOP(M_ROTH,		RR,	0x05c,	"roth",		_A3(A_T,A_A,A_B),		00112,	FX3)	/* ROT%          RT<-RA<<<RB */
-APUOP(M_ROTHM,		RR,	0x05d,	"rothm",	_A3(A_T,A_A,A_B),		00112,	FX3)	/* ROT%M         RT<-RA<<Rb */
-APUOP(M_ROTMAH,		RR,	0x05e,	"rotmah",	_A3(A_T,A_A,A_B),		00112,	FX3)	/* ROTMA%        RT<-RA<<Rb */
-APUOP(M_SHLH,		RR,	0x05f,	"shlh",		_A3(A_T,A_A,A_B),		00112,	FX3)	/* SHL%          RT<-RA<<Rb */
-APUOP(M_MPYHHA,		RR,	0x346,	"mpyhha",	_A3(A_T,A_A,A_B),		00113,	FP7)	/* MPYHHA        RT<-RAh*RBh+RT */
-APUOP(M_MPYHHAU,	RR,	0x34e,	"mpyhhau",	_A3(A_T,A_A,A_B),		00113,	FP7)	/* MPYHHAU       RT<-RAh*RBh+RT */
-APUOP(M_DFMA,		RR,	0x35c,	"dfma",		_A3(A_T,A_A,A_B),		00113,	FPD)	/* DFMAdd        RT<-RT+RA*RB */
-APUOP(M_DFMS,		RR,	0x35d,	"dfms",		_A3(A_T,A_A,A_B),		00113,	FPD)	/* DFMSub        RT<-RA*RB-RT */
-APUOP(M_DFNMS,		RR,	0x35e,	"dfnms",	_A3(A_T,A_A,A_B),		00113,	FPD)	/* DFNMSub       RT<-RT-RA*RB */
-APUOP(M_DFNMA,		RR,	0x35f,	"dfnma",	_A3(A_T,A_A,A_B),		00113,	FPD)	/* DFNMAdd       RT<-(-RT)-RA*RB */
-APUOP(M_FMA,		RRR,	0x700,	"fma",		_A4(A_C,A_A,A_B,A_T),	02111,	FP6)	/* FMAdd         RC<-RT+RA*RB */
-APUOP(M_FMS,		RRR,	0x780,	"fms",		_A4(A_C,A_A,A_B,A_T),	02111,	FP6)	/* FMSub         RC<-RA*RB-RT */
-APUOP(M_FNMS,		RRR,	0x680,	"fnms",		_A4(A_C,A_A,A_B,A_T),	02111,	FP6)	/* FNMSub        RC<-RT-RA*RB */
-APUOP(M_MPYA,		RRR,	0x600,	"mpya",		_A4(A_C,A_A,A_B,A_T),	02111,	FP7)	/* MPYA          RC<-RA*RB+RT */
-APUOP(M_SELB,		RRR,	0x400,	"selb",		_A4(A_C,A_A,A_B,A_T),	02111,	FX2)	/* SELectBits    RC<-RA&RT|RB&!RT */
-/* for system function call, this uses op-code of mtspr */
-APUOP(M_SYSCALL,	RI7,    0x10c,	"syscall",      _A3(A_T,A_A,A_S7N),	00002,	SPR)        /* System Call */
-/*
-pseudo instruction:
-system call
-value of I9	operation
-0	halt
-1		rt[0] = open(MEM[ra[0]],	ra[1])
-2		rt[0] = close(ra[0])
-3		rt[0] = read(ra[0],	MEM[ra[1]],	ra[2])
-4		rt[0] = write(ra[0],	MEM[ra[1]],	ra[2])
-5		printf(MEM[ra[0]],	ra[1],	ra[2],	ra[3])
-42		rt[0] = clock()
-52		rt[0] = lseek(ra0,	ra1,	ra2)
-
-*/
-
-
-/* new multiprecision add/sub */
-APUOP(M_ADDX,		RR,	0x340,	"addx",		_A3(A_T,A_A,A_B),		00113,		FX2)	/* Add_eXtended  RT<-RA+RB+RT */
-APUOP(M_CG,		RR,	0x0c2,	"cg",		_A3(A_T,A_A,A_B),		00112,		FX2)	/* CarryGenerate RT<-cout(RA+RB) */
-APUOP(M_CGX,		RR,	0x342,	"cgx",		_A3(A_T,A_A,A_B),		00113,		FX2)	/* CarryGen_eXtd RT<-cout(RA+RB+RT) */
-APUOP(M_SFX,		RR,	0x341,	"sfx",		_A3(A_T,A_A,A_B),		00113,		FX2)	/* Add_eXtended  RT<-RA+RB+RT */
-APUOP(M_BG,		RR,	0x042,	"bg",		_A3(A_T,A_A,A_B),		00112,		FX2)	/* CarryGenerate RT<-cout(RA+RB) */
-APUOP(M_BGX,		RR,	0x343,	"bgx",		_A3(A_T,A_A,A_B),		00113,		FX2)	/* CarryGen_eXtd RT<-cout(RA+RB+RT) */
-
-/*
-
-The following ops are a subset of above except with feature bits set.
-Feature bits are bits 11-17 of the instruction:
-
-  11 - C & P feature bit
-  12 - disable interrupts
-  13 - enable interrupts
-
-*/
-APUOPFB(M_BID,		RR,	0x1a8,	0x20,	"bid",		_A1(A_A),		00010,	BR)	/* BI            IP<-RA */
-APUOPFB(M_BIE,		RR,	0x1a8,	0x10,	"bie",		_A1(A_A),		00010,	BR)	/* BI            IP<-RA */
-APUOPFB(M_BISLD,	RR,	0x1a9,	0x20,	"bisld",	_A2(A_T,A_A),	00012,	BR)	/* BISL          RT,IP<-IP,RA */
-APUOPFB(M_BISLE,	RR,	0x1a9,	0x10,	"bisle",	_A2(A_T,A_A),	00012,	BR)	/* BISL          RT,IP<-IP,RA */
-APUOPFB(M_IRETD,  	RR,	0x1aa,	0x20,	"iretd",	_A1(A_A), 	00010,	BR)	/* IRET          IP<-SRR0 */
-APUOPFB(M_IRETD2,  	RR,	0x1aa,	0x20,	"iretd",	_A0(),	 	00010,	BR)	/* IRET          IP<-SRR0 */
-APUOPFB(M_IRETE,  	RR,	0x1aa,	0x10,	"irete",	_A1(A_A), 	00010,	BR)	/* IRET          IP<-SRR0 */
-APUOPFB(M_IRETE2,  	RR,	0x1aa,	0x10,	"irete",	_A0(),	 	00010,	BR)	/* IRET          IP<-SRR0 */
-APUOPFB(M_BISLEDD,	RR,	0x1ab,	0x20,	"bisledd",	_A2(A_T,A_A),	00012,	BR)	/* BISLED        RT,IP<-IP,RA_if(ext) */
-APUOPFB(M_BISLEDE,	RR,	0x1ab,	0x10,	"bislede",	_A2(A_T,A_A),	00012,	BR)	/* BISLED        RT,IP<-IP,RA_if(ext) */
-APUOPFB(M_BIHNZD,	RR,	0x12b,	0x20,	"bihnzd",	_A2(A_T,A_A),	00011,	BR)	/* BIHNZ         IP<-RA_if(RT) */
-APUOPFB(M_BIHNZE,	RR,	0x12b,	0x10,	"bihnze",	_A2(A_T,A_A),	00011,	BR)	/* BIHNZ         IP<-RA_if(RT) */
-APUOPFB(M_BIHZD,	RR,	0x12a,	0x20,	"bihzd",	_A2(A_T,A_A),	00011,	BR)	/* BIHZ          IP<-RA_if(RT) */
-APUOPFB(M_BIHZE,	RR,	0x12a,	0x10,	"bihze",	_A2(A_T,A_A),	00011,	BR)	/* BIHZ          IP<-RA_if(RT) */
-APUOPFB(M_BINZD,	RR,	0x129,	0x20,	"binzd",	_A2(A_T,A_A),	00011,	BR)	/* BINZ          IP<-RA_if(RT) */
-APUOPFB(M_BINZE,	RR,	0x129,	0x10,	"binze",	_A2(A_T,A_A),	00011,	BR)	/* BINZ          IP<-RA_if(RT) */
-APUOPFB(M_BIZD,		RR,	0x128,	0x20,	"bizd",		_A2(A_T,A_A),	00011,	BR)	/* BIZ           IP<-RA_if(RT) */
-APUOPFB(M_BIZE,		RR,	0x128,	0x10,	"bize",		_A2(A_T,A_A),	00011,	BR)	/* BIZ           IP<-RA_if(RT) */
-APUOPFB(M_SYNCC,	RR,	0x002,	0x40,	"syncc",	_A0(),		00000,	BR)	/* SYNCC          flush_pipe */
-APUOPFB(M_HBRP,		LBTI,	0x1ac,	0x40,	"hbrp",		_A0(),	        00010,	LS)	/* HBR           BTB[B9]<-M[Ra] */
-
-/* Synonyms required by the AS manual. */
-APUOP(M_LR,		RI10,	0x020,	"lr",		_A2(A_T,A_A),	00012,	FX2)	/* OR%I          RT<-RA|I10 */
-APUOP(M_BIHT,		RR,	0x12b,	"biht", 	_A2(A_T,A_A),	00011,	BR)	/* BIHNZ         IP<-RA_if(RT) */
-APUOP(M_BIHF,		RR,	0x12a,	"bihf",		_A2(A_T,A_A),	00011,	BR)	/* BIHZ          IP<-RA_if(RT) */
-APUOP(M_BIT,		RR,	0x129,	"bit",		_A2(A_T,A_A),	00011,	BR)	/* BINZ          IP<-RA_if(RT) */
-APUOP(M_BIF,		RR,	0x128,	"bif",		_A2(A_T,A_A),	00011,	BR)	/* BIZ           IP<-RA_if(RT) */
-APUOPFB(M_BIHTD,	RR,	0x12b,	0x20,	"bihtd",	_A2(A_T,A_A),	00011,	BR)	/* BIHNF         IP<-RA_if(RT) */
-APUOPFB(M_BIHTE,	RR,	0x12b,	0x10,	"bihte",	_A2(A_T,A_A),	00011,	BR)	/* BIHNF         IP<-RA_if(RT) */
-APUOPFB(M_BIHFD,	RR,	0x12a,	0x20,	"bihfd",	_A2(A_T,A_A),	00011,	BR)	/* BIHZ          IP<-RA_if(RT) */
-APUOPFB(M_BIHFE,	RR,	0x12a,	0x10,	"bihfe",	_A2(A_T,A_A),	00011,	BR)	/* BIHZ          IP<-RA_if(RT) */
-APUOPFB(M_BITD, 	RR,	0x129,	0x20,	"bitd", 	_A2(A_T,A_A),	00011,	BR)	/* BINF          IP<-RA_if(RT) */
-APUOPFB(M_BITE, 	RR,	0x129,	0x10,	"bite", 	_A2(A_T,A_A),	00011,	BR)	/* BINF          IP<-RA_if(RT) */
-APUOPFB(M_BIFD,		RR,	0x128,	0x20,	"bifd",		_A2(A_T,A_A),	00011,	BR)	/* BIZ           IP<-RA_if(RT) */
-APUOPFB(M_BIFE,		RR,	0x128,	0x10,	"bife",		_A2(A_T,A_A),	00011,	BR)	/* BIZ           IP<-RA_if(RT) */
-
-#undef _A0
-#undef _A1
-#undef _A2
-#undef _A3
-#undef _A4
diff --git a/arch/powerpc/xmon/spu-opc.c b/arch/powerpc/xmon/spu-opc.c
deleted file mode 100644
index 6d8197cc540b..000000000000
--- a/arch/powerpc/xmon/spu-opc.c
+++ /dev/null
@@ -1,34 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/* SPU opcode list
-
-   Copyright 2006 Free Software Foundation, Inc.
-
-   This file is part of GDB, GAS, and the GNU binutils.
-
- */
-
-#include <linux/kernel.h>
-#include <linux/bug.h>
-#include "spu.h"
-
-/* This file holds the Spu opcode table */
-
-
-/*
-   Example contents of spu-insn.h
-      id_tag	mode	mode	type	opcode	mnemonic	asmtype	    dependency		FPU	L/S?	branch?	instruction   
-                QUAD	WORD                                               (0,RC,RB,RA,RT)    latency  			              		
-   APUOP(M_LQD,	1,	0,	RI9,	0x1f8,	"lqd",		ASM_RI9IDX,	00012,		FXU,	1,	0)	Load Quadword d-form 
- */
-
-const struct spu_opcode spu_opcodes[] = {
-#define APUOP(TAG,MACFORMAT,OPCODE,MNEMONIC,ASMFORMAT,DEP,PIPE) \
-	{ MACFORMAT, OPCODE, MNEMONIC, ASMFORMAT },
-#define APUOPFB(TAG,MACFORMAT,OPCODE,FB,MNEMONIC,ASMFORMAT,DEP,PIPE) \
-	{ MACFORMAT, OPCODE, MNEMONIC, ASMFORMAT },
-#include "spu-insns.h"
-#undef APUOP
-#undef APUOPFB
-};
-
-const int spu_num_opcodes = ARRAY_SIZE(spu_opcodes);
diff --git a/arch/powerpc/xmon/spu.h b/arch/powerpc/xmon/spu.h
deleted file mode 100644
index 2d13b1a5fa87..000000000000
--- a/arch/powerpc/xmon/spu.h
+++ /dev/null
@@ -1,115 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/* SPU ELF support for BFD.
-
-   Copyright 2006 Free Software Foundation, Inc.
-
-   This file is part of GDB, GAS, and the GNU binutils.
-
- */
-
-
-/* These two enums are from rel_apu/common/spu_asm_format.h */
-/* definition of instruction format */
-typedef enum {
-  RRR,
-  RI18,
-  RI16,
-  RI10,
-  RI8,
-  RI7,
-  RR,
-  LBT,
-  LBTI,
-  IDATA,
-  UNKNOWN_IFORMAT
-} spu_iformat;
-
-/* These values describe assembly instruction arguments.  They indicate
- * how to encode, range checking and which relocation to use. */
-typedef enum {
-  A_T,  /* register at pos 0 */
-  A_A,  /* register at pos 7 */
-  A_B,  /* register at pos 14 */
-  A_C,  /* register at pos 21 */
-  A_S,  /* special purpose register at pos 7 */
-  A_H,  /* channel register at pos 7 */
-  A_P,  /* parenthesis, this has to separate regs from immediates */
-  A_S3,
-  A_S6,
-  A_S7N,
-  A_S7,
-  A_U7A,
-  A_U7B,
-  A_S10B,
-  A_S10,
-  A_S11,
-  A_S11I,
-  A_S14,
-  A_S16,
-  A_S18,
-  A_R18,
-  A_U3,
-  A_U5,
-  A_U6,
-  A_U7,
-  A_U14,
-  A_X16,
-  A_U18,
-  A_MAX
-} spu_aformat;
-
-enum spu_insns {
-#define APUOP(TAG,MACFORMAT,OPCODE,MNEMONIC,ASMFORMAT,DEP,PIPE) \
-	TAG,
-#define APUOPFB(TAG,MACFORMAT,OPCODE,FB,MNEMONIC,ASMFORMAT,DEP,PIPE) \
-	TAG,
-#include "spu-insns.h"
-#undef APUOP
-#undef APUOPFB
-        M_SPU_MAX
-};
-
-struct spu_opcode
-{
-   spu_iformat insn_type;
-   unsigned int opcode;
-   char *mnemonic;
-   int arg[5];
-};
-
-#define SIGNED_EXTRACT(insn,size,pos) (((int)((insn) << (32-size-pos))) >> (32-size))
-#define UNSIGNED_EXTRACT(insn,size,pos) (((insn) >> pos) & ((1 << size)-1))
-
-#define DECODE_INSN_RT(insn) (insn & 0x7f)
-#define DECODE_INSN_RA(insn) ((insn >> 7) & 0x7f)
-#define DECODE_INSN_RB(insn) ((insn >> 14) & 0x7f)
-#define DECODE_INSN_RC(insn) ((insn >> 21) & 0x7f)
-
-#define DECODE_INSN_I10(insn) SIGNED_EXTRACT(insn,10,14)
-#define DECODE_INSN_U10(insn) UNSIGNED_EXTRACT(insn,10,14)
-
-/* For branching, immediate loads, hbr and  lqa/stqa. */
-#define DECODE_INSN_I16(insn) SIGNED_EXTRACT(insn,16,7)
-#define DECODE_INSN_U16(insn) UNSIGNED_EXTRACT(insn,16,7)
-
-/* for stop */
-#define DECODE_INSN_U14(insn) UNSIGNED_EXTRACT(insn,14,0)
-
-/* For ila */
-#define DECODE_INSN_I18(insn) SIGNED_EXTRACT(insn,18,7)
-#define DECODE_INSN_U18(insn) UNSIGNED_EXTRACT(insn,18,7)
-
-/* For rotate and shift and generate control mask */
-#define DECODE_INSN_I7(insn) SIGNED_EXTRACT(insn,7,14)
-#define DECODE_INSN_U7(insn) UNSIGNED_EXTRACT(insn,7,14)
-
-/* For float <-> int conversion */
-#define DECODE_INSN_I8(insn)  SIGNED_EXTRACT(insn,8,14)
-#define DECODE_INSN_U8(insn) UNSIGNED_EXTRACT(insn,8,14)
-
-/* For hbr  */
-#define DECODE_INSN_I9a(insn) ((SIGNED_EXTRACT(insn,2,23) << 7) | UNSIGNED_EXTRACT(insn,7,0))
-#define DECODE_INSN_I9b(insn) ((SIGNED_EXTRACT(insn,2,14) << 7) | UNSIGNED_EXTRACT(insn,7,0))
-#define DECODE_INSN_U9a(insn) ((UNSIGNED_EXTRACT(insn,2,23) << 7) | UNSIGNED_EXTRACT(insn,7,0))
-#define DECODE_INSN_U9b(insn) ((UNSIGNED_EXTRACT(insn,2,14) << 7) | UNSIGNED_EXTRACT(insn,7,0))
-
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index f4e841a36458..9df277021640 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -41,8 +41,6 @@
 #include <asm/rtas.h>
 #include <asm/sstep.h>
 #include <asm/irq_regs.h>
-#include <asm/spu.h>
-#include <asm/spu_priv1.h>
 #include <asm/setjmp.h>
 #include <asm/reg.h>
 #include <asm/debug.h>
@@ -188,8 +186,6 @@ static void xmon_print_symbol(unsigned long address, const char *mid,
 			      const char *after);
 static const char *getvecname(unsigned long vec);
 
-static int do_spu_cmd(void);
-
 #ifdef CONFIG_44x
 static void dump_tlb_44x(void);
 #endif
@@ -272,13 +268,6 @@ Commands:\n\
   P 	list processes/tasks\n\
   r	print registers\n\
   s	single step\n"
-#ifdef CONFIG_SPU_BASE
-"  ss	stop execution on all spus\n\
-  sr	restore execution on stopped spus\n\
-  sf  #	dump spu fields for spu # (in hex)\n\
-  sd  #	dump spu local store for spu # (in hex)\n\
-  sdi #	disassemble spu local store for spu # (in hex)\n"
-#endif
 "  S	print special registers\n\
   Sa    print all SPRs\n\
   Sr #	read SPR #\n\
@@ -1112,8 +1101,6 @@ cmds(struct pt_regs *excp)
 			cacheflush();
 			break;
 		case 's':
-			if (do_spu_cmd() == 0)
-				break;
 			if (do_step(excp))
 				return cmd;
 			break;
@@ -4107,263 +4094,3 @@ void __init xmon_setup(void)
 	if (xmon_early)
 		debugger(NULL);
 }
-
-#ifdef CONFIG_SPU_BASE
-
-struct spu_info {
-	struct spu *spu;
-	u64 saved_mfc_sr1_RW;
-	u32 saved_spu_runcntl_RW;
-	unsigned long dump_addr;
-	u8 stopped_ok;
-};
-
-#define XMON_NUM_SPUS	16	/* Enough for current hardware */
-
-static struct spu_info spu_info[XMON_NUM_SPUS];
-
-void __init xmon_register_spus(struct list_head *list)
-{
-	struct spu *spu;
-
-	list_for_each_entry(spu, list, full_list) {
-		if (spu->number >= XMON_NUM_SPUS) {
-			WARN_ON(1);
-			continue;
-		}
-
-		spu_info[spu->number].spu = spu;
-		spu_info[spu->number].stopped_ok = 0;
-		spu_info[spu->number].dump_addr = (unsigned long)
-				spu_info[spu->number].spu->local_store;
-	}
-}
-
-static void stop_spus(void)
-{
-	struct spu *spu;
-	volatile int i;
-	u64 tmp;
-
-	for (i = 0; i < XMON_NUM_SPUS; i++) {
-		if (!spu_info[i].spu)
-			continue;
-
-		if (setjmp(bus_error_jmp) == 0) {
-			catch_memory_errors = 1;
-			sync();
-
-			spu = spu_info[i].spu;
-
-			spu_info[i].saved_spu_runcntl_RW =
-				in_be32(&spu->problem->spu_runcntl_RW);
-
-			tmp = spu_mfc_sr1_get(spu);
-			spu_info[i].saved_mfc_sr1_RW = tmp;
-
-			tmp &= ~MFC_STATE1_MASTER_RUN_CONTROL_MASK;
-			spu_mfc_sr1_set(spu, tmp);
-
-			sync();
-			__delay(200);
-
-			spu_info[i].stopped_ok = 1;
-
-			printf("Stopped spu %.2d (was %s)\n", i,
-					spu_info[i].saved_spu_runcntl_RW ?
-					"running" : "stopped");
-		} else {
-			catch_memory_errors = 0;
-			printf("*** Error stopping spu %.2d\n", i);
-		}
-		catch_memory_errors = 0;
-	}
-}
-
-static void restart_spus(void)
-{
-	struct spu *spu;
-	volatile int i;
-
-	for (i = 0; i < XMON_NUM_SPUS; i++) {
-		if (!spu_info[i].spu)
-			continue;
-
-		if (!spu_info[i].stopped_ok) {
-			printf("*** Error, spu %d was not successfully stopped"
-					", not restarting\n", i);
-			continue;
-		}
-
-		if (setjmp(bus_error_jmp) == 0) {
-			catch_memory_errors = 1;
-			sync();
-
-			spu = spu_info[i].spu;
-			spu_mfc_sr1_set(spu, spu_info[i].saved_mfc_sr1_RW);
-			out_be32(&spu->problem->spu_runcntl_RW,
-					spu_info[i].saved_spu_runcntl_RW);
-
-			sync();
-			__delay(200);
-
-			printf("Restarted spu %.2d\n", i);
-		} else {
-			catch_memory_errors = 0;
-			printf("*** Error restarting spu %.2d\n", i);
-		}
-		catch_memory_errors = 0;
-	}
-}
-
-#define DUMP_WIDTH	23
-#define DUMP_VALUE(format, field, value)				\
-do {									\
-	if (setjmp(bus_error_jmp) == 0) {				\
-		catch_memory_errors = 1;				\
-		sync();							\
-		printf("  %-*s = "format"\n", DUMP_WIDTH,		\
-				#field, value);				\
-		sync();							\
-		__delay(200);						\
-	} else {							\
-		catch_memory_errors = 0;				\
-		printf("  %-*s = *** Error reading field.\n",		\
-					DUMP_WIDTH, #field);		\
-	}								\
-	catch_memory_errors = 0;					\
-} while (0)
-
-#define DUMP_FIELD(obj, format, field)	\
-	DUMP_VALUE(format, field, obj->field)
-
-static void dump_spu_fields(struct spu *spu)
-{
-	printf("Dumping spu fields at address %p:\n", spu);
-
-	DUMP_FIELD(spu, "0x%x", number);
-	DUMP_FIELD(spu, "%s", name);
-	DUMP_FIELD(spu, "0x%lx", local_store_phys);
-	DUMP_FIELD(spu, "0x%p", local_store);
-	DUMP_FIELD(spu, "0x%lx", ls_size);
-	DUMP_FIELD(spu, "0x%x", node);
-	DUMP_FIELD(spu, "0x%lx", flags);
-	DUMP_FIELD(spu, "%llu", class_0_pending);
-	DUMP_FIELD(spu, "0x%llx", class_0_dar);
-	DUMP_FIELD(spu, "0x%llx", class_1_dar);
-	DUMP_FIELD(spu, "0x%llx", class_1_dsisr);
-	DUMP_FIELD(spu, "0x%x", irqs[0]);
-	DUMP_FIELD(spu, "0x%x", irqs[1]);
-	DUMP_FIELD(spu, "0x%x", irqs[2]);
-	DUMP_FIELD(spu, "0x%x", slb_replace);
-	DUMP_FIELD(spu, "%d", pid);
-	DUMP_FIELD(spu, "0x%p", mm);
-	DUMP_FIELD(spu, "0x%p", ctx);
-	DUMP_FIELD(spu, "0x%p", rq);
-	DUMP_FIELD(spu, "0x%llx", timestamp);
-	DUMP_FIELD(spu, "0x%lx", problem_phys);
-	DUMP_FIELD(spu, "0x%p", problem);
-	DUMP_VALUE("0x%x", problem->spu_runcntl_RW,
-			in_be32(&spu->problem->spu_runcntl_RW));
-	DUMP_VALUE("0x%x", problem->spu_status_R,
-			in_be32(&spu->problem->spu_status_R));
-	DUMP_VALUE("0x%x", problem->spu_npc_RW,
-			in_be32(&spu->problem->spu_npc_RW));
-	DUMP_FIELD(spu, "0x%p", priv2);
-	DUMP_FIELD(spu, "0x%p", pdata);
-}
-
-static int spu_inst_dump(unsigned long adr, long count, int praddr)
-{
-	return generic_inst_dump(adr, count, praddr, print_insn_spu);
-}
-
-static void dump_spu_ls(unsigned long num, int subcmd)
-{
-	unsigned long offset, addr, ls_addr;
-
-	if (setjmp(bus_error_jmp) == 0) {
-		catch_memory_errors = 1;
-		sync();
-		ls_addr = (unsigned long)spu_info[num].spu->local_store;
-		sync();
-		__delay(200);
-	} else {
-		catch_memory_errors = 0;
-		printf("*** Error: accessing spu info for spu %ld\n", num);
-		return;
-	}
-	catch_memory_errors = 0;
-
-	if (scanhex(&offset))
-		addr = ls_addr + offset;
-	else
-		addr = spu_info[num].dump_addr;
-
-	if (addr >= ls_addr + LS_SIZE) {
-		printf("*** Error: address outside of local store\n");
-		return;
-	}
-
-	switch (subcmd) {
-	case 'i':
-		addr += spu_inst_dump(addr, 16, 1);
-		last_cmd = "sdi\n";
-		break;
-	default:
-		prdump(addr, 64);
-		addr += 64;
-		last_cmd = "sd\n";
-		break;
-	}
-
-	spu_info[num].dump_addr = addr;
-}
-
-static int do_spu_cmd(void)
-{
-	static unsigned long num = 0;
-	int cmd, subcmd = 0;
-
-	cmd = inchar();
-	switch (cmd) {
-	case 's':
-		stop_spus();
-		break;
-	case 'r':
-		restart_spus();
-		break;
-	case 'd':
-		subcmd = inchar();
-		if (isxdigit(subcmd) || subcmd == '\n')
-			termch = subcmd;
-		fallthrough;
-	case 'f':
-		scanhex(&num);
-		if (num >= XMON_NUM_SPUS || !spu_info[num].spu) {
-			printf("*** Error: invalid spu number\n");
-			return 0;
-		}
-
-		switch (cmd) {
-		case 'f':
-			dump_spu_fields(spu_info[num].spu);
-			break;
-		default:
-			dump_spu_ls(num, subcmd);
-			break;
-		}
-
-		break;
-	default:
-		return -1;
-	}
-
-	return 0;
-}
-#else /* ! CONFIG_SPU_BASE */
-static int do_spu_cmd(void)
-{
-	return -1;
-}
-#endif
-- 
2.47.1


