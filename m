Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDD1F9B39
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 21:50:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CKdm2JCPzF5Wh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 07:50:52 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CKWd5l06zF4n3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 07:45:33 +1100 (AEDT)
Received: by mail-ot1-f65.google.com with SMTP id c19so15504498otr.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 12:45:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qp7qCKznyn9kzrOI/DVJJyUZ22We1ef8DoOVvNKUl/E=;
 b=Pz8y7H7/jC1Cn5PCaXFIm+6+AHv+5vXnjxmYVU2r6m+XZOre1pYrpi9LIWgTUEaPlm
 PhM5q2wu292FJmu7R7nGHp9eTNzzreUEcmMWq+O8T6bgSwi/RgFzaKxxDOwcFEK0CAnY
 l13KqiK/Lx2ZryXPvHVG2acVXtan07UwAgprPUzk9kMZOBb0WaJsOwSE/jVYw8kqggbG
 mQue18jJrYwQZmp8nrqFu1AQk2DRvMufKAolKqGAXTo5nZ+NaZxJbkjtDiwzgrSgwV4E
 5fxsDdBb4h2OGRDk6AXZwqdl7bINBy8tIN5L7jB6L4P+e7SRgrWqPlr4TriSM/xe7vjG
 G0tA==
X-Gm-Message-State: APjAAAWU1sLHFYFZequjrie/XBcV/1ZoWt0cIFvCHWtsWbjmQs6W/lEG
 BTGIr/2rCRtKoPQyV5Sl/rVsxjbi
X-Google-Smtp-Source: APXvYqytCZtrRKs9KmHlUiSxphoAdXAeleCZk+W4TCoTHl0NCEUT4Dfkbed79d7uwVpVSlER6z4vqg==
X-Received: by 2002:a9d:618a:: with SMTP id g10mr17448619otk.42.1573591529643; 
 Tue, 12 Nov 2019 12:45:29 -0800 (PST)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com.
 [209.85.167.174])
 by smtp.gmail.com with ESMTPSA id b12sm6414617otl.34.2019.11.12.12.45.29
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2019 12:45:29 -0800 (PST)
Received: by mail-oi1-f174.google.com with SMTP id 22so16140409oip.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 12:45:29 -0800 (PST)
X-Received: by 2002:aca:4891:: with SMTP id v139mr748524oia.175.1573591528822; 
 Tue, 12 Nov 2019 12:45:28 -0800 (PST)
MIME-Version: 1.0
References: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
 <CADRPPNSeEvFnVzGeZW6RPo_LP8mq14G2ZmmDAuwNdC3hT8Ekcg@mail.gmail.com>
In-Reply-To: <CADRPPNSeEvFnVzGeZW6RPo_LP8mq14G2ZmmDAuwNdC3hT8Ekcg@mail.gmail.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Tue, 12 Nov 2019 14:45:17 -0600
X-Gmail-Original-Message-ID: <CADRPPNQFiPMvRcSkVgM8p2_AxhqBOVFus=cX5UC-8NYYUvf+0A@mail.gmail.com>
Message-ID: <CADRPPNQFiPMvRcSkVgM8p2_AxhqBOVFus=cX5UC-8NYYUvf+0A@mail.gmail.com>
Subject: Re: [PATCH v4 00/47] QUICC Engine support on ARM and ARM64
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 David Miller <davem@davemloft.net>, 
 Scott Wood <oss@buserror.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Timur Tabi <timur@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 11, 2019 at 5:39 PM Li Yang <leoyang.li@nxp.com> wrote:
>
> On Fri, Nov 8, 2019 at 7:05 AM Rasmus Villemoes
> <linux@rasmusvillemoes.dk> wrote:
> >
>
> I'm generally ok with these enhencements and cleanups.  But as the
> whole patch series touched multiple subsystems, I would like to
> collect the Acked-by from Scott, Greg and David if we want the whole
> series to go through the fsl/soc tree.

Rasmus,

Since the patches also touched net and serial subsystem.  Can you also
repost these patches(maybe just related ones) onto netdev and
linux-serial mailing list?

