Return-Path: <linuxppc-dev+bounces-13860-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9679EC3A092
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 11:05:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2Hmm0P0Yz3fHc;
	Thu,  6 Nov 2025 21:02:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762423351;
	cv=none; b=IwgaDbQ5ETA2qatyrETN+20Y9MFncg/BJ1pl/c2fcnixcpkWUDoMMvd4PCFs4V8n4PpBZn3sU6mq3GyVPhwFhKQi0FC2ugiop8cJTFgQTT142nSiiQ6k+uiLk1Iougd2MkUbJCbIMV1Lm0OQVoE6jsS/3160NSivttpJJiw3ZPp5EhsQzqRqBtTeqYs5inESvG8arQhrmTSGc6OCvuCjUyZrOfx/KC5pCjrNAfJezy02or7T82dp4wSUglDBB+YUWaMXKwcvqJO+nwDoYb++ozN3vaD2UZ/75RWSwFEDSlektpIa+egH9aIlhr2bVffAikrG8cALte2/ybhd57+5DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762423351; c=relaxed/relaxed;
	bh=4Gwgq8AosyJkorQ2Vw4pdkWCqDOsbs+MKvc8HYWAt8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PCOZPew4l9n0nQXAzQkG1EwqZlTKdyT2QeNc0gzlrSJ38wNeOVOKFK9ASo7wGnzoV6i9P7x+ESBG+0jVSlH0cBC6BNIe/yhKRRvetA2sVAdRCfz4BNxkMhFjlur8IljOf50v3nIDtDqKjUmT1e3dH5bvklGtTVAZjCNTswzeW67WVvGHZ9tgRaOxSwxhM58WWDC1zJnVu4V8H2V6Sf9PN4StwOOeUOkmtbhJD+o52zpVtl2hBe2EvhuX6ktF3A1Ca1n+H56CVrhof1+YSo0MMLV+W/ASCD9cBf/hJ+h1udFptgqznSy2Zc9xqJ31aRCVn3M6ebdJmEwky1bG6gywyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Wpn5TBFc; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=MPlaJ2oX; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Wpn5TBFc;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=MPlaJ2oX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4d2Hml0sF6z3fDj
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 21:02:31 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762423346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Gwgq8AosyJkorQ2Vw4pdkWCqDOsbs+MKvc8HYWAt8Q=;
	b=Wpn5TBFcz+TLf6k15Chy3nxL1iQZHa89Ifq3BgFDR3tjw2z5GT6b8ZeWW/PUdHhTX2ObXE
	HLhC2bQCTL3+3t8eecSuCeDOPaeh01bd0ZpjKP+AiurqC4dRD6z0rAkaH2DjKkfZ192W5y
	Gqi575+2GkY/36msQBVBwSxgpol6psVs7tkfhIYwr+7bALKk7VLV0nrvvT3v0eX/0C3zDt
	1jCp7HGfZWFW/EJf804MykMkC8pBdu1KUNjq/+H5L4K9XykarmB1oxRXHRvITQApHW/wyQ
	wTXVgZE4f07+RFx8lGOIxQ2rtWW5m/KIcYKYXHEcFtE3Ff6uGKuS0IGxgSZBSw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762423346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Gwgq8AosyJkorQ2Vw4pdkWCqDOsbs+MKvc8HYWAt8Q=;
	b=MPlaJ2oXDOC79k+wbKcStJe48ElKWz/4NdJV9VTVo8fV2mjuZEkEU3UnrQlMEfYFZBlLhI
	m2HYzDURzmoQ5NBw==
Date: Thu, 06 Nov 2025 11:02:18 +0100
Subject: [PATCH v5 25/34] sparc64: vdso: Remove obsolete "fake section
 table" reservation
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
Message-Id: <20251106-vdso-sparc64-generic-2-v5-25-97ff2b6542f7@linutronix.de>
References: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
In-Reply-To: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Shannon Nelson <sln@onemain.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762423327; l=2715;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=GDhW6FGM84lRP3KSHJ2KY17zwk8LQQyNxwfOvs9V2nc=;
 b=zZfZYTdKl8XpGGMBfdQpIBy75in2sgaWAqUbbXJgw3wbrEZdfYUPvZgrq4x3BrA+K0lD7nhn2
 r1+6qpM8QE/CceBH3mkFPM089UKvto97lGe1g75Z5BgV1cpdbFWBk2M
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

