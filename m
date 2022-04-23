Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9086E50CD9E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Apr 2022 23:27:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Km4BH420tz3bdP
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Apr 2022 07:27:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=mxw3tXP3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=srs0=n99z=vb=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256
 header.s=20210105 header.b=mxw3tXP3; dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Km49Z74dxz2yHp
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Apr 2022 07:27:14 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CA982B80DAB;
 Sat, 23 Apr 2022 21:27:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 655E8C385A5;
 Sat, 23 Apr 2022 21:27:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="mxw3tXP3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1650749222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=pY3GCFkvaKbYFxDCcKwSdJ8N9nXdG8OE4PjRxZGLbwE=;
 b=mxw3tXP3rv19uw0WGrfNZ5vKeN9vdScLNhpiHdV1D7EpFAVPuUI2t27mnVwIz+EPXhdc0N
 DxsrccWIpl1bhZSnO0NPOVu65nNxex7ViVlm3T1mRaL18DWAN+oQeZyXO+p1apZw+pyUO5
 OdzcbE/GPAE1xJDfBMeAuCkH5KtnstM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5c3eede4
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Sat, 23 Apr 2022 21:27:02 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 tglx@linutronix.de, arnd@arndb.de
Subject: [PATCH v6 00/17] archs/random: fallback to best raw ktime when no
 cycle counter
Date: Sat, 23 Apr 2022 23:26:06 +0200
Message-Id: <20220423212623.1957011-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, linux-ia64@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H . Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>,
 linux-riscv@lists.infradead.org,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Matt Turner <mattst88@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 linux-xtensa@linux-xtensa.org, Albert Ou <aou@eecs.berkeley.edu>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 linux-um@lists.infradead.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Richard Henderson <rth@twiddle.net>, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Theodore Ts'o <tytso@mit.edu>,
 linux-parisc@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[Preface for v6: if you're an arch maintainer, a simple Acked-by would
 be appreciated if this looks okay.]

Hi folks,

The RNG uses a function called random_get_entropy() basically anytime
that it needs to timestamp an event. For example, an interrupt comes in,
and we mix a random_get_entropy() into the entropy pool somehow.
Somebody mashes their keyboard or moves their mouse around? We mix a
random_get_entropy() into the entropy pool. It's one of the main
varieties of input.

Unfortunately, it's always 0 on a few platforms. The RNG has accumulated
various hacks to deal with this, but in general it's not great. Surely
we can do better than 0. In fact, *anything* that's not the same exact
value all the time would be better than 0. Even a counter that
increments once per hour would be better than 0! I think you get the
idea.

On most platforms, random_get_entropy() is aliased to get_cycles(),
which makes sense for platforms where get_cycles() is defined. RDTSC,
for example, has all the characteristics we care about for this
function: it's fast to acquire (i.e. acceptable in an irq handler),
pretty high precision, available, forms a 2-monotone distribution, etc.
But for platforms without that, what is the next best thing?

Sometimes the next best thing is architecture-defined. For example,
really old MIPS has the C0 random register, which isn't quite a cycle
counter, but is at least something. However, some platforms don't even
have an architecture-defined fallback.

Fortunately, the timekeeping subsystem has already solved this problem
of trying to determine what the least bad clock is on constrained
systems, falling back to jiffies in the worst case. By exporting the raw
clock, we can get a decent fallback function for when there's no cycle
counter or architecture-specific function.

This series makes the RNG more useful on: m68k, RISC-V, MIPS, ARM32,
NIOS II, SPARC32, Xtensa, OpenRISC, and Usermode Linux. Previously these
platforms would, in certain circumstances, but out of luck with regards to
having any type of event timestamping source in the RNG.

Finally, note that this series isn't about "jitter entropy" or other
ways of initializing the RNG. That's a different topic for a different
thread. Please don't let this discussion veer off into that. Here, I'm
just trying to find a good fallback counter/timer for platforms without
get_cycles(), a question with limited scope.

If this (or a future revision) looks good to you all and receives the
requisite acks, my plan was to take these through the random.git tree
for 5.19, so that I can then build on top of it.

Thanks,
Jason

