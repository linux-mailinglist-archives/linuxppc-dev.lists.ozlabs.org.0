Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B996D4713C9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Dec 2021 13:33:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JB6cl3tpJz3cbb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Dec 2021 23:33:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=vLGCQd0l;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=G1MfRzi7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm3 header.b=vLGCQd0l; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=G1MfRzi7; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JB6b90NXsz3c7k
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 23:31:48 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1341758015D;
 Sat, 11 Dec 2021 07:31:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sat, 11 Dec 2021 07:31:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=aum/C/r6WVGn1
 LYO/WaDHZ/1n9ZrNpXl1XQ0Fe/mks8=; b=vLGCQd0le9OPll/d9Au8IA8S27FS7
 NMMyaQ3MZSRPH4eRU4aXlJ61Td0vQW5JrVklWJJ3Y73wxrsU2qME/kHY06wqdSx7
 9MYprkhLvL5gTGOaoDw9vUUWq3aMRTEy+60M5+aq3KuMEEK51lVf1HhH17WDFNSh
 cY0W6lLD34HPodUYlKQJyzU3kj+a0kuD9LTnugrXBB8rudfnRo9KEKitFVhontzq
 FJND7IkYKFpLlqtjJShUEFwozWLWcT5XQK2UG2XsyDmNobJPmrDA9J7a/lsCl/JL
 HjRFwbupvnFifKMUns/Yp0VWKfex7OQXQuxxG6zWptHQWiS5va4+ghFvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=aum/C/r6WVGn1LYO/WaDHZ/1n9ZrNpXl1XQ0Fe/mks8=; b=G1MfRzi7
 yccUiIK/FgbxE8SiAzqhjDNMCIfc16uwlUOwcQkrpIqeNw6e3JK4Mmw6HCN1ATvg
 xoB41cYZxYFpGl6kS++wZKmwN0r/IrcwD++8ritLnF5Ok8BBsGuDwttlEeKoFXfz
 DWRCJbr/7cDh3+LTK/+WsvbjVG4KUHwm/9fHrAFh/gFaXN8lNfyv2mheMVE7D8ZS
 UST7LCnyQT3l2jbxqt0gRhlDSeDKQQIARG4hPTywouymhF+Z7YDQWKcymPEp+M5o
 BtNYGkxy02gmG3vpGlvylRXUZWqGxH5qoANDsF3A7xA+h47KuHY+lPmCXuGtSBZr
 7fdg6ZtgU2/o1Q==
X-ME-Sender: <xms:MZq0YRb1bW-SaU9eXGY2Pbm8QgOLQ-4MmGBP7PhA8wCbJ7EG57qLrQ>
 <xme:MZq0YYY6QYiexR6_oK-6NnD-ew3wIRSGnWmx8zIvYx7P6kZCPyT7wJPnGNeHF8mtU
 Wn3ij6lHh9jlW5-jw>
X-ME-Received: <xmr:MZq0YT-nQr3n7OH8RE5ZzlholYba3-_u1mNS5VF4ZLzlPMqIMmGRiCjUWUknXfpiYWaKzoxwRDmmF9vScc01aPUYV20Fiz6MSB3babR2LMtSjjZyOP-5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkeeggdefiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculddutddmnegovehorghsthgrlh
 dqhfeguddvqddtvdculdduhedtmdenucfjughrpefhvffufffkofgjfhgggfestdekredt
 redttdenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruh
 hsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnhepvdfgfefgfffhiefgheelgedtkedu
 hfetvdfhkeejfeefhfdvledtleekjeeuvddvnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhdpkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
 pehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:MZq0Yfo7m4zw0haxUUKC5trF_eiUv_mysYKDFnaybdYnEkYpTm61Fg>
 <xmx:MZq0Ycrptqh4Pvybpi-NciBk4vpInJkfcT6RgUFB8WQvHrYy-KVChQ>
 <xmx:MZq0YVSjC18CIsmn-EYQmjZOyIuD2i7RFk0TtNXpCg11fcNq0zglig>
 <xmx:Mpq0YRAMudKwJ1zeBLrkAH4rOd1B6A4VQ4Bs39tJ2voeZlmi1BejVQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 11 Dec 2021 07:31:43 -0500 (EST)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/module_64: Use patch_memory() to apply
 relocations to loaded modules