When the vDSO logic was copied from x86 to SPARC some unused remnants of
the fake section handling were copied, too. In x86 the original fake
section handling had already been removed incompletely in commit
da861e18eccc ("x86, vdso: Get rid of the fake section mechanism").
On x86 the reservation was only cleaned up in commit 24b7c77bbb24
("x86/vdso: Remove obsolete "fake section table" reservation").

Remove the reservation for SPARC, too.

Fixes: 9a08862a5d2e ("vDSO for sparc")
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
Acked-by: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/vdso/vdso-layout.lds.S | 21 ---------------------
 arch/sparc/vdso/vdso2c.c          |  8 --------
 2 files changed, 29 deletions(-)

diff --git a/arch/sparc/vdso/vdso-layout.lds.S b/arch/sparc/vdso/vdso-layout.lds.S
index d31e57e8a3bbffd3afb187cd631e2491fde64148..9e0804789d11696948f11be367480b530a1f18d9 100644
--- a/arch/sparc/vdso/vdso-layout.lds.S
+++ b/arch/sparc/vdso/vdso-layout.lds.S
@@ -4,16 +4,6 @@
  * This script controls its layout.
  */
 
-#if defined(BUILD_VDSO64)
-# define SHDR_SIZE 64
-#elif defined(BUILD_VDSO32)
-# define SHDR_SIZE 40
-#else
-# error unknown VDSO target
-#endif
-
-#define NUM_FAKE_SHDRS 7
-
 SECTIONS
 {
 	/*
@@ -47,19 +37,8 @@ SECTIONS
 		*(.bss*)
 		*(.dynbss*)
 		*(.gnu.linkonce.b.*)
-
-		/*
-		 * Ideally this would live in a C file: kept in here for
-		 * compatibility with x86-64.
-		 */
-		VDSO_FAKE_SECTION_TABLE_START = .;
-		. = . + NUM_FAKE_SHDRS * SHDR_SIZE;
-		VDSO_FAKE_SECTION_TABLE_END = .;
 	}						:text
 
-	.fake_shstrtab	: { *(.fake_shstrtab) }		:text
-
-
 	.note		: { *(.note.*) }		:text	:note
 
 	.eh_frame_hdr	: { *(.eh_frame_hdr) }		:text	:eh_frame_hdr
diff --git a/arch/sparc/vdso/vdso2c.c b/arch/sparc/vdso/vdso2c.c
index dc81240aab6fd31a72b8a751cc2a4a821a3c4e4e..b97af5ec9f35c01f2a976b6213b1768b677ad231 100644
--- a/arch/sparc/vdso/vdso2c.c
+++ b/arch/sparc/vdso/vdso2c.c
@@ -61,8 +61,6 @@ const char *outfilename;
 /* Symbols that we need in vdso2c. */
 enum {
 	sym_vvar_start,
-	sym_VDSO_FAKE_SECTION_TABLE_START,
-	sym_VDSO_FAKE_SECTION_TABLE_END,
 };
 
 struct vdso_sym {
@@ -72,12 +70,6 @@ struct vdso_sym {
 
 struct vdso_sym required_syms[] = {
 	[sym_vvar_start] = {"vvar_start", 1},
-	[sym_VDSO_FAKE_SECTION_TABLE_START] = {
-		"VDSO_FAKE_SECTION_TABLE_START", 0
-	},
-	[sym_VDSO_FAKE_SECTION_TABLE_END] = {
-		"VDSO_FAKE_SECTION_TABLE_END", 0
-	},
 };
 
 __attribute__((format(printf, 1, 2))) __attribute__((noreturn))

-- 
2.51.0


