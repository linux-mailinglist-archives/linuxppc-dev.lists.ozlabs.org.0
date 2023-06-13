Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9841472D88B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 06:25:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=GlBxJrJi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgFp42k5Dz30XY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 14:25:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=GlBxJrJi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=208suo.com (client-ip=183.242.55.162; helo=mail.208.org; envelope-from=wuyonggang001@208suo.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 528 seconds by postgrey-1.37 at boromir; Tue, 13 Jun 2023 13:47:42 AEST
Received: from mail.208.org (unknown [183.242.55.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgDz23XlDz308s
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 13:47:42 +1000 (AEST)
Received: from mail.208.org (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTP id 4QgDmg6C2TzBJJD5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 11:38:43 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
	content-type:message-id:user-agent:references:in-reply-to
	:subject:to:from:date:mime-version; s=dkim; t=1686627523; x=
	1689219524; bh=u3hyetLWhhJpivUIqk6NvJA7BrKqmfg6hdIa0Zi/AeA=; b=G
	lBxJrJi4ZNgMEjFWUJRky26g3jCPckpQ4EfWx+BuJYaldfErKEpklBHzgWmgiCYK
	B1DcxuHgw9z8BUzAurWXb4867a+vWten/DrMI1TFCGBBBHr2cSqyStjpAdovIyPW
	vmNsnX5OURr8XQ/N8GOOIf5Jep6Si5kKFjfDwH3EZoVh3DbxafNu8jxbTHuaYZ+i
	3rRJDNp3l/nhNOwunaJjUcxdmqhOKYCC+JiJp74H6xwK+nbKd9Z9V3iGLrYen54y
	ikjgoLwSAWOMpx734Q1B3AVR4K8HO9tTtAu/Qvsyvzv4CkKuHvX1kch7YySQwmQ1
	bJZpTe+slsmccqK6Fmqqw==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
	by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id z3H6TJ34rFPD for <linuxppc-dev@lists.ozlabs.org>;
	Tue, 13 Jun 2023 11:38:43 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTPSA id 4QgDmg3TwMzBJCMY;
	Tue, 13 Jun 2023 11:38:43 +0800 (CST)
MIME-Version: 1.0
Date: Tue, 13 Jun 2023 11:38:43 +0800
From: wuyonggang001@208suo.com
To: mpe@ellerman.id.au, npiggin@gmail.com
Subject: [PATCH] powerpc/xmon: Fix comparing pointer
In-Reply-To: <20230613033455.44992-1-zhanglibing@cdjrlc.com>
References: <20230613033455.44992-1-zhanglibing@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <8adeeee071d085cac905d5752c2b7632@208suo.com>
X-Sender: wuyonggang001@208suo.com
Content-Type: multipart/alternative;
 boundary="=_84557b650920df78480584e40fad0713"
X-Mailman-Approved-At: Tue, 13 Jun 2023 14:20:24 +1000
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

--=_84557b650920df78480584e40fad0713
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII;
 format=flowed


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
--=_84557b650920df78480584e40fad0713
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3DUTF-8" /></head><body style=3D'font-size: 12pt; font-family: Verdana,Gen=
eva,sans-serif'>
<div class=3D"pre" style=3D"margin: 0; padding: 0; font-family: monospace">=
Fix the following coccicheck warning:<br /><br />arch/powerpc/xmon/spu-dis.=
c:51:34-35: WARNING comparing pointer to 0<br /><br />Signed-off-by: Yongga=
ng Wu &lt;wuyonggang001@208suo.com&gt;<br />---<br />&nbsp;arch/powerpc/xmo=
n/spu-dis.c | 384 ++++++++++++++++++------------------<br />&nbsp;1 file ch=
anged, 193 insertions(+), 191 deletions(-)<br /><br />diff --git a/arch/pow=
erpc/xmon/spu-dis.c b/arch/powerpc/xmon/spu-dis.c<br />index 4b0a4e640f08..=
f48a2ddd7440 100644<br />--- a/arch/powerpc/xmon/spu-dis.c<br />+++ b/arch/=
powerpc/xmon/spu-dis.c<br />@@ -22,216 +22,218 @@ extern const int spu_num_=
opcodes;<br />&nbsp;#define SPU_DISASM_TBL_SIZE (1 &lt;&lt; 11)<br />&nbsp;=
static const struct spu_opcode *spu_disassemble_table[SPU_DISASM_TBL_SIZE];=
<br />&nbsp;<br />-static void<br />-init_spu_disassemble (void)<br />+stat=
ic void init_spu_disassemble(void)<br />&nbsp;{<br />- &nbsp;int i;<br />-<=
br />- &nbsp;/* If two instructions have the same opcode then we prefer the=
 first<br />- &nbsp;&nbsp;* one. &nbsp;In most cases it is just an alternat=
e mnemonic. */<br />- &nbsp;for (i =3D 0; i &lt; spu_num_opcodes; i++)<br /=
>- &nbsp;&nbsp;&nbsp;{<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int o =3D spu_o=
pcodes[i].opcode;<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (o &gt;=3D SPU_DI=
SASM_TBL_SIZE)<br />- &nbsp;&nbsp;&nbsp;continue; /* abort (); */<br />- &n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;if (spu_disassemble_table[o] =3D=3D 0)<br />- &=
nbsp;&nbsp;&nbsp;spu_disassemble_table[o] =3D &amp;spu_opcodes[i];<br />- &=
nbsp;&nbsp;&nbsp;}<br />+ &nbsp;&nbsp;&nbsp;int i;<br />+<br />+ &nbsp;&nbs=
p;&nbsp;/*<br />+ &nbsp;&nbsp;&nbsp;&nbsp;* If two instructions have the sa=
me opcode then we prefer the first<br />+ &nbsp;&nbsp;&nbsp;&nbsp;* one. &n=
bsp;In most cases it is just an alternate mnemonic.<br />+ &nbsp;&nbsp;&nbs=
p;&nbsp;*/<br />+ &nbsp;&nbsp;&nbsp;for (i =3D 0; i &lt; spu_num_opcodes; i=
++) {<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int o =3D spu_opcode=
s[i].opcode;<br />+<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (o =
&gt;=3D SPU_DISASM_TBL_SIZE)<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;continue; /* abort(); */<br />+ &nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;if (spu_disassemble_table[o] =3D=3D NULL)<br />+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;spu_disas=
semble_table[o] =3D &amp;spu_opcodes[i];<br />+ &nbsp;&nbsp;&nbsp;}<br />&n=
bsp;}<br />&nbsp;<br />&nbsp;/* Determine the instruction from the 10 least=
 significant bits. */<br />-static const struct spu_opcode *<br />-get_inde=
x_for_opcode (unsigned int insn)<br />+static const struct spu_opcode *get_=
index_for_opcode(unsigned int insn)<br />&nbsp;{<br />- &nbsp;const struct =
spu_opcode *index;<br />- &nbsp;unsigned int opcode =3D insn &gt;&gt; (32-1=
1);<br />-<br />- &nbsp;/* Init the table. &nbsp;This assumes that element =
0/opcode 0 (currently<br />- &nbsp;&nbsp;* NOP) is always used */<br />- &n=
bsp;if (spu_disassemble_table[0] =3D=3D 0)<br />- &nbsp;&nbsp;&nbsp;init_sp=
u_disassemble ();<br />-<br />- &nbsp;if ((index =3D spu_disassemble_table[=
opcode &amp; 0x780]) !=3D 0<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&amp;&amp;=
 index-&gt;insn_type =3D=3D RRR)<br />- &nbsp;&nbsp;&nbsp;return index;<br =
/>-<br />- &nbsp;if ((index =3D spu_disassemble_table[opcode &amp; 0x7f0]) =
!=3D 0<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&amp;&amp; (index-&gt;insn_type=
 =3D=3D RI18 || index-&gt;insn_type =3D=3D LBT))<br />- &nbsp;&nbsp;&nbsp;r=
eturn index;<br />-<br />- &nbsp;if ((index =3D spu_disassemble_table[opcod=
e &amp; 0x7f8]) !=3D 0<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&amp;&amp; inde=
x-&gt;insn_type =3D=3D RI10)<br />- &nbsp;&nbsp;&nbsp;return index;<br />-<=
br />- &nbsp;if ((index =3D spu_disassemble_table[opcode &amp; 0x7fc]) !=3D=
 0<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&amp;&amp; (index-&gt;insn_type =3D=
=3D RI16))<br />- &nbsp;&nbsp;&nbsp;return index;<br />-<br />- &nbsp;if ((=
index =3D spu_disassemble_table[opcode &amp; 0x7fe]) !=3D 0<br />- &nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&amp;&amp; (index-&gt;insn_type =3D=3D RI8))<br />- &=
nbsp;&nbsp;&nbsp;return index;<br />-<br />- &nbsp;if ((index =3D spu_disas=
semble_table[opcode &amp; 0x7ff]) !=3D 0)<br />- &nbsp;&nbsp;&nbsp;return i=
ndex;<br />-<br />- &nbsp;return NULL;<br />+ &nbsp;&nbsp;&nbsp;const struc=
t spu_opcode *index;<br />+ &nbsp;&nbsp;&nbsp;unsigned int opcode =3D insn =
&gt;&gt; (32-11);<br />+<br />+ &nbsp;&nbsp;&nbsp;/*<br />+ &nbsp;&nbsp;&nb=
sp;&nbsp;* Init the table. &nbsp;This assumes that element 0/opcode 0 (curr=
ently<br />+ &nbsp;&nbsp;&nbsp;&nbsp;* NOP) is always used<br />+ &nbsp;&nb=
sp;&nbsp;&nbsp;*/<br />+ &nbsp;&nbsp;&nbsp;if (spu_disassemble_table[0] =3D=
=3D NULL)<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;init_spu_disasse=
mble();<br />+<br />+ &nbsp;&nbsp;&nbsp;index =3D spu_disassemble_table[opc=
ode &amp; 0x780];<br />+ &nbsp;&nbsp;&nbsp;if (index !=3D NULL &amp;&amp; i=
ndex-&gt;insn_type =3D=3D RRR)<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;return index;<br />+<br />+ &nbsp;&nbsp;&nbsp;index =3D spu_disassembl=
e_table[opcode &amp; 0x7f0];<br />+ &nbsp;&nbsp;&nbsp;if (index !=3D NULL<b=
r />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&amp;&amp; (index-&gt;insn_type =3D=3D =
RI18 || index-&gt;insn_type =3D=3D LBT))<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;return index;<br />+<br />+ &nbsp;&nbsp;&nbsp;index =3D spu_=
disassemble_table[opcode &amp; 0x7f8];<br />+ &nbsp;&nbsp;&nbsp;if (index !=
=3D NULL<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&amp;&amp; index-&gt;insn_typ=
e =3D=3D RI10)<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return inde=
x;<br />+<br />+ &nbsp;&nbsp;&nbsp;index =3D spu_disassemble_table[opcode &=
amp; 0x7fc]<br />+ &nbsp;&nbsp;&nbsp;if (index !=3D NULL &amp;&amp; (index-=
&gt;insn_type =3D=3D RI16))<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;return index;<br />+<br />+ &nbsp;&nbsp;&nbsp;index =3D spu_disassemble_t=
able[opcode &amp; 0x7fe];<br />+ &nbsp;&nbsp;&nbsp;if (index !=3D NULL &amp=
;&amp; (index-&gt;insn_type =3D=3D RI8))<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;return index;<br />+<br />+ &nbsp;&nbsp;&nbsp;index =3D spu_=
disassemble_table[opcode &amp; 0x7ff];<br />+ &nbsp;&nbsp;&nbsp;if (index !=
=3D NULL)<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return index;<br=
 />+<br />+ &nbsp;&nbsp;&nbsp;return NULL;<br />&nbsp;}<br />&nbsp;<br />&n=
bsp;/* Print a Spu instruction. &nbsp;*/<br />&nbsp;<br />-int<br />-print_=
insn_spu (unsigned long insn, unsigned long memaddr)<br />+int print_insn_s=
pu(unsigned long insn, unsigned long memaddr)<br />&nbsp;{<br />- &nbsp;int=
 value;<br />- &nbsp;int hex_value;<br />- &nbsp;const struct spu_opcode *i=
ndex;<br />- &nbsp;enum spu_insns tag;<br />+ &nbsp;&nbsp;&nbsp;int value;<=
br />+ &nbsp;&nbsp;&nbsp;int hex_value;<br />+ &nbsp;&nbsp;&nbsp;const stru=
ct spu_opcode *index;<br />+ &nbsp;&nbsp;&nbsp;enum spu_insns tag;<br />&nb=
sp;<br />- &nbsp;index =3D get_index_for_opcode (insn);<br />+ &nbsp;&nbsp;=
&nbsp;index =3D get_index_for_opcode(insn);<br />&nbsp;<br />- &nbsp;if (in=
dex =3D=3D 0)<br />- &nbsp;&nbsp;&nbsp;{<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;printf(".long 0x%lx", insn);<br />- &nbsp;&nbsp;&nbsp;}<br />- &nbsp;els=
e<br />- &nbsp;&nbsp;&nbsp;{<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int i;<br=
 />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int paren =3D 0;<br />- &nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;tag =3D (enum spu_insns)(index - spu_opcodes);<br />- &nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;printf("%s", index-&gt;mnemonic);<br />- &nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;if (tag =3D=3D M_BI || tag =3D=3D M_BISL || tag =3D=3D M=
_IRET || tag =3D=3D M_BISLED<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|| tag =
=3D=3D M_BIHNZ || tag =3D=3D M_BIHZ || tag =3D=3D M_BINZ || tag =3D=3D M_BI=
Z<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|| tag =3D=
=3D M_SYNC || tag =3D=3D M_HBR)<br />+ &nbsp;&nbsp;&nbsp;if (index =3D=3D N=
ULL)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />- &nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;int fb =3D (insn &gt;&gt; (32-18)) &amp; 0x7f;<br />- &nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;if (fb &amp; 0x40)<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;printf(tag =3D=3D M_SYNC ? "c" : "p");<br />- &nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;if (fb &amp; 0x20)<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
printf("d");<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (fb &amp; 0x10)<br />-=
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf("e");<br />- &nbsp;&nbsp;=
&nbsp;}<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (index-&gt;arg[0] !=3D 0)<b=
r />- &nbsp;&nbsp;&nbsp;printf("\t");<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
hex_value =3D 0;<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for (i =3D 1; &nbsp;i=
 &lt;=3D index-&gt;arg[0]; i++)<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;printf(".long 0x%lx", insn);<br />+ &nbsp;&nbsp;&nbsp;} else<br />&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int arg =
=3D index-&gt;arg[i];<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (arg !=3D A_P=
 &amp;&amp; !paren &amp;&amp; i &gt; 1)<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;printf(",");<br />-<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;swit=
ch (arg)<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />- &nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case A_T:<br />- &nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf("$%lu",<br />- &nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;DECODE_INSN_RT (insn));<br />- &nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;case A_A:<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;printf("$%lu",<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;DECODE_INSN_RA (insn));<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;break;<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case A_B=
:<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf("$%lu=
",<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DECODE_INSN_RB (insn=
));<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;<br =
/>- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case A_C:<br />- &nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf("$%lu",<br />- &nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DECODE_INSN_RC (insn));<br />- &nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;<br />- &nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;case A_S:<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;printf("$sp%lu",<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;DECODE_INSN_RA (insn));<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;break;<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;case A_H:<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;printf("$ch%lu",<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DECO=
DE_INSN_RA (insn));<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;break;<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case A_P:<br =
/>- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;paren++;<br />- &=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf("(");<br />- &n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;<br />- &nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case A_U7A:<br />- &nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf("%lu",<br />- &nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;173 - DECODE_INSN_U8 (insn));<br />- &nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;<br />- &nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;case A_U7B:<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;printf("%lu",<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;155 - DECODE_INSN_U8 (insn));<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;break;<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;case A_S3:<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case A_S6:=
<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case A_S7:<br />- &nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case A_S7N:<br />- &nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;case A_U3:<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;case A_U5:<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case A_U6=
:<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case A_U7:<br />- &nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hex_value =3D DECODE_INSN_I=
7 (insn);<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;prin=
tf("%d", hex_value);<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;break;<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case A_S11:<=
br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;print_address(=
memaddr + DECODE_INSN_I9a (insn) * 4);<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;break;<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;case A_S11I:<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;print_address(memaddr + DECODE_INSN_I9b (insn) * 4);<br />- &nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;<br />- &nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;case A_S10:<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;case A_S10B:<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;hex_value =3D DECODE_INSN_I10 (insn);<br />- &nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf("%d", hex_value);<br />- &nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;<br />- &nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;case A_S14:<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;hex_value =3D DECODE_INSN_I10 (insn) * 16;<br />- &=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf("%d", hex_value=
);<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;<br /=
>- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case A_S16:<br />- &nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hex_value =3D DECODE_INSN_I16 (i=
nsn);<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf("=
%d", hex_value);<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;break;<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case A_X16:<br /=
>- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hex_value =3D DECO=
DE_INSN_U16 (insn);<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;printf("%u", hex_value);<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;break;<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ca=
se A_R18:<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;valu=
e =3D DECODE_INSN_I16 (insn) * 4;<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;if (value =3D=3D 0)<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;printf("%d", value);<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;else<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
int i;<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int paren =3D 0;<br=
 />+<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;tag =3D (enum spu_ins=
ns)(index - spu_opcodes);<br />+<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;printf("%s", index-&gt;mnemonic);<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;if (tag =3D=3D M_BI || tag =3D=3D M_BISL || tag =3D=3D M_IRE=
T || tag =3D=3D M_BISLED<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|=
| tag =3D=3D M_BIHNZ || tag =3D=3D M_BIHZ || tag =3D=3D M_BINZ || tag =3D=
=3D M_BIZ<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|| t=
ag =3D=3D M_SYNC || tag =3D=3D M_HBR)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;{<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;hex_value =3D memaddr + value;<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;print_address(hex_value &amp; 0x3ffff);<br />+ &=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int fb =3D=
 (insn &gt;&gt; (32-18)) &amp; 0x7f;<br />+<br />+ &nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (fb &amp; 0x40)<br />+ &nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;printf(tag =3D=3D M_SYNC ? "c" : "p");<br />+ &nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (fb &amp; 0x20)<br />+ &nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;printf("d");<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;if (fb &amp; 0x10)<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf("e");=
<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />- &nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;<br />- &nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case A_S18:<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;value =3D DECODE_INSN_U16 (insn) * 4;<br />- &nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (value =3D=3D 0)<br /=
>- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf("%d", value);<br />- &n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else<br />- &nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;print_address(value);<br />- &nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;<br />- &nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;case A_U18:<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;value =3D DECODE_INSN_U18 (insn);<br />- &nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (value =3D=3D 0 || 1)<br />+ &nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (index-&gt;arg[0] !=3D 0)<br />+ &n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf("\t"=
);<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hex_value =3D 0;<br />+=
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for (i =3D 1; &nbsp;i &lt;=3D in=
dex-&gt;arg[0]; i++) {<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;int arg =3D index-&gt;arg[i];<br />+<br />+ &nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (arg !=3D A_P &a=
mp;&amp; !paren &amp;&amp; i &gt; 1)<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf(",");<br =
/>+<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;switch (arg) {<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;case A_T:<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf("$%lu",<br />+ &nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DECODE_INSN_RT(ins=
n));<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;break;<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case A_A:<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf("$%l=
u",<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;D=
ECODE_INSN_RA(insn));<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;<br />+ &nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case A_B:<br />+ &nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;printf("$%lu",<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;DECODE_INSN_RB(insn));<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;<br />+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case A_C:=
<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;printf("$%lu",<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DECODE_INSN_RC(insn));<br />+ &nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;break;<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;case A_S:<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf("$sp%lu",<br />+ &nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DECODE_INSN_RA(insn));<=
br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;break;<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;case A_H:<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf("$ch%lu",=
<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DECO=
DE_INSN_RA(insn));<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;<br />+ &nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case A_P:<br />+ &nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;paren++;<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf("(");<br />+ &nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;=
<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c=
ase A_U7A:<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf("%lu",<br />+ &nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;173 - DECODE_INSN_U8(insn));<br /=
>+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;break;<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;case A_U7B:<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf("%lu",<br /=
>+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;155 - DEC=
ODE_INSN_U8(insn));<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;<br />+ &nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case A_S3:<br />+ &nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case A_S6:<br />+ &=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case A_S7:=
<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c=
ase A_S7N:<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;case A_U3:<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;case A_U5:<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;case A_U6:<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case A_U7:<br />+ &nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hex_va=
lue =3D DECODE_INSN_I7(insn);<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf("%d", hex_value)=
;<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;break;<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case A_S11:<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;print_addres=
s(memaddr + DECODE_INSN_I9a(insn) * 4);<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;<br />+=
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case A_S=
11I:<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;print_address(memaddr + DECODE_INSN_I9b(insn) * =
4);<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;break;<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case A_S10:<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case A_S10B:<br />+ &nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;hex_value =3D DECODE_INSN_I10(insn);<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf("%d", he=
x_value);<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case A_S14:<br />+ &nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hex_=
value =3D DECODE_INSN_I10(insn) * 16;<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf("%d", he=
x_value);<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case A_S16:<br />+ &nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hex_=
value =3D DECODE_INSN_I16(insn);<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf("%d", hex_val=
ue);<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;break;<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case A_X16:<br />+ &nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hex_value=
 =3D DECODE_INSN_U16(insn);<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf("%u", hex_value);<=
br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;break;<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;case A_R18:<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;value =3D DECO=
DE_INSN_I16(insn) * 4;<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (value =3D=3D 0)<br />+ &nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf("%d", value);<br />+ &nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;else {<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hex_value =3D mema=
ddr + value;<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;print_address(he=
x_value &amp; 0x3ffff);<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />+ &nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break=
;<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
case A_S18:<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;value =3D DECODE_INSN_U16(insn) * 4;<br /=
>+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;if (value =3D=3D 0)<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;printf("%d", value);<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else<br />+ &nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;print_address(value);<br />+ &nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bre=
ak;<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;case A_U18:<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;value =3D DECODE_INSN_U18(insn);<br />+=
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;if (value =3D=3D 0 || 1) {<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;hex_value =3D value;<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;printf("%u", value);<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;} else<br />+ &nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;print_address(value);<br />+ &nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;brea=
k;<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;case A_U14:<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hex_value =3D DECODE_INSN_U14(insn);<br =
/>+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;printf("%u", hex_value);<br />+ &nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;<br=
 />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br=
 />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (arg !=3D A_P &amp;&amp; =
paren)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hex_value =3D value;<=
br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf("%u", v=
alue);<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;printf(")");<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;paren--;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;}<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;els=
e<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;print_address(value);<br=
 />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;<br />- &n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case A_U14:<br />- &nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hex_value =3D DECODE_INSN_U14 (insn);=
<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf("%u", =
hex_value);<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;br=
eak;<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />- &nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;if (arg !=3D A_P &amp;&amp; paren)<br />- &nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;printf(")");<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;paren--;<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<b=
r />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if=
 (hex_value &gt; 16)<br />- &nbsp;&nbsp;&nbsp;printf("\t# %x", hex_value);<=
br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (hex_value &gt; 16)<br =
/>+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;print=
f("\t# %x", hex_value);<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />&nbsp;&nb=
sp;&nbsp;return 4;<br />&nbsp;}</div>

</body></html>

--=_84557b650920df78480584e40fad0713--

