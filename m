Return-Path: <linuxppc-dev+bounces-10834-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F29BB21D27
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 07:45:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1L6y1Rt6z3dHP;
	Tue, 12 Aug 2025 15:44:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754977482;
	cv=none; b=mrcMQm4SDi1SHEUy9iC1EKcLCmYRoQGJDKL+Nra81WP5W4rwO2IKjJ2c5abhVUs13UbaN/YcBMqgv5sZemUzlhvryUTATkhi8RAPuUf1q44vGvGrYMEOnV/Jok/Mj1zeeIxTrVIL//6R4VDedjzgi5TQitdVMx3p+tjgdyG+No3b4E0l22g3LAA4hh6whGghk//Aj/yoJ9twyCswOFwSaZZQOfiBdAucr+yQPQUxALFHAqnZyc7iXK8SRhmLHpWnDlMPjJWtBAGEmChvjr3cxSj/LSuZoc3I237N9n4t6Giwg4m8ooTniERuf9fSsUBzoSL7SQnTn/AzwxV+iWnViA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754977482; c=relaxed/relaxed;
	bh=bfNfmAZ2eWXIcM3gW1RToAS2jXuE+ttAWjtBaA8JivY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dzgcA9j7P9h52A9UGwIDC6YxSAYkZgm76lOWgoNmJaJQs/s+6BYM4IcvqUj+s+x35I9Rxa4KpgXdjnhcELYs+izsWGqkrGxYzgSIr75I5WAmeTk9VHoJ7wqyt6wEMG1RPCRw4p8VuirPRnkRBuC+LzpS9cGZbQ6m6bZV7g03IwuCrIXZSCO0q6kJxSKVprduqEScb8744B69Qd3T/56BJfKsvrMnud4EaGC/jL6UxK2i2xgV1IPQmGcqM0ROWl530w1Mw4ZiIjP0gvkQj39aTkZJu8VQU9MrlbUhCNc+7ZPRrh4yKlPA4oTLnkR/ncydlTsqJhabmKYKUD6iG2EAcw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=B1kpGRDy; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=XsxRG5no; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=B1kpGRDy;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=XsxRG5no;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4c1L6x1fWQz3dHw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 15:44:41 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bfNfmAZ2eWXIcM3gW1RToAS2jXuE+ttAWjtBaA8JivY=;
	b=B1kpGRDy3pua7bopWb/954oKgIRuc3FpjRcj8N8/0woGocR6MrlC63NTftBUFibKS/AICQ
	0l4yLvJDAUL9O9Iv8brOnKZbuEK46aY74M50FME3ez3Pqc0JNVP0cah4ZO+nwmJK1ZETG+
	ahGQ2eL4oYMmBUubBb7TW5qooKJgC0dBGwDMZsgzk0S+hvVfKZybnmYIkMpJmtsWOmDXE/
	7A3+CPHb6uwJ43WFXviOiwG4lW30wI8rFjFt/MBD45XXy8SmYdbOVBvgbqsdc9GpTPAv4z
	YPBooaL0o00WA384eonGN+yemrymWJ8qP4EH0Mydpotgh3etmFhObcSWEnpSWw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bfNfmAZ2eWXIcM3gW1RToAS2jXuE+ttAWjtBaA8JivY=;
	b=XsxRG5noqNi3QHUb3PsJMNnR3h1efFABfuNPsU4Tp4BzgulPHL9P4+dkMiySHq2nPf5wzI
	aGxuMRcC3js1Y5AQ==
Date: Tue, 12 Aug 2025 07:44:22 +0200
Subject: [PATCH v4 09/24] MIPS: ELF: Move relocation constants to UAPI
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250812-vdso-absolute-reloc-v4-9-61a8b615e5ec@linutronix.de>
References: <20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de>
In-Reply-To: <20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook <kees@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-mm@kvack.org, linux-um@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
 linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, Jan Stancek <jstancek@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=4434;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=URWumLq5cEfF9wP67bk+ZcYfaIdTPXBTgCA3fiF+CgA=;
 b=L2h7+F73PT6iolsNxcu6S1mxeLogHfAutUNfzT1g4xN2qS8cRMLW7GI8H7DLrsC8VYfYYOVEW
 2yK3W8sGTl1CqHowhCCS2gkuE5kLBohKQe3c+i9dq+/6IUgTR2HRtCc
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

These constants are useful for cross-platform userspace, for example to
process ELF files during kernel cross-compilation.

Move them from the kernel-private architecture-specific header to the UAPI.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/mips/include/asm/elf.h | 53 --------------------------------------------
 include/uapi/linux/elf-r.h  | 54 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+), 53 deletions(-)

diff --git a/arch/mips/include/asm/elf.h b/arch/mips/include/asm/elf.h
index dc8d2863752cfd5e8e2cbd750276f9463e0c32b8..347e12584beebbb5a7290efae3310b01220bbe0a 100644
--- a/arch/mips/include/asm/elf.h
+++ b/arch/mips/include/asm/elf.h
@@ -70,59 +70,6 @@
 #define DT_MIPS_HIPAGENO	0x70000014
 #define DT_MIPS_RLD_MAP		0x70000016
 
