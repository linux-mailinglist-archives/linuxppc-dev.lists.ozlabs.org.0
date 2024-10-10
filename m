Return-Path: <linuxppc-dev+bounces-1932-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E42997E40
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 09:03:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPLKd442nz3bqD;
	Thu, 10 Oct 2024 18:02:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728543733;
	cv=none; b=JMxiB7gW0yH7qlcbOpSJfnj/or29u1AcSahIBlRK0x21MUM/2kTIlgePxXIH1NwHyEq566FuF5XqA7c7RW1PxgzTugjbQiYHbXVQoOQTRQyNR0qjX5UNEKOLEuovda/sw+lac5iUD+DGEdmRRh36iWdNSNHnQX3H8urNHE7S8ioubSUxwxrshvSsXERR1LWiQddQILZFUJltFoy0TZfmqh/p6HTXGuVHwhWnfLKdXZ0GAWiMGyIp6RnFD0NDzW9e6xSCc1FfKr9AMnoU5vUc7PmCn3cAF/Pnc89QLBWIivxbistAQnTSbL+u45fNX78CUBubMvuRePzbGTKDE3HGrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728543733; c=relaxed/relaxed;
	bh=iDYhkJLEk/wNM8RHtmH5cLtwxKP5hseONhnLJBEEc0o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lkx7VV16r86I6HvbQSXjlv1iJqx9y+TLpGxX6AQNPNv8ashrhNUbzph1WaqaaZoYFTZtwV9svLCgALbPWx3uj7yb37ScXiys+MoZ07LO8NDAJMIbxWN5T+a7gXAcRvZrrh8ciAvarngQ2K1AHzFY9rDHCHUbIm4wdI5C7KEFbzoZcmXLp/TNmdSnwrRiTuZsmilhjR80uXHyOL4v1VHm6T3UrWXRDYdknKbGTU9ZR7NCGJThQyojIzJpeUcusdW7VJEZWpqyVvlW0GcA2PtZUos7ASnq//v3HOo2PASBa56+bZzG0wsya1qSAJiC+z4gP25AThE9aYxFmKE85/9MeA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=DlOxxwET; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=/5YBI8zM; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=DlOxxwET;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=/5YBI8zM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPLKc20tPz3bnJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 18:02:12 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iDYhkJLEk/wNM8RHtmH5cLtwxKP5hseONhnLJBEEc0o=;
	b=DlOxxwETZAxA9RhV/JznUypAblffACAwmhmbzWihKTz6AoOeLhwRnA1ukaJoAnRtozKk26
	DlbvYyplIjBFkbxJypcleV9ML9vwxUDVv/g+9gCL9qmBbsFnAi0SfOMKflBkLNFsATVS40
	BR0/LBnPUS+8jbGZlbJZq16s2s1+l2ZsznjzDOB5pvzlWqP3mgUeBOEadfANZHOKL6B1JT
	C8ZBNqILWkhCxqxwPwivhO0T8fVwHmMeEsMW7j7YRAniTcVCr9Kss3aGKxedaEpObq32hP
	y/Xw7Y7vnw7KWQiNy1c11xFD2KpQzMkoXx5vzuV7pYNCXdw/FGHyFM7vLSDrzQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iDYhkJLEk/wNM8RHtmH5cLtwxKP5hseONhnLJBEEc0o=;
	b=/5YBI8zMSmdgRX+tzQmAYFuw+rKVOSXC6dss2zODxuOwAxU8/niqmHv7dePR8JKJCXe+bE
	3l94qY6mRiWTU/BA==
Date: Thu, 10 Oct 2024 09:01:13 +0200
Subject: [PATCH 11/28] x86: vdso: Use __arch_get_vdso_data() to access vdso
 data
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
Message-Id: <20241010-vdso-generic-base-v1-11-b64f0842d512@linutronix.de>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
In-Reply-To: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
To: Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Russell King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=1197;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=l5D8fVN3aaA8131sEeFVg9vgV5lu/zKv8tftufGa+9s=;
 b=yMtNmStMkDOKrNizRAIE2blEjN7roFN5utdJ25lrGaymlV+mNbkoLLCg0uck8P2iyvgDKwB45
 x92w3Z4p27QBEyzr4NDw5s4XKataw8016PEsD81PtJ1XALVRg28suWI
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The implementation details of the vdso_data access will change.
Prepare for that by using the existing helper function.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/x86/include/asm/vdso/getrandom.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/vdso/getrandom.h b/arch/x86/include/asm/vdso/getrandom.h
index ff5334ad32a0f56b2d4265fd38d9c287de3dfaa1..ecdcdbcd3392533e5619d7f09403d60a9810ceab 100644
--- a/arch/x86/include/asm/vdso/getrandom.h
+++ b/arch/x86/include/asm/vdso/getrandom.h
@@ -32,8 +32,8 @@ static __always_inline ssize_t getrandom_syscall(void *buffer, size_t len, unsig
 
 static __always_inline const struct vdso_rng_data *__arch_get_vdso_rng_data(void)
 {
-	if (IS_ENABLED(CONFIG_TIME_NS) && __vdso_data->clock_mode == VDSO_CLOCKMODE_TIMENS)
-		return (void *)&__vdso_rng_data + ((void *)&__timens_vdso_data - (void *)&__vdso_data);
+	if (IS_ENABLED(CONFIG_TIME_NS) && __arch_get_vdso_data()->clock_mode == VDSO_CLOCKMODE_TIMENS)
+		return (void *)&__vdso_rng_data + ((void *)&__timens_vdso_data - (void *)__arch_get_vdso_data());
 	return &__vdso_rng_data;
 }
 

-- 
2.47.0


