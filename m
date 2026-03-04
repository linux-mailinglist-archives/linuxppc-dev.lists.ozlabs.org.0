Return-Path: <linuxppc-dev+bounces-17678-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DR/GU3kp2nqlQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17678-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 08:50:37 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2771FBE8A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 08:50:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQlDk0syQz3cNj;
	Wed, 04 Mar 2026 18:49:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772610565;
	cv=none; b=cCej2TD+Obf+2IgbRgqn+12EZG/5czRYaOpo72laU+oZ0BEDuUX2XCaIx5URtpJjhQPO6T1mteL5cT2ks7n8juUPH8BQrjyWVHwfoilmaFsIf86xH2DcQDXKETUVchcI7WdRt1gwA6btceqRJGVKYBQZ5dHLIm7galgIvi8Gu3e5lJFAg46SDiNI8rKoeDw2Tud7e9SKUeg4a3LTHy5pUcfOq7Iivp0xYFmmLNGUwTn/t5H2NfffIkRXlr+B3YnBL8NmvflYMNVw/QXytFOBj+04S5553StDX9sZzfqpulfwB9vp3obg4UtJ9c3zgxTE3Al74eXF8ahugt5/nlvjMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772610565; c=relaxed/relaxed;
	bh=xrvMf4BjnIv//172y2WecCl7fldL66GRRhNCP6ISZdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VURjzusU1wQisRlpQdaBWE12yZD3hDKDYjsNx/SmM0aNK0USynw7nF46tbqM+UD35WkwmS8YoWXfVg8p77feE4vIiWyYaUVkqm5N0J7eps0s8UNLL9JPHy9FpwfH7S93quQ3+gq+7vEEOngLyeK9pgK2LvGLHxc1XmO+1OTEGRE86QR+VZx9yvCYWz/gezsugbrHIhR1ftgl0SmrxyZAIBOrd/cXB6HyUMO5k1sPeIpXySDtFL2mF/NIY/oTs7uHMl4sktFpFSV5Gnmpz5xKd1fYpC2HA40jzziIEA1aF3bRrIj/LPiPoMNCL2gZ00frTXN8ozBusI6dOhw4xUV36Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OmDeB3oP; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=k8PrD8t7; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OmDeB3oP;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=k8PrD8t7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQlDg4K1zz3cLN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 18:49:23 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772610557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xrvMf4BjnIv//172y2WecCl7fldL66GRRhNCP6ISZdo=;
	b=OmDeB3oPYRqS5Pds7LbSMZ82z5frdg/XBQr1OuitHsxauAKnO0Asp7iGdeQHnWpQo09vNP
	VSo8C6kb2RH3nrWz+XMH1T5TRA2O8nhM/jpjjplbzXVBCEcKjnCp7diG7MCLobQgHX9nMv
	M9kaZ5phOwVn+feyIaEtnqQiTrqu91jmsLQh+MJYs25cWo89uKRz+EfCE0ENlYVdaGWwom
	zWd2/fTjiBDv9Mb0sCCd20zl3Y9fodE5Jk/7Hu2HlPI9/OuedL8wxcthP4ZIG65DC8j9jI
	VnY1wk78wDFRq8fD278zyQq3GfUSl/1/Z1CAGyG2F4iydw8vZ4dtk2U0ZWtncQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772610557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xrvMf4BjnIv//172y2WecCl7fldL66GRRhNCP6ISZdo=;
	b=k8PrD8t7g4T9k1RbBkh+Gnw7tCdz66nLTMnYXtHRhF2IfQiCW8DWn0M/h8FqtwF1XbPrwm
	OG2YGiSsNZrmK9BQ==
Date: Wed, 04 Mar 2026 08:49:09 +0100
Subject: [PATCH v6 12/14] sparc64: vdso2c: Remove symbol handling
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
Message-Id: <20260304-vdso-sparc64-generic-2-v6-12-d8eb3b0e1410@linutronix.de>
References: <20260304-vdso-sparc64-generic-2-v6-0-d8eb3b0e1410@linutronix.de>
In-Reply-To: <20260304-vdso-sparc64-generic-2-v6-0-d8eb3b0e1410@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, 
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
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Shannon Nelson <sln@onemain.com>, 
 Thomas Gleixner <tglx@kernel.org>, Christophe Leroy <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772610551; l=3471;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=vTsakCNMBP/JiyfE0maBlhTpSxLjbgld8L67EO/FYRQ=;
 b=9PH21cG/2X7E36c9qqHa3P/RKp9TuaG7thghoGZ47u6BX1YvcxI9ljMPlO+FV011JY+WVRBkm
 s6355TnoXWrDzDbxAtEYnvtDiRoMscz/tSTcu8S47SoCwTDr2Fia2cR
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: BA2771FBE8A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-17678-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:luto@kernel.org,m:vincenzo.frascino@arm.com,m:arnd@arndb.de,m:davem@davemloft.net,m:andreas@gaisler.com,m:nick.alcock@oracle.com,m:jstultz@google.com,m:sboyd@kernel.org,m:glaubitz@physik.fu-berlin.de,m:shuah@kernel.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:tytso@mit.edu,m:Jason@zx2c4.com,m:linux@armlinux.org.uk,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:tsbogend@alpha.franken.de,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:sln@onemain.com,m:tglx@kernel.org,m:chleroy@kernel.org,m:linux-kernel@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,m:linux-s390@vger.kernel.org,m:thomas.weissschuh@linutronix.de,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[thomas.weissschuh@linutronix.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,davemloft.net,gaisler.com,oracle.com,google.com,physik.fu-berlin.de,mit.edu,zx2c4.com,armlinux.org.uk,linux.ibm.com,ellerman.id.au,gmail.com,xen0n.name,alpha.franken.de,onemain.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:dkim,linutronix.de:email,linutronix.de:mid,gaisler.com:email,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

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
index 70b14a436fe2..e5c61214a0e2 100644
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
index ba0794659eb5..bad6a0593f4c 100644
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
2.53.0