-#define R_MIPS_NONE		0
-#define R_MIPS_16		1
-#define R_MIPS_32		2
-#define R_MIPS_REL32		3
-#define R_MIPS_26		4
-#define R_MIPS_HI16		5
-#define R_MIPS_LO16		6
-#define R_MIPS_GPREL16		7
-#define R_MIPS_LITERAL		8
-#define R_MIPS_GOT16		9
-#define R_MIPS_PC16		10
-#define R_MIPS_CALL16		11
-#define R_MIPS_GPREL32		12
-/* The remaining relocs are defined on Irix, although they are not
-   in the MIPS ELF ABI.	 */
-#define R_MIPS_UNUSED1		13
-#define R_MIPS_UNUSED2		14
-#define R_MIPS_UNUSED3		15
-#define R_MIPS_SHIFT5		16
-#define R_MIPS_SHIFT6		17
-#define R_MIPS_64		18
-#define R_MIPS_GOT_DISP		19
-#define R_MIPS_GOT_PAGE		20
-#define R_MIPS_GOT_OFST		21
-/*
- * The following two relocation types are specified in the MIPS ABI
- * conformance guide version 1.2 but not yet in the psABI.
- */
-#define R_MIPS_GOTHI16		22
-#define R_MIPS_GOTLO16		23
-#define R_MIPS_SUB		24
-#define R_MIPS_INSERT_A		25
-#define R_MIPS_INSERT_B		26
-#define R_MIPS_DELETE		27
-#define R_MIPS_HIGHER		28
-#define R_MIPS_HIGHEST		29
-/*
- * The following two relocation types are specified in the MIPS ABI
- * conformance guide version 1.2 but not yet in the psABI.
- */
-#define R_MIPS_CALLHI16		30
-#define R_MIPS_CALLLO16		31
-/*
- * Introduced for MIPSr6.
- */
-#define R_MIPS_PC21_S2		60
-#define R_MIPS_PC26_S2		61
-/*
- * This range is reserved for vendor specific relocations.
- */
-#define R_MIPS_LOVENDOR		100
-#define R_MIPS_HIVENDOR		127
-
 #define SHN_MIPS_ACCOMON	0xff00		/* Allocated common symbols */
 #define SHN_MIPS_TEXT		0xff01		/* Allocated test symbols.  */
 #define SHN_MIPS_DATA		0xff02		/* Allocated data symbols.  */
diff --git a/include/uapi/linux/elf-r.h b/include/uapi/linux/elf-r.h
index c1309a63a7dc4495f22e3d8b51d3f97ab5809190..78085d26f4ab27a003fde65c8e981f575f411758 100644
--- a/include/uapi/linux/elf-r.h
+++ b/include/uapi/linux/elf-r.h
@@ -563,4 +563,58 @@
 /* Keep this the last entry.  */
 #define R_390_NUM	61
 
+/* MIPS relocations defined by the ABIs */
+#define R_MIPS_NONE		0
+#define R_MIPS_16		1
+#define R_MIPS_32		2
+#define R_MIPS_REL32		3
+#define R_MIPS_26		4
+#define R_MIPS_HI16		5
+#define R_MIPS_LO16		6
+#define R_MIPS_GPREL16		7
+#define R_MIPS_LITERAL		8
+#define R_MIPS_GOT16		9
+#define R_MIPS_PC16		10
+#define R_MIPS_CALL16		11
+#define R_MIPS_GPREL32		12
+/* The remaining relocs are defined on Irix, although they are not
+   in the MIPS ELF ABI.	 */
+#define R_MIPS_UNUSED1		13
+#define R_MIPS_UNUSED2		14
+#define R_MIPS_UNUSED3		15
+#define R_MIPS_SHIFT5		16
+#define R_MIPS_SHIFT6		17
+#define R_MIPS_64		18
+#define R_MIPS_GOT_DISP		19
+#define R_MIPS_GOT_PAGE		20
+#define R_MIPS_GOT_OFST		21
+/*
+ * The following two relocation types are specified in the MIPS ABI
+ * conformance guide version 1.2 but not yet in the psABI.
+ */
+#define R_MIPS_GOTHI16		22
+#define R_MIPS_GOTLO16		23
+#define R_MIPS_SUB		24
+#define R_MIPS_INSERT_A		25
+#define R_MIPS_INSERT_B		26
+#define R_MIPS_DELETE		27
+#define R_MIPS_HIGHER		28
+#define R_MIPS_HIGHEST		29
+/*
+ * The following two relocation types are specified in the MIPS ABI
+ * conformance guide version 1.2 but not yet in the psABI.
+ */
+#define R_MIPS_CALLHI16		30
+#define R_MIPS_CALLLO16		31
+/*
+ * Introduced for MIPSr6.
+ */
+#define R_MIPS_PC21_S2		60
+#define R_MIPS_PC26_S2		61
+/*
+ * This range is reserved for vendor specific relocations.
+ */
+#define R_MIPS_LOVENDOR		100
+#define R_MIPS_HIVENDOR		127
+
 #endif /* _UAPI_LINUX_ELF_R_H */

-- 
2.50.1


