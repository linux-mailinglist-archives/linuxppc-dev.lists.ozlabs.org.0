Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B283117753
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 21:21:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Wvhp1Mr9zDqPS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 07:20:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.65; helo=mail-ot1-f65.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47WvfC5lP9zDqPC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 07:18:43 +1100 (AEDT)
Received: by mail-ot1-f65.google.com with SMTP id r27so13371723otc.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Dec 2019 12:18:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m7V0G8JfUu86bq/RP6YxmwxwHbYcUhJINxbxqczRAcM=;
 b=RNojjAWT8Hz6QDFIOlM5Lms8xrEdEyqU7jJu/lcvRBTOL2Ll1cqdj4O+XRgO8gq48I
 mHRpLcLTuq+oKdP45GZDRAKWLXjjIk3FBntCbVMs/JDzwJ3dcAAKilwmHDUF4uZEeqXX
 6P1QDLJaG4WsvgRykbUb1C8it8SQsKgiZSGH5I2Jsz6S+iRDAb0y++wH72k7VaPogu0Y
 015zycyjYQAHHV6cDOjhc8hj5d+rxiNCVKfjJZZ35xkAd0uUFrw94s9hh6yasj8OTXNi
 ZjVYQXdUBuR0nN1hIHMThfTbDxyVKwIF9NXmwnTjvXYxLA/N9iZ/abjloyrTirgBH9um
 6Oww==
X-Gm-Message-State: APjAAAXOhUfu7JLft5Wpjx0dbuj3PJpp3nAvDqTDLD0nNoRlb6AkmqEs
 INhSXrpzPP7nu0v6UO7Xf29GynUj
X-Google-Smtp-Source: APXvYqzSew8cR1ohGDHK0Kk7eFZgp5EhE1lMRyK+xXkFjs2UXi+eM5hoFw3n/CidUKfY2QTubtBluw==
X-Received: by 2002:a05:6830:1415:: with SMTP id
 v21mr9571257otp.188.1575922720373; 
 Mon, 09 Dec 2019 12:18:40 -0800 (PST)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com.
 [209.85.210.45])
 by smtp.gmail.com with ESMTPSA id q25sm353477otf.45.2019.12.09.12.18.39
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2019 12:18:39 -0800 (PST)
Received: by mail-ot1-f45.google.com with SMTP id 59so13372058otp.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Dec 2019 12:18:39 -0800 (PST)
X-Received: by 2002:a05:6830:11c3:: with SMTP id
 v3mr24197866otq.74.1575922719436; 
 Mon, 09 Dec 2019 12:18:39 -0800 (PST)
MIME-Version: 1.0
References: <20191128145554.1297-1-linux@rasmusvillemoes.dk>
In-Reply-To: <20191128145554.1297-1-linux@rasmusvillemoes.dk>
From: Li Yang <leoyang.li@nxp.com>
Date: Mon, 9 Dec 2019 14:18:27 -0600
X-Gmail-Original-Message-ID: <CADRPPNQBucGPaG0p5SDneVQYt9Wqgv8PuqFF0HFmj2LD8wybtA@mail.gmail.com>
Message-ID: <CADRPPNQBucGPaG0p5SDneVQYt9Wqgv8PuqFF0HFmj2LD8wybtA@mail.gmail.com>
Subject: Re: [PATCH v6 00/49] QUICC Engine support on ARM, ARM64, PPC64
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Timur Tabi <timur@kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 Scott Wood <oss@buserror.net>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 28, 2019 at 8:59 AM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> There have been several attempts in the past few years to allow
> building the QUICC engine drivers for platforms other than PPC32. This
> is yet another attempt.
>
> v5 can be found here: https://lore.kernel.org/lkml/20191118112324.22725-1-linux@rasmusvillemoes.dk/
>
> Changes in v6:
>
> - add various R-b, A-b tags
>
> - add a patch (48/49) fixing a build issue on ARM with CONFIG_SMP=y
>
> I added that patch last in the series, apart from the "allow to build
> on ARM" Kconfig change, to preserve the enumeration of the other
> patches from v5.
>
> 1-5 are about replacing in_be32 etc. in the core QE code (drivers/soc/fsl/qe).
>
> 6-8 handle miscellaneous other ppcisms.
>
> 9-21 deal with qe_ic: Simplifying the driver significantly by removing
> unused code, and removing the platform-specific initialization from
> arch/powerpc/.
>
> 22-25 deal with raw access to devicetree properties in native endianness.
>
> 26-34 makes drivers/tty/serial/ucc_uart.c (CONFIG_SERIAL_QE) ready to build on non-ppc.
>
> 35-46 deal with IS_ERR_VALUE() and some other things found while
> digging around that part of the code.
>
> 47 adds a PPC32 dependency to UCC_GETH - it has some of the same
> issues that have been fixed in the ucc_uart and ucc_hdlc cases. Nobody
> has requested that I allow that driver to be built for arm{,64} and
> reportedly, the hardware has only ever shipped on PPC SOCs. So instead
> of growing this series even bigger, I kept that addition. It's trivial
> to remove if somebody cares enough to fix the build errors/warnings
> and actually has a platform to test the result on.
>
> 48 fixes a build issue on ARM reported by the kbuild bot.
>
> Finally patch 49 lifts the PPC32 restriction from QUICC_ENGINE. At the
> request of Li Yang, it doesn't remove the PPC32 dependency but instead
> changes it to PPC|| ARM || ARM64 (or COMPILE_TEST), i.e. listing
> the platforms that may have a QE.
>
> The series has been built and booted on both an mpc8309-based platform
> (ppc) as well as an ls1021a-based platform (arm). The core QE code is
> exercised on both, while I could only test the ucc_uart on arm, since
> the uarts are not wired up on our mpc8309 board. Qiang Zhao reports
> that the ucc_hdlc driver does indeed work on a ls1043ardb (arm64)
> board.