Date: Sat, 11 Dec 2021 22:31:11 +1000
Message-Id: <20211211123111.21044-2-ruscur@russell.cc>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211211123111.21044-1-ruscur@russell.cc>
References: <20211211123111.21044-1-ruscur@russell.cc>
MIME-Version: 1.0
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
Cc: joe.lawrence@redhat.com, jniethe5@gmail.com,
 Russell Currey <ruscur@russell.cc>, naveen.n.rao@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Livepatching a loaded module involves applying relocations through
apply_relocate_add(), which attempts to write to read-only memory when
CONFIG_STRICT_MODULE_RWX=y.  Work around this by performing these
writes through the text poke area by using patch_memory().

Similar to x86 and s390 implementations, apply_relocate_add() now
chooses to use patch_memory() or memcpy() depending on if the module
is loaded or not.  Without STRICT_KERNEL_RWX, patch_memory() is just
memcpy(), so there should be no performance impact.

While many relocation types may not be applied in a livepatch
context, comprehensively handling them prevents any issues in future,
with no performance penalty as the text poke area is only used when
necessary.

create_stub() and create_ftrace_stub() are modified to first write
to the stack so that the ppc64_stub_entry struct only takes one
write() to modify, saving several map/unmap/flush operations
when use of patch_memory() is necessary.

This patch also contains some trivial whitespace fixes.

Fixes: c35717c71e98 ("powerpc: Set ARCH_HAS_STRICT_MODULE_RWX")
Reported-by: Joe Lawrence <joe.lawrence@redhat.com>
Signed-off-by: Russell Currey <ruscur@russell.cc>
---
Some discussion here:https://github.com/linuxppc/issues/issues/375
for-stable version using patch_instruction():
https://lore.kernel.org/linuxppc-dev/20211123081520.18843-1-ruscur@russell.cc/

 arch/powerpc/kernel/module_64.c | 157 +++++++++++++++++++++-----------
 1 file changed, 104 insertions(+), 53 deletions(-)

diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 6baa676e7cb6..2a146750fa6f 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -350,11 +350,11 @@ static u32 stub_insns[] = {
  */
 static inline int create_ftrace_stub(struct ppc64_stub_entry *entry,
 					unsigned long addr,
-					struct module *me)
+					struct module *me,
+					void *(*write)(void *, const void *, size_t))
 {
 	long reladdr;
-
-	memcpy(entry->jump, stub_insns, sizeof(stub_insns));
+	struct ppc64_stub_entry tmp_entry;
 
 	/* Stub uses address relative to kernel toc (from the paca) */
 	reladdr = addr - kernel_toc_addr();
@@ -364,12 +364,20 @@ static inline int create_ftrace_stub(struct ppc64_stub_entry *entry,
 		return 0;
 	}
 
-	entry->jump[1] |= PPC_HA(reladdr);
-	entry->jump[2] |= PPC_LO(reladdr);
+	/*
+	 * In case @entry is write-protected, make our changes on the stack
+	 * so we can update the whole struct in one write().
+	 */
+	memcpy(&tmp_entry, entry, sizeof(struct ppc64_stub_entry));
 
+	memcpy(&tmp_entry.jump, stub_insns, sizeof(stub_insns));
+	tmp_entry.jump[1] |= PPC_HA(reladdr);
+	tmp_entry.jump[2] |= PPC_LO(reladdr);
 	/* Eventhough we don't use funcdata in the stub, it's needed elsewhere. */
-	entry->funcdata = func_desc(addr);
-	entry->magic = STUB_MAGIC;
+	tmp_entry.funcdata = func_desc(addr);
+	tmp_entry.magic = STUB_MAGIC;
+
+	write(entry, &tmp_entry, sizeof(struct ppc64_stub_entry));
 
 	return 1;
 }
