Return-Path: <linuxppc-dev+bounces-12818-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB32EBD7A3F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Oct 2025 08:50:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cm4ZN6Crgz3ckQ;
	Tue, 14 Oct 2025 17:49:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760424556;
	cv=none; b=Jp9AHRJvUaJIAOdrH/Aa4aDhqAK+VeDdCYEdJiW+1iBAinzAXvLINWL0uzhjLoKkj8XAlIyxQQqV8QRVlVESBq0HKbw4xgFQqV2weNA/VVBfa+w6L8C4gdaKPj25XZ0cw7x6OKAWJiZ+HleB285SBNG9toqQ9Uz+OdXIi+is/53rMRAW6SNtJJ8E1PMGWe5HoowzT3heg7vlNB9K8+RnL/g/VGo3ry8wWh8L0oDQoS33XRec7AlU5wCtEjC+7GR5U3G/MNbqbwyZbz300rA66yeNWnh2citvYuYhjjGE6nAiDwVDoO7IIVX6wzIr0rOPvzTshVKXcde8xLUtuaoJAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760424556; c=relaxed/relaxed;
	bh=HfqyV6Jh7glVwn00bSS6JTapm9r/93qO+3QFj5gItgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BMk4+E8reNcPSQcxmemlcfxXwP56O8xjcMOKX2brlT0YH4tnzcv8d0Xu4YfzVtbEHTelQE4e+ADnLRU99uQ+SqgfpJietq8AIKz0owkCVNNf8BCcdQhtXidNu0crPblXhDbM+fm0xmui6LRjwM/YhRZ4VEDh9rOqg6xzM9rQircAEPyEXRwtLZW1HxnkYUIjMTwsyGGKYZ8HMTBaTcQtw4t6Yj0XL1Wmfv8COkkJkYrubAQTTscTDOJzRA4O2jQByOl9mdwpAkvspXfy2kiYCQFw77vPX0PNbn3Az9ZDcyYUdj2UekvJqwb0o5a4otjRfLuzbwTO5L8BpOEGQbZ7zw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=WWh5VpqL; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=wnI12/0K; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=WWh5VpqL;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=wnI12/0K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cm4ZN04jKz3cjQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Oct 2025 17:49:15 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760424552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HfqyV6Jh7glVwn00bSS6JTapm9r/93qO+3QFj5gItgM=;
	b=WWh5VpqLgSvQgzfndPwRIoYyzeSx3k7/0Qg4euYDOWy3SnjMgN1y/09V55tbR7IyTzV6yx
	xFQEgm7DmyR8bm2w9XhEUayzgW36lLn/sq206PjDVs/N9VigdSEjvfmGGwgVld0wuBmPDB
	901qmOczZuAC3Bi0Qu8G+aJoRTS0X288HG7b+pVi9DjT92HGdBPr7ZBWSrYnTUJaEBUZ2s
	W7bjmRVYq/3T1ENhZispnZVja37HlogoBXjDW+2CeJpP6wlGH2ArxH0CZ8vz7URgGyRBWZ
	cMlmHzYgF5t6y6NO20O2Y5KTeB19WTpQ2CMm1EiU3aiE8y+kQ0CxDBNnHK0gnw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760424552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HfqyV6Jh7glVwn00bSS6JTapm9r/93qO+3QFj5gItgM=;
	b=wnI12/0KPfZmKkwHukGRh7cwZ9gRF3KxJz1B/BuSw8yg21fKYGKlrvjrdgrDQ2o1TKv+dM
	IWYFlra1atNwqFBA==
Date: Tue, 14 Oct 2025 08:48:56 +0200
Subject: [PATCH v4 10/35] MIPS: vdso: Explicitly include asm/vdso/vdso.h
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
Message-Id: <20251014-vdso-sparc64-generic-2-v4-10-e0607bf49dea@linutronix.de>
References: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
In-Reply-To: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
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
 Sven Schnelle <svens@linux.ibm.com>, 
 Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>, 
 Shannon Nelson <sln@onemain.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760424546; l=854;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=PM9q9catgRqCjb/cltSFmqCsNmoTi7HWsxpIPxIvJHQ=;
 b=s9ICf9c4fBeEG84bnIKxg6TfqKULHMqHOp4PVzLmfuEkZEJVm4DyMwAVRaa0jAOvAZkx1eDcS
 Z0DlN4eLe8IDIu6ZKT2P+LpuhX1/Ot8oTC/PcD80ZtkkZ7w/qEeoQKr
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


