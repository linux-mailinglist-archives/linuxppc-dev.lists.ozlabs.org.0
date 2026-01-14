Return-Path: <linuxppc-dev+bounces-15694-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F08D2D1CFDF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 09:02:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drdr91sWNz2yT0;
	Wed, 14 Jan 2026 19:02:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768377737;
	cv=none; b=OVaxsbxtG9Ik/E8aCtDTSJuM02NkhBg9rYD0uCyK9o0BGrDMXb+TaX9E7/m6XOwRRq5e0AQByOutxLBoy8CP99l58kk0n5fjjhLLWfcTnRGQuibrlV9CoNp6raonE4cF7z9Gwx89n/yOsN1h/cdsCpXRCEjow/ghxFUbxGpKMx6+gqk9DyuV4odS+H7Tmdfnqm/nDD60pfttTdfHC4F90kXivTLBtcz5CN5J8QWq/OKjZtLBw/QQeSOBScz6KhNG0rbyc5ClIxiGp/y9Zgwar6gOlbYW5qDQPtiiLx+B41o/UcLamZfgMVKtdpxIi164IBrVkTE3/VQd6WFeKppYlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768377737; c=relaxed/relaxed;
	bh=2Wh4jYBxUbDqkNC1LyZsqlM3fF48oaskW5vtJOy/5AE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VjSpUHlLDhr4umvjzDuCw7h/ZzMwvq0CVmmjzkJEjc5cnGSeAcp7VFAJN1E8GWyOjAK++OuAjnUdyMRVYNBA/ivRJmB5LrlRri+upDT0npW77nR7i4jvffDsZfUOUnbt1cO7MC9plK5t9FBi0tu0E/JtDkXh8b4YJm7Z/hVyDuUbGATV5JETqYAV2Yay+1H53dz1Zy7ZF1oNNg6Ma336goFAZbXwDxXlrvEeqVWjiUgSAo4lGe/pJV4FzznP3Zx0Y+Ug6C5UbSwcy7NU9PIEQzJ1FqVKL3qVNBnKgXt+WAuV5WBtfgGEPiVohEWrHaUCNST/5WiWcBcQLYLf8zm/Gg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=B/iA5OeX; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=6k4Q9ySm; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=B/iA5OeX;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=6k4Q9ySm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drdr83XFvz2yFy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 19:02:16 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2Wh4jYBxUbDqkNC1LyZsqlM3fF48oaskW5vtJOy/5AE=;
	b=B/iA5OeXAur8JmwDoCwohBXj5/k5Yo2gcwe3o0RJcEBOSn/c0XpOiJi0QLEvYKosn458Tm
	lVHPdt5F+3Msn1ECJoqAN+FfS7Vxyn55S0455CCZjOuzojBHKsJ39ozWk3UcnPPKMZNqS7
	hZXYeN8TRkyHg53+0YVQ4XI+QModRkQW/Z7UPTtcbkhhS8nQdgRvxgFEj3jb1sFNWPijE1
	qYMBxuWTbMEIs82a0u5lvSBQ/StTql8GWBzttqhP2sOYFTW+SH9bXeHaupsEPaboOnL7aY
	IfVBwGvuCJJwxXhwXqlJ/W6KaI7TSdQXwS/5zdDLtb8JIrmWg4nM4Ir2c2BP/g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2Wh4jYBxUbDqkNC1LyZsqlM3fF48oaskW5vtJOy/5AE=;
	b=6k4Q9ySmGiSqe/Wl/g53J8lWw1+8PDQYKK+d0zSkhvLtA0LQzcuuswimj1Nc/vJOsrR6i/
	7K3kM09t27bybADQ==
Subject: [PATCH 00/15] vDSO: header file cleanups
Date: Wed, 14 Jan 2026 09:01:32 +0100
Message-Id: <20260114-vdso-header-cleanups-v1-0-803b80ee97b4@linutronix.de>
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
X-B4-Tracking: v=1; b=H4sIAF1NZ2kC/x3MQQqDMBBG4auEWXfABLXiVaSL4PzqQImSwVAQ7
 97g8lu8d5EhK4xGd1FGUdM9VfiXo3mLaQWrVFNoQt9433IR23lDFGSev4jpPIwlLDH0724AhGp
 6ZCz6e7bT577/RIWjG2YAAAA=
X-Change-ID: 20260114-vdso-header-cleanups-d2fa26758eed
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=2638;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=wxh/lZEHTjkANuO+cr6cQs6D3XRXTHRzPbOQhCiCkSU=;
 b=GPjYp3y0vRDRH/x6JUzAXDk5XmpceiZ98m4XhE7M/WdobqKe6qNt7YHiUbFhKtNSYJ+eDaEQW
 OhhAcGtQ/qyC4aVLK5G++gEsO5qqE8nHuOLHAnTHs83uq+LCjyDkzD6
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The vDSO header files are a bit of a mess, relying on transitive
includes and pulling in much more definitions than necessary.

Clean up the headers and remove some ifdeffery in the rng core.

This was originally part of my SPARC generic vDSO patch series [0].
After feedback I am reworking that series and it may not require these
cleanups anymore. But as the code is already written I am submitting it
here standalone.

Based on tip/timers/vdso.

[0] https://lore.kernel.org/lkml/20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de/

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Thomas Weißschuh (15):
      arm64: vDSO: gettimeofday: Explicitly include vdso/clocksource.h
      arm64: vDSO: compat_gettimeofday: Add explicit includes
      ARM: vdso: gettimeofday: Add explicit includes
      powerpc/vdso/gettimeofday: Explicitly include vdso/time32.h
      powerpc/vdso: Explicitly include asm/cputable.h and asm/feature-fixups.h
      LoongArch: vDSO: Explicitly include asm/vdso/vdso.h
      MIPS: vdso: Add include guard to asm/vdso/vdso.h
      MIPS: vdso: Explicitly include asm/vdso/vdso.h
      random: vDSO: Add explicit includes
      vdso/gettimeofday: Add explicit includes
      vdso/helpers: Explicitly include vdso/processor.h
      vdso/datapage: Remove inclusion of gettimeofday.h
      vdso/datapage: Trim down unnecessary includes
      random: vDSO: trim vDSO includes
      random: vDSO: remove ifdeffery

 arch/arm/include/asm/vdso/gettimeofday.h          |  2 ++
 arch/arm64/include/asm/vdso/compat_gettimeofday.h |  3 +++
 arch/arm64/include/asm/vdso/gettimeofday.h        |  2 ++
 arch/loongarch/kernel/process.c                   |  1 +
 arch/loongarch/kernel/vdso.c                      |  1 +
 arch/mips/include/asm/vdso/vdso.h                 |  5 +++++
 arch/mips/kernel/vdso.c                           |  1 +
 arch/powerpc/include/asm/vdso/gettimeofday.h      |  1 +
 arch/powerpc/include/asm/vdso/processor.h         |  3 +++
 drivers/char/random.c                             | 16 ++++++----------
 include/vdso/datapage.h                           | 23 ++---------------------
 include/vdso/helpers.h                            |  1 +
 lib/vdso/getrandom.c                              |  3 +++
 lib/vdso/gettimeofday.c                           | 17 +++++++++++++++++
 14 files changed, 48 insertions(+), 31 deletions(-)
---
base-commit: dcf5b55ca66160879205b1ee7b9b711751070edd
change-id: 20260114-vdso-header-cleanups-d2fa26758eed

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


