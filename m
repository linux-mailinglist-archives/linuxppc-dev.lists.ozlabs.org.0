Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF84E4B6E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 14:45:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4703jS5DjmzDqk7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 23:45:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::143;
 helo=mail-lf1-x143.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="gr43qyfK"; dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4703d13sCFzDqSk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 23:41:08 +1100 (AEDT)
Received: by mail-lf1-x143.google.com with SMTP id g3so1607751lfb.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 05:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nNhTW3U2Xf+f8X6ztyGJ0vdPsrVEzgnkoLb09kGESGY=;
 b=gr43qyfKeoGH65CYsJHoPG+YL9Tx4hVUZVoQzYzb9XsMqHySY57WJtUCKdPh98abFb
 978lBekDEIJw3ctIHrCrHNrnVte3xIHmGJW9xZwa+BVM8YrwNCtva1EUvT8mgMQ0+NIk
 RMH0xuXFjObqrkldH+wRmh6xxURbjD8yMaUAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nNhTW3U2Xf+f8X6ztyGJ0vdPsrVEzgnkoLb09kGESGY=;
 b=kTp8VByZP7bnM4ZSDbj8wsRB45/nKFLhO2e4Y2zusMCXEcrQZ4UAYLkTWh+As0V5KE
 miv+iaxao41yCsG2u6cxT6IM6j6ecxCD8VG4MpEXeZDT++2uP85ub7Yb0dLxL1QezlEx
 hLmPpvsyLUphydQRP8CsNNFlKVfzkrNeio26czX2jkKN2LQo5LQrfceMsNGEO3U5M/F0
 FRl8aEcnP+pQS7/xq71ArCPj+Brl1Uk5g4XhRrDtKzfzyrTUiyxsGcbqVYCf0Mrr42t4
 JlnTvnnfT7xVIOoR4TH6ZrbDO+2mzKG1E9qjSPnzPVBroGAyI0YroVQ74/rcR09/6U9R
 +g2g==
X-Gm-Message-State: APjAAAXhvVYR22MEzj3HgzU2vGyGQpfxgyCEyFJT1bSg9gPPywLeDNbj
 OaTSB9qhTXnlbLQl78mviFuYhg==
X-Google-Smtp-Source: APXvYqzI54y0qXty0REj/t8bh97dPNgFy2YQ0TG2aFgxJMZvmcPNDi0C+wUJpvWYRj3db7mvv6qlJw==
X-Received: by 2002:ac2:4d04:: with SMTP id r4mr2706461lfi.136.1572007262270; 
 Fri, 25 Oct 2019 05:41:02 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id 10sm821028lfy.57.2019.10.25.05.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 05:41:01 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 00/23] QUICC Engine support on ARM
Date: Fri, 25 Oct 2019 14:40:35 +0200
Message-Id: <20191025124058.22580-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
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
Cc: Valentin Longchamp <valentin.longchamp@keymile.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 Scott Wood <oss@buserror.net>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There have been several attempts in the past few years to allow
building the QUICC engine drivers for platforms other than PPC. This
is yet another attempt.

In v2, I've fixed a few style issues. But more importantly, it now
contains enough to actually remove the PPC32 dependency from
CONFIG_QUICC_ENGINE, so that's what the last patch does.

I haven't found a way to address Christophe's concern over the
performance impact of using the (on powerpc) out-of-line iowrite32be
instead of out_be32. I could of course introduce some qe_ prefixed
helpers (similar to the already added qe_clrsetbits ones) and make
their definition dependent on PPC32 or not, but that seems to be a bit
ugly.

