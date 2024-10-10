Return-Path: <linuxppc-dev+bounces-1979-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EE8998C1F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 17:45:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPYwx34wsz3bmC;
	Fri, 11 Oct 2024 02:45:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728575105;
	cv=none; b=RM2hpooUaf7KHajzM9y+1jwhh0+RhYLQkxiRcD9AZNFG8jG5tbS8Tdd3cjwlylqGZ9Lr+i/rnQVPOrVF9XjdcdAFVBRByTnT5GHtPY+xAws/XANhJqH0U7qVJw4bLuN4hPBp8+hLfWrk1xR4CDCy52/kRkpUAORaNHk9Gl1xMMSlPHpsKO9Nq0TMCfBa10gWu5AAkihvke5wA4rp4PcWXiBjfsBRkpde3HsY6aFphkZKlC1OJTadztxrUM4yC63hLTPyV1E//ReGIVohy6MX7ZkhFwyWBSFbvq7BmPYs1XcrHAGH2CkPMKzZlnsYZJI/Fyg2/gVWrc8vWFef/hGGyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728575105; c=relaxed/relaxed;
	bh=DY01drBheEGVUpRb1fYSGc/wPWUSgNrxFS5OIkyqJ0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XWfniUCPsHGL1Mot7sULtbmei9YnxBEztU6xmnNaMk0HBhENd3Jkm5LwzkQtcRltmFjBqBvKdgx+9k5z2zB4VIF+tkF3xRdS6gs9M5Ol6/woZ41d834DfeRKOyjxWl8NAb3ezA5MZRLmvm9hBb4+J4zhgfBgMmLH0odd1ZRK6E227oSTXj7Vv7MNC0mvaHiz8/pg4JIWZXYNJxOCkmPXkmH8t6aS3xVsIt0nUQiiOKdXtQt1FbmbXtqNVH2U/VNDrReOU3IO1DD9Te42YM32nujcmvuLcxWYjAdu/c/LQrSg8XZDhIOc0/q9g5Kz5jTAFemWadckh29+X4ecJxe54A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JeOI7EjG; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=q3gi+112; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JeOI7EjG;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=q3gi+112;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPYww30ZGz3bl1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 02:45:04 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728575097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DY01drBheEGVUpRb1fYSGc/wPWUSgNrxFS5OIkyqJ0M=;
	b=JeOI7EjGLWzijEdDcl6Tyi4eiJ+IoscNn1jn4Vnt1OJdKL/uMl4CZVmNoWEKL26snSeCc3
	yUpTPNiE6dS+kXCtW/1yOHgifjIaoXu5PN08+QPe2MLJH6B3MorQvyU9c+IOwT3vHUg9ck
	nUlnT87H5MCm3An3Rjd6Om0ySYAyjGgy5ZEi17K9cQzhfP+zJXWKQf3QUzd4pZHVmQ/abD
	3RW6JhvsHdGE/RvnfUfZf56jVx3/uwb8LTV5bMMyjMtZ45FLSkTby93OyLEKukozI71WSX
	NwAl5c4PybYcB33UnzB7wmW8bdj9OQ78VFr+ICgepDAff+wKZqw85Zyvj49WPQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728575097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DY01drBheEGVUpRb1fYSGc/wPWUSgNrxFS5OIkyqJ0M=;
	b=q3gi+1121GrBcixQaKmeu1KvtClMIz0AoNScv5wbMLdknPGj1mZTBeK2w8VhWVCj9v64TY
	VYgJRYX28CCZ+0DQ==
Date: Thu, 10 Oct 2024 17:44:50 +0200
Subject: [PATCH 7/9] x86/vdso: Remove timekeeper include
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
Message-Id: <20241010-vdso-generic-arch_update_vsyscall-v1-7-7fe5a3ea4382@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728575090; l=816;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=l54nGxhAvHD6pY7wtN4Hu9pn70wCVvNZSe9VHdZoefM=;
 b=w5TeMa7L2fBX8rWHCW0VUcxRJmtxwVTWhqmFg4Ar7aOri6rXy8RfO9ACmyKKuOK1EBa7U50Tw
 YyJTJNACEbjDPGQDXMNIPF0R+gdo+aXllV8ZfbtgU2RaAvcg1suki3H
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Since the generic VDSO clock mode storage is used, this header file is
unused and can be removed.

This avoids including a non-VDSO header while building the VDSO,
which can lead to compilation errors.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/x86/include/asm/vdso/vsyscall.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/include/asm/vdso/vsyscall.h b/arch/x86/include/asm/vdso/vsyscall.h
index 67fedf1698b5e2b710e0504686318949c738bf29..a1f916b18400f65eb91d5ec0e3eb49b070332904 100644
--- a/arch/x86/include/asm/vdso/vsyscall.h
+++ b/arch/x86/include/asm/vdso/vsyscall.h
@@ -4,7 +4,6 @@
 
 #ifndef __ASSEMBLY__
 
-#include <linux/timekeeper_internal.h>
 #include <vdso/datapage.h>
 #include <asm/vgtod.h>
 #include <asm/vvar.h>

-- 
2.47.0


