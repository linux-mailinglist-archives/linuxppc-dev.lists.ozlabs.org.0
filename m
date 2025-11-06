Return-Path: <linuxppc-dev+bounces-13867-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF69C3A0E9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 11:07:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2Hmv1yddz3fMd;
	Thu,  6 Nov 2025 21:02:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762423359;
	cv=none; b=ibpprhflZLcj0SQ3ZInfHIYOpA/biyqE2SMqcL6+/COZu8SJ8jbKRXvk2nFdMhNRzVoX++epOJrFQ6rJRU0xIVR6Q39c1cBF1x/vIQO/l4oMSp2QkelsfPgTmK9EH/PSytWRBm5zArEuFqcovaRH/BpyQ5QG4aLc0LvU34dDWLYHCB0ahi/0CWI2GFmmuQj3LOw8BPcOleIz6uetibGZH82rcm8zjxptTCjVzEainFBL06clcNXQEbbC4qctzlHXCAOH7uKUrzQRkNOIHgoReg5pLz2jKXb8wENEsLfuCKkVgoNRI6/YmA9wBLJi8Wzy3z28d1L4kk0+EJbNeT4C5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762423359; c=relaxed/relaxed;
	bh=W2Ul6+VkoAGtk+fbsWo8FnOHy/g1Ec+KdWjD8933yrE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BKrFilKWYTSFlTxk4DAJcH9x4vryaatpBVyNJU+bqKaurOqHCgb4CDPEbSBJWU7WsCFd9xm5XeRbN6/qwv1kHFbMI8PIw9odo9aW/55rApewxnV8cElYIiSWmcWu+dgqQDyy1UbwJBOBlWrIOkRWeZe0tCYXlAPuZVeipikOE+g3izrzneEeBvaVw4pyJbNbT7+i2DydzGXwb5Kd/VQt4HB4VMtQ2aZeZCaTP/M1ZiHNpeRIX4h3tI4BC2hr/3pQ3q3s1718trqvXM+lpm0Nj5hfPE0icXUbFZtEaDi3IQglLTNgjMzId1rppeF0znTBeMmWoDQbQEuhRMlYowjaZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zzn8GNtx; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Sc2KMZXG; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zzn8GNtx;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Sc2KMZXG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4d2Hmt427Lz3fNc
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 21:02:38 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762423350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W2Ul6+VkoAGtk+fbsWo8FnOHy/g1Ec+KdWjD8933yrE=;
	b=zzn8GNtxXQFoEaa+oOM4Hn66k9j4jy8ZoB7IVuciMPbwMSeekysm7Pgrx31hA5SpJcD59F
	IeUV1idTFmiLR1XBwgWgqsAMn8mLiGV4QseV2EJMxWQiRvjXpOnF2yRKubmxoVvn0x22AI
	GrQ27+Ro5s1jxynIaILnk1bumKg9F5pEPwO8OaCFfJGk1gLfAHfVK1UGK/81cpBOdtjKtY
	3un6M5hvZiLdnQ2jJyKAuvDWp+27AZ0SlqNhHBvYSV1jgFarCbQp1gh99Yl9mp3pZY4uSF
	3z2ANPQ1XKHGfQsXqRK/nabqYEG0GqhzPQeq3xF4jaV7bzTveSBZInNQQM+tTw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762423350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W2Ul6+VkoAGtk+fbsWo8FnOHy/g1Ec+KdWjD8933yrE=;
	b=Sc2KMZXGMiSsHbm8MYfddzr66E3sO7dpadeOTTva5Wo7ak7n3k94fbb29g9pelz6nJjyOs
	hPIGLP7DiK7guoCQ==
Date: Thu, 06 Nov 2025 11:02:25 +0100
Subject: [PATCH v5 32/34] sparc64: vdso2c: Remove symbol handling
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
Message-Id: <20251106-vdso-sparc64-generic-2-v5-32-97ff2b6542f7@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762423327; l=3583;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=rscVeDO1P+cKaXX/Ha1fTrfGby5/x6sbnmbmn2plnQg=;
 b=PULV7avTJJBnwuA28r3mPVOxYpRH9jY8icZE/ATVclSu1a37GckUbIeW+wl+hOeEDrcA6Rzf6
 XHLLxsdHHSgCyPlJsmGp+ChkGkWtlb5UZrqfEYqXuyxVx567j+h/oAR
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

There are no handled symbols left.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
Acked-by: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/vdso/vdso2c.c | 10 ----------
 arch/sparc/vdso/vdso2c.h | 41 +----------------------------------------
 2 files changed, 1 insertion(+), 50 deletions(-)

