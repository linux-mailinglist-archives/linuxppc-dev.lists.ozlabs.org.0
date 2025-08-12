Return-Path: <linuxppc-dev+bounces-10828-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6858B21D12
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 07:44:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1L6s3Vfqz3dGx;
	Tue, 12 Aug 2025 15:44:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754977477;
	cv=none; b=THqy3+vknZKpnWOhyKdwCZBWrDA1Y7wbD7Is94fGeJAsJRgdL5otSYGHvRm3OjIAecUQTWOpYd5Mm/ee5JglIvndg00/Mbu3505hDNJUBrO5ZGhRR4HYJO2fGjOYoJgDqLuNSOmDqzpt9k2sfWIdN0x2ktNXVqkwmczxrzIaQfbQigDSydGOqSjIkHGotrFX9HdkUq+DPeYZTZ3r7RJNUT+gcwLhEiYK+SH6TcFta+fx4pOiNOA+xr7DZzh2JeVKmtVO1L/cJHj0nQlIbIxsz4r90GRlc9Qv+KWbqnrohVrNwizXHje0R6cxFO1En6orEHNFWDJmGVcsMyj7N2mPhA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754977477; c=relaxed/relaxed;
	bh=3NxCSEvj2PqT9z+zh43cxWZPZy/pc7lSYDl/HSYdpX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CK0zqx9qaCzhjl7RxwTmzqtAmr+V5eYVo7jAYEJxab21wbKJ6/TtoJaOY3VvfllBgFie4x+8u9Rn8yv8t/yLwUQKUzIpiGhH550bhlLdq9NIib4UbTAZBt1dmmzZKtvmP5N5Lr0OjOOWwkCldxXvw8rPngVOwTFdiG0HENoZx+RIQY2SOHypnICQTQaK1Wg/2nX3x5t5wOsrBovpTj2PBUXgpwxgE++rXD5GCKR5sM3jNhCdcm8ez1gZaq5a7SaldKquDSqkDEG9lnIAESyYpsG1OxEh6Wf0Zs+X9ZH2CcXW5J4cFRE9/XMOmcOqiJNeCZDMQ5TUVJjnWmIP9idsAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OzPn4l9b; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=pafKDyE9; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OzPn4l9b;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=pafKDyE9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4c1L6r3Hzjz3dGl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 15:44:36 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3NxCSEvj2PqT9z+zh43cxWZPZy/pc7lSYDl/HSYdpX0=;
	b=OzPn4l9bPnlKixJ4UTB4AhAiLkjej71xwPtqSacSd+DsXZttorULyXy0fBr+6XMEYsbpyX
	pktj9XCWQ8ee9sbQ7TYV8xKn9kXKt4m2MmDnVX9oK64iccISEQVpCVAjKsf5kfo2Y4wKUi
	D/gtoJVpdPcUWflVbX6Hs6iChwze2AWD5Nd6p9SmoIAq7Qmyf8+MGJgz+NTXtkznsfMX+o
	j3OCtHeIk3g8dw8i98Qx5qdXUibd3WkJPpTCzYYDMYJG02MGifnkCYLytDJNMiDCMFGFIu
	8/+eeYubofn5+rAsSCT5GEPgNyX67Wj5B38v0AvV+ZRmEt8rhZK2/TA3OnjrCQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3NxCSEvj2PqT9z+zh43cxWZPZy/pc7lSYDl/HSYdpX0=;
	b=pafKDyE9bffqSWjpfAcol5Guig2fgcH1bW+oS2Qi1sEvJ6rykUviC/BNs2xCa8jswWQoAY
	SQ7jPA+bZKqPUaBg==
Date: Tue, 12 Aug 2025 07:44:16 +0200
Subject: [PATCH v4 03/24] ARM: elf: Move relocation constants to UAPI
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
Message-Id: <20250812-vdso-absolute-reloc-v4-3-61a8b615e5ec@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=3153;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=jOcL1seJLYtGvYImS8V7KrNCGiyauUm9m0luaNV+25o=;
 b=2ZpJfDEg6FCwuTFwU3Nv++0bd6D+4hY16G/VIAHUE+ed4/E2i08I8MElZpFB/ZPj/iol+ibfT
 +7b+Uoz0sN9CIxjr9xcNzEwxHV7UcmSg7w4o2Gs4g4sQ4acRe/ztk9b
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

These constants are useful for cross-platform userspace, for example to
process ELF files during kernel cross-compilation.

