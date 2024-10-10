Return-Path: <linuxppc-dev+bounces-1981-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E68998C28
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 17:46:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPYwy5fDTz3blp;
	Fri, 11 Oct 2024 02:45:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728575106;
	cv=none; b=ObMtI3oaXvgo1S+Kdll+uBthYdQiZjcmi+DspZleJzq6OXwpGzxF9gSKQWpBFUoDtgXeYnTWmdGBm92qmA7nhnVf6Wpf2D3DEH40k2flOOMhJFtmrp10u9JQOjfP95PsARVipJtag3cdExiX4WuHk+WCPni17pPPyYlmEOg3xuy/5O3gsb9vPjsiBEn8D9zPB9OTEdMIYhy4+NyRCu7w8Qb/44VFLBYAG5sX3SUwC8Aa0hGmfH63lt9SB/2yoWcyOqAJDAydYzohEr1TdJt3X2KbWKhsP9+kiOmBFnPW5Whhj5TooOaT1I1Eh7S1qtz4lqlQwB2jvsrA8dpRNQJI7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728575106; c=relaxed/relaxed;
	bh=U/XG6DQ3PsHd/P8r1A05s25oqNbuRg7CSOZvJqQ2RQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S8eTc6A5CGEiv0H9roXzqv8hQ61mcN51n/Ke2ofzt/5vW97GXb1jkOlS0oZCBZBHFSpTFAVbTaf77TauzyMQJ95eX+CiuHVLXKY+gKLPAGiwdCc9EE7CEf5T6BW991/pwqd9C1pKODro/Erar4oHVtn0xi+FWebwMDAf626Vw3VPUy2pmbcZYpfo0TORJglNsN0aPhxrhw6rkZOahojkR+A9sDgnhHp4W3PfgbwJAtfQcA3w+7pwi4wqtrHHMm3MB6lme21zli2XpAGxpCEgCBrVX7g739nEFdduEUFTDE5WKnYWtbyeoc+yeQnWnu6sdS5cjhY+H7IryHmuxMmXGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=dpPnWgCG; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=yPC6uHm4; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=dpPnWgCG;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=yPC6uHm4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPYww4Wdfz3blv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 02:45:04 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728575094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U/XG6DQ3PsHd/P8r1A05s25oqNbuRg7CSOZvJqQ2RQY=;
	b=dpPnWgCGSIyojR8YOPIODHalfROtG8LEH56sRq5mxfbjyLOjCbAUcmwaMEXu2cZKvV/k45
	TqCsVhu9RjkkmSOOJHJuqXZYoGPFsnkOmbDlhYNvgEwJazOCAwr7sFuf/q/XCr4AxLc7LI
	dGsxxC8lKbH5MGgIEHmr9FLo/VCp+48X0ADki3jRqZ/GrQ8GTJ5MvsMbi/3zfKTl9GhNeF
	/N7gQZM/KxB9RCxX8j9UYsUadv+fsFOCt06p+0Ld11JPrc7spDgGOZClIoMnEmkNtFpvTn
	qiejVdTPUtzvFiteYKw1WjMoVONiwOUIOPbvghvXF0iSUCKHrMeOEpRwaBMY/A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728575094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U/XG6DQ3PsHd/P8r1A05s25oqNbuRg7CSOZvJqQ2RQY=;
	b=yPC6uHm4/dZnVaE4EHlAEdw716wEYkItVZ5dtEr3RPr0fP8aCnTfCm4qYZzbKZLqlRrUy4
	YQ6+oBRsFvnQKADA==
Date: Thu, 10 Oct 2024 17:44:46 +0200
Subject: [PATCH 3/9] arm64: vdso: Remove timekeeper include
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
Message-Id: <20241010-vdso-generic-arch_update_vsyscall-v1-3-7fe5a3ea4382@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728575090; l=720;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=bvh1jJWpx42LXX2Lx1XPkC92g2mUzF72aNPhVvbLrZk=;
 b=YGgVa8cvZKIl5iidwiNogphb+kk0LhZ+d6YHOWerWO8c9r/x3PAzZfBvmQFoMG57QQRIjERP8
 AcrvpsLRlIwDMa7tDFUUIPvzlus1/YLClhqc8iu++BgbyiMoYVBpqbz
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Since the generic VDSO clock mode storage is used, this header file is
unused and can be removed.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm64/kernel/vdso.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/kernel/vdso.c b/arch/arm64/kernel/vdso.c
index 706c9c3a7a50a4574e77da296e9c83e1e2a9f5ab..8ef20c16bc482e92de8098d55000c9999b89830e 100644
--- a/arch/arm64/kernel/vdso.c
+++ b/arch/arm64/kernel/vdso.c
@@ -19,7 +19,6 @@
 #include <linux/signal.h>
 #include <linux/slab.h>
 #include <linux/time_namespace.h>
-#include <linux/timekeeper_internal.h>
 #include <linux/vmalloc.h>
 #include <vdso/datapage.h>
 #include <vdso/helpers.h>

-- 
2.47.0