@@ -392,7 +400,8 @@ static bool is_mprofile_ftrace_call(const char *name)
 #else
 static inline int create_ftrace_stub(struct ppc64_stub_entry *entry,
 					unsigned long addr,
-					struct module *me)
+					struct module *me,
+					void *(*write)(void *, const void *, size_t))
 {
 	return 0;
 }
@@ -419,14 +428,14 @@ static inline int create_stub(const Elf64_Shdr *sechdrs,
 			      struct ppc64_stub_entry *entry,
 			      unsigned long addr,
 			      struct module *me,
-			      const char *name)
+			      const char *name,
+			      void *(*write)(void *, const void *, size_t))
 {
 	long reladdr;
+	struct ppc64_stub_entry tmp_entry;
 
 	if (is_mprofile_ftrace_call(name))
-		return create_ftrace_stub(entry, addr, me);
-
-	memcpy(entry->jump, ppc64_stub_insns, sizeof(ppc64_stub_insns));
+		return create_ftrace_stub(entry, addr, me, write);
 
 	/* Stub uses address relative to r2. */
 	reladdr = (unsigned long)entry - my_r2(sechdrs, me);
@@ -437,10 +446,19 @@ static inline int create_stub(const Elf64_Shdr *sechdrs,
 	}
 	pr_debug("Stub %p get data from reladdr %li\n", entry, reladdr);
 
-	entry->jump[0] |= PPC_HA(reladdr);
-	entry->jump[1] |= PPC_LO(reladdr);
-	entry->funcdata = func_desc(addr);
-	entry->magic = STUB_MAGIC;
+	/*
+	 * In case @entry is write-protected, make our changes on the stack
+	 * so we can update the whole struct in one write().
+	 */
+	memcpy(&tmp_entry, entry, sizeof(struct ppc64_stub_entry));
+
+	memcpy(&tmp_entry.jump, ppc64_stub_insns, sizeof(ppc64_stub_insns));
+	tmp_entry.jump[0] |= PPC_HA(reladdr);
+	tmp_entry.jump[1] |= PPC_LO(reladdr);
+	tmp_entry.funcdata = func_desc(addr);
+	tmp_entry.magic = STUB_MAGIC;
+
+	write(entry, &tmp_entry, sizeof(struct ppc64_stub_entry));
 
 	return 1;
 }
@@ -450,7 +468,8 @@ static inline int create_stub(const Elf64_Shdr *sechdrs,
 static unsigned long stub_for_addr(const Elf64_Shdr *sechdrs,
 				   unsigned long addr,
 				   struct module *me,
-				   const char *name)
+				   const char *name,
+				   void *(*write)(void *, const void *, size_t))
 {
 	struct ppc64_stub_entry *stubs;
 	unsigned int i, num_stubs;
@@ -467,7 +486,7 @@ static unsigned long stub_for_addr(const Elf64_Shdr *sechdrs,
 			return (unsigned long)&stubs[i];
 	}
 
-	if (!create_stub(sechdrs, &stubs[i], addr, me, name))
+	if (!create_stub(sechdrs, &stubs[i], addr, me, name, write))
 		return 0;
 
 	return (unsigned long)&stubs[i];
@@ -496,15 +515,20 @@ static int restore_r2(const char *name, u32 *instruction, struct module *me)
 		return 0;
 	}
 	/* ld r2,R2_STACK_OFFSET(r1) */
-	*instruction = PPC_INST_LD_TOC;
+	if (me->state == MODULE_STATE_UNFORMED)
+		*instruction = PPC_INST_LD_TOC;
+	else
+		patch_instruction(instruction, ppc_inst(PPC_INST_LD_TOC));
+
 	return 1;
 }
 
