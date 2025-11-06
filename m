Return-Path: <linuxppc-dev+bounces-13847-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9ADEC3A00B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 11:03:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2HmY40rdz3dX4;
	Thu,  6 Nov 2025 21:02:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762423341;
	cv=none; b=ospueFzykl0hNs/84DP8zqdV57pUi4d4Ap7qm+erJCoPOtPna67zy4mS2GfmimHYT9KWn4qT4lI9OfsDbJ8YcWAEMplACI6eroayhyJmlja5t6rSLiiPVMT0i17dKB6Xl5sqvZKCOplrD0rKQulxFzvM0bqsaybKGqsfs5K7DV/iHlop4cGs6H0x1DIH4NVU3Ru7zaUk/g/NTAEVdg6ARxy6DVQIWLZZYZrnbNOlv0Y0RIuDZChlaeGUmMLZ/gjO+OxGIsxKDQ+MZt/Jr55BxRt1TlkrlGVOT1kTK1SX0lsKu32ZLfpp0xmQ46920fFpiQrgvCva6Xa/rPohp1WiDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762423341; c=relaxed/relaxed;
	bh=HfqyV6Jh7glVwn00bSS6JTapm9r/93qO+3QFj5gItgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G0qGgjcpUOxYZpnt56kB5OVIFK9rCuctyv9dBJPZcGW6Iis2mE5PtgzhbcoPnUuLCk994h9+kihxv5Tcjotn8k+LxontURoIloe0nIdEdRWeWbJIN8qoTQuH5M4DwSiGZUChNTqexyriQr7gYZHsGJFzejloKi0HE5u6CP82xeGzFPV7NeCtr1yPET45N0lbRQ/0v7v1GY+puqonwrUJDyKysbZwj3v1u3hR6awql+yqjq23VSgLJo6Knbu/1RlDgFOKBGDUdEmgdZ37CLF9UBeJNlZ7qC7ax4zqJz4qOmO/MIhP/3BEqar4gLUmcGJa5LE4sb4es0VwMxbYvwhLtw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Zho1XcZ+; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=jFaug79I; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Zho1XcZ+;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=jFaug79I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4d2HmW1mKgz3dVD
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 21:02:19 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762423335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HfqyV6Jh7glVwn00bSS6JTapm9r/93qO+3QFj5gItgM=;
	b=Zho1XcZ+S4DvhpdUdKFgOw4seD+vX2djJglg7GHWwWABnhj5CLsDfHlm2iSc6DS7Am8/k0
	D9+z30itd8idQ6n1R3r3VQRBM7lqcel8WrqC/31qD8g0sTc7S5NCygWrFq+zJb5Wx6f9Qs
	gQTQiaFGkXun8Nvt0G3+EEP7znUrdLBYO9DBK26pQCPJBGbIqSi5zQyxSTDk2rzwdho02m
	fhkJsOA4rmir3DrkvKGDPmlGsqamDM6QG4FXj6eRjsyhq7vlvBbJE13wlXyzLAVS4HTF4X
	7vOw184tdaikNzsnz6qq9Uwfbe1vSnU7o+DDTmHnk2NmYt7HXqXgzTVyfs5ivw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762423335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HfqyV6Jh7glVwn00bSS6JTapm9r/93qO+3QFj5gItgM=;
	b=jFaug79I0pwPTQjTcDLWNICQ/82GXA7c2/GG6q65trR4umWaWs5o+ZBAFZocP2anPTC5jT
	LfFKrttYxe6zr2BQ==
Date: Thu, 06 Nov 2025 11:02:03 +0100
Subject: [PATCH v5 10/34] MIPS: vdso: Explicitly include asm/vdso/vdso.h
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
Message-Id: <20251106-vdso-sparc64-generic-2-v5-10-97ff2b6542f7@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762423327; l=854;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=PM9q9catgRqCjb/cltSFmqCsNmoTi7HWsxpIPxIvJHQ=;
 b=DiqYQvUT7a1rqQkhVlgHJpxtlRmlJy4Nq5ws7lgq3vQz16ceI9wwxRim5MPAP9H4tET3uSCpv
 HhP9TKOseiwCHdRE6D6bbrB6sHhtQPyiLVZfSQ8zLFbLlGt8w6SbSxN
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The usage of __VDSO_PAGES requires asm/vdso/vdso.h. Currently this header
is included transitively, but that transitive inclusion is about to go
away.

Explicitly include the header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
---
 arch/mips/kernel/vdso.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/kernel/vdso.c b/arch/mips/kernel/vdso.c
index de096777172f082b5b7847a5c14cae5ddaee0430..2fa4df3e46e47b5c9675aeb00ebb96ac3353c68e 100644
--- a/arch/mips/kernel/vdso.c
+++ b/arch/mips/kernel/vdso.c
@@ -21,6 +21,7 @@
 #include <asm/mips-cps.h>
 #include <asm/page.h>
 #include <asm/vdso.h>
+#include <asm/vdso/vdso.h>
 #include <vdso/helpers.h>
 #include <vdso/vsyscall.h>
 

-- 
2.51.0


