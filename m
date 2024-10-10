Return-Path: <linuxppc-dev+bounces-1974-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B78C6998C0F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 17:45:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPYwq3Tryz3bjb;
	Fri, 11 Oct 2024 02:44:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728575099;
	cv=none; b=Od9qbGFwbhwRPfLnqlb81z6eMfAjscHwaFC0SiP2uPByT2SAdy7ZGNc+F9uhGnFrwNmJBTPjdBj2EUNkp18PxeEG34AbxHF62fxvCPMAIdLY91yxnqu1lnufH1MRhQNqRnL+9keic7fohQUlMlprK/5DiXbChYn6xusyC2jwR4doQOVOHFt3l0lRgnXQM/lcmm/YuwJKj0ljW+CUhdkNtrS143GX/+ww4vg/qv5OyMivWDIBAdXRCt+6ATNfvJcf6FDWPkWOkVc8veuM8AnGbjLJCsPhXpWwHQ95YLwim6QINrzaalWTyLaJD/FfLNGZdbhOKLmOkhcX0YtOJqt/jA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728575099; c=relaxed/relaxed;
	bh=c4vUnVSJS3DTEb//Gs9BVFoP2u0LwPRGtOqbRqRypbM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XZIPKB6Xbv7ibZ1X6z+MtR6OBN3Dy7M7BmI7bMMtam22+Qae4jARqfEfcY1Nusk+Xqa6rDpRVI/3o4t6k6YGh2wz5UOSLJAHlA0Beq5yDYyJiYF5bRJjfF/YzT7YjGVUsTl9tprZtPgiXpyQDfJEyGuWLBdyLEk7gSIPU+vUBQ05oYBNuVSewnRhlzb/6sGSrtPTRIcW2hE7lBOqQrItOiNaNPRuOFfAeewdzIAzA0JSbNrifLBHbmyrh2PDMRAdIatE5Vmly6LyrZVGNo5uQUdQEMouUWB2qn4j9I0po0ZHZBtLIXMvPms37n7KiJQEGkJ3+ZIgNusNpEIyIx7ADw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=sIOYAh5N; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=g1Dc/Dss; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=sIOYAh5N;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=g1Dc/Dss;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPYwp0FV8z3bh2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 02:44:57 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728575093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c4vUnVSJS3DTEb//Gs9BVFoP2u0LwPRGtOqbRqRypbM=;
	b=sIOYAh5NzXO0FOxy5po1A3r9yhCcksujDF8lsizoipoumMt6VTgm2JcDvV6NwBbBMlbGJx
	Kn3LsdIJhEXc0rrXzy1MHxdrkMCWzbNbsg/turOZ6YbjPY3cq/Z+/Rf5iw3YzOZMJeAms+
	inOaqTMkyaJMfzMgx/DJqFoi0ZOImxKYKuwFgYChI4FLMHyE92T9iHRhmVeOcca81HpsXY
	SICMUvoJ2A9p9IUe0zweJ/8yzVc1dttU98/chnLvx+HSrwdY6nP6BSkjfsst/rkXt3kHEE
	9PFuJfMyufxQ26tfvzuwUAoQ6Ij6qCeHRXQT6o52lhnqEbynfzhVl/yRhZ0Szg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728575093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c4vUnVSJS3DTEb//Gs9BVFoP2u0LwPRGtOqbRqRypbM=;
	b=g1Dc/DssNf7HgFLP/aKNzFqQAI+fIyoQsY+40NP2OIH2OwKugLREQbaHbQ8liXUdTYoZ2A
	mIWRh2bOk4Agl8Dw==
Date: Thu, 10 Oct 2024 17:44:45 +0200
Subject: [PATCH 2/9] arm: vdso: Remove timekeeper includes
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
Message-Id: <20241010-vdso-generic-arch_update_vsyscall-v1-2-7fe5a3ea4382@linutronix.de>
References: <20241010-vdso-generic-arch_update_vsyscall-v1-0-7fe5a3ea4382@linutronix.de>
In-Reply-To: <20241010-vdso-generic-arch_update_vsyscall-v1-0-7fe5a3ea4382@linutronix.de>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-s390@vger.kernel.org, loongarch@lists.linux.dev, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728575090; l=1591;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=UwiQqNt43HWSbVEJA12ycEovjhf8yvNhZRUab1vZ6TI=;
 b=3nrK8ribXR6CLoOX+9blmTN0WotnLlJVbn0mBaFSX/u7EyGlJSmB7anjWYMlRkqPO1MDPqqek
 2+m9ZLARYeaC+jFTNzFUSsmzlNKktBc4+BBRN++ne/SFR7a3xWCy7w4
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Since the generic VDSO clock mode storage is used, this header file is
unused and can be removed.

This avoids including a non-VDSO header while building the VDSO,
which can lead to compilation errors.

Also drop the comment which is out of date and in the wrong place.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm/include/asm/vdso/vsyscall.h | 4 ----
 arch/arm/kernel/vdso.c               | 1 -
 2 files changed, 5 deletions(-)

diff --git a/arch/arm/include/asm/vdso/vsyscall.h b/arch/arm/include/asm/vdso/vsyscall.h
index 47e41ae8ccd0b997b54dda59abea8ae98bbe3c56..705414710dcdbfa9a97c344806bd079c08368801 100644
--- a/arch/arm/include/asm/vdso/vsyscall.h
+++ b/arch/arm/include/asm/vdso/vsyscall.h
@@ -4,16 +4,12 @@
 
 #ifndef __ASSEMBLY__
 
-#include <linux/timekeeper_internal.h>
 #include <vdso/datapage.h>
 #include <asm/cacheflush.h>
 
 extern struct vdso_data *vdso_data;
 extern bool cntvct_ok;
 
-/*
- * Update the vDSO data page to keep in sync with kernel timekeeping.
- */
 static __always_inline
 struct vdso_data *__arm_get_k_vdso_data(void)
 {
diff --git a/arch/arm/kernel/vdso.c b/arch/arm/kernel/vdso.c
index d499ad461b004b05e1f0f13cbedad71b587f8478..29dd2f3c62fec64c7f290468421bfad1e739c667 100644
--- a/arch/arm/kernel/vdso.c
+++ b/arch/arm/kernel/vdso.c
@@ -14,7 +14,6 @@
 #include <linux/of.h>
 #include <linux/printk.h>
 #include <linux/slab.h>
-#include <linux/timekeeper_internal.h>
 #include <linux/vmalloc.h>
 #include <asm/arch_timer.h>
 #include <asm/barrier.h>

-- 
2.47.0


