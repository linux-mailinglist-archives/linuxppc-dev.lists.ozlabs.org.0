Return-Path: <linuxppc-dev+bounces-1927-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2242F997E2B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 09:02:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPLKb0XMPz3bpJ;
	Thu, 10 Oct 2024 18:02:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728543731;
	cv=none; b=lanOXMNkVFP5HWEPAjxmErKg4Hc0vuzMsyNBMpF104MxkOHVc4rPunoYJfnXGMiiBkfMvXQWLTjqVUMFeABaWNZsaFuKUHXOnT0PvnsUNMCgAz3VYnmp/37CPNT4nq20p5/nHTRCsTSidmcu2S2Z/DYGTWEal9EvAaTp48xxZYGC/g0cTl/vsaH7A+pXJY4vePVQD70uJaNwGyOpsextzLgg3BEx0YyNB4rmgSdcUsnvAQyrPRJ67yroBlGfSjD7kJKyNS8OBcjM6W6Z+5bOwJIsiX2pCu4kZaJfS1qMtxiHaAA8kcQnT4SacJv8V5ignncgSC1+Vshpsg6h/DxGCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728543731; c=relaxed/relaxed;
	bh=ss7tdeW7PchzSqqaQvkxVTIKlW4rJNWH4B0dpyhMHfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MZ2HURRaLfDvwu/elvP/Ol/EC9q7ypzZgYCdJ6nUL/8nXC9ZrlBYeXlabmhL94BbLWH66Q6ufqYmrLUdqtM42FOngJsLrXZEtecxav/LFd19qtCjeLCUmAIScTl5ZnSaJ57KLYr2nkdxrHAfu9tvpoT725hqKfCPan+YSdUxVkdXaxsM5XflosfI7pj66qwSgksTdsLW/a5V4nRx06qxTWIr/udIMhjuhC+v6mu0auB2FC0nBYQa3r0q8HXGACkk4w14UqFxl6Ckubrb+ilUWjd0PAIM48f6ozQ0kCbE3ig4qBDsJ1RqFa88m/jcmAv2q8YWZKg0aY2utJ4P7VUh7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=kr0cxFj0; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Syd5BM2c; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=kr0cxFj0;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Syd5BM2c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPLKX436vz3bn9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 18:02:08 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ss7tdeW7PchzSqqaQvkxVTIKlW4rJNWH4B0dpyhMHfI=;
	b=kr0cxFj0gVSlMEE3fBkkaHeRSHUxueF9GFnuHyT8EoBrw5kM8z9A7vT7mHfaziowOHgko4
	emX0mO/Zcc6sAED1W8Q87MyLJ11VijeN3B41A73XSWNkjcjJ0zgFQU7D/4DH84wL07nojO
	+imFEsO8ptFPG62YvSNncYQJr+PMMPl/MlFT0G3GUHSWOc3xOcywW0dwwg21GaR5KbSc8/
	vouWYr8IZE13AcoN9V2+dsL1nR0HrrutlYI31CL28a3RcnoSFcMRJR4cYsbWKscZ0Jn3uu
	f13Da8Zj3tRcomPwpty86r2jmKQt1qRpgQtnGal2/nOn0xwuZzMTEaC0/M3thQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ss7tdeW7PchzSqqaQvkxVTIKlW4rJNWH4B0dpyhMHfI=;
	b=Syd5BM2cviXiq6R6Wad9Ulx87EPU2BhSVsgW+gBdV26KBptPbi9XoZM+1Ol+mh8u6Q5tH5
	SwnQrnYbe0DilLCg==
Date: Thu, 10 Oct 2024 09:01:06 +0200
Subject: [PATCH 04/28] arm64: vdso: Drop LBASE_VDSO
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
Message-Id: <20241010-vdso-generic-base-v1-4-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=2310;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=1izBRdFKuR8SiZvLAToZn5vA+gLSTJVX1IAtToMcJlk=;
 b=K3gDGZbsUbGnSEnKjQUn89/rq77MzDDW7/mmzjdHk4rROyRkipKRHf5H1neQZFJ9cgZDkviiF
 x2koXkmvm96DlweT1cv/Qb4IsOdhG841Mya56Frd3qzwTmxH5fdKJKa
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
 arch/arm64/include/asm/vdso.h       | 9 +--------
 arch/arm64/kernel/vdso/vdso.lds.S   | 2 +-
 arch/arm64/kernel/vdso32/vdso.lds.S | 2 +-
 3 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/vdso.h b/arch/arm64/include/asm/vdso.h
index 4305995c8f82f416e6ce11280ac1dd19fbe25eec..3e3c3fdb184274abd20647335b19e81e709506db 100644
--- a/arch/arm64/include/asm/vdso.h
+++ b/arch/arm64/include/asm/vdso.h
@@ -5,13 +5,6 @@
 #ifndef __ASM_VDSO_H
 #define __ASM_VDSO_H
 
-/*
- * Default link address for the vDSO.
- * Since we randomise the VDSO mapping, there's little point in trying
- * to prelink this.
- */
-#define VDSO_LBASE	0x0
-
 #define __VVAR_PAGES    2
 
 #ifndef __ASSEMBLY__
@@ -20,7 +13,7 @@
 
 #define VDSO_SYMBOL(base, name)						   \
 ({									   \
-	(void *)(vdso_offset_##name - VDSO_LBASE + (unsigned long)(base)); \
+	(void *)(vdso_offset_##name + (unsigned long)(base)); \
 })
 
 extern char vdso_start[], vdso_end[];
diff --git a/arch/arm64/kernel/vdso/vdso.lds.S b/arch/arm64/kernel/vdso/vdso.lds.S
index f204a9ddc83359fcbe87f24171389bb64e7adceb..4ec32e86a8da22d5e2315e55ae2e86ec8e7f5f9a 100644
--- a/arch/arm64/kernel/vdso/vdso.lds.S
+++ b/arch/arm64/kernel/vdso/vdso.lds.S
@@ -25,7 +25,7 @@ SECTIONS
 #ifdef CONFIG_TIME_NS
 	PROVIDE(_timens_data = _vdso_data + PAGE_SIZE);
 #endif
-	. = VDSO_LBASE + SIZEOF_HEADERS;
+	. = SIZEOF_HEADERS;
 
 	.hash		: { *(.hash) }			:text
 	.gnu.hash	: { *(.gnu.hash) }
diff --git a/arch/arm64/kernel/vdso32/vdso.lds.S b/arch/arm64/kernel/vdso32/vdso.lds.S
index 8d95d7d35057d27835dcd0643bb6a40adfcd8d5b..732702a187e9e8b62972ee0aad75c23568e5e779 100644
--- a/arch/arm64/kernel/vdso32/vdso.lds.S
+++ b/arch/arm64/kernel/vdso32/vdso.lds.S
@@ -22,7 +22,7 @@ SECTIONS
 #ifdef CONFIG_TIME_NS
 	PROVIDE_HIDDEN(_timens_data = _vdso_data + PAGE_SIZE);
 #endif
-	. = VDSO_LBASE + SIZEOF_HEADERS;
+	. = SIZEOF_HEADERS;
 
 	.hash		: { *(.hash) }			:text
 	.gnu.hash	: { *(.gnu.hash) }

-- 
2.47.0


