Return-Path: <linuxppc-dev+bounces-17354-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJllEX5AoWnsrQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17354-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 07:58:06 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7321B3950
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 07:58:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMfKY1FGsz3c5f;
	Fri, 27 Feb 2026 17:57:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772175473;
	cv=none; b=R8wrfbamYqanD+15ZNt/5fL2DcO1hVIniqzboqRAPxfVdShyKUFOdsZHjLG6YIjWJNddTIIAsNx82i2sn2tFDW5JXmXMYvfMH46xuz2jrtOSJn9PwRz7ykncHt3eyuH5hdI2rbY9+vRGHbHAXD9R3srLvxseqrzyI7W2HjmY7VRNaL/UeEhCYASEIBxm7Yd8BK2aUc7ZZxNDanTxh/fwtVSKPme2+jH2nTjKEexAwDaGC3D/3DEWDCz0WfiEeAjEbWO6hT/1hTIo88l0BdvCufyUtWwtT2Du/78Oi802er4JFav4mbMdXEXaoFT/10L1kvoFcCfIl1fhvCIpyKjcGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772175473; c=relaxed/relaxed;
	bh=HtbZMuKPuZ/Q8N4tWs6O3IZMokrlUXoSJAG1PhFcJgY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jAZRc8YRqaZq0+onDUIF6ksRnVoINiJ00tnOAirk61k/YlGu/Ctc+1SgzTHIid7hG/5evDXmzOGb66kLtoa7sSwnopKfG7Zv6b7kpMrTfDSxpS98Rofi8R8qBJ+R/7tfSoDMpa2AVAFHuEFIzH4FVQF2kGNGu7Cs/Mq9z59iaY5OfAxyk1r/74KQ/sY24wdEUJS0UHMp+LJJfouKWBeL2YMSzdIXFPu0AMp7DVD04L4Mi8xhbG8optr2tVV5ck4z6oYTS+jsgs6rlhiqLX9ug4Zzadvjny/Vz5S2LCovjEgFI23Ho24i8wsWz+G+j11fxNaAw2nfETfVRZ/NaFob4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=H4o7ORTn; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=gOAq0G/C; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=H4o7ORTn;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=gOAq0G/C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMfKX0501z3btf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 17:57:51 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772175466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HtbZMuKPuZ/Q8N4tWs6O3IZMokrlUXoSJAG1PhFcJgY=;
	b=H4o7ORTn4JvG+PVTnYpO0/oTgdZCJbwVt4425etjg8+5ole07xXCVfxDm7D5LGyIHgoBJx
	8NwMkH71P64oXxvqvHLZB+IND37Jq3yby+W4GswDpz7bHdPKCez33/1zzxosn/+0pinBkm
	X7Yo9UMR4Vv0MfeCsSwufKeBILZtlkEgMVdYUbInPIWcpTl7UPQfgtO+RpsiiUy7r+2O4y
	++fQbI9BcasRK1a65vijBTiUpgA5nuY2eYltLq2LS2SOlWhynNISJ+i8/Wm4kqSqPLV9jT
	vpwtDuAp08YVymX36aLS9EWtu6mZVL9Q8F70pw/L9Ch47fljYATqIzqrE6JI3w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772175466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HtbZMuKPuZ/Q8N4tWs6O3IZMokrlUXoSJAG1PhFcJgY=;
	b=gOAq0G/CQ3E3pUMxzw8fM3TjOLd6FY02Gw7eezax8KZlsADL9RmM590a28hE1bUpjrjYNl
	zytu7ftaESwuGKAA==
Subject: [PATCH 0/7] vDSO: Respect COMPAT_32BIT_TIME
Date: Fri, 27 Feb 2026 07:57:39 +0100
Message-Id: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqAIBBA4avIrBP8AbOuEhFWU83CDBUJorsnL
 b/Few8kjIQJevZAxEKJwlkhGwbL4c4dOa3VoIQyQkrNy5oCX4K/XJ60milPmTxytMK2RmPXGgc
 1viJudP/jYXzfD3yh3uRoAAAA
X-Change-ID: 20260113-vdso-compat_32bit_time-e808763e976a
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772175466; l=2310;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=j+10mN0yr2XgOejP9mFbnsE8FfQujsP1mq/LotWdhto=;
 b=4qjwQGnBsBfZe0LjYUORov+hgkDQzer/ymRhbE91DQX1XPZRWzaKFR4++0Fr1RMsBbxUveStm
 UAm3S7SwNMvA4AnLvQRE43aBQhvrPLsa/92l8LBwRdO3MAbzufbbm2f
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.65 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MIXED_CHARSET(0.56)[subject];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-17354-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:luto@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:tsbogend@alpha.franken.de,m:vincenzo.frascino@arm.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-mips@vger.kernel.org,m:arnd@arndb.de,m:thomas.weissschuh@linutronix.de,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[thomas.weissschuh@linutronix.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:mid,linutronix.de:dkim,linutronix.de:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 7D7321B3950
X-Rspamd-Action: no action

If CONFIG_COMPAT_32BIT_TIME is disabled then the vDSO should not
provide any 32-bit time related functionality. This is the intended
effect of the kconfig option and also the fallback system calls would
also not be implemented.

Currently the kconfig option does not affect the gettimeofday() syscall,
so also keep that in the vDSO.

I also tried to introduce some helpers to avoid much of the ifdeffery,
but due to the high variance in the architecture-specific glue code
these would need to handle they ended up being worse than the current
proposal.

As a side-effect this will make the self-tests more reliable,
as there is now always a matching syscall available for each vDSO function.

clock_gettime_time64() was only introduced in v6.19, so libc implementations
are likely not using it yet.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Thomas Weißschuh (7):
      x86/vdso: Respect COMPAT_32BIT_TIME
      ARM: VDSO: Respect COMPAT_32BIT_TIME
      arm64: vdso32: Respect COMPAT_32BIT_TIME
      powerpc/vdso: Respect COMPAT_32BIT_TIME
      MIPS: VDSO: Drop kconfig MIPS_CLOCK_VSYSCALL
      MIPS: VDSO: Respect COMPAT_32BIT_TIME
      vdso/gettimeofday: Verify COMPAT_32BIT_TIME interactions

 arch/arm/vdso/vdso.lds.S                    |  4 +++-
 arch/arm/vdso/vgettimeofday.c               | 14 ++++++------
 arch/arm64/kernel/vdso32/vdso.lds.S         |  4 +++-
 arch/arm64/kernel/vdso32/vgettimeofday.c    | 14 ++++++------
 arch/mips/Kconfig                           |  3 ---
 arch/mips/vdso/vdso.lds.S                   |  6 +++---
 arch/mips/vdso/vgettimeofday.c              | 33 +++++++----------------------
 arch/powerpc/kernel/vdso/gettimeofday.S     |  6 ++++++
 arch/powerpc/kernel/vdso/vdso32.lds.S       | 10 +++++----
 arch/powerpc/kernel/vdso/vgettimeofday.c    | 16 ++++++++------
 arch/x86/entry/vdso/common/vclock_gettime.c | 20 ++++++++++-------
 arch/x86/entry/vdso/vdso32/vdso32.lds.S     |  4 +++-
 lib/vdso/gettimeofday.c                     |  8 +++++++
 13 files changed, 78 insertions(+), 64 deletions(-)
---
base-commit: 328b128e8fe2ae981900c1f38b3b9c75c586455e
change-id: 20260113-vdso-compat_32bit_time-e808763e976a

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


