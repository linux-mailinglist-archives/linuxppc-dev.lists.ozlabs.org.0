Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E4A11DDEE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 06:50:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Z0BM4B6nzDrBj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 16:50:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="tJUDM91F"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Z0852ZWGzDr6Z;
 Fri, 13 Dec 2019 16:48:20 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47Z07x485Xz9vBmP;
 Fri, 13 Dec 2019 06:48:13 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=tJUDM91F; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id oCzNs4uejCNs; Fri, 13 Dec 2019 06:48:13 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47Z07x2Rs1z9vBmM;
 Fri, 13 Dec 2019 06:48:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1576216093; bh=BQ4d7QEkMTRg8NOsdUyvc3JEDM4PmMIcEcEHrzBdpQ0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=tJUDM91FyihxCBUCfFONne7ugnZ8iFFeKeUQhj+N7T959PqG9XA7xm4Hfu7DJwAh+
 hP58T8c8CUvb3JGkH19+z140v8xtKBh8ia6dxZOab4uPVWMB9dPLkdIpGghqUpSp4U
 9hKoG1jcwVd/ZPi639cOGIPW5ekef16kOiozYIvw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2D4898B767;
 Fri, 13 Dec 2019 06:48:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id g7Rfokag1FcC; Fri, 13 Dec 2019 06:48:13 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C95628B893;
 Fri, 13 Dec 2019 06:47:58 +0100 (CET)
Subject: Re: [PATCH 00/58] serial/sysrq: Cleanup ifdeffery
To: Dmitry Safonov <dima@arista.com>, linux-kernel@vger.kernel.org
References: <20191213000657.931618-1-dima@arista.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <524d9848-28a5-7e65-699b-600c49606487@c-s.fr>
Date: Fri, 13 Dec 2019 06:47:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191213000657.931618-1-dima@arista.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, Dmitry Safonov <0x7f454c46@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Mackerras <paulus@samba.org>, "Maciej W. Rozycki" <macro@linux-mips.org>,
 sparclinux@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Vasiliy Khoruzhick <vasilykh@arista.com>, Alexander Shiyan <shc_work@mail.ru>,
 Kevin Hilman <khilman@baylibre.com>, Russell King <linux@armlinux.org.uk>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Joel Stanley <joel@jms.id.au>, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>, Orson Zhai <orsonzhai@gmail.com>,
 Iurii Zaikin <yzaikin@google.com>, NXP Linux Team <linux-imx@nxp.com>,
 Michal Simek <michal.simek@xilinx.com>, Kees Cook <keescook@chromium.org>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Johan Hovold <johan@kernel.org>, Baolin Wang <baolin.wang7@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-amlogic@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Timur Tabi <timur@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org,
 Patrice Chotard <patrice.chotard@st.com>, Tony Prisk <linux@prisktech.co.nz>,
 Richard Genoud <richard.genoud@gmail.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, linux-fsdevel@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/12/2019 à 01:05, Dmitry Safonov a écrit :
