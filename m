Return-Path: <linuxppc-dev+bounces-13845-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C88C39FFF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 11:03:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2HmX6BfVz3dWS;
	Thu,  6 Nov 2025 21:02:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762423340;
	cv=none; b=jVrqNfekHZ6tnHOAI36a9ECW6noLUCrwDHUwcthh4lrbKPgrEzpXAzgQs64wHyoRpbhXU/ZDlN/ZQojv7ALr3xkkCXUIOCtnn3MK5HJgd+AYiLklaVD4CvKbYFw8beO9HKLC3aBw22TzMQMjGiMBlHdjr6bUaN+Nt6PRM2gdYG9pwpb0GPlchYp2v4ZRI5LfUXSUiisCCnm/ULTIQa9t+NUShUn0ICgqdka4QT+h18NQhMXPoPEp5QXNJzUPHj2gJSQr24MfWKMIqJjUyr98C3fAfLJf5w61QcdloEG0V/APB95JAA15Aer6s7IajnxZQO66m+afFvlvDMR4UE77zg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762423340; c=relaxed/relaxed;
	bh=U5z1AShvfOWlUFfSGd2FO4MKKuyxsnZoNRjaX+Zb/8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fyX9MJlFA1kTNsniwcV4jKHWe1hyjSSshuLnXV6FljC121jrvNAxq7aw+dvEo9vxBVhkqU7fIGKYT2768j5dOzg+bhws+lyw+dEfCzQrXMt/khABdAgOpnY9QzkhK1IyDP+SLKdO7RZykbLd9dWrrJBgUCWdIx0Lvo/ABiCGfpK41nTExxiPjWVfxA+dZ2F4xdFWBDyqbRWA+7KPkINqS0mty2wY/PVMPS6oZqopd59KJAy5Ou0NHNLewENezOGRNF8bDFBYN65/sCuQ9NgPPmh8TYNCrtQdmMA4H9VUTzf7A7BMBMF5EPrRwyfkSKdkSLwPY3xf7C4MC1Ndc/DbFw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=FlRlwdsA; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=D6Dm5Ar9; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=FlRlwdsA;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=D6Dm5Ar9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4d2HmV2rH2z3dTx
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 21:02:18 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762423334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U5z1AShvfOWlUFfSGd2FO4MKKuyxsnZoNRjaX+Zb/8U=;
	b=FlRlwdsAo6G0XMC1cQ/WSe99ipVYZVOzhm8b9zE0HD0Qcm21ywy2yeegSduAEPKS39CfWN
	w6Bp9a1pR1LRNbLtWakMvM8/+JgdYXQV99L1FwQ7tVwgfyAUDL7HdEDJ0P3P37/cNa3vjy
	ZsGggXvmUWefF7imZOEZ79uUhPaLTM4Nm0RMLJ5h4bc15WwZ8+CTVCa9ztzuB3RvWbAoeZ
	fLwimjYt2kwjhDwiK8ogdXOmMpYgsF6PZDNzEnXG0rOh3qvraWpsiGgsP6wf8xkBbvnW0R
	mIDatd/XR8HZepN+kM5kSxUGLkmb0oJOJrGTyrQSW6wm+VpPW2Lzmz1kuTV9Dw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762423334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U5z1AShvfOWlUFfSGd2FO4MKKuyxsnZoNRjaX+Zb/8U=;
	b=D6Dm5Ar91xIXFDmEO3gSz+evuL9anvE+dHUBCM0KPEgrnXro3kHBAi44Cae9clyU9Grx0w
	xft5Xq55yQ2Hv/Dw==
Date: Thu, 06 Nov 2025 11:02:01 +0100
Subject: [PATCH v5 08/34] LoongArch: vDSO: Explicitly include
 asm/vdso/vdso.h
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
Message-Id: <20251106-vdso-sparc64-generic-2-v5-8-97ff2b6542f7@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762423327; l=1388;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=qUU0j04oP+Jr+mAZy0GqF1qAR8DJbrTpfYyKIPcCdaY=;
 b=S94GpFlvpxgaOrI5+qwLwnwq8xv7KGuUqd1nO70y/cLGGkYI7DNI5bgPqvODTW7lvoOpJ1QHI
 yZTGNJQnKzYCUzpd75EJbXEf2eLmmWUFJmp1/zfiQ27yIjI6RebRllL
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The usage of 'struct old_timespec32' requires asm/vdso/vdso.h. Currently
this header is included transitively, but that transitive inclusion is
about to go away.

Explicitly include the header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
---
 arch/loongarch/kernel/process.c | 1 +
 arch/loongarch/kernel/vdso.c    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/loongarch/kernel/process.c b/arch/loongarch/kernel/process.c
index efd9edf65603ccd16408dbe5d2b71a47d08561ff..84a1d3cd5ccb7418907f0a27910742784233a525 100644
--- a/arch/loongarch/kernel/process.c
+++ b/arch/loongarch/kernel/process.c
@@ -52,6 +52,7 @@
 #include <asm/switch_to.h>
 #include <asm/unwind.h>
 #include <asm/vdso.h>
+#include <asm/vdso/vdso.h>
 
 #ifdef CONFIG_STACKPROTECTOR
 #include <linux/stackprotector.h>
diff --git a/arch/loongarch/kernel/vdso.c b/arch/loongarch/kernel/vdso.c
index dee1a15d7f4c7770d6c31249c8a3f88295d9482e..663660f08a1f64f44649a8f0034ed7d1239b857d 100644
--- a/arch/loongarch/kernel/vdso.c
+++ b/arch/loongarch/kernel/vdso.c
@@ -18,6 +18,7 @@
 
 #include <asm/page.h>
 #include <asm/vdso.h>
+#include <asm/vdso/vdso.h>
 #include <vdso/helpers.h>
 #include <vdso/vsyscall.h>
 #include <vdso/datapage.h>

-- 
2.51.0


