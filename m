Return-Path: <linuxppc-dev+bounces-1013-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E733396CA4F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 00:26:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzcX86Mwyz2y8B;
	Thu,  5 Sep 2024 08:26:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725455686;
	cv=none; b=gtS6WCiyCbxTGqM4Hl4beI+85FJ3lC3qMw+frbr27ng216Y4A5adYk7vX6shA/H8A4biZGfuTUiHr8nrHCFgeGhERojKPAks/EMgS2SZXlMu60h+YHy7FE/gAfO1QoJrYhGtxT6VUL2ovJRE9VlZs2eWqUHHWKc+LsrNUGi3JGQ1xVeOAigTAeoXxbDp1w69wzdijcInTKRYzl9+niX7u3aBqPyNVUSdDFLWizz2AHqb+tD1KfxklcVHECgkTYLAaThYXjJQDCCQl2xSQoDXUufXRWGvi3jl++3eifS2gX6O5tRw1XwphTeIApSHHn1ykKT5SgERftaRq3RHvaqwQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725455686; c=relaxed/relaxed;
	bh=IcwSc34LvXMP/cT7noBpbT1jqfRVjScu2K4oFpyriwE=;
	h=From:DKIM-Signature:DKIM-Signature:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:To:Cc; b=gLhJHGXo4Vjm3m1YhDXKONxlfi32awfjWWNCoQ4xePSYh3hQrKNwq9LEWIvRX+JA9lQargnLbkywAOj3WHhoQU49yOcA2npRwbNb9wy2dr8LF31qMjPjRq08jSxTZVwV67RasbEYTFhmeNcvlUKCQgR12uMMZHtV92XSXl8vgR08H7Lnn4C+1bWouoDYFR+aIEuT+aJVnNrppzOfIThtOKQUv7M7VIyQ07j0P8HD7yyaP5N2Y9uqCh8Yzp6sRtgh2myPIRwhw0ekDQKkX3pV0uWvElHWX2BrNriLE5MsR7ph3MtRt231djGTyEKLiR9YhrEcYDrUb4bG3FHfzy9s7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=pKIctVY4; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=E+eXvp9U; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=anna-maria@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=pKIctVY4;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=E+eXvp9U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=anna-maria@linutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 538 seconds by postgrey-1.37 at boromir; Wed, 04 Sep 2024 23:14:45 AEST
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzNJ55gCrz2yYd
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 23:14:45 +1000 (AEST)
From: Anna-Maria Behnsen <anna-maria@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1725455132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IcwSc34LvXMP/cT7noBpbT1jqfRVjScu2K4oFpyriwE=;
	b=pKIctVY4axfpzaDAkuW89nfEerNMQNXGr4oRrZz38wPjBOmrxBuAnOBWaEizzBAwauAjPh
	iSPCWacRZvzl6CCp1is+uBZAeRqXH7FmxMsCNUd2XW7fLBRd3R2v/gVjNOtuOAe97g20n4
	iyKyv4M3SsAHlQyN0Bb5+/WPEPJl38gvPLOQnPCVAYjWpdHo54oO5T6wTZVXJJDlbqXkkE
	3oyAKI4DEAwwq/8zn1lI0pDDGpx/h1p9ThiWQxIDIVUHt673XGvyw0iUaWqSDLv7yLyqpo
	Anfa2HXMo+/DXNdDrHE8hi9N5LqhVKzPFFuFJBaC1IHamnKd3WZ2Kp5fjH9bRQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1725455132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IcwSc34LvXMP/cT7noBpbT1jqfRVjScu2K4oFpyriwE=;
	b=E+eXvp9UB9r1HGGHMLtT0w+geizfWK2j8vOahsM5RXh4xyoJXjN+XNIwwk0C+aPRWMYALP
	cm7NexPhzPCUw2DQ==
Subject: [PATCH 00/15] timers: Cleanup delay/sleep related mess
Date: Wed, 04 Sep 2024 15:04:50 +0200
Message-Id: <20240904-devel-anna-maria-b4-timers-flseep-v1-0-e98760256370@linutronix.de>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPJa2GYC/x3NQQqDMBBG4avIrDsQ07QkvUrpYtTfdkBTmYgUx
 Ls3uPw27+1UYIpCj2Ynw6ZFv7mivTTUfyS/wTpUk3c+uOQCD9gwseQsPIupcBd41RlWeJwKsHC
 8xltqfZfuKVLtLIZRf+fj+TqOPzF6qSBzAAAA
To: Frederic Weisbecker <frederic@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, Len Brown <len.brown@intel.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, SeongJae Park <sj@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev, 
 linux-mm@kvack.org, Arnd Bergmann <arnd@arndb.de>, 
 linux-arch@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Andy Whitcroft <apw@canonical.com>, 
 Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, netdev@vger.kernel.org, 
 linux-sound@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, 
 Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org

