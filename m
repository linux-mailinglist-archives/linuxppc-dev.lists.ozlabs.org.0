Return-Path: <linuxppc-dev+bounces-15022-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B325CE02A2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Dec 2025 23:37:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ddy6W5yFKz2y8c;
	Sun, 28 Dec 2025 09:37:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.67
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766837874;
	cv=none; b=FJYrjBchrcBpTbW1IiNx5ouajNQv33MTVeO87069aYhXoHkLQXUlTUt9mtelVm4NHSGn5yh0z99BU0fJ1vgns835UNYE10Ux1yey2+oc30DQY2Ywkvuzgyc+Sf9fL7pRmIuAvSWxN+ExKKi+3bO4VlXm8VKJsIHoInFZaaP9n5mdN1LgH2vvXByd5TfzfSt4R0mIvGHH1HCEibjZ5gSYnWHlIZjdnKCieOxDpt7pFATyMuQsNVYEd7Ze+TFtXm4fmPxIjYNtHMWyWsL7ArCggQCrcyfb60Wvul0oApxIM2a0uJatjfTRov5fD2JD7X62ij+KOhhHAeQumFIJJ8Z+zA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766837874; c=relaxed/relaxed;
	bh=ZTn0eoJ78H/BcwAZAT5V21TN0j41vlUozcdKxdaozdI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bLIuya5HePpfQm3iWU/+0IXrAZH0TiATFaPu++4bKp6Nm0hVD+Fd0NG5yT+Yzd2FDr9OPOX3ySZhIeEZMaxcsPbVPO+C1J3UzRPY+vaY0ikTnPHefadNho2eUZ4hQn8Atm8lpivFIE/ALavpoFDV/lPW1/dpZ9rVioWyXEYmb242LQExuckNaCh/he/euoafwmUhjorRHOmTrxbW/ZlwsJzMZL+KBOU2RiFk5tD6AUhSoYhiyx/zSmcuZJJq3k4nRNJ54wfdzlHEnK3NjrgZFFSE+GIFUgDGuyepzgilFeDP79YmIIs1DpByvNGWk2yge6FCh53hH4L3i41grAnDTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=exK0ncpg; dkim-atps=neutral; spf=pass (client-ip=209.85.128.67; helo=mail-wm1-f67.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=exK0ncpg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=209.85.128.67; helo=mail-wm1-f67.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ddhMP1NQVz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 23:17:51 +1100 (AEDT)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-47bdbc90dcaso49496515e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 04:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837808; x=1767442608; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTn0eoJ78H/BcwAZAT5V21TN0j41vlUozcdKxdaozdI=;
        b=exK0ncpg66KSHDB3j9Be3Vocrfuox57IJ/11eOMrqyGd0+9fJBxraSs6K6BDm58Qvk
         ZhugSDJq7xEpqduq0+3t2u5d0fLjKEgwWRdk6dbhH1By99J3uRtyvOl77es6thNqqHMB
         /Icyz/DznU8Uk9vRRvhFNHPfbpNxGqPoV2b/TIk24sPFFgPt2GtrDgfWeB15lGDkfwMQ
         hZeibYTlYFNSvreaCrmUsNKf4s6gAKcgiq8h/z/6ZCriOiJfs9QIrLu0hhzBKGbxmI9E
         epj07EcOG2xPwclIpOQ96nMMcl9mtWvTSidBOa/2KfIVB+ZUZZhGKhuCxlHObfX7Y5Q7
         0nXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837808; x=1767442608;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTn0eoJ78H/BcwAZAT5V21TN0j41vlUozcdKxdaozdI=;
        b=eCEOwuL6I4K3/9S1aUNzK0EePUz020TBVXcUMRyDgESMIO/XgP5/7kesQwBWeOMzCV
         c0Er3SY+LNB4B7/cQh5oyErY3yX5SNHuLf34VaPrb5z1LJRnk43gLnSwvDIvHjbyfFm+
         iOUuMkZhYnEQRymaWFZJexufXRz6cf8og1YEJwBbiF9IG+l4BCUtMQDgwre+aILf1T5N
         79yvZnjy9LXW5lbl70dCfUh7rKGeWlt4vtt8xp+BSIFOuPIcTiyszPUmWiqG8rXsCg8N
         Q5gO8s4xo1jQCEWNDdvaHkYNG+rmyeZp5NfRQyzuV6gqpJeYzqWtWRvcUMyJaYWYl0hz
         qzVg==
X-Forwarded-Encrypted: i=1; AJvYcCXr5D+yEOIATDpdnhIOUfCS1LpReZbZ4oE7Hzh1UItct2bb7ZtsQUdOMalDn/75CfAY6vnT+aXBeSjN6t8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy/Pt90qkmpe9SySZbmV+t6fBDPNHaEICz38U56TgyH1w6sYBV2
	9BYrqQvFJND4LR5uBthn62BIQu2C96JlvRwhRkDOaZ/6QQE5nLhb0nAqimgd4E6rCFU=
X-Gm-Gg: AY/fxX4aZFuyOXv14Ah1t+jHllHnVVEnDHjnLNhbFWcpmIriiYIZCxMSZA7CIx24noV
	rqG+kkQ1ag5W7BvELGFZ5iRJT+TeqbQE2X2mVVYbnScBqZVDEiZ468JBaqU8LnmTEddzJd+2miC
	Aa3mXYo0790CN6O2OT8IOjA1czVvX3KDNrAQz5zcD2XSuCh0lPgsXZAWLDuPbDPxZ1cNrxRQQqJ
	6dHKT+v8oA+W+f0Ksrypp86PqtNLUIrlSAgnN+dxXKDP+idtz6NwmJd7yLCBCUi4d6xT8V3B1aP
	tCgqbEUefmSIa1AfNdiDgL7RU1SUyaklxI/UYaXaENBYW1Q5owV4CH1NZ96J1AXBUlrBMDJz2dA
	ME6vAX7V+vm5loQkpALNormmKFVc1nFtL4KVUz0QCJde715R0QZIC0+/f5W6tBdV3jhNwktmfh+
	9opvzSNS2BeTNJdb1cous=
X-Google-Smtp-Source: AGHT+IGAwYPYNfJmaY9Q33nFH+RhwoM5QU0IvIHlZhMLVrSDLSWfjJCihtYGJekOl50CWdODgpBmVA==
X-Received: by 2002:a05:600c:c086:b0:47b:e0ff:60f9 with SMTP id 5b1f17b1804b1-47d19577114mr202487205e9.20.1766837807525;
        Sat, 27 Dec 2025 04:16:47 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:16:46 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Subject: [PATCH 00/19] printk cleanup - part 3
Date: Sat, 27 Dec 2025 09:16:07 -0300
Message-Id: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAfOT2kC/x2MwQpAQBBAf0VzNmVsHPyKHAaDidY2i5T8u83l1
 Tu890AUU4nQZA+YXBp190koz2BY2M+COiaHsigrSsBg6o8Vh03YnwED2+FQmKjuiXrHNaQ0mEx
 6/9u2e98PHmJw7WYAAAA=
X-Change-ID: 20251202-printk-cleanup-part3-ea116b11b3a6
To: Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jason Wessel <jason.wessel@windriver.com>, 
 Daniel Thompson <danielt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, Petr Mladek <pmladek@suse.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Andreas Larsson <andreas@gaisler.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Laurentiu Tudor <laurentiu.tudor@nxp.com>
Cc: linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kgdb-bugreport@lists.sourceforge.net, linux-serial@vger.kernel.org, 
 netdev@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 sparclinux@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
 Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=4070;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=pGCwrx7s/pzxpnqEvxnowKr5kIMRsCkFnk8/FBkLNPk=;
 b=DtTvQmWwxI8nBiz56K8JWeAXva4ZUTP1TZfMsHc/t23MukO3Q9HDBbWL5zjE/2eZrLFOXevOl
 63plshGMBJVDC6pfWYfhJHhdbEMnrJWz9+G+dP9Hv10iWAGuGbiHgYC
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The parts 1 and 2 can be found here [1] and here[2].

The changes proposed in this part 3 are mostly to clarify the usage of
the interfaces for NBCON, and use the printk helpers more broadly.
Besides it, it also introduces a new way to register consoles
and drop thes the CON_ENABLED flag. It seems too much, but in reality
the changes are not complex, and as the title says, it's basically a
cleanup without changing the functional changes.

This patchset includes a patch from part 2 that needed more work [3], as
suggested by Petr Mladek.

These changes were tested by reverting f79b163c4231
("Revert "serial: 8250: Switch to nbcon console""), and used qemu to test
suspend/resume cycles, and everything worked as expected.

PS: b4 --auto-to-cc added a bunch of people as CC, so I'm not sure if
I should remove some or not, so I'm leaving the list as it is. If the
patchset needs a v2, and you feel that you don't need to copied, just
let me know.

Thanks for checking the patches, and happy holidays!

[1]: https://lore.kernel.org/lkml/20250226-printk-renaming-v1-0-0b878577f2e6@suse.com/#t
[2]: https://lore.kernel.org/linux-serial/20251121-printk-cleanup-part2-v2-0-57b8b78647f4@suse.com/
[3]: https://lore.kernel.org/linux-serial/aSgeqM3DWvR8-cMY@pathway.suse.cz/

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
Marcos Paulo de Souza (19):
      printk/nbcon: Use an enum to specify the required callback in console_is_usable()
      printk: Introduce console_is_nbcon
      printk: Drop flags argument from console_is_usable
      printk: Reintroduce consoles_suspended global state
      printk: Add more context to suspend/resume functions
      printk: Introduce register_console_force
      drivers: netconsole: Migrate to register_console_force helper
      debug: debug_core: Migrate to register_console_force helper
      m68k: emu: nfcon.c: Migrate to register_console_force helper
      fs: pstore: platform: Migrate to register_console_force helper
      powerpc: kernel: udbg: Migrate to register_console_force helper
      sparc: kernel: btext: Migrate to register_console_force helper
      um: drivers: mconsole_kern.c: Migrate to register_console_force helper
      drivers: hwtracing: stm: console.c: Migrate to register_console_force helper
      drivers: tty: serial: mux.c: Migrate to register_console_force helper
      drivers: tty: serial: ma35d1_serial: Migrate to register_console_force helper
      drivers: tty: ehv_bytechan: Migrate to register_console_force helper
      drivers: braille: console: Drop CON_ENABLED console flag
      printk: Remove CON_ENABLED flag

 arch/m68k/emu/nfcon.c                           |   5 +-
 arch/powerpc/kernel/udbg.c                      |   4 +-
 arch/sparc/kernel/btext.c                       |   4 +-
 arch/um/drivers/mconsole_kern.c                 |   3 +-
 arch/um/kernel/kmsg_dump.c                      |   2 +-
 drivers/accessibility/braille/braille_console.c |   1 -
 drivers/hwtracing/stm/console.c                 |   4 +-
 drivers/net/netconsole.c                        |  13 +--
 drivers/tty/ehv_bytechan.c                      |   4 +-
 drivers/tty/serial/ma35d1_serial.c              |   4 +-
 drivers/tty/serial/mux.c                        |   4 +-
 drivers/tty/tty_io.c                            |   6 +-
 fs/proc/consoles.c                              |   1 -
 fs/pstore/platform.c                            |   6 +-
 include/linux/console.h                         | 143 +++++++++++++++++++-----
 kernel/debug/debug_core.c                       |   6 +-
 kernel/debug/kdb/kdb_io.c                       |   6 +-
 kernel/printk/nbcon.c                           |  17 +--
 kernel/printk/printk.c                          | 140 ++++++++++++-----------
 19 files changed, 230 insertions(+), 143 deletions(-)
---
base-commit: 93d65587479cfc97c0d7e41b5e8c6378ca681632
change-id: 20251202-printk-cleanup-part3-ea116b11b3a6

Best regards,
--  
Marcos Paulo de Souza <mpdesouza@suse.com>