Move them from the kernel-private architecture-specific header to the UAPI.

One arm64 header is also changed as it duplicates an arm definition.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm/include/asm/elf.h   | 24 ------------------------
 arch/arm64/include/asm/elf.h |  1 -
 include/uapi/linux/elf-r.h   | 25 +++++++++++++++++++++++++
 3 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/arch/arm/include/asm/elf.h b/arch/arm/include/asm/elf.h
index 9f21e170320fc57f1dc21a33d637bcfd3d1d3917..ec2d416baa9f7ef4b860c4a18b2e2bf2f05e4a9d 100644
--- a/arch/arm/include/asm/elf.h
+++ b/arch/arm/include/asm/elf.h
@@ -47,30 +47,6 @@ typedef struct user_fp elf_fpregset_t;
 #define EF_ARM_HASENTRY		0x00000002	/* All */
 #define EF_ARM_RELEXEC		0x00000001	/* All */
 
-#define R_ARM_NONE		0
-#define R_ARM_PC24		1
-#define R_ARM_ABS32		2
-#define R_ARM_REL32		3
-#define R_ARM_CALL		28
-#define R_ARM_JUMP24		29
-#define R_ARM_TARGET1		38
-#define R_ARM_V4BX		40
-#define R_ARM_PREL31		42
-#define R_ARM_MOVW_ABS_NC	43
-#define R_ARM_MOVT_ABS		44
-#define R_ARM_MOVW_PREL_NC	45
-#define R_ARM_MOVT_PREL		46
-#define R_ARM_ALU_PC_G0_NC	57
-#define R_ARM_ALU_PC_G1_NC	59
-#define R_ARM_LDR_PC_G2		63
-
-#define R_ARM_THM_CALL		10
-#define R_ARM_THM_JUMP24	30
-#define R_ARM_THM_MOVW_ABS_NC	47
-#define R_ARM_THM_MOVT_ABS	48
-#define R_ARM_THM_MOVW_PREL_NC	49
-#define R_ARM_THM_MOVT_PREL	50
-
 /*
  * These are used to set parameters in the core dumps.
  */
diff --git a/arch/arm64/include/asm/elf.h b/arch/arm64/include/asm/elf.h
index 3f93f4eef9530a7b5bc966bf4a16d83093a016ee..8efcfe7efe0c70c59b9b81f93ac9c1442bc7656a 100644
--- a/arch/arm64/include/asm/elf.h
+++ b/arch/arm64/include/asm/elf.h
@@ -18,7 +18,6 @@
  */
 
 /* Miscellaneous. */
-#define R_ARM_NONE			0
 #define R_AARCH64_NONE			256
 
 /* Data. */
diff --git a/include/uapi/linux/elf-r.h b/include/uapi/linux/elf-r.h
index 45a160ecf40570f3ac916344be363d7e74908ea6..001884641e7703146f91e2dd96fb5a2bbfc7a324 100644
--- a/include/uapi/linux/elf-r.h
+++ b/include/uapi/linux/elf-r.h
@@ -36,4 +36,29 @@
 #define R_X86_64_PC8		15	/* 8 bit sign extended pc relative */
 #define R_X86_64_PC64		24	/* Place relative 64-bit signed */
 
+/* arm relocation types */
+#define R_ARM_NONE		0
+#define R_ARM_PC24		1
+#define R_ARM_ABS32		2
+#define R_ARM_REL32		3
+#define R_ARM_CALL		28
+#define R_ARM_JUMP24		29
+#define R_ARM_TARGET1		38
+#define R_ARM_V4BX		40
+#define R_ARM_PREL31		42
+#define R_ARM_MOVW_ABS_NC	43
+#define R_ARM_MOVT_ABS		44
+#define R_ARM_MOVW_PREL_NC	45
+#define R_ARM_MOVT_PREL		46
+#define R_ARM_ALU_PC_G0_NC	57
+#define R_ARM_ALU_PC_G1_NC	59
+#define R_ARM_LDR_PC_G2		63
+
+#define R_ARM_THM_CALL		10
+#define R_ARM_THM_JUMP24	30
+#define R_ARM_THM_MOVW_ABS_NC	47
+#define R_ARM_THM_MOVT_ABS	48
+#define R_ARM_THM_MOVW_PREL_NC	49
+#define R_ARM_THM_MOVT_PREL	50
+
 #endif /* _UAPI_LINUX_ELF_R_H */

-- 
2.50.1