Changes v5->v6:
- Use cpu_feature_enabled() instead of boot_cpu_has() on x86.
- OpenRISC support.
- Define missing `#define get_cycles get_cycles` on various platforms.

Changes v4->v5:
- Do not prototype symbol with 'extern', according to style guide.
- On MIPS, combine random_get_entropy_fallback() with the c0 random
  register in a way that matches the format of the c0 random value, so
  that we get the best of a high precision cycle counter and of larger
  period timer, joined together. As a result, Thomas Bogendoerfer's
  ack on v4 of patch 4 has been dropped, since this is a substantial
  change.

Changes v3->v4:
- Use EXPORT_SYMBOL_GPL instead of EXPORT_SYMBOL.

Changes v2->v3:
- Name the fallback function random_get_entropy_fallback(), so that it
  can be changed out as needed.
- Include header with prototype in timekeeping.c to avoid compiler
  warning.
- Export fallback function symbol.

Changes v1->v2:
- Use ktime_read_raw_clock() instead of sched_clock(), per Thomas'
  suggestion.
- Drop arm64 change.
- Cleanup header inclusion ordering problem.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Theodore Ts'o <tytso@mit.edu>
Cc: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: David S. Miller <davem@davemloft.net>
Cc: Richard Weinberger <richard@nod.at>
Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Chris Zankel <chris@zankel.net>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Dinh Nguyen <dinguyen@kernel.org>
Cc: Jonas Bonn <jonas@southpole.se>
Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Cc: Stafford Horne <shorne@gmail.com>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Sven Schnelle <svens@linux.ibm.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-mips@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: sparclinux@vger.kernel.org
Cc: linux-um@lists.infradead.org
Cc: x86@kernel.org
Cc: linux-xtensa@linux-xtensa.org
Cc: openrisc@lists.librecores.org
Cc: linux-ia64@vger.kernel.org
Cc: linux-s390@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org

Jason A. Donenfeld (17):
  ia64: define get_cycles macro for arch-override
  s390: define get_cycles macro for arch-override
  parisc: define get_cycles macro for arch-override
  alpha: define get_cycles macro for arch-override
  powerpc: define get_cycles macro for arch-override
  timekeeping: add raw clock fallback for random_get_entropy()
  m68k: use fallback for random_get_entropy() instead of zero
  riscv: use fallback for random_get_entropy() instead of zero
  mips: use fallback for random_get_entropy() instead of just c0 random
  arm: use fallback for random_get_entropy() instead of zero
  openrisc: use fallback for random_get_entropy() instead of zero
  nios2: use fallback for random_get_entropy() instead of zero
  x86: use fallback for random_get_entropy() instead of zero
  um: use fallback for random_get_entropy() instead of zero
  sparc: use fallback for random_get_entropy() instead of zero
  xtensa: use fallback for random_get_entropy() instead of zero
  random: insist on random_get_entropy() existing in order to simplify

 arch/alpha/include/asm/timex.h    |  1 +
 arch/arm/include/asm/timex.h      |  1 +
 arch/ia64/include/asm/timex.h     |  1 +
 arch/m68k/include/asm/timex.h     |  2 +-
 arch/mips/include/asm/timex.h     | 17 +++---
 arch/nios2/include/asm/timex.h    |  3 ++
 arch/openrisc/include/asm/timex.h |  3 ++
 arch/parisc/include/asm/timex.h   |  3 +-
 arch/powerpc/include/asm/timex.h  |  1 +
 arch/riscv/include/asm/timex.h    |  2 +-
 arch/s390/include/asm/timex.h     |  1 +
 arch/sparc/include/asm/timex_32.h |  4 +-
 arch/um/include/asm/timex.h       |  9 +---
 arch/x86/include/asm/timex.h      | 10 ++++
 arch/x86/include/asm/tsc.h        |  4 +-
 arch/xtensa/include/asm/timex.h   |  6 +--
 drivers/char/random.c             | 89 ++++++++++---------------------
 include/linux/timex.h             |  8 +++
 kernel/time/timekeeping.c         | 10 ++++
 19 files changed, 87 insertions(+), 88 deletions(-)

-- 
2.35.1

