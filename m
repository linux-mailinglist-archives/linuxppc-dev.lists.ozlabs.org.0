Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C9110044B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 12:35:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Gn2M5B5DzDqVW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 22:35:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::341;
 helo=mail-wm1-x341.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="ieP0Hhy7"; dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47GmmW18GTzDqK5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 22:23:36 +1100 (AEDT)
Received: by mail-wm1-x341.google.com with SMTP id l17so16925118wmh.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 03:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TBWX3w17Hmja6UWfhFzaP+5JtBcf7FvgYQ6BEI9JfQ4=;
 b=ieP0Hhy7vzq3rc0tMajMq1S39mOFDs4o5gWkgjAa/tx+haws8QRzKoR7BwIvPfFz0Z
 XwP86WYCZvqYWqHXhxB+sVDlsRwlNxqfs9fb+4BbJ3joxfdaQcACC9z8i6S+PSmP/fwE
 JO84LoRL8EtVLb/4HeJfPYBb9pwnusVLCg3/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TBWX3w17Hmja6UWfhFzaP+5JtBcf7FvgYQ6BEI9JfQ4=;
 b=Xv8Y6NFHHntyIXLodA3bbZq8RX1HOsZ8Rpw7PpCdU2Q5XnSNh4GGYQxRKWRa2DrOYz
 xIRUWKZ8SPNHDJb7+cSFD8XCxsvkD8AetGPgUN66SwjRcyAA6/+MOGWZ2FB6yRzihrg9
 5CmI7gS9Cl70uo9Io8Zgw3g1wDQsCyOL0wcnW895s0XpGvfPKfvq8KF/EgL0ZKlPVVCv
 H/bm6yGbQxCJ5U9daYagZJWADbbCJenrg28bhd7WwztMASLN7pwbz8RC43hUrdsFq6TU
 MUfEJY+4mdkfcY6XMtb7Ovjn39U7k6ALFKZ2fuD2xSCx/anljtFrSqUMW75NOFnmqiTx
 ygLg==
X-Gm-Message-State: APjAAAVVbiZTqdHXxIreRTKpNFDxlpGGlwZ3ipMtPIzlan9yDmJz02XC
 dtzVofq3eQjlptXJserwgVlOVQ==
X-Google-Smtp-Source: APXvYqzKE4Io66KMC69PfyvoTe8ZMR8eJVp24eLnGOg4DtZTaBwAtj/3PySxN0MPhCrUsTPirXnWNQ==
X-Received: by 2002:a7b:ce08:: with SMTP id m8mr29287901wmc.68.1574076209937; 
 Mon, 18 Nov 2019 03:23:29 -0800 (PST)
Received: from prevas-ravi.prevas.se (ip-5-186-115-54.cgn.fibianet.dk.
 [5.186.115.54])
 by smtp.gmail.com with ESMTPSA id y2sm21140815wmy.2.2019.11.18.03.23.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 03:23:29 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v5 00/48] QUICC Engine support on ARM, ARM64, PPC64
Date: Mon, 18 Nov 2019 12:22:36 +0100
Message-Id: <20191118112324.22725-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
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
Cc: Timur Tabi <timur@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There have been several attempts in the past few years to allow
building the QUICC engine drivers for platforms other than PPC32. This
is yet another attempt.

v4 can be found here: https://lore.kernel.org/lkml/20191108130123.6839-1-linux@rasmusvillemoes.dk/

Changes in v5:

- add patch (33/48) to not carry over the brg-frequency workaround in
  ucc_uart to the new platforms the code can now be built for (Timur,
  Scott)

- style fix in 32/48 (Timur)

- expand commit log of 47/48 (Timur, Li Yang)

- s/long/s32/ in 35/48 (Qiang)

- also include PPC64 in the set of architectures where QE can be built
  (Li Yang)

1-5 are about replacing in_be32 etc. in the core QE code (drivers/soc/fsl/qe).

6-8 handle miscellaneous other ppcisms.

9-21 deal with qe_ic: Simplifying the driver significantly by removing
unused code, and removing the platform-specific initialization from
arch/powerpc/.

22-25 deal with raw access to devicetree properties in native endianness.

26-34 makes drivers/tty/serial/ucc_uart.c (CONFIG_SERIAL_QE) ready to build on non-ppc.

35-46 deal with IS_ERR_VALUE() and some other things found while
digging around that part of the code.

47 adds a PPC32 dependency to UCC_GETH - it has some of the same
issues that have been fixed in the ucc_uart and ucc_hdlc cases. Nobody
has requested that I allow that driver to be built for arm{,64} and
reportedly, the hardware has only ever shipped on PPC SOCs. So instead
of growing this series even bigger, I kept that addition. It's trivial
to remove if somebody cares enough to fix the build errors/warnings
and actually has a platform to test the result on.

Finally patch 48 lifts the PPC32 restriction from QUICC_ENGINE. At the
request of Li Yang, it doesn't remove the PPC32 dependency but instead
changes it to PPC|| ARM || ARM64 (or COMPILE_TEST), i.e. listing
the platforms that may have a QE.

The series has been built and booted on both an mpc8309-based platform
(ppc) as well as an ls1021a-based platform (arm). The core QE code is
exercised on both, while I could only test the ucc_uart on arm, since
the uarts are not wired up on our mpc8309 board. Qiang Zhao reports
that the ucc_hdlc driver does indeed work on a ls1043ardb (arm64)
board.

