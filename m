Return-Path: <linuxppc-dev+bounces-12310-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6013B7FA99
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Sep 2025 16:02:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRgS949Wbz303F;
	Thu, 18 Sep 2025 00:02:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758117721;
	cv=none; b=OxJGCyLsKyvinYvHgVQNa5gGR0i2I+b322cmeLv2gZmt+XzS7VWGHkXIaUqo1fTE7SN/Sp09MtySDqjkGIJh+3MZVWYkUbcWy3X92P1Ax9wBunh5FoPWX5mctxTbrhG4etEGGIPpyqGst90eQDBE8F7TlRKyAjbKG/gkrz35wZQPdiyYV4JQp9t9nzotO+ybRYy0lMj4eeI4K2Qo1PhJH4mdziOrlz+dbEVOdOKEU5/s/QUo3ivjMKd5s31emGgVdX3stN/bKsQrqtvXcLLoNg/mhliQ7asZe9r6v8YdOG0bE6J9Nr8dt0Mysnt7LjqhdVpFeAMMdm8u1PEauFKdUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758117721; c=relaxed/relaxed;
	bh=lG79bLh+cxA30eAnxMz9ar91cT1e7icm6tLjmp9egkI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iyAEwFLydCim5cOO/z1H6dM+z/x34CsQrFbku4oP/sBCikkWG2Plu3zwgkI5GqlgsULtqrR3w9UNSJhALiilMpgSaNauaNVRfSACEDN1M5NLnpo+gp28tXvalHRhOQHSiBHfY34qcHQ7DKiQ/Ziws/Vxue9KxwA35Q9HbSpJrfsN1xduWBqvhhpe67vS6njYA3ARLyVJaDE3to5KDYy5rZGweI0nzSrAF5UicJT6ywOoYxQoOnZY6WCuZd0eQ9ivGorIG5yfl7JJ8fW3zt+0El0bw0aHnb2+iYiFsyIooumBwl0vrth1s/v++Ze6nrgOUgRX+K5RHsxqiJ1JtPFzfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=WHYnPho1; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=TVYdGpoP; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=WHYnPho1;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=TVYdGpoP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cRgS81zwWz2ytV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 00:02:00 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758117714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lG79bLh+cxA30eAnxMz9ar91cT1e7icm6tLjmp9egkI=;
	b=WHYnPho16WVmazVJ1lvT3HGDsshx9Il8OAkuEolbruZh4Ny0d4KSgQPTrq7enPUrIyvXCC
	3mu46hnoLdcaOP6QXEzeP1/bOShp0opEtnwHpLE4Ndyjl68sHzseUiFuPNf92OMy+MpkqN
	CCbaS1Kk+k1/yjWNxoCeytp07WVbQXoU1AO8yNsQNSF9p9UR/0fwSixfLh6WpfSXW793AS
	Jx9IDy/pNxy4UHsFERSUkcPCeuU3F4aa1Wb6xHVE9K4O34Q2+jaT+jI7c5msj0EChcPEhT
	G3xIwG10Gv9auSwUQ9Sgt5PJtZsYqgS0BuDBCHnDO/Nsp4vdNWxcoUFz/UGJBw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758117714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lG79bLh+cxA30eAnxMz9ar91cT1e7icm6tLjmp9egkI=;
	b=TVYdGpoP0Rd1x9/Emq1moJrVednuB/6nvs8Ir5jF43pXIjfVt5hmggh0Aj4OSHkxBL15c9
	bnL5C6l7HCoFH+Ag==
Date: Wed, 17 Sep 2025 16:00:04 +0200
Subject: [PATCH v3 02/36] arm64: vDSO: getrandom: Explicitly include
 asm/alternative.h
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
Message-Id: <20250917-vdso-sparc64-generic-2-v3-2-3679b1bc8ee8@linutronix.de>
References: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
In-Reply-To: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758117712; l=936;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=KXRCejb0NgpV0MbZE6TVVMP7UCeEr1qQ9jIjqhoS2Nc=;
 b=mYQ1H32ThBFXyyewa3im0FkaoCNjktKf+s/th6KEedWb5FldnJ5Cb2QFQ45WStq25QjVihVSQ
 OBAwVUiLvrNAFsA6CI/2VHgC+d6ew7CGbaw2FV6OhhoxxUG+0o2HKdf
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The call to alternative_has_cap_likely(ARM64_HAS_FPSIMD) requires symbols
from asm/alternative.h. Currently this header is included transitively, but
that transitive inclusion is about to go away.

Explicitly include the header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm64/kernel/vdso/vgetrandom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kernel/vdso/vgetrandom.c b/arch/arm64/kernel/vdso/vgetrandom.c
index 832fe195292b34e2029f593ea170347c98e06dac..0aef124c90899dc0c8956b0f32f54992aa3acf0b 100644
--- a/arch/arm64/kernel/vdso/vgetrandom.c
+++ b/arch/arm64/kernel/vdso/vgetrandom.c
@@ -2,6 +2,8 @@
 
 #include <uapi/asm-generic/errno.h>
 
+#include <asm/alternative.h>
+
 typeof(__cvdso_getrandom) __kernel_getrandom;
 
 ssize_t __kernel_getrandom(void *buffer, size_t len, unsigned int flags, void *opaque_state, size_t opaque_len)

-- 
2.51.0