Regards,
Leo
>
> Also Qiang, can you help to test the latest version and provide you
> Tested-by?  Thanks.
>
> > There have been several attempts in the past few years to allow
> > building the QUICC engine drivers for platforms other than PPC. This
> > is yet another attempt.
> >
> > v3 can be found here: https://lore.kernel.org/lkml/20191101124210.14510-1-linux@rasmusvillemoes.dk/
> >
> > v4 adds a some patches to fix (ab)use of IS_ERR_VALUE which fails when
> > sizeof(u32) != sizeof(long), i.e. on 64-bit platforms. Freescale
> > drivers are some of the last holdouts using that macro (outside of
> > arch/ and core mm code), so I decided trying to simply get rid of it
> > instead of papering over it by using a temporary long to store the
> > result in. Doing that I stumbled on some other things that should be
> > fixed. These are the new patches 34-45.
> >
> > Patch 35 from v3 (which added a PPC32 dependency to FSL_UCC_HDLC) is
> > gone from this version, so that that driver can indeed now be built
> > for arm and arm64.
> >
> > 1-5 are about replacing in_be32 etc. in the core QE code (drivers/soc/fsl/qe).
> >
> > 6-8 handle miscellaneous other ppcisms.
> >
> > 9-21 deal with qe_ic: Simplifying the driver significantly by removing
> > unused code, and removing the platform-specific initialization from
> > arch/powerpc/.
> >
> > 22-25 deal with raw access to devicetree properties in native endianness.
> >
> > 26-33 makes drivers/tty/serial/ucc_uart.c (CONFIG_SERIAL_QE) ready to build on arm.
> >
> > 34-45 deal with IS_ERR_VALUE() and some other things found while
> > digging around that part of the code.
> >
> > 46 adds a PPC32 dependency to UCC_GETH - it has some of the same
> > issues that have been fixed in the ucc_uart and ucc_hdlc cases. Nobody
> > has requested that I allow that driver to be built for arm{,64}, so
> > instead of growing this series even bigger, I kept that addition. It's
> > trivial to remove if somebody cares enough to fix the build
> > errors/warnings and actually has a platform to test the result on.
> >
> > Finally patch 47 lifts the PPC32 restriction from QUICC_ENGINE. At the
> > request of Li Yang, it doesn't remove the PPC32 dependency but instead
> > changes it to PPC32 || ARM || ARM64 (or COMPILE_TEST), i.e. listing
> > the platforms that may have a QE.
> >
> > The series has been built and booted on both an mpc8309-based platform
> > (ppc) as well as an ls1021a-based platform (arm). The core QE code is
> > exercised on both, while I could only test the ucc_uart on arm, since
> > the uarts are not wired up on our mpc8309 board. Qiang Zhao reports
> > that the ucc_hdlc driver does indeed work on a ls1043ardb (arm64)
> > board, I hope he'll formally add a Tested-by: to the relevant patches
> > since I don't have any arm64 board with QE.
> >
> > Rasmus Villemoes (47):
> >   soc: fsl: qe: remove space-before-tab
> >   soc: fsl: qe: drop volatile qualifier of struct qe_ic::regs
> >   soc: fsl: qe: rename qe_(clr/set/clrset)bit* helpers
> >   soc: fsl: qe: introduce qe_io{read,write}* wrappers
> >   soc: fsl: qe: avoid ppc-specific io accessors
> >   soc: fsl: qe: replace spin_event_timeout by readx_poll_timeout_atomic
> >   soc: fsl: qe: qe.c: guard use of pvr_version_is() with CONFIG_PPC32
> >   soc: fsl: qe: drop unneeded #includes
> >   soc: fsl: qe: drop assign-only high_active in qe_ic_init
> >   soc: fsl: qe: remove pointless sysfs registration in qe_ic.c
> >   soc: fsl: qe: use qe_ic_cascade_{low,high}_mpic also on 83xx
> >   soc: fsl: qe: move calls of qe_ic_init out of arch/powerpc/
> >   powerpc/83xx: remove mpc83xx_ipic_and_qe_init_IRQ
> >   powerpc/85xx: remove mostly pointless mpc85xx_qe_init()
>
> Scott,
> What do you think about the PPC changes?
>
> >   soc: fsl: qe: move qe_ic_cascade_* functions to qe_ic.c
> >   soc: fsl: qe: rename qe_ic_cascade_low_mpic -> qe_ic_cascade_low
> >   soc: fsl: qe: remove unused qe_ic_set_* functions
> >   soc: fsl: qe: don't use NO_IRQ in qe_ic.c
> >   soc: fsl: qe: make qe_ic_get_{low,high}_irq static
> >   soc: fsl: qe: simplify qe_ic_init()
> >   soc: fsl: qe: merge qe_ic.h headers into qe_ic.c
> >   soc: fsl: qe: qe.c: use of_property_read_* helpers
> >   soc: fsl: qe: qe_io.c: don't open-code of_parse_phandle()
> >   soc: fsl: qe: qe_io.c: access device tree property using be32_to_cpu
> >   soc: fsl: qe: qe_io.c: use of_property_read_u32() in par_io_init()
> >   soc: fsl: move cpm.h from powerpc/include/asm to include/soc/fsl
> >   soc/fsl/qe/qe.h: update include path for cpm.h
> >   serial: ucc_uart: explicitly include soc/fsl/cpm.h
> >   serial: ucc_uart: replace ppc-specific IO accessors
> >   serial: ucc_uart: factor out soft_uart initialization
> >   serial: ucc_uart: stub out soft_uart_init for !CONFIG_PPC32
> >   serial: ucc_uart: use of_property_read_u32() in ucc_uart_probe()
> >   serial: ucc_uart: access __be32 field using be32_to_cpu
>
> Greg and Timur,
> What do you think about these serial changes.
>
> >   soc: fsl: qe: change return type of cpm_muram_alloc() to s32
> >   soc: fsl: qe: make cpm_muram_free() return void
> >   soc: fsl: qe: make cpm_muram_free() ignore a negative offset
> >   soc: fsl: qe: drop broken lazy call of cpm_muram_init()
> >   soc: fsl: qe: refactor cpm_muram_alloc_common to prevent BUG on error
> >     path
> >   soc: fsl: qe: avoid IS_ERR_VALUE in ucc_slow.c
> >   soc: fsl: qe: drop use of IS_ERR_VALUE in qe_sdma_init()
> >   soc: fsl: qe: drop pointless check in qe_sdma_init()
> >   soc: fsl: qe: avoid IS_ERR_VALUE in ucc_fast.c
> >   net/wan/fsl_ucc_hdlc: avoid use of IS_ERR_VALUE()
> >   net/wan/fsl_ucc_hdlc: fix reading of __be16 registers
> >   net/wan/fsl_ucc_hdlc: reject muram offsets above 64K
> >   net: ethernet: freescale: make UCC_GETH explicitly depend on PPC32
>
> David and Qiang,
> What do you think of the net changes?
>
> >   soc: fsl: qe: remove PPC32 dependency from CONFIG_QUICC_ENGINE
> >
> >  arch/powerpc/include/asm/cpm.h                | 172 +-------
> >  arch/powerpc/platforms/83xx/km83xx.c          |   3 +-
> >  arch/powerpc/platforms/83xx/misc.c            |  23 --
> >  arch/powerpc/platforms/83xx/mpc832x_mds.c     |   3 +-
> >  arch/powerpc/platforms/83xx/mpc832x_rdb.c     |   3 +-
> >  arch/powerpc/platforms/83xx/mpc836x_mds.c     |   3 +-
> >  arch/powerpc/platforms/83xx/mpc836x_rdk.c     |   3 +-
> >  arch/powerpc/platforms/83xx/mpc83xx.h         |   7 -
> >  arch/powerpc/platforms/85xx/common.c          |  23 --
> >  arch/powerpc/platforms/85xx/corenet_generic.c |  12 -
> >  arch/powerpc/platforms/85xx/mpc85xx.h         |   2 -
> >  arch/powerpc/platforms/85xx/mpc85xx_mds.c     |  28 --
> >  arch/powerpc/platforms/85xx/mpc85xx_rdb.c     |  18 -
> >  arch/powerpc/platforms/85xx/twr_p102x.c       |  16 -
> >  drivers/net/ethernet/freescale/Kconfig        |   2 +-
> >  drivers/net/wan/fsl_ucc_hdlc.c                |  23 +-
> >  drivers/net/wan/fsl_ucc_hdlc.h                |   2 +-
> >  drivers/soc/fsl/qe/Kconfig                    |   3 +-
> >  drivers/soc/fsl/qe/gpio.c                     |  34 +-
> >  drivers/soc/fsl/qe/qe.c                       | 104 ++---
> >  drivers/soc/fsl/qe/qe_common.c                |  50 +--
> >  drivers/soc/fsl/qe/qe_ic.c                    | 285 ++++++-------
> >  drivers/soc/fsl/qe/qe_ic.h                    |  99 -----
> >  drivers/soc/fsl/qe/qe_io.c                    |  70 ++--
> >  drivers/soc/fsl/qe/qe_tdm.c                   |   8 +-
> >  drivers/soc/fsl/qe/ucc.c                      |  26 +-
> >  drivers/soc/fsl/qe/ucc_fast.c                 |  86 ++--
> >  drivers/soc/fsl/qe/ucc_slow.c                 |  60 ++-
> >  drivers/soc/fsl/qe/usb.c                      |   2 +-
> >  drivers/tty/serial/ucc_uart.c                 | 383 +++++++++---------
> >  include/soc/fsl/cpm.h                         | 171 ++++++++
> >  include/soc/fsl/qe/qe.h                       |  59 ++-
> >  include/soc/fsl/qe/qe_ic.h                    | 135 ------
> >  include/soc/fsl/qe/ucc_fast.h                 |   4 +-
> >  include/soc/fsl/qe/ucc_slow.h                 |   6 +-
> >  35 files changed, 770 insertions(+), 1158 deletions(-)
> >  delete mode 100644 drivers/soc/fsl/qe/qe_ic.h
> >  create mode 100644 include/soc/fsl/cpm.h
> >  delete mode 100644 include/soc/fsl/qe/qe_ic.h
> >
> > --
> > 2.23.0
> >
