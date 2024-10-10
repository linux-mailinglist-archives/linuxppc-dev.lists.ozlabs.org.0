Return-Path: <linuxppc-dev+bounces-1941-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E155997E5B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 09:04:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPLKk6YF1z3bwR;
	Thu, 10 Oct 2024 18:02:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728543738;
	cv=none; b=Y1qpDlMT2FBEcvJb7VYYZ9+OnfXYPrMsdWPgStEzkkCZ8lt/Pk10/wV+PsQoACYWC0C8a6KdH/9kja782Pv2tft6lWoith3snNVu0FFZSWL+lSKw7dPmrvtcCYxyIB3D4WE+ppceIZOQIoOjFhQ45t1RB+Q1Oijzpf+eGaDlXVeuAXHWmw2XvWAUeukDm+QzL0iZ4d7TWj2M99Ia5e65tEwBK0ecN/QGecatqzYPewpL858GL2hYbZfssS1xSUvGhvo+lGQTC7NNic8M32ZIMDUO/oE8gTaYvA6W6FY+3Q7XFRFnMOEIn6xHoDdlFwA6k8eALTEgof0IgmP4RRTkXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728543738; c=relaxed/relaxed;
	bh=KSbAwh0OU3zF+2tR9EWcVzlag/ghCJTrirF1U/EmWUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cUPuu3BZukbLvhURoUXfgXgJPK4D6HXWwtoQEMkealrHEuYbLVZwBhbwPdFOg5Xz9wXv5qJmmRyrIDjyuGzHPo2a4Bl85LaMxicpYUKE1gjFUFflWjzS+BGB/wRqePofFy52tgW9Y5ObFFzcPt37RqUBK+YkYJrE8Sa0opTm8QpIWLeCBMFIn3Fy0ZFeG3bxEdlLB/rmA8G/vZe66uyTYWIc5+It6z78Vbr7G4Pc19hSWanWx3bH80oaN0Lwn2s77Mu2PWWZho7siIxZPkCOxv6gJKhcI0dRpBWjaUQuYfbcLDdNSn8cqkSVwLb3P9v6kYfVlyo7MRQdsVpBbSn+Ng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=fT0XYr4b; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=RLtYsY+x; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=fT0XYr4b;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=RLtYsY+x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPLKk1lvMz3btl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 18:02:18 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KSbAwh0OU3zF+2tR9EWcVzlag/ghCJTrirF1U/EmWUc=;
	b=fT0XYr4bt3T8KG54HnN3IYu2UZ0oTO+t6RT7qYYVQ5ARIpM6klUk3a2g0UECskgVzPJfdN
	VT6ZV16Gf1SZohSZwi/MhptGx/HtmLY7jjmapoXCxbKjWk+DXYGNIb8s/wBv0s96WfT8B3
	anvuKC8obtknKT/40GHIWCtdpiHFy0kip7ZlHlcF5yTR/pRYuUl6zaluvDOjReafPMqlbr
	bxp2t8chniqiO6W2rONnBrnLNcFpA3e7mFUcmYnHHbKpxNrRG2exEH+hX1EOvrVu0rhwRP
	54szeRYq9V+rGF7eaeewh09tD2xsVlJoD++R8Xl1eiU0kNaZf3iVydyqKa/wcw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KSbAwh0OU3zF+2tR9EWcVzlag/ghCJTrirF1U/EmWUc=;
	b=RLtYsY+xUckUP0mZzR4vMb5ox7tYb5/K6vCHcQmXEE2h+d6EE9vVy/zlRHhln4NALyW684
	UK3WXX9KOUIHitCg==
Date: Thu, 10 Oct 2024 09:01:23 +0200
Subject: [PATCH 21/28] powerpc: vdso: Remove offset comment from 32bit
 vdso_arch_data
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
Message-Id: <20241010-vdso-generic-base-v1-21-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=977;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=XEWFVUSPeF1jA5lPR0wVB+XVxyxTVSWbfiAECWo8WxA=;
 b=am78tsBd74RSO+kD9Bu9TdSyO3ydCuUjYTZu3uyOVJurwtzIFBgZGPAxHaCrBfouNaLGr49Ox
 fsYzkbNAIVfDQitCU8gng++Dlgtv6VnR21Em9CwtI8nf81CpBJx+Yzl
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This offset was copy-pasted from the systemcfg structure.
It has no meaning for the 32bit VDSO.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/powerpc/include/asm/vdso_datapage.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/vdso_datapage.h b/arch/powerpc/include/asm/vdso_datapage.h
index 248dee138f7bf5dc11a9490a97f4a3917bc46e92..3d5862d4c4e1618a27840d9136e890870e78a761 100644
--- a/arch/powerpc/include/asm/vdso_datapage.h
+++ b/arch/powerpc/include/asm/vdso_datapage.h
@@ -92,7 +92,7 @@ struct vdso_arch_data {
  * And here is the simpler 32 bits version
  */
 struct vdso_arch_data {
-	__u64 tb_ticks_per_sec;		/* Timebase tics / sec		0x38 */
+	__u64 tb_ticks_per_sec;		/* Timebase tics / sec */
 	__u32 syscall_map[SYSCALL_MAP_SIZE]; /* Map of syscalls */
 	__u32 compat_syscall_map[0];	/* No compat syscalls on PPC32 */
 	struct vdso_data data[CS_BASES];

-- 
2.47.0


