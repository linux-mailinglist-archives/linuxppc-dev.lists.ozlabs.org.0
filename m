Return-Path: <linuxppc-dev+bounces-4997-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8497EA0954F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 16:25:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YV56N4G79z3ccN;
	Sat, 11 Jan 2025 02:24:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736522652;
	cv=none; b=PGg1LqGTD2M6pOhkHZwlex5flMmqd/ib1uaRZyVt8OdRbxeU+DKHdH6s66eNZegMKFjKvwa/5tgwtoKvuj9pm4UqOlLTmuWNNRFqksVxqDKBAqfbv2tRRRVjSswFVrlcpz/dJ0oVbw24czSwCMIkFEENB55IjJkUDdmH92+BYFPWrE/19l/zZeDEc3j9RNAOZhri3yX5lutlH/Jd1zbYUhao+AQCrsmToiH9e8t7zW4bM6DSsq6hPepdR9295/Ubwc/fIxntx9MYWO3YDkFfuPNKu/v24aacD2VbTG3NLAmUWXcIlfd0HiZxw67EBa8fUFnl+2Q0dtTOS9a1PhZAzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736522652; c=relaxed/relaxed;
	bh=NpJJBpExepilr1e2LDfuHty6WeJflNVwrGD4fcjF/+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uzu7sb7CTiqXnxOMm4G4obDl1PqjYVL8A6hSa8YyftswFMBkrF4Oip9CfUWo94dheg/qDA9Ez6EwNnkMgurlMX015ZawbFEM3PbwfAnTCKMJ+KldTKB6ovKTusxEDvpWcu2Pqqm/cJnDkoUK9Aylifr0UhQMiISdVFsIy6kQY9whdzSDCwF0sK64NesIWilHHxrWl6WG1aRzI9uudjarg12Q88Q+j3PU0r/PwZL/g1warjp+BmepMOeRb7hOWR1zZx/St+F67+TYZcEJz5WJYQlou0+l22+QPof3QTLj8QzNyXgrICktmB9BMaHjdr1Qg5DpG4Qm0H57HVWvWt0/cQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=WNKGqavy; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=KNQwmbhI; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=WNKGqavy;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=KNQwmbhI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YV56J74LBz3cZ0
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 02:24:08 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1736522641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NpJJBpExepilr1e2LDfuHty6WeJflNVwrGD4fcjF/+8=;
	b=WNKGqavyPePiDg61FU1H3x/H8y3RjJi1u1HoBkEUUayQduQ3z96s99+3Vr0oOkE+XkV6Ic
	p+q9po91IlUb6D2P44CCEXV43soEj6r7dTZigibgsRLqK9HGVwr1lgE3RP0HHqIN9gmNFT
	ukIArHjKKvFy1SOiSlDQpXb20ViaiClRnxyejp+0vbIx0N78cbmLrhWy+wJGKBy2sCfm+V
	XT6rOKwlAAFAg4afID05I2HU0HBBYVjz+F6hNdouBYH/Fay/8RbXCyiALE1mwF4BxiINw/
	KQj2E/8BbWDsUWuGxUp0RGUYNRDctvYXP5QE+PT44e5gfirulIQUMIzdHXFbHg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1736522641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NpJJBpExepilr1e2LDfuHty6WeJflNVwrGD4fcjF/+8=;
	b=KNQwmbhIFkev3kV3ZI1pztbVIIRhKfE1Z3u8tALSaFxLJgyPKNSjSTz4MaMRqgMtzsFlvz
	SulSEKg3Mge2EPBA==
Date: Fri, 10 Jan 2025 16:23:56 +0100
Subject: [PATCH v2 17/18] vdso: Remove remnants of architecture-specific
 random state storage
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250110-vdso-store-rng-v2-17-350c9179bbf1@linutronix.de>
References: <20250110-vdso-store-rng-v2-0-350c9179bbf1@linutronix.de>
In-Reply-To: <20250110-vdso-store-rng-v2-0-350c9179bbf1@linutronix.de>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>, 
 Guo Ren <guoren@kernel.org>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 linux-csky@vger.kernel.org
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736522629; l=1909;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ebVxN/FJGifv+RO3iXgSdQkCkRwa0yMwOEaRcM3+4TE=;
 b=4OgYlLAdlumC2HZPf6WpVDZ0oQlx07ye+dlpuiMf/+Yazg/+7P69RNR3Heeo9H6T28mxYF1hU
 3Vo0yL53jzkCVw9t4CjnFsMJ6T2ReF7nZhE8sTzBKOv3OdHS+5/tiL0
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

All users of the random vDSO are using the generic storage
implementation. Remove the now unnecessary compatibility accessor
functions and symbols.

Co-developed-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/asm-generic/vdso/vsyscall.h | 5 -----
 include/vdso/datapage.h             | 1 -
 2 files changed, 6 deletions(-)

diff --git a/include/asm-generic/vdso/vsyscall.h b/include/asm-generic/vdso/vsyscall.h
index a5f973e4e2723ef1815c88a7846f7c477e3febd9..13e2ac3736ee9b4aea6800117997ee165a7e2b9d 100644
--- a/include/asm-generic/vdso/vsyscall.h
+++ b/include/asm-generic/vdso/vsyscall.h
@@ -32,11 +32,6 @@ static __always_inline struct vdso_data *__arch_get_k_vdso_data(void)
 
 #define __arch_get_vdso_u_time_data __arch_get_vdso_data
 
-#ifndef __arch_get_vdso_u_rng_data
-#define __arch_get_vdso_u_rng_data() __arch_get_vdso_rng_data()
-#endif
-#define vdso_k_rng_data __arch_get_k_vdso_rng_data()
-
 #endif /* CONFIG_GENERIC_VDSO_DATA_STORE */
 
 #ifndef __arch_update_vsyscall
diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index 46658b39c28250e977f5a3454224c3ed0fb4c81d..497907c3aa11fcae913f62ef7373bbe6a1026bd6 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -152,7 +152,6 @@ struct vdso_rng_data {
 #ifndef CONFIG_GENERIC_VDSO_DATA_STORE
 extern struct vdso_time_data _vdso_data[CS_BASES] __attribute__((visibility("hidden")));
 extern struct vdso_time_data _timens_data[CS_BASES] __attribute__((visibility("hidden")));
-extern struct vdso_rng_data _vdso_rng_data __attribute__((visibility("hidden")));
 #else
 extern struct vdso_time_data vdso_u_time_data[CS_BASES] __attribute__((visibility("hidden")));
 extern struct vdso_rng_data vdso_u_rng_data __attribute__((visibility("hidden")));

-- 
2.47.1


