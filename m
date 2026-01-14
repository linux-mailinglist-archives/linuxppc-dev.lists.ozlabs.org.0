Return-Path: <linuxppc-dev+bounces-15689-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6078CD1CFC4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 09:02:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drdqf4D0hz2yTK;
	Wed, 14 Jan 2026 19:01:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768377710;
	cv=none; b=CCIDdZf9E5ysSuap7oRsu4O9syyLOJdgbbuOGDUwYJRh+1eCxaAIaa7wpd+DKmQNi4qPVm2qN7qFHJeuM8Pkm2DGTyzRu+S0wq7gwiPzt5OWBQ2snorF2YVnjrq0kjjPNM34+GCqky6Bf2RNBPH9jj8kPGxG2WoXPGW1LlyG6kk3/y1L4qiw9dqe5Nmt6+Pk7l1EMKhMiTH+SsJ9p6NPTOSyhj29s+EBJgVlqtmAgBsLnAmMNgueBxuaeBzugtfmZZe3Mc2HV0ylQ2aYrXaS3BpkKvK66OGtftR3LagAdN7qNCkC3Wqggji8I+brQPqeIlOomT2oJxlMXDpIQihd2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768377710; c=relaxed/relaxed;
	bh=wPDeUtfk02gHkXYGBZ6ArUYeEEiuysvRM9FvgAfiA68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RvWIpTnMNJydvzPSVCFn6Iulbob38XK1Js2trJk+OWyF5HUPyx1BvuqyHlR5u99trAYz3Gud0gZz8L39uI0bsowCBi88i2DyluLCwUI/YiL3gAEuxM0dztVWzULhBlztSqCOYpoL6986uVqmxxbNiPMu5+g3mNMpzNdBuvtp/D35z2IhYpqtC8WJVcNObMwDko83UF+LDlATalYH0isnBWOlyyyFp3bwK2AApjW9q4IkKFovJLd70szBxW6vgn5ePO7PdrmhUKxjO7SpYU9EhMN/l2eQqv3fyOzL3jyIi8RSW4/Mtu3UdMKMG6Bez7/XwIjTrDbMzUXExIhFBPibrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=KA+Ept47; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=CkgHGL1i; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=KA+Ept47;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=CkgHGL1i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drdqd6dswz2yKp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 19:01:49 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wPDeUtfk02gHkXYGBZ6ArUYeEEiuysvRM9FvgAfiA68=;
	b=KA+Ept47Bd52d2/CrPrkEZSPfwLpgpLDw4bnKDsi6WumEYorcDbZZKJYnNxG31YwW4vUuy
	gwLhcrBzAdm9l5h+GKhwRtV9yXgQ3+8wXjd226AUV0mBOMn1JQu73HX2f9UuHTnEDqbTbv
	XyVYn8xdbupp6W+zWJHBiJWHPjNu2Tls9g15Q9irbG+alB7Lb/2bIofuJqt8pwaW8IdITW
	O5tBJmikrnAllU6Z45bV2kAF7aII/LibRGnYcEGbcEUbvHREVMDmzCMMrLvhg+je7DvFwt
	KIx9wuGjnknqEEXA+hU0z/AeemLw80m7m0ozqx6HNwzoCPPjEo7vb+y6n+d+hw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wPDeUtfk02gHkXYGBZ6ArUYeEEiuysvRM9FvgAfiA68=;
	b=CkgHGL1i5vm5cOgKwU/TkM7lIjYX5ldER62/KQXJQKU5UBvEIci5xB8RsuUekmoXyNnkhj
	fH1NraHpwS5weXBQ==
Date: Wed, 14 Jan 2026 09:01:37 +0100
Subject: [PATCH 05/15] powerpc/vdso: Explicitly include asm/cputable.h and
 asm/feature-fixups.h
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
Message-Id: <20260114-vdso-header-cleanups-v1-5-803b80ee97b4@linutronix.de>
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
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Christophe Leroy <chleroy@kernel.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=993;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=7hrCYWBIqqPuqZi+KWMOs5v3zvUVJXWvUMyMvUSo5Cs=;
 b=5G8pe5gnO/uaJrl3YNLb+SRx27aTKPHePxwprX/8ayO9vjOBKWD1kl8EpPsqbHsEolHPugS36
 Y5hl6ZC3/d5DaK8Qfv6u5lr6ualVqzmnQ0NAnk8z4scWYc31yPN6e5V
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The usage of ASM_FTR_IFCLR(CPU_TR_ARCH_31) requires asm/cputable.h and
asm/feature-fixups.h. Currently these headers are included transitively,
but that transitive inclusion is about to go away.

Explicitly include the headers.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/vdso/processor.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/include/asm/vdso/processor.h b/arch/powerpc/include/asm/vdso/processor.h
index c1f3d7aaf3ee..4c6802c3a580 100644
--- a/arch/powerpc/include/asm/vdso/processor.h
+++ b/arch/powerpc/include/asm/vdso/processor.h
@@ -4,6 +4,9 @@
 
 #ifndef __ASSEMBLER__
 
+#include <asm/cputable.h>
+#include <asm/feature-fixups.h>
+
 /* Macros for adjusting thread priority (hardware multi-threading) */
 #ifdef CONFIG_PPC64
 #define HMT_very_low()		asm volatile("or 31, 31, 31	# very low priority")

-- 
2.52.0


