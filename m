Return-Path: <linuxppc-dev+bounces-15686-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1141DD1CFB5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 09:01:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drdqb1rLfz2xpm;
	Wed, 14 Jan 2026 19:01:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768377707;
	cv=none; b=KLi8zKQ631VvUOUnfHPM159KLDP4/zTOBiJc0Jd4MQJ5YB3W7nHF090OrbZCt0LS0zIhnyKhB6rjpCLcnyx4BbX7aRwSj9HXpdcYfl5XXl5fAe7wVhiwMSd72m5mYJoACx9s7g8nRvnVWDaEuza8kBzznR04Fxs+hrssHQEPU0ojzhNqvyVzOQFUooSr8VOUJ1iRBH1SDNw7We/anH3VKNAWMJyZmRiz9KU3EYTz3KtuG0+z3lw22C1Z6lq9UnYgkSfhNb9o7RAEhPZn2HLBa6cUhsWq9qT0V2H+tjWjlAYBNVBo556wT3tGI49IHBNs/soVvRtfBRoepfH8aJHK1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768377707; c=relaxed/relaxed;
	bh=aey3W1GcF5/kk2rrmPxnaG8WX8/5pWHilYSE2+aWcjY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aSvgq5C8J5B45G4p6rVMbqDuVFvlFC9HGK7nUu/o61H4/LFTIb/7kWwT990NvyzwpaQTNYoS0tYe/Ef5e2HPB7zEXnwUCLoOIKfU5VocQCz0EXHvPhzfJ/aV3Ey+xkIF7E5hIYaaRBmw0N4EGWlnJ8/cwrc/6TY73dfU6aJUQzzIn5VhQQKenjqCdWrlTnJOGOyT+yb6Au+abABDP9S8rv0N0srp3vsU0stQ0/JXoK1M8xYPSvrUmR4FN/dAQUC1KuBTxWpJb1waRsG8DG3SOtHFCpHHQv6XF7T5SdRCX0nscBpBG+we2nasOFEt/bAB+05VEzuqgvrgnYjffiUqKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Cjmfgcm3; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=MTKqHMuA; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Cjmfgcm3;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=MTKqHMuA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drdqZ1b4mz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 19:01:46 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aey3W1GcF5/kk2rrmPxnaG8WX8/5pWHilYSE2+aWcjY=;
	b=Cjmfgcm32JhqkCEoeaSa9m2cIcMi8btvnt3YSf8E5s//imPdGugSjw298WAFNu+zQWvhyH
	Cy3fXO4wRSLdsdNe0neZS8UQfPnxTKhfqp349re7O8SAHxyEfUntmEmXiYvUiqmnhruBNh
	4bvnrbwt1xy1/T7b+axMGi7AHRxXh7vmVO06sXGFjb0A1C6FH7dRuvAezFI1QFxnZWsKOn
	YTC3U89Aqkdrl66NZST0xt8xuv4u7pgbiM/ZRcOTp1oRJUj3Z5Bbl4NZLfm9dcFT5DAky3
	XTsG90yM3cWzTbbCT68qcNmUSCK3b6hwbVpUCTomFS2Wg8e7b32WyWLLiwMbNA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aey3W1GcF5/kk2rrmPxnaG8WX8/5pWHilYSE2+aWcjY=;
	b=MTKqHMuAYUsqIwBOH4XjiusWx952DVnyz7WgydQWEvzRnedDf/Jg+FWUTUooorWrpXWk89
	BKb4+xxeiroGAdBw==
Date: Wed, 14 Jan 2026 09:01:33 +0100
Subject: [PATCH 01/15] arm64: vDSO: gettimeofday: Explicitly include
 vdso/clocksource.h
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
Message-Id: <20260114-vdso-header-cleanups-v1-1-803b80ee97b4@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=793;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=MGIkY0CNSmg8aEEnDJvrpAOVG5mHT6sc+hCNGJPRU7Y=;
 b=X5KSM5ToYToqgQd2Uf6oIkrmBvM99b3NT57ZSfONBWJXgIK1bfM5/+g+FO9eWk6dgSUdSXSTi
 HTI2+uEr87BBN/4H1eV6/rt8WfmZKL5MYQtWQoWgId1EwNAUplCOeO7
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The reference to VDSO_CLOCKMODE_NONE requires vdso/clocksource.h. Currently
this header is included transitively, but that transitive inclusion is
about to go away.

Explicitly include the header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm64/include/asm/vdso/gettimeofday.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/include/asm/vdso/gettimeofday.h b/arch/arm64/include/asm/vdso/gettimeofday.h
index 3658a757e255..96d2eccd4995 100644
--- a/arch/arm64/include/asm/vdso/gettimeofday.h
+++ b/arch/arm64/include/asm/vdso/gettimeofday.h
@@ -9,6 +9,8 @@
 
 #ifndef __ASSEMBLER__
 
+#include <vdso/clocksource.h>
+
 #include <asm/alternative.h>
 #include <asm/arch_timer.h>
 #include <asm/barrier.h>

-- 
2.52.0


