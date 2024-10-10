Return-Path: <linuxppc-dev+bounces-1980-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 442B3998C23
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 17:45:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPYwx592nz3bmN;
	Fri, 11 Oct 2024 02:45:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728575105;
	cv=none; b=l5K05AcefuRsdNvgTI6tBK9fAsN6gXZsWKslzzRdkwGSN6fZ1hce4aNLKYTUDIn2xoS26lyaNHc2qnMHTKPkWC9fe2IH43LzUanPU/7klF9qGIrR3TpWwFRiJ++fGYK5PYNvYLVGarqB99yo4PDD4UAOSCvYeRhqvYNZ6Ux0mnNU1lKQ//FxtevPUq36OfimoPXyPwJ/CxcQEWUl/W0Oi5+KT7IUOhm4S4m+zx60LO0xGrHW8+J+DlNABsitpg8r3MnF1ECLPlDtcn68H80ghDr4yNBQamCc1aQ4svO1985MYnGPXpqyNr1wZniknhTBG4UNgjkakLSMR0bxypv4oA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728575105; c=relaxed/relaxed;
	bh=a2YqBVOHBfNFQlYc2gfs+s/qyh0QTOeEVhJlFH/p2/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L8UikwIb/pUciWwIUXv9wnzucjtF9K8U0jnj0Gs3BG2oFVrqCFCclVE3uFTCQF5nQb+4yGgdBVU9I5kSqXpEQPPwmq0wk1GNyvMSIlLPX6s6ooXyceDb5v6R3qI/xzjFPmSSLeHbsAMtTBe3oD05FpkeIORjPHFxxDOw2puicpuI2mUsusmAudrfYY99Y83FvxdDS9AvnYewHKfTJRO6/UU8WMTV3ZGVbNKwntepISSkTv+NCcg5o1jUDEuU24riPVX3v2nFj2D64Qt8YZsp3ponOnDKxNF27dmqVxqrhLCzAuHeJf219NyzRsySg0gKY6uZr0UVDIF2PQ/fPo9adg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=1OiwjVdj; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=9vMVf9Cb; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=1OiwjVdj;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=9vMVf9Cb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPYww4MXkz3blp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 02:45:04 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728575098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a2YqBVOHBfNFQlYc2gfs+s/qyh0QTOeEVhJlFH/p2/E=;
	b=1OiwjVdjrZF9JLf67Y/LK2PMnwLAF6f41w7jSmYgltcI3k2cD+n7bBb3R7AXe/M5orD3c+
	jNG47qrWfoeO74dHjhGwcCiplD51Ks4/wT8wVWFsAkjuLH8y+TdThHOIlghS0ejZ7F4aJa
	fdpD7VdAq91WotwCAmPne8F2NLFwMYZWf5cDB6bRigLRB+bdwIg6emBC7Dyzs8W7a+OKUm
	xzIv9EKcqqDk6zspMO0Spc74duaQFMTeiUOuvLkj/W4zrG6P7wdxMUk7y1gP4aWoksQl6V
	TbQmh1ZbbScffPyjmfP0nXGZR3w7Hdnc4ywqwQ0P5zuxX07uFPWXRTvgGEjLCg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728575098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a2YqBVOHBfNFQlYc2gfs+s/qyh0QTOeEVhJlFH/p2/E=;
	b=9vMVf9CbfgONWR64KkrCcVV2A6E13/KxqF+wIJ6JAeIgkdde2/u1qMBZ2EVk1IjlQezOJt
	gT4pUMl2c2fdb5AA==
Date: Thu, 10 Oct 2024 17:44:52 +0200
Subject: [PATCH 9/9] MIPS: vdso: Remove timekeeper includes
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
Message-Id: <20241010-vdso-generic-arch_update_vsyscall-v1-9-7fe5a3ea4382@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728575090; l=1279;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=/bLPps0kAlBRHgd8VurrfZ2wFo+tXRF7XdxLtwWPU+E=;
 b=70spRKqHOmT+bRC0fNPVPL3cOST7P0HmO7QAaigcg8bU87MT4d/jPV/ffmUNPS4FcH3K4ltDk
 qXWF2y4zePwCAnlPQXanKbWKEAG//thS3UqbZsh6pujUgMXZF0G2YYS
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
 arch/mips/include/asm/vdso/vsyscall.h | 1 -
 arch/mips/kernel/vdso.c               | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/mips/include/asm/vdso/vsyscall.h b/arch/mips/include/asm/vdso/vsyscall.h
index 47168aaf1eff051199cf668d584e903b1eb8a3be..a4582870aaea49ac288d62ec4fa1338a98621918 100644
--- a/arch/mips/include/asm/vdso/vsyscall.h
+++ b/arch/mips/include/asm/vdso/vsyscall.h
@@ -4,7 +4,6 @@
 
 #ifndef __ASSEMBLY__
 
-#include <linux/timekeeper_internal.h>
 #include <vdso/datapage.h>
 
 extern struct vdso_data *vdso_data;
diff --git a/arch/mips/kernel/vdso.c b/arch/mips/kernel/vdso.c
index dda36fa26307e27d3de414c811450ed912294a0e..4c8e3c0aa210476d7b8cb349b99e9a5a453aa7ce 100644
--- a/arch/mips/kernel/vdso.c
+++ b/arch/mips/kernel/vdso.c
@@ -14,7 +14,6 @@
 #include <linux/random.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
-#include <linux/timekeeper_internal.h>
 
 #include <asm/abi.h>
 #include <asm/mips-cps.h>

-- 
2.47.0


