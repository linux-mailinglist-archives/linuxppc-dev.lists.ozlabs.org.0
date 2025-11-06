Return-Path: <linuxppc-dev+bounces-13863-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAADC3A0A7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 11:06:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2Hmq0ZS6z3fL2;
	Thu,  6 Nov 2025 21:02:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762423354;
	cv=none; b=Gj36C0zR3qgTEelDQLeBpHX8eKsf4vjdAh9jMS2nXDpdU1lqoP2uoVy+PSXpQM1ivTJ0DiOCqAs2DV1FCNJr5dmmHC4gqoCQ2wLP9+aN5rsVudO4Njw+5Id5CfhYhdPEzRSVD6VoWn8nGRW3ceF+c3iIdA2d0REYLMM7d3PqiANtnFj941Ku1kAADxo5k61QmqY+pgODmxAuxIW0D9OZz2R7JeWl2pUFb1UZA4Xn3ZipRJNLXsZJHhQDNeKq1MtvKy1cXXaGKd7iDKYCT4uJVomXcotC9DEFNaoGeGYR4KqgwiIaGqo4lwDJW6/LkPqnwwthUQtWYyOa4wkn3Nef1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762423354; c=relaxed/relaxed;
	bh=w1SV+PqSrKcBXRE0Ygl0UiayHdt8moxs7tJ8I+04D+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QFUVSneo61teBH83BdtM57dm2kVFo11Ii2njcGED/g09w3K7G3NobYxXQLbxYgFz/Q9Gl5sbsKlWy8eHUN0gJAQkrztPx2mB61w55kBaNBTeoLd/4xgd1cd7vvjZc4o34MfJFx7UfHK4eAUOMTSkrnuCE3hI5YzmbnFoMx7reW+xIdwQFc8QqUlIULyt8okRyF0SA9JWYEjhycX0auyuhRu1YVLLYj6ymhnRHmcYRXVCX1q108T6bh7p/M85CVqUZ7RElQ+evTzWvksUUhOzCf0n88lq4Bh9zBRFuN4NhnzazB4D4TGqgLg06WlL/ta3n2gkVxxw9L0a3vwJc1jgXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=w9PW9ll4; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=roC/+VvH; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=w9PW9ll4;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=roC/+VvH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4d2Hmp3K0mz3fKp
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 21:02:34 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762423343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w1SV+PqSrKcBXRE0Ygl0UiayHdt8moxs7tJ8I+04D+8=;
	b=w9PW9ll4SirBP3p5BmkWSwcxX9yBXq2ZLAtMao42da/rXWAnfeOtC1bJ9E8uAfpxuSE2b8
	o07hAS/4ARBr1kRqhqTX3XwZDQsgQ+FrFmE7XJMCGEXaB3jbVJrTSErDfCMYnV+vU7oRWd
	M3pggh1B7o4RNaeIYbjFDC15R3pGSZ7sPp7WD5gZIuZcMJxq/sUfoDglnjG5zT3qid2PH7
	jzIhhtDpYrfa0KoL3/elxR9+XxUP7WmSF6bX5TALqR88WnUut9GIod+6V4RB+c4yddjEKh
	PRaFadMESxmzpE2bz01vYUPmZZWNXbrxU0DD02uX7uuDs1tPvs5rlLRHiMFQ7g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762423343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w1SV+PqSrKcBXRE0Ygl0UiayHdt8moxs7tJ8I+04D+8=;
	b=roC/+VvH0dZdpOXVcl5LaZh8YoB3OJiAs7429ePimDjbFeWjQFkuAY1yyXpFRnqgrs+hL8
	3HyvwAGXnWd15yDQ==
Date: Thu, 06 Nov 2025 11:02:14 +0100
Subject: [PATCH v5 21/34] vdso/datastore: Reduce scope of some variables in
 vvar_fault()
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
Message-Id: <20251106-vdso-sparc64-generic-2-v5-21-97ff2b6542f7@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762423327; l=1296;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=yVlwKjEkg/2DD/Mb0uz8N0TzPw8B5Wtv5ed+5obQYGU=;
 b=rikyX4UvTCgMDvnqGEuNjGrWUOEUBhmdyXJkxjtZyBaXdECGv3cgj+MOuFa0Z7Wx1uBoedvNc
 xcGQPOSE4rSBWH/8RnmCUhVj64mbOeK2j099iHbxdTUw9CYVbrde/2i
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

These variables are only used inside a single branch.

Move their declarations there.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
---
 lib/vdso/datastore.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/vdso/datastore.c b/lib/vdso/datastore.c
index a565c30c71a04ff4116c14f43f4450210eba99c5..2cca4e84e5b5e7686d6a2b42b41af4f399cc5261 100644
--- a/lib/vdso/datastore.c
+++ b/lib/vdso/datastore.c
@@ -41,8 +41,7 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
 			     struct vm_area_struct *vma, struct vm_fault *vmf)
 {
 	struct page *timens_page = find_timens_vvar_page(vma);
-	unsigned long addr, pfn;
-	vm_fault_t err;
+	unsigned long pfn;
 
 	switch (vmf->pgoff) {
 	case VDSO_TIME_PAGE_OFFSET:
@@ -54,6 +53,9 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
 			 * Fault in VVAR page too, since it will be accessed
 			 * to get clock data anyway.
 			 */
+			unsigned long addr;
+			vm_fault_t err;
+
 			addr = vmf->address + VDSO_TIMENS_PAGE_OFFSET * PAGE_SIZE;
 			err = vmf_insert_pfn(vma, addr, pfn);
 			if (unlikely(err & VM_FAULT_ERROR))

-- 
2.51.0


