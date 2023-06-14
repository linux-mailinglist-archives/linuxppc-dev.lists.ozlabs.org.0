Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 578FE72F446
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 07:49:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=e3F2kStm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgvdP5fcSz30gq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 15:49:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=e3F2kStm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=208suo.com (client-ip=183.242.55.162; helo=mail.208.org; envelope-from=wuyonggang001@208suo.com; receiver=lists.ozlabs.org)
Received: from mail.208.org (unknown [183.242.55.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgvcT4QG5z2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 15:48:56 +1000 (AEST)
Received: from mail.208.org (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTP id 4QgvcH5w4HzBJLB4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 13:48:47 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
	content-transfer-encoding:content-type:message-id:user-agent
	:references:in-reply-to:subject:to:from:date:mime-version; s=
	dkim; t=1686721727; x=1689313728; bh=9BY9fx0OyQwsaNEisyEB/VCXNlb
	nMYGOgTZZBM0Bmkc=; b=e3F2kStmS1uHwEPptzOoNyAzaXS0s4Cez/l0JMsyFiw
	XjZqImyIfJjCH41jGLGT47xtTFAPXaoNQmIhD3+uydsp6P4YTNmL9LaIoGhffuY2
	DNoQFQ3ULFFi3rlMtJHN4u/BQILMw6D96QFTQ0dSu5inW0zPYaF5G/541/SDKZ51
	6MsuZeFZfcsFq9Ordim/AUzCg6bGSkP8saA/WUEKTuC0FYr5J9gja5yDjcrFAoTd
	2+UjciRCH5+ZWvlg4XmLSTmGqhJJhix5w5av3fp8donvSZqHdOzIAbAVL474CavK
	e13b6YHXqzbtKfyVlN49ASDsmF2YNr1jJ+x7aPc3Wxg==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
	by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id N1ajZynxHk6z for <linuxppc-dev@lists.ozlabs.org>;
	Wed, 14 Jun 2023 13:48:47 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTPSA id 4QgvcH1lTjzBJLB3;
	Wed, 14 Jun 2023 13:48:47 +0800 (CST)
MIME-Version: 1.0
Date: Wed, 14 Jun 2023 13:48:47 +0800
From: wuyonggang001@208suo.com
To: npiggin@gmail.com, mpe@ellerman.id.au
Subject: [PATCH] powerpc/xmon: Fix comparing pointer
In-Reply-To: <8adeeee071d085cac905d5752c2b7632@208suo.com>
References: <20230613033455.44992-1-zhanglibing@cdjrlc.com>
 <8adeeee071d085cac905d5752c2b7632@208suo.com>
User-Agent: Roundcube Webmail
Message-ID: <9978fdbbd580fb60693607981c75ffdf@208suo.com>
X-Sender: wuyonggang001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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

Fix the following coccicheck warning:

arch/powerpc/xmon/spu-dis.c:51:34-35: WARNING comparing pointer to 0

Signed-off-by: Yonggang Wu <wuyonggang001@208suo.com>
---
  arch/powerpc/xmon/spu-dis.c | 384 ++++++++++++++++++------------------
  1 file changed, 193 insertions(+), 191 deletions(-)

diff --git a/arch/powerpc/xmon/spu-dis.c b/arch/powerpc/xmon/spu-dis.c
index 4b0a4e640f08..f48a2ddd7440 100644
--- a/arch/powerpc/xmon/spu-dis.c
+++ b/arch/powerpc/xmon/spu-dis.c
@@ -22,216 +22,218 @@ extern const int spu_num_opcodes;
  #define SPU_DISASM_TBL_SIZE (1 << 11)
  static const struct spu_opcode 
*spu_disassemble_table[SPU_DISASM_TBL_SIZE];

-static void
-init_spu_disassemble (void)
+static void init_spu_disassemble(void)
  {
-  int i;
-
-  /* If two instructions have the same opcode then we prefer the first
-   * one.  In most cases it is just an alternate mnemonic. */
-  for (i = 0; i < spu_num_opcodes; i++)
-    {
-      int o = spu_opcodes[i].opcode;
-      if (o >= SPU_DISASM_TBL_SIZE)
-    continue; /* abort (); */
-      if (spu_disassemble_table[o] == 0)
-    spu_disassemble_table[o] = &spu_opcodes[i];
-    }
+    int i;
+
+    /*
+     * If two instructions have the same opcode then we prefer the 
first
+     * one.  In most cases it is just an alternate mnemonic.
+     */
+    for (i = 0; i < spu_num_opcodes; i++) {
+        int o = spu_opcodes[i].opcode;
+
+        if (o >= SPU_DISASM_TBL_SIZE)
+            continue; /* abort(); */
+        if (spu_disassemble_table[o] == NULL)
+            spu_disassemble_table[o] = &spu_opcodes[i];
+    }
  }

  /* Determine the instruction from the 10 least significant bits. */
-static const struct spu_opcode *
-get_index_for_opcode (unsigned int insn)
+static const struct spu_opcode *get_index_for_opcode(unsigned int insn)
  {
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
+    const struct spu_opcode *index;
+    unsigned int opcode = insn >> (32-11);
+
+    /*
+     * Init the table.  This assumes that element 0/opcode 0 (currently
+     * NOP) is always used
+     */
+    if (spu_disassemble_table[0] == NULL)
+        init_spu_disassemble();
+
+    index = spu_disassemble_table[opcode & 0x780];
+    if (index != NULL && index->insn_type == RRR)
+        return index;
+
+    index = spu_disassemble_table[opcode & 0x7f0];
+    if (index != NULL
+      && (index->insn_type == RI18 || index->insn_type == LBT))
+        return index;
+
+    index = spu_disassemble_table[opcode & 0x7f8];
+    if (index != NULL
+      && index->insn_type == RI10)
+        return index;
+
+    index = spu_disassemble_table[opcode & 0x7fc]
+    if (index != NULL && (index->insn_type == RI16))
+        return index;
+
+    index = spu_disassemble_table[opcode & 0x7fe];
+    if (index != NULL && (index->insn_type == RI8))
+        return index;
+
+    index = spu_disassemble_table[opcode & 0x7ff];
+    if (index != NULL)
+        return index;
+
+    return NULL;
  }

  /* Print a Spu instruction.  */

-int
-print_insn_spu (unsigned long insn, unsigned long memaddr)
+int print_insn_spu(unsigned long insn, unsigned long memaddr)
  {
-  int value;
-  int hex_value;
-  const struct spu_opcode *index;
-  enum spu_insns tag;
+    int value;
+    int hex_value;
+    const struct spu_opcode *index;
+    enum spu_insns tag;

-  index = get_index_for_opcode (insn);
+    index = get_index_for_opcode(insn);

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
-      if (tag == M_BI || tag == M_BISL || tag == M_IRET || tag == 
M_BISLED
-      || tag == M_BIHNZ || tag == M_BIHZ || tag == M_BINZ || tag == 
M_BIZ
-          || tag == M_SYNC || tag == M_HBR)
+    if (index == NULL)
      {
-      int fb = (insn >> (32-18)) & 0x7f;
-      if (fb & 0x40)
-        printf(tag == M_SYNC ? "c" : "p");
-      if (fb & 0x20)
-        printf("d");
-      if (fb & 0x10)
-        printf("e");
-    }
-      if (index->arg[0] != 0)
-    printf("\t");
-      hex_value = 0;
-      for (i = 1;  i <= index->arg[0]; i++)
+        printf(".long 0x%lx", insn);
+    } else
      {
-      int arg = index->arg[i];
-      if (arg != A_P && !paren && i > 1)
-        printf(",");
-
-      switch (arg)
-        {
-        case A_T:
-          printf("$%lu",
-                     DECODE_INSN_RT (insn));
-          break;
-        case A_A:
-          printf("$%lu",
-                     DECODE_INSN_RA (insn));
-          break;
-        case A_B:
-          printf("$%lu",
-                     DECODE_INSN_RB (insn));
-          break;
-        case A_C:
-          printf("$%lu",
-                     DECODE_INSN_RC (insn));
-          break;
-        case A_S:
-          printf("$sp%lu",
-                     DECODE_INSN_RA (insn));
-          break;
-        case A_H:
-          printf("$ch%lu",
-                     DECODE_INSN_RA (insn));
-          break;
-        case A_P:
-          paren++;
-          printf("(");
-          break;
-        case A_U7A:
-          printf("%lu",
-                     173 - DECODE_INSN_U8 (insn));
-          break;
-        case A_U7B:
-          printf("%lu",
-                     155 - DECODE_INSN_U8 (insn));
-          break;
-        case A_S3:
-        case A_S6:
-        case A_S7:
-        case A_S7N:
-        case A_U3:
-        case A_U5:
-        case A_U6:
-        case A_U7:
-          hex_value = DECODE_INSN_I7 (insn);
-          printf("%d", hex_value);
-          break;
-        case A_S11:
-          print_address(memaddr + DECODE_INSN_I9a (insn) * 4);
-          break;
-        case A_S11I:
-          print_address(memaddr + DECODE_INSN_I9b (insn) * 4);
-          break;
-        case A_S10:
-        case A_S10B:
-          hex_value = DECODE_INSN_I10 (insn);
-          printf("%d", hex_value);
-          break;
-        case A_S14:
-          hex_value = DECODE_INSN_I10 (insn) * 16;
-          printf("%d", hex_value);
-          break;
-        case A_S16:
-          hex_value = DECODE_INSN_I16 (insn);
-          printf("%d", hex_value);
-          break;
-        case A_X16:
-          hex_value = DECODE_INSN_U16 (insn);
-          printf("%u", hex_value);
-          break;
-        case A_R18:
-          value = DECODE_INSN_I16 (insn) * 4;
-          if (value == 0)
-        printf("%d", value);
-          else
+        int i;
+        int paren = 0;
+
+        tag = (enum spu_insns)(index - spu_opcodes);
+
+        printf("%s", index->mnemonic);
+        if (tag == M_BI || tag == M_BISL || tag == M_IRET || tag == 
M_BISLED
+        || tag == M_BIHNZ || tag == M_BIHZ || tag == M_BINZ || tag == 
M_BIZ
+          || tag == M_SYNC || tag == M_HBR)
          {
-          hex_value = memaddr + value;
-          print_address(hex_value & 0x3ffff);
+            int fb = (insn >> (32-18)) & 0x7f;
+
+            if (fb & 0x40)
+                printf(tag == M_SYNC ? "c" : "p");
+            if (fb & 0x20)
+                printf("d");
+            if (fb & 0x10)
+                printf("e");
          }
-          break;
-        case A_S18:
-          value = DECODE_INSN_U16 (insn) * 4;
-          if (value == 0)
-        printf("%d", value);
-          else
-        print_address(value);
-          break;
-        case A_U18:
-          value = DECODE_INSN_U18 (insn);
-          if (value == 0 || 1)
+        if (index->arg[0] != 0)
+            printf("\t");
+        hex_value = 0;
+        for (i = 1;  i <= index->arg[0]; i++) {
+            int arg = index->arg[i];
+
+            if (arg != A_P && !paren && i > 1)
+                printf(",");
+
+            switch (arg) {
+            case A_T:
+                printf("$%lu",
+                        DECODE_INSN_RT(insn));
+                break;
+            case A_A:
+                printf("$%lu",
+                        DECODE_INSN_RA(insn));
+                break;
+            case A_B:
+                printf("$%lu",
+                        DECODE_INSN_RB(insn));
+                break;
+            case A_C:
+                printf("$%lu",
+                        DECODE_INSN_RC(insn));
+                break;
+            case A_S:
+                printf("$sp%lu",
+                        DECODE_INSN_RA(insn));
+                break;
+            case A_H:
+                printf("$ch%lu",
+                        DECODE_INSN_RA(insn));
+                break;
+            case A_P:
+                paren++;
+                printf("(");
+                break;
+            case A_U7A:
+                printf("%lu",
+                        173 - DECODE_INSN_U8(insn));
+                break;
+            case A_U7B:
+                printf("%lu",
+                        155 - DECODE_INSN_U8(insn));
+                break;
+            case A_S3:
+            case A_S6:
+            case A_S7:
+            case A_S7N:
+            case A_U3:
+            case A_U5:
+            case A_U6:
+            case A_U7:
+                hex_value = DECODE_INSN_I7(insn);
+                printf("%d", hex_value);
+                break;
+            case A_S11:
+                print_address(memaddr + DECODE_INSN_I9a(insn) * 4);
+                break;
+            case A_S11I:
+                print_address(memaddr + DECODE_INSN_I9b(insn) * 4);
+                break;
+            case A_S10:
+            case A_S10B:
+                hex_value = DECODE_INSN_I10(insn);
+                printf("%d", hex_value);
+                break;
+            case A_S14:
+                hex_value = DECODE_INSN_I10(insn) * 16;
+                printf("%d", hex_value);
+                break;
+            case A_S16:
+                hex_value = DECODE_INSN_I16(insn);
+                printf("%d", hex_value);
+                break;
+            case A_X16:
+                hex_value = DECODE_INSN_U16(insn);
+                printf("%u", hex_value);
+                break;
+            case A_R18:
+                value = DECODE_INSN_I16(insn) * 4;
+                if (value == 0)
+                    printf("%d", value);
+                else {
+                    hex_value = memaddr + value;
+                    print_address(hex_value & 0x3ffff);
+                }
+                break;
+            case A_S18:
+                value = DECODE_INSN_U16(insn) * 4;
+                if (value == 0)
+                    printf("%d", value);
+                else
+                    print_address(value);
+                break;
+            case A_U18:
+                value = DECODE_INSN_U18(insn);
+                if (value == 0 || 1) {
+                    hex_value = value;
+                    printf("%u", value);
+                } else
+                    print_address(value);
+                break;
+            case A_U14:
+                hex_value = DECODE_INSN_U14(insn);
+                printf("%u", hex_value);
+                break;
+            }
+        if (arg != A_P && paren)
          {
-          hex_value = value;
-          printf("%u", value);
+            printf(")");
+            paren--;
          }
-          else
-        print_address(value);
-          break;
-        case A_U14:
-          hex_value = DECODE_INSN_U14 (insn);
-          printf("%u", hex_value);
-          break;
-        }
-      if (arg != A_P && paren)
-        {
-          printf(")");
-          paren--;
-        }
      }
-      if (hex_value > 16)
-    printf("\t# %x", hex_value);
+        if (hex_value > 16)
+            printf("\t# %x", hex_value);
      }
    return 4;
  }