Hi,

a question about which sleeping function should be used in acpi_os_sleep()
started a discussion and examination about the existing documentation and
implementation of functions which insert a sleep/delay.

The result of the discussion was, that the documentation is outdated and
the implemented fsleep() reflects the outdated documentation but doesn't
help to reflect reality which in turns leads to the queue which covers the
following things:

- Minor changes (naming and typo fixes)

- Split out all timeout and sleep related functions from hrtimer.c and timer.c
  into a separate file

- Update function descriptions of sleep related functions

- Change fsleep() to reflect reality

- Rework all comments or users which obviously rely on the outdated
  documentation as they reference "Documentation/timers/timers-howto.rst"

- Last but not least (as there are no more references): Update the outdated
  documentation and move it into a file with a self explaining file name

The queue is available here and applies on top of tip/timers/core:

  git://git.kernel.org/pub/scm/linux/kernel/git/anna-maria/linux-devel.git timers/misc

Cc: linux-kernel@vger.kernel.org
Cc: Len Brown <len.brown@intel.com>
Cc: Rafael J. Wysocki <rafael@kernel.org>
To: Frederic Weisbecker <frederic@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
To: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>

Thanks,

Anna-Maria

---
Anna-Maria Behnsen (15):
      timers: Rename next_expiry_recalc() to be unique
      cpu: Use already existing usleep_range()
      Comments: Fix wrong singular form of jiffies
      timers: Move *sleep*() and timeout functions into a separate file
      timers: Rename sleep_idle_range() to sleep_range_idle()
      timers: Update function descriptions of sleep/delay related functions
      timers: Adjust flseep() to reflect reality
      mm/damon/core: Use generic upper bound recommondation for usleep_range()
      timers: Add a warning to usleep_range_state() for wrong order of arguments
      checkpatch: Remove broken sleep/delay related checks
      regulator: core: Use fsleep() to get best sleep mechanism
      iopoll/regmap/phy/snd: Fix comment referencing outdated timer documentation
      powerpc/rtas: Use fsleep() to minimize additional sleep duration
      media: anysee: Fix link to outdated sleep function documentation
      timers/Documentation: Cleanup delay/sleep documentation

 Documentation/admin-guide/media/vivid.rst          |   2 +-
 Documentation/dev-tools/checkpatch.rst             |   6 -
 Documentation/timers/delay_sleep_functions.rst     | 122 +++++++
 Documentation/timers/index.rst                     |   2 +-
 Documentation/timers/timers-howto.rst              | 115 -------
 .../sp_SP/scheduler/sched-design-CFS.rst           |   2 +-
 MAINTAINERS                                        |   2 +
 arch/arm/mach-versatile/spc.c                      |   2 +-
 arch/m68k/q40/q40ints.c                            |   2 +-
 arch/powerpc/kernel/rtas.c                         |  21 +-
 arch/x86/kernel/cpu/mce/dev-mcelog.c               |   2 +-
 drivers/char/ipmi/ipmi_ssif.c                      |   2 +-
 drivers/dma-buf/st-dma-fence.c                     |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_wait.c           |   2 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c       |   4 +-
 drivers/gpu/drm/i915/i915_utils.c                  |   2 +-
 drivers/gpu/drm/v3d/v3d_bo.c                       |   2 +-
 drivers/isdn/mISDN/dsp_cmx.c                       |   2 +-
 drivers/media/usb/dvb-usb-v2/anysee.c              |   6 +-
 drivers/net/ethernet/marvell/mvmdio.c              |   2 +-
 drivers/regulator/core.c                           |  33 +-
 fs/xfs/xfs_buf.h                                   |   2 +-
 include/asm-generic/delay.h                        |  46 ++-
 include/linux/delay.h                              |  79 ++++-
 include/linux/iopoll.h                             |  24 +-
 include/linux/jiffies.h                            |   2 +-
 include/linux/phy.h                                |   7 +-
 include/linux/regmap.h                             |  18 +-
 include/linux/timekeeper_internal.h                |   2 +-
 kernel/cpu.c                                       |   2 +-
 kernel/time/Makefile                               |   2 +-
 kernel/time/alarmtimer.c                           |   2 +-
 kernel/time/clockevents.c                          |   2 +-
 kernel/time/hrtimer.c                              | 122 +------
 kernel/time/posix-timers.c                         |   4 +-
 kernel/time/sleep_timeout.c                        | 363 +++++++++++++++++++++
 kernel/time/timer.c                                | 210 +-----------
 lib/Kconfig.debug                                  |   2 +-
 mm/damon/core.c                                    |   5 +-
 net/batman-adv/types.h                             |   2 +-
 scripts/checkpatch.pl                              |  38 ---
 sound/soc/sof/ops.h                                |   6 +-
 42 files changed, 668 insertions(+), 607 deletions(-)