-int apply_relocate_add(Elf64_Shdr *sechdrs,
-		       const char *strtab,
-		       unsigned int symindex,
-		       unsigned int relsec,
-		       struct module *me)
+static int __apply_relocate_add(Elf64_Shdr *sechdrs,
+				const char *strtab,
+				unsigned int symindex,
+				unsigned int relsec,
+				struct module *me,
+				void *(*write)(void *dest, const void *src, size_t len))
 {
 	unsigned int i;
 	Elf64_Rela *rela = (void *)sechdrs[relsec].sh_addr;
@@ -544,16 +568,17 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 		switch (ELF64_R_TYPE(rela[i].r_info)) {
 		case R_PPC64_ADDR32:
 			/* Simply set it */
-			*(u32 *)location = value;
+			write(location, &value, 4);
 			break;
 
 		case R_PPC64_ADDR64:
 			/* Simply set it */
-			*(unsigned long *)location = value;
+			write(location, &value, 8);
 			break;
 
 		case R_PPC64_TOC:
-			*(unsigned long *)location = my_r2(sechdrs, me);
+			value = my_r2(sechdrs, me);
+			write(location, &value, 8);
 			break;
 
 		case R_PPC64_TOC16:
@@ -564,17 +589,17 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 				       me->name, value);
 				return -ENOEXEC;
 			}
-			*((uint16_t *) location)
-				= (*((uint16_t *) location) & ~0xffff)
+			value = (*((uint16_t *) location) & ~0xffff)
 				| (value & 0xffff);
+			write(location, &value, 2);
 			break;
 
 		case R_PPC64_TOC16_LO:
 			/* Subtract TOC pointer */
 			value -= my_r2(sechdrs, me);
-			*((uint16_t *) location)
-				= (*((uint16_t *) location) & ~0xffff)
+			value = (*((uint16_t *) location) & ~0xffff)
 				| (value & 0xffff);
+			write(location, &value, 2);
 			break;
 
 		case R_PPC64_TOC16_DS:
@@ -585,9 +610,9 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 				       me->name, value);
 				return -ENOEXEC;
 			}
-			*((uint16_t *) location)
-				= (*((uint16_t *) location) & ~0xfffc)
+			value = (*((uint16_t *) location) & ~0xfffc)
 				| (value & 0xfffc);
+			write(location, &value, 2);
 			break;
 
 		case R_PPC64_TOC16_LO_DS:
@@ -598,18 +623,18 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 				       me->name, value);
 				return -ENOEXEC;
 			}
-			*((uint16_t *) location)
-				= (*((uint16_t *) location) & ~0xfffc)
+			value = (*((uint16_t *) location) & ~0xfffc)
 				| (value & 0xfffc);
+			write(location, &value, 2);
 			break;
 
 		case R_PPC64_TOC16_HA:
 			/* Subtract TOC pointer */
 			value -= my_r2(sechdrs, me);
 			value = ((value + 0x8000) >> 16);
-			*((uint16_t *) location)
-				= (*((uint16_t *) location) & ~0xffff)
+			value = (*((uint16_t *) location) & ~0xffff)
 				| (value & 0xffff);
+			write(location, &value, 2);
 			break;
 
 		case R_PPC_REL24:
@@ -618,14 +643,15 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 			    sym->st_shndx == SHN_LIVEPATCH) {
 				/* External: go via stub */
 				value = stub_for_addr(sechdrs, value, me,
-						strtab + sym->st_name);
+						      strtab + sym->st_name, write);
 				if (!value)
 					return -ENOENT;
 				if (!restore_r2(strtab + sym->st_name,
 							(u32 *)location + 1, me))
 					return -ENOEXEC;
-			} else
+			} else {
 				value += local_entry_offset(sym);
+			}
 
 			/* Convert value to relative */
 			value -= (unsigned long)location;
@@ -636,14 +662,15 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 			}
 
 			/* Only replace bits 2 through 26 */
-			*(uint32_t *)location
-				= (*(uint32_t *)location & ~0x03fffffc)
+			value = (*(uint32_t *)location & ~0x03fffffc)
 				| (value & 0x03fffffc);
+			write(location, &value, 4);
 			break;
 
 		case R_PPC64_REL64:
 			/* 64 bits relative (used by features fixups) */
-			*location = value - (unsigned long)location;
+			value -= (unsigned long)location;
+			write(location, &value, 8);
 			break;
 
 		case R_PPC64_REL32:
@@ -655,7 +682,7 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 				       me->name, (long int)value);
 				return -ENOEXEC;
 			}
-			*(u32 *)location = value;
+			write(location, &value, 4);
 			break;
 
 		case R_PPC64_TOCSAVE:
