Return-Path: <linuxppc-dev+bounces-15697-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AE9D1CFEC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 09:03:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drdrD5vNsz2yvG;
	Wed, 14 Jan 2026 19:02:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768377740;
	cv=none; b=XrswPxlFXMBO7pSZL5um9aK4MvnvwoMw639/cZ+kEUDwOvJnMcv2HQKTZTbPFkTxA+ydg/nRyKlKMa1Kxc8Wt6KZv5nYgV7c7FY4T9MQv+CBVtwWQEvS/GZnwocKWt1BtBLffsgkdCovev9uiYraZ0EVbjQUfgewndwmDIctLay7GGQE5s7cRSaertRCsJy87iMkem6uw3GIKSuGH8asxZLcUr239D9gw78hYQE5K1OZ1BdcY4bsc8U6WqnhJPRsP4Wr+QLzxlCnyPA4hE2HgkYYdpvfHS3KKko6N3uTc2Sh8c3l03yz8be88kgOTECMLLQF9Q/UZIlC5S5izuQ3ug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768377740; c=relaxed/relaxed;
	bh=OgvUl7fZvLFsRnGSveNl7/DD5eX3IjONlFG6m4/kXis=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jJl7n4feYDOEtyWrV1zsXkwXOygDY7wH1yxp2UGOZihAD8kz1mFf8pf6ewD9rHJBra8HnvLib6AMPiBpftFunQQaygpMmuyGDQI6vUZRPmWja0GZNnNxCApuB/xTMpllZv9L9ef+e+RY1xugWJQ1E67YqZsLHnHXXMq5/RxgHQZXHzLgQ8um0A0IqDmwg/1mjhZVKxpusw7ZPS51vo21wF4yehWRxQ7PA45xHSoPPn6n3s/nhXBQsb7KwXRhVZrbK2BmhzLJgpadbT0kbjRvatB0Fb33wbb3HM9pZFRE8KXCNG4bEkjWwFinVN9+YNkURpTRid5FYHDjifMl7vDQIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=vCWAQtiI; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=WNTKAX2W; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=vCWAQtiI;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=WNTKAX2W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drdrD10zqz2xpm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 19:02:20 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OgvUl7fZvLFsRnGSveNl7/DD5eX3IjONlFG6m4/kXis=;
	b=vCWAQtiIU3Wxd7rFg02B2t0bIwqjqYkHndYy0Uyf79vYVMslcQTzhvVeE/m1SfCrUa6FRE
	PTXOMQSrPT21K13gKvoKnLFS6KWiUUnxHw4DxKaOZYu5Zbe1tmfYSXXYDgc/bGLldbvAnu
	ULOdWef2He95wORAmod/Pj7zZDZ2+kzm0d36ogkQks9TqbicVqe1gNyLKdt/K9n921BqBi
	4p7Z6HVJB/GSk9mBLx/3F4JCu/YzF5WyIQrTsm9WYIOpjSdyXHuE7BzUVId2VjLXeUrcaR
	5Ei2h5lm33wqW3y3GQvmk3bg2Z2loHh+L0F//ZCGIre229a4CFoZ6rTlPkvteQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OgvUl7fZvLFsRnGSveNl7/DD5eX3IjONlFG6m4/kXis=;
	b=WNTKAX2WolqSRqQ6QiWJZQ4MY5tUqvJ6en8554tAfOvxm5SzOyi17gkoAypgq2gQnMkBtg
	YHldIiL/6Bppe0Cw==
Date: Wed, 14 Jan 2026 09:01:39 +0100
Subject: [PATCH 07/15] MIPS: vdso: Add include guard to asm/vdso/vdso.h
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
Message-Id: <20260114-vdso-header-cleanups-v1-7-803b80ee97b4@linutronix.de>
References: <20260114-vdso-header-cleanups-v1-0-803b80ee97b4@linutronix.de>
In-Reply-To: <20260114-vdso-header-cleanups-v1-0-803b80ee97b4@linutronix.de>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=915;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=+Wcy7WXtx6fsZm7eFBJhy/yoGaqdcT1tYaHgYzL2d5g=;
 b=t7XGfclDQVcut4P0uQIZeoIZKH/awyXF/occ/9y7qxL+ZenmO6IU5vAWHxRt0qNMOD8MGLdlE
 GxhqnmdA1gsDUk6bg/wL5RRsr1MJ+aaQuEuZcbesWv+QXVekjQFNfF1
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
index 6889e0f2e5db..ef50d33f3439 100644
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
 
 #endif /* __ASSEMBLER__ */
+
+#endif /* __ASM_VDSO_VDSO_H */

-- 
2.52.0


