Return-Path: <linuxppc-dev+bounces-1926-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4649997E23
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 09:02:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPLKZ56D1z3blk;
	Thu, 10 Oct 2024 18:02:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728543730;
	cv=none; b=aT3IcrtgfzlRoiIyV6oUAcr5td8sLQXttCG4wdkVDcpiaUG1GkwUr7eJQhygCDPSVXvHtqdYNCJwWn6EpS2bfpee52Xj5DFjOgciD12Hh/jBCTwZGBHlEG6lGlM2fz8wKWnzNeLdKbYK0kryaitbFs5YWwfkrDB4p7tlazXXUnsKRZjvLeX3DKZIxqPg7dFZIXaxsiHb+dC2BLmfc6cRboPP5GkMBNqYB+qgNVvZb82sPywwHaIp9/tcVcPgoc5zWkOSnY/vTKrC7wcG07SGI7IG0Wc/A3jLq0iRK+buke9iolKroYDLy8X6gq2Ls46NKLs0uolduSS+vcmfM0Cwkw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728543730; c=relaxed/relaxed;
	bh=PTaWPH0GsoC/f/xHFuh5G2lj04S9r5qi58p+jYQJPbk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EjHr80IMCtVZ09PmzN9a1cz5oHx01caF0ssIj2sN98q40i16uPmWmFT9lSOD2YFcvbdkS5xXAXo54eFapbNWUCm4OpWawl7iQ6cInvGMqGXNV2YFrhTmdWd9B/tLh89sWblhYaRE2P57dnQvsp6SWsEh/YTJcCMQulmdNI8U+4dmDagaxBfT1bwyIUncQn8L09Gghsg69+GZxPoS8LghXZH55r5WbMjzRCcuezhpm3oRHPtgvkcOlEn69+7ORLylzDUuuL1tLdIROUslX/EFxuPcrx9l8lrF9pxZJej5LYD+lzHX+kfMe9KyoZtQ6ycuLrMa0PVutWYbwVTUE9laXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=lTa7tpZP; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=/CAqjPr6; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=lTa7tpZP;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=/CAqjPr6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPLKX40L0z3bn4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 18:02:08 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PTaWPH0GsoC/f/xHFuh5G2lj04S9r5qi58p+jYQJPbk=;
	b=lTa7tpZPSMpYqBOTXcrRlaMExCnwkTH8H6hYeS3O+dLE/v1NII2D+NfhOrHIM/HjIOvpKb
	iEjMp5s35jvJ1C4i20pMv9eIftSeqdclfqgPGFKkr5ZBz18rM6WABeHbt9yiQ9AqlEnxB7
	cOL0uzuhW7R/2qz2vnSxj8qEdmiqiCSsllD8wq48lRHWoat4L3iQIcath9RHzcvDXo7mjh
	BcCUk8KDuyaeuMnv+LdLXC0kSp+eoC1/f1Ti3YZNb2ryOJ2A1BebUstcmNJVT/sFAx+eyA
	gjJVwe9Jfig5ovQyz3D9CMKNH5QprqbdDcOdMMVExYTTXiJSBoTqKNoxJVsWCw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PTaWPH0GsoC/f/xHFuh5G2lj04S9r5qi58p+jYQJPbk=;
	b=/CAqjPr6rxtw1rBkGjYlFRS7wVbrerb1tE7vy4nq86qESK/0YxyCNEBt22Mml7Xgziyxv2
	FQKOjqD3bM9qTdBg==
Date: Thu, 10 Oct 2024 09:01:05 +0200
Subject: [PATCH 03/28] s390/vdso: Drop LBASE_VDSO
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241010-vdso-generic-base-v1-3-b64f0842d512@linutronix.de>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
In-Reply-To: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
To: Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Russell King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=1973;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=M1UHCDZZZ5fXWxxT1qvNaxpIVftl+fGBVImNfA2mkLk=;
 b=hG1gakiEm8cjk7VRIpvdmQlN9QnPXDvcOtIcU7k1TMbtC8u2E2IXfzi6S1RfiCNX3R9MIKgXJ
 cPnWnTEKA5CC4LuIt9YAXlYWgz716XqXk1/Gb4r134/tWzKtZxY7Eb7
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This constant is always "0", providing no value and making the logic
harder to understand.
Also prepare for a consolidation of the vdso linkerscript logic by
aligning it with other architectures.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/s390/include/asm/vdso.h         | 3 ---
 arch/s390/kernel/vdso32/vdso32.lds.S | 2 +-
 arch/s390/kernel/vdso64/vdso64.lds.S | 2 +-
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/s390/include/asm/vdso.h b/arch/s390/include/asm/vdso.h
index 91061f0279be4521a2b5470bcf8de6780b7d6806..92c73e4d97a93a90cb640d44fca9856f93e0be14 100644
--- a/arch/s390/include/asm/vdso.h
+++ b/arch/s390/include/asm/vdso.h
@@ -12,9 +12,6 @@ int vdso_getcpu_init(void);
 
 #endif /* __ASSEMBLY__ */
 
-/* Default link address for the vDSO */
-#define VDSO_LBASE	0
-
 #define __VVAR_PAGES	2
 
 #define VDSO_VERSION_STRING	LINUX_2.6.29
diff --git a/arch/s390/kernel/vdso32/vdso32.lds.S b/arch/s390/kernel/vdso32/vdso32.lds.S
index 65b9513a5a0ee2a7e3508a1d919f826c4b4184ca..c916c4f73f766ebcc9328b189e46015e67393b0d 100644
--- a/arch/s390/kernel/vdso32/vdso32.lds.S
+++ b/arch/s390/kernel/vdso32/vdso32.lds.S
@@ -16,7 +16,7 @@ SECTIONS
 #ifdef CONFIG_TIME_NS
 	PROVIDE(_timens_data = _vdso_data + PAGE_SIZE);
 #endif
-	. = VDSO_LBASE + SIZEOF_HEADERS;
+	. = SIZEOF_HEADERS;
 
 	.hash		: { *(.hash) }			:text
 	.gnu.hash	: { *(.gnu.hash) }
diff --git a/arch/s390/kernel/vdso64/vdso64.lds.S b/arch/s390/kernel/vdso64/vdso64.lds.S
index 753040a4b5ab271c432d4abcaa04d69a88d54b17..ec42b7d9cb53094b783c6b0492962af7e5027831 100644
--- a/arch/s390/kernel/vdso64/vdso64.lds.S
+++ b/arch/s390/kernel/vdso64/vdso64.lds.S
@@ -18,7 +18,7 @@ SECTIONS
 #ifdef CONFIG_TIME_NS
 	PROVIDE(_timens_data = _vdso_data + PAGE_SIZE);
 #endif
-	. = VDSO_LBASE + SIZEOF_HEADERS;
+	. = SIZEOF_HEADERS;
 
 	.hash		: { *(.hash) }			:text
 	.gnu.hash	: { *(.gnu.hash) }

-- 
2.47.0


