Return-Path: <linuxppc-dev+bounces-1977-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C89998C14
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 17:45:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPYwv11QXz3blF;
	Fri, 11 Oct 2024 02:45:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728575103;
	cv=none; b=KmBnXTdNF9RHd88rkvtOEg8AP4qtA1kJUVP68FMM47PC2hJBfT8vKsXtY/9N97rML/itTBG8R/tZvVTcRGood1nDrfytCjCWWpIVNF5RmfNI69NDN6S2vUGy584pi2CEQR3aYSmkCmJx6JBKqZmI/Bid8Cg3hz/EF4tTrx0YvzhMBYbnpsXqnvHtgZNt8n7vP2ulhd8pmwmacfMaUhP8XvydaZtLuLE8G+ut8BrV3KlR356GgiU7/kwiwpMRORo/KL28BJI18/eLyUjRT5fj2kth6aGNykAeHjQlxPwRogZsMag2rn3mxyr+Rzo9A+yObJSJVU4t8dbKtWfXYjTcRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728575103; c=relaxed/relaxed;
	bh=bsHx7qJCDp7IdV2H4CgXW4RKtdZIxmt6s+IvFtPbyqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iWMMpPDY7QUSpboDMhsX8KX57s5RITeAaXJ3SKCIiHCis79U7QVWnrZ4csO4ZlfCV11tTHQdx3vTVs/O3h+pLcfNL/T1CEabyNwXD0MHEZ9h1x1XXOYFX9jdbCCHZgpt2xsq3559odOc6bK/1JtgOTaiVOuS7yO8xbbKcdS+RLrPjAABXpNIDleLN482rLKjTjnjZQPkdcwCxGkGSbH7BP879bKscmhwqvYU65WIx/Q5lo7AmF2juk2r4TVemTHOdUZpPOXzgaCe6a7bju+gXD7ZYTvbnevadEEPjtS3ry8mnO7cALLUnlHhpsNwgjiVsFtGrNIJSDS8AM2DSVbLWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=bVQLUC+r; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ADrtVXTW; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=bVQLUC+r;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ADrtVXTW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPYws4czXz2yfj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 02:45:01 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728575097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bsHx7qJCDp7IdV2H4CgXW4RKtdZIxmt6s+IvFtPbyqE=;
	b=bVQLUC+r0/Au47mrhMwXmYQ+ioZC+OFZQoOvliDU2YgPow76zr+3eWl1iXeXQZhzkvNZwd
	UPK06iM4TS7Qe1ogctAebisMoKyIvigMYwSGOVq3hBhS+c3bXWK+uBCOuqQ3kLjeewA8ZS
	rG14+VvgJM++oRIVOFyJ1jrq0nT0z3kaIg0GDV4oUwtHOb/VqEoBbznA5eepHjJtLa1yf6
	9oKUQg/C8OKSYEgCQUiyTZtCgq7vPnxrSjfCAyGhhyBbLa1JgDepmxG5SESflfsr4pcJ6d
	pGuJ1uewacreeZPZeLE8L8lTrYk04CiMrZhWKPhuKfdG2bkocEltbQ1y3tONtQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728575097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bsHx7qJCDp7IdV2H4CgXW4RKtdZIxmt6s+IvFtPbyqE=;
	b=ADrtVXTWURzZeYoLbH3CWO9mOnOqpADEsBH88QoqujF+oRUQAYvxREHZ8T5z5ujVWPMrLX
	COBQkfx97HO/rACA==
Date: Thu, 10 Oct 2024 17:44:51 +0200
Subject: [PATCH 8/9] LoongArch: vdso: Remove timekeeper includes
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
Message-Id: <20241010-vdso-generic-arch_update_vsyscall-v1-8-7fe5a3ea4382@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728575090; l=1624;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=pLcSqgwzYZzBo43HvSx25Hsn5bLBJRfRGzhKUgfQZe0=;
 b=/+Ru4UIGFSWAYpglbGdQQ15IMR8PhPL5bPtGdy6DloWXB62UlxGU7KiFw9ja3fuJKbpuMnDZH
 Naozzxi/MEKCfguA2aYMFMxjwK8iC8KaCHVKnYuHz2d+3fK6HZI8guE
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
 arch/loongarch/include/asm/vdso/vsyscall.h | 4 ----
 arch/loongarch/kernel/vdso.c               | 1 -
 2 files changed, 5 deletions(-)

diff --git a/arch/loongarch/include/asm/vdso/vsyscall.h b/arch/loongarch/include/asm/vdso/vsyscall.h
index b1273ce6f140691ae8104b2be3d1203ebc57fac2..8987e951d0a93c34ca75de676fb9c191ff4ef3c2 100644
--- a/arch/loongarch/include/asm/vdso/vsyscall.h
+++ b/arch/loongarch/include/asm/vdso/vsyscall.h
@@ -4,15 +4,11 @@
 
 #ifndef __ASSEMBLY__
 
-#include <linux/timekeeper_internal.h>
 #include <vdso/datapage.h>
 
 extern struct vdso_data *vdso_data;
 extern struct vdso_rng_data *vdso_rng_data;
 
-/*
- * Update the vDSO data page to keep in sync with kernel timekeeping.
- */
 static __always_inline
 struct vdso_data *__loongarch_get_k_vdso_data(void)
 {
diff --git a/arch/loongarch/kernel/vdso.c b/arch/loongarch/kernel/vdso.c
index f6fcc52aefae0043e307327b8e7a5872fad0822a..4d7cb9425dc34584dd7abdb80a784a4f2932e1b7 100644
--- a/arch/loongarch/kernel/vdso.c
+++ b/arch/loongarch/kernel/vdso.c
@@ -15,7 +15,6 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/time_namespace.h>
-#include <linux/timekeeper_internal.h>
 
 #include <asm/page.h>
 #include <asm/vdso.h>

-- 
2.47.0


