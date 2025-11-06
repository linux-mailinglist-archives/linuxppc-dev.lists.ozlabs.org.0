Return-Path: <linuxppc-dev+bounces-13852-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1234C3A04A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 11:04:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2Hmd0cXvz3f3g;
	Thu,  6 Nov 2025 21:02:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762423344;
	cv=none; b=LlmU5hy82UUSYghzcbItNCUxArpjbzuXd7xX8IKbZRV2buEdjIbpvcMvSbFEL8GA+aA1W4V15ikGHXwyYTLXsEZsHKYEKRdB4o3N89y8CZpxnh8L91FO7o3xkeZrcU0h9a9bQQvlrVUNhquXkB++UVQHn+2JpiFJlRO7feYU8CA3SwVFwCh3cRw8cO38QjttYPgrNn/LY2WleLwHWb/+23OHBvj2BBBRYng6+AbU+3RMRSfmmgC18Tqx8IDdmXRNkA6KXaBPoLViaJYqJ/M44nXEiidq9v7cHhzfTgy+FqcAxdodyUVb3RhAYdPR7hpIpFv5BlECXMmoX5avbQbhXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762423344; c=relaxed/relaxed;
	bh=cixBlqzeA1rYEei235pjO9MOZJgcYixfO+t17HjPi8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MfychJBpc5AAAxZ9hldr6Btpv8on8+oMpXUVJ5cO3/Z4iOu4krqI1FQJK2qxgPwxnye8BxVcNsZCSL81rC9PwM+z6N/oj3ndSX1HK+TZt/ytz6dK8L3b+EE9YydyIPcV7eKTR8tsLs8bgnF7/fb2TFTZsCcJP7BfVsoOqRd+ynmren0aS6Kfb8x3gEzDiPPKLFqxAC8HtSuKE+GXwdkA9cE2u53UeqIgjqZlYEP8FgJ5fV+yGultrWkFYHpTUfF4n9AOn1+DIG8Ygy1jlsERrRNZcokJQ8yaY8gy9ReOjVNcM8dqx6XpCwr68YXndTtVyDaRH6dPq3AabewuF+4+SQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ZjdK6ta/; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=H6I/XjB9; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ZjdK6ta/;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=H6I/XjB9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4d2Hmc17JYz3f1s
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 21:02:24 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762423340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cixBlqzeA1rYEei235pjO9MOZJgcYixfO+t17HjPi8A=;
	b=ZjdK6ta/n8YYzvHEK0WHauJgsh4QmbpVm/Sx15dJXqmGL9Tv6g4v/UqBtqKmYOyEoJ7wEw
	fcnjuScSBGXqOWeutlo0dYVU18S9X2XOijC8nAux9aS6weSQshvGFhKLr3AxtshgqvHZ+n
	VZlv23w17odS0ATYJzRi4ZRQiNOtDPzGM4qrexCSp967iAxEDzqZkB9ImGV9Dcibs4mhGL
	0uJYKwuNMcju2XcHKZlFAcVW54795M2vOkmbtcuEZEzALBgsbDjXJgf+FVV+jqqkOYhG1r
	P5TsSWyzSdI9ajUl8IZZbn9rHvFUZiUTT/m/osF65S1zn/oZkS4rv5fBk/PTlA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762423340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cixBlqzeA1rYEei235pjO9MOZJgcYixfO+t17HjPi8A=;
	b=H6I/XjB9yNRprw85RtmRtDbZPIcnuU6Vs+TvVdl8mbCXa6u2VFETgx+z1hkUJuIkPtyCS3
	XLs0N6CCrGL9+XAw==
Date: Thu, 06 Nov 2025 11:02:10 +0100
Subject: [PATCH v5 17/34] random: vDSO: remove ifdeffery
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
Message-Id: <20251106-vdso-sparc64-generic-2-v5-17-97ff2b6542f7@linutronix.de>
References: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
In-Reply-To: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
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
 Sven Schnelle <svens@linux.ibm.com>, Shannon Nelson <sln@onemain.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762423327; l=2338;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=zvq1hf5MGNIYhzE4YabXwYr2K6c63l5kL3/cxd5Yi1s=;
 b=6tenBCsPcJZa6J980m/uevcOMZQcz/Zm2Udm03kgARH9LNrwTpQrKbXiW1a0BQIVpYAr+un8z
 KBChXogR04pCsWpoQvrOxnXZxzUJrDJS4yDmNx3X9u2nMHz0fPQY12t
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Ifdeffery in C source files is discouraged.

Use IS_ENABLED() instead.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
---
 drivers/char/random.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index 3860ddd9527930780d5c13cd4742fbc3c27acc42..b0b88c6f6a1afcdb770e39b7a64cb3408e33bd2c 100644
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
 		if (static_key_initialized && system_unbound_wq)
 			queue_work(system_unbound_wq, &set_ready);
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
2.51.0


