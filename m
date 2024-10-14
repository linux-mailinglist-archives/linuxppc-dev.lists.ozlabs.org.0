Return-Path: <linuxppc-dev+bounces-2193-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 559B899C2FA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 10:22:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRqws4xvyz3blK;
	Mon, 14 Oct 2024 19:22:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728894173;
	cv=none; b=FyKYgUMq3z0Q0yBwrkpDk/yXITH7zeHHqKiZ9e+1bL7G2l/os3qnb4tfP6NDy0Gr07CVA7Hbrb3jOVJHneR9xeptPSNa6GdGZdeYQQTirqHV/ZMQ5+jud96PiblHeg2DsuZj64tIHCxuuKpxxq9GqK+JUC+cgTG+wt6ZeuYj2kW0CPg1XOF+X0JxQ+pPM3yrjRu/zpxYTalw2hEfmmTxwTOmyKIIP0t5xQfjm7aQuQrTNEvx8SRG6DV0kABqlFperHEhXfz2vjBEGNs/GQQtnEgHMG7k9BNo5i2wHmSzaXZOVa+f3QoVj60C/e+nCgAYTAlkXEGD6qZ6RicrwXdo0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728894173; c=relaxed/relaxed;
	bh=6HOwNsVm5tP1AF7YCvIKWbMDqeHpS3lPwmHnkUywq/Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l6PXw7d+6XejWOxznP3HgAd5a4vWxPjOHlS1VlPo5AEXBviuOgD9gY65nSRtJXG68yIMVAMW65qT+do7Lx962TPxAhMWeQ0nPTm817lMg3bcwLaJiNrE+srRPbP8oJewrskhZLRB8DQsjt7kqah42DZxEAjlQpR52uIWN3X4iAr5UfalIvaU30joK7H9eLdtUKktekper0aRLS6mthG+EXpy37IrDSjqNsM7Djj3UYKgC4OpkRKV0dVEfjsGfvHWNHZJTAsluteh00haypywNpz1KxJnuH8XsUwFdyxFUL1HH+LDneJ2XA//tWPJP8kgIgP2NbqcVS7PfSEgI9EzxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=KFExR3Z0; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=slvvGPaA; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=anna-maria@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=KFExR3Z0;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=slvvGPaA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=anna-maria@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRqwq6hCDz2ysv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 19:22:51 +1100 (AEDT)
From: Anna-Maria Behnsen <anna-maria@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728894163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6HOwNsVm5tP1AF7YCvIKWbMDqeHpS3lPwmHnkUywq/Y=;
	b=KFExR3Z0ch2CGjb8uZF385NycoNtXWJ52MR/i19uWkoHR73ejXuX4GOFPDZJchSNKxN0YH
	9H09dQgIFLN0XYA0sRa7f+Jg744VoU+FWRipA2zenwRVFWf0noRuToPCIoq/ePHjxWarJ9
	SqjMIQ2OJJIQc/JlGoQcr7qn+Ztcb5Wog63TpXuR+uMIcDwA7z6B2gog9Q3SVmAY2bikFt
	mRj2dJa9yDAlHsRKp62fLCoRoJ4uho0BgHGrPNhLu+s/+D79MQkDsckRZ1I3/nd5V/0BHs
	FuKX3H4yatjIlK09dEr8+nGf1DKjJ0qQxyhRK9NozUQLqHSQ76Lx7voiR0M2tA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728894163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6HOwNsVm5tP1AF7YCvIKWbMDqeHpS3lPwmHnkUywq/Y=;
	b=slvvGPaAqPFHoRdnXnb5CSGotI1RmGRgBCGz97ighCehiyEF+E9aEDo3bB0d+pbkk/R91i
	aaXfQVNhvqPTH6BA==
Subject: [PATCH v3 00/16] timers: Cleanup delay/sleep related mess
Date: Mon, 14 Oct 2024 10:22:17 +0200
Message-Id: <20241014-devel-anna-maria-b4-timers-flseep-v3-0-dc8b907cb62f@linutronix.de>
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
X-B4-Tracking: v=1; b=H4sIALnUDGcC/5XNSw6CMBSF4a2Qjr2mD1515D6MgwIXuQkU0mKDI
 ezdwsjEiQ7/M/jOyjw6Qs8uycocBvI02hjqlLC6M/aBQE1sJrlMueYpNBiwB2OtgcE4MlClMNO
 AzkPbe8QJSlVmWshK57pk0ZkctrQcH7d77I78PLrXcRnEvv6jBwEcUJdFzmWWq4Jfe7LP2Y2Wl
 nODbH8I8kMV4hdVRrXijWqVqusWv9Rt295y1hsLLAEAAA==
