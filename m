Return-Path: <linuxppc-dev+bounces-12819-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE528BD7A51
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Oct 2025 08:50:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cm4ZP6nYNz3cmp;
	Tue, 14 Oct 2025 17:49:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760424557;
	cv=none; b=YUZShuCYQcudKDCqDqh0XoFmstHdLnk8oDFovhjhJibwo7908NVboJ3kO+vlwsvE4bE+9cyWZmQl5yIDgxJ5qMCvHKL/PzDSbVed8utoG9392laAeU5Rog92H1opbFPyIdRgsCJIBHsR70KB974q8Fa4PGqXx7wuMfzCg4JNiMXIe18pXcNapAYRCchXu7LoT3jyqNmer1nkRJqHBFaLngdzr1K0RYBeKDV5ww4TYOfMNTlLGqRrw1J8u3BVU9EboSlGhC2L66jxnARaQK+IrXViwYNun6dP+nBamMfs1i4icER7Eo5fx6XFC3o9R9NxJh+HAn/pcqom4NUA2zZODA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760424557; c=relaxed/relaxed;
	bh=OKFAR6pTteHeDNIXFD4VW70Ndlry08cGog9KlECLSuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PMVYonRxlZ162t3T4sOqG8HK+HOrmuAZVrpIc2oWMiTN8KalGxAXbQ9GBmGns3fSMd1iVhNHBDLt75LxNubyzGfSgucuSpI5b1qqmqmb3lg3wRano8a7AsDo+jSHKkut1ms4MvrTxsYaiiIzBgZ9Q4KzY1uyOK3OZolVdhK1hGkWx7qUhQRRs3U5WhUuLxNkQqtUh0GDKJXWU1JxJLXPyqQQN5bCLuxMOF4JoKumN8NLSHDb5bdhYqGC/IKQZfJ2966iQOhbwLBk47IWU13+wm9s5GHX13nuJJNFuq/bJdgnTL7lEwzJvPX5MPpovBnxJWAeHZvrTkak4a4UwyCJOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=aVyOhzFX; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=93A0Pupj; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=aVyOhzFX;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=93A0Pupj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cm4ZP171Lz3clH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Oct 2025 17:49:17 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760424550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OKFAR6pTteHeDNIXFD4VW70Ndlry08cGog9KlECLSuA=;
	b=aVyOhzFXfn/6Sklao9CQTvk+ikFPSP4E5e/x6X5/aBK51XERII6rwWaFWRIesuf/7Ibp3c
	62Tw9JYip6pMrX0T3+URNjJGAaQBYlfmFq5pv51B2dPnOkfVxHORFeAC/e+EYmtNHlwDsr
	Sz2uirxiPJjjbaJsUKltc2Xc4W+kfvXKE15yEPbPp0Oa9lyQfH8DiHM/zWIjJg3WvtK1h7
	g+reIaFCIYAktmc8/yQ3aJyGTfOB44Z4nCNEsCCvD+EsOrOFptllWOJ82C0Ag0+5nQTGkn
	u52+hbuCIjZhi2xP5c/9Nbv9b3DxAMICkbq92UtL4FmdSgpuDVvcXV78yzPhWg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760424550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OKFAR6pTteHeDNIXFD4VW70Ndlry08cGog9KlECLSuA=;
	b=93A0PupjU1m7nesioE1Tos0VwbAOr8oarXvpNc0kvfhHfw8TFUheof84DChW+FjWzqxT5a
	/bxDRXuuXaEXQ+AA==
Date: Tue, 14 Oct 2025 08:48:53 +0200
Subject: [PATCH v4 07/35] powerpc/vdso: Explicitly include asm/cputable.h
 and asm/feature-fixups.h
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
Message-Id: <20251014-vdso-sparc64-generic-2-v4-7-e0607bf49dea@linutronix.de>
References: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
In-Reply-To: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
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
 Sven Schnelle <svens@linux.ibm.com>, 
 Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>, 
 Shannon Nelson <sln@onemain.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760424546; l=1151;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=gCxoA74I68jSl8hq9TPM97UMjmPrbJiPbnyKM8TAfkA=;
 b=ErSbWsbptiRFVQ2OuvWgIME8FbDtQqeR4bNDjcvIjX2tlqGeRUrUzaTyzk7W7+t5o6pzk/8s6
 bo01/vvS+uqAaz+1E3Td/IRTqKtYfwcyvWspCGwnull2AOGyPml55aO
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The usage of ASM_FTR_IFCLR(CPU_TR_ARCH_31) requires asm/cputable.h and
asm/feature-fixups.h. Currently these headers are included transitively,
but that transitive inclusion is about to go away.

Explicitly include the headers.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
---
 arch/powerpc/include/asm/vdso/processor.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/include/asm/vdso/processor.h b/arch/powerpc/include/asm/vdso/processor.h
index c1f3d7aaf3ee970699fa73731412137631da347b..4c6802c3a58083efc01b4759dbdaa3612903df6a 100644
--- a/arch/powerpc/include/asm/vdso/processor.h
+++ b/arch/powerpc/include/asm/vdso/processor.h
@@ -4,6 +4,9 @@
 
 #ifndef __ASSEMBLER__
 
+#include <asm/cputable.h>
+#include <asm/feature-fixups.h>
+
 /* Macros for adjusting thread priority (hardware multi-threading) */
 #ifdef CONFIG_PPC64
 #define HMT_very_low()		asm volatile("or 31, 31, 31	# very low priority")

-- 
2.51.0