diff --git a/arch/sparc/vdso/vdso2c.c b/arch/sparc/vdso/vdso2c.c
index 70b14a436fe2297ab446f778ab0d43155c272421..e5c61214a0e285547ac57c9997542546464bde23 100644
--- a/arch/sparc/vdso/vdso2c.c
+++ b/arch/sparc/vdso/vdso2c.c
@@ -58,14 +58,6 @@
 
 const char *outfilename;
 
-struct vdso_sym {
-	const char *name;
-	int export;
-};
-
-struct vdso_sym required_syms[] = {
-};
-
 __attribute__((format(printf, 1, 2))) __attribute__((noreturn))
 static void fail(const char *format, ...)
 {
@@ -105,8 +97,6 @@ static void fail(const char *format, ...)
 #define PUT_BE(x, val)					\
 	PBE(x, val, 64, PBE(x, val, 32, PBE(x, val, 16, LAST_PBE(x, val))))
 
-#define NSYMS ARRAY_SIZE(required_syms)
-
 #define BITSFUNC3(name, bits, suffix) name##bits##suffix
 #define BITSFUNC2(name, bits, suffix) BITSFUNC3(name, bits, suffix)
 #define BITSFUNC(name) BITSFUNC2(name, ELF_BITS, )
diff --git a/arch/sparc/vdso/vdso2c.h b/arch/sparc/vdso/vdso2c.h
index ba0794659eb5af53b8c86b24f3221a5d0b3f74ab..bad6a0593f4ca293feca201a6343833268ad1cb8 100644
--- a/arch/sparc/vdso/vdso2c.h
+++ b/arch/sparc/vdso/vdso2c.h
@@ -17,11 +17,9 @@ static void BITSFUNC(go)(void *raw_addr, size_t raw_len,
 	unsigned long mapping_size;
 	int i;
 	unsigned long j;
-	ELF(Shdr) *symtab_hdr = NULL, *strtab_hdr;
+	ELF(Shdr) *symtab_hdr = NULL;
 	ELF(Ehdr) *hdr = (ELF(Ehdr) *)raw_addr;
 	ELF(Dyn) *dyn = 0, *dyn_end = 0;
-	INT_BITS syms[NSYMS] = {};
-
 	ELF(Phdr) *pt = (ELF(Phdr) *)(raw_addr + GET_BE(&hdr->e_phoff));
 
 	/* Walk the segment table. */
@@ -72,38 +70,6 @@ static void BITSFUNC(go)(void *raw_addr, size_t raw_len,
 	if (!symtab_hdr)
 		fail("no symbol table\n");
 
-	strtab_hdr = raw_addr + GET_BE(&hdr->e_shoff) +
-		GET_BE(&hdr->e_shentsize) * GET_BE(&symtab_hdr->sh_link);
-
-	/* Walk the symbol table */
-	for (i = 0;
-	     i < GET_BE(&symtab_hdr->sh_size) / GET_BE(&symtab_hdr->sh_entsize);
-	     i++) {
-		int k;
-
-		ELF(Sym) *sym = raw_addr + GET_BE(&symtab_hdr->sh_offset) +
-			GET_BE(&symtab_hdr->sh_entsize) * i;
-		const char *name = raw_addr + GET_BE(&strtab_hdr->sh_offset) +
-			GET_BE(&sym->st_name);
-
-		for (k = 0; k < NSYMS; k++) {
-			if (!strcmp(name, required_syms[k].name)) {
-				if (syms[k]) {
-					fail("duplicate symbol %s\n",
-					     required_syms[k].name);
-				}
-
-				/*
-				 * Careful: we use negative addresses, but
-				 * st_value is unsigned, so we rely
-				 * on syms[k] being a signed type of the
-				 * correct width.
-				 */
-				syms[k] = GET_BE(&sym->st_value);
-			}
-		}
-	}
-
 	if (!name) {
 		fwrite(stripped_addr, stripped_len, 1, outfile);
 		return;
@@ -129,10 +95,5 @@ static void BITSFUNC(go)(void *raw_addr, size_t raw_len,
 	fprintf(outfile, "const struct vdso_image %s_builtin = {\n", name);
 	fprintf(outfile, "\t.data = raw_data,\n");
 	fprintf(outfile, "\t.size = %lu,\n", mapping_size);
-	for (i = 0; i < NSYMS; i++) {
-		if (required_syms[i].export && syms[i])
-			fprintf(outfile, "\t.sym_%s = %" PRIi64 ",\n",
-				required_syms[i].name, (int64_t)syms[i]);
-	}
 	fprintf(outfile, "};\n");
 }

-- 
2.51.0


