Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A69462C6058
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 08:09:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cj5NB1lZpzDrKW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 18:09:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=loongson.cn (client-ip=114.242.206.163; helo=loongson.cn;
 envelope-from=tangyouling@loongson.cn; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=loongson.cn
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Cj5LG0Fj1zDrWY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 18:07:46 +1100 (AEDT)
Received: from bogon.localdomain (unknown [113.200.148.30])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxytG6pcBfZGEXAA--.52564S2; 
 Fri, 27 Nov 2020 15:07:39 +0800 (CST)
From: Youling Tang <tangyouling@loongson.cn>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: [PATCH] powerpc: Use common STABS_DEBUG and DWARF_DEBUG and
 ELF_DETAILS macro
Date: Fri, 27 Nov 2020 15:07:37 +0800
Message-Id: <1606460857-2723-1-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9AxytG6pcBfZGEXAA--.52564S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXr1kZw1rJr4fuF4fCw48JFb_yoWrWFWrpw
 sIkF92qr48Jr1rJrySyryUZr9xA3y8ur43GFWUurW8JasIvrW5Wr1Fya48Jry8ZryUAFWr
 tanrt3yDKw4DCa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkab7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
 C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVAFwVW8CwCF04k2
 0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
 8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41l
 IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIx
 AIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvE
 x4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07bFg4hUUUUU=
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
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

Use the common STABS_DEBUG and DWARF_DEBUG and ELF_DETAILS macro rule for
the linker script in an effort.

Signed-off-by: Youling Tang <tangyouling@loongson.cn>
---
 arch/powerpc/kernel/vdso32/vdso32.lds.S | 42 ++++-----------------------------
 arch/powerpc/kernel/vdso64/vdso64.lds.S | 42 ++++-----------------------------
 2 files changed, 8 insertions(+), 76 deletions(-)

diff --git a/arch/powerpc/kernel/vdso32/vdso32.lds.S b/arch/powerpc/kernel/vdso32/vdso32.lds.S
index 7eadac7..8b5c7eb 100644
--- a/arch/powerpc/kernel/vdso32/vdso32.lds.S
+++ b/arch/powerpc/kernel/vdso32/vdso32.lds.S
@@ -4,6 +4,7 @@
  * library
  */
 #include <asm/vdso.h>
+#include <asm-generic/vmlinux.lds.h>
 
 #ifdef __LITTLE_ENDIAN__
 OUTPUT_FORMAT("elf32-powerpcle", "elf32-powerpcle", "elf32-powerpcle")
@@ -68,44 +69,9 @@ SECTIONS
 	__end = .;
 	PROVIDE(end = .);
 
-	/*
-	 * Stabs debugging sections are here too.
-	 */
-	.stab 0 : { *(.stab) }
-	.stabstr 0 : { *(.stabstr) }
-	.stab.excl 0 : { *(.stab.excl) }
-	.stab.exclstr 0 : { *(.stab.exclstr) }
-	.stab.index 0 : { *(.stab.index) }
-	.stab.indexstr 0 : { *(.stab.indexstr) }
-	.comment       0 : { *(.comment) }
-
-	/*
-	 * DWARF debug sections.
-	 * Symbols in the DWARF debugging sections are relative to the beginning
-	 * of the section so we begin them at 0.
-	 */
-	/* DWARF 1 */
-	.debug          0 : { *(.debug) }
-	.line           0 : { *(.line) }
-	/* GNU DWARF 1 extensions */
-	.debug_srcinfo  0 : { *(.debug_srcinfo) }
-	.debug_sfnames  0 : { *(.debug_sfnames) }
-	/* DWARF 1.1 and DWARF 2 */
-	.debug_aranges  0 : { *(.debug_aranges) }
-	.debug_pubnames 0 : { *(.debug_pubnames) }
-	/* DWARF 2 */
-	.debug_info     0 : { *(.debug_info .gnu.linkonce.wi.*) }
-	.debug_abbrev   0 : { *(.debug_abbrev) }
-	.debug_line     0 : { *(.debug_line) }
-	.debug_frame    0 : { *(.debug_frame) }
-	.debug_str      0 : { *(.debug_str) }
-	.debug_loc      0 : { *(.debug_loc) }
-	.debug_macinfo  0 : { *(.debug_macinfo) }
-	/* SGI/MIPS DWARF 2 extensions */
-	.debug_weaknames 0 : { *(.debug_weaknames) }
-	.debug_funcnames 0 : { *(.debug_funcnames) }
-	.debug_typenames 0 : { *(.debug_typenames) }
-	.debug_varnames  0 : { *(.debug_varnames) }
+	STABS_DEBUG
+	DWARF_DEBUG
+	ELF_DETAILS
 
 	/DISCARD/	: {
 		*(.note.GNU-stack)
diff --git a/arch/powerpc/kernel/vdso64/vdso64.lds.S b/arch/powerpc/kernel/vdso64/vdso64.lds.S
index 256fb97..0002f4e 100644
--- a/arch/powerpc/kernel/vdso64/vdso64.lds.S
+++ b/arch/powerpc/kernel/vdso64/vdso64.lds.S
@@ -4,6 +4,7 @@
  * library
  */
 #include <asm/vdso.h>
+#include <asm-generic/vmlinux.lds.h>
 
 #ifdef __LITTLE_ENDIAN__
 OUTPUT_FORMAT("elf64-powerpcle", "elf64-powerpcle", "elf64-powerpcle")
@@ -67,44 +68,9 @@ SECTIONS
 	_end = .;
 	PROVIDE(end = .);
 
-	/*
-	 * Stabs debugging sections are here too.
-	 */
-	.stab          0 : { *(.stab) }
-	.stabstr       0 : { *(.stabstr) }
-	.stab.excl     0 : { *(.stab.excl) }
-	.stab.exclstr  0 : { *(.stab.exclstr) }
-	.stab.index    0 : { *(.stab.index) }
-	.stab.indexstr 0 : { *(.stab.indexstr) }
-	.comment       0 : { *(.comment) }
-
-	/*
-	 * DWARF debug sections.
-	 * Symbols in the DWARF debugging sections are relative to the beginning
-	 * of the section so we begin them at 0.
-	 */
-	/* DWARF 1 */
-	.debug          0 : { *(.debug) }
-	.line           0 : { *(.line) }
-	/* GNU DWARF 1 extensions */
-	.debug_srcinfo  0 : { *(.debug_srcinfo) }
-	.debug_sfnames  0 : { *(.debug_sfnames) }
-	/* DWARF 1.1 and DWARF 2 */
-	.debug_aranges  0 : { *(.debug_aranges) }
-	.debug_pubnames 0 : { *(.debug_pubnames) }
-	/* DWARF 2 */
-	.debug_info     0 : { *(.debug_info .gnu.linkonce.wi.*) }
-	.debug_abbrev   0 : { *(.debug_abbrev) }
-	.debug_line     0 : { *(.debug_line) }
-	.debug_frame    0 : { *(.debug_frame) }
-	.debug_str      0 : { *(.debug_str) }
-	.debug_loc      0 : { *(.debug_loc) }
-	.debug_macinfo  0 : { *(.debug_macinfo) }
-	/* SGI/MIPS DWARF 2 extensions */
-	.debug_weaknames 0 : { *(.debug_weaknames) }
-	.debug_funcnames 0 : { *(.debug_funcnames) }
-	.debug_typenames 0 : { *(.debug_typenames) }
-	.debug_varnames  0 : { *(.debug_varnames) }
+	STABS_DEBUG
+	DWARF_DEBUG
+	ELF_DETAILS
 
 	/DISCARD/	: {
 		*(.note.GNU-stack)
-- 
2.1.0

