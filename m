Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCE9DC5B1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2019 15:04:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vmTB62nVzDrgH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Oct 2019 00:04:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::244;
 helo=mail-lj1-x244.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="ZqtTvUId"; dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vmCj52vLzDrVW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2019 23:52:43 +1100 (AEDT)
Received: by mail-lj1-x244.google.com with SMTP id a22so6132305ljd.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2019 05:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X8tXbinQHwrpjZVR5SZDxD1u91iSiuAMbDTcJXFPWb8=;
 b=ZqtTvUIddQBWXaS8eT4AyKxHQxxb4LutuCYu8Et1I6qRRkCdNpIZDsBMkkiqP5LJJ3
 T++Y9k8fNV6dq4whnCc4qJYUxpkzOBGqaKv9D+WlmA2Nnrs7pPTF+ryD2Ysn6PV0lyhL
 my8Exob7bYpSp/7oQ9MbAyg6EO3GvkCC8XS9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X8tXbinQHwrpjZVR5SZDxD1u91iSiuAMbDTcJXFPWb8=;
 b=oVFdIoTQtMAfToPWSv+7TgZJndFP9rLHqi1G9WGHc4AJkM+gem6/pN8YJSC/1/iU8q
 PAyijeJkDfWjWMvNQfmQhz9O/KM98iHtESV5U31peyDPsUYJJhz6n2bj11Sa5yBL6vvQ
 8B/aBGfSSoWBiYOhOwDM4qYTlMqBggDYUzUlcRyrXgzbW+z6Tlqdw3sDk5Bn+ZceFJcV
 YxSVYcUVEMPFPVcrwYu8/9PLcCtf5udLinSyPzhLftaGeZFba0dVymuet7MaZo48zwUV
 hS+/bv92aO5j8qTkFGyY9Btj76ZRT+or/DQt1+32eYdUszgsqjwCxpGIOg0ruQWAef93
 Eh9Q==
X-Gm-Message-State: APjAAAVuIPTcjvov9jZDab5RTUaNHqX4DBMXiWw5C7D8+QGUnPaF9xPl
 MHOroxJitowXNUF2aQcjCgtL4w==
X-Google-Smtp-Source: APXvYqyF9yPf+tbU7h7RQICAL7Ec07Pxt3Ja7hV0UEFHDzE2BYMYhcr3tkeM8h/HHzKMwhMhBwF9EQ==
X-Received: by 2002:a2e:3919:: with SMTP id g25mr6031311lja.162.1571403159942; 
 Fri, 18 Oct 2019 05:52:39 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id m17sm7454792lje.0.2019.10.18.05.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 05:52:38 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>, Timur Tabi <timur@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: [PATCH 0/7] towards QE support on ARM
Date: Fri, 18 Oct 2019 14:52:27 +0200
Message-Id: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.20.1
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
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There have been several attempts in the past few years to allow
building the QUICC engine drivers for platforms other than PPC. This
is (the beginning of) yet another attempt. I hope I can get someone to
pick up these relatively trivial patches (I _think_ they shouldn't
change functionality at all), and then I'll continue slowly working
towards removing the PPC32 dependency for CONFIG_QUICC_ENGINE.

Tested on an MPC8309-derived board.

Rasmus Villemoes (7):
  soc: fsl: qe: remove space-before-tab
  soc: fsl: qe: drop volatile qualifier of struct qe_ic::regs
  soc: fsl: qe: avoid ppc-specific io accessors
  soc: fsl: qe: replace spin_event_timeout by readx_poll_timeout_atomic
  serial: make SERIAL_QE depend on PPC32
  serial: ucc_uart.c: explicitly include asm/cpm.h
  soc/fsl/qe/qe.h: remove include of asm/cpm.h

 drivers/soc/fsl/qe/gpio.c     | 30 ++++++++--------
 drivers/soc/fsl/qe/qe.c       | 44 +++++++++++------------
 drivers/soc/fsl/qe/qe_ic.c    |  8 ++---
 drivers/soc/fsl/qe/qe_ic.h    |  2 +-
 drivers/soc/fsl/qe/qe_io.c    | 40 ++++++++++-----------
 drivers/soc/fsl/qe/qe_tdm.c   |  8 ++---
 drivers/soc/fsl/qe/ucc.c      | 12 +++----
 drivers/soc/fsl/qe/ucc_fast.c | 66 ++++++++++++++++++-----------------
 drivers/soc/fsl/qe/ucc_slow.c | 38 ++++++++++----------
 drivers/soc/fsl/qe/usb.c      |  2 +-
 drivers/tty/serial/Kconfig    |  1 +
 drivers/tty/serial/ucc_uart.c |  1 +
 include/soc/fsl/qe/qe.h       |  1 -
 13 files changed, 126 insertions(+), 127 deletions(-)

-- 
2.20.1

