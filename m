Return-Path: <linuxppc-dev+bounces-17337-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FWfMmo9oWnsrQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17337-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 07:44:58 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D794F1B362F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 07:44:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMf2S16WNz3bp0;
	Fri, 27 Feb 2026 17:44:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772174687;
	cv=none; b=avXpFGQysOSjd6VhWKMiQy4YkREpOEWig+4tRd2j8ac12PdjJnJp+BNhvXrrh2kBHSOD3xHyn+hX8P+4NsyHaK2mIKi3xXDJa4HGpRWGcxROMJfPJOadI4hqhhlqSpppFp8tZRUA8NI4M+0PE587skZ9qdI5MN3uKG8yh5xt7ooigl7VOKyS5ho0QPu7sPkyGXRD2YD+CKrLyRPNApq44fNvhFYhrUx1+tIGnYaCDnYFjaVM1jH/s8mqfae3+Tq8KVrQMQf/1NNQg6oo8w+IY+SPoKIBfF0dJ3YG92NlQg8fBz2O6t9q+Sn0zXRSxMBjAMbw3SBXHsb7FE8sraH/yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772174687; c=relaxed/relaxed;
	bh=xJvj9oQFQeeMCbDd+GICAEc7FTw0NbC/VPhyAd1JJKo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dxIKSe5uKcPqNUFRrUSIf7yOxS7HORhC3BUC+qTRAip+NqQG1kRXQWfjqrZu7mvmSICUAQU3+GTKC2wP+BsW13IRSpC1ggDnGpsR0pDbjoyZ8bGwiF7YZ6ubSpGvChbx4Cm+e6Wx2Gs+i1LZgpl0tBIHkVBapS1Eu1hd9UhEm4buTQ9f8kTATWS0l5tv4ZAiDY6dH/9+RhtqqF7/JJqFnfbnLIrqzvS+S0Me9Pp8bHVIj9zcwyzLt19XUAW6/0O7eH0ynXEqbG2QdbMdf2hALxwly0jA2w8QDU26PoUIeEDGUmhcnrnywVymS5IL7vXFla9RJ2cqRKCeFEqejn5Xaw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=M85pSVFQ; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=R9NsRIvi; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=M85pSVFQ;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=R9NsRIvi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMf2Q1JKtz2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 17:44:46 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772174681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xJvj9oQFQeeMCbDd+GICAEc7FTw0NbC/VPhyAd1JJKo=;
	b=M85pSVFQdCyhtVthb4y3GdgjGae2qjnUR2acQJS/2Lz6ZG5gaWw+wfjB40Qze/eavODE6u
	ZfIOjPPAKbm/OV+pNLogLSoSIMlSVrz9xk3cG8Es+YowNSoTyYvmK54lERaBho6Q/4qFL7
	j3dkg3kLv/Zic3xdbtAZIb7YfyFPFZ4gFIjbhRWxNire+kIhHbIfkn46ylr6pUDvC/Wi0W
	gRt8oFP6BdPOVzyr9fOLDwhMxbuFtRE4r2Cr8ro0jk7B0RRAL7J8LFzRpkXfTe2pf65uvS
	e6oAGaRbMoZIVglqn6olNqsRL68TX3BO9O0dq7tWIDGmB3rU74bwh3khDIbIpA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772174681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xJvj9oQFQeeMCbDd+GICAEc7FTw0NbC/VPhyAd1JJKo=;
	b=R9NsRIviSPQjcWSg0uQHOs18QhYxOdO58Gzs91l8uNso2iAl21Qya8XrkfoOaM4mLlsg/r
	y1Jn/BdTjCVaUCCA==
Subject: [PATCH v2 00/15] vDSO: header file cleanups
Date: Fri, 27 Feb 2026 07:44:26 +0100
Message-Id: <20260227-vdso-header-cleanups-v2-0-35d60acf7410@linutronix.de>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7Zi2IiAr72FYFDrYSUhLWmgwh
 LtbuYDL95L//g6RAlOEttghUOLI3mVQlwIGq92bkE1mUEJVQsoSk4keLWlDAYeJtFvniEaNWlX
 1vSEykKdzoJG3M/vqMluOiw+f8yXJn/0TTBIFNuLWN4LoUfflc2K3LsE73q6GoDuO4wvZQ+Q/v
 AAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174681; l=2786;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=zI4WNBxKE1oqYDsbwbv7mmrObw8MTsILZFRv4cugSQ8=;
 b=erC3nB1DKmuQs15OOkp3AAhmZKYK9eudzE8BP0VU2g3116caadMiZY0nDvfbDDgVCnj/hub0/
 Uaq1gn9VKGWAp3F6pRbxoqspNNYnUpIHkC4zAS+KyqX4uXIR65801d1
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-17337-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:catalin.marinas@arm.com,m:will@kernel.org,m:linux@armlinux.org.uk,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:tsbogend@alpha.franken.de,m:luto@kernel.org,m:tglx@kernel.org,m:vincenzo.frascino@arm.com,m:tytso@mit.edu,m:Jason@zx2c4.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,m:thomas.weissschuh@linutronix.de,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[thomas.weissschuh@linutronix.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,armlinux.org.uk,linux.ibm.com,ellerman.id.au,gmail.com,xen0n.name,alpha.franken.de,mit.edu,zx2c4.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linutronix.de:mid,linutronix.de:dkim,linutronix.de:email]
X-Rspamd-Queue-Id: D794F1B362F
X-Rspamd-Action: no action

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
Changes in v2:
- Rebase on v7.0-rc1
- Link to v1: https://lore.kernel.org/r/20260114-vdso-header-cleanups-v1-0-803b80ee97b4@linutronix.de

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
      random: vDSO: add explicit includes
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
base-commit: 375f574d703d3af5174d6357d3ca8990bd4a1e42
change-id: 20260114-vdso-header-cleanups-d2fa26758eed

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


