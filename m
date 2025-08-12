Return-Path: <linuxppc-dev+bounces-10831-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EA6B21D1C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 07:45:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1L6v2m65z3cgW;
	Tue, 12 Aug 2025 15:44:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754977479;
	cv=none; b=omX2I15mN5FEdIeS+sdSsa3sMcAZT2B8bQHlPUGgXXBezwvoiyj80Tm0kDU6DA1pdM22MlhnNJxqiTq3jD84pbKyijVqzBmlbaBOfcG44j6aKtLoWT6tbLnX8kwzt5czlKHYEL4mV8MmZexmqBXySkztErUoeKYKyoVJlEu1+GBeMtr91vXMHNbBgeCR3SUYXos8lxe5+GP5dyZBKJKxLW0OYu30bwrQE0MdbwAyTeRqIDjMp3ZeyQ0n36VBmrWk8R0LP5CkX8MYrJTH8lsr+nb5PTKtxhWfDA/umG9jytDzgd5Qpn7F/Km1T1RbCCTVP5SDv73IhXFaLWBKUnk/yA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754977479; c=relaxed/relaxed;
	bh=WeePFN7UO8+hOKOyWOa3G3+alh9wPXoqMxnhe0D2ylY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ol0cai/dBuUTG2Vznz8UEVH9RRZ51BlxCuHrTjq2GtcGAqhGjxyfRhfDwOd/7sPwgkpxV35p29zSKPVms+NfQGR2TiqNGCcOLcOGJqyWrGSTY5rp7ERwGTv9wPeyTje1eEyhGUmPImh32q8iamdaFVrAayNDNwjfqsk6AUxchlb6EfMM6ZdLL4ZwRw4csd9uNotQkf+SUQY15KvwABgrUjGSDso5dXmYzLnQfoTFyKaBsYamycsIqNzbLdUq07zx458o0yGdbclox+FIi8o/wAvuacSj1ODCmd6/9wPcJdGt/J+kxyizLaR9uu7sH6at2sPjD5OGsR8jjvou4/i8ug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JqzHOjKA; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=eJOu4USm; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JqzHOjKA;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=eJOu4USm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4c1L6t5X4Vz3dHP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 15:44:38 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WeePFN7UO8+hOKOyWOa3G3+alh9wPXoqMxnhe0D2ylY=;
	b=JqzHOjKA7yrLionJrJNO8KOAarJG0Oo28v1APFSwq89167wmxb1lZyHMuXNnHrDwxH9gSS
	/ELfgioTR5fb/Ljc+sYJEHqydQykqY+dPku+piakuLpoYplUy8nu370IDCExIRAVnKTo2d
	+v+xsnzyadL06twVI4C4micp1yORPIESPL7D6qalI1kfH6fJTrTV7AQ+lUY6RdlBKcOlnG
	roKFqmu0T++7EKHvIZhYIq0thUktatKAE+bdUH3O4P8hQJDR+cw+xBAhVt8geh7pm3kY7R
	qbqMp5Grpn0o6oeLQHjtKHgrAL7YpnUDvTR5ZMbjSFY5TkenW05hQQv/hde6lQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WeePFN7UO8+hOKOyWOa3G3+alh9wPXoqMxnhe0D2ylY=;
	b=eJOu4USmFl8u450RqsRFSXa2Lhj6NjHhqFOSqGSdot5xvQYhfz7huLEAqhu43i8HbV2r/Y
	gOvSdTkIIYEnsrBw==
Date: Tue, 12 Aug 2025 07:44:14 +0200
Subject: [PATCH v4 01/24] elf, uapi: Add a header for relocation constants
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
Message-Id: <20250812-vdso-absolute-reloc-v4-1-61a8b615e5ec@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=1460;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=pEZOOlfYLKHxA52mtxp/u2Atua1rkGYZwTp881737QA=;
 b=FP2/6LZXvWWXU9TWRCOGilFMCMdFH/DUVBCJoOqArDIYqbLz6sxu9BRz2ZOAaXa6pVuX1T7y8
 Okzk+BkTdhVBChLHs5Bq2jeBZHod38wzt/AG9GAvJK+HF4hyrhvGqlM
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

While the numeric constants for relocations are architecture specific,
it is still useful to get access to them from other architectures.
Also the definitions are useful for userspace in general.
For example tools processing elf files during a kernel cross-compilation
can make use of them.

Introduce a dedicated header for them, similar to the elf-em.h header.
For now the header is empty but it will be filled step by step in
upcomming commits.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/uapi/linux/elf-r.h | 5 +++++
 include/uapi/linux/elf.h   | 1 +
 2 files changed, 6 insertions(+)

diff --git a/include/uapi/linux/elf-r.h b/include/uapi/linux/elf-r.h
new file mode 100644
index 0000000000000000000000000000000000000000..2c382c8a4807f394a3ccabf39a81e9e9b6f7ea45
--- /dev/null
+++ b/include/uapi/linux/elf-r.h
@@ -0,0 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _UAPI_LINUX_ELF_R_H
+#define _UAPI_LINUX_ELF_R_H
+
+#endif /* _UAPI_LINUX_ELF_R_H */
diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
index 819ded2d39de2bfcfca3c25a52c8b8cd51a01c12..3d18543d5460a757f0578afe5d487233ffaa3c57 100644
--- a/include/uapi/linux/elf.h
+++ b/include/uapi/linux/elf.h
@@ -4,6 +4,7 @@
 
 #include <linux/types.h>
 #include <linux/elf-em.h>
+#include <linux/elf-r.h>
 
 /* 32-bit ELF base types. */
 typedef __u32	Elf32_Addr;

-- 
2.50.1


