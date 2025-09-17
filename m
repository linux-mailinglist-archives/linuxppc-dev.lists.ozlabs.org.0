Return-Path: <linuxppc-dev+bounces-12321-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C968B7FAFA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Sep 2025 16:03:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRgSJ41Lfz3cyg;
	Thu, 18 Sep 2025 00:02:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758117728;
	cv=none; b=Eno/V3Q3oTQAIE7LTAsTmipJ1gOy2S7YY8o7+dbhnF1/OT3mZlzwzu6hwfwG+dIRXrsZdZQ9G3Td2mLlNpUkcSEpm+RU6afRIcve8ZceLJlVdUNBg+/BecUz1qXYmhiGiS6F+GE4SvAEna8LA7r/NnE2XjbhLcykBopBKEn2UdmgcMSDqBBrigSaR7oYvw7PfyOCIhL1L/Z2rXzjHObOQAI0vN2sOsKFPcnmXfGXipT1fkL4W4yTVqJ/4NmWzG1ZREfqr7VUZ54OQpA7TAJlz94amS9iJFRqE45/Q1/MvaFOFsu8h7H34MkKL8jdidYCpNl82HhLgTH2IUosbt2VSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758117728; c=relaxed/relaxed;
	bh=4zQyKMAlqw8k3oqLgK6HtkrvF0ImRnltnSaL5sRLX+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z7MIXUgYe0kpkEeENKgfGECxse/RgE1IMVridgMD0gLzHgaCKhUi2pLTvQkADHGYvbtk4r5zgDo5qrEnzSpmyyRj2stR66nfnb1B9iTJcY3Hjg+nxOlryiuN8qXQP2lMYb8NvwHgIC8v4Nnr0gUJcu5WyfG9BqZNomBRS4dZ5BR03wmf3ZInB/zDaS1s5m2myQlXkclQqtrlpOYtO7f/i2+rEH6LaROJjhtb7/ewx88mw6tjoA3dyVmDh1mpd+VAx5keCJi3eTABzA5wECGl4fLwEkfELop7P8fE2Nt9afqd6SOaLIifNuNwNcuJ20WpOWHVcqGM3DbzOey3sfvECA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JHj9kqTt; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=81FXpCMg; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JHj9kqTt;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=81FXpCMg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cRgSG6rVlz3cl9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 00:02:06 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758117718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4zQyKMAlqw8k3oqLgK6HtkrvF0ImRnltnSaL5sRLX+4=;
	b=JHj9kqTtZUFR3cWtZY7gPuXUU4CZ8futrwVBF9VzSwCF9pwAqfTgfGRu5VY91f6YPkVHxj
	I1lUUcTAwC4zA+F3XH4bE3yNMDgkJMd/mXBDYCs0TrfRLIm55KYb2ksEw4GOK9W0SdLKhh
	Dte28l3FBpdZTEQAop0pJZ2godqgvTg88RZirXvVHounWHiXl0kVUXT/32p4XiGsjs0z8s
	L3gmpMBaI8LqEVSkuBAO9rQWdqHvZBlK0cuC9VdJovudmiZ02nEwV8emU20m0bcUxtTGX+
	DNOcP9OH4NDQd7CJ0TyT49B4owDKUz4QnJ9QL7gohlj3zc3jvgfi6D/9EruIvg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758117718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4zQyKMAlqw8k3oqLgK6HtkrvF0ImRnltnSaL5sRLX+4=;
	b=81FXpCMgBi24Rq9naMMQLcwodP8iwpiqu9R1BvVCorLiJIpQEXibH2WRSP4Im0EPJ2w1Y7
	ewD/ziPkjhzMBwCg==
Date: Wed, 17 Sep 2025 16:00:11 +0200
Subject: [PATCH v3 09/36] MIPS: vdso: Add include guard to asm/vdso/vdso.h
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
Message-Id: <20250917-vdso-sparc64-generic-2-v3-9-3679b1bc8ee8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758117712; l=970;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=XJIvS4hKYyCqGnzGQlj96dz+6puKI0zqLs0UVC+sM+Q=;
 b=RnyqXMeVjWK5cddJ4pHNKPevtWEjEUBFIi+DE8KaR4t2hdbY6GgqJCStBSmqEIe87u5wkUb9D
 0tjQCoweyBhC9WS6hPpQSgu4UexdyVUa/S3+kMAjO3svskGqbmKVNb3
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

An upcomming patch will lead to the header file being included multiple
times from the same source file.

Add an include guard so this is possible.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/mips/include/asm/vdso/vdso.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/include/asm/vdso/vdso.h b/arch/mips/include/asm/vdso/vdso.h
index acd0efcd3d93ef7e71107302a40d24b4b51aae99..558d361bbf80afcdc61538543feced2f8a3c0347 100644
--- a/arch/mips/include/asm/vdso/vdso.h
+++ b/arch/mips/include/asm/vdso/vdso.h
@@ -4,6 +4,9 @@
  * Author: Alex Smith <alex.smith@imgtec.com>
  */
 
+#ifndef __ASM_VDSO_VDSO_H
+#define __ASM_VDSO_VDSO_H
+
 #include <asm/sgidefs.h>
 #include <vdso/page.h>
 
@@ -70,3 +73,5 @@ static inline void __iomem *get_gic(const struct vdso_time_data *data)
 #endif /* CONFIG_CLKSRC_MIPS_GIC */
 
 #endif /* __ASSEMBLY__ */
+
+#endif /* __ASM_VDSO_VDSO_H */

-- 
2.51.0