> The original purpose of the patches set was to add a way to enable
> sysrq on a uart where currently it can be constantly either on or off
> (CONFIG_MAGIC_SYSRQ_SERIAL), see the last patch:
>    "serial/sysrq: Add MAGIC_SYSRQ_SERIAL_SEQUENCE"
> 
> But to do that, I had to add uart_try_toggle_sysrq() and I didn't want
> to bloat serial_core.h even more. So, I did cleanup by removing
> SUPPORT_SYSRQ resulting in a nice diff-stat and lesser ifdeffery.
> 
> Most patches are one-liners, I decided to keep them separated per-driver
> to let reviewers easier follow the purpose.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jiri Slaby <jslaby@suse.com>
> Cc: Vasiliy Khoruzhick <vasilykh@arista.com>
> Cc: linux-serial@vger.kernel.org
> 
> Dmitry Safonov (58):
>    sysrq: Remove sysrq_handler_registered
>    serial: Move sysrq members above
>    serial_core: Un-ifdef sysrq SUPPORT_SYSRQ
>    tty/serial: Migrate aspeed_vuart to use has_sysrq
>    tty/serial: Migrate 8250_fsl to use has_sysrq
>    tty/serial: Migrate bcm63xx_uart to use has_sysrq
>    tty/serial: Migrate 8250_omap to use has_sysrq
>    tty/serial: Migrate 8250_port to use has_sysrq
>    tty/serial: Migrate amba-pl01* to use has_sysrq
>    tty/serial: Migrate apbuart to use has_sysrq
>    tty/serial: Migrate arc_uart to use has_sysrq
>    tty/serial: Migrate atmel_serial to use has_sysrq
>    tty/serial: Migrate clps711x to use has_sysrq
>    tty/serial: Migrate cpm_uart to use has_sysrq
>    tty/serial: Migrate dz to use has_sysrq
>    tty/serial: Migrate efm32-uart to use has_sysrq
>    tty/serial: Migrate fsl_linflexuart to use has_sysrq
>    tty/serial: Migrate fsl_lpuart to use has_sysrq
>    tty/serial: Migrate imx to use has_sysrq
>    tty/serial: Migrate ip22zilog to use has_sysrq
>    tty/serial: Migrate meson_uart to use has_sysrq
>    tty/serial: Migrate milbeaut_usio to use has_sysrq
>    tty/serial: Migrate mpc52xx_uart to use has_sysrq
>    tty/serial: Don't zero port->sysrq
>    tty/serial: Migrate msm_serial to use has_sysrq
>    tty/serial: Migrate mux to use has_sysrq
>    tty/serial: Migrate mxs-auart to use has_sysrq
>    tty/serial: Migrate omap-serial to use has_sysrq
>    tty/serial: Migrate pch_uart to use has_sysrq
>    tty/serial: Don't check port->sysrq
>    tty/serial: Migrate pmac_zilog to use has_sysrq
>    tty/serial: Migrate pnx8xxx_uart to use has_sysrq
>    serial/f81534: Don't check port->sysrq
>    tty/serial: Migrate pxa to use has_sysrq
>    tty/serial: Migrate qcom_geni_serial to use has_sysrq
>    tty/serial: Migrate sa1100 to use has_sysrq
>    tty/serial: Migrate samsung_tty to use has_sysrq
>    tty/serial: Migrate sb1250-duart to use has_sysrq
>    tty/serial: Migrate sccnxp to use has_sysrq
>    tty/serial: Migrate serial_txx9 to use has_sysrq
>    tty/serial: Migrate sh-sci to use has_sysrq
>    tty/serial: Migrate sprd_serial to use has_sysrq
>    tty/serial: Migrate st-asc to use has_sysrq
>    tty/serial: Migrate stm32-usart to use has_sysrq
>    tty/serial: Migrate sunhv to use has_sysrq
>    tty/serial: Migrate sunsab to use has_sysrq
>    tty/serial: Migrate sunsu to use has_sysrq
>    tty/serial: Migrate sunzilog to use has_sysrq
>    serial/ucc_uart: Remove ifdef SUPPORT_SYSRQ
>    tty/serial: Migrate vr41xx_siu to use has_sysrq
>    tty/serial: Migrate vt8500_serial to use has_sysrq
>    tty/serial: Migrate xilinx_uartps to use has_sysrq
>    tty/serial: Migrate zs to use has_sysrq
>    serial_core: Remove SUPPORT_SYSRQ ifdeffery
>    usb/serial: Don't handle break when CONFIG_MAGIC_SYSRQ is disabled
>    serial_core: Move sysrq functions from header file
>    sysctl/sysrq: Remove __sysrq_enabled copy
>    serial/sysrq: Add MAGIC_SYSRQ_SERIAL_SEQUENCE

powerpc patchwork didn't get the full series, see 
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=148198