To: Frederic Weisbecker <frederic@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, Len Brown <len.brown@intel.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, rust-for-linux@vger.kernel.org, 
 Alice Ryhl <aliceryhl@google.com>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 damon@lists.linux.dev, linux-mm@kvack.org, SeongJae Park <sj@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Andy Whitcroft <apw@canonical.com>, 
 Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 netdev@vger.kernel.org, linux-sound@vger.kernel.org, 
 Michael Ellerman <mpe@ellerman.id.au>, Nathan Lynch <nathanl@linux.ibm.com>, 
 linuxppc-dev@lists.ozlabs.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 linux-media@vger.kernel.org, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi,

a question about which sleeping function should be used in acpi_os_sleep()
started a discussion and examination about the existing documentation and
implementation of functions which insert a sleep/delay.

The result of the discussion was, that the documentation is outdated and
the implemented fsleep() reflects the outdated documentation but doesn't
help to reflect reality which in turns leads to the queue which covers the
following things:

- Split out all timeout and sleep related functions from hrtimer.c and timer.c
  into a separate file

- Update function descriptions of sleep related functions

- Change fsleep() to reflect reality

- Rework all comments or users which obviously rely on the outdated
  documentation as they reference "Documentation/timers/timers-howto.rst"

- Update the outdated documentation and move it into a file with a self
  explaining file name (as there are no more references)

- Remove checkpatch checks which also rely on the outdated documentation

The queue is available here:

  git://git.kernel.org/pub/scm/linux/kernel/git/anna-maria/linux-devel.git timers/misc

Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
---
Changes in v3:
- Add review remarks
- Split checkpatch patch: 1. Remove links to outdated documentation,
  2. Remove checks in checkpatch which rely on outdated documentation
- Link to v2: https://lore.kernel.org/r/20240911-devel-anna-maria-b4-timers-flseep-v2-0-b0d3f33ccfe0@linutronix.de

Changes in v2:
- change udelay() and ndelay() as suggested by Thomas
- Update some formatting in the new sleep_timeout.c file
- minor typo changes and other small review remarks

Thanks,

        Anna-Maria

---
Anna-Maria Behnsen (16):
      MAINTAINERS: Add missing file include/linux/delay.h
      timers: Move *sleep*() and timeout functions into a separate file
      timers: Update schedule_[hr]timeout*() related function descriptions
      timers: Rename usleep_idle_range() to usleep_range_idle()
      timers: Update function descriptions of sleep/delay related functions
      delay: Rework udelay and ndelay
      timers: Adjust flseep() to reflect reality
      mm/damon/core: Use generic upper bound recommondation for usleep_range()
      timers: Add a warning to usleep_range_state() for wrong order of arguments
      checkpatch: Remove links to outdated documentation
      regulator: core: Use fsleep() to get best sleep mechanism
      iopoll/regmap/phy/snd: Fix comment referencing outdated timer documentation
      powerpc/rtas: Use fsleep() to minimize additional sleep duration
      media: anysee: Fix and remove outdated comment
      timers/Documentation: Cleanup delay/sleep documentation
      checkpatch: Remove broken sleep/delay related checks

 Documentation/dev-tools/checkpatch.rst         |   6 -
 Documentation/timers/delay_sleep_functions.rst | 121 ++++++++
 Documentation/timers/index.rst                 |   2 +-
 Documentation/timers/timers-howto.rst          | 115 --------
 MAINTAINERS                                    |   2 +
 arch/powerpc/kernel/rtas.c                     |  21 +-
 drivers/media/usb/dvb-usb-v2/anysee.c          |  17 +-
 drivers/regulator/core.c                       |  47 +--
 include/asm-generic/delay.h                    |  96 +++++--
 include/linux/delay.h                          |  79 ++++--
 include/linux/iopoll.h                         |  52 ++--
 include/linux/phy.h                            |   9 +-
 include/linux/regmap.h                         |  38 +--
 kernel/time/Makefile                           |   2 +-
 kernel/time/hrtimer.c                          | 120 --------
 kernel/time/sleep_timeout.c                    | 377 +++++++++++++++++++++++++
 kernel/time/timer.c                            | 192 -------------
 mm/damon/core.c                                |   5 +-
 scripts/checkpatch.pl                          |  38 ---
 sound/soc/sof/ops.h                            |   8 +-
 20 files changed, 704 insertions(+), 643 deletions(-)