Rasmus Villemoes (48):
  soc: fsl: qe: remove space-before-tab
  soc: fsl: qe: drop volatile qualifier of struct qe_ic::regs
  soc: fsl: qe: rename qe_(clr/set/clrset)bit* helpers
  soc: fsl: qe: introduce qe_io{read,write}* wrappers
  soc: fsl: qe: avoid ppc-specific io accessors
  soc: fsl: qe: replace spin_event_timeout by readx_poll_timeout_atomic
  soc: fsl: qe: qe.c: guard use of pvr_version_is() with CONFIG_PPC32
  soc: fsl: qe: drop unneeded #includes
  soc: fsl: qe: drop assign-only high_active in qe_ic_init
  soc: fsl: qe: remove pointless sysfs registration in qe_ic.c
  soc: fsl: qe: use qe_ic_cascade_{low,high}_mpic also on 83xx
  soc: fsl: qe: move calls of qe_ic_init out of arch/powerpc/
  powerpc/83xx: remove mpc83xx_ipic_and_qe_init_IRQ
  powerpc/85xx: remove mostly pointless mpc85xx_qe_init()
  soc: fsl: qe: move qe_ic_cascade_* functions to qe_ic.c
  soc: fsl: qe: rename qe_ic_cascade_low_mpic -> qe_ic_cascade_low
  soc: fsl: qe: remove unused qe_ic_set_* functions
  soc: fsl: qe: don't use NO_IRQ in qe_ic.c
  soc: fsl: qe: make qe_ic_get_{low,high}_irq static
  soc: fsl: qe: simplify qe_ic_init()
  soc: fsl: qe: merge qe_ic.h headers into qe_ic.c
  soc: fsl: qe: qe.c: use of_property_read_* helpers
  soc: fsl: qe: qe_io.c: don't open-code of_parse_phandle()
  soc: fsl: qe: qe_io.c: access device tree property using be32_to_cpu
  soc: fsl: qe: qe_io.c: use of_property_read_u32() in par_io_init()
  soc: fsl: move cpm.h from powerpc/include/asm to include/soc/fsl
  soc/fsl/qe/qe.h: update include path for cpm.h
  serial: ucc_uart: explicitly include soc/fsl/cpm.h
  serial: ucc_uart: replace ppc-specific IO accessors
  serial: ucc_uart: factor out soft_uart initialization
  serial: ucc_uart: stub out soft_uart_init for !CONFIG_PPC32
  serial: ucc_uart: use of_property_read_u32() in ucc_uart_probe()
  serial: ucc_uart: limit brg-frequency workaround to PPC32
  serial: ucc_uart: access __be32 field using be32_to_cpu
  soc: fsl: qe: change return type of cpm_muram_alloc() to s32
  soc: fsl: qe: make cpm_muram_free() return void
  soc: fsl: qe: make cpm_muram_free() ignore a negative offset
  soc: fsl: qe: drop broken lazy call of cpm_muram_init()
  soc: fsl: qe: refactor cpm_muram_alloc_common to prevent BUG on error
    path
  soc: fsl: qe: avoid IS_ERR_VALUE in ucc_slow.c
  soc: fsl: qe: drop use of IS_ERR_VALUE in qe_sdma_init()
  soc: fsl: qe: drop pointless check in qe_sdma_init()
  soc: fsl: qe: avoid IS_ERR_VALUE in ucc_fast.c
  net/wan/fsl_ucc_hdlc: avoid use of IS_ERR_VALUE()
  net/wan/fsl_ucc_hdlc: fix reading of __be16 registers
  net/wan/fsl_ucc_hdlc: reject muram offsets above 64K
  net: ethernet: freescale: make UCC_GETH explicitly depend on PPC32
  soc: fsl: qe: remove PPC32 dependency from CONFIG_QUICC_ENGINE

 arch/powerpc/include/asm/cpm.h                | 172 +-------
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
 arch/powerpc/platforms/85xx/mpc85xx_rdb.c     |  18 -
 arch/powerpc/platforms/85xx/twr_p102x.c       |  16 -
 drivers/net/ethernet/freescale/Kconfig        |   2 +-
 drivers/net/wan/fsl_ucc_hdlc.c                |  23 +-
 drivers/net/wan/fsl_ucc_hdlc.h                |   2 +-
 drivers/soc/fsl/qe/Kconfig                    |   3 +-
 drivers/soc/fsl/qe/gpio.c                     |  34 +-
 drivers/soc/fsl/qe/qe.c                       | 104 ++---
 drivers/soc/fsl/qe/qe_common.c                |  50 +--
 drivers/soc/fsl/qe/qe_ic.c                    | 285 ++++++-------
 drivers/soc/fsl/qe/qe_ic.h                    |  99 -----
 drivers/soc/fsl/qe/qe_io.c                    |  70 ++--
 drivers/soc/fsl/qe/qe_tdm.c                   |   8 +-
 drivers/soc/fsl/qe/ucc.c                      |  26 +-
 drivers/soc/fsl/qe/ucc_fast.c                 |  86 ++--
 drivers/soc/fsl/qe/ucc_slow.c                 |  60 ++-
 drivers/soc/fsl/qe/usb.c                      |   2 +-
 drivers/tty/serial/ucc_uart.c                 | 385 +++++++++---------
 include/soc/fsl/cpm.h                         | 171 ++++++++
 include/soc/fsl/qe/qe.h                       |  59 ++-
 include/soc/fsl/qe/qe_ic.h                    | 135 ------
 include/soc/fsl/qe/ucc_fast.h                 |   4 +-
 include/soc/fsl/qe/ucc_slow.h                 |   6 +-
 35 files changed, 775 insertions(+), 1155 deletions(-)
 delete mode 100644 drivers/soc/fsl/qe/qe_ic.h
 create mode 100644 include/soc/fsl/cpm.h
 delete mode 100644 include/soc/fsl/qe/qe_ic.h

-- 
2.23.0

