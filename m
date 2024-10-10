Return-Path: <linuxppc-dev+bounces-1933-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B44997E45
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 09:03:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPLKd6xbvz3brc;
	Thu, 10 Oct 2024 18:02:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728543733;
	cv=none; b=ArT4GNBQuS1JCJ9soRmuRwSfBO5ffA68jFbyyCanT/C6f5esxncsrqGTDK69ZareIWKVbyEEiPWUhXEp9I+jSQkykkUsyc7Hnygz2cYpPfy5Ek8V+UNa3lTBNup3dnADS0SQiBzrRpgdGi/Dsfy1riuDl86Z82/IaTz8ptMsDly0c4A3Adc5Mv1ze6CAlSzBFVnPvs2vu/gwyJ1j9QKI2TvcUuTiNRUzULIETaY0n40985WMd7GF3vK/J9zbwH4TBMBDHuX+7VVt77dLkOBJNTw8rIwuE/v+YUKnzAcbR1REtaE6yYsfuspofkD47Fial9Nt8hX5eiRAoel5E8/I+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728543733; c=relaxed/relaxed;
	bh=PwmVSRYHSb9/NywpACjYo1hL5y3FHne1vH2pikuaTow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TNClUuwtFzOdz7EArbXcFp9O/jJUc4enm8bZv+G++voJ4ndeAr0hj1oxhGKAiUCWByDHd9TncaBQC6WQ5+/CJqJlQxIiCtPsxVKx8OY46Oi0eCFE+omwmn1Dt9oAghD9JBPq+dy7gleEJcCq5VI+fxDYIoqXsyJ8pwY6z7Q5+d5O53tycex5asWQhLU61+0rhTu4q3baDW9CP7cdoYG/asE/JHeTlqhrP8EXZUFmOcD9E4MOEpgYhLBi5UwrZhfo2h3ZX0HRsfOK7egj6xMedFUS56yTF/UO0cJEmEIrc5L2T2zUefiI/r9Zgdgu1+f0XALcCnpWsxN6L4ow5LZ0nA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=YcZEzOUd; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=iyMEQhcf; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=YcZEzOUd;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=iyMEQhcf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPLKc37Qhz3bqW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 18:02:12 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PwmVSRYHSb9/NywpACjYo1hL5y3FHne1vH2pikuaTow=;
	b=YcZEzOUdhlXiCUo9zBxtUEs1lRTFdUtoFZifHE65r17ffT91v48OykPMk0gsduWWnaXFnl
	QI4eADY1DxC1AT3lzNl8lysm9YCa7HnRo5mJcvO2W3L+xJOEvgW6fFbb2DiNKt3M/muTmI
	qVsmg5cNSfpMUhVMQ3xH4EG8d86mbmfH9NQp+zIkVfaRcEkaji8Pc2CznEzR9Buur86WOq
	DHvJY+63fQFNJ/xurgm7CZ6kF0HzLbpiK+ghx0TT/2mjVP+EeHfeboTvz4ubEdmUh3lZDp
	6/HrMR4WkAOYEwuxVs9iRv2xO7Rly29CgjXTkxYlkeAItbnYdrzryLbyddjlGw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PwmVSRYHSb9/NywpACjYo1hL5y3FHne1vH2pikuaTow=;
	b=iyMEQhcf2QKpwhtXbu94btRjqz9d7oSo3Oe/vNDfj7ibZpre7LVj0Tw7sOLjCRJ54vanch
	RAVT0BDFlUfpQxCA==
Date: Thu, 10 Oct 2024 09:01:14 +0200
Subject: [PATCH 12/28] x86: vdso: Place vdso_data at beginning of vvar page
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
Message-Id: <20241010-vdso-generic-base-v1-12-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=1094;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=26zrKbXgaegtQRF54QahNJ7RqrsVomxOEoCs/TkZNvU=;
 b=cYpXZmqDh/Rorow/qfQz39qv6eqMnL/Rmdtt5VCTnsFoAYqSwN0e1dWkEh7d9D9sfDeqwtaYF
 jcGpydVABZ8Av8SYTSumXQRs9n9uAnjOWL/Jc4Q1I+J59hCir5Y9t1C
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The offset of the vdso_data only has historic reasons, as back then
other vvars also existed and offset 0 was already used.
(See commit 8c49d9a74bac ("x86-64: Clean up vdso/kernel shared variables"))
Over time most other vvars got removed and offset 0 is free again.

Moving vdso_data to the beginning of the vvar page aligns x86 with other
architectures and opens up the way for the removal of the custom x86
vvar machinery.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/x86/include/asm/vvar.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/vvar.h b/arch/x86/include/asm/vvar.h
index 9d9af37f7cab9e3e6159c0b758e500ddcfc6b3e8..01e60e0f671e9625669dc8fdacf3cdddf8cbf4fb 100644
--- a/arch/x86/include/asm/vvar.h
+++ b/arch/x86/include/asm/vvar.h
@@ -58,7 +58,7 @@ extern char __vvar_page;
 
 /* DECLARE_VVAR(offset, type, name) */
 
-DECLARE_VVAR(128, struct vdso_data, _vdso_data)
+DECLARE_VVAR(0, struct vdso_data, _vdso_data)
 
 #if !defined(_SINGLE_DATA)
 #define _SINGLE_DATA

-- 
2.47.0