Can't find them on linux-serial patchwork either 
(https://patches.linaro.org/project/linux-serial/list/)

It is impossible to review/test powerpc bits without the first patches 
of the series, where can the entire series be found ?

Christophe

> 
>   arch/powerpc/kernel/legacy_serial.c         |   4 +-
>   drivers/tty/serial/8250/8250_aspeed_vuart.c |   5 +-
>   drivers/tty/serial/8250/8250_fsl.c          |   4 -
>   drivers/tty/serial/8250/8250_of.c           |   4 +-
>   drivers/tty/serial/8250/8250_omap.c         |   5 +-
>   drivers/tty/serial/8250/8250_port.c         |   5 +-
>   drivers/tty/serial/amba-pl010.c             |   5 +-
>   drivers/tty/serial/amba-pl011.c             |   6 +-
>   drivers/tty/serial/apbuart.c                |   5 +-
>   drivers/tty/serial/arc_uart.c               |   5 +-
>   drivers/tty/serial/atmel_serial.c           |   9 +-
>   drivers/tty/serial/bcm63xx_uart.c           |   5 +-
>   drivers/tty/serial/clps711x.c               |   5 +-
>   drivers/tty/serial/cpm_uart/cpm_uart_core.c |   9 +-
>   drivers/tty/serial/dz.c                     |   5 +-
>   drivers/tty/serial/efm32-uart.c             |   5 +-
>   drivers/tty/serial/fsl_linflexuart.c        |   8 +-
>   drivers/tty/serial/fsl_lpuart.c             |   9 +-
>   drivers/tty/serial/imx.c                    |   7 +-
>   drivers/tty/serial/ip22zilog.c              |   7 +-
>   drivers/tty/serial/meson_uart.c             |   5 +-
>   drivers/tty/serial/milbeaut_usio.c          |   5 +-
>   drivers/tty/serial/mpc52xx_uart.c           |  11 +-
>   drivers/tty/serial/msm_serial.c             |   5 +-
>   drivers/tty/serial/mux.c                    |   5 +-
>   drivers/tty/serial/mxs-auart.c              |   5 +-
>   drivers/tty/serial/omap-serial.c            |   5 +-
>   drivers/tty/serial/pch_uart.c               |  12 +-
>   drivers/tty/serial/pmac_zilog.c             |   5 +-
>   drivers/tty/serial/pnx8xxx_uart.c           |   7 +-
>   drivers/tty/serial/pxa.c                    |   5 +-
>   drivers/tty/serial/qcom_geni_serial.c       |   5 +-
>   drivers/tty/serial/sa1100.c                 |   7 +-
>   drivers/tty/serial/samsung_tty.c            |   5 +-
>   drivers/tty/serial/sb1250-duart.c           |   5 +-
>   drivers/tty/serial/sccnxp.c                 |   5 +-
>   drivers/tty/serial/serial_core.c            | 123 ++++++++++++++++++++
>   drivers/tty/serial/serial_txx9.c            |   5 +-
>   drivers/tty/serial/sh-sci.c                 |  10 +-
>   drivers/tty/serial/sprd_serial.c            |   5 +-
>   drivers/tty/serial/st-asc.c                 |   5 +-
>   drivers/tty/serial/stm32-usart.c            |   5 +-
>   drivers/tty/serial/sunhv.c                  |   5 +-
>   drivers/tty/serial/sunsab.c                 |   5 +-
>   drivers/tty/serial/sunsu.c                  |   5 +-
>   drivers/tty/serial/sunzilog.c               |   6 +-
>   drivers/tty/serial/ucc_uart.c               |   2 -
>   drivers/tty/serial/vr41xx_siu.c             |   5 +-
>   drivers/tty/serial/vt8500_serial.c          |   5 +-
>   drivers/tty/serial/xilinx_uartps.c          |   5 +-
>   drivers/tty/serial/zs.c                     |   5 +-
>   drivers/tty/sysrq.c                         |  16 +--
>   drivers/usb/serial/f81534.c                 |   6 +-
>   drivers/usb/serial/generic.c                |  10 +-
>   include/linux/serial_core.h                 |  92 ++-------------
>   include/linux/sysrq.h                       |   1 +
>   kernel/sysctl.c                             |  41 ++++---
>   lib/Kconfig.debug                           |   8 ++
>   58 files changed, 238 insertions(+), 346 deletions(-)
> 
