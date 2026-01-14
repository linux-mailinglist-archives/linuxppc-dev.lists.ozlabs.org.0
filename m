Return-Path: <linuxppc-dev+bounces-15693-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A2FD1CFD1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 09:02:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drdqp0cJzz2ynH;
	Wed, 14 Jan 2026 19:01:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768377717;
	cv=none; b=Bk35Gny6zL/OjP5zf/4VZK//meTFUKdltGDVUZO4iqaERK2LOJvZyuRDi6EJuxF6RiUgfdbrUx8EmdtN3U9CdwP6EqT4Ondi1vrZ7AzyLx09i2eFi4GrbQT+m6zIQItZoq1IgDVtzZInDRTRgAiVWdfE67hnBzkrFzBlL1zlxguwucEnNOlYXILlgTTccVU4acwq6DHOFXDGlwwoGNr8fNOhydtgLvllmXRv5IGVZ60wTJhHgCX/rDtfEVHJkmPGsvb7wBPw4jbWHaJKAd8psl+Xs4qy/f9eD0R3HMJA6M5Lw+IN9yClV9PQ7WhdyGFCKwnt/ftH7cmSQcEdfunZ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768377717; c=relaxed/relaxed;
	bh=AteQZ3KBIfsVSOXUBvv1Cta9HUtHJMPoDJ4rOsFT/ag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VgbwVIBwKlKJxq36EB2uuX1vXvq2kavhF7vM8IiQokBy2mPZpJ4Wl0c6GE6fs2Yh1J60x/IYEBYfbF0R02EcB3qrZzPbNvyjHW0YoqlkfAJ9CiWmnziOrL+rfsixV51stg88yEu5D5m/5XPO2vNo9LIspprNwW2bfAT2paEzKgLLKUELZ8CwNM28kBuC7Lmlzc9er4crb/pxtPZde4E2XfPnwTrzGhEA/yJdArmkSE0RjNTFCw3RHoYenI3EcQhoBRTpUWj/P5iyYE3k8QBS0IyIfp1bspjisSD/IN1LokkUVRQJ1k6gMkb98q1vhq2IDqyYQP/3DUzMaFOTiapXnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=SqgWA4bk; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=7pron36K; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=SqgWA4bk;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=7pron36K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drdqn0RJGz2yYY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 19:01:57 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AteQZ3KBIfsVSOXUBvv1Cta9HUtHJMPoDJ4rOsFT/ag=;
	b=SqgWA4bk8SrK6zjJ4XxmwFz+y9tDmHRhrxGxhxl3L/2r2LCR3aoaky67UPQb3Yo2OL+SAZ
	dqEWaBVQ5rsSIViEw2ZmEFFOY8Iaozzv/32+2oCvOLVra/IfN0M5exCxWLzjXGVUTaXhPm
	Cfnbttb4fJrG1BvUQ6dcPkB6I0p/TJdERpSCRzjMapdsB4D3lBDHFvIApWUIalsKjSKeB3
	HZ3Q3KZJo85miX/EGLFz24mL0M/W7KK6QPiW45oT+vNjeBp6aVI/BWVa4uRDEd+sdnBxz8
	fdjlnGTb09ljHzIG/7WGjRgPQEdWVabnJXSo9kk0L+HQavOOYVV535TKUIqkXQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AteQZ3KBIfsVSOXUBvv1Cta9HUtHJMPoDJ4rOsFT/ag=;
	b=7pron36KPlFyKJz/lpVdvxza0tvjCOJMz4XVlJ7RXgQLmi/jBCCgjvMsNC4VxsjSLC8Wn+
	vQdi+GyFR/2Z/IBA==
Date: Wed, 14 Jan 2026 09:01:45 +0100
Subject: [PATCH 13/15] vdso/datapage: Trim down unnecessary includes
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
Message-Id: <20260114-vdso-header-cleanups-v1-13-803b80ee97b4@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=1385;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=g995SSm3uWzL44zLMQLhSq6MK4ouj0wlKz2rgfV0H+o=;
 b=GPOpY+Vh6GpRmj4NnspZfPS6Ur+/TqTHzwbWR6XsnTo2sNXRqpvdnzL0aWD8kRJSVfR2QvHDz
 ykPZv0hL9FFD3T2SL3t5+WRKuyHf1BLRHxL1Lno0Tku8oA1taiA1uim
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

vdso/datapage.h includes a lot of headers which are not strictly necessary.
Some of those headers include architecture-specific vDSO headers which
prevent the usage of vdso/datapage.h in kernel code on architectures
without an vDSO. This would be useful however to write generic code using
IS_ENABLED(), for example in drivers/char/random.c.

Remove the unnecessary includes.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/vdso/datapage.h | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index 752856b36a3a..9021b9580be2 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -4,24 +4,16 @@
 
 #ifndef __ASSEMBLY__
 
-#include <linux/compiler.h>
+#include <linux/types.h>
+
 #include <uapi/linux/bits.h>
 #include <uapi/linux/time.h>
-#include <uapi/linux/types.h>
-#include <uapi/asm-generic/errno-base.h>
 
 #include <vdso/align.h>
 #include <vdso/bits.h>
 #include <vdso/cache.h>
-#include <vdso/clocksource.h>
-#include <vdso/ktime.h>
-#include <vdso/limits.h>
-#include <vdso/math64.h>
 #include <vdso/page.h>
-#include <vdso/processor.h>
 #include <vdso/time.h>
-#include <vdso/time32.h>
-#include <vdso/time64.h>
 
 #ifdef CONFIG_ARCH_HAS_VDSO_TIME_DATA
 #include <asm/vdso/time_data.h>

-- 
2.52.0


