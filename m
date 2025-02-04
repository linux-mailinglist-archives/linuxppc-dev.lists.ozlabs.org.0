Return-Path: <linuxppc-dev+bounces-5803-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADFBA270F5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2025 13:06:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YnMXP5WVvz2yXs;
	Tue,  4 Feb 2025 23:06:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738670773;
	cv=none; b=O7k6o/92zRLivhDm0l7XrbE7BukG5EYPrNDcC/8DIKL/KHV4mInO9Uu+wgtGexO+DnsGnWlfK+FWqolcnqwiAqP1dj+xo3sa+dQNHUMbH9Pw+okNjnMD7KRdsWMSeBgD0ex7TYruC/Cv9/pSvAlBzer3ygiG2Nwr3SOUe8YnwVsa83lDPHDMvfiT6O6ltD1ZzQ7xmgZF/0NmXTLeJin6/NC0K8ryOcq4U/hkxyrDx2nRk+B1yU043WODlQaRMMl3X7SYMIYKQYMgAjFJ0dM29I6qPWte0vL9UwFj40Py0pVSHlhFIY838TK1VNAbfEKjnxkLEvubmmmxJjiFtOE0EA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738670773; c=relaxed/relaxed;
	bh=2wthxihBzoT1dnFItAc2o4ZVMh/ieepwsKRAe48p9bY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U8XTPG9YwCixOoW1K6+60UozhaVZHUPA6hRUQADFEHCdN9y0IeNCtWGafEWldLJ71pVdRnQXZp8I8VT2ohtiu/0vlwyoHvK0EkF2XjEIBm74v+FOF7bC5iEghCovKKEGyZN5OhuaZDQVAhOcFcOIkYeUXYsl+gH234EpkAwHFVMRiSDylXRmV6qx7J6p8hcXQnNfLULr2Rah2N5FSeFIuwQIrAmE8DXUT0SVlgQR3G8HhdVB0+I1pOnTcEblbUqzws/ox34zSEpKSZyfXlb/pexCg+bq/J3wYpi5R25RRCEznr/m1W8tL0ynXW5qGxUKb1q87Ben+HKdqFpU9SCcjw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=fHrFI9Pe; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=MJ7KzPmZ; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=fHrFI9Pe;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=MJ7KzPmZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4YnMXN0Qw8z2yDp
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2025 23:06:11 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738670766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2wthxihBzoT1dnFItAc2o4ZVMh/ieepwsKRAe48p9bY=;
	b=fHrFI9PeSGVQDCInicDuqCq2ZnIGjMK3873/V+PQnr5X9t9fbun6TN5ysjxBCEfeqVD4Dt
	ez5H+nctl1vfMeYFnYYrcWO4r5MggVpOmcPYuf5YAGlu5BZDajUs8V6meQH7u+7yyEb46r
	wPu31QpkBITZ6RbHtnWtFDeHFthu6z05SUaKggRwfknlcFSDfauzqDZI8f9sPs7j7N14Ly
	nWpWN2dQdJxd8LPjT+WICA2492Ov++LcoMbQDUllzVlITS/Xr0HbXv9SHca7T5jfZEAdhG
	E1KWm1ziUYM1PJNO5iPycPL5eTZ1CELiNi6rA61q2oxIVxMPXdq55zS20LeGGw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738670766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2wthxihBzoT1dnFItAc2o4ZVMh/ieepwsKRAe48p9bY=;
	b=MJ7KzPmZU2E8LeznYlnKq/vha9PY3jNx99HTgP0f2P9VhbfIssqtxl82DkKaQtDUOCMn6Q
	o26gUCkYCGaNQoDA==
Date: Tue, 04 Feb 2025 13:05:34 +0100
Subject: [PATCH v3 02/18] parisc: Remove unused symbol vdso_data
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
Message-Id: <20250204-vdso-store-rng-v3-2-13a4669dfc8c@linutronix.de>
References: <20250204-vdso-store-rng-v3-0-13a4669dfc8c@linutronix.de>
In-Reply-To: <20250204-vdso-store-rng-v3-0-13a4669dfc8c@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738670761; l=796;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=PsNObhM96Z6VJ6YO6wVJytdYn6iSqKP3WcdqNzeXQCs=;
 b=QAfcY3/tZW4aqA50xQmio/rWbqFlpjtNcyufackA9F81PDr6GzzKzTC5wnPW3aTbwI6t5a0j9
 gbeylrFoqfBBqHSqqcWJ0A/MHLXjHYHnUq841uI/Pwm8gTEiNrEobtA
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The symbol vdso_data is and has been unused.
Remove it.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/parisc/include/asm/vdso.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/parisc/include/asm/vdso.h b/arch/parisc/include/asm/vdso.h
index 2a2dc11b5545fc642a7ae4596dc174111433e948..5f581c1d64606b3ec8f9967efe31dd3d551adf76 100644
--- a/arch/parisc/include/asm/vdso.h
+++ b/arch/parisc/include/asm/vdso.h
@@ -12,8 +12,6 @@
 #define VDSO64_SYMBOL(tsk, name) ((tsk)->mm->context.vdso_base + (vdso64_offset_##name))
 #define VDSO32_SYMBOL(tsk, name) ((tsk)->mm->context.vdso_base + (vdso32_offset_##name))
 
-extern struct vdso_data *vdso_data;
-
 #endif /* __ASSEMBLY __ */
 
 /* Default link addresses for the vDSOs */

-- 
2.48.1