@@ -676,7 +703,7 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 				break;
 			/*
 			 * Check for the large code model prolog sequence:
-		         *	ld r2, ...(r12)
+			 *	ld r2, ...(r12)
 			 *	add r2, r2, r12
 			 */
 			if ((((uint32_t *)location)[0] & ~0xfffc) != PPC_RAW_LD(_R2, _R12, 0))
@@ -688,25 +715,27 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 			 *	addis r2, r12, (.TOC.-func)@ha
 			 *	addi  r2,  r2, (.TOC.-func)@l
 			 */
-			((uint32_t *)location)[0] = PPC_RAW_ADDIS(_R2, _R12, PPC_HA(value));
-			((uint32_t *)location)[1] = PPC_RAW_ADDI(_R2, _R2, PPC_LO(value));
+			patch_instruction(&((uint32_t *)location)[0],
+					  ppc_inst(PPC_RAW_ADDIS(_R2, _R12, PPC_HA(value))));
+			patch_instruction(&((uint32_t *)location)[1],
+					  ppc_inst(PPC_RAW_ADDI(_R2, _R2, PPC_LO(value))));
 			break;
 
 		case R_PPC64_REL16_HA:
 			/* Subtract location pointer */
 			value -= (unsigned long)location;
 			value = ((value + 0x8000) >> 16);
-			*((uint16_t *) location)
-				= (*((uint16_t *) location) & ~0xffff)
+			value = (*((uint16_t *) location) & ~0xffff)
 				| (value & 0xffff);
+			write(location, &value, 2);
 			break;
 
 		case R_PPC64_REL16_LO:
 			/* Subtract location pointer */
 			value -= (unsigned long)location;
-			*((uint16_t *) location)
-				= (*((uint16_t *) location) & ~0xffff)
+			value = (*((uint16_t *) location) & ~0xffff)
 				| (value & 0xffff);
+			write(location, &value, 2);
 			break;
 
 		default:
@@ -720,6 +749,20 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 	return 0;
 }
 
+int apply_relocate_add(Elf64_Shdr *sechdrs,
+		       const char *strtab,
+		       unsigned int symindex,
+		       unsigned int relsec,
+		       struct module *me)
+{
+	void *(*write)(void *, const void *, size_t) = memcpy;
+	bool early = me->state == MODULE_STATE_UNFORMED;
+
+	if (!early)
+		write = patch_memory;
+
+	return __apply_relocate_add(sechdrs, strtab, symindex, relsec, me, write);
+}
 #ifdef CONFIG_DYNAMIC_FTRACE
 int module_trampoline_target(struct module *mod, unsigned long addr,
 			     unsigned long *target)
@@ -749,7 +792,7 @@ int module_trampoline_target(struct module *mod, unsigned long addr,
 	if (copy_from_kernel_nofault(&funcdata, &stub->funcdata,
 			sizeof(funcdata))) {
 		pr_err("%s: fault reading funcdata for stub %lx for %s\n", __func__, addr, mod->name);
-                return -EFAULT;
+		return -EFAULT;
 	}
 
 	*target = stub_func_addr(funcdata);
@@ -759,15 +802,23 @@ int module_trampoline_target(struct module *mod, unsigned long addr,
 
 int module_finalize_ftrace(struct module *mod, const Elf_Shdr *sechdrs)
 {
+	void *(*write)(void *, const void *, size_t) = memcpy;
+	bool early = mod->state == MODULE_STATE_UNFORMED;
+
+	if (!early)
+		write = patch_memory;
+
 	mod->arch.tramp = stub_for_addr(sechdrs,
 					(unsigned long)ftrace_caller,
 					mod,
-					"ftrace_caller");
+					"ftrace_caller",
+					write);
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
 	mod->arch.tramp_regs = stub_for_addr(sechdrs,
 					(unsigned long)ftrace_regs_caller,
 					mod,
-					"ftrace_regs_caller");
+					"ftrace_regs_caller",
+					write);
 	if (!mod->arch.tramp_regs)
 		return -ENOENT;
 #endif
-- 
2.34.1