Rasmus Villemoes (23):
  soc: fsl: qe: remove space-before-tab
  soc: fsl: qe: drop volatile qualifier of struct qe_ic::regs
  soc: fsl: qe: avoid ppc-specific io accessors
  soc: fsl: qe: replace spin_event_timeout by readx_poll_timeout_atomic
  soc: fsl: qe: qe.c: guard use of pvr_version_is() with CONFIG_PPC32
  soc: fsl: qe: avoid tail comments in qe_ic.h
  soc: fsl: qe: merge qe_ic.h into qe_ic.c
  soc: fsl: qe: drop unneeded #includes
  soc: fsl: qe: move qe_ic_cascade_* functions to qe_ic.c
  soc: fsl: qe: use qe_ic_cascade_{low,high}_mpic also on 83xx
  soc: fsl: qe: rename qe_ic_cascade_low_mpic -> qe_ic_cascade_low
  soc: fsl: qe: drop assign-only high_active in qe_ic_init
  soc: fsl: qe: remove pointless sysfs registration in qe_ic.c
  soc: fsl: qe: move calls of qe_ic_init out of arch/powerpc/
  powerpc/83xx: remove mpc83xx_ipic_and_qe_init_IRQ
  powerpc/85xx: remove mostly pointless mpc85xx_qe_init()
  soc: fsl: qe: make qe_ic_cascade_* static
  soc: fsl: qe: remove unused qe_ic_set_* functions
  net: ethernet: freescale: make UCC_GETH explicitly depend on PPC32
  serial: make SERIAL_QE depend on PPC32
  serial: ucc_uart.c: explicitly include asm/cpm.h
  soc/fsl/qe/qe.h: remove include of asm/cpm.h
  soc: fsl: qe: remove PPC32 dependency from CONFIG_QUICC_ENGINE

 arch/powerpc/platforms/83xx/km83xx.c          |   3 +-
 arch/powerpc/platforms/83xx/misc.c            |  23 --
 arch/powerpc/platforms/83xx/mpc832x_mds.c     |   3 +-
 arch/powerpc/platforms/83xx/mpc832x_rdb.c     |   3 +-
 arch/powerpc/platforms/83xx/mpc836x_mds.c     |   3 +-
 arch/powerpc/platforms/83xx/mpc836x_rdk.c     |   3 +-
 arch/powerpc/platforms/83xx/mpc83xx.h         |   7 -
 arch/powerpc/platforms/85xx/common.c          |  23 --
 arch/powerpc/platforms/85xx/corenet_generic.c |  12 -
 arch/powerpc/platforms/85xx/mpc85xx.h         |   2 -
 arch/powerpc/platforms/85xx/mpc85xx_mds.c     |  28 --
 arch/powerpc/platforms/85xx/mpc85xx_rdb.c     |  18 --
 arch/powerpc/platforms/85xx/twr_p102x.c       |  16 -
 drivers/net/ethernet/freescale/Kconfig        |   1 +
 drivers/soc/fsl/qe/Kconfig                    |   2 +-
 drivers/soc/fsl/qe/gpio.c                     |  30 +-
 drivers/soc/fsl/qe/qe.c                       |  59 ++--
 drivers/soc/fsl/qe/qe_ic.c                    | 289 ++++++++++--------
 drivers/soc/fsl/qe/qe_ic.h                    |  99 ------
 drivers/soc/fsl/qe/qe_io.c                    |  42 ++-
 drivers/soc/fsl/qe/qe_tdm.c                   |   8 +-
 drivers/soc/fsl/qe/ucc.c                      |  16 +-
 drivers/soc/fsl/qe/ucc_fast.c                 |  70 ++---
 drivers/soc/fsl/qe/ucc_slow.c                 |  38 +--
 drivers/soc/fsl/qe/usb.c                      |   2 +-
 drivers/tty/serial/Kconfig                    |   1 +
 drivers/tty/serial/ucc_uart.c                 |   1 +
 include/soc/fsl/qe/qe.h                       |   1 -
 include/soc/fsl/qe/qe_ic.h                    |  69 -----
 29 files changed, 299 insertions(+), 573 deletions(-)
 delete mode 100644 drivers/soc/fsl/qe/qe_ic.h

-- 
2.23.0

