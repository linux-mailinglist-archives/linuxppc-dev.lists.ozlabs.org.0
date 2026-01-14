Return-Path: <linuxppc-dev+bounces-15695-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0ECED1CFE5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 09:02:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drdr96GxCz2yrt;
	Wed, 14 Jan 2026 19:02:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768377737;
	cv=none; b=eT9NANQaOeIuAJrWL/Y/FCDjcIROrzDgeNKjpcUAhezKRJMapvUPo0oRQPtt9jZ6UkHLFGZXR6k991ltGOZOZX1e5j03NkL+/h+urDyDfpAcMMQsPw33cIfPEh/4wkFkMEu/zmMiEylFS3QPElV7z7wxRsNZ732y/ZsteBg9DWjZifx0NqG+h15aS6qSrY1OkoFuOZbsYTwn7H16V+1YzzzYa2G6906EDbESDARff5U5PrlmmHOOpkE1+KD1OkPEuuGH+NkxoAEf3Zwt6qw3S0gnNrWIZ4HpoOfd7+b/Mnr3pblmdCNMXU6xIMBBWo4ZSXRfxZQ1QDWDN0wPTUgQ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768377737; c=relaxed/relaxed;
	bh=t+XegyIZZp8VgtWMc/UdNyYxP3JKnwycRhd9Ip+No+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=miRc4Nbpll3TzCBZ0bNp/aEbhMuBh2+g9Fi2fVzM39W/sbIRCQa1S74ybHkmQxeoKKtZa98N3EYUL2a389KJjwvNY2DkjTNX4mNsOB/J6VZFZ1JbKJ3qHcsyMNNKewi3EUi0s40DxRqwStti3PGknyTcd/NibJjAKoSeARnywKNg/dzfijItXSgu57Qc1BilSQQYq4LGEtIfaDWOHHqUlWIO9kzy+Q2M7Nu3lMX8RjERqMh05ym2MID4jg13mYyaLP9q5+SZIg2lsPqD/s1XW9t49lphDrANrLBjNox0JUE9jAiUFhtRB8mrIBMEgJ8kz9cUiMIqx7B3vykhdZp/AQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=R86PWwrt; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=BOEEtN5s; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=R86PWwrt;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=BOEEtN5s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drdr91zffz2yYY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 19:02:17 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t+XegyIZZp8VgtWMc/UdNyYxP3JKnwycRhd9Ip+No+I=;
	b=R86PWwrta6wRViX3oe2B+0G7JaG27PSaukjBa6pWWkxgv2OnRsLcsJE57gOMAUPBkZhr53
	o+0j2fF6uHnc4qyyNKRnyFUvgQvUiXfMEezvmdgo54W4GN//xaoccCz/1nME2Kj1SulIqZ
	0ZqcK/0T2Ndk420N2juT+ha5IrLqdVuVsxV8qn9kUlxLzUCjdUOLaAskKOXITxm+g76F6B
	t/MMn/U5wGy14WUVbOtStsjbEkGgV/wzHRWBtikN6wG8r70gAdzSzzxDqwO21ryxgDK0ro
	1dqSknbUVkopn0p903FTTI9PAflkzXUshGKp7J5riIOrpXufC2dC2y1StpfDDw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t+XegyIZZp8VgtWMc/UdNyYxP3JKnwycRhd9Ip+No+I=;
	b=BOEEtN5s026PkzdcYp/EYq6nREV5zqKoB7nqsnPOdwtDtGMMv9vCxLG9G6oGeUfE/pLU4z
	lKcKfZoJpNyHumAA==
Date: Wed, 14 Jan 2026 09:01:35 +0100
Subject: [PATCH 03/15] ARM: vdso: gettimeofday: Add explicit includes
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
Message-Id: <20260114-vdso-header-cleanups-v1-3-803b80ee97b4@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=899;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=vbsis2SPCTtEZ4XgoR3kowjwtrHTWI5LshY6sBG6vPg=;
 b=KkQopiJj1U5HqPykgIJsIJ8zy8tprX6k7l/rsqIsT6WdWQJRwFyCFccpE7kDW34aD1vM4DG+3
 97uAQRDhS2OCVLwRMwJp0CJXGzCBwsjDe+LzojO2GxppEjNXxlP68sr
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The reference to VDSO_CLOCKMODE_NONE requires vdso/clocksource.h and
'struct old_timespec32' requires vdso/time32.h. Currently these headers
are included transitively, but those transitive inclusions are about to go
away.

Explicitly include the headers.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm/include/asm/vdso/gettimeofday.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/include/asm/vdso/gettimeofday.h b/arch/arm/include/asm/vdso/gettimeofday.h
index 1e9f81639c88..26da5d8621cc 100644
--- a/arch/arm/include/asm/vdso/gettimeofday.h
+++ b/arch/arm/include/asm/vdso/gettimeofday.h
@@ -11,6 +11,8 @@
 #include <asm/errno.h>
 #include <asm/unistd.h>
 #include <asm/vdso/cp15.h>
+#include <vdso/clocksource.h>
+#include <vdso/time32.h>
 #include <uapi/linux/time.h>
 
 #define VDSO_HAS_CLOCK_GETRES		1

-- 
2.52.0


