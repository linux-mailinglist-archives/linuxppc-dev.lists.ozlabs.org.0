Return-Path: <linuxppc-dev+bounces-15687-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C62FD1CFBB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 09:01:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drdqb3Vq7z2yFx;
	Wed, 14 Jan 2026 19:01:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768377707;
	cv=none; b=DQXBpeCheoNqBHlECLP/okg7af5FZABbahAFjW0+Qg9gMPEfpk09qf0mkFVHyleFTu/+OPQEmo3gn0zn0U/Yp8M0bVbX99IYZYIOY4gUuDV7V9KAqbFuwGemAZVjPsu8jf3Wx+CzyW7YQ8mpCVQEBULB4a5wFU4aQpU24NSatFB7M+mRxehKzPp1DGrKfuojz/GSr9a+QTKHH/ND3DJQdTXBPX2cw6ve6AH/r4XgmeC3cDUx6cTnOWw4lxF6y9iSOLpqoTBJE2ZkMI19Vu4eFfRFaHOpUQOF72iNKgTYacG9wEmYIX86tHB1y79CyqI4WdTn97jBzKpIbjfh56/NFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768377707; c=relaxed/relaxed;
	bh=CZ4al2SPwjZRA5ArbmTM9kL6oha9+6/vJmT8I4plK7g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tu6tHfBZxNSUdddkizW2Dg2nWtDnSwlw2IawG4p0G6uNllUGfYK04XIUCSQoKUTztovPWB9xZr8u0PBdHmL7hRij2g7XOlr05qGvfHm8oGFRGVdrZuVFhuVKIzl6xfm5WHaixNm8BCqOav1LZBu3pl5j9xR8xtDLge3QjR3V3Ci9HLfoh2L2+s2lqQx/lWKy4GjbVdIJJGeltki/H+LtB8Qr9dNa17UQtyBqnmgAhX/nJCvZd3i6yVp4OKz+LHHsJOGFLZXCD7RLI19sxcCFDmhYdm8Hap+3Kl0YZzx2vNnW9FhQNGFMLd4hSEhqHyRIZlYqFOLrmRpZS9LRLd99GA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=X2n9lkHE; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=7G3UuikP; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=X2n9lkHE;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=7G3UuikP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drdqZ618qz2xPB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 19:01:46 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CZ4al2SPwjZRA5ArbmTM9kL6oha9+6/vJmT8I4plK7g=;
	b=X2n9lkHENZ4jfYgkIQ0C0U7KDMwiB/Rg2H2tdkd9A6BbnYGQPssZLxfBLWKDTbgxIrY/ur
	oXEl5UwdXS1/q1kXweuIY6KGKTNjDO18nlwRuPS0OKxUu+p3RAcGGSSv3TZr4o/cIa8sZQ
	1qlbd3VXxwi6M2SxeEAL/T/JANsRH+WI/8qWOnJh7mZpfb2m1nkTWDObXGYA8jNPwOqLi5
	UrzMlcBaRCIoSA955H6MQOSIqIIQSolCNrUd/zWbdpxZBiuaOwc7lKqtSqcTmFgjhVLpnY
	iBiQnI2wKNG6psVu+pogvmjS6xrs9jy+uW5UChHoqypIet1/Pnd/iQIYJ/l7vQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CZ4al2SPwjZRA5ArbmTM9kL6oha9+6/vJmT8I4plK7g=;
	b=7G3UuikPqM3fOKDGIyjEvivukjlLNfUfcdUPQWvDD+A26guirPEHCHpTzVW/XT9icRpcsf
	BkLU7S3q2MMxxXCQ==
Date: Wed, 14 Jan 2026 09:01:34 +0100
Subject: [PATCH 02/15] arm64: vDSO: compat_gettimeofday: Add explicit
 includes
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
Message-Id: <20260114-vdso-header-cleanups-v1-2-803b80ee97b4@linutronix.de>
References: <20260114-vdso-header-cleanups-v1-0-803b80ee97b4@linutronix.de>
In-Reply-To: <20260114-vdso-header-cleanups-v1-0-803b80ee97b4@linutronix.de>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=920;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=8dTNv+yVf4Z8az2E9ZQfv2/XdTFEorjE3dqOlt1qLCc=;
 b=xtjZ67L1Em5phMztPWgzg+bM7UF3KsFOj9j8pFZJbq6H0oFSziF7X7lFCJyq48vPbE7jeJ7H9
 NtolTY0TjEjAce/TkjdesOrSUKjHjDD4T8aqlg3hZeamMTgUF8NYuU+
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The reference to VDSO_CLOCKMODE_ARCHTIMER requires vdso/clocksource.h and
'struct old_timespec32' requires vdso/time32.h. Currently these headers
are included transitively, but those transitive inclusions are about to go
away.

Explicitly include the headers.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm64/include/asm/vdso/compat_gettimeofday.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/include/asm/vdso/compat_gettimeofday.h b/arch/arm64/include/asm/vdso/compat_gettimeofday.h
index 0d513f924321..a03e34b572f1 100644
--- a/arch/arm64/include/asm/vdso/compat_gettimeofday.h
+++ b/arch/arm64/include/asm/vdso/compat_gettimeofday.h
@@ -7,6 +7,9 @@
 
 #ifndef __ASSEMBLER__
 
+#include <vdso/clocksource.h>
+#include <vdso/time32.h>
+
 #include <asm/barrier.h>
 #include <asm/unistd_compat_32.h>
 #include <asm/errno.h>

-- 
2.52.0


