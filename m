Return-Path: <linuxppc-dev+bounces-15688-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E982D1CFBE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 09:02:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drdqc4RTYz2xFn;
	Wed, 14 Jan 2026 19:01:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768377708;
	cv=none; b=PHtF2lgXDZqn7v5C1UubAOA3fRYQpxEybpJ4aQMN1Z5usfRAfMtwIC+Xukuxvp1Hs+WnVDqVpvdTnie10+RAQbG+DEbZzwMqzfQc3UB5F8lLqq+zQvozDRzkPjtv+FdWwQHHo9lyz3ncVSO4eQlk0BKqYVbNohMJl2UvmqpGQ2XNN1yu5XSOb8PSxLMjP97sf4iXGGC3G4JXkJgHq/2hwvJl6eLTQ3+i/gg5t6r7erqQKdbORf/WDhicwg054F028H1Euh5TnziZDqstUtjwwLi843aD/0BGtpcl1wOVTrxSYuDvgw4cT4rLLP8c36vj3BZcVg3QRhWUWccSzN+iiw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768377708; c=relaxed/relaxed;
	bh=zf5YPzBQZDKrsTEVEPeYB2jMwqKC6r6qPkNYPXsVb+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C1YAs8RfFnK61Jyydc2VyQQiwPrxhYRIx6P0deAUOaT9qlM8CbjiWqqkaEMQVZ3u4JiMDVrzOGnORV6FWG1PhatmSvsY8TIkIwFwTcny5LbcTali+YsJtPeajXXXPd8SqS5FIpRNs8XeauZpQLexKMQl2W9zjAfC8LhB8lpJAW3k6CRuB0L14i/Dr+73/lpub5UY3/V/CNQQ5KNiaQbCyW+DmZ+Ta7ZXFmPli0OMFB67VeS6HVRj/9U22WxZ2+4NSh+IFaxG/YIanb47FMlJHsj1KV3iwFzyqGVzel/+H9VwPBpqXnK95ZRBNrdug9vQOpVhg18a/ZKWT2e89vn0hQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Gat/DG50; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=0ACNizg5; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Gat/DG50;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=0ACNizg5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drdqb6bNmz2yKp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 19:01:47 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zf5YPzBQZDKrsTEVEPeYB2jMwqKC6r6qPkNYPXsVb+g=;
	b=Gat/DG50EAv/3EUc+6tlnCSA4nVoo2IOEVoTzpJlC8YhGCU8YB49JbSnusWsGweENp3pD6
	MeCm5iMMeRVNtRaZTECKU36redthL+vR6zhLgbGcuqkBqEcG9YSHWl4kEiQrXWjIaga+59
	8O3wGFUmyTObNW1QwcHo6u6UFvqZUdSUNy/NDFpkNnB+qN9vZ10o/AlJWKdgkLCZq3bsqU
	gqUqMUJeLCmQyPKLx8xiluZPTnzLx1ZmAusMQKuy2oD6ESW/LmUX2Peh9p2T0OeCQFpRA+
	lF02K+yP8Mk4lLVr6G0+ld7Di1EHWe9X9mhTGYyNqLI80GqN7t33iQGuGGbWNw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zf5YPzBQZDKrsTEVEPeYB2jMwqKC6r6qPkNYPXsVb+g=;
	b=0ACNizg5JT1Theaq397XvnVuytrcm3g1AHlXzaxE4xRWbheQ3cG0n5NLWSi+EampNnrqDE
	rLoaSZmZWv3GenBA==
Date: Wed, 14 Jan 2026 09:01:36 +0100
Subject: [PATCH 04/15] powerpc/vdso/gettimeofday: Explicitly include
 vdso/time32.h
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
Message-Id: <20260114-vdso-header-cleanups-v1-4-803b80ee97b4@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=856;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=CY5CpcPjq39MxqXMgbeDe7Nib98JfeTlvdi5xywuqgU=;
 b=VaXzMveM6w4lOMIzZU6BEqJfNH9Cy5CDDT+7C6Azm9qkQOzBblUXGxZ15dzSZ0L63+fWF8qtf
 69bxDBriopJBCPBqTO8UjWYD6IuNUPAiExJ1TXcZbUCW7yYe0bsacma
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The usage of 'struct old_timespec32' requires vdso/time32.h. Currently
this header is included transitively, but that transitive inclusion is
about to go away.

Explicitly include the header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/vdso/gettimeofday.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h b/arch/powerpc/include/asm/vdso/gettimeofday.h
index ab3df12c8d94..b2f0e971076a 100644
--- a/arch/powerpc/include/asm/vdso/gettimeofday.h
+++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
@@ -8,6 +8,7 @@
 #include <asm/barrier.h>
 #include <asm/unistd.h>
 #include <uapi/linux/time.h>
+#include <vdso/time32.h>
 
 #define VDSO_HAS_CLOCK_GETRES		1
 

-- 
2.52.0


