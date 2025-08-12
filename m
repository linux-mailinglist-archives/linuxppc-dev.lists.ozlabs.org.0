Return-Path: <linuxppc-dev+bounces-10842-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D57B21D3B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 07:46:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1L762ZVGz3dL0;
	Tue, 12 Aug 2025 15:44:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754977490;
	cv=none; b=IRMI6KLFols4rHWA2NRYP87CdbTAZkFRUOd07uWYdK7xRCqu1GXgRbxOUheS45HzfUY9wfkEubItlzKYHuncBFD7dMj3v2aKXJkvqg3jNTEVOghhYjazBFTIvD4LyP9YI8Z52vQd35f5mWfo9s0D/c/SJjyd0/aTJTrfMSajiHdluQUBCiFczwBXGwHXmdrFPr/2rXoYByhal1fsAwhcOhCB3mMbhUPYeWOZ1CPupR6BH3/88RDOofaN7M3gVHMSD8Pad4qjrLzWOgwUXxgBCR16gf9w5Nfvh/I9bmSxJK4hnv6lwzFu1U66wxuPmve7W0Blhe9WVV4/WlIf1mJbfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754977490; c=relaxed/relaxed;
	bh=Ni03bz74C9TDQf0xtR9HdEFVHcT90zf3s/r1yADBwxo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mzpD7qjjSr1G5q0tOIrc3iFg26JibYCO9ZPFAd+f5fptqJ+OdLh+uZCxHLSgnqa9CpXhDaGoGVHYtrZZ1Pc20TadYSMZuyCGJPXjrbUWFQ8KMB4U329LUntbBScdPFrrav5XsZnQmdpsXj0foz5j6zjA8wlAtASd7vuTBCLFKHuKzLslOcZHQihdw17QILPAABwUS/n40yPWQP03SpCQHEAs5YW1HLqGn19denYncedLOZoPQBO+q3u0oPo2MUe45/HZy4ECrHxbW6khpYux58GWxt6D6We0U1PJtUe8/MvTnTCIx3Z445anUasby9vuu1Lv56GticnZMZTfAcx9KQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=SPOdyyK6; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=G8Q+ixFA; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=SPOdyyK6;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=G8Q+ixFA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4c1L754qSpz3dKy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 15:44:49 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ni03bz74C9TDQf0xtR9HdEFVHcT90zf3s/r1yADBwxo=;
	b=SPOdyyK6sCUtkj6kxjiocTJJSEG7dMI/35DqLKjSrblI5G1I3CyLRTOU0LfTHDu2JQsxDj
	Dn/jh2j77Of16cGzaV4eefriQ+ADhNYDrnKqgGv5HP6LP8Jj0Yq6B+GTYhlGWdGV/jeCNn
	mChLIch4f7Gt0mUAyBg7i3cMLVb5B3npJ47FGQpkuXq4wraN8yU4e5d5OiTfiARGEt3ujO
	rpuqTNdsRVE9m+8DyoboNXYkzVlSxQ7GC9XLTUGVj7Vki1TG78RIYaiJMK8Y+oI+lds+EP
	JvwYSVkZ8fPvF1iauUDwZWuIMZtURfosroN8t78/t6nMmnrxJZEhAzgaCvJYpg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ni03bz74C9TDQf0xtR9HdEFVHcT90zf3s/r1yADBwxo=;
	b=G8Q+ixFA4w8D6kq4xigxFt3Cczt1Y9MbywRc7XOy0tz4miHQTBoNTUawPiaFBeSqGu+zKC
	/2FQ+7R2EdhFKXBA==
Date: Tue, 12 Aug 2025 07:44:28 +0200
Subject: [PATCH v4 15/24] powerpc/elf: Add 32-bit REL16 relocation
 definitions
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
Message-Id: <20250812-vdso-absolute-reloc-v4-15-61a8b615e5ec@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=1849;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=cTNg9TGsRxWfNuFVqiM2JjMT3BPMQJuifoiqKo4ezxg=;
 b=fTu+sca8EPLbAnEFtmDEkVGkzUGCf6ruToGNTg0scH5R7xB2jsm5rnvfxHsx+1Bkd74GG38mD
 NfkpwBlsVukCHjftZxM7DWULKfpV77bu2ffXVoITzAdYLtHpJEl0ViT
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

These are used by userspace and are necessary for the vdsocheck tool.
They share the numbers with their 64-bit variants.

Also update the copy in tools/ so they can be used by vdsocheck.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/uapi/linux/elf-r.h       | 7 ++++++-
 tools/include/uapi/linux/elf-r.h | 7 ++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/elf-r.h b/include/uapi/linux/elf-r.h
index 78085d26f4ab27a003fde65c8e981f575f411758..e750989e44e8f517d7dacf9d3a338af7a136e40f 100644
--- a/include/uapi/linux/elf-r.h
+++ b/include/uapi/linux/elf-r.h
@@ -182,8 +182,13 @@
 #define R_PPC_GOT_DTPREL16_HI	93 /* half16*	(sym+add)@got@dtprel@h */
 #define R_PPC_GOT_DTPREL16_HA	94 /* half16*	(sym+add)@got@dtprel@ha */
 
+#define R_PPC_REL16		249
+#define R_PPC_REL16_LO		250
+#define R_PPC_REL16_HI		251
+#define R_PPC_REL16_HA		252
+
 /* keep this the last entry. */
-#define R_PPC_NUM		95
+#define R_PPC_NUM		253
 
 /* PowerPC64 relocations defined by the ABIs */
 #define R_PPC64_NONE    R_PPC_NONE
diff --git a/tools/include/uapi/linux/elf-r.h b/tools/include/uapi/linux/elf-r.h
index 78085d26f4ab27a003fde65c8e981f575f411758..e750989e44e8f517d7dacf9d3a338af7a136e40f 100644
--- a/tools/include/uapi/linux/elf-r.h
+++ b/tools/include/uapi/linux/elf-r.h
@@ -182,8 +182,13 @@
 #define R_PPC_GOT_DTPREL16_HI	93 /* half16*	(sym+add)@got@dtprel@h */
 #define R_PPC_GOT_DTPREL16_HA	94 /* half16*	(sym+add)@got@dtprel@ha */
 
+#define R_PPC_REL16		249
+#define R_PPC_REL16_LO		250
+#define R_PPC_REL16_HI		251
+#define R_PPC_REL16_HA		252
+
 /* keep this the last entry. */
-#define R_PPC_NUM		95
+#define R_PPC_NUM		253
 
 /* PowerPC64 relocations defined by the ABIs */
 #define R_PPC64_NONE    R_PPC_NONE

-- 
2.50.1