Series applied for next on my soc tree.  Thanks!

Regards,
Leo
>
> Rasmus Villemoes (49):
>   soc: fsl: qe: remove space-before-tab
>   soc: fsl: qe: drop volatile qualifier of struct qe_ic::regs
>   soc: fsl: qe: rename qe_(clr/set/clrset)bit* helpers
>   soc: fsl: qe: introduce qe_io{read,write}* wrappers
>   soc: fsl: qe: avoid ppc-specific io accessors
>   soc: fsl: qe: replace spin_event_timeout by readx_poll_timeout_atomic
>   soc: fsl: qe: qe.c: guard use of pvr_version_is() with CONFIG_PPC32
>   soc: fsl: qe: drop unneeded #includes
>   soc: fsl: qe: drop assign-only high_active in qe_ic_init
>   soc: fsl: qe: remove pointless sysfs registration in qe_ic.c
>   soc: fsl: qe: use qe_ic_cascade_{low,high}_mpic also on 83xx
>   soc: fsl: qe: move calls of qe_ic_init out of arch/powerpc/
>   powerpc/83xx: remove mpc83xx_ipic_and_qe_init_IRQ
>   powerpc/85xx: remove mostly pointless mpc85xx_qe_init()
>   soc: fsl: qe: move qe_ic_cascade_* functions to qe_ic.c
>   soc: fsl: qe: rename qe_ic_cascade_low_mpic -> qe_ic_cascade_low
>   soc: fsl: qe: remove unused qe_ic_set_* functions
>   soc: fsl: qe: don't use NO_IRQ in qe_ic.c
>   soc: fsl: qe: make qe_ic_get_{low,high}_irq static
>   soc: fsl: qe: simplify qe_ic_init()
>   soc: fsl: qe: merge qe_ic.h headers into qe_ic.c
>   soc: fsl: qe: qe.c: use of_property_read_* helpers
>   soc: fsl: qe: qe_io.c: don't open-code of_parse_phandle()
>   soc: fsl: qe: qe_io.c: access device tree property using be32_to_cpu
>   soc: fsl: qe: qe_io.c: use of_property_read_u32() in par_io_init()
>   soc: fsl: move cpm.h from powerpc/include/asm to include/soc/fsl
>   soc/fsl/qe/qe.h: update include path for cpm.h
>   serial: ucc_uart: explicitly include soc/fsl/cpm.h
>   serial: ucc_uart: replace ppc-specific IO accessors
>   serial: ucc_uart: factor out soft_uart initialization
>   serial: ucc_uart: stub out soft_uart_init for !CONFIG_PPC32
>   serial: ucc_uart: use of_property_read_u32() in ucc_uart_probe()
>   serial: ucc_uart: limit brg-frequency workaround to PPC32
>   serial: ucc_uart: access __be32 field using be32_to_cpu
>   soc: fsl: qe: change return type of cpm_muram_alloc() to s32
>   soc: fsl: qe: make cpm_muram_free() return void
>   soc: fsl: qe: make cpm_muram_free() ignore a negative offset
>   soc: fsl: qe: drop broken lazy call of cpm_muram_init()
>   soc: fsl: qe: refactor cpm_muram_alloc_common to prevent BUG on error
>     path
>   soc: fsl: qe: avoid IS_ERR_VALUE in ucc_slow.c
>   soc: fsl: qe: drop use of IS_ERR_VALUE in qe_sdma_init()
>   soc: fsl: qe: drop pointless check in qe_sdma_init()
>   soc: fsl: qe: avoid IS_ERR_VALUE in ucc_fast.c
>   net/wan/fsl_ucc_hdlc: avoid use of IS_ERR_VALUE()
>   net/wan/fsl_ucc_hdlc: fix reading of __be16 registers
>   net/wan/fsl_ucc_hdlc: reject muram offsets above 64K
>   net: ethernet: freescale: make UCC_GETH explicitly depend on PPC32
>   soc: fsl: qe: remove unused #include of asm/irq.h from ucc.c
>   soc: fsl: qe: remove PPC32 dependency from CONFIG_QUICC_ENGINE
>
>  arch/powerpc/include/asm/cpm.h                | 172 +-------
>  arch/powerpc/platforms/83xx/km83xx.c          |   3 +-
>  arch/powerpc/platforms/83xx/misc.c            |  23 --
>  arch/powerpc/platforms/83xx/mpc832x_mds.c     |   3 +-
>  arch/powerpc/platforms/83xx/mpc832x_rdb.c     |   3 +-
>  arch/powerpc/platforms/83xx/mpc836x_mds.c     |   3 +-
>  arch/powerpc/platforms/83xx/mpc836x_rdk.c     |   3 +-
>  arch/powerpc/platforms/83xx/mpc83xx.h         |   7 -
>  arch/powerpc/platforms/85xx/common.c          |  23 --
>  arch/powerpc/platforms/85xx/corenet_generic.c |  12 -
>  arch/powerpc/platforms/85xx/mpc85xx.h         |   2 -
>  arch/powerpc/platforms/85xx/mpc85xx_mds.c     |  28 --
>  arch/powerpc/platforms/85xx/mpc85xx_rdb.c     |  18 -
>  arch/powerpc/platforms/85xx/twr_p102x.c       |  16 -
>  drivers/net/ethernet/freescale/Kconfig        |   2 +-
>  drivers/net/wan/fsl_ucc_hdlc.c                |  23 +-
>  drivers/net/wan/fsl_ucc_hdlc.h                |   2 +-
>  drivers/soc/fsl/qe/Kconfig                    |   3 +-
>  drivers/soc/fsl/qe/gpio.c                     |  34 +-
>  drivers/soc/fsl/qe/qe.c                       | 104 ++---
>  drivers/soc/fsl/qe/qe_common.c                |  50 +--
>  drivers/soc/fsl/qe/qe_ic.c                    | 285 ++++++-------
>  drivers/soc/fsl/qe/qe_ic.h                    |  99 -----
>  drivers/soc/fsl/qe/qe_io.c                    |  70 ++--
>  drivers/soc/fsl/qe/qe_tdm.c                   |   8 +-
>  drivers/soc/fsl/qe/ucc.c                      |  27 +-
>  drivers/soc/fsl/qe/ucc_fast.c                 |  86 ++--
>  drivers/soc/fsl/qe/ucc_slow.c                 |  60 ++-
>  drivers/soc/fsl/qe/usb.c                      |   2 +-
>  drivers/tty/serial/ucc_uart.c                 | 385 +++++++++---------
>  include/soc/fsl/cpm.h                         | 171 ++++++++
>  include/soc/fsl/qe/qe.h                       |  59 ++-
>  include/soc/fsl/qe/qe_ic.h                    | 135 ------
>  include/soc/fsl/qe/ucc_fast.h                 |   4 +-
>  include/soc/fsl/qe/ucc_slow.h                 |   6 +-
>  35 files changed, 775 insertions(+), 1156 deletions(-)
>  delete mode 100644 drivers/soc/fsl/qe/qe_ic.h
>  create mode 100644 include/soc/fsl/cpm.h
>  delete mode 100644 include/soc/fsl/qe/qe_ic.h
>
> --
> 2.23.0
>
