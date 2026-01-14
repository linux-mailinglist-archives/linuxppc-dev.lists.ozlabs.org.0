Return-Path: <linuxppc-dev+bounces-15701-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CACABD1D006
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 09:03:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drdrK1jrmz2yvY;
	Wed, 14 Jan 2026 19:02:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768377745;
	cv=none; b=I5xEYA0ter0v6wGBXinM1P4+Q4WuckaXyklBK9WaS7Ozj9LPkjt+rAXOqDKNlXtrIbSb0RN2rHISfGUFtXbWZtq+w/iPAw6i6lpeQhjfGmL8LEUod1ngipK4bfTeuZRrK+fJIrIlS0uhYpuRSF/c/Fs2FrBJ7A3BzrM2nNE441OKwtxrVEyKxegiyK9b79vbvHxOTcJVkE5DtauGBUa2kQWAW3Tq6PO8EwT76aQ/5MjsQ6IKTxEZ+XaaoUgKGmuBpIYHHsUBucXqCaOhcPk//S2xMu/Huq4zA67Ncfsyt3LuLN/Wp8baoJPN1Obsn2SyNpYvYGjGN+yFugWlkEMajw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768377745; c=relaxed/relaxed;
	bh=mmsBDSxMj6qH4s0iKzaJH7Nug/ggM5kSynfO5FTnCzE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OiUB/74lJfropMXFd+tmrbAXtVv10N8qE6LiXGcdAshRH4vfyE4pBEBo9nJFqedYvFqCijOk9BqDDTYKKK9UH62UBvyYJ1duNZYcJsl4GKfYE9mRFfnsd6RaB0N+XycRPEBdreMntkqnwuYJ/SJrJgAVVrB/2e2LbvoKoC0GTL0gTb2ijnyUd+3V55hph9cULW0WLf9Uu7S+z4kZ1OAt9Xg/z+32iRANwe5+zirZxdK76j+mzeBdf7GWjGs96z+Tb8+dbncb1lJN0IQ93SkVew6IZyrVmH8GSf3/9vOzDQU3HNbeDmtka5a6rQXXe0teITRGLS6bT/zaKlVtef1Y7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=RyurSBgj; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=l7qPGnGH; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=RyurSBgj;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=l7qPGnGH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drdrJ4TdNz30Lt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 19:02:24 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mmsBDSxMj6qH4s0iKzaJH7Nug/ggM5kSynfO5FTnCzE=;
	b=RyurSBgjrMnPpN/v7XuuODcctqlEwgt8J5X0gQmXLCYO95Ln2RiV8XwaF4Fl5j4YUFO4lY
	696rPN38dXLI3L0pJcq/HngYPzDxyBwDCId7f0s8Vz3OJCSNR7VJAQwgJ53kqgL6RJPpLT
	igj2jTKMkQJ/zxRZj8YAqOlQww0Nn09pf7uR1g7QREOBG9DwfFUuaEwDHXCgDlyhsmCqAV
	kNzLv/7X1Z7uuriUned/Uh6x3M/HjtJi816D/F3YuXS0Gudo4YFAHa3o06w9Ys86v3b8B4
	VYnK+lnmVkhLqnPfnBTgdofGujprEcE0bZKQik5Hig4UeljVINe2w3DOoLRRYw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mmsBDSxMj6qH4s0iKzaJH7Nug/ggM5kSynfO5FTnCzE=;
	b=l7qPGnGHXJH0KcmQmnTwm1GJP+DHUChsn0oiH4+FraC+bkq8CiTeQ47lnjYNbQgxKFN+Je
	WvEeHFxO18ry+uDA==
Date: Wed, 14 Jan 2026 09:01:47 +0100
Subject: [PATCH 15/15] random: vDSO: remove ifdeffery
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
Message-Id: <20260114-vdso-header-cleanups-v1-15-803b80ee97b4@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=2360;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=hWNS5r+nVG82qGHJBln+sFq/LMfDMjk+1mqnsZRfOv0=;
 b=K+9+vpziH6VU/E7N8SWkH0wrpo7XaNAxqoMMFZ3emFBortUZ3UoHCQj7XlPTB+KcBwqZhdmpm
 FrOM7L8+JFpBTtEhmxp8CYwqmrSKBXfUdVWxXKDsrZGp1x5kwnmKm9s
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Recent cleanups of the vDSO headers allow the unconditional inclusion of
vdso/datapage.h and the declarations it provides. This also means that
the declaration of vdso_k_rng_data is always visible and its usage does
not need to be guarded by ifdefs anymore. Instead use IS_ENABLED().

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 drivers/char/random.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index c5122ff33594..64f709fdf434 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -56,9 +56,7 @@
 #include <linux/sched/isolation.h>
 #include <crypto/chacha.h>
 #include <crypto/blake2s.h>
-#ifdef CONFIG_VDSO_GETRANDOM
 #include <vdso/datapage.h>
-#endif
 #include <asm/archrandom.h>
 #include <asm/processor.h>
 #include <asm/irq.h>
@@ -274,7 +272,7 @@ static void crng_reseed(struct work_struct *work)
 	if (next_gen == ULONG_MAX)
 		++next_gen;
 	WRITE_ONCE(base_crng.generation, next_gen);
-#ifdef CONFIG_VDSO_GETRANDOM
+
 	/* base_crng.generation's invalid value is ULONG_MAX, while
 	 * vdso_k_rng_data->generation's invalid value is 0, so add one to the
 	 * former to arrive at the latter. Use smp_store_release so that this
@@ -288,8 +286,9 @@ static void crng_reseed(struct work_struct *work)
 	 * because the vDSO side only checks whether the value changed, without
 	 * actually using or interpreting the value.
 	 */
-	smp_store_release((unsigned long *)&vdso_k_rng_data->generation, next_gen + 1);
-#endif
+	if (IS_ENABLED(CONFIG_VDSO_GETRANDOM))
+		smp_store_release((unsigned long *)&vdso_k_rng_data->generation, next_gen + 1);
+
 	if (!static_branch_likely(&crng_is_ready))
 		crng_init = CRNG_READY;
 	spin_unlock_irqrestore(&base_crng.lock, flags);
@@ -742,9 +741,8 @@ static void __cold _credit_init_bits(size_t bits)
 		if (system_dfl_wq)
 			queue_work(system_dfl_wq, &set_ready);
 		atomic_notifier_call_chain(&random_ready_notifier, 0, NULL);
-#ifdef CONFIG_VDSO_GETRANDOM
-		WRITE_ONCE(vdso_k_rng_data->is_ready, true);
-#endif
+		if (IS_ENABLED(CONFIG_VDSO_GETRANDOM))
+			WRITE_ONCE(vdso_k_rng_data->is_ready, true);
 		wake_up_interruptible(&crng_init_wait);
 		kill_fasync(&fasync, SIGIO, POLL_IN);
 		pr_notice("crng init done\n");

-- 
2.52.0


